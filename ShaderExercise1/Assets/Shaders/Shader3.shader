Shader "Custom/Shader3"
{
    Properties
    {

    }
    SubShader
    {
        CGPROGRAM

        // Declare vertex & fragment function name
        #pragma vertex vert
        #pragma fragment frag

        float4 vert(float4 v : POSITION) : SV_POSTION
        {
            return mul(UNITY_MATRIX_MVP, v); //model space to clip space
        }

        fixed4 frag() : SV_Target
        {
            return fixed4(1.0, 1.0, 1.0, 1.0);
        }

        ENDCG
    }
    FallBack "VertexLit"
}
