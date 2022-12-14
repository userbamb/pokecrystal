	object_const_def
	const CELADONMANSIONROOF_FISHER
	const CELADONMANSIONROOF_ARTICUNO
	const CELADONMANSIONROOF_ZAPDOS
	const CELADONMANSIONROOF_MOLTRES

CeladonMansionRoof_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CeladonMansionArticunoCallback

CeladonMansionArticunoCallback:
	checkevent EVENT_FOUGHT_ARTICUNO
	iftrue .NoAppear
	appear CELADONMANSIONROOF_ARTICUNO 
	endcallback

.NoAppear:
	disappear CELADONMANSIONROOF_ARTICUNO
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
	loadwildmon ARTICUNO, 10
	startbattle
	disappear CELADONMANSIONROOF_ARTICUNO
	reloadmapafterbattle
	end

ArticunoText:
	text "Pyaaas!"
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
	object_event 4, 4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Articuno, EVENT_CELADON_MANSION_ROOF_ARTICUNO
  