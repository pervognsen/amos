
***********************************************************
*	TABLE DES TOKENS
***********************************************************
	even
DebTk:	
* Operateurs
	dc.w OpXor-Tk,Synt-Tk
	dc.b " xor"," "+$80,"O00",-1
	dc.w OpOr-Tk,Synt-Tk
	dc.b " or"," "+$80,"O00",-1
	dc.w OpAnd-Tk,Synt-Tk
	dc.b " and"," "+$80,"O00",-1
	dc.w Diff-Tk,Synt-Tk
	dc.b "<",">"+$80,"O20",-1
	dc.w Diff-Tk,Synt-Tk
	dc.b ">","<"+$80,"O20",-1
	dc.w InfEg-Tk,Synt-Tk
	dc.b "<","="+$80,"O20",-1
	dc.w InfEg-Tk,Synt-Tk
	dc.b "=","<"+$80,"O20",-1
	dc.w SupEg-Tk,Synt-Tk
	dc.b ">","="+$80,"O20",-1
	dc.w SupEg-Tk,Synt-Tk
	dc.b "=",">"+$80,"O20",-1
TkEg:	dc.w Egale-Tk,Synt-Tk
	dc.b "="+$80,"O20",-1
	dc.w Inf-Tk,Synt-Tk
	dc.b "<"+$80,"O20",-1
	dc.w Sup-Tk,Synt-Tk
	dc.b ">"+$80,"O20",-1
	dc.w Plus-Tk,Synt-Tk
	dc.b "+"+$80,"O22",-1
TkM:	dc.w Moins-Tk,OpeM-Tk
	dc.b "-"+$80,"O22",-1
	dc.w Modulo-Tk,Synt-Tk
	dc.b " mod"," "+$80,"O00",-1
	dc.w Multiplie-Tk,Synt-Tk
	dc.b "*"+$80,"O00",-1
	dc.w Divise-Tk,Synt-Tk
	dc.b "/"+$80,"O00",-1
TkPow:	dc.w Puissant-Tk,Synt-Tk
	dc.b "^"+$80,"O00",-1

********
Tk:	dc.w 1,Null-Tk
	dc.b $80,-1
********
* Variables
TkVar:	dc.w InVar-Tk,FnVar-Tk
	dc.b $80,-1
TkLab:	dc.w InLab-Tk,Synt-Tk
	dc.b $80,-1
TkPro:	dc.w InPro-Tk,Synt-Tk
	dc.b $80,-1
TkLGo:	dc.w Goto2-Tk,Synt-Tk		Appel de label
	dc.b $80,-1

* Constantes
TkBin:	dc.w Synt-Tk,CstInt-Tk
	dc.b $80,"C0",-1
TkCh1:	dc.w Synt-Tk,CstCh-Tk
	dc.b $80,"C2",-1
TkCh2:	dc.w Synt-Tk,CstCh-Tk
	dc.b $80,"C2",-1
TkHex:	dc.w Synt-Tk,CstInt-Tk
	dc.b $80,"C0",-1
TkEnt:	dc.w Synt-Tk,CstInt-Tk
	dc.b $80,"C0",-1
TkFl:	dc.w Synt-Tk,CstFl-Tk
	dc.b $80,"C1",-1
* Token d'extension
TkExt:	dc.w InExt-Tk,FnExt-Tk
	dc.b $80,-1

* Deux points, ...
TkDP:	dc.w InsRet-Tk,Null-Tk
	dc.b ":"," "+$80,-1
TkVir:	dc.w Synt-Tk,Null-Tk
	dc.b ","+$80,"O",-1
TkPVir:	dc.w Synt-Tk,Synt-Tk
	dc.b ";"+$80,"O",-1
TkDieze:dc.w Synt-Tk,Synt-Tk
	dc.b "#"+$80,"O",-1
	
* Parentheses
TkPar1:	dc.w Synt-Tk,OpeP-Tk
	dc.b "("+$80,"O",-1
TkPar2:	dc.w Synt-Tk,Null-Tk
	dc.b ")"+$80,"O",-1
TkBra1:	dc.w Synt-Tk,OpeP-Tk
	dc.b "["+$80,"O",-1
TkBra2:	dc.w Synt-Tk,Synt-Tk
	dc.b "]"+$80,"O",-1

* Instructions normales
TkTo:	dc.w Synt-Tk,Null-Tk
	dc.b "to"," "+$80,-1
TkNot:	dc.w Synt-Tk,FNot-Tk
	dc.b "not"," "+$80,-1
TkSwap	dc.w ISwap-Tk,Synt-Tk
	dc.b "swap"," "+$80,-1
TkDFn	dc.w IDFn-Tk,Synt-Tk
	dc.b "def fn"," "+$80,-1
TkFn	dc.w Synt-Tk,FFn-Tk
	dc.b "fn"," "+$80,-1
	dc.w IFolOff-Tk,Synt-Tk
	dc.b "follow of","f"+$80,"I",-1
TkFol	dc.w IFollow-Tk,Synt-Tk
	dc.b "follo","w"+$80,"I",-1
	dc.w ResNext-Tk,Synt-Tk
	dc.b "resume nex","t"+$80,"I",-1
* Tokens AVANT les autres!
	dc.w Synt-Tk,FnInky-Tk
	dc.b "inkey","$"+$80,"2",-1
	dc.w Synt-Tk,FnRpt-Tk
	dc.b "repeat","$"+$80,"22,0",-1
	dc.w Synt-Tk,FnZon-Tk
	dc.b "zone","$"+$80,"22,0",-1
	dc.w Synt-Tk,FnSur-Tk
	dc.b "border","$"+$80,"22,0",-1
	dc.w ScDble-Tk,Synt-Tk
	dc.b "double buffe","r"+$80,"I",-1
	dc.w Synt-Tk,FnSt-Tk
	dc.b "star","t"+$80,"00",-1
	dc.w Synt-Tk,FnLn-Tk
	dc.b "lengt","h"+$80,"00",-1
	dc.w Dok-Tk,Synt-Tk
	dc.b "dok","e"+$80,"I0,0",-1
	dc.w OMnDl-Tk,Synt-Tk
	dc.b "on menu de","l"+$80,"I",-1
	dc.w OMnOn-Tk,Synt-Tk
	dc.b "on menu o","n"+$80,"I",-1
	dc.w OMnOf-Tk,Synt-Tk
	dc.b "on menu of","f"+$80,"I",-1
	dc.w IEvOn-Tk,Synt-Tk
	dc.b "every o","n"+$80,"I",-1
	dc.w IEvOf-Tk,Synt-Tk
	dc.b "every of","f"+$80,"I",-1
	dc.w Synt-Tk,FnLog-Tk
	dc.b "logbas","e"+$80,"00",-1
	dc.w Synt-Tk,FLog0-Tk
	dc.b "!logi","c"+$80,"0",-2
	dc.w Synt-Tk,FLog1-Tk
	dc.b $80,"00",-1
	dc.w Synt-Tk,Asc-Tk
	dc.b "as","c"+$80,"02",-1
TkAs:	dc.w Synt-Tk,Synt-Tk
	dc.b "a","s"+$80,"I",-1
TkCall	dc.w ICall-Tk,Synt-Tk
	dc.b "cal","l"+$80,"I",-1
	dc.w Synt-Tk,FExe-Tk
	dc.b "execal","l"+$80,"00",-1
	dc.w Synt-Tk,FGfx-Tk
	dc.b "gfxcal","l"+$80,"00",-1
	dc.w Synt-Tk,FDos-Tk
	dc.b "doscal","l"+$80,"00",-1
	dc.w Synt-Tk,FIntu-Tk
	dc.b "intcal","l"+$80,"00",-1
	dc.w IFrz-Tk,Synt-Tk
	dc.b "freez","e"+$80,"I",-1

* Boucles / Branchements
TkBcl1:	
TkFor:	dc.w For-Tk,Synt-Tk
	dc.b "for"," "+$80,-1
TkNxt:	dc.w Next-Tk,Synt-Tk
	dc.b "next"," "+$80,-1
TkRpt:	dc.w Repeat-Tk,Synt-Tk
	dc.b "repeat"," "+$80,-1
TkUnt:	dc.w Until-Tk,Synt-Tk
	dc.b "until"," "+$80,-1
TkWhl:	dc.w While-Tk,Synt-Tk
	dc.b "while"," "+$80,-1
TkWnd:	dc.w Wend-Tk,Synt-Tk
	dc.b "wend"," "+$80,-1
TkDo:	dc.w Do-Tk,Synt-Tk
	dc.b "do"," "+$80,-1
TkLoo:	dc.w Loop-Tk,Synt-Tk
	dc.b "loop"," "+$80,-1
TkExIf:	dc.w ExIf-Tk,Synt-Tk
	dc.b "exit if"," "+$80,-1
TkExit:	dc.w Exit-Tk,Synt-Tk
	dc.b "exit"," "+$80,-1
TkGto:	dc.w Goto-Tk,Synt-Tk
	dc.b "goto"," "+$80,-1
TkGsb:	dc.w Gosub-Tk,Synt-Tk
	dc.b "gosub"," "+$80,-1
TkIf:	dc.w If-Tk,Synt-Tk
	dc.b "if"," "+$80,-1
TkThen:	dc.w Synt-Tk,Null-Tk
	dc.b "then"," "+$80,-1
TkElse:	dc.w Else-Tk,Null-Tk
	dc.b "else"," "+$80,-1
TkEndI:	dc.w InsRet-Tk,Synt-Tk
	dc.b "end if"," "+$80,-1
TkOnE:	dc.w OnEGo-Tk,Synt-Tk
	dc.b "on error"," "+$80,-1
TkOnB:	dc.w Synt-Tk,Synt-Tk
	dc.b "on break proc"," "+$80,-1
TkOMen:	dc.w OnMen-Tk,Synt-Tk
	dc.b "on men","u"+$80,"I0",-1
TkOn:	dc.w On-Tk,Synt-Tk
	dc.b "on"," "+$80,-1
TkRLab:	dc.w ResLab-Tk,Synt-Tk
	dc.b "resume label"," "+$80,-1
TkRes:	dc.w Resume-Tk,Synt-Tk
	dc.b "resume"," "+$80,-1
TkPpp:	dc.w PopPro-Tk,Synt-Tk
	dc.b "pop pro","c"+$80,-1
TkEve:	dc.w IEve-Tk,Synt-Tk
	dc.b "ever","y"+$80,"I",-1	
TkBcl2:
TkStp:	dc.w Synt-Tk,Synt-Tk
	dc.b "step"," "+$80,-1
	dc.w Retn-Tk,Synt-Tk
	dc.b "retur","n"+$80,"I",-1
	dc.w Pop-Tk,Synt-Tk
	dc.b "po","p"+$80,"I",-1
TkProc:	dc.w Proc-Tk,Synt-Tk
	dc.b "procedure"," "+$80,-1
TkPrc:	dc.w InPrc-Tk,Synt-Tk
	dc.b "proc"," "+$80,-1
TkEndP:	dc.w EProc-Tk,Synt-Tk
	dc.b "end pro","c"+$80,-1
TkSha:	dc.w Shared-Tk,Synt-Tk
	dc.b "shared"," "+$80,-1
TkGlo:	dc.w Shared-Tk,Synt-Tk
	dc.b "global"," "+$80,-1
	dc.w ChrX-Tk,Synt-Tk
	dc.b "en","d"+$80,"I",-1
	dc.w IStop-Tk,Synt-Tk
	dc.b "sto","p"+$80,"I",-1
	dc.w Synt-Tk,ParFl-Tk
	dc.b "param","#"+$80,"1",-1
	dc.w Synt-Tk,ParCh-Tk
	dc.b "param","$"+$80,"2",-1
	dc.w Synt-Tk,ParEnt-Tk
	dc.b "para","m"+$80,"0",-1
	dc.w IErrN-Tk,Synt-Tk
	dc.b "erro","r"+$80,"I0",-1
	dc.w Synt-Tk,FErrN-Tk
	dc.b "err","n"+$80,"0",-1
TkData:	dc.w InData-Tk,Synt-Tk
	dc.b "data"," "+$80,-1
TkRead:	dc.w InRead-Tk,Synt-Tk
	dc.b "read"," "+$80,-1
TkRest:	dc.w InRest-Tk,Synt-Tk
	dc.b "restore"," "+$80,-1
	dc.w BrkOf-Tk,Synt-Tk
	dc.b "break of","f"+$80,"I",-1
	dc.w BrkOn-Tk,Synt-Tk
	dc.b "break o","n"+$80,"I",-1
TkInc:	dc.w IInc-Tk,Synt-Tk
	dc.b "in","c"+$80,"I",-1
TkDec:	dc.w IDec-Tk,Synt-Tk
	dc.b "de","c"+$80,"I",-1
TkAd2:	dc.w IAdd2-Tk,Synt-Tk
	dc.b "!ad","d"+$80,"I",-2
TkAd4:	dc.w IAdd4-Tk,Synt-Tk
	dc.b $80,"I",-1
* Print/Input
TkHPr:	dc.w HPrnt-Tk,Synt-Tk
	dc.b "print ","#"+$80,-1
TkPr:	dc.w Prnt-Tk,Synt-Tk
	dc.b "prin","t"+$80,"I",-1
TkLPr:	dc.w LPrnt-Tk,Synt-Tk
	dc.b "lprin","t"+$80,"I",-1
	dc.w Synt-Tk,FInput1-Tk
	dc.b "!input","$"+$80,"20",-2
	dc.w Synt-Tk,FInput2-Tk
	dc.b $80,"20,0",-1
TkUsing:dc.w Synt-Tk,Synt-Tk
	dc.b "usin","g"+$80,"I",-1
TkDInp	dc.w DInput-Tk,Synt-Tk
	dc.b "input ","#"+$80,-1
TkDLInp	dc.w DLInput-Tk,Synt-Tk
	dc.b "line input ","#"+$80,-1
TkInp:	dc.w IInput-Tk,Synt-Tk
	dc.b "inpu","t"+$80,"I",-1
TkLInp:	dc.w LInput-Tk,Synt-Tk
	dc.b "line inpu","t"+$80,"I",-1
	dc.w IRun0-Tk,Synt-Tk
	dc.b "!ru","n"+$80,"I",-2
	dc.w IRunN-Tk,Synt-Tk
	dc.b $80,"I2",-1
TkSBu:	dc.w ISBuf-Tk,Synt-Tk
	dc.b "set buffe","r"+$80,"I",-1
* Gestion des chaines
TkMid1:	dc.w InMid3-Tk,FnMid3-Tk
	dc.b "!mid","$"+$80,"22,0,0",-2
	dc.w InMid2-Tk,FnMid2-Tk
	dc.b $80,"22,0",-1
	dc.w InLft-Tk,FnLft-Tk
	dc.b "left","$"+$80,"22,0",-1
	dc.w InRgt-Tk,FnRgt-Tk
	dc.b "right","$"+$80,"22,0",-1
TkMid2:	dc.w Synt-Tk,Flip-Tk
	dc.b "flip","$"+$80,"22",-1
	dc.w Synt-Tk,Chr-Tk
	dc.b "chr","$"+$80,"20",-1
	dc.w Synt-Tk,space-Tk
	dc.b "space","$"+$80,"20",-1
	dc.w Synt-Tk,string-Tk
	dc.b "string","$"+$80,"22,0",-1
	dc.w Synt-Tk,FnLwr-Tk
	dc.b "upper","$"+$80,"22",-1
	dc.w Synt-Tk,FnUpp-Tk
	dc.b "lower","$"+$80,"22",-1
	dc.w Synt-Tk,Str-Tk
	dc.b "str","$"+$80,"20",-1
	dc.w Synt-Tk,Val-Tk
	dc.b "va","l"+$80,"02",-1
	dc.w Synt-Tk,Bin1-Tk
	dc.b "!bin","$"+$80,"20",-2
	dc.w Synt-Tk,Bin2-Tk
	dc.b $80,"20,0",-1
	dc.w Synt-Tk,Hex1-Tk
	dc.b "!hex","$"+$80,"20",-2
	dc.w Synt-Tk,Hex2-Tk
	dc.b $80,"20,0",-1
	dc.w Synt-Tk,Len-Tk
	dc.b "le","n"+$80,"02",-1
	dc.w Synt-Tk,Instr2-Tk
	dc.b "!inst","r"+$80,"02,2",-2
	dc.w Synt-Tk,Instr3-Tk
	dc.b $80,"02,2,0",-1
	dc.w Synt-Tk,FnTab-Tk
	dc.b "tab","$"+$80,"2",-1
	dc.w Synt-Tk,FnFree-Tk
	dc.b "fre","e"+$80,"0",-1
TkVptr	dc.w Synt-Tk,FnVPtr-Tk
	dc.b "varpt","r"+$80,"0",-1
	dc.w WnMX2-Tk,Synt-Tk
	dc.b "remember ","x"+$80,"I",-1
	dc.w WnMY2-Tk,Synt-Tk
	dc.b "remember ","y"+$80,"I",-1

TkDim:	dc.w Dim-Tk,Synt-Tk
	dc.b "di","m"+$80,"I",-1
TkRem1:	dc.w Rem-Tk,Synt-Tk
	dc.b "re","m"+$80,-1
TkRem2:	dc.w Rem-Tk,Synt-Tk
	dc.b "'"+$80,-1
TkSort	dc.w ISort-Tk,Synt-Tk
	dc.b "sor","t"+$80,"I",-1
TkFnd1	dc.w Synt-Tk,FFind-Tk
	dc.b "matc","h"+$80,"03,3",-1
	dc.w Edit-Tk,Synt-Tk
	dc.b "edi","t"+$80,"I",-1
	dc.w GoDir-Tk,Synt-Tk
	dc.b "direc","t"+$80,"I",-1
* Fonctions
	dc.w Synt-Tk,FnRnd-Tk
	dc.b "rn","d"+$80,"00",-1
	dc.w Random-Tk,Synt-Tk
	dc.b "randomiz","e"+$80,"I0",-1
	dc.w Synt-Tk,FSgn-Tk
	dc.b "sg","n"+$80,"00",-1
	dc.w Synt-Tk,FAbs-Tk
	dc.b "ab","s"+$80,"00",-1
	dc.w Synt-Tk,FInt-Tk
	dc.b "in","t"+$80,"00",-1
	dc.w IRad-Tk,Synt-Tk
	dc.b "radia","n"+$80,"I",-1
	dc.w IDeg-Tk,Synt-Tk
	dc.b "degre","e"+$80,"I",-1
	dc.w Synt-Tk,FPi-Tk
	dc.b "pi","#"+$80,"0",-1
	dc.w IFix-Tk,Synt-Tk
	dc.b "fi","x"+$80,"I0",-1
TkMin:	dc.w Synt-Tk,FMax-Tk
	dc.b "mi","n"+$80,"00,0",-1
TkMax:	dc.w Synt-Tk,FMin-Tk
	dc.b "ma","x"+$80,"00,0",-1
TkMat1:	dc.w Synt-Tk,FSin-Tk
	dc.b "si","n"+$80,"00",-1
	dc.w Synt-Tk,FCos-Tk
	dc.b "co","s"+$80,"00",-1
	dc.w Synt-Tk,FTan-Tk
	dc.b "ta","n"+$80,"00",-1
	dc.w Synt-Tk,FASin-Tk
	dc.b "asi","n"+$80,"00",-1
	dc.w Synt-Tk,FACos-Tk
	dc.b "aco","s"+$80,"00",-1
	dc.w Synt-Tk,FATan-Tk
	dc.b "ata","n"+$80,"00",-1
	dc.w Synt-Tk,FHSin-Tk
	dc.b "hsi","n"+$80,"00",-1
	dc.w Synt-Tk,FHCos-Tk
	dc.b "hco","s"+$80,"00",-1
	dc.w Synt-Tk,FHTan-Tk
	dc.b "hta","n"+$80,"00",-1
	dc.w Synt-Tk,FSqr-Tk
	dc.b "sq","r"+$80,"00",-1
	dc.w Synt-Tk,FLog-Tk
	dc.b "lo","g"+$80,"00",-1
	dc.w Synt-Tk,FLn-Tk
	dc.b "l","n"+$80,"00",-1
	dc.w Synt-Tk,FExp-Tk
	dc.b "ex","p"+$80,"00",-1
TkMat2	
* MENUS!!!
	dc.w MnToBank-Tk,Synt-Tk
	dc.b "menu to ban","k"+$80,"I0",-1
	dc.w BkToMenu-Tk,Synt-Tk
	dc.b "bank to men","u"+$80,"I0",-1
	dc.w IMnOn-Tk,Synt-Tk
	dc.b "menu o","n"+$80,"I",-1
	dc.w IMnOff-Tk,Synt-Tk
	dc.b "menu of","f"+$80,"I",-1
	dc.w IMnCa-Tk,Synt-Tk
	dc.b "menu cal","c"+$80,"I",-1
	dc.w IMnMOn-Tk,Synt-Tk
	dc.b "menu mouse o","n"+$80,"I",-1
	dc.w IMnMOf-Tk,Synt-Tk
	dc.b "menu mouse of","f"+$80,"I",-1
	dc.w IMnBs-Tk,Synt-Tk
	dc.b "menu bas","e"+$80,"I0,0",-1
TkDMn:
TkSMn:	dc.w ISMen-Tk,Synt-TK
	dc.b "set men","u"+$80,"I0t0,0",-1
TkXMn	dc.w Synt-Tk,FXMen-Tk
	dc.b "x men","u"+$80,"00",-1
TkYMn	dc.w Synt-Tk,FYMen-Tk
	dc.b "y men","u"+$80,"00",-1
TkMnK	dc.w IMnk-Tk,Synt-Tk	
	dc.b "menu ke","y"+$80,"I0t0,0",-1
TkIMn1:	dc.w IMnBa-Tk,Synt-Tk
	dc.b "menu ba","r"+$80,"I0",-1
	dc.w IMnLi-Tk,Synt-Tk
	dc.b "menu lin","e"+$80,"I0",-1
	dc.w IMnTl-Tk,Synt-Tk
	dc.b "menu tlin","e"+$80,"I0",-1
	dc.w IMnMv-Tk,Synt-Tk
	dc.b "menu movabl","e"+$80,"I0",-1
	dc.w IMnSt-Tk,Synt-Tk
	dc.b "menu stati","c"+$80,"I0",-1
	dc.w IMnIMv-Tk,Synt-Tk
	dc.b "menu item movabl","e"+$80,"I0",-1
	dc.w IMnISt-Tk,Synt-Tk
	dc.b "menu item stati","c"+$80,"I0",-1
	dc.w IMnAct-Tk,Synt-Tk
	dc.b "menu activ","e"+$80,"I0",-1
	dc.w IMnInA-Tk,Synt-Tk
	dc.b "menu inactiv","e"+$80,"I0",-1
	dc.w IMnSep-Tk,Synt-Tk
	dc.b "menu separat","e"+$80,"I0",-1
	dc.w IMnLnk-Tk,Synt-Tk
	dc.b "menu lin","k"+$80,"I0",-1
TkMnCl	dc.w IMnCl-Tk,Synt-Tk
	dc.b "menu calle","d"+$80,"I0",-1
	dc.w IMnNCl-Tk,Synt-Tk
	dc.b "menu onc","e"+$80,"I0",-1
TkIMn2:	
TkMnD:	dc.w IMnDl-Tk,Synt-Tk
	dc.b "menu de","l"+$80,"I",-1
TkMenu:	dc.w IMen-Tk,Synt-Tk
	dc.b "menu","$"+$80,"V",-1
TkFMn:	dc.w Synt-Tk,FMen0-Tk
	dc.b "!choic","e"+$80,"0",-2
	dc.w Synt-Tk,FMen1-Tk
	dc.b $80,"00",-1

* Screen instructions
	dc.w Scop2-Tk,Synt-Tk
	dc.b "!screen cop","y"+$80,"I0t0",-2
	dc.w Scop3-Tk,Synt-Tk
	dc.b $80,"I0t00",-2
	dc.w Scop8-Tk,Synt-Tk
	dc.b $80,"I0,0,0,0,0t0,0,0",-2
	dc.w Scop9-Tk,Synt-Tk
	dc.b $80,"I0,0,0,0,0t0,0,0,0",-1
	dc.w ScClone-Tk,Synt-Tk
	dc.b "screen clon",$80+"e","I0",-1
	dc.w ScOpen-Tk,Synt-Tk
	dc.b "screen ope","n"+$80,"I0,0,0,0,0",-1
	dc.w ScClos-Tk,Synt-Tk
	dc.b "screen clos",$80+"e","I0",-1
TkScD:	dc.w ScDisp-Tk,Synt-Tk
	dc.b "screen displa","y"+$80,"I0,0,0,0,0",-1
TkScO:	dc.w ScOffs-Tk,Synt-Tk
	dc.b "screen offse","t"+$80,"I0,0,0",-1
TkScS:	dc.w Synt-Tk,Synt-Tk
	dc.b "screen siz","e"+$80,-1
	dc.w Synt-Tk,FSCol-Tk
	dc.b "screen colou","r"+$80,"0",-1
	dc.w ScFr0-Tk,Synt-Tk
	dc.b "!screen to fron","t"+$80,"I",-2
	dc.w ScFr1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w ScBk0-Tk,Synt-Tk
	dc.b "!screen to bac","k"+$80,"I",-2
	dc.w ScBk1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w ScHi0-Tk,Synt-Tk
	dc.b "!screen hid","e"+$80,"I",-2
	dc.w ScHi1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w ScSh0-Tk,Synt-Tk
	dc.b "!screen sho","w"+$80,"I",-2
	dc.w ScSh1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w ScSwp0-Tk,Synt-Tk
	dc.b "!screen swa","p"+$80,"I",-2
	dc.w ScSwp1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w ScSave1-Tk,Synt-Tk
	dc.b "!save if","f"+$80,"I2",-2
	dc.w ScSave2-Tk,Synt-Tk
	dc.b $80,"I2,0",-1
	dc.w ScView-Tk,Synt-Tk
	dc.b "vie","w"+$80,"I",-1
	dc.w AVOff-Tk,Synt-Tk
	dc.b "auto view of","f"+$80,"I",-1
	dc.w AVOn-Tk,Synt-Tk
	dc.b "auto view o","n"+$80,"I",-1
	dc.w Synt-Tk,FnSBase-Tk
	dc.b "screen bas","e"+$80,"0",-1
	dc.w Synt-Tk,FnScW-Tk
	dc.b "!screen widt","h"+$80,"0",-2
	dc.w Synt-Tk,FnScW1-Tk
	dc.b $80,"00",-1
	dc.w Synt-Tk,FnScH-Tk
	dc.b "!screen heigh","t"+$80,"0",-2
	dc.w Synt-Tk,FnScH1-Tk
	dc.b $80,"00",-1
	dc.w GPal1-Tk,Synt-Tk
	dc.b "!get palett","e"+$80,"I0",-2
	dc.w GPal2-Tk,Synt-Tk
	dc.b $80,"I0,0",-1
	dc.w ICls0-Tk,Synt-Tk
	dc.b "!cl","s"+$80,"I",-2
	dc.w ICls1-Tk,Synt-Tk
	dc.b $80,"I0",-2
	dc.w ICls5-Tk,Synt-Tk
	dc.b $80,"I0,0,0t0,0",-1
	dc.w DefSc-Tk,Synt-Tk
	dc.b "def scrol","l"+$80,"I0,0,0t0,0,0,0",-1
* Conversions de coordonnees
	dc.w Synt-Tk,XHard1-Tk
	dc.b "!x har","d"+$80,"00",-2
	dc.w Synt-Tk,XHard2-Tk
	dc.b $80,"00,0",-1
	dc.w Synt-Tk,YHard1-Tk
	dc.b "!y har","d"+$80,"00",-2
	dc.w Synt-Tk,YHard2-Tk
	dc.b $80,"00,0",-1
	dc.w Synt-Tk,XScr1-Tk
	dc.b "!x scree","n"+$80,"00",-2
	dc.w Synt-Tk,XScr2-Tk
	dc.b $80,"00,0",-1
	dc.w Synt-Tk,YScr1-Tk
	dc.b "!y scree","n"+$80,"00",-2
	dc.w Synt-Tk,YScr2-Tk
	dc.b $80,"00,0",-1
	dc.w Synt-Tk,XTxt1-Tk
	dc.b "x tex","t"+$80,"00",-1
	dc.w Synt-Tk,YTxt1-Tk
	dc.b "y tex","t"+$80,"00",-1

TkScr:	dc.w InSc-Tk,Synt-Tk
	dc.b "!scree","n"+$80,"I0",-3
	dc.w Synt-Tk,FnSc-Tk
	dc.b $80,"0",-1
	dc.w Synt-Tk,FnHi-Tk
	dc.b "hire","s"+$80,"0",-1
	dc.w Synt-Tk,FnLow-Tk
	dc.b "lowre","s"+$80,"0",-1
	dc.w GoDual-Tk,Synt-Tk
	dc.b "dual playfiel","d"+$80,"I0,0",-1
	dc.w PDual-Tk,Synt-Tk
	dc.b "dual priorit","y"+$80,"I0,0",-1
	dc.w WtVbl-Tk,Synt-Tk
	dc.b "wait vb","l"+$80,"I",-1
TkDPal:	dc.w DPal-Tk,Synt-Tk
	dc.b "default palett","e"+$80,"I",-1
	dc.w Defo-Tk,Synt-Tk
	dc.b "defaul","t"+$80,"I",-1
TkPal:	dc.w Pal-Tk,Synt-Tk
	dc.b "palett","e"+$80,"I",-1
	dc.w ColB-Tk,Synt-Tk
	dc.b "colour bac","k"+$80,"I0",-1
	dc.w InCol-Tk,Synt-Tk
	dc.b "!colou","r"+$80,"I0,0",-3
	dc.w Synt-Tk,FnCol-Tk
	dc.b $80,"00",-1
	dc.w FlOff-Tk,Synt-Tk
	dc.b "flash of","f"+$80,"I",-1
	dc.w FlOn-Tk,Synt-Tk
	dc.b "flas","h"+$80,"I0,2",-1
	dc.w ShOff-Tk,Synt-Tk
	dc.b "shift of","f"+$80,"I",-1
	dc.w ShUp-Tk,Synt-Tk
	dc.b "shift u","p"+$80,"I0,0,0,0",-1
	dc.w ShDn-Tk,Synt-Tk
	dc.b "shift dow","n"+$80,"I0,0,0,0",-1
	dc.w ISRain6-Tk,Synt-Tk
	dc.b "!set rainbo","w"+$80,"I0,0,0,2,2,2",-2
	dc.w ISRain7-Tk,Synt-Tk
	dc.b $80,"I0,0,0,2,2,2,0",-1
	dc.w IRDel0-Tk,Synt-Tk
	dc.b "!rainbow de","l"+$80,"I",-2
	dc.w IRDel1-Tk,Synt-Tk
	dc.b $80,"I0",-1
TkRn:	dc.w IRain-Tk,Synt-Tk
	dc.b "rainbo","w"+$80,"I0,0,0,0",-1
	dc.w VIRain-Tk,VFRain-Tk
	dc.b "rai","n"+$80,"V00,0",-1
TkFade:	dc.w IFade-Tk,Synt-Tk
	dc.b "fad","e"+$80,"I",-1
	dc.w Synt-Tk,FnPhy-Tk
	dc.b "phybas","e"+$80,"00",-1
	dc.w Synt-Tk,FPhy0-Tk
	dc.b "!physi","c"+$80,"0",-2
	dc.w Synt-Tk,FPhy1-Tk
	dc.b $80,"00",-1
	dc.w IAB-Tk,Synt-Tk
	dc.b "autobac","k"+$80,"I0",-1
* Instructions graphiques
	dc.w IPlot2-Tk,Synt-Tk
	dc.b "!plo","t"+$80,"I0,0",-2
	dc.w IPlot3-Tk,Synt-Tk
	dc.b $80,"I0,0,0",-1
	dc.w Synt-Tk,FPoint-Tk
	dc.b "poin","t"+$80,"00,0",-1
	dc.w IDraw2-Tk,Synt-Tk
	dc.b "draw t","o"+$80,"I0,0",-1
	dc.w IDraw4-Tk,Synt-Tk
	dc.b "dra","w"+$80,"I0,0t0,0",-1
	dc.w IEll-Tk,Synt-Tk
	dc.b "ellips","e"+$80,"I0,0,0,0",-1
	dc.w ICir-Tk,Synt-Tk
	dc.b "circl","e"+$80,"I0,0,0",-1
TkPoL:	dc.w IPoL-Tk,Synt-Tk
	dc.b "polylin","e"+$80,"I",-1
TkPoG:	dc.w IPoG-Tk,Synt-Tk
	dc.b "polygo","n"+$80,"I",-1
	dc.w IBar-Tk,Synt-Tk
	dc.b "ba","r"+$80,"I0,0t0,0",-1
	dc.w IBox-Tk,Synt-Tk
	dc.b "bo","x"+$80,"I0,0t0,0",-1
	dc.w IPaint2-Tk,Synt-Tk
	dc.b "!pain","t"+$80,"I0,0",-2
	dc.w IPaint3-Tk,Synt-Tk
	dc.b $80,"I0,0,0",-1
	dc.w IGrLoc-Tk,Synt-Tk
	dc.b "gr locat","e"+$80,"I0,0",-1
	dc.w Synt-Tk,FText-Tk
	dc.b "text lengt","h"+$80,"02",-1
	dc.w Synt-Tk,FStyle-Tk
	dc.b "text style","s"+$80,"0",-1
	dc.w Synt-Tk,FTBase-Tk
	dc.b "text bas","e"+$80,"0",-1
	dc.w IText-Tk,Synt-Tk
	dc.b "tex","t"+$80,"I0,0,2",-1
	dc.w ISText-Tk,Synt-Tk
	dc.b "set tex","t"+$80,"I0",-1
	dc.w ISPaint-Tk,Synt-Tk
	dc.b "set pain","t"+$80,"I0",-1
	dc.w IGFont-Tk,Synt-Tk
	dc.b "get font","s"+$80,"I",-1
	dc.w IGDFont-Tk,Synt-Tk
	dc.b "get disc font","s"+$80,"I",-1
	dc.w IGRFont-Tk,Synt-Tk
	dc.b "get rom font","s"+$80,"I",-1
	dc.w ISFont-Tk,Synt-Tk
	dc.b "set fon","t"+$80,"I0",-1
	dc.w Synt-Tk,FFont-Tk
	dc.b "font","$"+$80,"20",-1
	dc.w IHSli-Tk,Synt-Tk
	dc.b "hslide","r"+$80,"I0,0t0,0,0,0,0",-1
	dc.w IVSli-Tk,Synt-Tk
	dc.b "vslide","r"+$80,"I0,0t0,0,0,0,0",-1
	dc.w ISSli-Tk,Synt-Tk
	dc.b "set slide","r"+$80,"I0,0,0,0,0,0,0,0",-1
	dc.w ISPat-Tk,Synt-Tk
	dc.b "set patter","n"+$80,"I0",-1
	dc.w StLine-Tk,Synt-Tk
	dc.b "set lin","e"+$80,"I0",-1
	dc.w IInk1-Tk,Synt-Tk
	dc.b "!in","k"+$80,"I0",-2
	dc.w IInk2-Tk,Synt-Tk
	dc.b $80,"I0,0",-2
	dc.w IInk3-Tk,Synt-Tk
	dc.b $80,"I0,0,0",-1
	dc.w GrWrt-Tk,Synt-Tk
	dc.b "gr writin","g"+$80,"I0",-1
	dc.w IClip0-Tk,Synt-Tk
	dc.b "!cli","p"+$80,"I",-2
	dc.w IClip4-Tk,Synt-Tk
	dc.b $80,"I0,0t0,0",-1
	dc.w ISRas0-Tk,Synt-Tk
	dc.b "!set tempra","s"+$80,"I",-2
	dc.w ISRas1-Tk,Synt-Tk
	dc.b $80,"I0",-2
	dc.w ISRas2-Tk,Synt-Tk
	dc.b $80,"I0,0",-1
	dc.w IApp2-Tk,Synt-Tk
	dc.b "!appea","r"+$80,"I0t0,0",-2
	dc.w IApp3-Tk,Synt-Tk
	dc.b $80,"I0t0,0,0",-1
	dc.w IZoom-Tk,Synt-Tk
	dc.b "zoo","m"+$80,"I0,0,0,0,0t0,0,0,0,0",-1
	
* Blocs
	dc.w GtCBl-Tk,Synt-Tk
	dc.b "get cbloc","k"+$80,"I0,0,0,0,0",-1
	dc.w PtCBl1-Tk,Synt-Tk
	dc.b "!put cbloc","k"+$80,"I0",-2
	dc.w PtCBl3-Tk,Synt-Tk
	dc.b $80,"I0,0,0",-1
	dc.w DlCBl0-Tk,Synt-Tk
	dc.b "!del cbloc","k"+$80,"I",-2
	dc.w DlCBl1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w GtBl5-Tk,Synt-Tk
	dc.b "!get bloc","k"+$80,"I0,0,0,0,0",-2
	dc.w GtBl6-Tk,Synt-Tk
	dc.b $80,"I0,0,0,0,0,0",-1
	dc.w PtBl1-Tk,Synt-Tk
	dc.b "!put bloc","k"+$80,"I0",-2
	dc.w PtBl3-Tk,Synt-Tk
	dc.b $80,"I0,0,0",-2
	dc.w PtBl4-Tk,Synt-Tk
	dc.b $80,"I0,0,0,0",-2
	dc.w PtBl5-Tk,Synt-Tk
	dc.b $80,"I0,0,0,0,0",-1
	dc.w DlBl0-Tk,Synt-Tk
	dc.b "!del bloc","k"+$80,"I",-2
	dc.w DlBl1-Tk,Synt-Tk
	dc.b $80,"I0",-1

* Instructions clavier
	dc.w IKSp-Tk,Synt-Tk
	dc.b "key spee","d"+$80,"I0,0",-1
	dc.w Synt-Tk,FnKSt-Tk
	dc.b "key stat","e"+$80,"00",-1
	dc.w Synt-Tk,FnShft-Tk
	dc.b "key shif","t"+$80,"0",-1
	dc.w Synt-Tk,FnJoy-Tk
	dc.b "jo","y"+$80,"00",-1
	dc.w Synt-Tk,FJUp-Tk
	dc.b "ju","p"+$80,"00",-1
	dc.w Synt-Tk,FJDown-Tk
	dc.b "jdow","n"+$80,"00",-1
	dc.w Synt-Tk,FJLeft-Tk
	dc.b "jlef","t"+$80,"00",-1
	dc.w Synt-Tk,FJRight-Tk
	dc.b "jrigh","t"+$80,"00",-1
	dc.w Synt-Tk,FFire-Tk
	dc.b "fir","e"+$80,"00",-1
	dc.w Synt-Tk,FTrue-Tk
	dc.b "tru","e"+$80,"0",-1
	dc.w Synt-Tk,FFalse-Tk
	dc.b "fals","e"+$80,"0",-1
	dc.w PutKy-Tk,Synt-Tk
	dc.b "put ke","y"+$80,"I2",-1
	dc.w Synt-Tk,FnScan-Tk
	dc.b "scancod","e"+$80,"0",-1
	dc.w Synt-Tk,FnScSh-Tk
	dc.b "scanshif","t"+$80,"0",-1
	dc.w ClKy-Tk,Synt-Tk
	dc.b "clear ke","y"+$80,"I",-1
	dc.w WtKy-Tk,Synt-Tk
	dc.b "wait ke","y"+$80,"I",-1
	dc.w IWait-Tk,Synt-Tk
	dc.b "wai","t"+$80,"I0",-1
	dc.w StKy-Tk,GtKy-Tk
	dc.b "key","$"+$80,"V20",-1
	dc.w Synt-Tk,FnKy1-Tk
	dc.b "!scan","$"+$80,"20",-2
	dc.w Synt-Tk,FnKy2-Tk
	dc.b $80,"20,0",-1
	dc.w ITimer-Tk,FTimer-Tk
	dc.b "time","r"+$80,"V0",-1

* Instruction fenetres
	dc.w WnOp5-Tk,Synt-Tk
	dc.b "!wind ope","n"+$80,"I0,0,0,0,0",-2
	dc.w WnOp6-Tk,Synt-Tk
	dc.b $80,"I0,0,0,0,0,0",-2
	dc.w WnOp7-Tk,Synt-Tk
	dc.b $80,"I0,0,0,0,0,0,0",-1
	dc.w WnClo-Tk,Synt-Tk
	dc.b "wind clos","e"+$80,"I",-1
	dc.w WnSave-Tk,Synt-Tk
	dc.b "wind sav","e"+$80,"I",-1
	dc.w WnMove-Tk,Synt-Tk
	dc.b "wind mov","e"+$80,"I0,0",-1
	dc.w WnSize-Tk,Synt-Tk
	dc.b "wind siz","e"+$80,"I0,0",-1
	dc.w Wndow-Tk,Synt-Tk
	dc.b "windo","w"+$80,"I0",-1
	dc.w Synt-Tk,WnDon-Tk
	dc.b "windo","n"+$80,"0",-1

	dc.w WnLoc-Tk,Synt-Tk
	dc.b "locat","e"+$80,"I0,0",-1
	dc.w WnClw-Tk,Synt-Tk
	dc.b "cl","w"+$80,"I",-1
	dc.w WnHom-Tk,Synt-Tk
	dc.b "hom","e"+$80,"I",-1
	dc.w WnCPe-Tk,Synt-Tk
	dc.b "curs pe","n"+$80,"I0",-1
	dc.w Synt-Tk,FnPen-Tk
	dc.b "pen","$"+$80,"20",-1
	dc.w Synt-Tk,FnPap-Tk
	dc.b "paper","$"+$80,"20",-1
	dc.w Synt-Tk,FnAt-Tk
	dc.b "a","t"+$80,"20,0",-1
	dc.w WnPen-Tk,Synt-Tk
	dc.b "pe","n"+$80,"I0",-1
	dc.w WnPap-Tk,Synt-Tk
	dc.b "pape","r"+$80,"I0",-1
	dc.w WnCen-Tk,Synt-Tk
	dc.b "centr","e"+$80,"I2",-1
	dc.w WnBor-Tk,Synt-Tk
	dc.b "borde","r"+$80,"I0,0,0",-1
	dc.w WnWrt1-Tk,Synt-Tk
	dc.b "!writin","g"+$80,"I0",-2
	dc.w WnWrt2-Tk,Synt-Tk
	dc.b $80,"I0,0",-1
	dc.w WnTTop-Tk,Synt-Tk
	dc.b "title to","p"+$80,"I2",-1
	dc.w WnTBot-Tk,Synt-Tk
	dc.b "title botto","m"+$80,"I2",-1
	dc.w WnCOf-Tk,Synt-Tk
	dc.b "curs of","f"+$80,"I",-1
	dc.w WnCOn-Tk,Synt-Tk
	dc.b "curs o","n"+$80,"I",-1
	dc.w WnIOf-Tk,Synt-Tk
	dc.b "inverse of","f"+$80,"I",-1
	dc.w WnIOn-Tk,Synt-Tk
	dc.b "inverse o","n"+$80,"I",-1
	dc.w WnUOf-Tk,Synt-Tk
	dc.b "under of","f"+$80,"I",-1
	dc.w WnUOn-Tk,Synt-Tk
	dc.b "under o","n"+$80,"I",-1
	dc.w WnSOf-Tk,Synt-Tk
	dc.b "shade of","f"+$80,"I",-1
	dc.w WnSOn-Tk,Synt-Tk
	dc.b "shade o","n"+$80,"I",-1
	dc.w WnScOf-Tk,Synt-Tk
	dc.b "scroll of","f"+$80,"I",-1
	dc.w WnScOn-Tk,Synt-Tk
	dc.b "scroll o","n"+$80,"I",-1
	dc.w DoSc-Tk,Synt-Tk			* Instruction scroll!
	dc.b "scrol","l"+$80,"I0",-1
	dc.w Synt-Tk,FnCUp-Tk
	dc.b "cup","$"+$80,"2",-1
	dc.w Synt-Tk,FnCDn-Tk
	dc.b "cdown","$"+$80,"2",-1
	dc.w Synt-Tk,FnCLf-Tk
	dc.b "cleft","$"+$80,"2",-1
	dc.w Synt-Tk,FnCRt-Tk
	dc.b "cright","$"+$80,"2",-1
	dc.w WnCUp-Tk,Synt-Tk
	dc.b "cu","p"+$80,"I",-1
	dc.w WnCDn-Tk,Synt-Tk
	dc.b "cdow","n"+$80,"I",-1
	dc.w WnCLf-Tk,Synt-Tk
	dc.b "clef","t"+$80,"I",-1
	dc.w WnCRt-Tk,Synt-Tk
	dc.b "crigh","t"+$80,"I",-1
	dc.w WnMX1-Tk,Synt-Tk
	dc.b "memorize ","x"+$80,"I",-1
	dc.w WnMY1-Tk,Synt-Tk
	dc.b "memorize ","y"+$80,"I",-1
	dc.w Synt-Tk,FnCMv-Tk
	dc.b "cmove","$"+$80,"20,0",-1
	dc.w WnCMv-Tk,Synt-Tk
	dc.b "cmov","e"+$80,"I0,0",-1
	dc.w WnCll-Tk,Synt-Tk
	dc.b "!clin","e"+$80,"I",-2
	dc.w WnCln-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w WnHSc-Tk,Synt-Tk
	dc.b "hscrol","l"+$80,"I0",-1
	dc.w WnVSc-Tk,Synt-Tk
	dc.b "vscrol","l"+$80,"I0",-1
	dc.w WnSTa-Tk,Synt-Tk
	dc.b "set ta","b"+$80,"I0",-1
	dc.w WnSCu-Tk,Synt-Tk
	dc.b "set cur","s"+$80,"I0,0,0,0,0,0,0,0",-1
	dc.w Synt-Tk,FnXCu-Tk
	dc.b "x cur","s"+$80,"0",-1
	dc.w Synt-Tk,FnYCu-Tk
	dc.b "y cur","s"+$80,"0",-1
	dc.w Synt-Tk,FnXGr-Tk
	dc.b "x graphi","c"+$80,"00",-1
	dc.w Synt-Tk,FnYGr-Tk
	dc.b "y graphi","c"+$80,"00",-1
	dc.w Synt-Tk,FXGr-Tk
	dc.b "xg","r"+$80,"0",-1
	dc.w Synt-Tk,FYGr-Tk
	dc.b "yg","r"+$80,"0",-1
	

* Zones
	dc.w IRZo0-Tk,Synt-Tk
	dc.b "!reserve zon","e"+$80,"I",-2
	dc.w IRZo1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w IRsZo0-Tk,Synt-Tk
	dc.b "!reset zon","e"+$80,"I",-2
	dc.w IRsZo1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w ISZo-Tk,Synt-Tk
	dc.b "set zon","e"+$80,"I0,0,0t0,0",-1
	dc.w Synt-Tk,FZo2-Tk
	dc.b "!zon","e"+$80,"00,0",-2
	dc.w Synt-Tk,FZo3-Tk
	dc.b $80,"00,0,0",-1
	dc.w Synt-Tk,FHZo2-Tk
	dc.b "!hzon","e"+$80,"00,0",-2
	dc.w Synt-Tk,FHZo3-Tk
	dc.b $80,"00,0,0",-1
	dc.w Synt-Tk,FScin2-Tk
	dc.b "!sci","n"+$80,"00,0",-2
	dc.w Synt-Tk,FScin3-Tk
	dc.b $80,"00,0,0",-1
	dc.w Synt-Tk,FMouSc-Tk
	dc.b "mouse scree","n"+$80,"0",-1
	dc.w Synt-Tk,FMouZo-Tk
	dc.b "mouse zon","e"+$80,"0",-1


* Instructions disques
	dc.w ISInp-Tk,Synt-Tk
	dc.b "set inpu","t"+$80,"I0,0",-1
	dc.w CloWB-Tk,Synt-Tk
	dc.b "close workbenc","h"+$80,"I",-1
	dc.w CloEd-Tk,Synt-Tk
	dc.b "close edito","r"+$80,"I",-1
	dc.w Synt-Tk,FDirF-Tk
	dc.b "dir first","$"+$80,"22",-1
	dc.w Synt-Tk,FDirN-Tk
	dc.b "dir next","$"+$80,"2",-1
	dc.w Synt-Tk,FExist-Tk
	dc.b "exis","t"+$80,"02",-1
	dc.w IDir-Tk,FDir-Tk
	dc.b "dir","$"+$80,"V2",-1
	dc.w LDirW0-Tk,Synt-Tk
	dc.b "!ldir/","w"+$80,"I",-2
	dc.w LDirW1-Tk,Synt-Tk
	dc.b $80,"I2",-1
	dc.w DirW0-Tk,Synt-Tk
	dc.b "!dir/","w"+$80,"I",-2
	dc.w DirW1-Tk,Synt-Tk
	dc.b $80,"I2",-1
	dc.w LDir0-Tk,Synt-Tk
	dc.b "!ldi","r"+$80,"I",-2
	dc.w LDir1-Tk,Synt-Tk
	dc.b $80,"I2",-1
	dc.w Dir0-Tk,Synt-Tk
	dc.b "!di","r"+$80,"I",-2
	dc.w Dir1-Tk,Synt-Tk
	dc.b $80,"I2",-1
	dc.w SDir1-Tk,Synt-Tk
	dc.b "set di","r"+$80,"I0",-2
	dc.w SDir2-Tk,Synt-Tk
	dc.b "set di","r"+$80,"I0,2",-2
	dc.w LdIff1-Tk,Synt-Tk
	dc.b "!load if","f"+$80,"I2",-2
	dc.w LdIff2-Tk,Synt-Tk
	dc.b $80,"I2,0",-1
	dc.w IffMsk-Tk,Synt-Tk
	dc.b "mask if","f"+$80,"I0",-1
	dc.w Synt-Tk,FnPic-Tk
	dc.b "pictur","e"+$80,"0",-1
	dc.w BLoad-Tk,Synt-Tk
	dc.b "bloa","d"+$80,"I2,0",-1
	dc.w BSave-Tk,Synt-Tk
	dc.b "bsav","e"+$80,"I2,0t0",-1
	dc.w PLoad-Tk,Synt-Tk
	dc.b "ploa","d"+$80,"I2,0",-1
	dc.w Save1-Tk,Synt-Tk
	dc.b "!sav","e"+$80,"I2",-2
	dc.w Save2-Tk,Synt-Tk
	dc.b $80,"I2,0",-1
	dc.w Load1-Tk,Synt-Tk
	dc.b "!loa","d"+$80,"I2",-2
	dc.w Load2-Tk,Synt-Tk
	dc.b $80,"I2,0",-1

	dc.w Synt-Tk,FDFree-Tk
	dc.b "dfre","e"+$80,"0",-1
	dc.w IMkDir-Tk,Synt-Tk
	dc.b "mkdi","r"+$80,"I2",-1
	dc.w Synt-Tk,FLof-Tk
	dc.b "lo","f"+$80,"00",-1
	dc.w Synt-Tk,FEof-Tk
	dc.b "eo","f"+$80,"00",-1
	dc.w IPof-Tk,FPof-Tk
	dc.b "po","f"+$80,"V00",-1
	dc.w Synt-Tk,FPort-Tk
	dc.b "por","t"+$80,"00",-1
	dc.w IOpRan-Tk,Synt-Tk
	dc.b "open rando","m"+$80,"I0,2",-1
	dc.w IOpIn-Tk,Synt-Tk
	dc.b "open i","n"+$80,"I0,2",-1
	dc.w IOpOut-Tk,Synt-Tk
	dc.b "open ou","t"+$80,"I0,2",-1
	dc.w IOpPor-Tk,Synt-Tk
	dc.b "open por","t"+$80,"I0,2",-1
	dc.w IAppn-Tk,Synt-Tk
	dc.b "appen","d"+$80,"I0,2",-1
	dc.w IClo0-Tk,Synt-Tk
	dc.b "!clos","e"+$80,"I",-2
	dc.w IClo1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w IPar-Tk,Synt-Tk
	dc.b "paren","t"+$80,"I",-1
	dc.w IRen-Tk,Synt-Tk
	dc.b "renam","e"+$80,"I2t2",-1
	dc.w IKill-Tk,Synt-Tk
	dc.b "kil","l"+$80,"I2",-1
	dc.w Synt-Tk,FDrive-Tk
	dc.b "driv","e"+$80,"02",-1
TkFld	dc.w IField-Tk,Synt-Tk
	dc.b "fiel","d"+$80,"I",-1
	dc.w Synt-Tk,FSel1-Tk
	dc.b "!fsel","$"+$80,"22",-2
	dc.w Synt-Tk,FSel2-Tk
	dc.b $80,"22,2",-2
	dc.w Synt-Tk,FSel3-Tk
	dc.b $80,"22,2,2",-2
	dc.w Synt-Tk,FSel4-Tk
	dc.b $80,"22,2,2,2",-2

* Instructions SPRITES
	dc.w SSBuf-Tk,Synt-Tk
	dc.b "set sprite buffe","r"+$80,"I0",-1
	dc.w SpOff0-Tk,Synt-Tk
	dc.b "!sprite of","f"+$80,"I",-2
	dc.w SpOff1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w SpPri-Tk,Synt-Tk
	dc.b "sprite priorit","y"+$80,"I0",-1
	dc.w SUpOf-Tk,Synt-Tk
	dc.b "sprite update of","f"+$80,"I",-1
	dc.w SUpOn-Tk,Synt-Tk
	dc.b "sprite update o","n"+$80,"I",-1
	dc.w SUpDa-Tk,Synt-Tk
	dc.b "sprite updat","e"+$80,"I",-1
	dc.w Synt-Tk,FSBCol1-Tk
	dc.b "!spritebob co","l"+$80,"00",-2
	dc.w Synt-Tk,FSBCol3-Tk
	dc.b $80,"00,0t0",-1
	dc.w Synt-Tk,ISpCol1-Tk
	dc.b "!sprite co","l"+$80,"00",-2
	dc.w Synt-Tk,ISpCol3-Tk
	dc.b $80,"00,0t0",-1
	dc.w IHCol-Tk,Synt-Tk
	dc.b "set hardco","l"+$80,"I0,0",-1
	dc.w Synt-Tk,FHCol-Tk
	dc.b "hardco","l"+$80,"00",-1
	dc.w Synt-Tk,FSBase-Tk
	dc.b "sprite bas","e"+$80,"00",-1
	dc.w Synt-Tk,FIBase-Tk
	dc.b "icon bas","e"+$80,"00",-1
TkSpr:	dc.w SpSp-Tk,Synt-Tk
	dc.b "sprit","e"+$80,"I0,0,0,0",-1

	dc.w BbOff0-Tk,Synt-Tk
	dc.b "!bob of","f"+$80,"I",-2
	dc.w BbOff1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w BUpOf-Tk,Synt-Tk
	dc.b "bob update of","f"+$80,"I",-1
	dc.w BUpOn-Tk,Synt-Tk
	dc.b "bob update o","n"+$80,"I",-1
	dc.w BUpDa-Tk,Synt-Tk
	dc.b "bob updat","e"+$80,"I",-1
	dc.w BbClr-Tk,Synt-Tk
	dc.b "bob clea","r"+$80,"I",-1
	dc.w BbDrw-Tk,Synt-Tk
	dc.b "bob dra","w"+$80,"I",-1
	dc.w Synt-Tk,FBSCol1-Tk
	dc.b "!bobsprite co","l"+$80,"00",-2
	dc.w Synt-Tk,FBSCol3-Tk
	dc.b $80,"00,0t0",-1
	dc.w Synt-Tk,IBbCol1-Tk
	dc.b "!bob co","l"+$80,"00",-2
	dc.w Synt-Tk,IBbCol3-Tk
	dc.b $80,"00,0t0",-1
	dc.w Synt-Tk,FnColl-Tk
	dc.b "co","l"+$80,"00",-1
	dc.w LBob0-Tk,Synt-Tk
	dc.b "!limit bo","b"+$80,"I",-2
	dc.w LBob4-Tk,Synt-Tk
	dc.b $80,"I0,0t0,0",-2
	dc.w LBob5-Tk,Synt-Tk
	dc.b $80,"I0,0,0t0,0",-1
	dc.w IStBb-Tk,Synt-Tk
	dc.b "set bo","b"+$80,"I0,0,0,0",-1
TkBob:	dc.w BbSt4-Tk,Synt-Tk	
	dc.b "bo","b"+$80,"I0,0,0,0",-1
	dc.w GSpPa0-Tk,Synt-Tk
	dc.b "!get sprite palett","e"+$80,"I",-2
	dc.w GSpPa1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w GetSp5-Tk,Synt-Tk
	dc.b "!get sprit","e"+$80,"I0,0,0t0,0",-2
	dc.w GetSp6-Tk,Synt-Tk
	dc.b $80,"I0,0,0,0t0,0",-1
	dc.w GetSp5-Tk,Synt-Tk
	dc.b "!get bo","b"+$80,"I0,0,0t0,0",-2
	dc.w GetSp6-Tk,Synt-Tk
	dc.b $80,"I0,0,0,0t0,0",-1
	dc.w IDSp1-Tk,Synt-Tk
	dc.b "!del sprit","e"+$80,"I0",-2
	dc.w IDSp2-Tk,Synt-Tk
	dc.b $80,"I0t0",-1
	dc.w IDSp1-Tk,Synt-Tk
	dc.b "!del bo","b"+$80,"I0",-2
	dc.w IDSp2-Tk,Synt-Tk
	dc.b $80,"I0t0",-1	
	dc.w IDIc1-Tk,Synt-Tk
	dc.b "!del ico","n"+$80,"I0",-2
	dc.w IDIc2-Tk,Synt-Tk
	dc.b $80,"I0t0",-1
	dc.w IISpr-Tk,Synt-Tk
	dc.b "ins sprit","e"+$80,"I0",-1
	dc.w IISpr-Tk,Synt-Tk
	dc.b "ins bo","b"+$80,"I0",-1
	dc.w IIIco-Tk,Synt-Tk
	dc.b "ins ico","n"+$80,"I0",-1
	dc.w GIcPa0-Tk,Synt-Tk
	dc.b "!get icon palett","e"+$80,"I",-2
	dc.w GIcPa1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w GetIc5-Tk,Synt-Tk
	dc.b "!get ico","n"+$80,"I0,0,0t0,0",-2
	dc.w GetIc6-Tk,Synt-Tk
	dc.b $80,"I0,0,0,0t0,0",-1
	dc.w IPBob-Tk,Synt-Tk
	dc.b "put bo","b"+$80,"I0",-1
	dc.w PatBb-Tk,Synt-Tk
	dc.b "paste bo","b"+$80,"I0,0,0",-1
	dc.w PatIc-Tk,Synt-Tk
	dc.b "paste ico","n"+$80,"I0,0,0",-1
	dc.w MkMask0-Tk,Synt-Tk
	dc.b "!make mas","k"+$80,"I",-2
	dc.w MkMask1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w NoMask0-Tk,Synt-Tk
	dc.b "!no mas","k"+$80,"I",-2
	dc.w NoMask1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w MkIMs0-Tk,Synt-Tk
	dc.b "!make icon mas","k"+$80,"I",-2
	dc.w MkIMs1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w NoIMs0-Tk,Synt-Tk
	dc.b "!no icon mas","k"+$80,"I",-2
	dc.w NoIMs1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w HotSp2-Tk,Synt-Tk
	dc.b "!hot spo","t"+$80,"I0,0",-2
	dc.w HotSp3-Tk,Synt-Tk
	dc.b $80,"I0,0,0",-1
	dc.w IPrOn-Tk,Synt-Tk
	dc.b "priority o","n"+$80,"I",-1
	dc.w IPrOf-Tk,Synt-Tk
	dc.b "priority of","f"+$80,"I",-1

	dc.w IHidO-Tk,Synt-Tk	
	dc.b "hide o","n"+$80,"I",-1
	dc.w IHide-Tk,Synt-Tk
	dc.b "hid","e"+$80,"I",-1
	dc.w IShoO-Tk,Synt-Tk
	dc.b "show o","n"+$80,"I",-1
	dc.w IShow-Tk,Synt-Tk
	dc.b "sho","w"+$80,"I",-1
	dc.w ChMou-Tk,Synt-Tk
	dc.b "change mous","e"+$80,"I0",-1
	dc.w SXMou-Tk,XMou-Tk
	dc.b "x mous","e"+$80,"V0",-1
	dc.w SYMou-Tk,YMou-Tk
	dc.b "y mous","e"+$80,"V0",-1
	dc.w Synt-Tk,MouK-Tk
	dc.b "mouse ke","y"+$80,"0",-1
	dc.w Synt-Tk,MouKR-Tk
	dc.b "mouse clic","k"+$80,"0",-1
	dc.w ILimM0-Tk,Synt-Tk
	dc.b "!limit mous","e"+$80,"I",-2
	dc.w ILimM1-Tk,Synt-Tk
	dc.b $80,"I0",-2
	dc.w ILimM4-Tk,Synt-Tk
	dc.b $80,"I0,0t0,0",-1
	
* AMAL!
	dc.w IUFrz-Tk,Synt-Tk
	dc.b "unfreez","e"+$80,"I",-1
	dc.w InMvX-Tk,Synt-Tk
	dc.b "!move ","x"+$80,"I0,3",-2
	dc.w InMvX3-Tk,Synt-Tk
	dc.b $80,"I0,2t0",-1
	dc.w InMvY-Tk,Synt-Tk
	dc.b "!move ","y"+$80,"I0,3",-2
	dc.w InMvY-Tk,Synt-Tk
	dc.b $80,"I0,2t0",-1
	dc.w MvOf0-Tk,Synt-Tk
	dc.b "!move of","f"+$80,"I",-2
	dc.w MvOf1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w MvOn0-Tk,Synt-Tk
	dc.b "!move o","n"+$80,"I",-2
	dc.w MvOn1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w MvFz0-Tk,Synt-Tk
	dc.b "!move freez","e"+$80,"I",-2
	dc.w MvFz1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w AnOf0-Tk,Synt-Tk
	dc.b "!anim of","f"+$80,"I",-2
	dc.w AnOf1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w AnOn0-Tk,Synt-Tk
	dc.b "!anim o","n"+$80,"I",-2
	dc.w AnOn1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w AnFz0-Tk,Synt-Tk
	dc.b "!anim freez","e"+$80,"I",-2
	dc.w AnFz1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w InAnm-Tk,Synt-Tk
	dc.b "ani","m"+$80,"I0,3",-2
	dc.w InAnm3-Tk,Synt-Tk
	dc.b $80,"I0,2t0",-1
	dc.w Synt-Tk,FMovon-Tk
	dc.b "movo","n"+$80,"00",-1
	dc.w Synt-Tk,FChanA-Tk
	dc.b "chana","n"+$80,"00",-1
	dc.w Synt-Tk,FChanM-Tk
	dc.b "chanm","v"+$80,"00",-1
TkChan:	dc.w Channel-Tk,Synt-Tk
	dc.b "channe","l"+$80,"I",-1
	dc.w IAmR1-Tk,FAmR1-Tk
	dc.b "!amre","g"+$80,"V00",-2
	dc.w IAmR2-Tk,FAmR2-Tk
	dc.b $80,"V00,0",-1
	dc.w AmOn0-Tk,Synt-Tk
	dc.b "!amal o","n"+$80,"I",-2
	dc.w AmOn1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w AmOf0-Tk,Synt-Tk
	dc.b "!amal of","f"+$80,"I",-2
	dc.w AmOf1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w AmFz0-Tk,Synt-Tk
	dc.b "!amal freez","e"+$80,"I",-2
	dc.w AmFz1-Tk,Synt-Tk
	dc.b $80,"I0",-1
	dc.w Synt-Tk,FAmE-Tk
	dc.b "amaler","r"+$80,"0",-1
	dc.w InAm-Tk,Synt-Tk
	dc.b "!ama","l"+$80,"I0,3",-2
	dc.w InAm3-Tk,Synt-Tk
	dc.b $80,"I0,2t0",-1
	dc.w IAmP2-Tk,Synt-Tk
	dc.b "!ampla","y"+$80,"I0,0",-2
	dc.w IAmP4-Tk,Synt-Tk
	dc.b $80,"I0,0,0t0",-1
	dc.w ISOn-Tk,Synt-Tk
	dc.b "synchro o","n"+$80,"I",-1
	dc.w ISOff-Tk,Synt-Tk
	dc.b "synchro of","f"+$80,"I",-1
	dc.w ISync-Tk,Synt-Tk
	dc.b "synchr","o"+$80,"I",-1
	dc.w UpOf-Tk,Synt-Tk
	dc.b "update of","f"+$80,"I",-1
	dc.w UpOn-Tk,Synt-Tk
	dc.b "update o","n"+$80,"I",-1
	dc.w UpEv-Tk,Synt-Tk
	dc.b "update ever","y"+$80,"I0",-1
	dc.w UpDa-Tk,Synt-Tk
	dc.b "updat","e"+$80,"I",-1
	dc.w Synt-Tk,FXBob-Tk
	dc.b "x bo","b"+$80,"00",-1
	dc.w Synt-Tk,FYBob-Tk
	dc.b "y bo","b"+$80,"00",-1
	dc.w Synt-Tk,FXSp-Tk
	dc.b "x sprit","e"+$80,"00",-1
	dc.w Synt-Tk,FYSp-Tk
	dc.b "y sprit","e"+$80,"00",-1
	
* Memoire / Banques
	dc.w RsWrk-Tk,Synt-Tk	
	dc.b "reserve as wor","k"+$80,"I0,0",-1
	dc.w RsCWrk-Tk,Synt-Tk	
	dc.b "reserve as chip wor","k"+$80,"I0,0",-1
	dc.w RsDat-Tk,Synt-Tk	
	dc.b "reserve as dat","a"+$80,"I0,0",-1
	dc.w RsCDat-Tk,Synt-Tk	
	dc.b "reserve as chip dat","a"+$80,"I0,0",-1
	dc.w Erase-Tk,Synt-Tk
	dc.b "eras","e"+$80,"I0",-1
	dc.w LBank-Tk,Synt-Tk
	dc.b "list ban","k"+$80,"I",-1
	dc.w Synt-Tk,FChip-Tk
	dc.b "chip fre","e"+$80,"0",-1
	dc.w Synt-Tk,FFast-Tk
	dc.b "fast fre","e"+$80,"0",-1
	dc.w IFill-Tk,Synt-Tk
	dc.b "fil","l"+$80,"I0t0,0",-1
	dc.w ICopy-Tk,Synt-Tk
	dc.b "cop","y"+$80,"I0,0t0",-1
	dc.w Synt-Tk,FHunt-Tk
	dc.b "hun","t"+$80,"00t0,2",-1
	dc.w Pok-Tk,Synt-Tk
	dc.b "pok","e"+$80,"I0,0",-1
	dc.w Lok-Tk,Synt-Tk
	dc.b "lok","e"+$80,"I0,0",-1
	dc.w Synt-Tk,Pik-Tk
	dc.b "pee","k"+$80,"00",-1
	dc.w Synt-Tk,Dik-Tk
	dc.b "dee","k"+$80,"00",-1
	dc.w Synt-Tk,Lik-Tk
	dc.b "lee","k"+$80,"00",-1
	dc.w IBset-Tk,Synt-Tk
	dc.b "bse","t"+$80,"I0,0",-1
	dc.w IBClr-Tk,Synt-Tk
	dc.b "bcl","r"+$80,"I0,0",-1
	dc.w IBchg-Tk,Synt-Tk
	dc.b "bch","g"+$80,"I0,0",-1
	dc.w Synt-Tk,FBtst-Tk
	dc.b "bts","t"+$80,"00,0",-1
 	dc.w BRor-Tk,Synt-Tk
	dc.b "ror.","b"+$80,"I0,0",-1
 	dc.w WRor-Tk,Synt-Tk
	dc.b "ror.","w"+$80,"I0,0",-1
 	dc.w LRor-Tk,Synt-Tk
	dc.b "ror.","l"+$80,"I0,0",-1
 	dc.w BRol-Tk,Synt-Tk
	dc.b "rol.","b"+$80,"I0,0",-1
 	dc.w WRol-Tk,Synt-Tk
	dc.b "rol.","w"+$80,"I0,0",-1
 	dc.w LRol-Tk,Synt-Tk
	dc.b "rol.","l"+$80,"I0,0",-1
	dc.w IAreg-Tk,FAReg-Tk
	dc.b "are","g"+$80,"V00",-1
	dc.w IDReg-Tk,FDReg-Tk
	dc.b "dre","g"+$80,"V00",-1

* Copper
	dc.w ICopOn-Tk,Synt-Tk
	dc.b "copper o","n"+$80,"I",-1
	dc.w ICopOf-Tk,Synt-Tk
	dc.b "copper of","f"+$80,"I",-1
	dc.w ICopSw-Tk,Synt-Tk
	dc.b "cop swa","p"+$80,"I",-1
	dc.w ICopRs-Tk,Synt-Tk
	dc.b "cop rese","t"+$80,"I",-1
	dc.w ICopW2-Tk,Synt-Tk
	dc.b "!cop wai","t"+$80,"I0,0",-2
	dc.w ICopW4-Tk,Synt-Tk
	dc.b $80,"I0,0,0,0",-1
	dc.w ICopMl-Tk,Synt-Tk
	dc.b "cop move","l"+$80,"I0,0",-1
	dc.w ICopMv-Tk,Synt-Tk
	dc.b "cop mov","e"+$80,"I0,0",-1
	dc.w Synt-Tk,FCopBs-Tk
	dc.b "cop logi","c"+$80,"0",-1

* Instructions programmes/accessoires
	dc.w Synt-Tk,FAccF-Tk
	dc.b "prg first","$"+$80,"22",-1
	dc.w Synt-Tk,FAccN-Tk
	dc.b "prg next","$"+$80,"2",-1
	dc.w Synt-Tk,PSel1-Tk
	dc.b "!psel","$"+$80,"22",-2
	dc.w Synt-Tk,PSel2-Tk
	dc.b $80,"22,2",-2
	dc.w Synt-Tk,PSel3-Tk
	dc.b $80,"22,2,2",-2
	dc.w Synt-Tk,PSel4-Tk
	dc.b $80,"22,2,2,2",-2
	dc.w PrgRun-Tk,Synt-Tk
	dc.b "pru","n"+$80,"I2",-1
	dc.w IBGrab-Tk,Synt-Tk
	dc.b "bgra","b"+$80,"I0",-1

* En dernier!
	dc.w IPut-Tk,Synt-Tk
	dc.b "pu","t"+$80,"I0,0",-1
	dc.w IGet-Tk,Synt-Tk
	dc.b "ge","t"+$80,"I0,0",-1
	dc.w ISys-Tk,Synt-Tk
	dc.b "syste","m"+$80,"I",-1
	dc.w IMWait-Tk,Synt-Tk
	dc.b "multi wai","t"+$80,"I",-1
	dc.w Synt-Tk,FIBb-Tk
	dc.b "i bo","b"+$80,"00",-1
	dc.w Synt-Tk,FISp-Tk
	dc.b "i sprit","e"+$80,"00",-1
	dc.w IPrROn-Tk,Synt-Tk
	dc.b "priority reverse o","n"+$80,"I",-1
	dc.w IPrROf-Tk,Synt-Tk
	dc.b "priority reverse of","f"+$80,"I",-1
	dc.w Synt-Tk,FDevF-Tk
	dc.b "dev first","$"+$80,"22",-1
	dc.w Synt-Tk,FDevN-Tk
	dc.b "dev next","$"+$80,"2",-1
	dc.w IHRev-Tk,Synt-Tk
	dc.b "hrev bloc","k"+$80,"I0",-1
	dc.w IVRev-Tk,Synt-Tk
	dc.b "vrev bloc","k"+$80,"I0",-1
	dc.w Synt-Tk,FRevX-Tk
	dc.b "hre","v"+$80,"00",-1
	dc.w Synt-Tk,FRevY-Tk
	dc.b "vre","v"+$80,"00",-1
	dc.w Synt-Tk,FRev-Tk
	dc.b "re","v"+$80,"00",-1
	dc.w IBSwap-Tk,Synt-Tk
	dc.b "bank swa","p"+$80,"I0,0",-1
	dc.w IAmFront-Tk,Synt-Tk
	dc.b "amos to fron","t"+$80,"I",-1
	dc.w IAmBack-Tk,Synt-Tk
	dc.b "amos to bac","k"+$80,"I",-1
	dc.w Synt-Tk,FAmHere-Tk
	dc.b "amos her","e"+$80,"0",-1
	dc.w AmLock-Tk,Synt-Tk
	dc.b "amos loc","k"+$80,"I",-1
	dc.w AmULock-Tk,Synt-Tk
	dc.b "amos unloc","k"+$80,"I",-1
	dc.w Synt-Tk,FDispH-Tk
	dc.b "display heigh","t"+$80,"0",-1
	dc.w Synt-Tk,FNTSC-Tk
	dc.b "nts","c"+$80,"0",-1
	dc.w Synt-Tk,FLaced-Tk
	dc.b "lace","d"+$80,"0",-1
	dc.w Synt-Tk,FPrgState-Tk
	dc.b "prg stat","e"+$80,"0",-1
	dc.w ICom-Tk,FCom-Tk
	dc.b "command line","$"+$80,"V2",-1
	dc.w Synt-Tk,FDInfo-Tk
	dc.b "disc info","$"+$80,"22",-1
	dc.w 0
