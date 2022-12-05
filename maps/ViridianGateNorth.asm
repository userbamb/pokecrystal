	object_const_def
	const VIRIDIANGATENORTH_OFFICER

ViridianGateNorth_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianGateNorthOfficerScript:
	faceplayer
	opentext
	writetext ViridianGateNorthOfficerText
	waitbutton
	closetext
	end



ViridianGateNorthOfficerText:
	text "This forest is a"
	line "calm spot for"

	cont "trainers"
	done


ViridianGateNorth_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, VIRIDIAN_FOREST, 10
	warp_event  5,  0, VIRIDIAN_FOREST, 11
	warp_event  4,  7, ROUTE_2, 1
	warp_event  5,  7, ROUTE_2, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGateNorthOfficerScript, -1
