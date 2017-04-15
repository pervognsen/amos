*
		INCDIR	":AMOS.s/Common/"
		Include	"_Equ.s"
		RsSet	DataLong
		Include "_Pointe.s"
*
		Include	"_WEqu.s"
		Include "_CEqu.s"
		Include "_LEqu.s"
*
		dc.w	LInit
*
L_Buffers	equ	$900
*
;---------------------------------------------------------------------
;   ***  ***  **   ** ****  **** **    **    **   **   **  ***   ***
;  **   ** ** *** *** ** **  **  **    **   ****  *** *** ** ** ** 
;  **   ** ** ** * ** ** **  **  **   **   **  ** ** * ** ** **  ***
;  **   ** ** **   ** ****   **  **        ****** **   ** ** **    **
;  **   ** ** **   ** **     **  **        **  ** **   ** ** ** *  **
;   ***  ***  **   ** **    **** ****      **  ** **   **  ***   ***
;---------------------------------------------------------------------
; Entete programme objet
;---------------------------------------------------------------------
DebPrg	bra.s	CliStart
Flags	dc.w	0

;-----> Debut normal
CliStart
	lea	DebPrg(pc),a4
	move.l	a4,H_DebPrg-DebPrg(a4)
; Entree en cas de backstart
BackIn
	move.l	$4.w,a6
	move.l	sp,H_SaveSp-DebPrg(a4)
	movem.l	a0/d0,-(sp)
* Couleur a flasher
	moveq	#0,d0
	move.b	Flags(pc),d0
	cmp.b	#32,d0
	bcc.s	.Skip
	lsl.w	#1,d0
	add.l	#$DFF180,d0
	lea	Flish(pc),a0
	move.w	#$33C0,(a0)+
	move.l	d0,(a0)
.Skip
* Ouvre le DOS
	moveq	#0,d0
	lea	DosName(pc),a1
	jsr	OpenLib(a6)		OpenOldLibrary
	move.l	d0,H_DosBase-DebPrg(a4)
* Recherche et stoppe les programmes AMOS lancés...
	jsr	Forbid(a6)
	lea	TaskName(pc),a1
	jsr	FindTask(a6)
	tst.l	d0
	beq.s	NoAMOS
	move.l	d0,a0
	move.l	10(a0),a1
	move.b	#"S",(a1)		* STOP!!!
	move.l	a1,H_Stopped_AMOS-DebPrg(a4)
NoAMOS	jsr	Permit(a6)
* Change son propre nom...
	sub.l	a1,a1
	jsr	FindTask(a6)
	move.l	d0,a0
	move.l	d0,H_MyTask-DebPrg(a4)
	move.l	10(a0),H_OldName-DebPrg(a4)
	lea	TaskName(pc),a1
	move.l	a1,10(a0)
* CLI ou WORKBENCH?
	tst.w	H_Backed-DebPrg(a4)
	bne.s	CliSt0
	tst.l	$ac(a0)
	bne.s	CliSt0
	lea	$5c(a0),a0
	move.l	a0,-(sp)
	jsr	-384(a6)		* WaitPort
	move.l	(sp)+,a0
	jsr	-372(a6)		* GetMsg
	move.l	d0,H_Message-DebPrg(a4)
	beq.s	CliSt0
* WB, change le DIR
WbBack	move.l 	d0,a0
	move.l	$24(a0),d0
	beq.s	CliSt0
	move.l	d0,a0
	move.l	(a0),d1
	beq.s	CliSt0
	move.l	H_DosBase(pc),a6
	jsr	DosCuDir(a6)
	move.l	$4.w,a6
CliSt0

******* Preparation du programme
Re_Load
	lea	H_Load(pc),a6
	bsr	DecHunk
	bmi	Abort2
	move.l	a1,a2
; Relocation du programme / Effacement relocation
	bsr	DecHunk
	bmi	Abort2
	move.l	a1,a3
	bsr	H_Reloc
	bsr	EffLastLoad
	addq.l	#8,a6		* Place pour RUN!
; Decompacte W.Lib
	bsr	DecHunk
	bmi	Abort2
	move.l	a1,a3		* A3= adresse W.Lib
; Reserve les DATAS
	bsr	DecHunk
	bmi	Abort2
	move.l	a1,a2		* A2= adresse datas
	move.l	#L_Buffers,d7	*   LBuffers
	add.l	8(a3),d7	* + LTrappe
	add.l	4(a2),d7	* + DataZone
	add.l	8(a2),d7	* + Longueur donnees
	move.l	d7,d0
	move.l	#PUBLIC|CLEAR,d1
	bsr	H_Ram
	beq	Abort2
	move.l	d0,d6
	move.l	d0,a5
	lea	L_Buffers(a5),a5
	move.l	a5,a0		* Haut des buffers...
	add.l	8(a3),a5	* Pointeur sur donnees!
* Trouve toutes les adresses de buffers...
	lea	-32(a0),a0
	move.l	a0,BufLabel(a5)		* Buffer label expression
	lea	-BbLong(a0),a0
	move.l	a0,BufBob(a5)		* Buffer dessin d'un bob
	lea	-12*2(a0),a0
	move.l	a0,MnTDraw(a5)		* Buffer outline menus
	lea	-(AreaSize*5+6)(a0),a0
	move.l	a0,AreaBuf(a5)		* Zone pour les AREAFILL
	lea	-24(a0),a0
	move.l	a0,AreaInfo(a5)
	lea	-16(a0),a0
	move.l	a0,BufAMSC(a5)		* Buffers chargement IFF
	lea	-12(a0),a0
	move.l	a0,BufCCRT(a5)
	lea	-70*3(a0),a0
	move.l	a0,BufCMAP(a5)
	lea	-4(a0),a0
	move.l	a0,BufCAMG(a5)
	lea	-20(a0),a0
	move.l	a0,BufBMHD(a5)
	lea	-108(a0),a0
	move.l	a0,DirFNeg(a5)		* Filtre negatif directory
	lea	-108(a0),a0
	move.l	a0,Name2(a5)		* Buffers nom disque
	lea	-256(a0),a0
	move.l	a0,Name1(a5)
	lea	-TBuffer(a0),a0	
	move.l	a0,Buffer(a5)		* Buffer
	move.l	a0,BasA3(a5)		* Buffer parametres
* Buffer du PATHACT
	move.l	#256,d0
	move.l	#PUBLIC|CLEAR,d1
	bsr	H_Ram
	beq	Abort2
	move.l	d0,PathAct(a5)
* Adresse de cette tache
	move.l	H_MyTask-DebPrg(a4),T_MyTask(a5)
* Adresses W.Lib
	move.l	a5,a1
	add.l	4(a2),a1
	move.l	8(a2),d0
	subq.l	#1,d0
	lea	12(a2),a2
InIn5	move.b	(a2)+,(a1)+
	dbra	d0,InIn5
* Efface le .ENV
	bsr	EffLastLoad	
* Marque la DZ
	move.l	d6,(a6)+
	move.l	d7,(a6)+
	alea	ExtNames,a0
; Init MOUSE.ABK / Couleurs souris...
	bsr	DecHunk
	bmi	Abort2
	lea	DefEPa+16*2(a5),a2
	moveq	#15,d0
InIn6	move.w	(a1)+,(a2)+
	dbra	d0,InIn6
	move.l	a1,T_MouBank(a5)
; Init DEFAULT.FONT
	bsr	DecHunk
	bmi	Abort
	move.l	a1,T_JeuDefo(a5)
; Init DEFAULT.KEY
	bsr	DecHunk
	bmi	Abort
	move.l	a1,T_ClAsc(a5)
; Init BANQUES
	lea	BBanks(a5),a3
	move.l	a3,ABanks(a5)
	move.l	a6,H_ABanks-DebPrg(a4)
.loop	bsr	DecHunk
	bmi	Abort
	beq.s	.loopX
	bsr	GBanks
	bra.s	.loop
.loopX

* DOS library
	move.l	H_DosBase(pc),DosBase(a5)
	move.l	$4.w,a6
* GRAPHICS Library
	moveq	#0,d0
	lea	GfxName(pc),a1
	jsr	OpenLib(a6)
	move.l	d0,T_GfxBase(a5)
	beq	Abort
* Init INTUITION library / Find version!
	move.l	$4.w,a6
	moveq	#37,d0
	move.l	d0,d3
	lea	IntName(pc),a1
	jsr	OpenLib(a6)
	tst.l	d0
	bne.s	.Skp
	moveq	#36,d0
	move.l	d0,d3
	lea	IntName(pc),a1
	jsr	OpenLib(a6)
	tst.l	d0
	bne.s	.Skp
	moveq	#0,d0
	move.l	d0,d3
	lea	IntName(pc),a1
	jsr	OpenLib(a6)
	tst.l	d0
	beq	Abort
.Skp	move.l	d0,T_IntBase(a5)
	move.w	d3,WB2.0(a5)

;	Short-Mem run, ou first run?
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	tst.b	H_Short-DebPrg(a4)
	beq.s	.First
; Short-mem: repoke les données sauvees dans la pile
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	clr.b	H_Short-DebPrg(a4)
; Les librairies
	move.l	Short_Math(sp),MathBase(a5)
	move.l	Short_Font(sp),T_FntBase(a5)
; Le pathact
	lea	Short_Path(sp),a0
	move.l	PathAct(a5),a1
.Cop1	move.b	(a0)+,(a1)+
	bne.s	.Cop1
; La ligne de commande
	lea	Short_Command(sp),a0
	move.l	Buffer(a5),a1
	lea	TBuffer-256-6(a1),a1
	move.l	#"CmdL",(a1)+
	move.w	(a0)+,d0
	move.w	d0,(a1)+
	beq.s	.FinMes
	subq.w	#1,d0
.Cop2	move.b	(a0)+,(a1)+
	dbra	d0,.Cop2	
	bra	.FinMes
; First run: saisie de la ligne de commande
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.First	move.l	Buffer(a5),a1
	lea	TBuffer-256-6(a1),a1
	move.l	#"CmdL",(a1)+
	move.l	a1,a2
	clr.w	(a1)+
; Prend le message du CLI
	movem.l	(sp)+,a0/d0
	move.l	H_Message(pc),d1
	bne.s	.PaCli
	moveq	#0,d2
	subq.w	#1,d0
	bmi.s	.FinMes
.Cl1	move.b	(a0)+,d1
	cmp.b	#32,d1
	bcs.s	.Cl2
	bne.s	.Cl0
	tst.b	d2
	beq.s	.Cl2
.Cl0	move.b	d1,(a1)+
	addq.w	#1,d2
.Cl2	dbra	d0,.Cl1
	bra.s	.FinMes
.PaCli
; Prend le message du WB
; ~~~~~~~~~~~~~~~~~~~~~~
	move.l	d1,a0
	cmp.l	#2,$1c(a0)
	bne.s	.PaWb
	move.l	$24(a0),d0
	beq.s	.PaWb
	move.l	d0,a0
	move.l	12(a0),d0
	beq.s	.PaWb
	move.l	d0,a0
.WbL1	move.b	(a0)+,(a1)+
	bne.s	.WbL1
	subq.l	#1,a1
.FinMes	sub.l	a2,a1
	subq.l	#2,a1
	move.w	a1,(a2)
.PaWb

******* Attend que l'autre AMOS soit arrete!
	move.l	H_Stopped_AMOS(pc),d0
	beq.s	.Wait2
	move.l	d0,a2
	move.w	#50*5,d3
.Wait1	move.l	T_GfxBase(a5),a6
	jsr	-270(a6)
	cmp.b	#"S",(a2)
	bne.s	.Wait2
	dbra	d3,.Wait1
	bra	Abort
.Wait2

******* Initialise le switcher
	move.l	T_MyTask(a5),a0
	tst.l	$58(a0)
	bne.s	.Inited
	move.l	a5,$58(a0)
	moveq	#Switcher_Signal,d3
	bsr	Send_Switcher
.Inited
******* Vide les caches du 68030 / 68040
	bsr	Sys_ClearCache

******* Init trappe!
	lea	ParaTrap(a5),a0
	move.l	H_Load+8*2(pc),a1
	moveq	#0,d0
	move.w	Flags(pc),d1
	btst	#0,d1
	beq.s	.Skip
	subq.w	#1,d0
.Skip	jsr	(a1)
	tst.w	d0
	bne	Abort
	addq.w	#1,H_Flag-DebPrg(a4)

******* Fabrique l'areainfo
	lea	AreaInfo(a5),a0
	lea	AreaBuf(a5),a1
	moveq	#AreaSize,d0
	move.l	T_RastPort(a5),a2
	move.l	a0,16(a2)
	GfxCa5	InitArea
* Il faut afficher l'écran!
	moveq	#0,d7

******* Fin de RUN
EndRun	
* Les banques sont prises en compte par AMOS!
	move.l	H_ABanks(pc),a0
	moveq	#16*2-1,d0
.loop	clr.l	(a0)+
	dbra	d0,.loop
* Appelle le programme
	move.l	BasA3(a5),a3
	move.l	H_SaveSp(pc),sp
	lea	-4(sp),a0
	move.l	a0,BasSp(a5)		* Niveau FIN
	move.l	a0,LowPileP(a5)		* Niveau FIN PROCEDURE
	move.l	a0,LowPile(a5)		* Niveau DERNIER GOSUB
	move.l	H_Load(pc),a0
	jsr	(a0)
	bra.s	Abort
	bra	Run_Normal		* Run Normal
	bra	Run_Short		* Run Short Memory

******* Fin du programme
Abort
; Trappe en route?
	move.w	H_Flag(pc),d0
	beq.s	PasW
; Empeche le switcher de fonctionner
	moveq	#Switcher_Signal+1,d3
	bsr	Send_Switcher
; Arret trappe
	move.l	H_Load+8*2(pc),a0
	jsr	4(a0)
; Imprime le message d'erreur...
	move.l	Name2(a5),a0
	tst.b	(a0)
	beq.s	.EndEr
	move.l	H_Message(pc),d0
	bne.s	.Wberr
	move.l	DosBase(a5),a6
	jsr	-60(a6)
	move.l	d0,d1
	move.l	Name2(a5),d2
	move.l	d2,a0
.Clip0	tst.b	(a0)+
	bne.s	.Clip0
	move.b	#10,-1(a0)
	move.l	a0,d3
	sub.l	d2,d3
	move.l	DosBase(a5),a6
	jsr	DosWrite(a6)
	bra.s	.EndEr
; Sous WB-> ouvre une tchote fenetre
.Wberr	lea	H_Click(pc),a0
	lea	H_AutoBody(pc),a1
	move.l	Name2(a5),12(a1)
	lea	H_AutoClick(pc),a3
	move.l	a0,12(a3)
	sub.l	a2,a2
	sub.l	a0,a0
	moveq	#0,d0
	moveq	#0,d1
	move.l	#480,d2
	moveq	#50,d3
	move.l	T_IntBase(a5),a6
	jsr	-348(a6)
.EndEr

; Ferme les librairies
PasW	move.l	$4.w,a6
	move.l	T_IntBase(a5),d0
	beq.s	.skip0
	move.l	d0,a1
	jsr	CloseLib(a6)
.skip0
	move.l	T_GfxBase(a5),d0
	beq.s	.skip1
	move.l	d0,a1
	jsr	CloseLib(a6)
.skip1
* Enleve PATHACT
	move.l	PathAct(a5),d0
	beq.s	.SkipP	
	move.l	d0,a1
	move.l	#256,d0
	bsr	H_Free
.SkipP
; Libere les buffers
Abort2	moveq	#H_LoadN-1,d2
	lea	H_Load(pc),a2
Abt2a	move.l	(a2),d0
	beq.s	Abt2b
	move.l	d0,a1
	move.l	4(a2),d0
	beq.s	Abt2b
	bsr	H_Free
Abt2b	addq.l	#8,a2
	dbra	d2,Abt2a
; Relance l'ancien AMOS
	move.l	H_Stopped_AMOS(pc),d0
	beq.s	.Skip0
	move.l	d0,a0
	move.b	#" ",(a0)
.Skip0
; Remet son ancien nom
	move.l	$4.w,a6
	sub.l	a1,a1
	jsr	FindTask(a6)
	move.l	d0,a0
	move.l	H_OldName(pc),10(a0)
; Ferme le DOS
	move.l	H_DosBase(pc),a1
	jsr	CloseLib(a6)
; FIN, si WB -> renvoie le message. 
	move.l	H_SaveSp(pc),sp
	move.l	H_Message(pc),d2
	beq.s	.Skip
	jsr	Forbid(a6)
	move.l 	d2,a1
	jsr	-378(a6)
.Skip	moveq	#0,d0
	rts

; RUN program, avec short memory
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Run_Short
	move.l	H_DebPrg(pc),a4
	lea	-Short_Save(sp),sp
; Sauve les pointeurs librairie
	move.l	MathBase(a5),Short_Math(sp)
	move.l	T_FntBase(a5),Short_Font(sp)
	clr.l	MathBase(a5)
	clr.l	T_FntBase(a5)
; Copie le nom du programme
	move.l	Name1(a5),a0
	lea	Short_Name(sp),a1
.Copy	move.b	(a0)+,(a1)+
	bne.s	.Copy
; Copie le pathname courant
	move.l	PathAct(a5),a0
	lea	Short_Path(sp),a1
.Cop2	move.b	(a0)+,(a1)+
	bne.s	.Cop2
; Copie la ligne de commande
	move.l	Buffer(a5),a0
	lea	TBuffer-256-6(a0),a0
	lea	Short_Command(sp),a1
	clr.b	(a1)
	cmp.l	#"CmdL",(a0)+
	bne.s	.Cop4
	move.w	(a0)+,d0
	move.w	d0,(a1)+
	beq.s	.Cop4
	subq.w	#1,d0
.Cop3	move.b	(a0)+,(a1)+
	dbra	d0,.Cop3
.Cop4
; Effacement de toute la mémoire
	move.l	H_Load+8*2(pc),a0	Arret trappe
	jsr	4(a0)
; Ferme les librairies
	move.l	$4.w,a6
	move.l	T_IntBase(a5),a1
	jsr	CloseLib(a6)
	move.l	T_GfxBase(a5),a1
	jsr	CloseLib(a6)
; Enleve PATHACT
	move.l	PathAct(a5),a1
	move.l	#256,d0
	bsr	H_Free
; Libere les buffers
	moveq	#H_LoadN-1,d2
	lea	H_Load(pc),a2
.Abt2a	move.l	(a2),d0
	beq.s	.Abt2b
	move.l	d0,a1
	move.l	4(a2),d0
	beq.s	.Abt2b
	bsr	H_Free
.Abt2b	clr.l	(a2)
	clr.l	4(a2)
	addq.l	#8,a2
	dbra	d2,.Abt2a
; Fait un flush!
	moveq	#4,d2			4 fois!!!
.Flush	move.l	#8000000,d0		Fait un flush!
	move.l	#PUBLIC,d1
	bsr	H_Ram
	dbra	d2,.Flush
; Charge les hunks...
	lea	Short_Name(sp),a0	Charge les hunks
	move.l	a0,d1
	move.l	H_DosBase(pc),a6
	jsr	-150(a6)
	tst.l	d0
	beq	Abort
; Enleve le premier hunk (header)
	lsl.l	#2,d0			
	move.l	d0,a2
	move.l	a2,a1
	move.l	-(a1),d0
	move.l	(a2),d2
	bsr	H_Free
	move.l	d2,-4(a4)		Branche apres celui-ci!
; Rebranche au debut!
	move.b	#-1,H_Short-DebPrg(a4)
	bra	Re_Load

; Chargement normal de programme...
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Run_Normal	
; Enleve le programme precedent
	lea	H_Load+8(pc),a6
	bsr	EffLastLoad
; Charge le hunk du nouveau programme
	moveq	#NH_Prog,d0
	bsr	HunkLoad
	beq	Abort
	move.l	a1,a2
; Charge la table de relocation / Reloge
	moveq	#NH_Reloc,d0
	bsr	HunkLoad
	beq	Abort
	move.l	a1,a3
	bsr	H_Reloc
	bsr	EffLastLoad
	addq.l	#8,a6
; Charge les banques
	move.l	ABanks(a5),a3
	moveq	#N_HunkSys-1,d6
	move.l	H_ABanks(pc),a6
.loop
	addq.w	#1,d6
	move.w	d6,d0
	bsr	HunkLoad
	beq	.loopX
	bsr	GBanks
	bra.s	.loop
.loopX
* Ferme le fichier, fini!
	bsr	H_Close
* Ne PAS reinitialiser les ecrans
	moveq	#-1,d7
	bra	EndRun

;	Clear CPU Caches, quel que soit le systeme
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sys_ClearCache
	movem.l	a0-a1/a6/d0-d1,-(sp)
	move.l	$4.w,a6
	cmp.w	#37,WB2.0(a5)			A partir de V37
	bcc.s	.Skip
	jsr	FindTask(a6)
	bra.s	.Exit
.Skip	jsr	-$27c(a6)			CacheClearU
.Exit	movem.l	(sp)+,a0-a1/a6/d0-d1
	rts

;-----> Reservation memoire
H_Ram	movem.l	a0-a2/a6/d1-d2,-(sp)
	move.l	$4.w,a6
	jsr	-198(a6)
	movem.l	(sp)+,a0-a2/a6/d1-d2
	tst.l	d0
	rts
H_Free	movem.l	a0-a2/a6/d0-d2,-(sp)
	move.l	$4.w,a6
	jsr	FreeMem(a6)
	movem.l	(sp)+,a0-a2/a6/d0-d2
	rts
H_Copy	movem.l	d0-d2/a0-a2/a6,-(sp)
	move.l	$4.w,a6
	jsr	 -$270(a6)
	movem.l	(sp)+,d0-d2/a0-a2/a6
	rts
;-----> Reloge le programme
H_Reloc	moveq	#0,d0
	move.l	a2,d1
InIn2	moveq	#0,d0
	move.b	(a3)+,d0
	beq.s	InIn4
	cmp.b	#1,d0
	bne.s	InIn3
	lea	508(a2),a2
	bra.s	InIn2
InIn3	lsl.w	#1,d0
	add.l	d0,a2
	add.l	d1,(a2)
	bra.s	InIn2
InIn4	rts
;-----> Ferme le fichier
H_Close	move.l	Handle(a5),d1
	clr.l	Handle(a5)
	move.l	DosBase(a5),a6
	jsr	DosClose(a6)
	move.l	$4.w,a6
	rts
;-----> Gestion des banques, A1= adresse banque
GBanks	move.w	4(a1),d3
	bpl.s	InBkN
* Banque de sprites / icones
	neg.w	d3
	subq.w	#1,d3
	lsl.w	#3,d3
	lea	8(a1),a2
	move.l	a2,0(a3,d3.w)
	moveq	#0,d5
	lea	8(a2),a2
	move.w	(a2)+,d5
	move.l	d5,4(a3,d3.w)
	addq.l	#8,4(a3,d3.w)
	bset	#7,4(a3,d3.w)
	move.w	d5,d0
	lsl.w	#3,d0
	lea	64+6(a2,d0.w),a0
	subq.w	#1,d5
	bmi.s	InBkNx
InBkS1	move.l	(a2),d0
	beq.s	InBkS2
	move.l	a0,(a2)
	add.l	d0,a0
	clr.l	4(a2)
InBkS2	addq.l	#8,a2
	dbra	d5,InBkS1
	bra.s	InBkNx
* Banque normale
InBkN	lsl.w	#3,d3
	lea	8(a1),a2
	move.l	a2,-8(a3,d3.w)
	move.l	(a1),-8+4(a3,d3.w)
* Enleve le header 
InBkNx	moveq	#8,d0
	bsr	H_Free
	addq.l	#8,-8(a6)
	subq.l	#8,-4(a6)
	rts
;-----> Pointe, charge et decompacte le HUNK d0
HunkLoad
	movem.l	a0/a2-a6/d2-d7,-(sp)
; Trouve le HUNK
	move.l	Name2(a5),a0
	move.l	8(a0),d1
	moveq	#5*4,d2
	add.l	d2,a0
	cmp.w	d1,d0
	bcc	NMHunk
	lsl.l	#2,d1
	add.l	d1,d2
	subq.w	#1,d0
	bmi.s	GoH2
GoH1	move.l	(a0)+,d1
	lsl.l	#2,d1
	add.l	d1,d2
	add.l	#12,d2
	dbra	d0,GoH1
GoH2	move.l	(a0),d4
	move.l	Handle(a5),d1
	addq.l	#8,d2
; Pointe le HUNK sur le disque
	moveq	#-1,d3
	move.l	a6,-(sp)
	move.l	DosBase(a5),a6
	jsr	DosSeek(a6)
	move.l	(sp)+,a6
	move.l	d4,d3
	lsl.l	#2,d3
; Reserve la memoire
	moveq	#PUBLIC,d1
	and.l	#$F0000000,d4
	beq.s	.skip
	moveq	#PUBLIC|CHIP,d1	
.skip	move.l	d3,d0			Reserve la RAM
	bsr	H_Ram
	beq	Abort
	move.l	d0,(a6)+
	move.l	d3,(a6)+
	move.l	d0,a1
	movem.l	a1/d3,-(sp)
; Charge le HUNK
	move.l	a1,d2
	movem.l	d1-d2/a0-a2/a6,-(sp)
	move.l	Handle(a5),d1
	move.l	DosBase(a5),a6
	jsr	DosRead(a6)
	movem.l	(sp)+,d1-d2/a0-a2/a6
	cmp.l	d3,d0
	bne	HLErr
	cmp.l	#$78566467,(a1)
	bne.s	PaComp
; Decompacte
	move.l	4(a1),d0
	move.l	d0,d2
	bsr	H_Ram
	beq	Abort
	move.l	d0,d3
	move.l	8(a1),d0
	move.l	d0,d1
	lea	12(a1),a0
	move.l	d3,a1
	movem.l	a1/d2,(sp)
	bsr	H_Copy
	move.l	-(a6),d0
	move.l	-(a6),a1
	bsr	H_Free
	movem.l	(sp),a0/d0
	move.l	a0,(a6)+
	move.l	d0,(a6)+
	bsr	UnSquash
; Fini!
PaComp	movem.l	(sp)+,a1/d1
Nmh	movem.l	(sp)+,a0/a2-a6/d2-d7
	addq.l	#8,a6
	tst.l	d1
	rts
; Plus de hunk
NMhunk	moveq	#0,d1
	bra.s	Nmh
; Erreur de chargement
HLErr	bsr	H_Close
	bra	Abort

;-----> Decompacte et enleve de la liste le HUNK suivant (a0)
;	D1= type de mémoire a réserver
;	A4= Segment base
;	A6> Liste des zones reservees
DecHunk	movem.l	a0/a2-a6/d2-d7,-(sp)
	move.l	H_DebPrg(pc),a4
	move.l	-4(a4),d0
	lsl.l	#2,d0
	beq	DecEnd
	move.l	d0,a2
; Compacte ou non?
	cmp.l	#$78566467,4(a2)
	beq.s	DecHC
; Non compacte, enleve simplement les 8 octets...
	move.l	(a2),-4(a4)		Detache de la liste
	move.l	-(a2),d1		Enleve le header
	move.l	a2,a1
	moveq	#8,d0
	bsr	H_Free
	addq.l	#8,a1
	subq.l	#8,d1
	moveq	#1,d0
	bra.s	DecEnd
; Hunk compacte..
DecHC	move.l	a2,a1			
	movem.l	a0-a2/a6/d1-d2,-(sp)	TypeOfMem
	move.l	$4.w,a6
	jsr	-$216(a6)
	movem.l	(sp)+,a0-a2/a6/d1-d2
	and.l	#$0003,d0		Enleve le flag FAST!
	or.w	#$0001,d0		Public mem
	move.l	d0,d1
	move.l	8(a2),d2	
	move.l	d2,d0
	bsr	H_Ram
	move.l	d0,a1
	move.l	d0,d1
	bne.s	.skip
	moveq	#-1,d0
	bra.s	DecEnd
.skip	movem.l	a1/d2,-(sp)
	move.l	a4,-(sp)
	move.l	d0,d3
	move.l	12(a2),d1
	move.l	d1,d0
	lea	16(a2),a0
	bsr	H_Copy
	bsr	UnSquash		Va decompacter
	move.l	(sp)+,a4		Enleve le hunk de la liste
	move.l	-4(a4),d0	
	lsl.l	#2,d0
	move.l	d0,a1
	move.l	(a1),-4(a4)		
	move.l	-(a1),d0
	bsr	H_Free
	movem.l	(sp)+,a1/d1
	moveq	#1,d0
DecEnd	movem.l	(sp)+,a0/a2-a6/d2-d7	
	tst.l	d0
	bls.s	.skip
	move.l	a1,(a6)+		Poke l'adresse dans la liste
	move.l	d1,(a6)+
.skip	tst.l	d0
	rts
******* Enleve le dernier pointeur de la liste (a6)
EffLastLoad
	movem.l	a1/d0,-(sp)
	move.l	-(a6),d0
	move.l	-(a6),a1
	bsr	H_Free
	clr.l	(a6)
	clr.l	4(a6)
	movem.l	(sp)+,a1/d0
	rts

******* Envoie un signal à l'AMOS_Switcher
Send_Switcher
	movem.l	d0-d7/a0-a6,-(sp)
	lea	Switcher(pc),a1
	move.l	$4.w,a6
	jsr	-294(a6)		FindTask
	tst.l	d0
	beq.s	.PaSwi
	move.l	d0,a1
	moveq	#0,d0
	bset	d3,d0
	jsr	-324(a6)		Signal
.PaSwi	movem.l	(sp)+,d0-d7/a0-a6
	rts

**********************************
*Entry
*	
*	D3 Address
*	D1 Length
*	D0 1 Unsquash
*
*Exit
*	D3 Unsquashed Length positive
*	   or 
*	   Error negative:-
*			     -1 Check on data bad!
*			     -2 Unsquasher was going to overwrite
*				memory that was out of bounds!		
UnSquash:
	MOVE.L	D3,D0
	ADD.L	D0,D1
	MOVEA.L	D1,A0
	MOVEA.L	D0,A1
	MOVEA.L	-(A0),A2
	move.l	a2,d7
	ADDA.L	A1,A2
	MOVE.L	-(A0),D5
	MOVE.L	-(A0),D0
	EOR.L	D0,D5
L22446E	
Flish	nop				Place pour le FLASH
	nop
	nop
	LSR.L	#1,D0
	BNE.S	L224476
	BSR	L2244E8
L224476	BCS.S	L2244AE
	MOVEQ	#8,D1
	MOVEQ	#1,D3
	LSR.L	#1,D0
	BNE.S	L224484
	BSR	L2244E8
L224484	BCS.S	L2244D4
	MOVEQ	#3,D1
	CLR.W	D4
L22448A	BSR	L2244F4
	MOVE.W	D2,D3
	ADD.W	D4,D3
L224492	MOVEQ	#7,D1
L224494	LSR.L	#1,D0
	BNE.S	L22449A
	BSR.S	L2244E8
L22449A	ROXL.L	#1,D2
	DBF	D1,L224494
	cmp.l	a1,a2
	ble.b	bad_squash_mem
	MOVE.B	D2,-(A2)
	DBF	D3,L224492
	BRA.S	L2244E0
L2244A8	MOVEQ	#8,D1
	MOVEQ	#8,D4
	BRA.S	L22448A
L2244AE	MOVEQ	#2,D1
	BSR.S	L2244F4
	CMP.B	#2,D2
	BLT.S	L2244CA
	CMP.B	#3,D2
	BEQ.S	L2244A8
	MOVEQ	#8,D1
	BSR.S	L2244F4
	MOVE.W	D2,D3
	MOVE.W	#$C,D1
	BRA.S	L2244D4
L2244CA	MOVE.W	#9,D1
	ADD.W	D2,D1
	ADDQ.W	#2,D2
	MOVE.W	D2,D3
L2244D4	BSR.S	L2244F4
L2244D6	SUBQ.W	#1,A2
	cmp.l	a1,a2
	blt.b	bad_squash_mem
	MOVE.B	0(A2,D2.W),(A2)
	DBF	D3,L2244D6
L2244E0	CMPA.L	A2,A1
	BLT	L22446E
	tst.l	d5
	beq.b	check_ok
	moveq.l	#-1,d3
	rts
check_ok:
	move.l	d7,d3
	RTS
bad_squash_mem:
	moveq.l	#-2,d3
	rts

L2244E8	MOVE.L	-(A0),D0
	EOR.L	D0,D5
	MOVE.B	#$10,CCR
	ROXR.L	#1,D0
	RTS

L2244F4	SUBQ.W	#1,D1
	CLR.W	D2
L2244F8	LSR.L	#1,D0
	BNE.S	L224506
	MOVE.L	-(A0),D0
	EOR.L	D0,D5
	MOVE.B	#$10,CCR
	ROXR.L	#1,D0
L224506	ROXL.L	#1,D2
	DBF	D1,L2244F8
	RTS

H_Load		dcb.l	(16+7)*2,0
H_LoadN		equ	(*-H_Load)/8
H_ABanks	dc.l	0
H_Flag		dc.w	0
H_Backed	dc.w	0
H_DebPrg	dc.l	1
H_DosBase	dc.l	0
H_Message	dc.l	0
H_SaveSp	dc.l	0
H_OldName	dc.l	0
H_Stopped_AMOS	dc.l	0
H_MyTask	dc.l	0
H_Short		dc.b	0
		dc.b	0

H_AutoBody	dc.b	2,0
		dc.w	1
		dc.w	8,7
		dc.l	0
		dc.l	0
		dc.l	0
H_AutoClick	dc.b	0,1
		dc.w	1
		dc.w	5,4
		dc.l	0
		dc.l	0
		dc.l	0
H_Click		dc.b	" Cancel ",0
DosName		dc.b	"dos.library",0
IntName		dc.b	"intuition.library",0
GfxName		dc.b	"graphics.library",0
TaskName	dc.b	" AMOS",0
Switcher	dc.b	"_Switcher AMOS_",0
		even

; 		Zone de sauvegarde des données short-run
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		RsReset
Short_Name	rs.b	128
Short_Path	rs.b	256
Short_Command	rs.b	256
Short_Math	rs.l	1
Short_Font	rs.l	1
Short_Save	equ	__RS

FInit
LInit		equ 	FInit-DebPrg

