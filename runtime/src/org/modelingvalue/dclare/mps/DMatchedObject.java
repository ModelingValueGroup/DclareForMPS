//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// (C) Copyright 2018-2019 Modeling Value Group B.V. (http://modelingvalue.org)                                        ~
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

import java.util.Arrays;
import java.util.function.Supplier;

import org.jetbrains.mps.openapi.language.SLanguage;
import org.modelingvalue.collections.ContainingCollection;
import org.modelingvalue.collections.Map;
import org.modelingvalue.collections.Set;
import org.modelingvalue.collections.util.Mergeable;
import org.modelingvalue.collections.util.NotMergeableException;
import org.modelingvalue.collections.util.Pair;
import org.modelingvalue.dclare.Constant;
import org.modelingvalue.dclare.LeafTransaction;
import org.modelingvalue.dclare.Mutable;
import org.modelingvalue.dclare.NonCheckingObserved;
import org.modelingvalue.dclare.Observed;
import org.modelingvalue.dclare.Observer;
import org.modelingvalue.dclare.Setable;
import org.modelingvalue.dclare.mps.DAttribute.DIdentifyingAttribute;

@SuppressWarnings("rawtypes")
public abstract class DMatchedObject<T extends DMatchedObject, R, S> extends DIdentifiedObject implements Mergeable<DMatchedObject> {

    protected static final Observed<DReadConstruction, DMatchedObject>            READ_MAPPING          = Observed.of("$READ_MAPPING", null, (tx, c, b, a) -> {
                                                                                                            if (b != null) {
                                                                                                                DMatchedObject.CONSTRUCTIONS.set(b, Set::remove, c);
                                                                                                            }
                                                                                                            if (a != null) {
                                                                                                                DMatchedObject.CONSTRUCTIONS.set(a, Set::add, c);
                                                                                                            }
                                                                                                        });

    private static final Constant<Setable, Setable<Mutable, Set<DMatchedObject>>> UNIDENTIFIED_CHILDREN = Constant.of("$UNIDENTIFIED_CHILDREN", UnidentifiedObserved::of);

    private static final Setable<DMatchedObject, Object>                          DETACHED              = Setable.of("$DETACHED", null);

    protected static final Set<Observer>                                          OBSERVERS             = DObject.OBSERVERS;

    protected static final Set<Setable>                                           SETABLES              = DObject.SETABLES.add(DETACHED);

    protected static final Observed<DMatchedObject, Set<DConstruction>>           CONSTRUCTIONS         = NonCheckingObserved.of("$CONSTRUCTIONS", Set.of());

    @SuppressWarnings("unchecked")
    protected static <P extends DObject, C extends DMatchedObject<C, ?, ?>, R extends ContainingCollection<C>> R manyMatch(P parent, R pres, R posts, Setable<P, R> setable) {
        if (parent.dContaining() instanceof UnidentifiedObserved) {
            return pres;
        }
        ContainingCollection<C> rem = pres.removeAll(posts);
        ContainingCollection<C> add = posts.removeAll(pres);
        if (!rem.isEmpty() && !add.isEmpty()) {
            Set<C> unidentified = add.filter(c -> !c.isIdentified()).toSet();
            if (!unidentified.isEmpty()) {
                UNIDENTIFIED_CHILDREN.get(setable).set(parent, Set::addAll, unidentified);
                return pres;
            } else {
                UNIDENTIFIED_CHILDREN.get(setable).set(parent, Set.of());
                for (C pre : rem) {
                    for (C post : add) {
                        if (pre.isMatch(post)) {
                            posts = (R) posts.remove(post);
                            posts = (R) posts.addAllUnique(rem);
                            add = add.remove(post);
                            break;
                        }
                    }
                }
            }
        }
        return posts;
    }

    protected static <P extends DObject, C extends DMatchedObject<C, ?, ?>> C singleMatch(P parent, C pre, C post, Setable<P, C> setable) {
        if (parent.dContaining() instanceof UnidentifiedObserved) {
            return pre;
        }
        if (pre != null && post != null && !pre.equals(post)) {
            if (!post.isIdentified()) {
                UNIDENTIFIED_CHILDREN.get(setable).set(parent, Set::add, post);
                return pre;
            } else {
                UNIDENTIFIED_CHILDREN.get(setable).set(parent, Set.of());
                if (pre.isMatch(post)) {
                    post = pre;
                }
            }
        }
        return post;
    }

    protected static void checkMatching(DObject parent, Setable setable) {
    }

    protected static final Constant<Observer<?>, Constructed> CONSTRUCTED = Constant.of("CONSTRUCTED", o -> new Constructed(o));

    protected static <D extends DMatchedObject, A> D quotationConstruct(SLanguage anonymousLanguage, String anonymousType, Object[] ctx, Supplier<D> supplier) {
        DConstructingTransaction tx = (DConstructingTransaction) LeafTransaction.getCurrent();
        return derive(tx, new DQuotationConstruction(anonymousLanguage, anonymousType, tx.observer(), ctx), supplier);
    }

    protected static <D extends DMatchedObject, A> D copyRootConstruct(String anonymousType, DObject object, DNode copied, Supplier<D> supplier) {
        DConstructingTransaction tx = (DConstructingTransaction) LeafTransaction.getCurrent();
        return derive(tx, new DCopyConstruction(object, tx.observer(), copied, anonymousType), supplier);
    }

    protected static <D extends DMatchedObject, A> D copyChildConstruct(DConstruction root, DNode copied, Supplier<D> supplier) {
        DConstructingTransaction tx = (DConstructingTransaction) LeafTransaction.getCurrent();
        return derive(tx, new DCopyConstruction((DObject) tx.object(), tx.observer(), copied, root), supplier);
    }

    @SuppressWarnings("unchecked")
    private static <D extends DMatchedObject> D derive(DConstructingTransaction tx, DDeriveConstruction id, Supplier<D> supplier) {
        D d = (D) CONSTRUCTED.get(id.observer()).get(id.object()).get(id);
        if (d == null && !(id.object().dContaining() instanceof UnidentifiedObserved)) {
            d = supplier.get();
        }
        if (d != null) {
            tx.constructed().set((m, v) -> m.put(id, v), d);
        }
        return d;
    }

    @SuppressWarnings("unchecked")
    protected static <D extends DMatchedObject, I> D readConstruct(I ref, Supplier<D> supplier) {
        DReadConstruction<I> id = new DReadConstruction(ref);
        D d = (D) READ_MAPPING.get(id);
        if (d == null) {
            d = supplier.get();
        }
        READ_MAPPING.set(id, d);
        return d;
    }

    @SuppressWarnings("unchecked")
    protected static <D extends DMatchedObject> D getDerived(DDeriveConstruction id) {
        return (D) CONSTRUCTED.get(id.observer()).get(id.object()).get(id);
    }

    @SuppressWarnings("unchecked")
    protected static <D extends DMatchedObject, I> D tryResolve(I ref) {
        return (D) READ_MAPPING.get(new DReadConstruction(ref));
    }

    protected DMatchedObject(Object[] identity) {
        super(identity);
    }

    @Override
    protected <V> V get(DIdentifyingAttribute<?, V> attr) {
        for (DQuotationConstruction c : CONSTRUCTIONS.get(this).filter(DQuotationConstruction.class)) {
            if (c.getAnonymousType() == attr.anonymousType()) {
                return c.get(attr);
            }
        }
        throw new Error("Identifying attribute " + attr + " in " + this + " not found");
    }

    @Override
    protected final void read(DClareMPS dClareMPS) {
        if (reference(false) != null) {
            read();
        }
    }

    protected final void setDetached(S sObject) {
        DETACHED.set(this, sObject);
    }

    protected boolean hasReference() {
        return reference(false) != null;
    }

    @SuppressWarnings("unchecked")
    protected final R reference(boolean create) {
        R ref = (R) CONSTRUCTIONS.get(this).filter(DReadConstruction.class).map(DReadConstruction::reference).findFirst().orElse(null);
        if (create && ref == null) {
            S sObject = create();
            addSObject(sObject);
            ref = reference(sObject);
            READ_MAPPING.set(new DReadConstruction(ref), this);
        }
        return ref;
    }

    public final S original() {
        return original(false);
    }

    @SuppressWarnings("unchecked")
    protected final S original(boolean create) {
        S sObject = null;
        R ref = reference(create);
        if (ref != null) {
            sObject = dClareMPS().read(() -> resolve(ref));
            if (create && sObject == null) {
                sObject = (S) DETACHED.get(this);
                if (sObject != null) {
                    addSObject(sObject);
                    DETACHED.set(this, null);
                }
            }
        }
        return sObject;
    }

    @Override
    protected void init(DClareMPS dClareMPS) {
        super.init(dClareMPS);
        S original = original();
        if (original != null) {
            init(dClareMPS, original);
        }
    }

    @Override
    protected void exit(DClareMPS dClareMPS) {
        super.exit(dClareMPS);
        S original = original();
        if (original != null) {
            exit(dClareMPS, original);
        }
    }

    protected void init(DClareMPS dClareMPS, S original) {
    }

    protected void exit(DClareMPS dClareMPS, S original) {
    }

    private boolean isExisting() {
        return !CONSTRUCTIONS.get(this).isEmpty();
    }

    protected boolean isIdentified() {
        return CONSTRUCTIONS.current(this).filter(DReadConstruction.class).findAny().isPresent();
    }

    protected final boolean isMatch(T post) {
        if (matches(post)) {
            for (DConstruction cons : CONSTRUCTIONS.get(post)) {
                if (cons instanceof DReadConstruction) {
                    post.stop(dClareMPS());
                    READ_MAPPING.set((DReadConstruction) cons, this);
                    START_ACTION.trigger(this);
                } else {
                    DDeriveConstruction der = (DDeriveConstruction) cons;
                    CONSTRUCTED.get(der.observer()).set(der.object(), (map, e) -> map.put(der, e), this);
                }
            }
            return true;
        } else {
            return false;
        }
    }

    protected abstract boolean matches(T other);

    protected abstract void read();

    protected abstract void addSObject(S sObject);

    protected abstract R reference(S read);

    protected abstract S resolve(R ref);

    protected abstract S create();

    public Set<String> getAnonymousTypes() {
        return CONSTRUCTIONS.get(this).filter(DQuotationConstruction.class).map(DQuotationConstruction::getAnonymousType).notNull().toSet();
    }

    public boolean isCopy() {
        return CONSTRUCTIONS.get(this).anyMatch(c -> c instanceof DCopyConstruction);
    }

    public Set<SLanguage> getAnonymousLanguages() {
        return CONSTRUCTIONS.get(this).filter(DQuotationConstruction.class).map(DQuotationConstruction::getAnonymousLanguage).notNull().toSet();
    }

    protected static final class UnidentifiedObserved extends NonCheckingObserved<Mutable, Set<DMatchedObject>> {

        public static <M, V> UnidentifiedObserved of(Setable setable) {
            return new UnidentifiedObserved(setable);
        }

        private UnidentifiedObserved(Setable setable) {
            super(Pair.of("UNIDENTIFIED", setable), false, Set.of(), true, null, null, null);
        }

    }

    @Override
    public DMatchedObject getMerger() {
        return MERGER;
    }

    @SuppressWarnings("unchecked")
    @Override
    public DMatchedObject merge(DMatchedObject[] branches, int length) {
        DMatchedObject result = branches[0];
        if (result == null) {
            throw new NotMergeableException(this + " -> " + Arrays.toString(branches));
        }
        for (int i = 1; i < length; i++) {
            if (branches[i] == null || !branches[i].matches(result)) {
                throw new NotMergeableException(this + " -> " + Arrays.toString(branches));
            } else if (branches[i].isExisting()) {
                result = branches[i];
            }
        }
        return result;
    }

    public static class Constructed extends NonCheckingObserved<DObject, Map<DDeriveConstruction, DMatchedObject>> {

        protected Constructed(Observer<?> observer) {
            super(observer, false, Map.of(), false, null, null, (tx, o, pre, post) -> {
                pre.diff(post).forEachOrdered(e -> {
                    Pair<DMatchedObject, DMatchedObject> d = e.getValue();
                    if (d.a() != null) {
                        CONSTRUCTIONS.set(d.a(), Set::remove, e.getKey());
                    }
                    if (d.b() != null) {
                        CONSTRUCTIONS.set(d.b(), Set::add, e.getKey());
                    }
                });
            });
        }

    }

    private static final DMatchedObject MERGER = new DMatchedObject(new Object[]{}) {

        @Override
        protected boolean matches(DMatchedObject other) {
            throw new UnsupportedOperationException();
        }

        @Override
        protected void read() {
            throw new UnsupportedOperationException();
        }

        @Override
        protected void addSObject(Object sObject) {
            throw new UnsupportedOperationException();
        }

        @Override
        protected Object reference(Object read) {
            throw new UnsupportedOperationException();
        }

        @Override
        protected Object resolve(Object ref) {
            throw new UnsupportedOperationException();
        }

        @Override
        protected Object create() {
            throw new UnsupportedOperationException();
        }

        @Override
        protected DObjectType<?> getType() {
            throw new UnsupportedOperationException();
        }

        @Override
        public boolean isExternal() {
            throw new UnsupportedOperationException();
        }

        @Override
        public String toString() {
            return "MERGER";
        }
    };

}
