	object_const_def
	const CINNABAR_OLDMAP
	const EVENT_CINNABAR_1F_BALL_1
	const EVENT_CINNABAR_1F_BALL_2
	const EVENT_CINNABAR_1F_BALL_3
	const EVENT_CINNABAR_1F_BALL_4
	const EVENT_CINNABAR_1F_BALL_5


Cinnabar1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, StatuesCallback

StatuesCallback:
	checkevent EVENT_CINNABAR_1F_STATUE_1
	iffalse .skip1
	changeblock 6, 30, $53 ; fallen boulder 2
.skip1
	checkevent EVENT_CINNABAR_1F_STATUE_2
	iffalse .skip2
	changeblock 24, 36, $53 ; fallen boulder 1
.skip2
	checkevent EVENT_CINNABAR_1F_STATUE_3
	iffalse .skip3
	changeblock 42, 30, $53 ; fallen boulder 2
.skip3
	checkevent EVENT_CINNABAR_1F_STATUE_4
	iffalse .skip4
	changeblock 46, 42, $53 ; fallen boulder 2
.skip4
	checkevent EVENT_CINNABAR_1F_STATUE_5
	iffalse .skip5
	changeblock 50, 36, $3b ; door
.skip5
	endcallback

Oldmapscript:
	itemball ROOF_KEY

Ball1script:
	itemball MOON_STONE

Ball2script:
	itemball NUGGET

Ball3script:
	itemball THUNDER_STONE

Ball4script:
	itemball NORMAL_BOX

Statue1:
    opentext
	writetext StatueButtonText
	yesorno
	iffalse .notpushed
	closetext
	playsound SFX_PUSH_BUTTON
	waitsfx
	setevent EVENT_CINNABAR_1F_STATUE_1
	changeblock 6, 30, $53 ; fallen boulder 2
	refreshscreen $86
	reloadmappart
	end 

.notpushed:
	closetext
	end

Statue2:
    opentext
	writetext StatueButtonText
	yesorno
	iffalse .notpushed
	closetext
	playsound SFX_PUSH_BUTTON
	waitsfx
	setevent EVENT_CINNABAR_1F_STATUE_2
	changeblock 24, 36, $53 ; fallen boulder 1
	refreshscreen $86
	reloadmappart
	end

.notpushed:
	closetext
	end

Statue3:
    opentext
	writetext StatueButtonText
	yesorno
	iffalse .notpushed
	closetext
	playsound SFX_PUSH_BUTTON
	waitsfx
	setevent EVENT_CINNABAR_1F_STATUE_3
	changeblock 42, 30, $53 ; fallen boulder 2
	refreshscreen $86
	reloadmappart
	end

.notpushed:
	closetext
	end

Statue4:
    opentext
	writetext StatueButtonText
	yesorno
	iffalse .notpushed
	closetext
	playsound SFX_PUSH_BUTTON
	waitsfx
	setevent EVENT_CINNABAR_1F_STATUE_4
	changeblock 46, 42, $53 ; fallen boulder 2
	refreshscreen $86
	reloadmappart
	end

.notpushed:
	closetext
	end

Statue6:
    opentext
	writetext StatueButtonText
	yesorno
	iffalse .notpushed
	clearevent EVENT_CINNABAR_1F_STATUE_4
	closetext
	playsound SFX_PUSH_BUTTON
	waitsfx
	changeblock 46, 42, $30 ; fallen boulder 2
	refreshscreen $86
	reloadmappart
	end

.notpushed:
	closetext
	end


Statue7:
    opentext
	writetext StatueButtonText
	yesorno
	iffalse .notpushed
	clearevent EVENT_CINNABAR_1F_STATUE_1
	closetext
	playsound SFX_PUSH_BUTTON
	waitsfx
	changeblock 6, 30, $30 ; fallen boulder 2
	refreshscreen $86
	reloadmappart
	
	end

.notpushed:
	closetext
	end


Statue5:
	checkevent EVENT_CINNABAR_1F_STATUE_5
	iftrue .openedroom
    opentext
	writetext StatueButtonText
	yesorno
	iffalse .notpushed
	closetext
	playsound SFX_PUSH_BUTTON
	waitsfx
	checkevent EVENT_CINNABAR_1F_STATUE_4
	iffalse .reset
	checkevent EVENT_CINNABAR_1F_STATUE_3
	iffalse .reset
	checkevent EVENT_CINNABAR_1F_STATUE_2
	iffalse .reset
	checkevent EVENT_CINNABAR_1F_STATUE_1
	iffalse .reset
	setevent EVENT_CINNABAR_1F_STATUE_5
	showemote EMOTE_SHOCK, PLAYER, 15
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 50, 36, $3b ; door
	reloadmappart
	waitsfx
	end

.openedroom:
	opentext 
	writetext StatueButtonOpenText
	waitbutton
	closetext
	end

.reset:
	end

.notpushed:
	closetext
	end


StatueButtonText:
	text "A #MON statue…"

	para "There's a button"
	line "hidden here."
	para "Do you want to"
	line "push it?"
	done

StatueButtonOpenText:
	text "Some stairs app-"

	para "eared out of "
	line "nowhere!"
	done

Cinnabar1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 49, CINNABAR_UNDERWATER, 1
	warp_event 11, 49, CINNABAR_UNDERWATER, 1
	warp_event 25, 16, CINNABAR_1F, 4
	warp_event 23, 47, CINNABAR_1F, 3
	warp_event 9, 38, CINNABAR_1F, 6
	warp_event 39, 41, CINNABAR_1F, 5
	warp_event 19, 36, CINNABAR_1F, 8
	warp_event 51, 37, CINNABAR_1F, 7


	def_coord_events

	def_bg_events
	bg_event  7,  31, BGEVENT_READ, Statue1
	bg_event  25,  37, BGEVENT_READ, Statue2
	bg_event  43,  31, BGEVENT_READ, Statue3
	bg_event  47,  43, BGEVENT_READ, Statue4
	bg_event  55,  35, BGEVENT_READ, Statue5
	bg_event  41,  39, BGEVENT_READ, Statue6
	bg_event  29,  29, BGEVENT_READ, Statue7

	def_object_events
	object_event 18, 14, SPRITE_PAPER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_ITEMBALL, 0, Oldmapscript, EVENT_GOT_UNDERWATER_OLD_MAP
	object_event  5, 42, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Ball1script, EVENT_CINNABAR_1F_BALL_1
	object_event  16,  44, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Ball2script, EVENT_CINNABAR_1F_BALL_2
	object_event  38,  48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Ball3script, EVENT_CINNABAR_1F_BALL_3
	object_event  5,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Ball4script, EVENT_CINNABAR_1F_BALL_4
