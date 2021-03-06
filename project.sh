##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## (C) Copyright 2018-2020 Modeling Value Group B.V. (http://modelingvalue.org)                                        ~
##                                                                                                                     ~
## Licensed under the GNU Lesser General Public License v3.0 (the 'License'). You may not use this file except in      ~
## compliance with the License. You may obtain a copy of the License at: https://choosealicense.com/licenses/lgpl-3.0  ~
## Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on ~
## an 'AS IS' BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the  ~
## specific language governing permissions and limitations under the License.                                          ~
##                                                                                                                     ~
## Maintainers:                                                                                                        ~
##     Wim Bast, Tom Brus, Ronald Krijgsheld                                                                           ~
## Contributors:                                                                                                       ~
##     Arjan Kok, Carel Bast                                                                                           ~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   version="1.5.0"
mpsVersion="2020.2"
  mpsSince="202.7660.1015" # 2020.2.3
# mpsUntil="999.9999.9999" # mpsUntil taken from the installed MPS if not specified
    mpsDir="MPS"

artifacts=(
    "org.modelingvalue   dclareForMPSRuntime     $version    jar jds" # TODO: should not be needed
)
dependencies=(
    "org.modelingvalue   immutable-collections   1.5.0       jar jds"
    "org.modelingvalue   dclare                  1.5.0       jar jds"
    "jars@mps"
)
mps=(
    "$mpsDir/lib/extensions.jar"
    "$mpsDir/lib/mps-closures.jar"
    "$mpsDir/lib/mps-core.jar"
    "$mpsDir/lib/mps-editor.jar"
    "$mpsDir/lib/mps-openapi.jar"
    "$mpsDir/lib/mps-platform.jar"
    "$mpsDir/lib/mps-project-check.jar"
    "$mpsDir/lib/platform-api.jar"
    "$mpsDir/lib/util.jar"
)
