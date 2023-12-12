	object_const_def
	const UNDERWATER1_DOME
	const UNDERWATER1_HELIX
	const UNDERWATER1_AMBER


CianwoodUnderwater_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .DiveMap
	
.DiveMap:
	divemap CIANWOOD_CITY, 0, 0
	return

DomeScript:
; This whole script is written out rather than as an itemball
; because it's left over from the GS event.
	giveitem DOME_FOSSIL
	iffalse .BagFull
	disappear UNDERWATER1_DOME
	opentext
	getitemname STRING_BUFFER_3, DOME_FOSSIL
	writetext Text_Found
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

.BagFull:
	opentext
	getitemname STRING_BUFFER_3, DOME_FOSSIL
	writetext Text_Found
	promptbutton
	writetext Text_NoRoomFor
	waitbutton
	closetext
	end

HelixScript:
; This whole script is written out rather than as an itemball
; because it's left over from the GS event.
	giveitem HELIX_FOSSIL
	iffalse .BagFull
	disappear UNDERWATER1_HELIX
	opentext
	getitemname STRING_BUFFER_3, HELIX_FOSSIL
	writetext Text_Found
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

.BagFull:
	opentext
	getitemname STRING_BUFFER_3, HELIX_FOSSIL
	writetext Text_Found
	promptbutton
	writetext Text_NoRoomFor
	waitbutton
	closetext
	end

AmberScript:
; This whole script is written out rather than as an itemball
; because it's left over from the GS event.
	giveitem OLD_AMBER
	iffalse .BagFull
	disappear UNDERWATER1_AMBER
	opentext
	getitemname STRING_BUFFER_3, OLD_AMBER
	writetext Text_Found
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

.BagFull:
	opentext
	getitemname STRING_BUFFER_3, OLD_AMBER
	writetext Text_Found
	promptbutton
	writetext Text_NoRoomFor
	waitbutton
	closetext
	end

Text_Found:
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Text_NoRoomFor:
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

CianwoodUnderwater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23, 1, ROUTE_41_UNDERWATER, 4
	warp_event 3, 23, UNDERWATER_LABI, 25 


	def_coord_events

	def_bg_events

	def_object_events
	object_event 30, 26, SPRITE_FOSSIL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DomeScript, EVENT_FOUND_DOME
	object_event 32, 26, SPRITE_FOSSIL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, HelixScript, EVENT_FOUND_HELIX
	object_event 5, 11, SPRITE_FOSSIL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, AmberScript, EVENT_FOUND_AMBER
