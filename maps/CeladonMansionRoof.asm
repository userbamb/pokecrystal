	object_const_def
	const CELADONMANSIONROOF_FISHER
	const CELADONMANSIONROOF_ARTICUNO
	const CELADONMANSIONROOF_ZAPDOS
	const CELADONMANSIONROOF_MOLTRES

CeladonMansionRoof_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CeladonMansionArticunoCallback
    callback MAPCALLBACK_OBJECTS, CeladonMansionZapdosCallback
    callback MAPCALLBACK_OBJECTS, CeladonMansionMoltresCallback

CeladonMansionArticunoCallback:
    checkevent EVENT_GOT_ARTICUNO
	iftrue .NoAppear1
	readvar VAR_WEEKDAY
	ifequal MONDAY, .Appear1
	sjump .NoAppear1

.Appear1:
	appear CELADONMANSIONROOF_ARTICUNO
	endcallback

.NoAppear1:
	disappear CELADONMANSIONROOF_ARTICUNO
	endcallback

Articuno:
	faceplayer
	opentext
	writetext ArticunoText
	cry ARTICUNO
	pause 15
	closetext
	setevent EVENT_GOT_ARTICUNO
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon ARTICUNO, 60
	startbattle
	disappear CELADONMANSIONROOF_ARTICUNO
	reloadmapafterbattle
	end

ArticunoText:
	text "Pyaaas!"
	done

CeladonMansionZapdosCallback:
    checkevent EVENT_GOT_ZAPDOS
	iftrue .NoAppear2
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .Appear2
	sjump .NoAppear2

.Appear2:
	appear CELADONMANSIONROOF_ZAPDOS
	endcallback

.NoAppear2:
	disappear CELADONMANSIONROOF_ZAPDOS
	endcallback

Zapdos:
	faceplayer
	opentext
	writetext ZapdosText
	cry ZAPDOS
	pause 15
	closetext
	setevent EVENT_GOT_ZAPDOS
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon ZAPDOS, 60
	startbattle
	disappear CELADONMANSIONROOF_ZAPDOS
	reloadmapafterbattle
	end

ZapdosText:
	text "Tyaaas!"
	done

CeladonMansionMoltresCallback:
    checkevent EVENT_GOT_MOLTRES
	iftrue .NoAppear3
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .Appear3
	sjump .NoAppear3

.Appear3:
	appear CELADONMANSIONROOF_MOLTRES
	endcallback

.NoAppear3:
	disappear CELADONMANSIONROOF_MOLTRES
	endcallback

Moltres:
	faceplayer
	opentext
	writetext MoltresText
	cry MOLTRES
	pause 15
	closetext
	setevent EVENT_GOT_MOLTRES
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon MOLTRES, 60
	startbattle
	disappear CELADONMANSIONROOF_MOLTRES
	reloadmapafterbattle
	end

MoltresText:
	text "Nyaaas!"
	done

CeladonMansionRoofGraffiti:
	jumptext CeladonMansionRoofGraffitiText

CeladonMansionRoofGraffitiText:
	text "There's graffiti"
	line "on the wall…"

	para "<PLAYER> added a"
	line "moustache!"
	done

CeladonMansionRoof_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  1, CELADON_MANSION_3F, 1
	warp_event  6,  1, CELADON_MANSION_3F, 4
	warp_event  2,  5, CELADON_MANSION_ROOF_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_LEFT, CeladonMansionRoofGraffiti

	def_object_events
	object_event 5, 10, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Articuno, 0
    object_event 5, 10, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Zapdos, 0
	object_event 5, 10, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Moltres, 0
    