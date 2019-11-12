//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// (C) Copyright 2018 Modeling Value Group B.V. (http://modelingvalue.org)                                             ~
//                                                                                                                     ~
// Licensed under the GNU Lesser General Public License v3.0 (the "License"). You may not use this file except in      ~
// compliance with the License. You may obtain a copy of the License at: https://choosealicense.com/licenses/lgpl-3.0  ~
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on ~
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the  ~
// specific language governing permissions and limitations under the License.                                          ~
//                                                                                                                     ~
// Contributors:                                                                                                       ~
//     Wim Bast, Carel Bast, Tom Brus, Arjan Kok, Ronald Krijgsheld                                                    ~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

package org.modelingvalue.dclare.mps;

import org.jetbrains.mps.openapi.language.SConcept;
import org.jetbrains.mps.openapi.language.SLanguage;
import org.modelingvalue.collections.Collection;
import org.modelingvalue.collections.Set;
import org.modelingvalue.collections.util.Triple;
import org.modelingvalue.transactions.Mutable;
import org.modelingvalue.transactions.Observer;
import org.modelingvalue.transactions.Setable;

public class DNodeType extends DType {

    protected final Set<SLanguage> languages;
    protected final SConcept       concept;
    protected final String         anonymousType;

    public DNodeType(Triple<Set<SLanguage>, SConcept, String> triple) {
        super(triple);
        languages = triple.a();
        concept = triple.b();
        anonymousType = triple.c();
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @Override
    public Set<DRule> getRules(Set<IRuleSet> ruleSets) {
        return (Set) ruleSets.flatMap(rs -> Collection.of(rs.getNodeRules(concept, anonymousType))).toSet();
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @Override
    public Set<DAttribute> getAttributes(Set<IRuleSet> ruleSets) {
        return (Set) ruleSets.flatMap(rs -> Collection.of(rs.getNodeAttributes(concept, anonymousType))).toSet();
    }

    @Override
    public Set<SLanguage> getLanguages() {
        return languages;
    }

    public SConcept getConcept() {
        return concept;
    }

    @Override
    public Collection<? extends Setable<? extends Mutable, ?>> dContainers() {
        return Collection.concat(DNode.CONTAINERS.get(concept), super.dContainers());
    }

    @SuppressWarnings("rawtypes")
    @Override
    protected Collection<? extends Observer> observers() {
        return DNode.RULES;
    }

}
