    object_const_def
	const LUCKYSPOT_LADY
    const LUCKYSPOT_MON1
    const LUCKYSPOT_MON2
    const LUCKYSPOT_MON3

LuckySpotHouse_MapScripts:
	def_scene_scripts

	def_callbacks

LuckySpotLadyScript:
	faceplayer
	opentext
	writetext TerusamaText
	waitbutton
	verbosegiveitem ITEM_78
	iffalse .BagFull
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end


LuckySpotMon1Script:
	opentext
	writetext LuckySpotMon1Text
	cry POLIWAG
	waitbutton
	closetext
	end

LuckySpotMon2Script:
	opentext
	writetext LuckySpotMon2Text
	cry POLIWAG
	waitbutton
	closetext
	end

LuckySpotMon3Script:
    special FadeOutPalettes
	pause 10
	special FadeInPalettes
	cry POLIWAG
	opentext
	writetext LuckySpotMon3Text
	waitbutton
	closetext
	end

TerusamaText:
    text "A: Eheheh "
	line "you are lucky!"
	done


LuckySpotMon1Text:
    text "POLIWAG: Glgl?"
	done

LuckySpotMon2Text:
    text "POLIWAG: Glgl!"
	done 
	
LuckySpotMon3Text:
    text "POLIWAG: Glgl!"
	done

LuckySpotHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 19, ILEX_FOREST, 5
	warp_event  7, 19, ILEX_FOREST, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event 15, 11, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_TREE, OBJECTTYPE_SCRIPT, 0, LuckySpotLadyScript, -1
	object_event 18, 11, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LuckySpotMon1Script, -1
	object_event  7,  4, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LuckySpotMon2Script, -1
	object_event  3, 15, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LuckySpotMon3Script, -1
