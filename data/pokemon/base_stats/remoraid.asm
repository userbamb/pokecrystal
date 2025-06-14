	db REMORAID ; 223 wolfman 

	db 110,  90, 80, 80,  95,  115
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE ; type
	db 45 ; catch rate
	db 191 ; base exp
	db ICE_BERRY, NEVERMELTICE ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/remoraid/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm ROAR, DYNAMICPUNCH, HEADBUTT, TOXIC, HIDDEN_POWER, HYPER_BEAM, PROTECT, ENDURE, RETURN, SWAGGER, SWIFT, BLIZZARD, ICY_WIND, ICE_PUNCH, EARTHQUAKE, MUD_SLAP, THIEF, THUNDERPUNCH, ROCK_SMASH, STRENGTH, REST
	; end
