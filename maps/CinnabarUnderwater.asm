	object_const_def
	

CinnabarUnderwater_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .DiveMap
	
.DiveMap:
	divemap CINNABAR_ISLAND, 0, 0
	return

CinnabarUnderwater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 5, 9, CINNABAR_1F, 1

	def_coord_events

	def_bg_events

	def_object_events
