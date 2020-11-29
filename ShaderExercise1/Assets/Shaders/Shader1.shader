Shader "Custom/Shader1" 
{
	Properties
	{
		_Color ("Color", Color) = (1, 1, 1, 1) // RGBA
		_Vector("Vector", Vector) = (1, 2, 3, 4) // XYZW
		_Int("Int", Int) = 201129 // Interger
		_Float("Float", Float) = 4.5
		_Range("Range", Range(1, 10)) = 5
		_2D("Texture", 2D) = "white" {} // picture
		_Cube("Cube", Cube) = "white" {} 
		_3D("Texture", 3D) = "black" {}
	}
	SubShader
	{
		Pass
		{
			// Write CG (Shader Language)
			CGPROGRAM

			ENDCG
		}
	}

	Fallback "VertexLit"

}