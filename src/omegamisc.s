;*--------------------------------------------------*
;*  chrout  : character out  .x(low) .y(high)       *
;*--------------------------------------------------*
chrout:
	stx wk0
	sty wk0+1

chr010:
	ldy #00
	sty wk5             ;out chr. index
	lda (wk0),y
	sta wk2             ;out address low
	iny
	lda (wk0),y
	sta wk3             ;out address high

chr020:
	iny
	lda (wk0),y
	cmp #$FF
	beq chr090          ;exit
	cmp #$FE
	beq chr030          ;change out address
	cmp #$FD
	beq chr040          ;select next line
	sty wk4             ;y save
	ldy wk5             ;chr. out index
	sta (wk2),y         ;chr. out
	inc wk5
	ldy wk4             ;y get
	lda watchr          ;display wait?
	beq chr020          ;no
	ldx #10
	jsr wait
	jmp chr020

chr030:
	iny
	clc                 ;(wk0,wk0+1)=y+(wk0,wk0+1)
	tya
	adc wk0
	sta wk0
	lda wk0+1
	adc #0
	sta wk0+1
	jmp chr010

chr040:
	clc
	lda wk2
	adc #40
	sta wk2
	lda wk3
	adc #00
	sta wk3
	lda #00
	sta wk5
	beq chr020          ;jmp

chr090:
	lda #00
	sta watchr
	rts

;*--------------------------------------------------*
;*  wait a few sec.  (16ms * x)                     *
;*--------------------------------------------------*
wait:
	lda scroly          ;get sync
	bpl wait

wait10:
	lda wait10
	bmi wait10
	dex
	bne wait
	rts
