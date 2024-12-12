	object_const_def
	const SPROUTTOWER2F_SAGE1
	const SPROUTTOWER2F_SAGE2
	const SPROUTTOWER2F_POKE_BALL

SproutTower2F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSageNico:
	trainer SAGE, NICO, EVENT_BEAT_SAGE_NICO, SageNicoSeenText, SageNicoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNicoAfterBattleText
	waitbutton
	closetext
	end

TrainerSageEdmond:
	trainer SAGE, EDMOND, EVENT_BEAT_SAGE_EDMOND, SageEdmondSeenText, SageEdmondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageEdmondAfterBattleText
	waitbutton
	closetext
	end
	
SproutTower2FStatuetenta:
	jumptext SproutTower2FStatuetentaText

SproutTower2FStatue:
	jumptext jumptext SproutTower2FStatueText

SproutTower2FXAccuracy:
	itemball X_ACCURACY

SageNicoSeenText:
	text "However hard we"
	line "battle, the TOWER"
	cont "will stand strong."
	done

SageNicoBeatenText:
	text "I fought hard but"
	line "I'm too weak."
	done

SageNicoAfterBattleText:
	text "The flexible pil-"
	line "lar protects the"

	para "TOWER, even from"
	line "earthquakes."
	done

SageEdmondSeenText:
	text "…Sway like leaves"
	line "in the wind…"
	done

SageEdmondBeatenText:
	text "Oh, I'm weak!"
	done

SageEdmondAfterBattleText:
	text "I tried to copy"
	line "BELLSPROUT's"

	para "gentle movements"
	line "for battle…"

	para "But I didn't train"
	line "well enough."
	done

SproutTower2FStatueText:
	text "This is a statue"
	line "of a PIKACHU."
	para "PIKACHU reminds"
	line "us that even the"
	para "most popular of"
	line "#MON still"
	para "deserve to be"
	line "treated with honor"
	para "and respect, and"
	line "not just viewed"
	para "as some sort of"
	line "status symbol."
	done

SproutTower2FStatuetentaText:
	text "This is a statue"
	line "of a TENTACRUEL."
	para "Despite its large"
	line "and intimidating"
	para "appearance,"
	line "TENTACRUEL teaches"
	para "us that all"
	line "#MON have pure"
	cont "hearts."
	para "This statue is"
	line "dedicated to a"
	para "TENTACRUEL that"
	line "used its tentacles"
	para "to lift a drowning"
	line "child out of the"
	para "river next to this"
	line "tower."
	done

SproutTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  5, SPROUT_TOWER_1F, 3
	warp_event  2,  6, SPROUT_TOWER_1F, 4
	warp_event 17,  3, SPROUT_TOWER_1F, 5
	warp_event 10, 14, SPROUT_TOWER_3F, 1

	def_coord_events

	def_bg_events
	bg_event  9,  0, BGEVENT_READ, SproutTower2FStatue
	bg_event  3,  6, BGEVENT_READ, SproutTower2FStatuetenta

	def_object_events
	object_event 12,  3, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageNico, -1
	object_event  9, 14, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSageEdmond, -1
	object_event  3,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower2FXAccuracy, EVENT_SPROUT_TOWER_2F_X_ACCURACY
