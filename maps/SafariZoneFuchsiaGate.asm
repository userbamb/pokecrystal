    object_const_def

SafariZoneFuchsiaGate_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_TILES, SafariZoneFuchsiaGateCheckHubKeyCallback

SafariZoneFuchsiaGateCheckHubKeyCallback:
	checkevent EVENT_USED_HUB_KEY
	iffalse .LockSafariDoor
	endcallback

.LockSafariDoor:
	changeblock 4, 0, $3d ; locked door
	endcallback

SafariDoorScript::
	opentext
	checkevent EVENT_USED_HUB_KEY
	iftrue .Open
	checkitem HUB_KEY
	iftrue .Unlock
	writetext SafariHubTheDoorsLockedText
	waitbutton
	closetext
	end

.Unlock:
	playsound SFX_TRANSACTION
	writetext SafariHubKeyOpenedDoorText
	waitbutton
	closetext
	changeblock 4, 0, $2e ; unlocked door
	reloadmappart
	closetext
	setevent EVENT_USED_HUB_KEY
	end

.Open:
	writetext SafariHubIsOpenText
	waitbutton
	closetext
	end

SafariHubTheDoorsLockedText:
	text "The WARDEN locked"
	line "the door…"
	done

SafariHubIsOpenText:
	text "The door is open."
	done

SafariHubKeyOpenedDoorText:
	text "The door opened!"
	done

SafariZoneFuchsiaGate_MapEvents:
	db 0, 0 ; filler
 
	def_warp_events
	warp_event  4,  0, SAFARI_ZONE_HUB, 1
	warp_event  4,  7, FUCHSIA_CITY, 7
	warp_event  5,  7, FUCHSIA_CITY, 7

	def_coord_events

	def_bg_events
	bg_event 4,  0, BGEVENT_READ, SafariDoorScript
	bg_event 5,  0, BGEVENT_READ, SafariDoorScript

	def_object_events
