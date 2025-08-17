GenerateSwarmShiny:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
   cp LANDMARK_ROUTE_35
   jr z, .yanma
	cp LANDMARK_ROUTE_37
	jr z, .scyther
	cp LANDMARK_ROUTE_42
	jr z, .kotora
	cp LANDMARK_ROUTE_34
   jr z, .ditto
	cp LANDMARK_ROUTE_38
   jr z, .marill
   cp LANDMARK_CHERRYGROVE_CITY
   jr z, .horsea
   cp LANDMARK_RUINS_OF_ALPH
   jr z, .smeargle
   cp LANDMARK_ROUTE_45
   jr z, .teddiursa
   cp LANDMARK_OLIVINE_CITY
   jr z, .chinchouz
   cp LANDMARK_ROUTE_40
   jr z, .goldeen
   jr .skipshine

.goldeen
   ld a, [wCurPartySpecies]
   cp GOLDEEN
   jr nz, .skipshine
   jr .rollshiny
.chinchouz
   ld a, [wCurPartySpecies]
   cp CHINCHOU
   jr nz, .skipshine
   jr .rollshiny
.scyther
   ld a, [wCurPartySpecies]
   cp SCYTHER
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
.smeargle
   ld a, [wCurPartySpecies]
   cp SMEARGLE
   jr nz, .skipshine
   jr .rollshiny
.marill
   ld a, [wCurPartySpecies]
   cp MARILL
   jr nz, .skipshine
   jr .rollshiny
.yanma
   ld a, [wCurPartySpecies]
   cp YANMA
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
    