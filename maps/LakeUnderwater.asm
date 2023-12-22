    object_const_def
	const UNDERWATER_LAKE_POKE_BALL_1
	const UNDERWATER_LAKE_POKE_BALL_2
	const UNDERWATER_LAKE_POKE_BALL_3
	const UNDERWATER_LAKE_TOTODILE
	

LakeUnderwater_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_NEWMAP, .DiveMap
	callback MAPCALLBACK_OBJECTS, TotodileCallback

.DiveMap:
	divemap LAKE_OF_RAGE, 0, 0
	return

TotodileCallback:
	checkevent EVENT_FOUGHT_TOTO
	iftrue .NoAppear
	appear UNDERWATER_LAKE_TOTODILE 
	endcallback

.NoAppear:
	disappear UNDERWATER_LAKE_TOTODILE 
	endcallback

Totodile:
	faceplayer
	opentext
	showemote EMOTE_SHOCK, UNDERWATER_LAKE_TOTODILE, 15
	writetext TotoText
	cry TOTODILE
	pause 15
	closetext
	setevent EVENT_FOUGHT_TOTO
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon TOTODILE, 7
	startbattle
	disappear UNDERWATER_LAKE_TOTODILE
	reloadmapafterbattle
	end

TotodileText:
	text "Wow! That's a"
	line "TOTODILE!"
	done

TotoText:
	text "To-to-to-dile!"
	done

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
	object_event 15, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnderwaterLakeitem2, EVENT_UNDERWATER_LAKE_ITEM1
	object_event 34, 9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnderwaterLakeitem3, EVENT_UNDERWATER_LAKE_ITEM2
	object_event 19, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnderwaterLakeitem1, EVENT_GOT_UNDERWATER_DRAGON_SCALE
	object_event 30, 13, SPRITE_TOTO, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Totodile, EVENT_UNDER_TOTO
