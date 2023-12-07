	object_const_def
	const VERMILIONPOKECENTER1F_NURSE
	const VERMILIONPOKECENTER1F_FISHING_GURU
	const VERMILIONPOKECENTER1F_SAILOR
	const VERMILIONPOKECENTER1F_BUG_CATCHER
	const VERMILIONPOKECENTER1F_SQUIRTLE

VermilionPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

VermilionPokecenter1FFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue .FoughtSnorlax
	writetext VermilionPokecenter1FFishingGuruText
	waitbutton
	closetext
	end

.FoughtSnorlax:
	checkevent EVENT_GOT_SQUIRTLE
	iffalse .GiveSquirtle
	writetext VermilionPokecenter1FFishingGuruText_FoughtSnorlax
	waitbutton
	closetext
	end

.GiveSquirtle:
	writetext GiveSquirtleText
	yesorno
	iffalse .saidno
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	disappear VERMILIONPOKECENTER1F_SQUIRTLE
	writetext PlayerReceivedSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SQUIRTLE, 5
	special GiveSquirtle
	setevent EVENT_GOT_SQUIRTLE
	writetext VermilionPokecenter1FFishingGuruText_FoughtSnorlax
	waitbutton
	closetext
	end

.saidno:
	writetext SquirtlePartyFullText
	waitbutton
	closetext
	end

.PartyFull:
	writetext SquirtlePartyFullText
	waitbutton
	closetext
	end
	

VermilionPokecenter1FSailorScript:
	jumptextfaceplayer VermilionPokecenter1FSailorText

VermilionPokecenter1FBugCatcherScript:
	jumptextfaceplayer VermilionPokecenter1FBugCatcherText

VermilionPokecenter1FFishingGuruText:
	text "A sleeping #MON"
	line "is lying in front"
	cont "of DIGLETT'S CAVE."

	para "It's a fantastic"
	line "opportunity to get"

	para "it, but how do you"
	line "wake it up?"
	done


GiveSquirtleText:
    text "W-WHAT?! You are"
	line "the one who fought"
	cont "that SNORLAX?!"

	para "It's fantastic,"
	line "I wanna give you"

	cont "this SQUIRTLE!"
	para "I know you can"

	line "train it well."
	cont "Take it!"
	done

SquirtlePartyFullText:
    text "You don't want"
	line "it?"
	done
    
VermilionPokecenter1FFishingGuruText_FoughtSnorlax:
	text "Go CHAMPION!"
	line "GO!!"
	done

PlayerReceivedSquirtleText:
    text "<PLAYER> received"
	line "SQUIRTLE!"
	done

VermilionPokecenter1FSquirtleText:
    text "SQUIRTLE: Squir!"
	done
	
VermilionPokecenter1FSailorText:
	text "The FAST SHIP is a"
	line "great place to"

	para "meet and battle"
	line "trainers."
	done

VermilionPokecenter1FBugCatcherText:
	text "Oh? You have some"
	line "BADGES I've never"
	cont "seen before."

	para "Oh, I get it. You"
	line "got them in JOHTO."
	done

VermilionPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VERMILION_CITY, 2
	warp_event  4,  7, VERMILION_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FFishingGuruScript, -1
	object_event  6,  5, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FSailorScript, -1
	object_event  1,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FBugCatcherScript, -1
	object_event  7,  1, SPRITE_SQUIRTLE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FSquirtleText, EVENT_GOT_SQUIRTLE
