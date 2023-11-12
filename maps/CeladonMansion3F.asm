	object_const_def
	const CELADONMANSION3F_COOLTRAINER_M
	const CELADONMANSION3F_GYM_GUIDE
	const CELADONMANSION3F_SUPER_NERD
	const CELADONMANSION3F_FISHER

CeladonMansion3F_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_TILES, CeladonMansionRoofKeyCallback

CeladonMansionRoofKeyCallback:
	checkevent EVENT_USED_ROOF_KEY
	iffalse .LockRoofDoor
	endcallback

.LockRoofDoor:
	changeblock 0, 0, $3a ; locked door
	endcallback

RoofDoorScript::
	opentext
	checkevent EVENT_USED_ROOF_KEY
	iftrue .Open
	checkitem ROOF_KEY
	iftrue .Unlock
	writetext RoofDoorsLockedText
	waitbutton
	closetext
	end

.Unlock:
	playsound SFX_TRANSACTION
	writetext RoofKeyOpenedDoorText
	waitbutton
	closetext
	changeblock 0, 0, $15 ; unlocked door
	reloadmappart
	closetext
	setevent EVENT_USED_ROOF_KEY
	end

.Open:
	writetext GoldenrodUndergroundTheDoorIsOpenText
	waitbutton
	closetext
	end

GameFreakGameDesignerScript:
	faceplayer
	opentext
	writetext GameFreakGameDesignerText
	readvar VAR_DEXCAUGHT
	ifgreater NUM_POKEMON - 2 - 1, .CompletedPokedex ; ignore Mew and Celebi
	waitbutton
	closetext
	end

.CompletedPokedex:
	promptbutton
	writetext GameFreakGameDesignerCompletedPokedexText
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	writetext GameFreakGameDesignerPauseForDiplomaText
	promptbutton
	special Diploma
	writetext GameFreakGameDesignerAfterDiplomaText
	waitbutton
	closetext
	loadmem wLevelCap, 100
	setevent EVENT_ENABLE_DIPLOMA_PRINTING
	end

GameFreakGraphicArtistScript:
	faceplayer
	opentext
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftrue .CanPrintDiploma
	writetext GameFreakGraphicArtistText
	waitbutton
	closetext
	end

.CanPrintDiploma:
	writetext GameFreakGraphicArtistPrintDiplomaText
	yesorno
	iffalse .Refused
	special PrintDiploma
	closetext
	end

.Refused:
	writetext GameFreakGraphicArtistRefusedText
	waitbutton
	closetext
	end

.CancelPrinting: ; unreferenced
	writetext GameFreakGraphicArtistErrorText
	waitbutton
	closetext
	end

GameFreakProgrammerScript:
	faceplayer
	opentext
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftrue .wowdex
	writetext GameFreakProgrammerText
	waitbutton
	closetext
	end

.wowdex:
	writetext GameFreakProgrammerPrintDiplomaText
	waitbutton
	verbosegiveitem ITEM_88
	iffalse .BagFull
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end

GameFreakCharacterDesignerScript:
	faceplayer
	opentext
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftrue .wowdexi
	writetext GameFreakCharacterDesignerText
	waitbutton
	closetext
	end

.wowdexi:
	writetext GameFreakCharacterPrintDiplomaText
	waitbutton
	verbosegiveitem ITEM_78
	iffalse .BagFulll
	waitbutton
	closetext
	end

.BagFulll:
	closetext
	end

CeladonMansion3FDevRoomSign:
	jumptext CeladonMansion3FDevRoomSignText

CeladonMansion3FDrawing:
	jumptext CeladonMansion3FDrawingText

CeladonMansion3FGameProgram:
	jumptext CeladonMansion3FGameProgramText

CeladonMansion3FReferenceMaterial:
	jumptext CeladonMansion3FReferenceMaterialText

GameFreakGameDesignerText:
	text "Is that right?"

	para "I'm the GAME"
	line "DESIGNER!"

	para "Filling up your"
	line "#DEX is tough,"
	cont "but don't give up!"
	done

GameFreakGameDesignerCompletedPokedexText:
	text "Wow! Excellent!"
	line "You completed your"
	cont "#DEX!"

	para "Congratulations!"
	done

GameFreakGameDesignerPauseForDiplomaText:
	text "…"
	done

RoofDoorsLockedText:
    text "The roof is not"
	line "accessible."
	done

RoofKeyOpenedDoorText:
    text "The door opened!"
	done

GameFreakGameDesignerAfterDiplomaText:
	text "The GRAPHIC ARTIST"
	line "will print out a"
	cont "DIPLOMA for you."

	para "You should go show"
	line "it off to anyone"
	cont "in this room!"


	done

GameFreakGraphicArtistText:
	text "I'm the GRAPHIC"
	line "ARTIST."

	para "I drew you!"
	done

GameFreakGraphicArtistPrintDiplomaText:
	text "I'm the GRAPHIC"
	line "ARTIST."

	para "Oh, you completed"
	line "your #DEX?"

	para "Want me to print"
	line "out your DIPLOMA?"
	done

GameFreakGraphicArtistRefusedText:
	text "Give me a shout if"
	line "you want your"
	cont "DIPLOMA printed."
	done

GameFreakGraphicArtistErrorText:
	text "Something's wrong."
	line "I'll have to can-"
	cont "cel printing."
	done

GameFreakProgrammerText:
	text "Who, me? I'm the"
	line "PROGRAMMER."

	para "Play the slot"
	line "machines!"
	done

GameFreakProgrammerPrintDiplomaText:
    text "Since you completed"
	line "your #DEX."

	para "You can have"
	line "this item!"
	done

GameFreakCharacterDesignerText:
	text "Aren't the TWINS"
	line "adorable?"

	para "JASMINE's pretty"
	line "too."

	para "Oh, I love them!"
	done

GameFreakCharacterPrintDiplomaText:
    text "Since you completed"
	line "your #DEX."

	para "You can have"
	line "this item!"
	done

CeladonMansion3FDevRoomSignText:
	text "GAME FREAK"
	line "DEVELOPMENT ROOM"
	done

CeladonMansion3FDrawingText:
	text "It's a detailed"
	line "drawing of a"
	cont "pretty girl."
	done

CeladonMansion3FGameProgramText:
	text "It's the game"
	line "program. Messing"

	para "with it could put"
	line "a bug in the game!"
	done

CeladonMansion3FReferenceMaterialText:
	text "It's crammed with"
	line "reference materi-"
	cont "als. There's even"
	cont "a # DOLL."
	done

CeladonMansion3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, CELADON_MANSION_ROOFL, 1
	warp_event  1,  0, CELADON_MANSION_2F, 2
	warp_event  6,  0, CELADON_MANSION_2F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  0, BGEVENT_READ, RoofDoorScript
	bg_event  5,  8, BGEVENT_UP, CeladonMansion3FDevRoomSign
	bg_event  4,  3, BGEVENT_UP, CeladonMansion3FDrawing
	bg_event  1,  6, BGEVENT_UP, CeladonMansion3FGameProgram
	bg_event  1,  3, BGEVENT_UP, CeladonMansion3FReferenceMaterial

	def_object_events
	object_event  3,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakGameDesignerScript, -1
	object_event  3,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakGraphicArtistScript, -1
	object_event  0,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakProgrammerScript, -1
	object_event  0,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakCharacterDesignerScript, -1
