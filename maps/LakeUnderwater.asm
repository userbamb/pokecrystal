    object_const_def
	

LakeUnderwater_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_NEWMAP, .DiveMap

.DiveMap:
	divemap CHERRYGROVE_CITY, 0, 0
	return



LakeUnderwater_MapEvents:
	db 0, 0 ; filler

	def_warp_events


	def_coord_events

	def_bg_events

	def_object_events
	