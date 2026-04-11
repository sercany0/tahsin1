
_mask:

;tigkynk_18f.mbas,159 :: 		sub function mask(dim num as byte) as byte
;tigkynk_18f.mbas,161 :: 		case 0
	MOVF        FARG_mask_num+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__mask4
;tigkynk_18f.mbas,162 :: 		result = $7E
	MOVLW       126
	MOVWF       R1 
	GOTO        L__mask1
L__mask4:
;tigkynk_18f.mbas,163 :: 		case 1
	MOVF        FARG_mask_num+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__mask7
;tigkynk_18f.mbas,164 :: 		result = $30
	MOVLW       48
	MOVWF       R1 
	GOTO        L__mask1
L__mask7:
;tigkynk_18f.mbas,165 :: 		case 2
	MOVF        FARG_mask_num+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__mask10
;tigkynk_18f.mbas,166 :: 		result = $6D
	MOVLW       109
	MOVWF       R1 
	GOTO        L__mask1
L__mask10:
;tigkynk_18f.mbas,167 :: 		case 3
	MOVF        FARG_mask_num+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__mask13
;tigkynk_18f.mbas,168 :: 		result = $79
	MOVLW       121
	MOVWF       R1 
	GOTO        L__mask1
L__mask13:
;tigkynk_18f.mbas,169 :: 		case 4
	MOVF        FARG_mask_num+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L__mask16
;tigkynk_18f.mbas,170 :: 		result = $33
	MOVLW       51
	MOVWF       R1 
	GOTO        L__mask1
L__mask16:
;tigkynk_18f.mbas,171 :: 		case 5
	MOVF        FARG_mask_num+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L__mask19
;tigkynk_18f.mbas,172 :: 		result = $5B
	MOVLW       91
	MOVWF       R1 
	GOTO        L__mask1
L__mask19:
;tigkynk_18f.mbas,173 :: 		case 6
	MOVF        FARG_mask_num+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L__mask22
;tigkynk_18f.mbas,174 :: 		result = $5F
	MOVLW       95
	MOVWF       R1 
	GOTO        L__mask1
L__mask22:
;tigkynk_18f.mbas,175 :: 		case 7
	MOVF        FARG_mask_num+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L__mask25
;tigkynk_18f.mbas,176 :: 		result = $70
	MOVLW       112
	MOVWF       R1 
	GOTO        L__mask1
L__mask25:
;tigkynk_18f.mbas,177 :: 		case 8
	MOVF        FARG_mask_num+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L__mask28
;tigkynk_18f.mbas,178 :: 		result = $7F
	MOVLW       127
	MOVWF       R1 
	GOTO        L__mask1
L__mask28:
;tigkynk_18f.mbas,179 :: 		case 9
	MOVF        FARG_mask_num+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L__mask31
;tigkynk_18f.mbas,180 :: 		result = $7B
	MOVLW       123
	MOVWF       R1 
	GOTO        L__mask1
L__mask31:
;tigkynk_18f.mbas,182 :: 		result = $00
	CLRF        R1 
L__mask1:
;tigkynk_18f.mbas,184 :: 		end sub
	MOVF        R1, 0 
	MOVWF       R0 
L_end_mask:
	RETURN      0
; end of _mask

_interrupt:

;tigkynk_18f.mbas,211 :: 		sub procedure interrupt()
;tigkynk_18f.mbas,212 :: 		if INTCON.RBIF = 1 then
	BTFSS       INTCON+0, 0 
	GOTO        L__interrupt34
;tigkynk_18f.mbas,213 :: 		dummy = PORTB
	MOVF        PORTB+0, 0 
	MOVWF       _dummy+0 
;tigkynk_18f.mbas,215 :: 		if EncoderA <> prevA then
	CLRF        R1 
	BTFSC       PORTB+0, 5 
	INCF        R1, 1 
	MOVF        R1, 0 
	XORWF       _prevA+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt37
;tigkynk_18f.mbas,216 :: 		if EncoderA = EncoderB then
	BTFSC       PORTB+0, 5 
	GOTO        L__interrupt778
	BTFSS       PORTB+0, 4 
	GOTO        L__interrupt779
	GOTO        L__interrupt40
L__interrupt778:
	BTFSS       PORTB+0, 4 
	GOTO        L__interrupt40
L__interrupt779:
;tigkynk_18f.mbas,218 :: 		if (set1 = 0) and (set2 = 0) and (set3 = 0) and (set4 = 0) and (set5 = 0) and (set6 = 0) and (set7 = 0) and (set8 = 0) then
	MOVF        _set1+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        _set2+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 0 
	ANDWF       R1, 1 
	MOVF        _set3+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 0 
	ANDWF       R1, 1 
	MOVF        _set4+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 0 
	ANDWF       R1, 1 
	MOVF        _set5+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 0 
	ANDWF       R1, 1 
	MOVF        _set6+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 0 
	ANDWF       R1, 1 
	MOVF        _set7+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 0 
	ANDWF       R1, 1 
	MOVF        _set8+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt43
;tigkynk_18f.mbas,219 :: 		if encoderValue < 200 then
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt780
	MOVLW       200
	SUBWF       _encoderValue+0, 0 
L__interrupt780:
	BTFSC       STATUS+0, 0 
	GOTO        L__interrupt46
;tigkynk_18f.mbas,220 :: 		Inc(encoderValue)
	INFSNZ      _encoderValue+0, 1 
	INCF        _encoderValue+1, 1 
L__interrupt46:
;tigkynk_18f.mbas,221 :: 		end if
	GOTO        L__interrupt44
;tigkynk_18f.mbas,222 :: 		else
L__interrupt43:
;tigkynk_18f.mbas,223 :: 		if set1 = 1 then
	MOVF        _set1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt49
;tigkynk_18f.mbas,224 :: 		if encoderValue < 10 then
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt781
	MOVLW       10
	SUBWF       _encoderValue+0, 0 
L__interrupt781:
	BTFSC       STATUS+0, 0 
	GOTO        L__interrupt52
;tigkynk_18f.mbas,225 :: 		Inc(encoderValue)
	INFSNZ      _encoderValue+0, 1 
	INCF        _encoderValue+1, 1 
L__interrupt52:
;tigkynk_18f.mbas,226 :: 		end if
L__interrupt49:
;tigkynk_18f.mbas,229 :: 		if set2 = 1 then
	MOVF        _set2+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt55
;tigkynk_18f.mbas,230 :: 		if encoderValue < 20 then
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt782
	MOVLW       20
	SUBWF       _encoderValue+0, 0 
L__interrupt782:
	BTFSC       STATUS+0, 0 
	GOTO        L__interrupt58
;tigkynk_18f.mbas,231 :: 		Inc(encoderValue)
	INFSNZ      _encoderValue+0, 1 
	INCF        _encoderValue+1, 1 
L__interrupt58:
;tigkynk_18f.mbas,232 :: 		end if
L__interrupt55:
;tigkynk_18f.mbas,235 :: 		if set3 = 1 then
	MOVF        _set3+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt61
;tigkynk_18f.mbas,236 :: 		if encoderValue < 20 then
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt783
	MOVLW       20
	SUBWF       _encoderValue+0, 0 
L__interrupt783:
	BTFSC       STATUS+0, 0 
	GOTO        L__interrupt64
;tigkynk_18f.mbas,237 :: 		Inc(encoderValue)
	INFSNZ      _encoderValue+0, 1 
	INCF        _encoderValue+1, 1 
L__interrupt64:
;tigkynk_18f.mbas,238 :: 		end if
L__interrupt61:
;tigkynk_18f.mbas,241 :: 		if set4 = 1 then
	MOVF        _set4+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt67
;tigkynk_18f.mbas,242 :: 		if encoderValue < 20 then
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt784
	MOVLW       20
	SUBWF       _encoderValue+0, 0 
L__interrupt784:
	BTFSC       STATUS+0, 0 
	GOTO        L__interrupt70
;tigkynk_18f.mbas,243 :: 		Inc(encoderValue)
	INFSNZ      _encoderValue+0, 1 
	INCF        _encoderValue+1, 1 
L__interrupt70:
;tigkynk_18f.mbas,244 :: 		end if
L__interrupt67:
;tigkynk_18f.mbas,247 :: 		if set5 = 1 then
	MOVF        _set5+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt73
;tigkynk_18f.mbas,248 :: 		if encoderValue < 20 then
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt785
	MOVLW       20
	SUBWF       _encoderValue+0, 0 
L__interrupt785:
	BTFSC       STATUS+0, 0 
	GOTO        L__interrupt76
;tigkynk_18f.mbas,249 :: 		Inc(encoderValue)
	INFSNZ      _encoderValue+0, 1 
	INCF        _encoderValue+1, 1 
L__interrupt76:
;tigkynk_18f.mbas,250 :: 		end if
L__interrupt73:
;tigkynk_18f.mbas,253 :: 		if set6 = 1 then
	MOVF        _set6+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt79
;tigkynk_18f.mbas,254 :: 		if encoderValue < 100 then
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt786
	MOVLW       100
	SUBWF       _encoderValue+0, 0 
L__interrupt786:
	BTFSC       STATUS+0, 0 
	GOTO        L__interrupt82
;tigkynk_18f.mbas,255 :: 		Inc(encoderValue)
	INFSNZ      _encoderValue+0, 1 
	INCF        _encoderValue+1, 1 
L__interrupt82:
;tigkynk_18f.mbas,256 :: 		end if
L__interrupt79:
;tigkynk_18f.mbas,259 :: 		if set7 = 1 then
	MOVF        _set7+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt85
;tigkynk_18f.mbas,260 :: 		if encoderValue < 100 then
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt787
	MOVLW       100
	SUBWF       _encoderValue+0, 0 
L__interrupt787:
	BTFSC       STATUS+0, 0 
	GOTO        L__interrupt88
;tigkynk_18f.mbas,261 :: 		Inc(encoderValue)
	INFSNZ      _encoderValue+0, 1 
	INCF        _encoderValue+1, 1 
L__interrupt88:
;tigkynk_18f.mbas,262 :: 		end if
L__interrupt85:
;tigkynk_18f.mbas,265 :: 		if set8 = 1 then
	MOVF        _set8+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt91
;tigkynk_18f.mbas,266 :: 		if encoderValue < 1 then
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt788
	MOVLW       1
	SUBWF       _encoderValue+0, 0 
L__interrupt788:
	BTFSC       STATUS+0, 0 
	GOTO        L__interrupt94
;tigkynk_18f.mbas,267 :: 		Inc(encoderValue)
	INFSNZ      _encoderValue+0, 1 
	INCF        _encoderValue+1, 1 
L__interrupt94:
;tigkynk_18f.mbas,268 :: 		end if
L__interrupt91:
;tigkynk_18f.mbas,270 :: 		end if
L__interrupt44:
	GOTO        L__interrupt41
;tigkynk_18f.mbas,272 :: 		else
L__interrupt40:
;tigkynk_18f.mbas,274 :: 		if (set1 = 0) and (set2 = 0) and (set3 = 0) and (set4 = 0) and (set5 = 0) and (set6 = 0) and (set7 = 0) and (set8 = 0) then
	MOVF        _set1+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        _set2+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 0 
	ANDWF       R1, 1 
	MOVF        _set3+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 0 
	ANDWF       R1, 1 
	MOVF        _set4+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 0 
	ANDWF       R1, 1 
	MOVF        _set5+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 0 
	ANDWF       R1, 1 
	MOVF        _set6+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 0 
	ANDWF       R1, 1 
	MOVF        _set7+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 0 
	ANDWF       R1, 1 
	MOVF        _set8+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt97
;tigkynk_18f.mbas,275 :: 		if encoderValue > 10 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt789
	MOVF        _encoderValue+0, 0 
	SUBLW       10
L__interrupt789:
	BTFSC       STATUS+0, 0 
	GOTO        L__interrupt100
;tigkynk_18f.mbas,276 :: 		Dec(encoderValue)
	MOVLW       1
	SUBWF       _encoderValue+0, 1 
	MOVLW       0
	SUBWFB      _encoderValue+1, 1 
L__interrupt100:
;tigkynk_18f.mbas,277 :: 		end if
	GOTO        L__interrupt98
;tigkynk_18f.mbas,278 :: 		else
L__interrupt97:
;tigkynk_18f.mbas,279 :: 		if encoderValue > 0 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt790
	MOVF        _encoderValue+0, 0 
	SUBLW       0
L__interrupt790:
	BTFSC       STATUS+0, 0 
	GOTO        L__interrupt103
;tigkynk_18f.mbas,280 :: 		Dec(encoderValue)
	MOVLW       1
	SUBWF       _encoderValue+0, 1 
	MOVLW       0
	SUBWFB      _encoderValue+1, 1 
L__interrupt103:
;tigkynk_18f.mbas,282 :: 		end if
L__interrupt98:
;tigkynk_18f.mbas,284 :: 		end if
L__interrupt41:
;tigkynk_18f.mbas,286 :: 		prevA = EncoderA
	MOVLW       0
	BTFSC       PORTB+0, 5 
	MOVLW       1
	MOVWF       _prevA+0 
L__interrupt37:
;tigkynk_18f.mbas,289 :: 		INTCON.RBIF = 0
	BCF         INTCON+0, 0 
L__interrupt34:
;tigkynk_18f.mbas,291 :: 		end sub
L_end_interrupt:
L__interrupt777:
	RETFIE      1
; end of _interrupt

_SPI_Init_MAX7219:

;tigkynk_18f.mbas,294 :: 		sub procedure SPI_Init_MAX7219()
;tigkynk_18f.mbas,295 :: 		LOAD = 1
	BSF         PORTC+0, 0 
;tigkynk_18f.mbas,296 :: 		SPI1_Init()
	CALL        _SPI1_Init+0, 0
;tigkynk_18f.mbas,297 :: 		end sub
L_end_SPI_Init_MAX7219:
	RETURN      0
; end of _SPI_Init_MAX7219

_MAX7219_Send:

;tigkynk_18f.mbas,300 :: 		sub procedure MAX7219_Send(dim address as byte, dim value as byte)
;tigkynk_18f.mbas,301 :: 		LOAD = 0
	BCF         PORTC+0, 0 
;tigkynk_18f.mbas,302 :: 		SPI1_Write(address)
	MOVF        FARG_MAX7219_Send_address+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;tigkynk_18f.mbas,303 :: 		Delay_us(100)
	MOVLW       133
	MOVWF       R13, 0
L__MAX7219_Send107:
	DECFSZ      R13, 1, 1
	BRA         L__MAX7219_Send107
;tigkynk_18f.mbas,304 :: 		SPI1_Write(value)
	MOVF        FARG_MAX7219_Send_value+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;tigkynk_18f.mbas,305 :: 		Delay_us(100)
	MOVLW       133
	MOVWF       R13, 0
L__MAX7219_Send108:
	DECFSZ      R13, 1, 1
	BRA         L__MAX7219_Send108
;tigkynk_18f.mbas,306 :: 		LOAD = 1
	BSF         PORTC+0, 0 
;tigkynk_18f.mbas,307 :: 		end sub
L_end_MAX7219_Send:
	RETURN      0
; end of _MAX7219_Send

_hesapla:

;tigkynk_18f.mbas,311 :: 		dim DGT3, DGT2, DGT1 as byte
;tigkynk_18f.mbas,313 :: 		DGT3 = (num / 100) mod 10
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_hesapla_num+0, 0 
	MOVWF       R0 
	MOVF        FARG_hesapla_num+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       hesapla_DGT3+0 
;tigkynk_18f.mbas,314 :: 		DGT3 = mask(DGT3)
	MOVF        R0, 0 
	MOVWF       FARG_mask_num+0 
	CALL        _mask+0, 0
	MOVF        R0, 0 
	MOVWF       hesapla_DGT3+0 
;tigkynk_18f.mbas,316 :: 		DGT2 = (num / 10) mod 10
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_hesapla_num+0, 0 
	MOVWF       R0 
	MOVF        FARG_hesapla_num+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       hesapla_DGT2+0 
;tigkynk_18f.mbas,317 :: 		DGT2 = mask(DGT2)
	MOVF        R0, 0 
	MOVWF       FARG_mask_num+0 
	CALL        _mask+0, 0
	MOVF        R0, 0 
	MOVWF       hesapla_DGT2+0 
;tigkynk_18f.mbas,319 :: 		DGT1 = num mod 10
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_hesapla_num+0, 0 
	MOVWF       R0 
	MOVF        FARG_hesapla_num+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
;tigkynk_18f.mbas,320 :: 		DGT1 = mask(DGT1)
	MOVF        R0, 0 
	MOVWF       FARG_mask_num+0 
	CALL        _mask+0, 0
;tigkynk_18f.mbas,322 :: 		MAX7219_Send($01, DGT1)
	MOVLW       1
	MOVWF       FARG_MAX7219_Send_address+0 
	MOVF        R0, 0 
	MOVWF       FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,323 :: 		MAX7219_Send($02, DGT2)
	MOVLW       2
	MOVWF       FARG_MAX7219_Send_address+0 
	MOVF        hesapla_DGT2+0, 0 
	MOVWF       FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,324 :: 		MAX7219_Send($03, DGT3)
	MOVLW       3
	MOVWF       FARG_MAX7219_Send_address+0 
	MOVF        hesapla_DGT3+0, 0 
	MOVWF       FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,325 :: 		end sub
L_end_hesapla:
	RETURN      0
; end of _hesapla

_MAX7219_Init:

;tigkynk_18f.mbas,328 :: 		sub procedure MAX7219_Init()
;tigkynk_18f.mbas,329 :: 		MAX7219_Send($0C, $01)
	MOVLW       12
	MOVWF       FARG_MAX7219_Send_address+0 
	MOVLW       1
	MOVWF       FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,330 :: 		MAX7219_Send($09, $00)
	MOVLW       9
	MOVWF       FARG_MAX7219_Send_address+0 
	CLRF        FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,331 :: 		MAX7219_Send($0B, $02)
	MOVLW       11
	MOVWF       FARG_MAX7219_Send_address+0 
	MOVLW       2
	MOVWF       FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,332 :: 		MAX7219_Send($0A, $0F)
	MOVLW       10
	MOVWF       FARG_MAX7219_Send_address+0 
	MOVLW       15
	MOVWF       FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,333 :: 		MAX7219_Send($0F, $00)
	MOVLW       15
	MOVWF       FARG_MAX7219_Send_address+0 
	CLRF        FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,334 :: 		end sub
L_end_MAX7219_Init:
	RETURN      0
; end of _MAX7219_Init

_Tum_Set_Flaglarini_Sifirla:

;tigkynk_18f.mbas,337 :: 		sub procedure Tum_Set_Flaglarini_Sifirla()
;tigkynk_18f.mbas,338 :: 		set1 = 0
	CLRF        _set1+0 
;tigkynk_18f.mbas,339 :: 		set2 = 0
	CLRF        _set2+0 
;tigkynk_18f.mbas,340 :: 		set3 = 0
	CLRF        _set3+0 
;tigkynk_18f.mbas,341 :: 		set4 = 0
	CLRF        _set4+0 
;tigkynk_18f.mbas,342 :: 		set5 = 0
	CLRF        _set5+0 
;tigkynk_18f.mbas,343 :: 		set6 = 0
	CLRF        _set6+0 
;tigkynk_18f.mbas,344 :: 		set7 = 0
	CLRF        _set7+0 
;tigkynk_18f.mbas,345 :: 		set8 = 0
	CLRF        _set8+0 
;tigkynk_18f.mbas,346 :: 		end sub
L_end_Tum_Set_Flaglarini_Sifirla:
	RETURN      0
; end of _Tum_Set_Flaglarini_Sifirla

_Parametre_Flag_Aktif:

;tigkynk_18f.mbas,349 :: 		sub procedure Parametre_Flag_Aktif(dim p as byte)
;tigkynk_18f.mbas,350 :: 		Tum_Set_Flaglarini_Sifirla()
	CALL        _Tum_Set_Flaglarini_Sifirla+0, 0
;tigkynk_18f.mbas,353 :: 		case 1
	MOVF        FARG_Parametre_Flag_Aktif_p+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__Parametre_Flag_Aktif116
;tigkynk_18f.mbas,354 :: 		set1 = 1
	MOVLW       1
	MOVWF       _set1+0 
	GOTO        L__Parametre_Flag_Aktif113
L__Parametre_Flag_Aktif116:
;tigkynk_18f.mbas,355 :: 		case 2
	MOVF        FARG_Parametre_Flag_Aktif_p+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__Parametre_Flag_Aktif119
;tigkynk_18f.mbas,356 :: 		set2 = 1
	MOVLW       1
	MOVWF       _set2+0 
	GOTO        L__Parametre_Flag_Aktif113
L__Parametre_Flag_Aktif119:
;tigkynk_18f.mbas,357 :: 		case 3
	MOVF        FARG_Parametre_Flag_Aktif_p+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__Parametre_Flag_Aktif122
;tigkynk_18f.mbas,358 :: 		set3 = 1
	MOVLW       1
	MOVWF       _set3+0 
	GOTO        L__Parametre_Flag_Aktif113
L__Parametre_Flag_Aktif122:
;tigkynk_18f.mbas,359 :: 		case 4
	MOVF        FARG_Parametre_Flag_Aktif_p+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L__Parametre_Flag_Aktif125
;tigkynk_18f.mbas,360 :: 		set4 = 1
	MOVLW       1
	MOVWF       _set4+0 
	GOTO        L__Parametre_Flag_Aktif113
L__Parametre_Flag_Aktif125:
;tigkynk_18f.mbas,361 :: 		case 5
	MOVF        FARG_Parametre_Flag_Aktif_p+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L__Parametre_Flag_Aktif128
;tigkynk_18f.mbas,362 :: 		set5 = 1
	MOVLW       1
	MOVWF       _set5+0 
	GOTO        L__Parametre_Flag_Aktif113
L__Parametre_Flag_Aktif128:
;tigkynk_18f.mbas,363 :: 		case 6
	MOVF        FARG_Parametre_Flag_Aktif_p+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L__Parametre_Flag_Aktif131
;tigkynk_18f.mbas,364 :: 		set6 = 1
	MOVLW       1
	MOVWF       _set6+0 
	GOTO        L__Parametre_Flag_Aktif113
L__Parametre_Flag_Aktif131:
;tigkynk_18f.mbas,365 :: 		case 7
	MOVF        FARG_Parametre_Flag_Aktif_p+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L__Parametre_Flag_Aktif134
;tigkynk_18f.mbas,366 :: 		set7 = 1
	MOVLW       1
	MOVWF       _set7+0 
	GOTO        L__Parametre_Flag_Aktif113
L__Parametre_Flag_Aktif134:
;tigkynk_18f.mbas,367 :: 		case 8
	MOVF        FARG_Parametre_Flag_Aktif_p+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L__Parametre_Flag_Aktif137
;tigkynk_18f.mbas,368 :: 		set8 = 1
	MOVLW       1
	MOVWF       _set8+0 
	GOTO        L__Parametre_Flag_Aktif113
L__Parametre_Flag_Aktif137:
L__Parametre_Flag_Aktif113:
;tigkynk_18f.mbas,370 :: 		end sub
L_end_Parametre_Flag_Aktif:
	RETURN      0
; end of _Parametre_Flag_Aktif

_Parametre_No_Goster:

;tigkynk_18f.mbas,372 :: 		sub procedure Parametre_No_Goster(dim p as byte)
;tigkynk_18f.mbas,373 :: 		Tum_Set_Flaglarini_Sifirla()
	CALL        _Tum_Set_Flaglarini_Sifirla+0, 0
;tigkynk_18f.mbas,374 :: 		MAX7219_Send($03, mask(p))
	MOVF        FARG_Parametre_No_Goster_p+0, 0 
	MOVWF       FARG_mask_num+0 
	CALL        _mask+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_MAX7219_Send_value+0 
	MOVLW       3
	MOVWF       FARG_MAX7219_Send_address+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,375 :: 		MAX7219_Send($02, $00)
	MOVLW       2
	MOVWF       FARG_MAX7219_Send_address+0 
	CLRF        FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,376 :: 		MAX7219_Send($01, $00)
	MOVLW       1
	MOVWF       FARG_MAX7219_Send_address+0 
	CLRF        FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,377 :: 		end sub
L_end_Parametre_No_Goster:
	RETURN      0
; end of _Parametre_No_Goster

_EEPROM_YUKLE:

;tigkynk_18f.mbas,380 :: 		sub procedure EEPROM_YUKLE()
;tigkynk_18f.mbas,382 :: 		set1_value = EEPROM_Read($01)
	MOVLW       1
	MOVWF       FARG_Eeprom_Read_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Read_address+1 
	CALL        _Eeprom_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _set1_value+0 
;tigkynk_18f.mbas,383 :: 		set2_value = EEPROM_Read($02)
	MOVLW       2
	MOVWF       FARG_Eeprom_Read_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Read_address+1 
	CALL        _Eeprom_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _set2_value+0 
;tigkynk_18f.mbas,384 :: 		set3_value = EEPROM_Read($03)
	MOVLW       3
	MOVWF       FARG_Eeprom_Read_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Read_address+1 
	CALL        _Eeprom_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _set3_value+0 
;tigkynk_18f.mbas,385 :: 		set4_value = EEPROM_Read($04)
	MOVLW       4
	MOVWF       FARG_Eeprom_Read_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Read_address+1 
	CALL        _Eeprom_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _set4_value+0 
;tigkynk_18f.mbas,387 :: 		set5_value = EEPROM_Read($05)
	MOVLW       5
	MOVWF       FARG_Eeprom_Read_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Read_address+1 
	CALL        _Eeprom_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _set5_value+0 
;tigkynk_18f.mbas,388 :: 		set6_value = EEPROM_Read($06)
	MOVLW       6
	MOVWF       FARG_Eeprom_Read_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Read_address+1 
	CALL        _Eeprom_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _set6_value+0 
;tigkynk_18f.mbas,389 :: 		set7_value = EEPROM_Read($07)
	MOVLW       7
	MOVWF       FARG_Eeprom_Read_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Read_address+1 
	CALL        _Eeprom_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _set7_value+0 
;tigkynk_18f.mbas,390 :: 		set8_value = EEPROM_Read($08)
	MOVLW       8
	MOVWF       FARG_Eeprom_Read_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Read_address+1 
	CALL        _Eeprom_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _set8_value+0 
;tigkynk_18f.mbas,392 :: 		if set1_value = 255 then
	MOVF        _set1_value+0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__EEPROM_YUKLE141
;tigkynk_18f.mbas,393 :: 		set1_value = 0
	CLRF        _set1_value+0 
L__EEPROM_YUKLE141:
;tigkynk_18f.mbas,395 :: 		if set2_value = 255 then
	MOVF        _set2_value+0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__EEPROM_YUKLE144
;tigkynk_18f.mbas,396 :: 		set2_value = 3
	MOVLW       3
	MOVWF       _set2_value+0 
L__EEPROM_YUKLE144:
;tigkynk_18f.mbas,398 :: 		if set3_value = 255 then
	MOVF        _set3_value+0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__EEPROM_YUKLE147
;tigkynk_18f.mbas,399 :: 		set3_value = 3
	MOVLW       3
	MOVWF       _set3_value+0 
L__EEPROM_YUKLE147:
;tigkynk_18f.mbas,401 :: 		if set4_value = 255 then
	MOVF        _set4_value+0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__EEPROM_YUKLE150
;tigkynk_18f.mbas,402 :: 		set4_value = 3
	MOVLW       3
	MOVWF       _set4_value+0 
L__EEPROM_YUKLE150:
;tigkynk_18f.mbas,405 :: 		if set1_value > 10 then
	MOVF        _set1_value+0, 0 
	SUBLW       10
	BTFSC       STATUS+0, 0 
	GOTO        L__EEPROM_YUKLE153
;tigkynk_18f.mbas,406 :: 		set1_value = 10
	MOVLW       10
	MOVWF       _set1_value+0 
L__EEPROM_YUKLE153:
;tigkynk_18f.mbas,409 :: 		if set2_value > 20 then
	MOVF        _set2_value+0, 0 
	SUBLW       20
	BTFSC       STATUS+0, 0 
	GOTO        L__EEPROM_YUKLE156
;tigkynk_18f.mbas,410 :: 		set2_value = 20
	MOVLW       20
	MOVWF       _set2_value+0 
L__EEPROM_YUKLE156:
;tigkynk_18f.mbas,413 :: 		if set3_value > 20 then
	MOVF        _set3_value+0, 0 
	SUBLW       20
	BTFSC       STATUS+0, 0 
	GOTO        L__EEPROM_YUKLE159
;tigkynk_18f.mbas,414 :: 		set3_value = 20
	MOVLW       20
	MOVWF       _set3_value+0 
L__EEPROM_YUKLE159:
;tigkynk_18f.mbas,417 :: 		if set4_value > 20 then
	MOVF        _set4_value+0, 0 
	SUBLW       20
	BTFSC       STATUS+0, 0 
	GOTO        L__EEPROM_YUKLE162
;tigkynk_18f.mbas,418 :: 		set4_value = 20
	MOVLW       20
	MOVWF       _set4_value+0 
L__EEPROM_YUKLE162:
;tigkynk_18f.mbas,421 :: 		if set5_value = 255 then
	MOVF        _set5_value+0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__EEPROM_YUKLE165
;tigkynk_18f.mbas,422 :: 		set5_value = 5
	MOVLW       5
	MOVWF       _set5_value+0 
L__EEPROM_YUKLE165:
;tigkynk_18f.mbas,424 :: 		if set6_value = 255 then
	MOVF        _set6_value+0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__EEPROM_YUKLE168
;tigkynk_18f.mbas,425 :: 		set6_value = 50
	MOVLW       50
	MOVWF       _set6_value+0 
L__EEPROM_YUKLE168:
;tigkynk_18f.mbas,427 :: 		if set7_value = 255 then
	MOVF        _set7_value+0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__EEPROM_YUKLE171
;tigkynk_18f.mbas,428 :: 		set7_value = 50
	MOVLW       50
	MOVWF       _set7_value+0 
L__EEPROM_YUKLE171:
;tigkynk_18f.mbas,430 :: 		if set8_value = 255 then
	MOVF        _set8_value+0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__EEPROM_YUKLE174
;tigkynk_18f.mbas,431 :: 		set8_value = 0
	CLRF        _set8_value+0 
L__EEPROM_YUKLE174:
;tigkynk_18f.mbas,433 :: 		if set5_value > 20 then
	MOVF        _set5_value+0, 0 
	SUBLW       20
	BTFSC       STATUS+0, 0 
	GOTO        L__EEPROM_YUKLE177
;tigkynk_18f.mbas,434 :: 		set5_value = 20
	MOVLW       20
	MOVWF       _set5_value+0 
L__EEPROM_YUKLE177:
;tigkynk_18f.mbas,437 :: 		if set6_value > 100 then
	MOVF        _set6_value+0, 0 
	SUBLW       100
	BTFSC       STATUS+0, 0 
	GOTO        L__EEPROM_YUKLE180
;tigkynk_18f.mbas,438 :: 		set6_value = 100
	MOVLW       100
	MOVWF       _set6_value+0 
L__EEPROM_YUKLE180:
;tigkynk_18f.mbas,441 :: 		if set7_value > 100 then
	MOVF        _set7_value+0, 0 
	SUBLW       100
	BTFSC       STATUS+0, 0 
	GOTO        L__EEPROM_YUKLE183
;tigkynk_18f.mbas,442 :: 		set7_value = 100
	MOVLW       100
	MOVWF       _set7_value+0 
L__EEPROM_YUKLE183:
;tigkynk_18f.mbas,445 :: 		if set8_value > 1 then
	MOVF        _set8_value+0, 0 
	SUBLW       1
	BTFSC       STATUS+0, 0 
	GOTO        L__EEPROM_YUKLE186
;tigkynk_18f.mbas,446 :: 		set8_value = 0
	CLRF        _set8_value+0 
L__EEPROM_YUKLE186:
;tigkynk_18f.mbas,449 :: 		end sub
L_end_EEPROM_YUKLE:
	RETURN      0
; end of _EEPROM_YUKLE

_EEPROM_Kaydet:

;tigkynk_18f.mbas,452 :: 		sub procedure EEPROM_Kaydet()
;tigkynk_18f.mbas,453 :: 		EEPROM_Write($01, set1_value)
	MOVLW       1
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVF        _set1_value+0, 0 
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;tigkynk_18f.mbas,454 :: 		Delay_ms(20)
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L__EEPROM_Kaydet189:
	DECFSZ      R13, 1, 1
	BRA         L__EEPROM_Kaydet189
	DECFSZ      R12, 1, 1
	BRA         L__EEPROM_Kaydet189
	NOP
;tigkynk_18f.mbas,455 :: 		EEPROM_Write($02, set2_value)
	MOVLW       2
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVF        _set2_value+0, 0 
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;tigkynk_18f.mbas,456 :: 		Delay_ms(20)
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L__EEPROM_Kaydet190:
	DECFSZ      R13, 1, 1
	BRA         L__EEPROM_Kaydet190
	DECFSZ      R12, 1, 1
	BRA         L__EEPROM_Kaydet190
	NOP
;tigkynk_18f.mbas,457 :: 		EEPROM_Write($03, set3_value)
	MOVLW       3
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVF        _set3_value+0, 0 
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;tigkynk_18f.mbas,458 :: 		Delay_ms(20)
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L__EEPROM_Kaydet191:
	DECFSZ      R13, 1, 1
	BRA         L__EEPROM_Kaydet191
	DECFSZ      R12, 1, 1
	BRA         L__EEPROM_Kaydet191
	NOP
;tigkynk_18f.mbas,459 :: 		EEPROM_Write($04, set4_value)
	MOVLW       4
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVF        _set4_value+0, 0 
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;tigkynk_18f.mbas,460 :: 		Delay_ms(20)
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L__EEPROM_Kaydet192:
	DECFSZ      R13, 1, 1
	BRA         L__EEPROM_Kaydet192
	DECFSZ      R12, 1, 1
	BRA         L__EEPROM_Kaydet192
	NOP
;tigkynk_18f.mbas,461 :: 		EEPROM_Write($05, set5_value)
	MOVLW       5
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVF        _set5_value+0, 0 
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;tigkynk_18f.mbas,462 :: 		Delay_ms(20)
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L__EEPROM_Kaydet193:
	DECFSZ      R13, 1, 1
	BRA         L__EEPROM_Kaydet193
	DECFSZ      R12, 1, 1
	BRA         L__EEPROM_Kaydet193
	NOP
;tigkynk_18f.mbas,463 :: 		EEPROM_Write($06, set6_value)
	MOVLW       6
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVF        _set6_value+0, 0 
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;tigkynk_18f.mbas,464 :: 		Delay_ms(20)
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L__EEPROM_Kaydet194:
	DECFSZ      R13, 1, 1
	BRA         L__EEPROM_Kaydet194
	DECFSZ      R12, 1, 1
	BRA         L__EEPROM_Kaydet194
	NOP
;tigkynk_18f.mbas,465 :: 		EEPROM_Write($07, set7_value)
	MOVLW       7
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVF        _set7_value+0, 0 
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;tigkynk_18f.mbas,466 :: 		Delay_ms(20)
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L__EEPROM_Kaydet195:
	DECFSZ      R13, 1, 1
	BRA         L__EEPROM_Kaydet195
	DECFSZ      R12, 1, 1
	BRA         L__EEPROM_Kaydet195
	NOP
;tigkynk_18f.mbas,467 :: 		EEPROM_Write($08, set8_value)
	MOVLW       8
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVF        _set8_value+0, 0 
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;tigkynk_18f.mbas,468 :: 		Delay_ms(20)
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L__EEPROM_Kaydet196:
	DECFSZ      R13, 1, 1
	BRA         L__EEPROM_Kaydet196
	DECFSZ      R12, 1, 1
	BRA         L__EEPROM_Kaydet196
	NOP
;tigkynk_18f.mbas,469 :: 		end sub
L_end_EEPROM_Kaydet:
	RETURN      0
; end of _EEPROM_Kaydet

_G_Segment_Animasyon:

;tigkynk_18f.mbas,472 :: 		sub procedure G_Segment_Animasyon()
;tigkynk_18f.mbas,473 :: 		MAX7219_Send($03, $01)
	MOVLW       3
	MOVWF       FARG_MAX7219_Send_address+0 
	MOVLW       1
	MOVWF       FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,474 :: 		MAX7219_Send($02, $00)
	MOVLW       2
	MOVWF       FARG_MAX7219_Send_address+0 
	CLRF        FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,475 :: 		MAX7219_Send($01, $00)
	MOVLW       1
	MOVWF       FARG_MAX7219_Send_address+0 
	CLRF        FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,476 :: 		Delay_ms(500)
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L__G_Segment_Animasyon198:
	DECFSZ      R13, 1, 1
	BRA         L__G_Segment_Animasyon198
	DECFSZ      R12, 1, 1
	BRA         L__G_Segment_Animasyon198
	DECFSZ      R11, 1, 1
	BRA         L__G_Segment_Animasyon198
	NOP
	NOP
;tigkynk_18f.mbas,478 :: 		MAX7219_Send($03, $00)
	MOVLW       3
	MOVWF       FARG_MAX7219_Send_address+0 
	CLRF        FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,479 :: 		MAX7219_Send($02, $01)
	MOVLW       2
	MOVWF       FARG_MAX7219_Send_address+0 
	MOVLW       1
	MOVWF       FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,480 :: 		MAX7219_Send($01, $00)
	MOVLW       1
	MOVWF       FARG_MAX7219_Send_address+0 
	CLRF        FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,481 :: 		Delay_ms(500)
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L__G_Segment_Animasyon199:
	DECFSZ      R13, 1, 1
	BRA         L__G_Segment_Animasyon199
	DECFSZ      R12, 1, 1
	BRA         L__G_Segment_Animasyon199
	DECFSZ      R11, 1, 1
	BRA         L__G_Segment_Animasyon199
	NOP
	NOP
;tigkynk_18f.mbas,483 :: 		MAX7219_Send($03, $00)
	MOVLW       3
	MOVWF       FARG_MAX7219_Send_address+0 
	CLRF        FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,484 :: 		MAX7219_Send($02, $00)
	MOVLW       2
	MOVWF       FARG_MAX7219_Send_address+0 
	CLRF        FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,485 :: 		MAX7219_Send($01, $01)
	MOVLW       1
	MOVWF       FARG_MAX7219_Send_address+0 
	MOVLW       1
	MOVWF       FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,486 :: 		Delay_ms(500)
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L__G_Segment_Animasyon200:
	DECFSZ      R13, 1, 1
	BRA         L__G_Segment_Animasyon200
	DECFSZ      R12, 1, 1
	BRA         L__G_Segment_Animasyon200
	DECFSZ      R11, 1, 1
	BRA         L__G_Segment_Animasyon200
	NOP
	NOP
;tigkynk_18f.mbas,488 :: 		MAX7219_Send($03, $00)
	MOVLW       3
	MOVWF       FARG_MAX7219_Send_address+0 
	CLRF        FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,489 :: 		MAX7219_Send($02, $00)
	MOVLW       2
	MOVWF       FARG_MAX7219_Send_address+0 
	CLRF        FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,490 :: 		MAX7219_Send($01, $00)
	MOVLW       1
	MOVWF       FARG_MAX7219_Send_address+0 
	CLRF        FARG_MAX7219_Send_value+0 
	CALL        _MAX7219_Send+0, 0
;tigkynk_18f.mbas,491 :: 		end sub
L_end_G_Segment_Animasyon:
	RETURN      0
; end of _G_Segment_Animasyon

_MUTLAK_INT:

;tigkynk_18f.mbas,494 :: 		sub function MUTLAK_INT(dim x as integer) as integer
;tigkynk_18f.mbas,495 :: 		if x < 0 then
	MOVLW       128
	XORWF       FARG_MUTLAK_INT_x+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MUTLAK_INT802
	MOVLW       0
	SUBWF       FARG_MUTLAK_INT_x+0, 0 
L__MUTLAK_INT802:
	BTFSC       STATUS+0, 0 
	GOTO        L__MUTLAK_INT203
;tigkynk_18f.mbas,496 :: 		result = -x
	MOVF        FARG_MUTLAK_INT_x+0, 0 
	SUBLW       0
	MOVWF       R2 
	MOVF        FARG_MUTLAK_INT_x+1, 0 
	MOVWF       R3 
	MOVLW       0
	SUBFWB      R3, 1 
	GOTO        L__MUTLAK_INT204
;tigkynk_18f.mbas,497 :: 		else
L__MUTLAK_INT203:
;tigkynk_18f.mbas,498 :: 		result = x
	MOVF        FARG_MUTLAK_INT_x+0, 0 
	MOVWF       R2 
	MOVF        FARG_MUTLAK_INT_x+1, 0 
	MOVWF       R3 
;tigkynk_18f.mbas,499 :: 		end if
L__MUTLAK_INT204:
;tigkynk_18f.mbas,500 :: 		end sub
	MOVF        R2, 0 
	MOVWF       R0 
	MOVF        R3, 0 
	MOVWF       R1 
L_end_MUTLAK_INT:
	RETURN      0
; end of _MUTLAK_INT

_AKIM_TO_DUTY:

;tigkynk_18f.mbas,504 :: 		dim duty_temp as longint
;tigkynk_18f.mbas,506 :: 		if akim <= 0 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_AKIM_TO_DUTY_akim+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__AKIM_TO_DUTY804
	MOVF        FARG_AKIM_TO_DUTY_akim+0, 0 
	SUBLW       0
L__AKIM_TO_DUTY804:
	BTFSS       STATUS+0, 0 
	GOTO        L__AKIM_TO_DUTY207
;tigkynk_18f.mbas,507 :: 		result = 0
	CLRF        AKIM_TO_DUTY_local_result+0 
;tigkynk_18f.mbas,508 :: 		exit
	GOTO        L_end__AKIM_TO_DUTY
L__AKIM_TO_DUTY207:
;tigkynk_18f.mbas,511 :: 		if akim <= 10 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_AKIM_TO_DUTY_akim+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__AKIM_TO_DUTY805
	MOVF        FARG_AKIM_TO_DUTY_akim+0, 0 
	SUBLW       10
L__AKIM_TO_DUTY805:
	BTFSS       STATUS+0, 0 
	GOTO        L__AKIM_TO_DUTY210
;tigkynk_18f.mbas,512 :: 		result = 30
	MOVLW       30
	MOVWF       AKIM_TO_DUTY_local_result+0 
;tigkynk_18f.mbas,513 :: 		exit
	GOTO        L_end__AKIM_TO_DUTY
L__AKIM_TO_DUTY210:
;tigkynk_18f.mbas,516 :: 		if akim >= 200 then
	MOVLW       128
	XORWF       FARG_AKIM_TO_DUTY_akim+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__AKIM_TO_DUTY806
	MOVLW       200
	SUBWF       FARG_AKIM_TO_DUTY_akim+0, 0 
L__AKIM_TO_DUTY806:
	BTFSS       STATUS+0, 0 
	GOTO        L__AKIM_TO_DUTY213
;tigkynk_18f.mbas,517 :: 		result = 127
	MOVLW       127
	MOVWF       AKIM_TO_DUTY_local_result+0 
;tigkynk_18f.mbas,518 :: 		exit
	GOTO        L_end__AKIM_TO_DUTY
L__AKIM_TO_DUTY213:
;tigkynk_18f.mbas,521 :: 		duty_temp = akim - 10
	MOVF        FARG_AKIM_TO_DUTY_akim+0, 0 
	MOVWF       R0 
	MOVF        FARG_AKIM_TO_DUTY_akim+1, 0 
	MOVWF       R1 
	MOVLW       0
	BTFSC       FARG_AKIM_TO_DUTY_akim+1, 7 
	MOVLW       255
	MOVWF       R2 
	MOVWF       R3 
	MOVLW       10
	SUBWF       R0, 1 
	MOVLW       0
	SUBWFB      R1, 1 
	SUBWFB      R2, 1 
	SUBWFB      R3, 1 
	MOVF        R0, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+0 
	MOVF        R1, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+1 
	MOVF        R2, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+2 
	MOVF        R3, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+3 
;tigkynk_18f.mbas,522 :: 		duty_temp = duty_temp * 97
	MOVLW       97
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+0 
	MOVF        R1, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+1 
	MOVF        R2, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+2 
	MOVF        R3, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+3 
;tigkynk_18f.mbas,523 :: 		duty_temp = duty_temp / 190
	MOVLW       190
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+0 
	MOVF        R1, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+1 
	MOVF        R2, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+2 
	MOVF        R3, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+3 
;tigkynk_18f.mbas,524 :: 		duty_temp = duty_temp + 30
	MOVLW       30
	ADDWF       R0, 0 
	MOVWF       R4 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R5 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       R6 
	MOVLW       0
	ADDWFC      R3, 0 
	MOVWF       R7 
	MOVF        R4, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+0 
	MOVF        R5, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+1 
	MOVF        R6, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+2 
	MOVF        R7, 0 
	MOVWF       AKIM_TO_DUTY_duty_temp+3 
;tigkynk_18f.mbas,526 :: 		if duty_temp < 0 then
	MOVLW       128
	XORWF       R7, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__AKIM_TO_DUTY807
	MOVLW       0
	SUBWF       R6, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__AKIM_TO_DUTY807
	MOVLW       0
	SUBWF       R5, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__AKIM_TO_DUTY807
	MOVLW       0
	SUBWF       R4, 0 
L__AKIM_TO_DUTY807:
	BTFSC       STATUS+0, 0 
	GOTO        L__AKIM_TO_DUTY216
;tigkynk_18f.mbas,527 :: 		duty_temp = 0
	CLRF        AKIM_TO_DUTY_duty_temp+0 
	CLRF        AKIM_TO_DUTY_duty_temp+1 
	CLRF        AKIM_TO_DUTY_duty_temp+2 
	CLRF        AKIM_TO_DUTY_duty_temp+3 
L__AKIM_TO_DUTY216:
;tigkynk_18f.mbas,530 :: 		if duty_temp > 255 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       AKIM_TO_DUTY_duty_temp+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__AKIM_TO_DUTY808
	MOVF        AKIM_TO_DUTY_duty_temp+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__AKIM_TO_DUTY808
	MOVF        AKIM_TO_DUTY_duty_temp+1, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__AKIM_TO_DUTY808
	MOVF        AKIM_TO_DUTY_duty_temp+0, 0 
	SUBLW       255
L__AKIM_TO_DUTY808:
	BTFSC       STATUS+0, 0 
	GOTO        L__AKIM_TO_DUTY219
;tigkynk_18f.mbas,531 :: 		duty_temp = 255
	MOVLW       255
	MOVWF       AKIM_TO_DUTY_duty_temp+0 
	MOVLW       0
	MOVWF       AKIM_TO_DUTY_duty_temp+1 
	MOVWF       AKIM_TO_DUTY_duty_temp+2 
	MOVWF       AKIM_TO_DUTY_duty_temp+3 
L__AKIM_TO_DUTY219:
;tigkynk_18f.mbas,534 :: 		result = duty_temp
	MOVF        AKIM_TO_DUTY_duty_temp+0, 0 
	MOVWF       AKIM_TO_DUTY_local_result+0 
;tigkynk_18f.mbas,535 :: 		end sub
L_end__AKIM_TO_DUTY:
	MOVF        AKIM_TO_DUTY_local_result+0, 0 
	MOVWF       R0 
L_end_AKIM_TO_DUTY:
	RETURN      0
; end of _AKIM_TO_DUTY

_ADC2_ORT_OKU:

;tigkynk_18f.mbas,542 :: 		dim dummy_adc as word
;tigkynk_18f.mbas,546 :: 		dummy_adc = ADC_Read(2)
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;tigkynk_18f.mbas,547 :: 		Delay_us(50)
	MOVLW       66
	MOVWF       R13, 0
L__ADC2_ORT_OKU222:
	DECFSZ      R13, 1, 1
	BRA         L__ADC2_ORT_OKU222
	NOP
;tigkynk_18f.mbas,549 :: 		adc_toplam = 0
	CLRF        ADC2_ORT_OKU_adc_toplam+0 
	CLRF        ADC2_ORT_OKU_adc_toplam+1 
	CLRF        ADC2_ORT_OKU_adc_toplam+2 
	CLRF        ADC2_ORT_OKU_adc_toplam+3 
;tigkynk_18f.mbas,551 :: 		for s = 1 to 4
	MOVLW       1
	MOVWF       ADC2_ORT_OKU_s+0 
L__ADC2_ORT_OKU224:
;tigkynk_18f.mbas,552 :: 		adc_toplam = adc_toplam + ADC_Read(2)
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	ADDWF       ADC2_ORT_OKU_adc_toplam+0, 1 
	MOVF        R1, 0 
	ADDWFC      ADC2_ORT_OKU_adc_toplam+1, 1 
	MOVLW       0
	ADDWFC      ADC2_ORT_OKU_adc_toplam+2, 1 
	ADDWFC      ADC2_ORT_OKU_adc_toplam+3, 1 
;tigkynk_18f.mbas,553 :: 		Delay_us(50)
	MOVLW       66
	MOVWF       R13, 0
L__ADC2_ORT_OKU228:
	DECFSZ      R13, 1, 1
	BRA         L__ADC2_ORT_OKU228
	NOP
;tigkynk_18f.mbas,554 :: 		next s
	MOVF        ADC2_ORT_OKU_s+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L__ADC2_ORT_OKU227
	INCF        ADC2_ORT_OKU_s+0, 1 
	GOTO        L__ADC2_ORT_OKU224
L__ADC2_ORT_OKU227:
;tigkynk_18f.mbas,556 :: 		adc_ort = adc_toplam / 4
	MOVF        ADC2_ORT_OKU_adc_toplam+0, 0 
	MOVWF       R0 
	MOVF        ADC2_ORT_OKU_adc_toplam+1, 0 
	MOVWF       R1 
	MOVF        ADC2_ORT_OKU_adc_toplam+2, 0 
	MOVWF       R2 
	MOVF        ADC2_ORT_OKU_adc_toplam+3, 0 
	MOVWF       R3 
	RRCF        R3, 1 
	RRCF        R2, 1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R3, 7 
	RRCF        R3, 1 
	RRCF        R2, 1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R3, 7 
;tigkynk_18f.mbas,560 :: 		result = adc_ort
	MOVF        R0, 0 
	MOVWF       ADC2_ORT_OKU_local_result+0 
	MOVF        R1, 0 
	MOVWF       ADC2_ORT_OKU_local_result+1 
;tigkynk_18f.mbas,561 :: 		end sub
	MOVF        ADC2_ORT_OKU_local_result+0, 0 
	MOVWF       R0 
	MOVF        ADC2_ORT_OKU_local_result+1, 0 
	MOVWF       R1 
L_end_ADC2_ORT_OKU:
	RETURN      0
; end of _ADC2_ORT_OKU

_ADC8_ORT_OKU:

;tigkynk_18f.mbas,568 :: 		dim dummy_adc as word
;tigkynk_18f.mbas,572 :: 		dummy_adc = ADC_Read(8)
	MOVLW       8
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;tigkynk_18f.mbas,573 :: 		Delay_us(50)
	MOVLW       66
	MOVWF       R13, 0
L__ADC8_ORT_OKU230:
	DECFSZ      R13, 1, 1
	BRA         L__ADC8_ORT_OKU230
	NOP
;tigkynk_18f.mbas,575 :: 		adc_toplam = 0
	CLRF        ADC8_ORT_OKU_adc_toplam+0 
	CLRF        ADC8_ORT_OKU_adc_toplam+1 
	CLRF        ADC8_ORT_OKU_adc_toplam+2 
	CLRF        ADC8_ORT_OKU_adc_toplam+3 
;tigkynk_18f.mbas,577 :: 		for s = 1 to 4
	MOVLW       1
	MOVWF       ADC8_ORT_OKU_s+0 
L__ADC8_ORT_OKU232:
;tigkynk_18f.mbas,578 :: 		adc_toplam = adc_toplam + ADC_Read(8)
	MOVLW       8
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	ADDWF       ADC8_ORT_OKU_adc_toplam+0, 1 
	MOVF        R1, 0 
	ADDWFC      ADC8_ORT_OKU_adc_toplam+1, 1 
	MOVLW       0
	ADDWFC      ADC8_ORT_OKU_adc_toplam+2, 1 
	ADDWFC      ADC8_ORT_OKU_adc_toplam+3, 1 
;tigkynk_18f.mbas,579 :: 		Delay_us(50)
	MOVLW       66
	MOVWF       R13, 0
L__ADC8_ORT_OKU236:
	DECFSZ      R13, 1, 1
	BRA         L__ADC8_ORT_OKU236
	NOP
;tigkynk_18f.mbas,580 :: 		next s
	MOVF        ADC8_ORT_OKU_s+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L__ADC8_ORT_OKU235
	INCF        ADC8_ORT_OKU_s+0, 1 
	GOTO        L__ADC8_ORT_OKU232
L__ADC8_ORT_OKU235:
;tigkynk_18f.mbas,582 :: 		adc_ort = adc_toplam / 4
	MOVF        ADC8_ORT_OKU_adc_toplam+0, 0 
	MOVWF       R0 
	MOVF        ADC8_ORT_OKU_adc_toplam+1, 0 
	MOVWF       R1 
	MOVF        ADC8_ORT_OKU_adc_toplam+2, 0 
	MOVWF       R2 
	MOVF        ADC8_ORT_OKU_adc_toplam+3, 0 
	MOVWF       R3 
	RRCF        R3, 1 
	RRCF        R2, 1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R3, 7 
	RRCF        R3, 1 
	RRCF        R2, 1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R3, 7 
;tigkynk_18f.mbas,583 :: 		kisa_devre_adc = adc_ort
	MOVF        R0, 0 
	MOVWF       _kisa_devre_adc+0 
	MOVF        R1, 0 
	MOVWF       _kisa_devre_adc+1 
;tigkynk_18f.mbas,587 :: 		result = adc_ort
	MOVF        R0, 0 
	MOVWF       ADC8_ORT_OKU_local_result+0 
	MOVF        R1, 0 
	MOVWF       ADC8_ORT_OKU_local_result+1 
;tigkynk_18f.mbas,588 :: 		end sub
	MOVF        ADC8_ORT_OKU_local_result+0, 0 
	MOVWF       R0 
	MOVF        ADC8_ORT_OKU_local_result+1, 0 
	MOVWF       R1 
L_end_ADC8_ORT_OKU:
	RETURN      0
; end of _ADC8_ORT_OKU

_BASLATMA_VEYA_BLOK_IPTAL_VAR_MI:

;tigkynk_18f.mbas,591 :: 		sub function BASLATMA_VEYA_BLOK_IPTAL_VAR_MI() as byte
;tigkynk_18f.mbas,592 :: 		result = 0
	CLRF        R1 
;tigkynk_18f.mbas,594 :: 		if setting_mode <> 0 then
	MOVF        _setting_mode+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L__BASLATMA_VEYA_BLOK_IPTAL_VAR_MI239
;tigkynk_18f.mbas,595 :: 		PORTD.6 = 1
	BSF         PORTD+0, 6 
;tigkynk_18f.mbas,596 :: 		kaynak_izin = 0
	CLRF        _kaynak_izin+0 
;tigkynk_18f.mbas,597 :: 		result = 1
	MOVLW       1
	MOVWF       R1 
;tigkynk_18f.mbas,598 :: 		exit
	GOTO        L_end__BASLATMA_VEYA_BLOK_IPTAL_VAR_MI
L__BASLATMA_VEYA_BLOK_IPTAL_VAR_MI239:
;tigkynk_18f.mbas,601 :: 		if ikidort = 1 then
	BTFSS       PORTC+0, 4 
	GOTO        L__BASLATMA_VEYA_BLOK_IPTAL_VAR_MI242
;tigkynk_18f.mbas,602 :: 		if TETIK = 1 then
	BTFSS       PORTE+0, 0 
	GOTO        L__BASLATMA_VEYA_BLOK_IPTAL_VAR_MI245
;tigkynk_18f.mbas,603 :: 		PORTD.7 = 1
	BSF         PORTD+0, 7 
;tigkynk_18f.mbas,604 :: 		kaynak_izin = 0
	CLRF        _kaynak_izin+0 
;tigkynk_18f.mbas,605 :: 		result = 1
	MOVLW       1
	MOVWF       R1 
;tigkynk_18f.mbas,606 :: 		exit
	GOTO        L_end__BASLATMA_VEYA_BLOK_IPTAL_VAR_MI
L__BASLATMA_VEYA_BLOK_IPTAL_VAR_MI245:
;tigkynk_18f.mbas,607 :: 		end if
L__BASLATMA_VEYA_BLOK_IPTAL_VAR_MI242:
;tigkynk_18f.mbas,609 :: 		end sub
L_end__BASLATMA_VEYA_BLOK_IPTAL_VAR_MI:
	MOVF        R1, 0 
	MOVWF       R0 
L_end_BASLATMA_VEYA_BLOK_IPTAL_VAR_MI:
	RETURN      0
; end of _BASLATMA_VEYA_BLOK_IPTAL_VAR_MI

_ARK_DETECT_OKU:

;tigkynk_18f.mbas,612 :: 		dim adc_ort as word
;tigkynk_18f.mbas,614 :: 		adc_ort = ADC2_ORT_OKU()
	CALL        _ADC2_ORT_OKU+0, 0
;tigkynk_18f.mbas,615 :: 		akim_adc = adc_ort
	MOVF        R0, 0 
	MOVWF       _akim_adc+0 
	MOVF        R1, 0 
	MOVWF       _akim_adc+1 
;tigkynk_18f.mbas,617 :: 		if adc_ort > ark_esik then
	MOVF        R1, 0 
	SUBWF       _ark_esik+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ARK_DETECT_OKU813
	MOVF        R0, 0 
	SUBWF       _ark_esik+0, 0 
L__ARK_DETECT_OKU813:
	BTFSC       STATUS+0, 0 
	GOTO        L__ARK_DETECT_OKU249
;tigkynk_18f.mbas,618 :: 		result = 1
	MOVLW       1
	MOVWF       ARK_DETECT_OKU_local_result+0 
	GOTO        L__ARK_DETECT_OKU250
;tigkynk_18f.mbas,619 :: 		else
L__ARK_DETECT_OKU249:
;tigkynk_18f.mbas,620 :: 		result = 0
	CLRF        ARK_DETECT_OKU_local_result+0 
;tigkynk_18f.mbas,621 :: 		end if
L__ARK_DETECT_OKU250:
;tigkynk_18f.mbas,622 :: 		end sub
	MOVF        ARK_DETECT_OKU_local_result+0, 0 
	MOVWF       R0 
L_end_ARK_DETECT_OKU:
	RETURN      0
; end of _ARK_DETECT_OKU

_ADC_TO_AKIM:

;tigkynk_18f.mbas,626 :: 		dim akim_hesap as longword
;tigkynk_18f.mbas,628 :: 		if adc_deger >= AKIM_ADC_MAX then
	MOVLW       3
	SUBWF       FARG_ADC_TO_AKIM_adc_deger+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ADC_TO_AKIM815
	MOVLW       32
	SUBWF       FARG_ADC_TO_AKIM_adc_deger+0, 0 
L__ADC_TO_AKIM815:
	BTFSS       STATUS+0, 0 
	GOTO        L__ADC_TO_AKIM253
;tigkynk_18f.mbas,629 :: 		result = 200
	MOVLW       200
	MOVWF       ADC_TO_AKIM_local_result+0 
	MOVLW       0
	MOVWF       ADC_TO_AKIM_local_result+1 
	GOTO        L__ADC_TO_AKIM254
;tigkynk_18f.mbas,630 :: 		else
L__ADC_TO_AKIM253:
;tigkynk_18f.mbas,631 :: 		akim_hesap = adc_deger
	MOVF        FARG_ADC_TO_AKIM_adc_deger+0, 0 
	MOVWF       ADC_TO_AKIM_akim_hesap+0 
	MOVF        FARG_ADC_TO_AKIM_adc_deger+1, 0 
	MOVWF       ADC_TO_AKIM_akim_hesap+1 
	MOVLW       0
	MOVWF       ADC_TO_AKIM_akim_hesap+2 
	MOVWF       ADC_TO_AKIM_akim_hesap+3 
;tigkynk_18f.mbas,632 :: 		akim_hesap = akim_hesap * 200
	MOVF        ADC_TO_AKIM_akim_hesap+0, 0 
	MOVWF       R0 
	MOVF        ADC_TO_AKIM_akim_hesap+1, 0 
	MOVWF       R1 
	MOVF        ADC_TO_AKIM_akim_hesap+2, 0 
	MOVWF       R2 
	MOVF        ADC_TO_AKIM_akim_hesap+3, 0 
	MOVWF       R3 
	MOVLW       200
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       ADC_TO_AKIM_akim_hesap+0 
	MOVF        R1, 0 
	MOVWF       ADC_TO_AKIM_akim_hesap+1 
	MOVF        R2, 0 
	MOVWF       ADC_TO_AKIM_akim_hesap+2 
	MOVF        R3, 0 
	MOVWF       ADC_TO_AKIM_akim_hesap+3 
;tigkynk_18f.mbas,633 :: 		akim_hesap = akim_hesap / AKIM_ADC_MAX
	MOVLW       32
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       ADC_TO_AKIM_akim_hesap+0 
	MOVF        R1, 0 
	MOVWF       ADC_TO_AKIM_akim_hesap+1 
	MOVF        R2, 0 
	MOVWF       ADC_TO_AKIM_akim_hesap+2 
	MOVF        R3, 0 
	MOVWF       ADC_TO_AKIM_akim_hesap+3 
;tigkynk_18f.mbas,634 :: 		result = akim_hesap
	MOVF        R0, 0 
	MOVWF       ADC_TO_AKIM_local_result+0 
	MOVF        R1, 0 
	MOVWF       ADC_TO_AKIM_local_result+1 
;tigkynk_18f.mbas,635 :: 		end if
L__ADC_TO_AKIM254:
;tigkynk_18f.mbas,636 :: 		end sub
	MOVF        ADC_TO_AKIM_local_result+0, 0 
	MOVWF       R0 
	MOVF        ADC_TO_AKIM_local_result+1, 0 
	MOVWF       R1 
L_end_ADC_TO_AKIM:
	RETURN      0
; end of _ADC_TO_AKIM

_AKIM_OKU:

;tigkynk_18f.mbas,643 :: 		dim dummy_adc as word
;tigkynk_18f.mbas,647 :: 		dummy_adc = ADC_Read(2)
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;tigkynk_18f.mbas,648 :: 		Delay_us(50)
	MOVLW       66
	MOVWF       R13, 0
L__AKIM_OKU256:
	DECFSZ      R13, 1, 1
	BRA         L__AKIM_OKU256
	NOP
;tigkynk_18f.mbas,650 :: 		adc_toplam = 0
	CLRF        AKIM_OKU_adc_toplam+0 
	CLRF        AKIM_OKU_adc_toplam+1 
	CLRF        AKIM_OKU_adc_toplam+2 
	CLRF        AKIM_OKU_adc_toplam+3 
;tigkynk_18f.mbas,652 :: 		for s = 1 to 8
	MOVLW       1
	MOVWF       AKIM_OKU_s+0 
L__AKIM_OKU258:
;tigkynk_18f.mbas,653 :: 		adc_toplam = adc_toplam + ADC_Read(2)
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	ADDWF       AKIM_OKU_adc_toplam+0, 1 
	MOVF        R1, 0 
	ADDWFC      AKIM_OKU_adc_toplam+1, 1 
	MOVLW       0
	ADDWFC      AKIM_OKU_adc_toplam+2, 1 
	ADDWFC      AKIM_OKU_adc_toplam+3, 1 
;tigkynk_18f.mbas,654 :: 		Delay_us(50)
	MOVLW       66
	MOVWF       R13, 0
L__AKIM_OKU262:
	DECFSZ      R13, 1, 1
	BRA         L__AKIM_OKU262
	NOP
;tigkynk_18f.mbas,655 :: 		next s
	MOVF        AKIM_OKU_s+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L__AKIM_OKU261
	INCF        AKIM_OKU_s+0, 1 
	GOTO        L__AKIM_OKU258
L__AKIM_OKU261:
;tigkynk_18f.mbas,657 :: 		adc_ort = adc_toplam / 8
	MOVLW       3
	MOVWF       R4 
	MOVF        AKIM_OKU_adc_toplam+0, 0 
	MOVWF       R0 
	MOVF        AKIM_OKU_adc_toplam+1, 0 
	MOVWF       R1 
	MOVF        AKIM_OKU_adc_toplam+2, 0 
	MOVWF       R2 
	MOVF        AKIM_OKU_adc_toplam+3, 0 
	MOVWF       R3 
	MOVF        R4, 0 
L__AKIM_OKU817:
	BZ          L__AKIM_OKU818
	RRCF        R3, 1 
	RRCF        R2, 1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R3, 7 
	ADDLW       255
	GOTO        L__AKIM_OKU817
L__AKIM_OKU818:
;tigkynk_18f.mbas,658 :: 		akim_adc = adc_ort
	MOVF        R0, 0 
	MOVWF       _akim_adc+0 
	MOVF        R1, 0 
	MOVWF       _akim_adc+1 
;tigkynk_18f.mbas,662 :: 		result = ADC_TO_AKIM(adc_ort)
	MOVF        R0, 0 
	MOVWF       FARG_ADC_TO_AKIM_adc_deger+0 
	MOVF        R1, 0 
	MOVWF       FARG_ADC_TO_AKIM_adc_deger+1 
	CALL        _ADC_TO_AKIM+0, 0
	MOVF        R0, 0 
	MOVWF       AKIM_OKU_local_result+0 
	MOVF        R1, 0 
	MOVWF       AKIM_OKU_local_result+1 
;tigkynk_18f.mbas,663 :: 		end sub
	MOVF        AKIM_OKU_local_result+0, 0 
	MOVWF       R0 
	MOVF        AKIM_OKU_local_result+1, 0 
	MOVWF       R1 
L_end_AKIM_OKU:
	RETURN      0
; end of _AKIM_OKU

_AKIM_OKU_FILTRELI:

;tigkynk_18f.mbas,667 :: 		dim yeni_akim as integer
;tigkynk_18f.mbas,669 :: 		yeni_akim = AKIM_OKU()
	CALL        _AKIM_OKU+0, 0
	MOVF        R0, 0 
	MOVWF       AKIM_OKU_FILTRELI_yeni_akim+0 
	MOVF        R1, 0 
	MOVWF       AKIM_OKU_FILTRELI_yeni_akim+1 
;tigkynk_18f.mbas,671 :: 		if akim_filtreli = 0 then
	MOVLW       0
	XORWF       _akim_filtreli+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__AKIM_OKU_FILTRELI820
	MOVLW       0
	XORWF       _akim_filtreli+0, 0 
L__AKIM_OKU_FILTRELI820:
	BTFSS       STATUS+0, 2 
	GOTO        L__AKIM_OKU_FILTRELI265
;tigkynk_18f.mbas,672 :: 		akim_filtreli = yeni_akim
	MOVF        AKIM_OKU_FILTRELI_yeni_akim+0, 0 
	MOVWF       _akim_filtreli+0 
	MOVF        AKIM_OKU_FILTRELI_yeni_akim+1, 0 
	MOVWF       _akim_filtreli+1 
	GOTO        L__AKIM_OKU_FILTRELI266
;tigkynk_18f.mbas,673 :: 		else
L__AKIM_OKU_FILTRELI265:
;tigkynk_18f.mbas,674 :: 		akim_filtreli = ((akim_filtreli * 3) + yeni_akim) / 4
	MOVF        _akim_filtreli+0, 0 
	MOVWF       R0 
	MOVF        _akim_filtreli+1, 0 
	MOVWF       R1 
	MOVLW       3
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVF        AKIM_OKU_FILTRELI_yeni_akim+0, 0 
	ADDWF       R0, 1 
	MOVF        AKIM_OKU_FILTRELI_yeni_akim+1, 0 
	ADDWFC      R1, 1 
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       _akim_filtreli+0 
	MOVF        R1, 0 
	MOVWF       _akim_filtreli+1 
;tigkynk_18f.mbas,675 :: 		end if
L__AKIM_OKU_FILTRELI266:
;tigkynk_18f.mbas,677 :: 		result = akim_filtreli
	MOVF        _akim_filtreli+0, 0 
	MOVWF       AKIM_OKU_FILTRELI_local_result+0 
	MOVF        _akim_filtreli+1, 0 
	MOVWF       AKIM_OKU_FILTRELI_local_result+1 
;tigkynk_18f.mbas,678 :: 		end sub
	MOVF        AKIM_OKU_FILTRELI_local_result+0, 0 
	MOVWF       R0 
	MOVF        AKIM_OKU_FILTRELI_local_result+1, 0 
	MOVWF       R1 
L_end_AKIM_OKU_FILTRELI:
	RETURN      0
; end of _AKIM_OKU_FILTRELI

_KISA_DEVRE_VAR_MI:

;tigkynk_18f.mbas,682 :: 		dim adc_now as word
;tigkynk_18f.mbas,684 :: 		adc_now = ADC8_ORT_OKU()
	CALL        _ADC8_ORT_OKU+0, 0
;tigkynk_18f.mbas,686 :: 		if adc_now <= KISA_DEVRE_ADC_ESIK then
	MOVLW       0
	MOVWF       R2 
	MOVF        R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KISA_DEVRE_VAR_MI822
	MOVF        R0, 0 
	SUBLW       12
L__KISA_DEVRE_VAR_MI822:
	BTFSS       STATUS+0, 0 
	GOTO        L__KISA_DEVRE_VAR_MI269
;tigkynk_18f.mbas,687 :: 		result = 1
	MOVLW       1
	MOVWF       KISA_DEVRE_VAR_MI_local_result+0 
	GOTO        L__KISA_DEVRE_VAR_MI270
;tigkynk_18f.mbas,688 :: 		else
L__KISA_DEVRE_VAR_MI269:
;tigkynk_18f.mbas,689 :: 		result = 0
	CLRF        KISA_DEVRE_VAR_MI_local_result+0 
;tigkynk_18f.mbas,690 :: 		end if
L__KISA_DEVRE_VAR_MI270:
;tigkynk_18f.mbas,691 :: 		end sub
	MOVF        KISA_DEVRE_VAR_MI_local_result+0, 0 
	MOVWF       R0 
L_end_KISA_DEVRE_VAR_MI:
	RETURN      0
; end of _KISA_DEVRE_VAR_MI

_KISA_DEVRE_KALKTI_MI:

;tigkynk_18f.mbas,695 :: 		dim adc_now as word
;tigkynk_18f.mbas,697 :: 		adc_now = ADC8_ORT_OKU()
	CALL        _ADC8_ORT_OKU+0, 0
;tigkynk_18f.mbas,699 :: 		if adc_now >= KISA_DEVRE_CIKIS_ESIK then
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KISA_DEVRE_KALKTI_MI824
	MOVLW       20
	SUBWF       R0, 0 
L__KISA_DEVRE_KALKTI_MI824:
	BTFSS       STATUS+0, 0 
	GOTO        L__KISA_DEVRE_KALKTI_MI273
;tigkynk_18f.mbas,700 :: 		result = 1
	MOVLW       1
	MOVWF       KISA_DEVRE_KALKTI_MI_local_result+0 
	GOTO        L__KISA_DEVRE_KALKTI_MI274
;tigkynk_18f.mbas,701 :: 		else
L__KISA_DEVRE_KALKTI_MI273:
;tigkynk_18f.mbas,702 :: 		result = 0
	CLRF        KISA_DEVRE_KALKTI_MI_local_result+0 
;tigkynk_18f.mbas,703 :: 		end if
L__KISA_DEVRE_KALKTI_MI274:
;tigkynk_18f.mbas,704 :: 		end sub
	MOVF        KISA_DEVRE_KALKTI_MI_local_result+0, 0 
	MOVWF       R0 
L_end_KISA_DEVRE_KALKTI_MI:
	RETURN      0
; end of _KISA_DEVRE_KALKTI_MI

_PID_SIFIRLA:

;tigkynk_18f.mbas,707 :: 		sub procedure PID_SIFIRLA()
;tigkynk_18f.mbas,708 :: 		pid_hata = 0
	CLRF        _pid_hata+0 
	CLRF        _pid_hata+1 
;tigkynk_18f.mbas,709 :: 		pid_onceki_hata = 0
	CLRF        _pid_onceki_hata+0 
	CLRF        _pid_onceki_hata+1 
;tigkynk_18f.mbas,710 :: 		pid_turev = 0
	CLRF        _pid_turev+0 
	CLRF        _pid_turev+1 
;tigkynk_18f.mbas,711 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,712 :: 		pid_integral = 0
	CLRF        _pid_integral+0 
	CLRF        _pid_integral+1 
	CLRF        _pid_integral+2 
	CLRF        _pid_integral+3 
;tigkynk_18f.mbas,713 :: 		akim_filtreli = 0
	CLRF        _akim_filtreli+0 
	CLRF        _akim_filtreli+1 
;tigkynk_18f.mbas,714 :: 		pid_timer = 0
	CLRF        _pid_timer+0 
;tigkynk_18f.mbas,715 :: 		kisa_devre_say = 0
	CLRF        _kisa_devre_say+0 
	CLRF        _kisa_devre_say+1 
;tigkynk_18f.mbas,716 :: 		anti_stick_aktif = 0
	CLRF        _anti_stick_aktif+0 
;tigkynk_18f.mbas,717 :: 		anti_stick_durum = 0
	CLRF        _anti_stick_durum+0 
;tigkynk_18f.mbas,718 :: 		anti_stick_timer = 0
	CLRF        _anti_stick_timer+0 
	CLRF        _anti_stick_timer+1 
;tigkynk_18f.mbas,719 :: 		end sub
L_end_PID_SIFIRLA:
	RETURN      0
; end of _PID_SIFIRLA

_PULSE_AKIM_GET:

;tigkynk_18f.mbas,721 :: 		sub function PULSE_AKIM_GET() as integer
;tigkynk_18f.mbas,723 :: 		if set8_value = 0 then
	MOVF        _set8_value+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__PULSE_AKIM_GET278
;tigkynk_18f.mbas,724 :: 		result = hedef_akim
	MOVF        _hedef_akim+0, 0 
	MOVWF       PULSE_AKIM_GET_local_result+0 
	MOVF        _hedef_akim+1, 0 
	MOVWF       PULSE_AKIM_GET_local_result+1 
;tigkynk_18f.mbas,725 :: 		exit
	GOTO        L_end__PULSE_AKIM_GET
L__PULSE_AKIM_GET278:
;tigkynk_18f.mbas,728 :: 		if pulse_state = 1 then
	MOVF        _pulse_state+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__PULSE_AKIM_GET281
;tigkynk_18f.mbas,729 :: 		result = hedef_akim   ' peak
	MOVF        _hedef_akim+0, 0 
	MOVWF       PULSE_AKIM_GET_local_result+0 
	MOVF        _hedef_akim+1, 0 
	MOVWF       PULSE_AKIM_GET_local_result+1 
	GOTO        L__PULSE_AKIM_GET282
;tigkynk_18f.mbas,730 :: 		else
L__PULSE_AKIM_GET281:
;tigkynk_18f.mbas,731 :: 		result = (hedef_akim * set6_value) / 100   ' base
	MOVF        _hedef_akim+0, 0 
	MOVWF       R0 
	MOVF        _hedef_akim+1, 0 
	MOVWF       R1 
	MOVF        _set6_value+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       PULSE_AKIM_GET_local_result+0 
	MOVF        R1, 0 
	MOVWF       PULSE_AKIM_GET_local_result+1 
;tigkynk_18f.mbas,732 :: 		end if
L__PULSE_AKIM_GET282:
;tigkynk_18f.mbas,734 :: 		end sub
L_end__PULSE_AKIM_GET:
	MOVF        PULSE_AKIM_GET_local_result+0, 0 
	MOVWF       R0 
	MOVF        PULSE_AKIM_GET_local_result+1, 0 
	MOVWF       R1 
L_end_PULSE_AKIM_GET:
	RETURN      0
; end of _PULSE_AKIM_GET

_PID_HESAPLA:

;tigkynk_18f.mbas,742 :: 		dim pulse_hedef_akim as integer
;tigkynk_18f.mbas,744 :: 		olculen_akim = AKIM_OKU_FILTRELI()
	CALL        _AKIM_OKU_FILTRELI+0, 0
	MOVF        R0, 0 
	MOVWF       _olculen_akim+0 
	MOVF        R1, 0 
	MOVWF       _olculen_akim+1 
;tigkynk_18f.mbas,746 :: 		pulse_hedef_akim = PULSE_AKIM_GET()
	CALL        _PULSE_AKIM_GET+0, 0
	MOVF        R0, 0 
	MOVWF       PID_HESAPLA_pulse_hedef_akim+0 
	MOVF        R1, 0 
	MOVWF       PID_HESAPLA_pulse_hedef_akim+1 
;tigkynk_18f.mbas,747 :: 		pid_hata = pulse_hedef_akim - olculen_akim
	MOVF        _olculen_akim+0, 0 
	SUBWF       R0, 1 
	MOVF        _olculen_akim+1, 0 
	SUBWFB      R1, 1 
	MOVF        R0, 0 
	MOVWF       _pid_hata+0 
	MOVF        R1, 0 
	MOVWF       _pid_hata+1 
;tigkynk_18f.mbas,749 :: 		if MUTLAK_INT(pid_hata) < PID_HATA_BANT then
	MOVF        R0, 0 
	MOVWF       FARG_MUTLAK_INT_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_MUTLAK_INT_x+1 
	CALL        _MUTLAK_INT+0, 0
	MOVLW       128
	XORWF       R1, 0 
	MOVWF       R2 
	MOVLW       128
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA828
	MOVLW       40
	SUBWF       R0, 0 
L__PID_HESAPLA828:
	BTFSC       STATUS+0, 0 
	GOTO        L__PID_HESAPLA285
;tigkynk_18f.mbas,750 :: 		pid_integral = pid_integral + pid_hata
	MOVF        _pid_hata+0, 0 
	ADDWF       _pid_integral+0, 1 
	MOVF        _pid_hata+1, 0 
	ADDWFC      _pid_integral+1, 1 
	MOVLW       0
	BTFSC       _pid_hata+1, 7 
	MOVLW       255
	ADDWFC      _pid_integral+2, 1 
	ADDWFC      _pid_integral+3, 1 
L__PID_HESAPLA285:
;tigkynk_18f.mbas,753 :: 		if pid_integral > PID_INTEGRAL_MAX then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _pid_integral+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA829
	MOVF        _pid_integral+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA829
	MOVF        _pid_integral+1, 0 
	SUBLW       11
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA829
	MOVF        _pid_integral+0, 0 
	SUBLW       184
L__PID_HESAPLA829:
	BTFSC       STATUS+0, 0 
	GOTO        L__PID_HESAPLA288
;tigkynk_18f.mbas,754 :: 		pid_integral = PID_INTEGRAL_MAX
	MOVLW       184
	MOVWF       _pid_integral+0 
	MOVLW       11
	MOVWF       _pid_integral+1 
	MOVLW       0
	MOVWF       _pid_integral+2 
	MOVWF       _pid_integral+3 
L__PID_HESAPLA288:
;tigkynk_18f.mbas,757 :: 		if pid_integral < -PID_INTEGRAL_MAX then
	MOVLW       128
	XORWF       _pid_integral+3, 0 
	MOVWF       R0 
	MOVLW       127
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA830
	MOVLW       255
	SUBWF       _pid_integral+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA830
	MOVLW       244
	SUBWF       _pid_integral+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA830
	MOVLW       72
	SUBWF       _pid_integral+0, 0 
L__PID_HESAPLA830:
	BTFSC       STATUS+0, 0 
	GOTO        L__PID_HESAPLA291
;tigkynk_18f.mbas,758 :: 		pid_integral = -PID_INTEGRAL_MAX
	MOVLW       72
	MOVWF       _pid_integral+0 
	MOVLW       244
	MOVWF       _pid_integral+1 
	MOVLW       255
	MOVWF       _pid_integral+2 
	MOVWF       _pid_integral+3 
L__PID_HESAPLA291:
;tigkynk_18f.mbas,761 :: 		hedef_duty_local = AKIM_TO_DUTY(pulse_hedef_akim)
	MOVF        PID_HESAPLA_pulse_hedef_akim+0, 0 
	MOVWF       FARG_AKIM_TO_DUTY_akim+0 
	MOVF        PID_HESAPLA_pulse_hedef_akim+1, 0 
	MOVWF       FARG_AKIM_TO_DUTY_akim+1 
	CALL        _AKIM_TO_DUTY+0, 0
	MOVF        R0, 0 
	MOVWF       PID_HESAPLA_hedef_duty_local+0 
	MOVLW       0
	MOVWF       PID_HESAPLA_hedef_duty_local+1 
;tigkynk_18f.mbas,763 :: 		duty_tmp = hedef_duty_local
	MOVF        PID_HESAPLA_hedef_duty_local+0, 0 
	MOVWF       PID_HESAPLA_duty_tmp+0 
	MOVF        PID_HESAPLA_hedef_duty_local+1, 0 
	MOVWF       PID_HESAPLA_duty_tmp+1 
	MOVLW       0
	BTFSC       PID_HESAPLA_hedef_duty_local+1, 7 
	MOVLW       255
	MOVWF       PID_HESAPLA_duty_tmp+2 
	MOVWF       PID_HESAPLA_duty_tmp+3 
;tigkynk_18f.mbas,764 :: 		duty_tmp = duty_tmp + ((pid_hata * PID_KP_NUM) / PID_DIV)
	MOVLW       3
	MOVWF       R4 
	MOVF        _pid_hata+0, 0 
	MOVWF       R0 
	MOVF        _pid_hata+1, 0 
	MOVWF       R1 
	MOVLW       0
	BTFSC       _pid_hata+1, 7 
	MOVLW       255
	MOVWF       R2 
	MOVWF       R3 
	MOVF        R4, 0 
L__PID_HESAPLA831:
	BZ          L__PID_HESAPLA832
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	ADDLW       255
	GOTO        L__PID_HESAPLA831
L__PID_HESAPLA832:
	MOVLW       8
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	ADDWF       PID_HESAPLA_duty_tmp+0, 0 
	MOVWF       FLOC__PID_HESAPLA+0 
	MOVF        R1, 0 
	ADDWFC      PID_HESAPLA_duty_tmp+1, 0 
	MOVWF       FLOC__PID_HESAPLA+1 
	MOVF        R2, 0 
	ADDWFC      PID_HESAPLA_duty_tmp+2, 0 
	MOVWF       FLOC__PID_HESAPLA+2 
	MOVF        R3, 0 
	ADDWFC      PID_HESAPLA_duty_tmp+3, 0 
	MOVWF       FLOC__PID_HESAPLA+3 
	MOVF        FLOC__PID_HESAPLA+0, 0 
	MOVWF       PID_HESAPLA_duty_tmp+0 
	MOVF        FLOC__PID_HESAPLA+1, 0 
	MOVWF       PID_HESAPLA_duty_tmp+1 
	MOVF        FLOC__PID_HESAPLA+2, 0 
	MOVWF       PID_HESAPLA_duty_tmp+2 
	MOVF        FLOC__PID_HESAPLA+3, 0 
	MOVWF       PID_HESAPLA_duty_tmp+3 
;tigkynk_18f.mbas,765 :: 		duty_tmp = duty_tmp + ((pid_integral * PID_KI_NUM) / PID_I_DIV)
	MOVLW       64
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        _pid_integral+0, 0 
	MOVWF       R0 
	MOVF        _pid_integral+1, 0 
	MOVWF       R1 
	MOVF        _pid_integral+2, 0 
	MOVWF       R2 
	MOVF        _pid_integral+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__PID_HESAPLA+0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	ADDWFC      FLOC__PID_HESAPLA+1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	ADDWFC      FLOC__PID_HESAPLA+2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	ADDWFC      FLOC__PID_HESAPLA+3, 0 
	MOVWF       R7 
	MOVF        R4, 0 
	MOVWF       PID_HESAPLA_duty_tmp+0 
	MOVF        R5, 0 
	MOVWF       PID_HESAPLA_duty_tmp+1 
	MOVF        R6, 0 
	MOVWF       PID_HESAPLA_duty_tmp+2 
	MOVF        R7, 0 
	MOVWF       PID_HESAPLA_duty_tmp+3 
;tigkynk_18f.mbas,767 :: 		if duty_tmp < 0 then
	MOVLW       128
	XORWF       R7, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA833
	MOVLW       0
	SUBWF       R6, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA833
	MOVLW       0
	SUBWF       R5, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA833
	MOVLW       0
	SUBWF       R4, 0 
L__PID_HESAPLA833:
	BTFSC       STATUS+0, 0 
	GOTO        L__PID_HESAPLA294
;tigkynk_18f.mbas,768 :: 		duty_tmp = 0
	CLRF        PID_HESAPLA_duty_tmp+0 
	CLRF        PID_HESAPLA_duty_tmp+1 
	CLRF        PID_HESAPLA_duty_tmp+2 
	CLRF        PID_HESAPLA_duty_tmp+3 
L__PID_HESAPLA294:
;tigkynk_18f.mbas,771 :: 		if duty_tmp > 255 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       PID_HESAPLA_duty_tmp+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA834
	MOVF        PID_HESAPLA_duty_tmp+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA834
	MOVF        PID_HESAPLA_duty_tmp+1, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA834
	MOVF        PID_HESAPLA_duty_tmp+0, 0 
	SUBLW       255
L__PID_HESAPLA834:
	BTFSC       STATUS+0, 0 
	GOTO        L__PID_HESAPLA297
;tigkynk_18f.mbas,772 :: 		duty_tmp = 255
	MOVLW       255
	MOVWF       PID_HESAPLA_duty_tmp+0 
	MOVLW       0
	MOVWF       PID_HESAPLA_duty_tmp+1 
	MOVWF       PID_HESAPLA_duty_tmp+2 
	MOVWF       PID_HESAPLA_duty_tmp+3 
L__PID_HESAPLA297:
;tigkynk_18f.mbas,775 :: 		fark = duty_tmp - pid_cikis
	MOVF        _pid_cikis+0, 0 
	SUBWF       PID_HESAPLA_duty_tmp+0, 0 
	MOVWF       R1 
	MOVF        _pid_cikis+1, 0 
	SUBWFB      PID_HESAPLA_duty_tmp+1, 0 
	MOVWF       R2 
	MOVF        R1, 0 
	MOVWF       PID_HESAPLA_fark+0 
	MOVF        R2, 0 
	MOVWF       PID_HESAPLA_fark+1 
;tigkynk_18f.mbas,776 :: 		limitli_cikis = duty_tmp
	MOVF        PID_HESAPLA_duty_tmp+0, 0 
	MOVWF       PID_HESAPLA_limitli_cikis+0 
	MOVF        PID_HESAPLA_duty_tmp+1, 0 
	MOVWF       PID_HESAPLA_limitli_cikis+1 
;tigkynk_18f.mbas,778 :: 		if fark > PID_MAX_STEP then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA835
	MOVF        R1, 0 
	SUBLW       3
L__PID_HESAPLA835:
	BTFSC       STATUS+0, 0 
	GOTO        L__PID_HESAPLA300
;tigkynk_18f.mbas,779 :: 		limitli_cikis = pid_cikis + PID_MAX_STEP
	MOVLW       3
	ADDWF       _pid_cikis+0, 0 
	MOVWF       PID_HESAPLA_limitli_cikis+0 
	MOVLW       0
	ADDWFC      _pid_cikis+1, 0 
	MOVWF       PID_HESAPLA_limitli_cikis+1 
L__PID_HESAPLA300:
;tigkynk_18f.mbas,782 :: 		if fark < -PID_MAX_STEP then
	MOVLW       128
	XORWF       PID_HESAPLA_fark+1, 0 
	MOVWF       R0 
	MOVLW       127
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA836
	MOVLW       253
	SUBWF       PID_HESAPLA_fark+0, 0 
L__PID_HESAPLA836:
	BTFSC       STATUS+0, 0 
	GOTO        L__PID_HESAPLA303
;tigkynk_18f.mbas,783 :: 		limitli_cikis = pid_cikis - PID_MAX_STEP
	MOVLW       3
	SUBWF       _pid_cikis+0, 0 
	MOVWF       PID_HESAPLA_limitli_cikis+0 
	MOVLW       0
	SUBWFB      _pid_cikis+1, 0 
	MOVWF       PID_HESAPLA_limitli_cikis+1 
L__PID_HESAPLA303:
;tigkynk_18f.mbas,786 :: 		if limitli_cikis < 0 then
	MOVLW       128
	XORWF       PID_HESAPLA_limitli_cikis+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA837
	MOVLW       0
	SUBWF       PID_HESAPLA_limitli_cikis+0, 0 
L__PID_HESAPLA837:
	BTFSC       STATUS+0, 0 
	GOTO        L__PID_HESAPLA306
;tigkynk_18f.mbas,787 :: 		limitli_cikis = 0
	CLRF        PID_HESAPLA_limitli_cikis+0 
	CLRF        PID_HESAPLA_limitli_cikis+1 
L__PID_HESAPLA306:
;tigkynk_18f.mbas,790 :: 		if limitli_cikis > 255 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       PID_HESAPLA_limitli_cikis+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PID_HESAPLA838
	MOVF        PID_HESAPLA_limitli_cikis+0, 0 
	SUBLW       255
L__PID_HESAPLA838:
	BTFSC       STATUS+0, 0 
	GOTO        L__PID_HESAPLA309
;tigkynk_18f.mbas,791 :: 		limitli_cikis = 255
	MOVLW       255
	MOVWF       PID_HESAPLA_limitli_cikis+0 
	MOVLW       0
	MOVWF       PID_HESAPLA_limitli_cikis+1 
L__PID_HESAPLA309:
;tigkynk_18f.mbas,794 :: 		pid_cikis = limitli_cikis
	MOVF        PID_HESAPLA_limitli_cikis+0, 0 
	MOVWF       _pid_cikis+0 
	MOVF        PID_HESAPLA_limitli_cikis+1, 0 
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,795 :: 		PWM1_Set_Duty(pid_cikis)
	MOVF        PID_HESAPLA_limitli_cikis+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,797 :: 		pid_onceki_hata = pid_hata
	MOVF        _pid_hata+0, 0 
	MOVWF       _pid_onceki_hata+0 
	MOVF        _pid_hata+1, 0 
	MOVWF       _pid_onceki_hata+1 
;tigkynk_18f.mbas,798 :: 		end sub
L_end_PID_HESAPLA:
	RETURN      0
; end of _PID_HESAPLA

_RAMP_UP_BASLAT:

;tigkynk_18f.mbas,808 :: 		dim duty_fark as word
;tigkynk_18f.mbas,810 :: 		if hedef_akim_local <= START_AKIM then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_RAMP_UP_BASLAT_hedef_akim_local+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RAMP_UP_BASLAT840
	MOVF        FARG_RAMP_UP_BASLAT_hedef_akim_local+0, 0 
	SUBLW       15
L__RAMP_UP_BASLAT840:
	BTFSS       STATUS+0, 0 
	GOTO        L__RAMP_UP_BASLAT313
;tigkynk_18f.mbas,811 :: 		baslangic_akim = hedef_akim_local
	MOVF        FARG_RAMP_UP_BASLAT_hedef_akim_local+0, 0 
	MOVWF       RAMP_UP_BASLAT_baslangic_akim+0 
	MOVF        FARG_RAMP_UP_BASLAT_hedef_akim_local+1, 0 
	MOVWF       RAMP_UP_BASLAT_baslangic_akim+1 
	GOTO        L__RAMP_UP_BASLAT314
;tigkynk_18f.mbas,812 :: 		else
L__RAMP_UP_BASLAT313:
;tigkynk_18f.mbas,813 :: 		baslangic_akim = START_AKIM
	MOVLW       15
	MOVWF       RAMP_UP_BASLAT_baslangic_akim+0 
	MOVLW       0
	MOVWF       RAMP_UP_BASLAT_baslangic_akim+1 
;tigkynk_18f.mbas,814 :: 		end if
L__RAMP_UP_BASLAT314:
;tigkynk_18f.mbas,816 :: 		baslangic_duty = AKIM_TO_DUTY(baslangic_akim)
	MOVF        RAMP_UP_BASLAT_baslangic_akim+0, 0 
	MOVWF       FARG_AKIM_TO_DUTY_akim+0 
	MOVF        RAMP_UP_BASLAT_baslangic_akim+1, 0 
	MOVWF       FARG_AKIM_TO_DUTY_akim+1 
	CALL        _AKIM_TO_DUTY+0, 0
	MOVF        R0, 0 
	MOVWF       RAMP_UP_BASLAT_baslangic_duty+0 
;tigkynk_18f.mbas,817 :: 		hedef = AKIM_TO_DUTY(hedef_akim_local)
	MOVF        FARG_RAMP_UP_BASLAT_hedef_akim_local+0, 0 
	MOVWF       FARG_AKIM_TO_DUTY_akim+0 
	MOVF        FARG_RAMP_UP_BASLAT_hedef_akim_local+1, 0 
	MOVWF       FARG_AKIM_TO_DUTY_akim+1 
	CALL        _AKIM_TO_DUTY+0, 0
	MOVF        R0, 0 
	MOVWF       RAMP_UP_BASLAT_hedef+0 
;tigkynk_18f.mbas,819 :: 		if hedef <= baslangic_duty then
	MOVF        R0, 0 
	SUBWF       RAMP_UP_BASLAT_baslangic_duty+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__RAMP_UP_BASLAT316
;tigkynk_18f.mbas,820 :: 		Pwm1_Set_Duty(hedef)
	MOVF        RAMP_UP_BASLAT_hedef+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,821 :: 		pid_cikis = hedef
	MOVF        RAMP_UP_BASLAT_hedef+0, 0 
	MOVWF       _pid_cikis+0 
	MOVLW       0
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,822 :: 		pid_onceki_hata = 0
	CLRF        _pid_onceki_hata+0 
	CLRF        _pid_onceki_hata+1 
;tigkynk_18f.mbas,823 :: 		pid_integral = 0
	CLRF        _pid_integral+0 
	CLRF        _pid_integral+1 
	CLRF        _pid_integral+2 
	CLRF        _pid_integral+3 
;tigkynk_18f.mbas,824 :: 		exit
	GOTO        L_end__RAMP_UP_BASLAT
L__RAMP_UP_BASLAT316:
;tigkynk_18f.mbas,827 :: 		if set2_value = 0 then
	MOVF        _set2_value+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__RAMP_UP_BASLAT319
;tigkynk_18f.mbas,828 :: 		Pwm1_Set_Duty(hedef)
	MOVF        RAMP_UP_BASLAT_hedef+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,829 :: 		pid_cikis = hedef
	MOVF        RAMP_UP_BASLAT_hedef+0, 0 
	MOVWF       _pid_cikis+0 
	MOVLW       0
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,830 :: 		pid_onceki_hata = 0
	CLRF        _pid_onceki_hata+0 
	CLRF        _pid_onceki_hata+1 
;tigkynk_18f.mbas,831 :: 		pid_integral = 0
	CLRF        _pid_integral+0 
	CLRF        _pid_integral+1 
	CLRF        _pid_integral+2 
	CLRF        _pid_integral+3 
;tigkynk_18f.mbas,832 :: 		exit
	GOTO        L_end__RAMP_UP_BASLAT
L__RAMP_UP_BASLAT319:
;tigkynk_18f.mbas,835 :: 		Pwm1_Set_Duty(baslangic_duty)
	MOVF        RAMP_UP_BASLAT_baslangic_duty+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,836 :: 		pid_cikis = baslangic_duty
	MOVF        RAMP_UP_BASLAT_baslangic_duty+0, 0 
	MOVWF       _pid_cikis+0 
	MOVLW       0
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,838 :: 		toplam_adim = set2_value * 100
	MOVF        _set2_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVF        R0, 0 
	MOVWF       RAMP_UP_BASLAT_toplam_adim+0 
	MOVF        R1, 0 
	MOVWF       RAMP_UP_BASLAT_toplam_adim+1 
;tigkynk_18f.mbas,839 :: 		if toplam_adim = 0 then
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RAMP_UP_BASLAT841
	MOVLW       0
	XORWF       R0, 0 
L__RAMP_UP_BASLAT841:
	BTFSS       STATUS+0, 2 
	GOTO        L__RAMP_UP_BASLAT322
;tigkynk_18f.mbas,840 :: 		toplam_adim = 1
	MOVLW       1
	MOVWF       RAMP_UP_BASLAT_toplam_adim+0 
	MOVLW       0
	MOVWF       RAMP_UP_BASLAT_toplam_adim+1 
L__RAMP_UP_BASLAT322:
;tigkynk_18f.mbas,843 :: 		duty_fark = hedef - baslangic_duty
	MOVF        RAMP_UP_BASLAT_baslangic_duty+0, 0 
	SUBWF       RAMP_UP_BASLAT_hedef+0, 0 
	MOVWF       RAMP_UP_BASLAT_duty_fark+0 
	MOVLW       0
	MOVWF       RAMP_UP_BASLAT_duty_fark+1 
	MOVLW       0
	SUBFWB      RAMP_UP_BASLAT_duty_fark+1, 1 
;tigkynk_18f.mbas,845 :: 		for a = 1 to toplam_adim
	MOVLW       1
	MOVWF       RAMP_UP_BASLAT_a+0 
	MOVLW       0
	MOVWF       RAMP_UP_BASLAT_a+1 
L__RAMP_UP_BASLAT324:
	MOVF        RAMP_UP_BASLAT_a+1, 0 
	SUBWF       RAMP_UP_BASLAT_toplam_adim+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RAMP_UP_BASLAT842
	MOVF        RAMP_UP_BASLAT_a+0, 0 
	SUBWF       RAMP_UP_BASLAT_toplam_adim+0, 0 
L__RAMP_UP_BASLAT842:
	BTFSS       STATUS+0, 0 
	GOTO        L__RAMP_UP_BASLAT328
;tigkynk_18f.mbas,847 :: 		if BASLATMA_VEYA_BLOK_IPTAL_VAR_MI() = 1 then
	CALL        _BASLATMA_VEYA_BLOK_IPTAL_VAR_MI+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__RAMP_UP_BASLAT330
;tigkynk_18f.mbas,848 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,849 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,850 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,851 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,852 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,853 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,854 :: 		exit
	GOTO        L_end__RAMP_UP_BASLAT
L__RAMP_UP_BASLAT330:
;tigkynk_18f.mbas,857 :: 		hesap_long = duty_fark
	MOVF        RAMP_UP_BASLAT_duty_fark+0, 0 
	MOVWF       RAMP_UP_BASLAT_hesap_long+0 
	MOVF        RAMP_UP_BASLAT_duty_fark+1, 0 
	MOVWF       RAMP_UP_BASLAT_hesap_long+1 
	MOVLW       0
	MOVWF       RAMP_UP_BASLAT_hesap_long+2 
	MOVWF       RAMP_UP_BASLAT_hesap_long+3 
;tigkynk_18f.mbas,858 :: 		hesap_long = hesap_long * a
	MOVF        RAMP_UP_BASLAT_hesap_long+0, 0 
	MOVWF       R0 
	MOVF        RAMP_UP_BASLAT_hesap_long+1, 0 
	MOVWF       R1 
	MOVF        RAMP_UP_BASLAT_hesap_long+2, 0 
	MOVWF       R2 
	MOVF        RAMP_UP_BASLAT_hesap_long+3, 0 
	MOVWF       R3 
	MOVF        RAMP_UP_BASLAT_a+0, 0 
	MOVWF       R4 
	MOVF        RAMP_UP_BASLAT_a+1, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       RAMP_UP_BASLAT_hesap_long+0 
	MOVF        R1, 0 
	MOVWF       RAMP_UP_BASLAT_hesap_long+1 
	MOVF        R2, 0 
	MOVWF       RAMP_UP_BASLAT_hesap_long+2 
	MOVF        R3, 0 
	MOVWF       RAMP_UP_BASLAT_hesap_long+3 
;tigkynk_18f.mbas,859 :: 		mevcut = baslangic_duty + (hesap_long / toplam_adim)
	MOVF        RAMP_UP_BASLAT_toplam_adim+0, 0 
	MOVWF       R4 
	MOVF        RAMP_UP_BASLAT_toplam_adim+1, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_U+0, 0
	MOVF        R0, 0 
	ADDWF       RAMP_UP_BASLAT_baslangic_duty+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       RAMP_UP_BASLAT_mevcut+0 
;tigkynk_18f.mbas,861 :: 		if mevcut > hedef then
	MOVF        R1, 0 
	SUBWF       RAMP_UP_BASLAT_hedef+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__RAMP_UP_BASLAT333
;tigkynk_18f.mbas,862 :: 		mevcut = hedef
	MOVF        RAMP_UP_BASLAT_hedef+0, 0 
	MOVWF       RAMP_UP_BASLAT_mevcut+0 
L__RAMP_UP_BASLAT333:
;tigkynk_18f.mbas,865 :: 		Pwm1_Set_Duty(mevcut)
	MOVF        RAMP_UP_BASLAT_mevcut+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,866 :: 		pid_cikis = mevcut
	MOVF        RAMP_UP_BASLAT_mevcut+0, 0 
	MOVWF       _pid_cikis+0 
	MOVLW       0
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,867 :: 		Delay_ms(10)
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L__RAMP_UP_BASLAT335:
	DECFSZ      R13, 1, 1
	BRA         L__RAMP_UP_BASLAT335
	DECFSZ      R12, 1, 1
	BRA         L__RAMP_UP_BASLAT335
	NOP
	NOP
;tigkynk_18f.mbas,868 :: 		next a
	MOVF        RAMP_UP_BASLAT_a+1, 0 
	XORWF       RAMP_UP_BASLAT_toplam_adim+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RAMP_UP_BASLAT843
	MOVF        RAMP_UP_BASLAT_toplam_adim+0, 0 
	XORWF       RAMP_UP_BASLAT_a+0, 0 
L__RAMP_UP_BASLAT843:
	BTFSC       STATUS+0, 2 
	GOTO        L__RAMP_UP_BASLAT328
	INFSNZ      RAMP_UP_BASLAT_a+0, 1 
	INCF        RAMP_UP_BASLAT_a+1, 1 
	GOTO        L__RAMP_UP_BASLAT324
L__RAMP_UP_BASLAT328:
;tigkynk_18f.mbas,870 :: 		Pwm1_Set_Duty(hedef)
	MOVF        RAMP_UP_BASLAT_hedef+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,871 :: 		pid_cikis = hedef
	MOVF        RAMP_UP_BASLAT_hedef+0, 0 
	MOVWF       _pid_cikis+0 
	MOVLW       0
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,872 :: 		pid_onceki_hata = 0
	CLRF        _pid_onceki_hata+0 
	CLRF        _pid_onceki_hata+1 
;tigkynk_18f.mbas,873 :: 		pid_integral = 0
	CLRF        _pid_integral+0 
	CLRF        _pid_integral+1 
	CLRF        _pid_integral+2 
	CLRF        _pid_integral+3 
;tigkynk_18f.mbas,874 :: 		end sub
L_end__RAMP_UP_BASLAT:
L_end_RAMP_UP_BASLAT:
	RETURN      0
; end of _RAMP_UP_BASLAT

_ARK_BEKLE_VE_RAMP_BASLAT:

;tigkynk_18f.mbas,882 :: 		dim hf_timeout as word
;tigkynk_18f.mbas,884 :: 		if hedef_akim <= START_AKIM then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _hedef_akim+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT845
	MOVF        _hedef_akim+0, 0 
	SUBLW       15
L__ARK_BEKLE_VE_RAMP_BASLAT845:
	BTFSS       STATUS+0, 0 
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT338
;tigkynk_18f.mbas,885 :: 		baslangic_akim = hedef_akim
	MOVF        _hedef_akim+0, 0 
	MOVWF       ARK_BEKLE_VE_RAMP_BASLAT_baslangic_akim+0 
	MOVF        _hedef_akim+1, 0 
	MOVWF       ARK_BEKLE_VE_RAMP_BASLAT_baslangic_akim+1 
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT339
;tigkynk_18f.mbas,886 :: 		else
L__ARK_BEKLE_VE_RAMP_BASLAT338:
;tigkynk_18f.mbas,887 :: 		baslangic_akim = START_AKIM
	MOVLW       15
	MOVWF       ARK_BEKLE_VE_RAMP_BASLAT_baslangic_akim+0 
	MOVLW       0
	MOVWF       ARK_BEKLE_VE_RAMP_BASLAT_baslangic_akim+1 
;tigkynk_18f.mbas,888 :: 		end if
L__ARK_BEKLE_VE_RAMP_BASLAT339:
;tigkynk_18f.mbas,890 :: 		baslangic_duty = AKIM_TO_DUTY(baslangic_akim)
	MOVF        ARK_BEKLE_VE_RAMP_BASLAT_baslangic_akim+0, 0 
	MOVWF       FARG_AKIM_TO_DUTY_akim+0 
	MOVF        ARK_BEKLE_VE_RAMP_BASLAT_baslangic_akim+1, 0 
	MOVWF       FARG_AKIM_TO_DUTY_akim+1 
	CALL        _AKIM_TO_DUTY+0, 0
	MOVF        R0, 0 
	MOVWF       ARK_BEKLE_VE_RAMP_BASLAT_baslangic_duty+0 
;tigkynk_18f.mbas,892 :: 		Pwm1_Set_Duty(baslangic_duty)
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,893 :: 		pid_cikis = baslangic_duty
	MOVF        ARK_BEKLE_VE_RAMP_BASLAT_baslangic_duty+0, 0 
	MOVWF       _pid_cikis+0 
	MOVLW       0
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,895 :: 		ark_var = 0
	CLRF        _ark_var+0 
;tigkynk_18f.mbas,896 :: 		ark_say = 0
	CLRF        _ark_say+0 
;tigkynk_18f.mbas,897 :: 		ark_dogrulama = 0
	CLRF        ARK_BEKLE_VE_RAMP_BASLAT_ark_dogrulama+0 
;tigkynk_18f.mbas,898 :: 		ark_bekle = 1
	MOVLW       1
	MOVWF       ARK_BEKLE_VE_RAMP_BASLAT_ark_bekle+0 
;tigkynk_18f.mbas,899 :: 		hf_timeout = 0
	CLRF        ARK_BEKLE_VE_RAMP_BASLAT_hf_timeout+0 
	CLRF        ARK_BEKLE_VE_RAMP_BASLAT_hf_timeout+1 
;tigkynk_18f.mbas,901 :: 		while (kaynak_izin = 1) and (ark_bekle = 1)
L__ARK_BEKLE_VE_RAMP_BASLAT341:
	MOVF        _kaynak_izin+0, 0 
	XORLW       1
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        ARK_BEKLE_VE_RAMP_BASLAT_ark_bekle+0, 0 
	XORLW       1
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT342
;tigkynk_18f.mbas,903 :: 		if BASLATMA_VEYA_BLOK_IPTAL_VAR_MI() = 1 then
	CALL        _BASLATMA_VEYA_BLOK_IPTAL_VAR_MI+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT346
;tigkynk_18f.mbas,904 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,905 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,906 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,907 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,908 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,909 :: 		ark_var = 0
	CLRF        _ark_var+0 
;tigkynk_18f.mbas,910 :: 		ark_say = 0
	CLRF        _ark_say+0 
;tigkynk_18f.mbas,911 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,912 :: 		exit
	GOTO        L_end__ARK_BEKLE_VE_RAMP_BASLAT
L__ARK_BEKLE_VE_RAMP_BASLAT346:
;tigkynk_18f.mbas,915 :: 		if hf_timeout < 300 then
	MOVLW       1
	SUBWF       ARK_BEKLE_VE_RAMP_BASLAT_hf_timeout+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT846
	MOVLW       44
	SUBWF       ARK_BEKLE_VE_RAMP_BASLAT_hf_timeout+0, 0 
L__ARK_BEKLE_VE_RAMP_BASLAT846:
	BTFSC       STATUS+0, 0 
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT349
;tigkynk_18f.mbas,916 :: 		Inc(hf_timeout)
	INFSNZ      ARK_BEKLE_VE_RAMP_BASLAT_hf_timeout+0, 1 
	INCF        ARK_BEKLE_VE_RAMP_BASLAT_hf_timeout+1, 1 
L__ARK_BEKLE_VE_RAMP_BASLAT349:
;tigkynk_18f.mbas,919 :: 		if ARK_DETECT_OKU() = 1 then
	CALL        _ARK_DETECT_OKU+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT352
;tigkynk_18f.mbas,920 :: 		if ark_dogrulama < 20 then
	MOVLW       20
	SUBWF       ARK_BEKLE_VE_RAMP_BASLAT_ark_dogrulama+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT355
;tigkynk_18f.mbas,921 :: 		Inc(ark_dogrulama)
	INCF        ARK_BEKLE_VE_RAMP_BASLAT_ark_dogrulama+0, 1 
L__ARK_BEKLE_VE_RAMP_BASLAT355:
;tigkynk_18f.mbas,922 :: 		end if
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT353
;tigkynk_18f.mbas,923 :: 		else
L__ARK_BEKLE_VE_RAMP_BASLAT352:
;tigkynk_18f.mbas,924 :: 		ark_dogrulama = 0
	CLRF        ARK_BEKLE_VE_RAMP_BASLAT_ark_dogrulama+0 
;tigkynk_18f.mbas,925 :: 		end if
L__ARK_BEKLE_VE_RAMP_BASLAT353:
;tigkynk_18f.mbas,927 :: 		if ark_dogrulama >= 20 then
	MOVLW       20
	SUBWF       ARK_BEKLE_VE_RAMP_BASLAT_ark_dogrulama+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT358
;tigkynk_18f.mbas,928 :: 		ark_var = 1
	MOVLW       1
	MOVWF       _ark_var+0 
;tigkynk_18f.mbas,929 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,930 :: 		ark_bekle = 0
	CLRF        ARK_BEKLE_VE_RAMP_BASLAT_ark_bekle+0 
L__ARK_BEKLE_VE_RAMP_BASLAT358:
;tigkynk_18f.mbas,933 :: 		if hf_timeout >= 300 then
	MOVLW       1
	SUBWF       ARK_BEKLE_VE_RAMP_BASLAT_hf_timeout+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT847
	MOVLW       44
	SUBWF       ARK_BEKLE_VE_RAMP_BASLAT_hf_timeout+0, 0 
L__ARK_BEKLE_VE_RAMP_BASLAT847:
	BTFSS       STATUS+0, 0 
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT361
;tigkynk_18f.mbas,934 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,935 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,936 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,937 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,938 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,939 :: 		ark_var = 0
	CLRF        _ark_var+0 
;tigkynk_18f.mbas,940 :: 		ark_say = 0
	CLRF        _ark_say+0 
;tigkynk_18f.mbas,941 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,942 :: 		kaynak_izin = 0
	CLRF        _kaynak_izin+0 
;tigkynk_18f.mbas,943 :: 		exit
	GOTO        L_end__ARK_BEKLE_VE_RAMP_BASLAT
L__ARK_BEKLE_VE_RAMP_BASLAT361:
;tigkynk_18f.mbas,946 :: 		Delay_ms(10)
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L__ARK_BEKLE_VE_RAMP_BASLAT363:
	DECFSZ      R13, 1, 1
	BRA         L__ARK_BEKLE_VE_RAMP_BASLAT363
	DECFSZ      R12, 1, 1
	BRA         L__ARK_BEKLE_VE_RAMP_BASLAT363
	NOP
	NOP
;tigkynk_18f.mbas,947 :: 		wend
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT341
L__ARK_BEKLE_VE_RAMP_BASLAT342:
;tigkynk_18f.mbas,949 :: 		if kaynak_izin = 0 then
	MOVF        _kaynak_izin+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT365
;tigkynk_18f.mbas,950 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,951 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,952 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,953 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,954 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,955 :: 		ark_var = 0
	CLRF        _ark_var+0 
;tigkynk_18f.mbas,956 :: 		ark_say = 0
	CLRF        _ark_say+0 
;tigkynk_18f.mbas,957 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,958 :: 		exit
	GOTO        L_end__ARK_BEKLE_VE_RAMP_BASLAT
L__ARK_BEKLE_VE_RAMP_BASLAT365:
;tigkynk_18f.mbas,961 :: 		if ark_var = 1 then
	MOVF        _ark_var+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__ARK_BEKLE_VE_RAMP_BASLAT368
;tigkynk_18f.mbas,962 :: 		RAMP_UP_BASLAT(hedef_akim)
	MOVF        _hedef_akim+0, 0 
	MOVWF       FARG_RAMP_UP_BASLAT_hedef_akim_local+0 
	MOVF        _hedef_akim+1, 0 
	MOVWF       FARG_RAMP_UP_BASLAT_hedef_akim_local+1 
	CALL        _RAMP_UP_BASLAT+0, 0
L__ARK_BEKLE_VE_RAMP_BASLAT368:
;tigkynk_18f.mbas,964 :: 		end sub
L_end__ARK_BEKLE_VE_RAMP_BASLAT:
L_end_ARK_BEKLE_VE_RAMP_BASLAT:
	RETURN      0
; end of _ARK_BEKLE_VE_RAMP_BASLAT

_LIFT_TIG_BEKLE_VE_RAMP_BASLAT:

;tigkynk_18f.mbas,976 :: 		dim adim3_tamam as byte
;tigkynk_18f.mbas,978 :: 		lift_duty = AKIM_TO_DUTY(LIFT_BASLANGIC_AKIM)
	MOVLW       8
	MOVWF       FARG_AKIM_TO_DUTY_akim+0 
	MOVLW       0
	MOVWF       FARG_AKIM_TO_DUTY_akim+1 
	CALL        _AKIM_TO_DUTY+0, 0
	MOVF        R0, 0 
	MOVWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_lift_duty+0 
;tigkynk_18f.mbas,980 :: 		Pwm1_Set_Duty(lift_duty)
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,981 :: 		pid_cikis = lift_duty
	MOVF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_lift_duty+0, 0 
	MOVWF       _pid_cikis+0 
	MOVLW       0
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,983 :: 		lift_temas_var = 0
	CLRF        _lift_temas_var+0 
;tigkynk_18f.mbas,984 :: 		temas_say = 0
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_temas_say+0 
;tigkynk_18f.mbas,985 :: 		birak_say = 0
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_birak_say+0 
;tigkynk_18f.mbas,986 :: 		ark_say_local = 0
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_ark_say_local+0 
;tigkynk_18f.mbas,987 :: 		timeout_say = 0
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+0 
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+1 
;tigkynk_18f.mbas,988 :: 		ark_var = 0
	CLRF        _ark_var+0 
;tigkynk_18f.mbas,990 :: 		adim1_tamam = 0
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_adim1_tamam+0 
;tigkynk_18f.mbas,991 :: 		adim2_tamam = 0
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_adim2_tamam+0 
;tigkynk_18f.mbas,992 :: 		adim3_tamam = 0
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_adim3_tamam+0 
;tigkynk_18f.mbas,995 :: 		while kaynak_izin = 1
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT372:
	MOVF        _kaynak_izin+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT373
;tigkynk_18f.mbas,997 :: 		if BASLATMA_VEYA_BLOK_IPTAL_VAR_MI() = 1 then
	CALL        _BASLATMA_VEYA_BLOK_IPTAL_VAR_MI+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT377
;tigkynk_18f.mbas,998 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,999 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,1000 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,1001 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,1002 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1003 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,1004 :: 		exit
	GOTO        L_end__LIFT_TIG_BEKLE_VE_RAMP_BASLAT
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT377:
;tigkynk_18f.mbas,1007 :: 		adc_now = ADC2_ORT_OKU()
	CALL        _ADC2_ORT_OKU+0, 0
;tigkynk_18f.mbas,1009 :: 		if adc_now > LIFT_TEMAS_ESIK then
	MOVLW       0
	MOVWF       R2 
	MOVF        R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT849
	MOVF        R0, 0 
	SUBLW       25
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT849:
	BTFSC       STATUS+0, 0 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT380
;tigkynk_18f.mbas,1010 :: 		if temas_say < 10 then
	MOVLW       10
	SUBWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_temas_say+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT383
;tigkynk_18f.mbas,1011 :: 		Inc(temas_say)
	INCF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_temas_say+0, 1 
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT383:
;tigkynk_18f.mbas,1012 :: 		end if
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT381
;tigkynk_18f.mbas,1013 :: 		else
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT380:
;tigkynk_18f.mbas,1014 :: 		temas_say = 0
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_temas_say+0 
;tigkynk_18f.mbas,1015 :: 		end if
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT381:
;tigkynk_18f.mbas,1017 :: 		if temas_say >= 3 then
	MOVLW       3
	SUBWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_temas_say+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT386
;tigkynk_18f.mbas,1018 :: 		lift_temas_var = 1
	MOVLW       1
	MOVWF       _lift_temas_var+0 
;tigkynk_18f.mbas,1019 :: 		adim1_tamam = 1
	MOVLW       1
	MOVWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_adim1_tamam+0 
;tigkynk_18f.mbas,1020 :: 		break
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT373
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT386:
;tigkynk_18f.mbas,1023 :: 		Inc(timeout_say)
	INFSNZ      LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+0, 1 
	INCF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+1, 1 
;tigkynk_18f.mbas,1024 :: 		if timeout_say >= LIFT_TIMEOUT then
	MOVLW       1
	SUBWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT850
	MOVLW       44
	SUBWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+0, 0 
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT850:
	BTFSS       STATUS+0, 0 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT389
;tigkynk_18f.mbas,1025 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1026 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,1027 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,1028 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,1029 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1030 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,1031 :: 		kaynak_izin = 0
	CLRF        _kaynak_izin+0 
;tigkynk_18f.mbas,1032 :: 		exit
	GOTO        L_end__LIFT_TIG_BEKLE_VE_RAMP_BASLAT
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT389:
;tigkynk_18f.mbas,1035 :: 		Delay_ms(10)
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT391:
	DECFSZ      R13, 1, 1
	BRA         L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT391
	DECFSZ      R12, 1, 1
	BRA         L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT391
	NOP
	NOP
;tigkynk_18f.mbas,1036 :: 		wend
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT372
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT373:
;tigkynk_18f.mbas,1038 :: 		if adim1_tamam = 0 then
	MOVF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_adim1_tamam+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT393
;tigkynk_18f.mbas,1039 :: 		exit
	GOTO        L_end__LIFT_TIG_BEKLE_VE_RAMP_BASLAT
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT393:
;tigkynk_18f.mbas,1042 :: 		if kaynak_izin = 0 then
	MOVF        _kaynak_izin+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT396
;tigkynk_18f.mbas,1043 :: 		exit
	GOTO        L_end__LIFT_TIG_BEKLE_VE_RAMP_BASLAT
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT396:
;tigkynk_18f.mbas,1047 :: 		timeout_say = 0
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+0 
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+1 
;tigkynk_18f.mbas,1049 :: 		while kaynak_izin = 1
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT399:
	MOVF        _kaynak_izin+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT400
;tigkynk_18f.mbas,1051 :: 		if BASLATMA_VEYA_BLOK_IPTAL_VAR_MI() = 1 then
	CALL        _BASLATMA_VEYA_BLOK_IPTAL_VAR_MI+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT404
;tigkynk_18f.mbas,1052 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1053 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,1054 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,1055 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,1056 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1057 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,1058 :: 		exit
	GOTO        L_end__LIFT_TIG_BEKLE_VE_RAMP_BASLAT
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT404:
;tigkynk_18f.mbas,1061 :: 		adc_now = ADC2_ORT_OKU()
	CALL        _ADC2_ORT_OKU+0, 0
;tigkynk_18f.mbas,1063 :: 		if adc_now < LIFT_BIRAK_ESIK then
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT851
	MOVLW       8
	SUBWF       R0, 0 
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT851:
	BTFSC       STATUS+0, 0 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT407
;tigkynk_18f.mbas,1064 :: 		if birak_say < 10 then
	MOVLW       10
	SUBWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_birak_say+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT410
;tigkynk_18f.mbas,1065 :: 		Inc(birak_say)
	INCF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_birak_say+0, 1 
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT410:
;tigkynk_18f.mbas,1066 :: 		end if
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT408
;tigkynk_18f.mbas,1067 :: 		else
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT407:
;tigkynk_18f.mbas,1068 :: 		birak_say = 0
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_birak_say+0 
;tigkynk_18f.mbas,1069 :: 		end if
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT408:
;tigkynk_18f.mbas,1071 :: 		if birak_say >= 3 then
	MOVLW       3
	SUBWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_birak_say+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT413
;tigkynk_18f.mbas,1072 :: 		adim2_tamam = 1
	MOVLW       1
	MOVWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_adim2_tamam+0 
;tigkynk_18f.mbas,1073 :: 		break
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT400
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT413:
;tigkynk_18f.mbas,1076 :: 		Inc(timeout_say)
	INFSNZ      LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+0, 1 
	INCF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+1, 1 
;tigkynk_18f.mbas,1077 :: 		if timeout_say >= LIFT_TIMEOUT then
	MOVLW       1
	SUBWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT852
	MOVLW       44
	SUBWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+0, 0 
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT852:
	BTFSS       STATUS+0, 0 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT416
;tigkynk_18f.mbas,1078 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1079 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,1080 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,1081 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,1082 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1083 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,1084 :: 		kaynak_izin = 0
	CLRF        _kaynak_izin+0 
;tigkynk_18f.mbas,1085 :: 		exit
	GOTO        L_end__LIFT_TIG_BEKLE_VE_RAMP_BASLAT
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT416:
;tigkynk_18f.mbas,1088 :: 		Delay_ms(10)
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT418:
	DECFSZ      R13, 1, 1
	BRA         L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT418
	DECFSZ      R12, 1, 1
	BRA         L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT418
	NOP
	NOP
;tigkynk_18f.mbas,1089 :: 		wend
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT399
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT400:
;tigkynk_18f.mbas,1091 :: 		if adim2_tamam = 0 then
	MOVF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_adim2_tamam+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT420
;tigkynk_18f.mbas,1092 :: 		exit
	GOTO        L_end__LIFT_TIG_BEKLE_VE_RAMP_BASLAT
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT420:
;tigkynk_18f.mbas,1095 :: 		if kaynak_izin = 0 then
	MOVF        _kaynak_izin+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT423
;tigkynk_18f.mbas,1096 :: 		exit
	GOTO        L_end__LIFT_TIG_BEKLE_VE_RAMP_BASLAT
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT423:
;tigkynk_18f.mbas,1100 :: 		timeout_say = 0
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+0 
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+1 
;tigkynk_18f.mbas,1102 :: 		while kaynak_izin = 1
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT426:
	MOVF        _kaynak_izin+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT427
;tigkynk_18f.mbas,1104 :: 		if BASLATMA_VEYA_BLOK_IPTAL_VAR_MI() = 1 then
	CALL        _BASLATMA_VEYA_BLOK_IPTAL_VAR_MI+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT431
;tigkynk_18f.mbas,1105 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1106 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,1107 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,1108 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,1109 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1110 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,1111 :: 		exit
	GOTO        L_end__LIFT_TIG_BEKLE_VE_RAMP_BASLAT
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT431:
;tigkynk_18f.mbas,1114 :: 		adc_now = ADC2_ORT_OKU()
	CALL        _ADC2_ORT_OKU+0, 0
;tigkynk_18f.mbas,1116 :: 		if adc_now > LIFT_ARK_ONAY_ESIK then
	MOVLW       0
	MOVWF       R2 
	MOVF        R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT853
	MOVF        R0, 0 
	SUBLW       20
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT853:
	BTFSC       STATUS+0, 0 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT434
;tigkynk_18f.mbas,1117 :: 		if ark_say_local < 20 then
	MOVLW       20
	SUBWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_ark_say_local+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT437
;tigkynk_18f.mbas,1118 :: 		Inc(ark_say_local)
	INCF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_ark_say_local+0, 1 
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT437:
;tigkynk_18f.mbas,1119 :: 		end if
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT435
;tigkynk_18f.mbas,1120 :: 		else
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT434:
;tigkynk_18f.mbas,1121 :: 		ark_say_local = 0
	CLRF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_ark_say_local+0 
;tigkynk_18f.mbas,1122 :: 		end if
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT435:
;tigkynk_18f.mbas,1124 :: 		if ark_say_local >= 5 then
	MOVLW       5
	SUBWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_ark_say_local+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT440
;tigkynk_18f.mbas,1125 :: 		ark_var = 1
	MOVLW       1
	MOVWF       _ark_var+0 
;tigkynk_18f.mbas,1126 :: 		adim3_tamam = 1
	MOVLW       1
	MOVWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_adim3_tamam+0 
;tigkynk_18f.mbas,1127 :: 		break
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT427
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT440:
;tigkynk_18f.mbas,1130 :: 		Inc(timeout_say)
	INFSNZ      LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+0, 1 
	INCF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+1, 1 
;tigkynk_18f.mbas,1131 :: 		if timeout_say >= LIFT_TIMEOUT then
	MOVLW       1
	SUBWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT854
	MOVLW       44
	SUBWF       LIFT_TIG_BEKLE_VE_RAMP_BASLAT_timeout_say+0, 0 
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT854:
	BTFSS       STATUS+0, 0 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT443
;tigkynk_18f.mbas,1132 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1133 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,1134 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,1135 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,1136 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1137 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,1138 :: 		kaynak_izin = 0
	CLRF        _kaynak_izin+0 
;tigkynk_18f.mbas,1139 :: 		exit
	GOTO        L_end__LIFT_TIG_BEKLE_VE_RAMP_BASLAT
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT443:
;tigkynk_18f.mbas,1142 :: 		Delay_ms(10)
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT445:
	DECFSZ      R13, 1, 1
	BRA         L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT445
	DECFSZ      R12, 1, 1
	BRA         L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT445
	NOP
	NOP
;tigkynk_18f.mbas,1143 :: 		wend
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT426
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT427:
;tigkynk_18f.mbas,1145 :: 		if adim3_tamam = 0 then
	MOVF        LIFT_TIG_BEKLE_VE_RAMP_BASLAT_adim3_tamam+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT447
;tigkynk_18f.mbas,1146 :: 		exit
	GOTO        L_end__LIFT_TIG_BEKLE_VE_RAMP_BASLAT
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT447:
;tigkynk_18f.mbas,1149 :: 		if kaynak_izin = 0 then
	MOVF        _kaynak_izin+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT450
;tigkynk_18f.mbas,1150 :: 		exit
	GOTO        L_end__LIFT_TIG_BEKLE_VE_RAMP_BASLAT
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT450:
;tigkynk_18f.mbas,1153 :: 		if ark_var = 1 then
	MOVF        _ark_var+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT453
;tigkynk_18f.mbas,1154 :: 		RAMP_UP_BASLAT(hedef_akim)
	MOVF        _hedef_akim+0, 0 
	MOVWF       FARG_RAMP_UP_BASLAT_hedef_akim_local+0 
	MOVF        _hedef_akim+1, 0 
	MOVWF       FARG_RAMP_UP_BASLAT_hedef_akim_local+1 
	CALL        _RAMP_UP_BASLAT+0, 0
L__LIFT_TIG_BEKLE_VE_RAMP_BASLAT453:
;tigkynk_18f.mbas,1156 :: 		end sub
L_end__LIFT_TIG_BEKLE_VE_RAMP_BASLAT:
L_end_LIFT_TIG_BEKLE_VE_RAMP_BASLAT:
	RETURN      0
; end of _LIFT_TIG_BEKLE_VE_RAMP_BASLAT

_ANTI_STICK_DURUM_MAKINESI:

;tigkynk_18f.mbas,1159 :: 		dim anti_duty as byte
;tigkynk_18f.mbas,1161 :: 		anti_duty = AKIM_TO_DUTY(ANTI_STICK_AKIM)
	MOVLW       10
	MOVWF       FARG_AKIM_TO_DUTY_akim+0 
	MOVLW       0
	MOVWF       FARG_AKIM_TO_DUTY_akim+1 
	CALL        _AKIM_TO_DUTY+0, 0
	MOVF        R0, 0 
	MOVWF       ANTI_STICK_DURUM_MAKINESI_anti_duty+0 
;tigkynk_18f.mbas,1164 :: 		if anti_stick_aktif = 0 then
	MOVF        _anti_stick_aktif+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI457
;tigkynk_18f.mbas,1166 :: 		if KISA_DEVRE_VAR_MI() = 1 then
	CALL        _KISA_DEVRE_VAR_MI+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI460
;tigkynk_18f.mbas,1167 :: 		if kisa_devre_say < KISA_DEVRE_KAPAT_SURE then
	MOVLW       0
	SUBWF       _kisa_devre_say+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI856
	MOVLW       200
	SUBWF       _kisa_devre_say+0, 0 
L__ANTI_STICK_DURUM_MAKINESI856:
	BTFSC       STATUS+0, 0 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI463
;tigkynk_18f.mbas,1168 :: 		Inc(kisa_devre_say)
	INFSNZ      _kisa_devre_say+0, 1 
	INCF        _kisa_devre_say+1, 1 
L__ANTI_STICK_DURUM_MAKINESI463:
;tigkynk_18f.mbas,1169 :: 		end if
	GOTO        L__ANTI_STICK_DURUM_MAKINESI461
;tigkynk_18f.mbas,1170 :: 		else
L__ANTI_STICK_DURUM_MAKINESI460:
;tigkynk_18f.mbas,1171 :: 		kisa_devre_say = 0
	CLRF        _kisa_devre_say+0 
	CLRF        _kisa_devre_say+1 
;tigkynk_18f.mbas,1172 :: 		end if
L__ANTI_STICK_DURUM_MAKINESI461:
;tigkynk_18f.mbas,1175 :: 		if kisa_devre_say >= KISA_DEVRE_KAPAT_SURE then
	MOVLW       0
	SUBWF       _kisa_devre_say+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI857
	MOVLW       200
	SUBWF       _kisa_devre_say+0, 0 
L__ANTI_STICK_DURUM_MAKINESI857:
	BTFSS       STATUS+0, 0 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI466
;tigkynk_18f.mbas,1176 :: 		anti_stick_aktif = 1
	MOVLW       1
	MOVWF       _anti_stick_aktif+0 
;tigkynk_18f.mbas,1177 :: 		anti_stick_durum = 1
	MOVLW       1
	MOVWF       _anti_stick_durum+0 
;tigkynk_18f.mbas,1178 :: 		anti_stick_timer = 0
	CLRF        _anti_stick_timer+0 
	CLRF        _anti_stick_timer+1 
;tigkynk_18f.mbas,1179 :: 		kisa_devre_say = 0
	CLRF        _kisa_devre_say+0 
	CLRF        _kisa_devre_say+1 
;tigkynk_18f.mbas,1181 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1182 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1183 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,1184 :: 		pid_integral = 0
	CLRF        _pid_integral+0 
	CLRF        _pid_integral+1 
	CLRF        _pid_integral+2 
	CLRF        _pid_integral+3 
;tigkynk_18f.mbas,1185 :: 		pid_onceki_hata = 0
	CLRF        _pid_onceki_hata+0 
	CLRF        _pid_onceki_hata+1 
L__ANTI_STICK_DURUM_MAKINESI466:
;tigkynk_18f.mbas,1188 :: 		exit
	GOTO        L_end__ANTI_STICK_DURUM_MAKINESI
L__ANTI_STICK_DURUM_MAKINESI457:
;tigkynk_18f.mbas,1192 :: 		if KISA_DEVRE_KALKTI_MI() = 1 then
	CALL        _KISA_DEVRE_KALKTI_MI+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI469
;tigkynk_18f.mbas,1193 :: 		anti_stick_aktif = 0
	CLRF        _anti_stick_aktif+0 
;tigkynk_18f.mbas,1194 :: 		anti_stick_durum = 0
	CLRF        _anti_stick_durum+0 
;tigkynk_18f.mbas,1195 :: 		anti_stick_timer = 0
	CLRF        _anti_stick_timer+0 
	CLRF        _anti_stick_timer+1 
;tigkynk_18f.mbas,1196 :: 		kisa_devre_say = 0
	CLRF        _kisa_devre_say+0 
	CLRF        _kisa_devre_say+1 
;tigkynk_18f.mbas,1197 :: 		pid_integral = 0
	CLRF        _pid_integral+0 
	CLRF        _pid_integral+1 
	CLRF        _pid_integral+2 
	CLRF        _pid_integral+3 
;tigkynk_18f.mbas,1198 :: 		pid_onceki_hata = 0
	CLRF        _pid_onceki_hata+0 
	CLRF        _pid_onceki_hata+1 
;tigkynk_18f.mbas,1199 :: 		exit
	GOTO        L_end__ANTI_STICK_DURUM_MAKINESI
L__ANTI_STICK_DURUM_MAKINESI469:
;tigkynk_18f.mbas,1203 :: 		if anti_stick_durum = 1 then
	MOVF        _anti_stick_durum+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI472
;tigkynk_18f.mbas,1204 :: 		if anti_stick_timer < ANTI_STICK_BEKLE_SURE then
	MOVLW       1
	SUBWF       _anti_stick_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI858
	MOVLW       144
	SUBWF       _anti_stick_timer+0, 0 
L__ANTI_STICK_DURUM_MAKINESI858:
	BTFSC       STATUS+0, 0 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI475
;tigkynk_18f.mbas,1205 :: 		Inc(anti_stick_timer)
	INFSNZ      _anti_stick_timer+0, 1 
	INCF        _anti_stick_timer+1, 1 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI476
;tigkynk_18f.mbas,1206 :: 		else
L__ANTI_STICK_DURUM_MAKINESI475:
;tigkynk_18f.mbas,1207 :: 		anti_stick_timer = 0
	CLRF        _anti_stick_timer+0 
	CLRF        _anti_stick_timer+1 
;tigkynk_18f.mbas,1208 :: 		anti_stick_durum = 2
	MOVLW       2
	MOVWF       _anti_stick_durum+0 
;tigkynk_18f.mbas,1209 :: 		Pwm1_Set_Duty(anti_duty)
	MOVF        ANTI_STICK_DURUM_MAKINESI_anti_duty+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1210 :: 		pid_cikis = anti_duty
	MOVF        ANTI_STICK_DURUM_MAKINESI_anti_duty+0, 0 
	MOVWF       _pid_cikis+0 
	MOVLW       0
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,1211 :: 		end if
L__ANTI_STICK_DURUM_MAKINESI476:
;tigkynk_18f.mbas,1212 :: 		exit
	GOTO        L_end__ANTI_STICK_DURUM_MAKINESI
L__ANTI_STICK_DURUM_MAKINESI472:
;tigkynk_18f.mbas,1216 :: 		if anti_stick_durum = 2 then
	MOVF        _anti_stick_durum+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI478
;tigkynk_18f.mbas,1217 :: 		if anti_stick_timer < ANTI_STICK_DENE_SURE then
	MOVLW       0
	SUBWF       _anti_stick_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI859
	MOVLW       100
	SUBWF       _anti_stick_timer+0, 0 
L__ANTI_STICK_DURUM_MAKINESI859:
	BTFSC       STATUS+0, 0 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI481
;tigkynk_18f.mbas,1218 :: 		Inc(anti_stick_timer)
	INFSNZ      _anti_stick_timer+0, 1 
	INCF        _anti_stick_timer+1, 1 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI482
;tigkynk_18f.mbas,1219 :: 		else
L__ANTI_STICK_DURUM_MAKINESI481:
;tigkynk_18f.mbas,1220 :: 		anti_stick_timer = 0
	CLRF        _anti_stick_timer+0 
	CLRF        _anti_stick_timer+1 
;tigkynk_18f.mbas,1222 :: 		if KISA_DEVRE_VAR_MI() = 1 then
	CALL        _KISA_DEVRE_VAR_MI+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI484
;tigkynk_18f.mbas,1223 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1224 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,1225 :: 		anti_stick_durum = 1
	MOVLW       1
	MOVWF       _anti_stick_durum+0 
	GOTO        L__ANTI_STICK_DURUM_MAKINESI485
;tigkynk_18f.mbas,1226 :: 		else
L__ANTI_STICK_DURUM_MAKINESI484:
;tigkynk_18f.mbas,1227 :: 		anti_stick_aktif = 0
	CLRF        _anti_stick_aktif+0 
;tigkynk_18f.mbas,1228 :: 		anti_stick_durum = 0
	CLRF        _anti_stick_durum+0 
;tigkynk_18f.mbas,1229 :: 		kisa_devre_say = 0
	CLRF        _kisa_devre_say+0 
	CLRF        _kisa_devre_say+1 
;tigkynk_18f.mbas,1230 :: 		pid_integral = 0
	CLRF        _pid_integral+0 
	CLRF        _pid_integral+1 
	CLRF        _pid_integral+2 
	CLRF        _pid_integral+3 
;tigkynk_18f.mbas,1231 :: 		pid_onceki_hata = 0
	CLRF        _pid_onceki_hata+0 
	CLRF        _pid_onceki_hata+1 
;tigkynk_18f.mbas,1232 :: 		end if
L__ANTI_STICK_DURUM_MAKINESI485:
;tigkynk_18f.mbas,1233 :: 		end if
L__ANTI_STICK_DURUM_MAKINESI482:
;tigkynk_18f.mbas,1234 :: 		exit
	GOTO        L_end__ANTI_STICK_DURUM_MAKINESI
L__ANTI_STICK_DURUM_MAKINESI478:
;tigkynk_18f.mbas,1236 :: 		end sub
L_end__ANTI_STICK_DURUM_MAKINESI:
L_end_ANTI_STICK_DURUM_MAKINESI:
	RETURN      0
; end of _ANTI_STICK_DURUM_MAKINESI

_DUTY_RAMP:

;tigkynk_18f.mbas,1243 :: 		dim mevcut_w as word
;tigkynk_18f.mbas,1245 :: 		if toplam_adim = 0 then
	MOVLW       0
	XORWF       FARG_DUTY_RAMP_toplam_adim+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DUTY_RAMP861
	MOVLW       0
	XORWF       FARG_DUTY_RAMP_toplam_adim+0, 0 
L__DUTY_RAMP861:
	BTFSS       STATUS+0, 2 
	GOTO        L__DUTY_RAMP488
;tigkynk_18f.mbas,1246 :: 		Pwm1_Set_Duty(duty_son)
	MOVF        FARG_DUTY_RAMP_duty_son+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1247 :: 		pid_cikis = duty_son
	MOVF        FARG_DUTY_RAMP_duty_son+0, 0 
	MOVWF       _pid_cikis+0 
	MOVLW       0
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,1248 :: 		exit
	GOTO        L_end__DUTY_RAMP
L__DUTY_RAMP488:
;tigkynk_18f.mbas,1251 :: 		if duty_ilk = duty_son then
	MOVF        FARG_DUTY_RAMP_duty_ilk+0, 0 
	XORWF       FARG_DUTY_RAMP_duty_son+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DUTY_RAMP491
;tigkynk_18f.mbas,1252 :: 		Pwm1_Set_Duty(duty_son)
	MOVF        FARG_DUTY_RAMP_duty_son+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1253 :: 		pid_cikis = duty_son
	MOVF        FARG_DUTY_RAMP_duty_son+0, 0 
	MOVWF       _pid_cikis+0 
	MOVLW       0
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,1254 :: 		exit
	GOTO        L_end__DUTY_RAMP
L__DUTY_RAMP491:
;tigkynk_18f.mbas,1257 :: 		if duty_ilk > duty_son then
	MOVF        FARG_DUTY_RAMP_duty_ilk+0, 0 
	SUBWF       FARG_DUTY_RAMP_duty_son+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__DUTY_RAMP494
;tigkynk_18f.mbas,1258 :: 		fark = duty_ilk - duty_son
	MOVF        FARG_DUTY_RAMP_duty_son+0, 0 
	SUBWF       FARG_DUTY_RAMP_duty_ilk+0, 0 
	MOVWF       DUTY_RAMP_fark+0 
	MOVLW       0
	MOVWF       DUTY_RAMP_fark+1 
	MOVLW       0
	SUBFWB      DUTY_RAMP_fark+1, 1 
;tigkynk_18f.mbas,1260 :: 		for a = 1 to toplam_adim
	MOVLW       1
	MOVWF       DUTY_RAMP_a+0 
	MOVLW       0
	MOVWF       DUTY_RAMP_a+1 
L__DUTY_RAMP496:
	MOVF        DUTY_RAMP_a+1, 0 
	SUBWF       FARG_DUTY_RAMP_toplam_adim+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DUTY_RAMP862
	MOVF        DUTY_RAMP_a+0, 0 
	SUBWF       FARG_DUTY_RAMP_toplam_adim+0, 0 
L__DUTY_RAMP862:
	BTFSS       STATUS+0, 0 
	GOTO        L__DUTY_RAMP500
;tigkynk_18f.mbas,1261 :: 		hesap_long = fark
	MOVF        DUTY_RAMP_fark+0, 0 
	MOVWF       DUTY_RAMP_hesap_long+0 
	MOVF        DUTY_RAMP_fark+1, 0 
	MOVWF       DUTY_RAMP_hesap_long+1 
	MOVLW       0
	MOVWF       DUTY_RAMP_hesap_long+2 
	MOVWF       DUTY_RAMP_hesap_long+3 
;tigkynk_18f.mbas,1262 :: 		hesap_long = hesap_long * a
	MOVF        DUTY_RAMP_hesap_long+0, 0 
	MOVWF       R0 
	MOVF        DUTY_RAMP_hesap_long+1, 0 
	MOVWF       R1 
	MOVF        DUTY_RAMP_hesap_long+2, 0 
	MOVWF       R2 
	MOVF        DUTY_RAMP_hesap_long+3, 0 
	MOVWF       R3 
	MOVF        DUTY_RAMP_a+0, 0 
	MOVWF       R4 
	MOVF        DUTY_RAMP_a+1, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       DUTY_RAMP_hesap_long+0 
	MOVF        R1, 0 
	MOVWF       DUTY_RAMP_hesap_long+1 
	MOVF        R2, 0 
	MOVWF       DUTY_RAMP_hesap_long+2 
	MOVF        R3, 0 
	MOVWF       DUTY_RAMP_hesap_long+3 
;tigkynk_18f.mbas,1263 :: 		mevcut_w = duty_ilk - (hesap_long / toplam_adim)
	MOVF        FARG_DUTY_RAMP_toplam_adim+0, 0 
	MOVWF       R4 
	MOVF        FARG_DUTY_RAMP_toplam_adim+1, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_U+0, 0
	MOVF        R0, 0 
	SUBWF       FARG_DUTY_RAMP_duty_ilk+0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVLW       0
	SUBFWB      R5, 1 
	MOVF        R4, 0 
	MOVWF       DUTY_RAMP_mevcut_w+0 
	MOVF        R5, 0 
	MOVWF       DUTY_RAMP_mevcut_w+1 
;tigkynk_18f.mbas,1265 :: 		if mevcut_w < duty_son then
	MOVLW       0
	SUBWF       R5, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DUTY_RAMP863
	MOVF        FARG_DUTY_RAMP_duty_son+0, 0 
	SUBWF       R4, 0 
L__DUTY_RAMP863:
	BTFSC       STATUS+0, 0 
	GOTO        L__DUTY_RAMP502
;tigkynk_18f.mbas,1266 :: 		mevcut_w = duty_son
	MOVF        FARG_DUTY_RAMP_duty_son+0, 0 
	MOVWF       DUTY_RAMP_mevcut_w+0 
	MOVLW       0
	MOVWF       DUTY_RAMP_mevcut_w+1 
L__DUTY_RAMP502:
;tigkynk_18f.mbas,1269 :: 		Pwm1_Set_Duty(mevcut_w)
	MOVF        DUTY_RAMP_mevcut_w+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1270 :: 		pid_cikis = mevcut_w
	MOVF        DUTY_RAMP_mevcut_w+0, 0 
	MOVWF       _pid_cikis+0 
	MOVF        DUTY_RAMP_mevcut_w+1, 0 
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,1271 :: 		Delay_ms(10)
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L__DUTY_RAMP504:
	DECFSZ      R13, 1, 1
	BRA         L__DUTY_RAMP504
	DECFSZ      R12, 1, 1
	BRA         L__DUTY_RAMP504
	NOP
	NOP
;tigkynk_18f.mbas,1272 :: 		next a
	MOVF        DUTY_RAMP_a+1, 0 
	XORWF       FARG_DUTY_RAMP_toplam_adim+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DUTY_RAMP864
	MOVF        FARG_DUTY_RAMP_toplam_adim+0, 0 
	XORWF       DUTY_RAMP_a+0, 0 
L__DUTY_RAMP864:
	BTFSC       STATUS+0, 2 
	GOTO        L__DUTY_RAMP500
	INFSNZ      DUTY_RAMP_a+0, 1 
	INCF        DUTY_RAMP_a+1, 1 
	GOTO        L__DUTY_RAMP496
L__DUTY_RAMP500:
	GOTO        L__DUTY_RAMP495
;tigkynk_18f.mbas,1273 :: 		else
L__DUTY_RAMP494:
;tigkynk_18f.mbas,1274 :: 		fark = duty_son - duty_ilk
	MOVF        FARG_DUTY_RAMP_duty_ilk+0, 0 
	SUBWF       FARG_DUTY_RAMP_duty_son+0, 0 
	MOVWF       DUTY_RAMP_fark+0 
	MOVLW       0
	MOVWF       DUTY_RAMP_fark+1 
	MOVLW       0
	SUBFWB      DUTY_RAMP_fark+1, 1 
;tigkynk_18f.mbas,1276 :: 		for a = 1 to toplam_adim
	MOVLW       1
	MOVWF       DUTY_RAMP_a+0 
	MOVLW       0
	MOVWF       DUTY_RAMP_a+1 
L__DUTY_RAMP505:
	MOVF        DUTY_RAMP_a+1, 0 
	SUBWF       FARG_DUTY_RAMP_toplam_adim+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DUTY_RAMP865
	MOVF        DUTY_RAMP_a+0, 0 
	SUBWF       FARG_DUTY_RAMP_toplam_adim+0, 0 
L__DUTY_RAMP865:
	BTFSS       STATUS+0, 0 
	GOTO        L__DUTY_RAMP509
;tigkynk_18f.mbas,1277 :: 		hesap_long = fark
	MOVF        DUTY_RAMP_fark+0, 0 
	MOVWF       DUTY_RAMP_hesap_long+0 
	MOVF        DUTY_RAMP_fark+1, 0 
	MOVWF       DUTY_RAMP_hesap_long+1 
	MOVLW       0
	MOVWF       DUTY_RAMP_hesap_long+2 
	MOVWF       DUTY_RAMP_hesap_long+3 
;tigkynk_18f.mbas,1278 :: 		hesap_long = hesap_long * a
	MOVF        DUTY_RAMP_hesap_long+0, 0 
	MOVWF       R0 
	MOVF        DUTY_RAMP_hesap_long+1, 0 
	MOVWF       R1 
	MOVF        DUTY_RAMP_hesap_long+2, 0 
	MOVWF       R2 
	MOVF        DUTY_RAMP_hesap_long+3, 0 
	MOVWF       R3 
	MOVF        DUTY_RAMP_a+0, 0 
	MOVWF       R4 
	MOVF        DUTY_RAMP_a+1, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       DUTY_RAMP_hesap_long+0 
	MOVF        R1, 0 
	MOVWF       DUTY_RAMP_hesap_long+1 
	MOVF        R2, 0 
	MOVWF       DUTY_RAMP_hesap_long+2 
	MOVF        R3, 0 
	MOVWF       DUTY_RAMP_hesap_long+3 
;tigkynk_18f.mbas,1279 :: 		mevcut_w = duty_ilk + (hesap_long / toplam_adim)
	MOVF        FARG_DUTY_RAMP_toplam_adim+0, 0 
	MOVWF       R4 
	MOVF        FARG_DUTY_RAMP_toplam_adim+1, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_U+0, 0
	MOVF        FARG_DUTY_RAMP_duty_ilk+0, 0 
	ADDWF       R0, 0 
	MOVWF       R4 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R5 
	MOVF        R4, 0 
	MOVWF       DUTY_RAMP_mevcut_w+0 
	MOVF        R5, 0 
	MOVWF       DUTY_RAMP_mevcut_w+1 
;tigkynk_18f.mbas,1281 :: 		if mevcut_w > duty_son then
	MOVLW       0
	MOVWF       R0 
	MOVF        R5, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DUTY_RAMP866
	MOVF        R4, 0 
	SUBWF       FARG_DUTY_RAMP_duty_son+0, 0 
L__DUTY_RAMP866:
	BTFSC       STATUS+0, 0 
	GOTO        L__DUTY_RAMP511
;tigkynk_18f.mbas,1282 :: 		mevcut_w = duty_son
	MOVF        FARG_DUTY_RAMP_duty_son+0, 0 
	MOVWF       DUTY_RAMP_mevcut_w+0 
	MOVLW       0
	MOVWF       DUTY_RAMP_mevcut_w+1 
L__DUTY_RAMP511:
;tigkynk_18f.mbas,1285 :: 		Pwm1_Set_Duty(mevcut_w)
	MOVF        DUTY_RAMP_mevcut_w+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1286 :: 		pid_cikis = mevcut_w
	MOVF        DUTY_RAMP_mevcut_w+0, 0 
	MOVWF       _pid_cikis+0 
	MOVF        DUTY_RAMP_mevcut_w+1, 0 
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,1287 :: 		Delay_ms(10)
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L__DUTY_RAMP513:
	DECFSZ      R13, 1, 1
	BRA         L__DUTY_RAMP513
	DECFSZ      R12, 1, 1
	BRA         L__DUTY_RAMP513
	NOP
	NOP
;tigkynk_18f.mbas,1288 :: 		next a
	MOVF        DUTY_RAMP_a+1, 0 
	XORWF       FARG_DUTY_RAMP_toplam_adim+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DUTY_RAMP867
	MOVF        FARG_DUTY_RAMP_toplam_adim+0, 0 
	XORWF       DUTY_RAMP_a+0, 0 
L__DUTY_RAMP867:
	BTFSC       STATUS+0, 2 
	GOTO        L__DUTY_RAMP509
	INFSNZ      DUTY_RAMP_a+0, 1 
	INCF        DUTY_RAMP_a+1, 1 
	GOTO        L__DUTY_RAMP505
L__DUTY_RAMP509:
;tigkynk_18f.mbas,1289 :: 		end if
L__DUTY_RAMP495:
;tigkynk_18f.mbas,1291 :: 		Pwm1_Set_Duty(duty_son)
	MOVF        FARG_DUTY_RAMP_duty_son+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1292 :: 		pid_cikis = duty_son
	MOVF        FARG_DUTY_RAMP_duty_son+0, 0 
	MOVWF       _pid_cikis+0 
	MOVLW       0
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,1293 :: 		end sub
L_end__DUTY_RAMP:
L_end_DUTY_RAMP:
	RETURN      0
; end of _DUTY_RAMP

_CRATER_FILL_BASLAT:

;tigkynk_18f.mbas,1298 :: 		dim crater_duty as byte
;tigkynk_18f.mbas,1300 :: 		crater_duty = AKIM_TO_DUTY(CRATER_AKIM)
	MOVLW       10
	MOVWF       FARG_AKIM_TO_DUTY_akim+0 
	MOVLW       0
	MOVWF       FARG_AKIM_TO_DUTY_akim+1 
	CALL        _AKIM_TO_DUTY+0, 0
	MOVF        R0, 0 
	MOVWF       CRATER_FILL_BASLAT_crater_duty+0 
;tigkynk_18f.mbas,1301 :: 		Pwm1_Set_Duty(crater_duty)
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1302 :: 		pid_cikis = crater_duty
	MOVF        CRATER_FILL_BASLAT_crater_duty+0, 0 
	MOVWF       _pid_cikis+0 
	MOVLW       0
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,1304 :: 		for c = 1 to CRATER_SURE
	MOVLW       1
	MOVWF       CRATER_FILL_BASLAT_c+0 
L__CRATER_FILL_BASLAT516:
;tigkynk_18f.mbas,1305 :: 		Delay_ms(10)
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L__CRATER_FILL_BASLAT520:
	DECFSZ      R13, 1, 1
	BRA         L__CRATER_FILL_BASLAT520
	DECFSZ      R12, 1, 1
	BRA         L__CRATER_FILL_BASLAT520
	NOP
	NOP
;tigkynk_18f.mbas,1306 :: 		next c
	MOVF        CRATER_FILL_BASLAT_c+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L__CRATER_FILL_BASLAT519
	INCF        CRATER_FILL_BASLAT_c+0, 1 
	GOTO        L__CRATER_FILL_BASLAT516
L__CRATER_FILL_BASLAT519:
;tigkynk_18f.mbas,1307 :: 		end sub
L_end_CRATER_FILL_BASLAT:
	RETURN      0
; end of _CRATER_FILL_BASLAT

_BITIRME_RAMP_VE_CRATER:

;tigkynk_18f.mbas,1313 :: 		dim yarim_adim as word
;tigkynk_18f.mbas,1315 :: 		mevcut_duty = pid_cikis
	MOVF        _pid_cikis+0, 0 
	MOVWF       BITIRME_RAMP_VE_CRATER_mevcut_duty+0 
;tigkynk_18f.mbas,1316 :: 		crater_duty = AKIM_TO_DUTY(CRATER_AKIM)
	MOVLW       10
	MOVWF       FARG_AKIM_TO_DUTY_akim+0 
	MOVLW       0
	MOVWF       FARG_AKIM_TO_DUTY_akim+1 
	CALL        _AKIM_TO_DUTY+0, 0
	MOVF        R0, 0 
	MOVWF       BITIRME_RAMP_VE_CRATER_crater_duty+0 
;tigkynk_18f.mbas,1318 :: 		yarim_adim = set3_value * 50
	MOVF        _set3_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       50
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVF        R0, 0 
	MOVWF       BITIRME_RAMP_VE_CRATER_yarim_adim+0 
	MOVF        R1, 0 
	MOVWF       BITIRME_RAMP_VE_CRATER_yarim_adim+1 
;tigkynk_18f.mbas,1320 :: 		if set3_value = 0 then
	MOVF        _set3_value+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BITIRME_RAMP_VE_CRATER523
;tigkynk_18f.mbas,1321 :: 		if mevcut_duty > crater_duty then
	MOVF        BITIRME_RAMP_VE_CRATER_mevcut_duty+0, 0 
	SUBWF       BITIRME_RAMP_VE_CRATER_crater_duty+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__BITIRME_RAMP_VE_CRATER526
;tigkynk_18f.mbas,1322 :: 		Pwm1_Set_Duty(crater_duty)
	MOVF        BITIRME_RAMP_VE_CRATER_crater_duty+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1323 :: 		pid_cikis = crater_duty
	MOVF        BITIRME_RAMP_VE_CRATER_crater_duty+0, 0 
	MOVWF       _pid_cikis+0 
	MOVLW       0
	MOVWF       _pid_cikis+1 
L__BITIRME_RAMP_VE_CRATER526:
;tigkynk_18f.mbas,1325 :: 		CRATER_FILL_BASLAT()
	CALL        _CRATER_FILL_BASLAT+0, 0
;tigkynk_18f.mbas,1326 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1327 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,1328 :: 		exit
	GOTO        L_end__BITIRME_RAMP_VE_CRATER
L__BITIRME_RAMP_VE_CRATER523:
;tigkynk_18f.mbas,1331 :: 		if mevcut_duty > crater_duty then
	MOVF        BITIRME_RAMP_VE_CRATER_mevcut_duty+0, 0 
	SUBWF       BITIRME_RAMP_VE_CRATER_crater_duty+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__BITIRME_RAMP_VE_CRATER529
;tigkynk_18f.mbas,1332 :: 		DUTY_RAMP(mevcut_duty, crater_duty, yarim_adim)
	MOVF        BITIRME_RAMP_VE_CRATER_mevcut_duty+0, 0 
	MOVWF       FARG_DUTY_RAMP_duty_ilk+0 
	MOVF        BITIRME_RAMP_VE_CRATER_crater_duty+0, 0 
	MOVWF       FARG_DUTY_RAMP_duty_son+0 
	MOVF        BITIRME_RAMP_VE_CRATER_yarim_adim+0, 0 
	MOVWF       FARG_DUTY_RAMP_toplam_adim+0 
	MOVF        BITIRME_RAMP_VE_CRATER_yarim_adim+1, 0 
	MOVWF       FARG_DUTY_RAMP_toplam_adim+1 
	CALL        _DUTY_RAMP+0, 0
	GOTO        L__BITIRME_RAMP_VE_CRATER530
;tigkynk_18f.mbas,1333 :: 		else
L__BITIRME_RAMP_VE_CRATER529:
;tigkynk_18f.mbas,1334 :: 		Pwm1_Set_Duty(mevcut_duty)
	MOVF        BITIRME_RAMP_VE_CRATER_mevcut_duty+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1335 :: 		pid_cikis = mevcut_duty
	MOVF        BITIRME_RAMP_VE_CRATER_mevcut_duty+0, 0 
	MOVWF       _pid_cikis+0 
	MOVLW       0
	MOVWF       _pid_cikis+1 
;tigkynk_18f.mbas,1336 :: 		end if
L__BITIRME_RAMP_VE_CRATER530:
;tigkynk_18f.mbas,1338 :: 		CRATER_FILL_BASLAT()
	CALL        _CRATER_FILL_BASLAT+0, 0
;tigkynk_18f.mbas,1339 :: 		DUTY_RAMP(pid_cikis, 0, yarim_adim)
	MOVF        _pid_cikis+0, 0 
	MOVWF       FARG_DUTY_RAMP_duty_ilk+0 
	CLRF        FARG_DUTY_RAMP_duty_son+0 
	MOVF        BITIRME_RAMP_VE_CRATER_yarim_adim+0, 0 
	MOVWF       FARG_DUTY_RAMP_toplam_adim+0 
	MOVF        BITIRME_RAMP_VE_CRATER_yarim_adim+1, 0 
	MOVWF       FARG_DUTY_RAMP_toplam_adim+1 
	CALL        _DUTY_RAMP+0, 0
;tigkynk_18f.mbas,1340 :: 		end sub
L_end__BITIRME_RAMP_VE_CRATER:
L_end_BITIRME_RAMP_VE_CRATER:
	RETURN      0
; end of _BITIRME_RAMP_VE_CRATER

_SON_GAZ_BASLAT:

;tigkynk_18f.mbas,1345 :: 		dim t as byte
;tigkynk_18f.mbas,1347 :: 		GAS = 1
	BSF         PORTE+0, 1 
;tigkynk_18f.mbas,1349 :: 		if set4_value = 0 then
	MOVF        _set4_value+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__SON_GAZ_BASLAT533
;tigkynk_18f.mbas,1350 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,1351 :: 		exit
	GOTO        L_end__SON_GAZ_BASLAT
L__SON_GAZ_BASLAT533:
;tigkynk_18f.mbas,1354 :: 		for sg_say = 1 to set4_value
	MOVLW       1
	MOVWF       R1 
L__SON_GAZ_BASLAT535:
	MOVF        R1, 0 
	SUBWF       _set4_value+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__SON_GAZ_BASLAT539
;tigkynk_18f.mbas,1355 :: 		for t = 1 to 100
	MOVLW       1
	MOVWF       R2 
L__SON_GAZ_BASLAT541:
;tigkynk_18f.mbas,1356 :: 		Delay_ms(10)
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L__SON_GAZ_BASLAT545:
	DECFSZ      R13, 1, 1
	BRA         L__SON_GAZ_BASLAT545
	DECFSZ      R12, 1, 1
	BRA         L__SON_GAZ_BASLAT545
	NOP
	NOP
;tigkynk_18f.mbas,1357 :: 		next t
	MOVF        R2, 0 
	XORLW       100
	BTFSC       STATUS+0, 2 
	GOTO        L__SON_GAZ_BASLAT544
	INCF        R2, 1 
	GOTO        L__SON_GAZ_BASLAT541
L__SON_GAZ_BASLAT544:
;tigkynk_18f.mbas,1358 :: 		next sg_say
	MOVF        R1, 0 
	XORWF       _set4_value+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L__SON_GAZ_BASLAT539
	INCF        R1, 1 
	GOTO        L__SON_GAZ_BASLAT535
L__SON_GAZ_BASLAT539:
;tigkynk_18f.mbas,1360 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,1361 :: 		end sub
L_end__SON_GAZ_BASLAT:
L_end_SON_GAZ_BASLAT:
	RETURN      0
; end of _SON_GAZ_BASLAT

_PARAMETRE_IN:

;tigkynk_18f.mbas,1364 :: 		sub procedure PARAMETRE_IN()
;tigkynk_18f.mbas,1366 :: 		if setting_mode = 0 then
	MOVF        _setting_mode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN548
;tigkynk_18f.mbas,1367 :: 		if (son_setting = 1) and (SETING = 0) then
	MOVF        _son_setting+0, 0 
	XORLW       1
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	BTFSC       PORTD+0, 7 
	GOTO        L__PARAMETRE_IN872
	BSF         STATUS+0, 0 
	GOTO        L__PARAMETRE_IN873
L__PARAMETRE_IN872:
	BCF         STATUS+0, 0 
L__PARAMETRE_IN873:
	CLRF        R0 
	BTFSC       STATUS+0, 0 
	INCF        R0, 1 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN551
;tigkynk_18f.mbas,1368 :: 		Delay_ms(25)
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L__PARAMETRE_IN553:
	DECFSZ      R13, 1, 1
	BRA         L__PARAMETRE_IN553
	DECFSZ      R12, 1, 1
	BRA         L__PARAMETRE_IN553
	NOP
	NOP
;tigkynk_18f.mbas,1369 :: 		if SETING = 0 then
	BTFSC       PORTD+0, 7 
	GOTO        L__PARAMETRE_IN555
;tigkynk_18f.mbas,1370 :: 		setting_mode = 1
	MOVLW       1
	MOVWF       _setting_mode+0 
;tigkynk_18f.mbas,1371 :: 		secilen_parametre = 1
	MOVLW       1
	MOVWF       _secilen_parametre+0 
;tigkynk_18f.mbas,1372 :: 		normal_encoder_value = encoderValue
	MOVF        _encoderValue+0, 0 
	MOVWF       _normal_encoder_value+0 
	MOVF        _encoderValue+1, 0 
	MOVWF       _normal_encoder_value+1 
;tigkynk_18f.mbas,1373 :: 		encoderValue = set1_value
	MOVF        _set1_value+0, 0 
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
;tigkynk_18f.mbas,1374 :: 		son_setting = 0
	CLRF        _son_setting+0 
;tigkynk_18f.mbas,1375 :: 		Parametre_No_Goster(1)
	MOVLW       1
	MOVWF       FARG_Parametre_No_Goster_p+0 
	CALL        _Parametre_No_Goster+0, 0
;tigkynk_18f.mbas,1376 :: 		exit
	GOTO        L_end__PARAMETRE_IN
L__PARAMETRE_IN555:
;tigkynk_18f.mbas,1377 :: 		end if
L__PARAMETRE_IN551:
;tigkynk_18f.mbas,1378 :: 		end if
L__PARAMETRE_IN548:
;tigkynk_18f.mbas,1381 :: 		if setting_mode = 1 then
	MOVF        _setting_mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN558
;tigkynk_18f.mbas,1383 :: 		if SETING = 0 then
	BTFSC       PORTD+0, 7 
	GOTO        L__PARAMETRE_IN561
;tigkynk_18f.mbas,1384 :: 		Parametre_No_Goster(secilen_parametre)
	MOVF        _secilen_parametre+0, 0 
	MOVWF       FARG_Parametre_No_Goster_p+0 
	CALL        _Parametre_No_Goster+0, 0
	GOTO        L__PARAMETRE_IN562
;tigkynk_18f.mbas,1385 :: 		else
L__PARAMETRE_IN561:
;tigkynk_18f.mbas,1386 :: 		Parametre_Flag_Aktif(secilen_parametre)
	MOVF        _secilen_parametre+0, 0 
	MOVWF       FARG_Parametre_Flag_Aktif_p+0 
	CALL        _Parametre_Flag_Aktif+0, 0
;tigkynk_18f.mbas,1389 :: 		case 1
	MOVF        _secilen_parametre+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN566
;tigkynk_18f.mbas,1390 :: 		if encoderValue > 10 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN874
	MOVF        _encoderValue+0, 0 
	SUBLW       10
L__PARAMETRE_IN874:
	BTFSC       STATUS+0, 0 
	GOTO        L__PARAMETRE_IN568
;tigkynk_18f.mbas,1391 :: 		encoderValue = 10
	MOVLW       10
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
L__PARAMETRE_IN568:
;tigkynk_18f.mbas,1393 :: 		set1_value = encoderValue
	MOVF        _encoderValue+0, 0 
	MOVWF       _set1_value+0 
	GOTO        L__PARAMETRE_IN563
L__PARAMETRE_IN566:
;tigkynk_18f.mbas,1395 :: 		case 2
	MOVF        _secilen_parametre+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN572
;tigkynk_18f.mbas,1396 :: 		if encoderValue > 20 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN875
	MOVF        _encoderValue+0, 0 
	SUBLW       20
L__PARAMETRE_IN875:
	BTFSC       STATUS+0, 0 
	GOTO        L__PARAMETRE_IN574
;tigkynk_18f.mbas,1397 :: 		encoderValue = 20
	MOVLW       20
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
L__PARAMETRE_IN574:
;tigkynk_18f.mbas,1399 :: 		set2_value = encoderValue
	MOVF        _encoderValue+0, 0 
	MOVWF       _set2_value+0 
	GOTO        L__PARAMETRE_IN563
L__PARAMETRE_IN572:
;tigkynk_18f.mbas,1401 :: 		case 3
	MOVF        _secilen_parametre+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN578
;tigkynk_18f.mbas,1402 :: 		if encoderValue > 20 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN876
	MOVF        _encoderValue+0, 0 
	SUBLW       20
L__PARAMETRE_IN876:
	BTFSC       STATUS+0, 0 
	GOTO        L__PARAMETRE_IN580
;tigkynk_18f.mbas,1403 :: 		encoderValue = 20
	MOVLW       20
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
L__PARAMETRE_IN580:
;tigkynk_18f.mbas,1405 :: 		set3_value = encoderValue
	MOVF        _encoderValue+0, 0 
	MOVWF       _set3_value+0 
	GOTO        L__PARAMETRE_IN563
L__PARAMETRE_IN578:
;tigkynk_18f.mbas,1407 :: 		case 4
	MOVF        _secilen_parametre+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN584
;tigkynk_18f.mbas,1408 :: 		if encoderValue > 20 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN877
	MOVF        _encoderValue+0, 0 
	SUBLW       20
L__PARAMETRE_IN877:
	BTFSC       STATUS+0, 0 
	GOTO        L__PARAMETRE_IN586
;tigkynk_18f.mbas,1409 :: 		encoderValue = 20
	MOVLW       20
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
L__PARAMETRE_IN586:
;tigkynk_18f.mbas,1411 :: 		set4_value = encoderValue
	MOVF        _encoderValue+0, 0 
	MOVWF       _set4_value+0 
	GOTO        L__PARAMETRE_IN563
L__PARAMETRE_IN584:
;tigkynk_18f.mbas,1412 :: 		case 5
	MOVF        _secilen_parametre+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN590
;tigkynk_18f.mbas,1413 :: 		if encoderValue > 20 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN878
	MOVF        _encoderValue+0, 0 
	SUBLW       20
L__PARAMETRE_IN878:
	BTFSC       STATUS+0, 0 
	GOTO        L__PARAMETRE_IN592
;tigkynk_18f.mbas,1414 :: 		encoderValue = 20
	MOVLW       20
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
L__PARAMETRE_IN592:
;tigkynk_18f.mbas,1416 :: 		set5_value = encoderValue
	MOVF        _encoderValue+0, 0 
	MOVWF       _set5_value+0 
	GOTO        L__PARAMETRE_IN563
L__PARAMETRE_IN590:
;tigkynk_18f.mbas,1417 :: 		case 6
	MOVF        _secilen_parametre+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN596
;tigkynk_18f.mbas,1418 :: 		if encoderValue > 100 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN879
	MOVF        _encoderValue+0, 0 
	SUBLW       100
L__PARAMETRE_IN879:
	BTFSC       STATUS+0, 0 
	GOTO        L__PARAMETRE_IN598
;tigkynk_18f.mbas,1419 :: 		encoderValue = 100
	MOVLW       100
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
L__PARAMETRE_IN598:
;tigkynk_18f.mbas,1421 :: 		set6_value = encoderValue
	MOVF        _encoderValue+0, 0 
	MOVWF       _set6_value+0 
	GOTO        L__PARAMETRE_IN563
L__PARAMETRE_IN596:
;tigkynk_18f.mbas,1422 :: 		case 7
	MOVF        _secilen_parametre+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN602
;tigkynk_18f.mbas,1423 :: 		if encoderValue > 100 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN880
	MOVF        _encoderValue+0, 0 
	SUBLW       100
L__PARAMETRE_IN880:
	BTFSC       STATUS+0, 0 
	GOTO        L__PARAMETRE_IN604
;tigkynk_18f.mbas,1424 :: 		encoderValue = 100
	MOVLW       100
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
L__PARAMETRE_IN604:
;tigkynk_18f.mbas,1426 :: 		set7_value = encoderValue
	MOVF        _encoderValue+0, 0 
	MOVWF       _set7_value+0 
	GOTO        L__PARAMETRE_IN563
L__PARAMETRE_IN602:
;tigkynk_18f.mbas,1427 :: 		case 8
	MOVF        _secilen_parametre+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN608
;tigkynk_18f.mbas,1428 :: 		if encoderValue > 1 then
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _encoderValue+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN881
	MOVF        _encoderValue+0, 0 
	SUBLW       1
L__PARAMETRE_IN881:
	BTFSC       STATUS+0, 0 
	GOTO        L__PARAMETRE_IN610
;tigkynk_18f.mbas,1429 :: 		encoderValue = 1
	MOVLW       1
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
L__PARAMETRE_IN610:
;tigkynk_18f.mbas,1431 :: 		set8_value = encoderValue
	MOVF        _encoderValue+0, 0 
	MOVWF       _set8_value+0 
	GOTO        L__PARAMETRE_IN563
L__PARAMETRE_IN608:
L__PARAMETRE_IN563:
;tigkynk_18f.mbas,1434 :: 		hesapla(encoderValue)
	MOVF        _encoderValue+0, 0 
	MOVWF       FARG_hesapla_num+0 
	MOVF        _encoderValue+1, 0 
	MOVWF       FARG_hesapla_num+1 
	CALL        _hesapla+0, 0
;tigkynk_18f.mbas,1435 :: 		end if
L__PARAMETRE_IN562:
;tigkynk_18f.mbas,1437 :: 		if (son_setting = 1) and (SETING = 0) then
	MOVF        _son_setting+0, 0 
	XORLW       1
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	BTFSC       PORTD+0, 7 
	GOTO        L__PARAMETRE_IN882
	BSF         STATUS+0, 0 
	GOTO        L__PARAMETRE_IN883
L__PARAMETRE_IN882:
	BCF         STATUS+0, 0 
L__PARAMETRE_IN883:
	CLRF        R0 
	BTFSC       STATUS+0, 0 
	INCF        R0, 1 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN613
;tigkynk_18f.mbas,1438 :: 		Delay_ms(25)
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L__PARAMETRE_IN615:
	DECFSZ      R13, 1, 1
	BRA         L__PARAMETRE_IN615
	DECFSZ      R12, 1, 1
	BRA         L__PARAMETRE_IN615
	NOP
	NOP
;tigkynk_18f.mbas,1439 :: 		if SETING = 0 then
	BTFSC       PORTD+0, 7 
	GOTO        L__PARAMETRE_IN617
;tigkynk_18f.mbas,1440 :: 		if secilen_parametre < 8 then
	MOVLW       8
	SUBWF       _secilen_parametre+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__PARAMETRE_IN620
;tigkynk_18f.mbas,1441 :: 		Inc(secilen_parametre)
	INCF        _secilen_parametre+0, 1 
;tigkynk_18f.mbas,1444 :: 		case 2
	MOVF        _secilen_parametre+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN625
;tigkynk_18f.mbas,1445 :: 		encoderValue = set2_value
	MOVF        _set2_value+0, 0 
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
	GOTO        L__PARAMETRE_IN622
L__PARAMETRE_IN625:
;tigkynk_18f.mbas,1446 :: 		case 3
	MOVF        _secilen_parametre+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN628
;tigkynk_18f.mbas,1447 :: 		encoderValue = set3_value
	MOVF        _set3_value+0, 0 
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
	GOTO        L__PARAMETRE_IN622
L__PARAMETRE_IN628:
;tigkynk_18f.mbas,1448 :: 		case 4
	MOVF        _secilen_parametre+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN631
;tigkynk_18f.mbas,1449 :: 		encoderValue = set4_value
	MOVF        _set4_value+0, 0 
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
	GOTO        L__PARAMETRE_IN622
L__PARAMETRE_IN631:
;tigkynk_18f.mbas,1450 :: 		case 5
	MOVF        _secilen_parametre+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN634
;tigkynk_18f.mbas,1451 :: 		encoderValue = set5_value
	MOVF        _set5_value+0, 0 
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
	GOTO        L__PARAMETRE_IN622
L__PARAMETRE_IN634:
;tigkynk_18f.mbas,1452 :: 		case 6
	MOVF        _secilen_parametre+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN637
;tigkynk_18f.mbas,1453 :: 		encoderValue = set6_value
	MOVF        _set6_value+0, 0 
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
	GOTO        L__PARAMETRE_IN622
L__PARAMETRE_IN637:
;tigkynk_18f.mbas,1454 :: 		case 7
	MOVF        _secilen_parametre+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN640
;tigkynk_18f.mbas,1455 :: 		encoderValue = set7_value
	MOVF        _set7_value+0, 0 
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
	GOTO        L__PARAMETRE_IN622
L__PARAMETRE_IN640:
;tigkynk_18f.mbas,1456 :: 		case 8
	MOVF        _secilen_parametre+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L__PARAMETRE_IN643
;tigkynk_18f.mbas,1457 :: 		encoderValue = set8_value
	MOVF        _set8_value+0, 0 
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
	GOTO        L__PARAMETRE_IN622
L__PARAMETRE_IN643:
L__PARAMETRE_IN622:
;tigkynk_18f.mbas,1460 :: 		Parametre_No_Goster(secilen_parametre)
	MOVF        _secilen_parametre+0, 0 
	MOVWF       FARG_Parametre_No_Goster_p+0 
	CALL        _Parametre_No_Goster+0, 0
	GOTO        L__PARAMETRE_IN621
;tigkynk_18f.mbas,1461 :: 		else
L__PARAMETRE_IN620:
;tigkynk_18f.mbas,1462 :: 		EEPROM_Kaydet()
	CALL        _EEPROM_Kaydet+0, 0
;tigkynk_18f.mbas,1463 :: 		G_Segment_Animasyon()
	CALL        _G_Segment_Animasyon+0, 0
;tigkynk_18f.mbas,1465 :: 		Tum_Set_Flaglarini_Sifirla()
	CALL        _Tum_Set_Flaglarini_Sifirla+0, 0
;tigkynk_18f.mbas,1466 :: 		setting_mode = 0
	CLRF        _setting_mode+0 
;tigkynk_18f.mbas,1467 :: 		secilen_parametre = 0
	CLRF        _secilen_parametre+0 
;tigkynk_18f.mbas,1468 :: 		encoderValue = normal_encoder_value
	MOVF        _normal_encoder_value+0, 0 
	MOVWF       _encoderValue+0 
	MOVF        _normal_encoder_value+1, 0 
	MOVWF       _encoderValue+1 
;tigkynk_18f.mbas,1469 :: 		disp_deger = encoderValue
	MOVF        _normal_encoder_value+0, 0 
	MOVWF       _disp_deger+0 
	MOVF        _normal_encoder_value+1, 0 
	MOVWF       _disp_deger+1 
;tigkynk_18f.mbas,1470 :: 		hesapla(encoderValue)
	MOVF        _normal_encoder_value+0, 0 
	MOVWF       FARG_hesapla_num+0 
	MOVF        _normal_encoder_value+1, 0 
	MOVWF       FARG_hesapla_num+1 
	CALL        _hesapla+0, 0
;tigkynk_18f.mbas,1471 :: 		end if
L__PARAMETRE_IN621:
L__PARAMETRE_IN617:
;tigkynk_18f.mbas,1472 :: 		end if
L__PARAMETRE_IN613:
;tigkynk_18f.mbas,1473 :: 		end if
L__PARAMETRE_IN558:
;tigkynk_18f.mbas,1476 :: 		son_setting = SETING
	MOVLW       0
	BTFSC       PORTD+0, 7 
	MOVLW       1
	MOVWF       _son_setting+0 
;tigkynk_18f.mbas,1477 :: 		end sub
L_end__PARAMETRE_IN:
L_end_PARAMETRE_IN:
	RETURN      0
; end of _PARAMETRE_IN

_PULSE_HESAPLA:

;tigkynk_18f.mbas,1480 :: 		sub procedure PULSE_HESAPLA()
;tigkynk_18f.mbas,1482 :: 		if set5_value = 0 then
	MOVF        _set5_value+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__PULSE_HESAPLA646
;tigkynk_18f.mbas,1483 :: 		pulse_period = 100
	MOVLW       100
	MOVWF       _pulse_period+0 
	MOVLW       0
	MOVWF       _pulse_period+1 
	GOTO        L__PULSE_HESAPLA647
;tigkynk_18f.mbas,1484 :: 		else
L__PULSE_HESAPLA646:
;tigkynk_18f.mbas,1485 :: 		pulse_period = 1000 / set5_value
	MOVF        _set5_value+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       232
	MOVWF       R0 
	MOVLW       3
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _pulse_period+0 
	MOVF        R1, 0 
	MOVWF       _pulse_period+1 
;tigkynk_18f.mbas,1486 :: 		end if
L__PULSE_HESAPLA647:
;tigkynk_18f.mbas,1488 :: 		if pulse_period = 0 then
	MOVLW       0
	XORWF       _pulse_period+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PULSE_HESAPLA885
	MOVLW       0
	XORWF       _pulse_period+0, 0 
L__PULSE_HESAPLA885:
	BTFSS       STATUS+0, 2 
	GOTO        L__PULSE_HESAPLA649
;tigkynk_18f.mbas,1489 :: 		pulse_period = 1
	MOVLW       1
	MOVWF       _pulse_period+0 
	MOVLW       0
	MOVWF       _pulse_period+1 
L__PULSE_HESAPLA649:
;tigkynk_18f.mbas,1492 :: 		pulse_on_time  = (pulse_period * set7_value) / 100
	MOVF        _pulse_period+0, 0 
	MOVWF       R0 
	MOVF        _pulse_period+1, 0 
	MOVWF       R1 
	MOVF        _set7_value+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _pulse_on_time+0 
	MOVF        R1, 0 
	MOVWF       _pulse_on_time+1 
;tigkynk_18f.mbas,1493 :: 		pulse_off_time = pulse_period - pulse_on_time
	MOVF        R0, 0 
	SUBWF       _pulse_period+0, 0 
	MOVWF       _pulse_off_time+0 
	MOVF        R1, 0 
	SUBWFB      _pulse_period+1, 0 
	MOVWF       _pulse_off_time+1 
;tigkynk_18f.mbas,1495 :: 		if pulse_on_time = 0 then
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PULSE_HESAPLA886
	MOVLW       0
	XORWF       R0, 0 
L__PULSE_HESAPLA886:
	BTFSS       STATUS+0, 2 
	GOTO        L__PULSE_HESAPLA652
;tigkynk_18f.mbas,1496 :: 		pulse_on_time = 1
	MOVLW       1
	MOVWF       _pulse_on_time+0 
	MOVLW       0
	MOVWF       _pulse_on_time+1 
L__PULSE_HESAPLA652:
;tigkynk_18f.mbas,1499 :: 		if pulse_off_time = 0 then
	MOVLW       0
	XORWF       _pulse_off_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PULSE_HESAPLA887
	MOVLW       0
	XORWF       _pulse_off_time+0, 0 
L__PULSE_HESAPLA887:
	BTFSS       STATUS+0, 2 
	GOTO        L__PULSE_HESAPLA655
;tigkynk_18f.mbas,1500 :: 		pulse_off_time = 1
	MOVLW       1
	MOVWF       _pulse_off_time+0 
	MOVLW       0
	MOVWF       _pulse_off_time+1 
L__PULSE_HESAPLA655:
;tigkynk_18f.mbas,1503 :: 		end sub
L_end_PULSE_HESAPLA:
	RETURN      0
; end of _PULSE_HESAPLA

_PULSE_ISLET:

;tigkynk_18f.mbas,1506 :: 		sub procedure PULSE_ISLET()
;tigkynk_18f.mbas,1508 :: 		if set8_value = 0 then
	MOVF        _set8_value+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__PULSE_ISLET659
;tigkynk_18f.mbas,1509 :: 		pulse_state = 1
	MOVLW       1
	MOVWF       _pulse_state+0 
;tigkynk_18f.mbas,1510 :: 		pulse_timer = 0
	CLRF        _pulse_timer+0 
	CLRF        _pulse_timer+1 
;tigkynk_18f.mbas,1511 :: 		exit
	GOTO        L_end__PULSE_ISLET
L__PULSE_ISLET659:
;tigkynk_18f.mbas,1514 :: 		Inc(pulse_timer)
	INFSNZ      _pulse_timer+0, 1 
	INCF        _pulse_timer+1, 1 
;tigkynk_18f.mbas,1516 :: 		if pulse_state = 1 then
	MOVF        _pulse_state+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__PULSE_ISLET662
;tigkynk_18f.mbas,1517 :: 		if pulse_timer >= pulse_on_time then
	MOVF        _pulse_on_time+1, 0 
	SUBWF       _pulse_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PULSE_ISLET889
	MOVF        _pulse_on_time+0, 0 
	SUBWF       _pulse_timer+0, 0 
L__PULSE_ISLET889:
	BTFSS       STATUS+0, 0 
	GOTO        L__PULSE_ISLET665
;tigkynk_18f.mbas,1518 :: 		pulse_timer = 0
	CLRF        _pulse_timer+0 
	CLRF        _pulse_timer+1 
;tigkynk_18f.mbas,1519 :: 		pulse_state = 0
	CLRF        _pulse_state+0 
L__PULSE_ISLET665:
;tigkynk_18f.mbas,1520 :: 		end if
	GOTO        L__PULSE_ISLET663
;tigkynk_18f.mbas,1521 :: 		else
L__PULSE_ISLET662:
;tigkynk_18f.mbas,1522 :: 		if pulse_timer >= pulse_off_time then
	MOVF        _pulse_off_time+1, 0 
	SUBWF       _pulse_timer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PULSE_ISLET890
	MOVF        _pulse_off_time+0, 0 
	SUBWF       _pulse_timer+0, 0 
L__PULSE_ISLET890:
	BTFSS       STATUS+0, 0 
	GOTO        L__PULSE_ISLET668
;tigkynk_18f.mbas,1523 :: 		pulse_timer = 0
	CLRF        _pulse_timer+0 
	CLRF        _pulse_timer+1 
;tigkynk_18f.mbas,1524 :: 		pulse_state = 1
	MOVLW       1
	MOVWF       _pulse_state+0 
L__PULSE_ISLET668:
;tigkynk_18f.mbas,1526 :: 		end if
L__PULSE_ISLET663:
;tigkynk_18f.mbas,1528 :: 		end sub
L_end__PULSE_ISLET:
L_end_PULSE_ISLET:
	RETURN      0
; end of _PULSE_ISLET

_KAYNAK_BITIR_SEKANS:

;tigkynk_18f.mbas,1532 :: 		sub procedure KAYNAK_BITIR_SEKANS()
;tigkynk_18f.mbas,1533 :: 		if kaynak_basladi = 1 then
	MOVF        _kaynak_basladi+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__KAYNAK_BITIR_SEKANS672
;tigkynk_18f.mbas,1534 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1535 :: 		BITIRME_RAMP_VE_CRATER()
	CALL        _BITIRME_RAMP_VE_CRATER+0, 0
;tigkynk_18f.mbas,1536 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,1537 :: 		SON_GAZ_BASLAT()
	CALL        _SON_GAZ_BASLAT+0, 0
	GOTO        L__KAYNAK_BITIR_SEKANS673
;tigkynk_18f.mbas,1538 :: 		else
L__KAYNAK_BITIR_SEKANS672:
;tigkynk_18f.mbas,1539 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1540 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,1541 :: 		end if
L__KAYNAK_BITIR_SEKANS673:
;tigkynk_18f.mbas,1543 :: 		ark_var = 0
	CLRF        _ark_var+0 
;tigkynk_18f.mbas,1544 :: 		ark_say = 0
	CLRF        _ark_say+0 
;tigkynk_18f.mbas,1545 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,1546 :: 		kaynak_izin = 0
	CLRF        _kaynak_izin+0 
;tigkynk_18f.mbas,1547 :: 		PID_SIFIRLA()
	CALL        _PID_SIFIRLA+0, 0
;tigkynk_18f.mbas,1548 :: 		end sub
L_end_KAYNAK_BITIR_SEKANS:
	RETURN      0
; end of _KAYNAK_BITIR_SEKANS

_KAYNAK_SURDUR:

;tigkynk_18f.mbas,1551 :: 		sub procedure KAYNAK_SURDUR()
;tigkynk_18f.mbas,1554 :: 		if kaynak_basladi = 1 then
	MOVF        _kaynak_basladi+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__KAYNAK_SURDUR676
;tigkynk_18f.mbas,1555 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1556 :: 		PULSE_ISLET()
	CALL        _PULSE_ISLET+0, 0
;tigkynk_18f.mbas,1558 :: 		ANTI_STICK_DURUM_MAKINESI()
	CALL        _ANTI_STICK_DURUM_MAKINESI+0, 0
;tigkynk_18f.mbas,1560 :: 		if kaynak_izin = 1 then
	MOVF        _kaynak_izin+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__KAYNAK_SURDUR679
;tigkynk_18f.mbas,1561 :: 		if anti_stick_aktif = 0 then
	MOVF        _anti_stick_aktif+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__KAYNAK_SURDUR682
;tigkynk_18f.mbas,1562 :: 		Inc(pid_timer)
	INCF        _pid_timer+0, 1 
;tigkynk_18f.mbas,1563 :: 		if pid_timer >= 4 then
	MOVLW       4
	SUBWF       _pid_timer+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__KAYNAK_SURDUR685
;tigkynk_18f.mbas,1564 :: 		pid_timer = 0
	CLRF        _pid_timer+0 
;tigkynk_18f.mbas,1565 :: 		PID_HESAPLA()
	CALL        _PID_HESAPLA+0, 0
L__KAYNAK_SURDUR685:
;tigkynk_18f.mbas,1566 :: 		end if
L__KAYNAK_SURDUR682:
;tigkynk_18f.mbas,1567 :: 		end if
L__KAYNAK_SURDUR679:
;tigkynk_18f.mbas,1568 :: 		end if
L__KAYNAK_SURDUR676:
;tigkynk_18f.mbas,1571 :: 		end sub
L_end_KAYNAK_SURDUR:
	RETURN      0
; end of _KAYNAK_SURDUR

_KAYNAK_BASLAT_SEKANS:

;tigkynk_18f.mbas,1576 :: 		dim t as byte
;tigkynk_18f.mbas,1578 :: 		PID_SIFIRLA()
	CALL        _PID_SIFIRLA+0, 0
;tigkynk_18f.mbas,1579 :: 		kisa_devre_say = 0
	CLRF        _kisa_devre_say+0 
	CLRF        _kisa_devre_say+1 
;tigkynk_18f.mbas,1580 :: 		anti_stick_aktif = 0
	CLRF        _anti_stick_aktif+0 
;tigkynk_18f.mbas,1581 :: 		anti_stick_durum = 0
	CLRF        _anti_stick_durum+0 
;tigkynk_18f.mbas,1582 :: 		anti_stick_timer = 0
	CLRF        _anti_stick_timer+0 
	CLRF        _anti_stick_timer+1 
;tigkynk_18f.mbas,1583 :: 		kisa_devre_adc = 0
	CLRF        _kisa_devre_adc+0 
	CLRF        _kisa_devre_adc+1 
;tigkynk_18f.mbas,1584 :: 		pulse_timer = 0
	CLRF        _pulse_timer+0 
	CLRF        _pulse_timer+1 
;tigkynk_18f.mbas,1585 :: 		pulse_state = 1
	MOVLW       1
	MOVWF       _pulse_state+0 
;tigkynk_18f.mbas,1586 :: 		PULSE_HESAPLA()
	CALL        _PULSE_HESAPLA+0, 0
;tigkynk_18f.mbas,1588 :: 		if kaynak_basladi <> 0 then
	MOVF        _kaynak_basladi+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L__KAYNAK_BASLAT_SEKANS689
;tigkynk_18f.mbas,1589 :: 		exit
	GOTO        L_end__KAYNAK_BASLAT_SEKANS
L__KAYNAK_BASLAT_SEKANS689:
;tigkynk_18f.mbas,1592 :: 		GAS = 1
	BSF         PORTE+0, 1 
;tigkynk_18f.mbas,1593 :: 		ark_var = 0
	CLRF        _ark_var+0 
;tigkynk_18f.mbas,1594 :: 		ark_say = 0
	CLRF        _ark_say+0 
;tigkynk_18f.mbas,1595 :: 		lift_temas_var = 0
	CLRF        _lift_temas_var+0 
;tigkynk_18f.mbas,1597 :: 		if set1_value > 0 then
	MOVF        _set1_value+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L__KAYNAK_BASLAT_SEKANS692
;tigkynk_18f.mbas,1598 :: 		for pg_say = 1 to set1_value
	MOVLW       1
	MOVWF       KAYNAK_BASLAT_SEKANS_pg_say+0 
L__KAYNAK_BASLAT_SEKANS694:
	MOVF        KAYNAK_BASLAT_SEKANS_pg_say+0, 0 
	SUBWF       _set1_value+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__KAYNAK_BASLAT_SEKANS698
;tigkynk_18f.mbas,1599 :: 		for t = 1 to 100
	MOVLW       1
	MOVWF       KAYNAK_BASLAT_SEKANS_t+0 
L__KAYNAK_BASLAT_SEKANS700:
;tigkynk_18f.mbas,1600 :: 		Delay_ms(10)
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L__KAYNAK_BASLAT_SEKANS704:
	DECFSZ      R13, 1, 1
	BRA         L__KAYNAK_BASLAT_SEKANS704
	DECFSZ      R12, 1, 1
	BRA         L__KAYNAK_BASLAT_SEKANS704
	NOP
	NOP
;tigkynk_18f.mbas,1602 :: 		if BASLATMA_VEYA_BLOK_IPTAL_VAR_MI() = 1 then
	CALL        _BASLATMA_VEYA_BLOK_IPTAL_VAR_MI+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__KAYNAK_BASLAT_SEKANS706
;tigkynk_18f.mbas,1603 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,1604 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1605 :: 		ark_var = 0
	CLRF        _ark_var+0 
;tigkynk_18f.mbas,1606 :: 		ark_say = 0
	CLRF        _ark_say+0 
;tigkynk_18f.mbas,1607 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1608 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,1609 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,1610 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,1611 :: 		exit
	GOTO        L_end__KAYNAK_BASLAT_SEKANS
L__KAYNAK_BASLAT_SEKANS706:
;tigkynk_18f.mbas,1613 :: 		next t
	MOVF        KAYNAK_BASLAT_SEKANS_t+0, 0 
	XORLW       100
	BTFSC       STATUS+0, 2 
	GOTO        L__KAYNAK_BASLAT_SEKANS703
	INCF        KAYNAK_BASLAT_SEKANS_t+0, 1 
	GOTO        L__KAYNAK_BASLAT_SEKANS700
L__KAYNAK_BASLAT_SEKANS703:
;tigkynk_18f.mbas,1614 :: 		next pg_say
	MOVF        KAYNAK_BASLAT_SEKANS_pg_say+0, 0 
	XORWF       _set1_value+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L__KAYNAK_BASLAT_SEKANS698
	INCF        KAYNAK_BASLAT_SEKANS_pg_say+0, 1 
	GOTO        L__KAYNAK_BASLAT_SEKANS694
L__KAYNAK_BASLAT_SEKANS698:
L__KAYNAK_BASLAT_SEKANS692:
;tigkynk_18f.mbas,1617 :: 		if kaynak_izin = 0 then
	MOVF        _kaynak_izin+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__KAYNAK_BASLAT_SEKANS709
;tigkynk_18f.mbas,1618 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,1619 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1620 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1621 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,1622 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,1623 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,1624 :: 		exit
	GOTO        L_end__KAYNAK_BASLAT_SEKANS
L__KAYNAK_BASLAT_SEKANS709:
;tigkynk_18f.mbas,1627 :: 		Pwm1_Start()
	CALL        _PWM1_Start+0, 0
;tigkynk_18f.mbas,1633 :: 		if KISA_DEVRE_VAR_MI() = 1 then
	CALL        _KISA_DEVRE_VAR_MI+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__KAYNAK_BASLAT_SEKANS712
;tigkynk_18f.mbas,1634 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1635 :: 		Pwm1_Set_Duty(0)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1636 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,1637 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,1638 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,1639 :: 		ark_var = 0
	CLRF        _ark_var+0 
;tigkynk_18f.mbas,1640 :: 		ark_say = 0
	CLRF        _ark_say+0 
;tigkynk_18f.mbas,1641 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,1642 :: 		kaynak_izin = 0
	CLRF        _kaynak_izin+0 
;tigkynk_18f.mbas,1643 :: 		exit
	GOTO        L_end__KAYNAK_BASLAT_SEKANS
L__KAYNAK_BASLAT_SEKANS712:
;tigkynk_18f.mbas,1646 :: 		if HFTIG = 0 then
	BTFSC       PORTA+0, 1 
	GOTO        L__KAYNAK_BASLAT_SEKANS715
;tigkynk_18f.mbas,1647 :: 		HF = 1
	BSF         PORTE+0, 2 
;tigkynk_18f.mbas,1648 :: 		Delay_ms(100)
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L__KAYNAK_BASLAT_SEKANS717:
	DECFSZ      R13, 1, 1
	BRA         L__KAYNAK_BASLAT_SEKANS717
	DECFSZ      R12, 1, 1
	BRA         L__KAYNAK_BASLAT_SEKANS717
	DECFSZ      R11, 1, 1
	BRA         L__KAYNAK_BASLAT_SEKANS717
;tigkynk_18f.mbas,1649 :: 		ARK_BEKLE_VE_RAMP_BASLAT()
	CALL        _ARK_BEKLE_VE_RAMP_BASLAT+0, 0
	GOTO        L__KAYNAK_BASLAT_SEKANS716
;tigkynk_18f.mbas,1650 :: 		else
L__KAYNAK_BASLAT_SEKANS715:
;tigkynk_18f.mbas,1651 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1652 :: 		LIFT_TIG_BEKLE_VE_RAMP_BASLAT()
	CALL        _LIFT_TIG_BEKLE_VE_RAMP_BASLAT+0, 0
;tigkynk_18f.mbas,1653 :: 		end if
L__KAYNAK_BASLAT_SEKANS716:
;tigkynk_18f.mbas,1655 :: 		if (kaynak_izin = 1) and (ark_var = 1) then
	MOVF        _kaynak_izin+0, 0 
	XORLW       1
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        _ark_var+0, 0 
	XORLW       1
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__KAYNAK_BASLAT_SEKANS719
;tigkynk_18f.mbas,1656 :: 		kaynak_basladi = 1
	MOVLW       1
	MOVWF       _kaynak_basladi+0 
	GOTO        L__KAYNAK_BASLAT_SEKANS720
;tigkynk_18f.mbas,1657 :: 		else
L__KAYNAK_BASLAT_SEKANS719:
;tigkynk_18f.mbas,1658 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,1659 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1660 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,1661 :: 		ark_var = 0
	CLRF        _ark_var+0 
;tigkynk_18f.mbas,1662 :: 		ark_say = 0
	CLRF        _ark_say+0 
;tigkynk_18f.mbas,1663 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,1664 :: 		kaynak_izin = 0
	CLRF        _kaynak_izin+0 
;tigkynk_18f.mbas,1665 :: 		end if
L__KAYNAK_BASLAT_SEKANS720:
;tigkynk_18f.mbas,1666 :: 		end sub
L_end__KAYNAK_BASLAT_SEKANS:
L_end_KAYNAK_BASLAT_SEKANS:
	RETURN      0
; end of _KAYNAK_BASLAT_SEKANS

_TIG_BASLAT:

;tigkynk_18f.mbas,1668 :: 		sub procedure TIG_BASLAT()
;tigkynk_18f.mbas,1670 :: 		if setting_mode <> 0 then
	MOVF        _setting_mode+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L__TIG_BASLAT723
;tigkynk_18f.mbas,1671 :: 		exit
	GOTO        L_end__TIG_BASLAT
L__TIG_BASLAT723:
;tigkynk_18f.mbas,1677 :: 		if ikidort = 1 then
	BTFSS       PORTC+0, 4 
	GOTO        L__TIG_BASLAT726
;tigkynk_18f.mbas,1678 :: 		if TETIK = 0 then
	BTFSC       PORTE+0, 0 
	GOTO        L__TIG_BASLAT729
;tigkynk_18f.mbas,1679 :: 		kaynak_izin = 1
	MOVLW       1
	MOVWF       _kaynak_izin+0 
;tigkynk_18f.mbas,1681 :: 		if kaynak_basladi = 0 then
	MOVF        _kaynak_basladi+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__TIG_BASLAT732
;tigkynk_18f.mbas,1682 :: 		KAYNAK_BASLAT_SEKANS()
	CALL        _KAYNAK_BASLAT_SEKANS+0, 0
	GOTO        L__TIG_BASLAT733
;tigkynk_18f.mbas,1683 :: 		else
L__TIG_BASLAT732:
;tigkynk_18f.mbas,1684 :: 		KAYNAK_SURDUR()
	CALL        _KAYNAK_SURDUR+0, 0
;tigkynk_18f.mbas,1685 :: 		end if
L__TIG_BASLAT733:
	GOTO        L__TIG_BASLAT730
;tigkynk_18f.mbas,1686 :: 		else
L__TIG_BASLAT729:
;tigkynk_18f.mbas,1687 :: 		kaynak_izin = 0
	CLRF        _kaynak_izin+0 
;tigkynk_18f.mbas,1688 :: 		KAYNAK_BITIR_SEKANS()
	CALL        _KAYNAK_BITIR_SEKANS+0, 0
;tigkynk_18f.mbas,1689 :: 		end if
L__TIG_BASLAT730:
	GOTO        L__TIG_BASLAT727
;tigkynk_18f.mbas,1691 :: 		else
L__TIG_BASLAT726:
;tigkynk_18f.mbas,1694 :: 		case 0
	MOVF        _dortt_durum+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__TIG_BASLAT737
;tigkynk_18f.mbas,1695 :: 		if (tetik_onceki = 1) and (TETIK = 0) then
	MOVF        _tetik_onceki+0, 0 
	XORLW       1
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	BTFSC       PORTE+0, 0 
	GOTO        L__TIG_BASLAT895
	BSF         STATUS+0, 0 
	GOTO        L__TIG_BASLAT896
L__TIG_BASLAT895:
	BCF         STATUS+0, 0 
L__TIG_BASLAT896:
	CLRF        R0 
	BTFSC       STATUS+0, 0 
	INCF        R0, 1 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__TIG_BASLAT739
;tigkynk_18f.mbas,1696 :: 		dortt_durum = 1
	MOVLW       1
	MOVWF       _dortt_durum+0 
L__TIG_BASLAT739:
;tigkynk_18f.mbas,1697 :: 		end if
	GOTO        L__TIG_BASLAT734
L__TIG_BASLAT737:
;tigkynk_18f.mbas,1699 :: 		case 1
	MOVF        _dortt_durum+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__TIG_BASLAT743
;tigkynk_18f.mbas,1700 :: 		if (tetik_onceki = 0) and (TETIK = 1) then
	MOVF        _tetik_onceki+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	BTFSC       PORTE+0, 0 
	GOTO        L__TIG_BASLAT897
	BCF         STATUS+0, 0 
	GOTO        L__TIG_BASLAT898
L__TIG_BASLAT897:
	BSF         STATUS+0, 0 
L__TIG_BASLAT898:
	CLRF        R0 
	BTFSC       STATUS+0, 0 
	INCF        R0, 1 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__TIG_BASLAT745
;tigkynk_18f.mbas,1701 :: 		kaynak_izin = 1
	MOVLW       1
	MOVWF       _kaynak_izin+0 
;tigkynk_18f.mbas,1702 :: 		KAYNAK_BASLAT_SEKANS()
	CALL        _KAYNAK_BASLAT_SEKANS+0, 0
;tigkynk_18f.mbas,1704 :: 		if kaynak_basladi = 1 then
	MOVF        _kaynak_basladi+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__TIG_BASLAT748
;tigkynk_18f.mbas,1705 :: 		dortt_durum = 2
	MOVLW       2
	MOVWF       _dortt_durum+0 
	GOTO        L__TIG_BASLAT749
;tigkynk_18f.mbas,1706 :: 		else
L__TIG_BASLAT748:
;tigkynk_18f.mbas,1707 :: 		dortt_durum = 0
	CLRF        _dortt_durum+0 
;tigkynk_18f.mbas,1708 :: 		kaynak_izin = 0
	CLRF        _kaynak_izin+0 
;tigkynk_18f.mbas,1709 :: 		end if
L__TIG_BASLAT749:
L__TIG_BASLAT745:
;tigkynk_18f.mbas,1710 :: 		end if
	GOTO        L__TIG_BASLAT734
L__TIG_BASLAT743:
;tigkynk_18f.mbas,1712 :: 		case 2
	MOVF        _dortt_durum+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__TIG_BASLAT752
;tigkynk_18f.mbas,1713 :: 		KAYNAK_SURDUR()
	CALL        _KAYNAK_SURDUR+0, 0
;tigkynk_18f.mbas,1715 :: 		if (tetik_onceki = 1) and (TETIK = 0) then
	MOVF        _tetik_onceki+0, 0 
	XORLW       1
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	BTFSC       PORTE+0, 0 
	GOTO        L__TIG_BASLAT899
	BSF         STATUS+0, 0 
	GOTO        L__TIG_BASLAT900
L__TIG_BASLAT899:
	BCF         STATUS+0, 0 
L__TIG_BASLAT900:
	CLRF        R0 
	BTFSC       STATUS+0, 0 
	INCF        R0, 1 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__TIG_BASLAT754
;tigkynk_18f.mbas,1716 :: 		dortt_durum = 3
	MOVLW       3
	MOVWF       _dortt_durum+0 
L__TIG_BASLAT754:
;tigkynk_18f.mbas,1717 :: 		end if
	GOTO        L__TIG_BASLAT734
L__TIG_BASLAT752:
;tigkynk_18f.mbas,1719 :: 		case 3
	MOVF        _dortt_durum+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__TIG_BASLAT758
;tigkynk_18f.mbas,1720 :: 		KAYNAK_SURDUR()
	CALL        _KAYNAK_SURDUR+0, 0
;tigkynk_18f.mbas,1722 :: 		if (tetik_onceki = 0) and (TETIK = 1) then
	MOVF        _tetik_onceki+0, 0 
	XORLW       0
	MOVLW       255
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	BTFSC       PORTE+0, 0 
	GOTO        L__TIG_BASLAT901
	BCF         STATUS+0, 0 
	GOTO        L__TIG_BASLAT902
L__TIG_BASLAT901:
	BSF         STATUS+0, 0 
L__TIG_BASLAT902:
	CLRF        R0 
	BTFSC       STATUS+0, 0 
	INCF        R0, 1 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__TIG_BASLAT760
;tigkynk_18f.mbas,1723 :: 		kaynak_izin = 0
	CLRF        _kaynak_izin+0 
;tigkynk_18f.mbas,1724 :: 		KAYNAK_BITIR_SEKANS()
	CALL        _KAYNAK_BITIR_SEKANS+0, 0
;tigkynk_18f.mbas,1725 :: 		dortt_durum = 0
	CLRF        _dortt_durum+0 
L__TIG_BASLAT760:
;tigkynk_18f.mbas,1726 :: 		end if
	GOTO        L__TIG_BASLAT734
L__TIG_BASLAT758:
L__TIG_BASLAT734:
;tigkynk_18f.mbas,1729 :: 		end if
L__TIG_BASLAT727:
;tigkynk_18f.mbas,1731 :: 		tetik_onceki = TETIK
	MOVLW       0
	BTFSC       PORTE+0, 0 
	MOVLW       1
	MOVWF       _tetik_onceki+0 
;tigkynk_18f.mbas,1732 :: 		end sub
L_end__TIG_BASLAT:
L_end_TIG_BASLAT:
	RETURN      0
; end of _TIG_BASLAT

_main:

;tigkynk_18f.mbas,1735 :: 		main:
;tigkynk_18f.mbas,1738 :: 		TRISA = %11111111
	MOVLW       255
	MOVWF       TRISA+0 
;tigkynk_18f.mbas,1739 :: 		TRISB = %00111111
	MOVLW       63
	MOVWF       TRISB+0 
;tigkynk_18f.mbas,1740 :: 		TRISC = %01010000
	MOVLW       80
	MOVWF       TRISC+0 
;tigkynk_18f.mbas,1741 :: 		TRISD = %10000000
	MOVLW       128
	MOVWF       TRISD+0 
;tigkynk_18f.mbas,1742 :: 		TRISE = %00000001
	MOVLW       1
	MOVWF       TRISE+0 
;tigkynk_18f.mbas,1744 :: 		CM1CON0 = 0
	CLRF        CM1CON0+0 
;tigkynk_18f.mbas,1745 :: 		CM2CON0 = 0
	CLRF        CM2CON0+0 
;tigkynk_18f.mbas,1746 :: 		PORTA = 0
	CLRF        PORTA+0 
;tigkynk_18f.mbas,1747 :: 		PORTB = 0
	CLRF        PORTB+0 
;tigkynk_18f.mbas,1748 :: 		PORTC = 0
	CLRF        PORTC+0 
;tigkynk_18f.mbas,1749 :: 		PORTD = 0
	CLRF        PORTD+0 
;tigkynk_18f.mbas,1750 :: 		PORTE = 0
	CLRF        PORTE+0 
;tigkynk_18f.mbas,1752 :: 		ADCON0 = 0
	CLRF        ADCON0+0 
;tigkynk_18f.mbas,1753 :: 		ADCON1 = 0
	CLRF        ADCON1+0 
;tigkynk_18f.mbas,1754 :: 		ADCON2 = %10101010   ' örnek: right justify, uygun Tad
	MOVLW       170
	MOVWF       ADCON2+0 
;tigkynk_18f.mbas,1758 :: 		ANSELH = 1
	MOVLW       1
	MOVWF       ANSELH+0 
;tigkynk_18f.mbas,1759 :: 		ANSEL  = 4
	MOVLW       4
	MOVWF       ANSEL+0 
;tigkynk_18f.mbas,1762 :: 		OSCCON = $70
	MOVLW       112
	MOVWF       OSCCON+0 
;tigkynk_18f.mbas,1764 :: 		Pwm1_Init(8000)
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       124
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;tigkynk_18f.mbas,1765 :: 		Pwm1_Set_Duty(30)
	MOVLW       30
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;tigkynk_18f.mbas,1766 :: 		Pwm1_Stop()
	CALL        _PWM1_Stop+0, 0
;tigkynk_18f.mbas,1768 :: 		ROLE_MAIN = 0
	BCF         PORTB+0, 7 
;tigkynk_18f.mbas,1769 :: 		ROLE_SARJ = 0
	BCF         PORTB+0, 6 
;tigkynk_18f.mbas,1770 :: 		GAS = 0
	BCF         PORTE+0, 1 
;tigkynk_18f.mbas,1771 :: 		HF = 0
	BCF         PORTE+0, 2 
;tigkynk_18f.mbas,1773 :: 		kd_say = 0
	CLRF        _kd_say+0 
	CLRF        _kd_say+1 
;tigkynk_18f.mbas,1774 :: 		HATA_say = 0
	CLRF        _HATA_say+0 
;tigkynk_18f.mbas,1775 :: 		HATA = 0
	CLRF        _HATA+0 
;tigkynk_18f.mbas,1776 :: 		ERR = 0
	CLRF        _ERR+0 
;tigkynk_18f.mbas,1778 :: 		tetik_onceki = 1
	MOVLW       1
	MOVWF       _tetik_onceki+0 
;tigkynk_18f.mbas,1779 :: 		dortt_durum = 0
	CLRF        _dortt_durum+0 
;tigkynk_18f.mbas,1780 :: 		kaynak_izin = 0
	CLRF        _kaynak_izin+0 
;tigkynk_18f.mbas,1781 :: 		setting_mode = 0
	CLRF        _setting_mode+0 
;tigkynk_18f.mbas,1782 :: 		secilen_parametre = 0
	CLRF        _secilen_parametre+0 
;tigkynk_18f.mbas,1783 :: 		son_setting = 1
	MOVLW       1
	MOVWF       _son_setting+0 
;tigkynk_18f.mbas,1784 :: 		kaynak_basladi = 0
	CLRF        _kaynak_basladi+0 
;tigkynk_18f.mbas,1785 :: 		ramp_duty = 0
	CLRF        _ramp_duty+0 
;tigkynk_18f.mbas,1786 :: 		hedef_duty = 0
	CLRF        _hedef_duty+0 
;tigkynk_18f.mbas,1787 :: 		hf_start_yapildi = 0
	CLRF        _hf_start_yapildi+0 
;tigkynk_18f.mbas,1789 :: 		ark_var = 0
	CLRF        _ark_var+0 
;tigkynk_18f.mbas,1790 :: 		ark_esik = 60
	MOVLW       60
	MOVWF       _ark_esik+0 
	MOVLW       0
	MOVWF       _ark_esik+1 
;tigkynk_18f.mbas,1791 :: 		akim_adc = 0
	CLRF        _akim_adc+0 
	CLRF        _akim_adc+1 
;tigkynk_18f.mbas,1792 :: 		ark_say = 0
	CLRF        _ark_say+0 
;tigkynk_18f.mbas,1794 :: 		pid_hata = 0
	CLRF        _pid_hata+0 
	CLRF        _pid_hata+1 
;tigkynk_18f.mbas,1795 :: 		pid_onceki_hata = 0
	CLRF        _pid_onceki_hata+0 
	CLRF        _pid_onceki_hata+1 
;tigkynk_18f.mbas,1796 :: 		pid_turev = 0
	CLRF        _pid_turev+0 
	CLRF        _pid_turev+1 
;tigkynk_18f.mbas,1797 :: 		pid_cikis = 0
	CLRF        _pid_cikis+0 
	CLRF        _pid_cikis+1 
;tigkynk_18f.mbas,1798 :: 		olculen_akim = 0
	CLRF        _olculen_akim+0 
	CLRF        _olculen_akim+1 
;tigkynk_18f.mbas,1799 :: 		pid_integral = 0
	CLRF        _pid_integral+0 
	CLRF        _pid_integral+1 
	CLRF        _pid_integral+2 
	CLRF        _pid_integral+3 
;tigkynk_18f.mbas,1800 :: 		akim_filtreli = 0
	CLRF        _akim_filtreli+0 
	CLRF        _akim_filtreli+1 
;tigkynk_18f.mbas,1801 :: 		pid_timer = 0
	CLRF        _pid_timer+0 
;tigkynk_18f.mbas,1802 :: 		lift_temas_var = 0
	CLRF        _lift_temas_var+0 
;tigkynk_18f.mbas,1804 :: 		kisa_devre_say = 0
	CLRF        _kisa_devre_say+0 
	CLRF        _kisa_devre_say+1 
;tigkynk_18f.mbas,1805 :: 		anti_stick_aktif = 0
	CLRF        _anti_stick_aktif+0 
;tigkynk_18f.mbas,1806 :: 		anti_stick_durum = 0
	CLRF        _anti_stick_durum+0 
;tigkynk_18f.mbas,1807 :: 		anti_stick_timer = 0
	CLRF        _anti_stick_timer+0 
	CLRF        _anti_stick_timer+1 
;tigkynk_18f.mbas,1808 :: 		kisa_devre_adc = 0
	CLRF        _kisa_devre_adc+0 
	CLRF        _kisa_devre_adc+1 
;tigkynk_18f.mbas,1810 :: 		Delay_ms(100)
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L__main763:
	DECFSZ      R13, 1, 1
	BRA         L__main763
	DECFSZ      R12, 1, 1
	BRA         L__main763
	DECFSZ      R11, 1, 1
	BRA         L__main763
;tigkynk_18f.mbas,1812 :: 		SPI_Init_MAX7219()
	CALL        _SPI_Init_MAX7219+0, 0
;tigkynk_18f.mbas,1813 :: 		Delay_ms(100)
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L__main764:
	DECFSZ      R13, 1, 1
	BRA         L__main764
	DECFSZ      R12, 1, 1
	BRA         L__main764
	DECFSZ      R11, 1, 1
	BRA         L__main764
;tigkynk_18f.mbas,1814 :: 		MAX7219_Init()
	CALL        _MAX7219_Init+0, 0
;tigkynk_18f.mbas,1815 :: 		Delay_ms(100)
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L__main765:
	DECFSZ      R13, 1, 1
	BRA         L__main765
	DECFSZ      R12, 1, 1
	BRA         L__main765
	DECFSZ      R11, 1, 1
	BRA         L__main765
;tigkynk_18f.mbas,1817 :: 		IOCB = $30
	MOVLW       48
	MOVWF       IOCB+0 
;tigkynk_18f.mbas,1818 :: 		prevA = EncoderA
	MOVLW       0
	BTFSC       PORTB+0, 5 
	MOVLW       1
	MOVWF       _prevA+0 
;tigkynk_18f.mbas,1819 :: 		encoderValue = 100
	MOVLW       100
	MOVWF       _encoderValue+0 
	MOVLW       0
	MOVWF       _encoderValue+1 
;tigkynk_18f.mbas,1820 :: 		hedef_akim = 100
	MOVLW       100
	MOVWF       _hedef_akim+0 
	MOVLW       0
	MOVWF       _hedef_akim+1 
;tigkynk_18f.mbas,1821 :: 		normal_encoder_value = 100
	MOVLW       100
	MOVWF       _normal_encoder_value+0 
	MOVLW       0
	MOVWF       _normal_encoder_value+1 
;tigkynk_18f.mbas,1823 :: 		dummy = PORTB
	MOVF        PORTB+0, 0 
	MOVWF       _dummy+0 
;tigkynk_18f.mbas,1824 :: 		INTCON.RBIF = 0
	BCF         INTCON+0, 0 
;tigkynk_18f.mbas,1825 :: 		INTCON.RBIE = 1
	BSF         INTCON+0, 3 
;tigkynk_18f.mbas,1826 :: 		INTCON.GIE = 1
	BSF         INTCON+0, 7 
;tigkynk_18f.mbas,1828 :: 		INTCON2.RBPU = 0
	BCF         INTCON2+0, 7 
;tigkynk_18f.mbas,1829 :: 		WPUB.4 = 1
	BSF         WPUB+0, 4 
;tigkynk_18f.mbas,1830 :: 		WPUB.5 = 1
	BSF         WPUB+0, 5 
;tigkynk_18f.mbas,1832 :: 		EEPROM_YUKLE()
	CALL        _EEPROM_YUKLE+0, 0
;tigkynk_18f.mbas,1834 :: 		while TRUE
L__main767:
;tigkynk_18f.mbas,1836 :: 		PARAMETRE_IN()
	CALL        _PARAMETRE_IN+0, 0
;tigkynk_18f.mbas,1838 :: 		if setting_mode = 0 then
	MOVF        _setting_mode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__main772
;tigkynk_18f.mbas,1839 :: 		hedef_akim = encoderValue
	MOVF        _encoderValue+0, 0 
	MOVWF       _hedef_akim+0 
	MOVF        _encoderValue+1, 0 
	MOVWF       _hedef_akim+1 
;tigkynk_18f.mbas,1840 :: 		TIG_BASLAT()
	CALL        _TIG_BASLAT+0, 0
;tigkynk_18f.mbas,1841 :: 		disp_deger = encoderValue
	MOVF        _encoderValue+0, 0 
	MOVWF       _disp_deger+0 
	MOVF        _encoderValue+1, 0 
	MOVWF       _disp_deger+1 
;tigkynk_18f.mbas,1842 :: 		hesapla(encoderValue)
	MOVF        _encoderValue+0, 0 
	MOVWF       FARG_hesapla_num+0 
	MOVF        _encoderValue+1, 0 
	MOVWF       FARG_hesapla_num+1 
	CALL        _hesapla+0, 0
L__main772:
;tigkynk_18f.mbas,1845 :: 		Delay_ms(5)
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L__main774:
	DECFSZ      R13, 1, 1
	BRA         L__main774
	DECFSZ      R12, 1, 1
	BRA         L__main774
	NOP
;tigkynk_18f.mbas,1846 :: 		wend
	GOTO        L__main767
L_end_main:
	GOTO        $+0
; end of _main
