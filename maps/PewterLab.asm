	object_const_def
	const PEWTERLAB_NERD
    const PEWTERLAB_STARYU

PewterLab_MapScripts:
	def_scene_scripts

	def_callbacks

PewterLabNerdScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iffalse .PewterLabBusy
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustGotKabuto
	checkevent EVENT_GOT_KABUTO
	iffalse .GiveKabuto
	checkevent EVENT_SHOWED_KABUTOPS
	iftrue .ShowedAllPewter
	writetext AskKabutoEvolution
	promptbutton
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal KABUTOPS, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_KABUTOPS
	sjump .ShowedKabutops

.PewterLabBusy:
    writetext PewterLabBusyText
	waitbutton
	closetext
	end

.JustGotKabuto:
	writetext PewterLabFinalText
	waitbutton
	closetext
	end

.SaidNo:
	writetext PewterDontHaveText
	waitbutton
	closetext
	end

.ExcitedToSee:
    writetext PewterNerdExcitedText
	promptbutton
	end

.WrongPokemon:
    writetext PewterDontHaveText
	waitbutton
	closetext
	end

.CorrectPokemon:
    writetext PewterCorrectPokeText
	promptbutton
	end

.ShowedAllPewter:
    writetext PewterFinalFinalText
	waitbutton
	closetext
	end

.GiveKabuto:
	writetext PewterLabNerdGivesKabuto
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext PlayerReceivedKabutoText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke KABUTO, 25
	special GiveKabuto
	setevent EVENT_GOT_KABUTO
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	writetext PewterLabFinalText
	waitbutton
	closetext
	end

.ShowedKabutops:
    writetext PewterLabNerdGivesOmanyte
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext PlayerReceivedOmanyteText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke OMANYTE, 25
	special GiveOmanyte
	setevent EVENT_GOT_OMANYTE
	writetext PewterLabFinalText
	waitbutton
	closetext
	end

.PartyFull:
	writetext PewterPartyFullText
	waitbutton
	closetext
	end

PewterPartyFullText:
    text "PACH: You don't"
	line "want to train it?"
	done

PewterLabBusyText:
	text "PACH: What are you"
	line "doing here, kid?"
	cont "Me and my STARYU"
	cont "are working."
	done

PewterLabNerdGivesKabuto:
    text "PACH: You defeated"
	line "BROCK?! You must"

	para "be very strong!"
	line "Would you help me"
	cont "With something?"

	para "The CINNABAR LAB"
	line "was destroyed by"

	para "the eruption, and"
    line "I managed to save"

	para "just few data and"
	line "stuff."
	
	para "We just discovered"
	line "that fossils could"

	para "be regenerated but"
	line "can they evolve?"

	para "Could you find"
	line "this out for me?" 
	done

PewterLabFinalText:
    text "PACH: Thank you"
	line  "<PLAYER>!"
	done 

PlayerReceivedKabutoText:
    text "<PLAYER> received"
	line "KABUTO."
	done

PlayerReceivedOmanyteText:
    text "<PLAYER> received"
	line "OMANYTE."
	done

AskKabutoEvolution:
    text "PACH: Did KABUTO"
	line "manage to evolve"
	cont "with you?"
	done

PewterDontHaveText:
    text "PACH: What?"
	done

PewterNerdExcitedText:
    text "PACH: Really?!"
	line "You are the best!"
	done

PewterCorrectPokeText:
    text "PACH: WOW! So"
	line "that's KABUTOPS."
	done

PewterLabNerdGivesOmanyte:
    text "PACH: You should"
	line "train this little"
	cont "one too!"
	done

PewterFinalFinalText:
    text "PACH: Me and my"
	line "friend STARYU are"
	para "working hard to"
	line "restore the LAB."
	done

PewterStaryuScript:
    opentext
	writetext StaryuLab1Text
	cry STARYU
	waitbutton
	closetext
	end

StaryuLab1Text:
    text "STARYU: crcr.."
	done

PewterLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  9, PEWTER_CITY, 6
	warp_event  3,  9, PEWTER_CITY, 6

	def_coord_events

	def_bg_events
	
	def_object_events
	object_event  9,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterLabNerdScript, -1
    object_event  7,  4, SPRITE_STARMIE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterStaryuScript, -1