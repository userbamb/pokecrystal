    object_const_def
	

Underwater1_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_NEWMAP, .DiveMap

.DiveMap:
	divemap ROUTE_29,  46, 8
	return



Underwater1_MapEvents:
	db 0, 0 ; filler

	def_warp_events


	def_coord_events

	def_bg_events

	def_object_events
	