object_const_def
	const CERULEANCAVE1F_POKE_BALL1
    const CERULEANCAVE1F_ROCK1
	const CERULEANCAVE1F_ROCK2
	const CERULEANCAVE1F_ROCK3
	const CERULEANCAVE1F_ROCK4
	const CERULEANCAVE1F_POKE_BALL2
	const CERULEANCAVE1F_POKE_BALL3
	const CERULEANCAVE1F_POKE_BALL4

CeruleanCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCave1FPotion:
	itemball POTION

CeruleanCave1FFullHeal:
	itemball FULL_HEAL

CeruleanCave1FHyperPotion:
	itemball HYPER_POTION

CeruleanCave1FDireHit:
	itemball DIRE_HIT

CeruleanCave1FRock:
	jumpstd SmashRockScript


CeruleanCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 19, 17, CERULEAN_CAVE_2F, 1
	warp_event  5,  7, CERULEAN_CAVE_2F, 2
	warp_event  7,  9, CERULEAN_CAVE_2F, 3
	warp_event 25,  9, CERULEAN_CAVE_2F, 4
	warp_event  3, 15, CERULEAN_CAVE_2F, 5
	warp_event  3, 11, CERULEAN_CAVE_1BF, 1
	warp_event 31, 25, ROUTE_4, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FPotion, EVENT_CERULEAN_CAVE_1F_POTION
	object_event 24, 20, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave1FRock, -1
	object_event 23, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave1FRock, -1
	object_event 18, 20, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave1FRock, -1
	object_event  8, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave1FRock, -1
	object_event 20, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FFullHeal, EVENT_CERULEAN_CAVE_1F_FULL_HEAL
	object_event 34,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FHyperPotion, EVENT_CERULEAN_CAVE_1F_HYPER_POTION
	object_event 27, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FDireHit, EVENT_CERULEAN_CAVE_1F_DIRE_HIT
