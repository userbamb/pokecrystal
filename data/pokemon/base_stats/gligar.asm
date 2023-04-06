	db GLIGAR ; 207 RAITORA

	db 115,  85,  99,  70, 95,  76
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 179 ; base exp
	db PRZCUREBERRY, RUBBER_BAND ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/gligar/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
    db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ROLLOUT, MUD_SLAP, EARTHQUAKE, TOXIC, ZAP_CANNON, HIDDEN_POWER, HYPER_BEAM, PROTECT, ENDURE, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, STRENGTH, FLASH, THUNDERBOLT
	; end
	