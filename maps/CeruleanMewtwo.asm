    object_const_def
    const CERULEANMEWTWO_MEWTWO

CeruleanMewtwo_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, CeruleanMewtwoCallback

CeruleanMewtwoCallback:
	checkevent EVENT_FOUGHT_MEWTWO
	iftrue .NoAppear
	appear CERULEANMEWTWO_MEWTWO 
	endcallback

.NoAppear:
	disappear CERULEANMEWTWO_MEWTWO
	endcallback

Mewtwo:
	faceplayer
	opentext
	writetext MewtwoText
	cry MEWTWO
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEWTWO
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon FURRET, 10
	startbattle
	disappear CERULEANMEWTWO_MEWTWO
	reloadmapafterbattle
	end

MewtwoText:
	text "MEEEEWWW!"
	done

CeruleanMewtwo_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, CERULEAN_CAVE_B1F, 1
	

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  4, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Mewtwo, EVENT_CERULEANB1F_MEWTWO
