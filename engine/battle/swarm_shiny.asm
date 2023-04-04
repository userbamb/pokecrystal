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
	cp LANDMARK_ROUTE_37
	jr z, .vulpix
	cp LANDMARK_NATIONAL_PARK
	jr z, .kotora
	cp LANDMARK_ROUTE_34
    jr z, .ditto
	cp LANDMARK_ROUTE_44
    jr z, .nidorino
	cp LANDMARK_ROUTE_38
    jr z, .miltank
    cp LANDMARK_RUINS_OF_ALPH_OUTSIDE
    jr z, .clefairy
	cp LANDMARK_CHERRYGROVE_CITY
    jr z, .horsea
    jr .skipshine

.horsea
   ld a, [wCurPartySpecies]
   cp HORSEA
   jr nz, .skipshine
   jr .rollshiny
.clefairy
   ld a, [wCurPartySpecies]
   cp CLEFAIRY
   jr nz, .skipshine
   jr .rollshiny
.miltank
   ld a, [wCurPartySpecies]
   cp MILTANK
   jr nz, .skipshine
   jr .rollshiny
.nidorino
   ld a, [wCurPartySpecies]
   cp NIDORINO
   jr nz, .skipshine
   jr .rollshiny
.ditto
   ld a, [wCurPartySpecies]
   cp DITTO
   jr nz, .skipshine
   jr .rollshiny
.kotora
   ld a, [wCurPartySpecies]
   cp DUNSPARCE
   jr nz, .skipshine
   jr .rollshiny
.vulpix
   ld a, [wCurPartySpecies]
   cp VULPIX
   jr nz, .skipshine
   jr .rollshiny
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
    cp OCTILLERY
    jr nz, .skipshine
    ;fallthrough
.rollshiny
    call Random
	cp 7 ; adjust to desired percentage
	jr nc, .trynext
	ld b, ATKDEFDV_SHINY
	ld c, SPDSPCDV_SHINY
	jr .UpdateDVs
.trynext:
	call Random
	cp 7 ; adjust to desired percentage
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
    