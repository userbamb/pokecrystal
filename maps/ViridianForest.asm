    object_const_def
	const ViridianForest_POKE_BALL1

ViridianForest_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianForestRevive:
	itemball REVIVE

ViridianForestXAttack:
	itemball X_ATTACK

ViridianForestAntidote:
	itemball ANTIDOTE

ViridianForestEther:
	itemball ETHER

ViridianForestSignpost:
	jumptext ViridianForestSignpostText


ViridianForestSignpostText:
	text "VIRIDIAN FOREST is"
	line "so overgrown with"

	para "trees that you"
	line "can't see the sky."

	para "Please watch out"
	line "for items that may"
	cont "have been dropped."
	done


ViridianForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events 
	warp_event  1,  5, VIRIDIAN_GATE_NORTH, 3
	warp_event 17, 49, VIRIDIAN_GATE_SOUTH, 4
	warp_event 16, 49, VIRIDIAN_GATE_SOUTH, 3
	warp_event  3, 33, VIRIDIAN_FOREST_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 19, 45, BGEVENT_READ, ViridianForestSignpost

	def_object_events
	object_event 31, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestRevive, EVENT_VIRIDIAN_FOREST_REVIVE
	