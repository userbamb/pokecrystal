	object_const_def
	const SILVER_CAVE_MOLTRES


SilverCaveOutsideInside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, MoltresCallback

MoltresCallback:
	checkevent EVENT_FOUGHT_MOLTRES
	iftrue .NoAppear
	checkevent EVENT_FOUGHT_LUGIA
	iftrue .Appear
	sjump .NoAppear
.Appear:
	clearevent EVENT_APPEARS_MOLTRES
	appear SILVER_CAVE_MOLTRES
	endcallback
.NoAppear:
	disappear SILVER_CAVE_MOLTRES
	endcallback
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
	disappear SILVER_CAVE_MOLTRES
	reloadmapafterbattle
	setevent EVENT_FOUGHT_MOLTRES
	setevent EVENT_APPEARS_MOLTRES
	end

.Moltresbattled:
    setevent EVENT_FOUGHT_MOLTRES
	end

MoltresText:
	text "Myaaas!"
	done

SilverCaveOutsideInside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 16, 3, SILVER_CAVE_ITEM_ROOMS, 3

	def_coord_events

	def_bg_events

	def_object_events
    object_event 4, 14, SPRITE_MORTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, OBJECTTYPE_SCRIPT, 0, Moltres, EVENT_APPEARS_MOLTRES