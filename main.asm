list p= 16F877A
include "p16F877A.inc"
Deger EQU 0x88 ; Bellege Yaz�lan Deger Buradan Degistirilecek

	goto AnaProgram

DahiliEproomaYazma
	banksel EECON1
	bcf INTCON,GIE
	bsf  EECON1 ,WREN
	movlw 0x55
	movwf EECON2
	movlw 0xAA
	movwf EECON2
	bsf EECON1, WR
	bsf INTCON, GIE 


	;bcf EECON1, WR
	return 
DahiliEproomOkuma 
	banksel EECON1
	bsf EECON1,RD
	banksel EEDATA
	movf EEDATA,W
	;bcf EECON1,RD
	return 
AnaProgram
	banksel TRISB 
	clrf 	TRISB
	banksel PORTB
	clrf PORTB 
	movlw 0x0A
	banksel EEADR
	
	movwf EEADR
	movlw Deger
	movwf EEDATA
	call DahiliEproomaYazma
	banksel EEADR
	movlw 0x0A
	movwf EEADR
	call DahiliEproomOkuma
	banksel PORTB 
	movwf PORTB
Dongu
	goto Dongu
	END















