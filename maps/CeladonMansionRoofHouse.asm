	object_const_def
	const CELADONMANSIONROOFHOUSE_PHARMACIST

CeladonMansionRoofHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansionRoofHousePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM03_CURSE
	iftrue .GotCurse
	writetext CeladonMansionRoofHousePharmacistIntroText
	promptbutton
	checktime NITE
	iftrue .Night
	writetext CeladonMansionRoofHousePharmacistNotNightText
	waitbutton
	closetext
	end

.Night:
	writetext CeladonMansionRoofHousePharmacistStoryText
	promptbutton
	verbosegiveitem TM_CURSE
	iffalse .NoRoom
	setevent EVENT_GOT_TM03_CURSE
.GotCurse:
	writetext CeladonMansionRoofHousePharmacistCurseText
	waitbutton
.NoRoom:
	closetext
	end

CeladonMansionRoofHousePharmacistIntroText:
	text "Me and my GENGAR"
	line "live here alone…"
	done

CeladonMansionRoofHousePharmacistNotNightText:
	text "Sometimes we get"
	line "to take care of"

	para "some injuried"
	line "#MON outside…"

	para "They seem to"
	line "trust just us…"
	done

CeladonMansionRoofHousePharmacistStoryText:
	text "Once upon a time,"
	line "there was a little"

	para "boy who used to "
	line "visit us… He"

	para "wanted to become"
	line "the CHAMPION…"

	para "He was having so"
	line "much fun that he"

	para "didn't notice the"
	line "sun had set…"

	para "He went outside"
	line "in the pitch-black"

	para "night, and a"
	line "#MON attacked him!"

	para "We were inside and"
	line "only heard a loud"

	para "THUNDER!"

	para "…"

	para "…"

	para "SHRIEEEEK!"

	para "The boy never"
	line "came back to visit"
	cont "us…"

	para "Is he still alive?"
	line "GENGAR misses him"
    cont "sometimes…"

	para "For listening so"
	line "patiently, you may"
	cont "take this--TM03!"
	done

CeladonMansionRoofHousePharmacistCurseText:
    text "Me and my GENGAR"
	line "live here alone…"

	para "come visit us"
	line "sometimes, if you"

	cont "want!"
	done

CeladonMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_ROOFL, 2
	warp_event  3,  7, CELADON_MANSION_ROOFL, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHousePharmacistScript, -1
