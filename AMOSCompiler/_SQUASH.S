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
	nop
	nop
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
	lea	use_scan(pc),a0
	clr.l	(a0)
	not.l	d5
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

main_sq_rtn:
	move.w	a0,$DFF180
	MOVEA.L	A0,A3
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
