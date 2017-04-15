*
		INCDIR	":AMOS.s/Common/"
		Include	"_Equ.s"
		RsSet	DataLong
		Include "_Pointe.s"
*
		Include	"_WEqu.s"
		Include "_CEqu.s"
*
CDebug		set	0
*
DosCall	MACRO
	movem.l	a1-a2/a6/d1-d2,-(sp)
	move.l	DosBase(a5),a6
	jsr	\1(a6)
	movem.l	(sp)+,a1-a2/a6/d1-d2
	ENDM

;---------------------------------------------------------------------
;   ***  ***  **   ** ****  **** **    **    **   **   **  ***   ***
;  **   ** ** *** *** ** **  **  **    **   ****  *** *** ** ** ** 
;  **   ** ** ** * ** ** **  **  **   **   **  ** ** * ** ** **  ***
;  **   ** ** **   ** ****   **  **        ****** **   ** ** **    **
;  **   ** ** **   ** **     **  **        **  ** **   ** ** ** *  **
;   ***  ***  **   ** **    **** ****      **  ** **   **  ***   ***
;---------------------------------------------------------------------
; LIBRAIRIE PRINCIPALE, V1.36 - 29/01/1993
;---------------------------------------------------------------------
; Modif to 1.12/1.1
;	-Priority Reverse Off
;	- Title Bottom
; 	- Screen open HAM
;	- =disc info("path:")
;	- Menu Key +shifts
;	- On Menu Proc bug, cf Gary's WP
;	- Fill dev aussi DF0
;	- Copy impaire...
;	- Out of Variable space
;	- Forbid / Permit pour EXIST et DRIVE
;---------------------------------------------------------------------
	dc.l	C_Tk-C_Off
	dc.l	C_Lib-C_Tk
	dc.l	0
	dc.l	0
	dc.w	0
;---------------------------------------------------------------------
C_Off   dc.w (L1-L0)/2,(L2-L1)/2,(L3-L2)/2,(L4-L3)/2
        dc.w (L5-L4)/2,(L6-L5)/2,(L7-L6)/2,(L8-L7)/2
        dc.w (L9-L8)/2,(L10-L9)/2,(L11-L10)/2,(L12-L11)/2
        dc.w (L13-L12)/2,(L14-L13)/2,(L15-L14)/2,(L16-L15)/2
        dc.w (L17-L16)/2,(L18-L17)/2,(L19-L18)/2,(L20-L19)/2
        dc.w (L21-L20)/2,(L22-L21)/2,(L23-L22)/2,(L24-L23)/2
        dc.w (L25-L24)/2,(L26-L25)/2,(L27-L26)/2,(L28-L27)/2
        dc.w (L29-L28)/2,(L30-L29)/2,(L31-L30)/2,(L32-L31)/2
        dc.w (L33-L32)/2,(L34-L33)/2,(L35-L34)/2,(L36-L35)/2
        dc.w (L37-L36)/2,(L38-L37)/2,(L39-L38)/2,(L40-L39)/2
        dc.w (L41-L40)/2,(L42-L41)/2,(L43-L42)/2,(L44-L43)/2
        dc.w (L45-L44)/2,(L46-L45)/2,(L47-L46)/2,(L48-L47)/2
        dc.w (L49-L48)/2,(L50-L49)/2,(L51-L50)/2,(L52-L51)/2
        dc.w (L53-L52)/2,(L54-L53)/2,(L55-L54)/2,(L56-L55)/2
        dc.w (L57-L56)/2,(L58-L57)/2,(L59-L58)/2,(L60-L59)/2
        dc.w (L61-L60)/2,(L62-L61)/2,(L63-L62)/2,(L64-L63)/2
        dc.w (L65-L64)/2,(L66-L65)/2,(L67-L66)/2,(L68-L67)/2
        dc.w (L69-L68)/2,(L70-L69)/2,(L71-L70)/2,(L72-L71)/2
        dc.w (L73-L72)/2,(L74-L73)/2,(L75-L74)/2,(L76-L75)/2
        dc.w (L77-L76)/2,(L78-L77)/2,(L79-L78)/2,(L80-L79)/2
        dc.w (L81-L80)/2,(L82-L81)/2,(L83-L82)/2,(L84-L83)/2
        dc.w (L85-L84)/2,(L86-L85)/2,(L87-L86)/2,(L88-L87)/2
        dc.w (L89-L88)/2,(L90-L89)/2,(L91-L90)/2,(L92-L91)/2
        dc.w (L93-L92)/2,(L94-L93)/2,(L95-L94)/2,(L96-L95)/2
        dc.w (L97-L96)/2,(L98-L97)/2,(L99-L98)/2,(L100-L99)/2
        dc.w (L101-L100)/2,(L102-L101)/2,(L103-L102)/2,(L104-L103)/2
        dc.w (L105-L104)/2,(L106-L105)/2,(L107-L106)/2,(L108-L107)/2
        dc.w (L109-L108)/2,(L110-L109)/2,(L111-L110)/2,(L112-L111)/2
        dc.w (L113-L112)/2,(L114-L113)/2,(L115-L114)/2,(L116-L115)/2
        dc.w (L117-L116)/2,(L118-L117)/2,(L119-L118)/2,(L120-L119)/2
        dc.w (L121-L120)/2,(L122-L121)/2,(L123-L122)/2,(L124-L123)/2
        dc.w (L125-L124)/2,(L126-L125)/2,(L127-L126)/2,(L128-L127)/2
        dc.w (L129-L128)/2,(L130-L129)/2,(L131-L130)/2,(L132-L131)/2
        dc.w (L133-L132)/2,(L134-L133)/2,(L135-L134)/2,(L136-L135)/2
        dc.w (L137-L136)/2,(L138-L137)/2,(L139-L138)/2,(L140-L139)/2
        dc.w (L141-L140)/2,(L142-L141)/2,(L143-L142)/2,(L144-L143)/2
        dc.w (L145-L144)/2,(L146-L145)/2,(L147-L146)/2,(L148-L147)/2
        dc.w (L149-L148)/2,(L150-L149)/2,(L151-L150)/2,(L152-L151)/2
        dc.w (L153-L152)/2,(L154-L153)/2,(L155-L154)/2,(L156-L155)/2
        dc.w (L157-L156)/2,(L158-L157)/2,(L159-L158)/2,(L160-L159)/2
        dc.w (L161-L160)/2,(L162-L161)/2,(L163-L162)/2,(L164-L163)/2
        dc.w (L165-L164)/2,(L166-L165)/2,(L167-L166)/2,(L168-L167)/2
        dc.w (L169-L168)/2,(L170-L169)/2,(L171-L170)/2,(L172-L171)/2
        dc.w (L173-L172)/2,(L174-L173)/2,(L175-L174)/2,(L176-L175)/2
        dc.w (L177-L176)/2,(L178-L177)/2,(L179-L178)/2,(L180-L179)/2
        dc.w (L181-L180)/2,(L182-L181)/2,(L183-L182)/2,(L184-L183)/2
        dc.w (L185-L184)/2,(L186-L185)/2,(L187-L186)/2,(L188-L187)/2
        dc.w (L189-L188)/2,(L190-L189)/2,(L191-L190)/2,(L192-L191)/2
        dc.w (L193-L192)/2,(L194-L193)/2,(L195-L194)/2,(L196-L195)/2
        dc.w (L197-L196)/2,(L198-L197)/2,(L199-L198)/2,(L200-L199)/2
        dc.w (L201-L200)/2,(L202-L201)/2,(L203-L202)/2,(L204-L203)/2
        dc.w (L205-L204)/2,(L206-L205)/2,(L207-L206)/2,(L208-L207)/2
        dc.w (L209-L208)/2,(L210-L209)/2,(L211-L210)/2,(L212-L211)/2
        dc.w (L213-L212)/2,(L214-L213)/2,(L215-L214)/2,(L216-L215)/2
        dc.w (L217-L216)/2,(L218-L217)/2,(L219-L218)/2,(L220-L219)/2
        dc.w (L221-L220)/2,(L222-L221)/2,(L223-L222)/2,(L224-L223)/2
        dc.w (L225-L224)/2,(L226-L225)/2,(L227-L226)/2,(L228-L227)/2
        dc.w (L229-L228)/2,(L230-L229)/2,(L231-L230)/2,(L232-L231)/2
        dc.w (L233-L232)/2,(L234-L233)/2,(L235-L234)/2,(L236-L235)/2
        dc.w (L237-L236)/2,(L238-L237)/2,(L239-L238)/2,(L240-L239)/2
        dc.w (L241-L240)/2,(L242-L241)/2,(L243-L242)/2,(L244-L243)/2
        dc.w (L245-L244)/2,(L246-L245)/2,(L247-L246)/2,(L248-L247)/2
        dc.w (L249-L248)/2,(L250-L249)/2,(L251-L250)/2,(L252-L251)/2
        dc.w (L253-L252)/2,(L254-L253)/2,(L255-L254)/2,(L256-L255)/2
        dc.w (L257-L256)/2,(L258-L257)/2,(L259-L258)/2,(L260-L259)/2
        dc.w (L261-L260)/2,(L262-L261)/2,(L263-L262)/2,(L264-L263)/2
        dc.w (L265-L264)/2,(L266-L265)/2,(L267-L266)/2,(L268-L267)/2
        dc.w (L269-L268)/2,(L270-L269)/2,(L271-L270)/2,(L272-L271)/2
        dc.w (L273-L272)/2,(L274-L273)/2,(L275-L274)/2,(L276-L275)/2
        dc.w (L277-L276)/2,(L278-L277)/2,(L279-L278)/2,(L280-L279)/2
        dc.w (L281-L280)/2,(L282-L281)/2,(L283-L282)/2,(L284-L283)/2
        dc.w (L285-L284)/2,(L286-L285)/2,(L287-L286)/2,(L288-L287)/2
        dc.w (L289-L288)/2,(L290-L289)/2,(L291-L290)/2,(L292-L291)/2
        dc.w (L293-L292)/2,(L294-L293)/2,(L295-L294)/2,(L296-L295)/2
        dc.w (L297-L296)/2,(L298-L297)/2,(L299-L298)/2,(L300-L299)/2
        dc.w (L301-L300)/2,(L302-L301)/2,(L303-L302)/2,(L304-L303)/2
        dc.w (L305-L304)/2,(L306-L305)/2,(L307-L306)/2,(L308-L307)/2
        dc.w (L309-L308)/2,(L310-L309)/2,(L311-L310)/2,(L312-L311)/2
        dc.w (L313-L312)/2,(L314-L313)/2,(L315-L314)/2,(L316-L315)/2
        dc.w (L317-L316)/2,(L318-L317)/2,(L319-L318)/2,(L320-L319)/2
        dc.w (L321-L320)/2,(L322-L321)/2,(L323-L322)/2,(L324-L323)/2
        dc.w (L325-L324)/2,(L326-L325)/2,(L327-L326)/2,(L328-L327)/2
        dc.w (L329-L328)/2,(L330-L329)/2,(L331-L330)/2,(L332-L331)/2
        dc.w (L333-L332)/2,(L334-L333)/2,(L335-L334)/2,(L336-L335)/2
        dc.w (L337-L336)/2,(L338-L337)/2,(L339-L338)/2,(L340-L339)/2
        dc.w (L341-L340)/2,(L342-L341)/2,(L343-L342)/2,(L344-L343)/2
        dc.w (L345-L344)/2,(L346-L345)/2,(L347-L346)/2,(L348-L347)/2
        dc.w (L349-L348)/2,(L350-L349)/2,(L351-L350)/2,(L352-L351)/2
        dc.w (L353-L352)/2,(L354-L353)/2,(L355-L354)/2,(L356-L355)/2
        dc.w (L357-L356)/2,(L358-L357)/2,(L359-L358)/2,(L360-L359)/2
        dc.w (L361-L360)/2,(L362-L361)/2,(L363-L362)/2,(L364-L363)/2
        dc.w (L365-L364)/2,(L366-L365)/2,(L367-L366)/2,(L368-L367)/2
        dc.w (L369-L368)/2,(L370-L369)/2,(L371-L370)/2,(L372-L371)/2
        dc.w (L373-L372)/2,(L374-L373)/2,(L375-L374)/2,(L376-L375)/2
        dc.w (L377-L376)/2,(L378-L377)/2,(L379-L378)/2,(L380-L379)/2
        dc.w (L381-L380)/2,(L382-L381)/2,(L383-L382)/2,(L384-L383)/2
        dc.w (L385-L384)/2,(L386-L385)/2,(L387-L386)/2,(L388-L387)/2
        dc.w (L389-L388)/2,(L390-L389)/2,(L391-L390)/2,(L392-L391)/2
        dc.w (L393-L392)/2,(L394-L393)/2,(L395-L394)/2,(L396-L395)/2
        dc.w (L397-L396)/2,(L398-L397)/2,(L399-L398)/2,(L400-L399)/2
        dc.w (L401-L400)/2,(L402-L401)/2,(L403-L402)/2,(L404-L403)/2
        dc.w (L405-L404)/2,(L406-L405)/2,(L407-L406)/2,(L408-L407)/2
        dc.w (L409-L408)/2,(L410-L409)/2,(L411-L410)/2,(L412-L411)/2
        dc.w (L413-L412)/2,(L414-L413)/2,(L415-L414)/2,(L416-L415)/2
        dc.w (L417-L416)/2,(L418-L417)/2,(L419-L418)/2,(L420-L419)/2
        dc.w (L421-L420)/2,(L422-L421)/2,(L423-L422)/2,(L424-L423)/2
        dc.w (L425-L424)/2,(L426-L425)/2,(L427-L426)/2,(L428-L427)/2
        dc.w (L429-L428)/2,(L430-L429)/2,(L431-L430)/2,(L432-L431)/2
        dc.w (L433-L432)/2,(L434-L433)/2,(L435-L434)/2,(L436-L435)/2
        dc.w (L437-L436)/2,(L438-L437)/2,(L439-L438)/2,(L440-L439)/2
        dc.w (L441-L440)/2,(L442-L441)/2,(L443-L442)/2,(L444-L443)/2
        dc.w (L445-L444)/2,(L446-L445)/2,(L447-L446)/2,(L448-L447)/2
        dc.w (L449-L448)/2,(L450-L449)/2,(L451-L450)/2,(L452-L451)/2
        dc.w (L453-L452)/2,(L454-L453)/2,(L455-L454)/2,(L456-L455)/2
        dc.w (L457-L456)/2,(L458-L457)/2,(L459-L458)/2,(L460-L459)/2
        dc.w (L461-L460)/2,(L462-L461)/2,(L463-L462)/2,(L464-L463)/2
        dc.w (L465-L464)/2,(L466-L465)/2,(L467-L466)/2,(L468-L467)/2
        dc.w (L469-L468)/2,(L470-L469)/2,(L471-L470)/2,(L472-L471)/2
        dc.w (L473-L472)/2,(L474-L473)/2,(L475-L474)/2,(L476-L475)/2
        dc.w (L477-L476)/2,(L478-L477)/2,(L479-L478)/2,(L480-L479)/2
        dc.w (L481-L480)/2,(L482-L481)/2,(L483-L482)/2,(L484-L483)/2
        dc.w (L485-L484)/2,(L486-L485)/2,(L487-L486)/2,(L488-L487)/2
        dc.w (L489-L488)/2,(L490-L489)/2,(L491-L490)/2,(L492-L491)/2
        dc.w (L493-L492)/2,(L494-L493)/2,(L495-L494)/2,(L496-L495)/2
        dc.w (L497-L496)/2,(L498-L497)/2,(L499-L498)/2,(L500-L499)/2
        dc.w (L501-L500)/2,(L502-L501)/2,(L503-L502)/2,(L504-L503)/2
        dc.w (L505-L504)/2,(L506-L505)/2,(L507-L506)/2,(L508-L507)/2
        dc.w (L509-L508)/2,(L510-L509)/2,(L511-L510)/2,(L512-L511)/2
        dc.w (L513-L512)/2,(L514-L513)/2,(L515-L514)/2,(L516-L515)/2
        dc.w (L517-L516)/2,(L518-L517)/2,(L519-L518)/2,(L520-L519)/2
        dc.w (L521-L520)/2,(L522-L521)/2,(L523-L522)/2,(L524-L523)/2
        dc.w (L525-L524)/2,(L526-L525)/2,(L527-L526)/2,(L528-L527)/2
        dc.w (L529-L528)/2,(L530-L529)/2,(L531-L530)/2,(L532-L531)/2
        dc.w (L533-L532)/2,(L534-L533)/2,(L535-L534)/2,(L536-L535)/2
        dc.w (L537-L536)/2,(L538-L537)/2,(L539-L538)/2,(L540-L539)/2
        dc.w (L541-L540)/2,(L542-L541)/2,(L543-L542)/2,(L544-L543)/2
        dc.w (L545-L544)/2,(L546-L545)/2,(L547-L546)/2,(L548-L547)/2
        dc.w (L549-L548)/2,(L550-L549)/2,(L551-L550)/2,(L552-L551)/2
        dc.w (L553-L552)/2,(L554-L553)/2,(L555-L554)/2,(L556-L555)/2
        dc.w (L557-L556)/2,(L558-L557)/2,(L559-L558)/2,(L560-L559)/2
        dc.w (L561-L560)/2,(L562-L561)/2,(L563-L562)/2,(L564-L563)/2
        dc.w (L565-L564)/2,(L566-L565)/2,(L567-L566)/2,(L568-L567)/2
        dc.w (L569-L568)/2,(L570-L569)/2,(L571-L570)/2,(L572-L571)/2
        dc.w (L573-L572)/2,(L574-L573)/2,(L575-L574)/2,(L576-L575)/2
        dc.w (L577-L576)/2,(L578-L577)/2,(L579-L578)/2,(L580-L579)/2
        dc.w (L581-L580)/2,(L582-L581)/2,(L583-L582)/2,(L584-L583)/2
        dc.w (L585-L584)/2,(L586-L585)/2,(L587-L586)/2,(L588-L587)/2
        dc.w (L589-L588)/2,(L590-L589)/2,(L591-L590)/2,(L592-L591)/2
        dc.w (L593-L592)/2,(L594-L593)/2,(L595-L594)/2,(L596-L595)/2
        dc.w (L597-L596)/2,(L598-L597)/2,(L599-L598)/2,(L600-L599)/2
        dc.w (L601-L600)/2,(L602-L601)/2,(L603-L602)/2,(L604-L603)/2
        dc.w (L605-L604)/2,(L606-L605)/2,(L607-L606)/2,(L608-L607)/2
        dc.w (L609-L608)/2,(L610-L609)/2,(L611-L610)/2,(L612-L611)/2
        dc.w (L613-L612)/2,(L614-L613)/2,(L615-L614)/2,(L616-L615)/2
        dc.w (L617-L616)/2,(L618-L617)/2,(L619-L618)/2,(L620-L619)/2
        dc.w (L621-L620)/2,(L622-L621)/2,(L623-L622)/2,(L624-L623)/2
        dc.w (L625-L624)/2,(L626-L625)/2,(L627-L626)/2,(L628-L627)/2
        dc.w (L629-L628)/2,(L630-L629)/2,(L631-L630)/2,(L632-L631)/2
        dc.w (L633-L632)/2,(L634-L633)/2,(L635-L634)/2,(L636-L635)/2
        dc.w (L637-L636)/2,(L638-L637)/2,(L639-L638)/2,(L640-L639)/2
        dc.w (L641-L640)/2,(L642-L641)/2,(L643-L642)/2,(L644-L643)/2
        dc.w (L645-L644)/2,(L646-L645)/2,(L647-L646)/2,(L648-L647)/2
        dc.w (L649-L648)/2,(L650-L649)/2,(L651-L650)/2,(L652-L651)/2
        dc.w (L653-L652)/2,(L654-L653)/2,(L655-L654)/2,(L656-L655)/2
        dc.w (L657-L656)/2,(L658-L657)/2,(L659-L658)/2,(L660-L659)/2
        dc.w (L661-L660)/2,(L662-L661)/2,(L663-L662)/2,(L664-L663)/2
        dc.w (L665-L664)/2,(L666-L665)/2,(L667-L666)/2,(L668-L667)/2
        dc.w (L669-L668)/2,(L670-L669)/2,(L671-L670)/2,(L672-L671)/2
        dc.w (L673-L672)/2,(L674-L673)/2,(L675-L674)/2,(L676-L675)/2
        dc.w (L677-L676)/2,(L678-L677)/2,(L679-L678)/2,(L680-L679)/2
        dc.w (L681-L680)/2,(L682-L681)/2,(L683-L682)/2,(L684-L683)/2
        dc.w (L685-L684)/2,(L686-L685)/2,(L687-L686)/2,(L688-L687)/2
        dc.w (L689-L688)/2,(L690-L689)/2,(L691-L690)/2,(L692-L691)/2
        dc.w (L693-L692)/2,(L694-L693)/2,(L695-L694)/2,(L696-L695)/2
        dc.w (L697-L696)/2,(L698-L697)/2,(L699-L698)/2,(L700-L699)/2
        dc.w (L701-L700)/2,(L702-L701)/2,(L703-L702)/2,(L704-L703)/2
        dc.w (L705-L704)/2,(L706-L705)/2,(L707-L706)/2,(L708-L707)/2
        dc.w (L709-L708)/2,(L710-L709)/2,(L711-L710)/2,(L712-L711)/2
        dc.w (L713-L712)/2,(L714-L713)/2,(L715-L714)/2,(L716-L715)/2
        dc.w (L717-L716)/2,(L718-L717)/2,(L719-L718)/2,(L720-L719)/2
        dc.w (L721-L720)/2,(L722-L721)/2,(L723-L722)/2,(L724-L723)/2
        dc.w (L725-L724)/2,(L726-L725)/2,(L727-L726)/2,(L728-L727)/2
        dc.w (L729-L728)/2,(L730-L729)/2,(L731-L730)/2,(L732-L731)/2
        dc.w (L733-L732)/2,(L734-L733)/2,(L735-L734)/2,(L736-L735)/2
        dc.w (L737-L736)/2,(L738-L737)/2,(L739-L738)/2,(L740-L739)/2
        dc.w (L741-L740)/2,(L742-L741)/2,(L743-L742)/2,(L744-L743)/2
        dc.w (L745-L744)/2,(L746-L745)/2,(L747-L746)/2,(L748-L747)/2
        dc.w (L749-L748)/2,(L750-L749)/2,(L751-L750)/2,(L752-L751)/2
        dc.w (L753-L752)/2,(L754-L753)/2,(L755-L754)/2,(L756-L755)/2
        dc.w (L757-L756)/2,(L758-L757)/2,(L759-L758)/2,(L760-L759)/2
        dc.w (L761-L760)/2,(L762-L761)/2,(L763-L762)/2,(L764-L763)/2
        dc.w (L765-L764)/2,(L766-L765)/2,(L767-L766)/2,(L768-L767)/2
        dc.w (L769-L768)/2,(L770-L769)/2,(L771-L770)/2,(L772-L771)/2
        dc.w (L773-L772)/2,(L774-L773)/2,(L775-L774)/2,(L776-L775)/2
        dc.w (L777-L776)/2,(L778-L777)/2,(L779-L778)/2,(L780-L779)/2
        dc.w (L781-L780)/2,(L782-L781)/2,(L783-L782)/2,(L784-L783)/2
        dc.w (L785-L784)/2,(L786-L785)/2,(L787-L786)/2,(L788-L787)/2
        dc.w (L789-L788)/2,(L790-L789)/2,(L791-L790)/2,(L792-L791)/2
        dc.w (L793-L792)/2,(L794-L793)/2,(L795-L794)/2,(L796-L795)/2
        dc.w (L797-L796)/2,(L798-L797)/2,(L799-L798)/2,(L800-L799)/2
        dc.w (L801-L800)/2,(L802-L801)/2,(L803-L802)/2,(L804-L803)/2
        dc.w (L805-L804)/2,(L806-L805)/2,(L807-L806)/2,(L808-L807)/2
        dc.w (L809-L808)/2,(L810-L809)/2,(L811-L810)/2,(L812-L811)/2
        dc.w (L813-L812)/2,(L814-L813)/2,(L815-L814)/2,(L816-L815)/2
        dc.w (L817-L816)/2,(L818-L817)/2,(L819-L818)/2,(L820-L819)/2
        dc.w (L821-L820)/2,(L822-L821)/2,(L823-L822)/2,(L824-L823)/2
        dc.w (L825-L824)/2,(L826-L825)/2,(L827-L826)/2,(L828-L827)/2
        dc.w (L829-L828)/2,(L830-L829)/2,(L831-L830)/2,(L832-L831)/2
        dc.w (L833-L832)/2,(L834-L833)/2,(L835-L834)/2,(L836-L835)/2
        dc.w (L837-L836)/2,(L838-L837)/2,(L839-L838)/2,(L840-L839)/2
        dc.w (L841-L840)/2,(L842-L841)/2,(L843-L842)/2,(L844-L843)/2
        dc.w (L845-L844)/2,(L846-L845)/2,(L847-L846)/2,(L848-L847)/2
        dc.w (L849-L848)/2,(L850-L849)/2,(L851-L850)/2,(L852-L851)/2
        dc.w (L853-L852)/2,(L854-L853)/2,(L855-L854)/2,(L856-L855)/2
        dc.w (L857-L856)/2,(L858-L857)/2,(L859-L858)/2,(L860-L859)/2
        dc.w (L861-L860)/2,(L862-L861)/2,(L863-L862)/2,(L864-L863)/2
        dc.w (L865-L864)/2,(L866-L865)/2,(L867-L866)/2,(L868-L867)/2
        dc.w (L869-L868)/2,(L870-L869)/2,(L871-L870)/2,(L872-L871)/2
        dc.w (L873-L872)/2,(L874-L873)/2,(L875-L874)/2,(L876-L875)/2
        dc.w (L877-L876)/2,(L878-L877)/2,(L879-L878)/2,(L880-L879)/2
        dc.w (L881-L880)/2,(L882-L881)/2,(L883-L882)/2,(L884-L883)/2
        dc.w (L885-L884)/2,(L886-L885)/2,(L887-L886)/2,(L888-L887)/2
        dc.w (L889-L888)/2,(L890-L889)/2,(L891-L890)/2,(L892-L891)/2
        dc.w (L893-L892)/2,(L894-L893)/2,(L895-L894)/2,(L896-L895)/2
        dc.w (L897-L896)/2,(L898-L897)/2,(L899-L898)/2,(L900-L899)/2
        dc.w (L901-L900)/2,(L902-L901)/2,(L903-L902)/2,(L904-L903)/2
        dc.w (L905-L904)/2,(L906-L905)/2,(L907-L906)/2,(L908-L907)/2
        dc.w (L909-L908)/2,(L910-L909)/2,(L911-L910)/2,(L912-L911)/2
        dc.w (L913-L912)/2,(L914-L913)/2,(L915-L914)/2,(L916-L915)/2
        dc.w (L917-L916)/2,(L918-L917)/2,(L919-L918)/2,(L920-L919)/2
        dc.w (L921-L920)/2,(L922-L921)/2,(L923-L922)/2,(L924-L923)/2
        dc.w (L925-L924)/2,(L926-L925)/2,(L927-L926)/2,(L928-L927)/2
        dc.w (L929-L928)/2,(L930-L929)/2,(L931-L930)/2,(L932-L931)/2
        dc.w (L933-L932)/2,(L934-L933)/2,(L935-L934)/2,(L936-L935)/2
        dc.w (L937-L936)/2,(L938-L937)/2,(L939-L938)/2,(L940-L939)/2
        dc.w (L941-L940)/2,(L942-L941)/2,(L943-L942)/2,(L944-L943)/2
        dc.w (L945-L944)/2,(L946-L945)/2,(L947-L946)/2,(L948-L947)/2
        dc.w (L949-L948)/2,(L950-L949)/2,(L951-L950)/2,(L952-L951)/2
        dc.w (L953-L952)/2,(L954-L953)/2,(L955-L954)/2,(L956-L955)/2
        dc.w (L957-L956)/2,(L958-L957)/2,(L959-L958)/2,(L960-L959)/2
        dc.w (L961-L960)/2,(L962-L961)/2,(L963-L962)/2,(L964-L963)/2
        dc.w (L965-L964)/2,(L966-L965)/2,(L967-L966)/2,(L968-L967)/2
        dc.w (L969-L968)/2,(L970-L969)/2,(L971-L970)/2,(L972-L971)/2
        dc.w (L973-L972)/2,(L974-L973)/2,(L975-L974)/2,(L976-L975)/2
        dc.w (L977-L976)/2,(L978-L977)/2,(L979-L978)/2,(L980-L979)/2
        dc.w (L981-L980)/2,(L982-L981)/2,(L983-L982)/2,(L984-L983)/2
        dc.w (L985-L984)/2,(L986-L985)/2,(L987-L986)/2,(L988-L987)/2
        dc.w (L989-L988)/2,(L990-L989)/2,(L991-L990)/2,(L992-L991)/2
        dc.w (L993-L992)/2,(L994-L993)/2,(L995-L994)/2,(L996-L995)/2
        dc.w (L997-L996)/2,(L998-L997)/2,(L999-L998)/2,(L1000-L999)/2
        dc.w (L1001-L1000)/2,(L1002-L1001)/2,(L1003-L1002)/2,(L1004-L1003)/2
        dc.w (L1005-L1004)/2,(L1006-L1005)/2,(L1007-L1006)/2,(L1008-L1007)/2
        dc.w (L1009-L1008)/2,(L1010-L1009)/2,(L1011-L1010)/2,(L1012-L1011)/2
        dc.w (L1013-L1012)/2,(L1014-L1013)/2,(L1015-L1014)/2,(L1016-L1015)/2
        dc.w (L1017-L1016)/2,(L1018-L1017)/2,(L1019-L1018)/2,(L1020-L1019)/2
        dc.w (L1021-L1020)/2,(L1022-L1021)/2,(L1023-L1022)/2,(L1024-L1023)/2
        dc.w (L1025-L1024)/2,(L1026-L1025)/2,(L1027-L1026)/2,(L1028-L1027)/2
        dc.w (L1029-L1028)/2,(L1030-L1029)/2,(L1031-L1030)/2,(L1032-L1031)/2
        dc.w (L1033-L1032)/2,(L1034-L1033)/2,(L1035-L1034)/2,(L1036-L1035)/2
        dc.w (L1037-L1036)/2,(L1038-L1037)/2,(L1039-L1038)/2,(L1040-L1039)/2
        dc.w (L1041-L1040)/2,(L1042-L1041)/2,(L1043-L1042)/2,(L1044-L1043)/2
        dc.w (L1045-L1044)/2,(L1046-L1045)/2,(L1047-L1046)/2,(L1048-L1047)/2
        dc.w (L1049-L1048)/2,(L1050-L1049)/2,(L1051-L1050)/2,(L1052-L1051)/2
        dc.w (L1053-L1052)/2,(L1054-L1053)/2,(L1055-L1054)/2,(L1056-L1055)/2
        dc.w (L1057-L1056)/2,(L1058-L1057)/2,(L1059-L1058)/2,(L1060-L1059)/2
        dc.w (L1061-L1060)/2,(L1062-L1061)/2,(L1063-L1062)/2,(L1064-L1063)/2
        dc.w (L1065-L1064)/2,(L1066-L1065)/2,(L1067-L1066)/2,(L1068-L1067)/2
        dc.w (L1069-L1068)/2,(L1070-L1069)/2,(L1071-L1070)/2,(L1072-L1071)/2
        dc.w (L1073-L1072)/2,(L1074-L1073)/2,(L1075-L1074)/2,(L1076-L1075)/2
        dc.w (L1077-L1076)/2,(L1078-L1077)/2,(L1079-L1078)/2,(L1080-L1079)/2
        dc.w (L1081-L1080)/2,(L1082-L1081)/2,(L1083-L1082)/2,(L1084-L1083)/2
        dc.w (L1085-L1084)/2,(L1086-L1085)/2,(L1087-L1086)/2,(L1088-L1087)/2
        dc.w (L1089-L1088)/2,(L1090-L1089)/2,(L1091-L1090)/2,(L1092-L1091)/2
        dc.w (L1093-L1092)/2,(L1094-L1093)/2,(L1095-L1094)/2,(L1096-L1095)/2
        dc.w (L1097-L1096)/2,(L1098-L1097)/2,(L1099-L1098)/2,(L1100-L1099)/2

;---------------------------------------------------------------------
;   ***  ***  **   ** ****  **** **    **    **   **   **  ***   ***
;  **   ** ** *** *** ** **  **  **    **   ****  *** *** ** ** ** 
;  **   ** ** ** * ** ** **  **  **   **   **  ** ** * ** ** **  ***
;  **   ** ** **   ** ****   **  **        ****** **   ** ** **    **
;  **   ** ** **   ** **     **  **        **  ** **   ** ** ** *  **
;   ***  ***  **   ** **    **** ****      **  ** **   **  ***   ***
;---------------------------------------------------------------------
; ROUTINES
;---------------------------------------------------------------------
C_Tk
C_Lib
;---------------------------------------------------------------------

*************************************************************************
*		INITIALISATION , PART 1
*		D0= flags
*		D1= Longueur buffer
*		D7= initialisation de l'ecran...
L_Init1		equ	0
*
L0:	movem.l	a3-a6,-(sp)
* Pour le float
	move.b	d0,FlagFloat(a5)
* Ecran par defaut?
	clr.w	DefFlag(a5)
	tst.w	d7
	bmi.s	.skip
	move.w	#-2,DefFlag(a5)
	btst	#2,d0
	beq.s	.skip
	addq.w	#1,DefFlag(a5)
* Init VARBUF
.skip	move.l	d1,d0
	RBsr	L_RamFast
	RBeq	L_Abort
	move.l	d0,VarBuf(a5)
	move.l	d1,VarBufL(a5)
* Ok, Passe aux autres inits
	move.w	#-1,T_AMOState(a5)
	movem.l	(sp)+,a3-a6
	rts

*************************************************************************
*		INITIALISATION, PART 2
L_Init2		equ	1
L1	movem.l	a3-a6,-(sp)
	tst.w	DefFlag(a5)
	beq.s	.Skip1
	RBsr	L_DefRun
	EcCall	CopForce
	SyCalD	Show,-1
	bra.s	.Skip2
.Skip1	RBsr	L_ScreenExt
.Skip2	move.w	#-1,DefFlag(a5)
* Init FLOAT
	move.l	#$c90fd942,ValPi(a5)
	move.l	#$b4000048,Val180(a5)
	move.b	FlagFloat(a5),d6
	move.l	a6,-(sp)
	move.l	$4,a6
	btst	#0,d6
	beq.s	L0a
	tst.l	FloatBase(a5)
	bne.s	L0a
	moveq	#0,d0
	lea	FloatName(pc),a1
	jsr	OpenLib(a6)
	move.l	d0,FloatBase(a5)
	Rbeq	L_Abort
* Mathtrans.library?
L0a	btst	#1,d6
	beq.s	L0b
	tst.l	MathBase(a5)
	bne.s	L0b
	moveq	#0,d0
	lea	MathName(pc),a1
	jsr	OpenLib(a6)
	move.l	d0,MathBase(a5)
	Rbeq	L_Abort
L0b	move.l	(sp)+,a6
* Fin de l'init
	RBsr	L_Clearvar
	RBsr	L_SendBanks
	movem.l	(sp)+,a3-a6
	rts
MathName	dc.b	"mathtrans.library",0
FloatName	dc.b	"mathffp.library",0
		dc.b	0,"$VER: 1.34f",0
	even
*************************************************************************
*       PLUS float
L_PlusF		equ	2
L2	move.l	a6,-(sp)
	move.l	(a3)+,d1
	move.l	(a3),d0
	move.l	FloatBase(a5),a6
	jsr	SPAdd(a6)
	move.l	(sp)+,a6
	move.l	d0,(a3)
	rts

*************************************************************************
*       PLUS Chaine
L_PlusC		equ	3
*
L3:	move.l 	(a3)+,a2        ;Deuxieme chaine
        move.l 	(a3)+,a1        ;Premiere chaine

	moveq	#0,d4
        move.w 	(a1)+,d4
        beq.s 	L3g
        move.w 	(a2)+,d5
        beq.s 	L3h
	move.l	a2,d6
	move.l	a1,a2

        move.l 	d4,d3
        add.w 	d5,d3
        Rbcs.s 	L_StoLong      ;String too long?
	RBsr 	L_Demande
        move.l 	a0,-(a3)  	;Empile le resultat
        move.w 	d3,(a0)+
	lea	2(a1,d4.l),a1	;Adresse 2eme chaine	

; Copie la premiere chaine par MOTS LONGS (+++ rapide)
        addq.w 	#4,d4
        lsr.w 	#2,d4
        subq.w 	#1,d4            ;Travaille par mot longs
L3b:    move.l 	(a2)+,(a0)+
        dbra 	d4,L3b
; Copie la deuxieme chaine 
	move.l	d6,a2
        subq.w 	#1,d5
L3c:    move.b 	(a2)+,(a1)+
        dbra 	d5,L3c
; Rend pair
        move.w 	a1,d0
        btst 	#0,d0
        beq.s 	L3d
        addq.l 	#1,a1
L3d:    move.l 	a1,HiChaine(a5)
        rts
; 1ere chaine nulle
L3g:    move.l 	a2,-(a3)         ;Ramene la 2eme
        rts
; 2eme chaine nulle
L3h:    subq.l 	#2,a1
        move.l 	a1,-(a3)         ;Ramene la 1ere
        rts
        
*************************************************************************
*       MOINS float
L_MoinsF	equ	4
L4	move.l	a6,-(sp)
	move.l	(a3)+,d1
	move.l	(a3),d0
	move.l	FloatBase(a5),a6
	jsr	SPSub(a6)
	move.l	(sp)+,a6
	move.l	d0,(a3)
	rts
        
*************************************************************************
*       MOINS Chaine
L_MoinsC	equ	5
*
L5:     move.l 	(a3)+,d4     
        move.l 	(a3)+,a2
        moveq 	#0,d3 
        move.w 	(a2)+,d3
        move.l 	d3,d1
L5a:    RBsr 	L_demande  
        move.w 	d3,(a0)+
        beq.s 	ms4
        addq 	#1,d3
        lsr 	#1,d3
        subq 	#1,d3
ms3:    move.w 	(a2)+,(a0)+  
        dbra 	d3,ms3
ms4:    move.l 	a0,hichaine(a5)
        addq.l 	#2,a1        
        move.l 	d4,a2
        moveq 	#0,d2
        move 	(a2)+,d2     

ms5:    clr.l 	d4
        movem.l d1-d2/a1-a2,-(sp)
	RBsr 	L_InSearch
        movem.l (sp)+,d1-d2/a1-a2
        tst.l 	d3
        beq.s 	ms9
        move.l 	a1,a0
        move.l 	a1,d4    
        subq.l 	#1,d3
        move.l 	d3,d5        
        add.l 	d3,a1        
        add.l 	d2,d3
        add.l 	d3,a0        
        sub.l 	d3,d1
        add.l 	d1,d5        
        subq.l 	#1,d1
        bmi.s 	ms7
ms6:    move.b 	(a0)+,(a1)+
        dbra 	d1,ms6
ms7:    move 	a0,d0        
        btst 	#0,d0
        beq.s 	ms8
        addq.l 	#1,a0
ms8:    move.l 	a0,hichaine(a5) 
        move.l 	d4,a1
        move.w 	d5,-2(a1)
        move.l 	d5,d1
        bra.s 	ms5
ms9:    subq.l 	#2,a1
        move.l 	a1,-(a3)
        rts

*************************************************************************
*       	Int To Float
L_IntToFl	equ	6
L6:     move.l	a6,-(sp)
	move.l	FloatBase(a5),a6
	move.l	(a3),d0
	jsr	SPFlt(a6)
	move.l	d0,(a3)
	move.l	(sp)+,a6
	rts

*************************************************************************
*       	Float To Int
L_FlToInt	equ	7
L7	move.l	a6,-(sp)
	move.l	FloatBase(a5),a6
	move.l	(a3),d0
	jsr	SPFix(a6)
	move.l	d0,(a3)
	move.l	(sp)+,a6
	rts

*************************************************************************
*    	   	Multiplication entiere
L_Mult		equ	8
*
L8:     move.l 	(a3)+,d3
        move.l 	(a3),d6
        cmp.l 	#$00008000,d3
        bcc.s 	mlt0
        cmp.l 	#$00008000,d6
        bcc.s 	mlt0
        muls 	d6,d3
        move.l 	d3,(a3)
        rts
mlt0:   clr 	d4
        tst.l 	d3
        bpl.s 	mlt1
        neg.l 	d3
        not 	d4
mlt1:   tst.l 	d6
        bpl.s 	mlt2
        neg.l 	d6
        not 	d4
mlt2:   move 	d6,d1
        mulu 	d3,d1
        bmi.s 	mlto
        swap 	d6
        move 	d6,d0
        mulu 	d3,d0
        swap 	d0
        bmi.s	mlto
        tst 	d0
        bne.s 	mlto
        add.l 	d0,d1
        bvs.s 	mlto
        swap 	d3
        move 	d6,d0
        mulu 	d3,d0
        bne.s 	mlto
        swap 	d6
        move 	d6,d0
        mulu 	d3,d0
        swap 	d0
        bmi.s 	mlto
        tst 	d0
        bne.s 	mlto
        add.l 	d0,d1
        bvs.s 	mlto
        tst 	d4              ;signe du resultat
        beq.s 	mlt3
        neg.l 	d1
mlt3:   move.l 	d1,(a3)
        rts
mlto:   moveq	#29,d0
	RBra	L_Error

***************************************************************************
*       	Multiplication FLOAT
L9	move.l	a6,-(sp)
	move.l	(a3)+,d1
	move.l	(a3),d0
	move.l	FloatBase(a5),a6
	jsr	SPMul(a6)
	move.l	(sp)+,a6
	move.l	d0,(a3)
	rts
 
***************************************************************************
*	       	DIVISION entiere
L_Div		equ	10
*
L10     move.l 	(a3)+,d3
        move.l 	(a3),d6
        tst.l 	d3
        Rbeq	L_Dbz
        clr 	d2
        tst.l 	d6
        bpl.s 	dva
        not 	d2
        neg.l 	d6
dva:    cmp.l 	#$10000,d3 
        bcc.s 	dv0
        tst.l 	d3
        bpl.s 	dvb
        not 	d2
        neg.l 	d3
dvb:    move.l 	d6,d0
        divu	d3,d0
        bvs.s 	dv0
        moveq 	#0,d3
        move 	d0,d3
        bra.s 	dvc
dv0:    tst.l 	d3
        bpl.s 	dv3
        not 	d2
        neg.l 	d3
dv3:    moveq 	#31,d5         ;division lente: 32/32 bits
        moveq 	#-1,d4
        clr.l 	d1
dv2:    lsl.l 	#1,d6
        roxl.l 	#1,d1
        cmp.l 	d3,d1
        bcs.s 	dv1
        sub.l 	d3,d1
        lsr 	#1,d4           ;met X a un!
dv1:    roxl.l 	#1,d0
        dbra 	d5,dv2
        move.l 	d0,d3
dvc:    tst 	d2
        beq.s 	dvd
        neg.l 	d3
dvd:    move.l 	d3,(a3)
        rts
  

******************************************************************************
*       	DIVISION Float
L11	move.l	a6,-(sp)
	move.l	(a3),d1
	move.l	FloatBase(a5),a6
	jsr	SPTst(a6)
	Rbeq	L_dbz
	move.l	(a3)+,d1
	move.l	(a3),d0
	jsr	SPDiv(a6)
	move.l	(sp)+,a6
	move.l	d0,(a3)
	rts

*************************************************************************
*       	Operateur MODULO (que des entiers)
L_Mod		equ	12
*
L12     move.l 	(a3)+,d3 
        move.l 	(a3),d6
        moveq 	#31,d5
        moveq 	#-1,d4
        clr.l 	d1
md2:    lsl.l	#1,d6
        roxl.l 	#1,d1
        cmp.l 	d3,d1
        bcs.s 	md1
        sub.l 	d3,d1
        lsr 	#1,d4 
md1:    roxl.l 	#1,d0
        dbra 	d5,md2
        move.l 	d1,(a3)
        rts

*************************************************************************
*       	Operateur PUISSANCE (que des Floats)
L_Puis		equ	13
L13	move.l	a6,-(sp)
; Premier opérande négatif?
	moveq	#0,d2
	move.l	4(a3),d1
	move.l	FloatBase(a5),a6
	jsr	SPTst(a6)
	bpl.s	.Skip
; Deuxieme opérande pair?
	move.l	(a3),d0
	jsr	SPFix(a6)
	btst	#0,d0
	sne	d2
; Fonction power
.Skip	move.l	(a3)+,d1
	move.l	(a3),d0
	move.l	MathBase(a5),a6
	jsr	SPPow(a6)
	move.l	d0,(a3)
; Resultat negatif?
	tst.w	d2
	beq.s	.Ok
	move.l	(a3),d1
	move.l	FloatBase(a5),a6
	jsr	SPTst(a6)
	bmi.s	.Ok
	move.l	(a3),d0
	jsr	SPNeg(a6)
	move.l	d0,(a3)
; Termine les magouilles!
.Ok	move.l	(sp)+,a6
	rts

*************************************************************************
*       	Operateur EGAL - entiers -
L_Eg		equ	14
*
L14     move.l 	(a3)+,d0
        cmp.l 	(a3),d0
        beq.s 	Eg
        clr.l 	(a3)
        rts
Eg:     moveq 	#-1,d0
        move.l 	d0,(a3)
        rts

*************************************************************************
*       	Operateur EGAL - floats -
L15	move.l	a6,-(sp)
	move.l	(a3)+,d1
	move.l	(a3),d0
	move.l	FloatBase(a5),a6
	jsr	SPCmp(a6)
	move.l	(sp)+,a6
	beq.s	L15a
	clr.l	(a3)
	rts
L15a	move.l	#-1,(a3)
	rts

*************************************************************************
*       Operateur EGAL - chaines -
L16	RBsr 	L_CompCh
        cmp.w 	d3,d6
        beq.s 	l16b
        clr.l 	-(a3)
        rts
L16b:   moveq 	#-1,d0
        move.l 	d0,-(a3)
        rts

*************************************************************************
*       Operateur DIFFERENT - entiers -
L_Dif		equ	17
*
L17:    move.l 	(a3)+,d0
        cmp.l 	(a3),d0
        bne.s 	Di
        clr.l 	(a3)
        rts
Di:     moveq 	#-1,d0
        move.l 	d0,(a3)
        rts

*************************************************************************
*       Operateur DIFFERENT - floats -
L18:    move.l	a6,-(sp)
	move.l	(a3)+,d1
	move.l	(a3),d0
	move.l	FloatBase(a5),a6
	jsr	SPCmp(a6)
	move.l	(sp)+,a6
	bne.s	L18a
	clr.l	(a3)
	rts
L18a	move.l	#-1,(a3)
        rts

*************************************************************************
*       Operateur DIFFERENT -chaines-
L19:    
	RBsr 	L_CompCh
        cmp.w 	d3,d6
        bne.s 	l19b
        clr.l 	-(a3)
        rts
L19b:   moveq 	#-1,d0
        move.l 	d0,-(a3)
        rts

**************************************************************************
*       Operateur INFERIEUR - entiers 
L_Inf		equ	20
*
L20:    move.l 	(a3)+,d0
        cmp.l 	(a3),d0
        bgt.s 	l20a
        clr.l 	(a3)
        rts
l20a:   moveq 	#-1,d0
        move.l 	d0,(a3)
        rts
                
**************************************************************************
*       Operateur INFERIEUR - floats -  
L21:    move.l	a6,-(sp)
	move.l	(a3)+,d1
	move.l	(a3),d0
	move.l	FloatBase(a5),a6
	jsr	SPCmp(a6)
	move.l	(sp)+,a6
	blt.s	L21a
	clr.l	(a3)
	rts
L21a	move.l	#-1,(a3)
        rts

*************************************************************************
*       Operateur INFERIEUR - chaines
L22:    RBsr 	L_CompCh
        cmp.w 	d3,d6
        blt.s 	l22b
        clr.l 	-(a3)
        rts
L22b:   moveq 	#-1,d0
        move.l 	d0,-(a3)
        rts

*************************************************************************
*       Operateur SUPERIEUR - entiers -
L_Sup		equ	23
*
L23:    move.l 	(a3)+,d0
        cmp.l 	(a3),d0
        blt.s 	l23a
        clr.l 	(a3)
        rts
l23a:   moveq 	#-1,d0
        move.l	d0,(a3)
        rts

*************************************************************************
*       Operateur SUPERIEUR - floats -
L24:    move.l	a6,-(sp)
	move.l	(a3)+,d1
	move.l	(a3),d0
	move.l	FloatBase(a5),a6
	jsr	SPCmp(a6)
	move.l	(sp)+,a6
	bgt.s	L24a
	clr.l	(a3)
	rts
L24a	move.l	#-1,(a3)
        rts
    
*************************************************************************
*       Operateur SUPERIEUR - chaines -
L25:    RBsr 	L_CompCh
        cmp.w 	d3,d6
        bgt.s 	l25b
        clr.l 	-(a3)
        rts
L25b:   moveq 	#-1,d0
        move.l 	d0,-(a3)
        rts

*************************************************************************
*       Operateur INFERIEUR OU EGAL - entiers -
L_InfEg		equ	26
*
L26:    move.l 	(a3)+,d0
        cmp.l 	(a3),d0
        bge.s 	l26a
        clr.l 	(a3)
        rts
l26a:   moveq 	#-1,d0
        move.l 	d0,(a3)
        rts

*************************************************************************
*       Operateur INFERIEUR OU EGAL - floats -
L27:	move.l	a6,-(sp)
	move.l	(a3)+,d1
	move.l	(a3),d0
	move.l	FloatBase(a5),a6
	jsr	SPCmp(a6)
	move.l	(sp)+,a6
	ble.s	L27a
	clr.l	(a3)
	rts
L27a	move.l	#-1,(a3)
        rts

*************************************************************************
*       Operateur INFERIEUR OU EGAL - chaines -
L28:	RBsr 	L_CompCh
        cmp.w 	d3,d6
        ble.s 	l28b
        clr.l 	-(a3)
        rts
L28b:   moveq	#-1,d0
        move.l 	d0,-(a3)
        rts

*************************************************************************
*       Operateur SUPERIEUR OU EGAL - entiers -
L_SupEg		equ	29
*
L29     move.l 	(a3)+,d0
        cmp.l 	(a3),d0
        ble.s 	l29a
        clr.l 	(a3)
        rts
l29a:   moveq 	#-1,d0
        move.l 	d0,(a3)
        rts

*************************************************************************
*       Operateur SUPERIEUR OU EGAL - floats -
L30:    move.l	a6,-(sp)
	move.l	(a3)+,d1
	move.l	(a3),d0
	move.l	FloatBase(a5),a6
	jsr	SPCmp(a6)
	move.l	(sp)+,a6
	bge.s	L30a
	clr.l	(a3)
	rts
L30a	move.l	#-1,(a3)
        rts

*************************************************************************
*       Operateur SUPERIEUR EGAL - chaines -
L31:   	RBsr 	L_CompCh
        cmp.w 	d3,d6
        bge.s 	l31b
        clr.l 	-(a3)
        rts
L31b:   moveq 	#-1,d0
        move.l 	d0,-(a3)
        rts

*************************************************************************
*       	Routine de comparaison de chaines
L_CompCh	equ	32
*
L32:    move.l 	(a3)+,a1
        move.l 	(a3)+,a0
        moveq 	#0,d3
        moveq 	#0,d6
        move.w 	(a0)+,d0
        move.w 	(a1)+,d1
        beq.s 	cpch8
        tst 	d0
        beq.s 	cpch7
cpch1:  cmpm.b 	(a0)+,(a1)+
        bne.s 	cpch6
        subq 	#1,d0
        beq.s 	cpch3
        subq 	#1,d1
        bne.s 	cpch1
; on est arrive au bout d'une des chaines
cpch2:  moveq 	#1,d6         ;A$>B$
        rts
cpch3:  subq 	#1,d1          ;egalite!
        beq.s 	cpch5
cpch4:  moveq 	#1,d3         ;B$>A$
cpch5:  rts
; on est pas arrive au bout des chaines
cpch6:  bcc.s 	cpch4
        bcs.s 	cpch2
; a$ est nulle
cpch7:  tst 	d1
        beq.s 	cpch5           ;deux chaines nulles
        bne.s 	cpch4           ;B$>A$
; b$ est nulle
cpch8:  tst 	d0
        beq.s 	cpch5           ;deux chaines nulles
        bne.s 	cpch2           ;A$>B$

*************************************************************************
*       	IMPRESSION d'un chiffer ENTIER
L_PrintE	equ	33
*
L33:    moveq 	#-1,d3            ;Proportionnel
        moveq	#1,d4             ;Avec signe
        move.l 	Buffer(a5),a0
        move.l 	(a3)+,d0
	RBsr 	L_EToAsc
        clr.b 	(a0)
	rts

*************************************************************************
*       	IMPRESSION d'un chiffre FLOAT
L_PrintF	equ	34
*
L34:    move.l 	Buffer(a5),a0
	move.l	(a3)+,d3
	RBsr 	L_StrFlAsc
        clr.b 	(a0)
	rts

*************************************************************************
*       	IMPRESSION d'une chaine
L_PrintS	equ	35
L35:	move.l 	(a3)+,a2
        move.w 	(a2)+,d2
L35r:   move.l	Buffer(a5),a0
	beq.s	L35c
	move.w	#255,d0
L35a:   move.b 	(a2)+,(a0)+      
        subq.w 	#1,d2
        beq.s 	L35c
        dbra 	d0,L35a
L35b	movem.l	a2/d2,-(sp)
	RBsr 	L_PrintX
	movem.l	(sp)+,a2/d2
	tst.w	d2
	bra.s	L35r
L35c	clr.b	(a0)
	rts

*************************************************************************
*		FIN IMPRESSION NORMALE
L_PrintX	equ	36
*
L36	move.l	Buffer(a5),a1
	WiCall	Print
	rts

*************************************************************************
*		FIN IMPRESSION NORMALE IMPRIMANTE
*
L_LPrintX	equ	37
*
L37:    move.l	Buffer(a5),a0
	RBra	L_ImpImp

*************************************************************************
*       	PRINT seul
L_CRPrint	equ	38
*
L38:	move.l	Buffer(a5),a0
	move.l	#$0D0A0000,(a0)
	rts

*************************************************************************
*       	CONVERSION ALPHA---> DECIMAL
*       	Dans (A0)
L_EToAsc	equ	39
*
L39:    tst.l 	d0
        bpl.s	hexy
        move.b 	#"-",(a0)+
        neg.l 	d0
        bra.s 	hexz
hexy:   tst 	d4
        beq.s 	hexz
        move.b 	#32,(a0)+
hexz:   tst.l 	d3
        bmi.s 	hexv
        neg.l 	d3
        add.l 	#10,d3
hexv:   move.l 	#9,d4
        lea 	mdx(pc),a1
hxx0:   move.l 	(a1)+,d1     ;table des multiples de dix
        move.b 	#$ff,d2
hxx1:   addq.b 	#1,d2
        sub.l 	d1,d0
        bcc.s 	hxx1
        add.l 	d1,d0
        tst.l 	d3
        beq.s 	hxx4
        bpl.s 	hxx3
        btst 	#31,d4
        bne.s 	hxx4
        tst 	d4
        beq.s 	hxx4
        tst.b 	d2
        beq.s 	hxx5
        bset 	#31,d4
        bra.s 	hxx4
hxx3:   subq.l 	#1,d3
        bra.s 	hxx5
hxx4:   add 	#48,d2
        move.b 	d2,(a0)+
hxx5:   dbra 	d4,hxx0
        rts
mdx:    dc.l 	1000000000,100000000,10000000,1000000
        dc.l 	100000,10000,1000,100,10,1,0

*************************************************************************
*       	CONVERSION FLOAT--->DECIMAL
*       	en (A0)
L_FlToAsc	equ	40
L40	movem.l a2/d1-d5,-(sp)
	movem.l	a3-a6,-(sp)
	move.l 	a0,TempBuf(a5)
	move.l 	d0,TempFl(a5)
	tst.w 	d5		;D5= FIX FLAG
	bne.s 	PaFix
	tst.w 	d4
	bmi.s 	PaFix
; Fix precise NORMAL
	cmp.w 	#8,d4
	bcs.s 	Fx1
	moveq 	#7,d4
Fx1:	move.w 	d4,-(sp)
	move.l 	a0,-(sp)
	move.l 	d0,-(sp)
	moveq	#0,d0
	Rbsr 	L_FlRout
	lea 	10(sp),sp
	movem.l	(sp)+,a3-a6
	tst.w 	d4		;Si FIX=0, enleve le POINT!
	bne.s 	Fx2
	cmp.b 	#".",-1(a0)
	bne.s 	Fx2
	clr.b 	-(a0)
Fx2:	sub.l 	d0,a0
	exg 	d0,a0
	movem.l (sp)+,a2/d1-d5
	rts
; Representation proportionnelle
PaFix:	move.b 	d0,d1
	and.b 	#$7f,d1
	cmp.b 	#$41,d1
	bcs.s 	PaF1
	move.w 	#7,-(sp)
	bra.s 	PaF5
PaF1:	cmp.b 	#$31,d1
	bcs.s 	PaF2
	move.w 	#7+3,-(sp)
	bra.s 	PaF5
PaF2:	move.w 	#16+6,-(sp)	;Si >-1 et <1, demande 16 chiffres!
PaF5:	pea	BuFloat(a5)
	move.l 	d0,-(sp)
	moveq	#0,d0
	Rbsr	L_FlRout
	lea 	10(sp),sp
	movem.l	(sp),a3-a6
	move.l 	d0,a1
	cmp.b 	#"-",(a1)
	bne.s 	PaFix1
	addq.l 	#1,a1
PaFix1:	move.l 	a1,a0
	cmp.b 	#"0",(a0)
	beq.s 	PaFix5
;-----> Chiffre >1
PaFix2:	move.b 	(a0)+,d0		;Compte AVANT la virgule
	beq.s 	PaFix3
	cmp.b 	#$2e,d0
	bne.s 	PaFix2
PaFix3:	sub.l 	a1,a0
	tst.w 	d5
	bne 	ExFix1
	moveq 	#7,d0
	cmp.w 	#8,a0		;Si >7 ---> representation E+
	bcc 	ExFix1
	sub.w 	a0,d0
	cmp.b 	#5,d0
	bcs 	Clean
	moveq 	#5,d0
	bra 	Clean
;-----> Chiffre <1
PaFix5:	addq.l 	#1,a0
	addq.l 	#1,a0
	move.l 	a0,a1
PaFix6:	move.b 	(a0)+,d0		;Compte le nombre de ZEROS
	beq.s 	PaFix7
	cmp.b 	#"0",d0
	beq.s 	PaFix6
PaFix7:	sub.l 	a1,a0
	clr.w 	d0
	cmp.w 	#16+6,a0		;Est-ce un vrai ZERO?
	bcs.s 	PaFix8
	move.w 	#6,a0
	moveq 	#1,d0
	bra.s 	PaFix9
PaFix8:	cmp.w 	#4,a0		;0.0001 ---> Exponantielle
	bcc 	ExVir1
PaFix9:	tst.w 	d5
	bne 	ExVir1	
	addq.w 	#6,a0
	move.w 	a0,d0
; Calcule BIEN, et nettoie le chiffre
Clean:	move.w 	d0,-(sp)
	pea	BuFloat(a5)
	move.l 	Tempfl(a5),-(sp)	
	moveq	#0,d0
	Rbsr 	L_FlRout
	lea 	10(sp),sp
	movem.l	(sp)+,a3-a6
	move.l 	d0,a0
	move.l 	TempBuf(a5),a1
Cl1:	move.b 	(a0)+,d0
	beq.s	Cl5
	move.b 	d0,(a1)+
	cmp.b 	#".",d0
	bne.s 	Cl1
	lea 	-1(a1),a2
Cl2:	move.b 	(a0)+,d0
	beq.s 	Cl3
	move.b 	d0,(a1)+
	cmp.b 	#"0",d0
	beq.s 	Cl2
	move.l 	a1,a2		;Dernier non nul
	bra.s 	Cl2
Cl3:	move.l 	a2,a1
Cl5:	clr.b 	(a1)
	move.l 	TempBuf(a5),a0
	sub.l 	a0,a1
	move.l 	a1,d0
	movem.l (sp)+,a2/d1-d5
	rts

;-----> Representation exponantielle >= 1
ExFix1:	move.w 	a0,d2
	subq.w 	#2,d2
	cmp.w 	#7,a0
	bcs.s 	Exf0
	move.w 	#7,a0
Exf0:	moveq 	#9,d0
	sub.w 	a0,d0
	move.w 	d0,-(sp)
	pea	BuFloat(a5)
	move.l 	TempFl(a5),-(sp)
	moveq	#0,d0
	Rbsr 	L_FlRout
	lea 	10(sp),sp
	movem.l	(sp)+,a3-a6

	lea	BuFloat(a5),a0
	move.l 	TempBuf(a5),a1
	cmp.b 	#"-",(a0)
	bne.s 	Exf0a
	move.b 	(a0)+,(a1)+
Exf0a:	move.b 	(a0)+,(a1)+
	move.b 	#".",(a1)+
	lea 	-1(a1),a2
	move.w 	d4,d1
	bpl.s 	ExF1
	moveq 	#5,d1
	bra.s 	ExF2
Exf1:	cmp.w 	#5,d1
	bcs.s 	Exf2
	moveq 	#5,d1
Exf2:	move.b 	(a0)+,d0
	beq.s 	Exf2a
	cmp.b 	#".",d0
	beq.s 	Exf2
	move.b 	d0,(a1)+
	subq.w 	#1,d1
	bne.s 	Exf2
Exf2a:	clr.b 	(a1)
	tst.w 	d4
	bpl.s 	Exf5
; Enleve les zeros
	lea 	1(a2),a0
Exf3:	move.b 	(a0)+,d0
	beq.s 	Exf4
	cmp.b 	#"0",d0
	beq.s 	Exf3
	move.l 	a0,a2		;Dernier non nul
	bra.s 	Exf3
Exf4:	move.l 	a2,a1
; Rajoute le E+00
Exf5:	move.b 	#"E",(a1)+
	move.b 	#"+",(a1)+
	move.b 	#"0",(a1)+
Exf6:	cmp.b 	#10,d2
	bcs.s 	Exf7
	add.b 	#1,-1(a1)
	sub.w 	#10,d2
	bra.s 	Exf6
Exf7:	add.b 	#"0",d2
	move.b 	d2,(a1)+
	clr.b 	(a1)
	move.l 	TempBuf(a5),a0
	sub.l 	a0,a1
	move.l 	a1,d0
	movem.l (sp)+,a2/d1-d5
	rts

;-----> Exponantielle <1
ExVir1:	tst.w 	d0
	beq.s 	Exv0
	clr.w 	d2
	moveq 	#1,d3
	lea 	Zero(pc),a0
	bra.s 	Exv0a

Exv0:	clr.w 	d3
	move.w 	a0,d2
	addq.l 	#6,a0
	move.w 	a0,-(sp)
	pea	BuFloat(a5)
	move.l 	TempFl(a5),-(sp)
	moveq	#0,d0
	Rbsr 	L_FlRout
	lea 	10(sp),sp
	movem.l	(sp)+,a3-a6
	lea	BuFloat(a5),a0

Exv0a:	move.l 	TempBuf(a5),a1
	cmp.b 	#"-",(a0)
	bne.s 	Exv1
	move.b 	(a0)+,(a1)+
Exv1:	lea 	2(a0),a2
Exv2:	move.b 	(a0)+,d0			;Cherche le debut du chiffre
	beq.s 	Exv3
	cmp.b 	#".",d0
	beq.s	Exv2
	cmp.b 	#"0",d0
	beq.s 	Exv2
	bra.s 	Exv4
Exv3:	move.l 	a2,a0
	moveq 	#"0",d0		 
Exv4:	move.w 	d4,d1
	bpl.s 	Exv5
	moveq 	#6,d1
	bra.s 	Exv6
Exv5:	cmp.w 	#6,d1
	bcs.s 	Exv6
	moveq 	#6,d1
Exv6:	move.b	d0,(a1)+
	move.b 	#".",(a1)+
	lea 	-1(a1),a2
	tst.w 	d1
	beq.s 	Exv7b
Exv7:	move.b 	(a0)+,d0
	beq.s 	Exv7a
	move.b 	d0,(a1)+ 
	cmp.b 	#"0",d0
	beq.s 	Exv7a
	move.l 	a1,a2
Exv7a	subq.w 	#1,d1
	bne.s 	Exv7
Exv7b:	tst.w 	d4		;Nettoie le chiffre
	bpl.s 	Exv8
	move.l 	a2,a1
Exv8:	tst.w 	d3
	bne 	Exf5
	move.b 	#"E",(a1)+
	move.b 	#"-",(a1)+
	move.b 	#"0",(a1)+
	bra 	Exf6	
Zero:	dc.b 	"0.0000000",0

*************************************************************************
*       	USING CHIFFRES
L_UsingC	equ	41
*
L41     move.l 	(a3)+,a0
	movem.l	a3/d7,-(sp)
        move.l 	buffer(a5),a1
        lea 	256(a1),a1
        move.w 	(a0)+,d0
        beq.s 	l41a3
        cmp.w 	#127,d0
        bcs.s 	l41a1
        moveq 	#127,d0
l41a1:  subq.w 	#1,d0
l41a2:  move.b 	(a0)+,(a1)+
        dbra 	d0,l41a2
l41a3:  clr.b 	(a1)
; USING pour les CHIFFRES
        move.l 	buffer(a5),a1
        lea 	128(a1),a2
        moveq 	#127,d0
us2:    move.b 	(a1),(a2)+   ;recopie la chaine, et fait le menage!!!
        move.b 	#32,(a1)+
        dbra 	d0,us2
        move.l 	buffer(a5),a0
        lea 	128(a0),a1      ;a1 pointe la chaine
        move.l 	a1,d6        ;debut chaine a formatter
        move.l 	buffer(a5),a2
        lea 	256(a2),a2    ;a2 pointe la chaine de definition
        move.l 	a2,d7        ;debut chaine de format
us3:    move.b 	(a2),d0
        beq.s 	us5
        cmp.b 	#".",d0       ;cherche la fin du format de chiffre
        beq.s 	us5
        cmp.b 	#";",d0
        beq.s 	us5
        cmp.b 	#"^",d0
        beq.s 	us5
        addq.l 	#1,a0
        addq.l 	#1,a2
        bra.s 	us3
us5:    move.b (a1),d0
        beq.s 	us6
        cmp.b 	#".",d0       ;trouve le point de la chaine a formatter
        beq.s 	us6             ;ou la fin
        cmp.b 	#"E",d0
        beq.s 	us6
        addq.l	#1,a1
        bra.s 	us5
us6:    movem.l a0-a2,-(sp)
; ecris la gauche du chiffre
us7:    cmp.l 	d7,a2         ;fini a gauche???
        beq 	us15
        move.b 	-(a2),d0
        cmp.b 	#"#",d0
        beq.s 	us8
        cmp.b 	#"-",d0
        beq.s 	us11
        cmp.b 	#"+",d0
        beq.s 	us12
        move.b 	d0,-(a0)     ;aucun signe reserve: le met simplement!
        bra.s 	us7
us8:    cmp.l 	d6,a1         ;-----> "#"
        bne.s 	us10
us9:    move.b 	#" ",-(a0)   ;arrive au debut du chiffre!
        bra.s 	us7
us10:   move.b 	-(a1),d0
        cmp.b 	#"0",d0       ;pas un chiffre (signe)
        bcs.s 	us9
        cmp.b 	#"9",d0
        bhi.s 	us9
        move.b 	d0,-(a0)     ;OK, chiffre: poke!
        bra.s 	us7
us11:   move.l 	d6,a3        ;-----> "-"
        move.b 	(a3),-(a0)   ;met le "signe": 32 ou "-"
        bra.s 	us7
us12:   move.l 	d6,a3
        move.b 	(a3),d0
        cmp.b 	#"-",d0
        beq.s 	us13
        move.b 	#"+",d0
us13:   move.b 	d0,-(a0)     ;-----> "+"
        bra 	us7
; ecrit la droite du chiffre
us15:   movem.l (sp)+,a0-a2 ;recupere les adresses pivot
        clr.l 	d2            ;flag puissance
        cmp.b 	#".",(a1)     ;saute le point dans le chiffre a afficher
        bne.s 	us16
        addq.l 	#1,a1
us16:   move.b 	(a2)+,d0
        beq 	finus         ;fini OUF!
        cmp.b 	#";",d0       ;";" marque la virgule sans l'ecrire!
        beq.s 	us18z
        cmp.b 	#"#",d0
        beq.s 	us17
        cmp.b 	#"^",d0
        beq.s 	us20
        move.b 	d0,(a0)+     ;ne correspond a rien: POKE!
        bra.s 	us16
us17:   move.b 	(a1),d0      ;-----> "#"
        bne.s	us19
us18:   tst 	d2
        beq.s 	us18a
us18z:  move.b 	#" ",(a0)+   ;si puissance passee: met des espaces
        bra.s 	us16
us18a:  move.b 	#"0",(a0)+   ;fin du chiffre: met un zero apres la virgule
        bra.s 	us16
us19:   cmp.b 	#"0",d0
        bcs.s 	us18
        cmp.b 	#"9",d0
        bhi.s 	us18
        addq.l 	#1,a1
        move.b 	d0,(a0)+
        bra 	us16
us20:   tst 	d2              ;-----> "^"
        bmi.s 	us24
        bne.s 	us25
us21:   move.b 	(a1),d0
        beq.s 	us22
        cmp.b 	#"E",d0
        beq.s 	us23
        addq.l	#1,a1
        bra.s 	us21
us22:   moveq	#1,d2          ;pas de puissance: en fabrique une!
        bra.s 	us25
us23:   moveq 	#-1,d2
us24:   move.b 	(a1),d0      ;si fin du chiffre: met des espaces
        beq 	us18
        addq.l 	#1,a1
        cmp.b 	#32,d0        ;saute l'espace entre E et +/-
        beq.s 	us24
        move.b 	d0,(a0)+
        bra 	us16
us25:   lea 	usip(pc),a3
        move.b 	-1(a3,d2.w),(a0)+ ;met une fausse puissance!
        cmp.b	#6,d2
        beq	us16
        addq 	#1,d2
        bra 	us16
finus:  movem.l	(sp)+,a3/d7
	clr.b 	(a0)
        rts
usip:   dc.b 	"E+000  "
	even

*************************************************************************
*       	USING CHAINES
L_UsingS	equ	42
*
L42     move.l 	(a3)+,a0		* Chaine à formater
        move.l 	buffer(a5),a1
	lea	128(a1),a1
        move.w 	(a0)+,d0
        beq.s 	l42c
        cmp.w 	#127,d0
        bcs.s 	l42a
        moveq 	#127,d0
l42a	subq.w 	#1,d0
l42b	move.b 	(a0)+,(a1)+
        dbra 	d0,l42b
l42c	clr.b 	(a1)

	move.l 	(a3)+,a0		* Chaine de formatage
        move.l 	buffer(a5),a1
        lea 	256(a1),a1
        move.w 	(a0)+,d0
        beq.s 	l42a3
        cmp.w 	#127,d0
        bcs.s 	l42a1
        moveq 	#127,d0
l42a1:  subq.w 	#1,d0
l42a2:  move.b 	(a0)+,(a1)+
        dbra 	d0,l42a2
l42a3:  clr.b 	(a1)

        move.l 	buffer(a5),a0
        lea 	128(a0),a1   
        lea 	128(a1),a2   
; ecris la chaine dans le buffer
us52:   move.b 	(a2)+,d0
        beq.s 	fnusc
        cmp.b 	#"~",d0
        beq.s 	us53
        move.b 	d0,(a0)+
        bra.s 	us52
us53:   move.b 	(a1),d0      ;----> "~"
        bne.s 	us54
        move.b 	#32,(a0)+
        bra.s 	us52
us54:   addq.l 	#1,a1
        move.b 	d0,(a0)+
        bra.s 	us52
fnusc:  clr.b 	(a0)
        rts

*************************************************************************
*       	PRINT RETOUR CHARIOT
L_PrtRet	equ	43
*
L43:    move.b	#13,(a0)+
	move.b	#10,(a0)+
	clr.b	(a0)
	rts

*************************************************************************
*       	PRINT VIRGULE
L_PrtVir	equ	44
*
L44:    move.b	#9,(a0)+
	clr.b	(a0)
	rts

*************************************************************************
*		DEMANDE DISQUE: revient DIRECTEMENT à l'appeleur!
L_DDemande	equ	45
L45	move.l	a4,MenA4(a5)
	sub.l	a4,a4
	subq.l	#1,a4
	Rbsr	L_Demande
	move.l	MenA4(a5),a4
	rts

*************************************************************************
*		Demande une certaine place pour les chaines
L_Demande	equ	46
L46:	move.l 	HiChaine(a5),a0 
        move.l 	a0,a1
	add.l	d3,a1
	addq.l	#4,a1
	cmp.l	TabBas(a5),a1
	bcc.s	Dem1
	move.l	a0,a1
        rts
* Va faire le menage, si revient: OK!
dem1:	Rbsr 	L_menage 
* Si A4=0, un menage vient d'etre fait!!!
	move.l	a4,d0
	beq	FinMenE
	bmi.s	dem2
	move.l	d0,MenA4(a5)
	sub.l	a4,a4
	move.l	LowPile(a5),sp
	move.l	BasA3(a5),a3
	addq.l	#4,d0
	move.l	d0,-(sp)
	rts
* Rebranche!
dem2	sub.l	a4,a4
	bra.s	L46

*************************************************************************
*		MENAGE alphanumerique
L_Menage	equ	47
*
L47:	movem.l d1-d7/a2-a6,-(sp)

******* Essaie de proceder à un FAST-MENAGE!
	move.l	HiChaine(a5),d7
	move.l	LoChaine(a5),d6
	move.l	d7,d0
	sub.l	d6,d0
	cmp.l	#$FFFFE,d0
	bcc	SLOW_MENAGE
	move.l	d0,d5
	RBsr	L_RamFast2
	tst.l	d0
	beq	SLOW_MENAGE

*********************************************************************
FAST_MENAGE
	move.l	d0,a4
	move.l	d0,a2
	clr.w	(a2)+
FMen0  	move.l 	VarLoc(a5),a6			;Debut des variables
        moveq 	#-1,d2                    	;Maxi dans le tableau
        moveq 	#0,d4                     	;Cpt tableau---> 0
; Rempli la table intermediaire
FMen1: 	move.l	a6,a3
	addq.l	#4,a6
	move.w	(a6)+,d0
	bpl.s	FMen1a
	move.l	(a3),d0
	beq	FMenX
	move.l	d0,a6
	bra.s	FMen1
FMen1a:	btst	#1,d0
	beq.s	FMen1
; Variable alphanumerique
	tst.l	(a3)				* Pas initialise!
	beq.s	FMen1
	btst 	#6,d0
	beq.s 	FMen4
	move.l	(a3),a3
	move.w	(a3)+,d0
	subq.w 	#1,d0
	moveq 	#1,d4
FMen2:	move.w 	(a3)+,d1			;Calcule nombre de variable
	addq.l	#2,a3
	addq.w	#1,d1
	mulu	d1,d4
	dbra 	d0,FMen2
FMen3:	subq.l 	#1,d4
; Recopie la chaine dans le buffer intermediaire
FMen4	move.l	(a3),a0
	cmp.l	d6,a0			; Dans le buffer?
	bcs.s	FMenN
	cmp.l	d7,a0
	bcc.s	FMenN
	move.w	(a0),d0			; Chaine vide?
	beq.s	FMenV
	move.w	d0,d1
	and.w	#$FFF0,d1
	cmp.w	#$FFF0,d1
	beq.s	FMenD			; Deja fait
	move.l	a2,d2
	sub.l	a4,d2
	move.l	d2,(a3)			; Change le pointeur
	add.l	d6,(a3)
	move.w	d0,(a2)+
	addq.w	#1,d0
	lsr.w	#1,d0
	subq.w	#1,d0
	lea	2(a0),a1
FMen5	move.w	(a1)+,(a2)+
	dbra	d0,FMen5
	or.l	#$FFF00000,d2
	move.l	d2,(a0)			; Marque la chaine...
	bra.s	FMenN
; Chaine deja copiee
FMenD	move.l	(a0),d0
	and.l	#$000FFFFF,d0
	add.l	d6,d0
	move.l	d0,(a3)
	bra.s	FMenN
; Chaine vide
FMenV	move.l	ChVide(a5),(a3)
; Prend la chaine suivante	
FMenN	addq.l	#4,a3
	tst.l 	d4
        bne 	FMen3
        beq 	FMen1
; Recopie le tout dans le buffer
FMenX	move.l	a4,a0
	move.l	d6,a1
FMenX1	move.w	(a0)+,(a1)+
	cmp.l	a2,a0
	bcs.s	FMenX1
	move.l	a1,HiChaine(a5)
; Libere le buffer temporaire
	move.l	a4,a1
	move.l	d5,d0
	RBsr	L_RamFree
	bra	FinMenS
*********************************************************************
SLOW_MENAGE
* Reserve la memoire, ou prend le BUFFER si rien du tout!!!
	move.l	#TMenage+16,d0
	Rbsr	L_RamFast2
	bne.s	L47a
	move.l	#-1,BMenage(a5)
	move.l	Buffer(a5),d5
	bra.s	L47b
L47a	move.l	d0,BMenage(a5)
	move.l	d0,d5
* Menage
L47b   	move.l 	d5,d6	
	add.l 	#TMenage,d6                  	;Fin TI
	move.l 	LoChaine(a5),d7               	;Ad mini de recopie
	move.l	HiChaine(a5),a4			;Ad maxi des chaines!
	addq.l 	#2,d7		  		;Chaine vide
	move.l 	d7,a1		  		;Si ya pas de variable!

Men0:  	move.l 	VarLoc(a5),a6			;Debut des variables
        moveq 	#-1,d2                    	;Maxi dans le tableau
        moveq 	#0,d4                     	;Cpt tableau---> 0
        move.l 	d5,d3                    	;Rien dans la TI
        move.l 	d3,a0
        move.l 	#$7fffffff,(a0)
; Rempli la table intermediaire
Men1:  	move.l	a6,a3
	addq.l	#4,a6
	move.w	(a6)+,d0
	bpl.s	Men1a
	move.l	(a3),d0
	beq	Men20
	move.l	d0,a6
	bra.s	Men1
Men1a:	btst	#1,d0
	beq.s	Men1
; Variable alphanumerique
	tst.l	(a3)				* Pas initialise!
	beq.s	Men1
	btst 	#6,d0
	beq.s 	Men4
	move.l	(a3),a3
	move.w	(a3)+,d0
	subq.w 	#1,d0
	moveq 	#1,d4
Men2:	move.w 	(a3)+,d1			;Calcule nombre de variable
	addq.l	#2,a3
	addq.w	#1,d1
	mulu	d1,d4
	dbra 	d0,Men2
Men3:	subq.l 	#1,d4
; Essai de poker dans la TI
Men4:   move.l 	(a3),d0
        cmp.l 	d7,d0                     	;< au minimum?
        bcs.s 	Men10
	cmp.l	a4,d0				;Dans le source?
	bcc.s	Men10
        cmp.l 	d2,d0                     	;>= au maximum?
        bcc.s 	Men10
        move.l 	d5,a0
Men6:   cmp.l 	(a0),d0
        lea 	8(a0),a0
        bcc.s 	Men6
        cmp.l 	d6,a0
        bne.s 	Men7
        move.l 	d0,d2                    	;C'est le dernier element!
        move.l 	d6,d3
        bra.s 	Men9
Men7:   move.l 	d3,a1                    	;Decale les adresses au dessus
        cmp.l 	d6,d3
        bcs.s 	Men7a
        lea 	-8(a1),a1
        move.l 	-8(a1),d2                	;Remonte la limite haute
        bra.s 	Men8 
Men7a:  addq.l 	#8,d3
        move.l 	#$7fffffff,8(a1)
Men8:   move.l 	-(a1),8(a1)
        move.l 	-(a1),8(a1)
        cmp.l 	a0,a1
        bcc.s 	Men8
Men9:   move.l 	a3,-(a0)                 	;Poke dans la table
        move.l 	d0,-(a0) 
Men10:  addq.l	#4,a3
	tst.l 	d4
        bne.s 	Men3
        beq 	Men1

; Recopie toutes les chaines du buffer
Men20:  move.l 	d5,a3                    	;Adresse TI
        move.l 	d7,a1                    	;Adresse de recopie
        moveq 	#0,d7
Men21:  cmp.l 	d3,a3                     	;Fini-ni?
        bcc.s 	Men26 
        move.l 	(a3),a0                  	;Adresse de la chaine
        lea 	8(a3),a3
        cmp.l 	a0,d7                    	;Chaine deja bougee?
        beq.s 	Men25
        move.l 	a0,d7
        cmp.l 	a0,a1                     	;Au meme endroit?
        bne.s 	Men22
; Les 2 chaines sont au meme endroit!
        move.l 	a1,d1
	moveq 	#0,d0
        move.w 	(a1)+,d0
	add.l 	d0,a1
        move.w 	a1,d0
        btst 	#0,d0
        beq.s 	Men21
        addq.l 	#1,a1
        bra.s 	Men21
; Recopie la chaine
Men22:  move.l 	-4(a3),a2                	;Change la variable
        move.l 	a1,(a2)
        move.l 	a1,d1
        move.w 	(a0)+,d0                 	;Recopie la chaine
        beq.s 	Men24
        move.w 	d0,(a1)+
        subq.w 	#1,d0 
        lsr.w 	#1,d0
Men23:  move.w 	(a0)+,(a1)+
        dbra 	d0,Men23
        bra.s 	Men21
; Chaine vide au milieu: pointe la vraie
Men24:  move.l 	ChVide(a5),d1
        move.l 	d1,(a2)
        bra.s 	Men21
; La variable pointait la meme chaine que la precedente
Men25:  move.l 	-4(a3),a2
        move.l 	d1,(a2)
        bra.s 	Men21
; Est-ce completement fini?
Men26:  cmp.l 	d6,d3                     	;Buffer TI rempli?
        bcs.s 	FinMen                    	;NON---> c'est fini!

;-----> Reexplore les variables a la recherche de la DERNIERE CHAINE
        move.l 	VarLoc(a5),a6             	;Table des ad strings
        moveq 	#0,d4                     	;Cpt tableau---> 0
	move.l 	d1,d2		  		;Feneant!
; Rempli la table intermediaire
Men31:  move.l	a6,a3
	addq.l	#4,a6
	move.w	(a6)+,d0
	bpl.s	Men31a
	move.l	(a3),d0
	beq	Men40
	move.l	d0,a6
	bra.s	Men31
Men31a:	btst	#1,d0
	beq.s	Men31
; Variable alphanumerique
	tst.l	(a3)
	beq.s	Men31
	btst 	#6,d0
	beq.s 	Men34
	move.l	(a3),a3
	move.w	(a3)+,d0
	subq.w 	#1,d0
	moveq 	#1,d4
Men32:	move.w 	(a3)+,d1			;Calcule nombre de variable
	addq.l	#2,a3
	addq.w	#1,d1
	mulu	d1,d4
	dbra 	d0,Men32
Men33:	subq.l 	#1,d4
; La variable pointe elle la meme chaine?
Men34:  cmp.l 	(a3)+,d7
        beq.s 	Men36
        tst.l 	d4
        bne.s 	Men33
        beq.s 	Men31
Men36:  move.l 	d2,-4(a3)
        tst.l 	d4
        bne.s 	Men33
        beq.s 	Men31

;-----> Refait un tour!
Men40:  move.l 	a1,d7    	                ;Monte la limite <
        bra 	Men0
;-----> Menage fini!
FinMen	move.l 	a1,hichaine(a5)
; Libere la mémoire
	move.l	Bmenage(a5),d0
	bmi.s	Finm1
	move.l	d0,a1
	move.l	#TMenage+16,d0
	Rbsr	L_RamFree
Finm1   clr.l	Bmenage(a5)
; Ca marche???
FinMenS	movem.l (sp)+,d1-d7/a2-a6
	move.l	Hichaine(a5),a1
	add.l	d3,a1
	addq.l	#4,a1
	cmp.l	TabBas(a5),a1
	bcc.s	FinMenE
	rts
FinMenE	move.l	a4,d0
	bgt.s	FinMenF
	move.l	MenA4(a5),a4
FinMenF	moveq	#11,d0
	Rbra	L_Error


*********************************************************************
*		INSTR FIND
L_InSearch	equ	48
*
L48:    move.l	a3,-(sp)
	tst.l 	d2
        beq.s 	instf11
        tst.l 	d4
        beq.s 	instf1
        subq.l 	#1,d4
instf1: add.l 	d4,a1         ;situe dans la chaine
instf3: clr 	d3
instf4: move.l 	a2,a3
        addq 	#1,d4
        cmp 	d1,d4
        bhi.s 	instf11
        cmpm.b 	(a1)+,(a3)+
        bne.s 	instf4
        move.l 	a1,a0
        move 	d4,d0
instf5: addq	#1,d3
        cmp 	d2,d3
        bcc.s 	instf10
        addq 	#1,d0
        cmp 	d1,d0
        bhi.s 	instf11
        cmpm.b 	(a0)+,(a3)+
        beq.s 	instf5
        bra.s 	instf3
instf10:move.l 	d4,d3                  ;trouve!
	move.l	(sp)+,a3
        rts
instf11:moveq 	#0,d3
	move.l	(sp)+,a3
        rts

*********************************************************************
*		DIM
*		A0=	Adresse variable
*		D0=	Nombre params
L_Dim		equ	49
*
L49:	tst.l	(a0)			Already dimensionned
	Rbne	L_AlDim
	move.w	4(a0),d6		Prend le flag
* Recupere et compte les params
	moveq	#1,d3
	move.w	d0,d2
	move.l	Buffer(a5),a2
	move.w	d0,(a2)+
Dim1:	move.l	(a3)+,d1		Fabrique l'entete
	cmp.l	#$FFFF,d1
	Rbcc	L_Foncall
	move.w	d1,(a2)+
	move.w	d3,(a2)+
	addq.w	#1,d1
	mulu	d1,d3
	cmp.l	#$10000,d3
	Rbcc	L_Foncall
	subq.w	#1,d0
	bne.s	Dim1
	move.l	d3,d4
	Rbeq	L_Foncall
	lsl.l	#2,d3
	add.l	a2,d3
	sub.l	Buffer(a5),d3
	move.l	TabBas(a5),a2		Descend le bas tableaux
	sub.l	d3,a2
	cmp.l	HiChaine(a5),a2
	bcc.s	DimM1
	movem.l	a0/a1/d0-d3,-(sp)
	moveq	#0,d3
	RBsr	L_Menage
	movem.l	(sp)+,a0/a1/d0-d3
	cmp.l	HiChaine(a5),a2
	RBcs	L_OofBuf
DimM1	move.l	a2,(a0)			Stocke l'adresse du tableau
	move.l	a2,TabBas(a5)
	move.l	Buffer(a5),a0		Copie l'entete
	move.w	(a0)+,(a2)+
DimM2	move.l	(a0)+,(a2)+
	subq.w	#1,d2
	bne.s	DimM2
* Nettoie le tableau
	moveq	#0,d0
	and.w	#$000F,d6
	cmp.w	#2,d6
	bne.s	Dim5
	move.l	ChVide(a5),d0
Dim5:	move.l	d0,(a2)+
	subq.l	#1,d4
	bne.s	Dim5
	rts

*********************************************************************
*		Trouve un element de tableau
L_GetTablo	equ	50
*
L50	move.l	(a0),d0
	Rbeq	L_NDim
	move.l	d0,a0
	move.w	(a0)+,d3
	moveq	#0,d0
	moveq	#0,d2
GetT1	move.w	(a0)+,d0
	move.l	(a3)+,d1
	cmp.l	d0,d1
	Rbhi	L_Foncall
	mulu	(a0)+,d1
	add.w	d1,d2
	subq.w	#1,d3
	bne.s	GetT1
	lsl.l	#2,d2
	add.l	d2,a0
	rts

*********************************************************************
*		NEXT Entiers
L_NextE		equ	51
*
L51:	move.l	(a2)+,d4
	move.l	(a2)+,d5
	move.l	(a2),a2
	add.l	d4,(a2)
	tst.l	d4
	bmi.s	L51a
	cmp.l	(a2),d5
	blt.s	L51b
	addq.l	#4,sp
	jmp	(a1)
L51a	cmp.l	(a2),d5
	bgt.s	L51b
	addq.l	#4,sp
	jmp	(a1)
L51b	rts

*********************************************************************
*		NEXT Floats
L_NextF		equ	52
L52	move.l	a6,-(sp)
	move.l	(a2)+,d4
	move.l	(a2)+,d5
	move.l	(a2),a2
	move.l	FloatBase(a5),a6
	move.l	d4,d1
	jsr	SPTst(a6)
	move.l	d0,d6
	move.l	d4,d0
	move.l 	(a2),d1
	jsr	SPAdd(a6)
	move.l	d0,(a2)
	move.l	d5,d1
	jsr	SPCmp(a6)
	move.l	(sp)+,a6
	blt.s	NxtF1
	tst.l	d6
	bpl.s	NxtS
	bmi.s	NxtR
NxtF1	tst.l	d6
	bpl.s	NxtR
	bmi.s	NxtS
NxtR	addq.l	#4,sp
	jmp	(a1)
NxtS	rts

*********************************************************************
*		CHANGEMENT DE SIGNE D'UN FLOAT (a3)
L_NegFl		equ	53
L53:	move.l	a6,-(sp)
	move.l	(a3),d0
	move.l	FloatBase(a5),a6
	jsr	SPNeg(a6)
	move.l	d0,(a3)
	move.l	(sp)+,a6
	rts

*********************************************************************
*		Erreurs ecrans
L_EcWiErr	equ	54
L54	cmp.w	#1,d0
	Rbeq	L_OOfMem
	add.w	#EcEBase-1,d0
	RBra	L_Error

*********************************************************************	
*
L55:	

*********************************************************************	
*		TESTER
L_Tester	equ	56
L56	movem.l	a0-a2/d0-d7,-(sp)
	RBsr	L_Tests
	movem.l	(sp)+,a0-a2/d0-d7
	rts	

*********************************************************************
*		GET LABEL expression
L_GetLabE	equ	57
*
L57:	move.l	(a3)+,d0
	move.l	Buffer(a5),a0
	move.l	a0,a2
	moveq	#-1,d3
	moveq	#0,d4
	RBsr	L_EToAsc
	move.l	a0,d2
	sub.l	a2,d2
	RBra	L_GetLab

*********************************************************************
*		GET LABEL alphanumerique
L_GetLabA	equ	58
*
L58:	move.l	(a3)+,a1
	move.w	(a1)+,d2
	Rbeq	L_Foncall
	cmp.w	#32,d2
	Rbcc	L_Foncall
	move.w	d2,d1
	subq.w	#1,d1
	move.l	Buffer(a5),a0
	move.l	a0,a2
L58a	move.b	(a1)+,d0
	cmp.b	#"A",d0
	bcs.s	L58b
	cmp.b	#"Z",d0
	bhi.s	L58b
	add.b	#32,d0
L58b	move.b	d0,(a0)+
	dbra	d1,L58a
	RBra	L_GetLab

*********************************************************************
*		GET LABEL 
*		D6=	Numero de procedure
L_GetLab	equ	59
*
L59	btst	#0,d2
	beq.s	L59a
	clr.b	(a0)+
	addq.w	#1,d2
* Trouve le label
L59a	move.w	d6,(a0)+
	move.w	d2,d3
	lsr.w	#1,d3
	addq.w	#2,d2
	move.l	Ad_Labels(a5),a1
	move.l	a2,d4
L59b	move.w	(a1),d1
	Rbeq	L_Foncall
	cmp.w	d2,d1
	bne.s	L59n
	move.l	d4,a2
	lea	6(a1),a0
	move.w	d3,d0
L59c	cmp.w	(a0)+,(a2)+
	bne.s	L59n
	dbra	d0,L59c
* Trouve!
	move.l	2(a1),a0
	rts
* Label suivant
L59n	lea	6(a1,d1.w),a1
	bra.s	L59b

*********************************************************************
*		RETURN
L_Return	equ	60
*
L60:	cmp.l	LowPileP(a5),sp
	beq.s	.err
	addq.l	#4,LowPile(a5)
	rts
.err	moveq	#1,d0
	RBra	L_Error

*********************************************************************
*		POP
L_Pop		equ	61
*
L61:	move.l	(sp)+,a0
	cmp.l	LowPileP(a5),sp
	beq.s	.err
	addq.l	#4,sp
	move.l	sp,LowPile(a5)
	jmp	(a0)
.err	moveq	#2,d0
	Rbra	L_Error

*********************************************************************
*		DEBUT PROCEDURE 1-> Sauve la pile
*		D0=	ErrorOn
L_DProc1	equ	62
*
L62:	move.l	(sp)+,a2
* Empile les params
; Adresse de retour -(sp)		RTS
	move.l	a6,-(sp)		0
	move.l	Ad_Labels(a5),-(sp)	1
	move.l	VarLoc(a5),-(sp)	2
	move.l	AForNext(a5),-(sp)	2.5
	move.l	TabBas(a5),-(sp)	3
	move.l	OnErrLine(a5),-(sp)	4
	move.l	ErrorChr(a5),-(sp)	5
	move.w	ErrorOn(a5),-(sp)	6
	move.l	PData(a5),-(sp)		7
	move.l	AData(a5),-(sp)		8
	move.l	LowPile(a5),-(sp)	9
	move.l	LowPileP(a5),-(sp)	10
	move.l	sp,LowPileP(a5)		
	move.l	sp,LowPile(a5)		
	clr.l	OnErrLine(a5)
	move.w	d0,ErrorOn(a5)
	jmp	(a2)

*********************************************************************
*		DEBUT PROCEDURE 2-> Affecte les variables
L_DProc2	equ	63
*
L63:	move.w	d4,d2
	beq.s	L63d
	lsl.w	#2,d2
	subq.w	#1,d4
L63a	move.l	0(a3,d2.w),d0
	lsr.l	#1,d5	
	bcs.s	L63b
	lsr.l	#1,d6
	bcc.s	L63c
; FlToInt
	move.l	a6,-(sp)
	move.l	FloatBase(a5),a6
	jsr	SPFix(a6)
	move.l	(sp)+,a6
	bra.s	L63c
; IntToFl
L63b	lsr.l	#1,d6
	bcs.s	L63c
	move.l	a6,-(sp)
	move.l	FloatBase(a5),a6
	jsr	SPFlt(a6)
	move.l	(sp)+,a6
; Egalise
L63c	move.l	(a3)+,a0
	move.l	d0,(a0)
	dbra	d4,L63a
	add.w	d2,a3
L63d	rts
; Fltoint


*********************************************************************
*		FIN PROCEDURE
L_FProc		equ	64
*
L64:	tst.w	ErrorOn(a5)
	RBne	L_EProErr
	move.l	LowPileP(a5),sp
	move.l	(sp)+,LowPileP(a5)	10
	move.l	(sp)+,LowPile(a5)	9
	move.l	(sp)+,AData(a5)		8
	move.l	(sp)+,PData(a5)		7
	move.w	(sp)+,ErrorOn(a5)	6
	move.l	(sp)+,ErrorChr(a5)	5
	move.l	(sp)+,OnErrLine(a5)	4
	move.l	(sp)+,TabBas(a5)	3
	move.l	(sp)+,AForNext(a5)	2.5
	move.l	(sp)+,VarLoc(a5)	2
	move.l	(sp)+,Ad_Labels(a5)	1
	move.l	(sp)+,a6		0
	rts				RTS

*********************************************************************
*		RESERVATION/INIT ESPACE VARIABLES
L_PrgIn		equ	65
*
L65:
	move.l	a2,AData(a5)
	move.l	a2,PData(a5)
	move.l	a0,Ad_Labels(a5)
	move.l	TabBas(a5),a0
; Verifie la taille
	move.w	#$FFFF,-(a0)
	move.l	VarLoc(a5),-(a0)	
	move.l	a0,a6	
	move.w	(a1)+,d2
	move.w	(a1)+,d0
	beq.s	L65b
	sub.w	d2,d0
	ext.l	d0
	move.l	a0,d1
	add.l	d0,d1
	cmp.l	HiChaine(a5),d1
	bls.s	L65e	
; Cree la table
	move.l	ChVide(a5),d1
	moveq	#0,d0
L65a	move.b	(a1)+,d0
	bmi.s	L65b
	move.w	d0,-(a0)
	clr.l	-(a0)
	cmp.b	#2,d0
	bne.s	L65a
	move.l	d1,(a0)
	bra.s	L65a
L65b	move.l	a0,VarLoc(a5)
	sub.w	d2,a0
	move.l	a0,AForNext(a5)
	move.l	a0,TabBas(a5)
	rts
* Erreur, pas assez de place dans le buffer!
L65e	move.l	d0,d3
	neg.l	d3
	add.w	#32,d3
	RBsr	L_PopP
 	RBsr	L_Demande

L66:
L67:
L68:
L69:
L70:
L71:


****************************************************************************
*       	FONCTION LEFT$(a$,xx)
L_FLeft		equ	72
*
L72:    move.l 	(a3)+,d6
        move.l 	(a3)+,a2
        moveq 	#0,d2
        move.w 	(a2)+,d2
        moveq 	#0,d5
L72a:   RBra 	76

****************************************************************************
*       	FONCTION RIGHT$(a$,yy)
L_FRight	equ	73
*
L73:    move.l 	(a3)+,d5
        Rbmi	L_Foncall
        move.l 	(a3)+,a2
        moveq 	#0,d2
        move.w 	(a2)+,d2
        move.l 	#$ffff,d6
        cmp.l 	d2,d5
        bcs.s 	L73c
        move.l 	d2,d5
L73c:   neg.l 	d5
        add.l 	d2,d5
        addq.l 	#1,d5
L73a:   RBra 	76

****************************************************************************
*       	FONCTION MID$(a$,xx)
L_FMid2		equ	74
*
L74:    move.l 	(a3)+,d5
        move.l 	(a3)+,a2
        moveq 	#0,d2
        move.w 	(a2)+,d2
        move.l 	#$ffff,d6
L74a:   RBra 	76

****************************************************************************
*       	FONCTION MID$(a$,xx,yy)
L_FMid3		equ	75
*
L75:    move.l 	(a3)+,d6
        move.l 	(a3)+,d5
        move.l 	(a3)+,a2
        moveq 	#0,d2
        move.w 	(a2)+,d2
L75a:   RBra 	76

****************************************************************************
*       ROUTINE COMMUNE LEFT/RIGHT/MID
L76:    tst.l 	d5                        ;pointe au milieu de la chaine
        Rbmi	L_Foncall
        beq.s 	mi2
        subq.l 	#1,d5
mi2:    add.l 	d5,a2
        cmp.l 	d2,d5                     ;pas pointe trop loin??
        bcc.s 	mi9                      ;si! chaine vide
mi3:    tst.l 	d6
        beq.s 	mi9
        Rbmi	L_Foncall
mi4:    add.l 	d5,d6
        cmp.l 	d2,d6
        bls.s 	mi5
        move.l 	d2,d6
mi5:    sub.l 	d5,d6
mi6:    move.l 	d6,d3
	RBsr 	L_Demande
        move 	d6,(a0)+                   ;poke la longueur
        subq.l 	#1,d6
        bmi.s 	mi8
mi7:    move.b 	(a2)+,(a0)+
        dbra 	d6,mi7
        move 	a0,d0                      ;rend pair
        btst 	#0,d0
        beq.s 	mi8
        addq.l 	#1,a0
mi8:    move.l 	a0,hichaine(a5)
        move.l 	a1,-(a3)
        rts
mi9:    move.l 	ChVide(a5),-(a3)         ;ramene la chaine vide
        rts

****************************************************************************
*       ROUTINE COMMUNE LEFT/RIGHT/MID$ en INSTRUCTIONS
*       A0 contient l'adresse de la variable a changer
L77:   	moveq 	#0,d3
	move.l	a0,a2
	move.l	(a2),a1
        move.w 	(a1)+,d3
        RBsr 	L_demande
	move.l	(a2),d0
        move.l 	a0,(a2)          ;Change la variable
	move.l	d0,a2
        move.w 	d3,d2
        move.w 	d2,(a0)+         ;Longueur
        subq.w 	#1,d2
        lsr.w 	#2,d2
	addq.l	#2,a2
L77b:   move.l 	(a2)+,(a0)+
        dbra 	d2,L77b
        move.l 	a0,hichaine(a5)
        addq.l	#2,a1
	moveq 	#0,d2		;A1/D3= destination
        move.l 	(a3)+,a2 	;A2/D2= source
        move.w 	(a2)+,d2
        rts

***************************************************************************
*		LEFT(a$,xx) en INSTRUCTION
L_ILeft		equ	78
*
L78:    RBsr 	77
        move.l 	(a3)+,d6
        moveq 	#0,d5
	RBra 	82 

****************************************************************************
*       	RIGHT(a$,xx) en INSTRUCTION
L_IRight	equ	79
*
L79:    RBsr 	77
        move.l 	(a3)+,d6
        Rbmi	L_Foncall
        moveq 	#0,d5
        cmp.l 	d3,d6
        bcc.s 	L79b
        move.l 	d3,d5
L79b:   sub.l 	d6,d5
        addq.l 	#1,d5
	RBra 	82

****************************************************************************
*       	MID$(a$,xx) en INSTRUCTION
L_IMid2		equ	80
*
L80:    RBsr 	77
        move.l 	(a3)+,d5
        move.l 	#$ffff,d6
	RBra 	82

****************************************************************************
*       	MID$(a$,xx,yy) en INSTRUCTION
L_IMid3		equ	81
*
L81:   	RBsr 	77
        move.l 	(a3)+,d6
        move.l 	(a3)+,d5
	RBra 	82

****************************************************************************
*       Routine commune LEFT/RIGHT/MID en INSTRUCTION (II)
L82:    tst.l 	d5
        Rbmi	L_Foncall
        beq.s 	mdst2
        subq.l 	#1,d5
mdst2:  add.l 	d5,a1             ;situe dans la chaine a changer
        cmp.l 	d3,d5
        bcc.s 	mdst10            ;trop loin: ne change rien
        tst.l 	d6
        Rbmi	L_Foncall
        beq.s 	mdst10
        add.l 	d5,d6
        cmp.l 	d3,d6
        bls.s 	mdst3
        move.l 	d3,d6
mdst3:  sub.l 	d5,d6
        cmp.l 	d2,d6             ;limite par la taille de la chaine source
        bls.s 	mdst4
        move.l 	d2,d6
mdst4:  subq.l 	#1,d6            ;la chaine source est nulle!
        bmi.s 	mdst10
mdst5:  move.b 	(a2)+,(a1)+
        dbra 	d6,mdst5
mdst10: rts

****************************************************************************
*       	INSTR(a$,b$)
L_Instr2	equ	83
*
L83:    moveq 	#0,d2
        move.l 	(a3)+,a2
        move.w 	(a2)+,d2
        moveq 	#0,d1
        move.l 	(a3)+,a1
        move.w 	(a1)+,d1
        moveq 	#0,d4
	RBsr 	L_InSearch
        move.l 	d3,-(a3)
        rts

****************************************************************************
*       	INSTR(a$,b$,xx)
L_Instr3	equ	84
*
L84:    move.l 	(a3)+,d4
        Rbmi	L_Foncall
        moveq 	#0,d2
        move.l 	(a3)+,a2
        move.w 	(a2)+,d2
        moveq 	#0,d1
        move.l 	(a3)+,a1
        move.w 	(a1)+,d1
	RBsr 	L_InSearch
        move.l 	d3,-(a3)
        rts

****************************************************************************
*       	FLIP$(a$)
L_Flip		equ	85
*
L85:    moveq 	#0,d3
        move.l 	(a3),a2
        move.w 	(a2),d3
        beq.s 	L85a
	RBsr 	L_demande
        addq.l 	#2,a2
        move.w 	d3,(a0)+
        add.l 	d3,a2
        subq 	#1,d2
flp1:   move.b 	-(a2),(a0)+
        dbra 	d3,flp1
        move.w 	a0,d0
        btst 	#0,d0
        beq.s 	flp2
        addq.l 	#1,a0
flp2:   move.l 	a0,hichaine(a5)
        move.l 	a1,(a3)
L85a    rts

****************************************************************************
*       	LEN(a$)
L_Len		equ	86
*
L86:    move.l 	(a3),a2
        moveq 	#0,d2
        move.w 	(a2)+,d2
        move.l 	d2,(a3)
        rts

****************************************************************************
*       	SPACE$(xx)
L_Space		equ	87
*
L87:    move.l 	(a3)+,d3
        move.w 	#$2020,d1
	RBra 	89

****************************************************************************
*       	STRING$("a",xx)
L_String	equ	88
*
L88:    move.l (a3)+,d3
        move.l (a3)+,a2
        move.w (a2)+,d2
        bne.s 	L88a
        moveq 	#0,d3
        bra.s 	L88b
L88a:   move.b 	(a2),d1
        lsl.w 	#8,d1
        move.b 	(a2),d1
L88b:	RBra 	89

****************************************************************************
*       	SUITE et FIN de SPACE$ et STRING$
L89:    tst.l 	d3
        Rbmi	L_Foncall
	RBsr 	L_demande
        move.l 	a0,-(a3)
        move.w 	d3,(a0)+
        beq.s 	L89c
        subq.w 	#1,d3
        lsr.w 	#1,d3
L89b:   move.w 	d1,(a0)+
        dbra 	d3,L89b
L89c:   move.l 	a0,hichaine(a5)
        rts

****************************************************************************
*       	CHR$(xx)
L_Chr		equ	90
*
L90:    move.l 	(a3),d2
        cmp.l 	#$100,d2
        Rbcc	L_Foncall
        lsl.w 	#8,d2
        moveq 	#1,d3
	RBsr 	L_Demande
        move.l 	a0,(a3)
        move.w 	d3,(a0)+
        move.w 	d2,(a0)+
        move.l 	a0,hichaine(a5)
        rts

****************************************************************************
*       	ASC(a$)
L_Asc		equ	91
L91:    moveq 	#0,d0
        move.l 	(a3),a2
        move.w 	(a2)+,d0
        beq.s 	L91a
        move.b 	(a2),d0
L91a:   move.l 	d0,(a3)
        rts

****************************************************************************
*       	BIN$(xx)
L_Bin1		equ	92
*
L92:    move.l 	(a3)+,d1
        moveq 	#-1,d2
        moveq 	#33,d3
	RBra 	96

****************************************************************************
*       	BIN$(xx,yy)
L_Bin2		equ	93
*
L93:    move.l 	(a3)+,d2
        move.l 	(a3)+,d1
        moveq 	#33,d3
	RBra 	96

****************************************************************************
*       	HEX$(xx)
L_Hex1		equ	94
*
L94:    move.l 	(a3)+,d1
        moveq 	#-1,d2
        moveq 	#9,d3
	RBra 	96

****************************************************************************
*       	HEX$(xx,yy)
L_Hex2		equ	95
*
L95:    move.l 	(a3)+,d2
        move.l 	(a3)+,d1
        moveq 	#9,d3
	RBra 	96

****************************************************************************
*       ROUTINE pour BIN et HEX
L96:    RBsr 	L_demande
        move.l 	d1,d0
        exg 	d2,d3
        lea 	2(a0),a0        ;laisse la place pour la longueur
        cmp 	#9,d2
        bne.s 	hx3
	RBsr 	97
        bra.s 	hx4
hx3:    RBsr 	98
hx4:    RBra 	99

****************************************************************************
*       LONGASCII: entier---> hexa ascii
*       Poke dans (A0)+
L_LongAscii	equ	97
L97     move.b 	#"$",(a0)+
        tst.l 	d3
        bmi.s 	ha0
        neg.l 	d3
        add.l	 #8,d3
ha0:    clr 	d4
        move 	#7,d2
ha1:    rol.l 	#4,d0
        move.b	d0,d1
        and.b 	#$0f,d1
        cmp.b 	#10,d1
        bcs.s 	ha2
        add.b 	#7,d1
ha2:    tst.l 	d3
        beq.s 	ha4
        bpl.s 	ha3
        tst 	d4
        bne.s 	ha4
        tst 	d2
        beq.s 	ha4
        tst.b 	d1
        beq.s 	ha5
        moveq 	#1,d4
        bra.s 	ha4
ha3:    subq.l 	#1,d3
        bra.s	ha5
ha4:    add 	#48,d1
        move.b 	d1,(a0)+
ha5:    dbra 	d2,ha1
        rts

****************************************************************************
*       LONGBIN ---> MOT LONG +++> asci binaire
*       Poke dans (a0)+
L_LongBin	equ	98
L98     move.b 	#"%",(a0)+
        tst.l 	d3
        bmi.s 	hb0
        neg.l 	d3
        add.l 	#32,d3
hb0:    clr 	d4
        moveq 	#31,d2
hb1:    clr 	d1
        roxl.l 	#1,d0
        addx.b 	d1,d1
        tst.l 	d3            ;si d3<0: representation PROPORTIONNELLE
        beq.s 	hb3
        bpl.s 	hb2
        tst 	d4
        bne.s 	hb3
        tst 	d2
        beq.s 	hb3
        tst.b 	d1
        beq.s 	hb4
        moveq 	#1,d4
        bra.s	hb3
hb2:    subq.l 	#1,d3
        bra.s	hb4
hb3:    add.b 	#48,d1
        move.b 	d1,(a0)+
hb4:    dbra 	d2,hb1
        rts

****************************************************************************
*       	FINBIN: ROUTINE de fin de HEX/BIN/STR$
L_FinBin	equ	99
*
L99:    move.l 	a0,d0        ;rend pair
        btst 	#0,d0
        beq.s 	hx5
        addq.l 	#1,d0
hx5:    move.l 	d0,hichaine(a5)
        sub.l 	a1,a0
        subq.l 	#2,a0
        move 	a0,(a1)         
        move.l 	a1,-(a3)     	
        rts

****************************************************************************
*       	STR$(xx) ---> entier
L_StrE		equ	100
L100:   moveq 	#16,d3
	RBsr 	L_demande
        lea 	2(a0),a0
        moveq 	#-1,d3
        moveq 	#1,d4
        move.l 	a1,-(sp)
        move.l 	(a3)+,d0
	RBsr 	L_EToAsc
        move.l 	(sp)+,a1
	RBra 	99

****************************************************************************
*       	STR$(xx) ---> floats
L_StrF		equ	101
*
L101:   moveq 	#40,d3
	RBsr 	L_Demande
	lea	2(a0),a0
	move.l	(a3)+,d3
	RBsr	L_StrFlasc
	RBra	99
	
        
***************************************************************************
*       	CHVERBUF
L_Chverbuf	equ	102
*
L102:  	moveq #0,d2
        move.l 	(a3)+,a2
        move.w 	(a2)+,d2
        move.l 	a2,a1
        move.l 	Buffer(a5),a0
        move.w 	d2,d0
        subq.w 	#1,d0
        bmi.s 	L102b
        cmp.w 	#1000,d0
        bcs.s 	L102a
        move.w 	#1000,d0
L102a:  move.b 	(a1)+,(a0)+
        dbra 	d0,L102a
L102b:  clr.b 	(a0)
        rts

***************************************************************************
*       	VALPRG
L_ValPrg	equ	103
*
L103	move.l 	a0,-(sp)     		
        movem.l a1-a2/d5-d7,-(sp) 
        clr 	d4         
; y-a-tl un signe devant?
val1:   move.b 	(a0)+,d0   
        beq 	val10
        cmp.b 	#32,d0
        beq.s 	val1
        move.l 	a0,a2      
        subq.l 	#1,a2
        cmp.b 	#"-",d0
        bne.s 	val1a
        not 	d4
        bra.s 	val1c
val1a:  cmp.b 	#"+",d0
        beq.s 	val1c
val1b:  subq.l 	#1,a0
; est-un HEXA ou un BINAIRE?
val1c:  move.b 	(a0)+,d0
        beq 	val10
        cmp.b 	#32,d0
        beq.s 	val1c
        cmp.b 	#"$",d0      	;chiffre HEXA
        beq 	val5
        cmp.b	#"%",d0       	;chiffre BINAIRE
        beq 	val6
        cmp.b 	#".",d0
        beq.s 	val2
        cmp.b 	#"0",d0
        bcs 	val10
        cmp.b 	#"9",d0
        bhi 	val10
; c'estn chiffre DECIMAL: entier ou float?
val2:   subq.l	#1,a0
	move.l 	a0,a1        	;si float: trouve la fin du chiffre
        clr 	d3
val3:   move.b 	(a1)+,d0
        beq.s 	val4
        cmp.b 	#32,d0
        beq.s 	val3
        cmp.b 	#"0",d0
        bcs.s 	val3z
        cmp.b 	#"9",d0
        bls.s 	val3
val3z:  cmp.b 	#".",d0       	;cherche une "virgule"
        bne.s	val3a
        bset 	#0,d3          	;si deux virgules: fin du chiffre
        beq.s 	val3
        bne.s 	val4
val3a:  cmp.b 	#"e",d0       	;cherche un exposant
        beq.s 	val3b
        cmp.b 	#"E",d0       	;autre caractere: fin du chiffre
        bne.s 	val4
val3ab: move.b 	#"e",-1(a1)  	;met un E minuscule!!!
val3b:  move.b 	(a1)+,d0     	;apres un E, accepte -/+ et chiffres
        cmp.b 	#32,d0
        beq.s 	val3b
        cmp.b 	#"+",d0
        beq.s 	val3c
        cmp.b 	#"-",d0
        bne.s 	val3e
val3c:  bset 	#1,d3          	;+ ou -: c'est un float! 
val3d:  move.b 	(a1)+,d0     	;puis cherche la fin de l'exposant
        cmp.b 	#32,d0
        beq.s 	val3d
val3e:  cmp.b 	#"0",d0
        bcs.s 	val4
        cmp.b 	#"9",d0       	;chiffre! c'est un float
        bls.s 	val3c
val4:   tst 	d3              ;si d3=0: c'est un entier
        beq 	val7
; conversion ASCII--->FLOAT
val4a:	btst	#0,FlagFloat(a5)	;-> Pas de float>>> Entier
	beq.s	Val7
	move.l	a2,a0
        subq.l 	#1,a1
	movem.l	a1/a3-a6,-(sp)
	lea 	BuFloat(a5),a2
	move.l	a2,-(sp)
	moveq 	#18,d1
Ca1:	cmp.l	a0,a1
	beq.s	Ca2
	move.b 	(a0)+,d0
	cmp.b 	#32,d0
	beq.s 	Ca1
	move.b 	d0,(a2)+
	dbra 	d1,Ca1
Ca2:	clr.b 	(a2)
	clr.b 	1(a2)
	moveq	#1,d0
	Rbsr	L_FlRout
	move.l	d0,d3
	addq.l 	#4,sp
	movem.l	(sp)+,a0/a3-a6
        movem.l (sp)+,a1-a2/d5-d7
        addq.l 	#4,sp
        moveq 	#1,d2
	moveq	#0,d0
        rts
; chiffre hexa
val5:   bsr 	hexalong
        bra.s 	val8
; chiffre binaire
val6:   bsr 	binlong
        bra.s 	val8
; chiffre entier
val7:   bsr 	declong
val8:   tst 	d1
        bne.s 	val10           ;si probleme: ramene zero!
        tst 	d4
        beq.s 	val8a
        neg.l 	d0
val8a:  move.l	d0,d3
	movem.l (sp)+,a1-a2/d5-d7
	addq.l	#4,sp
; Conversion en float?
val8b	moveq	#0,d2
	btst	#0,FlagFloat(a5)
	beq.s	val8c
	move.l	a6,-(sp)
	move.l	FloatBase(a5),a6
	move.l	d3,d0
	jsr	SPFlt(a6)
	move.l	d0,d3
	move.l	(sp)+,a6
	moveq	#1,d2
val8c   moveq	#0,d0
        rts
; Ramene zero
val10:  moveq	#0,d3
        movem.l (sp)+,a1-a2/d5-d7
	bsr	val8b
	move.l	(sp)+,a0
	moveq	#1,d0
        rts
; MINI CHRGET POUR LES CONVERSIONS
minichr:  move.b (a0)+,d2
          beq.s mc1
          cmp.b #32,d2
          beq.s minichr
          cmp.b #"a",d2       ;si minuscule: majuscule
          bcs.s mc0
          sub.b #"a"-"A",d2
mc0:      sub.b #48,d2
          rts
mc1:      move.b #-1,d2
          rts
; CONVERSION DECIMAL->HEXA SUR QUATRE OCTETS, SIGNE!
declong:  clr.l d0
          clr.l d2
          clr d3
          move.l a0,-(sp)
ddh1:     bsr minichr
ddh1a:    cmp.b #10,d2
          bcc.s ddh5
          move d0,d1
          mulu #10,d1
          swap d0
          mulu #10,d0
          swap d0
          tst d0
          bne.s ddh2
          add.l d1,d0
          bcs.s ddh2
          add.l d2,d0
          bmi.s ddh2
          addq #1,d3
          bra.s ddh1
ddh2:     move.l (sp)+,a0
          move #1,d1          ;out of range: bpl, et recupere l'adresse
          rts
ddh5:     subq.l #1,a0
	  addq.l #4,sp
          tst d3
          beq.s ddh7
          clr d1              ;OK: chiffre en d0, et beq
          rts
ddh7:     move #-1,d1         ;pas de chiffre: bmi
          rts
; CONVERSION HEXA-ASCII EN HEXA-HEXA
hexalong: clr.l d0
          clr d2
          clr d3
          move.l a0,-(sp)
hh1:      bsr minichr2
          cmp.b #10,d2
          bcs.s hh2
          cmp.b #17,d2
          bcs.s ddh5
          sub #7,d2
hh2:      cmp.b #16,d2
          bcc.s ddh5
          lsl.l #4,d0
          or.b d2,d0
          addq #1,d3
          cmp #9,d3
          bne.s hh1
          beq.s ddh2
* Meme, sans espaces!
minichr2  move.b (a0)+,d2
          beq.s .mc1
          cmp.b #"a",d2       ;si minuscule: majuscule
          bcs.s .mc0
          sub.b #"a"-"A",d2
.mc0:     sub.b #48,d2
          rts
.mc1:     move.b #-1,d2
          rts
; CONVERSION BINAIRE ASCII ---> HEXA SUR QUATRE OCTETS
binlong:  clr.l d0
          clr d2
          clr d3
          move.l a0,-(sp)
bh1:      bsr minichr
          cmp.b #2,d2
          bcc.s ddh5
          roxr #1,d2
          roxl.l #1,d0
          bcs.s ddh2
          addq #1,d3
          cmp #33,d3
          bne.s bh1
          beq ddh1

***************************************************************************
*       	VAL
L_Val		equ	104
*
L104:	RBsr 	L_chverbuf
        move.l 	Buffer(a5),a0
	RBsr	L_ValPrg
	move.l	d3,-(a3)
	rts

**************************************************************************
*		NETTOYAGE VARIABLES
L_ClearVar	equ	105
L105	movem.l	d0-d7/a0-a6,-(sp)

******* Variables programme
	lea	DebRaz(a5),a0
	lea	FinRaz(a5),a1
ClV1:	clr.w	(a0)+
	cmp.l	a1,a0
	bcs.s	ClV1
* Disque
	move.l	#$FFFFFFFF,IffMask(a5)
	Rbsr	L_FillFFree
	Alea	DirFilt,a0
	move.l	DirFNeg(a5),a1
ClV2:	move.b	(a0)+,(a1)+
	bne.s	ClV2
	move.w	DirSize(a5),DirLNom(a5)
	clr.l	T_ClLast(a5)
	move.w	#$0A0D,ChrInp(a5)
	Rbsr	L_CloAll
* DREG/AREG
	lea	CallReg(a5),a0
	move.l	a5,(8+5)*4(a0)			* A5-> Datazone
	move.l	T_ClAsc(a5),(8+4)*4(a0)		* A4-> Clavier actuel
	move.l	StBas(a5),(8+3)*4(a0)		* A3-> Bas du programme
	move.l	T_RastPort(a5),(8+0)*4(a0)	* A0-> Rastport
	move.l	DosBase(a5),7*4(a0)		* D7-> Dos Base
	move.l	T_GfxBase(a5),6*4(a0)		* D6-> Gfx Base
	move.l	T_IntBase(a5),5*4(a0)		* D5-> Int Base
* MENUS
	Rbsr	L_MnRaz
	clr.w	MnMouse(a5)
	lea	MnDFlags(a5),a0
	moveq	#0,d0			* Barre de menu
	bset	#MnTotal,d0
*	bset	#MnBouge,d0
	bset	#MnTBouge,d0	
	move.b	d0,(a0)+
	moveq	#0,d0
	bset	#MnBar,d0
*	bset	#MnBouge,d0
	bset	#MnTBouge,d0
	moveq	#MnNDim-1-1,d1		* Autres dimensions
DRex3:	move.b	d0,(a0)+
	dbra	d1,DRex3
	moveq	#MnNDim-1,d0
	lea	MnChoix(a5),a0
DRex4	clr.w	(a0)+
	dbra	d0,DRex4
* EVERY
	clr.l	EveLabel(a5)
	move.w	ActuMask(a5),d0
	bclr	#BitEvery,d0
	move.w	d0,ActuMask(a5)
* Variables
	move.l	VarBuf(a5),a0
	move.l	a0,a1
	add.l	VarBufL(a5),a1
	move.l	a1,TabBas(a5)
	move.l	a1,VarGlo(a5)
	clr.l	VarLoc(a5)
	move.l	a0,LoChaine(a5)
	move.l	a0,ChVide(a5)
	clr.w	(a0)+
	move.l	a0,HiChaine(a5)
* PARAM
	clr.l	ParamE(a5)
	clr.l	ParamF(a5)
	move.l	ChVide(a5),ParamC(a5)
* Plus de buffers!
	Rbsr	L_OMnEff
* Init float
	move.w	#-1,FixFlg(a5)
	clr.w	ExpFlg(a5)
	movem.l	(sp)+,d0-d7/a0-a6
	rts

**************************************************************************
*		RAMENE LA CHAINE VIDE
L_ChVide	equ	106
*
L106    move.l	ChVide(a5),-(a3)
	rts

**************************************************************************
*		INPUT CLAVIER
L_InputC	equ	107
*
L107	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.w	#",",-(sp)
	clr.l	PrintFile(a5)
	RBra	L_Input
**************************************************************************
*		LINE INPUT CLAVIER
L_LInputC	equ	108
*
L108	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	clr.w	-(sp)	
	clr.l	PrintFile(a5)
	RBra	L_Input
**************************************************************************
*		INPUT FICHIER
L_InputH	equ	109
*
L109	move.w	#",",-(sp)
	Rbsr	L_GetFile
	Rbeq	L_FilNO
	move.l	a2,PrintFile(a5)
	clr.l	-(a3)
	RBra	L_Input

**************************************************************************
*		LINE INPUT FICHIER
L_LInputH	equ	110
*
L110	clr.w	-(sp)
	RBsr	L_GetFile
	Rbeq	L_FilNO
	move.l	a2,PrintFile(a5)
	clr.l	-(a3)
	RBra	L_Input

**************************************************************************
*		INPUT!	
L_Input		equ	111
*
L111	move.l	(a3)+,-(sp)
	move.w	d6,d0
	mulu	#6,d0
	add.w	d0,a3
	clr.l	DeFloat(a5)
	bset	#7,EveLabel(a5)
IInp0	movem.l	a3/d6,-(sp)
	move.l	Buffer(a5),a0
	clr.b	(a0)
	tst.l	PrintFile(a5)
	bne.s	ReDInp
; Imprimer la chaine
	move.l 	8(sp),d0
	beq.s	L111a
	move.l	d0,a2
        move.w 	(a2)+,d2
        beq.s 	ReInp
	move.b	0(a2,d2.w),d3
	clr.b	0(a2,d2.w)
	move.l	a2,a1
	WiCall	Print
	move.b	d3,0(a2,d2.w)
	bra.s	ReInp
; Imprime le ?
L111a   moveq	#"?",d1
	WiCall	ChrOut
	moveq	#" ",d1
	WiCall	ChrOut
******* Rempli le buffer!
ReInp:	
* Clavier
	WiCall	XYCuWi
	movem.l	d6-d7/a2-a6,-(sp)
	move.l	Buffer(a5),a4
	moveq	#4+2,d7			* Retour si CONTROL-C!
	move.w	#510,d6
	RBsr	L_LEdit
	moveq	#0,d3
	move.w	d5,d3
	movem.l	(sp)+,d6-d7/a2-a6
	tst.w	d0
	beq.s	InnPut
	bra	InpStp
* Fichier!
ReDInp:	
	move.l	PrintFile(a5),a2
	move.l	Buffer(a5),a1
	clr.b	(a1)
	moveq	#0,d1
	move.w	12(sp),d2
	move.b	ChrInp+1(a5),d3
	move.b	ChrInp(a5),d4
	bra.s	InpD1
InpD0	move.b	d0,(a1)+
	addq.w	#1,d1
	cmp.w	#1000,d1
	Rbcc	L_InpTL
InpD1	Rbsr	L_GetByte
	cmp.b	d0,d2			* Stop aux virgules
	beq.s	InpD2
	cmp.b	d0,d3			* Premier caractere?
	bne.s	InpD0
 	tst.b	d4			* Sauter le deuxieme?
	bmi.s	InpD2
	Rbsr	L_GetByte
InpD2	clr.b	(a1)
	move.l	a1,d3
	sub.l	Buffer(a5),d3		* Nombre de caracteres -> D3

******* INPUT/LINE INPUT: interprete le buffer!
InnPut:	move.l	Buffer(a5),a2
Inn1:	move.w	-2(a3),d2
	cmp.b	#2,d2
	bne.s	Inn5
* Variable alphanumerique
	move.l	-6(a3),a0
	move.l	ChVide(a5),(a0)		* Libere la memoire!
	tst.l	d3
	beq	Inn10
	Rbsr	L_DDemande
	addq.l	#2,a0
	move.b	12+1(sp),d1
Inn2:	move.b	(a2)+,d0
	move.b	d0,(a0)+
	beq.s	Inn3
	cmp.b	d0,d1
	bne.s	Inn2
Inn3:	subq.l	#1,a0
	subq.l	#1,a2
	move.l	a0,d0
	sub.l	a1,d0
	subq.l	#2,d0
	move.w	d0,(a1)
	btst	#0,d0
	beq.s	Inn4
	addq.l	#1,a0
Inn4:	move.l	a0,HiChaine(a5)
	move.l	-6(a3),a0
	move.l	a1,(a0)
	bra.s	Inn10
* Variable numerique
Inn5:	move.l	a2,a0
	RBsr	L_ValPrg
	move.l	a0,a2
	move.l	d3,d0
	move.w	-2(a3),d1
	move.b	(a2),d3
	beq.s	Inn6
	cmp.b	12+1(sp),d3
	beq.s	Inn6
	btst	#0,FlagFloat(a5)
	bne	InnRedo
Inn6:	cmp.b	d1,d2
	beq.s	Inn8
	tst.b	d1
	beq.s	Inn7
; Inttofl
	move.l	a6,-(sp)
	move.l	FloatBase(a5),a6
	jsr	SPFlt(a6)
	move.l	(sp)+,a6
	bra.s	Inn8
; Fltoint
Inn7	move.l	a6,-(sp)
	move.l	FloatBase(a5),a6
	jsr	SPFix(a6)
	move.l	(sp)+,a6
Inn8:	move.l	-6(a3),a0
	move.l	d0,(a0)
* Encore une variable a prendre???
Inn10:	subq.l	#6,a3
	subq.w	#1,d6
	beq.s	Inn11
	cmp.b	#",",(a2)+
	beq	Inn1
* ??
	tst.l	PrintFile(a5)
	bne	ReDInp
	WiCalA	Print,InnEnc(pc)
	move.l	Buffer(a5),a0
	clr.b	(a0)
	bra	ReInp
* Fini!
Inn11:	movem.l	(sp)+,a3/d6
	addq.l	#6,sp
	RBsr	L_EndByte
	bclr	#7,EveLabel(a5)
	rts
* Redo from start
InnRedo	
	RBsr	L_EndByte
	tst.l	PrintFile(a5)
	Rbne	L_Typemis
	lea	Redo(pc),a1
	WiCall	Print
	movem.l	(sp)+,a3/d6
	bra	IInp0
InpStp	RBra	L_Stop
InnEnc:	dc.b	13,10,"?? ",0
Redo	dc.b	"Please redo from start",13,10,0
	even

**************************************************************************
*		Retour chariot
L_CRet		equ	112
*
L112	WiCalA	Print,InnRet(pc)
	rts
InnRet:	dc.b 	13,10,0,0

**************************************************************************
*		Editeur ligne
L_LEdit		equ	113
*
L113	move.w	d1,LEdXCu(a5)
	move.w	d2,LEdYCu(a5)
	ext.l	d1
	ext.l	d2
	WiCall	Locate

******* Trouve la fin du mot
	moveq	#-1,d5
LEd1:	addq.w	#1,d5
	WiCalD	ChrOut,28
	cmp.w	d6,d5
	bcc.s	LEd2
	tst.b	0(a4,d5.w)
	bne.s	LEd1
LEd2:	clr.b	0(a4,d5.w)
	move.w	d5,d4
	WiCalD	ChrOut,29

******* Boucle de l'editeur
LEdLoop:WiCalA	Print,LEdP1(pc)		* Souvenir curseur
	move.w	LEdXCu(a5),d1
	move.w	LEdYCu(a5),d2
	ext.l	d1
	ext.l	d2
	WiCall	Locate
	move.l	a4,a1
	WiCall	Print			* Imprime la chaine
	WiCalA	Print,LEdP2(pc)		* Relocate
	clr.b	0(a4,d5.w)		* Efface le 32 si BACKSPACE

LEdL:	btst	#2,d7			* Correction du BUG input!
	beq.s	LEdL0
	move.w	T_Actualise(a5),d0
	and.w	ActuMask(a5),d0
	bclr	#BitControl,d0
	beq.s	LEdL0
	move.w	d0,T_Actualise(a5)	* CONTROL-C -> revient!!!!
	moveq	#-1,d0
	rts
LEdL0	
	SyCall	Test_Cyclique
	tst.w	T_AMOSHere(a5)
	bne.s	LEdL0a
	Rbsr	L_WaitMul
LEdL0a	
	btst	#1,d7			* Tester?
	beq.s	LEdLl
	Rbsr	L_Tester
LEdLl	
	SyCall	Inkey
	tst.l	d1
	beq.s	LEdL
	swap	d1
	cmp.b	#$4F,d1			* Fleche gauche
	beq	LEdG
	cmp.b	#$4E,d1			* Fleche droite
	beq	LEdR
	cmp.b	#$41,d1			* BackSpace
	beq	LEdB
	cmp.b	#$46,d1			* Delete
	beq	LEdD
	swap	d1
	cmp.b	#13,d1
	beq.s	LEdRet
	cmp.b	#32,d1
	bcc.s	LEdI
* Si FLAG, revient avec le SCANCODE en D1.W!
	btst	#0,d7
	beq.s	LEdL
	swap	d1
	moveq	#1,d0
	rts
* Insere une lettre
LEdI:	cmp.w	d6,d5			* Longueur maximum
	bcc	LEdL
	move.w	d5,d0
LEdI1:	move.b	0(a4,d0.w),1(a4,d0.w)
	subq.w	#1,d0
	cmp.w	d4,d0
	bge.s	LEdI1
	move.b	d1,0(a4,d4.w)
	addq.w	#1,d5
	addq.w	#1,d4
	WiCalD	ChrOut,28
	bra	LEdLoop
* Return
LEdRet:	move.w	LEdXCu(a5),d1
	move.w	LEdYCu(a5),d2
	ext.l	d1
	ext.l	d2
	WiCall	Locate
	moveq	#0,d0
	rts
* Curseur a gauche
LEdG:	tst.w	d4
	beq	LEdL
	and.w	#$0300,d1
	bne.s	LedMg
	subq.w	#1,d4
	WiCalD	ChrOut,29
	bra	LEdL
* Mot gauche
LEdMg:	subq.w	#1,d4
	WiCalD	ChrOut,29
	tst.w	d4
	beq	LEdL
	move.b	-1(a4,d4.w),d2
	Rbsr	L_Lettre
	bne.s	LEdMg
	bra	LEdL
* Curseur a droite
LEdR:	cmp.w	d5,d4
	bcc	LEdL
	and.w	#$0300,d1
	bne.s	LEdMd
	addq.w	#1,d4
	WiCalD	ChrOut,28
	bra	LEdL
* Mot droit
LEdMd:	addq.w	#1,d4
	WiCalD	ChrOut,28
	cmp.w	d5,d4
	bcc	LEdL
	move.b	-1(a4,d4.w),d2
	Rbsr	L_Lettre
	bne.s	LEdMd
	bra	LEdL
* BackSpace
LEdB:	and.w	#$0300,d1
	bne.s	LEdCl
	tst.w	d4
	beq	LEdL
	subq.w	#1,d4
	WiCalD	ChrOut,29
* Delete
LEdD:	and.w	#$0300,d1
	bne.s	LEdCl
	cmp.w	d5,d4
	bcc	LEdL
	move.w	d4,d0
LEdD1:	move.b	1(a4,d0.w),0(a4,d0.w)
	addq.w	#1,d0
	cmp.w	d5,d0
	bcs.s	LEdD1
	subq.w	#1,d5
	clr.b	1(a4,d5.w)
	move.b	#" ",0(a4,d5.w)
	bra	LEdLoop	
* Nettoyage ligne
LEdCl:	move.l	a4,a0
LEdC1:	tst.b	(a0)
	beq.s	LEdC2
	move.b	#" ",(a0)+
	bra.s	LEdC1
LEdC2:	clr.w	d4
	clr.w	d5
	move.w	LEdXCu(a5),d1
	move.w	LEdYCu(a5),d2
	ext.l	d1
	ext.l	d2
	WiCall	Locate
	bra	LEdLoop

******* Chaines de controle
*	Stockage des positions en X / Y
LEdP1:	dc.b 27,"C0",27,"M0",27,"M2",0
*	Restitue les positions en X / Y
LEdP2:	dc.b 27,"M1",27,"M3",27,"C1",0
	even


*******************************************************************
*		= INKEY$
L_FInky		equ 	114
*
L114:	SyCall	Inkey
	tst.l	d1
	beq.s	L114a
	move.w	d1,d2
	swap	d1
	move.w	d1,SScan(a5)
	moveq	#2,d3
	RBsr	L_Demande
	move.w	#1,(a0)+
	move.b	d2,(a0)+
	addq.l	#1,a0
	move.l	a0,HiChaine(a5)
	move.l	a1,-(a3)
	rts
L114a	move.l	ChVide(a5),-(a3)
	rts

*******************************************************************
*		=SCANCODE
L_FScan		equ 	115
*
L115:	moveq	#0,d3
	move.b	SScan+1(a5),d3
	clr.b	SScan+1(a5)
	move.l	d3,-(a3)
	rts

*******************************************************************
*		=SCANSHIFT
L_FScSh		equ	116
*
L116:	moveq	#0,d3
	move.b	SScan(a5),d3
	clr.b	SScan(a5)
	move.l	d3,-(a3)
	rts

*******************************************************************
*		=KEY STATE(n)
L_FKSt		equ	117
*
L117	move.l	(a3)+,d3
	cmp.l	#128,d3
	Rbcc	L_Foncall
	move.l	d3,d1
	SyCall	Instant
	move.l	d1,-(a3)
	rts

*******************************************************************
*		=KEY SHIFT
L_FShft		equ	118
*
L118	SyCall	Shifts
	move.l	d1,-(a3)
	rts

*******************************************************************
*		Routine JOY
L_FJ		equ	119
*
L119	move.l	(a3)+,d1
	cmp.l	#1,d1
	Rbhi	L_Foncall
	SyCall	Joy
	rts

*******************************************************************
*		=JOY(n) 
L_FJoy		equ	120
*
L120	RBsr	L_FJ
	move.l	d1,-(a3)
	rts

*******************************************************************
*		=JUP(n) 
L_FJup		equ	121
*
L121	RBsr	L_FJ
	btst	#0,d1
	RBra	L_FJ2
*******************************************************************
*		=JDOWN(n)
L_FJDown	equ	122
*
L122	RBsr	L_FJ
	btst	#1,d1
	RBra	L_FJ2
*******************************************************************
*		=JRIGHT(n)
L_FJRight	equ	123
*
L123	RBsr	L_FJ
	btst	#3,d1
	RBra	L_FJ2
*******************************************************************
*		=JLEFT(n)
L_FJLeft	equ	124
*
L124	RBsr	L_FJ
	btst	#2,d1
	RBra	L_FJ2
*******************************************************************
*		=FIRE(n)
L_FFire		equ	125
*
L125	RBsr	L_FJ
	btst	#4,d1
	RBra	L_FJ2
*******************************************************************
*		Routine 2 vrai/faux
L_FJ2		equ	126
*
L126	beq.s	JF
JT	moveq	#-1,d3
	move.l	d3,-(a3)
	rts
JF	moveq	#0,d3
	move.l	d3,-(a3)
	rts

*******************************************************************
*		PUTKEY a$
L_PutKy		equ	127
*
L127	RBsr	L_ChVerBuf
	cmp.w	#64,d2
	Rbcc	L_Stolong
	move.l	Buffer(a5),a1
	SyCall	PutKey
	rts

*******************************************************************
*		CLEARKEY
L_ClKy		equ	128
*
L128	SyCall	ClearKey
	rts

*******************************************************************
*		WAIT KEY
L_WtKy		equ	129
*
L129	RBsr	L_Tests
	
	IFNE	CDebug
	btst	#6,CiaaPra
	bne.s	Bbig
	EcCalD	AMOS_WB,0
	illegal
	rts
	ENDC

Bbig	SyCall	Inkey
	tst.l	d1
	beq.s	L129
	rts

*******************************************************************
*		KEY$(nn)=a$
L_StKy		equ	130
*
L130	RBsr	L_ChVerBuf
	move.l	(a3)+,d1
	subq.l	#1,d1
	cmp.l	#20,d1
	Rbcc	L_Foncall
	move.l	Buffer(a5),a1
	SyCall	SetFunK
	rts

****************************************************************************
*		=KEY$(nn)
L131	move.l	(a3)+,d1
	subq.l	#1,d1
	cmp.l	#20,d1
	Rbcc	L_Foncall
	move.l	Buffer(a5),a2
	RBsr	L_SsGtKy
	RBsr	L_Demande
	move.w	d3,(a0)+
	addq.w	#1,d3
	lsr.w	#1,d3
	subq.w	#1,d3
	bmi.s	GtKy2
GtKy1:	move.w	(a2)+,(a0)+
	bne.s	GtKy1
GtKy2:	move.l	a0,HiChaine(a5)
	move.l	a1,-(a3)
	rts

****************************************************************************
*		=SCAN$(nn,sh)
L_FKy2		equ	132
*
L132	move.l	(a3)+,d4
	move.l	(a3)+,d5
	RBra	L_FKy
****************************************************************************
*		=SCAN$(nn)
L_FKy1		equ	133
*
L133	move.l	(a3)+,d5
	moveq	#0,d4
	RBra	L_FKy
****************************************************************************
*		Routine SCAN
L_FKy:		equ	134
*
L134	cmp.l	#256,d5
	Rbcc	L_Foncall
	cmp.l	#256,d4
	Rbcc	L_Foncall
	moveq	#4,d3
	RBsr	L_Demande
	move.w	d3,(a0)+
	move.b	#1,(a0)+
	move.b	d4,(a0)+
	move.b	d5,(a0)+
	move.b	#0,(a0)+
	move.l	a0,HiChaine(a5)
	move.l	a1,-(a3)
	rts
****************************************************************************
*		Routine =Key
L_SsGtKy	equ	135
*
L135	movem.l	d0-d2/a0-a2,-(sp)
	SyCall	GetFunK
	moveq	#0,d3
SGk0:	clr.b	(a2)
	move.b	(a0)+,d0
	beq.s	SGkX
	cmp.b	#13,d0			* RETURN
	beq.s	SGk2
	cmp.b	#"'",d0			* REM
	beq.s	SGk0
	cmp.b	#1,d0			* SCAN CODE
	beq.s	SGk4
	cmp.b	#32,d0
	bcc.s	SGk1
	moveq	#".",d0
SGk1:	move.b	d0,(a2)+
	addq.w	#1,d3
	bra.s	SGk0
SGk2:	move.b	#"`",d0
	cmp.b	#10,(a0)+
	beq.s	SGk1
	subq.l	#1,a1
	bra.s	SGk1
SGk4:	addq.l	#3,a1
	bra.s	SGk0
SGkX:	movem.l	(sp)+,d0-d2/a0-a2
	rts


***********************************************************
*		KEY SPEED delai,vitesse
L_KSpeed	equ	136
*
L136	move.l	(a3)+,d2
	Rbmi	L_Foncall
	move.l	(a3)+,d1
	Rbmi	L_Foncall
	move.l	Buffer(a5),a1
	SyCall	KeySpeed
	rts

****************************************************************************
*     		UPPER$(a$)
L_FUpp		equ	137
*
L137	move.l	(a3)+,a2
	moveq	#0,d2
	move.w	(a2)+,d2
        move.l 	d2,d3
        Rbeq	L_ChVide
        RBsr 	L_demande
        move.w 	d3,(a0)+
        subq 	#1,d3
fnup1:  move.b 	(a2)+,d0
        cmp.b 	#"A",d0
        bcs.s 	fnup2
        cmp.b 	#"Z",d0
        bhi.s 	fnup2
        add.b 	#$20,d0
fnup2:  move.b 	d0,(a0)+
        dbra 	d3,fnup1
        RBra	L_FinBin

****************************************************************************
*     		LOWER$(a$)
L_FLwr		equ	138
*
L138	move.l	(a3)+,a2
	moveq	#0,d2
	move.w	(a2)+,d2
        move.l 	d2,d3
        Rbeq	L_ChVide
        RBsr 	L_demande
        move.w 	d3,(a0)+
        subq 	#1,d3
fnlw1:  move.b 	(a2)+,d0
        cmp.b 	#"a",d0
        bcs.s 	fnlw2
        cmp.b 	#"z",d0
        bhi.s	fnlw2
        sub.b 	#$20,d0
fnlw2:  move.b 	d0,(a0)+
        dbra 	d3,fnlw1
        RBra	L_FinBin

****************************************************************************
*       	TAB$ et autres fonctions
L_FTab		equ	139
L139	moveq	#9,d2
	move.l	d2,-(a3)
	RBra	L_Chr
*
L_FClf		equ	140
L140	moveq	#29,d2
	move.l	d2,-(a3)
	RBra	L_Chr
*
L_FCrt		equ	141
L141	moveq	#28,d2
	move.l	d2,-(a3)
	RBra	L_Chr
*
L_FCup		equ	142
L142	moveq	#30,d2
	move.l	d2,-(a3)
	RBra	L_Chr
*
L_FCDn		equ	143
L143	moveq	#31,d2
	move.l	d2,-(a3)
	RBra	L_Chr

****************************************************************************
*		PAPER$(x) / PEN$(x)
L_FPen		equ	144
L144	lea	L144a(pc),a2
	RBra	L_FPn
L144a	dc.b 27,"P0",0
	even
*
L_FPap		equ	145
L145	lea	L145a(pc),a2
	RBra	L_FPn
L145a	dc.b 27,"B0",0
	even
*
L_FPn		equ	146
L146	move.l	(a3)+,d3
	cmp.l	#32,d3
	Rbcc	L_WFoncall
	add.b	#"0",d3
	move.b	d3,2(a2)
	moveq	#4,d3
	RBsr	L_Demande
	move.w	#3,(a0)+
	move.l	(a2)+,(a0)+
	move.l	a0,HiChaine(a5)
	move.l	a1,-(a3)
	rts

****************************************************************************
*		AT(X,Y)
L_FAt		equ	147
*
L147	moveq	#0,d3
	moveq	#0,d4
	moveq	#0,d1
	move.l	(a3)+,d2
	cmp.l	#EntNul,d2
	beq.s	FnAt1
	cmp.l	#255-48,d2
	Rbhi	L_WFoncall
	move.w	d2,d1
	moveq	#3,d3
	bset	#1,d4
FnAt1:	moveq	#0,d0
	move.l	(a3)+,d2
	cmp.l	#EntNul,d2
	beq.s	FnAt2
	cmp.l	#255-48,d2
	Rbhi	L_WFoncall
	move.w	d2,d0
	addq.l	#3,d3
	bset	#0,d4
FnAt2:	tst.w	d4
	Rbeq	L_ChVide
	RBsr	L_Demande
	move.w	d3,(a0)+
	btst	#0,d4
	beq.s	FnAt3
	add.w	#"0",d0
	move.b	#27,(a0)+
	move.b	#"X",(a0)+
	move.b	d0,(a0)+
FnAt3:	btst	#1,d4
	beq.s	FnAt4
	add.w	#"0",d1
	move.b	#27,(a0)+
	move.b	#"Y",(a0)+
	move.b	d1,(a0)+
FnAt4:	RBra	L_FinBin

****************************************************************************
*		CMOVE$(DX,DY)
L_FCMv		equ	148
*
L148	moveq	#0,d3
	moveq	#0,d4
	moveq	#0,d1
	move.l	(a3)+,d2
	beq.s	FnCMv1
	cmp.l	#EntNul,d2
	beq.s	FnCMv1
	cmp.l	#128,d2
	Rbge	L_WFoncall
	cmp.l	#-128,d2
	Rble	L_WFoncall
	move.w	d2,d1
	moveq	#3,d3
	bset	#1,d4
FnCMv1:	moveq	#0,d0
	move.l	(a3)+,d2
	beq.s	FnCMv2
	cmp.l	#EntNul,d2
	beq.s	FnCMv2
	cmp.l	#128,d2
	Rbge	L_WFoncall
	cmp.l	#-128,d2
	Rble	L_WFoncall
	move.w	d2,d0
	addq.l	#3,d3
	bset	#0,d4
FnCMv2:	tst.w	d4
	Rbeq	L_ChVide
	RBsr	L_Demande
	move.w	d3,(a0)+
	btst	#0,d4
	beq.s	FnCMv3
	move.b	#27,(a0)+
	move.b	#"N",(a0)+
	add.b	#128,d0
	move.b	d0,(a0)+
FnCMv3:	btst	#1,d4
	beq.s	FnCMv4
	move.b	#27,(a0)+
	move.b	#"O",(a0)+
	add.b	#128,d1
	move.b	d1,(a0)+
FnCMv4:	RBra	L_FinBin

****************************************************************************
*       	REPEAT$(a$,n)
L_FRpt		equ	149
*
L149	move.l	(a3)+,d3
	Rbeq	L_WFoncall
	cmp.l	#207,d3
	Rbcc	L_WFoncall
	lea	ChRpt(pc),a0
	RBra	L_FinRpt
ChRpt:	dc.b 	27,"R0",0,27,"R0",0
	even

****************************************************************************
*       	SURROUND$
L_FSur		equ	150
*
L150	move.l	(a3)+,d3
	Rbeq	L_WFoncall
	cmp.l	#16,d3
	Rbcc	L_WFoncall
	lea	ChSur(pc),a0
	RBra	L_FinRpt
ChSur:	dc.b 	27,"E0",0,27,"E0",0
	even

****************************************************************************
*       	ZONE$
L_FZone		equ	151
*
L151	move.l	(a3)+,d3
	Rbeq	L_WFoncall
	cmp.l	#255-48,d3
	Rbcc	L_WFoncall
	lea	ChZon(pc),a0
	RBra	L_FinRpt
ChZon:	dc.b 	27,"Z0",0,27,"Z0",0
	even

****************************************************************************
*		Routine ZONE/SURRUND...
L_FinRpt	equ	152
*
L152	add.b	#"0",d3
	move.b	d3,6(a0)
	move.l	(a3)+,a2
	moveq	#0,d2
	move.w	(a2)+,d2
	move.l	a3,-(sp)
	move.l	a0,a3
	move.l	d2,d3
	addq.l	#6,d3
	RBsr	L_Demande
	move.w	d3,(a0)+
FnR1:	move.b	(a3)+,(a0)+
	bne.s	FnR1
	tst.b	-(a0)
	subq.w	#1,d2
	bmi.s	FnR3
FnR2:	move.b	(a2)+,(a0)+
	dbra	d2,FnR2
FnR3:	move.b	(a3)+,(a0)+
	bne.s	FnR3
	tst.b	-(a0)
	move.l	(sp)+,a3
	RBra	L_FinBin
	even

******************************************************************
*		WINDOPEN n,x,y,tx,ty[,b,char]
L_WnOp5		equ	153
L_WnOp6		equ	154
L_WnOp7		equ	155
*
L153	clr.l	-(a3)
	clr.l	-(a3)
	RBra	155
L154	clr.l	-(a3)
	RBra	155
L155	tst.w	ScOn(a5)
	Rbeq	L_Scnop
	move.l	d7,-(sp)
	move.l	(a3)+,a1
	move.l	(a3)+,d7
	moveq	#1,d6
	move.l	(a3)+,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	cmp.l	#65536,d1
	Rbcc	L_WFoncall
	WiCall	WindOp
	Rbne	L_EcWiErr
	move.l	(sp)+,d7
	rts
	
******************************************************************
*		WIND SAVE
L_WnSave	equ	156
*
L156	move.l	ScOnAd(a5),d0
	Rbeq	L_Scnop
	move.l	d0,a0
	move.w	#-1,EcWiDec(a0)
	rts

******************************************************************
*	WIND MOVE n,x,y
L_WnMove	equ	157
*
L157	tst.w	ScOn(a5)
	Rbeq	L_Scnop
	move.l	(a3)+,d2
	Rbmi	L_WFoncall
	move.l	(a3)+,d1
	Rbmi	L_WFoncall
	WiCall	MoveWi
	Rbne	L_EcWiErr
	rts

******************************************************************
*		WIND SIZE x,y
L_WnSize	equ	158
*
L158	tst.w	ScOn(a5)
	Rbeq	L_Scnop
	move.l	(a3)+,d2
	Rbmi	L_WFoncall
	move.l	(a3)+,d1
	Rbmi	L_WFoncall
	WiCall	SizeWi	
	Rbne	L_EcWiErr
	rts
	
******************************************************************
*		WIND CLOSE
L_WnClo	equ	159
*
L159	tst.w	ScOn(a5)
	Rbeq	L_Scnop
	WiCall	WinDel
	Rbne	L_EcWiErr
	rts

******************************************************************
*		WINDOW n
L_WnDow		equ	160
*
L160	tst.w	ScOn(a5)
	Rbeq	L_Scnop
	move.l	(a3)+,d1
	WiCall	QWindow
	Rbne	L_EcWiErr
	rts

******************************************************************
*		=WINDON
L_FWnDon	equ	161
*
L161	tst.w	ScOn(a5)
	Rbeq	L_Scnop
	WiCall	GAdr
	move.l	d1,-(a3)
	rts

******************************************************************
*	WRITING
L_WnWrt1	equ	162
L162	clr.l	-(a3)
	RBra	L_WnWrt2
L_WnWrt2	equ	163
L163	move.l	(a3)+,d0
	cmp.l	#3,d0
	Rbcc	L_WFoncall
	lsl.w	#3,d0
	move.l	(a3)+,d1
	cmp.l	#5,d1
	Rbcc	L_WFoncall
	or.w	d1,d0
	add.b	#"0",d0
	lea	ChWrt(pc),a1
	move.b	d0,2(a1)
	RBra	L_GoWn
ChWrt:	dc.b 	27,"W0",0

******************************************************************
*	BORDER n,paper,pen
L_WnBor		equ	164
*
L164	tst.w	ScOn(a5)
	Rbeq	L_Scnop
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	WiCall	SBord
	Rbne	L_EcWiErr
	rts

******************************************************************
*	TITLE TOP a$
L_WnTTop	equ	165
*
L165	RBsr	L_ChVerBuf
	move.l	Buffer(a5),d1
	moveq	#0,d2
	RBra	L_WnTT

******************************************************************
*	TITLE BOTTOM a$
L_WnTBot	equ	166
*
L166	RBsr	L_ChVerBuf
	move.l	Buffer(a5),d2
	moveq	#0,d1
	RBra	L_WnTT
*
L_WnTT		equ	167
L167	tst.w	ScOn(a5)
	Rbeq	L_Scnop
	WiCall	STitle
	Rbne	L_EcWiErr
	rts

******************************************************************
*		XYCURS
L_FXCu		equ	168
*
L168	tst.w	ScOn(a5)
	Rbeq	L_Scnop
	WiCall	XYCuWi
	move.l	d1,-(a3)
	rts
*
L_FYCu		equ	169
L169	tst.w	ScOn(a5)
	Rbeq	L_Scnop
	WiCall	XYCuWi
	move.l	d2,-(a3)
	rts

******************************************************************
*		SET CURS 
L_WnSCu		equ	170
*
L170	move.l	Buffer(a5),a1
	lea	8(a1),a0
	moveq	#7,d0
WnSCu1:	move.l	(a3)+,d1
	move.b	d1,-(a0)
	dbra	d0,WnScu1
	WiCall	SCurWi
	rts

******************************************************************
*		LOCATE x,y
L_WnLoc		equ	171
*
L171	tst.w	ScOn(a5)
	Rbeq	L_Scnop
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	WiCall	Locate
	Rbne	L_EcWiErr
	rts

******************************************************************
*		CENTRE a$
L_WnCen		equ	172
*
L172	tst.w	ScOn(a5)
	Rbeq	L_Scnop
	RBsr	L_ChVerBuf
	move.l	Buffer(a5),a1
	WiCall	Centre
	Rbne	L_EcWiErr
	rts

******************************************************************
*	CMOVE 	DX,DY
L_WnCMv		equ	173
*
L173	move.l	(a3)+,d0
	cmp.l	#EntNul,d0
	bne.s	WnCm2
WnCm1:	moveq	#0,d0
WnCm2:	move.l	(a3)+,d1
	cmp.l	#EntNul,d1
	bne.s	WnCm4
WnCm3:	moveq	#0,d1
WnCm4:	add.l	#128,d0
	add.l	#128,d1
	cmp.l	#255,d0
	Rbhi	L_WFoncall
	cmp.l	#255,d1
	Rbhi	L_WFoncall
	lea	ChCMv(pc),a1
	move.b	d1,2(a1)
	move.b	d0,5(a1)
	RBra	L_GoWn
ChCMv:	dc.b 27,"N0",27,"O0",0
	even

******************************************************************
*		CUR PEN n
L_WnCPe		equ	174
*
L174	lea	ChCPe(pc),a1
	RBra	L_WnPp
ChCPe	dc.b 27,"D0",0

******************************************************************
*		PAPER n
L_WnPap		equ	175
*
L175	lea	ChPap(pc),a1
	RBra	L_WnPp
ChPap	dc.b 27,"B0",0
	
******************************************************************
*		PEN
L_WnPen		equ	176
*
L176	lea	ChPen(pc),a1
	RBra	L_WnPp
ChPen:	dc.b 27,"P0",0
*
L_WnPp		equ	177
L177	move.l	(a3)+,d3
	cmp.l	#64,d3
	Rbcc	L_WFoncall
	add.b	#"0",d3
	move.b	d3,2(a1)
	RBra	L_GoWn

******************************************************************
*		CLW
L_WnClw		equ	178
L178	lea	ChClw(pc),a1
	RBra	L_GoWn
ChClw:	dc.b 	25,0
******************************************************************
*		Home
L_WnHome	equ	179
L179	lea	ChHom(pc),a1
	RBra	L_GoWn
ChHom:	dc.b 	12,0
******************************************************************
*		CLEFT
L_WnCLf		equ	180
L180	lea	ChCLf(pc),a1
	RBra	L_GoWn
ChCLf:	dc.b 	29,0
******************************************************************
*		CRIGHT
L_WnCRt		equ	181
L181	lea	ChCRt(pc),a1
	RBra	L_GoWn
ChCRt:	dc.b 	28,0
******************************************************************
*		CUP
L_WnCup		equ	182
L182	lea	ChCUp(pc),a1
	RBra	L_GoWn
ChCUp:	dc.b 	30,0
******************************************************************
*		CDOWN
L_WnCDn		equ	183
L183	lea	ChCDn(pc),a1
	RBra	L_GoWn
ChCDn:	dc.b 	31,0
******************************************************************
*		CURSOFF
L_WnCOf		equ	184
L184	lea	ChCOf(pc),a1
	RBra	L_GoWn
ChCOf:	dc.b 	27,"C0",0
******************************************************************
*		CURSON
L_WnCOn		equ	185
L185	lea	ChCOn(pc),a1
	RBra	L_GoWn
ChCOn:	dc.b 	27,"C1",0
******************************************************************
*		INVERSE ON
L_WnIOn		equ	186
L186	lea	ChIOn(pc),a1
	RBra	L_GoWn
ChIOn:	dc.b 	27,"I1",0
******************************************************************
*		INVERSE OFF
L_WnIOf		equ	187
L187	lea	ChIOf(pc),a1
	RBra	L_GoWn
ChIOf:	dc.b 	27,"I0",0
******************************************************************
*		UNDER ON
L_WnUOn		equ	188
L188	lea	ChUOn(pc),a1
	RBra	L_GoWn
ChUOn:	dc.b 	27,"U1",0
******************************************************************
*		UNDER OFF
L_WnUOf		equ	189
L189	lea	ChUOf(pc),a1
	RBra	L_GoWn
ChUOf:	dc.b 	27,"U0",0
******************************************************************
*		SCROLLING ON
L_WnScOn	equ	190
L190	lea	ChScOn(pc),a1
	RBra	L_GoWn
ChScOn:	dc.b 	27,"V1",0
******************************************************************
*		SCROLLING OFF
L_WnScOf	equ	191
L191	lea	ChScOf(pc),a1
	RBra	L_GoWn
ChScOf:	dc.b 	27,"V0",0
******************************************************************
*		SHADE ON
L_WnSOn		equ	192
L192	lea	ChSOn(pc),a1
	RBra	L_GoWn
ChSOn:	dc.b 	27,"S1",0
******************************************************************
*		SHADE OFF
L_WnSOf		equ	193
L193	lea	ChSOf(pc),a1
	RBra	L_GoWn
ChSOf:	dc.b 	27,"S0",0
******************************************************************
*		CLEAR LINE
L_WnCll		equ	194
L194	lea	ChCll(pc),a1
	RBra	L_GoWn
ChCll:	dc.b 26,0
******************************************************************
*		MEMORIZE X1
L_WnMX1		equ	195
L195	lea	ChMx1(pc),a1
	RBra	L_GoWn
ChMx1:	dc.b 	27,"M0",0
******************************************************************
*		MEMORIZE X2
L_WnMX2		equ	196
L196	lea	ChMx2(pc),a1
	RBra	L_GoWn
ChMx2:	dc.b 	27,"M1",0
******************************************************************
*		MEMORIZE Y1
L_WnMY1		equ	197
L197	lea	ChMy1(pc),a1
	RBra	L_GoWn
ChMy1:	dc.b 	27,"M2",0
******************************************************************
*		MEMORIZE Y2
L_WnMY2		equ	198
L198	lea	ChMy2(pc),a1
	RBra	L_GoWn
ChMy2:	dc.b 	27,"M3",0
******************************************************************
*		Envoie a la trappe!
L_GoWn		equ	199
*
L199	tst.w	ScOn(a5)
	Rbeq	L_Scnop
	WiCall	Print
	Rbne	L_EcWiErr
	rts

******************************************************************
*		CLEAR LINE N
L_WnCln		equ	200
*
L200	move.l	(a3)+,d3
	tst.l	d3
	Rbeq	L_WFoncall
	cmp.l	#255-48,d3
	Rbcc	L_WFoncall
	add.w	#48,d3
	lea	ChCln(pc),a1
	move.b	d3,2(a1)
	RBra	L_GoWn
ChCln:	dc.b 	27,"Q0",0
	
******************************************************************
*		HSCROLL N
L_WnHSc		equ	201
*
L201	lea	ChHSc(pc),a1
	RBra	L_HVSc
ChHSc:	dc.b 	16,0,17,0,18,0,19,0

******************************************************************
*		VSCROLL N
L_WnVSc		equ	202
*
L202	lea	ChVSc(pc),a1
	RBra	L_HVSc
ChVSc:	dc.b 20,0,21,0,22,0,23,0

******************************************************************
*		ROUTINE scroll
L_HVSc		equ	203
*
L203	move.l	(a3)+,d3
	cmp.l	#4,d3
	Rbhi	L_WFoncall
Hv1:	subq.l	#1,d3
	Rbmi	L_WFoncall
	beq.s	Hv3
Hv2:	tst.b	(a1)+
	bne.s	Hv2
	bra.s	Hv1
Hv3	RBra	L_GoWn

******************************************************************
*		SET TAB N
L_WnSTa		equ	204
*
L204	move.l	(a3)+,d3
	cmp.l	#255-48,d3
	Rbhi	L_WFoncall
	add.w	#48,d3
	lea	ChSTa(pc),a1
	move.b	d3,2(a1)
	RBra	L_GoWn
ChSTa:	dc.b 27,"T0",0

******************************************************************
*		ROUTINE DEFAULT
L_DefRun	equ	205
*
L205:	tst.w	DefFlag(a5)
	beq	DRunX
	movem.l	d0-d7/a0-a6,-(sp)
* Enleve les animations
	SyCall	AMALClr
	clr.w	PAmalE(a5)
* Enleve les rainbows
	EcCalD	RainDel,-1
* Enleve tous les ecrans
	move.w	DefEBa(a5),ColBack(a5)
	moveq	#0,d1	
	moveq	#7,d2
	EcCall	DelAll
	clr.w	ScOn(a5)
	clr.l	ScOnAd(a5)
* Enleve les blocs!
	EcCall	CBlRaz
	EcCall	BlRaz
* Enleve les font-infos
	EcCall	FFonts
* RAZ des canaux d'animation
	lea	AnCanaux(a5),a0
	moveq	#0,d0
DRun1:	clr.b	(a0)+
	move.b	d0,(a0)+
	addq.w	#1,d0
	cmp.w	#64,d0
	bne.s	DRun1
* Priority off
	moveq	#0,d1
	moveq	#0,d2
	SyCall	SPrio
* RAZ des scrollings
	moveq	#15,d0
	lea	DScrolls(a5),a0
DRun2:	move.w	#$8000,(a0)
	lea	12(a0),a0
	dbra	d0,DRun2
* Interruptions branchees
	clr.w	InterOff(a5)
	bsr	SyncS	
	move.w	#%0111000100000000,ActuMask(a5)
	clr.w	VBLDelai(a5)
	clr.w	VBLOCount(a5)
* Copie la palette par defaut
	lea	DefEPa(a5),a0
	lea	DefPal(a5),a1
	moveq	#31,d0
EdTr:	move.w	(a0)+,(a1)+
	dbra	d0,EdTr
* Cree l'ecran (si pas system!)
	cmp.w	#-2,DefFlag(a5)
	beq.s	PaSc0
	move.w	DefETx(a5),d2
	ext.l	d2
	move.w	DefETy(a5),d3
	ext.l	d3
	move.w	DefECo(a5),d4
	ext.l	d4
	move.w	DefEMo(a5),d5
	move.w	DefECoN(a5),d6
	moveq	#0,d7
	lea	DefPal(a5),a1
	EcCalD	Cree,0
	bne.s	PaSc0
	move.l	a0,ScOnAd(a5)
	move.w	#1,ScOn(a5)
* Fait flasher la couleur 3 (si plus de 2 couleurs)
	cmp.w	#1,DefECo(a5)
	beq.s	EdTr1
	moveq	#3,d1
EdTr1:	ALea	DefEFl,a1
	EcCall	Flash
PaSc0
* Call Extensions
	RBsr	L_ScreenExt
* Enleve le tempraster
	clr.l	RasLock(a5)
	RBsr	L_FreeRas
******* Second part
	move.l	ParaTrap+16(a5),d1	* Nombre de lignes
	SyCall	SBufHs
	SyCall	OffHs
*	SyCall	StoreM
*	SyCall	StoreM
	SyCall	AffHs
* Limite la souris
	move.w	T_DefWX(a5),d1
	move.w	T_DefWY(a5),d2
	move.w	DefETx(a5),d3
	move.w	DefETy(a5),d4
	subq.w	#1,d3
	subq.w	#1,d4
	add.w	d1,d3
	add.w	d2,d4
	SyCall	LimitM
* Protege les programmes basic
	move.w	#-1,DefFlag(a5)
	movem.l	(sp)+,d0-d7/a0-a6
DRunX	rts
******* Routine: met la synchro
SyncS:	move.w	InterOff(a5),d1
	SyCall	SetSync
	rts

******************************************************************
*		FREE RASTER
L_FreeRas	equ	206
*
L206:	move.l	RasAd(a5),d0
	beq.s	FriRX
	move.l	d0,a1
	move.l	RasLong(a5),d0
	move.l	a6,-(sp)
	move.l	$4,a6
	jsr	-210(a6)
	move.l	(sp)+,a6
	clr.l	RasAd(a5)
	clr.l	RasLong(a5)
	move.l	T_RastPort(a5),a1
	clr.l	12(a1)
FriRX:	tst.l	RasLock(a5)
	bne.s	FriRY
	moveq	#0,d0
	move.w	RasSize(a5),d0
	clr.w	RasSize(a5)
	tst.l	d0
	rts	
* Raster locke!
FriRY:	move.l	RasLock(a5),a1
	moveq	#0,d1
	move.w	RasSize(a5),d1
	moveq	#-1,d0
	rts

******************************************************************
*		TESTER
L_Tests		equ	207
*
L207:
******* Entree normale
	tst.b	T_Actualise(a5)
	bmi.s	Tester
TstX:	rts
******* Ya eu un VBL!
Tester:	move.w	ActuMask(a5),d7
	
*	Inhibition par un autre AMOS?
	SyCall	Test_Cyclique

*******	Les menus???
	btst	#BitMenu,d7
	beq.s	Tst0
	tst.l	MnBase(a5)
	beq.s	Tst0
	tst.w	MnProc(a5)
	bne.s	Tst0
* Touche automatique du menu!
	tst.l	T_ClLast(a5)
	beq.s	Tst0a
	Rbsr	L_MnKExp
* Afficher le menu
Tst0a	btst	#10,$dff016
	bne.s	Tst0
	Rbsr	L_MnGere

******* Autres choses???
Tst0	move.w	T_Actualise(a5),d6
	and.w	d7,d6
	beq	TstX1
*	Branchement automatique?
	bclr	#BitJump,d6
	beq.s	Tst00
	Rbsr	L_GoMenu
* 	CONTROLE-C?
Tst00	bclr	#BitControl,d6
	beq.s	Tst1
	move.w	d6,T_Actualise(a5)
IStop	moveq	#9,d0
	RBra	L_Error
*******	Actualisation des ecrans/animations
Tst1	move.w	T_VBLCount+2(a5),d0
	sub.w	VBLOCount(a5),d0
	cmp.w	VBLDelai(a5),d0
	bcs	TstX1
	movem.l	a3-a6,-(sp)
	move.w	T_VBLCount+2(a5),VBLOCount(a5)
*	Bobs?
	bclr	#BitBobs,d6
	beq.s	Tst2
	movem.l	d6/d7/a5,-(sp)
	SyCall	EffBob
	SyCall	ActBob
	SyCall	AffBob
	EcCall	SwapScS
	movem.l	(sp)+,d6/d7/a5
* 	Hard Sprites?
Tst2:	bclr	#BitSprites,d6
	beq.s	Tst3
	movem.w	d6/d7,-(sp)
	SyCall	ActHs
	SyCall	AffHs
	movem.w	(sp)+,d6/d7
* 	Extensions?
Tst3:	lsr.b	#1,d6
	beq.s	Tst4
	lea	ExtTests(a5),a1
	bra.s	Tst3b
Tst3a	move.l	(a1),d0
	beq.s	Tst3b
	move.l	d0,a0
	jsr	(a0)
Tst3b	addq.l	#4,a1
	lsr.b	#1,d6
	bcs.s	Tst3a
	bne.s	Tst3b
* 	Ecrans?
Tst4:	bclr	#BitEcrans,d6
	beq.s	Tst5
	EcCall	CopMake
* 	Fin des tests animations
Tst5:	movem.l	(sp)+,a3-a6
* Correction du bug CONTROL-C / Beaucoup de sprites
	move.w	T_Actualise(a5),d0
	and.w	#%0000000100000000,d0		BITCONTROL=8
	or.w	d0,d6
*******	Every?
TstX1:	move.w	d6,T_Actualise(a5)
	btst	#BitEvery,d7
	beq.s	TstX3
	tst.w	T_EveCpt(a5)
	bgt.s	TstX3
TstX2	move.w	EveCharge(a5),T_EveCpt(a5)
	Rbsr	L_EveJump
TstX3	bclr 	#BitVBL,T_Actualise(a5)
	rts

******************************************************************
*		CLS
L_Cls0		equ	208
*
L208	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	WiCall	ClsWi
	rts
L_Cls1		equ	209
L209:	move.l	(a3)+,d1
	moveq	#0,d2
	moveq	#0,d2
	moveq	#0,d3
	move.w	#10000,d4
	move.w	d4,d5
	Rbra	211
L_Cls5		equ	210
L210:	move.l	(a3)+,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	Rbra	211
L211	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	EcCall	ClsEc
	rts

******************************************************************
*		SCREEN HEIGHT
L_FScH0		equ	212
L212	move.l	ScOnAd(a5),d0
	RBra	214
L_FScH1		equ	213
L213	move.l	(a3)+,d1
	cmp.l	#8,d1
	Rbcc	L_IllScN
	EcCall	AdrEc
	RBra	214
L214	tst.l	d0
	Rbeq	L_ScNop
	move.l	d0,a0
	moveq	#0,d0
	move.w	EcTy(a0),d0
	move.l	d0,-(a3)
	rts

******************************************************************
*		SCREEN WIDTH
L_FScW0		equ	215
L215	move.l	ScOnAd(a5),d0
	RBra	217
L_FScW1		equ	216
L216	move.l	(a3)+,d1
	cmp.l	#8,d1
	Rbcc	L_IllScN
	EcCall	AdrEc
	RBra	217
L217	tst.l	d0
	Rbeq	L_ScNop
	move.l	d0,a0
	moveq	#0,d0
	move.w	EcTx(a0),d0
	move.l	d0,-(a3)
	rts

******************************************************************
*		SCREEN BASE
L_FSBase	equ	218
L218	move.l	ScOnAd(a5),-(a3)
	Rbeq	L_ScNOp
	rts

******************************************************************
*		=LOG BASE(n)
L_FLBase	equ	219
L219	move.l	(a3)+,d3
	cmp.l	#6,d3
	Rbcc	L_FonCall
	move.l	ScOnAd(a5),d0
	Rbeq	L_ScNOp
	move.l	d0,a0
	lsl.w	#2,d3
	move.l	EcLogic(a0,d3.w),-(a3)
	rts
******************************************************************
*		=PHY BASE(n)
L_FPBase	equ	220	
L220	move.l	(a3)+,d3
	cmp.l	#6,d3
	Rbcc	L_FonCall
	move.l	ScOnAd(a5),d0
	Rbeq	L_ScNOp
	move.l	d0,a0
	lsl.w	#2,d3
	move.l	EcPhysic(a0,d3.w),-(a3)
	rts

******************************************************************
*		DOUBLE BUFFER
L_DBuf		equ	221
L221	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	EcCall	Double
	Rbne	L_EcWiErr
	rts

******************************************************************
*		SCREEN SWAP
L_Scswp0	equ	222
L222	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	EcCall	SwapScS
	Rbne	L_EcWiErr
	rts
L_ScSwp1	equ	223
L223	move.l	(a3)+,d1
	cmp.l	#8,d1
	Rbcc	L_IllScN
	EcCall	SwapSc
	Rbne	L_EcWiErr
	rts

******************************************************************
*		DUAL PLAYFIELD
L_Dual		equ	224
L224	move.l	(a3)+,d2
	cmp.l	#8,d2
	Rbcc	L_IllScN
	move.l	(a3)+,d1
	cmp.l	#8,d1
	Rbcc	L_IllScN
	EcCall	SetDual
	RBne	L_EcWiErr
	rts

******************************************************************
*		DUAL PRIORITY
L_DuPri		equ	225
L225	move.l	(a3)+,d2
	cmp.l	#8,d2
	Rbcc	L_IllScN
	move.l	(a3)+,d1
	cmp.l	#8,d1
	Rbcc	L_IllScN
	EcCall	PriDual
	Rbne	L_EcWiErr
	rts

******************************************************************
*		SCREEN CLONE
L_ScClon	equ	226
L226	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d1
	cmp.l	#8,d1
	Rbcc	L_IllScN
	EcCall	CCloEc
	Rbne	L_EcWiErr
	rts

******************************************************************
*		=SCREEN COLOUR
L_FSCol		equ	227
L227	move.l	ScOnAd(a5),d0
	Rbeq	L_ScNOp
	move.l	d0,a0
	moveq	#0,d0
	move.w	EcNbCol(a0),d0
	btst	#3,EcCon0(a0)
	beq.s	L227a
	move.l	#4096,d0
L227a	move.l	d0,-(a3)
	rts

******************************************************************
*		SCREEN OPEN
L_ScOpen	equ	228
L228	move.l	(a3)+,d5		* Mode
	and.l	#$8004,d5
* Ham?
	move.l	(a3)+,d6
	cmp.l	#4096,d6
	bne.s	ScOo0
	tst.w	d5			* Lowres only!
	Rbmi	L_FonCall
	moveq	#6,d4
	move.w	#$0800,d5
	moveq	#64,d6
	bra.s	ScOo2
* Nombre de couleurs-> plans
ScOo0:	moveq	#1,d4			* Nb de plans
	moveq	#2,d1
ScOo1:	cmp.l	d1,d6
	beq.s	ScOo2
	lsl.w	#1,d1
	addq.w	#1,d4
	cmp.w	#7,d4
	bcs.s	ScOo1
IlNCo:	moveq	#5,d0			* Bad number of colours
	Rbra	L_EcWiErr
ScOo2:	move.l	(a3)+,d3		* TY
	move.l	(a3)+,d2		* TX
	move.l	(a3)+,d1		* Numero
	cmp.l	#8,d1
	Rbcc	L_IllScN
	tst.w	d5			* Si HIRES, pas plus de 16 couleurs
	bpl.s	ScOo3
	cmp.w	#4,d4
	Rbhi	L_FonCall	
ScOo3:	lea	DefPal(a5),a1
	EcCall	Cree
	Rbne	L_EcWiErr
	move.l	a0,ScOnAd(a5)
	move.w	EcNumber(a0),ScOn(a5)
	addq.w	#1,ScOn(a5)
* Fait flasher la couleur 3 (si plus de 2 couleurs)
	cmp.w	#1,d4
	beq.s	ScOo4
	moveq	#3,d1
	ALea	DefEFl,a1
	EcCall	Flash
ScOo4:	rts

******************************************************************
*		SCREEN CLOSE
L_ScClo		equ	229
L229	move.l	(a3)+,d1
	cmp.l	#8,d1
	Rbcc	L_IllScN
	EcCall	Del
	Rbne	L_EcWiErr
	clr.w	ScOn(a5)
	clr.l	ScOnAd(a5)
	cmp.l	#0,a0
	beq.s	L229a
	move.w	EcNumber(a0),d0
	cmp.w	#8,d0
	bcc.s	L229a
	addq.w	#1,d0
	move.w	d0,ScOn(a5)
	move.l	a0,ScOnAd(a5)
L229a	rts

******************************************************************
*		SCREEN DISPLAY
L_ScDisp	equ	230
L230	move.l	(a3)+,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	cmp.l	#8,d1
	Rbcc	L_IllScN
	EcCall	View
	Rbne	L_EcWiErr
	rts

******************************************************************
*		SCREEN OFFSET
L_ScOffs		equ	231
L231	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	EcCall	OffSet
	Rbne	L_EcWiErr
	rts

********************************************************************
*		SCREEN SHOW/HIDE
L_ScSh0		equ	232
L232	moveq	#0,d1
	moveq	#0,d2
	move.w	ScOn(a5),d1
	Rbeq	L_ScNop
	subq.l	#1,d1
	RBra	236
L_ScSh1		equ	233
L233	move.l	(a3)+,d1
	moveq	#0,d2
	RBra	236
L_ScHi0		equ	234
L234	moveq	#0,d1
	moveq	#-1,d2
	move.w	ScOn(a5),d1
	RBeq	L_ScNop
	subq.l	#1,d1
	RBra	236
L_ScHi1		equ	235
L235	move.l	(a3)+,d1
	moveq	#-1,d2
	RBra	236
L236	cmp.l	#8,d1
	Rbcc	L_IllScN
	EcCall	EHide
	Rbne	L_EcWiErr
	rts

********************************************************************
*		AUTOVIEW
L_AvOn		equ	237
L237	bset	#BitEcrans,ActuMask(a5)
	rts
L_AvOff		equ	238
L238	bclr	#BitEcrans,ActuMask(a5)
	rts

********************************************************************
*		VIEW
L_View		equ	239
L239	EcCall	CopMake
	bclr	#BitEcrans,T_Actualise(a5)
	rts

***************************************************************************
*		SCREEN TO FRONT
L_ScFr0		equ	240
L240	moveq	#0,d1
	move.w	ScOn(a5),d1
	Rbeq	L_ScNOp
	subq.w	#1,d1
	Rbra	242
L_ScFr1		equ	241	
L241	move.l	(a3)+,d1
	RBra	242
L242	cmp.l	#8,d1
	Rbcc	L_IllScN
	EcCall	First
	Rbne	L_EcWiErr
	rts

***************************************************************************
*		SCREEN TO BACK
L_ScBk0		equ	243
L243	moveq	#0,d1
	move.w	ScOn(a5),d1
	Rbeq	L_ScNOp
	subq.w	#1,d1
	Rbra	245
L_ScBk1		equ	244
L244	move.l	(a3)+,d1
	RBra	245
L245	cmp.l	#8,d1
	Rbcc	L_IllScN
	EcCall	Last
	Rbne	L_EcWiErr
	rts

***************************************************************************
*		SCREEN
L_Scr		equ	246
L246	move.l	(a3)+,d1
	cmp.l	#8,d1
	Rbcc	L_IllScN
	EcCall	Active
	Rbne	L_EcWiErr
	move.w	EcNumber(a0),d0
	addq.w	#1,d0
	move.w	d0,ScOn(a5)
	move.l	a0,ScOnAd(a5)
	rts
L_FScr		equ	247
L247	move.w	ScOn(a5),d0
	subq.w	#1,d0
	ext.l	d0
	move.l	d0,-(a3)
	rts
***************************************************************************
*		=HIRES / =LOWRES
L_FHires	equ	248
L248	move.l	#%1000000000000000,-(a3)
	rts
L_FLowRes	equ	249
L249	clr.l	-(a3)
	rts

***************************************************************************
*		WAITVBL
L_WtVbl		equ	250
L250	SyCall	WaitVbl
	Rbra	L_Tests

***************************************************************************
*		COLOUR
L_Colour	equ	251
L251	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	cmp.l	#31,d1
	Rbhi	L_FonCall
	EcCall	SCol
	Rbne	L_EcWiErr
	rts
L_FColour	equ	252
L252	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d1
	EcCall	GCol
	Rbne	L_EcWiErr
	move.l	d1,-(a3)
	rts

***************************************************************************
*		COLOUR BACK
L_ColourB	equ	253
L253	move.l	(a3)+,d1
	move.w	d1,ColBack(a5)
	EcCall	SColB
	rts

***************************************************************************
*		PALETTE / DEFAULT PALETTE
L_DPal		equ	254
L254	lea	DefPal(a5),a0
	Rbra	L_Plt
L_Pal		equ	255
L255	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	moveq	#15,d1
	move.l	Buffer(a5),a0
	move.l	a0,a1
Pal1:	move.l	#-1,(a1)+
	dbra	d1,Pal1
	Rbsr	L_Plt
	EcCall	SPal
	Rbne	L_EcWiErr
	rts
L_Plt		equ	256
L256	move.w	d0,d1
	lsl.w	#2,d1
	add.w	d1,a3
	move.l	a3,a2
	subq.w	#1,d0
Plt1:	move.l	-(a2),d2
	bmi.s	Plt2
	and.w	#$FFF,d2
	move.w	d2,(a0)
Plt2:	addq.l	#2,a0
	dbra	d0,Plt1
	move.l	Buffer(a5),a1
	rts

***************************************************************************
*		GET ICON/SPRITE PALETTES
* Get Icon Palette
L_GIPal0	equ	257
L257	moveq	#-1,d3
	RBra	259
* Get Icon Palette M
L_GIPal1	equ	258
L258	move.l	(a3)+,d3
	RBra	259
L259	move.l	BkIco(pc),d1
	move.l	ABanks(a5),a0
	move.l	8(a0),d0
	Rbra	263
BkIco	dc.b	"Icon"
* Get Sprite Palette
L_GSpPal0	equ	260
L260	moveq	#-1,d3
	RBra	262
* Get Sprite Palette M
L_GSpPal1	equ	262
L261	move.l	(a3)+,d3
	RBra	262
L262	move.l	BkSpr(pc),d1
	move.l	ABanks(a5),a0
	move.l	(a0),d0
	RBra	263
BkSpr	dc.b	"Spri"
* Routine
L263	Rbeq	L_BkNoRes
	move.l	d0,a0
	cmp.l	(a0),d1
	Rbne	L_BkNoRes
	lea	8(a0),a0
	move.w	(a0)+,d0
	lsl.w	#3,d0
	lea	0(a0,d0.w),a0
	RBra	L_GSp
* Routine GSp
L_GSp		equ	264
L264	RBsr	L_PalRout
	EcCall	SPal
	Rbne	L_EcWiErr
	rts
* Copie de palette masquee
L_PalRout	equ	265
L265	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	Buffer(a5),a1
	moveq	#0,d0
PalR1:	move.w	#$FFFF,(a1)
	btst	d0,d3
	beq.s	PalR2
	move.w	(a0),(a1)
PalR2:	addq.l	#2,a0
	addq.l	#2,a1
	addq.w	#1,d0
	cmp.w	#32,d0
	bcs.s	PalR1
	move.l	Buffer(a5),a1
	rts

***************************************************************************
*		GET PALETTE
L_GPal2		equ	266
L266	move.l	(a3)+,d3
	RBra	L_GPal
L_GPal1		equ	267
L267	move.l	(a3)+,d1
	moveq	#-1,d3
	RBra	L_GPal
L_GPal		equ	268
L268	Rbsr	L_GetEc
	lea	EcPal(a0),a0
	Rbra	L_GSp

***************************************************************************
*		FADE
* Fade V
L_Fade1		equ	269
L269	move.l	Buffer(a5),a0
	move.l	a0,a1
	moveq	#31,d0
IFad0	clr.w	(a0)+	
	dbra	d0,IFad0
	Rbra	L_FadT
* Fade V To S
L_Fade2		equ	270
L270	move.l	#-1,-(a3)
	RBra	L_Fade3
* Fade V To S,M
L_Fade3		equ	271
L271	move.l	(a3)+,d3
	move.l	(a3)+,d1
	bpl.s	IFat1
	move.l	#"Spri",d1		* <0 -> Sprites palette!
	move.l	ABanks(a5),a0
	move.l	(a0),d0
	Rbeq	L_BkNoRes
	move.l	d0,a0
	cmp.l	(a0),d1
	Rbne	L_BkNoRes
	lea	8(a0),a0
	move.w	(a0)+,d0
	lsl.w	#3,d0
	lea	0(a0,d0.w),a0
	bra.s	IFat2
IFat1	Rbsr	L_GetEc
	lea	EcPal(a0),a0
IFat2	Rbsr	L_PalRout
	Rbra	L_FadT
* Fade V,c1,c2....
L_FadeN		equ	272
L272	moveq	#15,d1
	move.l	Buffer(a5),a0
	move.l	a0,a1
IFap	move.l	#-1,(a1)+
	dbra	d1,IFap
	RBsr	L_Plt
	RBra	L_FadT
* Lance le FADE
L_FadT		equ	273
L273	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d1
	Rbls	L_FonCall
	EcCall	FadeOn
	Rbne	L_FonCall
	rts

***************************************************************************
*		FLASH OFF
L_FlOff		equ	274
L274	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	EcCall	FlRaz
	rts
***************************************************************************
*		FLASH
L_Flash		equ	275
L275	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	RBsr	L_ChVerBuf
	move.l	(a3)+,d1
	cmp.l	#32,d1
	Rbcc	L_IlNCo
	move.l	Buffer(a5),a1
	EcCall	Flash
	Rbne	L_EcWiErr
	rts

***************************************************************************
*		SHIFT OFF
L_ShOff		equ	276
L276	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	EcCall	ShRaz
	rts

***************************************************************************
*		SHIFT UP/DOWN
L_ShUp		equ	277
L277	moveq	#0,d5
	Rbra	279
L_SHDown	equ	278
L278	moveq	#1,d5
	RBra	279
L279	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d6
	move.l	(a3)+,d4
	bpl.s	ShD2
	moveq	#31,d4
ShD2:	move.l	(a3)+,d3
	bpl.s	ShD3
	moveq	#1,d3
ShD3:	move.l	(a3)+,d2
	moveq	#1,d1
	EcCall	Shift
	Rbne	L_EcWiErr
	rts

***************************************************************************
*		SET RAINBOW number,colour#,size,a$,b$,c$[,debut]
L_SRain6	equ	280
L280	clr.l	-(a3)
	RBra	L_SRain7
L_SRain7	equ	281
L281	move.l	(a3)+,d7
	move.l	(a3)+,d6
	move.l	(a3)+,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d2
	cmp.l	#16,d2
	Rbcs	L_FonCall
	cmp.l	#32700,d2
	Rbcc	L_FonCall
	move.l	(a3)+,d3
	Rbmi	L_FonCall
	move.l	(a3)+,d1
	cmp.l	#4,d1
	Rbcc	L_FonCall
	EcCall	RainSet
	Rbmi	L_OOfMem
	RBne	L_FonCall
	rts

***************************************************************************
*		RAINBOW Number,Base,Deb,Size
L_Rain		equ	282
L282	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	cmp.l	#4,d1
	Rbcc	L_FonCall
	EcCall	RainDo
	RBne	L_RainErr
	rts

***************************************************************************
*		RAINBOW DEL
L_RainD0	equ	283
L283	move.l	#-1,-(a3)
	RBra	L_RainD1
L_RainD1	equ	284
L284	move.l	(a3)+,d1
	cmp.l	#4,d1
	Rbge	L_FonCall
	EcCall	RainDel
	rts

***************************************************************************
*		=RAIN(n,m)=
L_IRain		equ	285
L285	move.l	(a3)+,-(sp)
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	EcCall	RainVar
	Rbne	L_RainErr
	move.l	(sp)+,d3
	and.w	#$0FFF,d3
	move.w	d3,(a0)
	rts
L_FRain		equ	286
L286	move.l	(a3)+,d2
	move.l	(a3)+,d1
	EcCall	RainVar
	Rbne	L_RainErr
	moveq	#0,d0
	move.w	(a0),d0
	move.l	d0,-(a3)
	rts

***************************************************************************
*		TROUVE LE NUMERO ECRAN
L_GetEc		equ	287
L287:	tst.l	d1
	bmi.s	GtE1
* >0 , <8
	cmp.l	#8,d1
	Rbcc	L_FonCall
	EcCall	AdrEc
	Rbeq	L_ScNOp
	move.l	d0,a0
	add.l	#EcLogic,d0
	rts
* <0
GtE1	tst.w	d1
	bpl.s	GtE2
	move.l	ScOnAd(a5),d0
	Rbeq	L_ScNOp
	move.l	d0,a0
	bra.s	GtE3
GtE2	cmp.w	#8,d1
	Rbcc	L_FonCall
	EcCall	AdrEc
	Rbeq	L_ScNOp
	move.l	d0,a0
GtE3	btst	#30,d1
	bne.s	GtE4
	add.l	#EcLogic,d0
	rts
GtE4	add.l	#EcPhysic,d0
	rts

***************************************************************************
*		AUTOBACK
L_AutoB		equ	288
L288	move.l	(a3)+,d3
	cmp.l	#3,d3
	Rbcc	L_FonCall
	move.l	ScOnAd(a5),d0
	Rbeq	L_ScNOp
	move.l	d0,a0
	move.w	d3,EcAuto(a0)
	rts

***************************************************************************
*		COPPER 
L_CopOn		equ	289
L289	EcCalD	CopOnOff,-1
	rts
L_CopOf		equ	290
L290	EcCalD	CopOnOff,0
	rts
L_CopSwap	equ	291
L291	EcCall	CopSwap
	RBne	L_CopErr
	rts
L_CopErr	equ	292
L292	add.w	#EcEBase+32-2,d0
	RBra	L_Error
L_CopReset	equ	293
L293	EcCall	CopReset
	RBne	L_CopErr
	rts
L_CopW4		equ	294
L294	move.l	(a3)+,d4
	move.l	(a3)+,d3
	Rbra	L_CopW
L_CopW2		equ	295
L295	moveq	#-1,d3
	moveq	#-1,d4
	Rbra	L_CopW
L_CopW		equ	296
L296	move.l	(a3)+,d2
	move.l	(a3)+,d1
	EcCall	CopWait
	rts
L_CopMW		equ	297
L297	move.l	(a3)+,d2
	move.l	(a3)+,d1
	EcCall	CopMove
	RBne	L_CopErr
	rts
L_CopML		equ	298
L298	move.l	(a3)+,d2
	move.l	(a3)+,d1
	EcCall	CopMoveL
	RBne	L_CopErr
	rts
L_CopBase	equ	299
L299	EcCall	CopBase
	Rbne	L_CopErr
	move.l	d1,-(a3)
	rts


***************************************************************************
*		AUTOBACK

******* Entree speciale pour PAINT!
L_GfxPnt	equ	300
L300	movem.l	a3-a6,-(sp)
	move.l	T_EcVect(a5),a3
	lea	SuPaint*4(a3),a3
	Rbra	L_GfxF0

******* Appel d'une fonction GFX avec autoback!
L_GfxFunc	equ	301
L301	movem.l	a3-a6,-(sp)
	move.l	T_GfxBase(a5),a6
	lea	0(a6,d6.w),a3
	RBra	L_GfxF0
L_GfxF0		equ	302
L302	move.l	ScOnAd(a5),a2
	tst.w	EcAuto(a2)
	bne.s	GfxF1
	jsr	(a3)
	bra.s	GfxX1
* Autoback!!
GfxF1	move.l 	36(a1),a4
	moveq	#0,d7
	movem.l	d0-d7/a0-a3,-(sp)
	EcCall	AutoBack1
	movem.l	(sp),d0-d7/a0-a3
	btst	#BitDble,EcFlags(a2)
	beq.s	GfxF2
	jsr	(a3)
	EcCall	AutoBack2
	movem.l	(sp),d0-d7/a0-a3
	move.l	a4,36(a1)
	jsr	(a3)
	EcCall	AutoBack3
GfxX	movem.l	(sp)+,d0-d7/a0-a3
GfxX1	movem.l	(sp)+,a3-a6
	rts
* Single buffer
GfxF2	jsr	(a3)
	EcCall	AutoBack4
	bra.s	GfxX

******************************************************************
*		PLOT x,y
L_Plot2		equ	303
L303	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	RBra	L_RePlot
L_Replot	equ	304
L304	Rbsr	L_GrXY
	move.w	36(a1),d0
	move.w	38(a1),d1
	move.w	#WritePixel,d6
	Rbra	L_GfxFunc
L_Plot3		equ	305
L305	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	T_RastPort(a5),a1
	move.l	(a3)+,d0
	Rbmi	L_FonCall
	cmp.l	#EntNul,d0
	Rbeq	L_RePlot
	GfxC	SetAPen
	RBra	L_RePlot

******************************************************************
*		=POINT(x,y)
L_FPoint	equ	306
L306	RBsr	L_RPoint
	move.l	d0,-(a3)
	rts
L_RPoint	equ	307
L307	Rbsr	L_GrXY
	move.w	36(a1),d0
	move.w	38(a1),d1
	move.l	a6,-(sp)
	move.l	T_GfxBase(a5),a6
	jsr	ReadPixel(a6)
	move.l	(sp)+,a6
	rts

******************************************************************
*		DRAW 
L_Draw4		equ	308
L308	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d1
	move.l	(a3)+,d0
	Rbsr	L_GrXY
	Rbra	L_Drw
L_Draw2		equ	309
L309	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d1
	move.l	(a3)+,d0
	move.l	T_RastPort(a5),a1
	Rbra	L_Drw
L_Drw		equ	310
L310	move.w	#RDraw,d6
	Rbra	L_GfxFunc	

******************************************************************
*		Routine: SET XY curseur??
L_GrXY		equ	311
L311	move.l	T_Rastport(a5),a1
	move.l	#Entnul,d7
	move.l	(a3)+,d6
	cmp.l	d7,d6
	beq.s	GrXy1
	move.w	d6,38(a1)
GrXy1:	move.l	(a3)+,d6
	cmp.l	d7,d6
	beq.s	GrXy2
	move.w	d6,36(a1)
GrXy2:	rts

******************************************************************
*		CIRCLE x,y,n
L_Cir		equ	312
L312	move.l	(a3)+,d2
	Rbls	L_FonCall
	move.l	d2,d3
	move.l	ScOnAd(a5),d0
	Rbeq	L_ScNOp
	move.l	d0,a0
	tst.w	EcCon0(a0)
	Rbpl	L_EllCir
	lsl.w	#1,d2
	Rbra	L_EllCir

******************************************************************
*		ELLIPSE x,y,a,b
L_Ell		equ	313
L313	move.l	(a3)+,d3
	Rbls	L_FonCall
	move.l	(a3)+,d2
	Rbls	L_FonCall
	tst.w	ScOn(a5)
	Rbne	L_EllCir
	Rbra	L_ScNOp
L_EllCir	equ	314
L314	Rbsr	L_GrXY
	move.w	36(a1),d0
	move.w	38(a1),d1
	move.w	#DrawEllipse,d6
	Rbra	L_GfxFunc

******************************************************************
*		POLYLINE
L_Polyl		equ	315
L315	tst.w	ScOn(a5)
	RBeq	L_ScNOp
	move.w	d0,d3
	lsl.w	#3,d0
	add.w	d0,a3
	move.l	a3,a2
	move.l	T_RastPort(a5),a1
	move.l	Buffer(a5),a0
	moveq	#0,d0
	tst.w	d1
	bne.s	L315a
	move.w	36(a1),d1
	move.w	38(a1),d2
	addq.w	#1,d3
	bra.s	L315b
L315a	move.l	-(a2),d1
	move.l	-(a2),d2
L315b	move.w	d1,(a0)+
	move.w	d2,(a0)+
	addq.w	#1,d0
	subq.w	#1,d3
	bne.s	L315a
	move.l	Buffer(a5),a0
	move.w	(a0),36(a1)
	move.w	2(a0),38(a1)
	move.w	#PolyDraw,d6
	Rbra	L_GfxFunc

******************************************************************
*		SCREEN INIT des extensions
L_ScreenExt	equ	316
L316	lea	ExtAdr(a5),a0
	moveq	#26-1,d0
DRex1	move.l	4(a0),d1
	beq.s	DRex2
	move.l	d1,a1
	movem.l	a0-a6/d0-d7,-(sp)
	jsr	(a1)
	movem.l	(sp)+,a0-a6/d0-d7
DRex2:	lea	16(a0),a0
	dbra	d0,DRex1
	rts

L317

******************************************************************
*		CURSEUR
L_Xgr		equ	318
L318	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	T_RastPort(a5),a0
	moveq	#0,d0
	move.w	36(a0),d0
	move.l	d0,-(a3)
	rts
L_Ygr		equ	319
L319	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	T_RastPort(a5),a0
	moveq	#0,d0
	move.w	38(a0),d0
	move.l	d0,-(a3)
	rts
L_GrLoc		equ	320
L320	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	Rbra	L_GrXY

******************************************************************
*		BOX x,y TO x,y
L_Box		equ	321
L321	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	move.l	(a3)+,d0
	move.l	T_RastPort(a5),a1
	move.l	Buffer(a5),a0
	move.l	a0,a2
	move.w	d0,36(a1)
	move.w	d1,38(a1)
	move.w	d0,(a2)+
	move.w	d3,(a2)+
	move.w	d2,(a2)+
	move.w	d3,(a2)+
	move.w	d2,(a2)+
	move.w	d1,(a2)+
	move.w	d0,(a2)+
	move.w	d1,(a2)+
	addq.w	#1,d1
	cmp.w	d3,d1
	bcc.s	IBx1
	subq.w	#2,d1
IBx1	moveq	#4,d0
	move.w	#PolyDraw,d6
	RBra	L_GfxFunc

******************************************************************
*	Fonctions CLIP
L_Clip0		equ	322
L322	moveq	#-1,d1
	Rbra	L_GoClip
L_Clip4		equ	323
L323	move.l	(a3)+,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	moveq	#0,d1
	Rbra	L_GoClip
L_GoClip	equ	324
L324	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	EcCall	SetClip
	RBne	L_FonCall
	rts

******************************************************************
*	Fonctions TEXT

L_GRFont	equ	325
L325	moveq	#1,d1
	Rbra	L_Igf
L_GDFont	equ	326
L326	moveq	#2,d1
	Rbra	L_Igf
L_GFont		equ	327
L327	moveq	#3,d1
	Rbra	L_Igf
L_Igf		equ	328
L328	move.l	Buffer(a5),a1
	EcCall	GFonts
	Rbne	L_OOfMem
	rts
******* =FONT$(n)
L_FFont		equ	329
L329	move.l	(a3)+,d1
	Rbmi	L_FonCall
	EcCall	GFont
	Rbmi	L_FftE
	Rbne	L_ChVide
	move.l	a0,a2
	moveq	#40,d3
	Rbsr	L_Demande
	move.l	a1,-(a3)
	move.w	#38,(a1)+
	move.l	a1,a0
	moveq	#37,d0
Fft1:	move.b	#" ",(a0)+
	dbra	d0,Fft1
	lea	40(a1),a0
	move.l	a0,HiChaine(a5)
* Copie le nom
	move.l	2(a2),a0
Fft2:	move.b	(a0)+,(a1)+
	bne.s	Fft2
	move.b	#" ",-1(a1)
* Taille des caracteres
	move.l	(a3),a0
	lea	30+2(a0),a0
	moveq	#0,d0
	move.w	6(a2),d0
	Rbsr	L_LongDec
* Disque ou mem
	move.l	(a3),a0
	lea	34+2(a0),a0
	lea	FtRom(pc),a1
	cmp.w	#1,(a2)
	beq.s	Fft3
	lea	FtDisc(pc),a1
Fft3:	move.b	(a1)+,(a0)+
	bne.s	Fft3
	rts
FtRom:	dc.b 	"Rom ",0
FtDisc:	dc.b	"Disc",0

******* SET FONT n
L_SFont		equ	330
L330	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d1
	Rbmi	L_FonCall
	EcCall	SFont
	beq.s	L330a
	Rbmi	L_FftE
	moveq	#44,d0
	Rbra	L_Error
L330a	rts
******* Erreur fonte
L_FftE		equ	331
L331	moveq	#37,d0
	Rbra	L_Error
	
******* TEXT x,y,a$
L_Text		equ	332
L332	tst.w	ScOn(a5)
	Rbeq	L_FonCall
	move.l	(a3)+,a0
	move.w	(a0)+,d0
	Rbsr	L_GrXY
	tst.w	d0
	beq.s	L332a
	moveq	#Text,d6
	Rbra	L_GfxFunc
L332a	rts

******* =TEXT BASE
L_FTBase	equ	333
L333	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	T_RastPort(a5),a1
	moveq	#0,d3
	move.w	62(a1),d3
	move.l	d3,-(a3)
	rts

******* =TEXT LENGTH (a$)
L_FTLen		equ	334
L334	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,a0
	move.w	(a0)+,d0
	move.l	T_RastPort(a5),a1
	move.l	a6,-(sp)
	move.l	T_GfxBase(a5),a6
	jsr	TextLength(a6)
	move.l	(sp)+,a6
	move.l	d0,-(a3)
	rts

******* =TEXT STYLES
L_FStyle	equ	335
L335	tst.w	ScOn(a5)	
	Rbeq	L_ScNOp
	move.l	T_RastPort(a5),a1
	moveq	#0,d3
	move.b	56(a1),d3
	move.l	d3,-(a3)
	rts

******* SET TEXT n
L_SText		equ	336
L336	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d0
	move.l	T_RastPort(a5),a1
	move.b	d0,56(a1)
	rts

******************************************************************
*	Fonctions AREA

******* SET PATTERN n
L_SPat		equ	337
L337	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d1
	EcCall	Pattern
	RBne	L_FonCall
	rts

******* SET PAINT n
L_SPaint	equ	338
L338	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	T_RastPort(a5),a1
	move.w	32(a1),d0
	bclr 	#3,d0
	tst.l	(a3)+
	beq.s	ISpt
	bset	#3,d0
ISpt:	move.w	d0,32(a1)
	rts

******* PAINT x,y [,mode]
L_Paint2	equ	339
L339	move.l	#1,-(a3)
	RBra	L_Paint3
L_Paint3	equ	340
L340	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	Rbsr	L_Getras
	move.l	(a3)+,d4
	and.w	#$01,d4
	Rbsr	L_RPoint
	move.l	d0,d3
	move.l	T_RastPort(a5),a1
	move.w	36(a1),d1
	move.w	38(a1),d2
	move.l	Buffer(a5),d5
	Rbsr	L_GfxPnt
	Rbra	L_FreeRas


*******	POLYGON
L_Pogo		equ	341
L341	tst.w	ScOn(a5)
	RBeq	L_ScNOp
	move.w	d0,d6
	lsl.w	#3,d0
	add.w	d0,a3
	move.l	a3,a0
	move.l	T_RastPort(a5),a1
	move.l	Buffer(a5),a2
	tst.w	d1
	beq.s	L341a
	move.l	-(a0),d0
	move.l	-(a0),d1
	subq.w	#1,d6
	bra.s	L341b
L341a	move.w	36(a1),d0
	move.w	38(a1),d1
L341b	GfxC	AreaMove
L341c	move.l	-(a0),d0
	move.l	-(a0),d1
	GfxC	AreaDraw
	subq.w	#1,d6
	bne.s	L341c
	RBra	L_FinRas

L_FinRas	equ	342
L342	Rbsr	L_GetRas
	GfxC	AreaEnd
	Rbra	L_FreeRas

******* BAR x,y TO x,y
L_Bar		equ	343
L343	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	T_RastPort(a5),a1
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	move.l	(a3)+,d0
	cmp.w	d0,d2
	Rble	L_FonCall
	cmp.w	d1,d3
	Rble	L_FonCall
	move.w	d0,36(a1)
	move.w	d1,36(a1)
	move.w	#RectFill,d6
	Rbra	L_GfxFunc

******* SET TEMPRAS n
L_SRas0		equ	344
L344	clr.l	RasLock(a5)
	rts
L_SRas1		equ	345
L345	move.l	(a3)+,d0
	cmp.l	#65536,d0
	Rbcc	L_FonCall
	cmp.l	#256,d0
	Rbcs	L_FonCall
	move.w	d0,RasSize(a5)
	clr.l	RasLock(a5)
	rts
L_SRas2		equ	346
L346	clr.l	RasLock(a5)
	move.l	(a3)+,d2
	cmp.l	#65536,d2
	Rbcc	L_FonCall
	cmp.l	#256,d2
	Rbcs	L_FonCall
	Rbsr	L_AdOuBank
	move.w	d2,RasSize(a5)
	move.l	d3,RasLock(a5)
	rts
	
******* Reserve un TEMPRAS!
L_GetRas	equ	347
L347	movem.l	a0/a1/d0/d1,-(sp)
	Rbsr	L_FreeRas
	bmi.s	GRas2
	bne.s	GRas1
	move.l	ScOnAd(a5),d0
	Rbeq	L_ScNOp
	move.l	d0,a0
	move.l	EcTPlan(a0),d0
GRas1:	move.l	d0,d1
	move.l	Buffer(a5),a1
	Rbsr	L_RamChip2
	Rbeq	L_OOfMem
	move.l	d0,RasAd(a5)
	move.l	d1,RasLong(a5)
	move.l	d0,a1
GRas2:	move.l	d1,d0
	lea	TmpRas(a5),a0
	move.l	T_RastPort(a5),a2
	move.l	a0,12(a2)
	GfxC	InitTmpRas
	movem.l	(sp)+,a0/a1/d0/d1
	rts
L348

******************************************************************
*	INK a,b,c
L_Ink1		equ	349
L349	move.l	#EntNul,d7
	move.l	d7,-(a3)
	move.l	d7,-(a3)
	Rbra	L_Ink
L_Ink2		equ	350
L350	move.l	#EntNul,d7
	move.l	d7,-(a3)
	RBra	L_Ink
L_Ink3		equ	351
L351	move.l	#EntNul,d7
	RBra	L_Ink
L_Ink		equ	352
L352	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	T_RastPort(a5),a1
	move.l	(a3)+,d0
	cmp.l	d0,d7
	beq.s	Iik0
	move.b	d0,27(a1)
Iik0:	move.l	(a3)+,d0
	cmp.l	d7,d0
	beq.s	Iik1
	GfxC	SetBPen
Iik1:	move.l	(a3)+,d0
	cmp.l	d7,d0
	beq.s	Iik2
	GfxC	SetAPen
Iik2:	rts

******************************************************************
*	GR WRITING n
L_GrWrt		equ	353
L353	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d0
	Rbmi	L_FonCall
	move.l	T_RastPort(a5),a1
	GfxC	SetDrMd
	rts

******************************************************************
*	SET LINE n
L_StLine	equ	354
L354	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	T_RastPort(a5),a0
	move.l	(a3)+,d0
	move.w	d0,34(a0)
	rts

******************************************************************
*	H/V SLIDER x,y to x,y,max,deb,taille
L_Sli		equ	355
L355	move.l	(a3)+,d5
	Rbmi	L_FonCall
	move.l	(a3)+,d4
	Rbmi	L_FonCall
	move.l	(a3)+,d3
	Rbmi	L_FonCall
	move.l	(a3)+,d2
	Rbmi	L_FonCall
	move.l	(a3)+,d1
	Rbmi	L_FonCall
	move.l	(a3)+,d7
	Rbmi	L_FonCall
	move.l	(a3)+,d6
	Rbmi	L_FonCall
	sub.l	d6,d1
	Rbls	L_FonCall
	sub.l	d7,d2
	Rbls	L_FonCall
	rts
L_HSli		equ	356
L356	Rbsr	L_Sli
	EcCall	HorSli
	Rbne	L_FonCall
	rts
L_VSli		equ	357
L357	Rbsr	L_Sli
	EcCall	VerSli
	Rbne	L_FonCall
	rts
******* Set SLIDER a,b,c,d,e,f,g,h
L_SSli		equ	358
L358	move.l	(a3)+,d7
	move.l	(a3)+,d6
	move.l	(a3)+,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	move.l	(a3)+,d0
	EcCall	SetSli
	RBne	L_FonCall
	rts

******************************************************************
*	DEF SCROLL n,x,y TO x,y,dx,dy
L_DefSc		equ	359
L359	movem.l	(a3)+,d1-d7
	tst.l	d7
	Rbeq	L_FonCall
	cmp.l	#16,d7
	Rbhi	L_FonCall
	mulu	#6*2,d7
	lea	DScrolls(a5),a1
	add.w	d7,a1
	movem.w	d1-d6,-(a1)
	rts
******************************************************************
*	SCROLL n
L_DoSc		equ	360
L360	move.l	(a3)+,d3
	subq.l	#1,d3
	cmp.l	#16,d3
	Rbcc	L_FonCall
	mulu	#6*2,d3
	lea	DScrolls(a5),a1
	lea	0(a1,d3.w),a1
	cmp.w	#$8000,(a1)
	Rbeq	L_ScNoDef
* Gestion AUTOBACK scroll
	move.l	ScOnAd(a5),a2
	tst.w	EcAuto(a2)
	bne.s	ScrF1
	Rbra	L_DoScrol
* Autoback!!
ScrF1	movem.l	a1/a2,-(sp)
	EcCall	AutoBack1
	movem.l	(sp),a1/a2
	btst	#BitDble,EcFlags(a2)
	beq.s	ScrF2
	Rbsr	L_DoScrol
	EcCall	AutoBack2
	movem.l	(sp),a1/a2
	Rbsr	L_DoScrol
	EcCall	AutoBack3
ScrFX	movem.l	(sp)+,a1/a2
	rts
* Single buffer
ScrF2	Rbsr	L_DoScrol
	EcCall	AutoBack4
	bra.s	ScrFX

******* Appel de la routine screen copy
L_DoScrol	equ	361
L361	move.w	(a1)+,d3
	move.w	(a1)+,d2
	move.w	(a1)+,d5
	move.w	(a1)+,d4
	move.w	(a1)+,d1
	move.w	(a1)+,d0
	add.w	d0,d2
	add.w	d1,d3
	move.l	#$CC,d6
	move.l	a2,a0
	move.l	a2,a1
	add.l	#EcCurrent,a2
	move.l	a2,SccEcO(a5)
	move.l	a2,SccEcD(a5)
	Rbra	L_Sco0

******************************************************************
*	SCREEN COPY n TO n(,minterm)
L_Scop2		equ	362
L362	move.l	#$CC,d6
	move.l	(a3)+,d1
	Rbsr	L_GetEc
	move.l	d0,SccEcD(a5)
	move.l	a0,a1
* Adresse ecran 1
	move.l	(a3)+,d1
	Rbsr	L_GetEc
	move.l	d0,SccEcO(a5)
	moveq	#0,d0
	moveq	#0,d1
	moveq	#0,d2
	moveq	#0,d3
	move.w	#10000,d4
	move.w	#10000,d5
	RBra	L_Sco0

******************************************************************
*	SCREEN COPY n,x1,y1,x2,y2 TO n,x3,y3(,minterm)
L_Scop8		equ	363
L363	move.l	#$CC,d6
	Rbra	L_Scop
L_Scop9		equ	364
L364	move.l	(a3)+,d6
	Rbra	L_Scop
L_Scop		equ	365
L365	move.l	8(a3),d1
	Rbsr	L_GetEc
	move.l	d0,SccEcD(a5)
	move.l	a0,a1
* Adresse ecran 1
	move.l	28(a3),d1
	Rbsr	L_GetEc
	move.l	d0,SccEcO(a5)
* Prend les coordonnees
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	addq.l	#4,a3
	move.l	(a3)+,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d1
	move.l	(a3)+,d0
	addq.l	#4,a3
* Appelle la routine
	Rbra	L_Sco0

******* Routine SCREEN COPY
L_Sco0		equ	366
L366	movem.l	a3/a6,-(sp)
	tst.w	d0
	bpl.s	Sco1
	sub.w	d0,d2
	clr.w	d0
Sco1:	tst.w	d1
	bpl.s	Sco2
	sub.w	d1,d3
	clr.w	d1
Sco2:	tst.w	d2
	bpl.s	Sco3
	sub.w	d2,d0
	clr.w	d2
Sco3:	tst.w	d3
	bpl.s	Sco4
	sub.w	d3,d1
	clr.w	d3
Sco4:	cmp.w	EcTx(a0),d0
	bcc	ScoX
	cmp.w	EcTy(a0),d1
	bcc	ScoX
	cmp.w	EcTx(a1),d2
	bcc	ScoX
	cmp.w	EcTy(a1),d3
	bcc	ScoX

	tst.w	d4
	bmi	ScoX
	cmp.w	EcTx(a0),d4
	bls.s	Sco5
	move.w	EcTx(a0),d4
Sco5:	tst.w	d5
	bmi	ScoX
	cmp.w	EcTy(a0),d5
	bls.s	Sco6
	move.w	EcTy(a0),d5
Sco6:	sub.w	d0,d4
	bls	ScoX
	sub.w	d1,d5
	bls	ScoX

	move.w	d2,d7
	add.w	d4,d7
	sub.w	EcTx(a1),d7
	bls.s	Sco7	
	sub.w	d7,d4
	bls	ScoX
Sco7:	move.w	d3,d7
	add.w	d5,d7
	sub.w	EcTy(a1),d7
	bls.s	Sco8
	sub.w	d7,d5
	bls.s	ScoX
Sco8:	ext.l	d0
	ext.l	d1
	ext.l	d2
	ext.l	d3
	ext.l	d4
	ext.l	d5
* Fabrique les fausses bitmap
	move.l	T_ChipBuf(a5),a2
	lea	40(a2),a3
	move.w	EcTLigne(a0),(a2)+
	move.w	EcTLigne(a1),(a3)+
	move.w	EcTy(a0),(a2)+
	move.w	EcTy(a1),(a3)+
	move.w	EcNPlan(a0),(a2)+
	move.w	EcNPlan(a1),(a3)+
	clr.w	(a2)+
	clr.w	(a3)+
	move.l	SccEcO(a5),a0
	move.l	SccEcD(a5),a1
	moveq	#6-1,d7
Sco9	move.l	(a0)+,(a2)+
	move.l	(a1)+,(a3)+
	dbra	d7,Sco9	
* Appelle le systeme
	move.l	T_ChipBuf(a5),a0
	lea	40(a0),a1
	lea	40(a1),a2
	move.l	T_EcVect(a5),a6
	jsr	ScCpyW*4(a6)
	beq.s	Sc_F_Blit_Done
	moveq	#-1,d7
	move.l	T_GfxBase(a5),a6
	jsr	BltBitMap(a6)
Sc_F_Blit_Done:
ScoX	movem.l	(sp)+,a3/a6
	rts

******* =PHYSIC / =LOGIC
L_Phy0		equ	367
L367	moveq	#-1,d0
	move.l	d0,-(a3)
	rts
L_Log0		equ	368
L368	moveq	#-1,d0
	bclr	#30,d0
	move.l	d0,-(a3)
	rts
L_Phy1		equ	369
L369	or.b	#%11000000,(a3)
	rts
L_Log1		equ	370
L370	or.b	#%10000000,(a3)
	and.b	#%10111111,(a3)
	rts
L371	

******************************************************************
*	APPEAR Ecran TO ecran,param[,long]
L_App4		equ	372
L372	move.l	(a3)+,d6
	Rbls	L_FonCall
	Rbra	L_App
L_App3		equ	373
L373	moveq	#0,d6
	RBra	L_App
L_App		equ	374
L374	move.l	(a3)+,d7
	Rbls	L_FonCall
	move.l	(a3)+,d1
	Rbsr	L_GetEc
	move.l	(a3)+,d1
	movem.l	a3-a6,-(sp)
	move.l	a0,a3
	move.l	d0,SccEcD(a5)
	Rbsr	L_GetEc
	move.l	a0,a2
	move.l	d0,SccEcO(a5)
	moveq	#0,d4
	move.w	EcNPlan(a2),d0		* Nb max de plans
	cmp.w	EcNPlan(a3),d0
	bls.s	LAppa
	move.w	EcNPlan(a3),d0
LAppa	subq.w	#1,d0
	move.w	d0,AppNPlan(a5)
	move.w	EcTLigne(a2),d5		* Nb Max de pixels
	mulu	EcTy(a2),d5
	lsl.l	#3,d5
	tst.l	d6
	bne.s	LApp0
	move.l	d5,d6
LApp0	cmp.l	d6,d7
	bcs.s	LApp1
	sub.l	d6,d7
	bra.s	LApp0
* Boucle!
LApp1	add.l	d7,d4
	cmp.l	d5,d4
	bcs.s	LApp2
	sub.l	d5,d4
LApp2	
* Point / Plot 
	move.l	d4,d0
	lsr.l	#3,d0			* D0-> Adresse image source
	move.l	d0,d1
	divu	EcTLigne(a2),d1
	move.w	d1,d2
	cmp.w	EcTy(a3),d2
	bcc.s	LApp5
	move.w	EcTLigne(a3),d3
	mulu	d3,d2
	clr.w	d1
	swap	d1
	cmp.w	d3,d1
	bcc.s	LApp5
	add.l	d2,d1			* D1-> Adresse image dest
	move.w	d4,d3
	and.w	#$0007,d3
	moveq	#7,d2
	sub.w	d3,d2			* D2-> decalage bits
	move.w	AppNPlan(a5),d3		* Nb max de plan
	move.l	SccEcO(a5),a4
	move.l	SccEcD(a5),a6
LApp3	move.l	(a4)+,a0
	move.l	(a6)+,a1
	btst	d2,0(a0,d0.l)
	bne.s	LApp4
	bclr	d2,0(a1,d1.l)
	dbra	d3,LApp3
	bra.s	LApp5
LApp4	bset	d2,0(a1,d1.l)
	dbra	d3,LApp3
* Encore?
LApp5	subq.l	#1,d6
	beq.s	LApp6
	tst.b	T_Actualise(a5)
	bpl.s	LApp1
	movem.l a2-a3/d4-d7,-(sp)
	movem.l	6*4(sp),a3-a6
	Rbsr	L_Tests
	movem.l	(sp)+,a2-a3/d4-d7
	bra.s	LApp1
* A y est!
LApp6	movem.l	(sp)+,a3-a6
	rts

******* ZOOM 9ec,8x,7y,6x,5y TO 4ec,3x,2y,1x,0y
		RsReset
ZSpTablX	rs.l	1
ZSpTablY	rs.l	1
ZSpASrce	rs.l	1
ZSpADest	rs.l	1
ZSpDSrce	rs.l	1
ZSpDDest	rs.l	1
ZSpNPlan	rs.w	1
ZSpSize		equ	__Rs

L_Zoom		equ	375
L375	movem.l	a3-a6,-(sp)
	lea	-ZSpSize(sp),sp
	move.l	9*4(a3),d1
	Rbsr	L_GetEc
	move.l	a0,a1			* Source
	move.l	d0,ZSpASrce(sp)
	move.l	4*4(a3),d1
	Rbsr	L_GetEc
	move.l	a0,a2			* Destination
	move.l	d0,ZSpADest(sp)
* Adresses des ecrans
	move.w	EcNPlan(a1),d0
	cmp.w	EcNPlan(a2),d0
	bls.s	IZooD1
	move.w	EcNPlan(a2),d0
IZooD1	subq.w	#1,d0
	move.w	d0,ZSpNPlan(sp)
* Reserve le buffer 4k!
	move.l	#4096,d0
	Rbsr	L_RamFast2
	Rbeq	L_OOfMem
	move.l	d0,a0
	move.l	a0,ZSpTablX(sp)
* X3/X4/X2/X1
	move.l	1*4(a3),d5
	Rbmi	L_FonCall
	cmp.w	EcTx(a2),d5
	bhi	ZooF
	move.l	3*4(a3),d4
	cmp.l	d5,d4
	bcc	ZooF
	move.l	6*4(a3),d3
	bmi	ZooF
	cmp.w	EcTx(a1),d3
	bhi	ZooF
	move.l	8*4(a3),d2
	cmp.l	d3,d2
	bcc	ZooF
	moveq	#0,d0			* Position en X
	move.w	d2,d0
	lsr.w	#3,d0
	move.l	d0,ZSpDSrce(sp)
	moveq	#7,d6
	move.w	d2,d0
	and.w	#$0007,d0
	sub.w	d0,d6
	move.w	d4,d0
	lsr.w	#3,d0
	move.l	d0,ZSpDDest(sp)
	move.w	d4,d0
	and.w	#$0007,d0
	moveq	#7,d7
	sub.w	d0,d7
	Rbsr	L_ZooTab
* Y3/Y4/Y2/Y1
	move.l	0*4(a3),d5
	bmi	ZooF
	cmp.w	EcTy(a2),d5
	bhi	ZooF
	move.l	2*4(a3),d4
	cmp.l	d5,d4
	bcc	ZooF
	move.l	5*4(a3),d3
	bmi	ZooF
	cmp.w	EcTy(a1),d3
	bhi	ZooF
	move.l	7*4(a3),d2
	cmp.l	d3,d2
	bcc	ZooF
	move.w	d2,d0
	mulu	EcTLigne(a1),d0
	add.l	d0,ZSpDSrce(sp)
	move.w	d4,d0
	mulu	EcTLigne(a2),d0
	add.l	d0,ZSpDDest(sp)
	move.l	a0,ZSpTablY(sp)
	Rbsr	L_ZooTab
* Zoom / Reduce en Y
	moveq	#0,d4
	moveq	#0,d5
	move.w	EcTLigne(a1),d4
	move.w	EcTLigne(a2),d5
	move.l	ZSpTablX(sp),a0
	moveq	#0,d0
	move.w	(a0)+,d0
	beq.s	ZooD2
	bmi	ZooX
ZooD0	move.w	d0,d1
	lsr.w	#3,d0
	and.w	#7,d1
	sub.w	d1,d6
	bcc.s	ZooD1
	addq.l	#1,d0
	addq.w	#8,d6
ZooD1	add.l	d0,ZSpDSrce(sp)
ZooD2	move.w	ZSpNPlan(sp),d1
	move.l	ZSpASrce(sp),a4
	move.l	ZSpADest(sp),a5
ZooD3	move.l	(a4)+,a2
	move.l	(a5)+,a3
	move.l	ZSpDSrce(sp),d2
	move.l	ZSpDDest(sp),d3
	move.l	ZSpTablY(sp),a1
	move.w	(a1)+,d0
* Boucle de pokage en Y
ZooD4	bmi.s	ZooD9
	mulu	d4,d0
	add.l	d0,d2
ZooD5	btst	d6,0(a2,d2.l)
	beq.s	ZooD7
	bset	d7,0(a3,d3.l)
	add.l	d5,d3
	move.w	(a1)+,d0
	bne.s	ZooD4
ZooD6	bset	d7,0(a3,d3.l)
	add.l	d5,d3
	move.w	(a1)+,d0
	beq.s	ZooD6
	bra.s	ZooD4
ZooD7	bclr	d7,0(a3,d3.l)
	add.l	d5,d3
	move.w	(a1)+,d0
	bne.s	ZooD4
ZooD8	bclr	d7,0(a3,d3.l)
	add.l	d5,d3
	move.w	(a1)+,d0
	beq.s	ZooD8
	bra.s	ZooD4
* Encore un plan?
ZooD9	dbra	d1,ZooD3
* Position en X suivante!
	subq.w	#1,d7
	bcc.s	ZooDA
	moveq	#7,d7
	addq.l	#1,ZSpDDest(sp)
ZooDA	moveq	#0,d0
	move.w	(a0)+,d0
	beq.s	ZooD2
	bpl.s	ZooD0
* Fini! Youpi!
ZooX	move.l	ZSpTablX(sp),a1
	move.l	#4096,d0
	Rbsr	L_RamFree
	lea	ZSpSize(sp),sp
	movem.l	(sp)+,a3-a6
	lea	10*4(a3),a3
	rts
* FonCall!
ZooF	move.l	ZSpTablX(sp),a1
	move.l	#4096,d0
	Rbsr	L_RamFree
	Rbra	L_FonCall

******* Fabrique la table de zoom
*	D2= X1
*	D3= X2
*	D4= X3
*	D5= X4
*	A0= Table
L_ZooTab	equ	376
L376	sub.w 	d2,d3
	sub.w	d4,d5
	cmp.w	d3,d5
	bcc.s	ZooZ
* Reduce!
	moveq	#-1,d0
	move.w	d3,d2
	move.w	d3,d4
	subq.w	#1,d4
	subq.w	#1,d2
ZooR1	addq.w	#1,d0
	sub.w	d5,d4
	bcc.s	ZooR2
	add.w	d3,d4
	move.w	d0,(a0)+
	moveq	#0,d0
ZooR2	dbra	d2,ZooR1
	move.w	#-1,(a0)+
	rts
* Zoom
ZooZ	clr.w	(a0)+
	move.w	d5,d4
	move.w	d5,d2
	subq.w	#2,d2
	bmi.s	ZooZ3
	subq.w	#1,d5
ZooZ1	sub.w	d3,d5
	bcc.s	ZooZ2
	add.w	d4,d5
	move.w	#1,(a0)+
	dbra	d2,ZooZ1
	bra.s	ZooZ3
ZooZ2	clr.w	(a0)+
	dbra	d2,ZooZ1
ZooZ3	move.w	#-1,(a0)+
	rts

******************************************************************
*	CONVERSIONS DE COORDONNEES

******* X HARD(x)
L_XHard1	equ	377
L377	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d1
	moveq	#0,d3
	Rbra	L_XHr1
******* X HARD(n,x)
L_XHard2	equ	378
L378	move.l	(a3)+,d1
	move.l	(a3)+,d3
	cmp.l	#8,d3
	Rbge	L_FonCall
	addq.w	#1,d3
	Rbra	L_Xhr1
L_XHr1		equ	379
L379	moveq	#0,d2
	SyCall	XyHard
	Rbne	L_EcWiErr
	move.l	d1,-(a3)
	rts

******* Y HARD(x)
L_YHard1	equ	380
L380	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d2
	moveq	#0,d3
	Rbra	L_YHr1
******* Y HARD(n,x)
L_YHard2	equ	381
L381	move.l	(a3)+,d2
	move.l	(a3)+,d3
	cmp.l	#8,d3
	Rbge	L_FonCall
	addq.l	#1,d3
	RBra	L_YHr1
L_YHr1		equ	382
L382	moveq	#0,d1
	SyCall	XyHard
	Rbne	L_EcWiErr
	move.l	d2,-(a3)
	rts

******* X SCREEN(x)
L_XScr1		equ	383
L383	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d1
	moveq	#0,d3
	Rbra	L_XSc1
******* X SCREEN(n,x)
L_XScr2		equ	384
L384	move.l	(a3)+,d1
	move.l	(a3)+,d3
	cmp.l	#8,d3
	Rbge	L_FonCall
	addq.l	#1,d3
	Rbra	L_XSc1
L_XSc1		equ	385
L385	moveq	#0,d2
	SyCall	XyScr
	Rbne	L_EcWiErr
	move.l	d1,-(a3)
	rts

******* Y SCREEN(x)
L_YScr1		equ	386
L386	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d2
	moveq	#0,d3
	Rbra	L_YSc1
******* Y SCREEN(n,x)
L_YScr2		equ	387
L387	move.l	(a3)+,d2
	move.l	(a3)+,d3
	cmp.l	#8,d3
	Rbge	L_FonCall
	addq.l	#1,d3
	Rbra	L_YSc1
L_YSc1		equ	388
L388	moveq	#0,d1
	SyCall	XyScr
	Rbne	L_EcWiErr
	move.l	d2,-(a3)
	rts

******* X TEXT(x)
L_XTxt1		equ	389
L389	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d1
	moveq	#0,d2
	SyCall	XyWin
	move.l	d1,-(a3)
	rts
******* Y TEXT(x)
L_YTxt1		equ	390
L390	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d2
	moveq	#0,d1
	SyCall	XyWin
	move.l	d2,-(a3)
	rts

******************************************************************
*	XYGRAPHIC
L_FnXGr		equ	391
L391	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d1
	Rbmi	L_FonCall
	WiCall	XGrWi
	move.l	d1,-(a3)
	rts
L_FnYGr		equ	392
L392	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d1
	Rbmi	L_FonCall
	WiCall	YGrWi
	move.l	d1,-(a3)
	rts

******************************************************************
*	ZONES

******* RESERVE ZONE n
L_RZo0		equ	393
L393	moveq	#0,d1
	Rbra	L_RZo2
L_RZo1		equ	394
L394	move.l	(a3)+,d1
	Rbmi	L_FonCall
	Rbra	L_RZo2
L_RZo2		equ	395
L395	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	SyCall	ResZone
	RBne	L_OOfMem
	rts

******* RESET ZONE n
L_RsZo0		equ	396
L396	moveq	#0,d1
	Rbra	L_RsZo2
L_RsZo1		equ	397
L397	move.l	(a3)+,d1
	Rbmi	L_FonCall
	Rbra	L_RsZo2
L_RsZo2		equ	398
L398	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	SyCall	RazZone
	bne.s	L398a
	rts
L398a	moveq	#73,d0
	Rbra	L_Error

******* SET ZONE n,x,y TO x,y
L_SZo		equ	399
L399	move.l	(a3)+,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	Rbls	L_FonCall
	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	SyCall	SetZone
	Rbne	L_Foncall
	rts

******* = ZONE([n],x,y)
L_FZo2		equ	400
L400	move.l	(a3)+,d2
	move.l	(a3)+,d1
	moveq	#-1,d3
	Rbra	L_FZo
L_FZo3		equ	401
L401	move.l	(a3)+,d2
	move.l	(a3)+,d1
	move.l	(a3)+,d3
	RBra	L_FZo
L_FZo		equ	402
L402	cmp.l	#8,d3
	Rbge	L_FonCall
	addq.l	#1,d3
	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	moveq	#8,d5
	SyCall	ZoGr
	RBra	L_FZoX
L_FZoX		equ	403
L403	tst.w	d0
	Rbne	L_EcWiErr
	move.l	d1,-(a3)
	rts
******* = HZONE([n],x,y)
L_FHZo2		equ	404
L404	move.l	(a3)+,d2
	move.l	(a3)+,d1
	moveq	#-1,d3
	RBra	L_FHZo
L_FHZo3		equ	405
L405	move.l	(a3)+,d2
	move.l	(a3)+,d1
	move.l	(a3)+,d3
	RBra	L_FHZo
L_FHZo		equ	406
L406	cmp.l	#8,d3
	Rbge	L_FonCall
	addq.l	#1,d3
	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	moveq	#8,d5
	SyCall	ZoHd
	Rbra	L_FZoX
******* = SCIN([n],x,y)
L_FScin2	equ	407
L407	move.l	(a3)+,d2
	move.l	(a3)+,d1
	moveq	#-1,d3
	RBra	L_FScin
L_FScin3:	equ	408
L408	move.l	(a3)+,d2
	move.l	(a3)+,d1
	move.l	(a3)+,d3
	RBra	L_FScin
L_FScin		equ	409
L409	cmp.l	#8,d3
	Rbge	L_FonCall
	addq.l	#1,d3
	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	moveq	#8,d4
	SyCall	ScIn
	Rbra	L_FZoX
******* = MOUSE SCREEN
L_FMouSc	equ	410
L410	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	SyCall	XYMou
	moveq	#0,d3
	moveq	#8,d4
	SyCall	ScIn
	move.l	d1,-(a3)
	rts
******* = MOUSE ZONE
L_FMouZo	equ	411
L411	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	SyCall	XYMou
	moveq	#0,d3
	moveq	#8,d5
	SyCall	ZoHd
	move.l	d1,-(a3)
	rts

******************************************************************
*	GET CBLOC n,x,y,tx,ty
L_GtCBl		equ	412
L412	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	move.l	(a3)+,d5
	Rbeq	L_BFoncall
	cmp.l	#65536,d5
	Rbcc	L_BFonCall
	EcCall	CBlGet
	Rbne	L_EcWiErr
	rts

******************************************************************
*	PUT CBLOC n
L_PtCBl1	equ	413
L413	move.l	(a3)+,d5
	moveq	#-1,d1
	moveq	#-1,d2
	Rbra	L_PtCBlX
L_PtCBl3	equ	414
L414	move.l	(a3)+,d2
	move.l	(a3)+,d1
	move.l	(a3)+,d5
	RBra	L_PtCBlX
L_PtCBlX	equ	415
L415	tst.l	d5
	Rbeq	L_BFonCall
	cmp.l	#65536,d5
	Rbcc	L_BFonCall
	EcCall	CBlPut
	Rbne	L_EcWiErr
	rts

******************************************************************
*	DEL CBLOC
L_DlCBl0	equ	416
L416	EcCall	CBlRaz
	rts
L_DlCBl1	equ	417
L417	move.l	(a3)+,d5
	Rbeq	L_BFonCall
	cmp.l	#65536,d5
	Rbcc	L_BFonCall
	EcCall	CBlDel
	Rbne	L_EcWiErr
	rts

******************************************************************
*	GET BLOC n,x,y,tx,ty[,masque]
L_GtBl6		equ	418
L418	move.l	(a3)+,d6
	Rbra	L_GtBla
L_GtBl5		equ	419
L419	moveq	#0,d6
	RBra	L_GtBla
L_GtBla		equ	420
L420	move.l	(a3)+,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	Rbeq	L_BFoncall
	cmp.l	#65536,d1
	Rbcc	L_BFonCall
	EcCall	BlGet
	Rbne	L_EcWiErr
	rts

******************************************************************
*	PUT BLOC n
L_PtBl1		equ	421
L421	move.l	(a3)+,d1
	move.l	#EntNul,d5
	move.l	d5,d4
	move.l	d4,d3
	move.l	d3,d2
	Rbra	L_PtBl
L_PtBl3		equ	422
L422	move.l	#EntNul,d5
	move.l	d5,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	Rbra	L_PtBl
L_PtBl4		equ	423
L423	move.l	#EntNul,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	Rbra	L_PtBl
L_PtBl5		equ	424
L424	move.l	(a3)+,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	RBra	L_PtBl
L_PtBl		equ	425
L425	tst.l	d1
	Rbeq	L_BFonCall
	cmp.l	#65536,d1
	Rbcc	L_BFonCall
	move.l	Buffer(a5),a1
	EcCall	BlPut
	Rbne	L_EcWiErr
	rts

******************************************************************
*	DEL BLOC
L_DlBl0		equ	426
L426	EcCall	BlRaz
	rts
L_DlBl1		equ	427
L427	move.l	(a3)+,d1
	Rbeq	L_BFonCall
	cmp.l	#65536,d1
	Rbcc	L_BFonCall
	EcCall	BlDel
	Rbne	L_EcWiErr
	rts

******************************************************************
*	Bloc reverse
L_HRev		equ	428
L428	move.w	#%1000000000000000,d2
	Rbra	L_BRev
L_VRev		equ	429
L429	move.w	#%0100000000000000,d2
	Rbra	L_BRev
L_BRev		equ	430
L430	move.l	(a3)+,d1
	EcCall	BlRev
	Rbne	L_EcWiErr
	rts

*********************************************************************
*	ADOUBANK
L_AdOuBank	equ	431
L431	move.l	(a3)+,d3
	beq.s	AdOu1
	cmp.l	#16,d3
	bhi.s	AdOu1
	lsl.w	#3,d3
	move.l	ABanks(a5),a2
	lea	-8(a2,d3.w),a2
	move.l	(a2),d3
	Rbeq	L_BkNoRes
	addq.l	#8,d3
AdOu1:	rts

********************************************************************
*	,RESERVATION MEMOIRE
L432
L_RamFast	equ	432
	movem.l	d1/a0/a1/a6,-(sp)
*	add.l	#7,d0
*	and.l	#$FFFFFF8,d0
	move.l	#Clear|Public,d1
	ExeCall	AllocMem
	movem.l	(sp)+,d1/a0/a1/a6
	tst.l	d0
	rts
L_RamChip	equ	433
L433	movem.l	d1/a0/a1/a6,-(sp)
*	add.l	#7,d0
*	and.l	#$FFFFFF8,d0
	move.l	#Chip|Clear|Public,d1
	ExeCall	AllocMem
	movem.l	(sp)+,d1/a0/a1/a6
	tst.l	d0
	rts
******* NON mise a zero!
L_RamFast2	equ	434
L434	movem.l	d1/a0/a1/a6,-(sp)
*	add.l	#7,d0
*	and.l	#$FFFFFF8,d0
	move.l	#Public,d1
	ExeCall	AllocMem
	movem.l	(sp)+,d1/a0/a1/a6
	tst.l	d0
	rts
L_RamChip2	equ	435
L435	movem.l	d1/a0/a1/a6,-(sp)
*	add.l	#7,d0
*	and.l	#$FFFFFF8,d0
	move.l	#Chip|Public,d1
	ExeCall	AllocMem
	movem.l	(sp)+,d1/a0/a1/a6
	tst.l	d0
	rts
******* Liberation
L_RamFree	equ	436
L436	movem.l	d0/d1/a0/a1/a6,-(sp)
*	add.l	#7,d0
*	and.l	#$FFFFFF8,d0
	ExeCall	FreeMem
	movem.l	(sp)+,d0/d1/a0/a1/a6
	rts

***********************************************************
*	=X / Y MOUSE
L_XMou		equ	437
L437	move.l	(a3)+,d1
	move.l	#EntNul,d2
	SyCall	SetM
	rts
L438	SyCall	XyMou
	ext.l	d1
	move.l	d1,-(a3)
	rts
L_YMou		equ	439
L439	move.l	(a3)+,d2
	move.l	#EntNul,d1
	SyCall	SetM
	rts
L440	SyCall	XyMou
	ext.l	d2
	move.l	d2,-(a3)
	rts
***********************************************************
*	=MOUSEKEY
L_MouK		equ	441
L441	SyCall	MouseKey
	moveq	#0,d0
	move.w	d1,d0
	move.l	d0,-(a3)
	rts
***********************************************************
*	HIDE ON HIDE
L_HidO		equ	442
L442	SyCalD	Hide,-1
	rts
L_Hide		equ	443
L443	SyCalD	Hide,0
	rts
***********************************************************
*	SHOW ON SHOW
L_ShoO		equ	444
L444	SyCalD	Show,-1
	rts
L_Show		equ	445
L445	SyCalD	Show,0
	rts
***********************************************************
*	LIMIT MOUSE
L_LimM0		equ	446
L446	moveq	#0,d1
	RBra	L_LimMx
L_LimM1		equ	447
L447	move.l	(a3)+,d1
	Rbmi	L_FonCall
	addq.l	#1,d1
	cmp.l	#8,d1
	Rbhi	L_FonCall
	RBra	L_LimMX
L_LimMX		equ	448
L448	tst.w	ScOn(a5)
	RBeq	L_ScNOp
	SyCall	LimitMEc
	RBne	L_EcWiErr
	rts
L_LimM		equ	449
L449	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	SyCall	LimitM
	rts

***********************************************************
*	CHANGE MOUSE n
L_ChMou		equ	450
L450	move.l	(a3)+,d1
	subq.l	#1,d1
	Rbmi	L_FonCall
	SyCall	ChangeM
	rts

***********************************************************
*	=MOUSEKEY
L_MouCl		equ	451
L451	SyCall	MouRel
	moveq	#0,d0
	move.w	d1,d0
	move.l	d0,-(a3)
	rts

***********************************************************
*	EFFACEMENT DE LA BANQUE D3
L_EffBank	equ	452
L452	movem.l	d0-d7/a0-a2,-(sp)
	move.l	ABanks(a5),a2
	lsl.w	#3,d3
	add.w	d3,a2
	move.l	(a2),d0
	beq	EffBx
	move.l	d0,a1
	move.l	(a1),d0
	cmp.l	#"Spri",d0
	beq	EfBSp
	cmp.l	#"Icon",d0
	beq	EfBSp

******* Banque normale!
	clr.l	(a2)+
	move.l	(a2),d0
	clr.l	(a2)+
* Appelle les extensions
	Rbsr	L_BkChange
* Efface la memoire
	and.l	#$0FFFFFFF,d0
	Rbsr	L_RamFree
	bra	EffBx

******* Banque de sprites
EfBSp:	clr.l	(a2)+			* Plus de banque!
	clr.l	(a2)+
	move.l	a1,a2
	move.l	a2,-(sp)
	lea	8(a2),a2		* Saute le nom!
	move.w	(a2)+,d7
* Efface les sprites
	clr.w	d6
EfB1	Rbsr	L_EfPointe		* Efface le Sprite/Icon
	addq.l	#8,a2
	addq.w	#1,d6
	cmp.w	d7,d6
	bcs.s	EfB1
* Efface les pointeurs
	move.w	d7,d0
	ext.l	d0
	lsl.w	#3,d0
	add.w	#10+64,d0
	move.l	(sp)+,a1
	Rbsr	L_RamFree
	bra	EffBx
******* Fin de l'effacement des banques
EffBx:	movem.l	(sp)+,d0-d7/a0-a2
	rts

******* ROUTINE: efface une definition pointee par A2
L_EfPointe	equ	453
L453	move.l	(a2),d1		* Efface le SPRITE
	beq.s	EfPo1
	move.l	d1,a1
	move.w	(a1),d0
	mulu	2(a1),d0
	lsl.l	#1,d0
	mulu	4(a1),d0
	add.l	#10,d0
	Rbsr	L_RamFree
EfPo1:	move.l	4(a2),d1	* Efface le MASQUE
	ble.s	EfPo2
	move.l	d1,a1
	move.l	(a1),d0
	Rbsr	L_RamFree
EfPo2	clr.l	(a2)
	clr.l	4(a2)
	rts

***********************************************************
*	EFFACEMENT DE TOUTES LES BANQUES temporaires
L_EffBanks	equ	454
L454	moveq	#0,d3
	move.l	ABanks(a5),a2
EfBks1:	move.l	(a2)+,d0
	move.l	(a2)+,d1
	bmi.s	EfBks2
	tst.l	d0
	beq.s	EfBks2
	Rbsr	L_EffBank
EfBks2:	addq.w	#1,d3
	cmp.w	#16,d3
	bcs.s	EfBks1
	Rbra	L_SendBanks

***********************************************************
*	EFFACEMENT DE TOUTES LES BANQUES
L_EffAllBanks	equ	455
L455	moveq	#15,d3
EABks:	Rbsr	L_EffBank
	dbra	d3,EABks
	Rbra	L_SendBanks

***********************************************************
*	ERASE n
L_Erase		equ	456
L456	move.l	(a3)+,d3
	subq.l	#1,d3
	cmp.l	#15,d3
	Rbhi	L_FonCall
	Rbsr	L_EffBank
	Rbra	L_SendBanks

***********************************************************
*	BANK SWAP a,b
L_BSwap		equ	457
L457	moveq	#16,d2
	move.l	(a3)+,d1
	Rbeq	L_FonCall
	cmp.l	d2,d1
	Rbcc	L_FonCall
	move.l	(a3)+,d0
	Rbeq	L_FonCall
	cmp.l	d2,d0
	Rbcc	L_FonCall
	lsl.w	#3,d0
	lsl.w	#3,d1
	move.l	ABanks(a5),a0
	lea	-8(a0,d1.w),a1
	lea	-8(a0,d0.w),a0
	moveq	#1,d1
BSwp1	move.l	(a0),d0
	move.l	(a1),(a0)+
	move.l	d0,(a1)+
	dbra	d1,BSwp1
	Rbra	L_SendBanks

***********************************************************
*	ENVOIE LES ADRESSES DES BANQUES AUX TRAPPES
L_SendBanks	equ	458
L458	movem.l	a0-a3/d0-d7,-(sp)
* Appelle les extensions
	Rbsr	L_BkChange
* Explore toutes les banques
	moveq	#15,d2
	move.l	ABanks(a5),a2
	moveq	#0,d7
SBk1:	move.l	(a2),d0
	beq.s	SBkN
	move.l	d0,a1
	move.l	(a1),d0
	cmp.l	#"Spri",d0
	beq.s	SBkS
SBkN:	addq.l	#8,a2
	dbra	d2,SBk1
* Arrete tout ce qui n'a pas ete vu!
	btst	#0,d7
	bne.s	SBk3
	sub.l	a1,a1
	SyCall	SetSpBank
SBk3:	movem.l	(sp)+,a0-a3/d0-d7
	rts
******* Banque de sprites presente, en 1!!!
SBkS:	cmp.w	#15,d2
	bne.s	SBkN
	lea	8(a1),a1
	SyCall	SetSpBank
	bset	#0,d7
	bra.s	SBkN

******* EXTENSIONS: changement d'adresses de banques!
L_BkChange	equ	459
L459	movem.l	a0/d0/d1,-(sp)
	lea	ExtAdr(a5),a0
	moveq	#26-1,d0
BkCh1:	move.l	12(a0),d1
	beq.s	BkCh2
	movem.l	a0-a6/d0-d7,-(sp)
	move.l	d1,a1
	move.l	ABanks(a5),a0
	jsr	(a1)
	movem.l	(sp)+,a0-a6/d0-d7
BkCh2	lea	16(a0),a0
	dbra	d0,BkCh1	
	movem.l	(sp)+,a0/d0/d1
	rts

***********************************************************
*	RESERVATION DE LA BANQUE DE SPRITES ou ICONES
*	D0= Effacer ou non?
*	D1= Sprite maximum a reserver!
*	Retour: A1= Debut banque / A2= Descripteur sprite/icone
L_ResIco	equ	460
L460	movem.l	d2-d7/a3/a4,-(sp)
	move.l	ABanks(a5),a3
	lea	8(a3),a3
	lea	L460a(pc),a4
	moveq	#1,d7
	Rbra	L_ResSi
L460a	dc.b	"Icons   "
L_ResSpr	equ	461
L461	movem.l	d2-d7/a3/a4,-(sp)
	move.l	ABanks(a5),a3
	lea	L461a(pc),a4
	moveq	#0,d7
	Rbra	L_ResSi
L461a	dc.b	"Sprites "
L_ResSi		equ	462
L462	ext.l	d1
	move.l	d1,d2
	lsl.w	#3,d2
	add.w	#10+64,d2
******* Va effacer
	tst.w	d0	
	beq.s	ResS1
ResS0:	move.l	d7,d3
	Rbsr	L_EffBank
******* Reserve!
ResS1:	move.l	(a3),d0
	beq.s	ResS2
	move.l	d0,a0
	move.l	(a0),d0
	cmp.l	(a4),d0
	bne.s	ResS0
	beq.s	ResS3
* Reserve pour D1 sprites/icons!
ResS2:	move.l	d2,d0
	Rbsr	L_RamFast
	beq	ResSE
	move.l	d0,a0
	move.l	(a4),(a0)
	move.l	4(a4),4(a0)
	move.w	d1,8(a0)
	move.l	a0,(a3)
	move.l	d1,4(a3)
	addq.l	#8,4(a3)
	or.b	#%11000000,4(a3)
* Recopie la palette courante!
	move.w	d1,d3
	lsl.w	#3,d3
	lea	10(a0,d3.w),a2
	move.l	ScOnAd(a5),d2
	beq.s	ResS3
	move.l	d2,a1
	lea	EcPal(a1),a1
	moveq	#32-1,d3
ResS2a:	move.w	(a1)+,(a2)+
	dbra	d3,ResS2a
******* Change la banque?
ResS3:	cmp.w	8(a0),d1
	bls.s	ResS5
* Re-Reserve la memoire!
	move.l	d2,d0
	Rbsr	L_RamFast
	beq	ResSE
	move.l	d0,a1
	move.l	d0,(a3)
	move.l	d1,4(a3)
	addq.l	#8,4(a3)
	or.b	#%11000000,4(a3)
	move.l	a0,-(sp)
* Recopie la l'ancienne
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.w	d1,(a1)+
	move.w	(a0)+,d3
	subq.w	#1,d3
ResS4:	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	dbra	d3,ResS4
	move.l	d0,a1
	lea	-64(a1,d2.l),a1
	moveq	#32-1,d3
ResS4a:	move.w	(a0)+,(a1)+
	dbra	d3,ResS4a
* Efface l'ancienne
	move.l	(sp),a1
	move.l	d0,(sp)
	move.w	8(a1),d0
	ext.l	d0
	lsl.w	#3,d0
	add.w	#10+64,d0
	Rbsr	L_RamFree
	move.l	(sp)+,a0
******* Change l'adresse de la banque de sprites (si banque de sp)
ResS5	lea	8(a0),a1
	lsl.w	#3,d1
	lea	-8+2(a1,d1.w),a2
	tst.w	d7
	bne.s	ResS6
	SyCall	SetSpBank
ResS6	movem.l	(sp)+,d2-d7/a3/a4
	moveq	#0,d0
	rts
******* Erreur!
ResSE	sub.l	a1,a1
	tst.w	d7
	bne.s	ResS7
	SyCall	SetSpBank
ResS7	movem.l	(sp)+,d2-d7/a3/a4
	moveq	#1,d0
	rts

***********************************************************
*	INS BOB / INS SPRITE / INS ICON n
L_ISpr		equ	463
L463	clr.w	-(sp)
	move.l	ABanks(a5),-(sp)
	move.l	#"Spri",d0
	Rbra	L_RIIS
L_IIco		equ	464
L464	move.w	#-1,-(sp)
	move.l	ABanks(a5),a0
	pea	8(a0)
	move.l	#"Icon",d0
	Rbra	L_RIIS
* Routine!
L_RIIS		equ	465
L465	move.l	(a3)+,d3
	Rbls	L_FonCall
	move.l	(sp),a1
	move.l	(a1),d1
	Rbeq	L_BkNoRes
	move.l	d1,a1
	cmp.l	(a1),d0
	Rbne	L_BkNoRes
	addq.l	#8,a1
	move.w	(a1),d2
	addq.w	#1,d2
	ext.l	d2
	move.l	d2,d1
	lsl.l	#3,d1
	moveq	#10+64,d0
	add.l	d1,d0
	Rbsr	L_RamFast
	Rbeq	L_OOfMem
	move.l	(sp),a0
	move.l	d0,(a0)
	addq.w	#1,4+2(a0)
* Recopie
	move.l	d0,a2
	move.l	-8(a1),(a2)+
	move.l	-4(a1),(a2)+
	lea	2(a1),a0
	move.w	d2,(a2)+
	moveq	#0,d4
	subq.w	#1,d3
	cmp.w	d2,d3
	bls.s	RIIs1
	move.w	d2,d3
	subq.w	#1,d3
RIIs1	cmp.w	d3,d4
	beq.s	RIIs2
	move.l	(a0)+,(a2)
	move.l	(a0)+,4(a2)
RIIs2	addq.l	#8,a2
	addq.w	#1,d4
	cmp.w	d4,d2
	bne.s	RIIs1
	moveq	#31,d0
RIIs3	move.w	(a0)+,(a2)+
	dbra	d0,RIIs3
* Va finir
	Rbra	L_DSI8

******* DEL ICON
L_DIc1		equ	466
L466	move.l	(a3),-(a3)
	Rbra	L_DIc2
L_DIc2		equ	467
L467	move.w	#1,-(sp)
	move.l	#"Icon",d0
	move.l	ABanks(a5),a0
	pea	8(a0)
	Rbra	L_DSpIc
******* DEL SPRITE/BOB n TO n
L_DSp1		equ	468
L468	move.l	(a3),-(a3)
	Rbra	L_DSp2
L_DSp2		equ	469
L469	clr.w	-(sp)
	move.l	#"Spri",d0
	move.l	ABanks(a5),-(sp)
	Rbra	L_DSpIc
L_DSpIc		equ	470
L470	move.l	(sp),a0
	tst.l	(a0)
	Rbeq	L_BkNoRes
	move.l	(a0),a1
	cmp.l	(a1),d0
	Rbne	L_BkNoRes
	lea	8(a1),a1
	move.l	(a3)+,d3
	Rble	L_FonCall
	cmp.w	(a1),d3
	bcs.s	DSI1
	move.w	(a1),d3
DSI1	move.l	(a3)+,d2
	Rble	L_FonCall
	cmp.w	d3,d2
	Rbhi	L_FonCall
* Efface les donnees!
DSI2	move.w	d2,d1
	lsl.w	#3,d1
	lea	-8+2(a1,d1.w),a2
	movem.l	d2-d3/a1-a2,-(sp)
	Rbsr	L_EfPointe
	movem.l	(sp)+,d2-d3/a1-a2
	addq.w	#1,d2
	cmp.w	d3,d2
	bls.s	DSI2
* Compte le nombre d'images
	moveq	#0,d2
	move.l	a1,a0
	move.w	(a0)+,d0
	subq.w	#1,d0
DSI3	tst.l	(a0)
	beq.s	DSI4
	addq.w	#1,d2
DSI4	addq.l	#8,a0
	dbra	d0,DSI3
* Reduit!
	move.l	d2,d1
	Rbeq	L_DSIEra
	lsl.l	#3,d1
	moveq	#10+64,d0		* Reserve la nouvelle ram
	add.l	d1,d0
	Rbsr	L_RamFast
	Rbeq	L_OOfMem
	move.l	(sp),a2			* Change la banque
	move.l	d0,(a2)
	move.l	d2,d4
	addq.l	#8,d4
	bset	#31,d4
	move.l	d4,4(a2)
	move.l	d0,a0			* Entete
	move.l	-8(a1),(a0)+
	move.l	-4(a1),(a0)+
	move.w	d2,(a0)+
	move.l	a1,a2			* Pointeurs
	move.w	(a2)+,d0
	subq.w	#1,d0
DSI5	tst.l	(a2)
	beq.s	DSI6
	move.l	(a2),(a0)+
	move.l	4(a2),(a0)+
DSI6	addq.l	#8,a2
	dbra	d0,DSI5
	moveq	#31,d0			* Palette
DSI7	move.w	(a2)+,(a0)+
	dbra	d0,DSI7
	RBra	L_DSI8

******* Efface l'ancienne banque
L_DSI8		equ	471
L471	move.w	(a1),d0
	lsl.w	#3,d0
	add.w	#10+64,d0
	ext.l	d0
	subq.l	#8,a1
	Rbsr	L_RamFree
* Ca y est---> change la banque...
	move.l	(sp)+,a0
	tst.w	(sp)+
	bne.s	L471a
	move.l	(a0),a1
	addq.l	#8,a1
	SyCall	SetSpBank
L471a	rts

******* Erase bank!
L_DSIEra	equ	472
L472	addq.l	#4,sp
	moveq	#0,d3
	move.w	(sp)+,d3
	Rbra	L_EffBank

***********************************************************
*	RESERVE AS ...
L473	

******* RESERVE AS WORK n,l
L_RsWrk		equ	474
L474	pea	L474a(pc)
	clr.w	-(sp)
	clr.w	-(sp)
	Rbsr	L_RsBk
	addq.l	#8,sp
	rts
L474a	dc.b	"Work    "
******* RESERVE AS CHIP WORK n,l
L_RsCWrk	equ	475
L475	pea	L475a(pc)
	move.w	#-1,-(sp)
	clr.w	-(sp)
	Rbsr	L_RsBk
	addq.l	#8,sp
	rts
L475a	dc.b	"Work    "
******* RESERVE AS DATA n,l
L_RsDat		equ	476
L476	pea	L476a(pc)
	clr.w	-(sp)
	move.w	#-1,-(sp)
	Rbsr	L_RsBk
	addq.l	#8,sp
	rts
L476a	dc.b	"Datas   "
******* RESERVE AS CHIP DATA n,l
L_RsCDat	equ	477	
L477	pea	L477a(pc)
	move.w	#-1,-(sp)
	move.w	#-1,-(sp)
	Rbsr	L_RsBk
	lea	8(sp),sp
	rts
L477a	dc.b	"Datas   "
* Reserve!
L_RsBk		equ	478
L478	move.l	(a3)+,d0
	Rbmi	L_FonCall
	addq.l	#1,d0
	and.l	#$FFFFFE,d0
	addq.l	#8,d0			* Plus le nom!
	move.l	d0,d2
	tst.w	4(sp)
	beq.s	RsBk1
	bset	#31,d2
RsBk1:	move.l	(a3)+,d3
	subq.l	#1,d3
	cmp.l	#15,d3
	Rbhi	L_FonCall
	lsl.w	#3,d3
	move.l	ABanks(a5),a2
	add.w	d3,a2
	tst.l	(a2)			* Already reserved?
	Rbne	L_BkAlRes
	tst.w	6(sp)
	bne.s	RsBk1a
	bclr	#30,d2
	Rbsr	L_RamFast
	bra.s	RsBk1b
RsBk1a	bset	#30,d2
	Rbsr	L_RamChip
RsBk1b	Rbeq	L_OOfMem
	move.l	d0,(a2)+
	move.l	d2,(a2)+
* Copie l'entete
	move.l	d0,a1
	move.l	8(sp),a0
	moveq	#7,d0
RsBk2:	move.b	(a0)+,(a1)+
	dbra	d0,RsBk2
	rts

***********************************************************
*	START / LENGTH

******* =START(n)
L_FnSt		equ	479
L479	move.l	(a3)+,d3
	Rbsr	L_BkAd
	move.l	a0,-(a3)
	rts
******* =LENGTH(n)
L_FnLn		equ	480
L480	move.l	(a3)+,d3
	subq.l	#1,d3
	cmp.l	#15,d3
	Rbhi	L_FonCall
	lsl.w	#3,d3
	move.l	ABanks(a5),a0
	move.l	4(a0,d3.w),d3
	beq.s	FnLn1
	and.l	#$0FFFFFFF,d3
	subq.l	#8,d3
FnLn1:	move.l	d3,-(a3)
	rts
	
******* Ramene l'adresse d'une banque / D3-> A0
L_BkAd		equ	481
L481	subq.l	#1,d3
	cmp.l	#15,d3
	Rbhi	L_FonCall
	lsl.w	#3,d3
	move.l	ABanks(a5),a2
	lea	0(a2,d3.w),a2
	move.l	(a2),a0
	addq.l	#8,a0
	move.l	4(a2),d0
	Rbeq	L_BkNoRes
	and.l	#$0FFFFFFF,d0
	subq.l	#8,d0
	rts

L482
L483

******* Ramene l'adresse du BOB D1 -> A2
*	D7-> Nb total de sprites
L_AdBob		equ	484
L484	move.l	ABanks(a5),a0
	move.l	(a0),d0
	Rbeq	L_AdBE1
	move.l	d0,a2
	move.l	(a2),d0
	cmp.l	#"Spri",d0
	Rbne	L_AdBE1
	addq.l	#8,a2
	move.w	(a2),d7
	and.w	#$3FFF,d1
	Rbeq	L_FonCall
	cmp.w	d7,d1
	Rbhi	L_AdBE2
	lsl.w	#3,d1
	lea	-8+2(a2,d1.w),a2
	moveq	#0,d0
	rts
L_AdBE1		equ	485
L485	moveq	#36,d0
	rts
L_AdBE2		equ	486
L486	moveq	#EcEBase+24-1,d0
	rts
L_AdBE3		equ	487
L487	moveq	#EcEBase+30-1,d0
	rts
******* Ramene l'adresse de l'ICONE D1 -> A2
L_AdIcon	equ	488
L488	move.l	ABanks(a5),a0
	move.l	8(a0),d0
	Rbeq	L_AdBE1
	move.l	d0,a2
	move.l	(a2),d0
	cmp.l	#"Icon",d0
	Rbne	L_AdBE1
	addq.l	#8,a2
	move.w	(a2),d7
	and.w	#$3FFF,d1
	Rbeq	L_FonCall
	cmp.w	d7,d1
	Rbhi	L_AdBE3
	lsl.w	#3,d1
	lea	-8+2(a2,d1.w),a2
	moveq	#0,d0
	rts

***********************************************************
*	FREE FAST/CHIP

******* =CHIP FREE
L_FChip		equ	489
L489	move.l	#Chip,d1
	Rbra	L_FFree
******* =FAST FREE
L_FFast		equ	490
L490	move.l	#Fast,d1
	Rbra	L_FFree
L_FFree		equ	491
L491	move.l	a6,-(sp)
	ExeCall	AvailMem
	move.l	(sp)+,a6
	move.l	d0,-(a3)
	rts

***********************************************************
*	TRANSFERTS MEMOIRE

; TRANSFERT DE MEMOIRE a0/pair->a1/pair, d0 (pair) octets
L_transmem	equ	492
L492	move.w 	d0,d1

	move.w	a0,d2
	btst	#0,d2
	bne.s	trimp
	move.w	a1,d2
	btst	#0,d2
	bne.s	trimp
	btst	#0,d0
	bne.s	trimp

* Copy rapide
	and.w	#$0F,d1
        cmp.l 	a0,a1
        bcs.s 	trsmm
; a1>a0: remonter le programme
        add.l 	d0,a0
        add.l 	d0,a1
        movem.l a0/a1,-(sp)
        lsr.l 	#4,d0         ;nombre de mots longs
        beq.s 	trsmm2
trsmm1: move.l 	-(a0),-(a1)
	move.l 	-(a0),-(a1)
	move.l 	-(a0),-(a1)
	move.l 	-(a0),-(a1)  ;transfert mots longs
	subq.l	#1,d0
	bne.s	trsmm1
trsmm2: subq.w 	#1,d1
        bmi.s 	trsmm3b
trsmm3: move.b 	-(a0),-(a1)  ;transfert octets
	dbra	d1,trsmm3
trsmm3b:movem.l	(sp)+,a0/a1 ;pointe la fin des zones
        rts
; a0<a1: descendre le programme
trsmm:  lsr.l 	#4,d0
        beq.s 	trsmm5
trsmm4: move.l 	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	subq.l	#1,d0
	bne.s	trsmm4
trsmm5: subq.w	#1,d1
        bmi.s 	trsmm7
trsmm6: move.b 	(a0)+,(a1)+
	dbra	d1,trsmm6
trsmm7: rts

* Copie lente
trimp	and.w	#$03,d1
	cmp.l 	a0,a1
        bcs.s 	triup
; a1>a0: remonter le programme
        add.l 	d0,a0
        add.l 	d0,a1
        movem.l a0/a1,-(sp)
        lsr.l 	#2,d0 
        beq.s 	trsmm2
.trsmm1 move.b 	-(a0),-(a1)
	move.b 	-(a0),-(a1)
	move.b 	-(a0),-(a1)
	move.b 	-(a0),-(a1)
	subq.l	#1,d0
	bne.s	.trsmm1
.trsmm2 subq.w 	#1,d1
        bmi.s 	.trsmm3b
.trsmm3 move.b 	-(a0),-(a1)
	dbra	d1,.trsmm3
.trsmm3b
	movem.l	(sp)+,a0/a1
        rts
; Vers le bas
triup	lsr.l 	#2,d0
        beq.s 	.trsmm5
.trsmm4 move.b 	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	subq.l	#1,d0
	bne.s	.trsmm4
.trsmm5 subq.w	#1,d1
        bmi.s 	.trsmm7
.trsmm6 move.b 	(a0)+,(a1)+
	dbra	d1,.trsmm6
.trsmm7 rts

; COPY depart(inclus),fin(exclue) TO arrivee: COPIE DE PLAGES MEMOIRE
L_copy		equ	493
L493	move.l	(a3)+,a1
	move.l	(a3)+,d0
	move.l	(a3)+,a0
	sub.l	a0,d0
	Rbls	L_FonCall
	Rbra	L_TransMem

******* LONGDEC
L_LongDec	equ	494
L494	move.l	a1,-(sp)
	moveq	#-1,d3
	moveq	#0,d4
	RBsr	L_EToAsc
	move.l	(sp)+,a1
	rts

; FILL depart(inclus) TO fin(exclue), mot long: REMPLI DES PLAGES MEMOIRE
L_fill		equ	495
L495	move.l	(a3)+,d4
	move.l	(a3)+,d2
	Rbsr	L_Adoubank
	move.l	d3,a0
	sub.l 	a0,d2
        Rbcs 	L_foncall
        move.w 	d2,d1
        lsr.l 	#4,d2         	;travaille par mot long
        beq.s 	fil2
	subq.w	#1,d2
fil1:   move.l 	d4,(a0)+
	move.l	d4,(a0)+
	move.l	d4,(a0)+
	move.l	d4,(a0)+
	dbra	d2,fil1
fil2:   and 	#$000F,d1
        beq.s 	fil4
	subq.w	#1,d1
fil3:   rol.l 	#8,d4
        move.b 	d4,(a0)+
	dbra	d1,fil3
fil4:   rts

; HUNT (depart TO fin,chaine$): RAMENE L'ADRESSE D'UNE CHAINE DANS LA MEMOIRE!
L_Hunt		equ	496
L496	Rbsr	L_ChVerBuf	
        move.l 	(a3)+,d7     	;adresse de fin
	Rbsr	L_AdOuBank
	move.l	d3,a0		;adresse de recherche
        subq.w	#1,d2
        bcs.s 	ht3           	;si chaine nulle: ramene zero!
        move.l 	Buffer(a5),d6
        subq.l 	#1,a0
ht1:    addq.l 	#1,a0        ;passe a l'octet suivant
        move.l 	a0,a1
        cmp.l 	d7,a0         ;pas trouve!
        bcc.s 	ht3
        move.l 	d6,a2        ;pointe la chaine recherchee
        move.w 	d2,d1
ht2:    cmpm.b 	(a2)+,(a1)+
        bne.s 	ht1
        dbra 	d1,ht2
        move.l 	a0,-(a3)
	rts
ht3:    clr.l	-(a3)
	rts
	
***********************************************************
*	LISTBANK
L_LBank		equ	497
L497	moveq	#0,d3
LBk1:	Rbsr	L_LlBank
	beq.s	LBk2
	move.b	#13,(a1)+
	move.b	#10,(a1)+
	clr.b	(a1)
	Rbsr	L_ImpChaine
LBk2:	addq.w	#1,d3
	cmp.w	#16,d3
	bne.s	LBk1
	rts

******* Routine Listbank: Ecrit la definition dans BUFFER
L_LlBank	equ	498
L498	movem.l	d1-d7/a2,-(sp)
	move.w	d3,d0
	lsl.w	#3,d0
	move.l	ABanks(a5),a2
	add.w	d0,a2
	move.l	(a2),d0
	beq	LlBkX
* Numero de la banque
	move.l	d0,a1
	move.l	Buffer(a5),a0
	addq.w	#1,d3
	ext.l	d3
	cmp.w	#10,d3
	bcc.s	LlBk1
	move.b	#" ",(a0)+
LlBk1:	move.l	d3,d0
	Rbsr	L_LongDec
	move.b	#" ",(a0)+
	move.b	#"-",(a0)+
	move.b	#" ",(a0)+
* Nom de la banque
	moveq	#7,d0
LlBk2:	move.b	(a1)+,(a0)+
	dbra	d0,LlBk2
	move.b	#" ",(a0)+
* Start
	move.b	#"S",(a0)+
	move.b	#":",(a0)+
	move.b	#" ",(a0)+
	move.l	(a2),d0
	addq.l	#8,d0
	moveq	#8,d3
	RBsr	L_LongAscii
	move.b	#" ",(a0)+
* Length
	move.b	#"L",(a0)+
	move.b	#":",(a0)+
	move.b	#" ",(a0)+
	move.l	4(a2),d0
	and.l	#$0FFFFFFF,d0
	subq.l	#8,d0
	moveq	#6,d3
	RBsr	L_LongAscii
* Ok!
	clr.b	(a0)
	move.l	a0,a1
	move.l	Buffer(a5),a0
	moveq	#1,d0
LlBkX:	movem.l	(sp)+,d1-d7/a2
	tst.w	d0
	rts

************************************************************ 
*	Impression chaine A0
L_ImpChaine	equ	499
L499	tst.w	ImpFlg(a5)
	Rbne	L_ImpImp
	move.l	a0,a1
	WiCall	Print
	rts

************************************************************
*	BSETBCLRBCHGBTSTROLROR

******* BSET
L_BSet		equ	500
L500	move.l	(a3)+,d0
	move.l	(a0),d1
	bset	d0,d1
	move.l	d1,(a0)
	rts
L501	move.l	(a3)+,a0
	move.l	(a3)+,d0
	bset	d0,(a0)
	rts
******* BCLR
L_BClr		equ	502
L502	move.l	(a3)+,d0
	move.l	(a0),d1
	bclr	d0,d1
	move.l	d1,(a0)
	rts
L503	move.l	(a3)+,a0
	move.l	(a3)+,d0
	bclr	d0,(a0)
	rts
******* BCHG
L_Bchg		equ	504
L504	move.l	(a3)+,d0
	move.l	(a0),d1
	bchg	d0,d1
	move.l	d1,(a0)
	rts
L505	move.l	(a3)+,a0
	move.l	(a3)+,d0
	bchg	d0,(a0)
	rts
******* BTST
L_BTst		equ	506
L506	move.l	(a3)+,d0
	move.l	(a0),d1
	btst	d0,d1
	Rbne	L_btT
	Rbra	L_btF
L507	move.l	(a3)+,a0
	move.l	(a3)+,d0
	btst	d0,(a0)
	Rbne	L_btT
	Rbra	L_btF
L_btF		equ	508
L508	clr.l	-(a3)
	rts
L_btT		equ	509
L509	moveq	#-1,d3
	move.l	d3,-(a3)
	rts

******* ROR.B
L_BRor		equ	510
L510	move.l	(a3)+,d0
	move.b	3(a0),d1
	ror.b	d0,d1
	move.b	d1,3(a0)
	rts
L511	move.l	(a3)+,a0
	move.l	(a3)+,d0
	move.b	(a0),d1
	ror.b	d0,d1
	move.b	d1,(a0)
	rts
******* ROR.W
L_WRor		equ	512
L512	move.l	(a3)+,d0
	move.w	2(a0),d1
	ror.w	d0,d1
	move.w	d1,2(a0)
	rts
L513	move.l	(a3)+,a0
	move.l	(a3)+,d0
	move.w	(a0),d1
	ror.w	d0,d1
	move.w	d1,(a0)
	rts
******* ROR.L
L_LRor		equ	514
L514	move.l	(a3)+,d0
	move.l	(a0),d1
	ror.l	d0,d1
	move.l	d1,(a0)
	rts
L515	move.l	(a3)+,a0
	move.l	(a3)+,d0
	move.l	(a0),d1
	ror.l	d0,d1
	move.l	d1,(a0)
	rts
*** ROL.B
L_BRol		equ	516
L516	move.l	(a3)+,d0
	move.b	3(a0),d1
	rol.b	d0,d1
	move.b	d1,3(a0)
	rts
L517	move.l	(a3)+,a0
	move.l	(a3)+,d0
	move.b	(a0),d1
	rol.b	d0,d1
	move.b	d1,(a0)
	rts
******* ROL.W
L_WRol		equ	518
L518	move.l	(a3)+,d0
	move.w	2(a0),d1
	rol.w	d0,d1
	move.w	d1,2(a0)
	rts
L519	move.l	(a3)+,a0
	move.l	(a3)+,d0
	move.w	(a0),d1
	rol.w	d0,d1
	move.w	d1,(a0)
	rts
******* ROL.L
L_LRol		equ	520
L520	move.l	(a3)+,d0
	move.l	(a0),d1
	rol.l	d0,d1
	move.l	d1,(a0)
	rts
L521	move.l	(a3)+,a0
	move.l	(a3)+,d0
	move.l	(a0),d1
	rol.l	d0,d1
	move.l	d1,(a0)
	rts

************************************************************
*	AREG/DREG
L_IAReg		equ	522
L522	moveq	#3,d0
	moveq	#8,d1
	Rbra	L_IReg
L523	moveq	#7,d0
	moveq	#8,d1
	RBra	L_FReg
L_IDReg		equ	524
L524	moveq	#8,d0
	moveq	#0,d1
	RBra	L_IReg
L525	moveq	#8,d0
	moveq	#0,d1
	RBra	L_FReg
L_IReg		equ	526
L526	move.l	(a3)+,d3
	Rbsr	L_RReg
	move.l	d3,(a0)
	rts
L_FReg		equ	527
L527	Rbsr	L_RReg
	move.l	(a0),-(a3)
	rts
* Routinette
L_RReg		equ	528
L528	move.l	(a3)+,d2
	cmp.l	d0,d2
	Rbcc	L_FonCall
	add.w	d1,d2
	lsl.w	#2,d2
	lea	CallReg(a5),a0
	lea	0(a0,d2.w),a0
	rts

************************************************************
*	POKEDOKELOKE
L_Pok		equ	529
L529	move.l	(a3)+,d0
	move.l	(a3)+,a0
	move.b	d0,(a0)
	rts
L_Dok		equ	530
L530	move.l	(a3)+,d0
	move.l	(a3)+,d1
	btst	#0,d1
	Rbne	L_AdrErr
	move.l	d1,a0
	move.w	d0,(a0)
	rts
L_Lok		equ 	531
L531	move.l	(a3)+,d0
	move.l	(a3)+,d1
	btst	#0,d1
	Rbne	L_AdrErr
	move.l	d1,a0
	move.l	d0,(a0)
	rts
L_AdrErr	equ	532
L532	moveq	#25,d0
	Rbra	L_Error
L_Lik		equ	533
L533	move.l	(a3)+,d0
	btst	#0,d0
	Rbne	L_AdrErr
	move.l	d0,a0
	move.l	(a0),-(a3)
	rts
L_Dik		equ	534
L534	move.l	(a3)+,d0
	btst	#0,d0
	Rbne	L_AdrErr
	move.l	d0,a0
	moveq	#0,d0
	move.w	(a0),d0
	move.l	d0,-(a3)
	rts
L_Pik		equ	535
L535	move.l	(a3)+,a0
	moveq	#0,d0
	move.b	(a0),d0
	move.l	d0,-(a3)
	rts

***********************************************************
*	CALL adresse,list of params
L_Call		equ	536
L536	RBsr	L_AdOuBank
	move.l	d3,CallAd(a5)
	movem.l	a4-a6,-(sp)
	lea	CallReg(a5),a6
	movem.l	(a6)+,d0-d7/a0-a2
	move.l	a6,-(sp)
	move.l	CallAd(a5),a6
	jsr	(a6)
	move.l	(sp)+,a6
	movem.l	d0-d7/a0-a2,-(a6)
	movem.l	(sp)+,a4-a6
	rts

************************************************************
*	Appel fonction systeme
L_FExe		equ	537
L537	move.l	$4,a0
	RBra	L_SysCall
L_FGfx		equ	538
L538	move.l	T_GfxBase(a5),a0
	Rbra	L_SysCall
L_FDos		equ	539
L539	move.l	DosBase(a5),a0
	Rbra	L_SysCall
L_FIntu		equ	540
L540	move.l	T_IntBase(a5),a0
	RBra	L_SysCall
* Appel
L_SysCall	equ	541
L541	move.l	(a3)+,d3
	movem.l	a3-a6,-(sp)
	move.l	a0,a6
	lea	0(a6,d3.l),a4
	lea	CallReg(a5),a3
	movem.l	(a3)+,d0-d7/a0-a2
	jsr	(a4)
	movem.l	(sp)+,a3-a6
	move.l	d0,-(a3)
	rts


***********************************************************
*	UPDATE et assimiles

******* Update 
L_UpOff		equ	542
L542	bclr	#5,ActuMask(a5)
	bclr	#6,ActuMask(a5)
	rts
L_UpOn		equ	543
L543	bset	#5,ActuMask(a5)
	bset	#6,ActuMask(a5)
	rts

******* UPDATE!
L_UpDa		equ	544
L544	movem.l	a3-a6,-(sp)		* Bobs
	SyCall	EffBob
	SyCall	ActBob
	SyCall	AffBob
	EcCall	SwapScS
	SyCall	ActHs			* Hard sprites
	SyCall	AffHs
	movem.l	(sp)+,a3-a6
	rts

******* BOB UPDATE
L_BUpOf		equ	545
L545	bclr	#5,ActuMask(a5)
	rts
L_BUpOn		equ	546
L546	bset	#5,ActuMask(a5)
	rts
L_BUpDa		equ	547
L547	movem.l	a3-a6,-(sp)
	SyCall	EffBob
	SyCall	ActBob
	SyCall	AffBob
	EcCall	SwapScS
	movem.l	(sp)+,a3-a6
	rts

******* SPRITE Update 
L_SUpOf		equ	548
L548	bclr	#6,ActuMask(a5)
	rts
L_SUpOn		equ	549
L549	bset	#6,ActuMask(a5)
	rts

******* SPRITE UPDATE!
L_SUpDa		equ	550
L550	movem.l	a3-a6,-(sp)
	SyCall	ActHs		
	SyCall	AffHs
	movem.l	(sp)+,a3-a6
	rts

******* UPDATE EVERY n
L_UpEv		equ	551
L551	move.l	(a3)+,d3
	cmp.l	#65536,d3
	Rbcc	L_FonCall
	move.w	d3,VBLDelai(a5)
	rts
L552

***********************************************************
*	BOB a la main!
L_BbClr		equ	553
L553	movem.l	a3-a6,-(sp)
	SyCall	EffBob
	movem.l	(sp)+,a3-a6
	rts
*******
L_BbDrw		equ	554
L554	movem.l	a3-a6,-(sp)
	SyCall	ActBob
	SyCall	AffBob
	movem.l	(sp)+,a3-a6
	rts

***********************************************************
*	LIMIT BOB [numero,],x,y to x,y
L_LBob0		equ	555
L555	move.l	#EntNul,d2
	move.l	d2,d3
	move.l	d3,d4
	move.l	d4,d5
	moveq	#-1,d1
	Rbra	L_LBob1
L_LBob5		equ	556
L556	move.l	(a3)+,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	RBra	L_LBob1
L_LBob4		equ	557
L557	move.l	(a3)+,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	moveq	#-1,d1
	RBra	L_LBob1
L_LBob1		equ	558
L558	SyCall	LimBob
	Rbne	L_FonCall
	rts

***********************************************************
*	PRIORITY (REVERSE) ON/OFF
L_PrOn		equ	559
L559	moveq	#1,d1
	moveq	#-1,d2
	RBra	L_Prooo
L_PrOf		equ	560
L560	moveq	#0,d1
	moveq	#-1,d2
	RBra	L_Prooo
L_PrROn		equ	561
L561	moveq	#-1,d1
	moveq	#1,d2
	Rbra	L_Prooo
L_PrROf		equ	562
L562	moveq	#-1,d1
	moveq	#0,d2
	Rbra	L_Prooo
L_PrOoo		equ	563
L563	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	SyCall	SPrio
	rts

L564

***********************************************************
*	CHANNEL x TO SPRITE x
L_ChaSpr	equ	565
L565	moveq	#0,d5
	moveq	#64,d6
	RBra	L_ChaX
L_ChaBob	equ	566
L566	moveq	#1,d5
	moveq	#64,d6
	RBra	L_ChaX
L_ChaScD	equ	567
L567	moveq	#2,d5
	moveq	#8,d6
	RBra	L_ChaX
L_ChaScS	equ	568
L568	moveq	#3,d5
	moveq	#8,d6
	RBra	L_ChaX
L_ChaScO	equ	569
L569	moveq	#4,d5
	moveq	#8,d6
	RBra	L_ChaX
L_ChaRain	equ	570
L570	moveq	#6,d5
	moveq	#4,d6
	RBra	L_ChaX
L_ChaX		equ	571
L571	move.l	(a3)+,d3
	move.l	(a3)+,d4
	cmp.l	#64,d4
	RBcc	L_FonCall
	cmp.l	d6,d3
	Rbcc	L_FonCall
	lsl.w	#1,d4
	lea	AnCanaux(a5),a0
	move.b	d5,0(a0,d4.w)		* 1 => TYPE
	move.b	d3,1(a0,d4.w)		* 2 => NUMERO
	rts

***********************************************************
*	= AMALERR
L_AmE		equ	572
L572	moveq	#0,d3
	move.w	PAmalE(a5),d3
	move.l	d3,-(a3)
	rts

***********************************************************
*	FREEZE / UNFREEZE
L_Frz		equ	573
L573	SyCall	AMALFrz
	rts
L_UFrz		equ	574
L574	SyCall	AMALUFrz
	rts

***********************************************************
*	SYNCHRO ON/OFF
L_SOn		equ	575
L575	moveq	#0,d1
	clr.w	InterOff(a5)
	SyCall	SetSync
	rts
L_SOff		equ	576
L576	moveq	#-1,d1
	move.w	d1,InterOff(a5)
	SyCall	SetSync
	rts
L_Sync		equ	577
L577	SyCall	Synchro
	rts

***********************************************************
*	AMAL/MOVE/ANIM on/off/freeze
L_AmOn0		equ	578
L578	moveq	#%0001,d2
	moveq	#1,d3
	Rbra	L_MvOnOf0
L_AmOf0		equ	579
L579	moveq	#%0001,d2
	moveq	#-1,d3
	Rbra	L_MvOnOf0
L_AmFz0		equ	580
L580	moveq	#%0001,d2
	moveq	#0,d3
	Rbra	L_MvOnOf0
L_MvOn0		equ	581
L581	moveq	#%1100,d2
	moveq	#1,d3
	Rbra	L_MvOnOf0
L_AnOn0		equ	582
L582	moveq	#%0010,d2
	moveq	#1,d3
	Rbra	L_MvOnOf0
L_MvOf0		equ	583
L583	moveq	#%1100,d2
	moveq	#-1,d3
	Rbra	L_MvOnOf0
L_AnOf0		equ	584
L584	moveq	#%0010,d2
	moveq	#-1,d3
	Rbra	L_MvOnOf0
L_MvFz0		equ	585
L585	moveq	#%1100,d2
	moveq	#0,d3
	Rbra	L_MvOnOf0
L_AnFz0		equ	586
L586	moveq	#%0010,d2
	moveq	#0,d3
	Rbra	L_MvOnOf0
L_MvOnOf0	equ	587
L587	moveq	#-1,d1
	SyCall	AMALMvO
	rts
L588
L_AmOn1		equ	589
L589	moveq	#%0001,d2
	moveq	#1,d3
	Rbra	L_MvOnOf1
L_AmOf1		equ	590
L590	moveq	#%0001,d2
	moveq	#-1,d3
	Rbra	L_MvOnOf1
L_AmFz1		equ	591
L591	moveq	#%0001,d2
	moveq	#0,d3
	Rbra	L_MvOnOf1
L_MvOn1		equ	592
L592	moveq	#%1100,d2
	moveq	#1,d3
	Rbra	L_MvOnOf1
L_AnOn1		equ	593
L593	moveq	#%0010,d2
	moveq	#1,d3
	Rbra	L_MvOnOf1
L_MvOf1		equ	594
L594	moveq	#%1100,d2
	moveq	#-1,d3
	Rbra	L_MvOnOf1
L_AnOf1		equ	595
L595	moveq	#%0010,d2
	moveq	#-1,d3
	Rbra	L_MvOnOf1
L_MvFz1		equ	596
L596	moveq	#%1100,d2
	moveq	#0,d3
	Rbra	L_MvOnOf1
L_AnFz1		equ	597
L597	moveq	#%0010,d2
	moveq	#0,d3
	RBra	L_MvOnOf1
L_MvOnOf1	equ	598
L598	move.l	(a3)+,d1
	SyCall	AMALMvO
	rts

***********************************************************
*	MOVE X n,a$,ad
L_MvX3		equ	599
L599	moveq	#2,d3
	Rbra	L_AMm3
* 	MOVE Y n,a$,ad
L_MvY3		equ	600
L600	moveq	#3,d3
	Rbra	L_AMm3
*	ANIM n,a$,ad
L_AnM3		equ	601
L601	moveq	#1,d3
	Rbra	L_AMm3
* 	AMAL n,a$,ad
L_Am3		equ	602
L602	moveq	#0,d3
	Rbra	L_AMm3
*
L_AMm3		equ	603
L603	move.l	(a3)+,d5
	and.l	#$FFFFFFFE,d5
	Rbra	L_MvA3
*	MOVE X n,a$
L_MvX		equ	604
L604	moveq	#2,d3
	Rbra	L_MvA
* 	MOVE Y n,a$
L_MvY		equ	605
L605	moveq	#3,d3
	Rbra	L_MvA
*	AMAL n,a$
L_Am		equ	606
L606	moveq	#0,d3
	Rbra	L_MvA
*	ANIM n,a$
L_Anm		equ	607
L607	moveq	#1,d3
	Rbra	L_MvA
*
L_MvA		equ	608
L608	moveq	#0,d5
	Rbra	L_MvA3
*
L_MvA3		equ	609
L609	move.l	(a3)+,a1
	move.l	(a3)+,d6
	clr.w	PAmalE(a5)
* 16 si inter / 64 sinon!
	moveq	#16,d0
	tst.w	InterOff(a5)
	beq.s	InMva1
	moveq	#64,d0
InMva1:	cmp.l	d0,d6			* Nombre autorise
	Rbcc	L_FonCall
* Trouve la banque AMAL (numero 2)
	moveq	#0,d7
	move.l	ABanks(a5),a0
	move.l	8*3(a0),d0
	beq.s	InMb1
	move.l	d0,a0
	move.l	(a0),d0
	cmp.l	BkAmal(pc),d0
	bne	InMb1
	lea	8(a0),a0
	move.l	a0,d7
* Est-ce une chaine ou un numero?
InMb1:	cmp.l	#8192,a1
	bcc.s	InMb2
* Dans la banque!
	tst.l	d7
	Rbeq	L_BkNoRes
	tst.l	(a0)
	Rbeq	L_FonCall
	add.l	(a0),a0
	move.w	a1,d0
	move.l	ChVide(a5),a1
	cmp.w	(a0)+,d0
	Rbhi	L_FonCall
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
	beq.s	L609x
	bpl.s	IAmE
	cmp.w	#-1,d0
	Rbeq	L_OOfMem
	neg.w	d0
	Rbra	L_EcWiErr
L609x	rts
IAmE:	move.w	a0,PAmalE(a5)		* Offset de l'erreur
	add.w	#SpEBase+2,d0
	Rbra	L_Error
BkAmal	dc.b	"Amal"

L610
***********************************************************
*	=MOVON(n)
L_Movon		equ	611
L611	Rbsr	L_FnAm1
	SyCall	Movon
	move.l	d1,-(a3)
	rts
*	=CHANAN(x)
L_ChanA		equ	612
L612	Rbsr	L_FnAm1
	SyCall	ChanA
	move.l	d1,-(a3)
	rts
*	=CHANMV(x)
L_ChanM		equ	613
L613	Rbsr	L_FnAm1
	SyCall	ChanM
	move.l	d1,-(a3)
	rts
L_FnAm1		equ	614
L614	move.l	(a3)+,d1
	Rbmi	L_FonCall
	cmp.l	#64,d1
	Rbcc	L_FonCall
	rts

***********************************************************
*	=AMREG(n[,n])=
L_IAmR1		equ	615
L615	move.l	(a3)+,d6
	move.l	(a3)+,d3
	move.l	#EntNul,d1
	RBra	L_IAmR
L_FAmR1		equ	616
L616	move.l	(a3)+,d3
	move.l	#EntNul,d1
	Rbra	L_FAmR
L_IAmR2		equ	617
L617	move.l	(a3)+,d6
	move.l	(a3)+,d3
	move.l	(a3)+,d1
	Rbra	L_IAmR
L_FAmR2		equ	618
L618	move.l	(a3)+,d3
	move.l	(a3)+,d1
	Rbra	L_FAmR
L_IAmR		equ	619
L619	Rbsr	L_AmRR
	move.w	d6,(a0)
	rts
L_FAmR		equ	620
L620	Rbsr	L_AmRR
	move.w	(a0),d0
	ext.l	d0
	move.l	d0,-(a3)
	rts
* Pitite routine
L_AmRR		equ	621
L621	moveq	#0,d2
	cmp.l	#EntNul,d1
	bne.s	IAmRa
	cmp.l	#26,d3
	Rbcc	L_FonCall
	moveq	#-1,d1
	bra.s	IAmRb
IAmRa:	cmp.l	#64,d1
	Rbcc	L_FonCall
	cmp.l	#10,d3
	Rbcc	L_FonCall
IAmRb:	SyCall	AMALReg
	Rbmi	L_FonCall
	rts

***********************************************************
*	AMPLAY Speed,Dir[,n to m]
L_AmP2		equ	622
L622	clr.l	-(a3)
	move.l	#63,-(a3)
	Rbra	L_AmP4
L_AmP4		equ	623
L623	move.l	(a3)+,d2
	cmp.l	#64,d2
	Rbcc	L_FonCall
	move.l	(a3)+,d1
	Rbmi	L_FonCall
	cmp.l	d1,d2
	Rbcs	L_FonCall
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	SyCall	PlaySet
	rts

***********************************************************
*	=XY BOB(n)
L_XBob		equ	624
L624	move.l	(a3)+,d1
	Rbmi	L_FonCall
	SyCall	XYBob
	Rbne	L_FonCall
	ext.l	d1
	move.l	d1,-(a3)
	rts
L_YBob		equ	625
L625	move.l	(a3)+,d1
	Rbmi	L_FonCall
	SyCall	XYBob
	Rbne	L_FonCall
	ext.l	d2
	move.l	d2,-(a3)
	rts

***********************************************************
*	=XY SPRITE(n)
L_XSp		equ	626
L626	move.l	(a3)+,d1
	Rbmi	L_FonCall
	SyCall	XYSp
	Rbne	L_FonCall
	ext.l	d1
	move.l	d1,-(a3)
	rts
L_YSp		equ	627
L627	move.l	(a3)+,d1
	Rbmi	L_FonCall
	SyCall	XYSp
	Rbne	L_FonCall
	ext.l	d2
	move.l	d2,-(a3)
	rts

L628

***********************************************************
*	=I BOB / I SPRITE
L_IBb		equ	629
L629	move.l	(a3)+,d1
	Rbmi	L_FonCall
	SyCall	XYBob
	Rbne	L_FonCall
	ext.l	d3
	move.l	d3,-(a3)
	rts
L_ISp		equ	630
L630	move.l	(a3)+,d1
	Rbmi	L_FonCall
	SyCall	XYSp
	Rbne	L_FonCall
	ext.l	d3
	move.l	d3,-(a3)
	rts

***********************************************************
*	SET BOB n,back,planes,minterm
L_StBb		equ	631
L631	move.l	(a3)+,d7
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
IStb3	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	SyCall	SetBob
	bne.s	IStb4
	rts
IStb4	Rbmi	L_OOfMem
	Rbra	L_FonCall


***********************************************************
*	BOB n,x,y,a
L_BbSt4		equ	632
L632	moveq	#0,d7
	moveq	#-1,d6
	moveq	#0,d5
	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	SyCall	SetBob
	bne.s	L632a
	rts
L632a	Rbmi	L_OOfMem
	Rbra	L_FonCall


***********************************************************
*	BOB OFF x
L_BbOff1	equ	633
L633	move.l	(a3)+,d1
	SyCall	OffBob
	rts
L_BbOff0	equ	634
L634	SyCall	OffBobS
	rts

***********************************************************
*	SET SPRITE BUFFER
L_SsBuf		equ	635
L635	move.l	(a3)+,d1
	cmp.l	#16,d1
	Rbcs	L_FonCall
	SyCall	SBufHs
	bne.s	L635a
	rts
L635a	moveq	#0,d0
	RBra	L_SpErr

* Entree erreurs sprites
L_SpErr		equ	636
L636	add.w	#SpEBase,d0
	Rbra	L_Error

***********************************************************
*	SPRITE PRIORITY n
L_SpPri		equ	637
L637	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d1
	cmp.l	#4,d1
	Rbhi	L_FonCall
	SyCall	PriHs
	rts

***********************************************************
*	SPRITE n,x,y,a
L_SpSp		equ	638
L638	move.l	(a3)+,d4
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	SyCall	NXYAHs
	Rbne	L_FonCall
	bset	#6,T_Actualise(a5)
	rts

***********************************************************
*	SPRITE OFF x
L_SpOff1	equ	639
L639	move.l	(a3)+,d1
	SyCall	XOffHs
	Rbne	L_FonCall
	bset	#6,T_Actualise(a5)
	rts

***********************************************************
*	SPRITE OFF
L_SpOff0	equ	640
L640	SyCall	OffHs
	bset	#6,T_Actualise(a5)
	rts

***********************************************************
*	Collisions hard!
L_HCol		equ	641
L641	move.l	(a3)+,d3
	move.l	(a3)+,d2
	moveq	#$0F,d1
	SyCall	SetHCol
	rts
******* =HARDCOL(sprite)
L_FHCol		equ	642
L642	move.l	(a3)+,d1
	bmi.s	FHc1
	cmp.l	#8,d1
	Rbcc	L_FonCall
FHc1	SyCall	GetHCol
	move.l	d1,-(a3)
	rts

***********************************************************
*	= BOBSPRITE COL(n[,x to y])
L_BSCol1	equ	643
L643	move.l	(a3)+,d1
	Rbmi	L_FonCall
	moveq	#0,d2
	bset	#31,d2
	moveq	#63,d3
	SyCall	ColBob
	move.l	d0,-(a3)
	rts
L_BSCol3	equ	644
L644	move.l	(a3)+,d3
	Rbmi	L_FonCall
	cmp.l	#63,d3
	Rbhi	L_FonCall
	move.l	(a3)+,d2
	Rbmi	L_FonCall
	bset	#31,d2
	move.l	(a3)+,d1
	Rbmi	L_FonCall
	SyCall	ColBob
	move.l	d0,-(a3)
	rts

***********************************************************
*	= BOB COL(n[,x to y])
L_BbCol1	equ	645
L645	move.l	(a3)+,d1
	Rbmi	L_FonCall
	moveq	#0,d2
	move.l	#10000,d3
	SyCall	ColBob
	move.l	d0,-(a3)
	rts
L_BbCol3	equ	646
L646	move.l	(a3)+,d3
	Rbmi	L_FonCall
	move.l	(a3)+,d2
	Rbmi	L_FonCall
	move.l	(a3)+,d1
	Rbmi	L_FonCall
	SyCall	ColBob
	move.l	d0,-(a3)
	rts

***********************************************************
*	= SPRITEBOB COL([,x to y])
L_SBCol1	equ	647
L647	move.l	(a3)+,d1
	Rbmi	L_FonCall
	moveq	#0,d2
	bset	#31,d2
	move.l	#10000,d3
	SyCall	ColSpr
	move.l	d0,-(a3)
	rts
L_SBCol3	equ	648
L648	move.l	(a3)+,d3
	Rbmi	L_FonCall
	move.l	(a3)+,d2
	Rbmi	L_FonCall
	bset	#31,d2
	move.l	(a3)+,d1
	Rbmi	L_FonCall
	SyCall	ColSpr
	move.l	d0,-(a3)
	rts
***********************************************************
*	= SPRITE COL[,x to y])
L_SpCol1	equ	649
L649	move.l	(a3)+,d1
	Rbmi	L_FonCall
	moveq	#0,d2
	moveq	#63,d3
	SyCall	ColSpr
	move.l	d0,-(a3)
	rts
L_SpCol3	equ	650
L650	move.l	(a3)+,d3
	Rbmi	L_FonCall
	cmp.l	#63,d3
	Rbhi	L_FonCall
	move.l	(a3)+,d2
	Rbmi	L_FonCall
	move.l	(a3)+,d1
	Rbmi	L_FonCall
	SyCall	ColSpr
	move.l	d0,-(a3)
	rts
L651

***********************************************************
*	= COL(n)
L_Coll		equ	652
L652	move.l	(a3)+,d1
	SyCall	ColGet
	move.l	d0,-(a3)
	rts

***********************************************************
*	MAKE ICON MASK [n]
L_MkIMs0	equ	653
L653	moveq	#1,d1
	Rbsr	L_AdIcon
	RBne	L_Error
	subq.w	#1,d7
	RBra	L_MkMa1
L_MkIMs1	equ	654
L654	move.l	(a3)+,d1
	Rbsr	L_AdIcon
	RBne	L_Error
	moveq	#0,d7
	Rbra	L_MkMa1
*	NO ICON MASK [n]
L_NoIMs0	equ	655
L655	moveq	#1,d1
	Rbsr	L_AdIcon
	RBne	L_Error
	subq.w	#1,d7
	Rbra	L_NoMa1
L_NoIMs1	equ	656
L656	move.l	(a3)+,d1
	Rbsr	L_AdIcon
	Rbne	L_Error
	moveq	#0,d7
	Rbra	L_NoMa1
***********************************************************
*	MAKE MASK [n]
L_MkMask0	equ	657
L657	moveq	#1,d1
	Rbsr	L_AdBob
	Rbne	L_Error
	subq.w	#1,d7
	Rbra	L_MkMa1
L_MkMask1	equ	658
L658	move.l	(a3)+,d1
	Rbsr	L_AdBob
	Rbne	L_Error
	moveq	#0,d7
	Rbra	L_MkMa1
L_MkMa1		equ	659
L659	tst.l	(a2)
	beq.s	MkMa2
	SyCall	MaskMk
	Rbne	L_OOfMem
MkMa2:	addq.l	#8,a2
	dbra	d7,L659
	rts

******* NO MASK [n]
L_NoMask0	equ	660
L660	moveq	#1,d1
	Rbsr	L_AdBob
	Rbne	L_Error
	subq.w	#1,d7
	RBra	L_NoMa1
L_NoMask1	equ	661
L661	move.l	(a3)+,d1
	Rbsr	L_AdBob
	Rbne	L_Error
	moveq	#0,d7
	Rbra	L_NoMa1
L_NoMa1		equ	662
L662	tst.l	(a2)
	beq.s	NoMa3
	tst.l	4(a2)
	ble.s	NoMa2
	move.l	4(a2),a1
	move.l	(a1),d0
	Rbsr	L_RamFree
NoMa2:	move.l	#$C0000000,4(a2)
NoMa3:	addq.l	#8,a2
	dbra	d7,L662
	rts

L663

***********************************************************
*	HOT SPOT n,x,y / n,x
L_HotSp3	equ	664
L664	move.l	(a3)+,d3
	move.l	(a3)+,d2
	moveq	#0,d1
	Rbra	L_HotSp
L_HotSp2	equ	665
L665	move.l	(a3)+,d1
	and.w	#%01110111,d1
	addq.w	#1,d1
	Rbra	L_HotSp
L_HotSp		equ	666
L666	movem.w	d1-d3,-(sp)
	move.l	(a3)+,d1
	Rbsr	L_AdBob
	Rbne	L_Error
	movem.w	(sp)+,d1-d3
	SyCall	SpotHot
	RBne	L_FonCall
	rts

***********************************************************
*	GET SPRITE/BOB [sc,]n,x,y to x,y
L_GetSp6	equ	667
L667	move.l	5*4(a3),d1
	EcCall	AdrEc
	Rbeq	L_ScNOp
	moveq	#4,d6
	RBra	L_GetSp
L_GetSp5	equ	668
L668	move.l	ScOnAd(a5),d0
	Rbeq	L_ScNOp
	moveq	#0,d6
	RBra	L_GetSp
L_GetSp		equ	669
L669	move.l	d0,-(sp)
	move.l	d0,a0
	Rbsr	L_Ritoune
* Adresse du descripteur --> A2
	moveq	#0,d0			* Ne pas effacer
	Rbsr	L_ResSpr
	Rbne	L_OOfMem
	Rbsr	L_EfPointe
* Appelle la trappe
	move.l	(sp)+,a1		* Ecran en A1
	SyCall	SprGet
	RBne	L_OOfMem
	rts
L670
***********************************************************
*	GET ICON [sc,]n,x,y to x,y
L_GetIc6	equ	671
L671	move.l	5*4(a3),d1
	EcCall	AdrEc
	Rbeq	L_ScNOp
	moveq	#4,d6
	RBra	L_GetIc
L_GetIc5	equ	672
L672	move.l	ScOnAd(a5),d0
	Rbeq	L_ScNOp
	moveq	#0,d6
	RBra	L_GetIc
L_GetIc		equ	673
L673	move.l	d0,-(sp)
	move.l	d0,a0
	Rbsr	L_Ritoune
* Adresse du descripteur --> A2
	moveq	#0,d0			* Ne pas effacer
	Rbsr	L_ResIco
	Rbne	L_OOfMem
	Rbsr	L_EfPointe
* Appelle la trappe
	move.l	(sp)+,a1		* Ecran en A1
	SyCall	SprGet
	Rbne	L_OOfMem
	move.l	#$C0000000,4(a2)	* Pas de masque!
	rts

******* Calcule taille
L_Ritoune	equ	674
L674	move.l	(a3)+,d5
	Rbmi	L_FonCall
	move.l	(a3)+,d4
	Rbmi	L_FonCall
	move.l	(a3)+,d3
	Rbmi	L_FonCall
	move.l	(a3)+,d2
	Rbmi	L_FonCall
	move.l	(a3)+,d1
	Rbls	L_FonCall
	add.w	d6,a3
* Calcule taille
	cmp.w	EcTx(a0),d4
	Rbhi	L_FonCall
	move.w	d4,d6
	cmp.w	EcTy(a0),d5
	Rbhi	L_FonCall
	sub.w	d2,d4
	Rbls	L_FonCall
	sub.w	d3,d5
	Rbls	L_FonCall
	rts

*******************************************************
*	PUT BOB n
L_PBob		equ	675
L675	move.l	(a3)+,d1
	Rbmi	L_FonCall
	SyCall	PutBob
	Rbne	L_FonCall
	rts

*******************************************************
*	Fonctions retournement
L_RevX		equ	676
L676	bset	#7,2(a3)
	rts
L_RevY		equ	677
L677	bset	#6,2(a3)
	rts
L_Rev		equ	678
L678	or.b	#%11000000,2(a3)
	rts

L679

***********************************************************
*	PATCH BOB x,y,n
L_PatBb		equ	680
L680	move.l	(a3),d1
	Rbmi	L_FonCall	
	Rbsr	L_AdBob
	Rbne	L_Error
	tst.l	(a2)
	beq.s	PatBbe
	move.l	(a3)+,d1
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	BufBob(a5),a1
	moveq	#0,d4
	moveq	#-1,d5
	SyCall	Patch
	rts
PatBbe	moveq	#24,d0
	Rbra	L_EcWiErr

***********************************************************
*	PATCH ICON x,y,n
L_PatIc		equ	681
L681	move.l	(a3),d1
	Rbmi	L_FonCall	
	Rbsr	L_AdIcon
	Rbne	L_Error
	tst.l	(a2)
	beq.s	PatIce
	tst.l	4(a2)
	bmi.s	.Skip
	bne.s	.Skip
	move.l	#$C0000000,4(a2)
.Skip	move.l	(a3)+,d1
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	move.l	BufBob(a5),a1
	moveq	#0,d4
	moveq	#-1,d5
	SyCall	Patch
	rts
PatIce	moveq	#30,d0
	Rbra	L_Error

***********************************************************
*	=SPRITE BASE(n)
*	=ICON BASE(n)
L_SBase		equ	682
L682	move.l	(a3)+,d3
	move.l	d3,d1
	bpl	FsBi1
	neg.l	d1
FsBi1	Rbsr	L_AdBob
	Rbne	L_Error
	tst.l	d3
	bpl.s	FsBi2
	addq.l	#4,a2
FsBi2	move.l	(a2),-(a3)
	rts
L_IBase		equ	683
L683	move.l	(a3)+,d3
	move.l	d3,d1
	bpl	FsBii1
	neg.l	d1
FsBii1	Rbsr	L_AdIcon
	Rbne	L_Error
	tst.l	d3
	bpl.s	FsBii2
	addq.l	#4,a2
FsBii2	move.l	(a2),-(a3)
	rts

L684:
L685:

***********************************************************
*	FILL FILE DEVICES
L_FillDev	equ	686
L686	movem.l	d0-d7/a0-a6,-(sp)
	Rbsr	L_FFDeb
* Cherche les devices
	move.l	$4,a6
	jsr	Forbid(a6)
	move.l	DosBase(a5),a3
	move.l	34(a3),a3
	move.l	24(a3),d0
	lsl.l	#2,d0
	move.l	d0,a3
	move.l	4(a3),d0
	lsl.l	#2,d0
	move.l	d0,a3
* Boucle d'exploration
FDev1	tst.l	8(a3)
	beq.s	FDev5
	move.l	40(a3),d0
	beq.s	FDev5
	lsl.l	#2,d0
	move.l	d0,a0
	move.b	(a0)+,d0
	ext.w	d0
	move.l	Buffer(a5),a2
	lea	8(a2),a1
	subq.w	#1,d0
	bmi.s	FDev5
FDev2	move.b	(a0)+,(a1)+
	dbra	d0,FDev2
	move.b	#":",(a1)+
FDev3	clr.b	(a1)
* Filtre 
	move.l	Name2(a5),a0		* Filtre POSITIF
	tst.b	(a0)
	beq.s	FDev4
	lea	8(a2),a1
	Rbsr	L_Joker
	beq.s	FDev5
* Poke dans la liste
FDev4	move.l	#-1,124(a2)
	moveq	#" ",d2
	Rbsr	L_FillFPoke
* Device suivant
FDev5	move.l	(a3),d0
	lsl.l	#2,d0
	move.l	d0,a3
	bne.s	FDev1
* C'est fini!
	jsr	Permit(a6)
	Rbsr	L_FillSort
	movem.l	(sp)+,d0-d7/a0-a6
	rts

******* Enleve l'ancien buffer -si present-
L_FfDeb		equ	687
L687	Rbsr	L_FillFFree
* Premier faux fichier
	move.l	Buffer(a5),a2
	clr.w	8(a2)
	clr.l	124(a2)
	moveq	#0,d2
	Rbsr	L_FillFPoke
	clr.w	FillFNb(a5)
	rts
	
L688

******* OPEN: ouvre le fichier systeme (diskname1) access mode D2
L_FOpen		equ	689
L689	move.l 	Name1(a5),d1
	DosCall	DosOpen
	tst.l	d0
	Rbeq	L_DiskError
	move.l	d0,Handle(a5)
	rts

******* CLOSE fichier systeme
L_FClose	equ	690
L690	tst.l	Handle(a5)
	beq.s	PaFCl
	move.l	Handle(a5),d1
	DosCall	DosClose
	clr.l	Handle(a5)
PaFCl:	rts

******* READ fichier systeme D3 octets dans D2	/ Pas erreurs
L_FRead		equ	691
L691	movem.l	d1-d7/a0-a6,-(sp)
	move.l	Handle(a5),d1
	move.l	DosBase(a5),a6
	jsr	DosRead(a6)
	movem.l	(sp)+,d1-d7/a0-a6
	tst.l	d0
	rts
* Avec erreurs!
L_ERead		equ	692
L692	movem.l	d1-d7/a0-a6,-(sp)
	move.l	Handle(a5),d1
	move.l	DosBase(a5),a6
	jsr	DosRead(a6)
	movem.l	(sp)+,d1-d7/a0-a6
	tst.l	d0
	Rbeq	L_DiskError
	Rbmi	L_DiskError
	cmp.l	d0,d3
	Rbne	L_DiskError
	rts

******* WRITE fichier systeme D3 octets de D2	
L_FWrite	equ	693
L693	movem.l	d1-d7/a0-a6,-(sp)
	move.l	Handle(a5),d1
	move.l	DosBase(a5),a6
	jsr	DosWrite(a6)
	movem.l	(sp)+,d1-d7/a0-a6
	tst.l	d0
	Rbeq	L_DiskError
	Rbmi	L_DiskError
	cmp.l	d0,d3
	Rbne	L_DiskError
	rts

******* SEEK fichier system D3 mode D2 deplacement
L_FSeek		equ	694
L694	movem.l	d1-d7/a0-a2/a6,-(sp)
	move.l	Handle(a5),d1
	move.l	DosBase(a5),a6
	jsr	DosSeek(a6)
	movem.l	(sp)+,d1-d7/a0-a2/a6
	tst.l	d0
	Rbmi	L_DiskError
	rts

******* ENLEVE LE LOCK COURANT
L_LockFree	equ	695
L695	movem.l	d0-d2/a0-a2/a6,-(sp)
	move.l	LockSave(a5),d1
	beq.s	LokF
	move.l	DosBase(a5),a6
	jsr	DosUnLock(a6)
	clr.l	LockSave(a5)
LokF:	movem.l	(sp)+,d0-d2/a0-a2/a6
	rts

******* NOM DISQUE
L_NomDisk	equ	696
L696	move.l	(a3)+,a2
	move.w	(a2)+,d2
	Rbeq	L_IlDName
	cmp.w	#108,d2
	Rbcc	L_IlDName
	move.l	Name1(a5),a0
	RBsr	L_ChVerBuf2
	RBra	L_PathIt

L_ChVerBuf2	equ	697
L697	move.l 	a2,a1
        move.w 	d2,d0
        subq.w 	#1,d0
        bmi.s 	L697b
        cmp.w 	#1000,d0
        bcs.s 	L697a
        move.w 	#1000,d0
L697a:  move.b 	(a1)+,(a0)+
        dbra 	d0,L697a
L697b:  clr.b 	(a0)
        rts

L_IlDName	equ	698
L698	Rbra	L_FonCall


******* NOM DIR
*	Met la racine en NAME1
*	Met le filtre en NAME2
L_NomDir	equ	699
L699	move.l	(a3)+,a2
	move.w	(a2)+,d2
	cmp.w	#256,d2
	Rbcc	L_Stolong
	moveq	#0,d7
	RBra	L_NDir
L_NDir		equ	700
L700	move.l	Name1(a5),a0
	clr.b	(a0)
	move.l	Name2(a5),a1
	clr.b	(a1)
	moveq	#-1,d1
	move.l	a0,d6
NmD1	addq.w	#1,d1
	cmp.w	d1,d2
	beq.s	NmD5
	move.b	(a2)+,d0
	move.b	d0,(a0)+
	clr.b	(a0)
	cmp.b	#"*",d0
	beq.s	NmD2
	cmp.b	#"?",d0
	bne.s	NmD3
NmD2	bset	#0,d7
NmD3	cmp.b	#":",d0
	beq.s	NmD4
	cmp.b	#"/",d0
	bne.s	NmD1
NmD4	bclr	#0,d7
	Rbne	L_IlDName
	move.l	a0,d6
	bra.s	NmD1
NmD5	tst.w	d7
	beq.s	NmDX
	move.l	d6,a0
NmD6	move.b	(a0)+,(a1)+
	bne.s	NmD6
	move.l	d6,a0
	clr.b	(a0)
NmDx	RBra	L_PathIt

******* Erreurs disque
L_DiskError	equ	701
L701	DosCall	DosIOErr
	RBra	L_DiskErr
L_DiskErr	equ	702
L702	lea	ErDisk(pc),a0
	moveq	#-1,d1
DiE1:	addq.l	#1,d1
	move.w	(a0)+,d2
	bmi.s	DiE2
	cmp.w	d0,d2
	bne.s	DiE1
	add.w	#DEBase,d1
	move.w	d1,d0
	tst.w	FsFlag(a5)
	Rbne	L_FsError
	Rbra	L_Error
DiE2:	moveq	#DEBase+15,d0
	RBra	L_Error
* Table des erreurs reconnues
ErDisk:	dc.w 203,204,205,210,213,214,216,218
	dc.w 220,221,222,223,224,225,226,-1

******* Bad file format
L_DiForm	equ	703
L703	moveq	#DEBase+16,d0
	Rbra	L_Error

*********************************************************************
*	Compute NAME1 + PATHACT >>> NAME1
L_Pathit	equ	704
L704
	movem.l	a0-a1/d0-d1,-(sp)
* Cherche un ":" dans le nom
	move.l	Name1(a5),a0
	cmp.b	#":",(a0)
	beq.s	.DP
.Loop1	move.b	(a0)+,d0
	beq.s	.NoDP
	cmp.b	#":",d0
	bne.s	.Loop1
	bra.s	.Fini
* Recopie à la fin du pathact
.NoDp	move.l	PathAct(a5),a0
.Loop2	tst.b	(a0)+
	bne.s	.Loop2
	move.l	Name1(a5),a1
.Loop3	move.b	(a1)+,(a0)+
	bne.s	.Loop3
* Remet dans NAME1
	move.l	PathAct(a5),a0
	move.l	Name1(a5),a1
.Loop4	move.b	(a0)+,(a1)+
	bne.s	.Loop4
	subq.l	#1,a1
.Loop5	move.b	(a0)+,(a1)+
	bne.s	.Loop5
* Ok
.Fini	movem.l	(sp)+,a0-a1/d0-d1	
	rts
** Deux points au début
.Dp	move.l	PathAct(a5),a1
.Dpl1	tst.b	(a1)+
	bne.s	.Dpl1
	move.l	a1,d1
.Dpl2	move.b	(a0)+,(a1)+
	bne.s	.Dpl2
	move.l	Name1(a5),a1
	move.l 	PathAct(a5),a0
.Dpl3	move.b	(a0)+,d0
	beq.s	.Dpl4
	cmp.b	#":",d0
	beq.s	.Dpl4
	move.b	d0,(a1)+
	bra.s	.Dpl3
.Dpl4	move.l	d1,a0
.Dpl5	move.b	(a0)+,(a1)+
	bne.s	.Dpl5
	bra.s	.Fini

*********************************************************************
*	Sauvegarde BANQUES

******* Charge et trouve le hunk
L_LHunk		equ	705
L705	movem.l	a0/a1/d1/d2/d3,-(sp)
* Charge les 4 octets de debut!
	move.l	Buffer(a5),d2
	moveq	#4,d3
	Rbsr	L_ERead
	move.l	d2,a1
	move.l	(a1),d1
	lea	NHunk1(pc),a0
	moveq	#1,d0
NHu1:	cmp.l	(a0)+,d1
	beq.s	NHu2
	addq.l	#1,d0
	tst.l	(a0)
	bne.s	NHu1
	moveq	#0,d0
NHu2:	movem.l	(sp)+,a0/a1/d1/d2/d3
	tst.w	d0
	rts
NHunk1	dc.b 	"AmBk"
	dc.b 	"AmSp"
	dc.b 	"AmBs"
	dc.b 	"AmIc"
	dc.l 	0

******* Sauve le hunk D0
L_SHunk		equ	706
L706	movem.l	a0/d0/d2/d3,-(sp)
	lea	NHunk2(pc),a0
	lsl.w	#2,d0
	lea	-4(a0,d0.w),a0
* Sauve le hunk
	move.l	a0,d2
	moveq	#4,d3
	Rbsr	L_FWrite
	movem.l	(sp)+,a0/d0/d2/d3
	rts
NHunk2	dc.b 	"AmBk"
	dc.b 	"AmSp"
	dc.b 	"AmBs"
	dc.b 	"AmIc"
	dc.l 	0

***********************************************************
*	SAVE a$,adresse-> sauver UNE banque memoire!
*******
L_Save2		equ	707
L707	move.l	(a3)+,d3
* Ouvre le fichier / Mode NEW
	Rbsr	L_NomDisk
	move.l	#1006,d2
	Rbsr	L_FOpen
	Rbeq	L_DiskError
* Va sauver la banque
	Rbsr	L_SaveBk
	Rbsr	L_FClose
	rts
******* Sauve toutes les banques
L_Save1		equ	708
L708	Rbsr	L_NomDisk
	move.l	#1006,d2
	Rbsr	L_FOpen
	Rbeq	L_DiskError
	Rbsr	L_SaveBks
	Rbsr	L_FClose
	rts

******* Entete AMBS
L_SaveBks	equ	709
L709	moveq	#3,d0
	Rbsr	L_SHunk
* Nombre de banques
	move.l	ABanks(a5),a0
	moveq	#0,d7
	moveq	#15,d0
SvB1a:	tst.l	(a0)
	beq.s	SvB1b
	addq.w	#1,d7
SvB1b:	addq.l	#8,a0
	dbra	d0,SvB1a
	move.l	Buffer(a5),a2
	move.w	d7,(a2)
	move.l	a2,d2
	moveq	#2,d3
	Rbsr	L_FWrite
* Sauve les banques!
	move.l	ABanks(a5),a0
	moveq	#1,d3
SvB1c:	tst.l	(a0)
	beq.s	SvB1d
	movem.l	a0/d3,-(sp)
	Rbsr	L_SaveBk
	movem.l	(sp)+,a0/d3
SvB1d:	addq.l	#8,a0
	addq.w	#1,d3
	cmp.w	#16,d3
	bls.s	SvB1c
	rts

******* SAVE BANQUE D3
L_SaveBk	equ	710
L710	cmp.l	#16,d3
	Rbhi	L_FonCall
	move.w	d3,d0
	lsl.w	#3,d0
	Rbeq	L_FonCall
	move.l	ABanks(a5),a2
	move.l	-8(a2,d0.w),d2
	Rbeq	L_BkNoRes
	move.l	-8+4(a2,d0.w),d7
	move.l	d2,a2
	move.l	(a2),d0
	cmp.l	#"Spri",d0
	beq.s	SvSp
	cmp.l	#"Icon",d0
	beq.s	SvIc
******* Sauve une banque normale!
	moveq	#1,d0			* AmBk
	Rbsr	L_SHunk
	move.l	Buffer(a5),a0
	move.w	d3,(a0)			* Puis NUMERO.W
	clr.w	2(a0)			* 0-> CHIP / 1-> FAST
	bclr	#30,d7
	bne.s	SvBk0
	addq.w	#1,2(a0)
SvBk0:	move.l	d7,4(a0)		* Puis LONGUEUR.L
	move.l	a0,d2
	moveq	#8,d3
	Rbsr	L_FWrite
	move.l	a2,d2			* Puis banque en entier
	move.l	d7,d3
	and.l	#$0FFFFFFF,d3
	Rbra	L_FWrite
******* Sauve la banque d'icones
SvIc	moveq	#4,d0			* AmIc
	bra.s	SvIc1
******* Sauve la banque de sprites!
SvSp:	moveq	#2,d0			* AmSp
SvIc1	Rbsr	L_SHunk
	Rbsr	L_UnRevSp		* Remet les sprites droit...
	lea	8(a2),a2		* Nombre de sprites!
	move.l	a2,d2	
	moveq	#2,d3
	Rbsr	L_FWrite
	move.w	(a2)+,d6
	subq.w	#1,d6
	move.l	Buffer(a5),a0
	move.l	a0,d5
	clr.l	(a0)+
	clr.l	(a0)+
	clr.w	(a0)
SvSp1:	move.l	(a2),d0
	bne.s	SvSp2
* Sprite VIDE!
	move.l	d5,d2
	moveq	#10,d3
	Rbsr	L_FWrite
	bra.s	SvSp3
* Sauve un sprite!
SvSp2:	move.l	d0,a0
	move.l	d0,d2
	move.w	(a0)+,d3
	mulu	(a0)+,d3
	mulu	(a0)+,d3
	lsl.w	#1,d3
	add.l	#10,d3
	Rbsr	L_FWrite
* Suivant!
SvSp3:	addq.l	#8,a2
	dbra	d6,SvSp1
* Sauve la palette
	move.l	a2,d2
	moveq	#32*2,d3
	Rbsr	L_FWrite
* Ca y est!
	rts

******* Remet droit les sprites de la banque
L_UnRevSp	equ	711
L711	movem.l	d0-d7/a0-a6,-(sp)
	lea	8(a2),a2
	move.w	(a2)+,d2
	subq.w	#1,d2
	bmi.s	URbx
* Va retourner
URb1	move.l	a2,a1
	moveq	#0,d1
	EcCall	DoRev
* Remet le point chaud, si negatif!!!
	move.l	(a2),d0		
	beq.s	URb2
	move.l	d0,a0
	move.w	6(a0),d0
	lsl.w	#2,d0
	asr.w	#2,d0
	move.w	d0,6(a0)
URb2	lea	8(a2),a2
	dbra	d2,URb1
URbx	movem.l	(sp)+,d0-d7/a0-a6
	rts

***********************************************************
*	DISC INFO!
L_DInfo		equ	712
L712	moveq	#126,d3
	Rbsr	L_Demande
	move.l	a0,-(sp)
	Rbsr	L_NomDisk
	Rbsr	L_LockGet
	move.l	LockSave(a5),d1
	move.l	Buffer(a5),d2
	DosCall	DosInfo
	Rbeq	L_DiskError
	Rbsr	L_LockFree
	move.l	(sp),a0
	addq.w	#2,a0
	move.l	Buffer(a5),a2
	move.l	12(a2),d3
	sub.l	16(a2),d3
	move.l	20(a2),d6
	RBsr	L_Mul32
	move.l	d1,d3
	moveq	#0,d6
	move.l	28(a2),d0
	beq.s	.skip
	lsl.l	#2,d0
	move.l	d0,a2
	move.l	$28(a2),d0
	beq.s	.skip
	lsl.l	#2,d0
	move.l	d0,a2
	addq.l	#1,a2
.loop	addq.w	#1,d6
	move.b	(a2)+,(a0)+
	bne.s	.loop
	move.b	#":",-1(a0)
.skip	move.l	a0,a1
	moveq	#9,d0
.loop1	move.b	#32,(a1)+
	dbra	d0,.loop1
	add.w	#10,d6
	move.l	d3,d0
	RBsr	L_LongDec
	move.l	(sp)+,a0
	move.w	d6,(a0)
	move.l	a0,-(a3)
	addq.w	#1,d6
	and.w	#$FFFE,d6
	lea	2(a0,d6.w),a0
	move.l	a0,HiChaine(a5)
	rts

***********************************************************
*	LOAD a$,banque-> charger UNE banque memoire!
*******
L_Load1		equ	713
L713	move.l	#EntNul,-(a3)
	Rbra	L_Load2
L_Load2		equ	714
L714	move.l	(a3)+,d3
	Rbsr	L_NomDisk
	move.l	#1005,d2
	Rbsr	L_FOpen
	Rbeq	L_DiskError
* Va charger!
	Rbsr	L_LoadBk
	Rbsr	L_FClose
	Rbsr	L_SendBanks
	rts

*******	LOAD BANQUE (s), en D3 si possible
L_LoadBk	equ	715
L715	move.l	d3,d5
	Rbsr	L_LHunk
	cmp.w	#4,d0
	beq	LdIc
	cmp.w	#3,d0
	Rbeq	L_LdBs
	cmp.w	#2,d0
	beq	LdSp
	cmp.w	#1,d0
	Rbne	L_DiForm
******* Banque normale
	move.l	Buffer(a5),d2
	move.l	d2,a2
	moveq	#8,d3
	Rbsr	L_ERead
	move.l	d5,d3
	cmp.l	#EntNul,d3
	bne.s	LdBk1
	move.w	(a2),d3
	ext.l	d3
LdBk1:	subq.w	#1,d3
	Rbmi	L_FonCall
	RBsr	L_EffBank
	lsl.w	#3,d3
	move.l	ABanks(a5),a1
	lea	0(a1,d3.w),a1
	move.l	4(a2),d0
	move.l	d0,d1
	and.l	#$0FFFFFFF,d0
	move.l	d0,d3
	tst.w	2(a2)
	bne.s	LdBk2
	bset	#30,d1
	Rbsr	L_RamChip
	bra.s	LdBk3
LdBk2:	bclr	#30,d1
	Rbsr	L_RamFast
LdBk3:	Rbeq	L_OOfMem
	move.l	d0,(a1)
	move.l	d1,4(a1)
	move.l	d0,d2
	Rbsr	L_ERead
	rts
******* Banque d'icones
LdIc	moveq	#2,d3			* Nombre de sprites
	move.l	Buffer(a5),d2
	move.l	d2,a2
	Rbsr	L_ERead
	move.w	(a2),d7
* Append?
	moveq	#1,d0
	move.w	d7,d1
	move.w	d5,d2
	clr.w	d5
	tst.w	d2
	beq.s	LdIc1
	move.l	ABanks(a5),a0
	tst.l	8(a0)
	beq.s	LdIc1
	move.w	8+6(a0),d5
	subq.w	#8,d5
	beq.s	LdIc1
	add.w	d5,d1
	moveq	#0,d0
LdIc1:	Rbsr	L_ResIco
	Rbne	L_OOfMem
	bra.s	LdIc2
******* Banque de sprites
LdSp:	moveq	#2,d3			* Nombre de sprites
	move.l	Buffer(a5),d2
	move.l	d2,a2
	Rbsr	L_ERead
	move.w	(a2),d7
* Append?
	moveq	#1,d0
	move.w	d7,d1
	move.w	d5,d2
	clr.w	d5
	tst.w	d2
	beq.s	LdSp1
	move.l	ABanks(a5),a0
	tst.l	(a0)
	beq.s	LdSp1
	move.w	6(a0),d5
	subq.w	#8,d5
	bmi.s	LdSp1
	add.w	d5,d1
	moveq	#0,d0
LdSp1:	Rbsr	L_ResSpr
	Rbne	L_OOfMem
* Fin du chargement SPRITES/ICONES
LdIc2:	addq.l	#2,a1
	tst.w	d5			* Pointe le debut des nouveaux!
	beq.s	LdSp2
	lsl.w	#3,d5
	add.w	d5,a1
LdSp2:	move.l	Buffer(a5),a2
* Charge tous les sprites
	tst.w	d7			* Pas de sprite?
	beq.s	LdSp5
	clr.w	d6
LdSp3:	clr.l	(a1)+
	clr.l	(a1)+
	move.l	a2,d2
	moveq	#10,d3
	Rbsr	L_ERead
	move.w	(a2),d0
	beq.s	LdSp4
	mulu	2(a2),d0
	mulu	4(a2),d0
	lsl.l	#1,d0
	move.l	d0,d3
	add.l	#10,d0
	Rbsr	L_RamChip
	Rbeq	L_OOfMem
	move.l	d0,-8(a1)		* Poke le pointeur
	clr.l	-4(a1)
	move.l	d0,a0			* Poke les entetes
	move.l	(a2),(a0)+		* TX/TY
	move.w	4(a2),(a0)+
	move.w	6(a2),(a0)		* Plus de FLAGS!
	and.w	#$3FFF,(a0)+
	move.w	8(a2),(a0)+
	move.l	a0,d2			* Charge l'image
	Rbsr	L_ERead
LdSp4:	addq.w	#1,d6
	cmp.w	d7,d6
	bcs.s	LdSp3
* Charge la palette
LdSp5:	move.l	a1,d2
	moveq	#32*2,d3
	Rbsr	L_ERead
	rts

******* Charge plusieurs banques
L_LdBs		equ	716
L716	Rbsr	L_EffAllBanks
	move.l	Buffer(a5),d2
	move.l	d2,a2
	moveq	#2,d3
	Rbsr	L_ERead
	move.w	(a2),d0
	beq.s	LdBs2
* Charge!
	move.w	d0,-(sp)
LdBs1:	move.l	#EntNul,d3
	Rbsr	L_LoadBk
	subq.w	#1,(sp)
	bne.s	LdBs1
	addq.l	#2,sp
LdBs2:	rts

***********************************************************
*	PLOAD PRG nom,bank
L_PLoad		equ	717
L717	clr.w	d4
	move.l	(a3)+,d3
	bpl.s	Plo3
	neg.l	d3
	addq.w	#1,d4
Plo3	subq.l	#1,d3
	cmp.l	#$10,d3
	Rbcc	L_FonCall
	Rbsr	L_EffBank
	lsl.w	#3,d3
	move.l	ABanks(a5),a2
	pea	0(a2,d3.w)
	move.w	d4,-(sp)
* Nom disque
	Rbsr	L_NomDisk
	move.l	#1005,d2
	Rbsr	L_FOpen
* Saute les premiers HUNKS!
	bsr	GetH
	cmp.l	#$3F3,d0
	Rbne	L_DiForm
Plo0	bsr	GetH
	cmp.l	#$3E9,d0
	bne.s	Plo0
	bsr	GetH
	lsl.l	#2,d0
	move.l	d0,d3
	addq.l	#8,d0
	move.l	d0,d1
* Reserve la banque
	tst.w	(sp)+
	bne.s	Plo1
	Rbsr	L_RamFast
	bra.s	Plo2
Plo1	bset	#30,d1
	Rbsr	L_RamChip
Plo2	Rbeq	L_OOfMem
	move.l	(sp)+,a2
	move.l	d0,(a2)+
	bset	#31,d1
	move.l	d1,(a2)+
	move.l	d0,a1
	lea	BkAsm(pc),a0
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
* Charge!
	move.l	a1,d2
	Rbsr	L_FRead
	Rbsr	L_FClose
	rts
******* ROUTINE
GetH	move.l	Buffer(a5),d2
	moveq	#4,d3
	Rbsr	L_FRead
	move.l	Buffer(a5),a0
	move.l	(a0),d0
	rts
BkAsm	dc.b	"Program "
***********************************************************
*	BLOAD a$,adresse
L_BLoad		equ	718
L718	RBsr	L_AdOuBank
	move.l	d3,-(sp)
* Ouvre le fichier
	Rbsr	L_NomDisk
	move.l	#1005,d2
	Rbsr	L_FOpen
	Rbeq	L_DiskError
* Trouve la taille du fichier!
	moveq	#0,d2
	moveq	#1,d3
	Rbsr	L_FSeek
	moveq	#0,d2
	moveq	#-1,d3
	Rbsr	L_FSeek
* Charge!
	move.l	d0,d3
	move.l	(sp)+,d2
	Rbsr	L_ERead
* Ferme!
	Rbra	L_FClose

***********************************************************
*	BSAVE a$,adresse to fin
L_BSave		equ	719
L719	move.l	(a3)+,-(sp)
	Rbsr	L_AdOuBank
	sub.l	d3,(sp)
	Rbls	L_FonCall
	move.l	d3,-(sp)
* Ouvre le fichier / Mode NEW
	Rbsr	L_NomDisk
	move.l	#1006,d2
	Rbsr	L_FOpen
	Rbeq	L_DiskError
* Sauve!
	move.l	(sp)+,d2
	move.l	(sp)+,d3
	Rbsr	L_FWrite
* Ferme!
	RBra	L_FClose

***********************************************************
*	IFF MASK a%
L_IffMsk	equ	720
L720	move.l	(a3)+,IffMask(a5)
	rts

******* Fonction PICTURE
L_FPic		equ	721
L721	move.l	#%11111,-(a3)
	rts

***********************************************************
*	LOAD IFF "nom"
L_LdIff1	equ	722	
L722	move.l	#EntNul,-(a3)
	RBra	L_LdIff2
***********************************************************
*	LOAD IFF "nom",param
L_LdIff2	equ	723
L723	Rbsr	L_IffInit
	move.l	(a3)+,IffParam(a5)
* Ouvre le fichier
	Rbsr	L_NomDisk
	move.l	#1005,d2
	Rbsr	L_FOpen
	Rbeq	L_DiskError
* Lis les chunks
LdIfa:	Rbsr	L_IffLoad
	bne.s	LdIfa
* Ferme le fichier
	Rbsr	L_FClose
* Ca y est!
	rts

******* Initialisation des flags IFF
L_IffInit	equ	724
L724	clr.l	IffFlag(a5)
	rts

*********************************************************************
* 	Charge un CHUNK ou une FORM
L_IffLoad	equ	725
L725	move.l	Buffer(a5),d2
	moveq	#8,d3
	Rbsr	L_FRead
	beq.s	IffEnd
	Rbmi	L_DiskError
	move.l	d2,a0
	move.l	DForm(pc),d0
	cmp.l	(a0),d0
	bne	IffChunk
* Explore les headers!
	addq.l	#8,d2			* Charge le type de fichier
	moveq	#4,d3
	Rbsr	L_FRead
	Rbeq	L_DiskError
	Rbmi	L_DiskError
	move.l	d2,a0
	lea	Form(pc),a1
	bsr	GetIff
	bmi	SoChunk			* Inconnu: saute le tout!
* Iff encore
IffOk:	moveq	#-1,d1
	rts
* Iff fini!
IffEnd:	moveq	#0,d1
	rts

******* CHARGE UN CHUNK
IffChunk:
	move.l	d2,a0
	lea	Chunks(pc),a1
	bsr	GetIff
	bmi.s	SoChunk
	move.l	IffMask(a5),d1		* Peut charger le chunk?
	btst	d0,d1
	beq.s	SoChunk
	move.w	d0,-(sp)		* Met les flags
	move.l	IffFlag(a5),d1
	bset	d0,d1
	move.l	d1,IffFlag(a5)
	move.l	4(a0),d3
	lsl.w	#2,d0
	lea	IffJumps(pc),a0
	jsr	0(a0,d0.w)
	move.w	(sp)+,d0
	bra	IffOk
* Saute le FORM/CHUNK inconnu
SoChunk:move.l	Buffer(a5),a0
	move.l	4(a0),d2
	bsr	D2Pair
	moveq	#0,d3
	movem.l	d1-d7/a0-a6,-(sp)
	move.l	Handle(a5),d1
	move.l	DosBase(a5),a6
	jsr	DosSeek(a6)
	movem.l	(sp)+,d1-d7/a0-a6
	tst.l	d0
	bmi	IffEnd
	moveq	#-1,d0
	bra	IffOk

******* BMHD!
IffBMHD:move.l	BufBMHD(a5),d2
FinBM:	Rbsr	L_ERead
* Rend pair
	and.l	#$01,d3
	beq.s	FinBM1
	moveq	#1,d2
	moveq	#0,d3
	Rbsr	L_FSeek
FinBM1:	rts
******* CMAP!
IffCMAP:move.l	BufCMAP(a5),a0
	move.w	d3,d0
	divu	#3,d0
	move.w	d0,(a0)+
	move.l	a0,d2
	bra.s	FinBM
******* CAMG
IffCAMG:move.l	BufCAMG(a5),d2
	bra.s	FinBM	
******* CCRT
IffCCRT:move.l	BufCCRT(a5),d2
	bra.s	FinBM	
******* AMSC
IffAMSC:move.l	BufAMSC(a5),d2
	bra.s	FinBM

******* BODY
IffBODY	
* Stocke fin du CHUNK body!
	bsr	D3Pair
	move.l	d3,-(sp)
	moveq	#0,d2
	moveq	#0,d3
	Rbsr	L_FSeek
	add.l	(sp),d0
	move.l	d0,-(sp)
	cmp.l	#EntNul,IffParam(a5)
	beq.s	IffB1
* Fabrique l'ecran!
	bsr	IffScreen
	Rbeq	L_IffFor
	move.l	IffParam(a5),d1
	cmp.l	#8,d1
	Rbcc	L_IllScN
	lea	DefPal(a5),a1
	EcCall	Cree
	Rbne	L_EcWiErr
	move.l	a0,ScOnAd(a5)
	move.w	EcNumber(a0),ScOn(a5)
	addq.w	#1,ScOn(a5)
	bsr	IffCentre
* Termine!
IffB1:	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	bsr	IffPal
	bsr	IffShift
* Charge les plans de bits
IffB2:	moveq	#0,d1			* Trouve l'adresse ecran
	move.w	ScOn(a5),d1
	subq.w	#1,d1
	Rbmi	L_ScNOp
	EcCall	Active
	move.l	a0,a2
	move.l	IffFlag(a5),d7		* BMHD charge?
	btst	#0,d7
	Rbeq	L_FonCall
	move.l	BufBMHD(a5),a1
* Regarde si l'image n'est pas + grande que l'ecran!
	move.w	(a1),d5			* Largeur du dessin
	ext.l	d5
	cmp.w	EcTx(a2),d5
	Rbhi	L_CantFit
	lsr.w	#3,d5
	move.w	2(a1),d6		* Hauteur du dessin
	cmp.w	EcTy(a2),d6
	bls	IffB3
	move.w	EcTy(a2),d6
IffB3:	move.b	8(a1),d7		* Nombre de plans
	ext.w	d7
	cmp.w	EcNPlan(a2),d7
	Rbhi	L_CantFit
	subq.w	#1,d7
* Enleve le curseur
	movem.l	a0-a6/d0-d7,-(sp)
	ALea	ChCuOff,a1
	WiCall	Print
	movem.l	(sp)+,a0-a6/d0-d7
* Format compresse?
	tst.b	10(a1)
	bne.s	BodyC
* Pas de compression
	move.l	d5,d3
	move.w	d7,d5
	subq.w	#1,d6
	moveq	#0,d4
Bd2:	lea	EcLogic(a2),a0
	move.w	d5,d7
Bd3:	move.l	(a0)+,d2
	add.l	d4,d2
	Rbsr	L_ERead
	dbra	d7,Bd3
	move.w	EcTLigne(a2),d0
	ext.l	d0
	add.l	d0,d4
	dbra	d6,Bd2
	bra	FinBODY
* Compression! BYTE RUN 1
BodyC:	cmp.b	#1,10(a1)
	Rbne	L_IffCmp
* Regarde si peut travailler dans un buffer
	movem.l	a3-a6,-(sp)
	move.l	16+4(sp),d0
	Rbsr	L_RamFast
	tst.l	d0
	beq	Br0	
	move.l	d0,a3
	move.l	d0,a1
	move.l	d0,d2
	move.l	16+4(sp),d3
	Rbsr	L_FRead
	beq.s	BBErr
	bmi.s	BBErr
	cmp.l	d0,d3
	bne.s	BBErr
******* Travaille avec un buffer
	move.w	d7,d3
	move.w	d6,d2
	subq.w	#1,d2
	moveq	#0,d6
Bb2:	lea	EcLogic(a2),a6
	move.w	d3,d7
Bb3:	move.l	(a6)+,a4
	add.l	d6,a4
	moveq	#0,d4
Bb4:	moveq	#0,d0
	move.b	(a3)+,d0
	bmi.s	Bb5
* Lire N octets decodes
	add.w	d0,d4
	addq.w	#1,d4
Bb4a:	move.b	(a3)+,(a4)+
	dbra	d0,Bb4a
	bra.s	Bb7
* Repeter N fois...
Bb5:	cmp.b	#128,d0
	beq.s	Bb7
	move.b	(a3)+,d1
	neg.b	d0
	add.w	d0,d4
	addq.w	#1,d4
Bb6:	move.b	d1,(a4)+
	dbra	d0,Bb6
* Encore pour la ligne?
Bb7:	cmp.w	d5,d4
	bcs.s	Bb4
* Encore un plan?
	dbra	d7,Bb3
* Encore une ligne?
	move.w	EcTLigne(a2),d0
	ext.l	d0
	add.l	d0,d6
	dbra	d2,Bb2
* Libere le buffer
	movem.l	(sp)+,a3-a6
	move.l	4(sp),d0
	Rbsr	L_RamFree
	bra	FinBody
* ERREUR DISQUE! Libere le buffer
BBerr:	movem.l	(sp)+,a3-a6
	move.l	4(sp),d0
	Rbsr	L_RamFree
	Rbra	L_DiskError
******* Travaille directement dans l'ecran
Br0:	move.w	d7,-(sp)
	move.w	d6,d1
	subq.w	#1,d1
	move.l	Buffer(a5),a3
	moveq	#0,d6
Br2:	lea	EcLogic(a2),a6
	move.w	(sp),d7
Br3:	move.l	(a6)+,a4
	add.l	d6,a4
	moveq	#0,d4
Br4:	move.l	a3,d2
	moveq	#1,d3
	Rbsr	L_ERead
	move.b	(a3),d3
	bmi.s	Br5
* Lire N octets decodes
	addq.l	#1,d3
	move.l	a4,d2
	add.w	d3,d4
	add.w	d3,a4
	Rbsr	L_ERead
	bra.s	Br7
* Repeter N fois...
Br5:	cmp.b	#128,d3
	beq.s	Br7
	move.w	d3,-(sp)
	moveq	#1,d3
	move.l	a3,d2
	Rbsr	L_ERead
	move.b	(a3),d2
	move.w	(sp)+,d0
	neg.b	d0
	add.w	d0,d4
	addq.w	#1,d4
Br6:	move.b	d2,(a4)+
	dbra	d0,Br6
* Encore pour la ligne?
Br7:	cmp.w	d5,d4
	bcs.s	Br4
* Encore un plan?
	dbra	d7,Br3
* Encore une ligne?
	move.w	EcTLigne(a2),d0
	ext.l	d0
	add.l	d0,d6
	dbra	d1,Br2
	addq.l	#2,sp
	movem.l	(sp)+,a3-a6
* Fin du BODY: saute le CHUNK
FinBody move.l	(sp)+,d2
	addq.l	#4,sp
	moveq	#-1,d3
	Rbsr	L_FSeek
	rts

******* Fabrique l'ecran avec les donnees
IffScreen:
* Peut-on fabriquer un ecran?
	move.l	IffFlag(a5),d7
	btst	#0,d7		* Une BMHD?
	beq	IffEnd
* Parametre?
	moveq	#0,d5
	move.l	BufBMHD(a5),a0
	move.w	0(a0),d2	* Largeur, MOT superieur!
	add.w	#15,d2
	and.w	#$FFF0,d2
	ext.l	d2
	move.w	2(a0),d3	* Hauteur
	ext.l	d3
	move.b	8(a0),d4	
	ext.w	d4		* Nb plans
	ext.l	d4
	moveq	#2,d6		* Calcule le nb de couleurs
	move.w	d4,d0
IfS0:	subq.w	#1,d0
	beq.s	IfS0a
	lsl.w	#1,d6
	bra.s	IfS0
* Trouve les modes graphiques
IfS0a:	moveq	#0,d5	

*	moveq	#0,d0		* Analyse du ratio HAUTEUR/LARGEUR
*	move.b	14(a0),d0
*	beq.s	IfS0b
*	lsl.w	#8,d0
*	moveq	#0,d1
*	move.b	15(a0),d1
*	beq.s	IfS0b
*	divu	d1,d0
*	cmp.w	#174,d0
*	bcc.s	IfS0b
*	bset	#2,d5
*IfS0b	cmp.w	#348,d0
*	bcc.s	IfS0c

	cmp.w	#640,16(a0)
	bcs.s	IfS0d
IfS0c	cmp.w	#4,d4
	bhi.s	IfS0d
	bset	#15,d5
IfS0d	cmp.w	#400,18(a0)
	bcs.s	IfS0e
	bset	#2,d5
IfS0e	
* CAMG chunk
	btst	#1,d7
	beq.s	IfS5
	moveq	#0,d5
	move.l	BufCAMG(a5),a0	* Modes graphiques
	move.l	(a0),d0
IfS1:	btst	#11,d0			* HAM?
	beq.s	IfS2
	moveq	#6,d4
	move.w	#$0800,d5
	moveq	#64,d6
IfS2:	and.w	#%1000000000000100,d0	* HIRES? INTERLACED?
	or.w	d0,d5
IfS5:	bra	IffOk

******* Centre l'ecran IFF dans l'ecran
IffCentre:
* Prend les parametres de l'IMAGE
	moveq	#0,d1			* Trouve l'adresse ecran
	move.w	ScOn(a5),d1
	subq.w	#1,d1
	Rbmi	L_ScNOp
	EcCall	Active
* Un chunk AMSC?
	btst	#5,d7
	beq	IffEnd
	move.l	a0,a1
	move.l	BufAMSC(a5),a0
	move.w	(a0)+,EcAWX(a1)
	move.w	(a0)+,EcAWY(a1)
	move.w	(a0)+,EcAWTX(a1)
	move.w	(a0)+,EcAWTY(a1)
	move.w	(a0)+,EcAVX(a1)
	move.w	(a0)+,EcAVY(a1)
	move.w	(a0)+,EcFlags(a1)
	moveq	#6,d0
	move.b	d0,EcAW(a1)
	move.b	d0,EcAWT(a1)
	move.b	d0,EcAV(a1)
	bset	#BitEcrans,T_Actualise(a5)
	rts

******* Fait shifter les couleurs
IffShift:
	move.l	IffFlag(a5),d7
	btst	#3,d7
	beq.s	IffShX
	move.l	BufCCRT(a5),a0
	move.w	(a0),d5
	beq.s	IffShX
	bpl.s	IffSh0
	moveq	#0,d5
IffSh0	move.b	2(a0),d3
	bmi.s	IffShX
	ext.w	d3
	move.b	3(a0),d4
	bmi.s	IffShX
	ext.w	d4
	cmp.w	d4,d3
	bcc.s	IffShX
	move.l	8(a0),d2		* 1/1000 ---> 1/50
	divu	#20,d2
	tst.w	d2
	beq.s	IffShX
	moveq	#1,d1
	moveq	#1,d6			* Boucle!
	EcCall	Shift
	Rbne	L_EcWiErr
IffShX:	rts

******* Recupere la palette IFF
IffPal:	lea	DefPal(a5),a2
	move.l	Buffer(a5),a0
	move.l	a0,a1
	moveq	#31,d0
IfSa:	move.w	(a2)+,(a0)+
	dbra	d0,IfSa
	move.l	IffFlag(a5),d7
	btst	#2,d7
	beq	IfSc
	move.l	a1,a0
	move.l	BufCMAP(a5),a2
	move.w	(a2)+,d0
	subq.w	#1,d0
IfSb:	move.b	(a2)+,d1
	and.w	#$00F0,d1
	move.b	(a2)+,d2
	lsr.b	#4,d2
	or.b	d2,d1
	lsl.w	#4,d1
	move.b	(a2)+,d2
	lsr.b	#4,d2
	or.b	d2,d1
	move.w	d1,(a0)+
	dbra	d0,IfSb
IfSc:	EcCall	SPal
	rts

******* EXPLORE LES NOMS IFF (a0)<->(a1)
GetIff:	moveq	#-1,d0
	move.l	(a0),d1
Giff1:	tst.b	(a1)
	bmi.s	Giff2
	addq.l	#1,d0
	cmp.l	(a1)+,d1
	bne.s	Giff1
	tst.l	d0
Giff2:	rts

******* D1 pair
D1Pair:	btst	#0,d1
	beq.s	D1p
	addq.l	#1,d1
D1p:	rts
******* D2 pair
D2Pair:	btst	#0,d2
	beq.s	D2p
	addq.l	#1,d2
D2p:	rts
******* D3 pair
D3Pair:	btst	#0,d3
	beq.s	D3p
	addq.l	#1,d3
D3p:	rts

******* DEBUT IFF
DForm:	dc.b "FORM"
******* FORMES iff
Form:	dc.b "ILBM"
	dc.b -1
	even
******* CHUNKS iff
Chunks:	dc.b "BMHD","CAMG","CMAP","CCRT","BODY"
	dc.b "AMSC"
	dc.b -1
	even
******* Table des sauts
IffJumps:
	bra	IffBMHD
	bra	IffCAMG
	bra	IffCMAP
	bra	IffCCRT
	bra	IffBODY
	bra	IffAMSC

L726
*********************************************************************
L_CantFit	equ	727
L727	moveq	#32,d0
	Rbra	L_Error
L_IffFor	equ	728
L728	moveq	#30,d0
	Rbra	L_Error
L_IffCmp	equ	729
L729	moveq	#31,d0
	Rbra	L_Error
*********************************************************************
*	SCREEN SAVE a$,compress
L_ScSave2	equ	730
L730	move.l	(a3)+,d7
	cmp.l	#2,d7
	Rbcc	L_FonCall
	Rbra	L_ScSave
*******	SCREEN SAVE a$
L_ScSave1 	equ	731
L731	moveq	#1,d7
	Rbra	L_ScSave
L_ScSave	equ	732
L732	move.l	ScOnAd(a5),d0
	Rbeq	L_ScNOp
	move.l	d7,-(sp)
	move.l	d0,-(sp)
* Ouvre le fichier / Mode NEW
	Rbsr	L_NomDisk
	move.l	#1006,d2
	Rbsr	L_FOpen
	Rbeq	L_DiskError
* Sauve!
	move.l	(sp)+,a2
	move.l	(sp)+,d7
	move.l	Buffer(a5),a1
	move.l	#"FORM",(a1)+		* FORM
	clr.l	(a1)+			* Espace
	move.l	#"ILBM",(a1)+		* ILBM
	bsr	SaveA1
	bsr	SaveBMHD
	bsr	SaveCAMG
	bsr	SaveAMSC
	bsr	SaveCMAP
	bsr	SaveBODY
	moveq	#-1,d3
	moveq	#4,d2
	Rbsr	L_FSeek
	subq.l	#8,d0
	move.l	Buffer(a5),a1
	move.l	d0,(a1)+
	bsr	SaveA1
* Ferme
	Rbra	L_FClose

******* Sauve le BMHD
SaveBMHD
	move.l	Buffer(a5),a1
	move.l	#"BMHD",(a1)+
	move.l	#20,(a1)+
	move.w	EcTx(a2),(a1)+
	move.w	EcTy(a2),(a1)+
	clr.w	(a1)+
	clr.w	(a1)+
	move.b	EcNPlan+1(a2),(a1)+
	clr.b	(a1)+
	move.b	d7,(a1)+
	clr.b	(a1)+
	clr.w	(a1)+
	moveq	#20,d0
	moveq	#22,d1
	move.w	EcWTX(a2),d2
	move.w	EcWTY(a2),d3
	move.w	EcCon0(a2),d4
	bpl.s	Sbmhd1
	lsr.w	#1,d0
	lsl.w	#1,d2
Sbmhd1	btst	#2,d4
	beq.s	Sbmhd2
	lsr.w	#1,d1
	lsl.w	#1,d3
Sbmhd2	move.b	d0,(a1)+
	move.b	d1,(a1)+
	move.w	d2,(a1)+
	move.w	d3,(a1)+
	bra	SaveA1
******* Sauve la CMAP
SaveCMAP
	move.l	Buffer(a5),a1
	move.l	#"CMAP",(a1)+
	move.l	#32*3,(a1)+
	moveq	#31,d0
	lea	EcPal(a2),a0
SCm1	move.w	(a0)+,d1
	lsl.w	#4,d1
	moveq	#2,d2
SCm2	rol.w	#4,d1
	move.w	d1,d3
	and.w	#$000F,d3
	lsl.w	#4,d3
	move.b	d3,(a1)+
	dbra	d2,SCm2
	dbra	d0,SCm1
	bra	SaveA1
******* Sauve de CAMG
SaveCAMG
	move.l	Buffer(a5),a1
	move.l	#"CAMG",(a1)+
	move.l	#4,(a1)+
	moveq	#0,d0
	move.w	EcCon0(a2),d0
	and.w	#%1000100000000110,d0
	cmp.w	#64,EcNbCol(a2)
	bne.s	SCa
	btst	#11,d0
	bne.s	SCa
	bset	#7,d0
SCa	move.l	d0,(a1)+
	bra	SaveA1
******* Sauve le AMSC
SaveAMSC
	move.l	Buffer(a5),a1
	move.l	#"AMSC",(a1)+
	move.l	#7*2,(a1)+
	move.w	EcAWX(a2),(a1)+
	move.w	EcAWY(a2),(a1)+
	move.w	EcAWTx(a2),(a1)+
	move.w	EcAWTy(a2),(a1)+	
	move.w	EcAVX(a2),(a1)+
	move.w	EcAVY(a2),(a1)+
	move.w	EcFlags(a2),d0
	and.w	#$8000,d0
	move.w	d0,(a1)+
	bra	SaveA1
******* Sauve le BODY
SaveBODY
	move.l	Buffer(a5),a1
	move.l	#"BODY",(a1)+
	tst.b	d7
	bne.s	SBc
* Non compacte
	move.l	EcTPlan(a2),d0		* Entete
	mulu	EcNPlan(a2),d0
	move.l	d0,(a1)+
	bsr	SaveA1
	move.w	EcTy(a2),d7		* Image
	moveq	#0,d3
	move.w	EcTLigne(a2),d3
	moveq	#0,d4
SBo1	move.w	EcNPlan(a2),d6
	lea	EcLogic(a2),a0
SBo2	move.l	(a0)+,d2
	add.l	d4,d2
	Rbsr	L_FWrite
	subq.w	#1,d6
	bne.s	SBo2
	add.l	d3,d4
	subq.w	#1,d7
	bne.s	SBo1
	rts
* Compacte!
SBc:	clr.l	(a1)+
	bsr	SaveA1
	moveq	#0,d2			* Position dans le fichier
	moveq	#0,d3
	Rbsr	L_FSeek
	move.l	d0,-(sp)
	moveq	#0,d7
	move.w	EcTy(a2),d6
	moveq	#0,d5
	move.w	EcTLigne(a2),d5
	moveq	#0,d4
	move.l	a3,-(sp)
	move.w	EcNPlan(a2),-(sp)
	pea	EcLogic(a2)
SBc1	move.l	(sp),a2
	move.w	4(sp),d3
	move.l	Buffer(a5),a1
SBc2	move.w	d5,d2
	move.l	(a2)+,a0
	add.l	d4,a0
SBc3	moveq	#0,d1			
	move.b	(a0)+,d0
	subq.w	#1,d2
	beq.s	SBc5a
SBc4	cmp.b	(a0),d0
	bne.s	SBc5
	addq.l	#1,d1
	addq.l	#1,a0
	cmp.w	#127,d1
	bcc.s	SBc5
	subq.w	#1,d2
	bne.s	SBc4
SBc5	tst.w	d1
	beq.s	SBc6
	neg.b	d1
	move.b	d1,(a1)+
	move.b	d0,(a1)+
	tst.w	d2
	bne.s	SBc3
	bra.s	SBc10
SBc5a	clr.b	(a1)+
	move.b	d0,(a1)+
	bra.s	SBc10
SBc6	move.l	a1,a3
	moveq	#0,d1
	clr.b	(a1)+
	move.b	d0,(a1)+
SBc7	move.b	(a0),d0
	cmp.b	1(a0),d0
	bne.s	SBc8
	cmp.b	2(a0),d0
	beq.s	SBc9
SBc8	move.b	(a0)+,(a1)+
	addq.w	#1,d1
	subq.w	#1,d2
	beq.s	SBc9
	cmp.w	#127,d1
	bcs.s	SBc7
SBc9	move.b	d1,(a3)
	tst.w	d2
	bne.s	SBc3
* Autre plan?
SBc10	subq.w	#1,d3
	bne.s	SBc2
* Sauve le buffer
	move.l	Buffer(a5),d2
	move.l	a1,d3
	sub.l	d2,d3
	add.l	d3,d7
	Rbsr	L_FWrite
* Encore une ligne?
	add.l	d5,d4
	subq.w	#1,d6
	bne	SBc1
* A y est!
	addq.l	#6,sp
	move.l	(sp)+,a3
* Rend le chunk pair
	btst	#0,d7
	beq.s	SBc11
	move.l	Buffer(a5),a1
	clr.b	(a1)
	move.l	a1,d2
	moveq	#1,d3
	Rbsr	L_FWrite
	addq.l	#1,d7
* Marque la longueur du chunk!
SBc11	move.l	(sp)+,d2		* Debut du chunk
	subq.l	#4,d2
	moveq	#-1,d3
	Rbsr	L_FSeek
	move.l	d0,-(sp)
	move.l	Buffer(a5),a1		* Sauve la longueur
	move.l	d7,(a1)
	move.l	a1,d2
	moveq	#4,d3
	Rbsr	L_FWrite
	move.l	(sp)+,d2		* Remet a la fin
	moveq	#-1,d3
	Rbsr	L_FSeek
	rts
******* Sauve jusqu'a A1
SaveA1	move.l	Buffer(a5),d2
	move.l	a1,d3
	sub.l	d2,d3
	Rbne	L_FWrite
	rts


***********************************************************
*	=DIR$=
* Instruction
L_IDir		equ	733
L733	
	Rbsr	L_NomDisk
	Rbsr	L_LockGet
	move.l	LockSave(a5),d1
	move.l	Buffer(a5),d2
	DosCall	DosExam	
	move.l	d2,a0
	tst.w	4(a0)
	Rbmi	L_DiskError
	move.l	LockSave(a5),d0
	Rbsr	L_AskDir2
	Rbsr	L_LockFree
	move.l	Buffer(a5),a0
	lea	384(a0),a0
	move.l	PathAct(a5),a1
.Loop	move.b	(a0)+,(a1)+
	bne.s	.Loop
	rts

* Fonction
L_FDir		equ	734
L734	moveq	#126,d3
	Rbsr	L_Demande
	move.l	PathAct(a5),a2
	tst.b	(a2)
	bne.s	.Skip
* Si pas de path courant, demande le path reel
	movem.l	a0/a1,-(sp)
	Rbsr	L_AskDir
	movem.l	(sp)+,a0/a1
	move.l	Buffer(a5),a2
	lea	384(a2),a2
* Copie
.Skip	clr.w	(a1)+
.FDi1	move.b	(a2)+,(a1)+
	bne.s	.FDi1
	move.l	a1,d0
	sub.l	a0,d0
	btst	#0,d0
	beq.s	.FDi2
	addq.l	#1,a1
.FDi2	move.l	a1,HiChaine(a5)
	subq.w	#3,d0
	move.w	d0,(a0)
	move.l	a0,-(a3)
	rts

***********************************************************
*	PARENT
L_Par		equ	735
L735	move.l	PathAct(a5),a0
	tst.b	(a0)
	bne.s	.Loop
	Rbsr	L_AskDir
	move.l	Buffer(a5),a0
	lea	384(a0),a0
	move.l	PathAct(a5),a1
.Lop	move.b	(a0)+,(a1)+
	bne.s	.Lop
	move.l	PathAct(a5),a0
.Loop	tst.b	(a0)+
	bne.s	.Loop
	subq.l	#1,a0
	cmp.b	#"/",-(a0)
	bne.s	.Out
.Loop1	move.b	-(a0),d0
	cmp.b	#"/",d0
	beq.s	.Skip1
	cmp.b	#":",d0
	bne.s	.Loop1
.Skip1	clr.b	1(a0)
.Out	rts

***********************************************************
*	KILL a$
L_Kill		equ	736
L736	Rbsr	L_NomDisk
	move.l 	Name1(a5),d1
	DosCall	DosDel
	tst.l	d0
	Rbeq	L_DiskError
	rts
***********************************************************
*	RENAME a$ TO a$
L_Ren		equ	737
L737	Rbsr	L_NomDisk
	move.l	Name1(a5),a0
	move.l	Name2(a5),a1
IRen1	move.b	(a0)+,(a1)+
	bne.s	IRen1
	Rbsr	L_NomDisk
	move.l	Name1(a5),d1
	move.l	Name2(a5),d2
	DosCall	DosRen
	tst.l	d0
	RBeq	L_DiskError
	rts
***********************************************************
*	MKDIR a$
L_MkDir		equ	738
L738	Rbsr	L_LockFree
	Rbsr	L_NomDisk
	move.l	Name1(a5),d1
	DosCall	DosMkDir
	tst.l	d0
	Rbeq	L_DiskError
	move.l	d0,LockSave(a5)
	Rbra	L_LockFree
***********************************************************
*	=DRIVE(n)
L_Drive		equ	739
L739	move.l	(a3)+,a2
	moveq	#0,d2
	move.w	(a2)+,d2
	cmp.w	#4,d2
	bne.s	FDr0
	cmp.b	#":",3(a2)
	bne.s	FDr0
	move.l	Buffer(a5),a0
	Rbsr	L_ChVerBuf2
	move.l	Buffer(a5),d1
	Rbsr	L_NoReq
	DosCall	DosDProc
	RBsr	L_YesReq
	tst.l	d0
	beq.s	FDr0
	moveq	#-1,d3
	move.l	d3,-(a3)
	rts
FDr0	clr.l	-(a3)
	rts
***********************************************************
*	=DFREE
L_DFree		equ	740
L740	move.l	PathAct(a5),a0
	move.l	Name1(a5),a1
.lp	move.b	(a0)+,(a1)+
	bne.s	.lp
	Rbsr	L_LockGet
	move.l	Buffer(a5),d2
	addq.l	#4,d2
	lsr.l	#2,d2
	lsl.l	#2,d2
	move.l	d2,-(sp)
	DosCall	DosInfo
	tst.l	d0
	Rbeq	L_DiskError
	move.l	(sp)+,a0
	move.l	12(a0),d3
	sub.l	16(a0),d3
	move.l	20(a0),d6
	RBsr	L_Mul32
	move.l	d1,-(a3)
	Rbra	L_LockFree

***********************************************************

******* Trouve le descripteur fichier
L_GetFile	equ	741
L741	move.l	(a3)+,d0
	cmp.l	#10,d0
	Rbcc	L_FonCall
	subq.l	#1,d0
	Rbmi	L_FonCall
	mulu	#TFiche,d0
	lea	Fichiers(a5),a2
	add.w	d0,a2
	move.l	Fha(a2),d1
	rts
******* Nettoie le descripteur
L_FiClean	equ	742
L742	movem.l	a0/d0,-(sp)
	move.l	a2,a0
	moveq	#TFiche-1,d0
Ficl	clr.b	(a0)+
	dbra	d0,Ficl
	movem.l	(sp)+,a0/d0
	rts
******* GetByte (a2)
L_GetByte	equ	743
L743	movem.l	a0/a1/d1-d4,-(sp)
	btst	#1,FhT(a2)
	Rbeq	L_FilTM
	btst	#2,FhT(a2)
	beq.s	GBy2
* PORT--> Attend un caractere en gerant les interruptions...
GBy1	move.l	Fha(a2),d1
	moveq	#50,d2
	DosCall	DosWChar
	tst.l	d0
	bne.s	GBy1a
	Rbsr	L_Tester
	bra.s	GBy1
GBy1a	move.l	FhA(a2),d1
	lea	DeFloat(a5),a0
	addq.l	#8,a0
	move.l	a0,d2
	move.l	a0,-(sp)
	moveq	#1,d3
	DosCall	DosRead
	tst.l	d0
	Rbeq	L_EOFil
	Rbmi	L_DiskError
	move.l	(sp)+,a0
	move.b	(a0),d0
	bra.s	EByE
* Va prendre le caractere
GBy2	move.l	FhA(a2),d1
	lea	DeFloat(a5),a0
	cmp.l	(a0),d1
	beq.s	GBy4
* Charge 64 caracteres
GBy3	move.l	a0,-(sp)
	move.l	d1,(a0)
	clr.w	4(a0)
	clr.w	6(a0)
	move.l	a0,d2
	addq.l	#8,d2
	moveq	#32-8,d3
	DosCall	DosRead	
	move.l	(sp)+,a0
	tst.l	d0
	Rbeq	L_EOFil
	Rbmi	L_DiskError
	move.w	d0,6(a0)
* Prend un caractere
GBy4	move.w	4(a0),d0
	cmp.w	6(a0),d0
	bcc.s	GBy3
	addq.w	#1,4(a0)
	move.b	8(a0,d0.w),d0
EByE	movem.l	(sp)+,a0/a1/d1-d4
	rts
******* Fin de GetByte (a2)
L_EndByte	equ	744
L744	movem.l	a0/a1/d1-d4,-(sp)
	lea	DeFloat(a5),a0
	move.l	(a0),d1
	beq.s	L644a
	clr.l	(a0)
	move.w	4(a0),d2
	sub.w	6(a0),d2
	beq.s	L644a
	ext.l	d2
	moveq	#0,d3
	DosCall	DosSeek
L644a	movem.l	(sp)+,a0/a1/d1-d4
	rts

******* =PORT(n)
L_FPort		equ	745
L745	Rbsr	L_GetFile
	Rbeq	L_FilNO
	btst	#2,FhT(a2)
	Rbeq	L_FilTM
	moveq	#50,d2
	DosCall	DosWChar
	tst.l	d0
	bne.s	FPor1
	moveq	#-1,d3
	move.l	d3,-(a3)
	rts
* Va prendre le caractere
FPor1	move.l	FhA(a2),d1
	lea	DeFloat(a5),a0
	move.l	a0,d2
	moveq	#1,d3
	DosCall	DosRead
	tst.l	d0
	Rbmi	L_DiskError
	moveq	#0,d3
	move.b	DeFloat(a5),d3
	move.l	d3,-(a3)
	rts
 
******* OPEN PORT canal,nom
L_OpPor		equ	746
L746	move.w	#%111,-(sp)
	move.l	#1005,-(sp)
	Rbra	L_OpIn
******* OPEN OUT canal,nom
L_OpOut2	equ	747
L747	move.w	#%001,-(sp)
	move.l	#1006,-(sp)
	Rbra	L_OpIn
*******	OPEN IN canal,nom
L_OpIn2		equ	748
L748	move.w	#%010,-(sp)
	move.l	#1005,-(sp)		* Mode OLD
	Rbra	L_OpIn
* Ouvre!
L_OpIn		equ	749
L749	Rbsr	L_NomDisk
	Rbsr	L_GetFile
	Rbne	L_FilOO
	Rbsr	L_FiClean
	move.l	Name1(a5),d1
	move.l	(sp)+,d2
	DosCall	DosOpen
	tst.l	d0
	Rbeq	L_DiskError
	move.l	d0,Fha(a2)		* Handle!
	move.w	(sp)+,d0
	move.b	d0,Fht(a2)		* Type
	rts

******* LOF(n)
L_Lof		equ	750
L750	Rbsr	L_RLof
	moveq	#0,d2			* Seek --> fin
	moveq	#1,d3
	DosCall	DosSeek
	move.l	FhA(a2),d1
	move.l	d0,d2			* Seek --> debut!
	moveq	#-1,d3
	DosCall	DosSeek
	move.l	d0,-(a3)
	rts
******* =POF(n)=
L_IPof		equ	751
L751	move.l	(a3)+,d2
	RBmi	L_FonCall
	Rbsr	L_RLof
	moveq	#-1,d3
	DosCall	DosSeek
	tst.l	d0
	Rbmi	L_DiskError
	rts
FPof		equ	752
L752	Rbsr	L_RLof
	moveq	#0,d2
	moveq	#0,d3
	DosCall	DosSeek
	move.l	d0,-(a3)
	rts
******* EOF
L_Eof		equ	753
L753	Rbsr	L_RLof
	moveq	#0,d2			* Seek --> fin
	moveq	#1,d3
	DosCall	DosSeek
	move.l	d0,d4
	move.l	FhA(a2),d1
	move.l	d0,d2			* Seek --> debut!
	moveq	#-1,d3
	DosCall	DosSeek
	moveq	#0,d3
	cmp.l	d0,d4
	bcs.s	L753a
	moveq	#-1,d3
L753a	move.l	d3,-(a3)
	rts

* Routine...
L_RLof		equ	754
L754	Rbsr	L_GetFile
	Rbeq	L_FilNO
	btst	#2,FhT(a2)
	Rbne	L_FilTM
	rts

******* CLOSE [n]
L_Clo1		equ	755
L755	Rbsr	L_GetFile
	Rbeq	L_FilNO
	moveq	#0,d6
	Rbra	L_Cloa1
L_CloAll	equ	756	
L756	lea	Fichiers(a5),a2
	moveq	#NFiche-1,d6
	RBra	L_Cloa1
L_Cloa1		equ	757
L757	move.l	Fha(a2),d1		* Fichier
	beq.s	Cloa2
	clr.l	Fha(a2)
	DosCall	DosClose
	move.l	FhF(a2),d0		* Field
	beq.s	Cloa2	
	move.l	d0,a1
	clr.l	FhF(a2)
	move.w	(a1),d0
	mulu	#6,d0
	addq.l	#8,d0
	Rbsr	L_RamFree
Cloa2	lea	TFiche(a2),a2
	dbra	d6,L757
	rts

*********************************************************************
* 	Erreurs
L_FilOO		equ	758
L758	moveq	#DEBase+17,d0
	Rbra	L_Error
L_FilNO		equ	759
L759	moveq	#DEBase+18,d0
	Rbra	L_Error
L_FilTM		equ	760
L760	moveq	#DEBase+19,d0
	Rbra	L_Error
L761
L_EOFil		equ	762
L762	moveq	#DEBase+21,d0
	Rbra	L_Error

******* OPEN RANDOM canal,nom
L_OpRan		equ	763
L763	move.w	#$80,d0
	Rbra	L_RanApp
******* APPEND canal,nom
L_Appn		equ	764
L764	move.w	#%001,d0
	Rbsr	L_RanApp
	moveq	#0,d2
	moveq	#1,d3
	DosCall	DosSeek
	rts
* Ouvre, en .OLD s'il faut!
L_RanApp	equ	765
L765	move.w	d0,-(sp)
	Rbsr	L_NomDisk
	Rbsr	L_GetFile
	Rbne	L_FilOO
	Rbsr	L_FiClean
	move.l	Name1(a5),d1		* Essaie en OLD
	move.l	#1005,d2
	DosCall	DosOpen
	tst.l	d0
	bne.s	IOpr1
	move.l	Name1(a5),d1		* NEW!
	move.l	#1006,d2
	DosCall	DosOpen
	tst.l	d0
	Rbeq	L_DiskError
IOpr1	move.l	d0,Fha(a2)		* Handle!
	move.l	d0,d1
	move.w	(sp)+,d0
	move.b	d0,Fht(a2)		* Type
	rts

******* FIELD N,AA as A$...
L_Field		equ	766
L766	move.w	d0,d3
	Rbsr	L_GetFile
	Rbeq	L_FilNO
* Reserve la memoire necessaire
	move.w	d3,d0
	mulu	#6,d0
	addq.l	#8,d0
	Rbsr	L_RamFast
	Rbeq	L_OOfMem
	move.l	d0,FhF(a2)
	move.l	d0,a1
	move.w	d3,d0
	lsl.w	#3,d0
	add.w	d0,a3
	move.l	a3,-(sp)
	lea	8(a1),a0
	move.w	d3,(a1)
	subq.w	#1,d3
	moveq	#0,d2
Fld2	move.l	-(a3),d0
	beq	FldFonc
	add.l	d0,d2
	cmp.l	#65500,d2
	bcc	FldFonc
	move.w	d0,(a0)+
	move.l	-(a3),(a0)+
	dbra	d3,Fld2
	move.w	d2,2(a1)
* Taille du fichier
	move.l	(sp)+,a3
	move.l	FhA(a2),d1
	moveq	#0,d2
	moveq	#1,d3
	DosCall	DosSeek
	move.l	FhA(a2),d1
	moveq	#0,d2
	moveq	#-1,d3
	DosCall	DosSeek
	move.l	d0,4(a1)
	rts
* FonCall field!
FldFonc	moveq	#0,d6
	Rbsr	L_Cloa1
	Rbra	L_FonCall

******* Routine GET et PUT
L_GetPut	equ	767
L767	move.l	(a3)+,d6
	cmp.l	#65500,d6
	Rbcc	L_FonCall
	subq.w	#1,d6
	Rbmi	L_FonCall
	Rbsr	L_GetFile
	Rbeq	L_FilNO
	tst.b	FhT(a2)
	Rbpl	L_FilTM
	move.l	FhF(a2),a2
	mulu	2(a2),d6
	move.l	4(a2),d5
	move.l	d6,d2
	cmp.l	d5,d6
	bls.s	GP1
	move.l	d5,d2
GP1	moveq	#-1,d3
	DosCall	DosSeek
	rts

******* GET #n,vv
L_Get		equ	768
L768	Rbsr	L_GetPut
	cmp.l	d5,d6
	Rbcc	L_EOFil
	move.l	d1,-(sp)
	move.w	(a2),d6
	subq.w	#1,d6
	lea	8(a2),a2
IGet1	moveq	#0,d3
	move.w	(a2)+,d3
	move.l	(a2),a1
	move.l	ChVide(a5),(a1)
	Rbsr	L_DDemande
	move.l	(a2)+,a1
	move.l	a0,(a1)
	move.w	d3,(a0)+
	move.l	a0,d2
	add.w	d3,a0
	btst	#0,d3
	beq.s	IGet2
	addq.l	#1,a0
IGet2	move.l	a0,HiChaine(a5)
	move.l	(sp),d1
	DosCall	DosRead
	cmp.l	d0,d3
	Rbne	L_DiskError
	dbra	d6,IGet1
	addq.l	#4,sp
	rts

******* PUT 
L_Put		equ	769
L769	Rbsr	L_GetPut
	cmp.l	d5,d6
	Rbhi	L_EOFil
	move.w	(a2),d6
	subq.w	#1,d6
	move.l	a2,-(sp)
	lea	8(a2),a2
IPut1:  moveq	#0,d3
	move.w	(a2)+,d3
	move.l	(a2)+,a0
        move.l 	(a0),a0
        moveq	#0,d4
        move.w 	(a0)+,d4
        cmp.w	d3,d4
        beq.s 	IPut2
        bcs.s 	IPut2
        move.w 	d3,d4
IPut2:  movem.l	a0/d1-d4,-(sp)
	move.l	a0,d2
	move.l	d4,d3
	DosCall	DosWrite
	cmp.l	d0,d3
	Rbne	L_DiskError
	movem.l	(sp)+,a0/d1-d4
        cmp.w	d3,d4
        bcc.s 	IPut4
        sub.l 	d4,d3
        Rbsr 	L_DDemande
        move.w 	d3,d0
	subq.w	#1,d0
IPut3:  move.b 	#32,(a1)+
	dbra	d0,IPut3
	move.l	a0,d2
	movem.l	d1-d3,-(sp)
	DosCall	DosWrite
	cmp.l	d0,d3
	Rbne	L_DiskError
	movem.l	(sp)+,d1-d3
IPut4	dbra	d6,IPut1
* Taille augmente?
	move.l	(sp)+,a2
	moveq	#0,d2
	moveq	#0,d3
	DosCall	DosSeek
	cmp.l	4(a2),d0
	bls.s	L769x
	move.l	d0,4(a2)
L769x	rts

***********************************************************
*	IMPRIMANTE
******* Ouverture de l'imprimante
L_OpPrt		equ	770
L770	move.l	PrtHandle(a5),d1
	bne.s	OpPrx
	movem.l	a0-a2/d2-d7,-(sp)
	Alea	NmPrt,a0
	move.l	a0,d1
	move.l	#1005,d2
	DosCall	DosOpen
	tst.l	d0
	Rbeq	L_DiskError
	move.l	d0,PrtHandle(a5)
	move.l	d0,d1
	movem.l	(sp)+,a0-a2/d2-d7
OpPrx:	rts
******* Imprime la chaine A0 (finie par zero) sur l'imprimante
L_ImpImp	equ	771
L771	Rbsr	L_OpPrt
	movem.l	a0-a2/d2-d7,-(sp)
	move.l	a0,d2
	move.l	a0,a1
* Compte et enleve les CARRIAGE RETURN 
Ip1:	move.b	(a0)+,d0
	move.b	d0,(a1)+
	beq.s	Ip2
	cmp.b	#13,d0
	bne.s	Ip1
	tst.w	PrtRet(a5)
	bne.s	Ip1
	cmp.b	#10,(a0)
	bne.s	Ip1
	move.b	(a0)+,-1(a1)
	bra.s	Ip1
* Envoie!
Ip2	sub.l	d2,a0
	subq.l	#1,a0
	move.l	a0,d3
	beq.s	Ip3
	DosCall	DosWrite
	tst.l	d0
	Rbmi	L_DiskError
Ip3:	movem.l	(sp)+,a0-a2/d2-d7
	rts

***********************************************************
*	SET DIR A,A$
L_SDir2		equ	772
L772	move.l	(a3)+,a2
	cmp.l	#EntNul,a2
	Rbeq	L_SDir1
	move.w	(a2)+,d2
	cmp.w	#106,d2
	Rbcc	L_SToLong
	move.l	DirFNeg(a5),a0
	Rbsr	L_ChVerBuf2
	Rbra	L_SDir1
L_SDir1		equ	773
L773	move.l	(a3)+,d3
	cmp.l	#EntNul,d3
	beq	L773x
	and.l	#$FFFFFFFE,d3
	Rbeq	L_FonCall
	cmp.l	#106,d3
	Rbcc	L_FonCall
	move.w	d3,DirLNom(a5)
L773x	rts

***********************************************************
*	=DEV FIRST$("filter")
L_DevF		equ	774
L774	Rbsr	L_NomDir
	move.w	#1,FillF32(a5)
	clr.w	DirComp(a5)
	move.w	DirLNom(a5),FillFSize(a5)
	Rbsr	L_FillDev
	Rbra	L_DirN
***********************************************************
*	=ACC FIRST$("filter")
L_AccF		equ	775
L775	Rbsr	L_NomDir
	move.w	#1,FillF32(a5)
	clr.w	DirComp(a5)
	move.w	DirLNom(a5),FillFSize(a5)
	Rbsr	L_FillAcc
	Rbra	L_DirN

***********************************************************
*	=DIR FIRST$("filter")
L_DirF		equ	776
L776	Rbsr	L_NomDir
	Rbsr	L_GetDir
	move.w	#1,FillF32(a5)
	clr.w	DirComp(a5)
	move.w	DirLNom(a5),FillFSize(a5)
	Rbsr	L_FillAll
	Rbsr	L_FillSort
	RBra	L_DirN

L_DirN		equ	777
L777	move.w	PosFillF(a5),d0
	Rbsr	L_FillGet
	beq.s	FDirV
	lea	6(a0),a2
	addq.w	#1,PosFillF(a5)
	move.w	FillFSize(a5),d3
	ext.l	d3
	move.w	d3,d2
	addq.l	#8,d3


	Rbsr	L_DDemande
	move.l	a0,-(a3)
	move.w	d3,(a1)+
	lea	2(a0,d3.w),a0
	move.l	a0,HiChaine(a5)
	lea	4(a2),a0
	subq.w	#1,d2
FDirN1	move.b	(a0)+,(a1)+
	dbra	d2,FDirN1
	moveq	#7,d1
FDirN2	move.b	#" ",(a1)+
	dbra	d1,FDirN2
	lea	-8(a1),a0
	cmp.b	#"*",4(a2)
	beq.s	FDirN3
	move.l	(a2),d0
	bmi.s	FDirN3
	Rbsr	L_LongDec
FDirN3	rts
* Enleve le buffer--> vide!
FDirV	Rbsr	L_FillFFree
	Rbra	L_ChVide

***********************************************************
*	=EXIST("name")
L_Exist		equ	778
L778	Rbsr	L_NomDisk
	move.l 	Name1(a5),d1
	Rbsr	L_NoReq
	DosCall	DosLock
	RBsr	L_YesReq
	move.l	d0,d1
	beq.s	FExF
	DosCall	DosUnLock
	moveq	#-1,d3
	move.l	d3,-(a3)
	rts
FExF	clr.l	-(a3)
	rts

* Plus de requester
L_NoReq		equ	779
L779	movem.l	a0-a1/a6/d0-d1,-(sp)
	move.l	$4.w,a6
	sub.l	a1,a1
	jsr	FindTask(a6)
	move.l	d0,a0
	move.l	$b8(a0),ReqSave(a5)
	move.l	#-1,$b8(a0)
	movem.l	(sp)+,a0-a1/a6/d0-d1
	rts
* Remet le requester
L_YesReq	equ	780
L780	movem.l	a0-a1/a6/d0-d1,-(sp)
	move.l	$4.w,a6
	sub.l	a1,a1
	jsr	FindTask(a6)
	move.l	d0,a0
	move.l	ReqSave(a5),$b8(a0)
	movem.l	(sp)+,a0-a1/a6/d0-d1
	rts
***********************************************************
L781
***********************************************************
*		FILL FILE ACCESSOIRES
L_FillAcc	equ	782

*************** Structure ACCESSOIRE
		RsReset
AccNext		rs.l 1
AccLong		rs.l 1
AccName		rs.b 128
AccTText	rs.l 1
AccXCu		rs.w 1
AccYCu		rs.w 1
AccXPos		rs.w 1
AccYPos		rs.w 1
AccChg		rs.w 1
AccIcon		rs.l 2
AccBanks	rs.l 2*16
AccMarks	rs.l 10
AccY1		rs.w 1
AccY2		rs.w 1
AccProg		equ __Rs

L782	Rbsr	L_FFDeb
* Cherche les fichiers
	movem.l	a3,-(sp)
	lea	Access(a5),a3
FALoop	move.l	(a3),d0
	beq	FAFin
	move.l	d0,a3
	move.l	d0,a0
	bsr	AccDNom
	move.l	Buffer(a5),a2
	lea	8(a2),a1
FaL4	move.b	(a0)+,(a1)+
	bne.s	FaL4
FaL5	move.l	AccLong(a3),d0		* Longueur
	sub.l	#AccProg,d0
	move.l	d0,124(a2)
* Filtre 
	move.l	Name2(a5),a0		* Filtre POSITIF
	tst.b	(a0)
	beq.s	FaL6
	lea	8(a2),a1
	Rbsr	L_Joker
	beq.s	FaLoop
* Poke dans le buffer
FaL6	moveq	#" ",d2
	Rbsr	L_FillFPoke
	bra	FALoop
* Fini de remplir, va trier.
FaFin:	Rbsr	L_FillSort
	movem.l	(sp)+,a3
	moveq	#-1,d0
	rts
******* Pointe le debut du nom
AccDNom	lea	AccName(a0),a0
DNom:	move.l	a0,a1
FaL1	tst.b	(a0)+
	bne.s	FaL1
	subq.l	#1,a0
FaL2	move.b	-(a0),d0
	cmp.b	#"/",d0
	beq.s	FaL3
	cmp.b	#":",d0
	beq.s	FaL3
	cmp.l	a1,a0
	bcc.s	FaL2
FaL3	addq.l	#1,a0
	rts

***********************************************************
*	PRUN "" -> NOP
L_PRun		equ	783
L783	addq.l	#4,a3
	rts

***********************************************************
*	DIR/W  / LDIR/W
L_LDirW0	equ	784
L784	move.w	#1,impflg(a5)
	Rbra	L_DirW0a
L_DirW0		equ	785
L785	clr.w	impflg(a5)
	RBra	L_DirW0a
L_DirW0a	equ	786
L786	move.l	Name1(a5),a0
	clr.b	(a0)
	move.l	Name2(a5),a0
	clr.b	(a0)
	RBsr	L_Pathit
	Rbra	L_DirW2
***********************************************************
*	DIR/W / LDIR/W a$
L_LDirW1	equ	787
L787	move.w	#1,impflg(a5)
	Rbsr	L_NomDir
	Rbra	L_DirW2
L_DirW1		equ	788
L788	clr.w	impflg(a5)
	Rbsr	L_NomDir
	Rbra	L_DirW2
L_DirW2		equ	789
L789	move.w	#1,DirComp(a5)
	move.w	#20,FillFSize(a5)
	Rbra	L_Dir3
***********************************************************
*	DIR/LDIR 
L_LDir0		equ	790
L790	move.w	#1,impflg(a5)
	Rbra	L_Dir0a
L_Dir0		equ	791
L791	clr.w	impflg(a5)
	Rbra	L_Dir0a
L_Dir0a		equ	792
L792	move.l	Name1(a5),a0
	clr.b	(a0)
	move.l	Name2(a5),a0
	clr.b	(a0)
	Rbsr	L_PathIt
	Rbra	L_Dir2
***********************************************************
*	DIR/LDIR a$
L_LDir1		equ	793
L793	move.w	#1,impflg(a5)
	Rbsr	L_NomDir
	Rbra	L_Dir2
L_Dir1		equ	794
L794	clr.w	impflg(a5)
	Rbsr	L_NomDir
	Rbra	L_Dir2
L_Dir2		equ	795
L795	clr.w	DirComp(a5)
	move.w	DirLNom(a5),FillFSize(a5)
	Rbra	L_Dir3
******* Affiche le nom de la disquette
L_Dir3		equ	796
L796	move.w	#1,FillF32(a5)
	clr.l	DirLong(a5)
	Rbsr	L_FillFirst
	Alea	ChDir0,a0
	Rbsr	L_ImpChaine
	move.l	BufFillF(a5),a0
	lea	6+4(a0),a0
	Rbsr	L_ImpChaine
	Alea	CRet,a0
	Rbsr	L_ImpChaine

******* Boucle du directory
DirLoop	Rbsr	L_FillNxt
	Rbmi	L_DiskError
	beq	DirL5
	cmp.w	#1,d0
	beq.s	DirLoop
	move.l	a0,a2
	tst.w	DirComp(a5)
	beq.s	DirL0
* Affichage condense!
	lea	4(a2),a0
	Rbsr	L_ImpChaine
	bra.s	DirL3
* Affichage normal
DirL0:	cmp.b	#"*",4(a2)
	bne.s	DirL1
* Directory
	Alea	ChDir3,a0
	Rbsr	L_ImpChaine
	lea	5(a2),a0
	Rbsr	L_ImpChaine
	bra.s	DirL2
* Fichier normal
DirL1:	Alea	ChDir4,a0
	Rbsr	L_ImpChaine
	lea	5(a2),a0
	Rbsr	L_ImpChaine
	Alea	ChDir5,a0
	Rbsr	L_ImpChaine
	move.l	Name1(a5),a0
	move.l	(a2),d0
	and.l	#$00FFFFFF,d0
	add.l	d0,DirLong(a5)
	Rbsr	L_LongDec
	clr.b	(a0)
	move.l	Name1(a5),a0
	Rbsr	L_ImpChaine
* Encore un?
DirL2:	Alea	CRet,a0
	Rbsr	L_ImpChaine
DirL3:	Rbsr	L_TTDir
	beq	DirLoop
* Message de fin
DirL5:	tst.w	DirComp(a5)
	beq.s	DirL6
	Alea	CRet,a0
	Rbsr	L_ImpChaine
	bra.s	DirL7
DirL6:	move.l	Buffer(a5),a0
	move.l	DirLong(a5),d0
	Rbsr	L_LongDec
	clr.b	(a0)
	move.l	Buffer(a5),a0
	Rbsr	L_ImpChaine
	Alea	ChDir6,a0
	Rbsr	L_ImpChaine
* Va liberer la memoire FILL FILE
DirL7:	Rbsr	L_FillFFree
	rts

******* Tests touches DIR
L_TTDir		equ	797
L797	bset	#7,EveLabel(a5)
	Rbsr	L_Tester
	SyCall	Inkey			* SPACE/ESC?
	tst.l	d1
	beq.s	TTdiC
	cmp.b	#" ",d1
	beq.s	TTdiW
	swap 	d1
	cmp.b	#$45,d1
	beq.s	TTdiF
TTdiC:	SyCall	Shifts			* CONTROL?
	and.w	#%00001000,d1
	beq.s	TTdiX
	moveq	#25,d7
TTdiL:	Rbsr	L_Tester
	SyCall	WaitVBL
	dbra	d7,TTdiL
TTdiX:	bclr	#7,EveLabel(a5)
	moveq	#0,d0
	rts
* Boucle d'attente
TTdiW:	Rbsr	L_Tester 
	SyCall	Inkey
	tst.l	d1
	beq.s	TTdiW
	swap	d1
	cmp.b	#$45,d1
	bne.s	TTdiX
* Fin du directory!
TTdiF:	bclr	#7,EveLabel(a5)
	moveq	#1,d0
	rts
**********************************************************
L798
***********************************************************
*	Trouve le cheminement ---> Buffer+384
L_AskDir	equ	799
L799	move.l	Buffer(a5),a0
	clr.w	(a0)
	move.l	a0,d1 
	moveq	#-2,d2
	DosCall	DosLock
	tst.l	d0
	Rbeq	L_DiskError
	Rbra	L_AskDir2
L_AskDir2	equ	800
L800	clr.l	-(sp)
ADir0:	move.l	d0,-(sp)
	move.l	d0,d1
	DosCall	DosParent
	tst.l	d0
	bne.s	ADir0
* Redescend les LOCKS en demandant le NOM!
	move.l	Buffer(a5),a2
	lea	384(a2),a2
	clr.b	(a2)
	moveq	#":",d2
ADir1:	move.l	(sp)+,d1
	beq.s	ADir4
	move.l	Buffer(a5),a1
	movem.l	d1/d2/a1/a2,-(sp)
	move.l	a1,d2
	DosCall	DosExam
	movem.l	(sp)+,d1/d2/a1/a2
	tst.l	d0
	beq.s	ADir3
	lea	8(a1),a1
ADir2:	move.b	(a1)+,(a2)+
	bne.s	ADir2
	move.b	d2,-1(a2)
	clr.b	(a2)
	moveq	#"/",d2
ADir3	DosCall	DosUnlock
	bra.s	ADir1
ADir4	rts

******* Trouve le lock NAME1
L_GetDir	equ	801
L_LockGet	equ	801
L801	move.l	Name1(a5),d1
	Rbsr	L_LockFree
	moveq	#-2,d2
	DosCall	DosLock
	move.l	d0,d1
	Rbeq	L_DiskError
	move.l	d1,LockSave(a5)
	rts

***********************************************************
*	FILL FILE

******* Rempli TOUT!
L_FillAll	equ	802
L802	Rbsr	L_FillFirst
FlAl1	Rbsr	L_FillNxt
	bmi.s	FlAl2
	bne.s	FlAl1
FlAl2	rts
******* Ramene le nom SELECTIONNE d0 ---> A0
L_FillGet	equ	803
L803	movem.l	d1/d2,-(sp)
	move.l	BufFillF(a5),d2
	beq.s	FlGNo
	move.l	d2,a0
	moveq	#-1,d1
FlG0	move.l	(a0),d2
	beq.s	FlGNo
	move.l	d2,a0
	addq.w	#1,d1
	cmp.w	d0,d1
	bne.s	FlG0
	movem.l	(sp)+,d1/d2
	moveq	#-1,d0
	rts
FlGNo	movem.l	(sp)+,d1/d2
	moveq	#0,d0
	rts

******* Cree le buffer!
L_FillFirst	equ	804
L804
* Enleve l'ancien buffer -si present-, reserve le nouveau
	Rbsr	L_FillFFree
* Trouve le nom du disque
	Rbsr	L_LockGet
	move.l	Buffer(a5),d2
	DosCall	DosExam
	move.l	Buffer(a5),a0
	tst.w	4(a0)			* Si FICHIER-> filtre
	bpl.s	FlF2
	move.l	d6,a0
	move.l	Name2(a5),a1
FlF1	move.b	(a0)+,(a1)+
	bne.s	FlF1
	move.l	d6,a0
	clr.b	(a0)
FlF2	Rbsr	L_LockGet
	Rbsr	L_AskDir2
	clr.l	LockSave(a5)
	move.l	#6+4+128,d0
	move.l	d0,d1
	Rbsr	L_RamFast
	Rbeq	L_OOfMem
	move.l	d0,BufFillF(a5)
	move.l	d0,a1
	move.w	d1,4(a1)
	lea	6+4(a1),a1
	move.l	Buffer(a5),a0
	lea	384(a0),a0
FlF3	move.b	(a0)+,(a1)+
	bne.s	FlF3
* Saute le nom du disque...
	Rbsr	L_LockGet
	move.l	LockSave(a5),d1
	move.l	Buffer(a5),d2
	DosCall	DosExam
	rts

******* Boucle de recherche
L_FillNxt	equ	805
L805	move.l	LockSave(a5),d1
	move.l	Buffer(a5),a2
	move.l	a2,d2
	DosCall	DosExNext
	tst.l	d0
	beq	FFFini
* Filtre les noms, si pas directory...
	tst.w	4(a2)
	bpl.s	Ff6b
	move.l	DirFNeg(a5),a0		* Filtre NEGATIF
	tst.b	(a0)
	beq.s	Ff6
	lea	8(a2),a1
	Rbsr	L_Joker
	bne.s	Ff8
Ff6:	move.l	Name2(a5),a0		* Filtre POSITIF
	tst.b	(a0)
	beq.s	Ff6a
	lea	8(a2),a1
	Rbsr	L_Joker
	beq.s	Ff8
Ff6a	moveq	#" ",d2
	bra.s	Ff7
* Une *
Ff6b	moveq	#"*",d2
* Poke dabs le buffer
Ff7	Rbsr	L_FillFPoke
	beq.s	FfFini
* OK! Ramene le nom = A0 / D0>0
	move.l	d7,a0
	moveq	#2,d0
	rts
* Pas filtre!
Ff8	moveq	#1,d0
	rts
******* Plus de nom. D0=0 fin / D0<0 erreur
FfFini	DosCall	DosIoErr
	cmp.w	#232,d0
	bne.s	FfErr
	moveq	#0,d0
	rts
FfErr	moveq	#-1,d0
	rts

******* Libere les buffers FILLFILE
L_FillFFree	equ	806
L806	Rbsr	L_LockFree
	move.l	BufFillF(a5),d1
	beq.s	FFr2
FFr1	move.l	d1,a1
	move.l	(a1),d1
	move.w	4(a1),d0
	ext.l	d0
	Rbsr	L_RamFree
	tst.l	d1
	bne.s	FFr1
FFr2	clr.l	BufFillF(a5)
	clr.w	FillFNb(a5)
	clr.w	PosFillF(a5)
	rts

******* Trie le buffer!
L_FillSort	equ	807
L807	movem.l	a0-a4/d0-d2,-(sp)
Fss1	moveq	#0,d7
	move.l	BufFillF(a5),d0
	beq.s	FssX
	move.l	d0,a0
	move.l	(a0),d0
	beq.s	FssX
	move.l	d0,a1
	bra.s	Fss4
* Compare les chaines
Fss2	move.l	d0,a1
	lea	10(a0),a3
	lea	10(a1),a4
Fss3	move.b	(a4)+,d0
	bsr	MajD0a
	cmp.b	#"*",d0
	bne.s	Fss3a
	moveq	#1,d0
Fss3a	move.b	d0,d1
	move.b	(a3)+,d0
	bsr	MajD0a
	cmp.b	#"*",d0
	bne.s	Fss3b
	moveq	#1,d0
Fss3b	move.b	d0,d2
	or.b	d1,d2
	beq.s	Fss4
	cmp.b	d0,d1
	beq.s	Fss3
	bhi.s	Fss4
* Echange
	move.l	(a1),(a0)
	move.l	a0,(a1)
	move.l	a1,(a2)
	addq.w	#1,d7
	exg.l	a0,a1
* La chaine suivante?
Fss4	move.l	a0,a2
	move.l	a1,a0
	move.l	(a0),d0
	bne.s	Fss2
* Encore une fois?
	tst.w	d7
	bne.s	Fss1
* Ca y est!
FssX	movem.l	(sp)+,a0-a4/d0-d2
	rts

******* Routine-> majuscule
MajD0a	cmp.b	#"a",d0
	bcs.s	MajD1
	cmp.b	#"z",d0
	bhi.s	MajD1
	sub.b	#$20,d0
MajD1	rts

******* Poke dans le buffer, sans classement
*	D2= premier caractere
L_FillFPoke	equ	808
L808	move.w	FillFSize(a5),d0
	add.w	#4+2+4+2,d0
	ext.l	d0
	move.l	d0,d1
	Rbsr	L_RamFast
	beq.s	pfH
	move.l	d0,a1
	move.l	BufFillF(a5),d0
	bne.s	pfA
	move.l	a1,BufFillF(a5)
	bra.s	pfB
pfA	move.l	d0,a0
	move.l	(a0),d0
	bne.s	pfA
	move.l	a1,(a0)
pfB	move.w	d1,4(a1)
	lea	6(a1),a1
	move.l	a1,d7
* Recopie du nom, en le tronquant.
	move.l	124(a2),(a1)+
	move.w	FillFSize(a5),d1
	subq.w	#2,d1
	move.b	d2,(a1)+
	lea 	8(a2),a0
pfD:    move.b 	(a0)+,(a1)+
	beq.s	PfE
        dbra 	d1,pfD
	bra.s	PfG
pfE:	tst.w	FillF32(a5)
	beq.s	PfG
	subq.l	#1,a1
pfF:	move.b	#" ",(a1)+
	dbra	d1,PfF
; Un nom de plus!
pfG:	addq.w	#1,FillFNb(a5)
	tst.l	d7
	rts
* Plus de place
pfH:	moveq	#0,d7
	rts

******* Filtre les noms disque!
L_Joker		equ	809
L809	move.l	a0,d2	
	move.l	a1,d3
JokLoop	move.b	(a1)+,d1
	beq.s	JokX
JokL0	move.b	(a0)+,d0
	beq.s	JokNON
	cmp.b	#"/",d0
	beq.s	ReJok
	cmp.b	#"?",d0
	beq.s	JokC
	cmp.b	#".",d0
	beq.s	JokD
	cmp.b	#"*",d0
	beq.s	JokE
* Veut une lettre normale!
	cmp.b	#"a",d0
	bcs.s	JokA
	cmp.b	#"z",d0
	bhi.s	JokA
	sub.b	#"a"-"A",d0
JokA:	cmp.b	#"a",d1
	bcs.s	JokB
	cmp.b	#"z",d1
	bhi.s	JokB
	sub.b	#"a"-"A",d1
JokB:	cmp.b	d0,d1
	beq.s	JokLoop
	bra.s	ReJok
* N'importe quelle lettre!
JokC:	cmp.b 	#".",d1
	bne.s	JokLoop
	bra.s	ReJok
* Un Point!
JokD:	cmp.b	#".",d1
	beq.s	JokLoop
	bra.s	ReJok
* Une etoile
JokE:	cmp.b	#"*",(a0)
	beq.s	JokOUI
JokF:	cmp.b	#".",d1
	beq.s	JokL0
	move.b	(a1)+,d1
	bne.s	JokF
* Fin du mot sur le disque
JokX:	move.b	(a0)+,d0
	beq.s	JokOUI
	cmp.b	#"/",d0
	beq.s	JokOUI
* Recommence!
ReJok:	move.l	d2,a0
	move.l	d3,a1
ReJ:	move.b	(a0)+,d0
	beq.s	JokNON
	cmp.b	#"/",d0
	bne.s	ReJ
	move.l	a0,d2
	bra	JokLoop
* Reponses...
JokNON:	moveq	#0,d0
	rts
JokOUI:	moveq	#1,d0
	rts

L810
	
***********************************************************
*	SELECTEUR DE FICHIERS / ACCESSOIRES
*******

******* PSEL$("filtre$")
L_Psel1		equ	811
L811	move.l	ChVide(a5),d0
	move.l	d0,-(a3)
	move.l	d0,-(a3)
	move.l	d0,-(a3)
	Rbra	L_PSel4
******* PSEL$("filtre$","default")
L_Psel2		equ	812
L812	move.l	ChVide(a5),-(a3)
	move.l	ChVide(a5),-(a3)
	Rbra	L_PSel4
******* PSEL$("f","d","titre1")
L_PSel3		equ	813	
L813	move.l	ChVide(a5),-(a3)
	Rbra	L_PSel4
******* PSEL$("f","d","t1","t2")
L_PSel4		equ	814
L814	move.w	#1,AccFlag(a5)
	Rbra	L_FSel0
	
******* FSEL$("filtre$")
L_FSel1		equ	815
L815	move.l	ChVide(a5),d0
	move.l	d0,-(a3)
	move.l	d0,-(a3)
	move.l	d0,-(a3)
	Rbra	L_FSel
******* FSEL$("filtre$","default")
L_Fsel2		equ	816
L816	move.l	ChVide(a5),-(a3)
	move.l	ChVide(a5),-(a3)
	Rbra	L_FSel
******* FSEL$("f","d","titre1")
L_FSel3		equ	817
L817	move.l	ChVide(a5),-(a3)
	Rbra	L_FSel
******* FSEL$("f","d","t1","t2")
L_FSel4		equ	818
L_FSel		equ	818
L818	clr.w	AccFlag(a5)
	RBra	L_FSel0

******* Ouverture de l'ecran
L_FSel0		equ	819
L819	move.l	sp,FsSp(a5)
	move.l	#40*8,d2
	move.l	#21*8,d3
	moveq	#3,d4
	move.l	#$8000,d5
	moveq	#6,d6
	moveq	#0,d7
	move.l	Buffer(a5),a1		* Palette par defaut
	move.l	a1,a2
	lea	FsPal(a5),a0
	move.l	(a0)+,(a2)+
	move.l	(a0)+,(a2)+
	lea	DefEPa+8(a5),a0
	moveq	#32-4-1,d0
Fs_Ti0	move.w	(a0)+,(a2)+
	dbra	d0,Fs_Ti0
	EcCalD	Cree,EcFSel
	Rbne	L_EcWiErr
	move.l	a0,FsAdEc(a5)	
	SyCalD	ResZone,32	
	moveq	#3,d1
	Alea	EdFlCu,a1
	EcCall	Flash
* Init du fond
	lea	FsFond(pc),a1
	WiCall	Print
* Init des titres
	WiCalA	Print,FsITit2(pc)
	move.l	(a3)+,a2
	move.l	a2,a1
	move.w	(a2)+,d2
	beq.s	FsTi1
	cmp.w	#39,d2
	bcc	FsTi1
	move.l	Buffer(a5),a0
	Rbsr	L_ChVerBuf2
	move.l	Buffer(a5),a1
	WiCall	Centre
FsTi1:	WiCalA	Print,FsITit1(pc)
	move.l	(a3)+,a2
	move.l	a2,a1
	Alea	FsDTit,a1
	move.w	(a2)+,d2
	beq.s	FsTi2
	cmp.w	#39,d2
	bcc	FsTi2
	move.l	Buffer(a5),a0
	Rbsr	L_ChVerBuf2
	move.l	Buffer(a5),a1
FsTi2:	WiCall	Centre
* Init du texte par defaut
	moveq	#10,d1
	Alea	FsTxt,a0
	tst.w	AccFlag(a5)
	beq.s	FsIt0
	Alea	FaTxt,a0
FsIt0:	bsr	FsCopT			* Copie le texte
	moveq	#0,d0
	bsr	FsAffT			* Affiche le texte
	addq.w	#1,d1			* Jusqu'au dernier
	cmp.w	#17,d1
	bcs.s	FsIt0
* Fenetre PATHNAME
	moveq	#2*8,d2
	move.w	#16*8,d3
	moveq	#36,d4
	moveq	#2,d5
	moveq	#0,d6
	moveq	#0,d7
	move.l	d7,a1
	WiCalD	WindOp,1	
	Rbne	L_EcWiErr
	WiCalA	Print,FsPathI(pc)
* Fenetre NOM
	moveq	#2*8,d2
	move.w	#19*8,d3
	moveq	#36,d4
	moveq	#1,d5
	moveq	#0,d6
	moveq	#0,d7
	move.l	d7,a1
	WiCalD	WindOp,2
	Rbne	L_EcWiErr
	move.w	#2,FsWiAct(a5)
	move.l	Buffer(a5),a0
	lea	FsDNom(a0),a0
	clr.b	(a0)
	clr.w	FsCNom(a5)
	clr.w	FsLNom(a5)
	move.l	(a3)+,a2
	move.w	(a2)+,d2
	cmp.w	#35,d2
	bcc	FsInm0
	move.w	d2,FsCNom(a5)
	move.w	d2,FsLNom(a5)
	Rbsr	L_ChVerBuf2
FsINm0:	WiCalA	Print,FsNomI(pc)

******* Fait apparaitre l'ecran
	move.l	FsAdEc(a5),a2
	move.w	FsDWX(a5),EcAWX(a2)
	bset	#1,EcAW(a2)
	move.w	FsDVApp(a5),d7
	moveq	#1,d6
	move.w	FsDWY(a5),d5
	add.w	#(21*8)/2,d5
	Rbsr	L_AppCentre
	move.w	#1,FsFlag(a5)
* Limite la souris
	lea	T_MouXMin(a5),a0
	lea	FsLimSave(a5),a1
	moveq	#3,d0
FsTi0	move.w	(a0)+,(a1)+
	dbra	d0,FsTi0
	moveq	#0,d1
	SyCall	LimitMEc

******* Prend le PATH
FsDr4:	Rbsr	L_NomDir

******* Boucle !
	clr.w	FsActive(a5)
FsReLoop	
	clr.w	FsIFlag(a5)
FsReLp
	sub.l	a1,a1			* Efface le message
	bsr	FsMess
	moveq	#0,d0
	bsr	FsANom
	bsr	FsFirst
	bsr	FsAffF
	bsr	FsSli

FsRLoop	SyCall	MouseKey
	and.b	#$3,d1
	bne.s	FsRLoop
FsLoop:
* Attente multitache
	tst.w	T_AMOSHere(a5)
	bne.s	FsL0a
	Rjsr	L_WaitMul
FsL0a	SyCall	Test_Cyclique

* Affichage progressif des fichiers
	bsr	FsNext

* Gestion des zones actives!
FsL0:	SyCall	GetZone
	cmp.w	#EcFSel,d1
	beq.s	FsL1
FsL1a:	moveq	#0,d1
FsL1:	swap 	d1
	cmp.w	FsActive(a5),d1
	beq.s	FsL3
	move.w	d1,-(sp)
	move.w	FsActive(a5),d1
	beq.s	FsL2
	moveq	#0,d0
	bsr	FsAffT
	clr.w	FsActive(a5)
FsL2:	move.w	(sp)+,d1
	move.w	d1,FsActive(a5)
	beq.s	FsL3
	moveq	#1,d0
	bsr	FsAffT

* Appuie sur la souris
FsL3:	SyCall	MouseKey
	move.w	d1,d2 
	btst	#1,d2
	bne	FsGoDev			* Devices!!!
	btst	#0,d2			
	beq	FsKey	
	move.w	FsActive(a5),d1
	beq	FsKey
	cmp.w	#15,d1
	beq	FsHaut
	cmp.w	#16,d1
	beq	FsBas
	cmp.w	#17,d1
	beq	FsMou
	cmp.w	#11,d1
	beq	FsFin
	cmp.w	#12,d1
	beq	FsEsc
	cmp.w	#13,d1
	beq	FsSort
	cmp.w	#10,d1
	beq	FsParent
	cmp.w	#14,d1
	beq	FsSDir
	cmp.w	#18,d1
	beq	FsGPath
	cmp.w	#19,d1
	beq	FsGNom
	cmp.w	#20,d1
	bcc	FsFile

******* Appui sur une touche
FsKey:	SyCall	Inkey
	tst.l	d1
	beq	FsLoop
* Prend les parametres actuels
	moveq	#35,d6			* Nom
	move.w	FsLNom(a5),d5
	move.w	FsCNom(a5),d4
	move.l	Buffer(a5),a2
	lea	FsDNom(a2),a2 
	cmp.w	#2,FsWiAct(a5)
	beq.s	FsEdI0
	move.w	#PathMax,d6		* Path
	move.w	FsLPath(a5),d5
	move.w	FsCPath(a5),d4
	move.l	Buffer(a5),a2
	lea	512(a2),a2
FsEdI0:
	swap	d1
	cmp.b	#$4F,d1			* Fleche gauche
	beq	FsEdG
	cmp.b	#$4E,d1			* Fleche droite
	beq	FsEdR
	cmp.b	#$4C,d1			* Fleche haute
	beq	FsGPath
	cmp.b	#$4D,d1			* Fleche basse
	beq	FsGNom
	cmp.b	#$41,d1			* BackSpace
	beq	FsEdB
	cmp.b	#$46,d1			* Delete
	beq	FsEdD
	cmp.b	#$45,d1			* Escape
	beq	FsEsc
	swap	d1
	cmp.b	#13,d1
	beq	FsRet
	cmp.b	#32,d1
	bcs	FsLoop
* Insere une lettre
	cmp.w	d6,d5			* Longueur maximum
	bcc	FsLoop
	move.w	d5,d0
FsEdI1:	move.b	0(a2,d0.w),1(a2,d0.w)
	subq.w	#1,d0
	cmp.w	d4,d0
	bge.s	FsEdI1
	move.b	d1,0(a2,d4.w)
	addq.w	#1,d5
	addq.w	#1,d4
	clr.b	0(a2,d5.w)
	bra	FsEdPrt
* Curseur a gauche
FsEdG:	tst.w	d4
	beq	FsLoop
	and.w	#$0300,d1
	bne.s	FsEdMg
	subq.w	#1,d4
	bra	FsEdPrt
* Mot gauche
FsEdMg:	subq.w	#1,d4
	tst.w	d4
	beq	FsEdPrt
	move.b	-1(a2,d4.w),d2
	Rbsr	L_Lettre
	bne.s	FsEdMg
	bra	FsEdPrt
* Curseur a droite
FsEdR:	cmp.w	d5,d4
	bcc	FsLoop
	and.w	#$0300,d1
	bne.s	FsEdMd
	addq.w	#1,d4
	bra	FsEdPrt
* Mot droit
FsEdMd:	addq.w	#1,d4
	cmp.w	d5,d4
	bcc	FsEdPrt
	move.b	-1(a2,d4.w),d2
	Rbsr	L_Lettre
	bne.s	FsEdMd
	bra	FsEdPrt
* BackSpace
FsEdB:	and.w	#$0300,d1
	bne.s	FsEdCl
	tst.w	d4
	beq	FsLoop
	subq.w	#1,d4
* Delete
FsEdD:	and.w	#$0300,d1
	bne.s	FsEdCl
	cmp.w	d5,d4
	bcc	FsEdPrt
	move.w	d4,d0
FsEdD1:	move.b	1(a2,d0.w),0(a2,d0.w)
	addq.w	#1,d0
	cmp.w	d5,d0
	bcs.s	FsEdD1
	subq.w	#1,d5
	clr.b	0(a2,d5.w)
	bra	FsEdPrt	
* Nettoyage ligne
FsEdCl:	clr.b	(a2)
	clr.w	d4
	clr.w	d5
* Imprime le resultat!
FsEdPrt cmp.w	#1,FsWiAct(a5)
	beq.s	FsEdP
* Fenetre NOM
	move.w	d4,FsCNom(a5)
	move.w	d5,FsLNom(a5)
	moveq	#-1,d0
	bsr	FsANom
	bra	FsLoop
* Fenetre PATH
FsEdP:	move.w	d4,FsCPath(a5)
	move.w	d5,FsLPath(a5)
	moveq	#-1,d0
	bsr	FsAPath
	bra	FsLoop
******* RETURN
FsRet:	cmp.w	#2,FsWiAct(a5)
	beq.s	FsFin
* Change le path!
	move.l	Buffer(a5),a2
	lea	512(a2),a2
	move.w	FsLPath(a5),d2
	moveq	#0,d7
	Rbsr	L_NDir
	bra	FsReLoop

******* ESCAPE
FsEsc:	Rbsr	L_FsOut
	Rbsr	L_FillFFree
	move.l	ChVide(a5),-(a3)
	rts
******* Fin du selecteur de fichier
FsFin:	tst.w	FsLNom(a5)
	beq.s	FsEsc
; Copie le pathname courant
	bsr	FsCoDir
	Rbsr	L_FsOut
	move.l	Name1(a5),a0
	move.w	FsLPath1(a5),d3
	lea	0(a0,d3.w),a0
	move.l	Buffer(a5),a1
	lea	FsDNom(a1),a1
FsFin1:	addq.w	#1,d3
	move.b	(a1)+,(a0)+
	bne.s	FsFin1
	subq.w	#1,d3
	ext.l	d3
	Rbsr	L_Demande
	move.w	d3,(a0)+
	lsr.w	#1,d3
	move.l	Name1(a5),a2
FsFin2:	move.w	(a2)+,(a0)+
	dbra	d3,FsFin2
	move.l	a0,HiChaine(a5)
	move.l	a1,-(a3)
	move.l	FsSp(a5),sp
	Rbsr	L_FillFFree
	rts

******* Affiche un  message
FsMess:	move.l	a1,-(sp)
	WiCalD	QWindow,0
	WiCalA	Print,FsMess1(pc)
	move.l	(sp)+,d0
	beq.s	FsMm
	move.l	d0,a1
	WiCall	Centre
FsMm	WiCalA	Print,FsMess2(pc)
	bra	FsWind

******* Click dans le path
FsGPath	move.w	#1,FsWiAct(a5)
	bsr	FsWind
	bra	FsLoop
******* Click dans le nom
FsGNom:	move.w	#2,FsWiAct(a5)
	bsr	FsWind
	bra	FsLoop
******* Fleche vers le haut
FsHaut:	tst.w	FsPosF(a5)
	beq	FsLoop
	subq.w	#1,FsPosF(a5)
	bsr	GoAffF
	bra	FsLoop
******* Fleche vers le bas
FsBas:	move.w	FsPosF(a5),d0
	add.w	#10,d0
	cmp.w	FillFNb(a5),d0
	bcc	FsLoop
	addq.w	#1,FsPosF(a5)
	bsr	GoAffF
	bra	FsLoop	
******* Positionne dans le slider
FsMou:	SyCall	XyMou
	moveq	#0,d3
	SyCall	XyScr
	tst.w	d1
	bmi	FsLoop
	sub.w	#7*8,d2
	bmi	FsLoop
	mulu	FillFNb(a5),d2
	divu	#9*8,d2
	move.w	d2,d0
	add.w	#10,d0
	cmp.w	FillFNb(a5),d0
	bcs.s	FsM1
	move.w	FillFNb(a5),d2
	sub.w	#10,d2
	bpl.s	FsM1
	moveq	#0,d2
FsM1:	move.w	d2,FsPosF(a5)
	bsr	GoAffF
	bra	FsLoop
******* Parent
FsParent:
	tst.w	AccFlag(a5)
	bne	FsLoop
	bsr	FsEffF
	move.l	Name1(a5),a0
	add.w	FsLPath1(a5),a0
	cmp.b	#"/",-(a0)
	bne	FsLoop
FsPa1:	move.b	-(a0),d0
	cmp.b	#"/",d0
	beq.s	FsPa2
	cmp.b	#":",d0
	bne.s	FsPa1
FsPa2:	clr.b	1(a0)
	bra	FsReLoop
******* Set dir / All
FsSDir	tst.w	AccFlag(a5)
	bne	FaAll
	move.l	LockSave(a5),d1
	beq	FsLoop
	bsr.s	FsCoDir
	Alea	FsDirSet,a1
	bsr	FsMess
	bra	FsRLoop
** Routine, recopie NAME1 dans PATHACT
FsCoDir	tst.w	AccFlag(a5)
	bne.s	.sskip
	move.l	Name1(a5),a0
	move.l	PathAct(a5),a1
	move.w	FsLPath1(a5),d0
	subq.w	#1,d0
	beq.s	.skip
.loop	move.b	(a0)+,(a1)+
	dbra	d0,.loop
.skip	clr.b	(a1)
.sskip	rts
******* All
FaAll	move.l	Buffer(a5),a0
	lea	FsDNom(a0),a0
	move.b	#"*",(a0)+
	move.b	#"*",(a0)+
	clr.b	(a0)
	move.w	#2,FsLNom(a5)
	move.w	#2,FsCNom(a5)
	bra	FsFin

******* Efface le nom active!
FsEffF:	movem.l	d0-d7/a0-a2,-(sp)
	move.w	FsActive(a5),d1
	beq.s	FsEfx
	moveq	#0,d0
	bsr	FsAffT
	clr.w	FsActive(a5)
FsEfX:	movem.l	(sp)+,d0-d7/a0-a2	
	rts
	
******* Clicke dans un nom de fichier
FsFile:	move.w	d1,d0
	sub.w	#20,d0
	cmp.w	#10,d0
	bcc	FsLoop
	add.w	FsPosF(a5),d0
	Rbsr	L_FillGet
	beq	FsLoop
	lea	6+4(a0),a2
	btst	#0,FsIFlag(a5)
	bne.s	FsChDev
	cmp.b	#" ",(a2)+
	beq	FsCNm
* Changement de directory!
	bsr	FsEffF
	move.l	a2,a0
	moveq	#0,d0
FsChd1:	addq.w	#1,d0		* Verifie la taille!
	tst.b	(a0)+
	bne.s	FsChd1
	add.w	FsLPath(a5),d0
	cmp.w	#255,d0
	bcc	FsLoop
	move.l	Name1(a5),a0
	add.w	FsLPath1(a5),a0
FsChd2:	move.b	(a2)+,(a0)+
	bne.s	FsChd2
	bra	FsReLoop
* Fichier normal
FsCNm:	move.l	Buffer(a5),a0
	lea	FsDNom(a0),a0
	moveq	#-1,d0
	moveq	#0,d1
FsCnm1:	addq.w	#1,d0
	move.b	(a2)+,d2
	cmp.b	(a0),d2
	beq.s	FsCnm2
	addq.w	#1,d1
FsCnm2:	move.b	d2,(a0)+
	bne.s	FsCnm1
	tst.w	d1			* Double CLICK?
	beq	FsFin
	move.w	d0,FsLNom(a5)
	move.w	d0,FsCNom(a5)
	moveq	#0,d0
	bsr	FsANom
	bra	FsRLoop	
* Changement de device
FsChDev	move.l	Name1(a5),a0
	addq.l	#1,a2
FsDv1	move.b	(a2)+,(a0)+
	bne.s	FsDv1
	bra	FsReLoop

******* Mode devices/normal
FsGoDev	tst.w	AccFlag(a5)
	bne	FsLoop
	bchg	#0,FsIFlag(a5)
	bra	FsReLp
******* Rempli les noms de fichier
FsFirst	clr.w	FsPosF(a5)
	clr.b	FsIFlag+1(a5)
	clr.w	FillF32(a5)
	move.w	#40,FillFSize(a5)
	tst.w	AccFlag(a5)
	bne.s	FaFill
	btst	#0,FsIFlag(a5)
	bne	FdFill
* Fichiers
	ALea	FsWait,a1
	bsr	FsMess
	move.b	#1,FsIFlag+1(a5)
	Rbsr	L_GetDir
	Rbsr	L_FillFirst
	bsr	FsMkPath
	moveq	#0,d0
	bra	FsAPath
* Accessoires
FaFill	move.l	Name1(a5),a0
	clr.b	(a0)	
	bsr	FsMkPath
	moveq	#0,d0
	bsr	FsAPath
	Rbra	L_FillAcc
* Devices
FdFill	move.l	Name2(a5),a0
	move.w	(a0),d0
	clr.w	(a0)
	Rbsr	L_FillDev
	move.w	d0,(a0)
	bsr	FsAffF
	bra	FsSli

******* Prend le nom suivant
FsNext	tst.b	FsIFlag+1(a5)
	beq	FaOut
	subq.b	#1,FsIFlag+1(a5)
	bne	FaOut
	Rbsr	L_FillNxt
	ble	FsNEnd
	move.b	#1,FsIFlag+1(a5)
	cmp.w	#1,d0
	beq	FaOut
	bra	FsAffF
FsNEnd	bsr	FsSli
	sub.l	a1,a1
	bra	FsMess
******* SORT! Trie le buffer
FsSort	Rbsr	L_FillSort
	bsr	GoAffF
	bra	FsLoop

******* Fabrique le PATH COMPLET en buffer+512
FsMkPath:
	movem.l	d0-d2/a0-a2,-(sp)
	moveq	#-1,d0
	clr.w	FsLPath1(a5)
	move.l	Buffer(a5),a1
	lea	512(a1),a1
	move.l	Name1(a5),a2
	clr.b	(a2)
	tst.w	AccFlag(a5)
	bne.s	FsMp3
* Path
	move.l	BufFillF(a5),a0
	lea	6+4(a0),a0
FsMp1:	addq.w	#1,d0
	move.b	(a0),(a1)+
	move.b	(a0)+,(a2)+
	bne.s	FsMp1
	move.w	d0,FsLPath1(a5)
	subq.w	#1,d0
	subq.l	#1,a1
* Filtre
FsMp3	move.l	Name2(a5),a0
FsMp2:	addq.w	#1,d0
	move.b	(a0)+,(a1)+
	bne.s	FsMp2
	move.w	d0,FsLPath(a5)
	move.w	d0,FsCPath(a5)
	movem.l	(sp)+,d0-d2/a0-a2
FaOut	rts

******* Affiche le PATHNAME
FsAPath	movem.l	d0-d2/a0-a2,-(sp)
	move.w	d0,-(sp)
	WiCalD	QWindow,1
	lea	FsInv0(pc),a1
	move.w	(sp)+,d0
	bmi.s	FsAp4
	beq.s	FsAp0
	lea	FsInv1(pc),a1
FsAp0:	WiCall	Print
FsAp4:	WiCalA	Print,FsPath(pc)
* Affiche la partie visible
	move.l	Buffer(a5),a1
	lea	512(a1),a1
	WiCall	Print
* Positionne le curseur
	move.w	FsCPath(a5),d0
	moveq	#-1,d2
FsAp3:	addq.l	#1,d2
	move.w	d0,d1
	sub.w	#36,d0
	bpl.s	FsAp3
	WiCall	Locate
	movem.l	(sp)+,d0-d2/a0-a2
	bra	FsWind

******* Affiche le NOM FICHIER
FsANom:	movem.l	d0-d2/a0-a2,-(sp)
	move.w	d0,-(sp)
	WiCalD	QWindow,2
	lea	FsInv0(pc),a1
	move.w	(sp)+,d0
	bmi.s	FsAn1
	beq.s	FsAn0
	lea	FsInv1(pc),a1
FsAn0:	WiCall	Print
FsAn1:	WiCalA	Print,FsNom(pc)
	move.l	Buffer(a5),a1
	lea	FsDNom(a1),a1
	WiCall	Print
	move.w	FsCNom(a5),d1
	ext.l	d1
	move.l	#EntNul,d2
	WiCall	Locate
	movem.l	(sp)+,d0-d2/a0-a2
******* Reactive la fenetre
FsWind:	movem.l	d0-d2/a0-a2,-(sp)
	move.w	FsWiAct(a5),d1
	WiCall	QWindow
	movem.l	(sp)+,d0-d2/a0-a2
	rts

******* Affiche tous les noms de fichier
GoAfff	tst.b	FsIFlag+1(a5)
	bne	FaOut
	bsr	FsAfff
	bsr	FsSli
	rts
* Affiche tous les fichiers
FsAffF:	move.w	#20,-(sp)
FsAfff1	move.w	(sp),d1
	SyCall	RazZone
	move.w	(sp),d1
	moveq	#0,d0
	cmp.w	FsActive(a5),d1
	bne.s	FsAfff2
	moveq	#1,d0
FsAfff2	bsr	FsAffT
	addq.w	#1,(sp)
	cmp.w	#30,(sp)
	bcs.s	FsAfff1
	addq.l	#2,sp
	bra	FsWind

******* Affiche le slider!
FsSli	moveq	#2*8-1,d1
	moveq	#9*8-1,d2
	move.w	FillFNb(a5),d3
	move.w	FsPosF(a5),d4
	moveq	#10,d5
	moveq	#0,d6
	moveq	#7*8,d7
	EcCall	VerSli
	bra	FsWind

******* Affiche le TEXTE ACTIF #D1 - Inverse D0
FsAffT:	cmp.w	#18,d1
	beq	FsAPath
	cmp.w	#19,d1
	beq	FsANom
	movem.l	a0-a2/d0-d2,-(sp)
	WiCalD	QWindow,0
	movem.l	(sp)+,a0-a2/d0-d2
	movem.l	a0-a2/d0-d2,-(sp)
	cmp.w	#20,d1
	bcc.s	FsA2
	cmp.w	#17,d1
	bcc.s	FsAx
* Affichage normal
	move.w	d1,-(sp)
	lea	FsInv0(pc),a1
	tst.w	d0
	beq.s	FsA1
	lea	FsInv1(pc),a1
FsA1:	WiCall	Print
	move.w	(sp)+,d1
	lea	FsA(pc),a1
	lsl.w	#1,d1
	add.w	-2(a1,d1.w),a1
	WiCall	Print
FsAx:	movem.l	(sp)+,a0-a2/d0-d2
	bra	FsWind
* Affichage d'un nom de fichier
FsA2:	move.w	d0,-(sp)
	sub.w	#20,d1
	lea	FsTFile(pc),a1
	move.w	d1,d0			* Coordonnee en Y
	add.w	#48+5,d0
	move.b	d0,2(a1)
	move.l	a1,a2
FsA3:	cmp.b	#29,(a2)+
	bne.s	FsA3
	move.l	a2,d2
FsA4:	move.b	#" ",(a2)+
	cmp.b	#27,(a2)
	bne.s	FsA4
	move.w	d1,d0
	add.w	FsPosF(a5),d0
	Rbsr	L_FillGet
	bne.s	FsA5
* + Loin	
	move.b	#48+64,2(a2)		* Pas de zone
	lea	FsInv0(pc),a0
	addq.l	#2,sp
	bra.s	FsA7
* Dans les affiches
FsA5:	add.w	#48+20,d1
	move.b	d1,2(a2)		* Marque la zone
	lea	6+4(a0),a0
	move.l	d2,a2
FsA6:	move.b	(a0)+,d0
	beq.s	FsA8
	move.b	d0,(a2)+
	cmp.b	#27,(a2)
	bne.s	FsA6
FsA8:	lea	FsInv0(pc),a0
	tst.w	(sp)+
	beq.s	FsA7
	lea	FsInv1(pc),a0
* Affiche!
FsA7:	move.l	a1,-(sp)
	move.l	a0,a1
	WiCall	Print
	move.l	(sp)+,a1
	WiCall	Print
	movem.l	(sp)+,a0-a2/d0-d2
	bra	FsWind
	
******* Copie le texte A0 dans le TEXTE ACTIF D1
FsCopT:	movem.l	a1-a2/d0-d2,-(sp)
	lea	FsA(pc),a1
	lsl.w	#1,d1
	add.w	-2(a1,d1.w),a1
	move.l	a1,a2
FsCt1:	cmp.b	#29,(a2)+
	bne.s	FsCt1
FsCt2:	move.b	(a0)+,d0
	beq.s	FsCt4
	cmp.b	#27,(a2)
	beq.s	FsCt3
	move.b	d0,(a2)+
	bra.s	FsCt2
FsCt3:	tst.b	(a0)+
	bne.s	FsCt3
FsCt4:	move.l	a0,-(sp)
	WiCall	Print
	move.l	(sp)+,a0
	movem.l	(sp)+,a1-a2/d0-d2
	rts
	Rbra	L_FsError

******* Definition par defaut
PathMax equ 36*2
FsDNom:	equ 512+256+128
******* Dessin du fond du FSEL
FsFond:	dc.b 27,"C0",27,"V0",25
* Grand cadre
	dc.b 27,"X1",27,"Y1",27,"E0",27,"X",48+39,27,"Y",48+19,27,"E2"
* Cadre noms
	dc.b 27,"X3",27,"Y5",27,"E0",27,"X",48+29,27,"Y",48+14,27,"E2"
* Cadre nom
	dc.b 27,"X1",27,"Y",48+19,27,"E0",27,"X",48+39,27,"E2"
* Zone slider
	dc.b 27,"X0",27,"Y6",27,"Z0",27,"X2",27,"Y",48+15,27,"Z",48+17
	dc.b 0
******* Activation zones actives
FsInv0:	dc.b 27,"I0",0
FsInv1:	dc.b 27,"I1",0
FsMess1	dc.b 27,"B1",27,"P3",27,"X1",27,"Y3",27,"Q",48+38,0
FsMess2	dc.b 27,"B1",27,"P2",0
FsTFile	dc.b 27,"Y0",27,"X3",27,"Z0",28,29,"                          ",27,"Z0",0
FsPSli:	dc.b 27,"X0",27,"Y5",27,"B0",27,"P1",0
FsPSlo:	dc.b 27,"B1",27,"P2",0
FsPathI:dc.b 27,"V0",27,"Z0",27,"X",48+35,27,"Y1",27,"Z",48+18,24,0
FsPath:	dc.b 25,0
FsNomI:	dc.b 27,"V0",27,"Z0",27,"X",48+35,27,"Z",48+19,27,"C0",24,0
FsNom:	dc.b 25,27,"C1",0
FsITit1 dc.b 27,"Y1",0
FsITit2	dc.b 27,"Y2",0
******* Zones actives disque
FsA:	dc.w 0,0,0,0,0
	dc.w 0,0,0,0,FsD16-FsA
	dc.w FsD10-FsA,FsD11-FsA,FsD12-FsA,FsD13-FsA
	dc.w FsD14-FsA,FsD15-FsA
FsD10:	dc.b 27,"X",48+31,27,"Y",48+5,27,"E0",27,"X",48+39,27,"E2"
	dc.b 27,"X",48+31,27,"Y",48+5,27,"Z0",28,29,"        ",27,"Z",48+11,0
FsD11:	dc.b 27,"X",48+31,27,"Y",48+8,27,"E0",27,"X",48+39,27,"E2"
	dc.b 27,"X",48+31,27,"Y",48+8,27,"Z0",28,29,"        ",27,"Z",48+12,0
FsD12:	dc.b 27,"X",48+31,27,"Y",48+11,27,"E0",27,"X",48+39,27,"E2"
	dc.b 27,"X",48+31,27,"Y",48+11,27,"Z0",28,29,"        ",27,"Z",48+13,0
FsD13:	dc.b 27,"X",48+31,27,"Y",48+14,27,"E0",27,"X",48+39,27,"E2"
	dc.b 27,"X",48+31,27,"Y",48+14,27,"Z0",28,29,"        ",27,"Z",48+14,0
FsD14:	dc.b 27,"X0",27,"Y",48+5,27,"Z0",28,29,"  ",27,"Z",48+15,0
FsD15:	dc.b 27,"X0",27,"Y",48+6,27,"Z0",28,29,"  ",27,"Z",48+16,0
FsD16:	dc.b 27,"X0",27,"Y",48+4,27,"Z0",28,29,"  ",27,"Z",48+10,0
FaR:	dc.b 0
	even

******* ERREUR DANS LE SELECTEUR
L_FsError	equ	820
L820	move.l	FsSp(a5),sp
	Alea	MErreur,a0
	subq.w	#1,d0
	bmi.s	FsEr3
FsEr2:	tst.b	(a0)+
	bne.s	FsEr2
	dbra	d0,FsEr2
FsEr3:	move.l	a0,-(sp)
* Efface tout!
	Rbsr	L_FillFFree
	clr.w	FillFNb(a5)
	clr.w	FsPosF(a5)
	clr.b	FsIFlag+1(a5)
	bsr	FsAPath
	bsr	FsAffF
	bsr	FsSli
* Affiche le message
	move.l	(sp)+,a1
	bsr	FsMess
* Retourne a la boucle!
	bra	FsLoop

******* Effacement de l'ecran du selecteur
L_FsOut		equ	821
L821	movem.l	d0-d2/a0-a2,-(sp)
	tst.w	FsFlag(a5)
	beq.s	FsO1
* Fait disparaitre lentement
	move.l	FsAdEc(a5),a2
	move.w	FsDVApp(a5),d7
	neg.w	d7
	move.w	EcTY(a2),d6
	lsr.w	#1,d6
	move.w	FsDWY(a5),d5
	add.w	#(21*8)/2,d5
	Rbsr	L_AppCentre
* Enleve de la memoire
	EcCalD	Del,EcFSel
	clr.w	FsFlag(a5)
* Remet la souris
	lea	FsLimSave(a5),a0
	lea	T_MouXMin(a5),a1
	moveq	#3,d0
FsO0	move.w	(a0)+,(a1)+
	dbra	d0,FsO0
* A y est
FsO1:	movem.l	(sp)+,d0-d2/a0-a2
	rts
******* Apparition / disparition par le centre
*	A2= ecran
*	d7= vitesse
*	d6= WTy
*	d5= WY
L_AppCentre	equ	822
L822	move.w	d6,d4
	move.w	d6,EcAWTy(a2)
	add.w	d6,EcAWTy(a2)
	bset	#2,EcAWT(a2)
	move.w	EcTy(a2),d0
	lsr.w	#1,d0
	sub.w	d6,d0
	move.w	d0,EcAVY(a2)
	bset	#2,EcAV(a2)
	move.w	d5,EcAWy(a2)
	sub.w	d6,EcAWy(a2)
	bset	#2,EcAW(a2)
	movem.l	a2/d4-d7,-(sp)
	SyCall	WaitVBL
	EcCall	CopForce
	movem.l	(sp)+,a2/d4-d7
	add.w	d7,d6
	bpl.s	FsApp2
	clr.w	d6
FsApp2:	move.w	EcTy(a2),d0
	lsr.w	#1,d0
	cmp.w	d0,d6
	bcs.s	FsApp3
	move.w	d0,d6
FsApp3:	cmp.w	d4,d6
	bne.s	L822
	rts

*********************************************************************
*	Routine: ramene VRAI si D2 est une lettre ou un chiffre
L_Lettre	equ	823
L823	cmp.b	#"0",d2
	bcs.s	LFaux
	cmp.b	#"9",d2
	bls.s	LVrai
	cmp.b	#"A",d2
	bcs.s	LFaux
	cmp.b	#"Z",d2
	bls.s	LVrai
	cmp.b	#"a",d2
	bcs.s	LFaux
	cmp.b	#"z",d2
	bls.s	LVrai
	cmp.b	#128,d2
	bcc.s	LVrai
LFaux:	moveq	#0,d2
	rts
LVrai:	moveq	#-1,d2
	rts

*************************************************************************
*       	DEBUT PRINT H
L_HPrintD	equ	824
L824	Rbsr	L_GetFile
	tst.l	FhA(a2)
	Rbeq	L_FilNO
	btst	#0,FhT(a2)
	Rbeq	L_FilTM
	cmp.w	#1,d0
	Rbeq	L_FilTM
	move.l	a2,PrintFile(a5)
	rts

*************************************************************************
*       	IMPRESSION d'une chaine dans un fichier
L_HPrintS	equ	825
L825:	move.l 	(a3)+,a0
	moveq	#0,d3
	move.w	(a0)+,d3
	beq.s	L825x
	move.l	a0,d2
	move.l	PrintFile(a5),a0
	move.l	FhA(a0),d1
	DosCall	DosWrite
	cmp.l	d0,d3
	RBne	L_DiskError
L825x	move.l	Buffer(a5),a0
	rts

*************************************************************************
*		FIN IMPRESSION NORMALE dans un fichier
L_HPrintX	equ	826
L826	move.l	PrintFile(a5),a1
	move.l	FhA(a1),d1
	move.l	Buffer(a5),d2
	move.l	a0,d3
	sub.l	d2,d3
	DosCall DosWrite
	cmp.l	d0,d3
	Rbne	L_DiskError
	rts

*************************************************************************
*		ASKD3
L_AskD3		equ	827
L827	tst.l	d3
	Rbeq	L_FonCall
	Rbmi	L_FonCall
	Rbsr	L_Demande
	move.l	d3,d2
	move.l	a1,d3
	lea	2(a0,d2.w),a0
	btst	#0,d2
	beq.s	AskD
	addq.l	#1,a0
AskD:	move.l	a0,HiChaine(a5)
	move.l	a1,a0
	move.w	d2,(a1)+
	rts

***********************************************************
*	=INPUT$(n)
L_FInput1	equ	828
L828	move.l	(a3)+,d3
	Rbsr	L_AskD3
	tst.w	d2
	beq.s	FInp1b
FInp1a:	Rbsr	L_Tester
	movem.l	a1/d2/d3,-(sp)
	SyCall	Inkey
	movem.l	(sp)+,a1/d2/d3
	tst.l	d1
	beq.s	FInp1a
	cmp.b	#32,d1
	bcs.s	FInp1a
	move.b	d1,(a1)+
	subq.w	#1,d2
	bne.s	FInp1a
FInp1b:	move.l	d3,-(a3)
	rts

******* =INPUT$(#1,n)
L_FInput2	equ	829
L829	move.l	(a3)+,d3
	Rbsr	L_AskD3
	tst.w	d2
	beq.s	FInp2x
	Rbsr	L_GetFile
	Rbeq	L_FilNO
	btst	#1,FhT(a2)
	Rbeq	L_FilTM
	btst	#2,FhT(a2)
	beq.s	FInp2b
* Port E/S
FInp2a	Rbsr	L_GetByte
	move.b	d0,(a1)+
	subq.w	#1,d2
	bne.s	FInp2a
FInp2x	move.l	d3,-(a3)
	rts
* Disque
FInp2b 	move.l	d3,-(a3)
	addq.l	#2,d3
	exg	d2,d3
	DosCall	DosRead
	tst.l	d0
	Rbeq	L_EOFil
	Rbmi	L_DiskError
	rts

***********************************************************
* 	SET INPUT first,second
L_SInp		equ	830
L830	move.l	(a3)+,d1
	lsl.w	#8,d1
	move.l	(a3)+,d0
	cmp.l	#256,d0
	Rbcc	L_FonCall
	or.w	d1,d0
	move.w	d0,ChrInp(a5)
	rts

***********************************************************
* 	MENUS!


***********************************************************
*	BANK TO MENU TO BANK!

******* MENU TO BANK n
L_MnToBank	equ	831
L831
* Taille de l'arbre de menu
	move.l	MnBase(a5),d0
	Rbeq	L_FonCall
	sub.l	a1,a1
	bsr	MnLg
* Reserve la banque!
	move.l	a1,-(a3)
	pea	L831n(pc)
	clr.w	-(sp)
	move.w	#-1,-(sp)
	Rbsr	L_RsBk
	addq.l	#8,sp
* Recopie les objets
	move.l	MnBase(a5),a2
	movem.l	a3/a4,-(sp)
	move.l	a1,d3
	bsr	MnTb
	movem.l	(sp)+,a3/a4
	rts
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
L831n	dc.b	"Menu    "

******* BANK TO MENU n
L_BkToMenu	equ	832
L832	Rbsr	L_MnRaz
	tst.w	ScOn(a5)
	Rbeq	L_ScNOp
	move.l	(a3)+,d3
	Rbsr	L_BkAd
	move.l	a0,d3
	move.l	-8(a0),d0
	cmp.l	#"Menu",d0
	Rbne	L_FonCall
	moveq	#MnLong,d0
	Rbsr	L_RamFast2
	Rbeq	L_OOfMem
	move.l	d0,MnBase(a5)
	bsr	MnTMn
	move.l	ScOnAd(a5),MnAdEc(a5)
	addq.w	#1,MnChange(a5)
	rts
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
	Rbsr	L_RamFast2
	Rbeq	L_OOfMem
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
	Rbsr	L_RamFast2
	Rbeq	L_OOfMem
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
	Rbsr	L_RamFast2
	Rbeq	L_OofMem
	move.l	d0,(a0)
	move.l	d0,a0
	lsr.w	#1,d1
	subq.w	#1,d1
MnTmR1	move.w	(a1)+,(a0)+
	dbra	d1,MnTmR1
MnTmRX	rts

***********************************************************
*	GESTION MENU!
L_MnGere	equ	833
L833	movem.l	a0-a6/d0-d7,-(sp)
* Sauve les registres A3-A6
	clr.w	MnError(a5)
	move.l	a3,MnRA3(a5)
	move.l	a4,MnRA4(a5)
* Active l'ecran du menu!
	move.l	T_EcCourant(a5),a0
	move.w	EcNumber(a0),MnScOn(a5)
	move.l	MnAdEc(a5),d0
	Rbeq	L_ScNOp
	move.l	d0,a0
	move.w	EcNumber(a0),d1
	EcCall	Active
	Rbne	L_ScNOp
* Fixe les parametres par defaut
	EcCall	MnStart
* Va calculer les coordonnees
	tst.w	MnChange(a5)
	beq.s	MnGe0
	move.w	#-1,MnProc(a5)
	Rbsr	L_MnCalc
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
	Rbsr	L_MnBranch

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
	Rbsr	L_MnDraw
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
MnLp4	Rbsr	L_MnDEff
* Efface la case activee
	tst.w	MnZoAct(a5)
	beq.s	MnLp5
	movem.l	a2/d4/d5,-(sp)
	move.l	MnAct(a5),a2
	move.w	MnXX(a2),d4
	move.w	MnYY(a2),d5
	moveq	#0,d7
	Rbsr	L_MnDraw	
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
	Rbsr	L_MnDraw
* Dessine la collaterale?
	move.l	MnLat(a2),d0
	beq	MnLoop
	move.l	a2,(a6)+
	addq.w	#1,d6
	move.l	d0,a2
	Rbsr	L_MnBranch
	clr.w	MnZoAct(a5)
	bra	MnLoop

******* CLIQUE AVEC LE BOUTON GAUCHE
MnBGoch	
* En dehors?
	tst.w	d4
	beq	MnLoop
* Efface tout jusqu'a son niveau
	bsr	ZoToMn
	Rbsr	L_MnDEff
	tst.w	MnZoAct(a5)
	beq.s	MnMg1
	movem.l	a2/d4/d5,-(sp)
	move.l	MnAct(a5),a2
	move.w	MnXX(a2),d4
	move.w	MnYY(a2),d5
	moveq	#0,d7
	Rbsr	L_MnDraw	
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
	Rbsr	L_MnEBranch
* Redessine le nouveau!
	move.w	MnBaseX(a5),d4
	move.w	MnBaseY(a5),d5
	move.l	MnPrev(a2),d0
	beq.s	MnMgR4
	move.l	d0,a0
	move.w	MnXX(a0),d4
	move.w	MnYY(a0),d5
MnMgR4	Rbsr	L_MnBranch
* Ca y est!
MnMgX	movem.l	(sp)+,a3-a6/d4-d7
	bra	MnLoop
******* Initialisation dessin OUTLINE
MnMgI	move.l	T_RastPort(a5),a1
	moveq	#31,d0
	GfxC	SetAPen
	moveq	#0,d0
	GfxC	SetBPen
	clr.b	27(a1)
	moveq	#%11,d0
	GfxC	SetDrMd
	move.w	#$00FF,34(a1)
	rts
******* Remet dessin normal
MnMgF	move.l	T_RastPort(a5),a1
	moveq	#1,d0
	GfxC	SetDrMd
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
	GfxC	PolyDraw
	SyCall	WaitVbl
	movem.l	(sp)+,a0-a1/d0
	GfxC	PolyDraw
* Fait tourner la ligne
	rol.w	34(a1)
	rts
*******	Trouve l'adresse d'un zone
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
MnExX	Rbsr	L_MnEnd
	movem.l	(sp)+,d0-d7/a0-a6
	rts
******* Fin du menu avec erreur
MnErr:	Rbsr	L_MnEnd
	movem.l	(sp)+,d0-d7/a0-a6
	bclr	#BitJump,T_Actualise(a5)
	clr.w	MnChoice(a5)
	move.w	MnError(a5),d0
	Rbra	L_Error
******* Ramene l'etat de la souris
MnMousK	SyCall	MouseKey
	rts

***********************************************************
* 	Fin de la fin des menus
******* Ferme tout!	
L_MnEnd		equ	834
L834	tst.w	MnProc(a5)
	Rbmi	L_MnEnd1
* Trouve la fin de la table
	lea	MnTable(a5),a6
	moveq	#-1,d6
MnEnd0	addq.l	#1,d6
	tst.l	(a6)+
	bne.s	MnEnd0
	subq.l	#4,a6
* Efface les menus
	moveq	#0,d5			* Efface tous les menus
	Rbsr	L_MnDEff
	move.l	MnBase(a5),a2
	Rbsr	L_MnEBranch
	SyCall	AMALUFrz
	Rbra	L_MnEnd1
L_MnEnd1	equ	835
L835	moveq	#0,d1			* Efface toutes les zones
	SyCall	Reszone
	EcCall	MnStop			* Remet l'ecran
	move.w	MnScOn(a5),d1		* Reactive l'ecran courant
	EcCall	Active
	clr.w	MnProc(a5)		* Plus de procedure!
	rts

***********************************************************
*	Efface le menu---> niveau D5
L_MnDEff	equ	836
L836	movem.l	a2/d0-d2,-(sp)
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
	Rbsr	L_MnEBranch
	bra.s	MnDd1
* Fini
MnDdX:	movem.l	(sp)+,a2/d0-d2
	rts

******* Efface la branche A2
L_MnEBranch	equ	837
L837	movem.l	a2/d0/d1/d7,-(sp)
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
	Rbsr	L_MnRest
	Rbsr	L_MnSaDel
MnEBr3	cmp.l	d7,a2
	beq.s	MnEBr4
	move.l	MnPrev(a2),d0
	move.l	d0,a2
	bne.s	MnEBr2
MnEBr4	movem.l	(sp)+,a2/d0/d1/d7
	rts

L838

***********************************************************
*	CREATION / STOCKAGE

***************	MENU$(,,,)=
L_IMen1		equ	839
L839	move.l	#EntNul,d0
	move.l	d0,-(a3)
	move.l	d0,-(a3)
	move.l	d0,-(a3)
	RBra	L_IMen4
L_IMen2		equ	840
L840	move.l	#EntNul,d0
	move.l	d0,-(a3)
	move.l	d0,-(a3)
	RBra	L_IMen4
L_IMen3		equ	841
L841	move.l	#EntNul,-(a3)
	RBra	L_IMen4
L_IMen4		equ	842
L842	move.l	a3,-(sp)
	lea	4*4(a3),a3
	Rbsr	L_MnFind
	bne.s	IMenA
	move.l	a3,-(sp)
	exg	a0,a3
	bsr	MnIns
	move.l	(sp)+,a3
IMenA	move.l	(sp),d0
	move.l	a3,(sp)
	move.l	d0,a3
* Parametres par defaut
	move.l	ScOnAd(a5),a0
	cmp.l	MnAdEc(a5),a0
	beq.s	IMen6
	tst.l	MnAdEc(a5)
	Rbne	L_ScNOp
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
* Prend la chaine OBF
	lea	MnObF(a2),a0
	bsr	MnOob
* Prend la chaine OBOFF
	lea	MnOb3(a2),a0
	bsr	MnOob
* Prend la chaine OB2
	lea	MnOb2(a2),a0
	bsr	MnOob
* Prend la chaine OB1
	lea	MnOb1(a2),a0
	bsr	MnOob
* Ca y est!!!
IMenX:	addq.w	#1,MnChange(a5)
	move.l	(sp)+,a3
	rts
******* Petite routine de creation
MnOob	move.l	(a3)+,d3
	cmp.l	#EntNul,d3
	beq.s	MnOob0
	move.l	d3,a1
	tst.w	(a1)
	bne.s	MnOob1
* Efface la chaine
MnOobE	move.l	(a0),d0
	beq.s	MnOOb0
	move.l	d0,a1
	moveq	#0,d0
	move.w	(a1),d0
	Rbsr	L_RamFree
	clr.l	(a0)
MnOOb0	rts
* Une chaine!
MnOob1	move.l	a1,-(sp)	* Efface l'ancienne
	bsr.s	MnOobE
	move.l	(sp)+,a1
	bsr	MnObjet		* Cree la nouvelle
	Rbeq	L_OOfMem
	Rbmi	L_FonCall
	move.l	d0,(a0)
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
	Rbmi	L_FonCall
	move.l	MnLat(a2),d0
	bne.s	MnI1
	bra.s	MnI8
* Insere?
MnI3:	tst.w	d2
	Rbne	L_FonCall
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
	Rbne	L_FonCall
	bsr	MnRam
	move.l	a1,MnNext(a2)
	move.l	a2,MnPrev(a1)
	bra.s	MnIF
* Cree une collaterale
MnI8:	tst.w	d2
	Rbne	L_FonCall
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
	Rbsr	L_RamFast
	tst.l	d0
	Rbeq	L_OOfMem
	move.l	d0,a1
	rts
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
	Rbsr	L_RamFast2
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

***********************************************************
* 	MENU ON
L_MnOn		equ	843
L843	tst.l	MnBase(a5)
	beq.s	L843x
	bset	#BitMenu,ActuMask(a5)
	clr.l	T_ClLast(a5)
L843x	rts
******* MENU OFF
L_MnOff		equ	844
L844	bclr	#BitMenu,ActuMask(a5)
	rts
******* MENU DEL [(coordonnees,,)]
L_MnDl0		equ	845
L845	Rbra	L_MnRaz
L_MnDl1		equ	846
L846	Rbsr	L_MnDim
	move.l	a2,d0
	moveq	#0,d7
	addq.w	#1,MnChange(a5)
	Rbra	L_MnEff
******* MENU MOUSE ON/OFF
L_MnMOn		equ	847
L847	move.w	#1,MnMouse(a5)
	rts
L_MnMOf		equ	848
L848	clr.w	MnMouse(a5)
	rts
******* MENU BASE x,y
L_MnBs		equ	849
L849	move.l	MnBase(a5),d0
	Rbeq	L_MnNOp
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
Imnbs2	rts
******* SET MENU
L_SMen		equ	850
L850	Rbsr	L_MnDim
	move.l	#EntNul,d0
	move.l	(a3)+,d1
	cmp.l	d0,d1
	beq.s	ISmn1
	move.w	d1,MnY(a2)
	bset	#MnFixed,MnFlag(a2)
ISMn1	move.l	(a3)+,d1
	cmp.l	d0,d1
	beq.s	ISMn2
	move.w	d1,MnX(a2)
	bset	#MnFixed,MnFlag(a2)
ISMn2	rts
******* =MENU X(,,,)
L_XMen		equ	851
L851	Rbsr	L_MnDim
	moveq	#0,d3
	move.w	MnX(a2),d3
	move.l	d3,-(a3)
	rts
******* =MENU Y(,,,)
L_YMen		equ	852
L852	Rbsr	L_MnDim
	moveq	#0,d3
	move.w	MnY(a2),d3
	move.l	d3,-(a3)
	rts
******* =CHOICE(n)
L_FMen1		equ	853
L853	move.l	(a3)+,d3
	Rbls	L_FonCall
	cmp.l	#MnNDim,d3
	Rbhi	L_FonCall
	lsl.w	#1,d3
	lea	MnChoix(a5),a0
	move.w	-2(a0,d3.w),d3
	move.l	d3,-(a3)
	rts
L_FMen0		equ	854
L854	move.w	MnChoice(a5),d3
	clr.w	MnChoice(a5)
	ext.l	d3
	move.l	d3,-(a3)
	rts
******* Instructions flags
L_MnBa		equ	855
L855	Rbsr	L_MnDim
	bset	#MnBar,(a0)
	rts
L_MnLi		equ	856
L856	Rbsr	L_MnDim
	bclr	#MnBar,(a0)
	bclr	#MnTotal,(a0)
	rts
L_MnTl		equ	857
L857	Rbsr	L_MnDim
	bclr	#MnBar,(a0)
	bset	#MnTotal,(a0)
	rts
L_MnMv		equ	858
L858	Rbsr	L_MnDim
	bset	#MnTBouge,(a0)
	rts
L_MnSt		equ	859
L859	Rbsr	L_MnDim
	bclr	#MnTBouge,(a0)
	rts
L_MnIMv		equ	860
L860	Rbsr	L_MnDim
	bset	#MnBouge,(a0)
	rts
L_MnISt		equ	861
L861	Rbsr	L_MnDim
	bclr	#MnBouge,(a0)
	rts
L_MnAct		equ	862
L862	Rbsr	L_MnDim
	bclr	#MnOff,(a0)
	rts
L_MnInA		equ	863
L863	Rbsr	L_MnDim
	bset	#MnOff,(a0)
	rts
L_MnSep		equ	864
L864	Rbsr	L_MnDim
	bset	#MnSep,(a0)
	rts
L_MnLnk		equ	865
L865	Rbsr	L_MnDim
	bclr	#MnSep,(a0)
	rts
L_MnCl		equ	866
L866	Rbsr	L_MnDim
	move.b	#-1,MnFlag+1(a2)
	rts
L_MnNCl		equ	867
L867	Rbsr	L_MnDim
	clr.b	MnFlag+1(a2)
	rts

******* Routine-> adresse du flag
L_MnDim		equ	868
L868	tst.w	d7
	bne.s	MnDim1
	move.l	(a3)+,d3
	Rbeq	L_FonCall
	cmp.l	#MnNDim,d3
	Rbhi	L_FonCall
	lea	MnDFlags(a5),a0
	lea	-1(a0,d3.w),a0
	rts
* Cherche l'adresse D'UN objet
MnDim1	Rbsr	L_MnFind
	RBeq	L_MnINDef
	lea	MnFlag(a2),a0
	rts

L_MnINDef	equ	869
L869	moveq	#39,d0
	Rbra	L_Error

******* Trouve le menu (A3)++, verifie les params, profondeur D7
L_MnFind	equ	870
L870	move.w	d7,d2
	move.w	d2,d1
	lsl.w	#2,d1
	lea	0(a3,d1.w),a1
	move.l	(a3),d0
	Rbls	L_FonCall
	cmp.l	#1024,d0
	Rbcc	L_FonCall
	move.l	a3,a0
	move.l	a1,a3
	move.l	MnBase(a5),d0
	beq.s	MnFE
MnF1:	move.l	-(a1),d1
	Rbls	L_FonCall	
	cmp.l	#1024,d1
	Rbcc	L_FonCall
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

L871
L872

***********************************************************
*	MENU CALCULATE
L_MnCa		equ	873
L873	tst.l	MnBase(a5)
	Rbeq	L_MnNOp
* Active l'ecran du menu!
	move.l	T_EcCourant(a5),a0
	move.w	EcNumber(a0),MnScOn(a5)
	move.l	MnAdEc(a5),d0
	Rbeq	L_ScNOp
	move.l	d0,a0
	move.w	EcNumber(a0),d1
	EcCall	Active
	Rbne	L_ScNOp
	move.w	#-1,MnProc(a5)
	EcCall	MnStart
* Va calculer les coordonnees
	Rbsr	L_MnCalc
* Remet l'ecran
	RBra	L_MnEnd1

***********************************************************
*	Efface tous les menus
L_MnRaz		equ	874
L874	move.l	MnBase(a5),d0
	beq.s	MnRzX
	moveq	#1,d7
	Rbsr	L_MnEff
	bra.s	L874
MnRzX	clr.l	MnAdEc(a5)
	bclr	#BitMenu,ActuMask(a5)
	rts

******* Enleve l'objet a partir de (D0), et ses collaterales
L_MnEff		equ	875
L875	movem.l	a2/d0,-(sp)
MnEf0:	move.l	d0,a2
	move.l	MnLat(a2),d0
	beq.s	MnEf1
	addq.w	#1,d7
	bsr.s	L875
MnEf1:	move.l	MnNext(a2),d0
	Rbsr	L_MnDel
	tst.w	d7
	beq.s	MnEf2
	tst.l	d0
	bne.s	MnEf0
	subq.w	#1,d7
MnEf2:	movem.l	(sp)+,a2/d0
	rts

******* Enleve l'objet (A2)
L_MnDel		equ	876
L876	movem.l	a0-a2/d0-d2,-(sp)
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
	Rbsr	L_RamFree
MnD7:	move.l	MnOb1(a2),d0
	beq.s	MnD8
	move.l	d0,a1
	moveq	#0,d0
	move.w	(a1),d0
	Rbsr	L_RamFree
MnD8:	move.l	MnOb2(a2),d0
	beq.s	MnD9
	move.l	d0,a1
	moveq	#0,d0
	move.w	(a1),d0
	Rbsr	L_RamFree
* Libere la copie du fond ?!?!?
MnD9:	Rbsr	L_MnSaDel
* Memoire variables locales
	Rbsr	L_MnODVar
* Libere la memoire du menu
	move.l	a2,a1
	moveq	#MnLong,d0
	Rbsr	L_RamFree
	movem.l	(sp)+,a0-a2/d0-d2
	rts

***********************************************************
*	CALCULS

******* Calcule les positions de l'arbre
L_MnCalc	equ	877
L877	movem.l	d0-d7/a2,-(sp)
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
	Rbsr	L_MnDraw
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


***********************************************************

***********************************************************
*	DESSINS

******* Dessin d'une branche de l'arbre
*	FIXE LES ZONES!
*	A2=	Base a dessiner
*	D4/D5=	Coordonnee de base
L_MnBranch	equ	878
L878	movem.l a0-a2/d0-d7,-(sp)
* Sauve le fond
MnBrR	bsr	MnMaxi
	Rbsr	L_MnSave
* Dessine le tour, si pas dessine dans le premier objet
	tst.l	MnObF(a2)
	bne.s	MnBrO
	move.l	T_RastPort(a5),a1
	moveq	#0,d1			* Pattern VIDE!
	EcCall	Pattern
	bset	#4,33(a1)		* Outline
	move.w	#$FFFF,34(a1)		* Ligne pleine
	moveq	#0,d0
	move.b	MnInkB1(a2),d0		* Change les encres
	GfxC	SetAPen
	move.b	MnInkC1(a2),27(a1)
	moveq	#1,d0
	GfxC	SetDrMd
	move.w	d4,d0
	move.w	d5,d1
	move.w	d6,d2
	move.w	d7,d3
	subq.w	#1,d2
	subq.w	#1,d3
	GfxC	RectFill
* Dessine les objets
MnBrO	move.w	MnXX(a2),d4
	move.w	MnYY(a2),d5
	moveq	#0,d7			* Dessine
	bset	#29,d7
	Rbsr	L_MnDraw
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

******* Dessin / Calcul taille d'une case de menu (A2) - D4/D5
*	#31 de D7->	Dessin(0) / Calcule(1)
*	#30 de D7->	Inactif(0) / Actif(1)
*	#29 de D7->	PasFond(0) / Fond(1)
*	D4/D5	 -> 	Coordonnees
L_MnDraw	equ	879
L879	movem.l	d4-d7,-(sp)
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
	Rbsr	L_MnODraw
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
MnDr3:	Rbsr	L_MnODraw
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

******* Dessine un objet!
*	D1/D2/D3= Encres par default
*	D4/D5	= X/Y
*	Ramene:	D0/D1 -> Position curseur!
*	Ramene: D2/D3 -> Taille maxi!
L_MnODraw	equ	880
L880	movem.l	a0-a6/d4-d7,-(sp)
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
	Rbsr	L_AdIcon
	bra.s	MnObb0
******* BOB n
MnOBob	move.w	(a4)+,d1
	move.l	a2,a0
	movem.l	a2/d7,-(sp)
	Rbsr	L_AdBob
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
ObInkB	GfXC	SetBPen
	rts
* INK A
ObInkA	GfxC	SetAPen
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
ObWrite	GfxC	SetDrMd
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
MnGfx	movem.l	a0-a6/d1-d7,-(sp)
	move.w	a6,d6
	move.l	T_GfxBase(a5),a6
	jsr	0(a6,d6.w)
	movem.l	(sp)+,a0-a6/d1-d7
	rts
******* APPEL DE PROCEDURE!
MnOCall	movem.l	a1-a3/d6-d7,-(sp)
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
*	move.l	a4,d3			* ILLEGAL
*	add.w	(a4)+,a4
*	bsr	GLb3
*	beq.s	MnOcE
*	move.l	d0,a2
*	movem.l	a4-a6,-(sp)
*	move.l	MnRA3(a5),a3
*	move.l	MnRA4(a5),a4
*	sub.l	a6,a6
*	move.l	sp,MnPile(a5)
*	clr.w	-(sp)
*	bra	InProE
* Retour de la procedure
*MnRet	movem.l	(sp)+,a4-a6
*	movem.l	(sp)+,a1-a3/d6-d7
*	lea	CallReg(a5),a0
*	move.l	(a0),d4
*	move.l	4(a0),d5
*	sub.w	a2,d4
*	sub.w	a3,d5
*	rts
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
	Rbsr	L_MnODVar
	move.l	d1,d0
	Rbsr	L_RamFast
	beq.s	MnOR1
	move.l	d0,MnDatas(a2)
	move.w	d1,MnLData(a2)
MnOR1	move.l	(sp)+,a2
MnOR2	rts


******* Efface espace local
L_MnODVar	equ	881
L881	movem.l	d0/a1,-(sp)
	moveq	#0,d0
	move.w	MnLData(a2),d0
	beq.s	MnODV1
	move.l	MnDatas(a2),a1
	Rbsr	L_RamFree
	clr.w	MnLData(a2)
	clr.l	MnDatas(a2)
MnODV1	movem.l	(sp)+,d0/a1
	rts
	
******* Sauve le contenu du carre D4/D5/D6/D7
*	Base:	A2
L_MnSave	equ	882
L882	
* Efface l'ancien
	Rbsr	L_MnSaDel
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
	Rbsr	L_RamFast2
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
L_MnRest	equ	883
L883	movem.l	a0-a3/d0-d7,-(sp)
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
L_MnSaDel	equ	884
L884	move.l	MnAdSave(a2),d0
	beq.s	MnSad
	move.l	d0,a1
	move.l	(a1),d0
	Rbsr	L_RamFree
	clr.l	MnAdSave(a2)
MnSad:	rts

L885
L886

***********************************************************
*	EVERY n GOSUB / PROC
L_EvGosub	equ 	887
L887	clr.w	EveType(a5)
	RBra	L_Every
L_EvProc	equ	888
L888	move.w	#-1,EveType(a5)
	Rbra	L_Every
L_Every		equ	889
L889	bclr	#BitEvery,ActuMask(a5)
	move.l	a0,EveLabel(a5)
	move.l	(a3)+,d0
	Rbeq	L_FonCall
	cmp.l	#32767,d0
	Rbcc	L_FonCall
	move.w	d0,EveCharge(a5)
	move.w	d0,T_EveCpt(a5)
	bset	#BitEvery,ActuMask(a5)
	rts
******* EVERY OFF
L_EvOff		equ	890
L890	bclr	#BitEvery,ActuMask(a5)
	rts
******* EVERY ON
L_EvOn		equ	891
L891	bset	#BitEvery,ActuMask(a5)
	rts
******* Fait le branchement a EVERY
L_EveJump	equ	892
L892	tst.l	EveLabel(a5)
	bne.s	EveJ1
EveJ0	rts
* Branche!
EveJ1	bmi.s	EveJ0
	bclr	#BitEvery,d7
	move.w	d7,ActuMask(a5)
	move.l	LowPile(a5),sp
	move.l	EveLabel(a5),a0
	tst.w	EveType(a5)
	bne.s	EveJ2
* Gosub!
	move.l	a4,-(sp)
	move.l	sp,LowPile(a5)
	jmp	(a0)
* Procedure!
EveJ2	moveq	#0,d6
	move.l	a4,-(sp)
	jmp	(a0)

L893

***********************************************************
*		INTTOFLOAT 4(a3)
L_IntToFl2	equ	894
L894	move.l	a6,-(sp)
	move.l	FloatBase(a5),a6
	move.l	4(a3),d0
	jsr	SPFlt(a6)
	move.l	d0,4(a3)
	move.l	(sp)+,a6
	rts

*************************************************************************
*       	FLOATTOINT 4(a3)
L_FlToInt2	equ	895
L895	move.l	a6,-(sp)
	move.l	FloatBase(a5),a6
	move.l	4(a3),d0
	jsr	SPFix(a6)
	move.l	d0,4(a3)
	move.l	(sp)+,a6
	rts

*************************************************************************
*		CONVERSIONS FLOAT
; CONVERSION D'UN CHIFFRE FLOAT (d3) EN ASCII ---> (a0), 
L_strflasc	equ	896
L896 	bclr	#31,d4
	RBra	L_Flta
L_floatasc	equ	897
L897 	bset	#31,d4
	RBra	L_Flta
L_Flta		equ	898
L898	move.l 	d3,d0
	move.w	FixFlg(a5),d4
        move.w 	ExpFlg(a5),d5
; entree pour la tokenisation
 	movem.l	a1-a3,-(sp)
	move.l	a0,a3
	lea	DeFloat(a5),a0
	Rbsr	L_FlToAsc
	btst	#31,d4			* Met un espace si >0?
	bne.s	p00a
	move.b	#32,(a3)+
	cmp.b	#"-",(a0)
	bne.s	P00a
	subq.l	#1,a3
p00a:   tst 	d4
        bmi.s 	p0b
p0a:    move.b 	(a0)+,(a3)+  		* FIX: imprime tout defloat!
        bne.s 	p0a
        bra 	p7
p0b:    move.l 	a0,a2
p1:     move.b 	(a2)+,d0
        cmp.b 	#".",d0
        beq.s 	p1a
        move.b 	d0,(a3)+
        bne.s 	p1
        bra.s 	p7
p1a:    move.l 	a2,a1        	;a1= ancien non nul
        move.l 	a2,a0
p2:     move.b 	(a0)+,d0
        beq.s 	p3
        cmp.b 	#"E",d0
        beq.s 	p3
        cmp.b 	#"0",d0
        beq.s 	p2
        move.l 	a0,a1
        bra.s 	p2
p3:     subq.l 	#1,a0
        move.l 	a0,d0        	;adresse de la fin du chiffre
        cmp.l 	a2,a1         	;imprime les chiffres utiles
        beq.s 	p5
        move.b 	#".",(a3)+
p4:     move.b 	(a2)+,(a3)+
        cmp.l 	a2,a1
        bne.s 	p4
p5:     move.l 	d0,a2
        cmp.b 	#"E",(a2)
        bne.s 	p6
        move.b 	#32,(a3)+    	;imprime un espace avant le E
p6:     move.b 	(a2)+,(a3)+
        bne.s 	p6
p7:     lea	-1(a3),a0
	movem.l	(sp)+,a1-a3
        rts

*************************************************************************
*		ROUTINES FLOAT
L_FlRout	equ	899
L899	tst.w	d0
	bne	AtoF
*******	CONVERSION FLOAT ---> ASCII
ftoa	LINK	A6,#-8
	MOVEM.L	D3-d7,-(A7)
	MOVE.L	$C(A6),-4(A6)
	TST.W	$10(A6)
	BGT.S	L27CDA
	MOVEQ	#1,D0
	BRA.S	L27CEC
L27CDA	CMPI.W	#$16,$10(A6)
	BLE.S	L27CE6
	MOVEQ	#$17,D0
	BRA.S	L27CEC
L27CE6	MOVE.W	$10(A6),D0
	ADDQ.W	#1,D0
L27CEC	MOVE.W	D0,D4
	CLR.W	D7
	CLR.L	-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28232
	ADDQ.L	#8,A7
	BGE.S	L27D1C
	MOVEA.L	$C(A6),A0
	MOVE.B	#$2D,(A0)
	ADDQ.L	#1,$C(A6)
	MOVE.L	8(A6),-(A7)
	BSR	L283A8
	ADDQ.L	#4,A7
	MOVE.L	D0,8(A6)
L27D1C	CLR.L	-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28232
	ADDQ.L	#8,A7
	BLE.S	L27D5A
	BRA.S	L27D46
L27D2E	MOVE.L	#$A0000044,-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28388
	ADDQ.L	#8,A7
	MOVE.L	D0,8(A6)
	SUBQ.W	#1,D7
L27D46	MOVE.L	#$80000041,-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28232
	ADDQ.L	#8,A7
	BLT.S	L27D2E
L27D5A	BRA.S	L27D74
L27D5C	MOVE.L	#$A0000044,-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28250
	ADDQ.L	#8,A7
	MOVE.L	D0,8(A6)
	ADDQ.W	#1,D7
L27D74	MOVE.L	#$A0000044,-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28232
	ADDQ.L	#8,A7
	BGE.S	L27D5C
	ADD.W	D7,D4
	MOVEQ	#1,D6
	MOVE.W	D6,D0
	EXT.L	D0
	MOVE.L	D0,-(A7)
	BSR	L28270
	ADDQ.L	#4,A7
	MOVE.L	D0,-8(A6)
	BRA.S	L27DB8
L27DA0	MOVE.L	#$A0000044,-(A7)
	MOVE.L	-8(A6),-(A7)
	BSR	L28250
	ADDQ.L	#8,A7
	MOVE.L	D0,-8(A6)
	ADDQ.W	#1,D6
L27DB8	CMP.W	D4,D6
	BLT.S	L27DA0
	MOVE.L	#$80000042,-(A7)
	MOVE.L	-8(A6),-(A7)
	BSR	L28250
	ADDQ.L	#8,A7
	MOVE.L	D0,-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28212
	ADDQ.L	#8,A7
	MOVE.L	D0,8(A6)
	MOVE.L	#$A0000044,-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28232
	ADDQ.L	#8,A7
	BLT.S	L27DFE
	MOVE.L	#$80000041,8(A6)
	ADDQ.W	#1,D7
L27DFE	TST.W	D7
	BGE.S	L27E36
	MOVEA.L	$C(A6),A0
	MOVE.B	#$30,(A0)
	ADDQ.L	#1,$C(A6)
	MOVEA.L	$C(A6),A0
	MOVE.B	#$2E,(A0)
	ADDQ.L	#1,$C(A6)
	TST.W	D4
	BGE.S	L27E20
	SUB.W	D4,D7
L27E20	MOVEQ	#-1,D6
	BRA.S	L27E32
L27E24	MOVEA.L	$C(A6),A0
	MOVE.B	#$30,(A0)
	ADDQ.L	#1,$C(A6)
	SUBQ.W	#1,D6
L27E32	CMP.W	D7,D6
	BGT.S	L27E24
L27E36	CLR.W	D6
	BRA.S	L27EA4
L27E3A	MOVE.L	8(A6),-(A7)
	BSR	L28300
	ADDQ.L	#4,A7
	MOVE.W	D0,D5
	MOVE.W	D5,D0
	ADD.W	#$30,D0
	MOVEA.L	$C(A6),A1
	MOVE.B	D0,(A1)
	ADDQ.L	#1,$C(A6)
	CMP.W	D7,D6
	BNE.S	L27E68
	MOVEA.L	$C(A6),A0
	MOVE.B	#$2E,(A0)
	ADDQ.L	#1,$C(A6)
L27E68	MOVE.W	D5,D0
	EXT.L	D0
	MOVE.L	D0,-(A7)
	BSR	L28270
	ADDQ.L	#4,A7
	MOVE.L	D0,-8(A6)
	MOVE.L	D0,-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L283C4
	ADDQ.L	#8,A7
	MOVE.L	D0,8(A6)
	MOVE.L	#$A0000044,-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28388
	ADDQ.L	#8,A7
	MOVE.L	D0,8(A6)
	ADDQ.W	#1,D6
L27EA4	CMP.W	D4,D6
	BLT.S	L27E3A
	MOVEA.L	$C(A6),A0
	CLR.B	(A0)
	ADDQ.L	#1,$C(A6)
	MOVE.L	-4(A6),D0
	TST.L	(A7)+
	MOVEM.L	(A7)+,D4-D7
	UNLK	A6
	RTS
*******	Conversion ASCII---> FLOAT
Atof	LINK	A6,#-$2E
	MOVEM.L	D7/A4-A5,-(A7)
	LEA	-$14(A6),A5
	LEA	-$18(A6),A4
	CLR.W	-$1E(A6)
	CLR.W	-$26(A6)
	BRA.S	L27EDE
L27EDA	ADDQ.L	#1,8(A6)
L27EDE	MOVEA.L	8(A6),A0
	CMPI.B	#$20,(A0)
	BEQ.S	L27EDA
	MOVEA.L	8(A6),A0
	CMPI.B	#9,(A0)
	BEQ.S	L27EDA
	MOVEA.L	8(A6),A0
	CMPI.B	#$2D,(A0)
	BEQ.S	L27F00
	CLR.W	D0
	BRA.S	L27F02
L27F00	MOVEQ	#1,D0
L27F02	MOVE.W	D0,-$22(A6)
	MOVEA.L	8(A6),A0
	CMPI.B	#$2D,(A0)
	BEQ.S	L27F1A
	MOVEA.L	8(A6),A0
	CMPI.B	#$2B,(A0)
	BNE.S	L27F1E
L27F1A	ADDQ.L	#1,8(A6)
L27F1E	BRA.S	L27F44
L27F20	MOVEA.L	8(A6),A0
	CMPI.B	#$2E,(A0)
	BNE.S	L27F30
	ADDQ.W	#1,-$1E(A6)
	BRA.S	L27F40
L27F30	MOVEA.L	8(A6),A0
	MOVE.B	(A0),(A5)+
	TST.W	-$1E(A6)
	BEQ.S	L27F40
	ADDQ.W	#1,-$26(A6)
L27F40	ADDQ.L	#1,8(A6)
L27F44	MOVEA.L	8(A6),A0
	TST.B	(A0)
	BEQ.S	L27F60
	MOVEA.L	8(A6),A0
	CMPI.B	#$65,(A0)
	BEQ.S	L27F60
	MOVEA.L	8(A6),A0
	CMPI.B	#$45,(A0)
	BNE.S	L27F20
L27F60	CLR.B	(A5)
	MOVEA.L	8(A6),A0
	CMPI.B	#$65,(A0)
	BEQ.S	L27F76
	MOVEA.L	8(A6),A0
	CMPI.B	#$45,(A0)
	BNE.S	L27FBA
L27F76	ADDQ.L	#1,8(A6)
	MOVEA.L	8(A6),A0
	CMPI.B	#$2D,(A0)
	BEQ.S	L27F88
	CLR.W	D0
	BRA.S	L27F8A
L27F88	MOVEQ	#1,D0
L27F8A	MOVE.W	D0,-$20(A6)
	MOVEA.L	8(A6),A0
	CMPI.B	#$2D,(A0)
	BEQ.S	L27FA2
	MOVEA.L	8(A6),A0
	CMPI.B	#$2B,(A0)
	BNE.S	L27FA6
L27FA2	ADDQ.L	#1,8(A6)
L27FA6	BRA.S	L27FB2
L27FA8	MOVEA.L	8(A6),A0
	MOVE.B	(A0),(A4)+
	ADDQ.L	#1,8(A6)
L27FB2	MOVEA.L	8(A6),A0
	TST.B	(A0)
	BNE.S	L27FA8
L27FBA	CLR.B	(A4)
	MOVE.L	A6,(A7)
	ADDI.L	#$FFFFFFEC,(A7)
	BSR	L280A8
	MOVE.L	D0,-$2A(A6)
	MOVE.L	A6,(A7)
	ADDI.L	#$FFFFFFE8,(A7)
	BSR	L28654
	MOVE.W	D0,-$24(A6)
	TST.W	-$20(A6)
	BEQ.S	L27FF0
	MOVE.W	-$24(A6),D0
	NEG.W	D0
	SUB.W	-$26(A6),D0
	BRA.S	L27FF8
L27FF0	MOVE.W	-$24(A6),D0
	SUB.W	-$26(A6),D0
L27FF8	MOVE.W	D0,-$26(A6)
	MOVE.L	-$2A(A6),-(A7)
	MOVE.W	-$26(A6),-(A7)
	BSR.S	L28040
	ADDQ.L	#2,A7
	MOVE.L	D0,-(A7)
	BSR	L28388
	ADDQ.L	#8,A7
	MOVE.L	D0,-$2E(A6)
	MOVE.L	-$2E(A6),(A7)
	BSR	L28116
	MOVE.L	D0,-$1C(A6)
	TST.W	-$22(A6)
	BEQ.S	L28032
	ORI.L	#$80,-$1C(A6)
L28032	MOVE.L	-$1C(A6),D0
	TST.L	(A7)+
	MOVEM.L	(A7)+,A4-A5
	UNLK	A6
	RTS
L28040	LINK	A6,#-8
	TST.W	8(A6)
	BGE.S	L28076
	MOVE.L	#$80000041,-4(A6)
	BRA.S	L2806E
L28054	MOVE.L	#$A0000044,-(A7)
	MOVE.L	-4(A6),-(A7)
	BSR	L28250
	ADDQ.L	#8,A7
	MOVE.L	D0,-4(A6)
	ADDQ.W	#1,8(A6)
L2806E	TST.W	8(A6)
	BLT.S	L28054
	BRA.S	L280A0
L28076	MOVE.L	#$80000041,-4(A6)
	BRA.S	L2809A
L28080	MOVE.L	#$A0000044,-(A7)
	MOVE.L	-4(A6),-(A7)
	BSR	L28388
	ADDQ.L	#8,A7
	MOVE.L	D0,-4(A6)
	SUBQ.W	#1,8(A6)
L2809A	TST.W	8(A6)
	BGT.S	L28080
L280A0	MOVE.L	-4(A6),D0
	UNLK	A6
	RTS
L280A8	LINK	A6,#-8
	MOVE.L	#0,-4(A6)
	BRA.S	L280FA
L280B6	MOVE.L	#$A0000044,-(A7)
	MOVE.L	-4(A6),-(A7)
	BSR	L28388
	ADDQ.L	#8,A7
	MOVE.L	D0,-4(A6)
	MOVE.L	-4(A6),-(A7)
	MOVEA.L	8(A6),A0
	MOVE.B	(A0),D0
	EXT.W	D0
	ADD.W	#$FFD0,D0
	EXT.L	D0
	MOVE.L	D0,-(A7)
	BSR	L28270
	ADDQ.L	#4,A7
	MOVE.L	D0,-(A7)
	BSR	L28212
	ADDQ.L	#8,A7
	MOVE.L	D0,-4(A6)
	ADDQ.L	#1,8(A6)
L280FA	MOVEA.L	8(A6),A0
	CMPI.B	#$30,(A0)
	BLT.S	L2810E
	MOVEA.L	8(A6),A0
	CMPI.B	#$39,(A0)
	BLE.S	L280B6
L2810E	MOVE.L	-4(A6),D0
	UNLK	A6
	RTS
L28116	LINK	A6,#-4
	MOVEM.L	D4-D7,-(A7)
	CLR.L	-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28232
	ADDQ.L	#8,A7
	BNE.S	L28134
	CLR.L	D0
	BRA	L28208
L28134	CLR.L	-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28232
	ADDQ.L	#8,A7
	BGE.S	L28158
	MOVE.L	8(A6),-(A7)
	BSR	L283A8
	ADDQ.L	#4,A7
	MOVE.L	D0,8(A6)
	MOVEQ	#1,D5
	BRA.S	L2815A
L28158	CLR.W	D5
L2815A	CLR.W	D7
	BRA.S	L28176
L2815E	ADDQ.W	#1,D7
	MOVE.L	#$80000042,-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28250
	ADDQ.L	#8,A7
	MOVE.L	D0,8(A6)
L28176	MOVE.L	#$80000041,-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28232
	ADDQ.L	#8,A7
	BGE.S	L2815E
	BRA.S	L281A4
L2818C	SUBQ.W	#1,D7
	MOVE.L	#$80000042,-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28388
	ADDQ.L	#8,A7
	MOVE.L	D0,8(A6)
L281A4	MOVE.L	#$80000040,-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28232
	ADDQ.L	#8,A7
	BLT.S	L2818C
	MOVE.L	#$80000059,-(A7)
	MOVE.L	8(A6),-(A7)
	BSR	L28388
	ADDQ.L	#8,A7
	MOVE.L	D0,8(A6)
	MOVE.L	8(A6),-(A7)
	BSR	L28300
	ADDQ.L	#4,A7
	MOVE.L	D0,-4(A6)
	MOVE.L	-4(A6),D0
	ASL.L	#8,D0
	MOVE.L	D0,-4(A6)
	ADD.W	#$40,D7
	MOVE.W	D7,D0
	AND.W	#$7F,D0
	EXT.L	D0
	OR.L	D0,-4(A6)
	TST.W	D5
	BEQ.S	L28204
	ORI.L	#$80,-4(A6)
L28204	MOVE.L	-4(A6),D0
L28208	TST.L	(A7)+
	MOVEM.L	(A7)+,D5-D7
	UNLK	A6
	RTS
L28212	LINK	A6,#-4
	MOVEM.L	D3-D7,-(A7)
	MOVE.L	8(A6),D7
	MOVE.L	$C(A6),D6
	BSR	L28422
	MOVE.L	D7,D0
	MOVEM.L	(A7)+,D3-D7
	UNLK	A6
	RTS
L28232	LINK	A6,#-4
	MOVEM.L	D3-D7,-(A7)
	MOVE.L	8(A6),D7
	MOVE.L	$C(A6),D6
	BSR	L283E4
	MOVEM.L	(A7)+,D3-D7
	UNLK	A6
	RTS
L28250	LINK	A6,#-4
	MOVEM.L	D3-D7,-(A7)
	MOVE.L	8(A6),D7
	MOVE.L	$C(A6),D6
	BSR	L28518
	MOVE.L	D7,D0
	MOVEM.L	(A7)+,D3-D7
	UNLK	A6
	RTS
L28270	LINK	A6,#0
	MOVEM.L	D5-D7,-(A7)
	TST.L	8(A6)
	BGE.S	L2828C
	MOVEQ	#1,D6
	MOVE.L	8(A6),D0
	NEG.L	D0
	MOVE.L	D0,8(A6)
	BRA.S	L2828E
L2828C	CLR.W	D6
L2828E	TST.L	8(A6)
	BNE.S	L28298
	CLR.L	D0
	BRA.S	L282F6
L28298	MOVEQ	#$18,D7
	BRA.S	L282A8
L2829C	MOVE.L	8(A6),D0
	ASR.L	#1,D0
	MOVE.L	D0,8(A6)
	ADDQ.L	#1,D7
L282A8	MOVE.L	8(A6),D0
	AND.L	#$7F000000,D0
	BNE.S	L2829C
	BRA.S	L282C2
L282B6	MOVE.L	8(A6),D0
	ASL.L	#1,D0
	MOVE.L	D0,8(A6)
	SUBQ.L	#1,D7
L282C2	BTST	#7,9(A6)
	BEQ.S	L282B6
	MOVE.L	8(A6),D0
	ASL.L	#8,D0
	MOVE.L	D0,8(A6)
	ADD.L	#$40,D7
	MOVE.L	D7,D0
	AND.L	#$7F,D0
	OR.L	D0,8(A6)
	TST.W	D6
	BEQ.S	L282F2
	ORI.L	#$80,8(A6)
L282F2	MOVE.L	8(A6),D0
L282F6	TST.L	(A7)+
	MOVEM.L	(A7)+,D6-D7
	UNLK	A6
	RTS
L28300	LINK	A6,#0
	MOVEM.L	D4-D7,-(A7)
	MOVE.L	8(A6),D0
	AND.L	#$7F,D0
	ADD.L	#$FFFFFFC0,D0
	MOVE.W	D0,D6
	TST.L	8(A6)
	BEQ.S	L28324
	TST.W	D6
	BGE.S	L28328
L28324	CLR.L	D0
	BRA.S	L2837E
L28328	MOVE.L	8(A6),D0
	AND.L	#$80,D0
	MOVE.W	D0,D5
	CMP.W	#$1F,D6
	BLE.S	L2834E
	TST.W	D5
	BEQ.S	L28346
	MOVE.L	#$80000000,D0
	BRA.S	L2834C
L28346	MOVE.L	#$7FFFFFFF,D0
L2834C	BRA.S	L2837E
L2834E	MOVE.L	8(A6),D7
	ASR.L	#8,D7
	AND.L	#$FFFFFF,D7
	SUB.W	#$18,D6
	BRA.S	L28364
L28360	ASR.L	#1,D7
	ADDQ.W	#1,D6
L28364	TST.W	D6
	BLT.S	L28360
	BRA.S	L2836E
L2836A	ASL.L	#1,D7
	SUBQ.W	#1,D6
L2836E	TST.W	D6
	BGT.S	L2836A
	TST.W	D5
	BEQ.S	L2837C
	MOVE.L	D7,D0
	NEG.L	D0
	MOVE.L	D0,D7
L2837C	MOVE.L	D7,D0
L2837E	TST.L	(A7)+
	MOVEM.L	(A7)+,D5-D7
	UNLK	A6
	RTS
L28388	LINK	A6,#-4
	MOVEM.L	D3-D7,-(A7)
	MOVE.L	8(A6),D7
	MOVE.L	$C(A6),D6
	BSR	L2858A
	MOVE.L	D7,D0
	MOVEM.L	(A7)+,D3-D7
	UNLK	A6
	RTS
L283A8	LINK	A6,#-4
	MOVEM.L	D3-D7,-(A7)
	MOVE.L	8(A6),D7
	BSR	L28406
	MOVE.L	D7,D0
	MOVEM.L	(A7)+,D3-D7
	UNLK	A6
	RTS
L283C4	LINK	A6,#-4
	MOVEM.L	D3-D7,-(A7)
	MOVE.L	8(A6),D7
	MOVE.L	$C(A6),D6
	BSR	L28410
	MOVE.L	D7,D0
	MOVEM.L	(A7)+,D3-D7
	UNLK	A6
	RTS
L283E4	TST.B	D6
	BPL.S	L283F4
	TST.B	D7
	BPL.S	L283F4
	CMP.B	D7,D6
	BNE.S	L283FA
	CMP.L	D7,D6
	RTS
L283F4	CMP.B	D6,D7
	BNE.S	L283FA
	CMP.L	D6,D7
L283FA	RTS
	TST.B	D7
	RTS
	AND.B	#$7F,D7
	RTS
L28406	TST.B	D7
	BEQ.S	L2840E
	EORI.B	#$80,D7
L2840E	RTS
L28410	MOVE.B	D6,D4
	BEQ.S	L28466
	EORI.B	#$80,D4
	BMI.S	L28484
	MOVE.B	D7,D5
	BMI.S	L2848A
	BNE.S	L2842E
	BRA.S	L28460
L28422	MOVE.B	D6,D4
	BMI.S	L28484
	BEQ.S	L28466
	MOVE.B	D7,D5
	BMI.S	L2848A
	BEQ.S	L28460
L2842E	SUB.B	D4,D5
	BMI.S	L2846A
	MOVE.B	D7,D4
	CMP.B	#$18,D5
	BCC.S	L28466
	MOVE.L	D6,D3
	CLR.B	D3
	LSR.L	D5,D3
	MOVE.B	#$80,D7
	ADD.L	D3,D7
	BCS.S	L2844C
L28448	MOVE.B	D4,D7
	RTS
L2844C	ROXR.L	#1,D7
	ADDQ.B	#1,D4
	BVS.S	L28454
	BCC.S	L28448
L28454	MOVEQ	#-1,D7
	SUBQ.B	#1,D4
	MOVE.B	D4,D7
	ORI.B	#2,CCR
	RTS
L28460	MOVE.L	D6,D7
	MOVE.B	D4,D7
	RTS
L28466	TST.B	D7
	RTS
L2846A	CMP.B	#$E8,D5
	BLE.S	L28460
	NEG.B	D5
	MOVE.L	D6,D3
	CLR.B	D7
	LSR.L	D5,D7
	MOVE.B	#$80,D3
	ADD.L	D3,D7
	BCS.S	L2844C
	MOVE.B	D4,D7
	RTS
L28484	MOVE.B	D7,D5
	BMI.S	L2842E
	BEQ.S	L28460
L2848A	MOVEQ	#-$80,D3
	EOR.B	D3,D5
	SUB.B	D4,D5
	BEQ.S	L284E2
	BMI.S	L284D0
	CMP.B	#$18,D5
	BCC.S	L28466
	MOVE.B	D7,D4
	MOVE.B	D3,D7
	MOVE.L	D6,D3
L284A0	CLR.B	D3
	LSR.L	D5,D3
	SUB.L	D3,D7
	BMI.S	L28448
L284A8	MOVE.B	D4,D5
L284AA	CLR.B	D7
	SUBQ.B	#1,D4
	CMP.L	#$7FFF,D7
	BHI.S	L284BC
	SWAP	D7
	SUB.B	#$10,D4
L284BC	ADD.L	D7,D7
	DBMI	D4,L284BC
	EOR.B	D4,D5
	BMI.S	L284CC
	MOVE.B	D4,D7
	BEQ.S	L284CC
	RTS
L284CC	MOVEQ	#0,D7
	RTS
L284D0	CMP.B	#$E8,D5
	BLE.S	L28460
	NEG.B	D5
	MOVE.L	D7,D3
	MOVE.L	D6,D7
	MOVE.B	#$80,D7
	BRA.S	L284A0
L284E2	MOVE.B	D7,D5
	EXG	D5,D4
	MOVE.B	D6,D7
	SUB.L	D6,D7
	BEQ.S	L284CC
	BPL.S	L284A8
	NEG.L	D7
	MOVE.B	D5,D4
	BRA.S	L284AA
L284F4	DIVU	#0,D7
	TST.L	D6
	BNE.S	L28518
L284FC	OR.L	#$FFFFFF7F,D7
	TST.B	D7
	ORI.B	#2,CCR
L28508	RTS
L2850A	SWAP	D6
	SWAP	D7
L2850E	EOR.B	D6,D7
	BRA.S	L284FC
L28512	BMI.S	L2850E
L28514	MOVEQ	#0,D7
	RTS
L28518	MOVE.B	D6,D5
	BEQ.S	L284F4
	MOVE.L	D7,D4
	BEQ.S	L28508
	MOVEQ	#-$80,D3
	ADD.W	D5,D5
	ADD.W	D4,D4
	EOR.B	D3,D5
	EOR.B	D3,D4
	SUB.B	D5,D4
	BVS.S	L28512
	CLR.B	D7
	SWAP	D7
	SWAP	D6
	CMP.W	D6,D7
	BMI.S	L2853E
	ADDQ.B	#2,D4
	BVS.S	L2850A
	ROR.L	#1,D7
L2853E	SWAP	D7
	MOVE.B	D3,D5
	EOR.W	D5,D4
	LSR.W	#1,D4
	MOVE.L	D7,D3
	DIVU	D6,D3
	MOVE.W	D3,D5
	MULU	D6,D3
	SUB.L	D3,D7
	SWAP	D7
	SWAP	D6
	MOVE.W	D6,D3
	CLR.B	D3
	MULU	D5,D3
	SUB.L	D3,D7
	BCC.S	L28566
	MOVE.L	D6,D3
	CLR.B	D3
	ADD.L	D3,D7
	SUBQ.W	#1,D5
L28566	MOVE.L	D6,D3
	SWAP	D3
	CLR.W	D7
	DIVU	D3,D7
	SWAP	D5
	BMI.S	L2857A
	MOVE.W	D7,D5
	ADD.L	D5,D5
	SUBQ.B	#1,D4
	MOVE.W	D5,D7
L2857A	MOVE.W	D7,D5
	ADD.L	#$80,D5
	MOVE.L	D5,D7
	MOVE.B	D4,D7
	BEQ.S	L28514
	RTS
L2858A	MOVE.B	D7,D5
	BEQ.S	L285E0
	MOVE.B	D6,D4
	BEQ.S	L285FA
	ADD.W	D5,D5
	ADD.W	D4,D4
	MOVEQ	#-$80,D3
	EOR.B	D3,D4
	EOR.B	D3,D5
	ADD.B	D4,D5
	BVS.S	L285FE
	MOVE.B	D3,D4
	EOR.W	D4,D5
	ROR.W	#1,D5
	SWAP	D5
	MOVE.W	D6,D5
	CLR.B	D7
	CLR.B	D5
	MOVE.W	D5,D4
	MULU	D7,D4
	SWAP	D4
	MOVE.L	D7,D3
	SWAP	D3
	MULU	D5,D3
	ADD.L	D3,D4
	SWAP	D6
	MOVE.L	D6,D3
	MULU	D7,D3
	ADD.L	D3,D4
	CLR.W	D4
	ADDX.B	D4,D4
	SWAP	D4
	SWAP	D7
	MULU	D6,D7
	SWAP	D6
	SWAP	D5
	ADD.L	D4,D7
	BPL.S	L285E2
	ADD.L	#$80,D7
	MOVE.B	D5,D7
	BEQ.S	L285FA
L285E0	RTS
L285E2	SUBQ.B	#1,D5
	BVS.S	L285FA
	BCS.S	L285FA
	MOVEQ	#$40,D4
	ADD.L	D4,D7
	ADD.L	D7,D7
	BCC.S	L285F4
	ROXR.L	#1,D7
	ADDQ.B	#1,D5
L285F4	MOVE.B	D5,D7
	BEQ.S	L285FA
	RTS
L285FA	MOVEQ	#0,D7
	RTS
L285FE	BPL.S	L285FA
	EOR.B	D6,D7
	OR.L	#$FFFFFF7F,D7
	TST.B	D7
	ORI.B	#2,CCR
	RTS

L28654	LINK	A6,#0
	MOVEM.L	D5-D7/A5,-(A7)
	MOVEA.L	8(A6),A5
	CLR.W	D7
	CLR.W	D6
	BRA.S	L28668
L28666	ADDQ.L	#1,A5
L28668	MOVE.B	(A5),D0
	EXT.W	D0
	EXT.L	D0
	ADD.L	#0,D0
	MOVEA.L	D0,A0
;	BTST	#5,(A0)
;	BNE.S	L28666
	CMPI.B	#$2B,(A5)
	BNE.S	L28686
	ADDQ.L	#1,A5
	BRA.S	L28690
L28686	CMPI.B	#$2D,(A5)
	BNE.S	L28690
	ADDQ.L	#1,A5
	ADDQ.W	#1,D6
L28690	BRA.S	L286A0
L28692	MULS	#$A,D7
	MOVE.B	(A5)+,D0
	EXT.W	D0
L2869A	ADD.W	D0,D7
L2869C	ADD.W	#$FFD0,D7
L286A0	CMPI.B	#$30,(A5)
L286A4	BLT.S	L286AC
	CMPI.B	#$39,(A5)
	BLE.S	L28692
L286AC	TST.W	D6
	BEQ.S	L286B6
	MOVE.W	D7,D0
	NEG.W	D0
	MOVE.W	D0,D7
L286B6	MOVE.W	D7,D0
	TST.L	(A7)+
	MOVEM.L	(A7)+,D6-D7/A5
	UNLK	A6
	RTS

***********************************************************
*	FAUX FLOAT si pas FLOAT!
L_FoFloat	equ	900
L900	rts

***********************************************************
*	FONCTIONS MATH!

******* MAX
L_MaxE		equ	901
L901	move.l	(a3)+,d0
	cmp.l	(a3),d0
	ble.s	L901a
	move.l	d0,(a3)
L901a	rts
L_MaxF		equ	902
L902    move.l	a6,-(sp)
	move.l	(a3)+,d1
	move.l	(a3),d0
	move.l	FloatBase(a5),a6
	jsr	SPCmp(a6)
	move.l	(sp)+,a6
	bge.s	L902a
	move.l	-4(a3),(a3)
L902a	rts
L_MaxC		equ	903
L903	RBsr	L_CompCh
	cmp.l	d3,d6
	bge.s	L903a
	move.l	-8(a3),-4(a3)
L903a	subq.l	#4,a3
	rts
******* MIN
L_MinE		equ	904
L904	move.l	(a3)+,d0
	cmp.l	(a3),d0
	bge.s	L904a
	move.l	d0,(a3)
L904a	rts
L_MinF		equ	905
L905    move.l	a6,-(sp)
	move.l	(a3)+,d1
	move.l	(a3),d0
	move.l	FloatBase(a5),a6
	jsr	SPCmp(a6)
	move.l	(sp)+,a6
	ble.s	L905a
	move.l	-4(a3),(a3)
L905a	rts
L_MinC		equ	906
L906	RBsr	L_CompCh
	cmp.l	d3,d6
	ble.s	L906a
	move.l	-8(a3),-4(a3)
L906a	subq.l	#4,a3
	rts

******* ABS
L_AbsE		equ	907
L907	tst.l	(a3)
	bpl.s	L907a
	neg.l	(a3)
L907a	rts
* Float
L_AbsF		equ	908
L908	moveq	#SPAbs,d2
	Rbra	L_FlOpe

L909

******* INT
L_IntF		equ	910
L910	moveq	#SpFloor,d2
	Rbra	L_FlOpe

******* =SGN
L_SgnE		equ	911
L911	tst.l	(a3)
	beq.s	L911b
	bpl.s	L911a
	move.l	#-1,(a3)
	rts
L911a	move.l	#1,(a3)
L911b	rts
L_SgnF		equ	912
L912	move.l	a6,-(sp)
	move.l	FloatBase(a5),a6
	move.l	(a3),d1
	jsr	SPTst(a6)
	move.l	(sp)+,a6
	move.l	d0,(a3)
	rts

******* RADIUS
L_Rad		equ	913
L913	clr.w	Angle(a5)
	rts

******* DEGREE
L_Deg		equ	914
L914	move.w	#-1,Angle(a5)
	rts

******* =PI
L_Pi		equ	915
L915	move.l	ValPi(a5),-(a3)
	rts

******* SQR
L_Sqr		equ	916
L916	Rbsr	L_FlPos
	moveq	#SPSqrt,d2
	Rbra	L_FMope

******* LOG
L_Log		equ	917
L917	Rbsr	L_FlPos
	moveq	#SPLog10,d2
	Rbra	L_Fmope

******* LN
L_Ln		equ	918
L918	Rbsr	L_FlPos
	moveq	#SPLog,d2
	Rbra	L_Fmope

******* EXP
L_Exp		equ	919
L919	moveq	#SPExp,d2
	Rbra	L_Fmope

******* SIN
L_Sin		equ	920
L920	Rbsr	L_Angle
	moveq	#SPSin,d2
	Rbra	L_Fmope

******* COS
L_Cos		equ	921
L921	Rbsr	L_Angle
	moveq	#SPCos,d2
	Rbra	L_Fmope

******* TAN
L_Tan		equ	922
L922	Rbsr	L_Angle
	move.l	(a3),d0
	move.l	a6,-(sp)
	move.l	MathBase(a5),a6
	jsr	SPTan(a6)
	move.l	(sp)+,a6
	move.l	d0,(a3)
	cmp.l	#$FFFFFF7F,d0
	Rbeq	L_Overflow
	rts

******* ASIN
L_ASin		equ	923
L923	moveq	#SPASin,d2
	RBra	L_AAngle
******* ACOS
L_ACos		equ	924
L924	moveq	#SPACos,d2
	Rbra	L_AAngle
******* ATAN
L_ATan		equ	925
L925	moveq	#SPATan,d2
	Rbra	L_AAngle
******* HSIN
L_HSin		equ	926
L926	RBsr	L_Angle
	moveq	#SPSinH,d2
	Rbra	L_Fmope
******* HCOS
L_HCos		equ	927
L927	Rbsr	L_Angle
	moveq	#SPCosH,d2
	Rbra	L_Fmope
******* HTAN
L_HTan		equ	928
L928	Rbsr	L_Angle
	moveq	#SPTanH,d2
	Rbra	L_Fmope

******* FIX le nombre de decimales
L_Fix		equ	929
L929	move.l	(a3)+,d3
        bmi.s 	ifx2 
        clr 	ExpFlg(a5)
ifx0:   cmp.l 	#16,d3
        bcs.s 	ifx1
        move 	#-1,d3
ifx1:   move 	d3,FixFlg(a5)
	rts
ifx2:   neg.l 	d3
        move.w 	#1,ExpFlg(a5)
        bra.s 	ifx0

* Routines
L_FlOpe		equ	930
L930	move.l	a6,-(sp)
	move.l	(a3),d0
	move.l	FloatBase(a5),a6
	jsr	0(a6,d2.w)
	move.l	d0,(a3)
	move.l	(sp)+,a6
	rts
L_FMOpe		equ	931
L931	move.l	a6,-(sp)
	move.l	(a3),d0
	move.l	MathBase(a5),a6
	jsr	0(a6,d2.w)
	move.l	d0,(a3)
	move.l	(sp)+,a6
	rts
* Verifie que le float est positif!
L_FlPos		equ	932
L932	move.l	a6,-(sp)
	move.l	(a3),d1
	move.l	FloatBase(a5),a6
	jsr	SPTst(a6)
	move.l	(sp)+,a6
	Rbmi	L_FonCall
	rts
* Ramene un ANGLE
L_Angle		equ	933
L933	move.l	(a3),d0
	tst.w	Angle(a5)
	beq.s	FAnX
* Conversion--> radian
	move.l	a6,-(sp)
	move.l	FloatBase(a5),a6
	move.l	Val180(a5),d1
	jsr	SPDiv(a6)
	move.l	ValPi(a5),d1
	jsr	SPMul(a6)
	move.l	d0,(a3)
	move.l	(sp)+,a6
FAnX	rts
* Retourne un angle
L_AAngle	equ	934
L934	move.l	a6,-(sp)
	move.l	(a3),d0
	move.l	MathBase(a5),a6
	jsr	0(a6,d2.w)
* Converti en degres?
	tst.w	Angle(a5)
	beq.s	AAnX
	move.l	FloatBase(a5),a6
	move.l	ValPi(a5),d1
	jsr	SPDiv(a6)
	move.l	Val180(a5),d1
	jsr	SPMul(a6)
AAnX:	move.l	(sp)+,a6
	move.l	d0,(a3)
	rts

*********************************************************************
*		 Multiplication 32 Bits non signee D6*D3 -> D1
L_Mul32		equ	935
L935	move 	d6,d1
        mulu 	d3,d1
        swap 	d6
        move 	d6,d0
        mulu 	d3,d0
        swap 	d0
        add.l 	d0,d1
        swap 	d3
        move 	d6,d0
        mulu 	d3,d0
        swap 	d6
        move 	d6,d0
        mulu 	d3,d0
        swap 	d0
        add.l 	d0,d1
	rts

***********************************************************
*	HASARD

*******	=RND(n)
L_Rnd		equ	936
L936	move.l	(a3),d3
	bne.s	Rnd1
* Ramene le dernier
	move.l	OldRnd(a5),(a3)
	rts
* Calcule!
Rnd1	moveq	#0,d7
	move.l	d3,d5
	bmi.s	Rnd0
	moveq	#-1,d7
	bra.s	Rnd0a
Rnd0	neg.l	d5
Rnd0a	move.l	#$FFFFFF,d4
	moveq	#23,d0
Rnd2	lsr.l	#1,d4
	cmp.l	d5,d4
	dbcs	d0,rnd2
	roxl.l	#1,d4
Rnd4	Rbsr	L_RRnd
	move.w	$dff006,d0
	and.w	d7,d0
	add.w	d0,d1
	and.l	d4,d1
	cmp.l	d5,d1
	bhi.s	Rnd4
	move.l	d1,OldRnd(a5)
	move.l	d1,(a3)
	rts

******* RANDOMIZE n
L_Random	equ	937
L937	move.l	(a3)+,Seed(a5)
	rts

******* RND
L_RRnd		equ	938
L938	move.l 	Seed(a5),d3
	move.l	#$bb40e62d,d6
	Rbsr	L_Mul32
	addq.l	#1,d1
	move.l	d1,Seed(a5)
	lsr.l	#8,d1
	rts

***********************************************************
*		ADD	Var,Val,Min To Max
L_Add4		equ	939
L939	move.l	(a0),d0
	move.l	(a3)+,d2
	move.l	(a3)+,d1
	add.l	(a3)+,d0
	cmp.l	d1,d0
	blt.s	IAdd4m
	cmp.l	d2,d0
	bgt.s	IAdd4p
	move.l	d0,(a0)
	rts
IAdd4m:	move.l	d2,(a0)
	rts
IAdd4p:	move.l	d1,(a0)
	rts

***********************************************************
*		=LACED
L_Laced		equ	940
L940	move.l	#4,-(a3)
	rts

***********************************************************
*		BREAK ON/OFF
L_BreakOn	equ	941
L941	bset	#BitControl,ActuMask(a5)
	rts
L_BreakOff	equ	942
L942	bclr	#BitControl,ActuMask(a5)
	rts

***********************************************************
*		STOP
L_Stop		equ	943
L943	moveq	#9,d0
	RBra	L_Error

***********************************************************
*		END
L_End		equ	944
L944	moveq	#NbEnd,d0
	RBra	L_Error

***********************************************************
*		DIRECT
L_Direct	equ	945
ErrDir		equ	255
L945	move.w	#ErrDir,d0
	Rbra	L_Error

***********************************************************
*		EDIT
L_Edit		equ	946
L946	moveq	#NbEnd,d0
	Rbra	L_Error

***********************************************************
*		SYSTEM
L_System	equ	947
L947	tst.w	T_AMOState(a5)
	Rbmi	L_End
	move.l	T_CompJmp(a5),a0
	jmp	16(a0)

***********************************************************
*		=TIMER
L_Timer		equ	948
L948	move.l	(a3)+,T_VBLTimer(a5)
	rts
L949	move.l	T_VBLTimer(a5),-(a3)
	rts

***********************************************************
*		DEFAULT
L_Default	equ	950
L950	move.w	#-1,DefFlag(a5)
	Rbsr	L_DefRun
	EcCall	CopForce
	rts

***********************************************************
*		MULTI WAIT
L_Multi		equ	951
L951	Rbsr	L_WaitMul
	Rbra	L_Tests
L_WaitMul	equ	952
L952	movem.l	a0/a1/a6/d0/d1,-(sp)
	SyCall	Test_Cyclique
	move.l	T_GfxBase(a5),a6
	jsr	-270(a6)
	movem.l	(sp)+,a0/a1/a6/d0/d1
	rts


***********************************************************
*	WAIT n
L_Wait		equ	953
L953	move.l	(a3)+,d3
	beq.s	IWtB
	add.l	T_VBLCount(a5),d3
IWt1	cmp.l	T_VBLCount(a5),d3
	bls.s	IWt2
	move.l	d3,-(sp)
	Rbsr	L_Tests
	move.l	(sp)+,d3
	bra.s	IWt1
IWt2	rts
IWtB	
	IFNE	CDebug
	SyCall	MouseKey
	btst	#1,d1
	beq.s	IWt3
	EcCalD	AMOS_WB,0
	illegal
	ENDC

IWt3	rts

***********************************************************
*		SWAP
L_Swap		equ	954
L954	move.l	(a3)+,a1
	move.l	(a0),d0
	move.l	(a1),(a0)
	move.l	d0,(a1)
	rts

***********************************************************
*		=FN
L_FN		equ	955
L955	move.l	(a0),d1
	RBeq	L_FnNdef
	move.l	d1,a2
	move.w	d0,-(sp)
	beq.s	L955e
L955a	jsr	(a2)
	cmp.w	(a3)+,d2
	beq.s	L955d
	move.l	a0,-(sp)
	tst.b	d2
	bne.s	L955b
	RBsr	L_FlToInt
	bra.s	L955c
L955b	RBsr	L_IntToFl
L955c	move.l	(sp)+,a0
L955d	move.l	(a3)+,(a0)
	subq.w	#1,(sp)
	bne.s	L955a
L955e	addq.l	#2,sp
	jmp	(a2)

***********************************************************
*	WAIT pour extensions
L_WaitRout	equ	956
L956	bset	#7,EveLabel(a5)
	add.l	T_VBLCount(a5),d3
IWr2	cmp.l	T_VBLCount(a5),d3
	bls.s	IWr3
	move.l	d3,-(sp)
	Rbsr	L_Tests
	move.l	(sp)+,d3
	bra.s	IWr2
IWr3	bclr	#7,EveLabel(a5)
	rts

***********************************************************
*		ROUTINE SORT/FIND
L_GTablo	equ	957
L957	move.l	(a0),d0
	Rbeq	L_NDim
	move.l	d0,a0
	move.w	(a0)+,d0
	moveq	#0,d1
	moveq	#1,d6
L957a	addq.l	#4,a3
	move.w	(a0)+,d1
	addq.w	#1,d1
	mulu	d1,d6
	addq.l	#2,a0
	subq.w	#1,d0
	bne.s	L957a
	move.l	a0,a1
	moveq	#2,d7
	rts
 
******* COMPARAISON
L_Cpbis		equ	958
L958	move.b	d2,d0
	subq.b	#1,d0
	bmi.s 	egb1
	bne.s	egb0
* Float
	move.l	a6,-(sp)
	move.l	d3,d1
	move.l	d6,d0
	move.l	FloatBase(a5),a6
	jsr	SPCmp(a6)
	move.l	(sp)+,a6
	rts
* Chaines
egb0	move.l	d6,-(a3)
	move.l	d3,-(a3)
	Rbsr 	L_compch
* Entier
egb1	cmp.l 	d3,d6
	rts

******* SORT a$(0): CLASSE UN TABLEAU DE VARIABLE
L_Sort		equ	959
L959 	Rbsr 	L_GTablo       	;va chercher les caracteristiques du tableau
        move.l 	d6,d3
or4:    lsr.l 	#1,d3         	;E=d3
        beq.s	sortY
	moveq 	#1,d5         	;NA=d5
or5:    move.l 	d5,d4        	;NR=d4 -> NR=NA
or6:    movem.l	d3-d7/a1,-(sp)
        move.l 	a1,a0
        subq.l 	#1,d4
        lsl.l 	d7,d4
        add.l 	d4,a0
        move.l 	a0,a1
        lsl.l 	d7,d3
        add.l 	d3,a1
        move.l 	(a0),d6      	;n$(nr)
        move.l 	(a1),d3      	;n$(nr+e)
        movem.l d2/a0-a1,-(sp)
        Rbsr 	L_Cpbis           ;va comparer
        movem.l (sp)+,d2/a0-a1
  	ble.s	or8
; fait le swap
        move.l 	(a0),d0
        move.l 	(a1),(a0)
        move.l 	d0,(a1)
        movem.l (sp)+,d3-d7/a1
        sub.l 	d3,d4         	;NR=NR-E
        beq.s 	or9
        bcc.s 	or6
        bra.s 	or9
or8:    movem.l (sp)+,d3-d7/a1
or9:    addq.l 	#1,d5        	;NA=NA+1
        move.l 	d6,d0
        sub.l 	d3,d0
        cmp.l 	d0,d5
        bls.s 	or5
        bra.s 	or4
sortY	rts

******* b=MATCH (a(0),b): TROUVE UNE VARIABLE PAR DICHOTOMIE, RAMENE SA PLACE
L_FFind		equ	960
L960	Rbsr	L_GTablo
	move.l	(a3)+,d3
; recherche!
di3:    moveq	#0,d5
        move.l 	d6,d1
        lsr.l	#1,d6
di4:    movem.l a1/d1-d6,-(sp)	
        add.l 	d6,d5
        lsl.l 	#2,d5
        move.l 	0(a1,d5.l),d6
        Rbsr 	L_Cpbis
	movem.l	(sp)+,a1/d1-d6
        beq.s 	di11
        bgt.s	di5
	add.l 	d6,d5
di5:    tst.l 	d6
        beq.s 	di7
        lsr.l 	#1,d6
        bra.s 	di4
; pas trouve: cherche le premier element superieur
di7:    cmp.l 	d1,d5
        bcc.s 	di8
        movem.l a1/d1-d6,-(sp)
        lsl.l 	#2,d5
        move.l  0(a1,d5.l),d6
        Rbsr 	L_Cpbis
        movem.l (sp)+,a1/d1-d6
        beq.s 	di11
        bgt.s 	di8
        addq.l 	#1,d5
        bra.s 	di7
di8:    move.l 	d5,d3
        addq.l 	#1,d3
        neg.l 	d3
	move.l	d3,-(a3)
	rts
; trouve!
di11:   move.l 	d5,d3
        add.l 	d6,d3
	move.l	d3,-(a3)
	rts

L961:

***********************************************************
*		MENU KEY
L_MnKey0	equ	962
L962	Rbsr	L_MnDim
	tst.l	MnLat(a2)
	Rbne	L_FonCall
	clr.b	MnKFlag(a2)
	rts
*	MENU KEY (,,) to "s"
L_MnKey1	equ	963
L963	Rbsr	L_MnDim
	tst.l	MnLat(a2)
	Rbne	L_Foncall
	move.l	(a3)+,a0
	tst.w	(a0)+
	Rbeq	L_FonCall
	move.b	(a0),MnKAsc(a2)
	move.b	#1,MnKFlag(a2)
	rts
* 	MENU KEY (,,) to s
L_MnKey2	equ	964	
L964	Rbsr	L_MnDim
	tst.l	MnLat(a2)
	RBne	L_Foncall
	move.l	(a3)+,d2
	moveq	#0,d3
	Rbra	L_MnKy
* 	MENU KEY (,,) to s
L_MnKey3	equ	965
L965	Rbsr	L_MnDim
	tst.l	MnLat(a2)
	RBne	L_Foncall
	move.l	(a3)+,d3
	move.l	(a3)+,d2
	Rbra	L_MnKy
L_MnKy		equ	966
L966	cmp.l	#256,d3
	Rbcc	L_FonCall
	move.b	d3,MnKSh(a2)
	cmp.l	#128,d2
	Rbcc	L_FonCall
	move.b	d2,MnKSc(a2)
	move.b	#-1,MnKFlag(a2)
	rts

******* Exploration des MENU KEY
*	d4->	Ascii
*	d5->	Scan
*	d6->	Shift
L_MnKExp	equ	967
L967	movem.l	a0-a3/d0-d7,-(sp)
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
L_GoMenu	equ	968
L968	tst.w	EveLabel(a5)
	bmi.s	GoMX
	lea	MnChoix(a5),a0
	move.w	(a0),d0
	beq.s	GoMX
	cmp.w	OMnNb(a5),d0
	bls.s	GoMGo
GoMX:	rts
* Fait le branchement
GoMGo	bclr	#BitJump,d7
	move.w	d7,ActuMask(a5)
	move.w	d6,T_Actualise(a5)
	move.l	LowPile(a5),sp
	move.l	OMnBase(a5),a0
	lsl.w	#2,d0
	move.l	-4(a0,d0.w),a0
	tst.w	OMnType(a5)
	bmi.s	GoMG2
	beq.s	GoMG1
* 1: Procedure!
	moveq	#0,d6
	move.l	a4,-(sp)
	jmp	(a0)
* 0: Gosub
GoMG1	move.l	a4,-(sp)
	move.l	sp,LowPile(a5)
	jmp	(a0)
* -1: Goto
GoMG2	jmp	(a0)

******* INSTRUCTION ON MENU
L_OnMen		equ	969
L969	Rbsr	L_OMnEff
	move.w	d0,OMnType(a5)
	ext.l	d1
	move.w	d1,OMnNb(a5)
	move.w	d1,d2			* Nb de labesl*4
	lsl.w	#2,d1
	move.l	d1,d0
	Rbsr	L_RamFast
	Rbeq	L_OOfMem
	move.l	d0,OMnBase(a5)
	add.l	d1,d0
	move.l	d0,a0
* Poke les jumps
	subq.w	#1,d2
OnMn2	move.l	(a3)+,-(a0)
	dbra	d2,OnMn2
* Plus de branchements
	bclr	#BitJump,ActuMask(a5)
	rts

******* ON MENU ON
L_OMnOn		equ	970
L970	tst.w	OMnNb(a5)
	beq.s	L970a
	bset	#BitJump,ActuMask(a5)
L970a	rts
******* ON MENU OFF
L_OMnOff	equ	971
L971	tst.w	OMnNb(a5)
	beq.s	L971a
	bset	#BitJump,ActuMask(a5)
L971a	rts
******* Efface les ON MENU
L_OMnDel	equ	972
L_OMnEff	equ	972
L972	movem.l	d0-d2/a0-a1,-(sp)
	moveq	#0,d0
	move.w	OMnNb(a5),d0
	beq.s	OMnEx
	lsl.w	#2,d0
	move.l	OMnBase(a5),a1
	Rbsr	L_RamFree
	clr.w	OMnNb(a5)
	clr.l	OMnBase(a5)
OMnEx:	movem.l	(sp)+,d0-d2/a0-a1
	rts

***********************************************************
*		RESTORE
L_Rest0		equ	973
L973	move.l	AData(a5),PData(a5)
	rts
L_Rest1		equ	974
L974	lea	4(a0),a0
	cmp.w	#$4E71,(a0)		* (NOP)
	RBne	L_NoData
	move.l	a0,PData(a5)
	rts
***********************************************************
*		READ
L_ReadE		equ	975
L975	move.l	a0,-(sp)
	move.l	PData(a5),a2
	jsr	(a2)
	Rbmi	L_OofData
	cmp.l	#EntNul,(a3)
	beq.s	L975a
	subq.b	#1,d2	
	bmi.s	L975b
	RBne	L_TypeMis
	Rbsr	L_FlToInt
	bra.s	L975b
L975a	clr.l	(a3)
L975b	move.l	(sp)+,a0
	move.l	(a3)+,(a0)
	move.l	a2,PData(a5)
	rts
L_ReadF		equ	976
L976	move.l	a0,-(sp)
	move.l	PData(a5),a2
	jsr	(a2)
	Rbmi	L_OofData
	cmp.l	#EntNul,(a3)
	beq.s	L976a
	subq.b	#1,d2	
	beq.s	L976b
	RBpl	L_TypeMis
	Rbsr	L_IntToFl
	bra.s	L976b
L976a	clr.l	(a3)
L976b	move.l	(sp)+,a0
	move.l	(a3)+,(a0)
	move.l	a2,PData(a5)
	rts
L_ReadS		equ	977
L977	move.l	a0,-(sp)
	move.l	PData(a5),a2
	jsr	(a2)
	Rbmi	L_OofData
	cmp.l	#EntNul,(a3)
	beq.s	L977a
	cmp.b	#2,d2
	beq.s	L977b
	RBra	L_TypeMis
L977a	move.l	ChVide(a5),(a3)
L977b	move.l	(sp)+,a0
	move.l	(a3)+,(a0)
	move.l	a2,PData(a5)
	rts

***********************************************************
*		=FREE
L_Free		equ	978
L978	moveq	#-100,d3
	Rbsr	L_Menage
	move.l	TabBas(a5),d3
	sub.l	HiChaine(a5),d3
	move.l	d3,-(a3)
	rts
L979:

***********************************************************
*		ON ERROR 
L_OnErr0	equ	980
L980	tst.w	ErrorOn(a5)
	RBne	L_Noresum
	clr.l	OnErrLine(a5)
	clr.l	ErrorChr(a5)
	rts
*	GOTO
L_OnErr1	equ	981
L981	tst.w	ErrorOn(a5)
	RBne	L_Noresum
	move.l	a0,OnErrLine(a5)
	clr.l	ErrorChr(a5)
	rts
*	PROC
L_OnErr2	equ	982
L982	tst.w	ErrorOn(a5)
	RBne	L_Noresum
	move.l	a0,OnErrLine(a5)
	clr.l	ErrorChr(a5)
	bset	#7,ErrorChr(a5)
	rts

******* RESUME LABEL seul
L_ResL0		equ	983
L983	tst.w	ErrorOn(a5)
	Rbeq	L_NoErr
	Rbsr	L_PopP
	clr.w	ErrorOn(a5)
	move.l	ErrorChr(a5),d0
	bclr	#31,d0
	Rbeq	L_NoOnErr
	tst.l	d0
	Rbeq	L_ResLNo
	move.l	d0,a0
	jmp	(a0)
* 	RESUME LABEL label
L_ResL1		equ	984
L984	tst.l	OnErrLine(a5)
	Rbeq	L_NoOnErr
	tst.w	ErrorChr(a5)
	Rbpl	L_NoOnErr
	move.l	a0,d0
	bset	#31,d0
	move.l	d0,ErrorChr(a5)
	rts

******* RESUME [label]
L_Res0		equ	985
L985	RBsr	L_Tests
	tst.w	ErrorOn(a5)
	Rbeq	L_NoErr
	move.l	ErrorChr(a5),d0
	bmi.s	L985a
	move.l	d0,a0
	clr.w	ErrorOn(a5)
	jmp	(a0)
L985a	Rbsr	L_PopP
	clr.w	ErrorOn(a5)
	jmp	(a0)
L_Res1		equ	986
L986	move.l	a0,-(sp)
	Rbsr	L_Tests
	move.l	(sp)+,a0
	tst.w	ErrorOn(a5)
	Rbeq	L_NoErr
	clr.w	ErrorOn(a5)
	tst.w	ErrorChr(a5)
	Rbmi	L_ResPLab
	jmp	(a0)
L987	
	
******* RESUME NEXT
L_ResNext	equ	988
L988	Rbsr	L_Tests
	tst.w	ErrorOn(a5)
	Rbeq	L_NoErr
	addq.l	#4,sp
	move.l	ErrorChr(a5),d0
	move.l	d0,a0
	bpl.s	L988a
	Rbsr	L_PopP
L988a	addq.l	#4,a0
	move.l	L988z(pc),d1
ResN1	cmp.l	(a0),d1
	addq.l	#2,a0
	bne.s	ResN1
	clr.w	ErrorOn(a5)
	jmp	-2(a0)
L988z	lea	L988z(pc),a4

******* ERROR n
L_IErrN		equ	989
L989	move.l	(a3)+,d0
	cmp.l	#120,d0
	bcs.s	.skip
	moveq	#120,d0
.skip	RBra	L_Error

******* ERRN
L_FErrN		equ	990
L990	moveq	#0,d0
	move.w	ErrorOn(a5),d0
	beq.s	L990a
	subq.w	#1,d0
L990a	move.l	d0,-(a3)
	rts

***********************************************************
*	Depile la procedure
*	A0-->	Adresse de retour
L_PopP		equ	991
L991	move.l	(sp)+,a1
	move.l	LowPileP(a5),sp
	move.l	(sp)+,LowPileP(a5)	10
	move.l	(sp)+,LowPile(a5)	9
	move.l	(sp)+,AData(a5)		8
	move.l	(sp)+,PData(a5)		7
	move.w	(sp)+,ErrorOn(a5)	6
	move.l	(sp)+,ErrorChr(a5)	5
	move.l	(sp)+,OnErrLine(a5)	4
	move.l	(sp)+,TabBas(a5)	3
	move.l	(sp)+,AForNext(a5)	2.5
	move.l	(sp)+,VarLoc(a5)	2
	move.l	(sp)+,Ad_Labels(a5)	1
	move.l	(sp)+,a6		0
	move.l	(sp)+,a0			RTS
	jmp	(a1)

************************************************************
*		ERREURS

L_Foncall	equ	992
L992	moveq	#23,d0
	RBra	L_Error
L_EProErr	equ	993
L993	moveq	#8,d0
	Rbra	L_Error
L994
L_Dbz		equ	995
L995	moveq	#20,d0
	Rbra	L_Error
L_Typemis	equ	996
L996	moveq	#34,d0
	Rbra	L_Error
L997	
L_InpTL		equ	998
L998	moveq	#99,d0	
	Rbra	L_Error
L_Stolong	equ	999
L999	moveq	#21,d0
	Rbra	L_Error
L_WFoncall	equ	1000
L1000	moveq	#60,d0
	Rbra	L_Error
L_Scnop		equ	1001
L1001	moveq	#47,d0
	Rbra	L_Error
L_Aldim		equ	1002
L1002	moveq	#28,d0
	Rbra	L_Error
L_OofBuf	equ	1003
L1003	moveq	#11,d0
	Rbra	L_Error
L_IllScN	equ	1004
L1004	moveq	#48,d0
	Rbra	L_Error
L_OofMem	equ	1005
L1005	moveq	#24,d0
	Rbra	L_Error
L_BkNoRes	equ	1006
L1006	moveq	#36,d0
	Rbra	L_Error
L_RainErr	equ	1007
L1007	moveq	#31,d0
	Rbra	L_EcWiErr
L_IlNCo		equ	1008
L1008	moveq	#49,d0
	Rbra	L_Error
L_ScNoDef	equ	1009
L1009	moveq	#72,d0
	Rbra	L_Error
L_BFonCall	equ	1010
L1010	moveq	#66,d0
	Rbra	L_Error
L_BkAlRes	equ	1011
L1011	moveq	#35,d0
	Rbra	L_Error
L_MnNOp		equ	1012
L1012	moveq	#38,d0	
	Rbra	L_Error
L_Overflow	equ	1013
L1013	moveq	#29,d0
	Rbra	L_Error
L_FnNDef	equ	1014
L1014	moveq	#15,d0
	Rbra	L_Error
L_NDim		equ	1015
L1015	moveq	#27,d0
	Rbra	L_Error
L_NoData	equ	1016
L1016	moveq	#41,d0
	Rbra	L_Error
L_OofData	equ	1017
L1017	moveq	#33,d0
	Rbra	L_Error
L_NoResum	equ	1018
L1018	moveq	#3,d0
	Rbra	L_Error
L_NoErr		equ	1019
L1019	moveq	#7,d0
	Rbra	L_Error
L_NoOnErr	equ	1020
L1020	moveq	#5,d0
	Rbra	L_Error
L_ResLNo	equ	1021
L1021	moveq	#6,d0
	Rbra	L_Error
L_ResPLab	equ	1022
L1022	moveq	#4,d0
	Rbra	L_Error

L1023

******* Traitement des erreurs RUN TIME, NORMALES
L_Error		equ	1024
L1024	Alea	MErreur,a0
	moveq	#19,d1
	moveq	#-1,d2
	moveq	#0,d3
	Rbra	L_ErrorExt
L_ErrorExt	equ	1025
L1025	movem.l	d0/d1/d2/d3/a0,-(sp)
	Rbsr	L_FClose		* Ferme le fichier systeme
	Rbsr	L_FsOut			* Enleve le selecteur de fichier!
	movem.l	(sp)+,d0/d1/d2/d3/a0
	tst.w	MnProc(a5)		* Procedure MENU???
	bne.s	rErrM
	cmp.w	#ErrDir,d0
	bcc.s	rErr1
	cmp.w	#11,d0			* Out of V Space?
	beq.s	.skip
	cmp.w	d1,d0
	bcs.s	rErr1
.skip	tst.w	ErrorOn(a5)
	bne.s	rErr1
	tst.l	OnErrLine(a5)
	beq.s	rErr1
* Erreurs detournees
	addq.w	#1,d0
	addq.w	#1,d2
	lsl.w	#8,d2
	or.w	d2,d0
	move.w	d0,ErrorOn(a5)
	move.l	BasA3(a5),a3
	move.l	LowPile(a5),sp
	move.l	a4,d1
	bne.s	rErr0
	move.l	MenA4(a5),a4
rErr0	tst.w	ErrorChr(a5)
	bmi.s	rErr0a
	move.l	a4,ErrorChr(a5)
	move.l	OnErrLine(a5),a0	On error GOTO
	jmp	(a0)
rErr0a	moveq	#0,d6
	move.l	a4,-(sp)
	move.l	OnErrLine(a5),a0
	jmp	2(a0)
* Erreur avec les menus ouverts!!!
rErrM	movem.l	a0-a6/d0-d7,-(sp)
	Rbsr	L_MnEnd
	movem.l	(sp)+,a0-a6/d0-d7
rErr1
* Trouve le message d'erreur...
	move.l	Name2(a5),a1
	tst.w	d3
	bne.s	rErr5
	cmp.w	#255,d0
	bcc.s	rErr5
	cmp.w	#NbEnd,d0
	beq.s	rErr5
	move.w	d0,d1
	subq.w	#1,d1
	bmi.s	rErr3
rErr2	tst.b	(a0)+
	bne.s	rErr2
	dbra	d1,rErr2
rErr3	tst.b	(a0)
	beq.s	rErr5
rErr4	move.b	(a0)+,(a1)+
	bne.s	rErr4
	move.b	#".",-1(a1)
rErr5	clr.b	(a1)
	RBra	L_Abort
*************************************************************************
*		FIN NORMALE
L_Abort		equ	1026
*
L1026	move.w	#-2,DefFlag(a5)
	RBsr	L_DefRun
	RBsr	L_EffAllBanks
	RBsr	L_ClearVar
	RBsr	L_VarEff
	RBsr	L_FClose
	RBsr	L_CloAll
	move.l	PrtHandle(a5),d1
	beq.s	.skip
	DosCall	DosClose
.skip
* Ferme les extensions
	RBsr	L_ClosExt
* Ferme les librairies
	move.l	$4,a6
	move.l	MathBase(a5),d0
	beq.s	CloL1
	move.l	d0,a1
	jsr	CloseLib(a6)
CloL1	move.l	FloatBase(a5),d0
	beq.s	CloL2
	move.l	d0,a1
	jsr	CloseLib(a6)
CloL2
* Retour au header!
	move.l	BasSp(a5),sp
	rts


******* CLOSE WORKBENCH
L_ClosWb	equ	1027
L1027	movem.l	a3-a6,-(sp)
	tst.w	AutoWB(a5)
	beq.s	WbCloX
	move.l	T_Intbase(a5),a6	
	jsr	-78(a6)			
	move.w	d0,WbClose(a5)
	beq.s	.Skup
	bset	#3,T_WFlags(a5)
.Skup	
WbCloX	movem.l	(sp)+,a3-a6
	rts

******* Reopen WB
L_OpenWb	equ	1028
L1028	movem.l	a3-a6,-(sp)
	tst.w	AutoWB(a5)
	beq.s	OpeW2
	move.l	T_IntBase(a5),a6
	jsr	-210(a6)
	tst.l	d0
	beq.s	OpeW1
	clr.w	WbClose(a5)
	bra.s	OpeW2
OpeW1	move.w	#-1,WbClose(a5)
OpeW2	movem.l	(sp)+,a3-a6
	rts

******* AMOS TO FRONT
L_AmFront	equ	1029
L1029	EcCalD	AMOS_WB,1
	rts
******* AMOS TO BACK
L_AmBack	equ	1030
L1030	EcCalD	AMOS_WB,0
	rts
******* =AMOSHERE
L_AmHere	equ	1031
L1031	EcCalD	AMOS_WB,-1
	move.l	d1,-(a3)
	rts
******* AMOS LOCK
L_AMLock	equ	1032
L1032	EcCalD	AMOS_WB,1
	move.w	#-1,T_NoFlip(a5)
	rts
******* AMOS UNLOCK
L_AMULock	equ	1033
L1033	clr.w	T_NoFlip(a5)
	rts
******* = DISPLAY HEIGHT
L_DispH		equ	1034
L1034	EcCall	MaxRaw
	move.l	d1,-(a3)
	rts
******* =NTSC
L_NTSC		equ	1035
L1035	EcCall	CopForce
	EcCall	NTSC
	move.l	d1,-(a3)
	rts
***********************************************************
*	CLOSE EDITOR
L_ClosEd	equ	1036
L1036	cmp.w	#1,T_AMOState(a5)
	bne.s	.skip
	move.l	T_CompJmp(a5),a0
	jsr	12(a0)
.skip	rts

*********************************************************************
*		RUN "fichier.AMOS"
L_Run		equ	1037
L1037	tst.w	T_AMOState(a5)
	bmi.s	.skip
	move.l	T_CompJmp(a5),a0
	jmp	4(a0)
; COMPILE-> Prend le nom 
.skip	RBsr	L_NomDisk
	move.l	Name1(a5),a0
.Run0	tst.b	(a0)+
	bne.s	.Run0
	subq.l	#1,a0
	lea	Suffix(pc),a1
.Run1	move.b	-(a0),d0
	cmp.b	#"a",d0
	bcs.s	.Run1a
	cmp.b	#"z",d0
	bhi.s	.Run1a
	sub.b	#32,d0
.Run1a	move.b	(a1)+,d1
	beq.s	.Run2
	cmp.b	d0,d1
	bne.s	.Run3
	beq.s	.Run1
.Run2	clr.b	1(a0)
; Ouvre le fichier
.Run3	move.l	#1005,d2
	RBsr	L_FOpen
	RBeq	L_DiskError
; Charge l'entete
	move.l	Name2(a5),d2
	moveq	#5*4,d3
	RBsr	L_FRead
; Un programme?
	move.l	d2,a2
	add.l	d3,d2
	cmp.l	#$3F3,(a2)
	Rbne	L_DiskError
	move.l	2*4(a2),d6
	move.l	d6,d3
	lsl.l	#2,d3
	Rbsr	L_FRead
	
; Short mem ou non?
; ~~~~~~~~~~~~~~~~
	move.l	Buffer(a5),a0
	lea	TBuffer-256-6(a0),a0
	cmp.l	#"CmdL",(a0)+
	bne	.Normal
	move.l	2(a0),d0
	cmp.l	#"-Mem",d0		
	beq.s	.Short
	cmp.l	#"-Def",d0
	bne	.Normal

; SHORT Mem, on ferme tout!
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.Short	move.l	d0,-(sp)
	move.w	(a0),d0			Recopie la fin de la ligne de commande
	subq.w	#5,d0
	bpl.s	.Skyp
	moveq	#0,d0
.Skyp	move.w	d0,(a0)+
	beq.s	.Skop
	lea	5(a0),a1
	subq.w	#1,d0
.Loop	move.b	(a1)+,(a0)+
	dbra	d0,.Loop
.Skop	move.w	#-2,DefFlag(a5)
	RBsr	L_DefRun
	cmp.l	#"-Def",(sp)+
	beq.s	.Normal	
	Rbsr	L_FClose
	RBsr	L_EffAllBanks
	RBsr	L_ClearVar
	RBsr	L_VarEff
	RBsr	L_FClose
	RBsr	L_CloAll
	move.l	PrtHandle(a5),d1
	beq.s	.skisp
	DosCall	DosClose
.skisp
* Ferme les extensions
	RBsr	L_ClosExt
* Ferme les librairies en ROM
	move.l	$4,a6
	move.l	FloatBase(a5),d0
	beq.s	.CloL2
	move.l	d0,a1
	jsr	CloseLib(a6)
.CloL2
; Branche au header, short mem reload!!!
	move.l	BasSp(a5),sp
	move.l	(sp)+,a0
	jmp	6(a0)

; Assez de memoire, on reste tel quel
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.Normal	
;	bset	#BitEcrans,ActuMask(a5)	Autoview on
;	SyCall	OffBobS			Plus de bobs
;	move.w	#4,-(sp)
;.RLoop	SyCall	EffBob
;	SyCall	ActBob
;	SyCall	AffBob
;	EcCall	SwapScS
;	SyCall	ActHs			Plus de sprite hard
;	SyCall	AffHs
;	EcCall	CopForce		Update ecrans
;	SyCall	WaitVbl
;	subq.w	#1,(sp)
;	bne.s	.RLoop
; Plus de variable
	RBsr	L_EffAllBanks		Plus de banques
	RBsr	L_ClearVar
	RBsr	L_VarEff
	Rbsr	L_ClosExt
; Branche au header, normalement
	move.l	BasSp(a5),sp
	move.l	(sp)+,a0
	jmp	2(a0)
Suffix	dc.b	"SOMA.",0
	even


*********************************************************************
*		Effacement du buffer de variables
L_VarEff	equ	1038
L1038	move.l	VarBuf(a5),d0
	beq.s	.skip
	move.l	d0,a1
	move.l	VarBufL(a5),d0
	Rbsr	L_RamFree
	clr.l	VarBuf(a5)
.skip	rts

*********************************************************************
*		Arrete les extensions
L_ClosExt	equ	1039
L1039	lea	ExtAdr(a5),a0
	moveq	#26-1,d0
Lq1	move.l	8(a0),d1
	beq.s	Lq2
	move.l	d1,a1
	movem.l	a0-a6/d0-d7,-(sp)
	jsr	(a1)
	movem.l	(sp)+,a0-a6/d0-d7
Lq2	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)+
	dbra	d0,Lq1
	rts

**********************************************************************
*		Appel d'une routine extension en .AMOS
L_ExtCall	equ	1040
L1040:	lea	AdTokens(a5),a0
	move.l	0(a0,d0.w),d0
	RBeq	L_FonCall
	move.l	d0,a0
	move.w	0(a0,d1.w),d0
	add.w	d0,a0
	jmp	(a0)

**********************************************************************
*		Routine ERROR programme .AMOS
L_ErrorAMOS	equ	1041
L1041	
	moveq	#19,d1
	moveq	#-1,d2
	movem.l	d0/d1/d2/d3/a0,-(sp)
	Rbsr	L_FClose		* Ferme le fichier systeme
	Rbsr	L_FsOut			* Enleve le selecteur de fichier!
	movem.l	(sp)+,d0/d1/d2/d3/a0
	tst.w	MnProc(a5)		* Procedure MENU???
	bne.s	CErrM
	cmp.w	#ErrDir,d0		* Si DIRECT...
	beq.s	CErr1
	cmp.w	d1,d0
	bcs.s	CErr1
	tst.w	ErrorOn(a5)
	bne.s	CErr1
	tst.l	OnErrLine(a5)
	beq.s	CErr1
* Erreurs detournees
	addq.w	#1,d0
	addq.w	#1,d2
	lsl.w	#8,d2
	or.w	d2,d0
	move.w	d0,ErrorOn(a5)
	move.l	BasA3(a5),a3
	move.l	LowPile(a5),sp
	move.l	a4,d1
	bne.s	CErr0
	move.l	MenA4(a5),a4
CErr0	tst.w	ErrorChr(a5)
	bmi.s	CErr0a
	move.l	a4,ErrorChr(a5)
	move.l	OnErrLine(a5),a0	On error GOTO
	jmp	(a0)
CErr0a	moveq	#0,d6
	move.l	a4,-(sp)
	move.l	OnErrLine(a5),a0
	jmp	2(a0)
******* Erreurs non detournees, rebranche à l'AMOS
CErrM	
CErr1	
* Remet tous les pointeurs chaines...
	lea	SchBuf(a5),a0
	move.l	(a0)+,sp
	move.l	(a0)+,TabBas(a5)	1
	move.l	(a0)+,VarGlo(a5)	2
	move.l	(a0)+,VarLoc(a5)	3
	move.l	(a0)+,LoChaine(a5)	4
	move.l	(a0)+,ChVide(a5)	5
	move.l	(a0)+,HiChaine(a5)	6
	move.l	(a0)+,VarBuf(a5)	7
	move.l	(a0)+,VarBufL(a5)	8
	move.l	(a0)+,PData(a5)		9
	move.l	(a0)+,AData(a5)		10
	move.l	(a0)+,a3		11
	move.l	(a0)+,a4		12
	move.l	(a0)+,a6		13
	clr.l	T_JError(a5)
* Empeche le plantage de l'editeur
	clr.l	SchBuf(a5)
	clr.l	RepBuf(a5)
	clr.l	AForNext(a5)
	clr.l	Ad_Labels(a5)
	clr.l	Num_Proc(a5)
	clr.l	LowPile(a5)
	clr.l	LowPileP(a5)
	clr.w	FlagFloat(a5)
* Rebranche à l'AMOS?
	cmp.w	#NbEnd,d0
	beq.s	.skip
; Branche aux erreurs AMOS
	move.l	T_CompJmp(a5),a1
	jmp	(a1)
; Retourne à l'extension
.skip	rts

*********************************************************************
*		Routine d'entree en programme AMOS
L_AMOSIn	equ	1042
L1042:	lea	4(sp),a1
	move.l	a1,LowPile(a5)
	move.l	a1,LowPileP(a5)
	lea	BraError(pc),a0
	move.l	a0,T_JError(a5)
* Sauve la position dans le buffer
	lea	SchBuf(a5),a0
	move.l	a1,(a0)+		0
	move.l	TabBas(a5),(a0)+	1
	move.l	VarGlo(a5),(a0)+	2
	move.l	VarLoc(a5),(a0)+	3
	move.l	LoChaine(a5),(a0)+	4
	move.l	ChVide(a5),(a0)+	5
	move.l	HiChaine(a5),(a0)+	6
	move.l	VarBuf(a5),(a0)+	7
	move.l	VarBufL(a5),(a0)+	8
	move.l	PData(a5),(a0)+		9
	move.l	AData(a5),(a0)+		10
	move.l	a3,(a0)+		11
	move.l	a4,(a0)+		12
	move.l	a6,(a0)+		13
* Limite la position courante
	clr.l	VarLoc(a5)
	move.l	HiChaine(a5),d0
	move.l	d0,VarBuf(a5)
	move.l	TabBas(a5),d1
	sub.l	d0,d1
	move.l	d1,VarBufL(a5)
* Init des variables
	move.l	VarBuf(a5),a0
	move.l	a0,a1
	add.l	VarBufL(a5),a1
	move.l	a1,TabBas(a5)
	move.l	a1,VarGlo(a5)
	clr.l	VarLoc(a5)
	move.l	a0,LoChaine(a5)
	move.l	a0,ChVide(a5)
	clr.w	(a0)+
	move.l	a0,HiChaine(a5)
	move.b	d7,FlagFloat(a5)
* Ca y est!
	rts
BraError
	RBra	L_ErrorAMOS

*********************************************************************
*		BGRAB
L_BGrab0	equ	1043
L1043:	move.l	(a3)+,d3
	cmp.w	#1,T_AMOState(a5)
	bne.s	.skip
	move.l	T_CompJmp(a5),a0
	jsr	8(a0)
.skip	rts

*********************************************************************
*		=PRG STATE
L_PrgState	equ	1044
L1044:	move.w	T_AMOState(a5),d0
	ext.l	d0
	move.l	d0,-(a3)
	rts

*********************************************************************
*		= COMMAND LINE$
L_ICom		equ	1045
L1045	move.l	(a3)+,a2
	move.w	(a2)+,d2
	cmp.w	#256,d2
	Rbcc	L_FonCall
	move.l	Buffer(a5),a1
	lea	TBuffer-256-6(a1),a1
	move.l	#"CmdL",(a1)+
	move.w	d2,(a1)+
	addq.w	#1,d2
	lsr.w	#1,d2
	subq.w	#1,d2
	bmi.s	.skip
.loop	move.w	(a2)+,(a1)+
	dbra	d2,.loop
.skip	rts
******* =COMMAND LINE$
L_FCom		equ	1046
L1046	move.l	Buffer(a5),a2
	lea	TBuffer-256-6(a2),a2
	cmp.l	#"CmdL",(a2)+
	bne.s	.vide
	moveq	#0,d3
	move.w	(a2)+,d3
	beq.s	.vide
	cmp.w	#256,d3
	bcc.s	.vide
	Rbsr	L_Demande
	move.w	d3,(a0)+
	move.w	d3,d0
	addq.w	#1,d0
	lsr.w	#1,d0
	subq.w	#1,d0
.loop	move.w	(a2)+,(a0)+
	dbra	d0,.loop
	move.l	a0,HiChaine(a5)
	move.l	a1,-(a3)
	rts
.vide	move.l	ChVide(a5),-(a3)
	rts

L1047:
L1048:
L1049:
L1050:
L1051:
L1052:
L1053:
L1054:
L1055:
L1056:
L1057:
L1058:
L1059:
L1060:
L1061:
L1062:
L1063:
L1064:
L1065:
L1066:
L1067:
L1068:
L1069:
L1070:
L1071:
L1072:
L1073:
L1074:
L1075:
L1076:
L1077:
L1078:
L1079:
L1080:
L1081:
L1082:
L1083:
L1084:
L1085:
L1086:
L1087:
L1088:
L1089:
L1090:
L1091:
L1092:
L1093:
L1094:
L1095:
L1096:
L1097:
L1098:
L1099:
L1100:
L1101:

