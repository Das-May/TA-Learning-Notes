Shader "AP01/L10/try10.2" {
    Properties {
        [Header(Texture)]
            _MainTex    ("RGB:基础颜色 A:环境遮罩", 2D)     = "white" {}
            _NormTex	("RGB:法线贴图", 2D)                = "bump" {}
            _SpecTex    ("RGB:高光颜色 A:高光次幂", 2D)     = "gray" {}
            _EmitTex    ("RGB:环境贴图", 2d)                = "black" {}
            _Cubemap    ("RGB:环境贴图", cube)              = "_Skybox" {}
        [Header(Diffuse)]
            _MainCol    ("基本色",      Color)              = (0.5, 0.5, 0.5, 1.0)
            _EnvDiffInt ("环境漫反射强度",  Range(0, 1))    = 0.2
            _EnvUpCol   ("环境天顶颜色", Color)             = (1.0, 1.0, 1.0, 1.0)
            _EnvSideCol ("环境水平颜色", Color)             = (0.5, 0.5, 0.5, 1.0)
            _EnvDownCol ("环境地表颜色", Color)             = (0.0, 0.0, 0.0, 0.0)
        [Header(Specular)]
            _SpecPow    ("高光次幂",    Range(1, 90))       = 30
            _EnvSpecInt ("环境镜面反射强度", Range(0, 5))   = 0.2
            _FresnelPow ("菲涅尔次幂", Range(0, 5))         = 1
            _CubemapMip ("环境球Mip", Range(0, 7))          = 0
        [Header(Emission)]
            _EmitInt    ("自发光强度", range(1, 10))         = 1
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
            #include "UnityCG.cginc"
            // 追加投影相关包含文件
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            // 输入参数
            // Texture
            uniform sampler2D _MainTex;
            uniform sampler2D _NormTex;
            uniform sampler2D _SpecTex;
            uniform sampler2D _EmitTex;
            uniform samplerCUBE _Cubemap;
            // Diffuse
            uniform float3 _MainCol;
            uniform float _EnvDiffInt;
            uniform float3 _EnvUpCol;
            uniform float3 _EnvSideCol;
            uniform float3 _EnvDownCol;
            // Specular
            uniform float _SpecPow;
            uniform float _FresnelPow;
            uniform float _EnvSpecInt;
            uniform float _CubemapMip;
            // Emission
            uniform float _EmitInt;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 uv0 : TEXCOORD0;
                float4 normal : NORMAL;
                float4 tangent : TANGENT;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float3 nDirWS : TEXCOORD1;
                float3 tDirWS : TEXCOORD2;
                float3 bDirWS : TEXCOORD3;
                float4 posWS : TEXCOORD4;
                LIGHTING_COORDS(5,6)          // 投影相关
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                    o.pos = UnityObjectToClipPos( v.vertex );
                    o.uv0 = v.uv0;
                    o.nDirWS = normalize(v.normal);
                    o.tDirWS = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz);
                    o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
                    o.posWS = mul(unity_ObjectToWorld, o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                //向量准备
                float3 nDirTS = UnpackNormal(tex2D(_NormTex, i.uv0)).rgb;
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDirWS = normalize(mul(nDirTS, TBN));
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);
                float3 lDirWS = normalize(_WorldSpaceLightPos0.xyz);
                float3 hDirWS = normalize(vDirWS + lDirWS);
                float3 vrDirWS = reflect(-vDirWS, nDirWS);

                //采样纹理
                float4 var_MainTex = tex2D(_MainTex, i.uv0);
                float3 baseCol = _MainCol * var_MainTex.rgb;
                float4 var_SpecTex = tex2D(_SpecTex, i.uv0);
                float3 var_EmitTex = tex2D(_EmitTex, i.uv0).rgb;
                float3 var_Cubemap = texCUBElod(_Cubemap, float4(vrDirWS, lerp(_CubemapMip, 0.0, var_SpecTex.a))).rgb;

                //---------------

                //漫反射
                float lambert = dot(nDirWS, lDirWS);
                float halfLambert = lambert * 0.5 + 0.5;
                float3 ambient =  baseCol * halfLambert;

                //高光反射
                float blinnPhong = pow(max(0.0, dot(nDirWS, hDirWS)), _SpecPow);
                float3 specular = var_SpecTex.rgb * blinnPhong;

                //光照混合  /*出问题了*/
                float dirLighting = ambient + specular;

                //---------------

                //环境光照
                float shadow = LIGHT_ATTENUATION(i);

                //菲涅尔效应
                float fresnel = pow(max(0.0, dot(nDirWS, vDirWS)), _FresnelPow);

                //环境光遮蔽
                float upMask = nDirWS.g;
                float downMask = max(0.0, -upMask);
                float middleMask = 1.0 - upMask - downMask;
                float3 envCol = _EnvUpCol * upMask +
                                _EnvSideCol * middleMask + 
                                _EnvDownCol * downMask;
                float occlusion = var_MainTex.a;

                //环境混合
                float3 envLighting = baseCol * envCol * occlusion + var_Cubemap * fresnel * _EnvSpecInt * var_SpecTex.a;

                //---------------

                //自发光部分
                float emitInt = _EmitInt * (sin(frac(_Time.z)) * 0.5 + 0.5);
                float3 emission = var_EmitTex * emitInt;

                //----------------
                
                //返回结果
                return float4(dirLighting + envLighting + emission, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
