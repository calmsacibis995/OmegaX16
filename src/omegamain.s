;*--------------------------------------------------*
;*   M A I N   P R O C E D U R E .                  *
;*--------------------------------------------------*
main:
	jsr gminit          ;game initialize

main10:
	jsr rdinit          ;round initialize

;
;*----- in game loop -------------------------------*
;
main20:
	lda scroly
	bpl main20          ;sync with raster
	jsr set7f8          ;used dbg.
	lda spspcl          ;get collision
	sta collss
	lda spbgcl
	sta collsc
;
;----- used timer counter up down
;
	inc timer1
	lda timer1
	and #$3F
	bne main30
	dec en0wtv          ;dec at one second
	dec en3wtv          ;dec at one second

main30:
	inc timer2
	bne @1
	inc timer3
@1:	inc cyclep
	lda cyclep
	and #$0F
	sta cyclep          ;cycle 0 to F
	and #$07
	sta cycle           ;cycle 0 to 7
;
;----- call parts subroutine
;
	jsr shpmov          ;player ship update
	jsr mslset          ;missle setup
	jsr mslmov          ;missle update
	jsr en1mov          ;enemies1 update
	jsr en2mov          ;enemies2 update
	jsr en3mov          ;enemies3 update
	jsr en0set          ;enemy0 bigen
	jsr en1set          ;enemy1 bigen
	jsr en3set          ;enemy1 bigen
	jsr somone          ;flame on-off by time
	jsr soundm          ;sound on-off by time
;
;----- check game over
;
	lda numshp          ;all player ships gone?
	and timer3          ;after wait
	bmi gmover          ;yes, game over
	lda snddat          ;clare sound off?
	bne main40          ;no
	lda numenm          ;all enemies kill?
	and timer3          ;after wait
	bmi main10          ;yes, initialize new round

main40:
	lda sprita          ;one ship gone?
	and timer3          ;after wait
	bmi main10          ;yes
	jmp main20          ;in game loop

;
;----- check after game over
;
gmover:
	ldx #02
	cmp score,x         ;hi-score?
	bcc gmov20          ;yes
	bne gmov30          ;no
	dex
	bpl gmov10

gmov20:
	lda score           ;save the high score
	sta lscore
	lda score+1
	sta lscore+1
	lda score+2
	sta lscore+2
	jsr dsphsc          ;display high-score

gmov30:
	lda #00
	sta sigvol          ;turn sounds off
	inc watchr          ;character display wait flag on
	ldx #<overms        ;game over message
	ldy #>overms
	jsr chrout
	ldx #$FF
	jsr wait            ;wait after display
	jmp attrac
	rts
