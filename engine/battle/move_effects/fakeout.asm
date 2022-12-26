BattleCommand_FakeOut: ; 37683
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
    jp FailMove