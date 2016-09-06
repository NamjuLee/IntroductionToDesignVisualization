
fn GetVrayMat reflecVal glossVal RefracVal =(
	reflecVal = reflecVal * 255;
	RefracVal = RefracVal * 255;
	
	mat = VRayMtl ()
	mat.Reflection = color reflecVal reflecVal reflecVal
	mat.reflection_glossiness = glossVal
	mat.Refraction = color RefracVal RefracVal RefracVal
	mat.reflection_fresnel =  false;
	
	return mat
)

fn GetMaterialSpace =(
	for j in 0 to 1 by 0.1  do (
		for i in 1 to 0 by -0.1  do (
			theTeapot = Teapot();
			theTeapot.radius = 3
			theTeapot.material = GetVrayMat j  i  0
			theTeapot.position = [-i * 100 , j* 100, 0]

		)
	  )
  )
  
  

  GetMaterialSpace();