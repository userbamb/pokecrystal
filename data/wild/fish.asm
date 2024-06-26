DEF time_group EQUS "0," ; use the nth TimeFishGroups entry

MACRO fishgroup
; chance, old rod, good rod, super rod
	db \1
	dw \2, \3, \4
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	table_width FISHGROUP_DATA_LENGTH, FishGroups
	fishgroup 50 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super
	fishgroup 50 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super
	fishgroup 50 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super
	fishgroup 50 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super
	fishgroup 50 percent + 1, .Dratini_Old,          .Dratini_Good,          .Dratini_Super
	fishgroup 50 percent + 1, .Chinchou_Swarm_Old,   .Chinchou_Swarm_Good,   .Chinchou_Swarm_Super
	fishgroup 50 percent + 1, .OCTILLERY_Swarm_Old,   .OCTILLERY_Swarm_Good,   .OCTILLERY_Swarm_Super
	fishgroup 50 percent + 1, .Gyarados_Old,         .Gyarados_Good,         .Gyarados_Super
	fishgroup 50 percent + 1, .Dratini_2_Old,        .Dratini_2_Good,        .Dratini_2_Super
	fishgroup 50 percent + 1, .WhirlIslands_Old,     .WhirlIslands_Good,     .WhirlIslands_Super
	fishgroup 50 percent + 1, .Chinchou_Old,         .Chinchou_Good,         .Chinchou_Super
	fishgroup 50 percent + 1, .OCTILLERY_Old,         .OCTILLERY_Good,         .OCTILLERY_Super
	fishgroup 50 percent + 1, .Chinchou_NoSwarm_Old, .Chinchou_NoSwarm_Good, .Chinchou_NoSwarm_Super
	assert_table_length NUM_FISHGROUPS

.Shore_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     KRABBY,     10
.Shore_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     KRABBY,     20
	db  90 percent + 1, KRABBY,     20
	db 100 percent,     time_group 0
.Shore_Super:
	db  40 percent,     KRABBY,     40
	db  70 percent,     time_group 1
	db  90 percent + 1, KRABBY,     40
	db 100 percent,     KINGLER,    40

.Ocean_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     TENTACOOL,  10
.Ocean_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     TENTACOOL,  20
	db  90 percent + 1, CHINCHOU,   20
	db 100 percent,     time_group 2
.Ocean_Super:
	db  40 percent,     CHINCHOU,   40
	db  70 percent,     time_group 3
	db  90 percent + 1, TENTACRUEL, 40
	db 100 percent,     LANTURN,    40

.Lake_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     GOLDEEN,    10
.Lake_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     GOLDEEN,    20
	db  90 percent + 1, GOLDEEN,    20
	db 100 percent,     time_group 4
.Lake_Super:
	db  40 percent,     GOLDEEN,    40
	db  70 percent,     time_group 5
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     SEAKING,    40

.Pond_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     POLIWAG,    10
.Pond_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     POLIWAG,    20
	db  90 percent + 1, POLIWAG,    20
	db 100 percent,     time_group 6
.Pond_Super:
	db  40 percent,     POLIWAG,    40
	db  70 percent,     time_group 7
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     POLIWAG,    40

.Dratini_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Dratini_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     MAGIKARP,   20
	db  90 percent + 1, MAGIKARP,   20
	db 100 percent,     time_group 8
.Dratini_Super:
	db  40 percent,     MAGIKARP,   40
	db  70 percent,     time_group 9
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     DRAGONAIR,  40

.Chinchou_Swarm_Old:
	db  70 percent + 1, MAGIKARP,   5
	db  85 percent + 1, MAGIKARP,   5
	db 100 percent,     CHINCHOU,   5
.Chinchou_Swarm_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     CHINCHOU,   20
	db  90 percent + 1, CHINCHOU,   20
	db 100 percent,     time_group 10
.Chinchou_Swarm_Super:
	db  40 percent,     CHINCHOU,   40
	db  70 percent,     time_group 11
	db  90 percent + 1, CHINCHOU,   40
	db 100 percent,     CHINCHOU,   40

.OCTILLERY_Swarm_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     OCTILLERY,   10
.OCTILLERY_Swarm_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     OCTILLERY,   20
	db  90 percent + 1, OCTILLERY,   20
	db 100 percent,     time_group 12
.OCTILLERY_Swarm_Super:
	db  40 percent,     OCTILLERY,   40
	db  70 percent,     time_group 13
	db  90 percent + 1, OCTILLERY,   40
	db 100 percent,     OCTILLERY,   40

.Gyarados_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Gyarados_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     MAGIKARP,   20
	db  90 percent + 1, MAGIKARP,   20
	db 100 percent,     time_group 14
.Gyarados_Super:
	db  40 percent,     MAGIKARP,   40
	db  70 percent,     time_group 15
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     MAGIKARP,   40

.Dratini_2_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Dratini_2_Good:
	db  35 percent,     MAGIKARP,   10
	db  70 percent,     MAGIKARP,   10
	db  90 percent + 1, MAGIKARP,   10
	db 100 percent,     time_group 16
.Dratini_2_Super:
	db  40 percent,     MAGIKARP,   10
	db  70 percent,     time_group 17
	db  90 percent + 1, MAGIKARP,   10
	db 100 percent,     DRAGONAIR,  10

.WhirlIslands_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     KRABBY,     10
.WhirlIslands_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     KRABBY,     20
	db  90 percent + 1, KRABBY,     20
	db 100 percent,     time_group 18
.WhirlIslands_Super:
	db  40 percent,     KRABBY,     40
	db  70 percent,     time_group 19
	db  90 percent + 1, KINGLER,    40
	db 100 percent,     SEADRA,     40

.Chinchou_NoSwarm_Old:
.Chinchou_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     TENTACOOL,  10
.Chinchou_NoSwarm_Good:
.Chinchou_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     TENTACOOL,  20
	db  90 percent + 1, TENTACOOL,  20
	db 100 percent,     time_group 20
.Chinchou_NoSwarm_Super:
.Chinchou_Super:
	db  40 percent,     TENTACOOL,  40
	db  70 percent,     time_group 21
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     CHINCHOU,   40

.OCTILLERY_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     POLIWAG,    10
.OCTILLERY_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     POLIWAG,    20
	db  90 percent + 1, POLIWAG,    20
	db 100 percent,     time_group 6
.OCTILLERY_Super:
	db  40 percent,     POLIWAG,    40
	db  70 percent,     time_group 7
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     OCTILLERY,   40

TimeFishGroups:
	;  day              nite
	db STARYU,    20,  STARYU,     20 ; 0
	db STARYU,    40,  STARYU,     40 ; 1
	db SHELLDER,   20,  SHELLDER,   20 ; 2
	db SHELLDER,   40,  SHELLDER,   40 ; 3
	db GOLDEEN,    20,  GOLDEEN,    20 ; 4
	db GOLDEEN,    40,  GOLDEEN,    40 ; 5
	db POLIWAG,    20,  POLIWAG,    20 ; 6
	db POLIWAG,    40,  POLIWAG,    40 ; 7
	db DRATINI,    20,  DRATINI,    20 ; 8
	db DRATINI,    40,  DRATINI,    40 ; 9
	db CHINCHOU,   20,  CHINCHOU,   20 ; 10
	db CHINCHOU,   40,  CHINCHOU,   40 ; 11
	db OCTILLERY,   20,  OCTILLERY,   20 ; 12
	db OCTILLERY,   40,  OCTILLERY,   40 ; 13
	db GYARADOS,   20,  GYARADOS,   20 ; 14
	db GYARADOS,   40,  GYARADOS,   40 ; 15
	db DRATINI,    10,  DRATINI,    10 ; 16
	db DRATINI,    10,  DRATINI,    10 ; 17
	db HORSEA,     20,  HORSEA,     20 ; 18
	db HORSEA,     40,  HORSEA,     40 ; 19
	db TENTACOOL,  20,  TENTACOOL,  20 ; 20
	db TENTACOOL,  40,  TENTACOOL,  40 ; 21
