; Pokémon swarms in grass

SwarmGrassWildMons:

; Mareep swarm
	map_id ROUTE_43
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 3, GIRAFARIG
	db 3, MAREEP
	db 2, DUNSPARCE
	db 2, GIRAFARIG
	db 2, MAREEP
	db 4, MAREEP
	db 4, MAREEP
	; day
	db 3, GIRAFARIG
	db 3, MAREEP
	db 2, DUNSPARCE
	db 2, GIRAFARIG
	db 2, MAREEP
	db 4, MAREEP
	db 4, MAREEP
	; nite
	db 3, GIRAFARIG
	db 3, MAREEP
	db 2, DUNSPARCE
	db 2, GIRAFARIG
	db 2, MAREEP
	db 4, MAREEP
	db 4, MAREEP

; Yanma swarm
	map_id ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 12, YANMA
	db 14, YANMA
	db 14, PIDGEY
	db 10, DITTO
	db 10, DITTO
	; day
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 12, YANMA
	db 14, YANMA
	db 14, PIDGEY
	db 10, DITTO
	db 10, DITTO
	; nite
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 12, YANMA
	db 14, YANMA
	db 14, HOOTHOOT
	db 10, DITTO
	db 10, DITTO

; Vulpix swarm
	map_id ROUTE_37
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 13, LEDYBA
	db 14, VULPIX
	db 15, PIDGEY
	db 16, VULPIX
	db 15, PIDGEOTTO
	db 15, VULPIX
	db 15, LEDIAN
	; day
	db 13, PIDGEY
	db 14, VULPIX
	db 15, PIDGEY
	db 16, VULPIX
	db 15, PIDGEOTTO
	db 15, VULPIX
	db 15, PIDGEY
	; nite
	db 13, SPINARAK
	db 14, VULPIX
	db 15, HOOTHOOT
	db 16, VULPIX
	db 15, NOCTOWL
	db 15, VULPIX
	db 15, ARIADOS

	map_id NATIONAL_PARK
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 14, LEDYBA
	db 13, DUNSPARCE
	db 10, DUNSPARCE
	db 10, SENTRET
	db 10, SENTRET
	; day
	db 12, NIDORAN_F
	db 12, NIDORAN_M
	db 14, SENTRET
	db 13, DUNSPARCE
	db 10, DUNSPARCE
	db 10, WEEDLE
	db 10, SENTRET
	; nite
	db 12, DUNSPARCE
	db 13, HOOTHOOT
	db 14, SPINARAK
	db 15, DUNSPARCE
	db 10, SUNKERN
	db 12, SUNKERN
	db 12, VENONAT


	db -1 ; end
