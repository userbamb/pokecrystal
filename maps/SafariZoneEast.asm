object_const_def
	const SAFARIZONEEAST_POKE_BALL1
	const SAFARIZONEEAST_POKE_BALL2
	const SAFARIZONEEAST_POKE_BALL3

SafariZoneEast_MapScripts:


SafariZoneEastAreaSign:
	jumptext SafariZoneEastAreaSignText

SafariZoneEastRestHouseSign:
	jumptext SafariZoneEastRestHouseSignText

SafariZoneEastTrainerTipsSign:
	jumptext SafariZoneEastTrainerTipsSignText

SafariZoneEastCarbos:
	itemball CARBOS

SafariZoneEastSilverPowder:
	itemball SILVERPOWDER

SafariZoneEastFullRestore:
	itemball FULL_RESTORE

SafariZoneEastAreaSignText:
	text "Safari Zone"
	line "East Area"
	done

SafariZoneEastRestHouseSignText:
	text "Rest House"
	done

SafariZoneEastTrainerTipsSignText:
	text "Trainer Tips"

	para "Search for rare"
	line "#mon at night"
	cont "or in the morning!"
	done

SafariZoneEast_MapEvents:
	db 0, 0; filler

    def_warp_events
	warp_event 0, 16, SAFARI_ZONE_HUB, 3
	warp_event 0, 17, SAFARI_ZONE_HUB, 4
	warp_event 0, 4, SAFARI_ZONE_NORTH, 1
	warp_event 0, 5, SAFARI_ZONE_NORTH, 2
	
	def_coord_events

    def_bg_events
	bg_event 4, 22, BGEVENT_READ, SafariZoneEastAreaSign
	bg_event 26, 10, BGEVENT_READ, SafariZoneEastRestHouseSign
    bg_event 6, 4, BGEVENT_READ, SafariZoneEastTrainerTipsSign
	
def_object_events
    object_event 20, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneEastCarbos, EVENT_SAFARI_ZONE_EAST_CARBOS
	object_event 5, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneEastSilverPowder, EVENT_SAFARI_ZONE_EAST_SILVERPOWDER
    object_event 3, 1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneEastFullRestore, EVENT_SAFARI_ZONE_FULL_RESTORE
	
	