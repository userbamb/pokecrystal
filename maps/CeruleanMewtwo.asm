object_const_def
    const CERULEANCAVEB1F_MEWTWO

CeruleanCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, CeruleanMewtwoCallback

CeruleanMewtwoCallback:
	checkevent EVENT_FOUGHT_MEWTWO
	iftrue .NoAppear
	appear CERULEANCAVEB1F_MEWTWO
	endcallback

.NoAppear:
	disappear CERULEANCAVEB1F_MEWTWO
	endcallback

Mewtwo:
	faceplayer
	opentext
	writetext MewtwoText
	cry MEWTWO
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEWTWO
	loadvar VAR_BATTLETYPE,
	loadwildmon MEWTWO, 90
	startbattle
	disappear CERULEANCAVEB1F_MEWTWO
	reloadmapafterbattle
	end

MewtwoText:
	text "YOU SURE?!"
	done

CeruleanCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 4, 7, CERULEAN_CAVE_1BF, 1
	

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  4, SPRITE_LUGIA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Mewtwo, EVENT_CERULEANB1F_MEWTWO
