	object_const_def
	const ROUTE8LAVENDER_OFFICER

Route8LavenderGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route8LavenderGateScript:
	faceplayer
	opentext
	writetext Route8LavenderGateText
	waitbutton
	closetext
	end

Route8LavenderGateText:
	text "LAVENDER TOWN…"
	line "…"

	para "Some say it was"
	line "haunted…"

	para "I wonder if the"
	line "people really"
	cont "believe that."
	done

Route8LavenderGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_8, 3
	warp_event  0,  5, ROUTE_8, 4
	warp_event  9,  4, LAVENDER_TOWN, 7
	warp_event  9,  5, LAVENDER_TOWN, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route8LavenderGateScript, -1
