_RoofKey:
; Are we even in the right map to use this?
	ld a, [wMapGroup]
	cp GROUP_ROUTE_4
	jr nz, .nope

	ld a, [wMapNumber]
	cp MAP_ROUTE_4
	jr nz, .nope
; Are we on the tile in front of the door?
	call GetFacingTileCoord
	ld a, d
	cp 4
	jr nz, .nope
	ld a, e
	cp 4
	jr nz, .nope
; Let's use the Hub Key
	ld hl, .RoofKeyScript
	call QueueScript
	ld a, TRUE
	ld [wItemEffectSucceeded], a
	ret

.nope
	ld a, FALSE
	ld [wItemEffectSucceeded], a
	ret

.RoofKeyScript:
	closetext
	farsjump RoofDoorScript
