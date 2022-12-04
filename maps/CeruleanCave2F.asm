object_const_def
	const CERULEANCAVE2F_POKE_BALL1
    const CERULEANCAVE2F_ROCK1
	const CERULEANCAVE2F_ROCK2
	const CERULEANCAVE2F_ROCK3
	const CERULEANCAVE2F_ROCK4
	const CERULEANCAVE2F_POKE_BALL2
	const CERULEANCAVE2F_POKE_BALL3
	const CERULEANCAVE2F_POKE_BALL4

CeruleanCave2F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCave2FPotion:
	itemball POTION

CeruleanCave2FFullHeal:
	itemball FULL_HEAL

CeruleanCave2FHyperPotion:
	itemball HYPER_POTION

CeruleanCave2FDireHit:
	itemball DIRE_HIT

CeruleanCave2FRock:
	jumpstd SmashRockScript


CeruleanCave2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 19, 17, CERULEAN_CAVE_1F, 4
	warp_event  5,  7, CERULEAN_CAVE_1F, 2
	warp_event  7,  9, CERULEAN_CAVE_1F, 3
	warp_event  3, 15, CERULEAN_CAVE_1F, 5
	warp_event  9,  5, CERULEAN_CAVE_1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FPotion, EVENT_CERULEAN_CAVE_2F_POTION
	object_event 33, 21, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
	object_event 31, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
	object_event  6, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
	object_event  3, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
	object_event  5,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FFullHeal, EVENT_CERULEAN_CAVE_2F_FULL_HEAL
	object_event 34,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FHyperPotion, EVENT_CERULEAN_CAVE_2F_HYPER_POTION
	object_event 27, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FDireHit, EVENT_CERULEAN_CAVE_2F_DIRE_HIT
