// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/Shader3"
{
    Properties
    {

    }
    SubShader
    {
        Pass
        {
            CGPROGRAM

            // Declare vertex & fragment function name
            #pragma vertex vert
            #pragma fragment frag

            // GET Model Data (Texture coordinate & Normal direction for each vertex)        
            struct a2v // Application to Vertex Shader
            {
                //Type Name   : Semantic
                float4 vertex : POSITION; // vertex coordinate in model space
                float3 normal : NORMAL; // Use normal to calculate light
                float4 texcoord : TEXCOORD0; // Use texture coordinate to access texture
            };
            
            // Declare vertex shader output 
            struct v2f
            {
                float4 pos : SV_POSITION; // vertex coordinate in Clip space 
                fixed3 color : COLOR0; // Store color infomation
            };

            //float4 vert(float4 v : POSITION) : SV_POSTION
            //float4 vert(a2v v) : SV_POSITION
            v2f vert(a2v v)
            {
                v2f output; // Declare output struct
                output.pos = UnityObjectToClipPos(v.vertex);
                output.color = v.normal * 0.5 + fixed3(0.5, 0.5, 0.5);
                return output;
                //return mul(UNITY_MATRIX_MVP, v); //model space to clip space
                //return UnityObjectToClipPos(v.vertex);
            }

            fixed4 frag(v2f i) : SV_Target
            {
                //return fixed4(1.0, 1.0, 1.0, 1.0);
                return fixed4(i.color, 1.0); // i.color to screen
            }

            ENDCG
        }
    }
    FallBack "VertexLit"
}
