    object_const_def
	

LakeUnderwater_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_NEWMAP, .DiveMap
	callback MAPCALLBACK_NEWMAP, .DiveMap1

.DiveMap:
	divemap LAKE_OF_RAGE, 0, 0
	return

.DiveMap1:
	divemap ICE_PATH_1F, 0, 0
	return

LakeUnderwater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
    warp_event  33,  5, LAKE_UNDERWATER, 2
	warp_event  35,  33, LAKE_UNDERWATER, 1
	warp_event  3,  33, DRAGON_UNDERWATER, 1
	warp_event  3,  13, UNDERWATER_1, 1
	warp_event  13,  1, UNDERWATER_1, 2

	def_coord_events

	def_bg_events

	def_object_events
	