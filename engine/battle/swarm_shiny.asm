GenerateSwarmShiny:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
    cp LANDMARK_ROUTE_35
    jr z, .yanma
    cp LANDMARK_ROUTE_43
	jr z, .mareep
    cp LANDMARK_ROUTE_32
	jr z, .remoraid
    jr .skipshine

.yanma
   ld a, [wCurPartySpecies]
   cp YANMA
   jr nz, .skipshine
   jr .rollshiny
.mareep
   ld a, [wCurPartySpecies]
   cp MAREEP
   jr nz, .skipshine
   jr .rollshiny
.remoraid
    ld a, [wCurPartySpecies]
    cp REMORAID
    jr nz, .skipshine
    ;fallthrough
.rollshiny
    call Random
	cp 30 ; adjust to desired percentage
	jr nc, .trynext
	ld b, ATKDEFDV_SHINY
	ld c, SPDSPCDV_SHINY
	jr .UpdateDVs
.trynext:
	call Random
	cp 30 ; adjust to desired percentage
	jr nc, .skipshine
	ld b, ATKDEFDV_SHINY
	ld c, SPDSPCDV_SHINY
	jr .UpdateDVs

.skipshine:
; Generate new random DVs
	call BattleRandom
	ld b, a
	call BattleRandom
	ld c, a

.UpdateDVs:
; Input DVs in register bc
	ld hl, wEnemyMonDVs
	ld a, b
	ld [hli], a
	ld [hl], c
	ret
    