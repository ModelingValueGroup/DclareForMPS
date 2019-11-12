<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:1a96ceaa-2946-43e0-af3f-cd05d77ee6d1(DclareMPSRuntime.util)">
  <persistence version="9" />
  <languages>
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="9" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="1" />
    <use id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures" version="0" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="17" />
  </languages>
  <imports>
    <import index="mhbf" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.model(MPS.OpenAPI/)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
    <import index="t4tl" ref="55d6b6f5-8095-4cd0-a39b-779da8d12940/java:org.modelingvalue.dclare.mps(DclareMPSRuntime/)" />
    <import index="dy39" ref="55d6b6f5-8095-4cd0-a39b-779da8d12940/java:org.modelingvalue.transactions(DclareMPSRuntime/)" />
    <import index="c17a" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.language(MPS.OpenAPI/)" />
    <import index="lui2" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.module(MPS.OpenAPI/)" />
    <import index="42m3" ref="55d6b6f5-8095-4cd0-a39b-779da8d12940/java:org.modelingvalue.collections.util(DclareMPSRuntime/)" />
    <import index="33ny" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.util(JDK/)" />
    <import index="82uw" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.util.function(JDK/)" />
    <import index="zrbp" ref="55d6b6f5-8095-4cd0-a39b-779da8d12940/java:org.modelingvalue.collections(DclareMPSRuntime/)" />
    <import index="1ctc" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.util.stream(JDK/)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1465982738277781862" name="jetbrains.mps.baseLanguage.structure.PlaceholderMember" flags="ng" index="2tJIrI" />
      <concept id="1188206331916" name="jetbrains.mps.baseLanguage.structure.Annotation" flags="ig" index="2ABs$o" />
      <concept id="1173175405605" name="jetbrains.mps.baseLanguage.structure.ArrayAccessExpression" flags="nn" index="AH0OO">
        <child id="1173175577737" name="index" index="AHEQo" />
        <child id="1173175590490" name="array" index="AHHXb" />
      </concept>
      <concept id="1154032098014" name="jetbrains.mps.baseLanguage.structure.AbstractLoopStatement" flags="nn" index="2LF5Ji">
        <child id="1154032183016" name="body" index="2LFqv$" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1182160077978" name="jetbrains.mps.baseLanguage.structure.AnonymousClassCreator" flags="nn" index="YeOm9">
        <child id="1182160096073" name="cls" index="YeSDq" />
      </concept>
      <concept id="1081236700938" name="jetbrains.mps.baseLanguage.structure.StaticMethodDeclaration" flags="ig" index="2YIFZL" />
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1081256982272" name="jetbrains.mps.baseLanguage.structure.InstanceOfExpression" flags="nn" index="2ZW3vV">
        <child id="1081256993305" name="classType" index="2ZW6by" />
        <child id="1081256993304" name="leftExpression" index="2ZW6bz" />
      </concept>
      <concept id="1070533707846" name="jetbrains.mps.baseLanguage.structure.StaticFieldReference" flags="nn" index="10M0yZ">
        <reference id="1144433057691" name="classifier" index="1PxDUh" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1070534370425" name="jetbrains.mps.baseLanguage.structure.IntegerType" flags="in" index="10Oyi0" />
      <concept id="1070534760951" name="jetbrains.mps.baseLanguage.structure.ArrayType" flags="in" index="10Q1$e">
        <child id="1070534760952" name="componentType" index="10Q1$1" />
      </concept>
      <concept id="1070534934090" name="jetbrains.mps.baseLanguage.structure.CastExpression" flags="nn" index="10QFUN">
        <child id="1070534934091" name="type" index="10QFUM" />
        <child id="1070534934092" name="expression" index="10QFUP" />
      </concept>
      <concept id="1068390468198" name="jetbrains.mps.baseLanguage.structure.ClassConcept" flags="ig" index="312cEu" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <property id="1176718929932" name="isFinal" index="3TUv4t" />
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1109279763828" name="jetbrains.mps.baseLanguage.structure.TypeVariableDeclaration" flags="ng" index="16euLQ">
        <child id="1214996921760" name="bound" index="3ztrMU" />
      </concept>
      <concept id="1109279851642" name="jetbrains.mps.baseLanguage.structure.GenericDeclaration" flags="ng" index="16eOlS">
        <child id="1109279881614" name="typeVariableDeclaration" index="16eVyc" />
      </concept>
      <concept id="1109283449304" name="jetbrains.mps.baseLanguage.structure.TypeVariableReference" flags="in" index="16syzq">
        <reference id="1109283546497" name="typeVariableDeclaration" index="16sUi3" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886292" name="jetbrains.mps.baseLanguage.structure.ParameterDeclaration" flags="ir" index="37vLTG" />
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="1225271283259" name="jetbrains.mps.baseLanguage.structure.NPEEqualsExpression" flags="nn" index="17R0WA" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <property id="4276006055363816570" name="isSynchronized" index="od$2w" />
        <property id="1181808852946" name="isFinal" index="DiZV1" />
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123134" name="parameter" index="3clF46" />
        <child id="1068580123135" name="body" index="3clF47" />
      </concept>
      <concept id="1068580123165" name="jetbrains.mps.baseLanguage.structure.InstanceMethodDeclaration" flags="ig" index="3clFb_">
        <property id="1178608670077" name="isAbstract" index="1EzhhJ" />
      </concept>
      <concept id="1068580123152" name="jetbrains.mps.baseLanguage.structure.EqualsExpression" flags="nn" index="3clFbC" />
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
        <child id="1206060520071" name="elsifClauses" index="3eNLev" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580123137" name="jetbrains.mps.baseLanguage.structure.BooleanConstant" flags="nn" index="3clFbT" />
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1068581517677" name="jetbrains.mps.baseLanguage.structure.VoidType" flags="in" index="3cqZAl" />
      <concept id="1206060495898" name="jetbrains.mps.baseLanguage.structure.ElsifClause" flags="ng" index="3eNFk2">
        <child id="1206060619838" name="condition" index="3eO9$A" />
        <child id="1206060644605" name="statementList" index="3eOfB_" />
      </concept>
      <concept id="1079359253375" name="jetbrains.mps.baseLanguage.structure.ParenthesizedExpression" flags="nn" index="1eOMI4">
        <child id="1079359253376" name="expression" index="1eOMHV" />
      </concept>
      <concept id="1154542696413" name="jetbrains.mps.baseLanguage.structure.ArrayCreatorWithInitializer" flags="nn" index="3g6Rrh">
        <child id="1154542793668" name="componentType" index="3g7fb8" />
        <child id="1154542803372" name="initValue" index="3g7hyw" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ng" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
        <child id="4972241301747169160" name="typeArgument" index="3PaCim" />
      </concept>
      <concept id="1212685548494" name="jetbrains.mps.baseLanguage.structure.ClassCreator" flags="nn" index="1pGfFk">
        <child id="1212687122400" name="typeParameter" index="1pMfVU" />
      </concept>
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <property id="521412098689998745" name="nonStatic" index="2bfB8j" />
        <child id="5375687026011219971" name="member" index="jymVt" unordered="true" />
      </concept>
      <concept id="1171903607971" name="jetbrains.mps.baseLanguage.structure.WildCardType" flags="in" index="3qTvmN" />
      <concept id="1171903916106" name="jetbrains.mps.baseLanguage.structure.UpperBoundType" flags="in" index="3qUE_q">
        <child id="1171903916107" name="bound" index="3qUE_r" />
      </concept>
      <concept id="7812454656619025416" name="jetbrains.mps.baseLanguage.structure.MethodDeclaration" flags="ng" index="1rXfSm">
        <property id="8355037393041754995" name="isNative" index="2aFKle" />
      </concept>
      <concept id="7812454656619025412" name="jetbrains.mps.baseLanguage.structure.LocalMethodCall" flags="nn" index="1rXfSq" />
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
        <child id="1109201940907" name="parameter" index="11_B2D" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1073239437375" name="jetbrains.mps.baseLanguage.structure.NotEqualsExpression" flags="nn" index="3y3z36" />
      <concept id="1184950988562" name="jetbrains.mps.baseLanguage.structure.ArrayCreator" flags="nn" index="3$_iS1">
        <child id="1184951007469" name="componentType" index="3$_nBY" />
        <child id="1184952969026" name="dimensionExpression" index="3$GQph" />
      </concept>
      <concept id="1184952934362" name="jetbrains.mps.baseLanguage.structure.DimensionExpression" flags="nn" index="3$GHV9">
        <child id="1184953288404" name="expression" index="3$I4v7" />
      </concept>
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ng" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1144226303539" name="jetbrains.mps.baseLanguage.structure.ForeachStatement" flags="nn" index="1DcWWT">
        <child id="1144226360166" name="iterable" index="1DdaDG" />
      </concept>
      <concept id="1144230876926" name="jetbrains.mps.baseLanguage.structure.AbstractForStatement" flags="nn" index="1DupvO">
        <child id="1144230900587" name="variable" index="1Duv9x" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1116615150612" name="jetbrains.mps.baseLanguage.structure.ClassifierClassExpression" flags="nn" index="3VsKOn">
        <reference id="1116615189566" name="classifier" index="3VsUkX" />
      </concept>
      <concept id="1080120340718" name="jetbrains.mps.baseLanguage.structure.AndExpression" flags="nn" index="1Wc70l" />
      <concept id="1170345865475" name="jetbrains.mps.baseLanguage.structure.AnonymousClass" flags="ig" index="1Y3b0j">
        <reference id="1170346070688" name="classifier" index="1Y3XeK" />
        <child id="1201186121363" name="typeParameter" index="2Ghqu4" />
      </concept>
    </language>
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="1199542442495" name="jetbrains.mps.baseLanguage.closures.structure.FunctionType" flags="in" index="1ajhzC">
        <child id="1199542457201" name="resultType" index="1ajl9A" />
      </concept>
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
      <concept id="1225797177491" name="jetbrains.mps.baseLanguage.closures.structure.InvokeFunctionOperation" flags="nn" index="1Bd96e" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1143226024141" name="jetbrains.mps.lang.smodel.structure.SModelType" flags="in" index="H_c77" />
      <concept id="1145383075378" name="jetbrains.mps.lang.smodel.structure.SNodeListType" flags="in" index="2I9FWS" />
      <concept id="1212008292747" name="jetbrains.mps.lang.smodel.structure.Model_GetLongNameOperation" flags="nn" index="LkI2h" />
      <concept id="2644386474302386080" name="jetbrains.mps.lang.smodel.structure.PropertyIdRefExpression" flags="nn" index="355D3s">
        <reference id="2644386474302386081" name="conceptDeclaration" index="355D3t" />
        <reference id="2644386474302386082" name="propertyDeclaration" index="355D3u" />
      </concept>
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2" />
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <child id="5169995583184591170" name="smodelAttribute" index="lGtFl" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
      <concept id="4222318806802425298" name="jetbrains.mps.lang.core.structure.SuppressErrorsAnnotation" flags="ng" index="15s5l7">
        <property id="8575328350543493365" name="message" index="huDt6" />
        <property id="2423417345669755629" name="filter" index="1eyWvh" />
      </concept>
    </language>
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="540871147943773365" name="jetbrains.mps.baseLanguage.collections.structure.SingleArgumentSequenceOperation" flags="nn" index="25WWJ4">
        <child id="540871147943773366" name="argument" index="25WWJ7" />
      </concept>
      <concept id="1151689724996" name="jetbrains.mps.baseLanguage.collections.structure.SequenceType" flags="in" index="A3Dl8">
        <child id="1151689745422" name="elementType" index="A3Ik2" />
      </concept>
      <concept id="1160612413312" name="jetbrains.mps.baseLanguage.collections.structure.AddElementOperation" flags="nn" index="TSZUe" />
      <concept id="1160666733551" name="jetbrains.mps.baseLanguage.collections.structure.AddAllElementsOperation" flags="nn" index="X8dFx" />
    </language>
  </registry>
  <node concept="312cEu" id="30fQumnG8Au">
    <property role="TrG5h" value="DclareUtil" />
    <node concept="2tJIrI" id="29R9$zZo$v9" role="jymVt" />
    <node concept="2YIFZL" id="4Y8BM43o88y" role="jymVt">
      <property role="TrG5h" value="getAttributes" />
      <property role="od$2w" value="false" />
      <property role="DiZV1" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="37vLTG" id="4Y8BM43o88_" role="3clF46">
        <property role="TrG5h" value="object" />
        <node concept="3uibUv" id="4Y8BM43o88A" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="3clFbS" id="4Y8BM43o88B" role="3clF47">
        <node concept="3clFbF" id="4Y8BM43o9KK" role="3cqZAp">
          <node concept="10QFUN" id="4Y8BM43oaMd" role="3clFbG">
            <node concept="2OqwBi" id="4Y8BM43oaqz" role="10QFUP">
              <node concept="1eOMI4" id="4Y8BM43oadw" role="2Oq$k0">
                <node concept="10QFUN" id="4Y8BM43oagw" role="1eOMHV">
                  <node concept="3uibUv" id="4wbMdoJv1ie" role="10QFUM">
                    <ref role="3uigEE" to="t4tl:~DObject" resolve="DObject" />
                  </node>
                  <node concept="37vLTw" id="4Y8BM43o9KJ" role="10QFUP">
                    <ref role="3cqZAo" node="4Y8BM43o88_" resolve="object" />
                  </node>
                </node>
              </node>
              <node concept="liA8E" id="4Y8BM43oaxi" role="2OqNvi">
                <ref role="37wK5l" to="t4tl:~DObject.getNonSyntheticAttributes()" resolve="getNonSyntheticAttributes" />
              </node>
            </node>
            <node concept="A3Dl8" id="4Y8BM43oaMe" role="10QFUM">
              <node concept="3uibUv" id="4Y8BM43odSo" role="A3Ik2">
                <ref role="3uigEE" to="t4tl:~DAttribute" resolve="DAttribute" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="4Y8BM43o88M" role="1B3o_S" />
      <node concept="A3Dl8" id="4Y8BM43o9lz" role="3clF45">
        <node concept="3uibUv" id="4Y8BM43oeiT" role="A3Ik2">
          <ref role="3uigEE" to="t4tl:~DAttribute" resolve="DAttribute" />
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="4Y8BM43o7rh" role="jymVt" />
    <node concept="2YIFZL" id="1lQ5DPQts7D" role="jymVt">
      <property role="TrG5h" value="getAttributeValue" />
      <property role="od$2w" value="false" />
      <property role="DiZV1" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="37vLTG" id="1lQ5DPQtstn" role="3clF46">
        <property role="TrG5h" value="attributeId" />
        <node concept="3uibUv" id="1lQ5DPQtsvD" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="37vLTG" id="4wbMdoJjOKU" role="3clF46">
        <property role="TrG5h" value="name" />
        <node concept="17QB3L" id="4wbMdoJjOZH" role="1tU5fm" />
      </node>
      <node concept="37vLTG" id="2UEyDf69Y8Q" role="3clF46">
        <property role="TrG5h" value="identityIndex" />
        <node concept="10Oyi0" id="2UEyDf69Yag" role="1tU5fm" />
      </node>
      <node concept="37vLTG" id="5GTBd9D0Xjp" role="3clF46">
        <property role="TrG5h" value="type" />
        <node concept="3uibUv" id="5GTBd9D0Y29" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~Class" resolve="Class" />
          <node concept="3qTvmN" id="5GTBd9DvdSh" role="11_B2D" />
        </node>
      </node>
      <node concept="37vLTG" id="1lQ5DPQtsij" role="3clF46">
        <property role="TrG5h" value="object" />
        <node concept="16syzq" id="1th4WYI7BXB" role="1tU5fm">
          <ref role="16sUi3" node="1th4WYI7A9p" resolve="O" />
        </node>
      </node>
      <node concept="3clFbS" id="1lQ5DPQts7G" role="3clF47">
        <node concept="3clFbF" id="1lQ5DPQtwf3" role="3cqZAp">
          <node concept="2YIFZM" id="3DB41z9GGdy" role="3clFbG">
            <ref role="1Pybhc" node="30fQumnG8Au" resolve="DclareUtil" />
            <ref role="37wK5l" node="3DB41z9GGdu" resolve="toMutable" />
            <node concept="37vLTw" id="5GTBd9D1Wfv" role="37wK5m">
              <ref role="3cqZAo" node="5GTBd9D0Xjp" resolve="type" />
            </node>
            <node concept="2OqwBi" id="3DB41z9il_o" role="37wK5m">
              <node concept="2YIFZM" id="3DB41z9il_p" role="2Oq$k0">
                <ref role="1Pybhc" to="t4tl:~DAttribute" resolve="DAttribute" />
                <ref role="37wK5l" to="t4tl:~DAttribute.of(java.lang.Object,java.lang.String,boolean,boolean,boolean,int,java.lang.Object,java.util.function.Supplier,java.util.function.Function)" resolve="of" />
                <node concept="37vLTw" id="3DB41z9il_q" role="37wK5m">
                  <ref role="3cqZAo" node="1lQ5DPQtstn" resolve="attributeId" />
                </node>
                <node concept="37vLTw" id="3DB41z9il_r" role="37wK5m">
                  <ref role="3cqZAo" node="4wbMdoJjOKU" resolve="name" />
                </node>
                <node concept="3clFbT" id="6xVl262Oj0O" role="37wK5m" />
                <node concept="3clFbT" id="6xVl262Oj5X" role="37wK5m" />
                <node concept="3clFbT" id="6xVl262Ojbc" role="37wK5m" />
                <node concept="37vLTw" id="3DB41z9il_v" role="37wK5m">
                  <ref role="3cqZAo" node="2UEyDf69Y8Q" resolve="identityIndex" />
                </node>
                <node concept="10Nm6u" id="6xVl262OjyI" role="37wK5m" />
                <node concept="10Nm6u" id="6xVl262Oji8" role="37wK5m" />
                <node concept="10Nm6u" id="6xVl262Ojnv" role="37wK5m" />
                <node concept="16syzq" id="3DB41z9il_y" role="3PaCim">
                  <ref role="16sUi3" node="1th4WYI7A9p" resolve="O" />
                </node>
                <node concept="16syzq" id="3DB41z9il_z" role="3PaCim">
                  <ref role="16sUi3" node="1lQ5DPQtsqI" resolve="T" />
                </node>
              </node>
              <node concept="liA8E" id="3DB41z9il_$" role="2OqNvi">
                <ref role="37wK5l" to="t4tl:~DAttribute.get(java.lang.Object)" resolve="get" />
                <node concept="37vLTw" id="3DB41z9il__" role="37wK5m">
                  <ref role="3cqZAo" node="1lQ5DPQtsij" resolve="object" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="1lQ5DPQtrW5" role="1B3o_S" />
      <node concept="16syzq" id="1lQ5DPQt_Nc" role="3clF45">
        <ref role="16sUi3" node="1lQ5DPQtsqI" resolve="T" />
      </node>
      <node concept="16euLQ" id="1th4WYI7A9p" role="16eVyc">
        <property role="TrG5h" value="O" />
      </node>
      <node concept="16euLQ" id="1lQ5DPQtsqI" role="16eVyc">
        <property role="TrG5h" value="T" />
      </node>
    </node>
    <node concept="2tJIrI" id="3DB41z9GJC9" role="jymVt" />
    <node concept="2YIFZL" id="3DB41z9GGdu" role="jymVt">
      <property role="TrG5h" value="toMutable" />
      <node concept="3Tm1VV" id="3DB41z9L7BG" role="1B3o_S" />
      <node concept="16syzq" id="3DB41z9GGdw" role="3clF45">
        <ref role="16sUi3" node="3DB41z9H8Ju" resolve="T" />
      </node>
      <node concept="37vLTG" id="5GTBd9D1Bb5" role="3clF46">
        <property role="TrG5h" value="type" />
        <node concept="3uibUv" id="5GTBd9D1Cse" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~Class" resolve="Class" />
          <node concept="3qTvmN" id="5GTBd9D1Fo1" role="11_B2D" />
        </node>
      </node>
      <node concept="37vLTG" id="3DB41z9GGdg" role="3clF46">
        <property role="TrG5h" value="value" />
        <node concept="16syzq" id="3DB41z9GGdh" role="1tU5fm">
          <ref role="16sUi3" node="3DB41z9H8Ju" resolve="T" />
        </node>
      </node>
      <node concept="3clFbS" id="3DB41z9GGc7" role="3clF47">
        <node concept="3clFbJ" id="3DB41z9GGca" role="3cqZAp">
          <node concept="3clFbS" id="3DB41z9GGcb" role="3clFbx">
            <node concept="3clFbF" id="3DB41z9GGcc" role="3cqZAp">
              <node concept="37vLTI" id="3DB41z9GGcd" role="3clFbG">
                <node concept="37vLTw" id="3DB41z9GGdr" role="37vLTJ">
                  <ref role="3cqZAo" node="3DB41z9GGdg" resolve="value" />
                </node>
                <node concept="10QFUN" id="3DB41z9GGcf" role="37vLTx">
                  <node concept="16syzq" id="3DB41z9GGcg" role="10QFUM">
                    <ref role="16sUi3" node="3DB41z9H8Ju" resolve="T" />
                  </node>
                  <node concept="2OqwBi" id="3DB41z9GGch" role="10QFUP">
                    <node concept="1eOMI4" id="3DB41z9GGci" role="2Oq$k0">
                      <node concept="10QFUN" id="3DB41z9GGcj" role="1eOMHV">
                        <node concept="3uibUv" id="37Y5i25LfhL" role="10QFUM">
                          <ref role="3uigEE" to="zrbp:~Collection" resolve="Collection" />
                        </node>
                        <node concept="37vLTw" id="3DB41z9GGdj" role="10QFUP">
                          <ref role="3cqZAo" node="3DB41z9GGdg" resolve="value" />
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="3DB41z9GGcm" role="2OqNvi">
                      <ref role="37wK5l" to="1ctc:~Stream.collect(java.util.stream.Collector)" resolve="collect" />
                      <node concept="2YIFZM" id="3DB41z9GGcn" role="37wK5m">
                        <ref role="37wK5l" to="1ctc:~Collectors.toList()" resolve="toList" />
                        <ref role="1Pybhc" to="1ctc:~Collectors" resolve="Collectors" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3eNFk2" id="3DB41z9GGcr" role="3eNLev">
            <node concept="3clFbS" id="3DB41z9GGcv" role="3eOfB_">
              <node concept="3clFbF" id="3DB41z9GGcw" role="3cqZAp">
                <node concept="37vLTI" id="3DB41z9GGcx" role="3clFbG">
                  <node concept="37vLTw" id="3DB41z9GGdm" role="37vLTJ">
                    <ref role="3cqZAo" node="3DB41z9GGdg" resolve="value" />
                  </node>
                  <node concept="10QFUN" id="3DB41z9GGcz" role="37vLTx">
                    <node concept="16syzq" id="3DB41z9GGc$" role="10QFUM">
                      <ref role="16sUi3" node="3DB41z9H8Ju" resolve="T" />
                    </node>
                    <node concept="2OqwBi" id="3DB41z9GGc_" role="10QFUP">
                      <node concept="1eOMI4" id="3DB41z9GGcA" role="2Oq$k0">
                        <node concept="10QFUN" id="3DB41z9GGcB" role="1eOMHV">
                          <node concept="3uibUv" id="37Y5i25LgwT" role="10QFUM">
                            <ref role="3uigEE" to="zrbp:~Collection" resolve="Collection" />
                          </node>
                          <node concept="37vLTw" id="3DB41z9GGdk" role="10QFUP">
                            <ref role="3cqZAo" node="3DB41z9GGdg" resolve="value" />
                          </node>
                        </node>
                      </node>
                      <node concept="liA8E" id="3DB41z9GGcE" role="2OqNvi">
                        <ref role="37wK5l" to="1ctc:~Stream.collect(java.util.stream.Collector)" resolve="collect" />
                        <node concept="2YIFZM" id="3DB41z9GGcF" role="37wK5m">
                          <ref role="37wK5l" to="1ctc:~Collectors.toSet()" resolve="toSet" />
                          <ref role="1Pybhc" to="1ctc:~Collectors" resolve="Collectors" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="1Wc70l" id="5GTBd9DBQJ0" role="3eO9$A">
              <node concept="2ZW3vV" id="5GTBd9DBTh9" role="3uHU7w">
                <node concept="3uibUv" id="37Y5i25LsIc" role="2ZW6by">
                  <ref role="3uigEE" to="zrbp:~Collection" resolve="Collection" />
                </node>
                <node concept="37vLTw" id="5GTBd9DBSjg" role="2ZW6bz">
                  <ref role="3cqZAo" node="3DB41z9GGdg" resolve="value" />
                </node>
              </node>
              <node concept="3clFbC" id="5GTBd9D1P3A" role="3uHU7B">
                <node concept="37vLTw" id="5GTBd9D1OCM" role="3uHU7B">
                  <ref role="3cqZAo" node="5GTBd9D1Bb5" resolve="type" />
                </node>
                <node concept="3VsKOn" id="5GTBd9D1QQ2" role="3uHU7w">
                  <ref role="3VsUkX" to="33ny:~Set" resolve="Set" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3eNFk2" id="3DB41z9GGcG" role="3eNLev">
            <node concept="3clFbS" id="3DB41z9GGcK" role="3eOfB_">
              <node concept="3clFbF" id="3DB41z9GGcL" role="3cqZAp">
                <node concept="37vLTI" id="3DB41z9GGcM" role="3clFbG">
                  <node concept="37vLTw" id="3DB41z9GGdq" role="37vLTJ">
                    <ref role="3cqZAo" node="3DB41z9GGdg" resolve="value" />
                  </node>
                  <node concept="10QFUN" id="3DB41z9GGcO" role="37vLTx">
                    <node concept="16syzq" id="3DB41z9GGcP" role="10QFUM">
                      <ref role="16sUi3" node="3DB41z9H8Ju" resolve="T" />
                    </node>
                    <node concept="2OqwBi" id="3DB41z9GGcQ" role="10QFUP">
                      <node concept="1eOMI4" id="3DB41z9GGcR" role="2Oq$k0">
                        <node concept="10QFUN" id="3DB41z9GGcS" role="1eOMHV">
                          <node concept="3uibUv" id="1cUpE405vqY" role="10QFUM">
                            <ref role="3uigEE" to="zrbp:~Map" resolve="Map" />
                          </node>
                          <node concept="37vLTw" id="3DB41z9GGdo" role="10QFUP">
                            <ref role="3cqZAo" node="3DB41z9GGdg" resolve="value" />
                          </node>
                        </node>
                      </node>
                      <node concept="liA8E" id="3DB41z9GGcV" role="2OqNvi">
                        <ref role="37wK5l" to="1ctc:~Stream.collect(java.util.stream.Collector)" resolve="collect" />
                        <node concept="2YIFZM" id="3DB41z9GGcW" role="37wK5m">
                          <ref role="37wK5l" to="1ctc:~Collectors.toMap(java.util.function.Function,java.util.function.Function)" resolve="toMap" />
                          <ref role="1Pybhc" to="1ctc:~Collectors" resolve="Collectors" />
                          <node concept="1bVj0M" id="3DB41z9GGcX" role="37wK5m">
                            <node concept="3clFbS" id="3DB41z9GGcY" role="1bW5cS">
                              <node concept="3clFbF" id="3DB41z9GGcZ" role="3cqZAp">
                                <node concept="2OqwBi" id="3DB41z9GGd0" role="3clFbG">
                                  <node concept="37vLTw" id="3DB41z9GGd1" role="2Oq$k0">
                                    <ref role="3cqZAo" node="3DB41z9GGd3" resolve="e" />
                                  </node>
                                  <node concept="liA8E" id="3DB41z9GGd2" role="2OqNvi">
                                    <ref role="37wK5l" to="zrbp:~Entry.getKey()" resolve="getKey" />
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="37vLTG" id="3DB41z9GGd3" role="1bW2Oz">
                              <property role="TrG5h" value="e" />
                              <node concept="3uibUv" id="3DB41z9GGd4" role="1tU5fm">
                                <ref role="3uigEE" to="zrbp:~Entry" resolve="Entry" />
                              </node>
                            </node>
                          </node>
                          <node concept="1bVj0M" id="3DB41z9GGd5" role="37wK5m">
                            <node concept="3clFbS" id="3DB41z9GGd6" role="1bW5cS">
                              <node concept="3clFbF" id="3DB41z9GGd7" role="3cqZAp">
                                <node concept="2OqwBi" id="3DB41z9GGd8" role="3clFbG">
                                  <node concept="37vLTw" id="3DB41z9GGd9" role="2Oq$k0">
                                    <ref role="3cqZAo" node="3DB41z9GGdb" resolve="e" />
                                  </node>
                                  <node concept="liA8E" id="3DB41z9GGda" role="2OqNvi">
                                    <ref role="37wK5l" to="zrbp:~Entry.getValue()" resolve="getValue" />
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="37vLTG" id="3DB41z9GGdb" role="1bW2Oz">
                              <property role="TrG5h" value="e" />
                              <node concept="3uibUv" id="3DB41z9GGdc" role="1tU5fm">
                                <ref role="3uigEE" to="zrbp:~Entry" resolve="Entry" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="15s5l7" id="3DB41z9GGdd" role="lGtFl">
                  <property role="1eyWvh" value="FLAVOUR_ISSUE_KIND=&quot;typesystem (typesystem)&quot;;FLAVOUR_MESSAGE=&quot;Error: type ? super j48 is not a subtype of org.modelingvalue.collections.Entry&quot;;FLAVOUR_RULE_ID=&quot;[r:00000000-0000-4000-0000-011c89590337(jetbrains.mps.baseLanguage.closures.typesystem)/8701449112292740706,r:00000000-0000-4000-0000-011c895902c5(jetbrains.mps.baseLanguage.typesystem)/5977092449933510825]&quot;;" />
                  <property role="huDt6" value="Error: type ? super j48 is not a subtype of org.modelingvalue.collections.Entry" />
                </node>
              </node>
            </node>
            <node concept="1Wc70l" id="5GTBd9DBUL6" role="3eO9$A">
              <node concept="2ZW3vV" id="5GTBd9DBX9B" role="3uHU7w">
                <node concept="3uibUv" id="37Y5i25LnmD" role="2ZW6by">
                  <ref role="3uigEE" to="zrbp:~Map" resolve="Map" />
                </node>
                <node concept="37vLTw" id="5GTBd9DBWbI" role="2ZW6bz">
                  <ref role="3cqZAo" node="3DB41z9GGdg" resolve="value" />
                </node>
              </node>
              <node concept="3clFbC" id="5GTBd9D1TZc" role="3uHU7B">
                <node concept="37vLTw" id="5GTBd9D1SBq" role="3uHU7B">
                  <ref role="3cqZAo" node="5GTBd9D1Bb5" resolve="type" />
                </node>
                <node concept="3VsKOn" id="5GTBd9D1V$6" role="3uHU7w">
                  <ref role="3VsUkX" to="33ny:~Map" resolve="Map" />
                </node>
              </node>
            </node>
          </node>
          <node concept="1Wc70l" id="5GTBd9DBHeE" role="3clFbw">
            <node concept="2ZW3vV" id="5GTBd9DBK2N" role="3uHU7w">
              <node concept="3uibUv" id="37Y5i25LdFv" role="2ZW6by">
                <ref role="3uigEE" to="zrbp:~Collection" resolve="Collection" />
              </node>
              <node concept="37vLTw" id="5GTBd9DBJ4U" role="2ZW6bz">
                <ref role="3cqZAo" node="3DB41z9GGdg" resolve="value" />
              </node>
            </node>
            <node concept="3clFbC" id="5GTBd9D1Jrp" role="3uHU7B">
              <node concept="37vLTw" id="5GTBd9D1I$5" role="3uHU7B">
                <ref role="3cqZAo" node="5GTBd9D1Bb5" resolve="type" />
              </node>
              <node concept="3VsKOn" id="5GTBd9D1M4i" role="3uHU7w">
                <ref role="3VsUkX" to="33ny:~List" resolve="List" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="3DB41z9GGde" role="3cqZAp">
          <node concept="37vLTw" id="3DB41z9GGdl" role="3cqZAk">
            <ref role="3cqZAo" node="3DB41z9GGdg" resolve="value" />
          </node>
        </node>
      </node>
      <node concept="16euLQ" id="3DB41z9H8Ju" role="16eVyc">
        <property role="TrG5h" value="T" />
      </node>
    </node>
    <node concept="2tJIrI" id="1lQ5DPQt_c7" role="jymVt" />
    <node concept="2YIFZL" id="1lQ5DPQt_o8" role="jymVt">
      <property role="TrG5h" value="setAttributeValue" />
      <property role="od$2w" value="false" />
      <property role="DiZV1" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="37vLTG" id="1lQ5DPQt_o9" role="3clF46">
        <property role="TrG5h" value="attributeId" />
        <node concept="3uibUv" id="1lQ5DPQt_oa" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="37vLTG" id="4wbMdoJjOTa" role="3clF46">
        <property role="TrG5h" value="name" />
        <node concept="17QB3L" id="4wbMdoJjOXu" role="1tU5fm" />
      </node>
      <node concept="37vLTG" id="5GTBd9D0LHI" role="3clF46">
        <property role="TrG5h" value="type" />
        <node concept="3uibUv" id="5GTBd9D0OZb" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~Class" resolve="Class" />
          <node concept="3qTvmN" id="5GTBd9DveAY" role="11_B2D" />
        </node>
      </node>
      <node concept="37vLTG" id="1lQ5DPQt_ob" role="3clF46">
        <property role="TrG5h" value="object" />
        <node concept="3uibUv" id="1lQ5DPQ_8op" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="37vLTG" id="1lQ5DPQtAgA" role="3clF46">
        <property role="TrG5h" value="value" />
        <node concept="16syzq" id="1lQ5DPQtAji" role="1tU5fm">
          <ref role="16sUi3" node="1lQ5DPQt_oo" resolve="T" />
        </node>
      </node>
      <node concept="3clFbS" id="1lQ5DPQt_od" role="3clF47">
        <node concept="3clFbF" id="1lQ5DPQt_oe" role="3cqZAp">
          <node concept="2OqwBi" id="1lQ5DPQt_of" role="3clFbG">
            <node concept="liA8E" id="1lQ5DPQt_oi" role="2OqNvi">
              <ref role="37wK5l" to="t4tl:~DAttribute.set(java.lang.Object,java.lang.Object)" resolve="set" />
              <node concept="37vLTw" id="1lQ5DPQt_oj" role="37wK5m">
                <ref role="3cqZAo" node="1lQ5DPQt_ob" resolve="object" />
              </node>
              <node concept="2YIFZM" id="3DB41z9GPiE" role="37wK5m">
                <ref role="1Pybhc" node="30fQumnG8Au" resolve="DclareUtil" />
                <ref role="37wK5l" node="3DB41z9GPiA" resolve="toNonMutable" />
                <node concept="37vLTw" id="5GTBd9D1enV" role="37wK5m">
                  <ref role="3cqZAo" node="5GTBd9D0LHI" resolve="type" />
                </node>
                <node concept="37vLTw" id="3DB41z9GPiD" role="37wK5m">
                  <ref role="3cqZAo" node="1lQ5DPQtAgA" resolve="value" />
                </node>
              </node>
            </node>
            <node concept="2YIFZM" id="1cUpE404P6O" role="2Oq$k0">
              <ref role="37wK5l" to="t4tl:~DAttribute.of(java.lang.Object,java.lang.String,boolean,boolean,boolean,int,java.lang.Object,java.util.function.Supplier,java.util.function.Function)" resolve="of" />
              <ref role="1Pybhc" to="t4tl:~DAttribute" resolve="DAttribute" />
              <node concept="37vLTw" id="1cUpE404P6S" role="37wK5m">
                <ref role="3cqZAo" node="1lQ5DPQt_o9" resolve="attributeId" />
              </node>
              <node concept="37vLTw" id="1cUpE404P6U" role="37wK5m">
                <ref role="3cqZAo" node="4wbMdoJjOTa" resolve="name" />
              </node>
              <node concept="3clFbT" id="1cUpE404P6Q" role="37wK5m" />
              <node concept="3clFbT" id="1cUpE404P6W" role="37wK5m" />
              <node concept="3clFbT" id="1cUpE404P6M" role="37wK5m" />
              <node concept="3cmrfG" id="1cUpE404P72" role="37wK5m">
                <property role="3cmrfH" value="-1" />
              </node>
              <node concept="10Nm6u" id="1cUpE404P6Y" role="37wK5m" />
              <node concept="10Nm6u" id="1cUpE404P74" role="37wK5m" />
              <node concept="10Nm6u" id="1cUpE404P70" role="37wK5m" />
              <node concept="3uibUv" id="1cUpE404P76" role="3PaCim">
                <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
              </node>
              <node concept="16syzq" id="1cUpE404P78" role="3PaCim">
                <ref role="16sUi3" node="1lQ5DPQt_oo" resolve="T" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="1lQ5DPQt_ok" role="1B3o_S" />
      <node concept="3cqZAl" id="1lQ5DPQt_ol" role="3clF45" />
      <node concept="16euLQ" id="1lQ5DPQt_oo" role="16eVyc">
        <property role="TrG5h" value="T" />
      </node>
    </node>
    <node concept="2tJIrI" id="3DB41z9GTqx" role="jymVt" />
    <node concept="2YIFZL" id="3DB41z9GPiA" role="jymVt">
      <property role="TrG5h" value="toNonMutable" />
      <node concept="3Tm1VV" id="3DB41z9L5rq" role="1B3o_S" />
      <node concept="16syzq" id="3DB41z9GPiC" role="3clF45">
        <ref role="16sUi3" node="3DB41z9GX$V" resolve="T" />
      </node>
      <node concept="37vLTG" id="5GTBd9D12a_" role="3clF46">
        <property role="TrG5h" value="type" />
        <node concept="3uibUv" id="5GTBd9D14l$" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~Class" resolve="Class" />
          <node concept="3qTvmN" id="5GTBd9D179L" role="11_B2D" />
        </node>
      </node>
      <node concept="37vLTG" id="3DB41z9GPio" role="3clF46">
        <property role="TrG5h" value="value" />
        <node concept="16syzq" id="3DB41z9GPip" role="1tU5fm">
          <ref role="16sUi3" node="3DB41z9GX$V" resolve="T" />
        </node>
      </node>
      <node concept="3clFbS" id="3DB41z9GPhm" role="3clF47">
        <node concept="3clFbJ" id="3DB41z9GPhp" role="3cqZAp">
          <node concept="3clFbS" id="3DB41z9GPhq" role="3clFbx">
            <node concept="3clFbF" id="3DB41z9GPhr" role="3cqZAp">
              <node concept="37vLTI" id="3DB41z9GPhs" role="3clFbG">
                <node concept="10QFUN" id="3DB41z9GPht" role="37vLTx">
                  <node concept="16syzq" id="3DB41z9GPhu" role="10QFUM">
                    <ref role="16sUi3" node="3DB41z9GX$V" resolve="T" />
                  </node>
                  <node concept="2OqwBi" id="1cUpE405gj2" role="10QFUP">
                    <node concept="2YIFZM" id="3DB41z9GPhv" role="2Oq$k0">
                      <ref role="1Pybhc" to="zrbp:~Collection" resolve="Collection" />
                      <ref role="37wK5l" to="zrbp:~Collection.of(java.lang.Iterable)" resolve="of" />
                      <node concept="10QFUN" id="3DB41z9GPhw" role="37wK5m">
                        <node concept="3uibUv" id="3DB41z9GPhx" role="10QFUM">
                          <ref role="3uigEE" to="wyt6:~Iterable" resolve="Iterable" />
                          <node concept="3qTvmN" id="3DB41z9GPhy" role="11_B2D" />
                        </node>
                        <node concept="37vLTw" id="3DB41z9GPiz" role="10QFUP">
                          <ref role="3cqZAo" node="3DB41z9GPio" resolve="value" />
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="1cUpE405hWc" role="2OqNvi">
                      <ref role="37wK5l" to="zrbp:~Collection.toList()" resolve="toList" />
                    </node>
                  </node>
                </node>
                <node concept="37vLTw" id="3DB41z9GPiq" role="37vLTJ">
                  <ref role="3cqZAo" node="3DB41z9GPio" resolve="value" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3eNFk2" id="3DB41z9GPhC" role="3eNLev">
            <node concept="3clFbS" id="3DB41z9GPhG" role="3eOfB_">
              <node concept="3clFbF" id="3DB41z9GPhH" role="3cqZAp">
                <node concept="37vLTI" id="3DB41z9GPhI" role="3clFbG">
                  <node concept="37vLTw" id="3DB41z9GPiw" role="37vLTJ">
                    <ref role="3cqZAo" node="3DB41z9GPio" resolve="value" />
                  </node>
                  <node concept="10QFUN" id="3DB41z9GPhK" role="37vLTx">
                    <node concept="16syzq" id="3DB41z9GPhL" role="10QFUM">
                      <ref role="16sUi3" node="3DB41z9GX$V" resolve="T" />
                    </node>
                    <node concept="2OqwBi" id="1cUpE405m$X" role="10QFUP">
                      <node concept="2YIFZM" id="3DB41z9GPhM" role="2Oq$k0">
                        <ref role="1Pybhc" to="zrbp:~Collection" resolve="Collection" />
                        <ref role="37wK5l" to="zrbp:~Collection.of(java.lang.Iterable)" resolve="of" />
                        <node concept="10QFUN" id="3DB41z9GPhN" role="37wK5m">
                          <node concept="3uibUv" id="3DB41z9GPhO" role="10QFUM">
                            <ref role="3uigEE" to="wyt6:~Iterable" resolve="Iterable" />
                            <node concept="3qTvmN" id="3DB41z9GPhP" role="11_B2D" />
                          </node>
                          <node concept="37vLTw" id="3DB41z9GPix" role="10QFUP">
                            <ref role="3cqZAo" node="3DB41z9GPio" resolve="value" />
                          </node>
                        </node>
                      </node>
                      <node concept="liA8E" id="1cUpE405pbB" role="2OqNvi">
                        <ref role="37wK5l" to="zrbp:~Collection.toSet()" resolve="toSet" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="1Wc70l" id="5GTBd9DBzB9" role="3eO9$A">
              <node concept="2ZW3vV" id="5GTBd9DBA0L" role="3uHU7w">
                <node concept="3uibUv" id="1cUpE40570i" role="2ZW6by">
                  <ref role="3uigEE" to="wyt6:~Iterable" resolve="Iterable" />
                </node>
                <node concept="37vLTw" id="5GTBd9DB_9W" role="2ZW6bz">
                  <ref role="3cqZAo" node="3DB41z9GPio" resolve="value" />
                </node>
              </node>
              <node concept="3clFbC" id="5GTBd9D1sGB" role="3uHU7B">
                <node concept="37vLTw" id="5GTBd9D1r7c" role="3uHU7B">
                  <ref role="3cqZAo" node="5GTBd9D12a_" resolve="type" />
                </node>
                <node concept="3VsKOn" id="5GTBd9D1vyg" role="3uHU7w">
                  <ref role="3VsUkX" to="33ny:~Set" resolve="Set" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3eNFk2" id="3DB41z9GPhR" role="3eNLev">
            <node concept="3clFbS" id="3DB41z9GPhV" role="3eOfB_">
              <node concept="3clFbF" id="3DB41z9GPhW" role="3cqZAp">
                <node concept="37vLTI" id="3DB41z9GPhX" role="3clFbG">
                  <node concept="37vLTw" id="3DB41z9GPit" role="37vLTJ">
                    <ref role="3cqZAo" node="3DB41z9GPio" resolve="value" />
                  </node>
                  <node concept="10QFUN" id="3DB41z9GPhZ" role="37vLTx">
                    <node concept="16syzq" id="3DB41z9GPi0" role="10QFUM">
                      <ref role="16sUi3" node="3DB41z9GX$V" resolve="T" />
                    </node>
                    <node concept="2OqwBi" id="3DB41z9GPi1" role="10QFUP">
                      <node concept="2YIFZM" id="3DB41z9GPi2" role="2Oq$k0">
                        <ref role="37wK5l" to="zrbp:~Collection.of(java.lang.Iterable)" resolve="of" />
                        <ref role="1Pybhc" to="zrbp:~Collection" resolve="Collection" />
                        <node concept="2OqwBi" id="3DB41z9GPi3" role="37wK5m">
                          <node concept="1eOMI4" id="3DB41z9GPi4" role="2Oq$k0">
                            <node concept="10QFUN" id="3DB41z9GPi5" role="1eOMHV">
                              <node concept="3uibUv" id="3DB41z9GPi6" role="10QFUM">
                                <ref role="3uigEE" to="33ny:~Map" resolve="Map" />
                              </node>
                              <node concept="37vLTw" id="3DB41z9GPiy" role="10QFUP">
                                <ref role="3cqZAo" node="3DB41z9GPio" resolve="value" />
                              </node>
                            </node>
                          </node>
                          <node concept="liA8E" id="3DB41z9GPi8" role="2OqNvi">
                            <ref role="37wK5l" to="33ny:~Map.entrySet()" resolve="entrySet" />
                          </node>
                        </node>
                      </node>
                      <node concept="liA8E" id="3DB41z9GPi9" role="2OqNvi">
                        <ref role="37wK5l" to="zrbp:~Collection.toMap(java.util.function.Function)" resolve="toMap" />
                        <node concept="1bVj0M" id="3DB41z9GPia" role="37wK5m">
                          <node concept="3clFbS" id="3DB41z9GPib" role="1bW5cS">
                            <node concept="3clFbF" id="3DB41z9GPic" role="3cqZAp">
                              <node concept="2YIFZM" id="3DB41z9GPid" role="3clFbG">
                                <ref role="37wK5l" to="zrbp:~Entry.of(java.lang.Object,java.lang.Object)" resolve="of" />
                                <ref role="1Pybhc" to="zrbp:~Entry" resolve="Entry" />
                                <node concept="2OqwBi" id="3DB41z9GPie" role="37wK5m">
                                  <node concept="37vLTw" id="3DB41z9GPif" role="2Oq$k0">
                                    <ref role="3cqZAo" node="3DB41z9GPik" resolve="e" />
                                  </node>
                                  <node concept="liA8E" id="3DB41z9GPig" role="2OqNvi">
                                    <ref role="37wK5l" to="33ny:~Map$Entry.getKey()" resolve="getKey" />
                                  </node>
                                </node>
                                <node concept="2OqwBi" id="3DB41z9GPih" role="37wK5m">
                                  <node concept="37vLTw" id="3DB41z9GPii" role="2Oq$k0">
                                    <ref role="3cqZAo" node="3DB41z9GPik" resolve="e" />
                                  </node>
                                  <node concept="liA8E" id="3DB41z9GPij" role="2OqNvi">
                                    <ref role="37wK5l" to="33ny:~Map$Entry.getValue()" resolve="getValue" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="37vLTG" id="3DB41z9GPik" role="1bW2Oz">
                            <property role="TrG5h" value="e" />
                            <node concept="3uibUv" id="3DB41z9GPil" role="1tU5fm">
                              <ref role="3uigEE" to="33ny:~Map$Entry" resolve="Map.Entry" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="1Wc70l" id="5GTBd9DBCsH" role="3eO9$A">
              <node concept="2ZW3vV" id="5GTBd9DBFeT" role="3uHU7w">
                <node concept="3uibUv" id="37Y5i25LkI5" role="2ZW6by">
                  <ref role="3uigEE" to="33ny:~Map" resolve="Map" />
                </node>
                <node concept="37vLTw" id="5GTBd9DBE0b" role="2ZW6bz">
                  <ref role="3cqZAo" node="3DB41z9GPio" resolve="value" />
                </node>
              </node>
              <node concept="3clFbC" id="5GTBd9D1zSY" role="3uHU7B">
                <node concept="37vLTw" id="5GTBd9D1y1V" role="3uHU7B">
                  <ref role="3cqZAo" node="5GTBd9D12a_" resolve="type" />
                </node>
                <node concept="3VsKOn" id="5GTBd9D1Ahj" role="3uHU7w">
                  <ref role="3VsUkX" to="33ny:~Map" resolve="Map" />
                </node>
              </node>
            </node>
          </node>
          <node concept="1Wc70l" id="5GTBd9DBjaH" role="3clFbw">
            <node concept="2ZW3vV" id="5GTBd9DBn3I" role="3uHU7w">
              <node concept="3uibUv" id="1cUpE4055mA" role="2ZW6by">
                <ref role="3uigEE" to="wyt6:~Iterable" resolve="Iterable" />
              </node>
              <node concept="37vLTw" id="5GTBd9DBlD$" role="2ZW6bz">
                <ref role="3cqZAo" node="3DB41z9GPio" resolve="value" />
              </node>
            </node>
            <node concept="3clFbC" id="5GTBd9D1ke3" role="3uHU7B">
              <node concept="37vLTw" id="5GTBd9D1hAS" role="3uHU7B">
                <ref role="3cqZAo" node="5GTBd9D12a_" resolve="type" />
              </node>
              <node concept="3VsKOn" id="5GTBd9D1nOr" role="3uHU7w">
                <ref role="3VsUkX" to="33ny:~List" resolve="List" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="3DB41z9GPim" role="3cqZAp">
          <node concept="37vLTw" id="3DB41z9GPiu" role="3cqZAk">
            <ref role="3cqZAo" node="3DB41z9GPio" resolve="value" />
          </node>
        </node>
      </node>
      <node concept="16euLQ" id="3DB41z9GX$V" role="16eVyc">
        <property role="TrG5h" value="T" />
      </node>
    </node>
    <node concept="2tJIrI" id="6QNGPTyqSNj" role="jymVt" />
    <node concept="2YIFZL" id="2v4o0zdF2x_" role="jymVt">
      <property role="TrG5h" value="setRootNodes" />
      <property role="od$2w" value="false" />
      <property role="DiZV1" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="3clFbS" id="2v4o0zdF2xC" role="3clF47">
        <node concept="3clFbJ" id="7cw6wiN1ne4" role="3cqZAp">
          <node concept="3clFbS" id="7cw6wiN1ne6" role="3clFbx">
            <node concept="3clFbF" id="2v4o0zdF645" role="3cqZAp">
              <node concept="2OqwBi" id="2v4o0zdF6q$" role="3clFbG">
                <node concept="1eOMI4" id="2v4o0zdF643" role="2Oq$k0">
                  <node concept="10QFUN" id="2v4o0zdF640" role="1eOMHV">
                    <node concept="3uibUv" id="2v4o0zdF64q" role="10QFUM">
                      <ref role="3uigEE" to="t4tl:~DModel" resolve="DModel" />
                    </node>
                    <node concept="37vLTw" id="2v4o0zdF6by" role="10QFUP">
                      <ref role="3cqZAo" node="2v4o0zdF5Y0" resolve="model" />
                    </node>
                  </node>
                </node>
                <node concept="liA8E" id="2v4o0zdF6NA" role="2OqNvi">
                  <ref role="37wK5l" to="t4tl:~DModel.setRootNodes(org.jetbrains.mps.openapi.language.SAbstractConcept,java.lang.Iterable)" resolve="setRootNodes" />
                  <node concept="37vLTw" id="2v4o0zdGzaE" role="37wK5m">
                    <ref role="3cqZAo" node="2v4o0zdGz0T" resolve="concept" />
                  </node>
                  <node concept="10QFUN" id="1cUpE408tx3" role="37wK5m">
                    <node concept="37vLTw" id="2v4o0zdF6Ry" role="10QFUP">
                      <ref role="3cqZAo" node="2v4o0zdF5ZA" resolve="roots" />
                    </node>
                    <node concept="3uibUv" id="1cUpE408wrl" role="10QFUM">
                      <ref role="3uigEE" to="wyt6:~Iterable" resolve="Iterable" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3y3z36" id="7cw6wiN1nud" role="3clFbw">
            <node concept="10Nm6u" id="7cw6wiN1nxS" role="3uHU7w" />
            <node concept="37vLTw" id="7cw6wiN1nhZ" role="3uHU7B">
              <ref role="3cqZAo" node="2v4o0zdF5Y0" resolve="model" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="2v4o0zdF1Sr" role="1B3o_S" />
      <node concept="3cqZAl" id="2v4o0zdF2wN" role="3clF45" />
      <node concept="37vLTG" id="2v4o0zdF5Y0" role="3clF46">
        <property role="TrG5h" value="model" />
        <node concept="3uibUv" id="2v4o0zdF5XZ" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SModel" resolve="SModel" />
        </node>
      </node>
      <node concept="37vLTG" id="2v4o0zdGz0T" role="3clF46">
        <property role="TrG5h" value="concept" />
        <node concept="3uibUv" id="2v4o0zdGz2W" role="1tU5fm">
          <ref role="3uigEE" to="c17a:~SAbstractConcept" resolve="SAbstractConcept" />
        </node>
      </node>
      <node concept="37vLTG" id="2v4o0zdF5ZA" role="3clF46">
        <property role="TrG5h" value="roots" />
        <node concept="3uibUv" id="2v4o0zdF60S" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~Iterable" resolve="Iterable" />
          <node concept="3qUE_q" id="2v4o0zdFeLu" role="11_B2D">
            <node concept="3uibUv" id="2v4o0zdFeN9" role="3qUE_r">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="2v4o0zdF1gQ" role="jymVt" />
    <node concept="2YIFZL" id="6QNGPTyqUHH" role="jymVt">
      <property role="TrG5h" value="setFeatureValue" />
      <property role="od$2w" value="false" />
      <property role="DiZV1" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="3clFbS" id="6QNGPTyqUHK" role="3clF47">
        <node concept="3clFbF" id="2v4o0zdEWvc" role="3cqZAp">
          <node concept="2OqwBi" id="2v4o0zdEXze" role="3clFbG">
            <node concept="1eOMI4" id="2v4o0zdEWva" role="2Oq$k0">
              <node concept="10QFUN" id="2v4o0zdEWv7" role="1eOMHV">
                <node concept="3uibUv" id="2v4o0zdEWY9" role="10QFUM">
                  <ref role="3uigEE" to="t4tl:~DNode" resolve="DNode" />
                </node>
                <node concept="37vLTw" id="2v4o0zdEXbf" role="10QFUP">
                  <ref role="3cqZAo" node="6QNGPTyqVlX" resolve="node" />
                </node>
              </node>
            </node>
            <node concept="liA8E" id="2v4o0zdEXQ8" role="2OqNvi">
              <ref role="37wK5l" to="t4tl:~DNode.setFeature(org.jetbrains.mps.openapi.language.SConceptFeature,java.lang.Object)" resolve="setFeature" />
              <node concept="37vLTw" id="2v4o0zdEXYw" role="37wK5m">
                <ref role="3cqZAo" node="6QNGPTyqVnp" resolve="feature" />
              </node>
              <node concept="37vLTw" id="2v4o0zdEY8J" role="37wK5m">
                <ref role="3cqZAo" node="6QNGPTyqYXx" resolve="value" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="6QNGPTyqHYV" role="1B3o_S" />
      <node concept="3cqZAl" id="6QNGPTyqUGV" role="3clF45" />
      <node concept="37vLTG" id="6QNGPTyqVlX" role="3clF46">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="6QNGPTyqVlW" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
        </node>
      </node>
      <node concept="37vLTG" id="6QNGPTyqVnp" role="3clF46">
        <property role="TrG5h" value="feature" />
        <node concept="3uibUv" id="2v4o0zdEWoJ" role="1tU5fm">
          <ref role="3uigEE" to="c17a:~SConceptFeature" resolve="SConceptFeature" />
        </node>
      </node>
      <node concept="37vLTG" id="6QNGPTyqYXx" role="3clF46">
        <property role="TrG5h" value="value" />
        <node concept="3uibUv" id="6QNGPTyqYYP" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="1lQ5DPQtrAA" role="jymVt" />
    <node concept="2YIFZL" id="29R9$zZq4Ie" role="jymVt">
      <property role="TrG5h" value="getOpposite" />
      <property role="DiZV1" value="false" />
      <property role="od$2w" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="3clFbS" id="29R9$zZq4Ig" role="3clF47">
        <node concept="3clFbF" id="29R9$zZq4Ih" role="3cqZAp">
          <node concept="10QFUN" id="29R9$zZq4Ii" role="3clFbG">
            <node concept="2OqwBi" id="29R9$zZq4Ij" role="10QFUP">
              <node concept="1eOMI4" id="29R9$zZq4Ik" role="2Oq$k0">
                <node concept="10QFUN" id="29R9$zZq4Il" role="1eOMHV">
                  <node concept="3uibUv" id="29R9$zZq4Im" role="10QFUM">
                    <ref role="3uigEE" to="t4tl:~DNode" resolve="DNode" />
                  </node>
                  <node concept="37vLTw" id="29R9$zZq4In" role="10QFUP">
                    <ref role="3cqZAo" node="29R9$zZq4Iv" resolve="node" />
                  </node>
                </node>
              </node>
              <node concept="liA8E" id="29R9$zZq4Io" role="2OqNvi">
                <ref role="37wK5l" to="t4tl:~DNode.getReferenceSources(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceSources" />
                <node concept="37vLTw" id="29R9$zZq4Ip" role="37wK5m">
                  <ref role="3cqZAo" node="29R9$zZq4Ix" resolve="oppos" />
                </node>
              </node>
            </node>
            <node concept="A3Dl8" id="29R9$zZq4Iq" role="10QFUM" />
          </node>
        </node>
      </node>
      <node concept="A3Dl8" id="29R9$zZq4It" role="3clF45">
        <node concept="3Tqbb2" id="29R9$zZq4Iu" role="A3Ik2" />
      </node>
      <node concept="37vLTG" id="29R9$zZq4Iv" role="3clF46">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="29R9$zZq4Iw" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
        </node>
      </node>
      <node concept="37vLTG" id="29R9$zZq4Ix" role="3clF46">
        <property role="TrG5h" value="oppos" />
        <node concept="3uibUv" id="29R9$zZq4Iy" role="1tU5fm">
          <ref role="3uigEE" to="c17a:~SReferenceLink" resolve="SReferenceLink" />
        </node>
      </node>
      <node concept="3Tm1VV" id="29R9$zZq4Is" role="1B3o_S" />
    </node>
    <node concept="2tJIrI" id="5hwIp2JLcq3" role="jymVt" />
    <node concept="2YIFZL" id="5hwIp2JLc$d" role="jymVt">
      <property role="DiZV1" value="false" />
      <property role="od$2w" value="false" />
      <property role="2aFKle" value="false" />
      <property role="TrG5h" value="findSibling" />
      <node concept="37vLTG" id="5hwIp2JMqup" role="3clF46">
        <property role="TrG5h" value="model" />
        <node concept="3uibUv" id="56O9viirrC9" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SModel" resolve="SModel" />
        </node>
      </node>
      <node concept="37vLTG" id="5hwIp2JLeCm" role="3clF46">
        <property role="TrG5h" value="name" />
        <node concept="17QB3L" id="5hwIp2JLeCP" role="1tU5fm" />
      </node>
      <node concept="3clFbS" id="5hwIp2JLc$h" role="3clF47">
        <node concept="3clFbF" id="5hwIp2JLeQW" role="3cqZAp">
          <node concept="1rXfSq" id="7fAqG1ajx4" role="3clFbG">
            <ref role="37wK5l" node="7fAqG1ai8G" resolve="findModel" />
            <node concept="2OqwBi" id="7fAqG1ajHx" role="37wK5m">
              <node concept="37vLTw" id="7fAqG1ajAx" role="2Oq$k0">
                <ref role="3cqZAo" node="5hwIp2JMqup" resolve="model" />
              </node>
              <node concept="liA8E" id="7fAqG1ajPn" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SModel.getModule()" resolve="getModule" />
              </node>
            </node>
            <node concept="37vLTw" id="7fAqG1ajSU" role="37wK5m">
              <ref role="3cqZAo" node="5hwIp2JLeCm" resolve="name" />
            </node>
          </node>
        </node>
      </node>
      <node concept="H_c77" id="5hwIp2JLc$f" role="3clF45" />
      <node concept="3Tm1VV" id="5hwIp2JLc$g" role="1B3o_S" />
    </node>
    <node concept="2tJIrI" id="7fAqG1ahZU" role="jymVt" />
    <node concept="2YIFZL" id="7fAqG1ai8G" role="jymVt">
      <property role="DiZV1" value="false" />
      <property role="od$2w" value="false" />
      <property role="2aFKle" value="false" />
      <property role="TrG5h" value="findModel" />
      <node concept="37vLTG" id="7fAqG1ai8H" role="3clF46">
        <property role="TrG5h" value="module" />
        <node concept="3uibUv" id="7fAqG1aj0Z" role="1tU5fm">
          <ref role="3uigEE" to="lui2:~SModule" resolve="SModule" />
        </node>
      </node>
      <node concept="37vLTG" id="7fAqG1ai8J" role="3clF46">
        <property role="TrG5h" value="name" />
        <node concept="17QB3L" id="7fAqG1ai8K" role="1tU5fm" />
      </node>
      <node concept="3clFbS" id="7fAqG1ai8L" role="3clF47">
        <node concept="1DcWWT" id="7fAqG1ai8M" role="3cqZAp">
          <node concept="3cpWsn" id="7fAqG1ai8N" role="1Duv9x">
            <property role="TrG5h" value="target" />
            <node concept="H_c77" id="7fAqG1ai8O" role="1tU5fm" />
          </node>
          <node concept="3clFbS" id="7fAqG1ai8P" role="2LFqv$">
            <node concept="3clFbJ" id="7fAqG1ai8Q" role="3cqZAp">
              <node concept="17R0WA" id="7fAqG1ai8R" role="3clFbw">
                <node concept="2OqwBi" id="7fAqG1ai8S" role="3uHU7B">
                  <node concept="37vLTw" id="7fAqG1ai8T" role="2Oq$k0">
                    <ref role="3cqZAo" node="7fAqG1ai8N" resolve="target" />
                  </node>
                  <node concept="LkI2h" id="7fAqG1ai8U" role="2OqNvi" />
                </node>
                <node concept="37vLTw" id="7fAqG1ai8V" role="3uHU7w">
                  <ref role="3cqZAo" node="7fAqG1ai8J" resolve="name" />
                </node>
              </node>
              <node concept="3clFbS" id="7fAqG1ai8W" role="3clFbx">
                <node concept="3cpWs6" id="7fAqG1ai8X" role="3cqZAp">
                  <node concept="37vLTw" id="7fAqG1ai8Y" role="3cqZAk">
                    <ref role="3cqZAo" node="7fAqG1ai8N" resolve="target" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="7fAqG1ai8Z" role="1DdaDG">
            <node concept="37vLTw" id="7fAqG1ai91" role="2Oq$k0">
              <ref role="3cqZAo" node="7fAqG1ai8H" resolve="module" />
            </node>
            <node concept="liA8E" id="7fAqG1ai93" role="2OqNvi">
              <ref role="37wK5l" to="lui2:~SModule.getModels()" resolve="getModels" />
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="7fAqG1ai94" role="3cqZAp">
          <node concept="10Nm6u" id="7fAqG1ai95" role="3clFbG" />
        </node>
      </node>
      <node concept="H_c77" id="7fAqG1ai96" role="3clF45" />
      <node concept="3Tm1VV" id="7fAqG1ai97" role="1B3o_S" />
    </node>
    <node concept="2tJIrI" id="2_8jVv8mtqm" role="jymVt" />
    <node concept="2YIFZL" id="6ndASaeS_ln" role="jymVt">
      <property role="TrG5h" value="getFromMPS" />
      <property role="od$2w" value="false" />
      <property role="DiZV1" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="3clFbS" id="6ndASaeS_lq" role="3clF47">
        <node concept="3clFbF" id="6ndASaeSBKb" role="3cqZAp">
          <node concept="2OqwBi" id="acrA1QgTkG" role="3clFbG">
            <node concept="2YIFZM" id="acrA1QgPEd" role="2Oq$k0">
              <ref role="37wK5l" to="t4tl:~DClareMPS.instance()" resolve="instance" />
              <ref role="1Pybhc" to="t4tl:~DClareMPS" resolve="DClareMPS" />
            </node>
            <node concept="liA8E" id="acrA1QgTEd" role="2OqNvi">
              <ref role="37wK5l" to="t4tl:~DClareMPS.read(java.util.function.Supplier)" resolve="read" />
              <node concept="2ShNRf" id="acrA1QgPEe" role="37wK5m">
                <node concept="YeOm9" id="acrA1QgPEf" role="2ShVmc">
                  <node concept="1Y3b0j" id="acrA1QgPEg" role="YeSDq">
                    <property role="2bfB8j" value="true" />
                    <ref role="1Y3XeK" to="82uw:~Supplier" resolve="Supplier" />
                    <ref role="37wK5l" to="wyt6:~Object.&lt;init&gt;()" resolve="Object" />
                    <node concept="3Tm1VV" id="acrA1QgPEh" role="1B3o_S" />
                    <node concept="3clFb_" id="acrA1QgPEi" role="jymVt">
                      <property role="1EzhhJ" value="false" />
                      <property role="TrG5h" value="get" />
                      <property role="DiZV1" value="false" />
                      <property role="od$2w" value="false" />
                      <node concept="3Tm1VV" id="acrA1QgPEj" role="1B3o_S" />
                      <node concept="16syzq" id="acrA1QgPEk" role="3clF45">
                        <ref role="16sUi3" node="6ndASaeSBGc" resolve="T" />
                      </node>
                      <node concept="3clFbS" id="acrA1QgPEl" role="3clF47">
                        <node concept="3clFbF" id="acrA1QgPEm" role="3cqZAp">
                          <node concept="2OqwBi" id="acrA1QgPEn" role="3clFbG">
                            <node concept="37vLTw" id="acrA1QgPEo" role="2Oq$k0">
                              <ref role="3cqZAo" node="6ndASaeSBHo" resolve="getter" />
                            </node>
                            <node concept="1Bd96e" id="acrA1QgPEp" role="2OqNvi" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="16syzq" id="acrA1QgPEq" role="2Ghqu4">
                      <ref role="16sUi3" node="6ndASaeSBGc" resolve="T" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="6ndASaeS$yK" role="1B3o_S" />
      <node concept="16euLQ" id="6ndASaeSBGc" role="16eVyc">
        <property role="TrG5h" value="T" />
      </node>
      <node concept="16syzq" id="6ndASaeSBGP" role="3clF45">
        <ref role="16sUi3" node="6ndASaeSBGc" resolve="T" />
      </node>
      <node concept="37vLTG" id="6ndASaeSBHo" role="3clF46">
        <property role="TrG5h" value="getter" />
        <property role="3TUv4t" value="true" />
        <node concept="1ajhzC" id="6ndASaeSBHm" role="1tU5fm">
          <node concept="16syzq" id="6ndASaeSBIn" role="1ajl9A">
            <ref role="16sUi3" node="6ndASaeSBGc" resolve="T" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="1vHs6rJY_5w" role="jymVt" />
    <node concept="2YIFZL" id="1vHs6rJYCBj" role="jymVt">
      <property role="TrG5h" value="getNonObserving" />
      <node concept="3clFbS" id="1vHs6rJYCBm" role="3clF47">
        <node concept="3cpWs8" id="1vHs6rJYIO8" role="3cqZAp">
          <node concept="3cpWsn" id="1vHs6rJYIOb" role="3cpWs9">
            <property role="TrG5h" value="result" />
            <node concept="10Q1$e" id="1vHs6rJYIQR" role="1tU5fm">
              <node concept="3uibUv" id="1vHs6rJYQi4" role="10Q1$1">
                <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
              </node>
            </node>
            <node concept="2ShNRf" id="1vHs6rJYIVT" role="33vP2m">
              <node concept="3$_iS1" id="1vHs6rJYNcf" role="2ShVmc">
                <node concept="3$GHV9" id="1vHs6rJYNch" role="3$GQph">
                  <node concept="3cmrfG" id="1vHs6rJYNOf" role="3$I4v7">
                    <property role="3cmrfH" value="1" />
                  </node>
                </node>
                <node concept="3uibUv" id="1vHs6rJYS6o" role="3$_nBY">
                  <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="1vHs6rJYE4S" role="3cqZAp">
          <node concept="2OqwBi" id="1vHs6rJYE$9" role="3clFbG">
            <node concept="2YIFZM" id="1vHs6rJYEpE" role="2Oq$k0">
              <ref role="37wK5l" to="dy39:~LeafTransaction.getCurrent()" resolve="getCurrent" />
              <ref role="1Pybhc" to="dy39:~LeafTransaction" resolve="LeafTransaction" />
            </node>
            <node concept="liA8E" id="1vHs6rJYEIL" role="2OqNvi">
              <ref role="37wK5l" to="dy39:~LeafTransaction.runNonObserving(java.lang.Runnable)" resolve="runNonObserving" />
              <node concept="1bVj0M" id="1vHs6rJYNWw" role="37wK5m">
                <node concept="3clFbS" id="1vHs6rJYNWy" role="1bW5cS">
                  <node concept="3clFbF" id="1vHs6rJYO0D" role="3cqZAp">
                    <node concept="37vLTI" id="1vHs6rJYOTc" role="3clFbG">
                      <node concept="2OqwBi" id="1vHs6rJYU3Q" role="37vLTx">
                        <node concept="37vLTw" id="1vHs6rJYTYk" role="2Oq$k0">
                          <ref role="3cqZAo" node="1vHs6rJYDLQ" resolve="action" />
                        </node>
                        <node concept="1Bd96e" id="1vHs6rJYUa9" role="2OqNvi" />
                      </node>
                      <node concept="AH0OO" id="1vHs6rJYOu9" role="37vLTJ">
                        <node concept="3cmrfG" id="1vHs6rJYO_v" role="AHEQo">
                          <property role="3cmrfH" value="0" />
                        </node>
                        <node concept="37vLTw" id="1vHs6rJYO0C" role="AHHXb">
                          <ref role="3cqZAo" node="1vHs6rJYIOb" resolve="result" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="1vHs6rJYNgB" role="3cqZAp">
          <node concept="10QFUN" id="1vHs6rJYTL1" role="3cqZAk">
            <node concept="16syzq" id="1vHs6rJYTRj" role="10QFUM">
              <ref role="16sUi3" node="1vHs6rJYPan" resolve="T" />
            </node>
            <node concept="AH0OO" id="1vHs6rJYNEO" role="10QFUP">
              <node concept="3cmrfG" id="1vHs6rJYNJ$" role="AHEQo">
                <property role="3cmrfH" value="0" />
              </node>
              <node concept="37vLTw" id="1vHs6rJYNmi" role="AHHXb">
                <ref role="3cqZAo" node="1vHs6rJYIOb" resolve="result" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="1vHs6rJYBpV" role="1B3o_S" />
      <node concept="16syzq" id="1vHs6rJYPx$" role="3clF45">
        <ref role="16sUi3" node="1vHs6rJYPan" resolve="T" />
      </node>
      <node concept="37vLTG" id="1vHs6rJYDLQ" role="3clF46">
        <property role="TrG5h" value="action" />
        <node concept="1ajhzC" id="1vHs6rJYPHm" role="1tU5fm">
          <node concept="16syzq" id="1vHs6rJYPXx" role="1ajl9A">
            <ref role="16sUi3" node="1vHs6rJYPan" resolve="T" />
          </node>
        </node>
      </node>
      <node concept="16euLQ" id="1vHs6rJYPan" role="16eVyc">
        <property role="TrG5h" value="T" />
      </node>
    </node>
    <node concept="2tJIrI" id="4wJaMXe_MyE" role="jymVt" />
    <node concept="2YIFZL" id="4wJaMXe_OUl" role="jymVt">
      <property role="TrG5h" value="dCopy" />
      <property role="od$2w" value="false" />
      <property role="DiZV1" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="37vLTG" id="2cgEAjOjw8z" role="3clF46">
        <property role="TrG5h" value="ctx" />
        <node concept="3uibUv" id="rTfv3GFEqR" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="37vLTG" id="4wJaMXe_PK4" role="3clF46">
        <property role="TrG5h" value="copied" />
        <node concept="16syzq" id="GYgDz1LIhp" role="1tU5fm">
          <ref role="16sUi3" node="4wJaMXe_PHK" resolve="T" />
        </node>
      </node>
      <node concept="37vLTG" id="2cgEAjNTkFc" role="3clF46">
        <property role="TrG5h" value="id" />
        <node concept="17QB3L" id="2cgEAjNTlhs" role="1tU5fm" />
      </node>
      <node concept="3clFbS" id="4wJaMXe_OUo" role="3clF47">
        <node concept="3cpWs8" id="70QPEjRB58w" role="3cqZAp">
          <node concept="3cpWsn" id="70QPEjRB58x" role="3cpWs9">
            <property role="TrG5h" value="node" />
            <node concept="16syzq" id="70QPEjRB4yk" role="1tU5fm">
              <ref role="16sUi3" node="4wJaMXe_PHK" resolve="T" />
            </node>
            <node concept="10QFUN" id="70QPEjRB58y" role="33vP2m">
              <node concept="16syzq" id="70QPEjRB58z" role="10QFUM">
                <ref role="16sUi3" node="4wJaMXe_PHK" resolve="T" />
              </node>
              <node concept="2YIFZM" id="70QPEjRB58$" role="10QFUP">
                <ref role="1Pybhc" to="t4tl:~DCopy" resolve="DCopy" />
                <ref role="37wK5l" to="t4tl:~DCopy.of(org.modelingvalue.dclare.mps.DNode,java.lang.Object[])" resolve="of" />
                <node concept="10QFUN" id="70QPEjRB58_" role="37wK5m">
                  <node concept="3uibUv" id="70QPEjRB58A" role="10QFUM">
                    <ref role="3uigEE" to="t4tl:~DNode" resolve="DNode" />
                  </node>
                  <node concept="37vLTw" id="70QPEjRB58B" role="10QFUP">
                    <ref role="3cqZAo" node="4wJaMXe_PK4" resolve="copied" />
                  </node>
                </node>
                <node concept="2ShNRf" id="70QPEjRB58C" role="37wK5m">
                  <node concept="3g6Rrh" id="70QPEjRB58D" role="2ShVmc">
                    <node concept="37vLTw" id="70QPEjRB58E" role="3g7hyw">
                      <ref role="3cqZAo" node="2cgEAjOjw8z" resolve="ctx" />
                    </node>
                    <node concept="37vLTw" id="70QPEjRB58F" role="3g7hyw">
                      <ref role="3cqZAo" node="2cgEAjNTkFc" resolve="id" />
                    </node>
                    <node concept="3uibUv" id="70QPEjRB58G" role="3g7fb8">
                      <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="70QPEjRBrIX" role="3cqZAp">
          <node concept="3cpWsn" id="70QPEjRBrJ0" role="3cpWs9">
            <property role="TrG5h" value="name" />
            <node concept="17QB3L" id="70QPEjRBrIV" role="1tU5fm" />
            <node concept="2OqwBi" id="70QPEjRBtn_" role="33vP2m">
              <node concept="1eOMI4" id="70QPEjRBsL_" role="2Oq$k0">
                <node concept="10QFUN" id="70QPEjRBsjU" role="1eOMHV">
                  <node concept="3uibUv" id="70QPEjRBso1" role="10QFUM">
                    <ref role="3uigEE" to="t4tl:~DNode" resolve="DNode" />
                  </node>
                  <node concept="37vLTw" id="70QPEjRBrRV" role="10QFUP">
                    <ref role="3cqZAo" node="4wJaMXe_PK4" resolve="copied" />
                  </node>
                </node>
              </node>
              <node concept="liA8E" id="70QPEjRBtZz" role="2OqNvi">
                <ref role="37wK5l" to="t4tl:~DNode.getProperty(org.jetbrains.mps.openapi.language.SProperty)" resolve="getProperty" />
                <node concept="355D3s" id="70QPEjRBugI" role="37wK5m">
                  <ref role="355D3t" to="tpck:h0TrEE$" resolve="INamedConcept" />
                  <ref role="355D3u" to="tpck:h0TrG11" resolve="name" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="70QPEjRBjlo" role="3cqZAp">
          <node concept="3clFbS" id="70QPEjRBjlp" role="3clFbx">
            <node concept="3clFbF" id="70QPEjRBjlq" role="3cqZAp">
              <node concept="2OqwBi" id="70QPEjRBjlr" role="3clFbG">
                <node concept="1eOMI4" id="70QPEjRBjls" role="2Oq$k0">
                  <node concept="10QFUN" id="70QPEjRBjlt" role="1eOMHV">
                    <node concept="3uibUv" id="70QPEjRBjlu" role="10QFUM">
                      <ref role="3uigEE" to="t4tl:~DNode" resolve="DNode" />
                    </node>
                    <node concept="37vLTw" id="70QPEjRBjlv" role="10QFUP">
                      <ref role="3cqZAo" node="70QPEjRB58x" resolve="node" />
                    </node>
                  </node>
                </node>
                <node concept="liA8E" id="70QPEjRBjlw" role="2OqNvi">
                  <ref role="37wK5l" to="t4tl:~DNode.setProperty(org.jetbrains.mps.openapi.language.SProperty,java.lang.String)" resolve="setProperty" />
                  <node concept="355D3s" id="70QPEjRBjlx" role="37wK5m">
                    <ref role="355D3t" to="tpck:h0TrEE$" resolve="INamedConcept" />
                    <ref role="355D3u" to="tpck:h0TrG11" resolve="name" />
                  </node>
                  <node concept="37vLTw" id="70QPEjRBjly" role="37wK5m">
                    <ref role="3cqZAo" node="70QPEjRBrJ0" resolve="name" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3y3z36" id="70QPEjRBjlz" role="3clFbw">
            <node concept="10Nm6u" id="70QPEjRBjl$" role="3uHU7w" />
            <node concept="37vLTw" id="70QPEjRBjl_" role="3uHU7B">
              <ref role="3cqZAo" node="70QPEjRBrJ0" resolve="name" />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="5g4xL_rNa6I" role="3cqZAp">
          <node concept="37vLTw" id="70QPEjRB58H" role="3cqZAk">
            <ref role="3cqZAo" node="70QPEjRB58x" resolve="node" />
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="4wJaMXe_O7f" role="1B3o_S" />
      <node concept="16euLQ" id="4wJaMXe_PHK" role="16eVyc">
        <property role="TrG5h" value="T" />
        <node concept="3Tqbb2" id="4wJaMXe_PIZ" role="3ztrMU" />
      </node>
      <node concept="16syzq" id="4wJaMXe_PJa" role="3clF45">
        <ref role="16sUi3" node="4wJaMXe_PHK" resolve="T" />
      </node>
    </node>
    <node concept="2tJIrI" id="6ndASaeSzK_" role="jymVt" />
    <node concept="2YIFZL" id="MxZDaxdenI" role="jymVt">
      <property role="TrG5h" value="dNode" />
      <node concept="3Tm1VV" id="MxZDaxdenX" role="1B3o_S" />
      <node concept="3clFbS" id="MxZDaxdenY" role="3clF47">
        <node concept="3cpWs8" id="70QPEjRB4Nu" role="3cqZAp">
          <node concept="3cpWsn" id="70QPEjRB4Nv" role="3cpWs9">
            <property role="TrG5h" value="node" />
            <node concept="16syzq" id="70QPEjRB4DH" role="1tU5fm">
              <ref role="16sUi3" node="MxZDaxdeoH" resolve="T" />
            </node>
            <node concept="10QFUN" id="70QPEjRB4Nw" role="33vP2m">
              <node concept="16syzq" id="70QPEjRB4Nx" role="10QFUM">
                <ref role="16sUi3" node="MxZDaxdeoH" resolve="T" />
              </node>
              <node concept="2YIFZM" id="70QPEjRB4Ny" role="10QFUP">
                <ref role="1Pybhc" to="t4tl:~DNode" resolve="DNode" />
                <ref role="37wK5l" to="t4tl:~DNode.of(org.jetbrains.mps.openapi.language.SConcept,java.lang.String,java.lang.Object[])" resolve="of" />
                <node concept="37vLTw" id="70QPEjRB4Nz" role="37wK5m">
                  <ref role="3cqZAo" node="MxZDaxdf8Z" resolve="concept" />
                </node>
                <node concept="37vLTw" id="70QPEjRB4N$" role="37wK5m">
                  <ref role="3cqZAo" node="2cgEAjNTmkt" resolve="id" />
                </node>
                <node concept="37vLTw" id="70QPEjRB4N_" role="37wK5m">
                  <ref role="3cqZAo" node="2cgEAjOjnpM" resolve="ctx" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="70QPEjRB8BM" role="3cqZAp">
          <node concept="3clFbS" id="70QPEjRB8BO" role="3clFbx">
            <node concept="3clFbF" id="70QPEjRB9nq" role="3cqZAp">
              <node concept="2OqwBi" id="70QPEjRBaI5" role="3clFbG">
                <node concept="1eOMI4" id="70QPEjRBarq" role="2Oq$k0">
                  <node concept="10QFUN" id="70QPEjRBa1T" role="1eOMHV">
                    <node concept="3uibUv" id="70QPEjRBiTS" role="10QFUM">
                      <ref role="3uigEE" to="t4tl:~DNode" resolve="DNode" />
                    </node>
                    <node concept="37vLTw" id="70QPEjRB9no" role="10QFUP">
                      <ref role="3cqZAo" node="70QPEjRB4Nv" resolve="node" />
                    </node>
                  </node>
                </node>
                <node concept="liA8E" id="70QPEjRBaZz" role="2OqNvi">
                  <ref role="37wK5l" to="t4tl:~DNode.setProperty(org.jetbrains.mps.openapi.language.SProperty,java.lang.String)" resolve="setProperty" />
                  <node concept="355D3s" id="517eQlPlHkL" role="37wK5m">
                    <ref role="355D3t" to="tpck:h0TrEE$" resolve="INamedConcept" />
                    <ref role="355D3u" to="tpck:h0TrG11" resolve="name" />
                  </node>
                  <node concept="37vLTw" id="70QPEjRBb8d" role="37wK5m">
                    <ref role="3cqZAo" node="70QPEjRB4CP" resolve="name" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3y3z36" id="70QPEjRB946" role="3clFbw">
            <node concept="10Nm6u" id="70QPEjRB9ma" role="3uHU7w" />
            <node concept="37vLTw" id="70QPEjRB8Hj" role="3uHU7B">
              <ref role="3cqZAo" node="70QPEjRB4CP" resolve="name" />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="5g4xL_rNlBD" role="3cqZAp">
          <node concept="37vLTw" id="70QPEjRB4NA" role="3cqZAk">
            <ref role="3cqZAo" node="70QPEjRB4Nv" resolve="node" />
          </node>
        </node>
      </node>
      <node concept="16euLQ" id="MxZDaxdeoH" role="16eVyc">
        <property role="TrG5h" value="T" />
        <node concept="3Tqbb2" id="MxZDaxdf5R" role="3ztrMU" />
      </node>
      <node concept="16syzq" id="MxZDaxdf4t" role="3clF45">
        <ref role="16sUi3" node="MxZDaxdeoH" resolve="T" />
      </node>
      <node concept="37vLTG" id="2cgEAjOjnpM" role="3clF46">
        <property role="TrG5h" value="ctx" />
        <node concept="10Q1$e" id="rTfv3GFAhN" role="1tU5fm">
          <node concept="3uibUv" id="rTfv3GFzSN" role="10Q1$1">
            <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="MxZDaxdf8Z" role="3clF46">
        <property role="TrG5h" value="concept" />
        <node concept="3uibUv" id="2eWEc5crOhW" role="1tU5fm">
          <ref role="3uigEE" to="c17a:~SConcept" resolve="SConcept" />
        </node>
      </node>
      <node concept="37vLTG" id="2cgEAjNTmkt" role="3clF46">
        <property role="TrG5h" value="id" />
        <node concept="17QB3L" id="2cgEAjNTn2w" role="1tU5fm" />
      </node>
      <node concept="37vLTG" id="70QPEjRB4CP" role="3clF46">
        <property role="TrG5h" value="name" />
        <node concept="17QB3L" id="70QPEjRB4GS" role="1tU5fm" />
      </node>
    </node>
    <node concept="2tJIrI" id="rTfv3Hr8Xp" role="jymVt" />
    <node concept="2YIFZL" id="3nckJKR5l0H" role="jymVt">
      <property role="TrG5h" value="toNodeList" />
      <node concept="3clFbS" id="3nckJKR5l0L" role="3clF47">
        <node concept="3cpWs8" id="3nckJKR5l0M" role="3cqZAp">
          <node concept="3cpWsn" id="3nckJKR5l0N" role="3cpWs9">
            <property role="TrG5h" value="result" />
            <node concept="2I9FWS" id="3nckJKR5l0O" role="1tU5fm" />
            <node concept="2ShNRf" id="3nckJKR5l0P" role="33vP2m">
              <node concept="1pGfFk" id="3nckJKR5l0Q" role="2ShVmc">
                <ref role="37wK5l" to="33ny:~ArrayList.&lt;init&gt;(int)" resolve="ArrayList" />
                <node concept="3Tqbb2" id="3nckJKR5l0R" role="1pMfVU" />
                <node concept="3cmrfG" id="3nckJKR5l0S" role="37wK5m">
                  <property role="3cmrfH" value="1" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="3nckJKR5l0T" role="3cqZAp">
          <node concept="3clFbS" id="3nckJKR5l0U" role="3clFbx">
            <node concept="3cpWs6" id="3nckJKR5l0V" role="3cqZAp">
              <node concept="2OqwBi" id="3nckJKR5l0W" role="3cqZAk">
                <node concept="37vLTw" id="3nckJKR5l0X" role="2Oq$k0">
                  <ref role="3cqZAo" node="3nckJKR5l0N" resolve="result" />
                </node>
                <node concept="X8dFx" id="3nckJKR5l0Y" role="2OqNvi">
                  <node concept="10QFUN" id="3nckJKR5l0Z" role="25WWJ7">
                    <node concept="3uibUv" id="3nckJKR5l10" role="10QFUM">
                      <ref role="3uigEE" to="33ny:~Collection" resolve="Collection" />
                      <node concept="3Tqbb2" id="3nckJKR5l11" role="11_B2D" />
                    </node>
                    <node concept="37vLTw" id="3nckJKR5l12" role="10QFUP">
                      <ref role="3cqZAo" node="3nckJKR5l0J" resolve="value" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3eNFk2" id="3nckJKR5l13" role="3eNLev">
            <node concept="3clFbS" id="3nckJKR5l14" role="3eOfB_">
              <node concept="3clFbF" id="3nckJKR5l15" role="3cqZAp">
                <node concept="2OqwBi" id="3nckJKR5l16" role="3clFbG">
                  <node concept="37vLTw" id="3nckJKR5l17" role="2Oq$k0">
                    <ref role="3cqZAo" node="3nckJKR5l0N" resolve="result" />
                  </node>
                  <node concept="TSZUe" id="3nckJKR5l18" role="2OqNvi">
                    <node concept="10QFUN" id="3nckJKR5l19" role="25WWJ7">
                      <node concept="3Tqbb2" id="3nckJKR5l1a" role="10QFUM" />
                      <node concept="37vLTw" id="3nckJKR5l1b" role="10QFUP">
                        <ref role="3cqZAo" node="3nckJKR5l0J" resolve="value" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3y3z36" id="3nckJKR5l1c" role="3eO9$A">
              <node concept="10Nm6u" id="3nckJKR5l1d" role="3uHU7w" />
              <node concept="37vLTw" id="3nckJKR5l1e" role="3uHU7B">
                <ref role="3cqZAo" node="3nckJKR5l0J" resolve="value" />
              </node>
            </node>
          </node>
          <node concept="2ZW3vV" id="3nckJKR5l1f" role="3clFbw">
            <node concept="3uibUv" id="3nckJKR5l1g" role="2ZW6by">
              <ref role="3uigEE" to="33ny:~Collection" resolve="Collection" />
            </node>
            <node concept="37vLTw" id="3nckJKR5l1h" role="2ZW6bz">
              <ref role="3cqZAo" node="3nckJKR5l0J" resolve="value" />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="3nckJKR5l1i" role="3cqZAp">
          <node concept="37vLTw" id="3nckJKR5l1j" role="3cqZAk">
            <ref role="3cqZAo" node="3nckJKR5l0N" resolve="result" />
          </node>
        </node>
      </node>
      <node concept="2I9FWS" id="3nckJKR5l1l" role="3clF45" />
      <node concept="37vLTG" id="3nckJKR5l0J" role="3clF46">
        <property role="TrG5h" value="value" />
        <node concept="3uibUv" id="3nckJKR5l0K" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="3Tm1VV" id="3nckJKR5l1k" role="1B3o_S" />
    </node>
    <node concept="2tJIrI" id="5vtCMlZPNrW" role="jymVt" />
    <node concept="2YIFZL" id="3Qetf3dBkKx" role="jymVt">
      <property role="TrG5h" value="sClass" />
      <property role="od$2w" value="false" />
      <property role="DiZV1" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="3clFbS" id="3Qetf3dBkK$" role="3clF47">
        <node concept="3clFbF" id="3Qetf3dBlui" role="3cqZAp">
          <node concept="2YIFZM" id="3Qetf3dBlvO" role="3clFbG">
            <ref role="37wK5l" to="t4tl:~SClass.of(java.lang.Object,java.lang.String,org.modelingvalue.dclare.mps.SClass...)" resolve="of" />
            <ref role="1Pybhc" to="t4tl:~SClass" resolve="SClass" />
            <node concept="37vLTw" id="3Qetf3dBlyc" role="37wK5m">
              <ref role="3cqZAo" node="3Qetf3dBlad" resolve="classId" />
            </node>
            <node concept="37vLTw" id="3Qetf3dBlBV" role="37wK5m">
              <ref role="3cqZAo" node="3Qetf3dBlcn" resolve="name" />
            </node>
            <node concept="37vLTw" id="3Qetf3dBlFm" role="37wK5m">
              <ref role="3cqZAo" node="3Qetf3dBljs" resolve="supers" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="3Qetf3dBklf" role="1B3o_S" />
      <node concept="3uibUv" id="3Qetf3dBkJ3" role="3clF45">
        <ref role="3uigEE" to="t4tl:~SClass" resolve="SClass" />
      </node>
      <node concept="37vLTG" id="3Qetf3dBlad" role="3clF46">
        <property role="TrG5h" value="classId" />
        <node concept="3uibUv" id="3Qetf3dBlac" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="37vLTG" id="3Qetf3dBlcn" role="3clF46">
        <property role="TrG5h" value="name" />
        <node concept="17QB3L" id="3Qetf3dBloA" role="1tU5fm" />
      </node>
      <node concept="37vLTG" id="3Qetf3dBljs" role="3clF46">
        <property role="TrG5h" value="supers" />
        <node concept="10Q1$e" id="3Qetf3dBlmk" role="1tU5fm">
          <node concept="3uibUv" id="3Qetf3dBlmm" role="10Q1$1">
            <ref role="3uigEE" to="t4tl:~SClass" resolve="SClass" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="7byyZgEomtg" role="jymVt" />
    <node concept="2YIFZL" id="3Qetf3dya9w" role="jymVt">
      <property role="TrG5h" value="dObject" />
      <property role="od$2w" value="false" />
      <property role="DiZV1" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="3clFbS" id="3Qetf3dya9z" role="3clF47">
        <node concept="3clFbF" id="3Qetf3dya$d" role="3cqZAp">
          <node concept="2YIFZM" id="3Qetf3dymIp" role="3clFbG">
            <ref role="37wK5l" to="t4tl:~DClassObject.wrap(org.modelingvalue.dclare.mps.SClassObject)" resolve="wrap" />
            <ref role="1Pybhc" to="t4tl:~DClassObject" resolve="DClassObject" />
            <node concept="2ShNRf" id="3Qetf3dymIq" role="37wK5m">
              <node concept="1pGfFk" id="69ZubXXjE__" role="2ShVmc">
                <ref role="37wK5l" to="t4tl:~SClassObjectImpl.&lt;init&gt;(org.modelingvalue.dclare.mps.SClass,java.lang.Object[])" resolve="SClassObjectImpl" />
                <node concept="37vLTw" id="69ZubXXjBa$" role="37wK5m">
                  <ref role="3cqZAo" node="3Qetf3dyi_B" resolve="cls" />
                </node>
                <node concept="37vLTw" id="69ZubXXjDdj" role="37wK5m">
                  <ref role="3cqZAo" node="745HIYNJMII" resolve="identity" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="3Qetf3dy9Mh" role="1B3o_S" />
      <node concept="3uibUv" id="3vqpjyc2zvB" role="3clF45">
        <ref role="3uigEE" to="t4tl:~SClassObject" resolve="SClassObject" />
      </node>
      <node concept="37vLTG" id="3Qetf3dyi_B" role="3clF46">
        <property role="TrG5h" value="cls" />
        <property role="3TUv4t" value="true" />
        <node concept="3uibUv" id="3Qetf3dyi_A" role="1tU5fm">
          <ref role="3uigEE" to="t4tl:~SClass" resolve="SClass" />
        </node>
      </node>
      <node concept="37vLTG" id="745HIYNJMII" role="3clF46">
        <property role="TrG5h" value="identity" />
        <property role="3TUv4t" value="true" />
        <node concept="10Q1$e" id="745HIYNJMNd" role="1tU5fm">
          <node concept="3uibUv" id="745HIYNJMLW" role="10Q1$1">
            <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="7S$pNDLb5pd" role="jymVt" />
    <node concept="2YIFZL" id="7S$pNDLb3TY" role="jymVt">
      <property role="TrG5h" value="getRepository" />
      <property role="od$2w" value="false" />
      <property role="DiZV1" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="37vLTG" id="7S$pNDLb3TZ" role="3clF46">
        <property role="TrG5h" value="module" />
        <node concept="3uibUv" id="7S$pNDLb6z9" role="1tU5fm">
          <ref role="3uigEE" to="lui2:~SModule" resolve="SModule" />
        </node>
      </node>
      <node concept="3clFbS" id="7S$pNDLb3U1" role="3clF47">
        <node concept="3clFbF" id="7S$pNDLb3U2" role="3cqZAp">
          <node concept="2OqwBi" id="7KI$$uj_yWi" role="3clFbG">
            <node concept="1eOMI4" id="7KI$$uj_xQV" role="2Oq$k0">
              <node concept="10QFUN" id="7KI$$uj_xQS" role="1eOMHV">
                <node concept="3uibUv" id="7KI$$uj_xW4" role="10QFUM">
                  <ref role="3uigEE" to="t4tl:~DModule" resolve="DModule" />
                </node>
                <node concept="37vLTw" id="7KI$$uj_y7E" role="10QFUP">
                  <ref role="3cqZAo" node="7S$pNDLb3TZ" resolve="module" />
                </node>
              </node>
            </node>
            <node concept="liA8E" id="7KI$$uj_zYd" role="2OqNvi">
              <ref role="37wK5l" to="t4tl:~DModule.getRepository()" resolve="getRepository" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="7S$pNDLb3Ub" role="1B3o_S" />
      <node concept="3uibUv" id="7S$pNDLb75$" role="3clF45">
        <ref role="3uigEE" to="t4tl:~DRepository" resolve="DRepository" />
      </node>
    </node>
    <node concept="2tJIrI" id="7S$pNDL7t9v" role="jymVt" />
    <node concept="2YIFZL" id="7S$pNDL7zVA" role="jymVt">
      <property role="TrG5h" value="getModule" />
      <property role="od$2w" value="false" />
      <property role="DiZV1" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="37vLTG" id="7S$pNDL7zVB" role="3clF46">
        <property role="TrG5h" value="model" />
        <node concept="3uibUv" id="7S$pNDL7_pq" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SModel" resolve="SModel" />
        </node>
      </node>
      <node concept="3clFbS" id="7S$pNDL7zVD" role="3clF47">
        <node concept="3clFbF" id="7KI$$uj__Hf" role="3cqZAp">
          <node concept="2OqwBi" id="7KI$$uj_AK9" role="3clFbG">
            <node concept="1eOMI4" id="7KI$$uj__Hd" role="2Oq$k0">
              <node concept="10QFUN" id="7KI$$uj__Ha" role="1eOMHV">
                <node concept="3uibUv" id="7KI$$uj__HB" role="10QFUM">
                  <ref role="3uigEE" to="t4tl:~DModel" resolve="DModel" />
                </node>
                <node concept="37vLTw" id="7KI$$uj__Vw" role="10QFUP">
                  <ref role="3cqZAo" node="7S$pNDL7zVB" resolve="model" />
                </node>
              </node>
            </node>
            <node concept="liA8E" id="7KI$$uj_C7i" role="2OqNvi">
              <ref role="37wK5l" to="t4tl:~DModel.getModule()" resolve="getModule" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="7S$pNDL7zVL" role="1B3o_S" />
      <node concept="3uibUv" id="7S$pNDL7Axk" role="3clF45">
        <ref role="3uigEE" to="t4tl:~DModule" resolve="DModule" />
      </node>
    </node>
    <node concept="2tJIrI" id="7S$pNDL7yEh" role="jymVt" />
    <node concept="2YIFZL" id="7S$pNDL7wyu" role="jymVt">
      <property role="TrG5h" value="getModel" />
      <property role="od$2w" value="false" />
      <property role="DiZV1" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="37vLTG" id="7S$pNDL7xeO" role="3clF46">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="7S$pNDL7xh0" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="7S$pNDL7wyx" role="3clF47">
        <node concept="3clFbF" id="7S$pNDL7xjX" role="3cqZAp">
          <node concept="2OqwBi" id="7S$pNDL7xI9" role="3clFbG">
            <node concept="10M0yZ" id="7S$pNDL7xod" role="2Oq$k0">
              <ref role="3cqZAo" to="t4tl:~DNode.MODEL" resolve="MODEL" />
              <ref role="1PxDUh" to="t4tl:~DNode" resolve="DNode" />
            </node>
            <node concept="liA8E" id="7S$pNDL7ybr" role="2OqNvi">
              <ref role="37wK5l" to="dy39:~Getable.get(java.lang.Object)" resolve="get" />
              <node concept="10QFUN" id="7S$pNDL7yy6" role="37wK5m">
                <node concept="3uibUv" id="7S$pNDL7yBL" role="10QFUM">
                  <ref role="3uigEE" to="t4tl:~DNode" resolve="DNode" />
                </node>
                <node concept="37vLTw" id="7S$pNDL7yhO" role="10QFUP">
                  <ref role="3cqZAo" node="7S$pNDL7xeO" resolve="node" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="7S$pNDL7uvW" role="1B3o_S" />
      <node concept="3uibUv" id="7S$pNDLb79z" role="3clF45">
        <ref role="3uigEE" to="mhbf:~SModel" resolve="SModel" />
      </node>
    </node>
    <node concept="2tJIrI" id="67uyCwCOVLl" role="jymVt" />
    <node concept="2YIFZL" id="67uyCwCP1zP" role="jymVt">
      <property role="TrG5h" value="getParent" />
      <property role="od$2w" value="false" />
      <property role="DiZV1" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="37vLTG" id="67uyCwCP2su" role="3clF46">
        <property role="TrG5h" value="obj" />
        <node concept="3uibUv" id="67uyCwCP2tB" role="1tU5fm">
          <ref role="3uigEE" to="t4tl:~SClassObject" resolve="SClassObject" />
        </node>
      </node>
      <node concept="3clFbS" id="67uyCwCP1zS" role="3clF47">
        <node concept="3clFbF" id="67uyCwCP2y$" role="3cqZAp">
          <node concept="2OqwBi" id="7KI$$uj_HEK" role="3clFbG">
            <node concept="1eOMI4" id="7KI$$uj_G$c" role="2Oq$k0">
              <node concept="10QFUN" id="7KI$$uj_G$9" role="1eOMHV">
                <node concept="3uibUv" id="7KI$$uj_G$$" role="10QFUM">
                  <ref role="3uigEE" to="t4tl:~DClassObject" resolve="DClassObject" />
                </node>
                <node concept="37vLTw" id="7KI$$uj_GNx" role="10QFUP">
                  <ref role="3cqZAo" node="67uyCwCP2su" resolve="obj" />
                </node>
              </node>
            </node>
            <node concept="liA8E" id="2DAKF84NYLb" role="2OqNvi">
              <ref role="37wK5l" to="t4tl:~DObject.dObjectParent()" resolve="dObjectParent" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="67uyCwCP0IF" role="1B3o_S" />
      <node concept="3uibUv" id="67uyCwCP2oO" role="3clF45">
        <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
      </node>
    </node>
    <node concept="2tJIrI" id="3HLMRNkuEYi" role="jymVt" />
    <node concept="2YIFZL" id="3HLMRNkuJ6J" role="jymVt">
      <property role="TrG5h" value="pre" />
      <property role="od$2w" value="false" />
      <property role="DiZV1" value="false" />
      <property role="2aFKle" value="false" />
      <node concept="37vLTG" id="3HLMRNkuJKS" role="3clF46">
        <property role="TrG5h" value="supplier" />
        <property role="3TUv4t" value="true" />
        <node concept="1ajhzC" id="3HLMRNkuJM8" role="1tU5fm">
          <node concept="16syzq" id="3HLMRNkuJMH" role="1ajl9A">
            <ref role="16sUi3" node="3HLMRNkuJIW" resolve="T" />
          </node>
        </node>
      </node>
      <node concept="3clFbS" id="3HLMRNkuJ6M" role="3clF47">
        <node concept="3clFbF" id="3HLMRNkuN9V" role="3cqZAp">
          <node concept="2YIFZM" id="3HLMRNkuNg3" role="3clFbG">
            <ref role="37wK5l" to="t4tl:~DClareMPS.pre(java.util.function.Supplier)" resolve="pre" />
            <ref role="1Pybhc" to="t4tl:~DClareMPS" resolve="DClareMPS" />
            <node concept="2ShNRf" id="3HLMRNkuNkF" role="37wK5m">
              <node concept="YeOm9" id="3HLMRNkuRHf" role="2ShVmc">
                <node concept="1Y3b0j" id="3HLMRNkuRHi" role="YeSDq">
                  <property role="2bfB8j" value="true" />
                  <ref role="1Y3XeK" to="82uw:~Supplier" resolve="Supplier" />
                  <ref role="37wK5l" to="wyt6:~Object.&lt;init&gt;()" resolve="Object" />
                  <node concept="3Tm1VV" id="3HLMRNkuRHj" role="1B3o_S" />
                  <node concept="3clFb_" id="3HLMRNkuRHk" role="jymVt">
                    <property role="1EzhhJ" value="false" />
                    <property role="TrG5h" value="get" />
                    <property role="DiZV1" value="false" />
                    <property role="od$2w" value="false" />
                    <node concept="3Tm1VV" id="3HLMRNkuRHl" role="1B3o_S" />
                    <node concept="16syzq" id="3HLMRNkuRTJ" role="3clF45">
                      <ref role="16sUi3" node="3HLMRNkuJIW" resolve="T" />
                    </node>
                    <node concept="3clFbS" id="3HLMRNkuRHo" role="3clF47">
                      <node concept="3clFbF" id="3HLMRNkuRZK" role="3cqZAp">
                        <node concept="2OqwBi" id="3HLMRNkuS2b" role="3clFbG">
                          <node concept="37vLTw" id="3HLMRNkuRZJ" role="2Oq$k0">
                            <ref role="3cqZAo" node="3HLMRNkuJKS" resolve="supplier" />
                          </node>
                          <node concept="1Bd96e" id="3HLMRNkuS3H" role="2OqNvi" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="16syzq" id="3HLMRNkuRP6" role="2Ghqu4">
                    <ref role="16sUi3" node="3HLMRNkuJIW" resolve="T" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="3HLMRNkuGGP" role="1B3o_S" />
      <node concept="16euLQ" id="3HLMRNkuJIW" role="16eVyc">
        <property role="TrG5h" value="T" />
      </node>
      <node concept="16syzq" id="3HLMRNkuJJY" role="3clF45">
        <ref role="16sUi3" node="3HLMRNkuJIW" resolve="T" />
      </node>
    </node>
    <node concept="2tJIrI" id="3HLMRNkuIuJ" role="jymVt" />
    <node concept="2tJIrI" id="7byyZgEoqkH" role="jymVt" />
    <node concept="3Tm1VV" id="30fQumnG8Av" role="1B3o_S" />
  </node>
  <node concept="2ABs$o" id="rTfv3HeNOH">
    <property role="TrG5h" value="Synthetic" />
    <node concept="3Tm1VV" id="rTfv3HeNOJ" role="1B3o_S" />
  </node>
</model>

