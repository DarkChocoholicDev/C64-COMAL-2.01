
!source "code/c64symb.asm"
!source "VS/C64-Comal80/C64-Comal80/build/comal80_core.sym"
!source "code/common_defs.asm"
!source "code/ed_ext_api.asm"
VER_NEW = 1
VER_OLD = 0

!zone part5 {
!source "code/p5_main.asm"
}
!zone part6 {
!pseudopc $8000 {
    !fill $4000,$ff
}
}
!zone part7 {
!pseudopc $8000 {
    !fill $4000,$ff
}
}
!zone part8 {
!pseudopc $8000 {
    !fill $4000,$ff
}
}
