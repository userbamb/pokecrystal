	db SUNKERN ; 191 RINRIN 

	db  45,  55,  30,  85,  30,  45
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 255 ; catch rate
	db 69 ; base exp
	db BERRY, BLACKGLASSES ; items
	db GENDER_F100 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/sunkern/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm MUD_SLAP, HEADBUTT, ROAR, HIDDEN_POWER, HYPER_BEAM, PROTECT, ENDURE, RETURN, DOUBLE_TEAM, SWIFT, ATTRACT, REST, THIEF, SHADOW_BALL, CUT, STRENGTH, TOXIC, SWAGGER
	; end
