	object_const_def
	

CianwoodUnderwater_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .DiveMap
	
.DiveMap:
	divemap CIANWOOD_CITY, 0, 0
	return

CianwoodUnderwater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23, 1, ROUTE_41_UNDERWATER, 4

	def_coord_events

	def_bg_events

	def_object_events
