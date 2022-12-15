	object_const_def

CeladonMansionRoofR_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansionRoofRGraffiti:
	jumptext CeladonMansionRoofRGraffitiText

CeladonMansionRoofRGraffitiText:
	text "There's graffiti"
	line "on the wall…"

	para "<PLAYER> added a"
	line "moustache!"
	done

CeladonMansionRoofR_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  1, CELADON_MANSION_3F, 1
	warp_event  6,  1, CELADON_MANSION_3F, 4
	warp_event  2,  5, CELADON_MANSION_ROOF_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_LEFT, CeladonMansionRoofRGraffiti

	def_object_events
