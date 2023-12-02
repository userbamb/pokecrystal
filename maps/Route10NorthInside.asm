    object_const_def
	const ROUTE_10_NORTH_INSIDE_ZAPDOS

Route10NorthInside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, ZapdosCallback

ZapdosCallback:
	checkevent EVENT_FOUGHT_ZAPDOS
	iftrue .NoAppear
	checkevent EVENT_FOUGHT_LUGIA
	iftrue .Appear
	sjump .NoAppear
.Appear:
	clearevent EVENT_APPEARS_ZAPDOS
	appear ROUTE_10_NORTH_ZAPDOS
	endcallback
.NoAppear:
	disappear ROUTE_10_NORTH_ZAPDOS
	endcallback
Zapdos:
	faceplayer
	opentext
	writetext ZapdosText
	cry ZAPDOS
	pause 15
	closetext
	setevent EVENT_FOUGHT_ZAPDOS
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon ZAPDOS, 60
	startbattle
	disappear ROUTE_10_NORTH_ZAPDOS
	reloadmapafterbattle
	setevent EVENT_FOUGHT_ZAPDOS
	setevent EVENT_APPEARS_ZAPDOS
	end

.Zapdosbattled:
    setevent EVENT_FOUGHT_ZAPDOS
	end

ZapdosText:
	text "Wyaaas!"
	done

Route10NorthInside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  12,  7, POWER_PLANT, 3

	def_coord_events

	def_bg_events

	def_object_events
    object_event 6, 4, SPRITE_ZAPDOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_PINK, OBJECTTYPE_SCRIPT, 0, Zapdos, EVENT_APPEARS_ZAPDOS