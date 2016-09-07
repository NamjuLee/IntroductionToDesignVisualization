
fn SetRenderer theRenderer =(
  theRenderer.imageSampler_type = 1
  theRenderer.filter_on  = true
  theRenderer.filter_kernel 
  theRenderer.filter_size 
  theRenderer.filter_paramA 
  theRenderer.filter_paramB 
  theRenderer.filter_paramC 

  theRenderer.colorMapping_type = 1
  theRenderer.colorMapping_darkMult = 0.7
  theRenderer.colorMapping_brightMult  = 0.5
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


fn GetRenderer renderer = ( -- function check if render installed (
for r in 1 to (rendererClass.classes).count where matchPattern ((rendererClass.classes)[r] as string) pattern:renderer do Renderers.Production = RendererClass.Classes[r]()
)	

 
--delete $
varVray = "V_Ray_Adv*"
GetRenderer varVray

sunObj = vraysun pos:(point3 0 0 0) --create sun object
targetObj = dummy pos:(point3 0 0 0) --then target
targetObj.lookat = sunObj

theInt = DaylightSystemFactory2.Create sunClass:VRaySun --quiet:true --skyClass:VRaySun
theDaylight = $Daylight* --showproperties theInt

sunObj.controller = theDaylight[1].controller

theDaylight[1].controller.solar_time.controller.value = 11.5
theDaylight[1].controller.Solar_Date.controller.value = 12
theDaylight[1].controller.Latitude = 37.772027
theDaylight[1].controller.Longitude =  -122.411299
theDaylight[1].sun.enabled = off

theRenderer=renderers.current
SetRenderer(theRenderer)

-- for exposure controller
VRayExposureControl =  VRay_Exposure_Control ()
SceneExposureControl.exposureControl = VRayExposureControl

renderSceneDialog.close() -- we need to close the window to change the size of the rendering image
renderWidth = 1920; 
renderHeight = 1080;

Plane length:5000 width:5000 pos:[0 ,0,0]
Teapot radius:27.9766 smooth:on segs:4 pos:[119.321,99.1414,0] 
Teapot radius:44.5401 smooth:on segs:4 pos:[89.5574,322.01,0]
Teapot radius:75.9926 smooth:on segs:4 pos:[-129.74,-1.66467,0] 



