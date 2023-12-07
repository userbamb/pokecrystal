	object_const_def
	const CELADONMANSION1F_GRANNY
	const CELADONMANSION1F_GROWLITHE1
	const CELADONMANSION1F_CLEFAIRY
	const CELADONMANSION1F_GROWLITHE2
	const CELADONMANSION1F_CHAR

CeladonMansion1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansionManager:
    faceplayer
	opentext
	checkevent EVENT_BEAT_ERIKA
	iftrue .Charmander
	writetext CeladonMansionManagerText
	promptbutton
	closetext
	end
    
.Charmander:
	opentext
	checkevent EVENT_GOT_CHARMANDER
	iffalse .GiveCharmander
	writetext CeladonMansionManagerText
	waitbutton
	closetext
	end 
	
.GiveCharmander:


    writetext GiveCharmanderBad1Text
	waitbutton
	cry CHARMANDER
	showemote EMOTE_HAPPY, CELADONMANSION1F_CHAR, 15
	applymovement CELADONMANSION1F_CHAR, Charmovement

	showemote EMOTE_QUESTION, CELADONMANSION1F_GRANNY, 15
	applymovement CELADONMANSION1F_GRANNY, Grannymovement
	writetext GiveCharmanderBad2Text
	waitbutton
	faceplayer
	writetext GiveCharmanderBad3Text
	yesorno
	iffalse .saidno
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	disappear CELADONMANSION1F_CHAR
	writetext PlayerReceivedCharmanderText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CHARMANDER, 5
	special GiveCharmander
	setevent EVENT_GOT_CHARMANDER
	waitbutton
	closetext
	end

.saidno:
	applymovement CELADONMANSION1F_GRANNY, Grannymovement
	writetext CharmanderPartyno
	waitbutton
	closetext
	end
.PartyFull:
	writetext CharmanderPartyFullText
	waitbutton
	closetext
	end


GiveCharmanderBad1Text:
    text "You beat ERIKA?"
	line "That's wonderful!"
	done

GiveCharmanderBad2Text:
	text "What, CHARMANDER?"
	line "Do you want to go"

	cont "with <PLAYER>?"
	done

GiveCharmanderBad3Text:
	text "What do you say?"
	line "Would you like to"

	para "take care of this"
	line "CHARMANDER?"
	done

Grannymovement:
	turn_head LEFT
	step_end

Charmovement:
	set_sliding
	jump_step UP
	jump_step DOWN
	remove_sliding
	step_end

PlayerReceivedCharmanderText:
	text "<PLAYER> received"
	line "CHARMANDER!"
	done

CharmanderPartyno:
 	text "Maybe next time,"
	line "CHARMANDER!"
	done

CharmanderPartyFullText:
    text "Your party is"
	line "full, <PLAYER>!"
	done

CeladonMansion1FMeowth:
	opentext
	writetext CeladonMansion1FMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

CeladonMansion1FClefairy:
	opentext
	writetext CeladonMansion1FClefairyText
	cry CLEFAIRY
	waitbutton
	closetext
	end

CharmanderScript:
	opentext
	writetext CeladonMansion1FCharmanderFText
	cry CHARMANDER
	waitbutton
	closetext
	end
CeladonMansion1FNidoranF:
	opentext
	writetext CeladonMansion1FNidoranFText
	cry NIDORAN_F
	waitbutton
	closetext
	end

CeladonMansionManagersSuiteSign:
	jumptext CeladonMansionManagersSuiteSignText

CeladonMansion1FBookshelf:
	jumpstd PictureBookshelfScript

CeladonMansionManagerText:
	text "My dear #MON"
	line "keep me company,"

	para "so I don't ever"
	line "feel lonely…"

	para "MEOWTH even brings"
	line "money home."
	done

CeladonMansion1FMeowthText:
	text "MEOWTH: Meow!"
	done

CeladonMansion1FClefairyText:
	text "CLEFAIRY: Clef"
	line "cleff!"
	done

CeladonMansion1FCharmanderFText:
	text "CHARMANDER: Char-"
	line "CHARR!"
	done

CeladonMansion1FNidoranFText:
	text "NIDORAN: Kya"
	line "kyaoo!"
	done

CeladonMansionManagersSuiteSignText:
	text "CELADON MANSION"
	line "MANAGER'S SUITE"
	done

CeladonMansion1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  9, CELADON_CITY, 2
	warp_event  7,  9, CELADON_CITY, 2
	warp_event  3,  0, CELADON_CITY, 3
	warp_event  0,  0, CELADON_MANSION_2F, 1
	warp_event  7,  0, CELADON_MANSION_2F, 4

	def_coord_events

	def_bg_events
	bg_event  5,  8, BGEVENT_UP, CeladonMansionManagersSuiteSign
	bg_event  0,  3, BGEVENT_READ, CeladonMansion1FBookshelf
	bg_event  2,  3, BGEVENT_READ, CeladonMansion1FBookshelf

	def_object_events
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansionManager, -1
	object_event  2,  6, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FMeowth, -1
	object_event  3,  4, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FClefairy, -1
	object_event  4,  4, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FNidoranF, -1
	object_event  0,  5, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CharmanderScript, EVENT_GOT_CHARMANDER
