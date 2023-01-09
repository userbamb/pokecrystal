	db DUNSPARCE ; 206 KOTORA

	db  80,  55,  50,  40,  55,  60
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 61 ; base exp
	db PRZCUREBERRY, RUBBER_BAND ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dunsparce/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ROLLOUT, MUD_SLAP, TOXIC, ZAP_CANNON, HIDDEN_POWER, PROTECT, ENDURE, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, CUT, STRENGTH, FLASH, THUNDERBOLT
	; end

