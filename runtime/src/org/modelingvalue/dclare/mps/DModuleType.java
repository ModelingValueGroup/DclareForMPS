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

import org.jetbrains.mps.openapi.language.SLanguage;
import org.modelingvalue.collections.Collection;
import org.modelingvalue.collections.Set;
import org.modelingvalue.collections.util.Pair;
import org.modelingvalue.dclare.Observer;
import org.modelingvalue.dclare.Setable;

public class DModuleType extends DObjectType<Pair<Boolean, Set<SLanguage>>> {

    public DModuleType(Pair<Boolean, Set<SLanguage>> identity) {
        super(identity);
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @Override
    public Set<DRule> getRules(Set<IRuleSet> ruleSets) {
        //noinspection RedundantCast
        return !external() ? (Set) ruleSets.flatMap(rs -> Collection.of(rs.getModuleRules())).toSet() : Set.of();
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public Set<DAttribute> getAttributes(Set<IRuleSet> ruleSets) {
        //noinspection RedundantCast
        return !external() ? (Set) ruleSets.flatMap(rs -> Collection.of(rs.getModuleAttributes())).toSet() : Set.of();
    }

    @Override
    public Set<SLanguage> getLanguages() {
        return id().b();
    }

    @Override
    public boolean external() {
        return id().a();
    }

    @SuppressWarnings("rawtypes")
    @Override
    protected Collection<Observer> observers() {
        return DModule.OBSERVERS;
    }

    @SuppressWarnings("rawtypes")
    @Override
    public Collection<Setable> setables() {
        return DModule.SETABLES;
    }

}
