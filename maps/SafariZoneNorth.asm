    object_const_def
	const SAFARIZONENORTH_POKE_BALL1
	const SAFARIZONENORTH_POKE_BALL2

SafariZoneNorth_MapScripts:
    def_scene_scripts

	def_callbacks


SafariZoneNorthAreaSign:
	jumptext SafariZoneNorthAreaSignText

SafariZoneNorthRestHouseSign:
	jumptext SafariZoneNorthRestHouseSignText

SafariZoneNorthTrainerTips1Sign:
	jumptext SafariZoneNorthTrainerTips1SignText

SafariZoneNorthTrainerTips2Sign:
	jumptext SafariZoneNorthTrainerTips2SignText

SafariZoneNorthEviolite:
	itemball RARE_CANDY

SafariZoneNorthProtein:
	itemball PROTEIN

SafariZoneNorthHiddenLuckyPunch:
    hiddenitem LUCKY_PUNCH, EVENT_SAFARI_ZONE_NORTH_HIDDEN_LUCKY_PUNCH

SafariZoneNorthAreaSignText:
	text "Safari Zone"
	line "North Area"
	done

SafariZoneNorthRestHouseSignText:
	text "Rest House"
	done

SafariZoneNorthTrainerTips1SignText:
	text "Trainer Tips"

	para "Moves of the same"
	line "type can be"
	cont "physical, special,"
	cont "or status-based."
	done

SafariZoneNorthTrainerTips2SignText:
	text "Trainer Tips"

	para "#mon hide in"
	line "tall grass!"

	para "Zigzag through"
	line "grassy areas to"
	cont "flush them out."
	done

SafariZoneNorth_MapEvents:
	db 0, 0; filler

    def_warp_events
	warp_event 29, 26, SAFARI_ZONE_EAST, 3
	warp_event 29, 27, SAFARI_ZONE_EAST, 4
	warp_event 4, 31, SAFARI_ZONE_HUB, 5
	warp_event 5, 31, SAFARI_ZONE_HUB, 6
	warp_event 14, 31, SAFARI_ZONE_HUB, 7
	warp_event 15, 31, SAFARI_ZONE_HUB, 8

    def_coord_events

    def_bg_events
	bg_event 13, 23, BGEVENT_ITEM, SafariZoneNorthHiddenLuckyPunch
	bg_event 9, 27, BGEVENT_READ, SafariZoneNorthAreaSign
	bg_event 26, 4, BGEVENT_READ, SafariZoneNorthRestHouseSign
	bg_event 24, 20, BGEVENT_READ, SafariZoneNorthTrainerTips1Sign
	bg_event 13, 29, BGEVENT_READ, SafariZoneNorthTrainerTips2Sign
	
	def_object_events
    object_event 18, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneNorthRareCandy, EVENT_SAFARI_ZONE_NORTH_RARE_CANDY
	object_event 11, 3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneNorthProtein, EVENT_SAFARI_ZONE_NORTH_PROTEIN
