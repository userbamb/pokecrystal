    object_const_def
	const UNDERWATER_LAKE_POKE_BALL_1
	const UNDERWATER_LAKE_POKE_BALL_2
	const UNDERWATER_LAKE_POKE_BALL_3

	

LakeUnderwater_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_NEWMAP, .DiveMap

.DiveMap:
	divemap LAKE_OF_RAGE, 0, 0
	return

UnderwaterLakeitem1:
	itemball DRAGON_SCALE

UnderwaterLakeitem2:
	itemball HP_UP

UnderwaterLakeitem3:
	itemball PP_UP

HiddenPearl:
 	hiddenitem PP_UP, EVENT_GOT_UNDERWATER_PEARL

LakeUnderwater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  33,  5, LAKE_UNDERWATER, 2
	warp_event  35,  33, LAKE_UNDERWATER, 1
	warp_event  3, 13, ROUTE_41_UNDERWATER, 1
	warp_event  7, 33, UNDERWATER_1, 1
	warp_event  3,  27, UNDERWATER_1, 2
	warp_event  13,  1, UNDERWATER_1, 3


	def_coord_events

	def_bg_events
	bg_event 7, 6, BGEVENT_ITEM, HiddenPearl

	def_object_events
	object_event 15, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 1, OBJECTTYPE_ITEMBALL, 0, UnderwaterLakeitem2, EVENT_UNDERWATER_LAKE_ITEM1
	object_event 34, 9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 1, OBJECTTYPE_ITEMBALL, 0, UnderwaterLakeitem3, EVENT_UNDERWATER_LAKE_ITEM2
	object_event 19, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 1, OBJECTTYPE_ITEMBALL, 0, UnderwaterLakeitem1, EVENT_GOT_UNDERWATER_DRAGON_SCALE
