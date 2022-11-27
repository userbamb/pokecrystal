_HubKey:
; Are we even in the right map to use this?
	ld a, [wMapGroup]
	cp GROUP_SAFARI
	jr nz, .nope

	ld a, [wMapNumber]
	cp MAP_SAFARI_ZONE_FUCHSIA_GATE
	jr nz, .nope
; Are we on the tile in front of the door?
	call GetFacingTileCoord
	ld a, d
	cp 22
	jr nz, .nope
	ld a, e
	cp 10
	jr nz, .nope
; Let's use the Basement Key
	ld hl, .HubKeyScript
	call QueueScript
	ld a, TRUE
	ld [wItemEffectSucceeded], a
	ret

.nope
	ld a, FALSE
	ld [wItemEffectSucceeded], a
	ret

.HubKeyScript:
	closetext
	farsjump HubDoorScript
