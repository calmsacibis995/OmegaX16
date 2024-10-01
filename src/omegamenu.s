;*--------------------------------------------------*
;*  attract mode                                    *
;*--------------------------------------------------*
attrac:
	jsr clrcrt
	ldx #<title         ;low address
	ldy #>title         ;high address
	jsr chrout
	ldx #07

atr010:
	lda color
	sta sp0col,x
	dex
	bpl atr010

atr020:
	jsr rdfkey          ;read keyboard: F1 (Y=1), F3 (Y=2), F5 (Y=3), F7 (Y=4)
	dey
	bmi atr030          ;none select
	cpy #03-1           ;F5 ship color change?
	bne atr024          ;no, select F1, F3, or F5

;
;----- ship color change
;
atr022:
	jsr rdfkey          ;off wait
	tya
	bne atr022
	inc color
	lda color
	and #$0F
	sta color
	bpl attrac          ;jmp

atr024:
	cpy #04-1           ;F7 screen color change?
	bne atr050          ;no, select F1 or F3s