
;-----------------------------------------------------------------
; **** *** **** ****
; *     *  *  * *	******************************************
; ****  *  *  * ****	* MENUS
;    *  *  *  *    *	******************************************
; ****  *  **** ****
;-----------------------------------------------------------------

***********************************************************

*******	EVERY n GOSUB / PROC
IEve:	bclr	#BitEvery,ActuMask(a5)
	bsr	Expentier
	tst.l	d3
	beq	FonCall
	cmp.l	#32767,d3
	bcc	FonCall
	move.w	d3,EveCharge(a5)
	move.w	d3,T_EveCpt(a5)
	move.w	(a6)+,EveType(a5)
	bsr	GetLabel
	beq	LbNDef
	move.l	d0,EveLabel(a5)
	bset	#BitEvery,ActuMask(a5)
	bra	InsRet
******* EVERY OFF
IEvOf	bclr	#BitEvery,ActuMask(a5)
	bra	InsRet
******* EVERY ON
IEvOn	bset	#BitEvery,ActuMask(a5)
	bra	InsRet
******* Fait le branchement a EVERY
EveJump	tst.l	EveLabel(a5)
	beq.s	EveJ0
	move.l	a0,-(sp)
	lea	8+4(sp),a0
	cmp.l	BasSp(a5),a0
	beq.s	EveJ1
	move.l	(sp)+,a0
EveJ0	rts
* Branche!
EveJ1	move.w	d7,ActuMask(a5)
	move.l	BasSp(a5),sp
	move.w	EveType(a5),d0
	cmp.w	#TkGsb-Tk,d0
	beq.s	EveJ2
* Procedure!
	lea	-2(a4),a6
	move.l	EveLabel(a5),a2
	clr.w	-(sp)
	bra	InProE
* Gosub
EveJ2	move.l	EveLabel(a5),d0
	lea	-2(a4),a6
	bra	Gos2

***********************************************************
*	ON MENU GOTO/GOSUB/PROC
*	MENU KEY

******* MENU KEY
IMnk	bsr	MnDim
	tst.l	MnLat(a2)
	bne	FonCall
	cmp.w	#TkTo-Tk,(a6)
	bne.s	IMnK2
	move.l	a2,-(sp)
	addq.l	#2,a6
	bsr	Evalue
	cmp.b	#2,d2
	beq.s	IMnk1
* Scancode, shifts
	move.l	d3,-(sp)
	moveq	#0,d3
	cmp.w	#TkVir-Tk,(a6)
	bne.s	IMnk0
	bsr	FnExpE
Imnk0	move.l	(sp)+,d2
	move.l	(sp)+,a2
	cmp.l	#256,d3
	bcc	FonCall
	move.b	d3,MnKSh(a2)
	cmp.l	#128,d2
	bcc	FonCall
	move.b	d2,MnKSc(a2)
	move.b	#-1,MnKFlag(a2)
	bra	InsRet
* "n"
IMnk1	move.l	(sp)+,a2
	move.l	d3,a0
	tst.w	(a0)+
	beq	FonCall
	move.b	(a0),MnKAsc(a2)
	move.b	#1,MnKFlag(a2)
	bra	InsRet
* Arret!
IMnk2	clr.b	MnKFlag(a2)
	bra	InsRet

******* Exploration des MENU KEY
*	d4->	Ascii
*	d5->	Scan
*	d6->	Shift
MnKExp	movem.l	a0-a3/d0-d7,-(sp)
	link	a3,#-(MnNDim*2+2)
	move.l	a3,a1
	move.w	T_ClLast+2(a5),d4
	move.b	T_ClLast+1(a5),d5
	move.b	T_ClLast(a5),d6
	move.l	MnBase(a5),d0
	bsr	MnKE0
	clr.l	T_ClLast(a5)
	unlk	a3
	movem.l	(sp)+,a0-a3/d0-d7
	rts
******* Routine recursive
MnKE0	clr.w	-2(a1)
MnKE1	move.l	d0,a2
	move.w	MnNb(a2),d7
	move.l	MnLat(a2),d0
	beq.s	MnKE2
	move.w	d7,-(a1)	
	move.l	a2,-(sp)
	bsr	MnKE0
	move.l	(sp)+,a2
	clr.w	(a1)+
	bra.s	MnKEN
* Compare les touche (si fin de branche)
MnKE2	move.b	MnKFlag(a2),d0
	beq.s	MnKEN
	bmi.s	MnKE3
* Code ASCII
	cmp.b	MnKAsc(a2),d4
	beq.s	MnKET
	bne.s	MnKEN
* Shift et Scancode
MnKE3	cmp.b	MnKSc(a2),d5
	bne.s	MnKEN
	cmp.b	MnKSh(a2),d6
	beq.s	MnKET
* Suivant
MnKEN	move.l	MnNext(a2),d0
	bne.s	MnKE1
	rts
******* Trouve!!!
MnKET:	lea	MnChoix(a5),a0
	move.l	a0,a1
	moveq	#MnNDim-1,d0
MnKet1	clr.w	(a0)+
	dbra	d0,MnKet1
	move.l	a3,a0
MnKet2	move.w	-(a0),d0
	beq.s	MnKet3
	move.w	d0,(a1)+
	addq.l	#8,sp
	bra.s	MnKet2
MnKet3	move.w	d7,(a1)+
	move.w	#-1,MnChoice(a5)
	bset	#BitJump,T_Actualise(a5)
	rts

******* Fait le branchement
GoMenu	move.l	a0,-(sp)
	move.l	BasSp(a5),a0			* Appel NORMAL?
	lea	-8-4(a0),a0
	cmp.l	a0,a7
	bne	GoMX
	tst.w	Direct(a5)			* Mode direct???
	bne	GoMX
	lea	MnChoix(a5),a0
	move.w	(a0),d0
	beq.s	GoMX
	cmp.w	OMnNb(a5),d0
	bls.s	GoMGo
* Rien trouve: FINI!
GoMX:	move.l	(sp)+,a0
	rts
******* Fait le branchement
GoMGo	bclr	#BitJump,d7		* Plus de jump!
	move.w	d7,ActuMask(a5)
	move.w	d6,T_Actualise(a5)	* Derniere bug avant master!
	move.l	BasSp(a5),sp
	move.l	OMnBase(a5),a0
	lsl.w	#2,d0
	move.l	-4(a0,d0.w),d0
	move.w	OMnType(a5),d1
	cmp.w	#TkGto-Tk,d1
	beq.s	GoMG2
	cmp.w	#TkGsb-Tk,d1
	beq.s	GoMG1
* Procedure!
	lea	-2(a4),a6
	move.l	d0,a2
	clr.w	-(sp)
	bra	InProE
* Gosub
GoMG1	lea	-2(a4),a6
	bra	Gos2
* Goto
GoMG2	move.l	d0,a6
	bra	LGoto

******* INSTRUCTION ON MENU
OnMen:	bsr	OMnEff
	move.w	(a6)+,-(sp)
*	Cherche les labels
	clr.w	-(sp)
OnMn1	bsr	GetLabel
	beq	LbNDef
	move.l	d0,-(a3)
	addq.w	#1,(sp)
	cmp.w	#TkVir-Tk,(a6)+
	beq.s	OnMn1
	subq.l	#2,a6
* 	Taille 
	move.w	(sp)+,d2
	move.w	d2,OMnNb(a5)
	moveq	#0,d1
	move.w	d2,d1			* Nb de labesl*4
	lsl.w	#2,d1
	move.l	d1,d0
	bsr	RamFast
	beq	OOfMem
	move.l	d0,OMnBase(a5)
	add.l	d1,d0
	move.l	d0,a0
* Poke les jumps
	subq.w	#1,d2
OnMn2	move.l	(a3)+,-(a0)
	dbra	d2,OnMn2
* Goto/Gosub/Proc
	move.w	(sp)+,OMnType(a5)
* Plus de branchements
	bclr	#BitJump,ActuMask(a5)
	bra	InsRet

******* ON MENU ON
OMnOn	tst.w	OMnNb(a5)
	beq	InsRet
	bset	#BitJump,ActuMask(a5)
	bra	InsRet
******* ON MENU ON
OMnOf	tst.w	OMnNb(a5)
	beq	InsRet
	bset	#BitJump,ActuMask(a5)
	bra	InsRet
******* ON MENU DEL
OMnDl	bsr	OMnEff
	bra	InsRet

******* Efface les ON MENU
OMnEff	movem.l	d0/a1,-(sp)
	moveq	#0,d0
	move.w	OMnNb(a5),d0
	beq.s	OMnEx
	lsl.w	#2,d0
	move.l	OMnBase(a5),a1
	bsr	RamFree
	clr.w	OMnNb(a5)
	clr.l	OMnBase(a5)
OMnEx:	movem.l	(sp)+,d0/a1
	rts

***********************************************************
*	BANK TO MENU TO BANK!

******* MENU TO BANK n
MnToBank	
* Taille de l'arbre de menu
	move.l	MnBase(a5),d0
	beq	FonCall
	sub.l	a1,a1
	bsr	MnLg
* Reserve la banque!
	move.l	a1,-(sp)
	bsr	Expentier
	move.l	d3,d0
	move.l	(sp)+,d1
	move.l	d0,-(a3)
	move.l	d1,-(a3)
	pea	BkMenu
	move.w	#-1,-(sp)
	clr.w	-(sp)
	bsr	RsBq0
	lea	8(sp),sp
* Recopie les objets
	move.l	MnBase(a5),a2
	movem.l	a3/a4,-(sp)
	move.l	a1,d3
	bsr	MnTb
	movem.l	(sp)+,a3/a4
	bra	InsRet
******* Routine recursive de copie
MnTb	move.l	a1,a3
	move.l	a2,a0
	moveq	#MnLong/2-1,d0
MnTb1	move.w	(a0)+,(a1)+
	dbra	d0,MnTb1
	lea	MnObF(a3),a0
	bsr	MnTbC
	lea	MnOb1(a3),a0
	bsr	MnTbC
	lea	MnOb2(a3),a0
	bsr	MnTbC
	lea	MnOb3(a3),a0
	bsr	MnTbC
	move.l	MnLat(a2),d0
	beq.s	MnTb2
	move.l	a1,MnLat(a3)
	sub.l	d3,MnLat(a3)
	movem.l	a2/a3,-(sp)
	move.l	d0,a2
	bsr	MnTb
	movem.l	(sp)+,a2/a3
MnTb2	move.l	MnNext(a2),d0
	move.l	d0,a2
	beq.s	MnTb3
	move.l	a1,MnNext(a3)
	sub.l	d3,MnNext(a3)
	bra.s	MnTb
MnTb3	rts
* Copie d'un objet
MnTbC	move.l	(a0),d0
	beq.s	MnTbc2
	move.l	a1,(a0)
	sub.l	d3,(a0)
	move.l	d0,a0
	move.w	(a0),d0
	lsr.w	#1,d0
	subq.w	#1,d0
MnTbc1	move.w	(a0)+,(a1)+
	dbra	d0,MnTbc1
MnTbc2	rts
******* Routine recursive calcul taille
MnLg	move.l	d0,a2
	add.w	#MnLong,a1
	move.l	MnObF(a2),d0
	bsr	MnLgR
	move.l	MnOb1(a2),d0
	bsr	MnLgR
	move.l	MnOb2(a2),d0
	bsr	MnLgR
	move.l	MnOb3(a2),d0
	bsr	MnLgR
	move.l	MnLat(a2),d0
	beq.s	MnLg1	
	move.l	a2,-(sp)
	bsr	MnLg
	move.l	(sp)+,a2
MnLg1	move.l	MnNext(a2),d0
	bne.s	MnLg
	rts
* Routine pour un objet
MnLgR	beq.s	MnLgRX
	move.l	d0,a0
	add.w	(a0),a1
MnLgRX	rts

******* BANK TO MENU n
BkToMenu
	bsr	MnRaz
	tst.w	ScOn(a5)
	beq	ScNOp
	bsr	Expentier
	bsr	BkAd
	move.l	a0,d3
	move.l	-8(a0),d0
	cmp.l	BkMenu,d0
	bne	FonCall
	moveq	#MnLong,d0
	bsr	RamFast2
	beq	OOfMem
	move.l	d0,MnBase(a5)
	bsr	MnTMn
	move.l	ScOnAd(a5),MnAdEc(a5)
	addq.w	#1,MnChange(a5)
	bra	InsRet
* Routine recursive
MnTMn	move.l	d0,a1
	move.l	d0,a2
	moveq	#MnLong/2-1,d0
MnTm1	move.w	(a0)+,(a1)+
	dbra	d0,MnTm1
	lea	MnObF(a2),a0
	bsr	MnTmR
	lea	MnOb1(a2),a0
	bsr	MnTmR
	lea	MnOb2(a2),a0
	bsr	MnTmR
	lea	MnOb3(a2),a0
	bsr	MnTmR
	move.l	MnLat(a2),d0
	beq.s	MnTm2
	clr.l	MnLat(a2)
	add.l	d3,d0
	move.l	d0,a0
	move.l	a2,MnPrev(a0)
	moveq	#MnLong,d0
	bsr	RamFast2
	beq	OOfMem
	move.l	d0,MnLat(a2)
	move.l	a2,-(sp) 
	bsr	MnTMn
	move.l	(sp)+,a2
MnTm2	move.l	MnNext(a2),d0
	beq.s	MnTm3
	clr.l	MnNext(a2)
	add.l	d3,d0
	move.l	d0,a0
	moveq	#MnLong,d0
	bsr	RamFast2
	beq	OOfMem
	move.l	a2,MnPrev(a0)
	move.l	d0,MnNext(a2)
	bra.s	MnTMn
MnTm3	rts
* Routine de copie des objets
MnTmR	move.l	(a0),d0
	beq.s	MnTmrX
	clr.l	(a0)
	add.l	d3,d0
	move.l	d0,a1
	moveq	#0,d0
	move.w	(a1),d0
	move.w	d0,d1
	bsr	RamFast2
	beq	OofMem
	move.l	d0,(a0)
	move.l	d0,a0
	lsr.w	#1,d1
	subq.w	#1,d1
MnTmR1	move.w	(a1)+,(a0)+
	dbra	d1,MnTmR1
MnTmRX	rts

***********************************************************
*	GESTION MENU!
MnGere	movem.l	a0-a6/d0-d7,-(sp)
* Sauve les registres A3-A6
	clr.w	MnError(a5)
	move.l	a3,MnRA3(a5)
	move.l	a4,MnRA4(a5)
* Active l'ecran du menu!
	move.l	T_EcCourant(a5),a0
	move.w	EcNumber(a0),MnScOn(a5)
	move.l	MnAdEc(a5),d0
	beq	ScNOp
	move.l	d0,a0
	move.w	EcNumber(a0),d1
	EcCall	Active
	bne	ScNOp
* Fixe les parametres par defaut
	EcCall	MnStart
* Va calculer les coordonnees
	tst.w	MnChange(a5)
	beq.s	MnGe0
	move.w	#-1,MnProc(a5)
	bsr	MnCalc
* Reserve les zones
MnGe0	move.w	MnNZone(a5),d1
	SyCall	ResZone
	beq	MnGe1
	move.w	#24,MnError(a5)
* Va afficher la barre/Arret/Avec fond
MnGe1	move.w	#1,MnProc(a5)
	SyCall	AMALFrz
	moveq	#0,d4
	moveq	#0,d5
	tst.w	MnMouse(a5)
	beq.s	MnGe2
	SyCall	XyMou
	moveq	#0,d3
	SyCall	XYScr
	move.w	d1,d4
	move.w	d2,d5
MnGe2:	move.w	d4,MnBaseX(a5)
	move.w	d5,MnBaseY(a5)
	move.l	MnBase(a5),a2
	bsr	MnBranch

******* Init params boucle de test
	lea	MnTable(a5),a6		* Niveau de menu
	clr.l	(a6)
	moveq	#0,d6
	clr.w	MnZoAct(a5)

******* Boucle de test!
MnLoop:	SyCall	WaitVBL
	tst.w	MnError(a5)
	bne	MnErr
* Appelle les menus CALLABLE
	move.l	MnBase(a5),a2
	lea	MnTable(a5),a1
MnCl1	tst.b	MnFlag+1(a2)
	beq.s	MnCl3
	moveq	#0,d7
	cmp.l	(a1),a2
	bne.s	MnCl2
	bset	#30,d7
MnCl2	move.w	MnXX(a2),d4
	move.w	MnYY(a2),d5
	bsr	MnDraw
MnCl3	move.l	MnNext(a2),d0
	move.l	d0,a2
	bne.s	MnCl1
	move.l	(a1)+,d0
	beq.s	MnCl4
	move.l	d0,a2
	move.l	MnLat(a2),a2
	bra.s	MnCl1
MnCl4:
*	SyCall	Inkey
*	cmp.b	#" ",d1
*	beq	MnExit
*	cmp.b	#"b",d1
*	bne.s	MnDebug
*	jsr	Bug
* Appuie sur SHIFT -> inactive la souris: MOUVEMENTS LIBRES!!!!
MnDebug	SyCall	Shifts      
	and.b	#$03,d1
	bne.s	MnLp2b
* Souris dans une zone???
	moveq	#0,d3
	SyCall	GetZone
	tst.l	d1
	beq.s	MnLp0
	move.l	MnAdEc(a5),a1
	cmp.w	EcNumber(a1),d1
	bne.s	MnLp0
	swap	d1
	tst.w	d1
	bne.s	MnLp1
MnLp0:	clr.w	d1
	move.w	d6,d5
MnLp1:	move.w	d1,d4
* Lache le bouton de droite?
	bsr	MnMousK
	btst	#1,d1
	beq	MnExit
	btst	#0,d1
	bne	MnBGoch
* Verifie que la nouvelle case n'est pas DEJA ouverte
MnLp2	tst.w	d4
	beq.s	MnLp2a
	bsr	ZoToMn
	btst	#MnOff,MnFlag(a2)
	beq.s	MnLp2a
MnLp2b	clr.w	d4
	move.w	d6,d5
MnLp2a	cmp.w	MnZoAct(a5),d4
	beq	MnLoop
	tst.w	d4
	beq.s	MnLp4
	lea	MnTable(a5),a0
	clr.w	d0
MnLp3	cmp.w	d0,d6
	beq.s	MnLp4
	move.l	(a0)+,a1
	cmp.w	MnZone(a1),d4
	beq.s	MnLp0
	addq.w	#1,d0
	bra.s	MnLp3
* Ramene le niveau a celui du menu
MnLp4	bsr	MnDEff
* Efface la case activee
	tst.w	MnZoAct(a5)
	beq.s	MnLp5
	movem.l	a2/d4/d5,-(sp)
	move.l	MnAct(a5),a2
	move.w	MnXX(a2),d4
	move.w	MnYY(a2),d5
	moveq	#0,d7
	bsr	MnDraw	
	movem.l	(sp)+,a2/d4/d5
	clr.w	MnZoAct(a5)
* Active la nouvelle
MnLp5	move.w	d4,MnZoAct(a5)
	beq	MnLoop
	move.l	a2,MnAct(a5)
	move.w	MnXX(a2),d4
	move.w	MnYY(a2),d5
	moveq	#0,d7
	bset	#30,d7
	bsr	MnDraw
* Dessine la collaterale?
	move.l	MnLat(a2),d0
	beq	MnLoop
	move.l	a2,(a6)+
	addq.w	#1,d6
	move.l	d0,a2
	bsr	MnBranch
	clr.w	MnZoAct(a5)
	bra	MnLoop

******* Fin du menu! Efface tout!
MnExit	
* Efface les anciens choix
	moveq	#MnNDim-1,d0
	lea	MnChoix(a5),a0
	move.l	a0,a2
MnEx1	clr.w	(a0)+
	dbra	d0,MnEx1
	clr.w	MnChoice(a5)
* Trouve le nouveau
	tst.w	MnZoAct(a5)
	beq.s	MnExX
	move.w	d6,d0
	beq.s	MnEx3
	lea	MnTable(a5),a0
MnEx2	move.l	(a0)+,a1	
	move.w	MnNb(a1),(a2)+
	subq.w	#1,d0
	bne.s	MnEx2
MnEx3	move.l	MnAct(a5),a1
	move.w	MnNb(a1),(a2)+
	bset	#BitJump,T_Actualise(a5)
	move.w	#-1,MnChoice(a5)
* Ferme tout
MnExX	bsr	MnEnd
	movem.l	(sp)+,d0-d7/a0-a6
	rts
******* Fin du menu avec erreur
MnErr:	bsr	MnEnd
	movem.l	(sp)+,d0-d7/a0-a6
	bclr	#BitJump,T_Actualise(a5)
	clr.w	MnChoice(a5)
	move.w	MnError(a5),d0
	bra	RunErr
******* Ferme tout!	
MnEnd:	tst.w	MnProc(a5)
	bmi.s	MnEnd1
* Trouve la fin de la table
	lea	MnTable(a5),a6
	moveq	#-1,d6
MnEnd0	addq.l	#1,d6
	tst.l	(a6)+
	bne.s	MnEnd0
	subq.l	#4,a6
* Efface les menus
	moveq	#0,d5			* Efface tous les menus
	bsr	MnDEff
	move.l	MnBase(a5),a2
	bsr	MnEBranch
	SyCall	AMALUFrz
MnEnd1	moveq	#0,d1			* Efface toutes les zones
	SyCall	Reszone
	EcCall	MnStop			* Remet l'ecran
	move.w	MnScOn(a5),d1		* Reactive l'ecran courant
	EcCall	Active
	clr.w	MnProc(a5)		* Plus de procedure!
	rts
******* Menu not opened
MnNOp:	moveq	#38,d0
	bra	RunErr
	
******* Ramene l'etat de la souris
MnMousK	SyCall	MouseKey
	rts

******* Efface le menu---> niveau D5
MnDEff	movem.l	a2/d0-d2,-(sp)
MnDD1	cmp.w	d5,d6
	bls.s	MnDdX
	subq.w	#1,d6
	move.l	-(a6),a2
	clr.l	(a6)
* Remet la zone activee
	move.l	a2,MnAct(a5)
	move.w	MnZone(a2),MnZoAct(a5)
* Efface la collaterale
	move.l	MnLat(a2),a2
	bsr	MnEBranch
	bra.s	MnDd1
* Fini
MnDdX:	movem.l	(sp)+,a2/d0-d2
	rts

******* Efface la branche A2
MnEBranch
	movem.l	a2/d0/d1/d7,-(sp)
	move.l	a2,d0
	move.l	a2,d7
MnEBr1	move.l	d0,a2
	move.w	MnZone(a2),d1
	SyCall	RazZone
	move.l	MnNext(a2),d0
	bne.s	MnEBr1
* Restore l'image -en sens inverse!-
MnEBr2	tst.l	MnAdSave(a2)
	beq.s	MnEBr3
	bsr	MnRest
	bsr	MnSaDel
MnEBr3	cmp.l	d7,a2
	beq.s	MnEBr4
	move.l	MnPrev(a2),d0
	move.l	d0,a2
	bne.s	MnEBr2
MnEBr4	movem.l	(sp)+,a2/d0/d1/d7
	rts

******* Trouve l'adresse d'un zone
*	D4= Zone
*	D5= Niveau sortie
ZoToMn	lea	MnTable(a5),a0
	moveq	#0,d5
	move.l	MnBase(a5),d0
	bra.s	ZoTm2
ZoTm1	move.l	(a0)+,a2
	move.l	MnLat(a2),d0
	addq.w	#1,d5
ZoTm2:	move.l	d0,a2
	cmp.w	MnZone(a2),d4
	beq.s	ZoTm3
	move.l	MnNext(a2),d0
	bne.s	ZoTm2
	cmp.w	d5,d6
	bne.s	ZoTm1
ZoTm3:	rts

******* CLIQUE AVEC LE BOUTON GAUCHE
MnBGoch	
* En dehors?
	tst.w	d4
	beq	MnLoop
* Efface tout jusqu'a son niveau
	bsr	ZoToMn
	bsr	MnDEff
	tst.w	MnZoAct(a5)
	beq.s	MnMg1
	movem.l	a2/d4/d5,-(sp)
	move.l	MnAct(a5),a2
	move.w	MnXX(a2),d4
	move.w	MnYY(a2),d5
	moveq	#0,d7
	bsr	MnDraw	
	movem.l	(sp)+,a2/d4/d5
	clr.w	MnZoAct(a5)
* Trouve les coordonnees maximum
MnMg1	movem.l	a3-a6/d4-d7,-(sp)
	btst	#MnFlat,MnFlag(a2)
	bne.s	MnMg3
	btst	#MnSep,MnFlag(a2)
	bne.s	MnMg3
* Trouve la coordonnee maxi de la zone!
	btst	#MnBouge,MnFlag(a2)
	beq	MnMgX
	move.l	a2,a0
MnMg0	move.l	MnPrev(a0),a0
	btst	#MnFlat,MnFlag(a0)
	bne.s	MnMg2
	btst	#MnSep,MnFlag(a0)
	beq.s	MnMg0
MnMg2	move.w	MnXX(a0),d4
	move.w	MnYY(a0),d5
	move.w	MnMX(a0),d6
	move.w	MnMY(a0),d7
	add.w	d4,d6
	add.w	d5,d7
	move.w	MnTx(a2),a3
	move.w	MnTy(a2),a4
	move.l	a0,-(sp)
	bra.s	MnMg4
* Arbre entier: pas de limite
MnMg3	btst	#MnTBouge,MnFlag(a2)
	beq	MnMgX
	move.w	MnMx(a2),a3
	move.w	MnMy(a2),a4
	move.w	a3,d4
	neg.w	d4
	move.w	a4,d5
	neg.w	d5
	move.l	MnAdEc(a5),a0
	move.w	EcTx(a0),d6
	move.w	EcTy(a0),d7
	add.w	a3,d6
	add.w	a4,d7
	addq.w	#1,d4
	addq.w	#1,d5
	subq.w	#2,d6
	subq.w	#2,d7
	move.l	a2,-(sp)
* Boucle de test!
MnMg4	SyCall	XYMou			* Trouve le decalage de la souris
	moveq	#0,d3
	SyCall	XYScr
	swap	d4
	swap	d5
	move.w	MnXX(a2),d4
	sub.w	d1,d4
	move.w	MnYY(a2),d5
	sub.w	d2,d5
	swap	d4
	swap	d5
	bsr	MnMgI
MnMgL	bsr	MnMgD
	bsr	MnMousK
	and.b	#3,d1
	cmp.b	#3,d1
	beq.s	MnMgL
* Change les coordonnees relatives de l'objet/arbre
MnMgR	move.l	MnTDraw(a5),a0
	move.w	(a0)+,d2
	move.w	(a0)+,d3
	sub.w	MnXX(a2),d2
	sub.w	MnYY(a2),d3
	add.w	d2,MnX(a2)
	add.w	d3,MnY(a2)
	bset	#MnFixed,MnFlag(a2)
* Retabli l'objet suivant dans l'arbre
	move.l	MnNext(a2),d0
	beq.s	MnMgR3
	btst	#MnFlat,MnFlag(a2)
	bne.s	MnMgR1
	btst	#MnSep,MnFlag(a2)
	beq.s	MnMgR2
MnMgR1	move.l	d0,a0
	btst	#MnSep,MnFlag(a0)
	bne.s	MnMgR2
	move.l	MnNext(a0),d0
	bne.s	MnMgR1
	bra.s	MnMgR3
MnMgR2	move.l	d0,a0
	sub.w	d2,MnX(a0)
	sub.w	d3,MnY(a0)
	bset	#MnFixed,MnFlag(a0)
* Efface l'arbre
MnMgR3	bsr	MnMgF
	move.l	(sp)+,a2
	bsr	MnEBranch
* Redessine le nouveau!
	move.w	MnBaseX(a5),d4
	move.w	MnBaseY(a5),d5
	move.l	MnPrev(a2),d0
	beq.s	MnMgR4
	move.l	d0,a0
	move.w	MnXX(a0),d4
	move.w	MnYY(a0),d5
MnMgR4	bsr	MnBranch
* Ca y est!
MnMgX	movem.l	(sp)+,a3-a6/d4-d7
	bra	MnLoop
		
******* Initialisation dessin OUTLINE
MnMgI	move.l	T_RastPort(a5),a1
	moveq	#31,d0
	bsr	ObInkA
	moveq	#0,d0
	bsr	ObInkB
	moveq	#0,d0
	bsr	ObInkC
	moveq	#%11,d0
	bsr	ObWrite
	move.w	#$00FF,34(a1)
	rts
******* Remet dessin normal
MnMgF	move.l	T_RastPort(a5),a1
	moveq	#1,d0
	bsr	ObWrite
	move.w	#$FFFF,34(a1)
	rts
******* Dessin de la outline objet (a2) en XMOUSE/YMOUSE
MnMgD	SyCall	XYMou
	moveq	#0,d3
	SyCall	XYScr
* Plus decalage de la souris
	move.w	d1,d0
	move.w	d2,d1
	swap	d4
	swap	d5
	add.w	d4,d0
	add.w	d5,d1
	swap	d4
	swap	d5
* Sort des limites?
	cmp.w	d4,d0
	bge.s	MnMgd1
	move.w	d4,d0
MnMgd1	cmp.w	d5,d1
	bge.s	MnMgd2
	move.w	d5,d1
MnMgd2	move.w	d0,d2
	move.w	d1,d3
	add.w	a3,d2
	add.w	a4,d3
	cmp.w	d6,d2
	ble.s	MnMgd3
	move.w	d6,d2
	move.w	d2,d0
	sub.w	a3,d0
MnMgd3	cmp.w	d7,d3
	ble.s	MnMgd4
	move.w	d7,d3
	move.w	d3,d1
	sub.w	a4,d1
* Poke les nouvelles coords ABSOLUES en (a2)
MnMgd4	move.l	MnTDraw(a5),a0
	move.l	T_RastPort(a5),a1
	subq.w	#1,d2
	subq.w	#1,d3
	move.w	d0,36(a1)
	move.w	d1,38(a1)
	move.w	d0,(a0)+
	move.w	d1,(a0)+
	move.w	d2,(a0)+
	move.w	d1,(a0)+
	move.w	d2,(a0)+
	move.w	d3,(a0)+
	move.w	d0,(a0)+
	move.w	d3,(a0)+
	move.w	d0,(a0)+
	move.w	d1,(a0)+
	moveq	#5,d0
	move.l	MnTDraw(a5),a0
	movem.l	a0-a1/d0,-(sp)
	SyCall	WaitVbl
	movem.l	(sp),a0-a1/d0
	GfxCa5	PolyDraw
	SyCall	WaitVbl
	movem.l	(sp)+,a0-a1/d0
	GfxCa5	PolyDraw
* Fait tourner la ligne
	rol.w	34(a1)
	rts

***********************************************************
*	CREATION / STOCKAGE

***************	MENU$(,,,)=
IMen:	move.l	a3,-(sp)
	clr.w	-(sp)
* Empile les parametres
IMen1:	addq.w	#1,(sp)
	bsr	FnPar1
	cmp.w	#TkVir-Tk,(a6)
	beq.s	IMen1
* Trouve le menu
	move.w	(sp)+,d7
	bsr	MnFind
	bne.s	IMenA
	bsr	MnIns
IMenA:	move.l	(sp)+,a3
* Prend les parametres
*	cmp.w	#TkEg-Tk,(a6)
*	bne.s	IMenI
******* Fonction MENU$="jfkjdkfjkdj"
	move.l	ScOnAd(a5),a0
	cmp.l	MnAdEc(a5),a0
	beq.s	IMen6
	tst.l	MnAdEc(a5)
	bne	ScNOp
	move.l	a0,MnAdEc(a5)
IMen6:	move.l	EcWindow(a0),a0
	move.b	WiPaper+1(a0),d0
	move.b	WiPen+1(a0),d1
	move.b	d0,MnInkA1(a2)
	move.b	d1,MnInkB1(a2)
	move.b	d0,MnInkC1(a2)
	move.b	d1,MnInkA2(a2)
	move.b	d0,MnInkB2(a2)
	move.b	d0,MnInkC2(a2)
* Prend la chaine OB1
	lea	MnOb1(a2),a0
	bsr	MnOob
* Prend la chaine OB2
IMen7	cmp.w	#TkVir-Tk,(a6)
	bne.s	IMenX
	lea	MnOb2(a2),a0
	bsr	MnOob
* Prend la chaine OBOFF
IMen8	cmp.w	#TkVir-Tk,(a6)
	bne.s	IMenX
	lea	MnOb3(a2),a0
	bsr	MnOob
* Prend la chaine OBF
IMen9	cmp.w	#TkVir-Tk,(a6)
	bne.s	IMenX
	lea	MnObF(a2),a0
	bsr	MnOob
* Ca y est!!!
IMenX:	addq.w	#1,MnChange(a5)
	bra	InsRet
*	bclr	#BitMenu,ActuMask(a5)
******* Petite routine de creation
MnOob	movem.l	a0-a2,-(sp)
	addq.l	#2,a6
	bsr	Evalue
	movem.l	(sp)+,a0-a2
	cmp.l	#EntNul,d3
	beq	MnOob0
	move.l	d3,a1
	tst.w	(a1)
	bne	MnOob1
* Efface la chaine
MnOobE	move.l	(a0),d0
	beq.s	MnOOb0
	move.l	d0,a1
	moveq	#0,d0
	move.w	(a1),d0
	bsr	RamFree
	clr.l	(a0)
MnOOb0	rts
* Une chaine!
MnOob1	move.l	a1,-(sp)	* Efface l'ancienne
	bsr.s	MnOobE
	move.l	(sp)+,a1
	bsr	MnObjet		* Cree la nouvelle
	beq	OOfMem
	bmi	FonCall
	move.l	d0,(a0)
	rts

******* MENU ON
IMnOn:	tst.l	MnBase(a5)
	beq	InsRet
	bset	#BitMenu,ActuMask(a5)
	clr.l	T_ClLast(a5)
	bra	InsRet
******* MENU OFF
IMnOff	bclr	#BitMenu,ActuMask(a5)
	bra	InsRet
******* MENU DEL [(coordonnees,,)]
IMnDl	cmp.w	#TkPar1-Tk,(a6)
	beq.s	IMnD1
	bsr	MnRaz
	bra	InsRet
IMnD1	bsr	MnDim
	move.l	a2,d0
	moveq	#0,d7
	addq.w	#1,MnChange(a5)
	bsr	MnEff
	bra	InsRet
******* MENU MOUSE ON/OFF
IMnMOn	move.w	#1,MnMouse(a5)
	bra	InsRet
IMnMOf	clr.w	MnMouse(a5)
	bra	InsRet
******* MENU BASE x,y
IMnBs:	bsr	Par2
	move.l	MnBase(a5),d0
	beq	MnNOp
	move.l	d0,a0
	move.l	#EntNul,d1
	move.l	(a3)+,d0
	cmp.l	d0,d1
	beq.s	ImnBs1
	move.w	d0,MnY(a0)
	bset	#MnFixed,MnFlag(a0)
Imnbs1	move.l	(a3)+,d0
	cmp.l	d0,d1
	beq.s	ImnBs2
	move.w	d0,MnX(a0)
	bset	#MnFixed,MnFlag(a0)
Imnbs2	bra	InsRet
******* SET MENU
ISMen	bsr	MnDim
	move.l	a2,-(sp)
	bsr	FnPar2
	move.l	(sp)+,a2
	move.l	#EntNul,d0
	move.l	(a3)+,d1
	cmp.l	d0,d1
	beq.s	ISMn1
	move.w	d1,MnY(a2)
	bset	#MnFixed,MnFlag(a2)
ISMn1	move.l	(a3)+,d1
	cmp.l	d0,d1
	beq.s	ISmn2
	move.w	d1,MnX(a2)
	bset	#MnFixed,MnFlag(a2)
ISMn2	bra	InsRet
******* =MENU X(,,,)
FXMen	bsr	MnDim
	moveq	#0,d3
	move.w	MnX(a2),d3
	moveq	#0,d2
	bra	OpeRet
******* =MENU Y(,,,)
FYMen	bsr	MnDim
	moveq	#0,d3
	move.w	MnY(a2),d3
	moveq	#0,d2
	bra	OpeRet
******* =CHOICE(n)
FMen1:	bsr	FnExpE
	tst.l	d3
	bls	FonCall
	cmp.l	#MnNDim,d3
	bhi	FonCall
	lsl.w	#1,d3
	lea	MnChoix(a5),a0
	move.w	-2(a0,d3.w),d3
	moveq	#0,d2
	bra	OpeRet
FMen0:	move.w	MnChoice(a5),d3
	clr.w	MnChoice(a5)
	ext.l	d3
	moveq	#0,d2
	bra	OpeRet
******* Instructions flags
IMnBa	bsr.	MnDim
	bset	#MnBar,(a0)
	bra	InsRet
IMnLi	bsr.s	MnDim
	bclr	#MnBar,(a0)
	bclr	#MnTotal,(a0)
	bra	InsRet
IMnTl	bsr.s	MnDim
	bclr	#MnBar,(a0)
	bset	#MnTotal,(a0)
	bra	InsRet
IMnMv	bsr.s	MnDim
	bset	#MnTBouge,(a0)
	bra	InsRet
IMnSt	bsr.s	MnDim
	bclr	#MnTBouge,(a0)
	bra	InsRet
IMnIMv	bsr.s	MnDim
	bset	#MnBouge,(a0)
	bra	InsRet
IMnISt	bsr.s	MnDim
	bclr	#MnBouge,(a0)
	bra	InsRet
IMnAct	bsr.s	MnDim
	bclr	#MnOff,(a0)
	bra	InsRet
******* Routine-> adresse du flag
MnDim	cmp.w	#TkPar1-Tk,(a6)
	beq.s	MnDim1
	bsr	Expentier
	tst.l	d3
	beq	FonCall
	cmp.l	#MnNDim,d3
	bhi	FonCall
	lea	MnDFlags(a5),a0
	lea	-1(a0,d3.w),a0
	rts
* Cherche l'adresse D'UN objet
MnDim1	move.l	a3,-(sp)
	clr.w	-(sp)
MnDim2	addq.w	#1,(sp)
	bsr	FnPar1
	cmp.w	#TkVir-Tk,(a6)
	beq.s	MnDim2
* Trouve le menu
	move.w	(sp)+,d7
	bsr	MnFind
	move.l	(sp)+,a3
	tst.l	d0
	beq	MnINDef
	lea	MnFlag(a2),a0
	rts
MnINDef	moveq	#39,d0
	bra	RunErr
******* Fin des instruction
IMnInA	bsr.s	MnDim
	bset	#MnOff,(a0)
	bra	InsRet
IMnSep	bsr.s	MnDim
	bset	#MnSep,(a0)
	bra	InsRet
IMnLnk	bsr.s	MnDim
	bclr	#MnSep,(a0)
	bra	InsRet
IMnCl	bsr.s	MnDim
	move.b	#-1,MnFlag+1(a2)
	bra	InsRet
IMnNCl	bsr	MnDim
	clr.b	MnFlag+1(a2)
	bra	InsRet

******* MENU CALCULATE
IMnCa:	tst.l	MnBase(a5)
	beq	MnNOp
* Active l'ecran du menu!
	move.l	T_EcCourant(a5),a0
	move.w	EcNumber(a0),MnScOn(a5)
	move.l	MnAdEc(a5),d0
	beq	ScNOp
	move.l	d0,a0
	move.w	EcNumber(a0),d1
	EcCall	Active
	bne	ScNOp
	move.w	#-1,MnProc(a5)
	EcCall	MnStart
* Va calculer les coordonnees
	bsr	MnCalc
* Remet l'ecran
	bsr	MnEnd1
	bra	InsRet
	
******* Trouve le menu (A3)++, verifie les params, profondeur D7
MnFind:	move.w	d7,d2
	move.w	d2,d1
	lsl.w	#2,d1
	lea	0(a3,d1.w),a1
	move.l	(a3),d0
	bls	FonCall
	cmp.l	#1024,d0
	bcc	FonCall
	move.l	MnBase(a5),d0
	beq.s	MnFE
MnF1:	move.l	-(a1),d1
	bls	FonCall	
	cmp.l	#1024,d1
	bcc	FonCall
MnF0:	move.l	d0,a2
	cmp.w	MnNb(a2),d1
	beq.s	MnF2
	bcs.s	MnFE
	move.l	MnNext(a2),d0
	bne.s	MnF0
	bra.s	MnFE
MnF2:	subq.w	#1,d2
	beq.s	MnFOk
	move.l	MnLat(a2),d0
	bne.s	MnF1
MnFE:	moveq	#0,d0
	rts
MnFOk:	moveq	#-1,d0
	rts

******* Insere le menu A2/(A3)/D7 dans la liste
MnIns:	movem.l	a0/a1/d0-d2,-(sp)
	move.w	d7,d2
	move.w	d2,d1
	subq.w	#1,d2
	lsl.w	#2,d1
	lea	0(a3,d1.w),a1
	move.l	MnBase(a5),d0
	beq	MnI8
MnI1:	move.l	-(a1),d1
MnI0:	move.l	d0,a2
	cmp.w	MnNb(a2),d1
	beq.s	MnI2
	bcs.s	MnI3
	move.l	MnNext(a2),d0
	bne.s	MnI0
	bra.s	MnI6
MnI2:	subq.w	#1,d2
	bmi	FonCall
	move.l	MnLat(a2),d0
	bne.s	MnI1
	bra.s	MnI8
* Insere?
MnI3:	tst.w	d2
	bne	FonCall
	bsr	MnRam
	move.l	MnPrev(a2),a0		* Au Milieu
	move.l	a1,MnPrev(a2)
	move.l	a0,MnPrev(a1)
	move.l	a2,MnNext(a1)
	bclr	#MnFlat,MnFlag(a2)
	beq.s	MnI5
	bset	#MnFlat,MnFlag(a1)
	move.l	a0,d0
	beq.s	MnI4
	move.l	a1,MnLat(a0)
	bra.s	MnIF
MnI4:	move.l	a1,MnBase(a5)
	bra.s	MnIF
MnI5:	move.l	a1,MnNext(a0)
	bra.s	MnIF
* Dernier objet
MnI6:	tst.w	d2
	bne	FonCall
	bsr	MnRam
	move.l	a1,MnNext(a2)
	move.l	a2,MnPrev(a1)
	bra.s	MnIF
* Cree une collaterale
MnI8:	tst.w	d2
	bne	FonCall
	bsr	MnRam
	tst.l	MnBase(a5)
	beq.s	MnI9
	move.l	a1,MnLat(a2)		* Au milieu
	move.l	a2,MnPrev(a1)
	bset	#MnFlat,MnFlag(a1)
	bra.s	MnIF
MnI9:	move.l	a1,MnBase(a5)		* Au debut
	bset	#MnFlat,MnFlag(a1)
* Fini
MnIF:	move.l	a1,a2
	move.w	d7,d0			* Flag par defaut!
	lea	MnDFlags(a5),a0
	move.b	-1(a0,d0.w),d0
	or.b	d0,MnFlag(a2)
	move.w	2(a3),MnNb(a2)		* Marque le numero!
	movem.l	(sp)+,a0/a1/d0-d2
	rts
******* Demande la RAM
MnRam:	moveq	#MnLong,d0
	bsr	RamFast
	tst.l	d0
	beq	OOfMem
	move.l	d0,a1
	rts

******* Efface tous les menus
MnRaz:	move.l	MnBase(a5),d0
	beq.s	MnRzX
	moveq	#1,d7
	bsr	MnEff
	bra.s	MnRaz
MnRzX	clr.l	MnAdEc(a5)
	bclr	#BitMenu,ActuMask(a5)
	rts

******* Enleve l'objet a partir de (D0), et ses collaterales
MnEff:	movem.l	a2/d0,-(sp)
MnEf0:	move.l	d0,a2
	move.l	MnLat(a2),d0
	beq.s	MnEf1
	addq.w	#1,d7
	bsr	MnEff
MnEf1:	move.l	MnNext(a2),d0
	bsr	MnDel
	tst.w	d7
	beq.s	MnEf2
	tst.l	d0
	bne.s	MnEf0
	subq.w	#1,d7
MnEf2:	movem.l	(sp)+,a2/d0
	rts

******* Enleve l'objet (A2)
MnDel:	movem.l	a0-a2/d0-d2,-(sp)
* Debut d'une collaterale?
	btst	#MnFlat,MnFlag(a2)
	beq.s	MnD3
	move.l	MnNext(a2),d1
	move.l	MnPrev(a2),d0
	bne.s	MnD1
	move.l	d1,MnBase(a5)
	bra.s	MnD2
MnD1:	move.l	d0,a0
	move.l	d1,MnLat(a0)
MnD2:	tst.l	d1
	beq.s	MnD5
	move.l	d1,a1
	bset	#MnFlat,MnFlag(a1)
	move.l	d0,MnPrev(a1)
	bra.s	MnD5
* Menu normal
MnD3:	move.l	MnPrev(a2),d0
	move.l	MnNext(a2),d1
	beq.s	MnD4
	move.l	d1,a0
	move.l	d0,MnPrev(a0)
MnD4:	move.l	d0,a0
	move.l	d1,MnNext(a0)
* Libere les memoire des objets
MnD5:	move.l	MnObF(a2),d0
	beq.s	MnD7
	move.l	d0,a1
	moveq	#0,d0
	move.w	(a1),d0
	bsr	RamFree
MnD7:	move.l	MnOb1(a2),d0
	beq.s	MnD8
	move.l	d0,a1
	moveq	#0,d0
	move.w	(a1),d0
	bsr	RamFree
MnD8:	move.l	MnOb2(a2),d0
	beq.s	MnD9
	move.l	d0,a1
	moveq	#0,d0
	move.w	(a1),d0
	bsr	RamFree
* Libere la copie du fond ?!?!?
MnD9:	bsr	MnSaDel
* Memoire variables locales
	bsr	MnODVar
* Libere la memoire du menu
	move.l	a2,a1
	moveq	#MnLong,d0
	bsr	RamFree
	movem.l	(sp)+,a0-a2/d0-d2
	rts

***********************************************************

***********************************************************
*	CALCULS


******* Calcule les positions de l'arbre
MnCalc:	movem.l	d0-d7/a2,-(sp)
	clr.w	MnChange(a5)
* Explore tout l'arbre
	clr.w	MnNZone(a5)
	move.l	MnBase(a5),d0
	moveq	#0,d4
	moveq	#0,d5
	bsr	MnCa0
* Poke les numeros de zone!
	move.w	MnNZone(a5),d7
	move.l	MnBase(a5),d0
	bsr	MnPZo
	movem.l	(sp)+,d0-d7/a2
	rts

* Routine recursive de pokage des zones
MnPZo:	move.w	d6,-(sp)
	clr.w	d6
MnPZo2	move.l	d0,a2
	move.l	MnLat(a2),d0
	beq.s	MnPZo3
	move.l	d0,-(sp)
	addq.w	#1,d6
MnPZo3	move.w	d7,MnZone(a2)
	subq.w	#1,d7
	move.l	MnNext(a2),d0
	bne.s	MnPZo2
MnPZo4	subq.w	#1,d6
	bmi.s	MnPZo5
	move.l	(sp)+,d0
	bsr	MnPZo
	tst.w	d6
	bne.s	MnPZo4
MnPZo5:	move.w	(sp)+,d6
	rts

* Routine recursive de calcul!
MnCa0:	movem.l	a0-a2/d4-d7,-(sp)
* Si tour: tout decale un cran!
MnCa0a	move.l	d0,a2
	tst.l	MnObF(a2)
	bne.s	MnCa1
	addq.w	#2,d4
	addq.w	#2,d5
* Exploration d'un arbre
MnCa1	move.l	d0,a2
	addq.w	#1,MnNZone(a5)
* Fixe les coordonnees d'un objet
	btst	#MnFixed,MnFlag(a2)
	bne.s	MnCa2
	move.w	d4,MnX(a2)
	move.w	d5,MnY(a2)
MnCa2	moveq	#0,d4
	moveq	#0,d5
	bset	#31,d7				* Va calculer la taille
	bclr	#30,d7
	bset	#29,d7
	bsr	MnDraw
	move.w	d2,MnTx(a2)
	move.w	d3,MnTy(a2)
	move.w	d0,d2
	move.w	d1,d3
* Exploration recursive d'une collaterale
	move.l	MnLat(a2),d0
	beq.s	MnCa7
	movem.w	d2-d5,-(sp)
	btst	#MnBar,MnFlag(a2)
	bne.s	MnCa5
	clr.w	d2
	bra.s	MnCa6
MnCa5	clr.w	d3
MnCa6	move.w	d2,d4
	move.w	d3,d5
	bsr	MnCa0
	movem.w	(sp)+,d2-d5
* Coordonnees pour le suivant
MnCa7	btst	#MnBar,MnFlag(a2)		* Taille automatique!
	bne.s	MnCa8
	clr.w	d3
	bra.s	MnCa9
MnCa8	clr.w	d2
MnCa9	move.w	d2,d4
	move.w	d3,d5
* Passe a l'objet suivant
MnCaN:	move.l	MnNext(a2),d0
	beq.s	MnCaNx
	move.l	d0,a2
	btst	#MnSep,MnFlag(a2)
	beq	MnCa1
	bra 	MnCa0a
MnCaNx	movem.l	(sp)+,a0-a2/d4-d7
	rts

******* Ramene les coord maxi d'une branche
******* Poke les coordonnees des objets
*	A2= 	Base
*	D4/D5->	XG/YH (entree)
*	D6/D7-> XD/YB
MnMaxi:	movem.l	d0-d3/a2,-(sp)
	move.w	d4,d2
	move.w	d5,d3
	move.w	#32766,d4
	move.w	d4,d5
	clr.w	d6
	clr.w	d7
MnMx0	add.w	MnX(a2),d2
	add.w	MnY(a2),d3
	move.w	d2,MnXX(a2)
	move.w	d3,MnYY(a2)
	cmp.w	d4,d2
	bge.s	MnMx1
	move.w	d2,d4
MnMx1	cmp.w	d5,d3
	bge.s	MnMx2
	move.w	d3,d5
MnMx2	cmp.w	d6,d2
	ble.s	MnMx3
	move.w	d2,d6
MnMx3	cmp.w	d7,d3
	ble.s	MnMx4
	move.w	d3,d7
MnMx4	move.w	d2,d0
	move.w	d3,d1
	add.w	MnTx(a2),d0
	add.w	MnTy(a2),d1
	cmp.w	d6,d0
	ble.s	MnMx5
	move.w	d0,d6
MnMx5	cmp.w	d7,d1
	ble.s	MnMx6
	move.w	d1,d7
MnMx6	move.l	MnNext(a2),d0
	beq.s	MnMx7
	move.l	d0,a2
	btst	#MnSep,MnFlag(a2)
	beq.s	MnMx0
* Poke la taille INTERNE de cet arbre
MnMx7	movem.l	(sp),d0-d3/a2
	move.w	d6,d0
	move.w	d7,d1
	sub.w	d4,d0
	sub.w	d5,d1
	move.w	d0,MnMX(a2)
	move.w	d1,MnMY(a2)
* Un tour?
	tst.l	MnObF(a2)
	bne.s	MnMxX
	subq.w	#2,d4
	subq.w	#2,d5
	addq.w	#2,d6
	addq.w	#2,d7
	btst	#MnBar,MnFlag(a2)
	bne.s	MnMxX
	btst	#MnTotal,MnFlag(a2)
	beq.s	MnMxX
	move.l	MnAdEc(a5),a2
	moveq	#0,d4
	move.w	EcTx(a2),d6
* Poke la taille maxi de l'arbre
MnMxX	movem.l	(sp)+,d0-d3/a2
	rts

***********************************************************

***********************************************************
*	DESSINS

******* Dessin d'une branche de l'arbre
*	FIXE LES ZONES!
*	A2=	Base a dessiner
*	D4/D5=	Coordonnee de base
MnBranch:
	movem.l a0-a2/d0-d7,-(sp)
* Sauve le fond
MnBrR	bsr	MnMaxi
	bsr	MnSave
* Dessine le tour, si pas dessine dans le premier objet
	tst.l	MnObF(a2)
	bne.s	MnBrO
	move.l	T_RastPort(a5),a1
	moveq	#0,d0			* Pattern VIDE!
	bsr	ObPat
	bset	#4,33(a1)		* Outline
	move.w	#$FFFF,34(a1)		* Ligne pleine
	moveq	#0,d0
	move.b	MnInkB1(a2),d0		* Change les encres
	bsr	ObInkA
	move.b	MnInkC1(a2),d0
	bsr	ObInkC
	moveq	#1,d0
	bsr	ObWrite
	move.w	d4,d0
	move.w	d5,d1
	move.w	d6,d2
	move.w	d7,d3
	subq.w	#1,d2
	subq.w	#1,d3
	GfxCa5	RectFill
* Dessine les objets
MnBrO	move.w	MnXX(a2),d4
	move.w	MnYY(a2),d5
	moveq	#0,d7			* Dessine
	bset	#29,d7
	bsr	MnDraw
	move.w	MnZone(a2),d1
	move.w	d4,d2
	move.w	d5,d3
	add.w	MnTx(a2),d4
	add.w	MnTy(a2),d5
	tst.w	d2
	bpl.s	MnBro1
	clr.w	d2
MnBro1	tst.w	d3
	bpl.s	MnBro2
	clr.w	d3
MnBro2	SyCall	SetZone
* Encore un objet ?
	move.l	a2,a0
	move.l	MnNext(a2),d0
	beq.s	MnBrX
	move.l	d0,a2
	btst	#MnSep,MnFlag(a2)
	beq.s	MnBrO
	move.w	MnXX(a0),d4
	move.w	MnYY(a0),d5
	bra	MnBrR
MnBrX:	movem.l	(sp)+,a0-a2/d0-d7
	rts

******* Dessin / Calcul taille d'une case de menu (A2) - D4/D5
*	#31 de D7->	Dessin(0) / Calcule(1)
*	#30 de D7->	Inactif(0) / Actif(1)
*	#29 de D7->	PasFond(0) / Fond(1)
*	D4/D5	 -> 	Coordonnees
MnDraw	movem.l	d4-d7,-(sp)
	move.l	a2,MnDAd(a5)
	clr.w	d0
	clr.w	d1
	clr.w	d2
	clr.w	d3
	clr.w	d6
	clr.w	d7
* Imprime/Calcule l'objet de fond?
	tst.l	MnObF(a2)
	beq.s	MnDr1
	btst	#29,d7
	beq.s	MnDr0
	move.l	MnObF(a2),d0
	move.b	MnInkB1(a2),d1
	move.b	MnInkA1(a2),d2
	move.b	MnInkC1(a2),d3
	bsr	MnODraw
	move.w	d2,d6
	move.w	d3,d7
	add.w	d0,d4
	add.w	d1,d5
* Pointe et Imprime/Calcule le bon objet
MnDr0:	btst	#MnOff,MnFlag(a2)
	beq.s	MnDr1
	tst.l	MnOb3(a2)
	beq.s	MnDr1
	move.l	MnOb3(a2),d0
	move.b	MnInkA1(a2),d1
	move.b	MnInkB1(a2),d2
	move.b	MnInkC1(a2),d3
	bclr	#30,d7
	bra.s	MnDr3
MnDr1:	tst.l	MnOb1(a2)
	beq.s	MnDr4
	move.l	MnOb1(a2),d0
	move.b	MnInkA1(a2),d1
	move.b	MnInkB1(a2),d2
	move.b	MnInkC1(a2),d3
	btst	#30,d7
	beq.s	MnDr3
	tst.l	MnOb2(a2)
	bne.s	MnDr2
	move.b	MnInkA2(a2),d1
	move.b	MnInkB2(a2),d2
	move.b	MnInkC2(a2),d3
	bra.s	MnDr3
MnDr2:	move.l	MnOb2(a2),d0
	bclr	#30,d7
MnDr3:	bsr	MnODraw
* Ramene la taille maxi en D2/D3
* D0/D1-> Decalage au prochain!
MnDr4:	cmp.w	d6,d2
	bls.s	MnDr5
	move.w	d2,d6
MnDr5	cmp.w	d7,d3
	bls.s	MnDr6
	move.w	d3,d7
MnDr6	move.w	d6,d2
	move.w	d7,d3
	movem.l	(sp)+,d4-d7
	rts

***********************************************************
*	OBJETS DE MENU

******* Instructions
MnOToken
	dc.b	"BA",2,0		* Bar
	dc.b	"LI",2,0		* Line
	dc.b	"EL",2,0		* Ellipse
	dc.b	"PA",1,0		* Pattern
	dc.b 	"IN",2,0		* Ink
	dc.b 	"BO",1,0		* Bob
	dc.b	"IC",1,0		* Icon
	dc.b	"LO",2,0		* Locate
	dc.b 	"OU",1,0		* Out line
	dc.b 	"SL",1,0		* Set Line
	dc.b	"SF",1,0		* Set Font
	dc.b 	"PR",-1,0		* CALL procedure
	dc.b	"RE",1,0		* Reserve space
	dc.b	"SS",1,0		* Set style
	dc.w	0

******* Branchements aux instructions
ObJumps	bra	MnOFin
	bra	MnOPr
	bra	MnOBar
	bra	MnOLine
	bra	MnOEl
	bra	MnOPat	
	bra	MnOInk	
	bra	MnOBob
	bra	MnOIco	
	bra	MnOLoc	
	bra	MnOOut
	bra	MnOSL	
	bra	MnOFont
	bra	MnOCall
	bra	MnORes
	bra	MnOSty

******* Interpreteur de definition d'objet!
*	A1	-> chaine a interpreter
*	Retour	-> D0= adresse de l'objet
MnObjet	movem.l	d1-d7/a0-a3,-(sp)
	move.l	sp,a3
	move.w	(a1)+,d7
	move.l	Buffer(a5),a2
* Cherche une commande
MnO0	move.w	a2,d0
	btst	#0,d0
	beq.s	MnO1
	clr.b	(a2)+
MnO1	move.l	a1,d5
	move.w	d7,d6
MnO2	bsr	MnOChr
	bhi.s	MnO2
* Texte normal
	move.w	d6,d0
	sub.w	d7,d0
	beq.s	MnO4
	move.w	#4,(a2)+
	move.w	d0,(a2)+
	move.l	d5,a1
	move.w	d6,d7
MnO3	bsr	MnOChr
	bls.s	MnO0
	move.b	d0,(a2)+
	bra.s	MnO3
* Interprete la commande
MnO4	tst.w	d7
	beq	MnOX	
	subq.w	#1,d7
	addq.l	#1,a1
MnO5	bsr	MnOTok
* Cherche la commande suivante
	bsr	MnOChS
	bls	MnOE1
	cmp.b	#")",d0
	beq	MnO0
	cmp.b	#":",d0
	beq.s	MnO5
	bra	MnOE1
******* Marque la fin!
MnOX:	clr.w	(a2)+
* Reserve la memoire
	move.l	a2,d0
	move.l	Buffer(a5),a1
	sub.l	a1,d0
	addq.w	#2,d0
	move.w	d0,d1
	bsr	RamFast2
	beq.s	MnOXx
	move.l	d0,a0
	move.w	d1,(a0)+	
	subq.w	#2,d1
	lsr.w	#1,d1
	subq.w	#1,d1
	bmi.s	MnOXx
MnOX1:	move.w	(a1)+,(a0)+
	dbra	d1,MnOX1
* Ok!	
MnOXx:	move.l	a3,sp
	movem.l	(sp)+,d1-d7/a0-a3
	tst.l	d0
	rts
* Erreur de syntaxe
MnOE1	moveq	#-1,d0
	bra.s	MnOXx

******* Tokenise (a2)
MnOTok:	bsr	MnOChS
	bls	MnOE1
	bsr	D0Maj
	lsl.w	#8,d0
	bsr	MnOChr
	bls	MnOE1
	bsr	D0Maj
	move.w	d0,d1
* Saute le reste du nom
MnOT0:	bsr	MnOChr
	bls	MnOE1
	bsr	D0Maj
	cmp.b	#"A",d0
	bcs.s	MnOTa
	cmp.b	#"Z",d0
	bls.s	MnOT0
MnOTa	addq.w	#1,d7
	subq.l	#1,a1
* Explore la table des tokens
	lea	MnOToken(pc),a0
	moveq	#8,d2
MnOT1	tst.w	(a0)
	beq	MnOE1
	cmp.w	(a0)+,d1
	beq.s	MnOT2
	addq.l	#2,a0
	addq.w	#4,d2
	bra.s	MnOT1
MnOT2:	move.w	d2,(a2)+
	move.b 	(a0)+,d6
	beq.s	MnOT4
	bmi.s	MnOT5
MnOT3:	bsr	MnOExp
	subq.b	#1,d6
	beq.s	MnOT4
	bsr	MnOChS
	bls	MnOE1
	cmp.b	#",",d0
	beq.s	MnOT3
	bra	MnOE1	
MnOT4:	rts
* Appel de procedure: stocke le nom
MnoT5:	moveq	#0,d6
	move.l	a2,a0
	clr.w	(a2)+
MnoT6:	bsr	MnoChS
	beq.s	MnoT8
	cmp.b	#")",d0
	beq.s	MnoT7
	cmp.b	#":",d0
	beq.s	MnoT7
	move.b	d0,(a2)+
	addq.w	#1,d6
	bra.s	MnoT6
MnoT7:	subq.l	#1,a1
	addq.w	#1,d7
MnoT8:	tst.w	d6
	beq	MnOE1
	btst	#0,d6
	beq.s	MnoT9
	clr.b	(a2)+
	addq.w	#1,d6
MnoT9:	move.w	d6,(a0)
	rts

******* EXPRESSION
MnOExp:	bsr	MnOLong
	move.w	d0,(a2)+
	rts
* Conversion DEC-> HEXA
MnOLong	moveq	#0,d0
	moveq	#1,d3
	bsr	MnOChS
	cmp.b	#"-",d0
	bne.s	Mnh0
	subq.w	#1,d3
	bsr	MnOChS
Mnh0:	sub.b	#"0",d0
	bcs	MnOE1
	cmp.b	#10,d0
	bcc	MnOE1
	move.l	d0,d1
	subq.w	#1,d3
Mnh1:   bsr 	MnOChS
	sub.b	#"0",d0
	bcs.s	Mnh2
	cmp.b 	#10,d0
        bcc.s 	Mnh2
	add.l	d1,d1
	move.l	d1,d2
	lsl.l	#2,d1
	add.l	d2,d1
	add.l	d0,d1
	bra.s	Mnh1
Mnh2:   subq.l 	#1,a1
	addq.w	#1,d7
        tst 	d3
	beq.s	MnhX
	bpl	MnOE1
	neg.l	d1
MnhX:	move.l	d1,d0
	rts

******* CHR GET 
MnOChS	moveq	#33,d4		* Saute les espace
	bra.s	MnOCh0
MnOChr	moveq	#32,d4		* Ramene les espaces
MnOCh0	tst.w	d7
	beq.s	MnOChX
	move.b	(a1)+,d0
	subq.w	#1,d7
	cmp.b	#"(",d0
	beq.s	MnOCh2
	cmp.b	#27,d0
	beq.s	MnOCh1
	cmp.b	d4,d0
	bcs.s	MnOCh0
	moveq	#1,d4
MnOChX	rts
MnOCh1	addq.l	#2,a1
	subq.w	#2,d7
	bpl.s	MnOCh0
	bmi	MnOE1
MnOCh2	subq.l	#1,a1
	addq.w	#1,d7
	moveq	#0,d0
	rts
* D0-> Majuscule
D0Maj:	cmp.b	#"a",d0
	bcs.s	MnOChX
	cmp.b	#"z",d0
	bhi.s	MnOChX
	sub.b	#32,d0
	rts

******* Dessine un objet!
*	D1/D2/D3= Encres par default
*	D4/D5	= X/Y
*	Ramene:	D0/D1 -> Position curseur!
*	Ramene: D2/D3 -> Taille maxi!
MnODraw	movem.l	a0-a6/d4-d7,-(sp)
	move.l	d0,a4
	move.l	T_RastPort(a5),a1
	move.w	d4,36(a1)
	move.w	d5,38(a1)
	move.w	d4,a2
	move.w	d5,a3
	moveq	#0,d4
	moveq	#0,d5
	move.w	d4,d6
	move.w	d5,d7
* Change les encres --> par defaut
	tst.l	d7
	bmi.s	MnODr0
	moveq	#0,d0
	move.w	d1,d0
	bsr	ObInkA
	move.w	d2,d0
	bsr	ObInkB
	move.w	d3,d0
	bsr	ObInkC
	moveq	#1,d0
	bsr	ObWrite
* Appelle la fonction
MnODr0	lea	2(a4),a4
MnODr1	move.w 	(a4)+,d0
	lea	ObJumps(pc),a0
	jsr	0(a0,d0.w)
* Trouve le maximum
	cmp.w	d6,d4
	ble.s	MnODr2
	move.w	d4,d6
MnODr2:	cmp.w	d7,d5
	ble.s	MnODr1
	move.w	d5,d7
	bra.s	MnODr1
* Fini!
MnODrX:	move.w	d4,d0
	move.w	d5,d1
	move.w	d6,d2
	move.w	d7,d3
	movem.l	(sp)+,a0-a6/d4-d7
	rts

******* Fin dessin objet
MnOFin:	addq.l	#4,sp
	bra	MnODrX
MnORien	
MnORet	rts
******* Impression texte
MnOPr	move.w	(a4)+,d0
	move.l	a4,a0
	add.w	d0,a4
	btst	#0,d0
	beq.s	MnOP0
	addq.l	#1,a4
MnOP0:	tst.l	d7
	bmi.s	MnOP1
	move.w	d4,d2			* X
	add.w	a2,d2
	move.w	d2,36(a1)
	move.w	d5,d3			* Y
	add.w	62(a1),d3
	add.w	a3,d3
	move.w	d3,38(a1)
	move.w	d0,d1
	move.w	#Text,a6
	bsr	MnGfx
	move.w	d1,d0
MnOP1:	move.w	#TextLength,a6		* Taille
	bsr	MnGfx
	add.w	d0,d4
	add.w	58(a1),d5
	rts
******* LOCATE
MnOLoc	move.l	a4,a0
	addq.l	#4,a4
	move.w	(a0)+,d0
	bmi	MnORien
	move.w	(a0)+,d1
	bmi	MnORien
	move.w	d0,d4
	move.w	d1,d5
	rts
******* BAR TO x,y
MnOBar	move.l	a4,a0
	addq.l	#4,a4
	move.w	d4,d0
	move.w	d5,d1
	move.w	(a0)+,d2
	bmi	MnORien
	move.w	(a0)+,d3
	bmi	MnORien
	cmp.w	d0,d2
	bls	MnORien
	cmp.w	d1,d3
	bls	MnORien
	move.w	d2,d4
	move.w	d3,d5
	addq.w	#1,d4
	addq.w	#1,d5
	add.w	a2,d0
	add.w	a3,d1
	add.w	a2,d2
	add.w	a3,d3
	tst.l	d7
	bmi	MnORet
	move.w	#RectFill,a6
	bra	MnGfx
******* LINE x,y
MnOLine	move.l	a4,a0
	addq.l	#4,a4
	move.w	(a0)+,d0
	bmi	MnORien
	move.w	(a0)+,d1
	bmi	MnORien
	move.w	d4,d2
	add.w	a2,d2
	move.w	d2,36(a1)
	move.w	d5,d3
	add.w	a3,d3
	move.w	d3,38(a1)
	move.w	d0,d4
	move.w	d1,d5
	addq.w	#1,d4
	addq.w	#1,d5
	add.w	a2,d0
	add.w	a3,d1
	tst.l	d7
	bmi	MnORet
	move.w	#RDraw,a6
	bra	MnGfx
******* ELLIPSE
MnOEl:	move.l	a4,a0
	lea	4(a4),a4
	move.w	d4,d0
	move.w	d5,d1
	move.w	(a0)+,d2
	bls	MnoRien
	move.w	(a0),d3
	bls	MnoRien
	add.w	d2,d4
	add.w	d3,d5
	addq.w	#1,d4
	addq.w	#1,d5
	tst.l	d7
	bmi	MnORet
	add.w	a2,d0
	add.w	a3,d1
	move.w	#DrawEllipse,a6
	bra	MnGfx
******* ICON n
MnOIco	move.w	(a4)+,d1
	move.l	a2,a0
	movem.l	a2/d7,-(sp)
	bsr	AdIcon
	bra.s	MnObb0
******* BOB n
MnOBob	move.w	(a4)+,d1
	move.l	a2,a0
	movem.l	a2/d7,-(sp)
	bsr	AdBob
MnObb0	move.l	a2,a0
	movem.l	(sp)+,a2/d7
	tst.w	d0
	bne	MnoRien
	tst.l	(a0)
	beq	MnoRien
	tst.l	d7
	bmi.s	MnObb1
	movem.l	a0-a2/d4-d7,-(sp)
	move.w	d4,d2
	move.w	d5,d3
	add.w	a2,d2
	add.w	a3,d3
	move.l	BufBob(a5),a1
	move.l	a0,a2
	moveq	#0,d4
	moveq	#-1,d5
	SyCall	Patch
	movem.l	(sp)+,a0-a2/d4-d7
MnObb1	move.l	(a0),a0
	move.w	(a0)+,d0
	lsl.w	#4,d0
	add.w	d0,d4
	add.w	(a0)+,d5
	rts
******* INK 
MnOInk	move.w	(a4)+,d1
	move.w	(a4)+,d0
	tst.l	d7
	bmi	MnORet
	subq.w	#2,d1
	bmi.s	ObInkA
	beq.s	ObInkB
* INK C
ObInkC	move.b	d0,27(a1)
	rts
* INK B
ObInkB	GfxCa5	SetBPen
	rts
* INK A
ObInkA	GfxCa5	SetAPen
	rts
******* SET PATTERN
MnOPat	move.w	(a4)+,d0
	tst.l	d7
	bmi	MnORet
ObPat	move.w	d0,d1
	EcCall	Pattern
	rts
******* OUTLINE
MnOOut	bclr	#4,33(a1)
	move.w	(a4)+,d0
	beq.s	MnOo1
	bset	#4,33(a1)
MnOo1:	rts
******* SET LINE
MnOSL:	move.w	(a4)+,34(a1)
	rts
******* SET FONT
MnOSF	move.w	(a4)+,d1
	EcCall	SFont
	rts
******* WRITING
ObWrite	GfxCa5	SetDrMd
	rts
******* SET STYLE
MnoSty	move.w	(a4)+,d0
	move.b	d0,56(a1)
	rts
******* SET FONT
MnoFont	move.w	(a4)+,d1
	EcCall	SFont
	rts

******* Appel d'une fonction GFX
MnGfx	movem.l	a0/a1/d1/d6/a6,-(sp)
	move.w	a6,d6
	move.l	T_GfxBase(a5),a6
	jsr	0(a6,d6.w)
	movem.l	(sp)+,a0/a1/d1/d6/a6
	rts
******* APPEL DE PROCEDURE!
MnOCall	movem.l	a1-a3/d6-d7,-(sp)
	tst.w	Direct(a5)		* Pas en mode direct!!!
	bne	MnOcE
* Prepare les registres
	lea	CallReg(a5),a0
	moveq	#0,d0
	moveq	#0,d1
	move.w	d4,d0
	move.w	d5,d1
	add.w	a2,d0
	add.w	a3,d1
	move.l	d0,(a0)			* D0/D1---> X et Y
	move.l	d1,4(a0)
	moveq	#-1,d0
	tst.l	d7
	bpl.s	MnoC1
	moveq	#0,d0
MnoC1	move.l	d0,8(a0)		* D2------> Flag dessin
	moveq	#0,d0
	btst	#30,d7
	beq.s	MnoC2
	moveq	#-1,d0
MnoC2	move.l	d0,12(a0)		* D3------> Active ou non?
	moveq	#0,d0
	btst	#29,d7
	beq.s	MnoC3
	moveq	#-1,d0
MnoC3	move.l	d0,16(a0)		* D4------> 1er dessin?
	move.l	MnDAd(a5),a1		* A0------> Adresse menu
	move.l	a1,8*4(a0)
	move.l	MnDatas(a1),9*4(a0)	* A1------> Adresse datazone
* Appelle la procedure
	move.l	a4,d3
	add.w	(a4)+,a4
	bsr	GLb3
	beq.s	MnOcE
	move.l	d0,a2
	movem.l	a4-a6,-(sp)
	move.l	MnRA3(a5),a3
	move.l	MnRA4(a5),a4
	sub.l	a6,a6
	move.l	sp,MnPile(a5)
	clr.w	-(sp)
	bra	InProE
* Retour de la procedure
MnRet	movem.l	(sp)+,a4-a6
	movem.l	(sp)+,a1-a3/d6-d7
	lea	CallReg(a5),a0
	move.l	(a0),d4
	move.l	4(a0),d5
	sub.w	a2,d4
	sub.w	a3,d5
	rts
* Erreur!
MnOcE	movem.l	(sp)+,a1-a3/d6-d7
	rts
******* RESERVE ESPACE MEMOIRE
MnORes	moveq	#0,d1
	move.w	(a4)+,d1
	bls.s	MnOR2
	tst.l	d7
	bpl.s	MnOR2
* Reserve l'espace
	move.l	a2,-(sp)
	move.l	MnDAd(a5),a2
	bsr	MnODVar
	move.l	d1,d0
	bsr	RamFast
	beq.s	MnOR1
	move.l	d0,MnDatas(a2)
	move.w	d1,MnLData(a2)
MnOR1	move.l	(sp)+,a2
MnOR2	rts
******* Efface espace local
MnODVar	movem.l	d0/a1,-(sp)
	moveq	#0,d0
	move.w	MnLData(a2),d0
	beq.s	MnODV1
	move.l	MnDatas(a2),a1
	bsr	RamFree
	clr.w	MnLData(a2)
	clr.l	MnDatas(a2)
MnODV1	movem.l	(sp)+,d0/a1
	rts
	
******* Sauve le contenu du carre D4/D5/D6/D7
*	Base:	A2
MnSave:	
* Efface l'ancien
	bsr	MnSaDel
	movem.l	a0-a3/d0-d7,-(sp)
	addq.w	#1,d6
	addq.w	#1,d7
* Clippe
	move.l	MnAdEc(a5),a3
	tst.w	d4
	bpl.s	MnSa1
	clr.w	d4
MnSa1:	tst.w	d5
	bpl.s	MnSa2
	clr.w	d5
MnSa2:	cmp.w	EcTx(a3),d4
	bge	MnSaX
	cmp.w	EcTy(a3),d5
	bge	MnSaX
	cmp.w	EcTx(a3),d6
	ble.s	MnSa3
	move.w	EcTx(a3),d6
MnSa3:	cmp.w	EcTy(a3),d7
	ble.s	MnSa4
	move.w	EcTy(a3),d7
MnSa4:	tst.w	d6
	bmi.s	MnSaX
	tst.w	d7
	bmi.s	MnSaX
* Calcule la taille / reserve la memoire
	lsr.w	#4,d4
	ext.l	d4
	add.w	#15,d6
	lsr.w	#4,d6
	sub.w	d4,d6
	bls.s	MnSaX
	sub.w	d5,d7
	bls.s	MnSaX
	move.w	EcTLigne(a3),d3
	ext.l	d3
	mulu	d3,d5
	add.l	d4,d5
	add.l	d4,d5
	move.w	d6,d0
	lsl.w	#1,d0
	mulu	d7,d0
	move.w	EcNPlan(a3),d4
	mulu	d4,d0
	addq.l	#8,d0
	addq.l	#8,d0
	move.l	d0,d1
	bsr	RamFast2
	bne.s	MnSaO
	move.w 	#24,MnError(a5)
	bra.s	MnSaX
MnSaO	move.l	d0,MnAdSave(a2)
	move.l	d0,a0
	move.l	d1,(a0)+
	move.l	a3,(a0)+
	subq.w	#1,d4
	subq.w	#1,d6
	subq.w	#1,d7
	move.w	d5,(a0)+
	move.w	d6,(a0)+
	move.w	d7,(a0)+
	move.w	d4,(a0)+
* Sauve le contenu!
	lea	EcPhysic(a3),a3
MnSa5:	move.l	a3,a2
	move.w	d4,d2
MnSa6:	move.l	(a2)+,a1
	add.l	d5,a1
	move.w	d6,d1
MnSa7:	move.w	(a1)+,(a0)+
	dbra	d1,MnSa7
	dbra	d2,MnSa6
	add.l	d3,d5
	dbra	d7,MnSa5
* Ca y est!
MnSaX:	movem.l	(sp)+,a0-a3/d0-d7
	rts

******* Remet la portion de decor sauvee
MnRest:	movem.l	a0-a3/d0-d7,-(sp)
	move.l	MnAdSave(a2),d0
	beq.s	MnRsX
	move.l	d0,a0
	addq.l	#4,a0
	move.l	(a0)+,a3
	moveq	#0,d5
	move.w	(a0)+,d5
	move.w	(a0)+,d6
	move.w	(a0)+,d7
	move.w	(a0)+,d4
	moveq	#0,d3
	move.w	EcTLigne(a3),d3
	ext.l	d3
	lea	EcPhysic(a3),a3
MnRs1:	move.l	a3,a2
	move.w	d4,d2
MnRs2:	move.l	(a2)+,a1
	add.l	d5,a1
	move.w	d6,d1
MnRs3:	move.w	(a0)+,(a1)+
	dbra	d1,MnRs3
	dbra	d2,MnRs2
	add.l	d3,d5
	dbra	d7,MnRs1
MnRsX:	movem.l	(sp)+,a0-a3/d0-d7
	rts

******* Efface -si present- la memoire reservee pour le fond
MnSaDel	move.l	MnAdSave(a2),d0
	beq.s	MnSad
	move.l	d0,a1
	move.l	(a1),d0
	bsr	RamFree
	clr.l	MnAdSave(a2)
MnSad:	rts

***********************************************************

