;
; Bank-switching helpers
;

!macro BankCall .page, .target {
    JSR $CAEE
    !by .page
    !word .target
}

!macro BankJump .page, .target {
    JSR $CB5F
    !by .page
    !word .target
}