.define player_pos $0200
.define command_address $4000
.ORG $8000
start:
LDX #$FF
TXS

LDX #0

loop:
LDA #1
STA player_pos, X
LDA command_address
BNE else
JMP loop
else:
JSR clear
JSR command
JMP loop


command:
CMP #08
BEQ move_right
CMP #04
BEQ move_left
CMP #01
BEQ move_up
CMP #02
BEQ move_down
RTS
move_right:
INX
RTS
move_left:
DEX
RTS
move_up:
TXA 
SEC
SBC #16
TAX
RTS
move_down:
TXA
CLC
ADC #16
TAX
RTS


clear:
TAY
LDA #0
STA player_pos, X
TYA
RTS


.goto $FFFA
.dw start
.dw start 
.dw start