Shader "Custom/Shader2"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM

            #pragma vertex vert // Vertex Shader : model space to screen space
            #pragma fragment frag // Fragment Shader : return each fragment color

            float4 vert(float4 v : POSITION) : SV_POSITION
            {
                float4 pos = UnityObjectToClipPos(v);
                return pos;
            }
            fixed4 frag() : SV_Target
            {
                return fixed4(1, 1, 1, 1); // White Color
            }
            ENDCG
        }
    }
    FallBack "VertexLit"
}
