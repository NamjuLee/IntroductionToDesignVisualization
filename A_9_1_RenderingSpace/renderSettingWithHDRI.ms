
fn SetRenderer theRenderer =(
  theRenderer.imageSampler_type = 1
  theRenderer.filter_on  = true
  theRenderer.filter_kernel 
  theRenderer.filter_size 
  theRenderer.filter_paramA 
  theRenderer.filter_paramB 
  theRenderer.filter_paramC 

  theRenderer.colorMapping_type = 6
  theRenderer.colorMapping_darkMult = 0.85
  theRenderer.colorMapping_brightMult  = 0.91
  theRenderer.colorMapping_gamma = 2.2
  theRenderer.colorMapping_affectBackground 
  theRenderer.colorMapping_clampOutput 
  theRenderer.colorMapping_clampLevel 
  theRenderer.colorMapping_subpixel 
  theRenderer.colorMapping_adaptationOnly 
  theRenderer.colorMapping_linearWorkflow 
  
	--environment
	theRenderer.environment_gi_on = true
    theRenderer.environment_gi_color
    theRenderer.environment_gi_color_multiplier

    theRenderer.environment_rr_on
	theRenderer.environment_rr_color
	theRenderer.environment_rr_color_multiplier
  
  -- GI panel
  --gi_ui_view = renderer.gi_ui_view 
  theRenderer.gi_on = true
  theRenderer.gi_refractCaustics 
  theRenderer.gi_reflectCaustics 
  theRenderer.gi_primary_type = 0
  theRenderer.gi_primary_multiplier 
  theRenderer.gi_secondary_type = 2
  theRenderer.gi_secondary_multiplier 
  theRenderer.gi_saturation 
  theRenderer.gi_contrast 
  theRenderer.gi_contrast_base 
  theRenderer.gi_saveMapsPerFrame 
  theRenderer.gi_ao_on 
  theRenderer.gi_ao_amount 
  theRenderer.gi_ao_radius 
  theRenderer.gi_ao_subdivs 
  theRenderer.gi_rayDistanceOn 
  theRenderer.gi_rayDistance 

  theRenderer.gi_irradmap_minRate = -3
  theRenderer.gi_irradmap_maxRate = -3
  theRenderer.gi_irradmap_subdivs = 30
)

fn AppendVrayHDRIToEnvironment = (
	varyHdri = VRayHDRI ()
	--varyHdri.gamma = 2.2
	varyHdri.HDRIMapName =  getOpenFileName types:"HDRI(*.hdr)|*.hdr|All files|*.*|"
	varyHdri.maptype = 2
	environmentMap = varyHdri
	)

fn checkRender nSearch = (-- function check if render installed (
	theRenderer = for obj in RendererClass.classes where (matchPattern (obj as string) pattern:nSearch) collect obj -- check if the name in nSearch variable exist

	
	if theRenderer.count == 1 then (renderers.current = theRenderer[1]())
	else (messageBox "render not installed")
)	

--delete $
varVray = "V_Ray_Adv*"
checkRender varVray

theRenderer=renderers.current
SetRenderer(theRenderer)
AppendVrayHDRIToEnvironment();

renderSceneDialog.close() -- we need to close the window to change the size of the rendering image
renderWidth = 1920; 
renderHeight = 1080;

-- for exposure controller
Plane length:5000 width:5000 pos:[0 ,0,0]
Teapot radius:27.9766 smooth:on segs:4 pos:[119.321,99.1414,0] 
Teapot radius:44.5401 smooth:on segs:4 pos:[89.5574,322.01,0]
Teapot radius:75.9926 smooth:on segs:4 pos:[-129.74,-1.66467,0] 



