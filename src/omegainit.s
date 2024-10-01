;*--------------------------------------------------*
;*  power-on start                                  *
;*--------------------------------------------------*

	.org $0801          ;game entry point

start:
	jsr load_msg
	jsr ioinit

load_msg:
	ldx #0
	lda load_msg_text,x

;
; initialize the commander's hardware
;
ioinit:
	; Scale and geometry
	lda #64
	sta VERA_DC_HSCALE  ;horizontal scale
	sta VERA_DC_VSCALE  ;vertical scale
	sei                 ;disable interrupts
	lda #2
	sta VERA_CTRL       ;enable DC select
	lda #0
	sta VERA_DC_HSTART  ;H-START
	lda #160
	sta VERA_DC_HSTOP   ;H-STOP
	lda #0
	sta VERA_DC_VSTART  ;V-START
	lda #240
	sta VERA_DC_VSTOP   ;V-STOP
	lda #0
	sta VERA_CTRL       ;disable DC select
	cli                 ;enable interrupts
	lda #3
	sta VERA_L0_HSCROLL_H ;move palette for layer 0 (bitmap)
	lda #96
	sta VERA_L1_CONFIG  ;set layer 1 (text mode)
	lda #216
	sta VERA_L1_MAPBASE ;set text mode vram base address to $1,B000
	lda #248
	sta VERA_L1_TILEBASE ;set character bitmap vram location to $1,F000

ramini:
	sta $0002,x
	sta $0200,x
	sta $0300,x
	inx
	bne ramini
	lda #blue           ;ship default color
	sta color
	lda #white          ;back default color
	sta color+1
	lda #$1F
	sta keysav          ;initialize key save
