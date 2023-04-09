GenerateSwarmShiny:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
   cp LANDMARK_ROUTE_43
	jr z, .mareep
   cp LANDMARK_ROUTE_35
   jr z, .yanma
   cp LANDMARK_ROUTE_32
	jr z, .remoraid
	cp LANDMARK_ROUTE_37
	jr z, .vulpix
	cp LANDMARK_NATIONAL_PARK
	jr z, .kotora
	cp LANDMARK_ROUTE_34
   jr z, .ditto
	cp LANDMARK_ROUTE_42
   jr z, .nidorino
	cp LANDMARK_ROUTE_38
   jr z, .miltank
   cp LANDMARK_CHERRYGROVE_CITY
   jr z, .horsea
   cp LANDMARK_RUINS_OF_ALPH
   jr z, .clefairy
   cp LANDMARK_ROUTE_45
   jr z, .teddiursa
   cp LANDMARK_OLIVINE_CITY
   jr z, .chinchouz
   cp LANDMARK_ROUTE_26
   jr z, .ponyta
   cp LANDMARK_ROUTE_29
   jr z, .sentret
   cp LANDMARK_ROUTE_32
   jr z, .houndour
   cp LANDMARK_ROUTE_39
   jr z, .pichu
   cp LANDMARK_ROUTE_44
   jr z, .chansey
   cp LANDMARK_ROUTE_33
   jr z, .psyduck
   jr .skipshine



.psyduck
   ld a, [wCurPartySpecies]
   cp PSYDUCK
   jr nz, .skipshine
   jr .rollshiny
.chansey
   ld a, [wCurPartySpecies]
   cp CHANSEY
   jr nz, .skipshine
   jr .rollshiny
.pichu
   ld a, [wCurPartySpecies]
   cp PICHU
   jr nz, .skipshine
   jr .rollshiny
.houndour
   ld a, [wCurPartySpecies]
   cp HOUNDOUR
   jr nz, .skipshine
   jr .rollshiny
.sentret
   ld a, [wCurPartySpecies]
   cp SENTRET
   jr nz, .skipshine
   jr .rollshiny
.ponyta
   ld a, [wCurPartySpecies]
   cp PONYTA
   jr nz, .skipshine
   jr .rollshiny
.chinchouz
   ld a, [wCurPartySpecies]
   cp CHINCHOU
   jr nz, .skipshine
   jr .rollshiny
.teddiursa
   ld a, [wCurPartySpecies]
   cp TEDDIURSA
   jr nz, .skipshine
   jr .rollshiny
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
	cp 12 ; adjust to desired percentage
	jr nc, .trynext
	ld b, ATKDEFDV_SHINY
	ld c, SPDSPCDV_SHINY
	jr .UpdateDVs
.trynext:
	call Random
	cp 12 ; adjust to desired percentage
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
    