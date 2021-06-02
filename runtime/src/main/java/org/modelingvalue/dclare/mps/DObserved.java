//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// (C) Copyright 2018-2021 Modeling Value Group B.V. (http://modelingvalue.org)                                        ~
//                                                                                                                     ~
// Licensed under the GNU Lesser General Public License v3.0 (the 'License'). You may not use this file except in      ~
// compliance with the License. You may obtain a copy of the License at: https://choosealicense.com/licenses/lgpl-3.0  ~
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on ~
// an 'AS IS' BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the  ~
// specific language governing permissions and limitations under the License.                                          ~
//                                                                                                                     ~
// Maintainers:                                                                                                        ~
//     Wim Bast, Tom Brus, Ronald Krijgsheld                                                                           ~
// Contributors:                                                                                                       ~
//     Arjan Kok, Carel Bast                                                                                           ~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

package org.modelingvalue.dclare.mps;

import java.time.Instant;
import java.util.function.BiConsumer;
import java.util.function.Consumer;
import java.util.function.Supplier;

import org.jetbrains.mps.openapi.model.SNode;
import org.modelingvalue.collections.Entry;
import org.modelingvalue.collections.List;
import org.modelingvalue.collections.Map;
import org.modelingvalue.collections.Set;
import org.modelingvalue.collections.util.QuadConsumer;
import org.modelingvalue.collections.util.TriFunction;
import org.modelingvalue.dclare.LeafTransaction;
import org.modelingvalue.dclare.Mutable;
import org.modelingvalue.dclare.Observed;
import org.modelingvalue.dclare.Setable;
import org.modelingvalue.dclare.SetableModifier;
import org.modelingvalue.dclare.State;
import org.modelingvalue.dclare.ex.ThrowableError;

@SuppressWarnings("unused")
public class DObserved<O extends DObject, T> extends Observed<O, T> implements DFeature {

    public static <C extends DObject, V> DObserved<C, V> of(Object id, V def, TriFunction<C, V, V, Boolean> toMPS, SetableModifier... modifiers) {
        return new DObserved<>(id, def, null, toMPS, null, null, modifiers);
    }

    public static <C extends DObject, V> DObserved<C, V> of(Object id, V def, TriFunction<C, V, V, Boolean> toMPS, Supplier<SNode> source, SetableModifier... modifiers) {
        return new DObserved<>(id, def, null, toMPS, null, source, modifiers);
    }

    public static <C extends DObject, V> DObserved<C, V> of(Object id, V def, TriFunction<C, V, V, Boolean> toMPS, QuadConsumer<LeafTransaction, C, V, V> changed, SetableModifier... modifiers) {
        return new DObserved<>(id, def, null, toMPS, changed, null, modifiers);
    }

    public static <C extends DObject, V> DObserved<C, V> of(Object id, V def, TriFunction<C, V, V, Boolean> toMPS, QuadConsumer<LeafTransaction, C, V, V> changed, Supplier<SNode> source, SetableModifier... modifiers) {
        return new DObserved<>(id, def, null, toMPS, changed, source, modifiers);
    }

    public static <C extends DObject, V> DObserved<C, V> of(Object id, V def, Supplier<Setable<?, ?>> opposite, TriFunction<C, V, V, Boolean> toMPS, Supplier<SNode> source, SetableModifier... modifiers) {
        return new DObserved<>(id, def, opposite, toMPS, null, source, modifiers);
    }

    public static <C extends DObject, V> DObserved<C, V> of(Object id, V def, Supplier<Setable<?, ?>> opposite, TriFunction<C, V, V, Boolean> toMPS, QuadConsumer<LeafTransaction, C, V, V> changed, Supplier<SNode> source, SetableModifier... modifiers) {
        return new DObserved<>(id, def, opposite, toMPS, changed, source, modifiers);
    }

    private final TriFunction<O, T, T, Boolean> toMPS;
    private final Supplier<SNode>               source;

    protected DObserved(Object id, T def, Supplier<Setable<?, ?>> opposite, TriFunction<O, T, T, Boolean> toMPS, QuadConsumer<LeafTransaction, O, T, T> changed, Supplier<SNode> source, SetableModifier... modifiers) {
        super(id, def, opposite, null, changed, modifiers);
        this.toMPS = toMPS;
        this.source = source;
    }

    public boolean isComposite() {
        return containment();
    }

    @Override
    public boolean onlyTemporal() {
        return false;
    }

    @Override
    public SNode getSource() {
        return source != null ? source.get() : null;
    }

    public boolean toMPS(O object, T pre, T post) {
        try {
            return toMPS.apply(object, pre, post);
        } catch (Throwable t) {
            DObject.dClareMPS().addMessage(new ThrowableError(object, this, Instant.now(), t));
            return false;
        }
    }

    public static <T> void map(Set<T> ist, Set<T> soll, Consumer<T> add, Consumer<T> remove) {
        for (T o : ist) {
            if (!soll.contains(o)) {
                remove.accept(o);
            }
        }
        for (T o : soll) {
            if (!ist.contains(o)) {
                add.accept(o);
            }
        }
    }

    @SuppressWarnings("resource")
    public static <T> void map(List<T> ist, List<T> soll, BiConsumer<T, T> add, Consumer<T> remove) {
        for (T o : ist) {
            if (!soll.contains(o)) {
                remove.accept(o);
                ist = ist.remove(o);
            }
        }
        for (int is = 0; is < soll.size(); is++) {
            T n = soll.get(is);
            int ii = ist.firstIndexOf(n);
            if (ii != is) {
                if (ii >= 0) {
                    remove.accept(n);
                    ist = ist.removeIndex(ii);
                }
                add.accept(n, is > 0 ? ist.get(is - 1) : null);
                ist = ist.insert(is, n);
            }
        }
    }

    public static <K, V> void map(Map<K, V> ist, Map<K, V> soll, BiConsumer<K, V> set) {
        for (Entry<K, V> e : ist) {
            if (soll.get(e.getKey()) == null) {
                set.accept(e.getKey(), null);
            }
        }
        for (Entry<K, V> e : soll) {
            if (!soll.get(e.getKey()).equals(ist.get(e.getKey()))) {
                set.accept(e.getKey(), e.getValue());
            }
        }
    }

    @Override
    public boolean isSynthetic() {
        return synthetic();
    }

    @Override
    protected boolean isOrphan(State state, Mutable m) {
        return m instanceof DObject && super.isOrphan(state, m) && !((DObject) m).isExternal();
    }

    @Override
    protected boolean isEmpty(T result) {
        return result == null;
    }

    public boolean isDclareOnly() {
        return toMPS == null;
    }

}