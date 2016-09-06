--NJ Namju Lee, www.njstudio.co.kr // nj.namju@gmail.com
fn MoveLocal theObj thePos = (
	in coordsys local theObj.pos = thePos
	return theObj
	) 
fn GetDuplicate theObj = (
	newObj = instance theObj
	return newObj
	)
fn GetArrayObj theObj offset = (
	objArray =  #()
	vecArray = #()
	append vecArray [-offset , -offset, 0 ]
	append vecArray [ 0 , -offset , 0 ]
	append vecArray [offset , -offset , 0 ]
	append vecArray [-offset , 0 , 0 ]
	append vecArray [0 , 0 , 0 ]
	append vecArray [offset , 0 , 0 ]
	append vecArray [-offset , offset , 0 ]
	append vecArray [0 , offset , 0 ]
	append vecArray [offset, offset , 0 ]
	for i in vecArray do( 
		print i
		c1 = GetDuplicate theObj
		c1 = MoveLocal c1 i 
		append objArray c1
		)
	return objArray
	)

-- render
fn snapCam theCamera label size:[320, 240] frames: folder:"z:\project\\" = (
	
	local fname = folder + label + "-" + theCamera.name
	local renderinWindow 
	if frames == unsupplied then(
		renderinWindow = render camera: theCamera outputFile:(fname + ".jpg") outputSize:theSize
	)else(
		renderinWindow = render camera: theCamera frameRange: #current outputFile: (fname + ".avi") outputSize: theSize
		print("Thats not right!")
	)
	close renderinWindow
)

fn GetRenderFromCameras theCameras = (
	
	for c in theCameras do(
		snapCam c  fileName folder:directory size:theSize 
	)
)


-- USER INPUTS
theOffset = 20000

directory = "C:\Users\NJ9\Desktop\\"

fileName = "Phase1"

theSize = [500,300]


-- EXE FUNCTION
cams = GetArrayObj $ theOffset
print cams
GetRenderFromCameras cams
--delete cams



