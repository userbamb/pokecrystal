	object_const_def
	

Route41Underwater_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .DiveMap
	
.DiveMap:
	divemap ROUTE_41, 0, 0
	return

Route41Underwater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 43, 7, LAKE_UNDERWATER, 3
	warp_event 9, 1, ROUTE_41_UNDERWATER, 3
	warp_event 43, 51, ROUTE_41_UNDERWATER, 2
	warp_event 31, 51, CIANWOOD_UNDERWATER, 1

	def_coord_events

	def_bg_events

	def_object_events
