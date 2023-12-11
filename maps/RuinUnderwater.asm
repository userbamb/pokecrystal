    object_const_def
	

RuinUnderwater_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_NEWMAP, .DiveMap

.DiveMap:
	divemap RUINS_OF_ALPH_OUTSIDE, 0, 0
	return



RuinUnderwater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
    warp_event  15,  27, UNDERWATER_LABI, 1 ;1ST ROOM

	def_coord_events

	def_bg_events

	def_object_events
	