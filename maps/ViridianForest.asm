object_const_def
	const ViridianForest_POKE_BALL1
	const ViridianForest_POKE_BALL2
	const ViridianForest_POKE_BALL3
	const ViridianForest_POKE_BALL4

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

ViridianForestHiddenLuckyLeaf:
	hiddenitem LUCKY_LEAF, EVENT_VIRIDIAN_FOUND_LUCKY_LEAF

ViridianForestHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_VIRIDIAN_FOREST_HIDDEN_SUPER_POTION

ViridianForestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VIRIDIAN_FOREST_HIDDEN_FULL_HEAL

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
	warp_event  1,  5, ROUTE_34_VIRIDIAN_FOREST_GATE, 3
	warp_event 17, 49, VIRIDIAN_FOREST_AZALEA_GATE, 1
	warp_event 16, 49, VIRIDIAN_FOREST_AZALEA_GATE, 2
	warp_event  3, 33, VIRIDIAN_FOREST_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 19, 45, BGEVENT_READ, ViridianForestSignpost
	bg_event 11,  7, BGEVENT_ITEM, ViridianForestHiddenLuckyLeaf
	bg_event 31, 15, BGEVENT_ITEM, ViridianForestHiddenSuperPotion
	bg_event  7, 34, BGEVENT_ITEM, ViridianForestHiddenFullHeal

	def_object_events
	object_event 31, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestRevive, EVENT_VIRIDIAN_FOREST_REVIVE
	object_event  6, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestXAttack, EVENT_VIRIDIAN_FOREST_X_ATTACK
	object_event 29, 47, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestAntidote, EVENT_VIRIDIAN_FOREST_ANTIDOTE
	object_event 22,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestEther, EVENT_VIRIDIAN_FOREST_ETHER
