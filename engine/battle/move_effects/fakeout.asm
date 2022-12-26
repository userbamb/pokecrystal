BattleCommand_FakeOut: 
	ld a, [hBattleTurn]
	and a
	jr z, .PlayerTurn
	ld a, [wEnemyTurnsTaken]
	dec a
	jr nz, .failed
	jr .cont
.PlayerTurn
	ld a, [wPlayerTurnsTaken]
	dec a
	jr nz, .failed
.cont
	jp FlinchTarget
.failed
   	ld a, 1
	ld [wAttackMissed], a
	call BattleCommand_MoveDelay
	ld hl, ButItFailedText
	call StdBattleTextbox
	jp EndMoveEffect
