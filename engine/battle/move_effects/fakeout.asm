BattleCommand_fakeout: ; 37683
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
	call CheckIfTargetIsGhostType
	jr z, .failed
	jp FlinchTarget
.failed
	ld a, 1
	ld [wAttackMissed], a
	call BattleCommand_movedelay
	ld hl, ButItFailedText
	call StdBattleTextBox
	jp EndMoveEffect