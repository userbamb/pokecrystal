    object_const_def
	const SAFARIZONEHUB_POKE_BALL1
	const SAFARIZONEHUB_POKE_BALL2

SafariZoneHub_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneHubAreaSign:
	jumptext SafariZoneHubAreaSignText

SafariZoneHubRestHouseSign:
	jumptext SafariZoneHubRestHouseSignText

SafariZoneHubNugget:
	itemball NUGGET

SafariZoneHubUltraBall:
	itemball ULTRA_BALL

SafariZoneHubAreaSignText:
	text "Safari Zone"
	line "Center Area"
	done

SafariZoneHubRestHouseSignText:
	text "Rest House"
	done

SafariZoneHub_MapEvents:
	db 0, 0 ; filler

    def_warp_events
	warp_event 14, 25, SAFARI_ZONE_FUCHSIA_GATE, 1
	warp_event 15, 25, SAFARI_ZONE_FUCHSIA_GATE, 1
	warp_event 29, 10, SAFARI_ZONE_EAST, 1
	warp_event 29, 11, SAFARI_ZONE_EAST, 2
	warp_event 4, 0, SAFARI_ZONE_NORTH, 3
	warp_event 5, 0, SAFARI_ZONE_NORTH, 4
	warp_event 14, 0, SAFARI_ZONE_NORTH, 5
	warp_event 15, 0, SAFARI_ZONE_NORTH, 6

	def_coord_events

    def_bg_events
	bg_event 14, 22, BGEVENT_READ, SafariZoneHubAreaSign
	
    def_object_events
	object_event 14, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneHubNugget, EVENT_SAFARI_ZONE_HUB_NUGGET
	object_event 3, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneHubUltraBall, EVENT_SAFARI_ZONE_HUB_ULTRA_BALL
