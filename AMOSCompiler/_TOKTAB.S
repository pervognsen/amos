
***********************************************************
*	TABLE DES TOKENS
***********************************************************
	even
DebTk:	
* Operateurs
	dc.w CXor-Tk,Synt-Tk
	dc.b " xor"," "+$80,"O00",-1
	dc.w COr-Tk,Synt-Tk
	dc.b " or"," "+$80,"O00",-1
	dc.w CAnd-Tk,Synt-Tk
	dc.b " and"," "+$80,"O00",-1
	dc.w CDif-Tk,Synt-Tk
	dc.b "<",">"+$80,"O20",-1
	dc.w CDif-Tk,Synt-Tk
	dc.b ">","<"+$80,"O20",-1
	dc.w CInfEg-Tk,Synt-Tk
	dc.b "<","="+$80,"O20",-1
	dc.w CInfEg-Tk,Synt-Tk
	dc.b "=","<"+$80,"O20",-1
	dc.w CSupEg-Tk,Synt-Tk
	dc.b ">","="+$80,"O20",-1
	dc.w CSupEg-Tk,Synt-Tk
	dc.b "=",">"+$80,"O20",-1
TkEg:	dc.w CEg-Tk,Synt-Tk
	dc.b "="+$80,"O20",-1
	dc.w CInf-Tk,Synt-Tk
	dc.b "<"+$80,"O20",-1
	dc.w CSup-Tk,Synt-Tk
	dc.b ">"+$80,"O20",-1
	dc.w CPlus-Tk,Synt-Tk
	dc.b "+"+$80,"O22",-1
TkM:	dc.w CMoins-Tk,OpeM-Tk
	dc.b "-"+$80,"O22",-1
	dc.w CMod-Tk,Synt-Tk
	dc.b " mod"," "+$80,"O00",-1
	dc.w CMult-Tk,Synt-Tk
	dc.b "*"+$80,"O00",-1
	dc.w CDiv-Tk,Synt-Tk
	dc.b "/"+$80,"O00",-1
TkPow:	dc.w CPuis-Tk,Synt-Tk
	dc.b "^"+$80,"O00",-1

********
Tk:	dc.w ChrEnd-Tk,FNull-Tk
	dc.b $80,-1
********
* Variables
TkVar:	dc.w IVar-Tk,FVar-Tk
	dc.b $80,-1
TkLab:	dc.w CLabel-Tk,Synt-Tk
	dc.b $80,-1
TkPro:	dc.w CDoPro-Tk,Synt-Tk
	dc.b $80,-1
TkLGo:	dc.w CLGoto-Tk,Synt-Tk
	dc.b $80,-1

* Constantes
TkBin:	dc.w Synt-Tk,FEnt-Tk
	dc.b $80,"C0",-1
TkCh1:	dc.w Synt-Tk,FChaine-Tk
	dc.b $80,"C2",-1
TkCh2:	dc.w Synt-Tk,FChaine-Tk
	dc.b $80,"C2",-1
TkHex:	dc.w Synt-Tk,FEnt-Tk
	dc.b $80,"C0",-1
TkEnt:	dc.w Synt-Tk,FEnt-Tk
	dc.b $80,"C0",-1
TkFl:	dc.w Synt-Tk,FFloat-Tk
	dc.b $80,"C1",-1
* Token d'extension
TkExt:	dc.w IExtension-Tk,FExtension-Tk
	dc.b $80,-1

* Deux points, ...
TkDP:	dc.w CIDP-Tk,FNull-Tk
	dc.b ":"," "+$80,-1
TkVir:	dc.w Synt-Tk,FNull-Tk
	dc.b ","+$80,"O",-1
TkPVir:	dc.w Synt-Tk,Synt-Tk
	dc.b ";"+$80,"O",-1
TkDieze:dc.w Synt-Tk,Synt-Tk
	dc.b "#"+$80,"O",-1
	
* Parentheses
TkPar1:	dc.w Synt-Tk,Evalue-Tk
	dc.b "("+$80,"O",-1
TkPar2:	dc.w Synt-Tk,FNull-Tk
	dc.b ")"+$80,"O",-1
TkBra1:	dc.w Synt-Tk,Synt-Tk
	dc.b "["+$80,"O",-1
TkBra2:	dc.w Synt-Tk,Synt-Tk
	dc.b "]"+$80,"O",-1

* Instructions normales
TkTo:	dc.w Synt-Tk,FNull-Tk
	dc.b "to"," "+$80,-1
TkNot:	dc.w Synt-Tk,CNot-Tk
	dc.b "not"," "+$80,-1
TkSwap	dc.w CSwap-Tk,Synt-Tk
	dc.b "swap"," "+$80,-1
TkDFn	dc.w CDefFn-Tk,Synt-Tk
	dc.b "def fn"," "+$80,-1
TkFn	dc.w Synt-Tk,CFn-Tk
	dc.b "fn"," "+$80,-1
	dc.w CINop-Tk,Synt-Tk
	dc.b "follow of","f"+$80,"I",-1
TkFol	dc.w Cfollow-Tk,Synt-Tk
	dc.b "follo","w"+$80,"I",-1
	dc.w 0,L_ResNext
	dc.b "resume nex","t"+$80,"I",-1
* Tokens AVANT les autres!
	dc.w 0,L_FInky
	dc.b "inkey","$"+$80,"2",-1
	dc.w 0,L_FRpt
	dc.b "repeat","$"+$80,"22,0",-1
	dc.w 0,L_FZone
	dc.b "zone","$"+$80,"22,0",-1
	dc.w 0,L_FSur
	dc.b "border","$"+$80,"22,0",-1
	dc.w 0,L_DBuf
	dc.b "double buffe","r"+$80,"I",-1
	dc.w 0,L_FnSt
	dc.b "star","t"+$80,"00",-1
	dc.w 0,L_FnLn
	dc.b "lengt","h"+$80,"00",-1
	dc.w 0,L_Dok
	dc.b "dok","e"+$80,"I0,0",-1
	dc.w 0,L_OMnDel
	dc.b "on menu de","l"+$80,"I",-1
	dc.w 0,L_OMnOn
	dc.b "on menu o","n"+$80,"I",-1
	dc.w 0,L_OMnOff
	dc.b "on menu of","f"+$80,"I",-1
	dc.w 0,L_EvOn
	dc.b "every o","n"+$80,"I",-1
	dc.w 0,L_EvOff
	dc.b "every of","f"+$80,"I",-1
	dc.w 0,L_FLBase
	dc.b "logbas","e"+$80,"00",-1
	dc.w 0,L_Log0
	dc.b "!logi","c"+$80,"0",-2
	dc.w 0,L_Log1
	dc.b $80,"00",-1
	dc.w 0,L_Asc
	dc.b "as","c"+$80,"02",-1
TkAs:	dc.w Synt-Tk,Synt-Tk
	dc.b "a","s"+$80,"I",-1
TkCall	dc.w CCall-Tk,Synt-Tk
	dc.b "cal","l"+$80,"I",-1
	dc.w 0,L_FExe
	dc.b "execal","l"+$80,"00",-1
	dc.w 0,L_FGfx
	dc.b "gfxcal","l"+$80,"00",-1
	dc.w 0,L_FDos
	dc.b "doscal","l"+$80,"00",-1
	dc.w 0,L_FIntu
	dc.b "intcal","l"+$80,"00",-1
	dc.w 0,L_Frz
	dc.b "freez","e"+$80,"I",-1

* Boucles / Branchements
TkBcl1:	
TkFor:	dc.w CFor-Tk,Synt-Tk
	dc.b "for"," "+$80,-1
TkNxt:	dc.w CNext-Tk,Synt-Tk
	dc.b "next"," "+$80,-1
TkRpt:	dc.w CRepeat-Tk,Synt-Tk
	dc.b "repeat"," "+$80,-1
TkUnt:	dc.w CUntil-Tk,Synt-Tk
	dc.b "until"," "+$80,-1
TkWhl:	dc.w CWhile-Tk,Synt-Tk
	dc.b "while"," "+$80,-1
TkWnd:	dc.w CWend-Tk,Synt-Tk
	dc.b "wend"," "+$80,-1
TkDo:	dc.w CRepeat-Tk,Synt-Tk
	dc.b "do"," "+$80,-1
TkLoo:	dc.w CLoop-Tk,Synt-Tk
	dc.b "loop"," "+$80,-1
TkExIf:	dc.w CExitIf-Tk,Synt-Tk
	dc.b "exit if"," "+$80,-1
TkExit:	dc.w CExit-Tk,Synt-Tk
	dc.b "exit"," "+$80,-1
TkGto:	dc.w CGoto-Tk,Synt-Tk
	dc.b "goto"," "+$80,-1
TkGsb:	dc.w CGosub-Tk,Synt-Tk
	dc.b "gosub"," "+$80,-1
TkIf:	dc.w CIf-Tk,Synt-Tk
	dc.b "if"," "+$80,-1
TkThen:	dc.w CINop-Tk,FNull-Tk
	dc.b "then"," "+$80,-1
TkElse:	dc.w CElse-Tk,FNull-Tk
	dc.b "else"," "+$80,-1
TkEndI:	dc.w CINop-Tk,Synt-Tk
	dc.b "end if"," "+$80,-1
TkOnE:	dc.w ConErr-Tk,Synt-Tk
	dc.b "on error"," "+$80,-1
TkOnB:	dc.w Synt-Tk,Synt-Tk
	dc.b "on break proc"," "+$80,-1
TkOMen:	dc.w Conmen-Tk,Synt-Tk
	dc.b "on men","u"+$80,"I0",-1
TkOn:	dc.w COn-Tk,Synt-Tk
	dc.b "on"," "+$80,-1
TkRLab:	dc.w CResL-Tk,Synt-Tk
	dc.b "resume label"," "+$80,-1
TkRes:	dc.w CRes-Tk,Synt-Tk
	dc.b "resume"," "+$80,-1
TkPpp:	dc.w CPopP-Tk,Synt-Tk
	dc.b "pop pro","c"+$80,-1
TkEve:	dc.w CEvery-Tk,Synt-Tk
	dc.b "ever","y"+$80,"I",-1	
TkBcl2:
TkStp:	dc.w Synt-Tk,Synt-Tk
	dc.b "step"," "+$80,-1
	dc.w CReturn-Tk,Synt-Tk
	dc.b "retur","n"+$80,"I",-1
	dc.w CPop-Tk,Synt-Tk
	dc.b "po","p"+$80,"I",-1
TkProc:	dc.w CProc-Tk,Synt-Tk
	dc.b "procedure"," "+$80,-1
TkPrc:	dc.w CPrc-Tk,Synt-Tk
	dc.b "proc"," "+$80,-1
TkEndP:	dc.w CEProc-Tk,Synt-Tk
	dc.b "end pro","c"+$80,-1
TkSha:	dc.w CShar-Tk,Synt-Tk
	dc.b "shared"," "+$80,-1
TkGlo:	dc.w CGlob-Tk,Synt-Tk
	dc.b "global"," "+$80,-1
	dc.w 0,L_End
	dc.b "en","d"+$80,"I",-1
	dc.w 0,L_Stop
	dc.b "sto","p"+$80,"I",-1
	dc.w Synt-Tk,CparamF-Tk
	dc.b "param","#"+$80,"1",-1
	dc.w Synt-Tk,CparamC-Tk
	dc.b "param","$"+$80,"2",-1
	dc.w Synt-Tk,CparamE-Tk
	dc.b "para","m"+$80,"0",-1
	dc.w 0,L_IErrn
	dc.b "erro","r"+$80,"I0",-1
	dc.w 0,L_FErrn
	dc.b "err","n"+$80,"0",-1
TkData:	dc.w CData-Tk,Synt-Tk
	dc.b "data"," "+$80,-1
TkRead:	dc.w CRead-Tk,Synt-Tk
	dc.b "read"," "+$80,-1
TkRest:	dc.w CRest-Tk,Synt-Tk
	dc.b "restore"," "+$80,-1
	dc.w 0,L_BreakOff
	dc.b "break of","f"+$80,"I",-1
	dc.w 0,L_BreakOn
	dc.b "break o","n"+$80,"I",-1
TkInc:	dc.w CInc-Tk,Synt-Tk
	dc.b "in","c"+$80,"I",-1
TkDec:	dc.w CDec-Tk,Synt-Tk
	dc.b "de","c"+$80,"I",-1
TkAd2:	dc.w CAdd2-Tk,Synt-Tk
	dc.b "!ad","d"+$80,"I",-2
TkAd4:	dc.w CAdd4-Tk,Synt-Tk
	dc.b $80,"I",-1
* Print/Input
TkHPr:	dc.w CHPrnt-Tk,Synt-Tk
	dc.b "print ","#"+$80,-1
TkPr:	dc.w CPrnt-Tk,Synt-Tk
	dc.b "prin","t"+$80,"I",-1
TkLPr:	dc.w CLPrnt-Tk,Synt-Tk
	dc.b "lprin","t"+$80,"I",-1
	dc.w 0,L_Finput1
	dc.b "!input","$"+$80,"20",-2
	dc.w 0,L_Finput2
	dc.b $80,"20,0",-1
TkUsing:dc.w Synt-Tk,Synt-Tk
	dc.b "usin","g"+$80,"I",-1
TkDInp	dc.w CInputH-Tk,Synt-Tk
	dc.b "input ","#"+$80,-1
TkDLInp	dc.w CLInputH-Tk,Synt-Tk
	dc.b "line input ","#"+$80,-1
TkInp:	dc.w CInput-Tk,Synt-Tk
	dc.b "inpu","t"+$80,"I",-1
TkLInp:	dc.w CLInput-Tk,Synt-Tk
	dc.b "line inpu","t"+$80,"I",-1
	dc.w Synt-Tk,Synt-Tk
	dc.b "!ru","n"+$80,"I",-2
	dc.w 0,L_Run
	dc.b $80,"I2",-1
TkSBu:	dc.w CSBuf-Tk,Synt-Tk
	dc.b "set buffe","r"+$80,"I",-1
* Gestion des chaines
TkMid1:	dc.w CIMid3-Tk,CFMid3-Tk
	dc.b "!mid","$"+$80,"22,0,0",-2
	dc.w CIMid2-Tk,CFMid2-Tk
	dc.b $80,"22,0",-1
	dc.w CILeft-Tk,CFLeft-Tk
	dc.b "left","$"+$80,"22,0",-1
	dc.w CIRight-Tk,CFRight-Tk
	dc.b "right","$"+$80,"22,0",-1
TkMid2:	dc.w 0,L_Flip
	dc.b "flip","$"+$80,"22",-1
	dc.w 0,L_Chr
	dc.b "chr","$"+$80,"20",-1
	dc.w 0,L_Space
	dc.b "space","$"+$80,"20",-1
	dc.w 0,L_String
	dc.b "string","$"+$80,"22,0",-1
	dc.w 0,L_FLwr
	dc.b "upper","$"+$80,"22",-1
	dc.w 0,L_FUpp
	dc.b "lower","$"+$80,"22",-1
	dc.w Synt-Tk,CStr-Tk
	dc.b "str","$"+$80,"20",-1
	dc.w Synt-Tk,CVal-Tk
	dc.b "va","l"+$80,"02",-1
	dc.w 0,L_Bin1
	dc.b "!bin","$"+$80,"20",-2
	dc.w 0,L_Bin2
	dc.b $80,"20,0",-1
	dc.w 0,L_Hex1
	dc.b "!hex","$"+$80,"20",-2
	dc.w 0,L_Hex2
	dc.b $80,"20,0",-1
	dc.w 0,L_Len
	dc.b "le","n"+$80,"02",-1
	dc.w 0,L_Instr2
	dc.b "!inst","r"+$80,"02,2",-2
	dc.w 0,L_Instr3
	dc.b $80,"02,2,0",-1
	dc.w 0,L_FTab
	dc.b "tab","$"+$80,"2",-1
	dc.w 0,L_Free
	dc.b "fre","e"+$80,"0",-1
TkVptr	dc.w Synt-Tk,Cvarptr-Tk
	dc.b "varpt","r"+$80,"0",-1
	dc.w 0,L_WnMx2
	dc.b "remember ","x"+$80,"I",-1
	dc.w 0,L_WnMy2
	dc.b "remember ","y"+$80,"I",-1

TkDim:	dc.w CDim-Tk,Synt-Tk
	dc.b "di","m"+$80,"I",-1
TkRem1:	dc.w CRem-Tk,Synt-Tk
	dc.b "re","m"+$80,-1
TkRem2:	dc.w CRem-Tk,Synt-Tk
	dc.b "'"+$80,-1
TkSort	dc.w CSort-Tk,Synt-Tk
	dc.b "sor","t"+$80,"I",-1
TkFnd1	dc.w Synt-Tk,CMatch-Tk
	dc.b "matc","h"+$80,"03,3",-1
	dc.w 0,L_Edit
	dc.b "edi","t"+$80,"I",-1
	dc.w 0,L_Direct
	dc.b "direc","t"+$80,"I",-1
* Fonctions
	dc.w 0,L_Rnd
	dc.b "rn","d"+$80,"00",-1
	dc.w 0,L_Random
	dc.b "randomiz","e"+$80,"I0",-1
	dc.w Synt-Tk,CSgn-Tk
	dc.b "sg","n"+$80,"00",-1
	dc.w Synt-Tk,CAbs-Tk
	dc.b "ab","s"+$80,"00",-1
	dc.w Synt-Tk,CInt-Tk
	dc.b "in","t"+$80,"00",-1
	dc.w 0,L_Rad
	dc.b "radia","n"+$80,"I",-1
	dc.w 0,L_Deg
	dc.b "degre","e"+$80,"I",-1
	dc.w 0,L_Pi
	dc.b "pi","#"+$80,"1",-1
	dc.w 0,L_Fix
	dc.b "fi","x"+$80,"I0",-1
TkMin:	dc.w Synt-Tk,CMin-Tk
	dc.b "mi","n"+$80,"00,0",-1
TkMax:	dc.w Synt-Tk,CMax-Tk
	dc.b "ma","x"+$80,"00,0",-1
TkMat1:	dc.w Synt-Tk,CSin-Tk
	dc.b "si","n"+$80,"00",-1
	dc.w Synt-Tk,CCos-Tk
	dc.b "co","s"+$80,"00",-1
	dc.w Synt-Tk,CTan-Tk
	dc.b "ta","n"+$80,"00",-1
	dc.w Synt-Tk,CAsin-Tk
	dc.b "asi","n"+$80,"00",-1
	dc.w Synt-Tk,CACos-Tk
	dc.b "aco","s"+$80,"00",-1
	dc.w Synt-Tk,CATan-Tk
	dc.b "ata","n"+$80,"00",-1
	dc.w Synt-Tk,CHSin-Tk
	dc.b "hsi","n"+$80,"00",-1
	dc.w Synt-Tk,CHCos-Tk
	dc.b "hco","s"+$80,"00",-1
	dc.w Synt-Tk,CHTan-Tk
	dc.b "hta","n"+$80,"00",-1
	dc.w Synt-Tk,CSqr-Tk
	dc.b "sq","r"+$80,"00",-1
	dc.w Synt-Tk,CLog-Tk
	dc.b "lo","g"+$80,"00",-1
	dc.w Synt-Tk,CLn-Tk
	dc.b "l","n"+$80,"00",-1
	dc.w Synt-Tk,CExp-Tk
	dc.b "ex","p"+$80,"00",-1
TkMat2	
* MENUS!!!
	dc.w 0,L_MnToBank
	dc.b "menu to ban","k"+$80,"I0",-1
	dc.w 0,L_BkToMenu
	dc.b "bank to men","u"+$80,"I0",-1
	dc.w 0,L_MnOn
	dc.b "menu o","n"+$80,"I",-1
	dc.w 0,L_MnOff
	dc.b "menu of","f"+$80,"I",-1
	dc.w 0,L_MnCalc
	dc.b "menu cal","c"+$80,"I",-1
	dc.w 0,L_MnMOn
	dc.b "menu mouse o","n"+$80,"I",-1
	dc.w 0,L_MnMOf
	dc.b "menu mouse of","f"+$80,"I",-1
	dc.w 0,L_MnBs
	dc.b "menu bas","e"+$80,"I0,0",-1
TkDMn:
TkSMn:	dc.w CSMenu-Tk,Synt-Tk
	dc.b "set men","u"+$80,"I0t0,0",-1
TkXMn	dc.w Synt-Tk,CXMenu-Tk
	dc.b "x men","u"+$80,"00",-1
TkYMn	dc.w Synt-Tk,CYMenu-Tk
	dc.b "y men","u"+$80,"00",-1
TkMnK	dc.w Cmnkey-Tk,Synt-Tk
	dc.b "menu ke","y"+$80,"I0t0,0",-1
TkIMn1:	dc.w CMnBar-Tk,Synt-Tk
	dc.b "menu ba","r"+$80,"I0",-1
	dc.w CmnLine-Tk,Synt-Tk
	dc.b "menu lin","e"+$80,"I0",-1
	dc.w CmnTline-Tk,Synt-Tk
	dc.b "menu tlin","e"+$80,"I0",-1
	dc.w CMnmove-Tk,Synt-Tk
	dc.b "menu movabl","e"+$80,"I0",-1
	dc.w CMnsta-Tk,Synt-Tk
	dc.b "menu stati","c"+$80,"I0",-1
	dc.w Cmnimove-Tk,Synt-Tk
	dc.b "menu item movabl","e"+$80,"I0",-1
	dc.w Cmnista-Tk,Synt-Tk
	dc.b "menu item stati","c"+$80,"I0",-1
	dc.w CMnact-Tk,Synt-Tk
	dc.b "menu activ","e"+$80,"I0",-1
	dc.w CMninact-Tk,Synt-Tk
	dc.b "menu inactiv","e"+$80,"I0",-1
	dc.w CMnsep-Tk,Synt-Tk
	dc.b "menu separat","e"+$80,"I0",-1
	dc.w Cmnlink-Tk,Synt-Tk
	dc.b "menu lin","k"+$80,"I0",-1
TkMnCl	dc.w Cmncall-Tk,Synt-Tk
	dc.b "menu calle","d"+$80,"I0",-1
	dc.w Cmnonce-Tk,Synt-Tk
	dc.b "menu onc","e"+$80,"I0",-1
TkIMn2:	
TkMnD:	dc.w CMnDel-Tk,Synt-Tk
	dc.b "menu de","l"+$80,"I",-1
TkMenu:	dc.w CMenu-Tk,Synt-Tk
	dc.b "menu","$"+$80,"V",-1
TkFMn:	dc.w 0,L_FMen0
	dc.b "!choic","e"+$80,"0",-2
	dc.w 0,L_FMen1
	dc.b $80,"00",-1

* Screen instructions
	dc.w 0,L_Scop2
	dc.b "!screen cop","y"+$80,"I0t0",-2
	dc.w Synt-Tk,Synt-Tk
	dc.b $80,"I0t00",-2
	dc.w 0,L_Scop8
	dc.b $80,"I0,0,0,0,0t0,0,0",-2
	dc.w 0,L_Scop9
	dc.b $80,"I0,0,0,0,0t0,0,0,0",-1
	dc.w 0,L_ScClon
	dc.b "screen clon",$80+"e","I0",-1
	dc.w 0,L_ScOpen
	dc.b "screen ope","n"+$80,"I0,0,0,0,0",-1
	dc.w 0,L_ScClo
	dc.b "screen clos",$80+"e","I0",-1
TkScD:	dc.w 0,L_ScDisp
	dc.b "screen displa","y"+$80,"I0,0,0,0,0",-1
TkScO:	dc.w 0,L_ScOffs
	dc.b "screen offse","t"+$80,"I0,0,0",-1
TkScS:	dc.w Synt-Tk,Synt-Tk
	dc.b "screen siz","e"+$80,-1
	dc.w 0,L_FSCol
	dc.b "screen colou","r"+$80,"0",-1
	dc.w 0,L_ScFr0
	dc.b "!screen to fron","t"+$80,"I",-2
	dc.w 0,L_ScFr1
	dc.b $80,"I0",-1
	dc.w 0,L_ScBk0
	dc.b "!screen to bac","k"+$80,"I",-2
	dc.w 0,L_ScBk1
	dc.b $80,"I0",-1
	dc.w 0,L_ScHi0
	dc.b "!screen hid","e"+$80,"I",-2
	dc.w 0,L_ScHi1
	dc.b $80,"I0",-1
	dc.w 0,L_ScSh0
	dc.b "!screen sho","w"+$80,"I",-2
	dc.w 0,L_ScSh1
	dc.b $80,"I0",-1
	dc.w 0,L_Scswp0
	dc.b "!screen swa","p"+$80,"I",-2
	dc.w 0,L_Scswp1
	dc.b $80,"I0",-1
	dc.w 0,L_ScSave1
	dc.b "!save if","f"+$80,"I2",-2
	dc.w 0,L_ScSave2
	dc.b $80,"I2,0",-1
	dc.w 0,L_View
	dc.b "vie","w"+$80,"I",-1
	dc.w 0,L_AvOff
	dc.b "auto view of","f"+$80,"I",-1
	dc.w 0,L_AvOn
	dc.b "auto view o","n"+$80,"I",-1
	dc.w 0,L_FSBase
	dc.b "screen bas","e"+$80,"0",-1
	dc.w 0,L_FScW0
	dc.b "!screen widt","h"+$80,"0",-2
	dc.w 0,L_FScW1
	dc.b $80,"00",-1
	dc.w 0,L_FScH0
	dc.b "!screen heigh","t"+$80,"0",-2
	dc.w 0,L_FScH1
	dc.b $80,"00",-1
	dc.w 0,L_GPal1
	dc.b "!get palett","e"+$80,"I0",-2
	dc.w 0,L_GPal2
	dc.b $80,"I0,0",-1
	dc.w 0,L_Cls0
	dc.b "!cl","s"+$80,"I",-2
	dc.w 0,L_Cls1
	dc.b $80,"I0",-2
	dc.w 0,L_Cls5
	dc.b $80,"I0,0,0t0,0",-1
	dc.w 0,L_DefSc
	dc.b "def scrol","l"+$80,"I0,0,0t0,0,0,0",-1
* Conversions de coordonnees
	dc.w 0,L_XHard1
	dc.b "!x har","d"+$80,"00",-2
	dc.w 0,L_XHard2
	dc.b $80,"00,0",-1
	dc.w 0,L_YHard1
	dc.b "!y har","d"+$80,"00",-2
	dc.w 0,L_YHard2
	dc.b $80,"00,0",-1
	dc.w 0,L_XScr1
	dc.b "!x scree","n"+$80,"00",-2
	dc.w 0,L_XScr2
	dc.b $80,"00,0",-1
	dc.w 0,L_YScr1
	dc.b "!y scree","n"+$80,"00",-2
	dc.w 0,L_YScr2
	dc.b $80,"00,0",-1
	dc.w 0,L_XTxt1
	dc.b "x tex","t"+$80,"00",-1
	dc.w 0,L_YTxt1
	dc.b "y tex","t"+$80,"00",-1

TkScr:	dc.w 0,L_Scr
	dc.b "!scree","n"+$80,"I0",-3
	dc.w 0,L_FScr
	dc.b $80,"0",-1
	dc.w 0,L_FHires
	dc.b "hire","s"+$80,"0",-1
	dc.w 0,L_FLowRes
	dc.b "lowre","s"+$80,"0",-1
	dc.w 0,L_Dual
	dc.b "dual playfiel","d"+$80,"I0,0",-1
	dc.w 0,L_DuPri
	dc.b "dual priorit","y"+$80,"I0,0",-1
	dc.w 0,L_WtVbl
	dc.b "wait vb","l"+$80,"I",-1
TkDPal:	dc.w CDPal-Tk,Synt-Tk
	dc.b "default palett","e"+$80,"I",-1
	dc.w 0,L_Default
	dc.b "defaul","t"+$80,"I",-1
TkPal:	dc.w CPal-Tk,Synt-Tk
	dc.b "palett","e"+$80,"I",-1
	dc.w 0,L_ColourB
	dc.b "colour bac","k"+$80,"I0",-1
	dc.w 0,L_Colour
	dc.b "!colou","r"+$80,"I0,0",-3
	dc.w 0,L_FColour
	dc.b $80,"00",-1
	dc.w 0,L_FlOff
	dc.b "flash of","f"+$80,"I",-1
	dc.w 0,L_Flash
	dc.b "flas","h"+$80,"I0,2",-1
	dc.w 0,L_ShOff
	dc.b "shift of","f"+$80,"I",-1
	dc.w 0,L_ShUp
	dc.b "shift u","p"+$80,"I0,0,0,0",-1
	dc.w 0,L_ShDown
	dc.b "shift dow","n"+$80,"I0,0,0,0",-1
	dc.w 0,L_SRain6
	dc.b "!set rainbo","w"+$80,"I0,0,0,2,2,2",-2
	dc.w 0,L_SRain7
	dc.b $80,"I0,0,0,2,2,2,0",-1
	dc.w 0,L_RainD0
	dc.b "!rainbow de","l"+$80,"I",-2
	dc.w 0,L_RainD1
	dc.b $80,"I0",-1
TkRn:	dc.w 0,L_Rain
	dc.b "rainbo","w"+$80,"I0,0,0,0",-1
	dc.w 0,L_IRain
	dc.b "rai","n"+$80,"V00,0",-1
TkFade:	dc.w CFade-Tk,Synt-Tk
	dc.b "fad","e"+$80,"I",-1
	dc.w 0,L_FPBase
	dc.b "phybas","e"+$80,"00",-1
	dc.w 0,L_Phy0
	dc.b "!physi","c"+$80,"0",-2
	dc.w 0,L_Phy1
	dc.b $80,"00",-1
	dc.w 0,L_AutoB
	dc.b "autobac","k"+$80,"I0",-1
* Instructions graphiques
	dc.w 0,L_Plot2
	dc.b "!plo","t"+$80,"I0,0",-2
	dc.w 0,L_Plot3
	dc.b $80,"I0,0,0",-1
	dc.w 0,L_FPoint
	dc.b "poin","t"+$80,"00,0",-1
	dc.w 0,L_Draw2
	dc.b "draw t","o"+$80,"I0,0",-1
	dc.w 0,L_Draw4
	dc.b "dra","w"+$80,"I0,0t0,0",-1
	dc.w 0,L_Ell
	dc.b "ellips","e"+$80,"I0,0,0,0",-1
	dc.w 0,L_Cir
	dc.b "circl","e"+$80,"I0,0,0",-1
TkPoL:	dc.w CPoLine-Tk,Synt-Tk
	dc.b "polylin","e"+$80,"I",-1
TkPoG:	dc.w CPoGone-Tk,Synt-Tk
	dc.b "polygo","n"+$80,"I",-1
	dc.w 0,L_Bar
	dc.b "ba","r"+$80,"I0,0t0,0",-1
	dc.w 0,L_Box
	dc.b "bo","x"+$80,"I0,0t0,0",-1
	dc.w 0,L_Paint2
	dc.b "!pain","t"+$80,"I0,0",-2
	dc.w 0,L_Paint3
	dc.b $80,"I0,0,0",-1
	dc.w 0,L_GrLoc
	dc.b "gr locat","e"+$80,"I0,0",-1
	dc.w 0,L_FTLen
	dc.b "text lengt","h"+$80,"02",-1
	dc.w 0,L_FStyle
	dc.b "text style","s"+$80,"0",-1
	dc.w 0,L_FTBase
	dc.b "text bas","e"+$80,"0",-1
	dc.w 0,L_Text
	dc.b "tex","t"+$80,"I0,0,2",-1
	dc.w 0,L_SText
	dc.b "set tex","t"+$80,"I0",-1
	dc.w 0,L_SPaint
	dc.b "set pain","t"+$80,"I0",-1
	dc.w 0,L_GFont
	dc.b "get font","s"+$80,"I",-1
	dc.w 0,L_GDFont
	dc.b "get disc font","s"+$80,"I",-1
	dc.w 0,L_GRFont
	dc.b "get rom font","s"+$80,"I",-1
	dc.w 0,L_SFont
	dc.b "set fon","t"+$80,"I0",-1
	dc.w 0,L_FFont
	dc.b "font","$"+$80,"20",-1
	dc.w 0,L_HSli
	dc.b "hslide","r"+$80,"I0,0t0,0,0,0,0",-1
	dc.w 0,L_VSli
	dc.b "vslide","r"+$80,"I0,0t0,0,0,0,0",-1
	dc.w 0,L_SSli
	dc.b "set slide","r"+$80,"I0,0,0,0,0,0,0,0",-1
	dc.w 0,L_SPat
	dc.b "set patter","n"+$80,"I0",-1
	dc.w 0,L_StLine
	dc.b "set lin","e"+$80,"I0",-1
	dc.w 0,L_Ink1
	dc.b "!in","k"+$80,"I0",-2
	dc.w 0,L_Ink2
	dc.b $80,"I0,0",-2
	dc.w 0,L_Ink3
	dc.b $80,"I0,0,0",-1
	dc.w 0,L_GrWrt
	dc.b "gr writin","g"+$80,"I0",-1
	dc.w 0,L_Clip0
	dc.b "!cli","p"+$80,"I",-2
	dc.w 0,L_Clip4
	dc.b $80,"I0,0t0,0",-1
	dc.w 0,L_SRas0
	dc.b "!set tempra","s"+$80,"I",-2
	dc.w 0,L_SRas1
	dc.b $80,"I0",-2
	dc.w 0,L_SRas2
	dc.b $80,"I0,0",-1
	dc.w 0,L_App3
	dc.b "!appea","r"+$80,"I0t0,0",-2
	dc.w 0,L_App4
	dc.b $80,"I0t0,0,0",-1
	dc.w 0,L_Zoom
	dc.b "zoo","m"+$80,"I0,0,0,0,0t0,0,0,0,0",-1
	
* Blocs
	dc.w 0,L_GtCBl
	dc.b "get cbloc","k"+$80,"I0,0,0,0,0",-1
	dc.w 0,L_PtCBl1
	dc.b "!put cbloc","k"+$80,"I0",-2
	dc.w 0,L_PtCBl3
	dc.b $80,"I0,0,0",-1
	dc.w 0,L_DlCBl0
	dc.b "!del cbloc","k"+$80,"I",-2
	dc.w 0,L_DlCBl1
	dc.b $80,"I0",-1
	dc.w 0,L_GtBl5
	dc.b "!get bloc","k"+$80,"I0,0,0,0,0",-2
	dc.w 0,L_GtBl6
	dc.b $80,"I0,0,0,0,0,0",-1
	dc.w 0,L_PtBl1
	dc.b "!put bloc","k"+$80,"I0",-2
	dc.w 0,L_PtBl3
	dc.b $80,"I0,0,0",-2
	dc.w 0,L_PtBl4
	dc.b $80,"I0,0,0,0",-2
	dc.w 0,L_PtBl5
	dc.b $80,"I0,0,0,0,0",-1
	dc.w 0,L_DlBl0
	dc.b "!del bloc","k"+$80,"I",-2
	dc.w 0,L_DlBl1
	dc.b $80,"I0",-1

* Instructions clavier
	dc.w 0,L_KSpeed
	dc.b "key spee","d"+$80,"I0,0",-1
	dc.w 0,L_FKSt
	dc.b "key stat","e"+$80,"00",-1
	dc.w 0,L_FShft
	dc.b "key shif","t"+$80,"0",-1
	dc.w 0,L_FJoy
	dc.b "jo","y"+$80,"00",-1
	dc.w 0,L_FJUp
	dc.b "ju","p"+$80,"00",-1
	dc.w 0,L_FJDown
	dc.b "jdow","n"+$80,"00",-1
	dc.w 0,L_FJLeft
	dc.b "jlef","t"+$80,"00",-1
	dc.w 0,L_FJRight
	dc.b "jrigh","t"+$80,"00",-1
	dc.w 0,L_FFire
	dc.b "fir","e"+$80,"00",-1
	dc.w Synt-Tk,CTrue-Tk
	dc.b "tru","e"+$80,"0",-1
	dc.w Synt-Tk,CFalse-Tk
	dc.b "fals","e"+$80,"0",-1
	dc.w 0,L_PutKy
	dc.b "put ke","y"+$80,"I2",-1
	dc.w 0,L_FScan
	dc.b "scancod","e"+$80,"0",-1
	dc.w 0,L_FScSh
	dc.b "scanshif","t"+$80,"0",-1
	dc.w 0,L_ClKy
	dc.b "clear ke","y"+$80,"I",-1
	dc.w 0,L_WtKy
	dc.b "wait ke","y"+$80,"I",-1
	dc.w 0,L_Wait
	dc.b "wai","t"+$80,"I0",-1
	dc.w 0,L_StKy
	dc.b "key","$"+$80,"V20",-1
	dc.w 0,L_FKy1
	dc.b "!scan","$"+$80,"20",-2
	dc.w 0,L_FKy2
	dc.b $80,"20,0",-1
	dc.w 0,L_Timer
	dc.b "time","r"+$80,"V0",-1

* Instruction fenetres
	dc.w 0,L_WnOp5
	dc.b "!wind ope","n"+$80,"I0,0,0,0,0",-2
	dc.w 0,L_WnOp6
	dc.b $80,"I0,0,0,0,0,0",-2
	dc.w 0,L_WnOp7
	dc.b $80,"I0,0,0,0,0,0,0",-1
	dc.w 0,L_WnClo
	dc.b "wind clos","e"+$80,"I",-1
	dc.w 0,L_WnSave
	dc.b "wind sav","e"+$80,"I",-1
	dc.w 0,L_WnMove
	dc.b "wind mov","e"+$80,"I0,0",-1
	dc.w 0,L_WnSize
	dc.b "wind siz","e"+$80,"I0,0",-1
	dc.w 0,L_Wndow
	dc.b "windo","w"+$80,"I0",-1
	dc.w 0,L_FWnDon
	dc.b "windo","n"+$80,"0",-1

	dc.w 0,L_WnLoc
	dc.b "locat","e"+$80,"I0,0",-1
	dc.w 0,L_WnClw
	dc.b "cl","w"+$80,"I",-1
	dc.w 0,L_WnHome
	dc.b "hom","e"+$80,"I",-1
	dc.w 0,L_WnCPe
	dc.b "curs pe","n"+$80,"I0",-1
	dc.w 0,L_FPen
	dc.b "pen","$"+$80,"20",-1
	dc.w 0,L_FPap
	dc.b "paper","$"+$80,"20",-1
	dc.w 0,L_FAt
	dc.b "a","t"+$80,"20,0",-1
	dc.w 0,L_WnPen
	dc.b "pe","n"+$80,"I0",-1
	dc.w 0,L_WnPap
	dc.b "pape","r"+$80,"I0",-1
	dc.w 0,L_WnCen
	dc.b "centr","e"+$80,"I2",-1
	dc.w 0,L_WnBor
	dc.b "borde","r"+$80,"I0,0,0",-1
	dc.w 0,L_WnWrt1
	dc.b "!writin","g"+$80,"I0",-2
	dc.w 0,L_WnWrt2
	dc.b $80,"I0,0",-1
	dc.w 0,L_WnTTop
	dc.b "title to","p"+$80,"I2",-1
	dc.w 0,L_WnTBot
	dc.b "title botto","m"+$80,"I2",-1
	dc.w 0,L_WnCOf
	dc.b "curs of","f"+$80,"I",-1
	dc.w 0,L_WnCOn
	dc.b "curs o","n"+$80,"I",-1
	dc.w 0,L_WnIOf
	dc.b "inverse of","f"+$80,"I",-1
	dc.w 0,L_WnIOn
	dc.b "inverse o","n"+$80,"I",-1
	dc.w 0,L_WnUOf
	dc.b "under of","f"+$80,"I",-1
	dc.w 0,L_WnUOn
	dc.b "under o","n"+$80,"I",-1
	dc.w 0,L_WnSOf
	dc.b "shade of","f"+$80,"I",-1
	dc.w 0,L_WnSOn
	dc.b "shade o","n"+$80,"I",-1
	dc.w 0,L_WnScOf
	dc.b "scroll of","f"+$80,"I",-1
	dc.w 0,L_WnScOn
	dc.b "scroll o","n"+$80,"I",-1
	dc.w 0,L_DoSc
	dc.b "scrol","l"+$80,"I0",-1
	dc.w 0,L_FCup
	dc.b "cup","$"+$80,"2",-1
	dc.w 0,L_FCDn
	dc.b "cdown","$"+$80,"2",-1
	dc.w 0,L_FClf
	dc.b "cleft","$"+$80,"2",-1
	dc.w 0,L_FCrt
	dc.b "cright","$"+$80,"2",-1
	dc.w 0,L_WnCup
	dc.b "cu","p"+$80,"I",-1
	dc.w 0,L_WnCdn
	dc.b "cdow","n"+$80,"I",-1
	dc.w 0,L_WnClf
	dc.b "clef","t"+$80,"I",-1
	dc.w 0,L_WnCrt
	dc.b "crigh","t"+$80,"I",-1
	dc.w 0,L_WnMx1
	dc.b "memorize ","x"+$80,"I",-1
	dc.w 0,L_WnMy1
	dc.b "memorize ","y"+$80,"I",-1
	dc.w 0,L_FCMv
	dc.b "cmove","$"+$80,"20,0",-1
	dc.w 0,L_WnCMv
	dc.b "cmov","e"+$80,"I0,0",-1
	dc.w 0,L_WnCll
	dc.b "!clin","e"+$80,"I",-2
	dc.w 0,L_WnClN
	dc.b $80,"I0",-1
	dc.w 0,L_WnHSc
	dc.b "hscrol","l"+$80,"I0",-1
	dc.w 0,L_WnVSc
	dc.b "vscrol","l"+$80,"I0",-1
	dc.w 0,L_WnSta
	dc.b "set ta","b"+$80,"I0",-1
	dc.w 0,L_WnSCu
	dc.b "set cur","s"+$80,"I0,0,0,0,0,0,0,0",-1
	dc.w 0,L_FXCu
	dc.b "x cur","s"+$80,"0",-1
	dc.w 0,L_FYCu
	dc.b "y cur","s"+$80,"0",-1
	dc.w 0,L_FnXGr
	dc.b "x graphi","c"+$80,"00",-1
	dc.w 0,L_FnYGr
	dc.b "y graphi","c"+$80,"00",-1
	dc.w 0,L_XGr
	dc.b "xg","r"+$80,"0",-1
	dc.w 0,L_YGr
	dc.b "yg","r"+$80,"0",-1
	
* Zones
	dc.w 0,L_RZo0
	dc.b "!reserve zon","e"+$80,"I",-2
	dc.w 0,L_RZo1
	dc.b $80,"I0",-1
	dc.w 0,L_RsZo0
	dc.b "!reset zon","e"+$80,"I",-2
	dc.w 0,L_RsZo1
	dc.b $80,"I0",-1
	dc.w 0,L_SZo
	dc.b "set zon","e"+$80,"I0,0,0t0,0",-1
	dc.w 0,L_FZo2
	dc.b "!zon","e"+$80,"00,0",-2
	dc.w 0,L_FZo3
	dc.b $80,"00,0,0",-1
	dc.w 0,L_FHZo2
	dc.b "!hzon","e"+$80,"00,0",-2
	dc.w 0,L_FHZo3
	dc.b $80,"00,0,0",-1
	dc.w 0,L_FScin2
	dc.b "!sci","n"+$80,"00,0",-2
	dc.w 0,L_FScin3
	dc.b $80,"00,0,0",-1
	dc.w 0,L_FMouSc
	dc.b "mouse scree","n"+$80,"0",-1
	dc.w 0,L_FMouZo
	dc.b "mouse zon","e"+$80,"0",-1


* Instructions disques
	dc.w 0,L_SInp
	dc.b "set inpu","t"+$80,"I0,0",-1
	dc.w 0,L_ClosWb
	dc.b "close workbenc","h"+$80,"I",-1
	dc.w 0,L_ClosEd
	dc.b "close edito","r"+$80,"I",-1
	dc.w 0,L_DirF
	dc.b "dir first","$"+$80,"22",-1
	dc.w 0,L_DirN
	dc.b "dir next","$"+$80,"2",-1
	dc.w 0,L_Exist
	dc.b "exis","t"+$80,"02",-1
	dc.w 0,L_IDir
	dc.b "dir","$"+$80,"V2",-1
	dc.w 0,L_LDirw0
	dc.b "!ldir/","w"+$80,"I",-2
	dc.w 0,L_LDirw1
	dc.b $80,"I2",-1
	dc.w 0,L_Dirw0
	dc.b "!dir/","w"+$80,"I",-2
	dc.w 0,L_Dirw1
	dc.b $80,"I2",-1
	dc.w 0,L_LDir0
	dc.b "!ldi","r"+$80,"I",-2
	dc.w 0,L_LDir1
	dc.b $80,"I2",-1
	dc.w 0,L_Dir0
	dc.b "!di","r"+$80,"I",-2
	dc.w 0,L_Dir1
	dc.b $80,"I2",-1
	dc.w 0,L_SDir1
	dc.b "set di","r"+$80,"I0",-2
	dc.w 0,L_SDir2
	dc.b "set di","r"+$80,"I0,2",-2
	dc.w 0,L_LdIff1
	dc.b "!load if","f"+$80,"I2",-2
	dc.w 0,L_LdIff2
	dc.b $80,"I2,0",-1
	dc.w 0,L_IffMsk
	dc.b "mask if","f"+$80,"I0",-1
	dc.w 0,L_FPic
	dc.b "pictur","e"+$80,"0",-1
	dc.w 0,L_BLoad
	dc.b "bloa","d"+$80,"I2,0",-1
	dc.w 0,L_BSave
	dc.b "bsav","e"+$80,"I2,0t0",-1
	dc.w 0,L_PLoad
	dc.b "ploa","d"+$80,"I2,0",-1
	dc.w 0,L_Save1
	dc.b "!sav","e"+$80,"I2",-2
	dc.w 0,L_Save2
	dc.b $80,"I2,0",-1
	dc.w 0,L_Load1
	dc.b "!loa","d"+$80,"I2",-2
	dc.w 0,L_Load2
	dc.b $80,"I2,0",-1

	dc.w 0,L_DFree
	dc.b "dfre","e"+$80,"0",-1
	dc.w 0,L_MkDir
	dc.b "mkdi","r"+$80,"I2",-1
	dc.w 0,L_Lof
	dc.b "lo","f"+$80,"00",-1
	dc.w 0,L_Eof
	dc.b "eo","f"+$80,"00",-1
	dc.w 0,L_IPof
	dc.b "po","f"+$80,"V00",-1
	dc.w 0,L_FPort
	dc.b "por","t"+$80,"00",-1
	dc.w 0,L_OpRan
	dc.b "open rando","m"+$80,"I0,2",-1
	dc.w 0,L_OpIn2
	dc.b "open i","n"+$80,"I0,2",-1
	dc.w 0,L_OpOut2
	dc.b "open ou","t"+$80,"I0,2",-1
	dc.w 0,L_OpPor
	dc.b "open por","t"+$80,"I0,2",-1
	dc.w 0,L_Appn
	dc.b "appen","d"+$80,"I0,2",-1
	dc.w 0,L_CloAll
	dc.b "!clos","e"+$80,"I",-2
	dc.w 0,L_Clo1
	dc.b $80,"I0",-1
	dc.w 0,L_Par
	dc.b "paren","t"+$80,"I",-1
	dc.w 0,L_Ren
	dc.b "renam","e"+$80,"I2t2",-1
	dc.w 0,L_Kill
	dc.b "kil","l"+$80,"I2",-1
	dc.w 0,L_Drive
	dc.b "driv","e"+$80,"02",-1
TkFld	dc.w CField-Tk,Synt-Tk
	dc.b "fiel","d"+$80,"I",-1
	dc.w 0,L_Fsel1
	dc.b "!fsel","$"+$80,"22",-2
	dc.w 0,L_Fsel2
	dc.b $80,"22,2",-2
	dc.w 0,L_Fsel3
	dc.b $80,"22,2,2",-2
	dc.w 0,L_Fsel4
	dc.b $80,"22,2,2,2",-2

* Instructions SPRITES
	dc.w 0,L_SsBuf
	dc.b "set sprite buffe","r"+$80,"I0",-1
	dc.w 0,L_SpOff0
	dc.b "!sprite of","f"+$80,"I",-2
	dc.w 0,L_SpOff1
	dc.b $80,"I0",-1
	dc.w 0,L_SpPri
	dc.b "sprite priorit","y"+$80,"I0",-1
	dc.w 0,L_SUpOf
	dc.b "sprite update of","f"+$80,"I",-1
	dc.w 0,L_SUpOn
	dc.b "sprite update o","n"+$80,"I",-1
	dc.w 0,L_SUpDa
	dc.b "sprite updat","e"+$80,"I",-1
	dc.w 0,L_SBCol1
	dc.b "!spritebob co","l"+$80,"00",-2
	dc.w 0,L_SBCol3
	dc.b $80,"00,0t0",-1
	dc.w 0,L_SpCol1
	dc.b "!sprite co","l"+$80,"00",-2
	dc.w 0,L_SpCol3
	dc.b $80,"00,0t0",-1
	dc.w 0,L_HCol
	dc.b "set hardco","l"+$80,"I0,0",-1
	dc.w 0,L_FHCol
	dc.b "hardco","l"+$80,"00",-1
	dc.w 0,L_SBase
	dc.b "sprite bas","e"+$80,"00",-1
	dc.w 0,L_IBase
	dc.b "icon bas","e"+$80,"00",-1
TkSpr:	dc.w 0,L_SpSp
	dc.b "sprit","e"+$80,"I0,0,0,0",-1

	dc.w 0,L_BbOff0
	dc.b "!bob of","f"+$80,"I",-2
	dc.w 0,L_BbOff1
	dc.b $80,"I0",-1
	dc.w 0,L_BUpOf
	dc.b "bob update of","f"+$80,"I",-1
	dc.w 0,L_BUpOn
	dc.b "bob update o","n"+$80,"I",-1
	dc.w 0,L_BUpDa
	dc.b "bob updat","e"+$80,"I",-1
	dc.w 0,L_BbClr
	dc.b "bob clea","r"+$80,"I",-1
	dc.w 0,L_BbDrw
	dc.b "bob dra","w"+$80,"I",-1
	dc.w 0,L_BSCol1
	dc.b "!bobsprite co","l"+$80,"00",-2
	dc.w 0,L_BSCol3
	dc.b $80,"00,0t0",-1
	dc.w 0,L_BbCol1
	dc.b "!bob co","l"+$80,"00",-2
	dc.w 0,L_BbCol3
	dc.b $80,"00,0t0",-1
	dc.w 0,L_Coll
	dc.b "co","l"+$80,"00",-1
	dc.w 0,L_LBob0
	dc.b "!limit bo","b"+$80,"I",-2
	dc.w 0,L_LBob4
	dc.b $80,"I0,0t0,0",-2
	dc.w 0,L_LBob5
	dc.b $80,"I0,0,0t0,0",-1
	dc.w 0,L_StBb
	dc.b "set bo","b"+$80,"I0,0,0,0",-1
TkBob:	dc.w 0,L_BbSt4
	dc.b "bo","b"+$80,"I0,0,0,0",-1
	dc.w 0,L_GSpPal0
	dc.b "!get sprite palett","e"+$80,"I",-2
	dc.w 0,L_GSpPal1
	dc.b $80,"I0",-1
	dc.w 0,L_GetSp5
	dc.b "!get sprit","e"+$80,"I0,0,0t0,0",-2
	dc.w 0,L_GetSp6
	dc.b $80,"I0,0,0,0t0,0",-1
	dc.w 0,L_GetSp5
	dc.b "!get bo","b"+$80,"I0,0,0t0,0",-2
	dc.w 0,L_GetSp6
	dc.b $80,"I0,0,0,0t0,0",-1
	dc.w 0,L_DSp1
	dc.b "!del sprit","e"+$80,"I0",-2
	dc.w 0,L_DSp2
	dc.b $80,"I0t0",-1
	dc.w 0,L_DSp1
	dc.b "!del bo","b"+$80,"I0",-2
	dc.w 0,L_DSp2
	dc.b $80,"I0t0",-1	
	dc.w 0,L_DIc1
	dc.b "!del ico","n"+$80,"I0",-2
	dc.w 0,L_DIc2
	dc.b $80,"I0t0",-1
	dc.w 0,L_ISpr
	dc.b "ins sprit","e"+$80,"I0",-1
	dc.w 0,L_ISpr
	dc.b "ins bo","b"+$80,"I0",-1
	dc.w 0,L_ISpr
	dc.b "ins ico","n"+$80,"I0",-1
	dc.w 0,L_GIPal0
	dc.b "!get icon palett","e"+$80,"I",-2
	dc.w 0,L_GIPal1
	dc.b $80,"I0",-1
	dc.w 0,L_GetIc5
	dc.b "!get ico","n"+$80,"I0,0,0t0,0",-2
	dc.w 0,L_GetIc6
	dc.b $80,"I0,0,0,0t0,0",-1
	dc.w 0,L_PBob
	dc.b "put bo","b"+$80,"I0",-1
	dc.w 0,L_PatBb
	dc.b "paste bo","b"+$80,"I0,0,0",-1
	dc.w 0,L_PatIc
	dc.b "paste ico","n"+$80,"I0,0,0",-1
	dc.w 0,L_MkMask0
	dc.b "!make mas","k"+$80,"I",-2
	dc.w 0,L_MkMask1
	dc.b $80,"I0",-1
	dc.w 0,L_NoMask0
	dc.b "!no mas","k"+$80,"I",-2
	dc.w 0,L_NoMask1
	dc.b $80,"I0",-1
	dc.w 0,L_MkIMs0
	dc.b "!make icon mas","k"+$80,"I",-2
	dc.w 0,L_MkIMs1
	dc.b $80,"I0",-1
	dc.w 0,L_NoIMs0
	dc.b "!no icon mas","k"+$80,"I",-2
	dc.w 0,L_NoIMs0
	dc.b $80,"I0",-1
	dc.w 0,L_HotSp2
	dc.b "!hot spo","t"+$80,"I0,0",-2
	dc.w 0,L_HotSp3
	dc.b $80,"I0,0,0",-1
	dc.w 0,L_PrOn
	dc.b "priority o","n"+$80,"I",-1
	dc.w 0,L_PrOf
	dc.b "priority of","f"+$80,"I",-1

	dc.w 0,L_HidO
	dc.b "hide o","n"+$80,"I",-1
	dc.w 0,L_Hide
	dc.b "hid","e"+$80,"I",-1
	dc.w 0,L_ShoO
	dc.b "show o","n"+$80,"I",-1
	dc.w 0,L_Show
	dc.b "sho","w"+$80,"I",-1
	dc.w 0,L_ChMou
	dc.b "change mous","e"+$80,"I0",-1
	dc.w 0,L_XMou
	dc.b "x mous","e"+$80,"V0",-1
	dc.w 0,L_YMou
	dc.b "y mous","e"+$80,"V0",-1
	dc.w 0,L_MouK
	dc.b "mouse ke","y"+$80,"0",-1
	dc.w 0,L_MouCl
	dc.b "mouse clic","k"+$80,"0",-1
	dc.w 0,L_LimM0
	dc.b "!limit mous","e"+$80,"I",-2
	dc.w 0,L_LimM1
	dc.b $80,"I0",-2
	dc.w 0,L_LimM
	dc.b $80,"I0,0t0,0",-1
	
* AMAL!
	dc.w 0,L_UFrz
	dc.b "unfreez","e"+$80,"I",-1
	dc.w 0,L_MvX
	dc.b "!move ","x"+$80,"I0,3",-2
	dc.w 0,L_MvX3
	dc.b $80,"I0,2t0",-1
	dc.w 0,L_MvY
	dc.b "!move ","y"+$80,"I0,3",-2
	dc.w 0,L_MvY3
	dc.b $80,"I0,2t0",-1
	dc.w 0,L_MvOf0
	dc.b "!move of","f"+$80,"I",-2
	dc.w 0,L_MvOf1
	dc.b $80,"I0",-1
	dc.w 0,L_MvOn0
	dc.b "!move o","n"+$80,"I",-2
	dc.w 0,L_MvOn1
	dc.b $80,"I0",-1
	dc.w 0,L_MvFz0
	dc.b "!move freez","e"+$80,"I",-2
	dc.w 0,L_MvFz1
	dc.b $80,"I0",-1
	dc.w 0,L_AnOf0
	dc.b "!anim of","f"+$80,"I",-2
	dc.w 0,L_AnOf1
	dc.b $80,"I0",-1
	dc.w 0,L_AnOn0
	dc.b "!anim o","n"+$80,"I",-2
	dc.w 0,L_AnOn1
	dc.b $80,"I0",-1
	dc.w 0,L_AnFz0
	dc.b "!anim freez","e"+$80,"I",-2
	dc.w 0,L_AnFz1
	dc.b $80,"I0",-1
	dc.w 0,L_Anm
	dc.b "ani","m"+$80,"I0,3",-2
	dc.w 0,L_Anm3
	dc.b $80,"I0,2t0",-1
	dc.w 0,L_Movon
	dc.b "movo","n"+$80,"00",-1
	dc.w 0,L_ChanA
	dc.b "chana","n"+$80,"00",-1
	dc.w 0,L_ChanM
	dc.b "chanm","v"+$80,"00",-1
TkChan:	dc.w CChannel-Tk,0
	dc.b "channe","l"+$80,"I",-1
	dc.w 0,L_IAmR1
	dc.b "!amre","g"+$80,"V00",-2
	dc.w 0,L_IAmR2
	dc.b $80,"V00,0",-1
	dc.w 0,L_AmOn0
	dc.b "!amal o","n"+$80,"I",-2
	dc.w 0,L_AmOn1
	dc.b $80,"I0",-1
	dc.w 0,L_AmOf0
	dc.b "!amal of","f"+$80,"I",-2
	dc.w 0,L_AmOf1
	dc.b $80,"I0",-1
	dc.w 0,L_AmFz0
	dc.b "!amal freez","e"+$80,"I",-2
	dc.w 0,L_AmFz1
	dc.b $80,"I0",-1
	dc.w 0,L_AmE
	dc.b "amaler","r"+$80,"0",-1
	dc.w 0,L_Am
	dc.b "!ama","l"+$80,"I0,3",-2
	dc.w 0,L_Am3
	dc.b $80,"I0,2t0",-1
	dc.w 0,L_AmP2
	dc.b "!ampla","y"+$80,"I0,0",-2
	dc.w 0,L_AmP4
	dc.b $80,"I0,0,0t0",-1
	dc.w 0,L_SOn
	dc.b "synchro o","n"+$80,"I",-1
	dc.w 0,L_SOff
	dc.b "synchro of","f"+$80,"I",-1
	dc.w 0,L_Sync
	dc.b "synchr","o"+$80,"I",-1
	dc.w 0,L_UpOff
	dc.b "update of","f"+$80,"I",-1
	dc.w 0,L_UpOn
	dc.b "update o","n"+$80,"I",-1
	dc.w 0,L_UpEv
	dc.b "update ever","y"+$80,"I0",-1
	dc.w 0,L_UpDa
	dc.b "updat","e"+$80,"I",-1
	dc.w 0,L_XBob
	dc.b "x bo","b"+$80,"00",-1
	dc.w 0,L_YBob
	dc.b "y bo","b"+$80,"00",-1
	dc.w 0,L_XSp
	dc.b "x sprit","e"+$80,"00",-1
	dc.w 0,L_YSp
	dc.b "y sprit","e"+$80,"00",-1
	
* Memoire / Banques
	dc.w 0,L_RsWrk
	dc.b "reserve as wor","k"+$80,"I0,0",-1
	dc.w 0,L_RsCWrk
	dc.b "reserve as chip wor","k"+$80,"I0,0",-1
	dc.w 0,L_RsDat
	dc.b "reserve as dat","a"+$80,"I0,0",-1
	dc.w 0,L_RsCDat
	dc.b "reserve as chip dat","a"+$80,"I0,0",-1
	dc.w 0,L_Erase
	dc.b "eras","e"+$80,"I0",-1
	dc.w 0,L_LBank
	dc.b "list ban","k"+$80,"I",-1
	dc.w 0,L_FChip
	dc.b "chip fre","e"+$80,"0",-1
	dc.w 0,L_FFast
	dc.b "fast fre","e"+$80,"0",-1
	dc.w 0,L_Fill
	dc.b "fil","l"+$80,"I0t0,0",-1
	dc.w 0,L_Copy
	dc.b "cop","y"+$80,"I0,0t0",-1
	dc.w 0,L_Hunt
	dc.b "hun","t"+$80,"00t0,2",-1
	dc.w 0,L_Pok
	dc.b "pok","e"+$80,"I0,0",-1
	dc.w 0,L_Lok
	dc.b "lok","e"+$80,"I0,0",-1
	dc.w 0,L_Pik
	dc.b "pee","k"+$80,"00",-1
	dc.w 0,L_Dik
	dc.b "dee","k"+$80,"00",-1
	dc.w 0,L_Lik
	dc.b "lee","k"+$80,"00",-1
	dc.w CBset-Tk,Synt-Tk
	dc.b "bse","t"+$80,"I0,0",-1
	dc.w CBclr-Tk,Synt-Tk
	dc.b "bcl","r"+$80,"I0,0",-1
	dc.w CBchg-Tk,Synt-Tk
	dc.b "bch","g"+$80,"I0,0",-1
	dc.w Synt-Tk,CBtst-Tk
	dc.b "bts","t"+$80,"00,0",-1
 	dc.w CRorb-Tk,Synt-Tk
	dc.b "ror.","b"+$80,"I0,0",-1
 	dc.w CRorw-Tk,Synt-Tk
	dc.b "ror.","w"+$80,"I0,0",-1
 	dc.w CRorl-Tk,Synt-Tk
	dc.b "ror.","l"+$80,"I0,0",-1
 	dc.w CRolb-Tk,Synt-Tk
	dc.b "rol.","b"+$80,"I0,0",-1
 	dc.w CRolw-Tk,Synt-Tk
	dc.b "rol.","w"+$80,"I0,0",-1
 	dc.w CRoll-Tk,Synt-Tk
	dc.b "rol.","l"+$80,"I0,0",-1
	dc.w 0,L_IAReg
	dc.b "are","g"+$80,"V00",-1
	dc.w 0,L_IDReg
	dc.b "dre","g"+$80,"V00",-1

* Copper
	dc.w 0,L_CopOn
	dc.b "copper o","n"+$80,"I",-1
	dc.w 0,L_CopOf
	dc.b "copper of","f"+$80,"I",-1
	dc.w 0,L_CopSwap
	dc.b "cop swa","p"+$80,"I",-1
	dc.w 0,L_CopReset
	dc.b "cop rese","t"+$80,"I",-1
	dc.w 0,L_CopW2
	dc.b "!cop wai","t"+$80,"I0,0",-2
	dc.w 0,L_CopW4
	dc.b $80,"I0,0,0,0",-1
	dc.w 0,L_CopML
	dc.b "cop move","l"+$80,"I0,0",-1
	dc.w 0,L_CopMW
	dc.b "cop mov","e"+$80,"I0,0",-1
	dc.w 0,L_CopBase
	dc.b "cop logi","c"+$80,"0",-1

* Instructions programmes/accessoires
	dc.w 0,L_AccF
	dc.b "prg first","$"+$80,"22",-1
	dc.w 0,L_DirN
	dc.b "prg next","$"+$80,"2",-1
	dc.w 0,L_Psel1
	dc.b "!psel","$"+$80,"22",-2
	dc.w 0,L_Psel2
	dc.b $80,"22,2",-2
	dc.w 0,L_Psel3
	dc.b $80,"22,2,2",-2
	dc.w 0,L_Psel4
	dc.b $80,"22,2,2,2",-2
	dc.w 0,L_PRun
	dc.b "pru","n"+$80,"I2",-1
	dc.w 0,L_BGrab0
	dc.b "bgra","b"+$80,"I0",-1

* En dernier!
	dc.w 0,L_Put
	dc.b "pu","t"+$80,"I0,0",-1
	dc.w 0,L_Get
	dc.b "ge","t"+$80,"I0,0",-1
	dc.w 0,L_System
	dc.b "syste","m"+$80,"I",-1
	dc.w 0,L_Multi
	dc.b "multi wai","t"+$80,"I",-1
	dc.w 0,L_IBb
	dc.b "i bo","b"+$80,"00",-1
	dc.w 0,L_ISp
	dc.b "i sprit","e"+$80,"00",-1
	dc.w 0,L_PrROn
	dc.b "priority reverse o","n"+$80,"I",-1
	dc.w 0,L_PrROf
	dc.b "priority reverse of","f"+$80,"I",-1
	dc.w 0,L_DevF
	dc.b "dev first","$"+$80,"22",-1
	dc.w 0,L_DirN
	dc.b "dev next","$"+$80,"2",-1
	dc.w 0,L_HRev
	dc.b "hrev bloc","k"+$80,"I0",-1
	dc.w 0,L_VRev
	dc.b "vrev bloc","k"+$80,"I0",-1
	dc.w 0,L_RevX
	dc.b "hre","v"+$80,"00",-1
	dc.w 0,L_RevY
	dc.b "vre","v"+$80,"00",-1
	dc.w 0,L_Rev
	dc.b "re","v"+$80,"00",-1
	dc.w 0,L_BSwap
	dc.b "bank swa","p"+$80,"I0,0",-1
	dc.w 0,L_AmFront
	dc.b "amos to fron","t"+$80,"I",-1
	dc.w 0,L_AmBack
	dc.b "amos to bac","k"+$80,"I",-1
	dc.w 0,L_AmHere
	dc.b "amos her","e"+$80,"0",-1
	dc.w 0,L_AmLock
	dc.b "amos loc","k"+$80,"I",-1
	dc.w 0,L_AmULock
	dc.b "amos unloc","k"+$80,"I",-1
	dc.w 0,L_DispH
	dc.b "display heigh","t"+$80,"0",-1
	dc.w 0,L_Ntsc
	dc.b "nts","c"+$80,"0",-1
	dc.w 0,L_Laced
	dc.b "lace","d"+$80,"0",-1
	dc.w 0,L_PrgState
	dc.b "prg stat","e"+$80,"0",-1
	dc.w 0,L_ICom
	dc.b "command line","$"+$80,"V2",-1
	dc.w 0,L_DInfo
	dc.b "disc info","$"+$80,"22",-1
