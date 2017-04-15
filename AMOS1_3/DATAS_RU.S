
		Include "Equ.s"

*-----------------------------------------------------------------
*	 **  *    * **** ****    ***    **  **** ***  ***
* 	*  * **  ** *  * *       *  *  *  * *     *  *
* 	**** * ** * *  * ****    ****  **** ****  *  *
* 	*  * *    * *  *    *    *   * *  *    *  *  *  
* 	*  * *    * **** ****    ****  *  * **** ***  ***
*-----------------------------------------------------------------
*	ZONE DE DATAS
*-----------------------------------------------------------------

		dc.l DataLong
ZZ:		ds.b DataLong
		even

*-----------------------------------------------------------------
*	 **  *    * **** ****    ***    **  **** ***  ***
* 	*  * **  ** *  * *       *  *  *  * *     *  *
* 	**** * ** * *  * ****    ****  **** ****  *  *
* 	*  * *    * *  *    *    *   * *  *    *  *  *  
* 	*  * *    * **** ****    ****  *  * **** ***  ***
*-----------------------------------------------------------------
*	POINTEURS SUR DONNEES
*-----------------------------------------------------------------
Mixed:		equ %0100000000000000
Fixed:		equ %0010000000000000
Keys:		equ %0001000000000000
Empty:		equ %0000100000000000

*************** Pointeurs sur messages
AEdMem:		dc.w _EdMem-ZZ,$0001
AEdOm:		dc.w _EdOm-ZZ,$0001
AEdTop:		dc.w _EdTop-ZZ,$0001
AEdBot:		dc.w _EdBot-ZZ,$0001
AEdLLong:	dc.w _EdLLong-ZZ,$0001
AEdTest:	dc.w _EdTest-ZZ,$0001
AEdNoE:		dc.w _EdNoE-ZZ,$0001
AEdInd:		dc.w _EdInd-ZZ,$0001
ANoFold		dc.w _NoFold-ZZ,$0001
ANMark		dc.w _NMark-ZZ,$0001
AWBloc		dc.w _WBloc-ZZ,$0001
ANFound		dc.w _NFound-ZZ,$0001
ASching		dc.w _Sching-ZZ,$0001
AMPAmos		dc.w _MPAmos-ZZ,$0001
AMPlace		dc.w _MPlace-ZZ,$0001
AAvNoProg	dc.w _AvNoProg-ZZ,$0001
AMesNotD:	dc.w _MesNotD-ZZ,$0001
ACloClo:	dc.w _CloClo-ZZ,$0001
AEdDemo:	dc.w _EdDemo-ZZ,$0001

AVIlD:		dc.w _VIlD-ZZ,$0002
AVSynt:		dc.w _VSynt-ZZ,$0002
AVLong:		dc.w _VLong-ZZ,$0002
AVType:		dc.w _VType-ZZ,$0002
AVOut:		dc.w _VOut-ZZ,$0002
AVVNm:		dc.w _VVNm-ZZ,$0002
AVNmO:		dc.w _VNmO-ZZ,$0002
AVNDim:		dc.w _VNDim-ZZ,$0002
AVLbl2:		dc.w _VLbl2-ZZ,$0002
AVUnd:		dc.w _VUnd-ZZ,$0002
AVAlD:		dc.w _VAlD-ZZ,$0002
AVFoN:		dc.w _VFoN-ZZ,$0002
AVNFo:		dc.w _VNFo-ZZ,$0002
AVRUn:		dc.w _VRun-ZZ,$0002
AVUnR:		dc.w _VUnR-ZZ,$0002
AVWWn:		dc.w _VWWn-ZZ,$0002
AVWnW:		dc.w _VWnW-ZZ,$0002
AVDoL:		dc.w _VDoL-ZZ,$0002
AVLDo:		dc.w _VLDo-ZZ,$0002
AVCrs:		dc.w _VCrs-ZZ,$0002
AVNoL:		dc.w _VNoL-ZZ,$0002
AVEIf:		dc.w _VEIf-ZZ,$0002
AVElE:		dc.w _VElE-ZZ,$0002
AVElI:		dc.w _VElI-ZZ,$0002
AVIfE:		dc.w _VIfE-ZZ,$0002
AVNoT:		dc.w _VNoT-ZZ,$0002
AVPDeb:		dc.w _VPDeb-ZZ,$0002
AVPOp:		dc.w _VPOp-ZZ,$0002
AVPNo:		dc.w _VPNo-ZZ,$0002
AVIlP:		dc.w _VIlP-ZZ,$0002
AVPRTy:		dc.w _VPRTy-ZZ,$0002
AVUndP:		dc.w _VUndP-ZZ,$0002
AVShP:		dc.w _VShP-ZZ,$0002
AVAlG:		dc.w _VAlG-ZZ,$0002
AVPaG:		dc.w _VPaG-ZZ,$0002
AVShal:		dc.w _VShal-ZZ,$0002
AVNoPa:		dc.w _VNoPa-ZZ,$0002
AVPaGo:		dc.w _VPaGo-ZZ,$0002
AVVTo:		dc.w _VVTo-ZZ,$0002
AVDal:		dc.w _VDal-ZZ,$0002
AVNoB:		dc.w _VNoB-ZZ,$0002
AVExN:		dc.w _VExN-ZZ,$0002
AVNFn:		dc.w _VNFn-ZZ,$0002
AExtNot:	dc.w _ExtNot-ZZ,$0000

AMErreur:	dc.w _MErreur-ZZ,$8003
ARedo:		dc.w _Redo-ZZ,$0003+Mixed

AExtNames:	dc.w _ExtNames-ZZ,$8004

ASelDrv:	dc.w _SelDrv-ZZ,$0020
ANmPrt:		dc.w _NmPrt-ZZ,$0005
ANmSer:		dc.w _NmSer-ZZ,$0005

AMesLd1:	dc.w _MesLd1-ZZ,$0006+Empty
AMesLd2:	dc.w _MesLd2-ZZ,$0006+Empty
AMesLd3:	dc.w _MesLd3-ZZ,$0006+Empty
AMesMe1:	dc.w _MesMe1-ZZ,$0006+Empty
AMesMe2:	dc.w _MesMe2-ZZ,$0006+Empty
AMesLdA1:	dc.w _MesLdA1-ZZ,$0006+Empty
AMesLdA2:	dc.w _MesLdA2-ZZ,$0006+Empty
AMesLdA3:	dc.w _MesLdA3-ZZ,$0006+Empty
AAvMe:		dc.w _AvMe-ZZ,$0006+Empty
AAvLd:		dc.w _AvLd-ZZ,$0006+Empty
AAvPrt:		dc.w _AvPrt-ZZ,$0006+Empty
AMesSv1:	dc.w _MesSv1-ZZ,$0006+Empty
AMesSv2:	dc.w _MesSv2-ZZ,$0006+Empty
AMesSBl1:	dc.w _MesSBl1-ZZ,$0006+Empty
AMesSBl2:	dc.w _MesSBl2-ZZ,$0006+Empty
AMesSvA1:	dc.w _MesSvA1-ZZ,$0006+Empty
AMesSvA2:	dc.w _MesSvA2-ZZ,$0006+Empty
AMesSvA3:	dc.w _MesSvA3-ZZ,$0006+Empty
AAvSv:		dc.w _AvSv-ZZ,$0006+Empty
AAvSvA:		dc.w _AvSvA-ZZ,$0006+Empty
AMesAc1:	dc.w _MesAc1-ZZ,$0006+Empty
AMesAc2:	dc.w _MesAc2-ZZ,$0006+Empty
AMesAc3:	dc.w _MesAc3-ZZ,$0006+Empty
AMesAn1:	dc.w _MesAn1-ZZ,$0006+Empty
AMesAn2:	dc.w _MesAn2-ZZ,$0006+Empty
AMesAn3:	dc.w _MesAn3-ZZ,$0006+Empty
AMesEd1:	dc.w _MesEd1-ZZ,$0006+Empty
AMesEd2:	dc.w _MesEd2-ZZ,$0006+Empty
AMesEd3:	dc.w _MesEd3-ZZ,$0006+Empty
AMesRn1:	dc.w _MesRn1-ZZ,$0006+Empty
AMesRn2:	dc.w _MesRn2-ZZ,$0006+Empty
AMesRn3:	dc.w _MesRn3-ZZ,$0006+Empty
AAvAccL:	dc.w _AvAccL-ZZ,$0006+Empty

AEdPName:	dc.w _EdPName-ZZ,$0001
AEdLName:	dc.w _EdLName-ZZ,$0001
ASMark:		dc.w _SMark-ZZ,$0001
AEdTSize:	dc.w _EdTSize-ZZ,$0001
AEdTTab:	dc.w _EdTTab-ZZ,$0001
ASchinp:	dc.w _Schinp-ZZ,$0001
ARepinp:	dc.w _Repinp-ZZ,$0001

AFsTxt:		dc.w _FsTxt-ZZ,$800b+Fixed
AFaTxt:		dc.w _FaTxt-ZZ,$800b+Fixed
AFsWait:	dc.w _FsWait-ZZ,$000b
AFsDTit:	dc.w _FsDTit-ZZ,$000b
AFsDirSet:	dc.w _FsDirSet-ZZ,$000b

*************** Messages editeur
AConfYes:	dc.w _ConfYes-ZZ,$0000
AConfNo:	dc.w _ConfNo-ZZ,$0000
AConfConf:	dc.w _ConfConf-ZZ,$0001
AConfSave:	dc.w _ConfSave-ZZ,$0001
AConfText:	dc.w _ConfText-ZZ,$0001
ADispText:	dc.w _DispText-ZZ,$0001

AConfYN:	dc.w _ConfYN-ZZ,$0000+Mixed
AConfYi:	dc.w _ConfYi-ZZ,$0000+Mixed
AConfNi:	dc.w _ConfNi-ZZ,$0000+Mixed

*************** Touches de fonction
AFkDef1:	dc.w _FkDef1-ZZ,$0007+Mixed+Fixed
AFkDef2:	dc.w _FkDef2-ZZ,$0007+Mixed+Fixed
AFkDef3:	dc.w _FkDef3-ZZ,$0007+Mixed+Fixed
AFkDef4:	dc.w _FkDef4-ZZ,$0007+Mixed+Fixed
AFkDef5:	dc.w _FkDef5-ZZ,$0000
AFkIt0:		dc.w _FkIt0-ZZ,$0007+Fixed
AFkIt1:		dc.w _FkIt1-ZZ,$0007+Fixed
AFkLt0:		dc.w _FkLt0-ZZ,$0007+Fixed
AFkLt1:		dc.w _FkLt1-ZZ,$0007+Fixed

*************** Flash curseur
AEdFlCu:	dc.w _EdFlCu-ZZ,$0000
AFolFl:		dc.w _FolFl-ZZ,$0000

*************** Ecrans erreurs
AErrLine:	dc.w _ErrLine-ZZ,$000a
AErrFin:	dc.w _ErrFin-ZZ,$000a+Mixed
AFolI2:		dc.w _FolI2-ZZ,$000a+Mixed

*************** Directory
ADirFilt:	dc.w _DirFilt-ZZ,$0010
AChDir0:	dc.w _ChDir0-ZZ,$000b+Mixed
AChDir1:	dc.w _ChDir1-ZZ,$000b+Mixed
AChDir6:	dc.w _CHDir6-ZZ,$000b+Mixed
AChDir3:	dc.w _ChDir3-ZZ,$000b

*************** Ligne d'etat
AMrgMes		dc.w _MrgMes-ZZ,$0001+Mixed+Fixed
* Caps
AEtCps0:	dc.w _EtCps0-ZZ,$0001+Mixed+Fixed
AEtCps1:	dc.w _EtCps1-ZZ,$0001+Mixed+Fixed
* Insert / OverW
AEtIns0:	dc.w _EtIns0-ZZ,$0001+Mixed+Fixed
AEtIns1:	dc.w _EtIns1-ZZ,$0001+Mixed+Fixed
* Line #
AEtY:		dc.w _EtY-ZZ,$0001+Mixed+Fixed
AEtY1:		dc.w _EtY1-ZZ,$0001+Mixed+Fixed
* Col#
AEtX:		dc.w _EtX-ZZ,$0001+Mixed+Fixed
AEtX1:		dc.w _EtX1-ZZ,$0001+Mixed+Fixed
* Free
AEtFr0:		dc.w _EtFr0-ZZ,$0001+Mixed+Fixed
AEtFr1:		dc.w _EtFr1-ZZ,$0001+Mixed+Fixed
* Chip
AEtCh0:		dc.w _EtCh0-ZZ,$0001+Mixed+Fixed
AEtCh1:		dc.w _EtCh1-ZZ,$0001+Mixed+Fixed
* Fast
AEtFs0:		dc.w _EtFs0-ZZ,$0001+Mixed+Fixed
AEtFs1:		dc.w _EtFs1-ZZ,$0001+Mixed+Fixed
* Editing
AEtNm1:		dc.w _EtNm1-ZZ,$0001+Mixed+Fixed
AEtNm2:		dc.w _EtNm2-ZZ,$0001+Mixed+Fixed

*************** TABLE DES FONCTIONS DE L'EDITEUR
AKFonc:		dc.w _KFonc-ZZ,$000F+Keys

*************** HELP escape
AEscH1:		dc.w _EscH1-ZZ,$000c+Mixed
AEscH2:		dc.w _EscH2-ZZ,$800c+Fixed
	
*************** Touches de fonction ESC par defaut
AAmiDef:	dc.w _AmiDef-ZZ,$800d+Empty

*************** Auto loaded acc
AAutoLd		dc.w _AutoLd-ZZ,$8011+Empty

*************** Help.Acc
ANameHelp	dc.w _NameHelp-ZZ,$0013+Empty
AHelpLoad	dc.w _HelpLoad-ZZ,$0013+Empty
AHNof		dc.w _HNoF-ZZ,$0013

* Pas touche!!!
*************** Entete du basic
AEntete:	dc.w _Entete-ZZ,0
*************** Fenetre FK
AFkFond:	dc.w _FkFond-ZZ,0 
*************** Fenetre edit
AEdClw:		dc.w _EdClw-ZZ,0 
ASlDInit:	dc.w _SlDInit-ZZ,0 
ASlBInit:	dc.w _SlBInit-ZZ,0 
AEdDBloc	dc.w _EdDBloc-ZZ,0 
AEdFBloc	dc.w _EdFBloc-ZZ,0 
*************** Titre du basic
ATitle1:	dc.w _Title1-ZZ,$000e+Mixed+Fixed+Empty
ATitle2:	dc.w _Title2-ZZ,0 
*************** Suffixes
ASufBas:	dc.w _SufBas-ZZ,0 
ASufBak:	dc.w _SufBak-ZZ,0 
ASufAcc:	dc.w _SufAcc-ZZ,0 
AAutoEx:	dc.w _AutoEx-ZZ,0 
*************** Icone par defaut!
ADefIcon	dc.w _DefIcon-ZZ,$0012 
*************** LOGO AMOS
ANMouse:	dc.w _NMouse-ZZ,$0012 
ANFonte:	dc.w _NFonte-ZZ,$0012
*************** CLAVIER PAR DEFAUT
AKyNom:		dc.w _KyNom-ZZ,$0012 
*************** Divers
ACRet:		dc.w _CRet-ZZ,0 
AChCuOn:	dc.w _ChCuOn-ZZ,0 
AChCuOff:	dc.w _ChCuOff-ZZ,0 
AChDir1a:	dc.w _ChDir1A-ZZ,0 
AChDir2:	dc.w _ChDir2-ZZ,0 
AChDir4: 	dc.w _ChDir4-ZZ,0 
AChDir5:	dc.w _ChDir5-ZZ,0 
* Couleur des inputs
AEtInp:		dc.w _EtInp-ZZ,0 
* Effacement de la ligne 
AEtClw:		dc.w _EtClw-ZZ,0 
AEtCuOf		dc.w _EtCuOf-ZZ,0 
* Couleurs du message d'erreur
AEtAl:		dc.w _EtAl-ZZ,0 
*************** Ecran par defaut
ADefEFl:	dc.w _DefEFl-ZZ,0 
*************** Ecran erreurs
AErrIOn:	dc.w _ErrIOn-ZZ,0 
AErrIOff:	dc.w _ErrIOff-ZZ,0 
AErrIci:	dc.w _ErrIci-ZZ,0 
AErrFl:		dc.w _ErrFl-ZZ,0 
*************** Ecran Follow
AFolI1:		dc.w _FolI1-ZZ,0 
AFolI3:		dc.w _FolI3-ZZ,0 
AFolI4:		dc.w _FolI4-ZZ,0 
AFolI5:		dc.w _FolI5-ZZ,0 
***************	Initialise l'ecran ESC - repousse l'editeur
AEscI:		dc.w _EscI-ZZ,0 
AEscOk:		dc.w _EscOk-ZZ,0 
AEscI0:		dc.w _EscI0-ZZ,0 
AEdELi:		dc.w _EdELi-ZZ,0 
AEscH4:		dc.w _EscH4-ZZ,0 
AEscH5:		dc.w _EscH5-ZZ,0 
		dc.w -1,EndPar-ParaTrap


*-----------------------------------------------------------------
*		 **  *    * **** ****    ***    **  **** ***  ***
*	 	*  * **  ** *  * *       *  *  *  * *     *  *
*	 	**** * ** * *  * ****    ****  **** ****  *  *
*	 	*  * *    * *  *    *    *   * *  *    *  *  *  
*	 	*  * *    * **** ****    ****  *  * **** ***  ***
*-----------------------------------------------------------------
*		DONNEES DIVERSES
*-----------------------------------------------------------------

***********************************************************
*		PARAMETRES INITIALISATION ECRANS
ParaTrap:	dc.l 0			* 0 - Adresse actualisation
AdMouse:	dc.l 0			* 4 - Adresse souris
		dc.w 68			* 8 - Nombre de bobs
		dc.w 50			* 10- Position par defaut ecran!!
		dc.l 12000		* 12- Taille liste copper
		dc.l 128		* 16- Nombre lignes sprites

* Taille des buffers 
VNmMax:		dc.l 1024*4		* Buffer des noms de variable
TVDirect:	dc.w 42*6		* Variables mode direct
DefSize:	dc.l 32768		* Taille du buffer texte
Icons:		dc.w 0			* Faire des icons
* Positions ecrans
EdPosY:		dc.w 26+20+57
FkPosY:		dc.w 26+20
FsDWy:		dc.w 50+16
EdTyM0:		dc.w 22
EdTyM1:		dc.w 0
EdTyM2:		dc.w 0
* Directory
DirSize:	dc.w 30
DirMax:		dc.w 128
* Faire des back?
EdSvBak:	dc.w 1
PrtRet:		dc.w 1
* Vitesses ouvertures
FsDVApp:	dc.w 16
EdVScrol:	dc.w 16
EdFsDVApp:	dc.w 16
* Palettes
EdPal:		dc.w $000,$017,$0EC,$C40
FkPal:		dc.w $000,$EEE,$C30,$FF0
FsPal:		dc.w $000,$144,$FEE,$000
EscPal:		dc.w $029,$029,$ECC,$000
ErrPal:		dc.w $920,$FFF,$FF0,$F30
FolPal		dc.w $155,$FFF,$FF0,$F40
EdColB:		dc.w 0	
*************** Autoclose workbench
AutoWB:		dc.w 1
*************** Donnees normalement invariables
EdFsDWx:	dc.w 129+80
EdFsDWy:	dc.w 103
FsDWx:		dc.w 129+80
*************** Position fenetre ESC
EcYErr:		dc.w 26+250
EsWY:		dc.w 26+184
EsWTy:		dc.w 10*8
EsVY:		dc.w (22+1-10)*8		* EdTy
*************** Ecran par defaut
DefETx:		dc.w 320
DefETy:		dc.w 200
DefECo:		dc.w 4
DefECoN:	dc.w 16
DefEMo:		dc.w 0
DefEBa:		dc.w 0
DefEPa:		dc.w $000,$A40,$FFF,$000,$F00,$0F0,$00F,$666
		dc.w $555,$333,$733,$373,$773,$337,$737,$377
		dc.w 0,0,0,0,0,0,0,0
		dc.w 0,0,0,0,0,0,0,0
EndPar:

*-----------------------------------------------------------------
*	 **  *    * **** ****    ***    **  **** ***  ***
* 	*  * **  ** *  * *       *  *  *  * *     *  *
* 	**** * ** * *  * ****    ****  **** ****  *  *
* 	*  * *    * *  *    *    *   * *  *    *  *  *  
* 	*  * *    * **** ****    ****  *  * **** ***  ***
*-----------------------------------------------------------------
*	CHAINES DE CARACTERES MODIFIABLES
*-----------------------------------------------------------------

*************** Messages sous editeur
_EdMem:		dc.b 0
_EdOm:		dc.b 0
_EdTop:		dc.b 0
_EdBot:		dc.b 0
_EdLLong:	dc.b 0
_EdTest:	dc.b 0
_EdNoE:		dc.b 0
_EdInd:		dc.b 0
_NoFold		dc.b 0
_NMark		dc.b 0
_WBloc		dc.b 0
_NFound		dc.b 0
_Sching		dc.b 0
_MPAmos		dc.b 0
_MPlace		dc.b 0
_AvNoProg	dc.b 0
_MesNotD:	dc.b 0
_CloClo:	dc.b 0
_EdDemo:	dc.b 0

******* Messages apres RUN
_VIlD:		dc.b 0
_VSynt:		dc.b 0
_VLong:		dc.b 0
_VType:		dc.b 0
_VOut:		dc.b 0
_VVNm:		dc.b 0
_VNmO:		dc.b 0
_VNDim:		dc.b 0
_VLbl2:		dc.b 0
_VUnd:		dc.b 0
_VAlD:		dc.b 0
_VFoN:		dc.b 0
_VNFo:		dc.b 0
_VRUn:		dc.b 0
_VUnR:		dc.b 0
_VWWn:		dc.b 0
_VWnW:		dc.b 0
_VDoL:		dc.b 0
_VLDo:		dc.b 0
_VCrs:		dc.b 0
_VNoL:		dc.b 0
_VEIf:		dc.b 0
_VElE:		dc.b 0
_VElI:		dc.b 0
_VIfE:		dc.b 0
_VNoT:		dc.b 0
_VPDeb:		dc.b 0
_VPOp:		dc.b 0
_VPNo:		dc.b 0
_VIlP:		dc.b 0
*_VPTy:		dc.b 0
_VPRTy:		dc.b 0
_VUndP:		dc.b 0
_VShP:		dc.b 0
_VAlG:		dc.b 0
_VPaG:		dc.b 0
_VShal:		dc.b 0
_VNoPa:		dc.b 0
_VPaGo:		dc.b 0
_VVTo:		dc.b 0
_VDal:		dc.b 0
_VNoB:		dc.b 0
_VExN:		dc.b 0
_VNFn:		dc.b 0
_ExtNot:	dc.b 0
		dc.b " "+$80,0
_MErreur:
******* Messages d'erreur RUN-TIME
* 0-19 FATALS
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
* NbEnd	equ 10
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0						-18-
	dc.b 0						-19-
* 20- Messages normaux
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
* Messages d'erreur ecrans/fenetres
*EcEBase	equ 45
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
* Messages d'erreur disque
*DEBase	equ EcEBase+35-1
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
* Message d'erreur sprites/souris
*SpEBase equ DEBase+25
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0
	dc.b 0,0,0,0,0,0,0,0					
	dc.b -1

*************** Input
_Redo:		dc.b 13,10,"Please redo from start",13,10,0

*************** 26 EXTENSIONS A CHARGER
_ExtNames:	dc.b ":AMOS_System/Music",0
		dc.b ":AMOS_System/Compact",0
		dc.b ":AMOS_System/Request",0
		dc.b 0
		dc.b 0,0,0,0,0,0
		dc.b 0,0,0,0,0,0,0,0,0,0
		dc.b 0,0,0,0,0,0
		dc.b -1

*************** DRIVES RECONNUS
_SelDrv:	dc.b 0
_NmPrt:		dc.b "Par:",0
_NmSer:		dc.b "Aux:",0

*************** Differents messages
_MesLd1:	dc.b 0
_MesLd2:	dc.b 0
_MesLd3:	dc.b 0
_MesMe1:	dc.b 0
_MesMe2:	dc.b 0
_MesLdA1:	dc.b 0
_MesLdA2:	dc.b 0
_MesLdA3:	dc.b 0
_AvMe:		dc.b 0
_AvLd:		dc.b 0
_AvPrt:		dc.b 0
_MesSv1:	dc.b 0
_MesSv2:	dc.b 0
_MesSBl1:	dc.b 0
_MesSBl2:	dc.b 0
_MesSvA1:	dc.b 0
_MesSvA2:	dc.b 0
_MesSvA3:	dc.b 0
_AvSv:		dc.b 0
_AvSvA:		dc.b 0
_MesAc1:	dc.b 0
_MesAc2:	dc.b 0
_MesAc3:	dc.b 0
_MesAn1:	dc.b 0
_MesAn2:	dc.b 0
_MesAn3:	dc.b 0
_MesEd1:	dc.b 0
_MesEd2:	dc.b 0
_MesEd3:	dc.b 0
_MesRn1:	dc.b 0
_MesRn2:	dc.b 0
_MesRn3:	dc.b 0
_AvAccL:	dc.b 0

_EdPName:	dc.b 0
_EdLName:	dc.b 0
_SMark:		dc.b 0
_EdTSize:	dc.b 0
_EdTTab:	dc.b 0
_Schinp:	dc.b 0
_Repinp:	dc.b 0

_FsTxt:		dc.b 155,156,0
		dc.b "   Ok   ",0
		dc.b "  Quit  ",0
		dc.b "  Sort  ",0
		dc.b " SetDir ",0
		dc.b 147,148,0
		dc.b 149,150,0
		dc.b 0,0,0,0	
		dc.b -1
_FaTxt:		dc.b 155,156,0
		dc.b "   Ok   ",0
		dc.b "  Quit  ",0
		dc.b "  Sort  ",0
		dc.b "  All   ",0
		dc.b 147,148,0
		dc.b 149,150,0
		dc.b 0,0,0,0	
		dc.b -1
_FsWait:	dc.b "Reading directory",0
_FsDTit:	dc.b "File selector",0
_FsDirSet:	dc.b "Directory changed!",0

*************** Messages editeur
_ConfYes:	dc.b 0
_ConfNo:	dc.b 0
_ConfConf:	dc.b 0
_ConfSave:	dc.b 0
_ConfText:	dc.b 0
_DispText:	dc.b 0

_ConfYN:	dc.b 27,"P3 (",27,"P1",27,"I",0
_ConfYi:	dc.b "0",27,"Z0 Yes ",27,"Z1",27,"P3or",27,"P1",27,"I",0
_ConfNi:	dc.b "0",27,"Z0 No ",27,"Z2",27,"P3)",0

_EdFlCu:	dc.b "(000,2)(440,2)(880,2)(bb0,2)(dd0,2)(ee0,2)(ff2,2)(ff8,2)"
		dc.b "(ffc,2)(fff,2)(aaf,2)(88c,2)(66a,2)(226,2)(004,2)(001,2)",0
_FolFl:		dc.b 0

*************** Touches de fonction
_FkDef1:	dc.b 0
_FkDef2:	dc.b 0
_FkDef3:	dc.b 0
_FkDef4:	dc.b 0
_FkDef5:	dc.b 0
*FkLong:		equ 26

*************** Insert / OverW
_FkIt0:		dc.b 0
_FkIt1:		dc.b 0
* Lower / upper
_FkLt0:		dc.b 0
_FkLt1:		dc.b 0

*************** Ecran erreurs
_ErrLine:	dc.b 0
_ErrFin:	dc.b 0
*************** Ecran Follow
_FolI2:		dc.b 27,"P2 Follow mode - Press SPACE for next instruction "
		dc.b 27,"B0",27,"P1",13,10,0
*************** Directory
_DirFilt:	dc.b ".info/*.info/*.*.info",0
_ChDir0:	dc.b 13,10,"Directory of ",0
_ChDir1:	dc.b 13,10,"One moment please...",0
_ChDir6:	dc.b " total bytes listed.",13,10,0
_ChDir3:	dc.b "* ",0

*************** Ligne d'etat
_MrgMes		dc.b 0
* Caps
_EtCps0:	dc.b 0
_EtCps1:	dc.b 0
* Insert / OverW
_EtIns0:	dc.b 0
_EtIns1:	dc.b 0
* Line #
_EtY:		dc.b 0
_EtY1:		dc.b 0
* Col#
_EtX:		dc.b 0
_EtX1:		dc.b 0
* Free
_EtFr0:		dc.b 0
_EtFr1:		dc.b 0
* Chip
_EtCh0:		dc.b 0
_EtCh1:		dc.b 0
* Fast
_EtFs0:		dc.b 0
_EtFs1:		dc.b 0
* Editing
_EtNm1:		dc.b 0
_EtNm2:		dc.b 0

*************** HELP escape
_EscH1:		dc.b 0
_EscH2:		dc.b 0
		dc.b -1
	
*************** Touches de fonction ESC par defaut
_AmiDef:	dc.b 'ListBank`',0
		dc.b 'Default`',0
		dc.b 'Dir`',0
		dc.b 'Dir$="',0
		dc.b 'Parent`',0
		dc.b 'Load Fsel$("*.Abk")',0
		dc.b 'Save Fsel$("*.Abk")',0
		dc.b 'Load Iff "',0
		dc.b 'Save Iff "',0
		dc.b '? Fsel$("**")`',0
		dc.b "Screen Close ",0
		dc.b "Screen Open ",0
		dc.b "Wind Open ",0
		dc.b "Wind Close`",0
		dc.b "Bob Off:Sprite Off`",0
		dc.b "Freeze`",0
		dc.b "UnFreeze`",0
		dc.b "Amal Off`",0
		dc.b "Edit`",0
		dc.b "System",0
		dc.b -1

************** Accessoires autoload
_AutoLd		dc.b 0
		dc.b -1
************** Accessoire HELP
_NameHelp	dc.b 0
_HelpLoad	dc.b 0
_HNoF		dc.b 0

************** TABLE DES FONCTIONS DE L'EDITEUR
_KFonc:		dc.b 0

*************** Entete du basic
_Entete:	dc.b "AMOS Basic V1.00",0
*************** Fenetre FK
_FkFond:	dc.b 0
*************** Fenetre edit
_EdClw:		dc.b 0
_SlDInit:	dc.b 0
_SlBInit:	dc.b 0
_EdDBloc	dc.b 0
_EdFBloc	dc.b 0
*************** Titre du basic
_Title1:	dc.b 0
_Title2:	dc.b 0
*************** Suffixes
_SufBas:	dc.b ".AMOS",0
_SufBak:	dc.b ".Bak",0
_SufAcc:	dc.b "*.Acc",0
_AutoEx:	dc.b "AutoExec.AMOS",0
*************** Icone par defaut!
_DefIcon	dc.b ":AMOS_System/Def_Icon",0
*************** LOGO AMOS
_NMouse:	dc.b ":AMOS_System/Mouse.Abk",0
_NFonte:	dc.b ":AMOS_System/Default.Font",0
*************** CLAVIER PAR DEFAUT
_KyNom:		dc.b ":AMOS_System/Default.Key",0
*************** Divers
_CRet:		dc.b 13,10,0
_ChCuOn:	dc.b 27,"C1",0
_ChCuOff:	dc.b 27,"C0",0
_ChDir1a:	dc.b 26,13,0
_ChDir2:	dc.b " ",0
_ChDir4: 	dc.b "  ",0
_ChDir5:	dc.b " ",0
* Couleur des inputs
_EtInp:		dc.b 27,"P1",0 
* Effacement de la ligne 
_EtClw:		dc.b 27,"X1",27,"Y5",27,"B0",27,"Q",48+78,27,"B0",27,"P3",0
_EtCuOf		dc.b 27,"C0",0
* Couleurs du message d'erreur
_EtAl:		dc.b 27,"X1",27,"Y5",27,"B2",27,"Q",48+78,27,"P3",0
*************** Ecran par defaut
_DefEFl:	dc.b "(000,2)(440,2)(880,2)(bb0,2)(dd0,2)(ee0,2)(ff2,2)(ff8,2)"
		dc.b "(ffc,2)(fff,2)(aaf,2)(88c,2)(66a,2)(226,2)(004,2)(001,2)",0
*************** Ecran erreurs
_ErrIOn:	dc.b 27,"C0",27,"B0",25,27,"B3",26,27,"P2",0
_ErrIOff:	dc.b 27,"B0",27,"P1",13,10,0
_ErrIci:	dc.b 27,"P2",">>> ",27,"P1",0
_ErrFl:		dc.b "(000,4)(300,4)(610,4)(910,4)(c20,4)(e20,4)(f30,4)"
		dc.b "(e20,4)(c20,4)(910,4)(610,4)(300,4)",0
*************** Ecran Follow
_FolI1:		dc.b 27,"C0",27,"B0",25,27,"B3",7,0
_FolI3:		dc.b 13,10,27,"P2- ",27,"P1",0
_FolI4:		dc.b " =",0
_FolI5:		dc.b 13,10,0
***************	Initialise l'ecran ESC - repousse l'editeur
_EscI:		dc.b 0
_EscOk:		dc.b 0
_EscI0:		dc.b 0
_EdELi:		dc.b 0
_EscH4:		dc.b 0
_EscH5:		dc.b 0
		even
