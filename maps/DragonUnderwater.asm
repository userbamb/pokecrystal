    object_const_def
	

DragonUnderwater_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_NEWMAP, .DiveMap

.DiveMap:
	divemap DRAGONS_DEN_B1F, 0, 0
	return



DragonUnderwater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  27,  9, LAKE_UNDERWATER, 3

	def_coord_events

	def_bg_events

	def_object_events
	