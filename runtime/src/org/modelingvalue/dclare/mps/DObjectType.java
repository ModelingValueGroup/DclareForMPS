//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// (C) Copyright 2018-2020 Modeling Value Group B.V. (http://modelingvalue.org)                                        ~
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

import org.jetbrains.mps.openapi.language.SLanguage;
import org.modelingvalue.collections.Collection;
import org.modelingvalue.collections.Set;
import org.modelingvalue.dclare.Constant;
import org.modelingvalue.dclare.Mutable;
import org.modelingvalue.dclare.MutableClass;
import org.modelingvalue.dclare.Observer;
import org.modelingvalue.dclare.Setable;
import org.modelingvalue.dclare.mps.DRule.DObserver;

@SuppressWarnings({"rawtypes", "unused"})
public abstract class DObjectType<I> implements MutableClass {

    private static final Constant<DObjectType<?>, Set<IRuleSet>>   TYPE_RULE_SETS = Constant.of("TYPE_RULE_SETS", Set.of(), t -> t.getLanguages().flatMap(DClareMPS.RULE_SETS::get).toSet());
    private static final Constant<DObjectType<?>, Set<DObserver>>  OBSERVERS      = Constant.of("OBSERVERS", Set.of(), t -> t.getRules(TYPE_RULE_SETS.get(t)).filter(r -> !t.external() || r.onlyTemporal()).map(DRule.OBSERVER::get).toSet());
    private static final Constant<DObjectType<?>, Set<DAttribute>> ATTRIBUTES     = Constant.of("ATTRIBUTES", Set.of(), t -> t.getAttributes(TYPE_RULE_SETS.get(t)).filter(r -> !t.external() || r.onlyTemporal()).toSet());
    private static final Constant<DObjectType<?>, Set<DAttribute>> CONTAINERS     = Constant.of("CONTAINERS", Set.of(), t -> ATTRIBUTES.get(t).filter(DAttribute::isComposite).toSet());
    private static final Constant<DObjectType<?>, Set<DAttribute>> NON_SYNTHETICS = Constant.of("NON_SYNTHETICS", Set.of(), t -> ATTRIBUTES.get(t).filter(a -> !a.isSynthetic()).toSet());
    private static final Constant<DObjectType<?>, Set<DAttribute>> IDENTIFYING    = Constant.of("IDENTIFYING", Set.of(), t -> ATTRIBUTES.get(t).filter(a -> !a.isSynthetic() && a.isIndetifying()).toSet());

    public abstract Set<DRule> getRules(Set<IRuleSet> ruleSets);

    public abstract Set<DAttribute> getAttributes(Set<IRuleSet> ruleSets);

    public abstract Set<SLanguage> getLanguages();

    public final Set<IRuleSet> getRuleSets() {
        return TYPE_RULE_SETS.get(this);
    }

    public Set<DObserver> getObservers() {
        return OBSERVERS.get(this);
    }

    public Set<DAttribute> getAttributes() {
        return ATTRIBUTES.get(this);
    }

    public Set<DAttribute> getIndetifying() {
        return IDENTIFYING.get(this);
    }

    public final Set<DAttribute> getNonSyntheticAttributes() {
        return NON_SYNTHETICS.get(this);
    }

    public final Set<DAttribute> getContainerAttributes() {
        return CONTAINERS.get(this);
    }

    private final I identity;

    protected DObjectType(I identity) {
        this.identity = identity;
    }

    public abstract boolean external();

    public I id() {
        return identity;
    }

    @Override
    public int hashCode() {
        return getClass().hashCode() + identity.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        return obj != null && getClass().equals(obj.getClass()) && identity.equals(((DObjectType) obj).identity);
    }

    @Override
    public String toString() {
        return getClass().getSimpleName() + ":" + identity;
    }

    @Override
    public final Collection<? extends Observer<?>> dObservers() {
        return this == DObject.TYPE.getDefault() //
                ? Set.of(DObject.TYPE_RULE) //
                : Collection.concat(observers(), getObservers()) //
                        .map(o -> (Observer<?>) o);
    }

    @SuppressWarnings("unchecked")
    @Override
    public final Collection<? extends Setable<? extends Mutable, ?>> dSetables() {
        return this == DObject.TYPE.getDefault() //
                ? Set.of(DObject.TYPE) //
                : Collection.concat(getAttributes().filter(a -> a instanceof Setable), setables()) //
                        .map(o -> (Setable<? extends Mutable, ?>) o);
    }

    protected Collection<Observer> observers() {
        return DObject.OBSERVERS;
    }

    protected Collection<Setable> setables() {
        return DObject.SETABLES;
    }

}
