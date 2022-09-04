// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:7603,x:34391,y:33603,varname:node_7603,prsc:2|emission-7706-OUT;n:type:ShaderForge.SFN_ViewVector,id:4355,x:31644,y:32733,varname:node_4355,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6648,x:31840,y:32664,varname:node_6648,prsc:2|A-4355-OUT,B-8519-OUT;n:type:ShaderForge.SFN_Vector1,id:8519,x:31660,y:32918,varname:node_8519,prsc:2,v1:-1;n:type:ShaderForge.SFN_Reflect,id:7465,x:32059,y:32664,varname:node_7465,prsc:2|A-6648-OUT,B-835-XYZ;n:type:ShaderForge.SFN_Cubemap,id:4516,x:32369,y:32668,ptovrint:False,ptlb:环境贴图,ptin:_,cmnt:环境映射,varname:node_4516,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,cube:d51cd34544212c54fad1d1ed41ff1d59,pvfc:0|DIR-7465-OUT,MIP-5205-OUT;n:type:ShaderForge.SFN_Slider,id:5205,x:32035,y:32815,ptovrint:False,ptlb:粗糙度1,ptin:_1,varname:node_5205,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:7;n:type:ShaderForge.SFN_Dot,id:6634,x:32074,y:32997,varname:node_6634,prsc:2,dt:0|A-4355-OUT,B-835-XYZ;n:type:ShaderForge.SFN_Multiply,id:7157,x:32269,y:32997,varname:node_7157,prsc:2|A-6634-OUT,B-8519-OUT;n:type:ShaderForge.SFN_Add,id:8616,x:32443,y:32997,varname:node_8616,prsc:2|A-7157-OUT,B-5059-OUT;n:type:ShaderForge.SFN_Vector1,id:5059,x:32269,y:33131,varname:node_5059,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:9223,x:32908,y:32831,varname:node_9223,prsc:2|A-4516-RGB,B-1971-OUT;n:type:ShaderForge.SFN_Power,id:1971,x:32737,y:33014,cmnt:菲涅尔效应,varname:node_1971,prsc:2|VAL-8616-OUT,EXP-2057-OUT;n:type:ShaderForge.SFN_Slider,id:2057,x:32413,y:33153,ptovrint:False,ptlb:f系数,ptin:_f,varname:node_2057,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.680505,max:5;n:type:ShaderForge.SFN_Transform,id:835,x:31621,y:33098,varname:node_835,prsc:2,tffrom:2,tfto:0|IN-5910-RGB;n:type:ShaderForge.SFN_Tex2d,id:5910,x:31441,y:33098,ptovrint:False,ptlb:node_5910,ptin:_node_5910,varname:node_5910,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:630f164e44edb4d848a0fc4d010cfb42,ntxv:2,isnm:False;n:type:ShaderForge.SFN_LightVector,id:122,x:31669,y:33500,varname:node_122,prsc:2;n:type:ShaderForge.SFN_Dot,id:9348,x:32222,y:33269,varname:node_9348,prsc:2,dt:0|A-835-XYZ,B-122-OUT;n:type:ShaderForge.SFN_Multiply,id:5844,x:33145,y:32831,varname:node_5844,prsc:2|A-9223-OUT,B-4931-OUT;n:type:ShaderForge.SFN_Slider,id:4931,x:32890,y:33014,ptovrint:False,ptlb:反射率111,ptin:_111,varname:node_4931,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:5963,x:32390,y:33361,cmnt: 漫反射,varname:node_5963,prsc:2|A-9348-OUT,B-1720-RGB;n:type:ShaderForge.SFN_Color,id:1720,x:32222,y:33456,ptovrint:False,ptlb:basecolor,ptin:_basecolor,varname:node_1720,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7264151,c2:0.3248309,c3:0.3248309,c4:1;n:type:ShaderForge.SFN_Reflect,id:4643,x:31997,y:33661,varname:node_4643,prsc:2|A-122-OUT,B-835-XYZ;n:type:ShaderForge.SFN_Add,id:3287,x:33059,y:33508,varname:node_3287,prsc:2|A-920-OUT,B-2097-OUT;n:type:ShaderForge.SFN_Clamp01,id:8055,x:32445,y:33640,varname:node_8055,prsc:2|IN-7422-OUT;n:type:ShaderForge.SFN_Power,id:2097,x:32711,y:33661,cmnt: 高光反射 冯模型,varname:node_2097,prsc:2|VAL-8055-OUT,EXP-5058-OUT;n:type:ShaderForge.SFN_Slider,id:5058,x:32312,y:33823,ptovrint:False,ptlb:node_5058,ptin:_node_5058,varname:node_5058,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:42.56522,max:90;n:type:ShaderForge.SFN_Multiply,id:6239,x:32717,y:33394,varname:node_6239,prsc:2|A-5872-OUT,B-1556-OUT;n:type:ShaderForge.SFN_Vector1,id:1556,x:32517,y:33546,varname:node_1556,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:920,x:32872,y:33394,varname:node_920,prsc:2|A-6239-OUT,B-1556-OUT;n:type:ShaderForge.SFN_Clamp01,id:5872,x:32553,y:33394,varname:node_5872,prsc:2|IN-5963-OUT;n:type:ShaderForge.SFN_Dot,id:7422,x:32222,y:33640,varname:node_7422,prsc:2,dt:0|A-4355-OUT,B-4643-OUT;n:type:ShaderForge.SFN_ComponentMask,id:3712,x:31952,y:34115,varname:node_3712,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-835-XYZ;n:type:ShaderForge.SFN_Vector1,id:8480,x:31755,y:34347,varname:node_8480,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:4340,x:31769,y:34643,varname:node_4340,prsc:2,v1:-1;n:type:ShaderForge.SFN_Color,id:8302,x:32379,y:33946,ptovrint:False,ptlb:node_8302,ptin:_node_8302,varname:node_8302,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.404984,c2:0.9056604,c3:0.5031458,c4:1;n:type:ShaderForge.SFN_Multiply,id:1143,x:32529,y:34090,cmnt: 上部环境光,varname:node_1143,prsc:2|A-8302-RGB,B-7167-OUT;n:type:ShaderForge.SFN_Multiply,id:5120,x:32529,y:34332,varname:node_5120,prsc:2|A-8439-RGB,B-3890-OUT;n:type:ShaderForge.SFN_Color,id:8439,x:32380,y:34205,ptovrint:False,ptlb:node_8439,ptin:_node_8439,varname:node_8439,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8490566,c2:0.1794232,c3:0.1794232,c4:1;n:type:ShaderForge.SFN_Multiply,id:4917,x:32541,y:34610,varname:node_4917,prsc:2|A-4441-RGB,B-3369-OUT;n:type:ShaderForge.SFN_Color,id:4441,x:32385,y:34479,ptovrint:False,ptlb:node_4441,ptin:_node_4441,varname:node_4441,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.148487,c2:0.1735118,c3:0.8113208,c4:1;n:type:ShaderForge.SFN_Add,id:4710,x:32706,y:34233,varname:node_4710,prsc:2|A-1143-OUT,B-5120-OUT,C-4917-OUT;n:type:ShaderForge.SFN_Multiply,id:8564,x:31967,y:34624,varname:node_8564,prsc:2|A-3712-OUT,B-4340-OUT;n:type:ShaderForge.SFN_Subtract,id:5648,x:31952,y:34347,varname:node_5648,prsc:2|A-8480-OUT,B-3712-OUT;n:type:ShaderForge.SFN_Clamp01,id:7167,x:32176,y:34115,varname:node_7167,prsc:2|IN-3712-OUT;n:type:ShaderForge.SFN_Clamp01,id:3369,x:32191,y:34624,varname:node_3369,prsc:2|IN-8564-OUT;n:type:ShaderForge.SFN_Subtract,id:1407,x:32114,y:34347,varname:node_1407,prsc:2|A-5648-OUT,B-8564-OUT;n:type:ShaderForge.SFN_Clamp01,id:3890,x:32277,y:34347,varname:node_3890,prsc:2|IN-1407-OUT;n:type:ShaderForge.SFN_Multiply,id:7106,x:33003,y:34242,varname:node_7106,prsc:2|A-4710-OUT,B-347-OUT;n:type:ShaderForge.SFN_Slider,id:347,x:32691,y:34419,ptovrint:False,ptlb:node_347,ptin:_node_347,cmnt: 环境光强度,varname:node_347,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Tex2d,id:6347,x:33525,y:33821,ptovrint:False,ptlb:node_6347,ptin:_node_6347,varname:node_6347,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:eabfa8d88fe328f4b952fb81f530c4a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:6912,x:33827,y:34030,varname:node_6912,prsc:2|A-6347-RGB,B-9520-OUT;n:type:ShaderForge.SFN_Color,id:8498,x:33346,y:33295,ptovrint:False,ptlb:node_8498,ptin:_node_8498,varname:node_8498,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:9420,x:33515,y:33496,varname:node_9420,prsc:2|A-8498-RGB,B-3287-OUT;n:type:ShaderForge.SFN_Multiply,id:4732,x:33724,y:33513,varname:node_4732,prsc:2|A-2401-OUT,B-9420-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:2401,x:33531,y:33279,varname:node_2401,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8177,x:33175,y:34225,varname:node_8177,prsc:2|A-1720-RGB,B-7106-OUT;n:type:ShaderForge.SFN_Add,id:9520,x:33445,y:34122,varname:node_9520,prsc:2|A-5844-OUT,B-8177-OUT;n:type:ShaderForge.SFN_Add,id:7706,x:34032,y:33732,varname:node_7706,prsc:2|A-4732-OUT,B-6912-OUT;proporder:4516-5205-2057-5910-4931-1720-5058-8302-8439-4441-347-6347-8498;pass:END;sub:END;*/

Shader "AP01/L10/try10.1" {
    Properties {
        _ ("环境贴图", Cube) = "_Skybox" {}
        _1 ("粗糙度1", Range(0, 7)) = 0
        _f ("f系数", Range(0, 5)) = 1.680505
        _node_5910 ("node_5910", 2D) = "black" {}
        _111 ("反射率111", Range(0, 1)) = 1
        _basecolor ("basecolor", Color) = (0.7264151,0.3248309,0.3248309,1)
        _node_5058 ("node_5058", Range(0, 90)) = 42.56522
        _node_8302 ("node_8302", Color) = (0.404984,0.9056604,0.5031458,1)
        _node_8439 ("node_8439", Color) = (0.8490566,0.1794232,0.1794232,1)
        _node_4441 ("node_4441", Color) = (0.148487,0.1735118,0.8113208,1)
        _node_347 ("node_347", Range(0, 1)) = 1
        _node_6347 ("node_6347", 2D) = "white" {}
        _node_8498 ("node_8498", Color) = (1,1,1,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform samplerCUBE _;
            uniform sampler2D _node_5910; uniform float4 _node_5910_ST;
            uniform sampler2D _node_6347; uniform float4 _node_6347_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _1)
                UNITY_DEFINE_INSTANCED_PROP( float, _f)
                UNITY_DEFINE_INSTANCED_PROP( float, _111)
                UNITY_DEFINE_INSTANCED_PROP( float4, _basecolor)
                UNITY_DEFINE_INSTANCED_PROP( float, _node_5058)
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_8302)
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_8439)
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_4441)
                UNITY_DEFINE_INSTANCED_PROP( float, _node_347)
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_8498)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
////// Emissive:
                float4 _node_8498_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_8498 );
                float4 _node_5910_var = tex2D(_node_5910,TRANSFORM_TEX(i.uv0, _node_5910));
                float3 node_835 = mul( _node_5910_var.rgb, tangentTransform ).xyz;
                float4 _basecolor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _basecolor );
                float node_1556 = 0.5;
                float _node_5058_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_5058 );
                float4 _node_6347_var = tex2D(_node_6347,TRANSFORM_TEX(i.uv0, _node_6347));
                float node_8519 = (-1.0);
                float _1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _1 );
                float _f_var = UNITY_ACCESS_INSTANCED_PROP( Props, _f );
                float _111_var = UNITY_ACCESS_INSTANCED_PROP( Props, _111 );
                float4 _node_8302_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_8302 );
                float node_3712 = node_835.rgb.g;
                float4 _node_8439_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_8439 );
                float node_8564 = (node_3712*(-1.0));
                float4 _node_4441_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_4441 );
                float _node_347_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_347 ); //  环境光强度
                float3 emissive = ((attenuation*(_node_8498_var.rgb*(((saturate((dot(node_835.rgb,lightDirection)*_basecolor_var.rgb))*node_1556)+node_1556)+pow(saturate(dot(viewDirection,reflect(lightDirection,node_835.rgb))),_node_5058_var))))+(_node_6347_var.rgb*(((texCUBElod(_,float4(reflect((viewDirection*node_8519),node_835.rgb),_1_var)).rgb*pow(((dot(viewDirection,node_835.rgb)*node_8519)+1.0),_f_var))*_111_var)+(_basecolor_var.rgb*(((_node_8302_var.rgb*saturate(node_3712))+(_node_8439_var.rgb*saturate(((1.0-node_3712)-node_8564)))+(_node_4441_var.rgb*saturate(node_8564)))*_node_347_var)))));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform samplerCUBE _;
            uniform sampler2D _node_5910; uniform float4 _node_5910_ST;
            uniform sampler2D _node_6347; uniform float4 _node_6347_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _1)
                UNITY_DEFINE_INSTANCED_PROP( float, _f)
                UNITY_DEFINE_INSTANCED_PROP( float, _111)
                UNITY_DEFINE_INSTANCED_PROP( float4, _basecolor)
                UNITY_DEFINE_INSTANCED_PROP( float, _node_5058)
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_8302)
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_8439)
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_4441)
                UNITY_DEFINE_INSTANCED_PROP( float, _node_347)
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_8498)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float3 finalColor = 0;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
