	.org $02

begin:	.res 0

;
;----- working register in closed routine
;

wk0:	.res 1
wk1:	.res 1
wk2:	.res 1
wk3:	.res 1
wk4:	.res 1
wk5:	.res 1
wk6:	.res 1
wk7:	.res 1
wk8:	.res 1
wk9:	.res 1

color:	.res 2          ;color of ship & character (default white)
scanf:	.res 1          ;input scan flag (0=keyboard 1=snes controller)
collss:	.res 1          ;collision sprite to sprite
collsc:	.res 1          ;collision sprite to character
timer1:	.res 1          ;inc. timer at 16ms (one sync)
timer2:	.res 1          ;inc. timer at 16ms
timer3:	.res 1          ;inc. timer at 256 x 16ms
cycle:	.res 1          ;inc. cycle 0 to 7 at 16ms
cyclep:	.res 1
watchr:	.res 1          ;character display wait flag
lscore:	.res 3          ;last high score
score:	.res 3          ;player's score
fire:	.res 1
dfire:	.res 1
rotate:	.res 1
thrust:	.res 1
ftime:	.res 1
acssel:	.res 1          ;ship acssel 0 to 0b
killsp:	.res 1          ;ship kill sw timer
numshp:	.res 1          ;player's ship number
numenm:	.res 1          ;enemies number
xtra:	.res 1          ;bonus check flag
round:	.res 1          ;round counter
lintim:	.res 8          ;flame on-off time
enrote:	.res 1          ;enemies rotation
en0wtf:	.res 1          ;enemy0 make interval time fix
en0wtv:	.res 1          ;enemy0 make interval time valiable
en1wtf:	.res 1          ;enemy1 move wait time fix
en1wtv:	.res 1          ;enemy1 move wait time valiable
en2wtf:	.res 1          ;enemy2 move wait time fix
en2wtv:	.res 1          ;enemy2 move wait time valiable
en3wtf:	.res 1          ;enemy3 make interval time fix
en3wtv:	.res 1          ;enemy3 make interval time valiable
enmy2a:	.res 11         ;enemy2 move table
enmy3a:	.res 8          ;enemy3 move table
en2yp:	.res 11         ;enemy2 y pointer
en3yp:	.res 8          ;enemy3 y pointer

