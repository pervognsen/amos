;-----------------------------------------------------------------
; **** *** **** ****
; *     *  *  * *	******************************************
; ****  *  *  * ****	* SPRITES/SOURIS
;    *  *  *  *    *	******************************************
; ****  *  **** ****
;-----------------------------------------------------------------

***********************************************************
*	UPDATE et assimiles

******* Update 
UpOf:	bclr	#5,ActuMask(a5)
	bclr	#6,ActuMask(a5)
	bra	InsRet
UpOn:	bset	#5,ActuMask(a5)
	bset	#6,ActuMask(a5)
	bra	InsRet
******* UPDATE!
UpDa:	movem.l	a3-a6,-(sp)		* Bobs
	move.l	a5,-(sp)
	SyCall	EffBob
	SyCall	ActBob
	SyCall	AffBob
	EcCall	SwapScS
	move.l	(sp)+,a5
	SyCall	ActHs			* Hard sprites
	SyCall	AffHs
	movem.l	(sp)+,a3-a6
	bra	InsRet

******* BOB UPDATE
BUpOf:	bclr	#5,ActuMask(a5)
	bra	InsRet
BUpOn:	bset	#5,ActuMask(a5)
	bra	InsRet
BUpDa:	movem.l	a3-a6,-(sp)		* Bobs
	SyCall	EffBob
	SyCall	ActBob
	SyCall	AffBob
	EcCall	SwapScS
	movem.l	(sp)+,a3-a6
	bra	InsRet

******* SPRITE Update 
SUpOf:	bclr	#6,ActuMask(a5)
	bra	InsRet
SUpOn:	bset	#6,ActuMask(a5)
	bra	InsRet
******* SPRITE UPDATE!
SUpDa:	movem.l	a3-a6,-(sp)
	SyCall	ActHs		
	SyCall	AffHs
	movem.l	(sp)+,a3-a6
	bra	InsRet

******* UPDATE EVERY n
UpEv:	bsr	Expentier
	cmp.l	#65536,d3
	bcc	FonCall
	move.w	d3,VBLDelai(a5)
	bra	InsRet

***********************************************************
*	BOB a la main!
BbClr:	
*******
	movem.l	a3-a6,-(sp)
	SyCall	EffBob
	movem.l	(sp)+,a3-a6
	bra	InsRet
*******
BbDrw:	movem.l	a3-a6,-(sp)
	SyCall	ActBob
	SyCall	AffBob
	movem.l	(sp)+,a3-a6
	bra	InsRet

***********************************************************
*	LIMIT BOB [numero,],x,y to x,y
LBob0:
*******	
	move.l	#EntNul,d2
	move.l	d2,d3
	move.l	d3,d4
	move.l	d4,d5
	moveq	#-1,d1
	bra.s	LBob1
LBob5:
********
	bsr	Expentier
	move.l	d3,-(a3)
	addq.l	#2,a6
	bra.s	LBob
LBob4:	
********
	move.l	#-1,-(a3)
LBob:	moveq	#4,d0
	bsr	ParD0
	move.l	(a3)+,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
LBob1:	SyCall	LimBob
	beq	InsRet
	bra	FonCall

***********************************************************
*	PRIORITY (REVERSE) ON/OFF
IPrOn	moveq	#1,d1
	bra.s	IPrOo
IPrOf	moveq	#0,d1
IPrOo	moveq	#-1,d2
	bra.s	IPrOoo
IPrROn	moveq	#1,d2
	bra.s	IPrROo
IPrROf	moveq	#0,d2
IPrROo	moveq	#-1,d1
IPrOoo	tst.w	ScOn(a5)
	beq	ScNOp
	SyCall	SPrio
	bra	InsRet

***********************************************************
*	CHANNEL x TO SPRITE x
Channel:
********
	bsr	Expentier
	cmp.l	#64,d3
	bcc	Foncall
	addq.l	#2,a6
	move.w	(a6)+,d0
	moveq	#0,d4			* 0-> Sprites
	moveq	#64,d5
	cmp.w	#TkSpr-Tk,d0
	beq.s	ChaX
	addq.w	#1,d4			* 1-> Bobs
	moveq	#64,d5
	cmp.w	#TkBob-Tk,d0
	beq.s	ChaX		
	addq.w	#1,d4			* 2-> Screen display
	moveq	#8,d5
	cmp.w	#TkScD-Tk,d0
	beq.s	ChaX
	addq.w	#1,d4			* 3-> Screen size
	cmp.w	#TkScS-Tk,d0
	beq.s	ChaX
	addq.w	#1,d4			* 4-> Screen offset
	cmp.w	#TkScO-Tk,d0
	beq.s	ChaX
	addq.w	#2,d4			* 6-> Rainbow
	moveq	#4,d5
ChaX:	movem.l	d3-d5,-(sp)
	bsr	Expentier
	movem.l	(sp)+,d4-d6
	cmp.l	d6,d3
	bcc	FonCall
	lsl.w	#1,d4
	lea	AnCanaux(a5),a0
	move.b	d5,0(a0,d4.w)		* 1 => TYPE
	move.b	d3,1(a0,d4.w)		* 2 => NUMERO
	bra	InsRet

***********************************************************
*	= AMALERR
FamE:	moveq	#0,d3
	move.w	PAmalE(a5),d3
	moveq	#0,d2
	bra	OpeRet
***********************************************************
*	FREEZE / UNFREEZE
IFrz	SyCall	AMALFrz
	bra	InsRet
IUFrz	SyCall	AMALUFrz
***********************************************************
*	SYNCHRO ON/OFF
ISOn:	clr.w	InterOff(a5)
	bra.s	ISOo
ISOff:	move.w	#-1,InterOff(a5)
ISoo:	jsr	SyncS
	bra	InsRet
ISync:	SyCall	Synchro
	bra	InsRet

***********************************************************
*	AMAL/MOVE/ANIM on/off/freeze
AmOn0:	moveq	#%0001,d2
	moveq	#1,d3
	bra.s	MvOnOf0
AmOf0:	moveq	#%0001,d2
	moveq	#-1,d3
	bra.s	MvOnOf0
AmFz0:	moveq	#%0001,d2
	moveq	#0,d3
	bra.s	MvOnOf0
MvOn0:	moveq	#%1100,d2
	moveq	#1,d3
	bra.s	MvOnOf0
AnOn0:	moveq	#%0010,d2
	moveq	#1,d3
	bra.s	MvOnOf0
MvOf0:	moveq	#%1100,d2
	moveq	#-1,d3
	bra.s	MvOnOf0
AnOf0:	moveq	#%0010,d2
	moveq	#-1,d3
	bra.s	MvOnOf0
MvFz0:	moveq	#%1100,d2
	moveq	#0,d3
	bra.s	MvOnOf0
AnFz0:	moveq	#%0010,d2
	moveq	#0,d3
MvOnOf0	moveq	#-1,d1
	SyCall	AMALMvO
	bra	InsRet
AmOn1:	moveq	#%0001,d2
	moveq	#1,d3
	bra.s	MvOnOf1
AmOf1:	moveq	#%0001,d2
	moveq	#-1,d3
	bra.s	MvOnOf1
AmFz1:	moveq	#%0001,d2
	moveq	#0,d3
	bra.s	MvOnOf1
MvOn1:	moveq	#%1100,d2
	moveq	#1,d3
	bra.s	MvOnOf1
AnOn1:	moveq	#%0010,d2
	moveq	#1,d3
	bra.s	MvOnOf1
MvOf1:	moveq	#%1100,d2
	moveq	#-1,d3
	bra.s	MvOnOf1
AnOf1:	moveq	#%0010,d2
	moveq	#-1,d3
	bra.s	MvOnOf1
MvFz1:	moveq	#%1100,d2
	moveq	#0,d3
	bra.s	MvOnOf1
AnFz1:	moveq	#%0010,d2
	moveq	#0,d3
MvOnOf1	movem.l	d2-d3,-(sp)
	bsr	Expentier
	move.l	d3,d1
	movem.l	(sp)+,d2-d3
	SyCall	AMALMvO
	bra	InsRet

***********************************************************
*	MOVE X n,a$,ad
InMvX3:	moveq	#3,d0
	bsr	ParD0
	moveq	#2,d3
	bra.s	InAMm3
* 	MOVE Y n,a$,ad
InMvY3:	moveq	#3,d0
	bsr	ParD0
	moveq	#3,d3
	bra.s	InAMm3
*	ANIM n,a$,ad
InAnM3:	moveq	#3,d0
	bsr	ParD0
	moveq	#1,d3
	bra.s	InAMm3
* 	AMAL n,a$,ad
InAm3:	moveq	#3,d0
	bsr	ParD0
	moveq	#0,d3
InAMm3:	move.l	(a3)+,d5
	and.l	#$FFFFFFFE,d5
	bra.s	InMvA3
*	MOVE X n,a$
InMvX:	bsr	Par2
	moveq	#2,d3
	bra.s	InMvA
* 	MOVE Y n,a$
InMvY:	bsr	Par2
	moveq	#3,d3
	bra.s	InMvA
*	AMAL n,a$
InAm:	bsr	Par2
	moveq	#0,d3
	bra.s	InMvA
*	ANIM n,a$
InAnm:	bsr	Par2
	moveq	#1,d3
******* Tokenise
InMvA:	moveq	#0,d5
InMvA3:	move.l	(a3)+,a1
	move.l	(a3)+,d6
	clr.w	PAmalE(a5)
* 16 si inter / 64 sinon!
	moveq	#16,d0
	tst.w	InterOff(a5)
	beq.s	InMva1
	moveq	#64,d0
InMva1:	cmp.l	d0,d6			* Nombre autorise
	bcc	FonCall
* Trouve la banque AMAL (numero 2)
	moveq	#0,d7
	move.l	ABanks(a5),a0
	move.l	8*3(a0),d0
	beq.s	InMb1
	move.l	d0,a0
	move.l	(a0),d0
	cmp.l	BkAmal,d0
	bne	InMb1
	lea	8(a0),a0
	move.l	a0,d7
* Est-ce une chaine ou un numero?
InMb1:	cmp.l	#8192,a1
	bcc.s	InMb2
* Dans la banque!
	tst.l	d7
	beq	BkNoRes
	tst.l	(a0)
	beq	FonCall
	add.l	(a0),a0
	move.w	a1,d0
	move.l	ChVide(a5),a1
	cmp.w	(a0)+,d0
	bhi	FonCall
	lsl.w	#1,d0
	move.w	0(a0,d0.w),d0
	beq.s	InMb2
	lsl.w	#1,d0
	lea	0(a0,d0.w),a1
* Une chaine!
InMb2:	move.w	(a1)+,d0		* Met un zero a la fin de la chaine
	lea	0(a1,d0.w),a0
	move.b	(a0),d0
	clr.b	(a0)
	move.w	d0,-(sp)
	move.l	a0,-(sp)
	move.l	Buffer(a5),a2		* Buffer de tokenisation
	move.l	#TBuffer-256-64,d2
	move.l	a2,d1			* Buffer variables
	add.l	#TBuffer-256,d1
	tst.l	d5			* Numeros des canaux
	beq.s	InAMv0
	moveq	#5,d4
	bra.s	InAmv2
InAMv0:	lea	AnCanaux(a5),a0
	add.w	d6,a0
	add.w	d6,a0
	moveq	#0,d4
	moveq	#0,d5
	move.b	(a0)+,d4
	move.b	(a0)+,d5
InAMv2:	SyCall	AMALCre
	move.l	(sp)+,a1		* Remet la chaine!
	move.w	(sp)+,d7
	move.b	d7,(a1)
	tst.w	d0
	beq	InsRet
	bpl.s	IAmE
	cmp.w	#-1,d0
	beq	OOfMem
	neg.w	d0
	bra	EcWiErr
IAmE:	move.w	a0,PAmalE(a5)		* Offset de l'erreur
	add.w	#SpEBase+2,d0
	bra	RunErr

***********************************************************
*	=MOVON(n)
FMovon	bsr	FnAm1
	SyCall	Movon
FnAm2	move.l	d1,d3
	moveq	#0,d2
	bra	OpeRet
*	=CHANAN(x)
FChanA	bsr	FnAm1
	SyCall	ChanA
	bra	FnAm2
*	=CHANMV(x)
FChanM	bsr	FnAm1
	SyCall	ChanM
	bra.s	FnAm2
FnAm1	bsr	FnExpE
	move.l	d3,d1
	bmi	FonCall
	cmp.l	#64,d1
	bcc	FonCall
	rts
***********************************************************
*	=AMREG(n[,n])=
IAmR1:	move.l	#EntNul,-(a3)
	bsr	FnPar1
	bra.s	IAmR
IAmR2:	bsr	FnPar2
IAmR:	bsr	AmRR
	move.l	a0,-(sp)
	bsr	FnExpE
	move.l	(sp)+,a0
	move.w	d3,(a0)
	bra	InsRet
FAmR1:	move.l	#EntNul,-(a3)
	bsr	FnPar1
	bra.s	FAmR
FAmR2:	bsr	FnPar2
FAmR:	bsr	AmRR
	move.w	(a0),d3
	ext.l	d3
	moveq	#0,d2
	bra	OpeRet
* Pitite routine
AmRR:	move.l	(a3)+,d3
	moveq	#0,d2
	move.l	(a3)+,d1
	cmp.l	#EntNul,d1
	bne.s	IAmRa
	cmp.l	#26,d3
	bcc	FonCall
	moveq	#-1,d1
	bra.s	IAmRb
IAmRa:	cmp.l	#64,d1
	bcc	FonCall
	cmp.l	#10,d3
	bcc	FonCall
IAmRb:	SyCall	AMALReg
	bmi	FonCall
	rts

***********************************************************
*	AMPLAY Speed,Dir[,n to m]
IAmP2:	bsr	Par2
	clr.l	-(a3)
	move.l	#63,-(a3)
	bra.s	IAmP
IAmP4:	moveq	#4,d0
	bsr	ParD0
IAmP:	move.l	(a3)+,d2
	cmp.l	#64,d2
	bcc	FonCall
	move.l	(a3)+,d1
	bmi	FonCall
	cmp.l	d1,d2
	bcs	FonCall
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	SyCall	PlaySet
	bra	InsRet

***********************************************************
*	=XY BOB(n)
FXBob:	bsr	FnExpE
	move.l	d3,d1
	bmi	FonCall
	SyCall	XYBob
	bne	FonCall
	move.w	d1,d3
	ext.l	d3
	moveq	#0,d2
	bra	OpeRet
FYBob:	bsr	FnExpE
	move.l	d3,d1
	bmi	FonCall
	SyCall	XYBob
	bne	FonCall
	move.w	d2,d3
	ext.l	d3
	moveq	#0,d2
	bra	OpeRet
***********************************************************
*	=XY SPRITE(n)
FXSp:	bsr	FnExpE
	move.l	d3,d1
	bmi	FonCall
	SyCall	XYSp
	bne	FonCall
	move.w	d1,d3
	ext.l	d3
	moveq	#0,d2
	bra	OpeRet
FYSp:	bsr	FnExpE
	move.l	d3,d1
	bmi	FonCall
	SyCall	XYSp
	bne	FonCall
	move.w	d2,d3
	ext.l	d3
	moveq	#0,d2
	bra	OpeRet
***********************************************************
*	=I BOB / I SPRITE
FIBb:	bsr	FnExpE
	move.l	d3,d1
	bmi	FonCall
	SyCall	XYBob
	bne	FonCall
	ext.l	d3
	moveq	#0,d2
	bra	OpeRet
FISp:	bsr	FnExpE
	move.l	d3,d1
	bmi	FonCall
	SyCall	XYSp
	bne	FonCall
	ext.l	d3
	moveq	#0,d2
	bra	OpeRet

***********************************************************
*	=X / Y MOUSE
XMou:	SyCall	XyMou
	move.w	d1,d3
	ext.l	d3
	moveq	#0,d2
	bra	OpeRet
YMou:	SyCall	XyMou
	move.w	d2,d3
	ext.l	d3
	moveq	#0,d2
	bra	OpeRet
***********************************************************
*	X / Y MOUSE=
SXMou	bsr	FnExpE
	move.l	d3,d1
	move.l	#EntNul,d2
	bra.s	SXYMou
SYMou	bsr	FnExpE
	move.l	d3,d2
	move.l	#EntNul,d1
SXYMou	SyCall	SetM
	bra	InsRet
***********************************************************
*	=MOUSEKEY
MouK:	SyCall	MouseKey
MouK1	moveq	#0,d3
	move.w	d1,d3
	moveq	#0,d2
	bra	OpeRet
MouKR	SyCall	MouRel
	bra.s	MouK1
***********************************************************
*	HIDE ON HIDE
IHidO:	SyCalD	Hide,-1
	bra	InsRet
IHide:	SyCalD	Hide,0
	bra	InsRet
***********************************************************
*	SHOW ON SHOW
IShoO:	SyCalD	Show,-1
	bra	InsRet
IShow:	SyCalD	Show,0
	bra	InsRet
***********************************************************
*	LIMIT MOUSE
ILimM0	moveq	#0,d1
ILimM2	tst.w	ScOn(a5)
	beq	ScNOp
	SyCall	LimitMEc
	beq	InsRet
	bne	EcWiErr
ILimM1	bsr	Expentier
	move.l	d3,d1
	bmi	FonCall
	addq.l	#1,d1
	cmp.l	#8,d1
	bhi	ILimM2
	bra	FonCall
ILimM4	tst.w	ScOn(a5)
	beq	ScNOp
	moveq	#4,d0
	bsr	ParD0
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	SyCall	LimitM
	bra	InsRet
	
***********************************************************
*	CHANGE MOUSE n
ChMou:	
*******
	bsr	Expentier
	subq.l	#1,d3
	bmi	FonCall
	move.l	d3,d1
	SyCall	ChangeM
	bra	InsRet

***********************************************************
*	SET BOB n,back,planes,minterm
IStBb	moveq	#4,d0
	bsr	ParD0
	move.l	(a3)+,d7
	move.l	(a3)+,d6
	move.l	(a3)+,d5
	move.l	#EntNul,d4
	move.l	d4,d3
	move.l	d3,d2
	move.l	(a3)+,d1
	cmp.l	d4,d7
	bne.s	IStb1
	moveq	#0,d7
IStb1	cmp.l	d4,d6
	bne.s	IStb2
	moveq	#-1,d6
IStb2	cmp.l	d4,d5
	bne.s	IStb3
	moveq	#0,d5
IStb3	bra.s	BbSt
***********************************************************
*	BOB n,x,y,a
BbSt4:	
********
	moveq	#4,d0
	bsr	ParD0
	moveq	#0,d7
	moveq	#-1,d6
	moveq	#0,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
BbSt	tst.w	ScOn(a5)
	beq	ScNOp
	SyCall	SetBob
	beq	InsRet	
	bmi	OOfMem
	bra	FonCall


***********************************************************
*	BOB OFF x
BbOff1:	
********
	bsr	Expentier
	move.l	d3,d1
	SyCall	OffBob
	bra	InsRet

***********************************************************
*	BOB OFF
BbOff0:
*******
	SyCall	OffBobS
	bra	InsRet

***********************************************************
*	SET SPRITE BUFFER
SsBuf:	bsr	Expentier
	move.l	d3,d1
	cmp.l	#16,d1
	bcs	FonCall
	SyCall	SBufHs
	beq	InsRet
	moveq	#0,d0
* Entree erreurs sprites
SpErr:	add.w	#SpEBase,d0
	bra	RunErr	

***********************************************************
*	SPRITE PRIORITY n
SpPri:
********
	tst.w	ScOn(a5)
	beq	ScNOp
	bsr	Expentier
	move.l	d3,d1
	cmp.l	#4,d1
	bhi	FonCall
	SyCall	PriHs
	bra	InsRet

***********************************************************
*	SPRITE n,x,y,a
SpSp:	
********
	moveq	#4,d0
	bsr	ParD0
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	SyCall	NXYAHs
	bne	FonCall
	bset	#6,T_Actualise(a5)
	bra	InsRet

***********************************************************
*	SPRITE OFF x
SpOff1:	
********
	bsr	Expentier
	move.l	d3,d1
	SyCall	XOffHs
	bne	FonCall
	bset	#6,T_Actualise(a5)
	bra	InsRet

***********************************************************
*	SPRITE OFF
SpOff0:
*******
	SyCall	OffHs
	bset	#6,T_Actualise(a5)
	bra	InsRet

***********************************************************
*	Collisions hard!
*******	SET HARDCOL enable,compare
IHCol	bsr	Par2
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	moveq	#$0F,d1
	SyCall	SetHCol
	bra	InsRet
******* =HARDCOL(sprite)
FHCol	bsr	FnExpE
	tst.l	d3
	bmi.s	FHc1
	cmp.l	#8,d3
	bcc	FonCall
FHc1	move.w	d3,d1
	SyCall	GetHCol
	move.l	d1,d3
	moveq	#0,d2
	bra	OpeRet

***********************************************************
*	= BOBSPRITE COL(n[,x to y])
FBSCol1	bsr	FnExpE
	move.l	d3,d1
	bmi	FonCall
	moveq	#0,d2
	bset	#31,d2
	moveq	#63,d3
	bra.s	IBbCo
FBSCol3	moveq	#3,d0
	bsr	FnParD0
	move.l	(a3)+,d3
	bmi	FonCall
	cmp.l	#63,d3
	bhi	FonCall
	move.l	(a3)+,d2
	bmi	FonCall
	bset	#31,d2
	move.l	(a3)+,d1
	bmi	FonCall
	bra.s	IBbCo
***********************************************************
*	= BOB COL(n[,x to y])
IBbCol1	bsr	FnExpE
	move.l	d3,d1
	bmi	FonCall
	moveq	#0,d2
	move.l	#10000,d3
	bra.s	IbbCo
IBbCol3	moveq	#3,d0
	bsr	FnParD0
	move.l	(a3)+,d3
	bmi	FonCall
	move.l	(a3)+,d2
	bmi	FonCall
	move.l	(a3)+,d1
	bmi	FonCall
IBbCo:	SyCall	ColBob
	move.l	d0,d3
	moveq	#0,d2
	bra	OpeRet

***********************************************************
*	= SPRITEBOB COL([,x to y])
FSBCol1	bsr	FnExpE
	move.l	d3,d1
	bmi	FonCall
	moveq	#0,d2
	bset	#31,d2
	move.l	#10000,d3
	bra.s	ISpCo
FSBCol3	moveq	#3,d0
	bsr	FnParD0
	move.l	(a3)+,d3
	bmi	FonCall
	move.l	(a3)+,d2
	bmi	FonCall
	bset	#31,d2
	move.l	(a3)+,d1
	bmi	FonCall
	bra.s	ISpCo
***********************************************************
*	= SPRITE COL[,x to y])
ISpCol1	bsr	FnExpE
	move.l	d3,d1
	bmi	FonCall
	moveq	#0,d2
	moveq	#63,d3
	bra.s	ISpCo
ISpCol3	moveq	#3,d0
	bsr	FnParD0
	move.l	(a3)+,d3
	bmi	FonCall
	cmp.l	#63,d3
	bhi	FonCall
	move.l	(a3)+,d2
	bmi	FonCall
	move.l	(a3)+,d1
	bmi	FonCall
ISpCo:	SyCall	ColSpr
	move.l	d0,d3
	moveq	#0,d2
	bra	OpeRet

***********************************************************
*	= COL(n)
FnColl:	bsr	FnExpE
	move.l	d3,d1
	SyCall	ColGet
	move.l	d0,d3
	moveq	#0,d2
	bra	OpeRet

***********************************************************
*	MAKE ICON MASK [n]
MkIMs0	moveq	#1,d1
	bsr.s	AAdIcon
	bra.s	MkM0
MkIMs1	bsr	Expentier
	move.l	d3,d1
	bsr.s	AAdIcon
	bra.s	MkM1
*	NO ICON MASK [n]
NoIMs0	moveq	#1,d1
	bsr.s	AAdIcon
	bra.s	NoM0
NoIMs1	bsr	Expentier
	move.l	d3,d1
	bsr.s	AAdIcon
	bra.s	NoM1
AAdIcon	bsr	AdIcon
	bne	RunErr
	rts
AAdBob	bsr	AdBob
	bne	RunErr
	rts
***********************************************************
*	MAKE MASK [n]
MkMask0:moveq	#1,d1
	bsr	AAdBob
MkM0	subq.w	#1,d7
	bra.s	MkMa1
MkMask1:bsr	Expentier
	move.l	d3,d1
	bsr	AAdBob
MkM1	moveq	#0,d7
MkMa1:	tst.l	(a2)
	beq.s	MkMa2
	SyCall	MaskMk
	bne	OOfMem
MkMa2:	addq.l	#8,a2
	dbra	d7,MkMa1
	bra	InsRet
******* NO MASK [n]
NoMask0:moveq	#1,d1
	bsr	AAdBob
NoM0	subq.w	#1,d7
	bra.s	NoMa1
NoMask1:bsr	Expentier
	move.l	d3,d1
	bsr	AAdBob
NoM1	moveq	#0,d7
NoMa1:	tst.l	(a2)
	beq.s	NoMa3
	tst.l	4(a2)
	ble.s	NoMa2
	move.l	4(a2),a1
	move.l	(a1),d0
	jsr	RamFree
NoMa2:	move.l	#$C0000000,4(a2)
NoMa3:	addq.l	#8,a2
	dbra	d7,NoMa1
	bra	InsRet

***********************************************************
*	HOT SPOT n,x,y / n,x
HotSp3:	moveq	#3,d0
	bsr	ParD0
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	moveq	#0,d1
	bra.s	HotSp
HotSp2:	bsr	Par2
	move.l	(a3)+,d1
	and.w	#%01110111,d1
	addq.w	#1,d1
HotSp:	movem.w	d1-d3,-(sp)
	move.l	(a3)+,d1
	bsr	AAdBob
	movem.w	(sp)+,d1-d3
	SyCall	SpotHot
	beq	InsRet
	bra	FonCall

***********************************************************
*	GET SPRITE/BOB [sc,]n,x,y to x,y
GetSp6:	bsr	Expentier
	move.l	d3,d1
	EcCall	AdrEc
	beq	ScNOp
	move.l	d0,-(sp)
	addq.l	#2,a6
	bra.s	GetSp0
GetSp5:	move.l	ScOnAd(a5),-(sp)
	beq	ScNOp
GetSp0:	moveq	#5,d0
	bsr	ParD0
	move.l	(sp),a0
	bsr	Ritoune
* Adresse du descripteur --> A2
	moveq	#0,d0			* Ne pas effacer
	bsr	ResSpr
	bne	OOfMem
	bsr	EfPointe
* Appelle la trappe
	move.l	(sp)+,a1		* Ecran en A1
	SyCall	SprGet
	beq	InsRet
	bne	OOfMem
***********************************************************
*	GET ICON [sc,]n,x,y to x,y
GetIc6:	bsr	Expentier
	move.l	d3,d1
	EcCall	AdrEc
	beq	ScNOp
	move.l	d0,-(sp)
	addq.l	#2,a6
	bra.s	GetIc0
GetIc5:	move.l	ScOnAd(a5),-(sp)
	beq	ScNOp
GetIc0:	moveq	#5,d0
	bsr	ParD0
	move.l	(sp),a0
	bsr	Ritoune
* Adresse du descripteur --> A2
	moveq	#0,d0			* Ne pas effacer
	bsr	ResIco
	bne	OOfMem
	bsr	EfPointe
* Appelle la trappe
	move.l	(sp)+,a1		* Ecran en A1
	SyCall	SprGet
	bne	OOfMem
	move.l	#$C0000000,4(a2)	* Pas de masque!
	bra	InsRet
******* Calcule taille
Ritoune	move.l	(a3)+,d5
	bmi	FonCall
	move.l	(a3)+,d4
	bmi	FonCall
	move.l	(a3)+,d3
	bmi	FonCall
	move.l	(a3)+,d2
	bmi	FonCall
	move.l	(a3)+,d1
	bls	FonCall
* Calcule taille
	cmp.w	EcTx(a0),d4
	bhi	FonCall
	move.w	d4,d6
	cmp.w	EcTy(a0),d5
	bhi	FonCall
	sub.w	d2,d4
	bls	FonCall
	sub.w	d3,d5
	bls	FonCall
	rts

*******************************************************
*	PUT BOB n
IPBob:	bsr	Expentier
	move.l	d3,d1
	bmi	FonCall
	SyCall	PutBob
	beq	InsRet
	bra	FonCall

*******************************************************
*	Fonctions retournement
FRevX	bsr	FnExpE
	bset	#15,d3
	moveq	#0,d2
	bra	OpeRet
FRevY	bsr	FnExpE
FRv	bset	#14,d3
	moveq	#0,d2
	bra	OpeRet
FRev	bsr	FnExpE
	bset	#15,d3
	bra.s	FRv
***********************************************************
*	PATCH BOB x,y,n
PatBb
*******
	moveq	#3,d0
	bsr	ParD0
	move.l	(a3),d1
	bmi	FonCall	
	bsr	AdBob
	bne	RunErr
	tst.l	(a2)
	beq.s	PatBbe
PatIc1	move.l	(a3)+,d1
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	BufBob(a5),a1
	moveq	#0,d4
	moveq	#-1,d5
	SyCall	Patch
	bra	InsRet
PatBbe	moveq	#24,d0
	bra	EcWiErr

***********************************************************
*	PATCH ICON x,y,n
PatIc	
*******
	moveq	#3,d0
	bsr	ParD0
	move.l	(a3),d1
	bmi	FonCall	
	bsr	AdIcon
	bne	RunErr
	tst.l	(a2)
	beq.s	.Err
	tst.l	4(a2)
	bmi.s	PatIc1
	bne.s	PatIc1
	move.l	#$C0000000,4(a2)
	bra.s	PatIc1
.Err	moveq	#30,d0
	bra	EcWiErr

***********************************************************
*	=SPRITE BASE(n)
*	=ICON BASE(n)
FSBase	pea	AdBob(pc)
	bra.s	FsBi
FIBase	pea	AdIcon(pc)
FsBi	bsr	FnExpE
	move.l	d3,d1
	bpl	FsBi1
	neg.l	d1
FsBi1	move.l	(sp)+,a0
	jsr	(a0)
	bne	RunErr
	tst.l	d3
	bpl.s	FsBi2
	addq.l	#4,a2
FsBi2	move.l	(a2),d3
	moveq	#0,d2
	bra	OpeRet



