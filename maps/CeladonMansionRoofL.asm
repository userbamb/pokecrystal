	object_const_def
	const CELADONMANSIONROOF_ARTICUNO
	const CELADONMANSIONROOF_ZAPDOS
	const CELADONMANSIONROOF_MOLTRES

CeladonMansionRoofL_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CeladonBirdsCallback

CeladonBirdsCallback:
    checktime DAY
    iftrue .day_moltres
    checktime NITE
    iftrue .nite_zapdos
; fallthrough
 
; morn articuno
    checkevent EVENT_FOUGHT_ARTICUNO
    iftrue .none
    appear CELADONMANSIONROOF_ARTICUNO
    disappear CELADONMANSIONROOF_ZAPDOS
    disappear CELADONMANSIONROOF_MOLTRES
    endcallback
 
.day_moltres:
    checkevent EVENT_FOUGHT_MOLTRES
    iftrue .none
    disappear CELADONMANSIONROOF_ARTICUNO
    disappear CELADONMANSIONROOF_ZAPDOS
    appear CELADONMANSIONROOF_MOLTRES
    endcallback
 
.nite_zapdos:
	checkevent EVENT_FOUGHT_ZAPDOS
	iftrue .none
    disappear CELADONMANSIONROOF_ARTICUNO
    appear CELADONMANSIONROOF_ZAPDOS
    disappear CELADONMANSIONROOF_MOLTRES
    endcallback
 
.none:
    disappear CELADONMANSIONROOF_ARTICUNO
    disappear CELADONMANSIONROOF_ZAPDOS
    disappear CELADONMANSIONROOF_MOLTRES
    endcallback

Articuno:
	faceplayer
	opentext
	writetext ArticunoText
	cry ARTICUNO
	pause 15
	closetext
	setevent EVENT_FOUGHT_ARTICUNO
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon ARTICUNO, 60
	startbattle
	disappear CELADONMANSIONROOF_ARTICUNO
	reloadmapafterbattle
	end

ArticunoText:
	text "Pyaaas!"
	done

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
	disappear CELADONMANSIONROOF_ZAPDOS
	reloadmapafterbattle
	end

ZapdosText:
	text "Wyaaas!"
	done

Moltres:
	faceplayer
	opentext
	writetext MoltresText
	cry MOLTRES
	pause 15
	closetext
	setevent EVENT_FOUGHT_MOLTRES
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon MOLTRES, 60
	startbattle
	disappear CELADONMANSIONROOF_MOLTRES
	reloadmapafterbattle
	end

MoltresText:
	text "Hyaaas!"
	done

CeladonMansionRoofGraffiti:
	jumptext CeladonMansionRoofGraffitiText

CeladonMansionRoofGraffitiText:
	text "There's graffiti"
	line "on the wall…"

	para "<PLAYER> added a"
	line "moustache!"
	done

CeladonMansionRoofL_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  1, CELADON_MANSION_3F, 1
	warp_event  6,  1, CELADON_MANSION_3F, 4
	warp_event  2,  5, CELADON_MANSION_ROOF_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_LEFT, CeladonMansionRoofGraffiti

	def_object_events
	object_event 3, 1, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Articuno, EVENT_FOUGHT_ARTICUNO
    object_event 0, 8, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Zapdos, EVENT_FOUGHT_ZAPDOS
    object_event 3, 4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Moltres, EVENT_FOUGHT_MOLTRES
  