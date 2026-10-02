;!source "code/c64symb.asm"
;!source "code/def.asm"

!pseudopc $8000 {

; **************************************
; Interface jump table for P5 contract.
; **************************************
* = P5_API_ShowKeys
    jmp P5_ShowKeys

* = P5_API_CustomCrap
    jmp P5_CustomCrap

* = P5_API_END



;
; Used by Showkeys.
;
P5_A612
    LDA #$44
    STA $09
    LDX #$DC
    LDA #$00
.lA61A
    CLC
.lA61B
    DEY
    BMI .lA625
    ADC #$20
    BCC .lA61B
    INX
    BCS .lA61A
.lA625
    STA $07
    STX $08
    RTS




;
; ShowKeys
;
P5_ShowKeys
    LDA $31
    PHA
    LDA $32
    PHA
    LDA $33
    PHA
    LDY #$00
.LAA8A
    LDA $C660,Y
    STA $C000,Y
    DEY
    BNE .LAA8A
    LDA $C7DD
    BEQ .LAA9D
    LDX #$FF
    JSR $CDDF
.LAA9D
    STY $3B
    LDA $C855,Y
    STA $38
    JSR P5_A612
    LDY #$07
.LAAA9
    LDA .LAB1A-1,Y
    JSR $CE05
    DEY
    BNE .LAAA9
    LDA $3B
    CMP #$08
    BCC .LAABD
    LDA #$31
    JSR $CE05
.LAABD
    LDA $3B
    AND #$07
    CLC
    ADC #$31
    JSR $CE05
    STY $89
    STY $33
.LAACB
    CPY $38
    BCS .LAAD8
    JSR $CB66
    STA $C5E8,Y
    INY
    BNE .LAACB
.LAAD8
    LDX #$E8
    LDA #$C5
    STX $31
    STA $32
    JSR $CAEE
    !by PAGE2
    !word P2_BC2B

    LDA #$2C
    ;JSR P1_92ED
    +BankCall PAGE1, P1_92ED
    LDA #$29
    JSR $CE05
    LDA $C7DD
    BNE .LAAF8
    ;JSR P1_96E6
    +BankCall PAGE1, P1_96E6
.LAAF8
    JSR $CDF4
    LDY $3B
    INY
    CPY #$10
    BCC .LAA9D
    JSR $CDD6
    LDY #$00
.LAB07
    LDA $C000,Y
    STA $C660,Y
    DEY
    BNE .LAB07
    PLA
    STA $33
    PLA
    STA $32
    PLA
    STA $31
    RTS
---------------------------------
.LAB1A
    !pet "(yeKfeD" ; "defkey("

P5_CustomCrap:
    rts

; Pad out to the end of the zone.
.end5
!fill $c000-.end5,$cc
}
