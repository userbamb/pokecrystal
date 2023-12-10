    object_const_def
	const UNDERWATER1_POKE_BALL_1


Underwater1_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_NEWMAP, .DiveMap

.DiveMap:
	divemap CHERRYGROVE_CITY, 0, 0
	return

Underwater1item1:
	itemball KINGS_ROCK

HiddenBigpearl2:
 	hiddenitem NUGGET, EVENT_GOT_UNDERWATER_BIG_PEARL2

Underwater1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  13, LAKE_UNDERWATER, 4
	warp_event  35, 15, LAKE_UNDERWATER, 5
	warp_event  19, 3, LAKE_UNDERWATER, 6

	def_coord_events

	def_bg_events
	bg_event 13, 15, BGEVENT_ITEM, HiddenBigpearl2


	def_object_events
	object_event 13, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 1, OBJECTTYPE_ITEMBALL, 0, Underwater1item1, EVENT_GOT_UNDERWATER_HP_UP
