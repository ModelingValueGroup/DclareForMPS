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

import java.util.List;

import org.jetbrains.mps.openapi.language.SAbstractConcept;
import org.jetbrains.mps.openapi.model.SModel;
import org.jetbrains.mps.openapi.model.SNode;

public interface IRuleSet {

    List<DAttribute<SNode, ?>> getNodeAttributes(SAbstractConcept concept, String anonymousType);

    List<DAttribute<SModel, ?>> getModelAttributes();

    List<DAttribute<DModule, ?>> getModuleAttributes();

    List<DAttribute<DRepository, ?>> getRepositoryAttributes();

    List<DAttribute<SClassObject, ?>> getClassAttributes(SClass cls);

    List<DRule<SNode>> getNodeRules(SAbstractConcept concept, String anonymousType);

    List<DRule<SModel>> getModelRules();

    List<DRule<DModule>> getModuleRules();

    List<DRule<DRepository>> getRepositoryRules();

    List<DRule<SClassObject>> getClassRules(SClass cls);

}
