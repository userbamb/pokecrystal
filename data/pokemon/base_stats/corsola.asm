	db CORSOLA ; 222 WOLFAN

	db 70,  60,  50,  55,  70,  60
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE ; type
	db 170 ; catch rate
	db 75 ; base exp
	db ICE_BERRY, NEVERMELTICE ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/corsola/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm ROAR, DYNAMICPUNCH, TOXIC, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, PROTECT, ENDURE, RETURN, SWAGGER, SWIFT, BLIZZARD, ICY_WIND, ICE_PUNCH, EARTHQUAKE, MUD_SLAP, THIEF, THUNDERPUNCH, ROCK_SMASH, STRENGTH, REST
	; end
