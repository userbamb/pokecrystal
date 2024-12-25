    object_const_def
	const SAFARIZONENORTH_MEW
	const SAFARIZONENORTH_POKE_BALL1
	const SAFARIZONENORTH_POKE_BALL2

SafariZoneNorth_MapScripts:
    def_scene_scripts
    
	def_callbacks
    callback MAPCALLBACK_OBJECTS, MewFirstSafariZoneCallback

MewFirstSafariZoneCallback:
    checkevent EVENT_SAFARI_ZONE_MEW_SCARED
	iftrue .NoAppear
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .Appear
.NoAppear:
	disappear SAFARIZONENORTH_MEW
	endcallback

.Appear:
	readmem wMewPosition
	ifequal  1, .PositionOne
	ifequal  2, .PositionTwo
	ifequal  3, .PositionThree
	ifequal  4, .PositionFour
	ifequal  5, .PositionFive
	ifequal  6, .PositionSix
	ifequal  7, .PositionSeven
	ifequal  8, .PositionEight
	ifequal  9, .PositionNine
	ifequal 10, .PositionTen
	endcallback

.PositionOne:
	moveobject SAFARIZONENORTH_MEW, 5, 10
	appear SAFARIZONENORTH_MEW
	endcallback

.PositionTwo:
	moveobject SAFARIZONENORTH_MEW, 15, 25
	appear SAFARIZONENORTH_MEW
	endcallback

.PositionThree:
	moveobject SAFARIZONENORTH_MEW, 20, 6
	appear SAFARIZONENORTH_MEW
	endcallback

.PositionFour:
	moveobject SAFARIZONENORTH_MEW, 28, 22
	appear SAFARIZONENORTH_MEW
	endcallback

.PositionFive:
	moveobject SAFARIZONENORTH_MEW, 18, 13
	appear SAFARIZONENORTH_MEW
	endcallback

.PositionSix:
	moveobject SAFARIZONENORTH_MEW, 7, 16
	appear SAFARIZONENORTH_MEW
	endcallback

.PositionSeven:
	moveobject SAFARIZONENORTH_MEW, 14, 4
	appear SAFARIZONENORTH_MEW
	endcallback

.PositionEight:
	moveobject SAFARIZONENORTH_MEW, 11, 17
	appear SAFARIZONENORTH_MEW
	endcallback

.PositionNine:
	moveobject SAFARIZONENORTH_MEW, 4, 10
	appear SAFARIZONENORTH_MEW
	endcallback

.PositionTen:
	moveobject SAFARIZONENORTH_MEW, 2, 2
	appear SAFARIZONENORTH_MEW
	endcallback

MewFoundScript:
	readmem wMewPosition
	ifequal  1, .Position1
	ifequal  2, .Position2
	ifequal  3, .Position3
	ifequal  4, .Position4
	ifequal  5, .Position5
	ifequal  6, .Position6
	ifequal  7, .Position7
	ifequal  8, .Position8
	ifequal  9, .Position9
	ifequal 10, .Position10

.Position1:
	faceplayer
	opentext
	writetext Text_Mew
	promptbutton
	showemote EMOTE_SHOCK, SAFARIZONENORTH_MEW, 10
	writetext Text_waaaa
	cry MEW
	waitbutton
	closetext
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 15, 25
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 2
	end

.Position2:
	readvar VAR_FACING
	ifequal DOWN, .Position2_Down
	scall .CryAndCheckFacingGood
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 20, 6
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 3
	end

.Position2_Down:
    scall .CryAndCheckFacingGood
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 11, 17
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 8
	end

.Position3:
	scall .CryAndCheckFacingGood
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 28, 22
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 4
	end

.Position4:
    readvar VAR_FACING
	ifequal UP, .Position4_Up
    scall .CryAndCheckFacingGood
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 18, 13
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 5
	end

.Position4_Up:
    scall .CryAndCheckFacingBad
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 20, 6
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 3
	end

.Position5:
	readvar VAR_FACING
	ifequal UP, .Position5_Up
	ifequal LEFT, .Position5_Left
	ifequal RIGHT, .Position5_Right
	scall .CryAndCheckFacingGood
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 24, 35
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 6
	end

.Position5_Left:
    scall .CryAndCheckFacingGood
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 14, 4
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 7
	end

.Position5_Up:
.Position5_Right:
    scall .CryAndCheckFacingBad
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 28, 22
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 4
	end

.Position6:
	readvar VAR_FACING
	ifequal RIGHT, .Position6_Right
	scall .CryAndCheckFacingGood
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 14, 4
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 7
	end

.Position6_Right:
    scall .CryAndCheckFacingBad
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 18, 13
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 5
	end

.Position7:
	scall .CryAndCheckFacingGood
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 11, 17
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 8
	end

.Position8:
	readvar VAR_FACING
	ifequal UP, .Position8_Up
	ifequal LEFT, .Position8_Left
	ifequal RIGHT, .Position8_Right
	scall .CryAndCheckFacingGood
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 4, 10
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 9
	end

.Position8_Right:
    scall .CryAndCheckFacingBad
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 28, 22
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 4
	end

.Position8_Up:
.Position8_Left:
    scall .CryAndCheckFacingBad
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 15, 25
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 2
	end

.Position9:
	readvar VAR_FACING
	ifequal DOWN, .Position9_Down
	ifequal RIGHT, .Position9_Right
	ifequal LEFT, .Position9_Left
	scall .CryAndCheckFacingGood
	applymovement SAFARIZONENORTH_MEW, MewMovementdx
	moveobject SAFARIZONENORTH_MEW, 2, 2
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 10
	end

.Position9_Right:
.Position9_Left:
.Position9_Down:
    scall .CryAndCheckFacingBad
	applymovement SAFARIZONENORTH_MEW, MewMovement
	moveobject SAFARIZONENORTH_MEW, 15, 25
	disappear SAFARIZONENORTH_MEW
	appear SAFARIZONENORTH_MEW
	loadmem wMewPosition, 2
	end

.Position10:
	faceplayer
	opentext
	writetext Text_Qwaaaa
	cry MEW
	showemote EMOTE_HEART, SAFARIZONENORTH_MEW, 20
	pause 5
	closetext
	setevent EVENT_SAFARI_ZONE_MEW_SCARED
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon MEW, 30
	startbattle
	disappear SAFARIZONENORTH_MEW
	reloadmapafterbattle
	end

.CryAndCheckFacingGood:
	faceplayer
	opentext
	showemote EMOTE_HAPPY, SAFARIZONENORTH_MEW, 15
	writetext Text_ywaaaa
	cry PARAS
	waitbutton
	closetext
	end

.CryAndCheckFacingBad:
	faceplayer
	opentext
	showemote EMOTE_SAD, SAFARIZONENORTH_MEW, 15
	writetext Text_waaaa
	cry MEWTWO
	waitbutton
	closetext
	end

MewMovementdx:
	set_sliding
	fast_jump_step UP
	fast_jump_step UP
	fast_jump_step UP
	fast_jump_step UP
	remove_sliding
	step_end

MewMovement:
	step_end

SafariZoneNorthAreaSign:
	jumptext SafariZoneNorthAreaSignText

SafariZoneNorthRestHouseSign:
	jumptext SafariZoneNorthRestHouseSignText

SafariZoneNorthTrainerTips1Sign:
	jumptext SafariZoneNorthTrainerTips1SignText

SafariZoneNorthTrainerTips2Sign:
	jumptext SafariZoneNorthTrainerTips2SignText

SafariZoneNorthRareCandy:
	itemball RARE_CANDY

SafariZoneNorthProtein:
	itemball PROTEIN

SafariZoneNorthHiddenLuckyPunch:
    hiddenitem LUCKY_PUNCH, EVENT_SAFARI_ZONE_NORTH_HIDDEN_LUCKY_PUNCH

SafariZoneNorthAreaSignText:
	text "Safari Zone"
	line "North Area"
	done

SafariZoneNorthRestHouseSignText:
	text "Rest House"
	done

SafariZoneNorthTrainerTips1SignText:
	text "Trainer Tips"

	para "Moves of the same"
	line "type can be"
	cont "physical, special,"
	cont "or status-based."
	done

SafariZoneNorthTrainerTips2SignText:
	text "Trainer Tips"

	para "#mon hide in"
	line "tall grass!"

	para "Zigzag through"
	line "grassy areas to"
	cont "flush them out."
	done

Text_Mew:
	text "It's like a"
	line "mirage!"
	done

Text_ywaaaa:
    text "MEW: Mew!"
	done

Text_waaaa:
	text "MEW: Mew..."
	done

Text_Qwaaaa:
    text "MEW: MEEW!"
	done

SafariZoneNorth_MapEvents:
	db 0, 0; filler

    def_warp_events
	warp_event 29, 26, SAFARI_ZONE_EAST, 3
	warp_event 29, 27, SAFARI_ZONE_EAST, 4
	warp_event 4, 31, SAFARI_ZONE_HUB, 5
	warp_event 5, 31, SAFARI_ZONE_HUB, 6
	warp_event 14, 31, SAFARI_ZONE_HUB, 7
	warp_event 15, 31, SAFARI_ZONE_HUB, 8

    def_coord_events
    
	def_bg_events
	bg_event 13, 23, BGEVENT_ITEM, SafariZoneNorthHiddenLuckyPunch
	bg_event 9, 27, BGEVENT_READ, SafariZoneNorthAreaSign
	bg_event 24, 20, BGEVENT_READ, SafariZoneNorthTrainerTips1Sign
	bg_event 13, 29, BGEVENT_READ, SafariZoneNorthTrainerTips2Sign
	
	def_object_events
	object_event 5, 10, SPRITE_MEW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MewFoundScript, EVENT_SAFARI_ZONE_NORTH_MEW
	object_event 18, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneNorthRareCandy, EVENT_SAFARI_ZONE_NORTH_RARE_CANDY
	object_event 11, 3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneNorthProtein, EVENT_SAFARI_ZONE_NORTH_PROTEIN
