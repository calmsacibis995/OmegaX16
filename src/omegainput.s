;*--------------------------------------------------*
;* keyboard data (F1, F3, F5, F7) read routine      *
;*--------------------------------------------------*
rdfkey:
	ldx #$FF
	stx ciddra          ;set data direction a
	inx                 ;x=0
	stx ciddrb          ;set data direction b
	ldy #01
	ldx #$FE            ;column 0
	jsr rdrow
	cpx #$EF            ;row 4  F1?
	beq rdf090          ;yes
	ldy #$03            ;y=3
	cpx #$BF            ;row 6  F5?
	beq rdf090          ;yes
	ldy #$02            ;y=2
	cpx #$DF            ;row 5  F3?
	beq rdf090          ;yes
	ldy #$04            ;y=4
	cpx #$F7            ;row 3  F7?
	beq rdf090          ;yes
	ldy #00             ;none key

rdf090:
	rts

rdkey:
	ldx #$FF
	stx ciddra          ;set data direction a
	inx                 ;x=0
	stx ciddrb          ;set data direction b
	lda #$1F            ;make bit a-reg same joystick
	ldx #$FD            ;column 1
	jsr rdrow
	cpx #$FB            ;row 2  A?
	bne @1              ;no
	and #$FB            ;right bit on
	bpl @4
@1:	ldx #$FB            ;column 2
	jsr rdrow
	cpx #$FB            ;row 2  D?
	bne @2              ;no
	and #$F7            ;left bit on
@2:	ldx #$DF            ;column 5
	jsr rdrow
	cpx #$FB            ;row 2  L?
	bne @3              ;no
	and #$EF            ;fire bit on
@3:	ldx #$BF            ;column 6
	jsr rdrow
	cpx #$FB            ;row 2          ;?
	bne @4              ;no
	and #$FE            ;thrust bit on
@4:	sta keysav
	jmp rdjoy           ;after same joystick

;*--------------------------------------------------*
;*  keyboard row read to (x-reg)                    *
;*--------------------------------------------------*
rdrow:
	stx ciapra          ;column out

rdr010:
	ldx ciaprb          ;row input
	cpx ciaprb
	bne rdr010
	rts
