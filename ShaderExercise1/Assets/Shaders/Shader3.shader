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

            //float4 vert(float4 v : POSITION) : SV_POSTION
            float4 vert(a2v v) : SV_POSITION
            {
                //return mul(UNITY_MATRIX_MVP, v); //model space to clip space
                return UnityObjectToClipPos(v.vertex);
            }

            fixed4 frag() : SV_Target
            {
                return fixed4(1.0, 1.0, 1.0, 1.0);
            }

            ENDCG
        }
    }
    FallBack "VertexLit"
}
