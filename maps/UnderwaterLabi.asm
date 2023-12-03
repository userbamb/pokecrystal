    object_const_def
	

UnderwaterLabi_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_NEWMAP, .DiveMap

.DiveMap:
	divemap CHERRYGROVE_CITY, 0, 0
	return



UnderwaterLabi_MapEvents:
	db 0, 0 ; filler

	def_warp_events
    warp_event  31,  3, RUIN_UNDERWATER, 1 ;1ST ROOM
	warp_event  29,  11, UNDERWATER_LABI, 5
	warp_event  25,  11, UNDERWATER_LABI, 13
;2ND ROOM
	warp_event  41,  7, UNDERWATER_LABI, 10
	warp_event  43,  5, UNDERWATER_LABI, 2
	warp_event  47,  5, UNDERWATER_LABI, 17
	warp_event  49,  7, UNDERWATER_LABI, 15
	warp_event  55,  7, UNDERWATER_LABI, 12
;3RD ROOM
	warp_event  9,  31, UNDERWATER_LABI, 22
	warp_event  23,  27, UNDERWATER_LABI, 4  ;10
	warp_event  37,  19, UNDERWATER_LABI, 21
	warp_event  51,  15, UNDERWATER_LABI, 8
;4TH ROOM
	warp_event  43,  27, UNDERWATER_LABI, 3
	warp_event  47,  31, UNDERWATER_LABI, 16
;5TH ROOM
	warp_event  55,  39, UNDERWATER_LABI, 7
	warp_event  57,  39, UNDERWATER_LABI, 14
	warp_event  55,  57, UNDERWATER_LABI, 6
;6TH ROOM
	warp_event  15,  45, UNDERWATER_LABI, 23
	warp_event  25,  37, UNDERWATER_LABI, 24
	warp_event  19,  45, UNDERWATER_LABI, 15  ;20

;7TH ROOM
	warp_event  7,  21, UNDERWATER_LABI, 11
	warp_event  13,  17, UNDERWATER_LABI, 9
	warp_event  7,  17, UNDERWATER_LABI, 18

;8th ROOM
	warp_event  13,  9, UNDERWATER_LABI, 19
	warp_event  7,  9, UNDERWATER_LABI, 26
;FOSSIL ROOM
	warp_event  5,  41, UNDERWATER_LABI, 25

	def_coord_events

	def_bg_events

	def_object_events
	