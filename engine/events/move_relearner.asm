	const_def
	const MOVERELEARNERTEXT_INTRO
	const MOVERELEARNERTEXT_INTRO2
	const MOVERELEARNERTEXT_WHICHMON
	const MOVERELEARNERTEXT_WHICHMOVE
	const MOVERELEARNERTEXT_COMEAGAIN
	const MOVERELEARNERTEXT_EGG
	const MOVERELEARNERTEXT_NOTAPOKEMON
	const MOVERELEARNERTEXT_NOTENOUGHMONEY
	const MOVERELEARNERTEXT_NOMOVESTOLEARN

MoveRelearner:
	ld a, BRICK_PIECE
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	jp nc, .cancel2
	ld a, MOVERELEARNERTEXT_INTRO
	call PrintMoveRelearnerText
	call YesNoBox
	jp c, .cancel
	ld a, MOVERELEARNERTEXT_WHICHMON
	call PrintMoveRelearnerText
	call JoyWaitAorB

	ld b, $6
	farcall SelectMonFromParty
	jr c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg

	call IsAPokemon
	jr c, .no_mon


	call GetRelearnableMoves
	jr z, .no_moves

.menuloop
	ld a, MOVERELEARNERTEXT_WHICHMOVE
	call PrintMoveRelearnerText
	call JoyWaitAorB
	call ChooseMoveToLearn
	jr c, .cancelMoveLearn

	ld a, [wMenuSelection]
	ld [wd265], a
	call GetMoveName
	ld de, wStringBuffer1
	call CopyName1
	ld b, 0
	predef LearnMove
	ld a, b
	and a
	push af
	call CloseSubmenu
	call SpeechTextbox
	pop af
	jr z, .reloadmenu
	
	ld a, BRICK_PIECE
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChange], a
	ld a, -1
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem

	ld a, MOVERELEARNERTEXT_NOTENOUGHMONEY
	call PrintMoveRelearnerText

	call JoyWaitAorB

.cancel
	ld a, MOVERELEARNERTEXT_COMEAGAIN
	call PrintMoveRelearnerText
	ret

.cancel2
	ld a, MOVERELEARNERTEXT_INTRO2
	call PrintMoveRelearnerText
	ret

.reloadmenu
	jp .menuloop
	
.cancelMoveLearn
	call CloseSubmenu
	jr .cancel

.egg
	ld a, MOVERELEARNERTEXT_EGG
	call PrintMoveRelearnerText
	ret

.no_mon
	ld a, MOVERELEARNERTEXT_NOTAPOKEMON
	call PrintMoveRelearnerText
	ret

.no_moves
	ld a, MOVERELEARNERTEXT_NOMOVESTOLEARN
	call PrintMoveRelearnerText
	ret


GetRelearnableMoves:
	; Get moves relearnable by CurPartyMon
	; Returns z if no moves can be relearned.
	ld hl, wd002
	xor a
	ld [hli], a
	ld [hl], $ff
	ld a, MON_SPECIES
	call GetPartyParam
	ld [wCurPartySpecies], a
	push af
	ld a, MON_LEVEL
	call GetPartyParam
	ld [wCurPartyLevel], a
	ld b, 0
	ld de, wd002 + 1
.loop
	push bc
	ld a, [wCurPartySpecies]
	dec a
	ld c, a
	ld b, 0
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarWord
.skip_evos
	ld a, BANK(EvosAttacks)
	call GetFarByteAndIncrement
	and a
	jr nz, .skip_evos
.loop_moves
	ld a, BANK(EvosAttacks)
	call GetFarByteAndIncrement
	and a
	jr z, .done

	ld c, a
	ld a, [wCurPartyLevel]
	cp c
	jr c, .done
	ld a, BANK(EvosAttacks)
	call GetFarByteAndIncrement
.okay
	ld c, a
	call CheckAlreadyInList
	jr c, .loop_moves
	call CheckPokemonAlreadyKnowsMove
	jr c, .loop_moves
	ld a, c
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	pop bc
	inc b
	push bc
	jr .loop_moves
.done
	callfar GetPreEvolution
	pop bc
	jr c, .loop
	pop af
	ld [wCurPartySpecies], a
	ld a, b
	ld [wd002], a
	and a
	ret
    
GetPartyParam:
	push hl
	call GetPartyParamLocation
	ld a, [hl]
	pop hl
	ret
	
GetFarByteAndIncrement:
	call GetFarByte
	inc hl
	ret

CheckAlreadyInList:
	push hl
	push de
	push bc
	ld a, c
	ld hl, wd002 + 1
	call IsInSingularArray
	pop bc
	pop de
	pop hl
	ret
    
IsInSingularArray:
	ld b, l
	ld d, $ff
	ld e, a
.loop
	ld a, [hli]
	cp d
	jr z, .notInArray
	cp e
	jr nz, .loop
	dec hl
	ld a, l
	sub b 
	ld b, a
	scf
	ret

.notInArray
	and a
	ret

CheckPokemonAlreadyKnowsMove:
	; Check if move c is in the selected pokemon's movepool already.
	; Returns carry if yes.
	push hl
	push bc
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld b, NUM_MOVES
.loop
	ld a, [hli]
	cp c
	jr z, .yes
	dec b
	jr nz, .loop
	and a
	jr .done
.yes
	scf
.done
	pop bc
	pop hl
	ret

ChooseMoveToLearn:
; Open a full-screen scrolling menu
; Number of items stored in wd002
; List of items stored in wd002 + 1
; Print move names, PP, details, and descriptions
; Enable Up, Down, A, and B
; Up scrolls up
; Down scrolls down
; A confirms selection
; B backs out
	call FadeToMenu
	farcall BlankScreen
	call UpdateSprites
	ld hl, .MenuDataHeader
	call CopyMenuHeader
	xor a
	ld [wMenuCursorPosition], a
	ld a, 1
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	call SpeechTextbox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .carry
	ld a, [wMenuSelection]
	ld [wPutativeTMHMMove], a
	and a
	ret

.carry
	scf
	ret

.MenuDataHeader
	db $40 ; flags
	db 01, 01 ; start coords
	db 11, 19 ; end coords
	dw .menudata2
	db 1 ; default option

.menudata2
	db $30 ; pointers
	db 5, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wd002
	dba .PrintMoveName
	dba .PrintDetails
	dba .PrintMoveDesc

.PrintMoveName
	push de
	ld a, [wMenuSelection]
	ld [wd265], a
	call GetMoveName
	pop hl
	jp PlaceString

.PrintDetails
	ld hl, wStringBuffer1
	ld bc, wStringBuffer2 - wStringBuffer1
	ld a, " "
	call ByteFill
	ld a, [wMenuSelection]
	cp $ff
	ret z
	push de
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_TYPE
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld [wd265], a
	; get move type
	and $3f
	; 9 characters
	ld c, a
	add a
	add a
	add a
	add c
	ld c, a
	ld b, 0
	ld hl, .Types
	add hl, bc
	ld d, h
	ld e, l

	ld hl, wStringBuffer1
	call PlaceString
	ld hl, wStringBuffer1 + 9
	ld [hl], "/"
	; get move class
;	ld a, [wd265]
;	and $c0
;	rlca
;	rlca
;	ld c, a
;	add a
;	add a
;	add c
;	ld c, a
;	ld b, 0
;	ld hl, .Classes
;	add hl, bc
;	ld d, h
;	ld e, l
;
;	ld hl, wStringBuffer1 + 5
;	call PlaceString
;	ld hl, wStringBuffer1 + 9
;	ld [hl], "/"

	ld a, [wMenuSelection]
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_PP
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld [wCurCoordEvent], a
	ld hl, wStringBuffer1 + 10
	ld de, wCurCoordEvent 
	lb bc, 1, 2
	call PrintNum
	ld hl, wStringBuffer1 + 12
	ld [hl], "@"

	ld hl, SCREEN_WIDTH - 5
	pop de
	add hl, de
	push de
	ld de, wStringBuffer1
	call PlaceString
	pop de
	ret

.Types
	db "  NORMAL@"
	db "FIGHTING@"
	db "  FLYING@"
	db "  POISON@"
	db "  GROUND@"
	db "    ROCK@"
	db "    BIRD@"
	db "     BUG@"
	db "   STEEL@"
	db "   GHOST@"
	
	db "  TYPE10@"
	db "  TYPE11@"
	db "  TYPE12@"
	db "  TYPE13@"
	db "  TYPE14@"
	db "  TYPE15@"
	db "  TYPE16@"
	db "  TYPE17@"
	db "  TYPE18@"
	db "     ???@"

	db "    FIRE@"
	db "   WATER@"
	db "   GRASS@"
	db "ELECTRIC@"
	db " PSYCHIC@"
	db "     ICE@"
	db "  DRAGON@"
	db "    DARK@"
;.Classes
;	db "Phys@"
;	db "Spec@"
;	db "Stat@"

.PrintMoveDesc
	push de
	call SpeechTextbox
	ld a, [wMenuSelection]
	cp $ff
	pop de
	ret z
	ld [wCurSpecies], a
	hlcoord 1, 14
	predef PrintMoveDescription
    ret

PrintMoveRelearnerText:
	ld e, a
	ld d, 0
	ld hl, .TextPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ret
.TextPointers
	dw .Intro
	dw .Intro2
	dw .WhichMon
	dw .WhichMove
	dw .ComeAgain
	dw .Egg
	dw .NotMon
	dw .NotEnoughMoney
	dw .NoMovesToLearn

.Intro
	text "Hello! I am the"
	line "MOVE RELEARNER."

	para "I know all the"
	line "moves that can be"

	para "learned for each"
	line "#MON."

	para "For a BRICK PIECE"
	line "I can share that"

	para "knowledge with"
	line "you. How about it?"
	done

.Intro2
	text "Hello! I am the"
	line "MOVE RELEARNER."

	para "I know all the"
	line "moves that can be"

	para "learned for each"
	line "#MON."

	para "For a BRICK PIECE"
	line "I can share that"

	para "knowledge with"
	line "you!"
	done

.WhichMon

	text "Excellent! Which"
	line "#MON should"
	cont "remember a move?"
	done
.WhichMove














	text "Which move should"
	line "it remember?"
	done
.ComeAgain
	text "If you want your"
	line "#MON to remem-"
	cont "ber moves, come"
	cont "back to me."
	done
.Egg
	text "An EGG can't learn"
	line "moves."
	done
.NotMon

	text "What?! That's not"
	line "a #MON!"
	done
.NotEnoughMoney
	text "<PLAYER> handed"
	line "over the BRICK"
	cont "PIECE."
	done
.NoMovesToLearn
	text "This #MON can't"
	line "learn any moves"
	cont "from me."
	done
	