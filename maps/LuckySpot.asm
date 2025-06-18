    object_const_def
    const LUCKYSPOT_MON1


LuckySpot_MapScripts:
	def_scene_scripts

	def_callbacks


LuckySpotMon1Script:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, _DVUP
	ifequal MONDAY, _DVUP
	ifequal WEDNESDAY, _DVUP
	ifequal FRIDAY, _DVUP
	opentext
	writetext LuckySpotMon1Text
	cry POLIWAG
	waitbutton
	verbosegiveitem ITEM_88
	iffalse .BagFull
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end
	
_DVUP:
	opentext
	writetext LuckySpotMon1Text
	cry POLIWAG
	waitbutton
	verbosegiveitem ITEM_78
	iffalse .BagFull2
	waitbutton
	closetext
	end

.BagFull2:
	closetext
	end


LuckySpotMon1Text:
    text "POLIWAG: Glgl?"
	done


LuckySpot_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0, 12, ILEX_FOREST, 5
	warp_event  0, 13, ILEX_FOREST, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event 18, 11, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LuckySpotMon1Script, -1
	