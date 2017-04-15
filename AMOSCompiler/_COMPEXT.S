*
*		NOLIST
*
Version		MACRO
		dc.b	"1.35"
		ENDM
*
ExtNb		equ	5-1
*
		Incdir	":AMOS.s/Common/"
 		Include	"_Equ.s"
		RsSet	DataLong
		Include "_Pointe.s"
		Include	"_WEqu.s"
		Include "_CEqu.s"
		Include	"_LEqu.s"
*
DLea		MACRO
		move.l	ExtAdr+ExtNb*16(a5),\2
		add.w	#\1-CD,\2
		ENDM
*
DLoad		MACRO
		move.l	ExtAdr+ExtNb*16(a5),\1
		ENDM
*
Magic		equ	$12345678
*
*********************************************************************

		dc.l	C_Tk-C_Off
		dc.l	C_Lib-C_Tk
		dc.l	C_Title-C_Lib
		dc.l	C_End-C_Title
		dc.w	0

*********************************************************************
* 		OFFSETS TO FUNCTIONS
C_Off   	dc.w (L1-L0)/2,(L2-L1)/2,(L3-L2)/2,(L4-L3)/2
        	dc.w (L5-L4)/2,(L6-L5)/2,(L7-L6)/2,(L8-L7)/2
        	dc.w (L9-L8)/2,(L10-L9)/2,(L11-L10)/2,(L12-L11)/2
       		dc.w (L13-L12)/2,(L14-L13)/2,(L15-L14)/2,(L16-L15)/2
		dc.w (L17-L16)/2,(L18-L17)/2,(L19-L18)/2,(L20-L19)/2
		dc.w (L21-L20)/2,(L22-L21)/2

*********************************************************************
* 		COMPACTOR TOKENS
C_Tk		dc.w 	1,0
		dc.b 	$80,-1
TkCmp		dc.w	L_CmpCall,-1
		dc.b	"cmpcal","l"+$80,"I",-1
TkCOp		dc.w	L_CmpOpt,-1
		dc.b	"comp option","s"+$80,"I2",-1
TkTston		dc.w	L_Rien,-1
		dc.b	"comp test o","n"+$80,"I",-1
TkTstof		dc.w	L_Rien,-1
		dc.b	"comp test of","f"+$80,"I",-1
TkTst		dc.w	L_Rien,-1
		dc.b	"comp tes","t"+$80,"I",-1
		dc.w	L_Compile1,-1
		dc.b	"!compil","e"+$80,"I2",-2
		dc.w	L_Compile2,-1
		dc.b	$80,"I2,0",-1
		dc.w	-1,L_CompErr
		dc.b	"comp err","$"+$80,"2",-1
		dc.w	L_CompLoad0,-1
		dc.b	"!comp loa","d"+$80,"I",-2
		dc.w	L_CompLoad1,-1
		dc.b	$80,"I2",-1
		dc.w	L_CompDel,-1
		dc.b	"comp de","l"+$80,"I",-1
		dc.w	-1,L_CompHere
		dc.b	"comp her","e"+$80,"0",-1
		dc.w	-1,L_CompSize
		dc.b	"comp siz","e"+$80,"0",-1
		dc.w	-1,L_Squash
		dc.b	"squas","h"+$80,"00,0,0,0,0",-1
		dc.w 	-1,L_UnSquash
		dc.b	"unsquas","h"+$80,"00,0",-1
		dc.w	0

*		LIST
Ext_TkCmp	equ	TkCmp-C_Tk
Ext_TkCOp	equ	TkCOp-C_Tk
Ext_TkTston	equ	TkTston-C_Tk
Ext_TkTstof	equ	TkTstof-C_Tk
Ext_TkTst	equ	TkTst-C_Tk
*		NOLIST

******************************************************************
*		Start of library
C_Lib

******************************************************************
*		COLD START
L0	
* Poke les adresses
	lea	CD(pc),a0
	move.l	a0,ExtAdr+ExtNb*16(a5)
	lea	CmpEnd(pc),a0
	move.l	a0,ExtAdr+ExtNb*16+8(a5)
	moveq	#ExtNb,d0
	rts
******* Routine END
CmpEnd:	RBra	L_CompDel
;-----------------------------------------------------------------
;		DATA ZONE
CD
CmpVect		dc.l	0
CSize		dc.l	0
CNumb		dc.l	0
LErreur		dc.w	0
Erreur		ds.b	80
MathName	dc.b	"mathtrans.library",0
CmpName		dc.b	":AMOS_System/ACmp",0
		even
;-----------------------------------------------------------------

******************************************************************
*		COMPCALL: appel du programme compile!
L_CmpCall	equ	1
L1
* Ouvre MathTrans.library.
	move.w	(a6),d7
	btst	#1,d7
	beq.s	.skip1
	tst.l	MathBase(a5)
	bne.s	.skip1
	moveq	#0,d0
	Dlea	MathName,a1
	move.l	a6,-(sp)
	move.l	$4.w,a6
	jsr	OpenLib(a6)
	move.l	(sp)+,a6
	move.l	d0,MathBase(a5)
	RBeq	L_FCall
.skip1
* Reloge le programme
	lea	2(a6),a1		* Table de relocation
	add.l	(a1),a1
	lea	10(a6),a2
	move.l	a2,d1
	sub.l	6(a6),d1		* Ancienne relocation
	move.l	a2,6(a6)
InIn2	moveq	#0,d0
	move.b	(a1)+,d0
	beq.s	InIn4
	cmp.b	#1,d0
	bne.s	InIn3
	lea	508(a2),a2
	bra.s	InIn2
InIn3	lsl.w	#1,d0
	add.l	d0,a2
	add.l	d1,(a2)
	bra.s	InIn2
InIn4	
* Pointe le END PROC
	lea	10(a6),a0
	move.w	a1,d0
	and.w	#$0001,d0
	lea	0(a1,d0.w),a6		* Pointe le ZERO avant le ENDPROC
* Appelle le programme, D7=FlagFloat
	jsr	(a0)
* Retourne au CHRGET
	rts

******************************************************************
*		COMP OPTIONS "command line"
L_CmpOpt	equ	2
L2	addq.l	#4,a3
	rts

******************************************************************
*		COMPILE "command string"
L_Compile1	equ	3
L3	move.l	(a3)+,a0
	moveq	#0,d0
	move.w	(a0)+,d0
	RBra	L_Callit

******************************************************************
*		COMPILE "Command line",magic
*		Special COMPILER.AMOS
L_Compile2	equ	4
L4	move.l	(a3)+,d0
	cmp.l	#Magic,d0
	Rbne	L_FCall
	move.l	(a3)+,a0
	moveq	#0,d0
	move.w	(a0)+,d0
	DLoad	a2
	move.l	CmpVect-CD(a2),d1
	Rbeq	L_FCall
	lsl.l	#2,d1
	move.l	d1,a1
	movem.l	a2-a6,-(sp)
	jsr	4+8(a1)
	movem.l	(sp)+,a2-a6
	RBra	L_FinComp

*************** Appelle le compilateur!
L_CallIt	equ	5
L5	DLoad	a2
	move.l	CmpVect-CD(a2),d1
	bne.s	.skip
	movem.l	a0-a2/d0-d2,-(sp)
	RBsr	L_CompLoad0
	movem.l	(sp)+,a0-a2/d0-d2
	bra.s	L5
.skip	lsl.l	#2,d1
	move.l	d1,a1
	movem.l	a2-a6,-(sp)
	jsr	4+4(a1)
	movem.l	(sp)+,a2-a6
	RBra	L_FinComp

******************************************************************
*		=COMP ERR
L_CompErr	equ	6
L6	DLoad	a2
	moveq	#0,d3
	move.w	LErreur-CD(a2),d3
	beq.s	.Vide
	RJsr	L_Demande
	move.w	d3,d0
	move.l	a0,d3
	move.w	d0,(a1)+
	subq.w	#1,d0
	lea	Erreur-CD(a2),a0
.Loop1	move.b	(a0)+,(a1)+
	dbra	d0,.Loop1
	move.w	a1,d1
	and.w	#$0001,d1
	add.w	d1,a1
	move.l	a1,HiChaine(a5)
	moveq	#2,d2
	rts
.Vide	move.l	ChVide(a5),d3
	moveq	#2,d2
	rts

*********************************************************************
*		COMP TEST ON/OFF-> RIEN!
L_Rien		equ	7
L7	rts

*********************************************************************
*		COMP LOAD
L_CompLoad0	equ	8
L8	RBsr	L_CompDel
	lea	CmpName-CD(a2),a0
	RBra	L_CLoad
*********************************************************************
*		COMP LOAD "nom"
L_CompLoad1	equ	9
L9	RBsr	L_CompDel
	move.l	(a3)+,a0
	move.w	(a0)+,d0
	Rbeq	L_FCall
	move.l	Buffer(a5),a1
	subq.w	#1,d0
.loop	move.b	(a0)+,(a1)+
	dbra	d0,.loop
	clr.b	(a1)
	move.l	Buffer(a5),a0
	Rbra	L_CLoad
******* Charge le compilateur
L_CLoad		equ	10	
L10	DLoad	a2
	move.l	a0,d1
	move.l	a6,-(sp)
	move.l	DosBase(a5),a6
	jsr	-150(a6)
	move.l	(sp)+,a6
	move.l	d0,CmpVect-CD(a2)
	Rbeq	L_NFound
	lsl.l	#2,d0
	move.l	d0,a0
	cmp.l	#"ACmp",4+12(a0)
	bne.s	.skip
	rts
.skip	RBsr	L_CompDel
	moveq	#95,d0
	RJmp	L_Error

*********************************************************************
*		EFFACE LE COMPILATEUR
L_CompDel	equ	11
L11	Dload	a2
	move.l	CmpVect-CD(a2),d1
	beq.s	.skip
	clr.l	CmpVect-CD(a2)
	move.l	a6,-(sp)
	move.l	DosBase(a5),a6
	jsr	-156(a6)
	move.l	(sp)+,a6
.skip	rts

***********************************************************
*		ERROR MESSAGES
L_FCall		equ	12
L12	moveq	#23,d0
	RJmp	L_Error
L_NFound	equ	13
L13	moveq	#81,d0
	RJmp	L_Error

***********************************************************
*		=COMPHERE
L_CompHere	equ	14
L14	DLoad	a0
	moveq	#0,d3
	move.l	CmpVect-CD(a0),d0
	beq.s	.skip
	moveq	#-1,d3
.skip	moveq	#0,d2
	rts

**********************************************************
* 		Fin de compilation
L_FinComp	equ	15
L15	move.l	d1,CSize-CD(a2)
	move.l	d2,CNumb-CD(a2)
	clr.w	LErreur-CD(a2)
	tst.l	d0
	beq.s	Cmp3
	moveq	#0,d2
	lea	Erreur-CD(a2),a1
Cmp2	cmp.w	#80,d2
	bcc.s	Cmp3
	addq.w	#1,d2
	move.b	(a0)+,(a1)+
	bne.s	Cmp2
	subq.w	#1,d2
	move.w	d2,LErreur-CD(a2)
Cmp3	rts

***********************************************************
*		=COMP SIZE
L_CompSize	equ	16
L16	DLoad	a0
	move.l	CSize-CD(a0),d3
	move.l	CNumb-CD(a0),CSize-CD(a0)
	clr.l	CNumb-CD(a0)
	moveq	#0,d2
	rts

***********************************************************
*		= SQUASH(address,length,fast,speed,colour)
L_Squash	equ	17
L17	move.l	(a3)+,d6
	cmp.l	#32,d6
	Rbcc	L_FCall
	move.l	(a3)+,d7
	cmp.l	#256,d7
	RBcs	L_FCall
	cmp.l	#4096,d7
	RBcc	L_FCall
	move.l	(a3)+,d5
	move.l	(a3)+,d1
	RBls	L_FCall
	move.l	(a3)+,d3
	moveq	#0,d0
	lea	T_Actualise(a5),a0
	movem.l	a3-a6,-(sp)
	RBsr	L_Sq
	movem.l	(sp)+,a3-a6
	moveq	#0,d2
	rts
***********************************************************
*		= UNSQUASH(address,lenght)
L_UnSquash	equ	18
L18	move.l	(a3)+,d1
	RBls	L_FCall
	move.l	(a3)+,d3
	moveq	#1,d0
	movem.l	a3-a6,-(sp)
	RBsr	L_Sq
	movem.l	(sp)+,a3-a6
	moveq	#0,d2
	rts

************************************************************************
L_Sq		equ	19
L19	RData
*
* Squasher II.
*
* Enhanced for varied speed (at a cost of very little inefficiency), 
* error checking and pre scan of memory for fast and efficient squashing!
* Routine checks if enough memory is present for pre scan.You can
* turn off pre scan if you want to test it in non scan but you have
* enough memory for scan by setting d5 to -1.
* This is totally compatible with the original ST Squasher.
* 
*
* Main Entry d0=0 for squash or d0<>0 for unsquash
* (Check routines below for entry parameters)!
*

Squasher:
	tst.l	d0
	bne	UnSquash
********************************************************************
*
* Squash code from STOS!
*
*
********************************************************************
*Entry
*	D7 Search length $80 to $1024 (works in non scan only)	
*	D5 -1 for enforced non scan
*	D3 Address
*	D1 Length
*	D0 0 Squash 
*
*Exit
*	D3 Length positive
*	   or 
*	   Error negative:-
*		             -1 Squashed>=Normal

Squash:

* Change the addresses
	lea	_Test1(pc),a1
	move.l	a0,2(a1)
	lea	_Test2(pc),a1
	move.l	a0,4(a1)
	lea	_Colour(pc),a1
	lsl.w	#1,d6
	add.l	#$DFF180,d6
	move.l	d6,2(a1)
* Load processor masks
	movem.l	a0-a6/d0-d7,-(sp)
	move.l	$4.w,a6
	sub.l	a1,a1
	jsr	FindTask(a6)
	movem.l	(sp)+,a0-a6/d0-d7
* Real squasher
	lea	use_scan(pc),a0
	clr.l	(a0)
	tst.l	d5
	beq.b	squash_entry
pre_scan_mem:
	movem.l	d0-d7,-(sp)

	move.l	d3,a0
	move.l	d3,a1
	add.l	d1,a1

	move.l	d1,d5

	move.l	#$10000*4,d0
	bsr	allocate_mem
	lea	use_scan(pc),a6
	move.l	d0,(a6)	
	beq.b	exit_pre_scan_mem
	move.l	d0,a4

	move.l	d5,d0
	lsl.l	#1,d0
	move.l	d0,4(a6)
	bsr	allocate_mem
	move.l	d0,(a6)	
	beq.b	exit_mem_clean_up


	move.l	#$1024,d7
	move.l	d0,a5
scan_loop:
	move.b	(a1),d0
	moveq.l	#0,d1
	move.b	-(a1),d1
	lsl.l	#8,d1
	or.b	d0,d1
	lsl.l	#2,d1
	move.l	(a4,d1.l),d2
	beq.b	no_word_ahead
	sub.l	a1,d2
	cmp.l	d7,d2
	bhi.b	no_word_ahead
	move.l	a1,d4
	sub.l	a0,d4
	lsl.l	#1,d4
	move.w	d2,(a5,d4.l)
no_word_ahead:
	move.l	a1,(a4,d1.l)
	cmp.l	a0,a1
	bgt.b	scan_loop	
	
exit_mem_clean_up:
	move.l	a4,d1
	move.l	#$10000*4,d0
	bsr	deallocate_mem

exit_pre_scan_mem:
	movem.l	(sp)+,d0-d7

squash_entry:
	MOVE.L	D3,D0
	ADD.L	D0,D1
	lea	scan_ahead_count2(pc),a0
	move.l	d7,(a0)
	LEA	start(PC),A0
	MOVE.L	D0,(A0)
	MOVE.L	D0,4(A0)
	MOVE.L	D1,8(A0)
	BRA	do_squash


allocate_mem:
	movem.l	d2-d7/a0-a6,-(sp)
	move.l	#%10000000000000001,d1
	move.l	4,a6
	jsr	-198(a6)
	movem.l	(sp)+,d2-d7/a0-a6
	rts

deallocate_mem:
	movem.l	d0-d7/a0-a6,-(sp)
	move.l	d1,a1
	tst.l	d1
	beq.b	not_alloc
	move.l	4,a6
	jsr	-210(a6)
not_alloc:
	movem.l	(sp)+,d0-d7/a0-a6
	rts

use_scan:
	dc.l	0	
use_scan_size:
	dc.l	0	
offset_for_msg:
	dc.l	0
msg_length_code_index:
	dc.w	0
code_table:
o0	dc.w	$0100
o2	dc.w	$0200
o4	dc.w	$0400
o6	dc.w	$1000

o8	dc.w	8
oa	dc.w	9
oc	dc.w	$A
oe	dc.w	$C

o10	dc.w	0
o12	dc.w	0
o14	dc.w	0
o16	dc.w	8

o18	dc.w	2
o1a	dc.w	3
o1c	dc.w	3
o1e	dc.w	3

o20	dc.w	1
o22	dc.w	4
o24	dc.w	5
o26	dc.w	6

final_reg_load:
o28	dc.w	0
o2a	dc.w	0
o2c	dc.w	0
o2e	dc.w	0
add_current_byte_count_tally:
	dc.w	0
add_current_byte_large_count_tally:
	dc.w	0
	dc.w	0
	DC.B	0,0,0,0
	DC.B	$4D,$B8,$FF,$FF
	DC.B	0,0,0,0
	DC.B	0,0,0,0
start	DC.l	0
start2	DC.l	0
finish	DC.l	0
	DC.B	0,7,0,0
	DC.B	0,0,0,0
	DC.B	0,0,0,0
	DC.B	0,0
scan_ahead_count:
	DC.l	$1024
	DC.B	1,0
end_address:
	dc.l	0
scan_ahead_count2:
	DC.l	0

do_squash:
	MOVEA.L	start(PC),A0
	MOVEA.L	finish(PC),A1
	MOVEA.L	start2(PC),A2
	MOVEQ	#1,D2
	CLR.W	D1
	CLR.L	D7
main_sq_loop:
	BSR	main_sq_rtn
	TST.B	D0
	BEQ.S	exit_main_sq_loop
	ADDQ.W	#1,D1
	CMPI.W	#$108,D1
	BNE.S	exit_main_sq_loop
	BSR	add_current_byte_count
exit_main_sq_loop:
	CMPA.L	A0,A1
	BGT.S	main_sq_loop
	BSR	add_current_byte_count
	BSR	insert_next_long

	move.l	use_scan_size(pc),d0
	move.l	use_scan(pc),d1
	bsr	deallocate_mem
	add.l	#32,a2
	cmp.l	a2,a1
	bhi.b	ok_squash
	moveq.l	#-1,d3
	rts
ok_squash:
	sub.l	#32,a2
	MOVE.L	D7,(A2)+
	sub.l	start(PC),a1
	MOVE.L	A1,(A2)+
	MOVE.L	A2,d3
	sub.l	start(pc),d3
	RTS

; Routine de test CONTROL-C
_Test2	bclr	#BitControl,$800000
	bne	squash_abort
_Colour	move.w	a0,$DFF180
	bra.s	EndIt	

main_sq_rtn:
_Test1	tst.b	$800000
	bmi.s	_Test2
EndIt	MOVEA.L	A0,A3
	ADDA.L	scan_ahead_count(PC),A3
	CMPA.L	A1,A3
	BLE.S	not_over_end
	MOVEA.L	A1,A3
not_over_end:
	move.l	a0,a4
	add.l	scan_ahead_count2(PC),a4
	CMPA.L	A1,A4
	BLE.S	not_over_end2
	MOVEA.L	A1,A4
not_over_end2:
	lea	last_match(pc),a5
	move.l	a0,(a5)
	lea	end_address(pc),a5
	move.l	a4,(a5)
	MOVEQ	#1,D5
	MOVEA.L	A0,A5
	addq.l	#1,a5
main_loop:

	move.l	use_scan(pc),d4
	beq.b	no_scan
	move.l	d4,a4
	move.l	last_match(pc),d4
	sub.l	start(pc),d4
	lsl.l	#1,d4
	moveq.l	#0,d3
	move.w	(a4,d4.l),d3
	beq	leave_sq_main_rtn
	add.l	last_match(pc),d3
	move.l	d3,a5
	bra.b	move_ahead
last_match:
	dc.l	0
no_scan:
	MOVE.B	(A0),D3
	MOVE.B	1(A0),D4
	move.l	end_address(pc),a4
L22431C	CMP.B	(A5)+,D3
	BEQ.S	L22432C
L224324	CMPA.L	A5,A4
	BGT.S	L22431C
	BRA	leave_sq_main_rtn
L22432C
	cmp.b	(a5),d4
	bne.b	L224324
	SUBQ.W	#1,A5
move_ahead:
	lea	last_match(pc),a4
	move.l	a5,(a4)
	MOVEA.L	A0,A4
	move.b	(a0),d3
	move.b	1(a0),d4
L224330	cmp.b	(a4)+,(a5)+
	BNE.S	L22433A
	cmp.b	(a5),d3
	bne.b	no_match
	cmp.b	1(a5),d4
	bne.b	no_match
	move.l	a0,-(sp)
	lea	last_match(pc),a0
	move.l	a5,(a0)
	move.l	(sp)+,a0
no_match:
	CMPA.L	A5,A3
	BGT.S	L224330
L22433A	MOVE.L	A4,D3
	SUB.L	A0,D3
	SUBQ.L	#1,D3
	CMP.L	D3,D5
	BGE.S	too_far
	MOVE.L	A5,D4
	SUB.L	A0,D4
	SUB.L	D3,D4
	SUBQ.W	#1,D4
	CMP.L	#4,D3
	BLE.S	less_than_5_bytes_long
	MOVEQ	#6,D6
	CMP.L	#$101,D3
	BLT.S	less_than_257_bytes_long
	MOVE.W	#$100,D3
less_than_257_bytes_long:
	BRA.S	L22436A
less_than_5_bytes_long:
	MOVE.W	D3,D6
	SUBQ.W	#2,D6
	LSL.W	#1,D6
L22436A	LEA	code_table(PC),A6
	CMP.W	0(A6,D6.W),D4
	BGE.S	too_far
	MOVE.L	D3,D5
	MOVE.L	A0,-(A7)
	LEA	offset_for_msg(PC),A0
	MOVE.L	D4,(A0)
	LEA	msg_length_code_index(PC),A0
	MOVE.B	D6,(A0)
	MOVEA.L	(A7)+,A0
too_far:
	CMPA.L	A5,A3
	BGT	main_loop
leave_sq_main_rtn:
	CMP.L	#1,D5
	BEQ.S	byte_only
	BSR	add_current_byte_count
	MOVE.B	msg_length_code_index(PC),D6
	MOVE.L	offset_for_msg(PC),D3
	MOVE.W	8(A6,D6.W),D0
	BSR	add_d0_bits_from_d3
	MOVE.W	$10(A6,D6.W),D0
	BEQ.S	L2243B4
	MOVE.L	D5,D3
	SUBQ.W	#1,D3
	BSR	add_d0_bits_from_d3
L2243B4	MOVE.W	$18(A6,D6.W),D0
	MOVE.W	$20(A6,D6.W),D3
	BSR	add_d0_bits_from_d3
	ADDI.W	#1,$28(A6,D6.W)
	ADDA.L	D5,A0
	CLR.B	D0
	RTS

byte_only:
	MOVE.B	(A0)+,D3
	MOVEQ	#8,D0
	BSR	add_d0_bits_from_d3
	MOVEQ	#1,D0
	RTS

add_current_byte_count:
	TST.W	D1
	BEQ.S	add_current_byte_count_end
	MOVE.W	D1,D3
	CLR.W	D1
	CMP.W	#9,D3
	BGE.S	add_current_byte_large_count
	MOVE.L	A0,-(A7)
	LEA	add_current_byte_count_tally(PC),A0
	ADDQ.W	#1,(A0)
	MOVEA.L	(A7)+,A0
	SUBQ.W	#1,D3
	MOVEQ	#5,D0
	BRA	add_d0_bits_from_d3
add_current_byte_count_end:
	RTS

add_current_byte_large_count:
	MOVE.L	A0,-(A7)
	LEA	add_current_byte_large_count_tally(PC),A0
	ADDQ.W	#1,(A0)
	MOVEA.L	(A7)+,A0
	SUBI.W	#9,D3
	ORI.W	#$700,D3
	MOVEQ	#$B,D0
	BRA	add_d0_bits_from_d3

add_d0_bits_from_d3:
	SUBQ.W	#1,D0
add_bits_loop:
	LSR.L	#1,D3
	ROXL.L	#1,D2
	BCS.S	insert_next_long2
	DBF	D0,add_bits_loop
	RTS
insert_next_long:
	CLR.W	D0
insert_next_long2:
	cmp.l	a2,a1
	bls.b	inefficient_compression
	MOVE.L	D2,(A2)+
	EOR.L	D2,D7
	MOVEQ	#1,D2
	DBF	D0,add_bits_loop
	RTS

inefficient_compression:
	move.l	a1,a2
	moveq.l	#-1,d0
	rts
squash_abort:
	move.l	use_scan_size(pc),d0
	move.l	use_scan(pc),d1
	bsr	deallocate_mem
	moveq	#-2,d3
	addq.l	#4,sp
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
L22446E	LSR.L	#1,D0
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
	BLT.S	L22446E
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

L20
L21
L22

***********************************************************
* 		Welcome message
C_Title	dc.b	31,"Compiler extension V "
	Version
	dc.b	0,"$VER: "
	Version
	dc.b	0
	Even

***********************************************************
C_End	dc.w	0


