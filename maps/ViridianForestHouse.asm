    object_const_def
	const VIRIDIANFOREST_LADY
    const VIRIDIANFOREST_MON1
    const VIRIDIANFOREST_MON2
    const VIRIDIANFOREST_MON3

ViridianForestHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianForestLadyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BULBASAUR
	iffalse .GiveBulbasaur
	writetext LadyBasicText
	waitbutton
	closetext
	end

.GiveBulbasaur:
	writetext LadyTakeBulbasaurText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext PlayerReceivedBulbasaurText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BULBASAUR, 5
	special GiveBulbasaur
	setevent EVENT_GOT_BULBASAUR
	writetext LadyBasicText
	waitbutton
	closetext
	end

.PartyFull:
	writetext ViridianForestPartyFullText
	waitbutton
	closetext
	end


ViridianForestMon1Script:
	opentext
	writetext ViridianForestMon1Text
	cry ODDISH
	waitbutton
	closetext
	end

ViridianForestMon2Script:
	opentext
	writetext ViridianForestMon2Text
	cry BUTTERFREE
	waitbutton
	closetext
	end

ViridianForestMon3Script:
	opentext
	writetext ViridianForestMon3Text
	cry PIKACHU
	waitbutton
	closetext
	end

LadyTakeBulbasaurText:
    text "How did you get"
	line "here?!"

	para "…I built this hou-"
	line "se to take care of"
	cont "the #MON…"

	para "Would you help me"
	line "me with this one?"

	para "Destiny brought"
	line "you here, and I"

	para "don't have much"
	line "resources left."

	para "Please take it"
	line "with you!"
	done

PlayerReceivedBulbasaurText:
	text "<PLAYER> received"
	line "BULBASAUR."
	done

LadyBasicText:
    text "<PLAYER>, take"
	line "care!"
	done

ViridianForestPartyFullText:
    text "Please! It needs"
	line "your help!"
	done

ViridianForestMon1Text:
    text "ODDISH: I-ish?"
	done

ViridianForestMon2Text:
    text "BUTTERFREE: Free!"
	done 
	
ViridianForestMon3Text:
    text "PIKACHU: Pika!"
	done

ViridianForestHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, VIRIDIAN_FOREST, 4
	warp_event  5,  7, VIRIDIAN_FOREST, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianForestLadyScript, -1
	object_event  8,  5, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianForestMon1Script, -1
	object_event  4,  2, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ViridianForestMon2Script, -1
	object_event  2,  5, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianForestMon3Script, -1
