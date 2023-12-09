	object_const_def

Cinnabar1F_MapScripts:
	def_scene_scripts

	def_callbacks

Cinnabar1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 49, CINNABAR_UNDERWATER, 1
	warp_event 11, 49, CINNABAR_UNDERWATER, 1
	warp_event 25, 16, CINNABAR_1F, 4
	warp_event 23, 47, CINNABAR_1F, 3
	warp_event 19, 36, CINNABAR_UNDERWATER, 5
	warp_event 9, 38, CINNABAR_UNDERWATER, 3

	def_coord_events

	def_bg_events

	def_object_events
