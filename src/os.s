.set noreorder
.set noat
.set C0_CAUSE, $13
.set C0_EPC, $14
.set C0_WATCHLO, $18
.set C0_WATCHHI, $19

.globl bios_os_80000560
bios_os_80000560:
    lui     $v0, 0x00012BFF >> 16
    ori     $v0, 0x00012BFF & 0xFFFF
    li      $t0, -0x0001
    nop
.L80000570:
    lbu     $v1, 0x0000($a0)
    lbu     $a3, 0x0001($a0)
    lbu     $a2, 0x0002($a0)
    srl     $v1, $v1, 3
    srl     $a3, $a3, 3
    srl     $a2, $a2, 3
    sll     $a3, $a3, 6
    sll     $v1, $v1, 11
    or      $v1, $a3, $v1
    sll     $a2, $a2, 1
    or      $v1, $v1, $a2
    addiu   $v0, $v0, -0x0001
    sh      $v1, 0x0000($a1)
    addiu   $a0, $a0, 0x0003
    bne     $v0, $t0, .L80000570
    addiu   $a1, $a1, 0x0002
    jr      $ra
    nop

.globl bios_os_800005B8
bios_os_800005B8:
    lw      $v0, 0x0024($sp)
    beqz    $v0, .L80000698
    sll     $v1, $a2, 8
    sll     $a2, $a2, 6
    addu    $a2, $a2, $v1
    addu    $a1, $a2, $a1
    sll     $a2, $a1, 1
    sll     $v1, $a3, 1
    addu    $a1, $a2, $a1
    addu    $v1, $v1, $a3
    li      $t6, 0x03C0
    addu    $a0, $a0, $a1
    subu    $t6, $t6, $v1
    daddu   $t2, $0, $0
    daddu   $t1, $0, $0
    li      $a2, -0x0001
    addiu   $t3, $v0, -0x0001
    addiu   $t5, $a3, -0x0001
.L80000600:
    beqzl   $a3, .L80000674
    addiu   $t1, $t1, 0x0001
    addiu   $v1, $a0, 0x0003
    daddu   $t0, $0, $0
    daddu   $a1, $0, $0
    nop
.L80000618:
    beqzl   $a1, .L80000688
    sb      $a2, -0x0003($v1)
    beqzl   $t1, .L80000688
    sb      $a2, -0x0003($v1)
    beql    $t2, $t3, .L80000688
    sb      $a2, -0x0003($v1)
    beql    $t0, $t5, .L80000688
    sb      $a2, -0x0003($v1)
    lbu     $t4, -0x0003($v1)
    lbu     $t0, -0x0002($v1)
    lbu     $a0, -0x0001($v1)
    srl     $t4, $t4, 1
    srl     $a0, $a0, 1
    srl     $t0, $t0, 1
    sb      $a0, -0x0001($v1)
    sb      $t4, -0x0003($v1)
    sb      $t0, -0x0002($v1)
    daddu   $a0, $v1, $0
.L80000660:
    addiu   $a1, $a1, 0x0001
    addiu   $v1, $v1, 0x0003
    bne     $a1, $a3, .L80000618
    daddu   $t0, $a1, $0
    addiu   $t1, $t1, 0x0001
.L80000674:
    beq     $t1, $v0, .L80000698
    daddu   $t2, $t1, $0
    j       .L80000600
    addu    $a0, $a0, $t6
    nop
.L80000688:
    sb      $a2, -0x0002($v1)
    sb      $a2, -0x0001($v1)
    j       .L80000660
    daddu   $a0, $v1, $0
.L80000698:
    jr      $ra
    nop

.globl bios_os_800006A0
bios_os_800006A0:
    addiu   $sp, $sp, -0x0038
    sd      $s0, 0x0028($sp)
    li      $v0, 0x00A8
    daddu   $s0, $a0, $0
    li      $a1, 0x000C
    li      $a2, 0x001C
    li      $a3, 0x0128
    sd      $ra, 0x0030($sp)
    jal     bios_os_800005B8
    sw      $v0, 0x0024($sp)
    daddu   $a0, $s0, $0
    li      $v0, 0x0018
    li      $a1, 0x000C
    li      $a2, 0x00CC
    li      $a3, 0x0128
    jal     bios_os_800005B8
    sw      $v0, 0x0024($sp)
    ld      $ra, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop

.globl bios_os_800006F8
bios_os_800006F8:
    lui     $v1, 0x00030448 >> 16
    addiu   $sp, $sp, -0x7FF0
    ori     $v1, 0x00030448 & 0xFFFF
    sd      $s1, 0x7FE0($sp)
    sd      $ra, 0x7FE8($sp)
    sd      $s0, 0x7FD8($sp)
    lui     $a1, 0x00038400 >> 16
    subu    $sp, $sp, $v1
    addiu   $s1, $sp, 0x0020
    ori     $a1, 0x00038400 & 0xFFFF
    addu    $a1, $s1, $a1
    daddu   $v0, $s1, $0
    li      $v1, 0x0040
    li      $a0, -0x0080
    sb      $v1, 0x0000($v0)
.L80000734:
    sb      $v1, 0x0001($v0)
    sb      $a0, 0x0002($v0)
    addiu   $v0, $v0, 0x0003
    bnel    $a1, $v0, .L80000734
    sb      $v1, 0x0000($v0)
    lui     $s0, %hi(_80052B90)
    jal     bios_os_800006A0
    daddu   $a0, $s1, $0
    daddu   $a0, $s1, $0
    jal     bios_os_80000560
    addiu   $a1, $s0, %lo(_80052B90)
    jal     os_80011F00
    addiu   $a0, $s0, %lo(_80052B90)
    lui     $t0, 0x00030448 >> 16
    ori     $t0, 0x00030448 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $s1, 0x7FE0($sp)
    ld      $s0, 0x7FD8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0

.globl bios_os_80000788
bios_os_80000788:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    lui     $s0, %hi(_80052B90)
    sd      $ra, 0x0028($sp)
    jal     os_80011F00
    addiu   $a0, $s0, %lo(_80052B90)
    lui     $v0, %hi(_80052908)
    lw      $v0, %lo(_80052908)($v0)
    lbu     $v0, 0x0053($v0)
    beqz    $v0, .L800007D8
    lui     $a0, %hi(__str_8004EA18)
    addiu   $a0, %lo(__str_8004EA18)
    jal     fat_os_80011AB8
    daddu   $a1, $0, $0
    bnez    $v0, .L800007D8
    addiu   $a0, $s0, %lo(_80052B90)
    jal     fat_os_80010840
    li      $a1, 0x012C
    beqz    $v0, .L800007E4
    ld      $ra, 0x0028($sp)
.L800007D8:
    jal     bios_os_800006F8
    nop
    ld      $ra, 0x0028($sp)
.L800007E4:
    daddu   $v0, $0, $0
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
    nop

.globl bios_os_800007F8
bios_os_800007F8:
    addiu   $sp, $sp, -0x7FF0
    sd      $s2, 0x7FD0($sp)
    sd      $s1, 0x7FC8($sp)
    sd      $s0, 0x7FC0($sp)
    sd      $ra, 0x7FE8($sp)
    sd      $s4, 0x7FE0($sp)
    sd      $s3, 0x7FD8($sp)
    li      $v0, 0xA780
    addiu   $sp, $sp, -0x27C8
    addu    $v0, $v0, $sp
    daddu   $s1, $a1, $0
    sd      $a3, 0x0000($v0)
    daddu   $a1, $0, $0
    jal     fat_os_80011380
    daddu   $s0, $a2, $0
    daddu   $s2, $v0, $0
    beqz    $s2, .L80000868
    nop
.L80000840:
    addiu   $sp, $sp, 0x27C8
.L80000844:
    ld      $ra, 0x7FE8($sp)
    daddu   $v0, $s2, $0
    ld      $s4, 0x7FE0($sp)
    ld      $s3, 0x7FD8($sp)
    ld      $s2, 0x7FD0($sp)
    ld      $s1, 0x7FC8($sp)
    ld      $s0, 0x7FC0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
.L80000868:
    jal     fat_os_8000F7A0
    li      $s2, 0x0019
    sll     $s3, $v0, 9
    li      $v0, 0xA780
    addu    $v0, $v0, $sp
    ld      $a3, 0x0000($v0)
    sltu    $a3, $a3, $s3
    bnezl   $a3, .L80000844
    addiu   $sp, $sp, 0x27C8
    srl     $a1, $s3, 9
    andi    $a1, $a1, 0xFFFF
    jal     fat_os_80010840
    daddu   $a0, $s0, $0
    bnez    $v0, .L80000840
    daddu   $s2, $v0, $0
    addiu   $s4, $sp, 0x0020
    daddu   $a0, $s4, $0
    daddu   $a1, $0, $0
    jal     memset
    li      $a2, 0xA760
    daddu   $a0, $s4, $0
    daddu   $a1, $s0, $0
    jal     os_8000DCF8
    daddu   $a2, $s3, $0
    bltz    $v0, .L80000908
    lw      $v1, 0x002C($sp)
    li      $v0, 0x0140
    beq     $v1, $v0, .L800008E8
    lw      $v1, 0x0030($sp)
    j       .L80000840
    li      $s2, 0x001A
    nop
.L800008E8:
    li      $v0, 0x00F0
    bnel    $v1, $v0, .L80000840
    li      $s2, 0x001A
    daddu   $a0, $s4, $0
    jal     os_8000D938
    daddu   $a1, $s1, $0
    bgezl   $v0, .L80000844
    addiu   $sp, $sp, 0x27C8
.L80000908:
    j       .L80000840
    li      $s2, 0x001B
.L80000910:
    lui     $v1, 0x00030458 >> 16
    addiu   $sp, $sp, -0x7FF0
    ori     $v1, 0x00030458 & 0xFFFF
    sd      $ra, 0x7FE8($sp)
    sd      $s3, 0x7FE0($sp)
    sd      $s2, 0x7FD8($sp)
    sd      $s1, 0x7FD0($sp)
    sd      $s0, 0x7FC8($sp)
    subu    $sp, $sp, $v1
    jal     os_80013370
    daddu   $s3, $a0, $0
    lui     $a0, %hi(__str_8004EA30)
    addiu   $a0, %lo(__str_8004EA30)
    li      $a1, 0x0002
    jal     os_800145A0
    lui     $s2, %hi(_80052B90)
    jal     sysRepaint
    addiu   $s1, $s2, %lo(_80052B90)
    addiu   $s0, $sp, 0x0020
    lui     $a3, 0x00025800 >> 16
    daddu   $a0, $s3, $0
    ori     $a3, 0x00025800 & 0xFFFF
    daddu   $a1, $s0, $0
    jal     bios_os_800007F8
    daddu   $a2, $s1, $0
    bnez    $v0, .L800009D8
    daddu   $s3, $v0, $0
    jal     bios_os_800006A0
    daddu   $a0, $s0, $0
    daddu   $a0, $s0, $0
    jal     bios_os_80000560
    daddu   $a1, $s1, $0
    lui     $a0, %hi(__str_8004EA18)
    addiu   $a0, %lo(__str_8004EA18)
    jal     fat_os_80011AB8
    li      $a1, 0x012C
    beqz    $v0, .L80000A10
    daddu   $s3, $v0, $0
.L800009A8:
    lui     $t0, 0x00030458 >> 16
    ori     $t0, 0x00030458 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    daddu   $v0, $s3, $0
    ld      $s3, 0x7FE0($sp)
    ld      $s2, 0x7FD8($sp)
    ld      $s1, 0x7FD0($sp)
    ld      $s0, 0x7FC8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
    nop
.L800009D8:
    jal     bios_os_80000788
    nop
    lui     $t0, 0x00030458 >> 16
    ori     $t0, 0x00030458 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    daddu   $v0, $s3, $0
    ld      $s3, 0x7FE0($sp)
    ld      $s2, 0x7FD8($sp)
    ld      $s1, 0x7FD0($sp)
    ld      $s0, 0x7FC8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
    nop
.L80000A10:
    daddu   $a0, $s1, $0
    jal     fat_os_80010970
    li      $a1, 0x012C
    bnez    $v0, .L800009A8
    daddu   $s3, $v0, $0
    lui     $v0, %hi(_80052908)
    lw      $v0, %lo(_80052908)($v0)
    lbu     $v1, 0x0053($v0)
    bnez    $v1, .L80000A48
    li      $v1, 0x0001
    jal     os_80007990
    sb      $v1, 0x0053($v0)
    bnez    $v0, .L800009A8
    daddu   $s3, $v0, $0
.L80000A48:
    jal     os_80011F00
    addiu   $a0, $s2, %lo(_80052B90)
    j       .L800009A8
    daddu   $s3, $0, $0

.globl BiDDTblWr
BiDDTblWr:
    addiu   $sp, $sp, -0x0828
    lui     $a1, 0xBF808800 >> 16
    addiu   $a0, $sp, 0x0020
    ori     $a1, 0xBF808800 & 0xFFFF
    sd      $ra, 0x0820($sp)
    jal     sysPI_wr
    li      $a2, 0x0800
    ld      $ra, 0x0820($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0828

.globl BiCartRomWr
BiCartRomWr:
    li      $v0, 0xB0000000
    j       sysPI_wr
    or      $a1, $a1, $v0
    nop

.globl bi_reg_wr
bi_reg_wr:
    addiu   $sp, $sp, -0x0028
    sw      $a1, 0x0030($sp)
    andi    $a0, $a0, 0xFFFF
    li      $a1, 0xBF800000
    or      $a1, $a0, $a1
    li      $a2, 0x0004
    sd      $ra, 0x0020($sp)
    jal     sysPI_wr
    addiu   $a0, $sp, 0x0030
    ld      $ra, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028

.globl BiBootCfgClr
BiBootCfgClr:
    lui     $v0, %hi(biBootCfg)
    lhu     $a1, %lo(biBootCfg)($v0)
    andi    $v1, $a0, 0xFFFF
    nor     $v1, $0, $v1
    and     $v1, $v1, $a1
    daddu   $a1, $v1, $0
    li      $a0, 0x0010
    j       bi_reg_wr
    sh      $v1, %lo(biBootCfg)($v0)
    nop

.globl BiBootCfgSet
BiBootCfgSet:
    lui     $v0, %hi(biBootCfg)
    lhu     $v1, %lo(biBootCfg)($v0)
    or      $v1, $a0, $v1
    andi    $v1, $v1, 0xFFFF
    daddu   $a1, $v1, $0
    li      $a0, 0x0010
    j       bi_reg_wr
    sh      $v1, %lo(biBootCfg)($v0)

.globl bi_set_save_type
bi_set_save_type:
    andi    $a1, $a0, 0x00FF
    j       bi_reg_wr
    li      $a0, 0x8018
    nop

.globl bi_sd_bitlen
bi_sd_bitlen:
    lui     $v0, %hi(bi_sd_cfg)
    lhu     $a1, %lo(bi_sd_cfg)($v0)
    andi    $v1, $a0, 0x000F
    andi    $a1, $a1, 0xFFF0
    or      $v1, $v1, $a1
    daddu   $a1, $v1, $0
    li      $a0, 0x8030
    j       bi_reg_wr
    sh      $v1, %lo(bi_sd_cfg)($v0)
    nop

.globl bi_sd_switch_mode
bi_sd_switch_mode:
    lui     $v0, %hi(bi_old_sd_mode)
    addiu   $sp, $sp, -0x0040
    lhu     $v1, %lo(bi_old_sd_mode)($v0)
    sd      $s2, 0x0030($sp)
    andi    $s2, $a0, 0xFFFF
    sd      $ra, 0x0038($sp)
    sd      $s1, 0x0028($sp)
    beq     $v1, $s2, .L80000BA8
    sd      $s0, 0x0020($sp)
    lui     $s0, %hi(bi_sd_cfg)
    lhu     $s1, %lo(bi_sd_cfg)($s0)
    daddu   $a0, $0, $0
    jal     bi_sd_bitlen
    sh      $s2, %lo(bi_old_sd_mode)($v0)
    daddu   $a0, $s2, $0
    jal     bi_reg_wr
    li      $a1, 0xFFFF
    sh      $s1, %lo(bi_sd_cfg)($s0)
    daddu   $a1, $s1, $0
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    li      $a0, 0x8030
    j       bi_reg_wr
    addiu   $sp, $sp, 0x0040
.L80000BA8:
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040

.globl bi_sd_dat_wr
bi_sd_dat_wr:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    andi    $s0, $a0, 0x00FF
    sd      $ra, 0x0028($sp)
    jal     bi_sd_switch_mode
    li      $a0, 0x802C
    sll     $a1, $s0, 8
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    ori     $a1, $a1, 0x00FF
    li      $a0, 0x802C
    j       bi_reg_wr
    addiu   $sp, $sp, 0x0030
    nop

.globl bi_sd_speed
bi_sd_speed:
    andi    $a0, $a0, 0x00FF
    beqz    $a0, .L80000C20
    lui     $v0, %hi(bi_sd_cfg)
    lhu     $a1, %lo(bi_sd_cfg)($v0)
    li      $a0, 0x8030
    ori     $a1, $a1, 0x0010
    andi    $a1, $a1, 0xFFFF
    j       bi_reg_wr
    sh      $a1, %lo(bi_sd_cfg)($v0)
    nop
.L80000C20:
    lhu     $a1, %lo(bi_sd_cfg)($v0)
    li      $a0, 0x8030
    andi    $a1, $a1, 0xFFEF
    j       bi_reg_wr
    sh      $a1, %lo(bi_sd_cfg)($v0)
    nop

.globl BiBootRomOff
BiBootRomOff:
    lui     $v0, %hi(biSysCfg)
    lhu     $v1, %lo(biSysCfg)($v0)
    li      $a0, 0x8000
    andi    $v1, $v1, 0xFFFE
    daddu   $a1, $v1, $0
    j       bi_reg_wr
    sh      $v1, %lo(biSysCfg)($v0)
    nop

.globl BiBootRomOn
BiBootRomOn:
    lui     $v0, %hi(biSysCfg)
    lhu     $v1, %lo(biSysCfg)($v0)
    li      $a0, 0x8000
    ori     $v1, $v1, 0x0001
    andi    $v1, $v1, 0xFFFF
    daddu   $a1, $v1, $0
    j       bi_reg_wr
    sh      $v1, %lo(biSysCfg)($v0)

.globl BiLockRegs
BiLockRegs:
    li      $a0, 0x8004
    j       bi_reg_wr
    daddu   $a1, $0, $0
    nop

.globl bi_wr_swap
bi_wr_swap:
    andi    $a0, $a0, 0x00FF
    bnez    $a0, .L80000CA8
    lui     $v0, %hi(biSysCfg)
    lhu     $a1, %lo(biSysCfg)($v0)
    li      $a0, 0x8000
    andi    $a1, $a1, 0xFFFB
    j       bi_reg_wr
    sh      $a1, %lo(biSysCfg)($v0)
.L80000CA8:
    lhu     $a1, %lo(biSysCfg)($v0)
    li      $a0, 0x8000
    ori     $a1, $a1, 0x0004
    andi    $a1, $a1, 0xFFFF
    j       bi_reg_wr
    sh      $a1, %lo(biSysCfg)($v0)

.globl BiTimerSet
BiTimerSet:
    andi    $a1, $a0, 0xFFFF
    j       bi_reg_wr
    li      $a0, 0x000C
    nop

.globl BiUsbWrNop
BiUsbWrNop:
    addiu   $sp, $sp, -0x0028
    li      $a0, 0x0004
    sd      $ra, 0x0020($sp)
    jal     bi_reg_wr
    li      $a1, 0xC000
    ld      $ra, 0x0020($sp)
    lui     $v0, 0xBF800400 >> 16
    ori     $v0, 0xBF800400 & 0xFFFF
    jr      $ra
    addiu   $sp, $sp, 0x0028

.globl BiUsbRdNop
BiUsbRdNop:
    addiu   $sp, $sp, -0x0028
    li      $a0, 0x0004
    sd      $ra, 0x0020($sp)
    jal     bi_reg_wr
    li      $a1, 0xC400
    ld      $ra, 0x0020($sp)
    lui     $v0, 0xBF800400 >> 16
    ori     $v0, 0xBF800400 & 0xFFFF
    jr      $ra
    addiu   $sp, $sp, 0x0028

.globl bi_usb_rd_start
bi_usb_rd_start:
    li      $a0, 0x0004
    j       bi_reg_wr
    li      $a1, 0xC600
    nop

.globl BiCartRamWr
BiCartRamWr:
    addiu   $sp, $sp, -0x0040
    sd      $s0, 0x0030($sp)
    daddu   $s0, $a0, $0
    li      $a0, 0x0006
    sd      $ra, 0x0038($sp)
    sd      $a1, 0x0020($sp)
    jal     bi_set_save_type
    sd      $a2, 0x0028($sp)
    ld      $a1, 0x0020($sp)
    li      $v0, 0xA8000000
    ld      $a2, 0x0028($sp)
    daddu   $a0, $s0, $0
    jal     sysPI_wr
    or      $a1, $a1, $v0
    ld      $ra, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    daddu   $a0, $0, $0
    j       bi_set_save_type
    addiu   $sp, $sp, 0x0040
    nop

.globl BiDDTblRd
BiDDTblRd:
    lui     $a1, 0xBF808800 >> 16
    ori     $a1, 0xBF808800 & 0xFFFF
    j       sysPI_rd
    li      $a2, 0x0800

.globl BiCartRomRd
BiCartRomRd:
    li      $v0, 0xB0000000
    j       sysPI_rd
    or      $a1, $a1, $v0
    nop

.globl BiBootRomRd
BiBootRomRd:
    addiu   $sp, $sp, -0x0060
    sd      $s1, 0x0040($sp)
    lui     $s1, 0xA4600014 >> 16
    sd      $s0, 0x0038($sp)
    li      $v0, 0x0042
    ori     $s0, $s1, 0x0018
    ori     $s1, 0xA4600014 & 0xFFFF
    sd      $s3, 0x0050($sp)
    sd      $s2, 0x0048($sp)
    lw      $s3, 0x0000($s1)
    lw      $s2, 0x0000($s0)
    sw      $v0, 0x0000($s1)
    li      $v0, 0x0016
    sw      $v0, 0x0000($s0)
    sd      $ra, 0x0058($sp)
    sd      $a0, 0x0020($sp)
    sd      $a1, 0x0028($sp)
    jal     BiBootRomOn
    sd      $a2, 0x0030($sp)
    ld      $a0, 0x0020($sp)
    ld      $a1, 0x0028($sp)
    jal     BiCartRomRd
    ld      $a2, 0x0030($sp)
    jal     BiBootRomOff
    nop
    ld      $ra, 0x0058($sp)
    sw      $s3, 0x0000($s1)
    daddu   $v0, $0, $0
    sw      $s2, 0x0000($s0)
    ld      $s3, 0x0050($sp)
    ld      $s2, 0x0048($sp)
    ld      $s1, 0x0040($sp)
    ld      $s0, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060
    nop

.globl bios_os_80000E30
bios_os_80000E30:
    lui     $a1, 0x0003FFC0 >> 16
    addiu   $sp, $sp, -0x0028
    ori     $a1, 0x0003FFC0 & 0xFFFF
    sd      $ra, 0x0020($sp)
    jal     BiBootRomRd
    li      $a2, 0x0040
    ld      $ra, 0x0020($sp)
    daddu   $v0, $0, $0
    jr      $ra
    addiu   $sp, $sp, 0x0028

.globl bios_os_80000E58
bios_os_80000E58:
    li      $a1, 0x00400000
    j       BiBootRomRd
    li      $a2, 0x0008
    nop

.globl BiCartRamRd
BiCartRamRd:
    addiu   $sp, $sp, -0x0040
    sd      $s0, 0x0030($sp)
    daddu   $s0, $a0, $0
    li      $a0, 0x0006
    sd      $ra, 0x0038($sp)
    sd      $a1, 0x0020($sp)
    jal     bi_set_save_type
    sd      $a2, 0x0028($sp)
    ld      $a1, 0x0020($sp)
    li      $v0, 0xA8000000
    ld      $a2, 0x0028($sp)
    daddu   $a0, $s0, $0
    jal     sysPI_rd
    or      $a1, $a1, $v0
    ld      $ra, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    daddu   $a0, $0, $0
    j       bi_set_save_type
    addiu   $sp, $sp, 0x0040
    nop

.globl bi_reg_rd
bi_reg_rd:
    addiu   $sp, $sp, -0x0030
    li      $v0, 0xBF800000
    andi    $a0, $a0, 0xFFFF
    or      $a1, $a0, $v0
    li      $a2, 0x0004
    sd      $ra, 0x0028($sp)
    jal     sysPI_rd
    addiu   $a0, $sp, 0x0020
    ld      $ra, 0x0028($sp)
    lw      $v0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030

.globl BiBootCfgGet
BiBootCfgGet:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    andi    $s0, $a0, 0xFFFF
    sd      $ra, 0x0028($sp)
    jal     bi_reg_rd
    li      $a0, 0x0010
    ld      $ra, 0x0028($sp)
    andi    $v0, $v0, 0xFFFF
    lui     $v1, %hi(biBootCfg)
    sh      $v0, %lo(biBootCfg)($v1)
    and     $v0, $v0, $s0
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030

.globl BiI2CDatWr
BiI2CDatWr:
    addiu   $sp, $sp, -0x0038
    sd      $s0, 0x0020($sp)
    andi    $s0, $a1, 0x00FF
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0030($sp)
    beqz    $s0, .L80000F70
    daddu   $s1, $a0, $0
    nop
.L80000F40:
    lbu     $a1, 0x0000($s1)
    jal     bi_reg_wr
    li      $a0, 0x001C
.L80000F4C:
    jal     bi_reg_rd
    li      $a0, 0x0018
    andi    $v0, $v0, 0x0080
    bnez    $v0, .L80000F4C
    nop
    addiu   $s0, $s0, -0x0001
    andi    $s0, $s0, 0x00FF
    bnez    $s0, .L80000F40
    addiu   $s1, $s1, 0x0001
.L80000F70:
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop

.globl BiI2CDatRd
BiI2CDatRd:
    addiu   $sp, $sp, -0x0038
    andi    $a1, $a1, 0xFFFF
    sd      $ra, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    beqz    $a1, .L80000FF8
    sd      $s0, 0x0020($sp)
    addiu   $a1, $a1, -0x0001
    daddu   $s1, $a0, $0
    andi    $s0, $a1, 0xFFFF
    nop
.L80000FB0:
    li      $a0, 0x001C
    jal     bi_reg_wr
    li      $a1, 0x00FF
    nop
.L80000FC0:
    jal     bi_reg_rd
    li      $a0, 0x0018
    andi    $v0, $v0, 0x0080
    bnez    $v0, .L80000FC0
    nop
    jal     bi_reg_rd
    li      $a0, 0x001C
    beqz    $s0, .L80000FF8
    sb      $v0, 0x0000($s1)
    addiu   $s0, $s0, -0x0001
    addiu   $s1, $s1, 0x0001
    j       .L80000FB0
    andi    $s0, $s0, 0xFFFF
    nop
.L80000FF8:
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop

.globl BiI2CStatus
BiI2CStatus:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     bi_reg_rd
    li      $a0, 0x0018
    ld      $ra, 0x0020($sp)
    andi    $v0, $v0, 0x0001
    jr      $ra
    addiu   $sp, $sp, 0x0028

.globl BiI2CDat
BiI2CDat:
    addiu   $sp, $sp, -0x0028
    andi    $a1, $a0, 0x00FF
    sd      $ra, 0x0020($sp)
    jal     bi_reg_wr
    li      $a0, 0x001C
    nop
.L80001048:
    jal     bi_reg_rd
    li      $a0, 0x0018
    andi    $v0, $v0, 0x0080
    bnez    $v0, .L80001048
    nop
    jal     bi_reg_rd
    li      $a0, 0x001C
    ld      $ra, 0x0020($sp)
    andi    $v0, $v0, 0x00FF
    jr      $ra
    addiu   $sp, $sp, 0x0028
    nop

.globl BiI2CCmd
BiI2CCmd:
    addiu   $sp, $sp, -0x0028
    andi    $a1, $a0, 0x00FF
    sd      $ra, 0x0020($sp)
    jal     bi_reg_wr
    li      $a0, 0x001C
    nop
.L80001090:
    jal     bi_reg_rd
    li      $a0, 0x0018
    andi    $v0, $v0, 0x0080
    bnez    $v0, .L80001090
    nop
    jal     bi_reg_rd
    li      $a0, 0x0018
    ld      $ra, 0x0020($sp)
    andi    $v0, $v0, 0x0001
    jr      $ra
    addiu   $sp, $sp, 0x0028
    nop

.globl BiI2CSetWr
BiI2CSetWr:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     bi_reg_rd
    li      $a0, 0x0018
    andi    $v0, $v0, 0x00FF
    ld      $ra, 0x0020($sp)
    ori     $a1, $v0, 0x0011
    li      $a0, 0x0018
    j       bi_reg_wr
    addiu   $sp, $sp, 0x0028

.globl BiI2CSetRd
BiI2CSetRd:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     bi_reg_rd
    li      $a0, 0x0018
    andi    $v0, $v0, 0x00FF
    ld      $ra, 0x0020($sp)
    ori     $a1, $v0, 0x0010
    li      $a0, 0x0018
    j       bi_reg_wr
    addiu   $sp, $sp, 0x0028

.globl BiI2CEnd
BiI2CEnd:
    addiu   $sp, $sp, -0x0028
    li      $a0, 0x0018
    sd      $ra, 0x0020($sp)
    jal     bi_reg_wr
    li      $a1, 0x0030
    li      $a0, 0x001C
    jal     bi_reg_wr
    li      $a1, 0x00FF
.L80001130:
    jal     bi_reg_rd
    li      $a0, 0x0018
    andi    $v0, $v0, 0x0080
    bnez    $v0, .L80001130
    ld      $ra, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028
    nop

.globl BiI2CStart
BiI2CStart:
    addiu   $sp, $sp, -0x0030
    li      $a0, 0x0018
    sd      $ra, 0x0028($sp)
    jal     bi_reg_rd
    sd      $s0, 0x0020($sp)
    li      $a0, 0x0018
    li      $a1, 0x0020
    jal     bi_reg_wr
    daddu   $s0, $v0, $0
    li      $a0, 0x001C
    jal     bi_reg_wr
    li      $a1, 0x00FF
.L80001180:
    jal     bi_reg_rd
    li      $a0, 0x0018
    andi    $v0, $v0, 0x0080
    bnez    $v0, .L80001180
    andi    $a1, $s0, 0x00FF
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    ori     $a1, $a1, 0x0011
    li      $a0, 0x0018
    j       bi_reg_wr
    addiu   $sp, $sp, 0x0030
    nop

.globl __BiI2CWr
__BiI2CWr:
    addiu   $sp, $sp, -0x0058
    sd      $s0, 0x0020($sp)
    andi    $s0, $a0, 0xFFFF
    sltiu   $v0, $s0, 0x0100
    sd      $s2, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s4, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    andi    $s2, $a2, 0xFFFF
    bnez    $v0, .L800011E8
    li      $s1, 0x00A2
    li      $s1, 0x00D0
.L800011E8:
    daddu   $s3, $a1, $0
    nop
.L800011F0:
    j       .L80001208
    li      $s4, 0x00FF
.L800011F8:
    jal     BiI2CEnd
    andi    $s4, $s4, 0x00FF
    beqz    $s4, .L80001280
    ld      $ra, 0x0050($sp)
.L80001208:
    jal     BiI2CStart
    nop
    jal     BiI2CCmd
    daddu   $a0, $s1, $0
    bnezl   $v0, .L800011F8
    addiu   $s4, $s4, -0x0001
    beqz    $s2, .L800012A4
    nop
    jal     BiI2CCmd
    andi    $a0, $s0, 0x00FF
    bnez    $v0, .L800012D4
    sltiu   $v0, $s2, 0x0008
    bnez    $v0, .L80001270
    andi    $a1, $s2, 0x00FF
    li      $s4, 0x0008
    li      $s5, 0x0008
    li      $a1, 0x0008
.L8000124C:
    daddu   $a0, $s3, $0
    addu    $s0, $s4, $s0
    jal     BiI2CDatWr
    subu    $s2, $s2, $s4
    jal     BiI2CEnd
    addu    $s3, $s3, $s5
    andi    $s2, $s2, 0xFFFF
    j       .L800011F0
    andi    $s0, $s0, 0xFFFF
.L80001270:
    daddu   $s5, $a1, $0
    j       .L8000124C
    daddu   $s4, $a1, $0
    nop
.L80001280:
    li      $v0, 0x00B1
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
.L800012A4:
    jal     BiI2CEnd
    nop
    ld      $ra, 0x0050($sp)
    daddu   $v0, $0, $0
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
.L800012D4:
    ld      $ra, 0x0050($sp)
    li      $v0, 0x00B0
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
    nop

.globl BiI2CWr
BiI2CWr:
    daddu   $v0, $a0, $0
    andi    $a2, $a2, 0xFFFF
    andi    $a0, $a1, 0xFFFF
    j       __BiI2CWr
    daddu   $a1, $v0, $0
    nop

.globl __BiI2CRd
__BiI2CRd:
    addiu   $sp, $sp, -0x0050
    sd      $s0, 0x0028($sp)
    andi    $s0, $a0, 0xFFFF
    sltiu   $v0, $s0, 0x0100
    sd      $s3, 0x0040($sp)
    sd      $s1, 0x0030($sp)
    sd      $ra, 0x0048($sp)
    sd      $s2, 0x0038($sp)
    daddu   $s1, $a1, $0
    bnez    $v0, .L80001380
    andi    $s3, $a2, 0xFFFF
    li      $a0, 0x00D0
    jal     BiI2CStart
    sd      $a0, 0x0020($sp)
    ld      $a0, 0x0020($sp)
    jal     BiI2CCmd
    li      $s2, 0x00D0
    beqz    $v0, .L800013A0
    li      $v0, 0x00B0
.L80001364:
    ld      $ra, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
.L80001380:
    li      $a0, 0x00A2
    jal     BiI2CStart
    sd      $a0, 0x0020($sp)
    ld      $a0, 0x0020($sp)
    jal     BiI2CCmd
    li      $s2, 0x00A2
    bnez    $v0, .L80001364
    li      $v0, 0x00B0
.L800013A0:
    jal     BiI2CCmd
    andi    $a0, $s0, 0x00FF
    bnez    $v0, .L80001364
    li      $v0, 0x00B0
    jal     BiI2CStart
    nop
    jal     BiI2CCmd
    ori     $a0, $s2, 0x0001
    bnezl   $v0, .L80001364
    li      $v0, 0x00B0
    jal     BiI2CSetRd
    nop
    daddu   $a1, $s3, $0
    jal     BiI2CDatRd
    daddu   $a0, $s1, $0
    jal     BiI2CSetWr
    nop
    jal     BiI2CCmd
    li      $a0, 0x00FF
    jal     BiI2CEnd
    nop
    j       .L80001364
    daddu   $v0, $0, $0
    nop

.globl BiRTCRd
BiRTCRd:
    addiu   $sp, $sp, -0x0040
    sd      $s0, 0x0030($sp)
    addiu   $a1, $sp, 0x0020
    daddu   $s0, $a0, $0
    li      $a2, 0x0010
    sd      $ra, 0x0038($sp)
    jal     __BiI2CRd
    li      $a0, 0x0100
    bnez    $v0, .L80001474
    lbu     $t2, 0x002F($sp)
    lbu     $a3, 0x0022($sp)
    lbu     $a2, 0x0023($sp)
    lbu     $a0, 0x0025($sp)
    lbu     $t1, 0x0020($sp)
    lbu     $t0, 0x0021($sp)
    lbu     $a1, 0x0024($sp)
    lbu     $v1, 0x0026($sp)
    andi    $a3, $a3, 0x003F
    andi    $a2, $a2, 0x0007
    andi    $a0, $a0, 0x001F
    andi    $t2, $t2, 0x0080
    sb      $t2, 0x0007($s0)
    sb      $t1, 0x0000($s0)
    sb      $t0, 0x0001($s0)
    sb      $a3, 0x0002($s0)
    sb      $a2, 0x0004($s0)
    sb      $a1, 0x0003($s0)
    sb      $a0, 0x0005($s0)
    sb      $v1, 0x0006($s0)
.L80001474:
    ld      $ra, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040
    nop

.globl BiI2CRd
BiI2CRd:
    daddu   $v0, $a0, $0
    andi    $a2, $a2, 0xFFFF
    andi    $a0, $a1, 0xFFFF
    j       __BiI2CRd
    daddu   $a1, $v0, $0
    nop

.globl bi_sd_to_rom
bi_sd_to_rom:
    addiu   $sp, $sp, -0x0030
    sll     $a0, $a0, 9
    sd      $s0, 0x0020($sp)
    andi    $s0, $a1, 0xFFFF
    daddu   $a1, $a0, $0
    sd      $ra, 0x0028($sp)
    jal     bi_reg_wr
    li      $a0, 0x8008
    li      $a0, 0x800C
    jal     bi_reg_wr
    daddu   $a1, $s0, $0
    jal     bi_sd_switch_mode
    li      $a0, 0x8028
    nop
.L800014D8:
    jal     bi_reg_rd
    li      $a0, 0x8008
    andi    $v0, $v0, 0xFFFF
    andi    $v1, $v0, 0x0001
    bnez    $v1, .L800014D8
    andi    $v0, $v0, 0x0002
    sltu    $v0, $0, $v0
    ld      $ra, 0x0028($sp)
    subu    $v0, $0, $v0
    andi    $v0, $v0, 0x00D3
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
    nop

.globl bi_sd_dat_rd
bi_sd_dat_rd:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     bi_sd_switch_mode
    li      $a0, 0x8028
    li      $a0, 0x8028
    jal     bi_reg_wr
    li      $a1, 0xFFFF
    jal     bi_reg_rd
    li      $a0, 0x8028
    ld      $ra, 0x0020($sp)
    andi    $v0, $v0, 0x00FF
    jr      $ra
    addiu   $sp, $sp, 0x0028
    nop

.globl bi_sd_busy
bi_sd_busy:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
.L80001550:
    jal     bi_reg_rd
    li      $a0, 0x8030
    andi    $v0, $v0, 0x0080
    bnez    $v0, .L80001550
    ld      $ra, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028
    nop

.globl bi_sd_cmd_wr
bi_sd_cmd_wr:
    addiu   $sp, $sp, -0x0030
    andi    $a1, $a0, 0x00FF
    li      $a0, 0x8024
    sd      $ra, 0x0028($sp)
    jal     bi_sd_switch_mode
    sd      $a1, 0x0020($sp)
    ld      $a1, 0x0020($sp)
    jal     bi_reg_wr
    li      $a0, 0x8024
    ld      $ra, 0x0028($sp)
    j       bi_sd_busy
    addiu   $sp, $sp, 0x0030

.globl bi_sd_cmd_rd
bi_sd_cmd_rd:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     bi_sd_switch_mode
    li      $a0, 0x8020
    li      $a0, 0x8020
    jal     bi_reg_wr
    li      $a1, 0xFFFF
    jal     bi_sd_busy
    nop
    jal     bi_reg_rd
    li      $a0, 0x8020
    ld      $ra, 0x0020($sp)
    andi    $v0, $v0, 0x00FF
    jr      $ra
    addiu   $sp, $sp, 0x0028
    nop

.globl bios_os_800015E0
bios_os_800015E0:
    addiu   $sp, $sp, -0x00B0
    sd      $s0, 0x00A0($sp)
    addiu   $s0, $sp, 0x0020
    sd      $ra, 0x00A8($sp)
    jal     bios_os_80000E58
    daddu   $a0, $s0, $0
    jal     bios_os_80000E30
    addiu   $a0, $sp, 0x0060
    addiu   $v1, $sp, 0x0070
    addiu   $v0, $sp, 0x0022
    addiu   $a1, $sp, 0x0078
    nop
.L80001610:
    lbu     $a0, 0x0000($v1)
    addiu   $v1, $v1, 0x0001
    sh      $a0, 0x0020($v0)
    sh      $a0, 0x0000($v0)
    bne     $v1, $a1, .L80001610
    addiu   $v0, $v0, 0x0004
    jal     BiBootRomOn
    nop
    daddu   $a0, $s0, $0
    li      $a1, 0x00400000
    jal     BiCartRomWr
    li      $a2, 0x0040
    jal     BiBootRomOff
    nop
    jal     bi_reg_rd
    li      $a0, 0x8008
    ld      $ra, 0x00A8($sp)
    andi    $v0, $v0, 0x0080
    ld      $s0, 0x00A0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00B0
    nop

.globl BiGetIOMVer
BiGetIOMVer:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     bi_reg_rd
    li      $a0, 0x0014
    ld      $ra, 0x0020($sp)
    andi    $v0, $v0, 0x00FF
    jr      $ra
    addiu   $sp, $sp, 0x0028

.globl BiGetMCNVer
BiGetMCNVer:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     bi_reg_rd
    li      $a0, 0x8040
    ld      $ra, 0x0020($sp)
    andi    $v0, $v0, 0x00FF
    jr      $ra
    addiu   $sp, $sp, 0x0028

.globl BiTimerGet
BiTimerGet:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     bi_reg_rd
    li      $a0, 0x000C
    ld      $ra, 0x0020($sp)
    andi    $v0, $v0, 0xFFFF
    jr      $ra
    addiu   $sp, $sp, 0x0028

.globl bi_usb_busy
bi_usb_busy:
    addiu   $sp, $sp, -0x0038
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0030($sp)
    daddu   $s0, $0, $0
    j       .L800016F0
    li      $s1, 0x2000
    nop
.L800016E8:
    beq     $s0, $s1, .L80001714
    addiu   $s0, $s0, 0x0001
.L800016F0:
    jal     bi_reg_rd
    li      $a0, 0x0004
    andi    $v0, $v0, 0x0200
    bnez    $v0, .L800016E8
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
.L80001714:
    li      $a0, 0x0004
    jal     bi_reg_wr
    li      $a1, 0xC400
    ld      $ra, 0x0030($sp)
    li      $v0, 0x00B2
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038

.globl bi_usb_wr
bi_usb_wr:
    addiu   $sp, $sp, -0x0060
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    daddu   $s1, $a0, $0
    daddu   $s0, $a1, $0
    li      $a0, 0x0004
    li      $a1, 0xC000
    sd      $ra, 0x0058($sp)
    sd      $s6, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s4, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    jal     bi_reg_wr
    sd      $s2, 0x0030($sp)
    beqz    $s0, .L8000180C
    daddu   $v0, $0, $0
    li      $s3, 0xBF800000
    li      $s2, 0x0200
    j       .L800017C4
    ori     $s4, $s3, 0x0400
.L80001788:
    li      $s5, 0x0200
    daddu   $a1, $s4, $0
    daddu   $a2, $s5, $0
    daddu   $a0, $s1, $0
    jal     sysPI_wr
    li      $s6, 0xC200
    daddu   $a1, $s6, $0
    jal     bi_reg_wr
    li      $a0, 0x0004
    jal     bi_usb_busy
    subu    $s0, $s0, $s5
    bnez    $v0, .L80001810
    ld      $ra, 0x0058($sp)
.L800017BC:
    beqz    $s0, .L8000180C
    addiu   $s1, $s1, 0x0200
.L800017C4:
    andi    $s5, $s0, 0xFFFF
    subu    $s6, $s2, $s5
    andi    $s6, $s6, 0xFFFF
    sltiu   $v0, $s0, 0x0200
    beqz    $v0, .L80001788
    addiu   $a1, $s6, 0x0400
    or      $a1, $a1, $s3
    daddu   $a2, $s5, $0
    daddu   $a0, $s1, $0
    jal     sysPI_wr
    ori     $s6, $s6, 0xC200
    daddu   $a1, $s6, $0
    jal     bi_reg_wr
    li      $a0, 0x0004
    jal     bi_usb_busy
    subu    $s0, $s0, $s5
    beqz    $v0, .L800017BC
    nop
.L8000180C:
    ld      $ra, 0x0058($sp)
.L80001810:
    ld      $s6, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060
    nop

.globl bi_usb_can_wr
bi_usb_can_wr:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     bi_reg_rd
    li      $a0, 0x0004
    andi    $v0, $v0, 0x1800
    ld      $ra, 0x0020($sp)
    xori    $v0, $v0, 0x1000
    sltiu   $v0, $v0, 0x0001
    jr      $ra
    addiu   $sp, $sp, 0x0028

.globl bi_usb_can_rd
bi_usb_can_rd:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     bi_reg_rd
    li      $a0, 0x0004
    andi    $v0, $v0, 0x1400
    ld      $ra, 0x0020($sp)
    xori    $v0, $v0, 0x1000
    sltiu   $v0, $v0, 0x0001
    jr      $ra
    addiu   $sp, $sp, 0x0028

.globl bi_sd_to_ram
bi_sd_to_ram:
    lui     $v0, 0xA4600018 >> 16
    addiu   $sp, $sp, -0x0068
    ori     $v0, 0xA4600018 & 0xFFFF
    li      $v1, 0x0009
    andi    $a1, $a1, 0xFFFF
    sd      $s5, 0x0050($sp)
    sd      $s1, 0x0030($sp)
    lw      $s5, 0x0000($v0)
    sd      $ra, 0x0060($sp)
    sd      $s6, 0x0058($sp)
    sd      $s4, 0x0048($sp)
    sd      $s3, 0x0040($sp)
    sd      $s2, 0x0038($sp)
    sd      $s0, 0x0028($sp)
    daddu   $s1, $a0, $0
    sw      $v1, 0x0000($v0)
    beqz    $a1, .L80001988
    addiu   $a1, $a1, -0x0001
    lui     $s3, 0xBF808200 >> 16
    andi    $s2, $a1, 0xFFFF
    ori     $s3, 0xBF808200 & 0xFFFF
    li      $s0, 0x00F0
    addiu   $s4, $sp, 0x0020
.L800018E4:
    jal     bi_sd_bitlen
    li      $a0, 0x0001
    j       .L80001900
    li      $s6, 0x0001
    nop
.L800018F8:
    beqz    $s6, .L80001954
    lui     $v0, 0xA4600018 >> 16
.L80001900:
    jal     bi_sd_dat_rd
    addiu   $s6, $s6, 0x0001
    bne     $v0, $s0, .L800018F8
    andi    $s6, $s6, 0xFFFF
    jal     bi_sd_bitlen
    li      $a0, 0x0004
    jal     bi_sd_switch_mode
    li      $a0, 0x8028
    daddu   $a0, $s1, $0
    daddu   $a1, $s3, $0
    jal     sysPI_rd
    li      $a2, 0x0200
    daddu   $a0, $s4, $0
    daddu   $a1, $s3, $0
    jal     sysPI_rd
    li      $a2, 0x0008
    beqz    $s2, .L80001988
    addiu   $s2, $s2, -0x0001
    addiu   $s1, $s1, 0x0200
    j       .L800018E4
    andi    $s2, $s2, 0xFFFF
.L80001954:
    ld      $ra, 0x0060($sp)
    ori     $v0, 0xA4600018 & 0xFFFF
    sw      $s5, 0x0000($v0)
    ld      $s6, 0x0058($sp)
    li      $v0, 0x00D3
    ld      $s5, 0x0050($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0068
.L80001988:
    lui     $v0, 0xA4600018 >> 16
    ld      $ra, 0x0060($sp)
    ori     $v0, 0xA4600018 & 0xFFFF
    sw      $s5, 0x0000($v0)
    ld      $s6, 0x0058($sp)
    daddu   $v0, $0, $0
    ld      $s5, 0x0050($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0068

.globl bi_usb_rd
bi_usb_rd:
    addiu   $sp, $sp, -0x0060
    sd      $s2, 0x0038($sp)
    sd      $s1, 0x0030($sp)
    sd      $ra, 0x0058($sp)
    sd      $s5, 0x0050($sp)
    sd      $s4, 0x0048($sp)
    sd      $s3, 0x0040($sp)
    sd      $s0, 0x0028($sp)
    daddu   $s1, $a1, $0
    daddu   $s2, $a0, $0
    beqz    $a1, .L80001A5C
    daddu   $v0, $0, $0
    li      $s4, 0x0200
    j       .L80001A10
    li      $s3, 0xBF800000
    nop
.L80001A00:
    jal     sysPI_rd
    sd      $v0, 0x0020($sp)
    beqz    $s1, .L80001A5C
    ld      $v0, 0x0020($sp)
.L80001A10:
    andi    $s0, $s1, 0xFFFF
    subu    $s5, $s4, $s0
    andi    $s5, $s5, 0xFFFF
    sltiu   $v0, $s1, 0x0200
    bnez    $v0, .L80001A34
    ori     $a1, $s5, 0xC600
    li      $a1, 0xC600
    daddu   $s5, $0, $0
    li      $s0, 0x0200
.L80001A34:
    jal     bi_reg_wr
    li      $a0, 0x0004
    jal     bi_usb_busy
    subu    $s1, $s1, $s0
    addiu   $a1, $s5, 0x0400
    daddu   $a0, $s2, $0
    or      $a1, $a1, $s3
    daddu   $a2, $s0, $0
    beqz    $v0, .L80001A00
    addu    $s2, $s2, $s0
.L80001A5C:
    ld      $ra, 0x0058($sp)
    ld      $s5, 0x0050($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060

.globl bi_usb_init
bi_usb_init:
    addiu   $sp, $sp, -0x0230
    li      $a0, 0x0004
    li      $a1, 0xC400
    sd      $s0, 0x0220($sp)
    sd      $ra, 0x0228($sp)
    jal     bi_reg_wr
    addiu   $s0, $sp, 0x0020
    nop
.L80001AA0:
    jal     bi_usb_can_rd
    nop
    daddu   $a0, $s0, $0
    beqz    $v0, .L80001AC4
    li      $a1, 0x0200
    jal     bi_usb_rd
    nop
    beqz    $v0, .L80001AA0
    nop
.L80001AC4:
    ld      $ra, 0x0228($sp)
    ld      $s0, 0x0220($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0230
    nop

.globl bi_usb_rd_end
bi_usb_rd_end:
    addiu   $sp, $sp, -0x0030
    sd      $a0, 0x0020($sp)
    sd      $ra, 0x0028($sp)
    jal     bi_usb_busy
    nop
    bnez    $v0, .L80001B0C
    ld      $a0, 0x0020($sp)
    lui     $a1, 0xBF800400 >> 16
    ori     $a1, 0xBF800400 & 0xFFFF
    li      $a2, 0x0200
    jal     sysPI_rd
    sd      $v0, 0x0020($sp)
    ld      $v0, 0x0020($sp)
.L80001B0C:
    ld      $ra, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030

.globl BiRTCInfo
BiRTCInfo:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    lui     $a0, %hi(SI_eeprom_status_block)
    lui     $s0, %hi(SI_eeprom_status_output)
    addiu   $a1, $s0, %lo(SI_eeprom_status_output)
    addiu   $a0, %lo(SI_eeprom_status_block)
    sd      $ra, 0x0028($sp)
    jal     sysExecPIF
    addiu   $s0, %lo(SI_eeprom_status_output)
    lwu     $v0, 0x0008($s0)
    ld      $ra, 0x0028($sp)
    sll     $v0, $v0, 0
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
    nop

.globl BiRTCSet
BiRTCSet:
    addiu   $sp, $sp, -0x0030
    sd      $ra, 0x0028($sp)
    andi    $v0, $a1, 0x00FF
    beqz    $a0, .L80001BA4
    sd      $0, 0x0020($sp)
    lbu     $v1, 0x0006($a0)
    lbu     $t1, 0x0000($a0)
    lbu     $t0, 0x0001($a0)
    lbu     $a3, 0x0002($a0)
    lbu     $a2, 0x0003($a0)
    lbu     $a1, 0x0004($a0)
    lbu     $a0, 0x0005($a0)
    sb      $t1, 0x0020($sp)
    sb      $t0, 0x0021($sp)
    sb      $a3, 0x0022($sp)
    sb      $a2, 0x0023($sp)
    sb      $a1, 0x0024($sp)
    sb      $a0, 0x0025($sp)
    sb      $v1, 0x0026($sp)
.L80001BA4:
    lui     $a1, 0xBF808010 >> 16
    sltu    $v0, $0, $v0
    addiu   $a0, $sp, 0x0020
    ori     $a1, 0xBF808010 & 0xFFFF
    li      $a2, 0x0008
    jal     sysPI_wr
    sb      $v0, 0x0027($sp)
    ld      $ra, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
    nop

.globl bi_init
bi_init:
    lui     $v1, 0xA4600014 >> 16
    li      $a2, 0x0004
    ori     $v0, $v1, 0x0018
    ori     $v1, 0xA4600014 & 0xFFFF
    addiu   $sp, $sp, -0x0030
    sw      $a2, 0x0000($v1)
    li      $v1, 0x000C
    sw      $v1, 0x0000($v0)
    sd      $s0, 0x0020($sp)
    li      $a0, 0x8004
    lui     $s0, %hi(biSysCfg)
    li      $a1, 0xAA55
    sd      $ra, 0x0028($sp)
    jal     bi_reg_wr
    sh      $0, %lo(biSysCfg)($s0)
    lhu     $a1, %lo(biSysCfg)($s0)
    jal     bi_reg_wr
    li      $a0, 0x8000
    jal     bi_usb_init
    nop
    daddu   $a1, $0, $0
    li      $a0, 0x8030
    lui     $v0, %hi(bi_sd_cfg)
    jal     bi_reg_wr
    sh      $0, %lo(bi_sd_cfg)($v0)
    jal     bi_sd_cmd_rd
    nop
    jal     bi_sd_dat_rd
    nop
    jal     bi_set_save_type
    daddu   $a0, $0, $0
    daddu   $a1, $0, $0
    jal     BiRTCSet
    daddu   $a0, $0, $0
    jal     BiBootCfgGet
    li      $a0, 0xFFFF
    jal     BiBootCfgSet
    li      $a0, 0x8000
    jal     BiI2CEnd
    nop
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       BiI2CEnd
    addiu   $sp, $sp, 0x0030

.globl BiRTCWr
BiRTCWr:
    addiu   $sp, $sp, -0x0038
    sd      $ra, 0x0030($sp)
    lbu     $t1, 0x0002($a0)
    lbu     $t0, 0x0004($a0)
    lbu     $v1, 0x0005($a0)
    lbu     $v0, 0x0006($a0)
    lbu     $t3, 0x0000($a0)
    lbu     $t2, 0x0001($a0)
    lbu     $a3, 0x0003($a0)
    andi    $t1, $t1, 0x003F
    andi    $t0, $t0, 0x0007
    andi    $v1, $v1, 0x001F
    addiu   $a1, $sp, 0x0020
    li      $a0, 0x0100
    li      $a2, 0x0010
    sd      $0, 0x0020($sp)
    sd      $0, 0x0028($sp)
    sb      $t3, 0x0020($sp)
    sb      $t2, 0x0021($sp)
    sb      $t1, 0x0022($sp)
    sb      $t0, 0x0023($sp)
    sb      $a3, 0x0024($sp)
    sb      $v1, 0x0025($sp)
    jal     __BiI2CWr
    sb      $v0, 0x0026($sp)
    ld      $ra, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038

.globl BiCartFill
BiCartFill:
    addiu   $sp, $sp, -0x0850
    andi    $a0, $a0, 0x00FF
    sd      $s2, 0x0830($sp)
    addiu   $s2, $sp, 0x0020
    sd      $s1, 0x0828($sp)
    sd      $s0, 0x0820($sp)
    daddu   $s1, $a1, $0
    daddu   $s0, $a2, $0
    daddu   $a1, $a0, $0
    li      $a2, 0x0800
    daddu   $a0, $s2, $0
    sd      $ra, 0x0848($sp)
    sd      $s4, 0x0840($sp)
    jal     memset
    sd      $s3, 0x0838($sp)
    beqz    $s0, .L80001D68
    li      $s4, 0x0800
    nop
.L80001D38:
    sltu    $v0, $s0, $s4
    daddu   $a1, $s1, $0
    daddu   $a0, $s2, $0
    beqz    $v0, .L80001D54
    daddu   $s3, $s4, $0
    daddu   $s3, $s0, $0
    daddu   $s4, $s0, $0
.L80001D54:
    daddu   $a2, $s3, $0
    jal     sysPI_wr
    subu    $s0, $s0, $s3
    bnez    $s0, .L80001D38
    addu    $s1, $s1, $s3
.L80001D68:
    ld      $ra, 0x0848($sp)
    ld      $s4, 0x0840($sp)
    ld      $s3, 0x0838($sp)
    ld      $s2, 0x0830($sp)
    ld      $s1, 0x0828($sp)
    ld      $s0, 0x0820($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0850

.globl BiCartRomFill
BiCartRomFill:
    li      $v0, 0xB0000000
    or      $a1, $a1, $v0
    j       BiCartFill
    andi    $a0, $a0, 0x00FF

.globl BiCartRamFill
BiCartRamFill:
    addiu   $sp, $sp, -0x0040
    sd      $s0, 0x0030($sp)
    andi    $s0, $a0, 0x00FF
    li      $a0, 0x0006
    sd      $ra, 0x0038($sp)
    sd      $a1, 0x0020($sp)
    jal     bi_set_save_type
    sd      $a2, 0x0028($sp)
    ld      $a1, 0x0020($sp)
    li      $v0, 0xA8000000
    ld      $a2, 0x0028($sp)
    daddu   $a0, $s0, $0
    jal     BiCartFill
    or      $a1, $a1, $v0
    ld      $ra, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    daddu   $a0, $0, $0
    j       bi_set_save_type
    addiu   $sp, $sp, 0x0040
    nop

.globl BiRTCGet
BiRTCGet:
    addiu   $sp, $sp, -0x0038
    lui     $v0, %hi(SI_eeprom_read_block)
    lui     $a1, %hi(SI_eeprom_read_output)
    lui     $v1, 0x02090702 >> 16
    ori     $v1, 0x02090702 & 0xFFFF
    sd      $s0, 0x0028($sp)
    addiu   $a1, %lo(SI_eeprom_read_output)
    daddu   $s0, $a0, $0
    addiu   $a0, $v0, %lo(SI_eeprom_read_block)
    sd      $ra, 0x0030($sp)
    jal     sysExecPIF
    sd      $v1, %lo(SI_eeprom_read_block)($v0)
    lui     $a0, %hi(SI_eeprom_read_output+8)
    addiu   $a1, $sp, 0x0020
    addiu   $a0, %lo(SI_eeprom_read_output+8)
    jal     os_80014768
    li      $a2, 0x0008
    lbu     $a1, 0x0022($sp)
    lbu     $a3, 0x0020($sp)
    lbu     $a2, 0x0021($sp)
    lbu     $a0, 0x0023($sp)
    lbu     $v1, 0x0024($sp)
    lbu     $v0, 0x0025($sp)
    lbu     $t0, 0x0026($sp)
    andi    $a1, $a1, 0x007F
    sb      $t0, 0x0006($s0)
    sb      $a3, 0x0000($s0)
    sb      $a2, 0x0001($s0)
    sb      $a1, 0x0002($s0)
    sb      $a0, 0x0003($s0)
    sb      $v1, 0x0004($s0)
    sb      $v0, 0x0005($s0)
    ld      $ra, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038

.globl bi_ram_to_sd
bi_ram_to_sd:
    addiu   $sp, $sp, -0x0078
    sd      $s4, 0x0048($sp)
    sd      $s2, 0x0038($sp)
    lui     $s4, 0xBF808200 >> 16
    andi    $s2, $a1, 0xFFFF
    sd      $s6, 0x0058($sp)
    sd      $s5, 0x0050($sp)
    sd      $s3, 0x0040($sp)
    sd      $s1, 0x0030($sp)
    sd      $s0, 0x0028($sp)
    sd      $ra, 0x0070($sp)
    sd      $s8, 0x0068($sp)
    sd      $s7, 0x0060($sp)
    daddu   $s1, $a0, $0
    ori     $s4, 0xBF808200 & 0xFFFF
    addiu   $s3, $sp, 0x0020
    li      $s5, 0x00FF
    li      $s0, 0x0400
    beqz    $s2, .L80001FA8
    li      $s6, 0xFFFF
.L80001EC8:
    daddu   $a1, $s3, $0
    jal     sdCrc16
    daddu   $a0, $s1, $0
    jal     bi_sd_bitlen
    li      $a0, 0x0002
    jal     bi_sd_dat_wr
    li      $a0, 0x00FF
    jal     bi_sd_dat_wr
    li      $a0, 0x00F0
    jal     bi_sd_bitlen
    li      $a0, 0x0004
    daddu   $a0, $s1, $0
    daddu   $a1, $s4, $0
    jal     sysPI_wr
    li      $a2, 0x0200
    daddu   $a1, $s4, $0
    li      $a2, 0x0008
    jal     sysPI_wr
    daddu   $a0, $s3, $0
    jal     bi_sd_bitlen
    li      $a0, 0x0001
    jal     bi_sd_dat_wr
    li      $a0, 0x00FF
    j       .L80001F38
    daddu   $s7, $0, $0
    nop
.L80001F30:
    beq     $s7, $s0, .L80001FDC
    addiu   $s7, $s7, 0x0001
.L80001F38:
    jal     bi_sd_dat_rd
    nop
    andi    $v0, $v0, 0x0001
    bnez    $v0, .L80001F30
    nop
    jal     bi_sd_dat_rd
    nop
    jal     bi_sd_dat_rd
    andi    $s8, $v0, 0x0001
    andi    $v0, $v0, 0x0001
    sll     $s7, $s8, 1
    jal     bi_sd_dat_rd
    or      $s7, $s7, $v0
    andi    $v0, $v0, 0x0001
    sll     $s7, $s7, 1
    or      $s7, $s7, $v0
    li      $v0, 0x0002
    bne     $s7, $v0, .L80002020
    xori    $s7, $s7, 0x0005
    daddu   $s7, $0, $0
.L80001F88:
    jal     bi_sd_dat_rd
    nop
    bne     $v0, $s5, .L80002010
    nop
    addiu   $s2, $s2, -0x0001
    andi    $s2, $s2, 0xFFFF
    bnez    $s2, .L80001EC8
    addiu   $s1, $s1, 0x0200
.L80001FA8:
    ld      $ra, 0x0070($sp)
    daddu   $v0, $0, $0
    ld      $s8, 0x0068($sp)
    ld      $s7, 0x0060($sp)
    ld      $s6, 0x0058($sp)
    ld      $s5, 0x0050($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0078
.L80001FDC:
    li      $v0, 0x00D6
.L80001FE0:
    ld      $ra, 0x0070($sp)
    ld      $s8, 0x0068($sp)
    ld      $s7, 0x0060($sp)
    ld      $s6, 0x0058($sp)
    ld      $s5, 0x0050($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0078
.L80002010:
    beq     $s7, $s6, .L80002030
    addiu   $s7, $s7, 0x0001
    j       .L80001F88
    nop
.L80002020:
    sltiu   $s7, $s7, 0x0001
    li      $v0, 0x00D8
    j       .L80001FE0
    subu    $v0, $v0, $s7
.L80002030:
    j       .L80001FE0
    li      $v0, 0x00D5

.globl bios_os_80002038
bios_os_80002038:
    addiu   $sp, $sp, -0x0030
    sd      $ra, 0x0028($sp)
    lui     $v0, %hi(_80078CF6)
    lbu     $v0, %lo(_80078CF6)($v0)
    bnez    $v0, .L80002060
    ld      $ra, 0x0028($sp)
    lui     $v0, %hi(_8007BDD6)
    lhu     $v0, %lo(_8007BDD6)($v0)
    jr      $ra
    addiu   $sp, $sp, 0x0030
.L80002060:
    jal     BiRTCRd
    addiu   $a0, $sp, 0x0020
    jal     SysBCDToDec
    lbu     $a0, 0x0022($sp)
    lbu     $a0, 0x0021($sp)
    jal     SysBCDToDec
    sb      $v0, 0x0022($sp)
    lbu     $a0, 0x0020($sp)
    jal     SysBCDToDec
    sb      $v0, 0x0021($sp)
    lbu     $a0, 0x0021($sp)
    lbu     $v1, 0x0022($sp)
    sll     $a0, $a0, 5
    sll     $v1, $v1, 11
    srl     $v0, $v0, 1
    or      $v1, $a0, $v1
    andi    $v0, $v0, 0x00FF
    ld      $ra, 0x0028($sp)
    or      $v0, $v1, $v0
    andi    $v0, $v0, 0xFFFF
    jr      $ra
    addiu   $sp, $sp, 0x0030

.globl bios_os_800020B8
bios_os_800020B8:
    addiu   $sp, $sp, -0x0030
    sd      $ra, 0x0028($sp)
    lui     $v0, %hi(_80078CF6)
    lbu     $v0, %lo(_80078CF6)($v0)
    bnez    $v0, .L800020E0
    ld      $ra, 0x0028($sp)
    lui     $v0, %hi(_8007BDD4)
    lhu     $v0, %lo(_8007BDD4)($v0)
    jr      $ra
    addiu   $sp, $sp, 0x0030
.L800020E0:
    jal     BiRTCRd
    addiu   $a0, $sp, 0x0020
    jal     SysBCDToDec
    lbu     $a0, 0x0023($sp)
    lbu     $a0, 0x0025($sp)
    jal     SysBCDToDec
    sb      $v0, 0x0023($sp)
    lbu     $a0, 0x0026($sp)
    jal     SysBCDToDec
    sb      $v0, 0x0025($sp)
    lbu     $a0, 0x0025($sp)
    lbu     $v1, 0x0023($sp)
    sll     $a0, $a0, 5
    addiu   $v0, $v0, 0x0014
    or      $v1, $a0, $v1
    sll     $v0, $v0, 9
    ld      $ra, 0x0028($sp)
    or      $v0, $v1, $v0
    andi    $v0, $v0, 0xFFFF
    jr      $ra
    addiu   $sp, $sp, 0x0030
    nop

.globl BiIOMWr
BiIOMWr:
    addiu   $sp, $sp, -0x0078
    sd      $s4, 0x0068($sp)
    lui     $s4, 0xA4600018 >> 16
    sd      $s1, 0x0050($sp)
    ori     $s4, 0xA4600018 & 0xFFFF
    daddu   $s1, $a0, $0
    li      $a0, 0x0010
    sd      $ra, 0x0070($sp)
    sd      $s3, 0x0060($sp)
    sd      $s2, 0x0058($sp)
    sd      $s0, 0x0048($sp)
    lw      $s2, 0x0000($s4)
    jal     bi_reg_rd
    daddu   $s0, $a1, $0
    daddu   $s3, $v0, $0
    li      $v0, 0x0014
    sw      $v0, 0x0000($s4)
    li      $a1, 0x0083
    jal     bi_reg_wr
    li      $a0, 0x801C
    jal     sleep
    li      $a0, 0x0005
    li      $a1, 0x0080
    jal     bi_reg_wr
    li      $a0, 0x801C
    jal     sleep
    li      $a0, 0x0005
    li      $a0, 0x801C
    jal     bi_reg_wr
    li      $a1, 0x0082
    jal     sleep
    li      $a0, 0x0005
    beqz    $s0, .L80002210
    lui     $s4, 0xBF808400 >> 16
    ori     $s4, 0xBF808400 & 0xFFFF
    sltiu   $v0, $s0, 0x0200
    daddu   $a0, $s1, $0
    daddu   $a1, $s4, $0
    bnez    $v0, .L800021FC
    li      $a2, 0x0200
.L800021D8:
    jal     sysPI_wr
    addiu   $s0, $s0, -0x0200
    beqz    $s0, .L80002210
    addiu   $s1, $s1, 0x0200
    sltiu   $v0, $s0, 0x0200
    daddu   $a0, $s1, $0
    daddu   $a1, $s4, $0
    beqz    $v0, .L800021D8
    li      $a2, 0x0200
.L800021FC:
    lui     $a1, 0xBF808400 >> 16
    daddu   $a0, $s1, $0
    ori     $a1, 0xBF808400 & 0xFFFF
    jal     sysPI_wr
    daddu   $a2, $s0, $0
.L80002210:
    lui     $a1, 0xBF808400 >> 16
    li      $v0, -0x0001
    li      $a2, 0x0020
    ori     $a1, 0xBF808400 & 0xFFFF
    addiu   $a0, $sp, 0x0020
    sd      $v0, 0x0038($sp)
    sd      $v0, 0x0020($sp)
    sd      $v0, 0x0028($sp)
    jal     sysPI_wr
    sd      $v0, 0x0030($sp)
    li      $a1, 0x0003
    jal     bi_reg_wr
    li      $a0, 0x801C
    lui     $v0, 0xA4600018 >> 16
    ori     $v0, 0xA4600018 & 0xFFFF
    li      $a0, 0x0005
    sw      $s2, 0x0000($v0)
    jal     sleep
    nop
    jal     bi_reg_rd
    li      $a0, 0x801C
    andi    $v1, $v0, 0x0001
    bnez    $v1, .L80002274
    daddu   $v0, $0, $0
    li      $v0, 0x00B3
.L80002274:
    andi    $a1, $s3, 0xFFFF
    li      $a0, 0x0010
    jal     bi_reg_wr
    sd      $v0, 0x0040($sp)
    ld      $ra, 0x0070($sp)
    ld      $v0, 0x0040($sp)
    ld      $s4, 0x0068($sp)
    ld      $s3, 0x0060($sp)
    ld      $s2, 0x0058($sp)
    ld      $s1, 0x0050($sp)
    ld      $s0, 0x0048($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0078

.globl BiMCNWr
BiMCNWr:
    lui     $v0, 0xA4600018 >> 16
    addiu   $sp, $sp, -0x0158
    ori     $v0, 0xA4600018 & 0xFFFF
    li      $v1, 0x0014
    sd      $s4, 0x0148($sp)
    sd      $s1, 0x0130($sp)
    lw      $s4, 0x0000($v0)
    sd      $s0, 0x0128($sp)
    sw      $v1, 0x0000($v0)
    daddu   $s0, $a1, $0
    daddu   $s1, $a0, $0
    daddu   $a1, $0, $0
    daddu   $a0, $0, $0
    sd      $ra, 0x0150($sp)
    sd      $s3, 0x0140($sp)
    jal     bi_reg_wr
    sd      $s2, 0x0138($sp)
    jal     sleep
    li      $a0, 0x0005
    daddu   $a0, $0, $0
    jal     bi_reg_wr
    li      $a1, 0x0001
    jal     sleep
    li      $a0, 0x0005
    beqz    $s0, .L80002360
    lui     $s2, 0xBF800200 >> 16
    ori     $s2, 0xBF800200 & 0xFFFF
    sltiu   $v0, $s0, 0x0200
    daddu   $a0, $s1, $0
    daddu   $a1, $s2, $0
    bnez    $v0, .L8000234C
    li      $a2, 0x0200
.L80002328:
    jal     sysPI_wr
    addiu   $s0, $s0, -0x0200
    beqz    $s0, .L80002360
    addiu   $s1, $s1, 0x0200
    sltiu   $v0, $s0, 0x0200
    daddu   $a0, $s1, $0
    daddu   $a1, $s2, $0
    beqz    $v0, .L80002328
    li      $a2, 0x0200
.L8000234C:
    lui     $a1, 0xBF800200 >> 16
    daddu   $a0, $s1, $0
    ori     $a1, 0xBF800200 & 0xFFFF
    jal     sysPI_wr
    daddu   $a2, $s0, $0
.L80002360:
    addiu   $s1, $sp, 0x0020
    daddu   $a0, $s1, $0
    li      $a1, 0x00FF
    li      $a2, 0x0100
    jal     memset
    lui     $s2, 0xBF800200 >> 16
    ori     $s2, 0xBF800200 & 0xFFFF
    daddu   $s0, $0, $0
    li      $s3, 0x0800
    nop
.L80002388:
    jal     bi_reg_rd
    daddu   $a0, $0, $0
    andi    $v0, $v0, 0x0001
    addiu   $s0, $s0, 0x0001
    daddu   $a0, $s1, $0
    daddu   $a1, $s2, $0
    beqz    $v0, .L800023E8
    li      $a2, 0x0100
    daddu   $v0, $0, $0
    lui     $v1, 0xA4600018 >> 16
.L800023B0:
    ori     $v1, 0xA4600018 & 0xFFFF
    sw      $s4, 0x0000($v1)
    li      $a0, 0x0005
    jal     sleep
    sd      $v0, 0x0120($sp)
    ld      $ra, 0x0150($sp)
    ld      $v0, 0x0120($sp)
    ld      $s4, 0x0148($sp)
    ld      $s3, 0x0140($sp)
    ld      $s2, 0x0138($sp)
    ld      $s1, 0x0130($sp)
    ld      $s0, 0x0128($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0158
.L800023E8:
    jal     sysPI_wr
    nop
    bne     $s0, $s3, .L80002388
    li      $v0, 0x00B3
    j       .L800023B0
    li      $v1, 0xA4600000

.globl os_80002400
os_80002400:
    andi    $a2, $a2, 0x00FF
    beqz    $a2, .L80002448
    andi    $a1, $a1, 0x00FF
    daddu   $v0, $0, $0
    j       .L80002428
    daddu   $t0, $0, $0
.L80002418:
    bnezl   $t0, .L8000243C
    sb      $a1, 0x0000($a0)
    beqz    $v1, .L80002448
    addiu   $a0, $a0, 0x0001
.L80002428:
    lbu     $a3, 0x0000($a0)
    addiu   $v0, $v0, 0x0001
    bnez    $a3, .L80002418
    slt     $v1, $v0, $a2
    sb      $a1, 0x0000($a0)
.L8000243C:
    li      $t0, 0x0001
    bnez    $v1, .L80002428
    addiu   $a0, $a0, 0x0001
.L80002448:
    jr      $ra
    nop

.globl os_80002450
os_80002450:
    daddu   $v0, $0, $0
    li      $a1, 0x0008
    li      $a3, 0x000D
    j       .L80002484
    li      $a2, 0x000E
    nop
.L80002468:
    beq     $v0, $a3, .L8000249C
    nop
    beqz    $v1, .L800024A4
    nop
    addiu   $v0, $v0, 0x0001
.L8000247C:
    beq     $v0, $a2, .L800024B0
    nop
.L80002484:
    addu    $v1, $a0, $v0
    lbu     $v1, 0x0000($v1)
    addiu   $v1, $v1, -0x0030
    andi    $v1, $v1, 0x00FF
    bne     $v0, $a1, .L80002468
    sltiu   $v1, $v1, 0x0017
.L8000249C:
    beqzl   $v1, .L8000247C
    addiu   $v0, $v0, 0x0001
.L800024A4:
    jr      $ra
    daddu   $v0, $0, $0
    nop
.L800024B0:
    jr      $ra
    li      $v0, 0x0001

.globl os_800024B8
os_800024B8:
    lw      $a2, 0x0000($a1)
    daddu   $v1, $a0, $0
    daddu   $v0, $0, $0
    li      $t2, 0x0008
.L800024C8:
    lbu     $a3, 0x0000($v1)
    sll     $a2, $a2, 4
    sltiu   $t1, $a3, 0x0041
    addiu   $v0, $v0, 0x0001
    addiu   $v1, $v1, 0x0001
    bnez    $t1, .L800024E8
    li      $t0, 0x0030
    li      $t0, 0x0037
.L800024E8:
    subu    $a3, $a3, $t0
    andi    $a3, $a3, 0x00FF
    or      $a2, $a3, $a2
    bne     $v0, $t2, .L800024C8
    sw      $a2, 0x0000($a1)
    lbu     $v0, 0x0008($a0)
    addiu   $v1, $a0, 0x0009
    xori    $v0, $v0, 0x0021
    sltu    $v0, $0, $v0
    lhu     $a2, 0x0004($a1)
    sh      $v0, 0x0006($a1)
    addiu   $a0, $a0, 0x000D
    daddu   $v0, $v1, $0
.L8000251C:
    lbu     $a3, 0x0000($v0)
    sll     $a2, $a2, 4
    andi    $t1, $a2, 0xFFFF
    sltiu   $a2, $a3, 0x0041
    addiu   $v0, $v0, 0x0001
    bnez    $a2, .L8000253C
    li      $t0, 0x0030
    li      $t0, 0x0037
.L8000253C:
    subu    $a2, $a3, $t0
    andi    $a2, $a2, 0x00FF
    or      $a2, $a2, $t1
    bne     $v0, $a0, .L8000251C
    sh      $a2, 0x0004($a1)
    sb      $0, 0x0008($a1)
    lbu     $v0, 0x0004($v1)
    li      $a0, 0x0020
    bne     $v0, $a0, .L80002574
    addiu   $v1, $v1, 0x0004
    addiu   $v1, $v1, 0x0001
.L80002568:
    lbu     $v0, 0x0000($v1)
    beql    $v0, $a0, .L80002568
    addiu   $v1, $v1, 0x0001
.L80002574:
    beqz    $v0, .L800025E8
    li      $a0, 0x000D
    beq     $v0, $a0, .L800025E8
    li      $a0, 0x000A
    beq     $v0, $a0, .L800025E8
    addiu   $a1, $a1, 0x0008
    daddu   $a0, $0, $0
    li      $a3, 0x000D
    li      $t0, 0x000A
    j       .L800025A4
    li      $t1, 0x0024
.L800025A0:
    daddu   $a1, $a2, $0
.L800025A4:
    sb      $v0, 0x0000($a1)
    addiu   $v1, $v1, 0x0001
    lbu     $v0, 0x0000($v1)
    addiu   $a0, $a0, 0x0001
    beqz    $v0, .L800025E8
    andi    $a0, $a0, 0x00FF
    beq     $v0, $a3, .L800025E8
    nop
    beq     $v0, $t0, .L800025E8
    nop
    bne     $a0, $t1, .L800025A0
    addiu   $a2, $a1, 0x0001
    li      $v0, 0x002E
    sb      $v0, 0x0000($a1)
    sb      $v0, -0x0002($a1)
    jr      $ra
    sb      $v0, -0x0001($a1)
.L800025E8:
    jr      $ra
    nop

.globl os_800025F0
os_800025F0:
    lbu     $v0, 0x0000($a0)
    xori    $v0, $v0, 0x0080
    sltiu   $v1, $v0, 0x0080
    beqz    $v1, .L80002620
    lui     $v1, %hi(_8004C7D8)
    sll     $v0, $v0, 2
    addiu   $v1, %lo(_8004C7D8)
    addu    $v0, $v1, $v0
    lw      $v0, 0x0000($v0)
    jr      $v0
    nop
    nop
.L80002620:
    jr      $ra
    daddu   $v0, $0, $0
    jr      $ra
    li      $v0, 0x0001

.globl os_80002630
os_80002630:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0028($sp)
    beqz    $a0, .L80002650
    daddu   $s0, $a0, $0
    lbu     $v0, 0x0000($a0)
    bnez    $v0, .L80002658
    nop
.L80002650:
    lui     $s0, %hi(__str_8004EA40)
    addiu   $s0, %lo(__str_8004EA40)
.L80002658:
    jal     os_80012B60
    li      $a0, 0x1400
    daddu   $a0, $s0, $0
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    daddu   $a1, $0, $0
    j       os_80013758
    addiu   $sp, $sp, 0x0030

.globl os_80002678
os_80002678:
    addiu   $sp, $sp, -0x0038
    sd      $ra, 0x0030($sp)
    sd      $s0, 0x0028($sp)
    jal     os_80014F68
    daddu   $s0, $a0, $0
    li      $a0, 0x1400
    jal     os_80012B60
    sd      $v0, 0x0020($sp)
    lui     $a0, %hi(__str_80051050)
    jal     os_80013930
    addiu   $a0, %lo(__str_80051050)
    lui     $a0, %hi(__str_8004EA58)
    jal     os_80013300
    addiu   $a0, %lo(__str_8004EA58)
    ld      $v0, 0x0020($sp)
    sltiu   $v0, $v0, 0x0025
    bnez    $v0, .L800026E0
    daddu   $a0, $s0, $0
    jal     os_80012E88
    li      $a1, 0x0021
    lui     $a0, %hi(__str_8004EA78)
    ld      $ra, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    addiu   $a0, %lo(__str_8004EA78)
    j       os_80012B70
    addiu   $sp, $sp, 0x0038
.L800026E0:
    ld      $ra, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    j       os_80013300
    addiu   $sp, $sp, 0x0038

.globl os_800026F0
os_800026F0:
    addiu   $sp, $sp, -0x0058
    sd      $s5, 0x0048($sp)
    sd      $s4, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s0, 0x0020($sp)
    lui     $s4, %hi(__str_8004EA80)
    daddu   $s0, $a0, $0
    lui     $s5, %hi(__str_8004ED30)
    daddu   $a0, $a1, $0
    lui     $s3, %hi(__str_8004F258)
    sd      $s2, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0050($sp)
    jal     os_800150C8
    addiu   $s4, %lo(__str_8004EA80)
    addiu   $s5, %lo(__str_8004ED30)
    addiu   $s3, %lo(__str_8004F258)
    daddu   $s1, $0, $0
    j       .L80002750
    li      $s2, 0x0022
.L80002740:
    jal     os_800150F8
    daddu   $a0, $s4, $0
    beq     $s1, $s2, .L800027A8
    addiu   $s0, $s0, 0x0030
.L80002750:
    lw      $a0, 0x0000($s0)
    jal     os_80015280
    addiu   $s1, $s1, 0x0001
    lhu     $v0, 0x0006($s0)
    beqz    $v0, .L8000276C
    daddu   $a0, $s3, $0
    daddu   $a0, $s5, $0
.L8000276C:
    jal     os_800150F8
    nop
    jal     os_80015250
    lhu     $a0, 0x0004($s0)
    lbu     $v0, 0x0008($s0)
    beqz    $v0, .L80002740
    nop
    jal     os_800150F8
    daddu   $a0, $s5, $0
    jal     os_800150F8
    addiu   $a0, $s0, 0x0008
    jal     os_800150F8
    daddu   $a0, $s4, $0
    bne     $s1, $s2, .L80002750
    addiu   $s0, $s0, 0x0030
.L800027A8:
    ld      $ra, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
    nop

.globl os_800027D0
os_800027D0:
    addiu   $sp, $sp, -0x0858
    sd      $s0, 0x0820($sp)
    daddu   $a1, $0, $0
    li      $a2, 0x0660
    addiu   $s0, $sp, 0x0020
    sd      $ra, 0x0850($sp)
    sd      $s1, 0x0828($sp)
    sd      $s5, 0x0848($sp)
    daddu   $s1, $a0, $0
    sd      $s4, 0x0840($sp)
    sd      $s3, 0x0838($sp)
    jal     os_80014778
    sd      $s2, 0x0830($sp)
    daddu   $a1, $0, $0
    daddu   $a0, $s0, $0
    jal     os_80014778
    li      $a2, 0x0800
    jal     fat_os_8000F7A0
    nop
    andi    $a1, $v0, 0x00FF
    sltiu   $v0, $a1, 0x0005
    beqzl   $v0, .L8000282C
    li      $a1, 0x0004
.L8000282C:
    jal     fat_os_80010840
    daddu   $a0, $s0, $0
    beqz    $v0, .L80002868
    daddu   $s4, $v0, $0
.L8000283C:
    ld      $ra, 0x0850($sp)
    daddu   $v0, $s4, $0
    ld      $s5, 0x0848($sp)
    ld      $s4, 0x0840($sp)
    ld      $s3, 0x0838($sp)
    ld      $s2, 0x0830($sp)
    ld      $s1, 0x0828($sp)
    ld      $s0, 0x0820($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0858
    nop
.L80002868:
    daddu   $a0, $s0, $0
    jal     os_800153E8
    li      $a1, 0x0800
    daddu   $s2, $0, $0
    daddu   $s5, $0, $0
    j       .L800028A0
    daddu   $s3, $0, $0
    nop
.L80002888:
    addiu   $s2, $s2, 0x0001
.L8000288C:
    sltiu   $v0, $s3, 0x0022
    beqz    $v0, .L8000283C
    sltiu   $v1, $s2, 0x07F4
    beqz    $v1, .L8000283C
    daddu   $s5, $s2, $0
.L800028A0:
    addu    $s5, $s0, $s5
    jal     os_80002450
    daddu   $a0, $s5, $0
    beqzl   $v0, .L8000288C
    addiu   $s2, $s2, 0x0001
    sll     $v0, $s3, 4
    sll     $a1, $s3, 6
    subu    $a1, $a1, $v0
    addiu   $s3, $s3, 0x0001
    daddu   $a0, $s5, $0
    addu    $a1, $s1, $a1
    jal     os_800024B8
    andi    $s3, $s3, 0x00FF
    j       .L80002888
    addiu   $s2, $s2, 0x000D
    nop

.globl os_800028E0
os_800028E0:
    addiu   $sp, $sp, -0x0030
    daddu   $v0, $a0, $0
    lui     $a2, %hi(__str_8004EA98)
    lui     $a0, %hi(__str_8004EA88)
    sd      $s0, 0x0020($sp)
    addiu   $a0, %lo(__str_8004EA88)
    daddu   $s0, $a1, $0
    addiu   $a2, %lo(__str_8004EA98)
    daddu   $a1, $v0, $0
    sd      $ra, 0x0028($sp)
    jal     fat_os_80011B80
    daddu   $a3, $0, $0
    li      $v1, 0x00F0
    beq     $v0, $v1, .L80002948
    daddu   $a0, $s0, $0
    beqz    $v0, .L80002938
    ld      $ra, 0x0028($sp)
.L80002924:
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
    nop
.L80002938:
    ld      $s0, 0x0020($sp)
    j       os_800027D0
    addiu   $sp, $sp, 0x0030
    nop
.L80002948:
    daddu   $a1, $0, $0
    jal     os_80014778
    li      $a2, 0x0660
    j       .L80002924
    daddu   $v0, $0, $0
    nop

.globl os_80002960
os_80002960:
    addiu   $sp, $sp, -0x0840
    sd      $s2, 0x0830($sp)
    daddu   $s2, $a0, $0
    lui     $a0, %hi(_80051B20)
    sd      $s1, 0x0828($sp)
    addiu   $a0, %lo(_80051B20)
    daddu   $s1, $a1, $0
    daddu   $a1, $0, $0
    sd      $ra, 0x0838($sp)
    jal     os_80013B50
    sd      $s0, 0x0820($sp)
    bnez    $v0, .L800029B0
    addiu   $s0, $sp, 0x0020
    ld      $ra, 0x0838($sp)
.L80002998:
    ld      $s2, 0x0830($sp)
    ld      $s1, 0x0828($sp)
    ld      $s0, 0x0820($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0840
    nop
.L800029B0:
    li      $a2, 0x0800
    daddu   $a0, $s0, $0
    jal     os_80014778
    daddu   $a1, $0, $0
    daddu   $a0, $s2, $0
    jal     os_800026F0
    daddu   $a1, $s0, $0
    lui     $a0, %hi(__str_8004EA88)
    lui     $a2, %hi(__str_8004EA98)
    addiu   $a0, %lo(__str_8004EA88)
    daddu   $a1, $s1, $0
    addiu   $a2, %lo(__str_8004EA98)
    jal     fat_os_80011B80
    li      $a3, 0x0004
    bnez    $v0, .L80002998
    ld      $ra, 0x0838($sp)
    daddu   $a0, $s0, $0
    jal     fat_os_80010970
    li      $a1, 0x0004
    ld      $ra, 0x0838($sp)
    ld      $s2, 0x0830($sp)
    ld      $s1, 0x0828($sp)
    ld      $s0, 0x0820($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0840
    nop

.globl os_80002A18
os_80002A18:
    addiu   $sp, $sp, -0x0088
    sd      $s7, 0x0070($sp)
    sd      $s5, 0x0060($sp)
    lui     $s7, %hi(__str_8004ED30)
    lui     $s5, %hi(__str_80050510)
    sd      $s8, 0x0078($sp)
    sd      $s4, 0x0058($sp)
    sd      $s3, 0x0050($sp)
    sd      $s2, 0x0048($sp)
    sd      $s1, 0x0040($sp)
    sd      $s0, 0x0038($sp)
    sd      $ra, 0x0080($sp)
    sd      $s6, 0x0068($sp)
    daddu   $s3, $a0, $0
    addiu   $s7, %lo(__str_8004ED30)
    addiu   $s5, %lo(__str_80050510)
    sw      $0, 0x0028($sp)
    sw      $0, 0x0024($sp)
    daddu   $s1, $0, $0
    li      $s2, 0x0008
    li      $s4, 0x000C
    li      $s0, 0x0010
    li      $s8, 0x0100
    nop
.L80002A78:
    jal     os_80012B60
    li      $a0, 0x2000
    lui     $a0, %hi(__str_8004EAA0)
    li      $a1, 0x000F
    li      $a2, 0x000B
    jal     os_800139C0
    addiu   $a0, %lo(__str_8004EAA0)
    lui     $a0, %hi(__str_80051050)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80051050)
    jal     os_80012B60
    li      $a0, 0x3000
    jal     os_80012F18
    daddu   $a0, $s7, $0
    li      $v1, 0x001C
    sw      $v1, 0x0020($sp)
    j       .L80002B1C
    daddu   $s6, $0, $0
.L80002AC0:
    lw      $a0, 0x0020($sp)
    srlv    $v0, $v0, $a0
    andi    $v0, $v0, 0x000F
.L80002ACC:
    lw      $v1, 0x0020($sp)
    li      $a0, 0x1700
    addiu   $v1, $v1, -0x0004
    beq     $s1, $s6, .L80002AE4
    sw      $v1, 0x0020($sp)
    li      $a0, 0x3400
.L80002AE4:
    jal     os_80012B60
    sd      $v0, 0x0030($sp)
    ld      $v0, 0x0030($sp)
    addiu   $s6, $s6, 0x0001
    sltiu   $v1, $v0, 0x000A
    bnez    $v1, .L80002B04
    addiu   $a0, $v0, 0x0030
    addiu   $a0, $v0, 0x0037
.L80002B04:
    jal     os_80012C10
    nop
    jal     os_80012B60
    li      $a0, 0x1000
    beql    $s6, $s4, .L80002BAC
    daddu   $s6, $0, $0
.L80002B1C:
    beq     $s6, $s2, .L80002B48
    slti    $v0, $s6, 0x0008
    bnezl   $v0, .L80002AC0
    lw      $v0, 0x0000($s3)
    lw      $a0, 0x0020($sp)
    lhu     $v1, 0x0004($s3)
    addiu   $v0, $a0, 0x0010
    srav    $v0, $v1, $v0
    j       .L80002ACC
    andi    $v0, $v0, 0x000F
    nop
.L80002B48:
    jal     os_80012B70
    daddu   $a0, $s7, $0
    lw      $a0, 0x0020($sp)
    lhu     $v1, 0x0004($s3)
    addiu   $v0, $a0, 0x0010
    srav    $v0, $v1, $v0
    j       .L80002ACC
    andi    $v0, $v0, 0x000F
.L80002B68:
    beq     $v0, $s6, .L80002B74
    li      $a0, 0x1700
    li      $a0, 0x3400
.L80002B74:
    jal     os_80012B60
    nop
    slti    $v0, $s6, 0x000A
    beqz    $v0, .L80002B8C
    addiu   $a0, $s6, 0x0037
    addiu   $a0, $s6, 0x0030
.L80002B8C:
    jal     os_80012C10
    addiu   $s6, $s6, 0x0001
    jal     os_80012B60
    li      $a0, 0x1000
    jal     os_80012C10
    li      $a0, 0x0020
    beq     $s6, $s0, .L80002BD0
    nop
.L80002BAC:
    andi    $v0, $s6, 0x0003
    bnezl   $v0, .L80002B68
    lw      $v0, 0x0024($sp)
    jal     os_80012F18
    daddu   $a0, $s5, $0
    jal     os_80012F18
    daddu   $a0, $s5, $0
    j       .L80002B68
    lw      $v0, 0x0024($sp)
.L80002BD0:
    jal     sysRepaint
    nop
    jal     sys_os_80016148
    nop
    daddu   $s6, $v0, $0
    beq     $v0, $s0, .L80002CAC
    li      $a1, -0x0001
    li      $v0, 0x0020
    beq     $s6, $v0, .L80002CA8
    li      $v1, 0x0800
    beq     $s6, $v1, .L80002C7C
    lw      $a0, 0x0024($sp)
.L80002C00:
    beql    $s6, $s2, .L80002C78
    li      $a1, 0x0001
    beq     $s6, $s8, .L80002C94
    nop
.L80002C10:
    li      $a0, 0x0200
    beq     $s6, $a0, .L80002D28
    li      $v0, 0x0001
    bne     $s6, $v0, .L80002CD0
    sltiu   $v0, $s1, 0x0008
    beqz    $v0, .L80002D40
    li      $v0, 0x000B
    li      $v1, 0x0007
    subu    $v0, $v1, $s1
    sll     $v0, $v0, 2
    li      $v1, 0x000F
    lw      $a0, 0x0000($s3)
    sllv    $v1, $v1, $v0
    nor     $v1, $0, $v1
    and     $v1, $v1, $a0
    lw      $a0, 0x0024($sp)
    sllv    $v0, $a0, $v0
    or      $v0, $v0, $v1
    sw      $v0, 0x0000($s3)
.L80002C5C:
    addiu   $s1, $s1, 0x0001
    andi    $s1, $s1, 0x00FF
    beq     $s1, $s4, .L80002CF8
    li      $v0, 0x0001
    j       .L80002A78
    sw      $v0, 0x0028($sp)
    nop
.L80002C78:
    lw      $a0, 0x0024($sp)
.L80002C7C:
    li      $a2, 0x0004
    jal     sys_800068B0
    li      $a3, 0x0004
    andi    $v0, $v0, 0x00FF
    bne     $s6, $s8, .L80002C10
    sw      $v0, 0x0024($sp)
.L80002C94:
    beqzl   $s1, .L80002A78
    li      $s1, 0x000B
    addiu   $s1, $s1, -0x0001
    j       .L80002A78
    andi    $s1, $s1, 0x00FF
.L80002CA8:
    li      $a1, 0x0001
.L80002CAC:
    lw      $a0, 0x0024($sp)
    jal     sys_80006928
    li      $a2, 0x0004
    andi    $v0, $v0, 0x00FF
    li      $v1, 0x0800
    bne     $s6, $v1, .L80002C00
    sw      $v0, 0x0024($sp)
    j       .L80002C78
    li      $a1, -0x0001
.L80002CD0:
    li      $v0, 0x0002
    bne     $s6, $v0, .L80002A78
    lw      $v1, 0x0028($sp)
    beqz    $v1, .L80002CFC
    ld      $ra, 0x0080($sp)
    jal     os_800025F0
    daddu   $a0, $s3, $0
    beqz    $v0, .L80002CF8
    li      $v0, 0x0001
    sh      $v0, 0x0006($s3)
.L80002CF8:
    ld      $ra, 0x0080($sp)
.L80002CFC:
    ld      $s8, 0x0078($sp)
    ld      $s7, 0x0070($sp)
    ld      $s6, 0x0068($sp)
    ld      $s5, 0x0060($sp)
    ld      $s4, 0x0058($sp)
    ld      $s3, 0x0050($sp)
    ld      $s2, 0x0048($sp)
    ld      $s1, 0x0040($sp)
    ld      $s0, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0088
.L80002D28:
    li      $v0, 0x000B
    beql    $s1, $v0, .L80002A78
    daddu   $s1, $0, $0
    addiu   $s1, $s1, 0x0001
    j       .L80002A78
    andi    $s1, $s1, 0x00FF
.L80002D40:
    subu    $v0, $v0, $s1
    sll     $v0, $v0, 2
    li      $v1, 0x000F
    lhu     $a0, 0x0004($s3)
    sllv    $v1, $v1, $v0
    nor     $v1, $0, $v1
    and     $v1, $v1, $a0
    lw      $a0, 0x0024($sp)
    sllv    $v0, $a0, $v0
    or      $v0, $v0, $v1
    j       .L80002C5C
    sh      $v0, 0x0004($s3)

.globl os_80002D70
os_80002D70:
    addiu   $sp, $sp, -0x0078
    sd      $s6, 0x0058($sp)
    sd      $s3, 0x0040($sp)
    sd      $ra, 0x0070($sp)
    sd      $s8, 0x0068($sp)
    sd      $s7, 0x0060($sp)
    sd      $s5, 0x0050($sp)
    sd      $s4, 0x0048($sp)
    sd      $s2, 0x0038($sp)
    sd      $s1, 0x0030($sp)
    sd      $s0, 0x0028($sp)
    daddu   $s3, $a0, $0
    daddu   $s6, $a0, $0
    daddu   $v0, $a0, $0
    daddu   $a2, $0, $0
    daddu   $v1, $0, $0
    li      $a3, 0x0020
    j       .L80002DD0
    li      $a1, 0x0024
    nop
.L80002DC0:
    bnezl   $a2, .L80002DE0
    sb      $a3, 0x0008($v0)
    beq     $v1, $a1, .L80002DEC
    addiu   $v0, $v0, 0x0001
.L80002DD0:
    lbu     $a0, 0x0008($v0)
    bnez    $a0, .L80002DC0
    addiu   $v1, $v1, 0x0001
    sb      $a3, 0x0008($v0)
.L80002DE0:
    li      $a2, 0x0001
    bne     $v1, $a1, .L80002DD0
    addiu   $v0, $v0, 0x0001
.L80002DEC:
    lui     $s5, %hi(__str_80051050)
    lui     $s0, %hi(_8004C9D8)
    sb      $0, 0x002C($s3)
    addiu   $s5, %lo(__str_80051050)
    addiu   $s0, %lo(_8004C9D8)
    sw      $0, 0x0020($sp)
    daddu   $s2, $0, $0
    li      $s4, 0x0024
    li      $s1, 0x0028
    li      $s8, 0x0001
    nop
.L80002E18:
    jal     os_80012B60
    li      $a0, 0x2000
    daddu   $a0, $0, $0
    li      $a1, 0x0024
    jal     os_800139C0
    li      $a2, 0x000B
    daddu   $s7, $0, $0
    nop
.L80002E38:
    beq     $s7, $s2, .L80002E44
    li      $a0, 0x1700
    li      $a0, 0x3400
.L80002E44:
    jal     os_80012B60
    nop
    addu    $v0, $s3, $s7
    lbu     $a0, 0x0008($v0)
    jal     os_80012C10
    addiu   $s7, $s7, 0x0001
    bne     $s7, $s4, .L80002E38
    nop
    jal     os_80012B60
    li      $a0, 0x2000
    jal     os_80012F18
    daddu   $a0, $s5, $0
    lui     $a0, %hi(__str_8004EAB0)
    jal     os_80013300
    addiu   $a0, %lo(__str_8004EAB0)
    jal     os_80012D90
    li      $a0, 0x000A
    j       .L80002ECC
    daddu   $s7, $0, $0
.L80002E90:
    beq     $v0, $s7, .L80002E9C
    li      $a0, 0x1700
    li      $a0, 0x3400
.L80002E9C:
    jal     os_80012B60
    nop
    addu    $v0, $s0, $s7
    lbu     $a0, 0x0000($v0)
    jal     os_80012C10
    addiu   $s7, $s7, 0x0001
    jal     os_80012B60
    li      $a0, 0x1000
    jal     os_80012C10
    li      $a0, 0x0020
    beq     $s7, $s1, .L80002F40
    nop
.L80002ECC:
    daddu   $v0, $s7, $0
    dsll    $a0, $v0, 3
    dsll    $v1, $v0, 1
    dsubu   $v1, $a0, $v1
    dsll    $a0, $v1, 4
    daddu   $v1, $v1, $a0
    dsll    $a0, $v1, 8
    daddu   $v1, $v1, $a0
    dsll    $a0, $v1, 16
    daddu   $v1, $v1, $a0
    daddu   $v0, $v1, $v0
    dsra32  $v0, $v0, 0
    sra     $v0, $v0, 2
    sra     $a0, $s7, 31
    subu    $v0, $v0, $a0
    sll     $v1, $v0, 3
    sll     $v0, $v0, 1
    addu    $v0, $v0, $v1
    bnel    $s7, $v0, .L80002E90
    lw      $v0, 0x0020($sp)
    jal     os_80012B60
    li      $a0, 0x1000
    jal     os_80012F18
    daddu   $a0, $s5, $0
    jal     os_80012F18
    daddu   $a0, $s5, $0
    j       .L80002E90
    lw      $v0, 0x0020($sp)
    nop
.L80002F40:
    jal     sysRepaint
    nop
    jal     sys_os_80016148
    nop
    li      $v1, 0x0200
    beq     $v0, $v1, .L80003078
    daddu   $s7, $v0, $0
    li      $v1, 0x0100
    beq     $v0, $v1, .L8000302C
    li      $v0, 0x0010
    bne     $s7, $v0, .L80003098
    li      $a1, -0x0001
    lw      $a0, 0x0020($sp)
.L80002F74:
    jal     sys_80006928
    li      $a2, 0x000A
    andi    $v0, $v0, 0x00FF
    sw      $v0, 0x0020($sp)
.L80002F84:
    li      $v1, 0x0800
    bne     $s7, $v1, .L8000303C
    li      $a1, -0x0001
.L80002F90:
    lw      $a0, 0x0020($sp)
.L80002F94:
    li      $a2, 0x000A
    jal     sys_800068B0
    li      $a3, 0x0004
    andi    $v0, $v0, 0x00FF
    sw      $v0, 0x0020($sp)
.L80002FA8:
    beq     $s7, $s8, .L80003050
    li      $v0, 0x0002
    bne     $s7, $v0, .L80002E18
    nop
    jal     os_800154C0
    addiu   $a0, $s3, 0x0008
    daddu   $a1, $0, $0
    daddu   $v0, $0, $0
    j       .L80002FE0
    li      $a0, 0x0024
.L80002FD0:
    bnezl   $a1, .L80002FF0
    sb      $0, 0x0008($s6)
    beq     $v0, $a0, .L80002FFC
    addiu   $s6, $s6, 0x0001
.L80002FE0:
    lbu     $v1, 0x0008($s6)
    bnez    $v1, .L80002FD0
    addiu   $v0, $v0, 0x0001
    sb      $0, 0x0008($s6)
.L80002FF0:
    li      $a1, 0x0001
    bne     $v0, $a0, .L80002FE0
    addiu   $s6, $s6, 0x0001
.L80002FFC:
    ld      $ra, 0x0070($sp)
    ld      $s8, 0x0068($sp)
    ld      $s7, 0x0060($sp)
    ld      $s6, 0x0058($sp)
    ld      $s5, 0x0050($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0078
.L8000302C:
    beqz    $s2, .L800030AC
    li      $v0, 0x0008
    addiu   $s2, $s2, -0x0001
    andi    $s2, $s2, 0x00FF
.L8000303C:
    li      $v0, 0x0008
    bne     $s7, $v0, .L80002FA8
    li      $a1, 0x0001
    j       .L80002F94
    lw      $a0, 0x0020($sp)
.L80003050:
    lw      $v1, 0x0020($sp)
    addu    $v0, $s0, $v1
    lbu     $a0, 0x0000($v0)
    addu    $v1, $s3, $s2
    sltiu   $v0, $s2, 0x0023
    beqz    $v0, .L80002E18
    sb      $a0, 0x0008($v1)
    addiu   $s2, $s2, 0x0001
    j       .L80002E18
    andi    $s2, $s2, 0x00FF
.L80003078:
    li      $v0, 0x0023
    beq     $s2, $v0, .L800030BC
    addiu   $s2, $s2, 0x0001
    li      $v0, 0x0008
    bne     $s7, $v0, .L80002FA8
    andi    $s2, $s2, 0x00FF
    j       .L80002F90
    li      $a1, 0x0001
.L80003098:
    li      $v0, 0x0020
    bne     $s7, $v0, .L80002F84
    li      $a1, 0x0001
    j       .L80002F74
    lw      $a0, 0x0020($sp)
.L800030AC:
    bne     $s7, $v0, .L80002FA8
    li      $s2, 0x0023
    j       .L80002F90
    li      $a1, 0x0001
.L800030BC:
    li      $v0, 0x0008
    bne     $s7, $v0, .L80002FA8
    daddu   $s2, $0, $0
    j       .L80002F90
    li      $a1, 0x0001

.globl os_800030D0
os_800030D0:
    lhu     $v0, 0x0006($a0)
    addiu   $sp, $sp, -0x0058
    sd      $s0, 0x0038($sp)
    sd      $ra, 0x0050($sp)
    sd      $s2, 0x0048($sp)
    sd      $s1, 0x0040($sp)
    beqz    $v0, .L80003180
    daddu   $s0, $a0, $0
    lui     $v0, %hi(__str_8004EAC8)
    addiu   $v0, %lo(__str_8004EAC8)
.L800030F8:
    lui     $s1, %hi(_80051B28)
    addiu   $s2, $sp, 0x0020
    addiu   $s1, %lo(_80051B28)
    daddu   $a0, $s2, $0
    daddu   $a1, $0, $0
    li      $a2, 0x0018
    jal     os_80014778
    sw      $v0, 0x000C($s1)
    lui     $v0, %hi(__str_8004EAE0)
    addiu   $v0, %lo(__str_8004EAE0)
    sw      $v0, 0x0020($sp)
    li      $v0, 0x0001
    sb      $v0, 0x002D($sp)
    daddu   $a0, $s2, $0
    li      $v0, 0x1400
    sh      $v0, 0x0034($sp)
    jal     os_80014128
    sw      $s1, 0x0024($sp)
    lbu     $v0, 0x002C($sp)
    beqz    $v0, .L80003190
    li      $v1, 0x0001
    beq     $v0, $v1, .L800031A8
    li      $v1, 0x0002
.L80003154:
    beql    $v0, $v1, .L800031C4
    sb      $0, 0x0008($s0)
    li      $v1, 0x0003
.L80003160:
    beql    $v0, $v1, .L800031E8
    lhu     $v0, 0x0006($s0)
.L80003168:
    ld      $ra, 0x0050($sp)
.L8000316C:
    ld      $s2, 0x0048($sp)
    ld      $s1, 0x0040($sp)
    ld      $s0, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
.L80003180:
    lui     $v0, %hi(__str_8004EAD8)
    j       .L800030F8
    addiu   $v0, %lo(__str_8004EAD8)
    nop
.L80003190:
    jal     os_80002A18
    daddu   $a0, $s0, $0
    lbu     $v0, 0x002C($sp)
    li      $v1, 0x0001
    bne     $v0, $v1, .L80003154
    li      $v1, 0x0002
.L800031A8:
    jal     os_80002D70
    daddu   $a0, $s0, $0
    lbu     $v0, 0x002C($sp)
    li      $v1, 0x0002
    bne     $v0, $v1, .L80003160
    li      $v1, 0x0003
    sb      $0, 0x0008($s0)
.L800031C4:
    ld      $ra, 0x0050($sp)
    sw      $0, 0x0000($s0)
    sh      $0, 0x0004($s0)
    sh      $0, 0x0006($s0)
    ld      $s2, 0x0048($sp)
    ld      $s1, 0x0040($sp)
    ld      $s0, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
.L800031E8:
    daddu   $a0, $s0, $0
    xori    $v0, $v0, 0x0001
    jal     os_800025F0
    sh      $v0, 0x0006($s0)
    bnez    $v0, .L8000316C
    ld      $ra, 0x0050($sp)
    lui     $a0, %hi(__str_8004EAF0)
    addiu   $a0, %lo(__str_8004EAF0)
    jal     os_800145A0
    li      $a1, 0x0001
    j       .L80003168
    sh      $0, 0x0006($s0)

.globl os_80003218
os_80003218:
    addiu   $sp, $sp, -0x0080
    sd      $s6, 0x0060($sp)
    sd      $s5, 0x0058($sp)
    sd      $s4, 0x0050($sp)
    sd      $s1, 0x0038($sp)
    lui     $s5, %hi(__str_8004ED30)
    lui     $s1, %hi(__str_80051050)
    lui     $s6, %hi(__str_8004EB20)
    lui     $s4, %hi(__str_8004EB18)
    sd      $s8, 0x0070($sp)
    sd      $s7, 0x0068($sp)
    sd      $s3, 0x0048($sp)
    sd      $s2, 0x0040($sp)
    sd      $s0, 0x0030($sp)
    sd      $ra, 0x0078($sp)
    daddu   $s7, $a0, $0
    sw      $a1, 0x0088($sp)
    addiu   $s1, %lo(__str_80051050)
    addiu   $s5, %lo(__str_8004ED30)
    addiu   $s6, %lo(__str_8004EB20)
    addiu   $s4, %lo(__str_8004EB18)
    daddu   $s0, $0, $0
    sw      $0, 0x002C($sp)
    daddu   $s8, $0, $0
    li      $s3, 0x0011
    li      $s2, 0x0022
.L80003280:
    jal     os_80013370
    nop
    jal     os_80012B60
    li      $a0, 0x2400
    lui     $a0, %hi(__str_8004EB00)
    li      $a1, 0x0024
    li      $a2, 0x0013
    jal     os_800139C0
    addiu   $a0, %lo(__str_8004EB00)
    jal     os_80012F18
    daddu   $a0, $s1, $0
    sw      $s7, 0x0020($sp)
    jal     os_80012E40
    sw      $0, 0x0024($sp)
    j       .L80003338
    sw      $v0, 0x0028($sp)
.L800032C0:
    beq     $a1, $s0, .L800032CC
    li      $a0, 0x1400
    li      $a0, 0x3400
.L800032CC:
    jal     os_80012B60
    nop
    jal     os_80012F18
    daddu   $a0, $s1, $0
    lw      $v0, 0x0020($sp)
    lw      $v1, 0x0024($sp)
    lw      $a0, 0x0000($v0)
    addiu   $v1, $v1, 0x0001
    jal     os_80012D10
    sw      $v1, 0x0024($sp)
    jal     os_80012B70
    daddu   $a0, $s5, $0
    lw      $a1, 0x0020($sp)
    jal     os_80012CE0
    lhu     $a0, 0x0004($a1)
    lw      $v1, 0x0020($sp)
    daddu   $a0, $s4, $0
    lhu     $v0, 0x0006($v1)
    addiu   $v1, $v1, 0x0030
    bnez    $v0, .L80003324
    sw      $v1, 0x0020($sp)
    daddu   $a0, $s6, $0
.L80003324:
    jal     os_80012B70
    nop
    lw      $a1, 0x0024($sp)
    beq     $a1, $s2, .L80003370
    lw      $v0, 0x002C($sp)
.L80003338:
    jal     os_800025F0
    lw      $a0, 0x0020($sp)
    bnez    $v0, .L80003354
    lw      $v1, 0x0024($sp)
    lw      $v0, 0x0020($sp)
    sh      $0, 0x0006($v0)
    lw      $v1, 0x0024($sp)
.L80003354:
    bnel    $v1, $s3, .L800032C0
    lw      $a1, 0x0024($sp)
    lw      $a1, 0x0028($sp)
    jal     os_80012D40
    li      $a0, 0x0015
    j       .L800032C0
    lw      $a1, 0x0024($sp)
.L80003370:
    subu    $s8, $s8, $v0
    addu    $a0, $s7, $s8
    jal     os_80002630
    addiu   $a0, $a0, 0x0008
    jal     os_80002678
    lw      $a0, 0x0088($sp)
    jal     sysRepaint
    nop
    jal     sys_os_80016148
    nop
    li      $v1, 0x0800
    beq     $v0, $v1, .L80003420
    li      $a1, 0x0008
    beq     $v0, $a1, .L800034A0
    li      $v1, 0x0010
    bne     $v0, $v1, .L800034F4
    li      $a1, 0x0020
    addiu   $s0, $s0, 0x0011
.L800033B8:
    andi    $s0, $s0, 0x00FF
    dsll32  $v1, $s0, 0
    dsrl32  $v1, $v1, 0
    dsll    $a1, $v1, 8
    dsll    $a0, $v1, 4
    dsubu   $a0, $a1, $a0
    dsll    $a1, $a0, 8
    daddu   $a0, $a0, $a1
    dsll    $a1, $a0, 16
    daddu   $a0, $a0, $a1
    daddu   $v1, $a0, $v1
    dsrl32  $v1, $v1, 5
    sll     $a0, $v1, 5
    sll     $v1, $v1, 1
    addu    $v1, $v1, $a0
    subu    $s0, $s0, $v1
    andi    $s0, $s0, 0x00FF
    li      $v1, 0x0002
.L80003400:
    beq     $v0, $v1, .L80003508
    li      $a1, 0x0001
    beq     $v0, $a1, .L80003484
    sll     $v1, $s0, 4
.L80003410:
    sll     $v0, $s0, 4
    sw      $v0, 0x002C($sp)
    j       .L80003280
    sll     $s8, $s0, 6
.L80003420:
    dsll32  $v1, $s0, 0
    dsrl32  $v1, $v1, 0
    dsll    $a1, $v1, 8
    dsll    $a0, $v1, 4
    dsubu   $a0, $a1, $a0
    dsll    $a1, $a0, 8
    daddu   $a0, $a0, $a1
    dsll    $a1, $a0, 16
    daddu   $a0, $a0, $a1
    daddu   $v1, $a0, $v1
    dsrl32  $v1, $v1, 4
    sll     $a0, $v1, 4
    addu    $v1, $a0, $v1
    subu    $v1, $s0, $v1
    andi    $v1, $v1, 0x00FF
    beqz    $v1, .L8000346C
    li      $a0, 0x0010
    addiu   $a0, $v1, -0x0001
    andi    $a0, $a0, 0x00FF
.L8000346C:
    subu    $s0, $s0, $v1
    addu    $s0, $s0, $a0
    li      $a1, 0x0001
    bne     $v0, $a1, .L80003410
    andi    $s0, $s0, 0x00FF
    sll     $v1, $s0, 4
.L80003484:
    sll     $s8, $s0, 6
    subu    $a0, $s8, $v1
    addu    $a0, $s7, $a0
    jal     os_800030D0
    sw      $v1, 0x002C($sp)
    j       .L80003280
    nop
.L800034A0:
    dsll32  $v1, $s0, 0
    dsrl32  $v1, $v1, 0
    dsll    $a1, $v1, 8
    dsll    $a0, $v1, 4
    dsubu   $a0, $a1, $a0
    dsll    $a1, $a0, 8
    daddu   $a0, $a0, $a1
    dsll    $a1, $a0, 16
    daddu   $a0, $a0, $a1
    daddu   $v1, $a0, $v1
    dsrl32  $v1, $v1, 4
    sll     $a0, $v1, 4
    addu    $v1, $a0, $v1
    subu    $v1, $s0, $v1
    andi    $v1, $v1, 0x00FF
    li      $a1, 0x0010
    beq     $v1, $a1, .L8000346C
    daddu   $a0, $0, $0
    addiu   $a0, $v1, 0x0001
    j       .L8000346C
    andi    $a0, $a0, 0x00FF
.L800034F4:
    beql    $v0, $a1, .L800033B8
    addiu   $s0, $s0, 0x0011
    j       .L80003400
    li      $v1, 0x0002
    nop
.L80003508:
    ld      $ra, 0x0078($sp)
    ld      $s8, 0x0070($sp)
    ld      $s7, 0x0068($sp)
    ld      $s6, 0x0060($sp)
    ld      $s5, 0x0058($sp)
    ld      $s4, 0x0050($sp)
    ld      $s3, 0x0048($sp)
    ld      $s2, 0x0040($sp)
    ld      $s1, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0080

.globl os_80003538
os_80003538:
    addiu   $sp, $sp, -0x06A8
    sd      $s2, 0x0690($sp)
    sd      $s0, 0x0680($sp)
    addiu   $s2, $a0, 0x0018
    addiu   $s0, $sp, 0x0020
    daddu   $a0, $s2, $0
    daddu   $a1, $s0, $0
    sd      $s1, 0x0688($sp)
    sd      $ra, 0x06A0($sp)
    jal     os_800028E0
    sd      $s3, 0x0698($sp)
    beqz    $v0, .L80003590
    daddu   $s1, $v0, $0
.L8000356C:
    ld      $ra, 0x06A0($sp)
    daddu   $v0, $s1, $0
    ld      $s3, 0x0698($sp)
    ld      $s2, 0x0690($sp)
    ld      $s1, 0x0688($sp)
    ld      $s0, 0x0680($sp)
    jr      $ra
    addiu   $sp, $sp, 0x06A8
    nop
.L80003590:
    li      $a2, 0x0660
    daddu   $a0, $0, $0
    jal     os_8000E570
    daddu   $a1, $s0, $0
    daddu   $a0, $s0, $0
    daddu   $a1, $s2, $0
    jal     os_80003218
    daddu   $s3, $v0, $0
    daddu   $a0, $0, $0
    daddu   $a1, $s0, $0
    jal     os_8000E570
    li      $a2, 0x0660
    beq     $s3, $v0, .L8000356C
    daddu   $a0, $s0, $0
    jal     os_80002960
    daddu   $a1, $s2, $0
    ld      $ra, 0x06A0($sp)
    daddu   $s1, $v0, $0
    daddu   $v0, $s1, $0
    ld      $s3, 0x0698($sp)
    ld      $s2, 0x0690($sp)
    ld      $s1, 0x0688($sp)
    ld      $s0, 0x0680($sp)
    jr      $ra
    addiu   $sp, $sp, 0x06A8
    nop

.globl os_800035F8
os_800035F8:
    addiu   $sp, $sp, -0x06A0
    daddu   $a1, $0, $0
    sd      $ra, 0x0698($sp)
    sd      $s1, 0x0690($sp)
    jal     fat_os_80011380
    sd      $s0, 0x0688($sp)
    beqz    $v0, .L80003630
    addiu   $s0, $sp, 0x0020
    ld      $ra, 0x0698($sp)
.L8000361C:
    ld      $s1, 0x0690($sp)
    ld      $s0, 0x0688($sp)
    jr      $ra
    addiu   $sp, $sp, 0x06A0
    nop
.L80003630:
    jal     os_800027D0
    daddu   $a0, $s0, $0
    bnez    $v0, .L8000361C
    ld      $ra, 0x0698($sp)
    lui     $s1, %hi(_80052908)
    lw      $a1, %lo(_80052908)($s1)
    daddu   $a0, $s0, $0
    addiu   $a1, $a1, 0x0094
    jal     os_80003218
    sd      $v0, 0x0680($sp)
    ld      $v0, 0x0680($sp)
    daddu   $v1, $s0, $0
    addiu   $a3, $sp, 0x0680
    li      $a0, 0x0001
.L80003668:
    lw      $a2, 0x0000($v1)
    lhu     $a1, 0x0004($v1)
    sltiu   $a2, $a2, 0x0001
    subu    $a2, $0, $a2
    sltiu   $a1, $a1, 0x0001
    and     $a0, $a0, $a2
    subu    $a1, $0, $a1
    addiu   $v1, $v1, 0x0030
    bne     $v1, $a3, .L80003668
    and     $a0, $a0, $a1
    bnezl   $a0, .L8000361C
    ld      $ra, 0x0698($sp)
    lw      $a1, %lo(_80052908)($s1)
    daddu   $a0, $s0, $0
    jal     os_80002960
    addiu   $a1, $a1, 0x0094
    j       .L8000361C
    ld      $ra, 0x0698($sp)

.globl os_800036B0
os_800036B0:
    addiu   $sp, $sp, -0x7FF0
    sd      $s2, 0x7FD0($sp)
    sd      $s1, 0x7FC8($sp)
    sd      $ra, 0x7FE8($sp)
    sd      $s4, 0x7FE0($sp)
    sd      $s3, 0x7FD8($sp)
    sd      $s0, 0x7FC0($sp)
    andi    $s2, $a1, 0x00FF
    addiu   $sp, $sp, -0x0060
    jal     fat_os_80011380
    daddu   $a1, $0, $0
    beqz    $v0, .L80003710
    daddu   $s1, $v0, $0
.L800036E4:
    addiu   $sp, $sp, 0x0060
    ld      $ra, 0x7FE8($sp)
    daddu   $v0, $s1, $0
    ld      $s4, 0x7FE0($sp)
    ld      $s3, 0x7FD8($sp)
    ld      $s2, 0x7FD0($sp)
    ld      $s1, 0x7FC8($sp)
    ld      $s0, 0x7FC0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
    nop
.L80003710:
    jal     fat_os_8000F7A0
    nop
    daddu   $s4, $v0, $0
    sltiu   $v0, $v0, 0x0041
    beqzl   $v0, .L80003728
    li      $s4, 0x0040
.L80003728:
    addiu   $s3, $sp, 0x0020
    daddu   $a0, $s3, $0
    jal     fat_os_80010840
    andi    $a1, $s4, 0xFFFF
    bnez    $v0, .L800036E4
    daddu   $s1, $v0, $0
    sll     $s4, $s4, 9
    beqz    $s4, .L800036E4
    daddu   $a2, $0, $0
    daddu   $s0, $0, $0
.L80003750:
    addu    $a2, $s3, $a2
    sra     $a1, $s0, 8
    daddu   $a0, $s2, $0
    jal     write_mempak_sector
    addiu   $s0, $s0, 0x0100
    sltu    $v0, $s0, $s4
    bnez    $v0, .L80003750
    daddu   $a2, $s0, $0
    addiu   $sp, $sp, 0x0060
    ld      $ra, 0x7FE8($sp)
    daddu   $v0, $s1, $0
    ld      $s4, 0x7FE0($sp)
    ld      $s3, 0x7FD8($sp)
    ld      $s2, 0x7FD0($sp)
    ld      $s1, 0x7FC8($sp)
    ld      $s0, 0x7FC0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0

.globl os_80003798
os_80003798:
    addiu   $sp, $sp, -0x7FF0
    sd      $s4, 0x7FE0($sp)
    sd      $s3, 0x7FD8($sp)
    sd      $s2, 0x7FD0($sp)
    sd      $s1, 0x7FC8($sp)
    sd      $s0, 0x7FC0($sp)
    sd      $ra, 0x7FE8($sp)
    addiu   $sp, $sp, -0x0060
    daddu   $s4, $a0, $0
    andi    $s3, $a1, 0x00FF
    daddu   $a2, $0, $0
    daddu   $s0, $0, $0
    addiu   $s1, $sp, 0x0020
    li      $s2, 0x8000
.L800037D0:
    addu    $a2, $s1, $a2
    sra     $a1, $s0, 8
    daddu   $a0, $s3, $0
    jal     read_mempak_sector
    addiu   $s0, $s0, 0x0100
    bne     $s0, $s2, .L800037D0
    daddu   $a2, $s0, $0
    daddu   $a0, $s4, $0
    jal     fat_os_80011380
    li      $a1, 0x0040
    bnezl   $v0, .L80003810
    addiu   $sp, $sp, 0x0060
    daddu   $a0, $s1, $0
    jal     fat_os_80010970
    li      $a1, 0x0040
    addiu   $sp, $sp, 0x0060
.L80003810:
    ld      $ra, 0x7FE8($sp)
    ld      $s4, 0x7FE0($sp)
    ld      $s3, 0x7FD8($sp)
    ld      $s2, 0x7FD0($sp)
    ld      $s1, 0x7FC8($sp)
    ld      $s0, 0x7FC0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0

.globl os_80003830
os_80003830:
    addiu   $sp, $sp, -0x0118
    daddu   $v0, $a0, $0
    lui     $a2, %hi(__str_8004EB78)
    lui     $a0, %hi(__str_8004EB68)
    sd      $s0, 0x0100($sp)
    addiu   $a0, %lo(__str_8004EB68)
    andi    $s0, $a1, 0x00FF
    addiu   $a2, %lo(__str_8004EB78)
    daddu   $a1, $v0, $0
    li      $a3, 0x0040
    sd      $ra, 0x0110($sp)
    jal     fat_os_80011B80
    sd      $s1, 0x0108($sp)
    beqz    $v0, .L80003880
    ld      $ra, 0x0110($sp)
.L8000386C:
    ld      $s1, 0x0108($sp)
    ld      $s0, 0x0100($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0118
    nop
.L80003880:
    jal     fat_os_8000F7B0
    addiu   $s1, $sp, 0x0020
    daddu   $a0, $v0, $0
    jal     fat_os_80011390
    daddu   $a1, $s1, $0
    bnez    $v0, .L8000386C
    ld      $ra, 0x0110($sp)
    daddu   $a0, $s1, $0
    jal     os_80003798
    daddu   $a1, $s0, $0
    ld      $ra, 0x0110($sp)
    ld      $s1, 0x0108($sp)
    ld      $s0, 0x0100($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0118
    nop

.globl os_800038C0
os_800038C0:
    addiu   $sp, $sp, -0x0058
    sd      $s1, 0x0038($sp)
    lui     $v0, %hi(_8004CA00)
    andi    $s1, $a0, 0x00FF
    sll     $v1, $s1, 2
    addiu   $v0, %lo(_8004CA00)
    addu    $v0, $v1, $v0
    lw      $v0, 0x0000($v0)
    addiu   $a0, $sp, 0x0020
    sw      $v0, 0x0020($sp)
    lui     $v0, %hi(__str_8004EB80)
    addiu   $v0, %lo(__str_8004EB80)
    sw      $v0, 0x0024($sp)
    lui     $v0, %hi(__str_8004EBA0)
    addiu   $v0, %lo(__str_8004EBA0)
    daddu   $a1, $0, $0
    sd      $ra, 0x0050($sp)
    sd      $s3, 0x0048($sp)
    sd      $s2, 0x0040($sp)
    sd      $s0, 0x0030($sp)
    sw      $v0, 0x0028($sp)
    jal     os_80013B50
    sw      $0, 0x002C($sp)
    bnez    $v0, .L80003940
    ld      $ra, 0x0050($sp)
    ld      $s3, 0x0048($sp)
    ld      $s2, 0x0040($sp)
    ld      $s1, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
    nop
.L80003940:
    lui     $a0, %hi(__str_8004EA30)
    addiu   $a0, %lo(__str_8004EA30)
    li      $a1, 0x0002
    jal     os_800145A0
    lui     $s3, %hi(mpk_data)
    addiu   $s3, %lo(mpk_data)
    daddu   $s0, $0, $0
    li      $s2, 0x0500
    sra     $a1, $s0, 8
.L80003964:
    addu    $a2, $s3, $s0
    daddu   $a0, $s1, $0
    jal     write_mempak_sector
    addiu   $s0, $s0, 0x0100
    bne     $s0, $s2, .L80003964
    sra     $a1, $s0, 8
    lui     $a0, %hi(__str_8004EBB0)
    addiu   $a0, %lo(__str_8004EBB0)
    jal     os_800145A0
    daddu   $a1, $0, $0
    ld      $ra, 0x0050($sp)
    ld      $s3, 0x0048($sp)
    ld      $s2, 0x0040($sp)
    ld      $s1, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058

.globl os_800039A8
os_800039A8:
    addiu   $sp, $sp, -0x0060
    sd      $s6, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s4, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0058($sp)
    daddu   $s1, $a0, $0
    daddu   $s0, $0, $0
    daddu   $s4, $0, $0
    li      $s3, 0x0002
    li      $s6, 0x0001
    li      $s5, 0x0001
    li      $s2, 0x0004
.L800039E8:
    daddu   $a0, $s0, $0
    sb      $0, 0x0000($s1)
    jal     identify_accessory
    addiu   $s0, $s0, 0x0001
    beql    $v0, $s3, .L80003A40
    addiu   $s4, $s4, 0x0001
    beql    $v0, $s5, .L80003A40
    addiu   $s4, $s4, 0x0001
.L80003A08:
    bne     $s0, $s2, .L800039E8
    addiu   $s1, $s1, 0x0001
    ld      $ra, 0x0058($sp)
    daddu   $v0, $s4, $0
    ld      $s6, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060
    nop
.L80003A40:
    sb      $s6, 0x0000($s1)
    j       .L80003A08
    andi    $s4, $s4, 0x00FF
    nop

.globl os_80003A50
os_80003A50:
    lui     $a0, %hi(_8004CA10)
    addiu   $v1, $a0, %lo(_8004CA10)
    addiu   $sp, $sp, -0x0078
    lw      $v0, 0x0010($v1)
    ld      $a1, %lo(_8004CA10)($a0)
    ld      $v1, 0x0008($v1)
    addiu   $a0, $sp, 0x0020
    sd      $ra, 0x0070($sp)
    sd      $s1, 0x0068($sp)
    sd      $s0, 0x0060($sp)
    sd      $a1, 0x0030($sp)
    sd      $v1, 0x0038($sp)
    jal     os_800039A8
    sw      $v0, 0x0040($sp)
    beqz    $v0, .L80003BB8
    li      $v1, 0x0001
    beq     $v0, $v1, .L80003B40
    addiu   $s1, $sp, 0x0048
    daddu   $a0, $s1, $0
    daddu   $a1, $0, $0
    li      $a2, 0x0018
    jal     os_80014778
    addiu   $s0, $sp, 0x0028
    daddu   $a0, $s0, $0
    daddu   $a1, $0, $0
    jal     os_80014778
    li      $a2, 0x0004
    lbu     $v0, 0x0020($sp)
    bnez    $v0, .L80003AD4
    lbu     $v0, 0x0021($sp)
    li      $v0, -0x0080
.L80003ACC:
    sb      $v0, 0x0028($sp)
    lbu     $v0, 0x0021($sp)
.L80003AD4:
    bnez    $v0, .L80003AE8
    lbu     $v0, 0x0022($sp)
    li      $v0, -0x0080
    sb      $v0, 0x0029($sp)
    lbu     $v0, 0x0022($sp)
.L80003AE8:
    bnez    $v0, .L80003AFC
    lbu     $v0, 0x0023($sp)
    li      $v0, -0x0080
    sb      $v0, 0x002A($sp)
    lbu     $v0, 0x0023($sp)
.L80003AFC:
    beqz    $v0, .L80003BB0
    li      $v0, -0x0080
.L80003B04:
    lui     $v0, %hi(__str_8004EBF0)
    addiu   $v0, %lo(__str_8004EBF0)
    sw      $v0, 0x0048($sp)
    daddu   $a0, $s1, $0
    addiu   $v0, $sp, 0x0030
    sw      $v0, 0x004C($sp)
    jal     os_80014128
    sw      $s0, 0x0050($sp)
    lbu     $v0, 0x0054($sp)
.L80003B28:
    ld      $ra, 0x0070($sp)
    ld      $s1, 0x0068($sp)
    ld      $s0, 0x0060($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0078
    nop
.L80003B40:
    lbu     $v1, 0x0020($sp)
    bnez    $v1, .L80003B28
    daddu   $v0, $0, $0
    lbu     $v1, 0x0021($sp)
    bnez    $v1, .L80003B28
    li      $v0, 0x0001
    lbu     $v1, 0x0022($sp)
    bnez    $v1, .L80003B28
    li      $v0, 0x0002
    lbu     $v1, 0x0023($sp)
    bnez    $v1, .L80003B28
    li      $v0, 0x0003
    addiu   $s1, $sp, 0x0048
    daddu   $a0, $s1, $0
    daddu   $a1, $0, $0
    li      $a2, 0x0018
    jal     os_80014778
    addiu   $s0, $sp, 0x0028
    daddu   $a0, $s0, $0
    daddu   $a1, $0, $0
    jal     os_80014778
    li      $a2, 0x0004
    lbu     $v0, 0x0020($sp)
    bnezl   $v0, .L80003AD4
    lbu     $v0, 0x0021($sp)
    j       .L80003ACC
    li      $v0, -0x0080
    nop
.L80003BB0:
    j       .L80003B04
    sb      $v0, 0x002B($sp)
.L80003BB8:
    lui     $a0, %hi(__str_8004EBD0)
    addiu   $a0, %lo(__str_8004EBD0)
    jal     os_800145A0
    daddu   $a1, $0, $0
    ld      $ra, 0x0070($sp)
    li      $v0, 0x00FF
    ld      $s1, 0x0068($sp)
    ld      $s0, 0x0060($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0078
    addiu   $sp, $sp, -0x0048
    sd      $ra, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    jal     os_80013370
    daddu   $s0, $a0, $0
    jal     os_80012B60
    li      $a0, 0x1400
    lui     $s1, %hi(__str_80051050)
    lui     $a0, %hi(__str_8004EC08)
    daddu   $a1, $0, $0
    addiu   $s1, %lo(__str_80051050)
    jal     os_80013758
    addiu   $a0, %lo(__str_8004EC08)
    jal     os_80012E50
    lui     $s2, %hi(__str_8004EC28)
    jal     os_80012F18
    daddu   $a0, $s1, $0
    jal     os_80012F18
    daddu   $a0, $s1, $0
    jal     os_80012F18
    daddu   $a0, $s1, $0
    jal     os_80012B60
    li      $a0, 0x3000
    lw      $a0, 0x0000($s0)
    jal     os_80012F18
    addiu   $s2, %lo(__str_8004EC28)
    jal     os_80012B70
    daddu   $a0, $s2, $0
    jal     os_80012B60
    li      $a0, 0x1000
    lui     $a0, %hi(__str_8004EC30)
    jal     os_80012F18
    addiu   $a0, %lo(__str_8004EC30)
    lui     $s3, %hi(__str_8004EB68)
    lui     $a0, %hi(__str_8004EC50)
    addiu   $s3, %lo(__str_8004EB68)
    jal     os_80012F18
    addiu   $a0, %lo(__str_8004EC50)
    jal     os_80012B70
    daddu   $a0, $s3, $0
    lui     $a0, %hi(__str_8004EC68)
    jal     os_80012F18
    addiu   $a0, %lo(__str_8004EC68)
    lui     $a0, %hi(__str_8004EC90)
    jal     os_80012F18
    addiu   $a0, %lo(__str_8004EC90)
    lui     $a0, %hi(__str_8004ECB8)
    jal     os_80012F18
    addiu   $a0, %lo(__str_8004ECB8)
    jal     os_80012F18
    daddu   $a0, $s1, $0
    jal     os_80012F18
    daddu   $a0, $s1, $0
    jal     os_80012B60
    li      $a0, 0x3000
    jal     os_80012F18
    lw      $a0, 0x0004($s0)
    jal     os_80012B70
    daddu   $a0, $s2, $0
    jal     os_80012B60
    li      $a0, 0x1000
    lui     $a0, %hi(__str_8004ECD8)
    jal     os_80012F18
    addiu   $a0, %lo(__str_8004ECD8)
    lui     $a0, %hi(__str_8004ED00)
    jal     os_80012F18
    addiu   $a0, %lo(__str_8004ED00)
    lui     $a0, %hi(__str_8004ED28)
    jal     os_80012F18
    addiu   $a0, %lo(__str_8004ED28)
    jal     os_80012B70
    daddu   $a0, $s3, $0
    lui     $a0, %hi(__str_8004ED38)
    jal     os_80012B70
    addiu   $a0, %lo(__str_8004ED38)
    lui     $a0, %hi(__str_8004ED48)
    jal     os_80012F18
    addiu   $a0, %lo(__str_8004ED48)
    lui     $a0, %hi(__str_8004ED68)
    jal     os_80012F18
    addiu   $a0, %lo(__str_8004ED68)
    jal     os_80012F18
    daddu   $a0, $s1, $0
    jal     os_80012F18
    daddu   $a0, $s1, $0
    jal     os_80012B60
    li      $a0, 0x3000
    jal     os_80012F18
    lw      $a0, 0x0008($s0)
    jal     os_80012B70
    daddu   $a0, $s2, $0
    jal     os_80012B60
    li      $a0, 0x1000
    lui     $a0, %hi(__str_8004ED88)
    jal     os_80012F18
    addiu   $a0, %lo(__str_8004ED88)
    jal     os_80012F18
    daddu   $a0, $s1, $0
    jal     os_80012F18
    daddu   $a0, $s1, $0
    jal     os_80012B60
    li      $a0, 0x1400
    li      $a1, 0x0024
    li      $a2, 0x0003
    jal     os_80013148
    li      $a0, 0x0020
    lui     $a0, %hi(__str_8004EDB0)
    jal     os_80013300
    addiu   $a0, %lo(__str_8004EDB0)
    lui     $a0, %hi(__str_8004EDD8)
    jal     os_80013300
    addiu   $a0, %lo(__str_8004EDD8)
    lui     $a0, %hi(__str_8004EDF8)
    jal     os_80013300
    addiu   $a0, %lo(__str_8004EDF8)
    jal     sysRepaint
    nop
    ld      $ra, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       sys_os_80016148
    addiu   $sp, $sp, 0x0048
    nop

.globl os_80003DE0
os_80003DE0:
    addiu   $sp, $sp, -0x00A0
    sd      $s2, 0x0068($sp)
    addiu   $s2, $sp, 0x0020
    sd      $s0, 0x0058($sp)
    daddu   $a0, $s2, $0
    daddu   $a1, $0, $0
    li      $a2, 0x0004
    addiu   $s0, $sp, 0x0040
    sd      $ra, 0x0098($sp)
    sd      $s1, 0x0060($sp)
    sd      $s7, 0x0090($sp)
    sd      $s6, 0x0088($sp)
    sd      $s5, 0x0080($sp)
    sd      $s4, 0x0078($sp)
    sd      $s3, 0x0070($sp)
    jal     os_80014778
    lui     $s1, %hi(_80052908)
    daddu   $a0, $s0, $0
    daddu   $a1, $0, $0
    jal     os_80014778
    li      $a2, 0x0018
    lw      $v0, %lo(_80052908)($s1)
    lbu     $v0, 0x0094($v0)
    bnez    $v0, .L80003E50
    addiu   $v0, $sp, 0x0028
    li      $v0, -0x0080
    sb      $v0, 0x0021($sp)
    addiu   $v0, $sp, 0x0028
.L80003E50:
    sw      $v0, 0x0044($sp)
    lui     $v0, %hi(__str_8004EE18)
    addiu   $v0, %lo(__str_8004EE18)
    sw      $s2, 0x0048($sp)
    jal     os_80003A50
    sw      $v0, 0x0040($sp)
    daddu   $s2, $v0, $0
    li      $v0, 0x00FF
    beq     $s2, $v0, .L80003F10
    lui     $v0, %hi(__str_8004EE30)
    addiu   $v0, %lo(__str_8004EE30)
    sw      $v0, 0x0028($sp)
    lui     $v0, %hi(__str_8004EE40)
    addiu   $v0, %lo(__str_8004EE40)
    sw      $v0, 0x002C($sp)
    lui     $v0, %hi(__str_8004EE50)
    addiu   $v0, %lo(__str_8004EE50)
    sw      $v0, 0x0030($sp)
    lui     $v0, %hi(__str_8004EE58)
    addiu   $v0, %lo(__str_8004EE58)
    lui     $s7, %hi(_80051B50)
    sw      $v0, 0x0034($sp)
    sw      $0, 0x0038($sp)
    addiu   $s7, %lo(_80051B50)
    li      $s3, 0x00FF
    li      $s4, 0x0002
    li      $s5, 0x0001
    li      $s6, 0x0003
.L80003EC0:
    jal     os_80014128
    daddu   $a0, $s0, $0
    lbu     $v0, 0x004C($sp)
    beq     $v0, $s3, .L80003F14
    ld      $ra, 0x0098($sp)
.L80003ED4:
    beq     $v0, $s4, .L80003F40
    nop
    beqz    $v0, .L80003F78
    lui     $a0, %hi(__str_8004EA30)
    beq     $v0, $s5, .L80003FD0
    addiu   $a0, %lo(__str_8004EA30)
    bne     $v0, $s6, .L80003EC0
    nop
    jal     os_800134D8
    daddu   $a0, $s7, $0
    jal     os_80014128
    daddu   $a0, $s0, $0
    lbu     $v0, 0x004C($sp)
    bne     $v0, $s3, .L80003ED4
    nop
.L80003F10:
    ld      $ra, 0x0098($sp)
.L80003F14:
    daddu   $v0, $0, $0
    ld      $s7, 0x0090($sp)
    ld      $s6, 0x0088($sp)
    ld      $s5, 0x0080($sp)
    ld      $s4, 0x0078($sp)
    ld      $s3, 0x0070($sp)
    ld      $s2, 0x0068($sp)
    ld      $s1, 0x0060($sp)
    ld      $s0, 0x0058($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00A0
.L80003F40:
    jal     os_800038C0
    daddu   $a0, $s2, $0
    ld      $ra, 0x0098($sp)
    daddu   $v0, $0, $0
    ld      $s7, 0x0090($sp)
    ld      $s6, 0x0088($sp)
    ld      $s5, 0x0080($sp)
    ld      $s4, 0x0078($sp)
    ld      $s3, 0x0070($sp)
    ld      $s2, 0x0068($sp)
    ld      $s1, 0x0060($sp)
    ld      $s0, 0x0058($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00A0
.L80003F78:
    addiu   $a0, %lo(__str_8004EA30)
    jal     os_800145A0
    li      $a1, 0x0002
    lui     $v0, %hi(_8004CA00)
    sll     $v1, $s2, 2
    addiu   $v0, %lo(_8004CA00)
    addu    $v0, $v1, $v0
    lw      $a0, 0x0000($v0)
    jal     os_80003830
    daddu   $a1, $s2, $0
    ld      $ra, 0x0098($sp)
    ld      $s7, 0x0090($sp)
    ld      $s6, 0x0088($sp)
    ld      $s5, 0x0080($sp)
    ld      $s4, 0x0078($sp)
    ld      $s3, 0x0070($sp)
    ld      $s2, 0x0068($sp)
    ld      $s1, 0x0060($sp)
    ld      $s0, 0x0058($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00A0
    nop
.L80003FD0:
    jal     os_800145A0
    li      $a1, 0x0002
    lw      $a0, %lo(_80052908)($s1)
    daddu   $a1, $s2, $0
    jal     os_80003830
    addiu   $a0, $a0, 0x0094
    ld      $ra, 0x0098($sp)
    ld      $s7, 0x0090($sp)
    ld      $s6, 0x0088($sp)
    ld      $s5, 0x0080($sp)
    ld      $s4, 0x0078($sp)
    ld      $s3, 0x0070($sp)
    ld      $s2, 0x0068($sp)
    ld      $s1, 0x0060($sp)
    ld      $s0, 0x0058($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00A0
    nop

.globl os_80004018
os_80004018:
    addiu   $sp, $sp, -0x0050
    sd      $s1, 0x0038($sp)
    lui     $s1, %hi(_80052908)
    sd      $s0, 0x0030($sp)
    lw      $s0, %lo(_80052908)($s1)
    sd      $ra, 0x0048($sp)
    addiu   $s0, $s0, 0x0094
    sd      $s2, 0x0040($sp)
    jal     os_80013370
    daddu   $s2, $a0, $0
    jal     os_80014F68
    daddu   $a0, $s0, $0
    li      $a0, 0x1400
    jal     os_80012B60
    sd      $v0, 0x0028($sp)
    li      $v1, 0x0002
    daddu   $a1, $0, $0
    li      $a2, 0x0002
    li      $a3, 0x0028
    li      $a0, 0x0020
    jal     os_800131E8
    sw      $v1, 0x0024($sp)
    lui     $a0, %hi(__str_8004EEE8)
    jal     os_80013300
    addiu   $a0, %lo(__str_8004EEE8)
    lui     $a0, %hi(__str_8004EF08)
    jal     os_80013300
    addiu   $a0, %lo(__str_8004EF08)
    lui     $a0, %hi(__str_80051050)
    jal     os_80013930
    addiu   $a0, %lo(__str_80051050)
    lui     $a0, %hi(__str_8004EF30)
    jal     os_80013300
    addiu   $a0, %lo(__str_8004EF30)
    ld      $v0, 0x0028($sp)
    sltiu   $v0, $v0, 0x0025
    beqz    $v0, .L800040E8
    li      $a1, 0x0021
    jal     os_80013300
    daddu   $a0, $s0, $0
    lui     $a0, %hi(_80051B40)
    addiu   $a0, %lo(_80051B40)
    jal     os_80013B50
    li      $a1, 0x0001
    bnezl   $v0, .L80004118
    lw      $v0, %lo(_80052908)($s1)
    ld      $ra, 0x0048($sp)
.L800040D4:
    ld      $s2, 0x0040($sp)
    ld      $s1, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
.L800040E8:
    jal     os_80012E88
    daddu   $a0, $s0, $0
    lui     $a0, %hi(__str_8004EA78)
    jal     os_80012B70
    addiu   $a0, %lo(__str_8004EA78)
    lui     $a0, %hi(_80051B40)
    addiu   $a0, %lo(_80051B40)
    jal     os_80013B50
    li      $a1, 0x0001
    beqz    $v0, .L800040D4
    ld      $ra, 0x0048($sp)
    lw      $v0, %lo(_80052908)($s1)
.L80004118:
    lw      $v1, 0x0000($s2)
    ld      $ra, 0x0048($sp)
    ld      $s2, 0x0040($sp)
    ld      $s1, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    sw      $v1, 0x0058($v0)
    j       os_80007990
    addiu   $sp, $sp, 0x0050

.globl os_80004138
os_80004138:
    addiu   $sp, $sp, -0x0188
    daddu   $a1, $0, $0
    sd      $s6, 0x0168($sp)
    sd      $ra, 0x0180($sp)
    sd      $s8, 0x0178($sp)
    sd      $s7, 0x0170($sp)
    sd      $s5, 0x0160($sp)
    sd      $s4, 0x0158($sp)
    sd      $s3, 0x0150($sp)
    sd      $s2, 0x0148($sp)
    sd      $s1, 0x0140($sp)
    jal     fat_os_80011380
    sd      $s0, 0x0138($sp)
    beqz    $v0, .L800041A8
    daddu   $s6, $v0, $0
.L80004174:
    daddu   $v0, $s6, $0
.L80004178:
    ld      $ra, 0x0180($sp)
    ld      $s8, 0x0178($sp)
    ld      $s7, 0x0170($sp)
    ld      $s6, 0x0168($sp)
    ld      $s5, 0x0160($sp)
    ld      $s4, 0x0158($sp)
    ld      $s3, 0x0150($sp)
    ld      $s2, 0x0148($sp)
    ld      $s1, 0x0140($sp)
    ld      $s0, 0x0138($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0188
.L800041A8:
    jal     fat_os_8000F7A0
    nop
    sll     $v0, $v0, 9
    sw      $v0, 0x0120($sp)
    lw      $v1, 0x0120($sp)
    lui     $v0, 0x04000001 >> 16
    ori     $v0, 0x04000001 & 0xFFFF
    sltu    $v0, $v1, $v0
    bnez    $v0, .L800041DC
    lw      $v0, 0x0120($sp)
    li      $a1, 0x04000000
    sw      $a1, 0x0120($sp)
    lw      $v0, 0x0120($sp)
.L800041DC:
    lui     $s3, %hi(__str_80051050)
    lui     $s8, %hi(__str_8004EF58)
    addiu   $s3, %lo(__str_80051050)
    addiu   $s8, %lo(__str_8004EF58)
    srl     $s7, $v0, 8
    daddu   $s4, $0, $0
    daddu   $s5, $0, $0
    addiu   $s0, $sp, 0x0020
    li      $s1, 0x0100
    li      $s2, 0x0002
    sltu    $v0, $s4, $s5
.L80004208:
    bnez    $v0, .L80004228
    daddu   $a1, $s4, $0
    srl     $a0, $s4, 9
    jal     fat_os_800103A0
    li      $a1, 0x0001
    bnez    $v0, .L80004178
    addiu   $s5, $s5, 0x0200
    daddu   $a1, $s4, $0
.L80004228:
    li      $a2, 0x0100
    jal     BiCartRomRd
    daddu   $a0, $s0, $0
    jal     os_80013370
    nop
    jal     os_80012B60
    li      $a0, 0x2000
    jal     os_80012F18
    daddu   $a0, $s3, $0
    jal     os_80012D10
    daddu   $a0, $s4, $0
    lui     $a0, %hi(__str_8004EF50)
    jal     os_80012B70
    addiu   $a0, %lo(__str_8004EF50)
    srl     $a0, $s4, 8
    jal     os_80013308
    addiu   $a0, $a0, 0x0001
    jal     os_80012B70
    daddu   $a0, $s8, $0
    jal     os_80013308
    daddu   $a0, $s7, $0
    daddu   $v1, $0, $0
    j       .L800042BC
    daddu   $v0, $0, $0
.L80004288:
    beq     $a0, $s2, .L800042EC
    li      $a0, 0x3000
.L80004290:
    andi    $v1, $v1, 0x000F
    beqz    $v1, .L8000430C
    daddu   $a0, $s3, $0
.L8000429C:
    addu    $v1, $s0, $v0
    lbu     $a0, 0x0000($v1)
    addiu   $v0, $v0, 0x0001
    jal     os_80012C78
    sd      $v0, 0x0130($sp)
    ld      $v0, 0x0130($sp)
    beq     $v0, $s1, .L80004338
    daddu   $v1, $v0, $0
.L800042BC:
    andi    $a0, $v1, 0x0003
    bnez    $a0, .L80004288
    andi    $a0, $v0, 0x0003
    li      $a0, 0x1000
    sd      $v0, 0x0130($sp)
    jal     os_80012B60
    sd      $v1, 0x0128($sp)
    ld      $v0, 0x0130($sp)
    andi    $a0, $v0, 0x0003
    bne     $a0, $s2, .L80004290
    ld      $v1, 0x0128($sp)
    li      $a0, 0x3000
.L800042EC:
    sd      $v0, 0x0130($sp)
    jal     os_80012B60
    sd      $v1, 0x0128($sp)
    ld      $v1, 0x0128($sp)
    andi    $v1, $v1, 0x000F
    bnez    $v1, .L8000429C
    ld      $v0, 0x0130($sp)
    daddu   $a0, $s3, $0
.L8000430C:
    jal     os_80012F18
    sd      $v0, 0x0130($sp)
    ld      $v0, 0x0130($sp)
    addu    $v1, $s0, $v0
    lbu     $a0, 0x0000($v1)
    addiu   $v0, $v0, 0x0001
    jal     os_80012C78
    sd      $v0, 0x0130($sp)
    ld      $v0, 0x0130($sp)
    bne     $v0, $s1, .L800042BC
    daddu   $v1, $v0, $0
.L80004338:
    jal     os_80012B60
    li      $a0, 0x1400
    daddu   $v0, $0, $0
    j       .L8000436C
    daddu   $v1, $0, $0
    nop
.L80004350:
    lbu     $a0, 0x0000($v1)
    addiu   $v0, $v0, 0x0001
    jal     os_80012C10
    sd      $v0, 0x0130($sp)
    ld      $v0, 0x0130($sp)
    beq     $v0, $s1, .L800043A8
    daddu   $v1, $v0, $0
.L8000436C:
    andi    $v1, $v1, 0x001F
    bnezl   $v1, .L80004350
    addu    $v1, $s0, $v0
    daddu   $a0, $s3, $0
    jal     os_80012F18
    sd      $v0, 0x0130($sp)
    ld      $v0, 0x0130($sp)
    addu    $v1, $s0, $v0
    lbu     $a0, 0x0000($v1)
    addiu   $v0, $v0, 0x0001
    jal     os_80012C10
    sd      $v0, 0x0130($sp)
    ld      $v0, 0x0130($sp)
    bne     $v0, $s1, .L8000436C
    daddu   $v1, $v0, $0
.L800043A8:
    jal     sysRepaint
    nop
    jal     sys_os_80016148
    nop
    andi    $v1, $v0, 0x0008
    beqz    $v1, .L800043D8
    daddu   $v1, $s4, $0
    lw      $a1, 0x0120($sp)
    addiu   $v1, $s4, 0x0100
    sltu    $a0, $v1, $a1
    beqzl   $a0, .L800043D8
    daddu   $v1, $s4, $0
.L800043D8:
    andi    $a0, $v0, 0x0800
    beqzl   $a0, .L800043F0
    andi    $v0, $v0, 0x0002
    bnezl   $v1, .L800043EC
    addiu   $v1, $v1, -0x0100
.L800043EC:
    andi    $v0, $v0, 0x0002
.L800043F0:
    bnez    $v0, .L80004174
    daddu   $s4, $v1, $0
    j       .L80004208
    sltu    $v0, $s4, $s5
    addiu   $sp, $sp, -0x0070
    sd      $s0, 0x0048($sp)
    addiu   $s0, $sp, 0x0030
    sd      $s1, 0x0050($sp)
    daddu   $a1, $0, $0
    daddu   $s1, $a0, $0
    li      $a2, 0x0018
    sd      $s3, 0x0060($sp)
    sd      $s2, 0x0058($sp)
    sd      $ra, 0x0068($sp)
    jal     os_80014778
    daddu   $a0, $s0, $0
    lui     $v0, %hi(__str_8004EF60)
    addiu   $v0, %lo(__str_8004EF60)
    sw      $v0, 0x0030($sp)
    addiu   $v0, $sp, 0x0020
    sw      $v0, 0x0034($sp)
    li      $v0, 0x0001
    sb      $v0, 0x003D($sp)
    lui     $v0, %hi(__str_8004EF70)
    addiu   $v0, %lo(__str_8004EF70)
    sw      $v0, 0x0020($sp)
    lui     $v0, %hi(__str_8004EF88)
    addiu   $v0, %lo(__str_8004EF88)
    sw      $v0, 0x0024($sp)
    lui     $v0, %hi(__str_8004EF98)
    addiu   $v0, %lo(__str_8004EF98)
    sw      $v0, 0x0028($sp)
    sw      $0, 0x002C($sp)
    li      $s2, 0x00FF
    li      $s3, 0x0002
    nop
.L80004480:
    jal     os_80014128
    daddu   $a0, $s0, $0
    lbu     $v0, 0x003C($sp)
    sb      $0, 0x003D($sp)
    beq     $v0, $s2, .L800044D0
    sltiu   $v1, $v0, 0x0002
    bnez    $v1, .L800044F0
    daddu   $a0, $s1, $0
    bne     $v0, $s3, .L80004480
    nop
    jal     os_80004138
    daddu   $a0, $s1, $0
.L800044B0:
    ld      $ra, 0x0068($sp)
.L800044B4:
    ld      $s3, 0x0060($sp)
    ld      $s2, 0x0058($sp)
    ld      $s1, 0x0050($sp)
    ld      $s0, 0x0048($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0070
    nop
.L800044D0:
    ld      $ra, 0x0068($sp)
    daddu   $v0, $0, $0
    ld      $s3, 0x0060($sp)
    ld      $s2, 0x0058($sp)
    ld      $s1, 0x0050($sp)
    ld      $s0, 0x0048($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0070
.L800044F0:
    jal     os_80007DE8
    li      $a1, 0x0001
    bnez    $v0, .L800044B0
    lbu     $v1, 0x003C($sp)
    bnezl   $v1, .L800044B4
    ld      $ra, 0x0068($sp)
    jal     os_80007A28
    nop
    j       .L800044B4
    ld      $ra, 0x0068($sp)

.globl os_80004518
os_80004518:
    addiu   $sp, $sp, -0x0070
    sd      $s1, 0x0058($sp)
    daddu   $s1, $a0, $0
    sd      $ra, 0x0068($sp)
    sd      $s0, 0x0050($sp)
    jal     os_80013370
    sd      $s2, 0x0060($sp)
    daddu   $a0, $s1, $0
    jal     os_800075B8
    addiu   $a1, $sp, 0x0028
    beqz    $v0, .L80004568
    daddu   $s0, $v0, $0
    ld      $ra, 0x0068($sp)
    daddu   $v0, $s0, $0
    ld      $s2, 0x0060($sp)
    ld      $s1, 0x0058($sp)
    ld      $s0, 0x0050($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0070
    nop
.L80004568:
    lui     $a0, %hi(__str_8004EFA8)
    li      $a1, 0x0008
    li      $a2, 0x0018
    jal     os_80013668
    addiu   $a0, %lo(__str_8004EFA8)
    daddu   $s2, $v0, $0
    lhu     $v0, 0x0030($sp)
    sb      $0, 0x0022($sp)
    srl     $v1, $v0, 8
    sb      $v1, 0x0020($sp)
    sb      $v0, 0x0021($sp)
    lw      $v0, 0x0004($s2)
    jal     os_800150C8
    lw      $a0, 0x0000($v0)
    lui     $a0, %hi(__str_8004EFB8)
    jal     os_800150F8
    addiu   $a0, %lo(__str_8004EFB8)
    jal     os_800150F8
    addiu   $a0, $sp, 0x0020
    lw      $v0, 0x0004($s2)
    jal     os_800150C8
    lw      $a0, 0x0004($v0)
    lui     $a0, %hi(__str_8004EFC8)
    jal     os_800150F8
    addiu   $a0, %lo(__str_8004EFC8)
    lhu     $v1, 0x0032($sp)
    lui     $v0, %hi(_8004CA60)
    sll     $v1, $v1, 2
    addiu   $v0, %lo(_8004CA60)
    addu    $v0, $v1, $v0
    jal     os_800150F8
    lw      $a0, 0x0000($v0)
    lw      $v0, 0x0004($s2)
    jal     os_800150C8
    lw      $a0, 0x0008($v0)
    lui     $a0, %hi(__str_8004EFD8)
    jal     os_800150F8
    addiu   $a0, %lo(__str_8004EFD8)
    lhu     $v1, 0x0034($sp)
    lui     $v0, %hi(_8004CA50)
    sll     $v1, $v1, 2
    addiu   $v0, %lo(_8004CA50)
    addu    $v0, $v1, $v0
    jal     os_800150F8
    lw      $a0, 0x0000($v0)
    lw      $v0, 0x0004($s2)
    jal     os_800150C8
    lw      $a0, 0x000C($v0)
    lui     $a0, %hi(__str_8004EFE8)
    jal     os_800150F8
    addiu   $a0, %lo(__str_8004EFE8)
    lhu     $v1, 0x0036($sp)
    lui     $v0, %hi(_8004CA30)
    sll     $v1, $v1, 2
    addiu   $v0, %lo(_8004CA30)
    addu    $v0, $v1, $v0
    jal     os_800150F8
    lw      $a0, 0x0000($v0)
    lw      $v0, 0x0004($s2)
    jal     os_800150C8
    lw      $a0, 0x0010($v0)
    lui     $a0, %hi(__str_8004EFF8)
    jal     os_800150F8
    addiu   $a0, %lo(__str_8004EFF8)
    lhu     $v1, 0x0038($sp)
    lui     $v0, %hi(_8004CA28)
    sll     $v1, $v1, 2
    addiu   $v0, %lo(_8004CA28)
    addu    $v0, $v1, $v0
    jal     os_800150F8
    lw      $a0, 0x0000($v0)
    lw      $v0, 0x0004($s2)
    jal     os_800150C8
    lw      $a0, 0x0014($v0)
    lui     $a0, %hi(__str_8004F008)
    jal     os_800150F8
    addiu   $a0, %lo(__str_8004F008)
    jal     os_80015280
    lw      $a0, 0x0040($sp)
    lw      $v0, 0x0004($s2)
    jal     os_800150C8
    lw      $a0, 0x0018($v0)
    lui     $a0, %hi(__str_8004F018)
    jal     os_800150F8
    addiu   $a0, %lo(__str_8004F018)
    jal     os_80015280
    lw      $a0, 0x0044($sp)
    lw      $v0, 0x0004($s2)
    jal     os_800150C8
    lw      $a0, 0x001C($v0)
    lui     $a0, %hi(__str_8004F028)
    jal     os_800150F8
    addiu   $a0, %lo(__str_8004F028)
    lw      $a0, 0x000C($s1)
    li      $v0, 0x00100000
    sltu    $v0, $a0, $v0
    bnez    $v0, .L80004730
    nop
    jal     os_80015138
    srl     $a0, $a0, 20
    lui     $a0, %hi(__str_8004F040)
    jal     os_800150F8
    addiu   $a0, %lo(__str_8004F040)
.L80004704:
    jal     os_80014128
    daddu   $a0, $s2, $0
    jal     os_800145E0
    lhu     $a0, 0x0016($s2)
    ld      $ra, 0x0068($sp)
    daddu   $v0, $s0, $0
    ld      $s2, 0x0060($sp)
    ld      $s1, 0x0058($sp)
    ld      $s0, 0x0050($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0070
.L80004730:
    jal     os_80015138
    srl     $a0, $a0, 10
    lui     $a0, %hi(__str_8004F038)
    jal     os_800150F8
    addiu   $a0, %lo(__str_8004F038)
    j       .L80004704
    nop
    nop

.globl os_80004750
os_80004750:
    addiu   $sp, $sp, -0x0098
    sd      $s1, 0x0068($sp)
    daddu   $s1, $a0, $0
    lui     $a0, %hi(_80051E38)
    sd      $s0, 0x0060($sp)
    addiu   $a0, %lo(_80051E38)
    addiu   $a1, $s1, 0x0018
    addiu   $s0, $sp, 0x0028
    sd      $ra, 0x0090($sp)
    sd      $s2, 0x0070($sp)
    sd      $s5, 0x0088($sp)
    sd      $s4, 0x0080($sp)
    sd      $s3, 0x0078($sp)
    jal     os_80014FE0
    addiu   $s2, $sp, 0x0020
    daddu   $a0, $s0, $0
    daddu   $a1, $0, $0
    li      $a2, 0x0018
    jal     os_80014778
    sd      $v0, 0x0058($sp)
    daddu   $a0, $s2, $0
    daddu   $a1, $0, $0
    jal     os_80014778
    li      $a2, 0x0005
    ld      $v0, 0x0058($sp)
    beqz    $v0, .L800047CC
    lui     $v0, %hi(__str_8004EF60)
    li      $v0, -0x0080
    sb      $v0, 0x0023($sp)
    sb      $v0, 0x0022($sp)
    li      $v0, 0x80050000
.L800047CC:
    addiu   $v0, %lo(__str_8004EF60)
    sw      $v0, 0x0028($sp)
    addiu   $v0, $sp, 0x0040
    sw      $v0, 0x002C($sp)
    li      $v0, 0x0001
    sb      $v0, 0x0035($sp)
    lui     $v0, %hi(__str_8004EF70)
    addiu   $v0, %lo(__str_8004EF70)
    sw      $v0, 0x0040($sp)
    lui     $v0, %hi(__str_8004EF88)
    addiu   $v0, %lo(__str_8004EF88)
    sw      $v0, 0x0044($sp)
    lui     $v0, %hi(__str_8004F048)
    addiu   $v0, %lo(__str_8004F048)
    sw      $v0, 0x0048($sp)
    lui     $v0, %hi(__str_8004F050)
    addiu   $v0, %lo(__str_8004F050)
    sw      $v0, 0x004C($sp)
    lui     $v0, %hi(__str_8004EF98)
    addiu   $v0, %lo(__str_8004EF98)
    sw      $s2, 0x0030($sp)
    sw      $v0, 0x0050($sp)
    sw      $0, 0x0054($sp)
    li      $s2, 0x00FF
    li      $s3, 0x0002
    li      $s4, 0x0003
    li      $s5, 0x0004
.L80004838:
    jal     os_80014128
    daddu   $a0, $s0, $0
    lbu     $v0, 0x0034($sp)
    sb      $0, 0x0035($sp)
    beq     $v0, $s2, .L800048A0
    sltiu   $v1, $v0, 0x0002
    bnezl   $v1, .L800048A8
    daddu   $a0, $s1, $0
    beq     $v0, $s3, .L800048D0
    nop
    beq     $v0, $s4, .L800048E0
    nop
    bne     $v0, $s5, .L80004838
    nop
    jal     os_80004138
    daddu   $a0, $s1, $0
.L80004878:
    ld      $ra, 0x0090($sp)
.L8000487C:
    ld      $s5, 0x0088($sp)
    ld      $s4, 0x0080($sp)
    ld      $s3, 0x0078($sp)
    ld      $s2, 0x0070($sp)
    ld      $s1, 0x0068($sp)
    ld      $s0, 0x0060($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0098
    nop
.L800048A0:
    j       .L80004878
    daddu   $v0, $0, $0
.L800048A8:
    jal     os_80007DE8
    li      $a1, 0x0001
    bnez    $v0, .L80004878
    lbu     $v1, 0x0034($sp)
    bnezl   $v1, .L8000487C
    ld      $ra, 0x0090($sp)
    jal     os_80007A28
    nop
    j       .L8000487C
    ld      $ra, 0x0090($sp)
.L800048D0:
    jal     os_80003538
    daddu   $a0, $s1, $0
    j       .L8000487C
    ld      $ra, 0x0090($sp)
.L800048E0:
    jal     os_80004518
    daddu   $a0, $s1, $0
    j       .L8000487C
    ld      $ra, 0x0090($sp)

.globl os_800048F0
os_800048F0:
    addiu   $sp, $sp, -0x0068
    sd      $s0, 0x0050($sp)
    addiu   $s0, $sp, 0x0038
    sd      $s1, 0x0058($sp)
    daddu   $a1, $0, $0
    li      $a2, 0x0018
    daddu   $s1, $a0, $0
    sd      $ra, 0x0060($sp)
    jal     os_80014778
    daddu   $a0, $s0, $0
    lui     $v0, %hi(__str_8004F060)
    addiu   $v0, %lo(__str_8004F060)
    sw      $v0, 0x0038($sp)
    addiu   $v0, $sp, 0x0020
    sw      $v0, 0x003C($sp)
    li      $v0, 0x0001
    sb      $v0, 0x0045($sp)
    lui     $v0, %hi(__str_8004F070)
    addiu   $v0, %lo(__str_8004F070)
    sw      $v0, 0x0020($sp)
    lui     $v0, %hi(__str_8004F078)
    addiu   $v0, %lo(__str_8004F078)
    sw      $v0, 0x0024($sp)
    lui     $v0, %hi(__str_8004F090)
    addiu   $v0, %lo(__str_8004F090)
    sw      $v0, 0x0028($sp)
    lui     $v0, %hi(__str_8004EF98)
    addiu   $v0, %lo(__str_8004EF98)
    daddu   $a0, $s0, $0
    sw      $v0, 0x002C($sp)
    jal     os_80014128
    sw      $0, 0x0030($sp)
    lbu     $v0, 0x0044($sp)
    addiu   $v1, $v0, -0x0001
    andi    $v1, $v1, 0x00FF
    sltiu   $v1, $v1, 0x00FE
    beqz    $v1, .L800049A0
    li      $v1, 0x0001
    beq     $v0, $v1, .L80004A10
    li      $v1, 0x0002
    beq     $v0, $v1, .L800049B8
    li      $v1, 0x0003
    beq     $v0, $v1, .L80004A00
    nop
.L800049A0:
    daddu   $v0, $0, $0
    ld      $ra, 0x0060($sp)
.L800049A8:
    ld      $s1, 0x0058($sp)
    ld      $s0, 0x0050($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0068
.L800049B8:
    lw      $v1, 0x000C($s1)
    li      $v0, 0x8001
    sltu    $v0, $v1, $v0
    bnez    $v0, .L800049E4
    nop
    jal     os_80013370
    nop
    lui     $a0, %hi(__str_8004F0A8)
    addiu   $a0, %lo(__str_8004F0A8)
    jal     os_800145A0
    li      $a1, 0x0002
.L800049E4:
    jal     os_80008B48
    daddu   $a0, $s1, $0
    ld      $ra, 0x0060($sp)
    ld      $s1, 0x0058($sp)
    ld      $s0, 0x0050($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0068
.L80004A00:
    jal     os_80004138
    daddu   $a0, $s1, $0
    j       .L800049A8
    ld      $ra, 0x0060($sp)
.L80004A10:
    jal     os_80008A60
    daddu   $a0, $s1, $0
    j       .L800049A8
    ld      $ra, 0x0060($sp)

.globl os_80004A20
os_80004A20:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    daddu   $s0, $a0, $0
    lui     $a0, %hi(_80051B48)
    addiu   $a0, %lo(_80051B48)
    sd      $ra, 0x0028($sp)
    jal     os_80013B50
    daddu   $a1, $0, $0
    bnez    $v0, .L80004A58
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
    nop
.L80004A58:
    daddu   $a0, $s0, $0
    ld      $s0, 0x0020($sp)
    j       .L80000910
    addiu   $sp, $sp, 0x0030

.globl os_80004A68
os_80004A68:
    addiu   $sp, $sp, -0x0068
    sd      $s1, 0x0058($sp)
    addiu   $s1, $sp, 0x0030
    sd      $s0, 0x0050($sp)
    daddu   $a1, $0, $0
    li      $a2, 0x0018
    daddu   $s0, $a0, $0
    sd      $ra, 0x0060($sp)
    jal     os_80014778
    daddu   $a0, $s1, $0
    addiu   $v0, $sp, 0x0020
    sw      $v0, 0x0034($sp)
    lui     $v0, %hi(__str_8004F0B8)
    addiu   $v0, %lo(__str_8004F0B8)
    sw      $v0, 0x0030($sp)
    li      $v0, 0x0001
    sb      $v0, 0x003D($sp)
    lui     $v0, %hi(__str_8004F0D0)
    addiu   $v0, %lo(__str_8004F0D0)
    sw      $v0, 0x0020($sp)
    lui     $v0, %hi(__str_8004F0E0)
    addiu   $v0, %lo(__str_8004F0E0)
    sw      $v0, 0x0024($sp)
    lui     $v0, %hi(__str_8004EF98)
    addiu   $v0, %lo(__str_8004EF98)
    daddu   $a0, $s1, $0
    sw      $v0, 0x0028($sp)
    jal     os_80014128
    sw      $0, 0x002C($sp)
    lbu     $v0, 0x003C($sp)
    li      $s1, 0x00FF
    beql    $v0, $s1, .L80004B08
    daddu   $v0, $0, $0
    beqz    $v0, .L80004B20
    li      $v1, 0x0001
    beq     $v0, $v1, .L80004B78
    li      $v1, 0x0002
    beq     $v0, $v1, .L80004B68
    nop
.L80004B04:
    daddu   $v0, $0, $0
.L80004B08:
    ld      $ra, 0x0060($sp)
.L80004B0C:
    ld      $s1, 0x0058($sp)
    ld      $s0, 0x0050($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0068
    nop
.L80004B20:
    jal     os_80003A50
    nop
    beq     $v0, $s1, .L80004B04
    lui     $a0, %hi(__str_8004EA30)
    addiu   $a0, %lo(__str_8004EA30)
    li      $a1, 0x0002
    jal     os_800145A0
    sd      $v0, 0x0048($sp)
    ld      $v0, 0x0048($sp)
    daddu   $a0, $s0, $0
    jal     os_80003798
    daddu   $a1, $v0, $0
    ld      $ra, 0x0060($sp)
    ld      $s1, 0x0058($sp)
    ld      $s0, 0x0050($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0068
    nop
.L80004B68:
    jal     os_80004138
    daddu   $a0, $s0, $0
    j       .L80004B0C
    ld      $ra, 0x0060($sp)
.L80004B78:
    jal     os_80003A50
    nop
    beq     $v0, $s1, .L80004B04
    lui     $a0, %hi(__str_8004EA30)
    addiu   $a0, %lo(__str_8004EA30)
    li      $a1, 0x0002
    jal     os_800145A0
    sd      $v0, 0x0048($sp)
    ld      $v0, 0x0048($sp)
    daddu   $a0, $s0, $0
    jal     os_800036B0
    daddu   $a1, $v0, $0
    j       .L80004B0C
    ld      $ra, 0x0060($sp)

.globl os_80004BB0
os_80004BB0:
    addiu   $sp, $sp, -0x00C0
    lui     $t6, %hi(_8004CAE8)
    lui     $t5, %hi(_8004CAC0)
    lui     $a1, %hi(_8004CA80)
    lui     $t3, %hi(_8004CAB0)
    lui     $t1, %hi(_8004CAA0)
    lui     $a3, %hi(_8004CA90)
    addiu   $v1, $t5, %lo(_8004CAC0)
    sd      $s1, 0x00A8($sp)
    addiu   $t2, $t3, %lo(_8004CAB0)
    daddu   $s1, $a0, $0
    addiu   $t0, $t1, %lo(_8004CAA0)
    addiu   $a0, $t6, %lo(_8004CAE8)
    addiu   $a2, $a3, %lo(_8004CA90)
    addiu   $v0, $a1, %lo(_8004CA80)
    lw      $t9, 0x0010($a0)
    lw      $t4, 0x0020($v1)
    ld      $t8, %lo(_8004CAC0)($t5)
    ld      $t7, 0x0008($v1)
    ld      $t5, 0x0018($v1)
    sd      $ra, 0x00B8($sp)
    sd      $s2, 0x00B0($sp)
    ld      $ra, 0x0008($a0)
    ld      $s2, %lo(_8004CAE8)($t6)
    sd      $s0, 0x00A0($sp)
    ld      $t6, 0x0010($v1)
    ld      $t2, 0x0008($t2)
    ld      $v1, %lo(_8004CA80)($a1)
    ld      $t0, 0x0008($t0)
    lw      $v0, 0x0008($v0)
    ld      $t3, %lo(_8004CAB0)($t3)
    ld      $t1, %lo(_8004CAA0)($t1)
    ld      $a3, %lo(_8004CA90)($a3)
    lw      $a2, 0x0008($a2)
    addiu   $s0, $s1, 0x0018
    addiu   $a0, $sp, 0x0078
    daddu   $a1, $s0, $0
    sd      $s2, 0x0060($sp)
    sd      $ra, 0x0068($sp)
    sw      $t9, 0x0070($sp)
    sd      $t8, 0x0078($sp)
    sd      $t7, 0x0080($sp)
    sd      $t6, 0x0088($sp)
    sd      $t5, 0x0090($sp)
    sw      $t4, 0x0098($sp)
    sd      $t3, 0x0040($sp)
    sd      $t2, 0x0048($sp)
    sd      $t1, 0x0050($sp)
    sd      $t0, 0x0058($sp)
    sd      $a3, 0x0020($sp)
    sw      $a2, 0x0028($sp)
    sd      $v1, 0x0030($sp)
    jal     os_80014FE0
    sw      $v0, 0x0038($sp)
    bnez    $v0, .L80004CE0
    lui     $a0, %hi(__str_8004EA98)
    addiu   $a0, %lo(__str_8004EA98)
    jal     os_80014F98
    daddu   $a1, $s0, $0
    beqz    $v0, .L80004D00
    lui     $v0, %hi(_80052908)
    lw      $v0, %lo(_80052908)($v0)
    lhu     $v1, 0x006A($v0)
    bnezl   $v1, .L80004CC4
    daddu   $v0, $0, $0
    lbu     $v0, 0x0094($v0)
    bnez    $v0, .L80004D68
    nop
    daddu   $v0, $0, $0
.L80004CC4:
    ld      $ra, 0x00B8($sp)
.L80004CC8:
    ld      $s2, 0x00B0($sp)
    ld      $s1, 0x00A8($sp)
    ld      $s0, 0x00A0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00C0
    nop
.L80004CE0:
    jal     os_80004750
    daddu   $a0, $s1, $0
    ld      $ra, 0x00B8($sp)
    ld      $s2, 0x00B0($sp)
    ld      $s1, 0x00A8($sp)
    ld      $s0, 0x00A0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00C0
.L80004D00:
    addiu   $a0, $sp, 0x0060
    jal     os_80014FE0
    daddu   $a1, $s0, $0
    bnez    $v0, .L80004D78
    addiu   $a0, $sp, 0x0050
    jal     os_80014FE0
    daddu   $a1, $s0, $0
    bnez    $v0, .L80004DA0
    addiu   $a0, $sp, 0x0020
    jal     os_80014FE0
    daddu   $a1, $s0, $0
    bnez    $v0, .L80004D90
    addiu   $a0, $sp, 0x0030
    jal     os_80014FE0
    daddu   $a1, $s0, $0
    beqz    $v0, .L80004DB0
    lui     $v0, %hi(_80052908)
    lw      $v0, %lo(_80052908)($v0)
    lbu     $v0, 0x0094($v0)
    beqzl   $v0, .L80004CC4
    daddu   $v0, $0, $0
    jal     os_80004018
    daddu   $a0, $s1, $0
    j       .L80004CC8
    ld      $ra, 0x00B8($sp)
    nop
.L80004D68:
    jal     os_800035F8
    daddu   $a0, $s1, $0
    j       .L80004CC8
    ld      $ra, 0x00B8($sp)
.L80004D78:
    addiu   $a0, $sp, 0x0040
    jal     os_80014468
    daddu   $a1, $0, $0
    j       .L80004CC4
    daddu   $v0, $0, $0
    nop
.L80004D90:
    jal     os_80004A20
    daddu   $a0, $s1, $0
    j       .L80004CC8
    ld      $ra, 0x00B8($sp)
.L80004DA0:
    jal     os_800048F0
    daddu   $a0, $s1, $0
    j       .L80004CC8
    ld      $ra, 0x00B8($sp)
.L80004DB0:
    lui     $a0, %hi(__str_8004EB78)
    addiu   $a0, %lo(__str_8004EB78)
    jal     os_80014F98
    daddu   $a1, $s0, $0
    beqzl   $v0, .L80004CC4
    daddu   $v0, $0, $0
    jal     os_80004A68
    daddu   $a0, $s1, $0
    j       .L80004CC8
    ld      $ra, 0x00B8($sp)

.globl os_80004DD8
os_80004DD8:
    addiu   $sp, $sp, -0x02A8
    sd      $ra, 0x02A0($sp)
    sd      $s8, 0x0298($sp)
    sd      $s7, 0x0290($sp)
    sd      $s6, 0x0288($sp)
    sd      $s5, 0x0280($sp)
    sd      $s4, 0x0278($sp)
    sd      $s3, 0x0270($sp)
    daddu   $s8, $sp, $0
    daddu   $v0, $a0, $0
    sw      $a1, 0x02B0($s8)
    sb      $v0, 0x02A8($s8)
    addiu   $v0, $s8, 0x0040
    sw      $v0, 0x0038($s8)
    addiu   $v0, $s8, 0x0158
    sw      $v0, 0x003C($s8)
    lbu     $v1, 0x02A8($s8)
    li      $v0, 0x0002
    beq     $v1, $v0, .L80004E44
    nop
    lui     $v0, %hi(_8007BDA8)
    addiu   $v0, %lo(_8007BDA8)
    lbu     $v0, 0x0033($v0)
    bnez    $v0, .L80004E44
    nop
    li      $v0, 0x0002
    sb      $v0, 0x02A8($s8)
.L80004E44:
    lbu     $v0, 0x02A8($s8)
    sb      $v0, 0x00D4($gp)
    sh      $0, 0x00D6($gp)
    lbu     $v1, 0x00D4($gp)
    li      $v0, 0x0005
    bne     $v1, $v0, .L80004E74
    nop
    lui     $v0, 0x800003F0 >> 16
    ori     $v0, 0x800003F0 & 0xFFFF
    lw      $v1, -0x0A20($gp)
    lw      $v1, 0x0018($v1)
    sw      $v1, 0x0000($v0)
.L80004E74:
    lw      $v0, 0x02B0($s8)
    beqz    $v0, .L80004ED0
    nop
    j       .L80004EC0
    sw      $0, 0x0034($s8)
.L80004E88:
    lw      $v0, 0x0034($s8)
    sll     $v0, $v0, 4
    sll     $v1, $v0, 2
    subu    $v0, $v1, $v0
    lw      $v1, 0x02B0($s8)
    addu    $v0, $v1, $v0
    lhu     $v0, 0x0006($v0)
    beqz    $v0, .L80004EB4
    nop
    li      $v0, 0x0001
    sh      $v0, 0x00D6($gp)
.L80004EB4:
    lw      $v0, 0x0034($s8)
    addiu   $v0, $v0, 0x0001
    sw      $v0, 0x0034($s8)
.L80004EC0:
    lw      $v0, 0x0034($s8)
    slti    $v0, $v0, 0x0022
    bnez    $v0, .L80004E88
    nop
.L80004ED0:
    lhu     $v0, 0x00D6($gp)
    beqz    $v0, .L8000506C
    nop
    addiu   $v0, $s8, 0x0038
    daddu   $a0, $v0, $0
    jal     os_8000544C
    lw      $a1, 0x02B0($s8)
    li      $v0, 0x80700000
    sw      $v0, 0x0030($s8)
    lui     $v0, %hi(_80005424)
    addiu   $v1, $v0, %lo(_80005424)
    lui     $v0, %hi(_80005160)
    addiu   $v0, %lo(_80005160)
    subu    $v0, $v1, $v0
    sw      $v0, 0x002C($s8)
    lw      $a0, 0x0030($s8)
    lui     $v0, %hi(_80005160)
    addiu   $a1, $v0, %lo(_80005160)
    jal     memcpy
    lw      $a2, 0x002C($s8)
    lw      $v1, 0x0030($s8)
    lw      $v0, 0x002C($s8)
    addu    $v0, $v1, $v0
    sw      $v0, 0x0028($s8)
    lui     $v0, 0xA06FFFFC >> 16
    ori     $v0, 0xA06FFFFC & 0xFFFF
    lw      $v1, 0x0028($s8)
    sw      $v1, 0x0000($v0)
    j       .L80005044
    sw      $0, 0x0024($s8)
.L80004F48:
    li      $v0, -0x0002
    sw      $v0, 0x0020($s8)
.L80004F50:
    lw      $v0, 0x0020($s8)
    addiu   $v0, $v0, 0x0002
    sw      $v0, 0x0020($s8)
    lw      $v0, 0x002C($s8)
    addiu   $v0, $v0, 0x0008
    sw      $v0, 0x002C($s8)
    lw      $v0, 0x0024($s8)
    sll     $v0, $v0, 2
    addiu   $v1, $s8, 0x0020
    addu    $v0, $v1, $v0
    lw      $v1, 0x0018($v0)
    lw      $v0, 0x0020($s8)
    sll     $v0, $v0, 2
    addu    $v0, $v1, $v0
    lw      $v1, 0x0000($v0)
    lw      $v0, 0x0028($s8)
    sw      $v1, 0x0000($v0)
    lw      $v0, 0x0028($s8)
    addiu   $v0, $v0, 0x0004
    sw      $v0, 0x0028($s8)
    lw      $v0, 0x0024($s8)
    sll     $v0, $v0, 2
    addiu   $v1, $s8, 0x0020
    addu    $v0, $v1, $v0
    lw      $v1, 0x0018($v0)
    lw      $v0, 0x0020($s8)
    addiu   $v0, $v0, 0x0001
    sll     $v0, $v0, 2
    addu    $v0, $v1, $v0
    lw      $v1, 0x0000($v0)
    lw      $v0, 0x0028($s8)
    sw      $v1, 0x0000($v0)
    lw      $v0, 0x0028($s8)
    addiu   $v0, $v0, 0x0004
    sw      $v0, 0x0028($s8)
    lw      $v0, 0x0024($s8)
    sll     $v0, $v0, 2
    addiu   $v1, $s8, 0x0020
    addu    $v0, $v1, $v0
    lw      $v1, 0x0018($v0)
    lw      $v0, 0x0020($s8)
    sll     $v0, $v0, 2
    addu    $v0, $v1, $v0
    lw      $v0, 0x0000($v0)
    bnez    $v0, .L80004F50
    nop
    lw      $v0, 0x0024($s8)
    sll     $v0, $v0, 2
    addiu   $v1, $s8, 0x0020
    addu    $v0, $v1, $v0
    lw      $v1, 0x0018($v0)
    lw      $v0, 0x0020($s8)
    addiu   $v0, $v0, 0x0001
    sll     $v0, $v0, 2
    addu    $v0, $v1, $v0
    lw      $v0, 0x0000($v0)
    bnez    $v0, .L80004F50
    nop
    lw      $v0, 0x0024($s8)
    addiu   $v0, $v0, 0x0001
    sw      $v0, 0x0024($s8)
.L80005044:
    lw      $v0, 0x0024($s8)
    slti    $v0, $v0, 0x0002
    bnez    $v0, .L80004F48
    nop
    lw      $a0, 0x0030($s8)
    jal     data_cache_hit_writeback
    lw      $a1, 0x002C($s8)
    lw      $a0, 0x0030($s8)
    jal     inst_cache_hit_invalidate
    lw      $a1, 0x002C($s8)
.L8000506C:
    lbu     $v0, 0x00D4($gp)
    lhu     $v1, 0x00D6($gp)
    lui     $t0, %hi(0x80000314)
    daddu   $s3, $0, $0
    lw      $s4, %lo(0x80000300)($t0)
    daddu   $s5, $0, $0
    lui     $s6, %hi(_80005130)
    addu    $s6, $s6, $v0
    lbu     $s6, %lo(_80005130)($s6)
    lw      $s7, %lo(0x80000314)($t0)
    lui     $a0, %hi(0xA4000004)
    lui     $a1, %hi(0x80000004)
    ori     $a2, $0, 0x0008
.L800050A0:
    lw      $t0, %lo(_80005140)($a1)
    addiu   $a1, %lo(0x80000004)
    sw      $t0, %lo(0xA4001000)($a0)
    addiu   $a2, $a2, -0x0001
    bnez    $a2, .L800050A0
    addiu   $a0, %lo(0xA4000004)
    lui     $t3, 0xA4000040 >> 16
    ori     $t3, 0xA4000040 & 0xFFFF
    daddu   $a0, $t3, $0
    lui     $a1, %hi(0xB0000004)
    ori     $a2, $a2, 0x0FC0
.L800050CC:
    lw      $t0, %lo(0xB0000040)($a1)
    addiu   $a1, %lo(0xB0000004)
    sw      $t0, 0x0000($a0)
    addiu   $a2, $a2, -0x0004
    bnez    $a2, .L800050CC
    addiu   $a0, $a0, 0x0004
    beqz    $v1, .L80005120
    lui     $a1, %hi(_80005138)
    addu    $a1, $a1, $v0
    lbu     $a1, %lo(_80005138)($a1)
    addu    $a0, $t3, $a1
    li      $a1, 0x081C0000
    ori     $a2, $0, 0x0006
    bne     $v0, $a2, .L80005110
    lui     $a2, 0x8188764A >> 16
    ori     $a2, 0x8188764A & 0xFFFF
    xor     $a1, $a1, $a2
.L80005110:
    sw      $a1, 0x0700($a0)
    ori     $a2, $0, 0x0005
    beql    $v0, $a2, .L80005120
    sw      $0, 0x06CC($a0)
.L80005120:
    lui     $sp, 0xA4001FF0 >> 16
    ori     $ra, $sp, 0x1550
    jr      $t3
    ori     $sp, 0xA4001FF0 & 0xFFFF

_80005130:
    .byte 0x00, 0x3F, 0x3F, 0x78, 0xAC, 0x91, 0x85, 0xDD

_80005138:
    .byte 0x00, 0x30, 0x2C, 0x20, 0x30, 0x8C, 0x60, 0x30

_80005140:
    lui     $t5, %hi(0xBFC007C0)
.L80005144:
    lw      $t0, %lo(0xBFC007FC)($t5)
    addiu   $t5, %lo(0xBFC007C0)
    andi    $t0, $t0, 0x0080
    bnezl   $t0, .L80005144
    lui     $t5, %hi(0xBFC00024)
    lw      $t0, %lo(0xBFC00024)($t5)
    li      $t3, 0xB0000000

_80005160:
    lui     $t5, %hi(0x806FFFFC)
    lui     $t6, %hi(0x80000188)
    lui     $t7, 0x007FFFFF >> 16
    ori     $t7, 0x007FFFFF & 0xFFFF
    lui     $t8, 0x807C5C00 >> 16
    ori     $t8, 0x807C5C00 & 0xFFFF
    addiu   $t9, $t5, %lo(0x806FFFFC)
    lw      $t9, 0x0000($t9)
.L80005180:
    lw      $v0, 0x0000($t9)
    bnez    $v0, .L80005190
    lw      $v1, 0x0004($t9)
    beqz    $v1, .L800051E8
.L80005190:
    addiu   $t9, $t9, 0x0008
    srl     $t2, $v0, 24
    li      $at, 0x00EE
    beq     $t2, $at, .L800051D8
    li      $at, 0x00F0
    and     $v0, $v0, $t7
    beq     $t2, $at, .L800051D0
    or      $v0, $v0, $t6
    li      $at, 0x00F1
    beq     $t2, $at, .L800051C8
    nop
    li      $at, -0x0004
    b       .L80005180
    and     $t8, $v0, $at
.L800051C8:
    b       .L80005180
    sh      $v1, 0x0000($v0)
.L800051D0:
    b       .L80005180
    sb      $v1, 0x0000($v0)
.L800051D8:
    li      $v0, 0x00400000
    sw      $v0, %lo(0x80000318)($t6)
    b       .L80005180
    sw      $v0, %lo(0x800003F0)($t6)
.L800051E8:
    srl     $at, $t8, 2
    and     $v0, $at, $t7
    li      $at, 0x08000000
    or      $v0, $v0, $at
    sw      $v0, %lo(0x80000180)($t6)
    sw      $0, %lo(0x80000184)($t6)
    sw      $t8, %lo(0x80000188)($t6)
    lui     $at, 0x00005160 >> 16
    ori     $at, 0x00005160 & 0xFFFF
    lui     $v0, 0x000052B8 >> 16
    ori     $v0, 0x000052B8 & 0xFFFF
    lui     $v1, 0x00005424 >> 16
    ori     $v1, 0x00005424 & 0xFFFF
    subu    $at, $v0, $at
    subu    $v1, $v1, $v0
    addu    $v0, $t5, $at
.L80005228:
    lw      $at, 0x0000($v0)
    addiu   $v1, $v1, -0x0004
    sw      $at, 0x0000($t8)
    addiu   $v0, $v0, 0x0004
    bgtz    $v1, .L80005228
    addiu   $t8, $t8, 0x0004
    sw      $t8, %lo(0x8000018C)($t6)
.L80005244:
    lw      $v0, 0x0000($t9)
    lw      $v1, 0x0004($t9)
    addiu   $t9, $t9, 0x0008
    sw      $v0, 0x0000($t8)
    sw      $v1, 0x0004($t8)
    bnez    $v0, .L80005244
    addiu   $t8, $t8, 0x0008
    bnez    $v1, .L80005244
    nop
    ori     $t0, $t6, 0x0180
    li      $at, 0x0010
.L80005270:
    cache   0x19, 0x0000($t0)
    cache   0x10, 0x0000($t0)
    addiu   $at, $at, -0x0004
    bnez    $at, .L80005270
    addiu   $t0, $t0, 0x0004
    lw      $t0, %lo(0x80000188)($t6)
    subu    $at, $t8, $t0
.L8000528C:
    cache   0x19, 0x0000($t0)
    cache   0x10, 0x0000($t0)
    addiu   $at, $at, -0x0004
    bnez    $at, .L8000528C
    addiu   $t0, $t0, 0x0004
    li      $t0, 0x0181
    mtc0    $t0, C0_WATCHLO
    nop
    mtc0    $0, C0_WATCHHI
    jr      $t1
    nop
    mfc0    $k0, C0_CAUSE
    andi    $k1, $k0, 0x1000
    bnezl   $k1, .L800052C8
    mtc0    $0, C0_WATCHLO
.L800052C8:
    andi    $k0, $k0, 0x007C
    li      $k1, 0x005C
    bne     $k0, $k1, .L80005320
    mfc0    $k1, C0_EPC
    lw      $k1, 0x0000($k1)
    li      $k0, 0x03E00000
    and     $k1, $k1, $k0
    srl     $k1, $k1, 5
    li      $k0, 0x37400000
    or      $k1, $k1, $k0
    ori     $k1, $k1, 0x0120
    lui     $k0, %hi(0x80000188)
    lw      $k0, %lo(0x80000188)($k0)
    sw      $k1, 0x0060($k0)
    cache   0x19, 0x0060($k0)
    cache   0x10, 0x0060($k0)
    li      $k0, 0x80000000
    nop
    nop
    nop
    nop
    eret
.L80005320:
    lui     $k0, %hi(0x80000188)
    lw      $k0, %lo(0x80000188)($k0)
    addiu   $k0, $k0, -0x0028
    sd      $v1, 0x0000($k0)
    sd      $v0, 0x0008($k0)
    sd      $t9, 0x0010($k0)
    sd      $t8, 0x0018($k0)
    sd      $t7, 0x0020($k0)
    lui     $t9, %hi(0x8000018C)
    lw      $t9, %lo(0x8000018C)($t9)
.L80005348:
    lw      $v0, 0x0000($t9)
    bnez    $v0, .L80005360
    lw      $v1, 0x0004($t9)
    beqz    $v1, .L8000540C
    nop
    b       .L80005348
.L80005360:
    addiu   $t9, $t9, 0x0008
    srl     $t7, $v0, 24
    sltiu   $k1, $t7, 0x00D0
    sltiu   $t8, $t7, 0x00D4
    xor     $k1, $k1, $t8
    li      $t8, 0x0050
    bne     $t7, $t8, .L800053AC
    srl     $t8, $v0, 8
    andi    $t8, $t8, 0x00FF
    andi    $t7, $v0, 0x00FF
    lw      $v0, 0x0000($t9)
    lw      $k1, 0x0004($t9)
    addiu   $t9, $t9, 0x0008
.L80005394:
    sh      $k1, 0x0000($v0)
    addiu   $t8, $t8, -0x0001
    addu    $v0, $v0, $t7
    bnez    $t8, .L80005394
    addu    $k1, $k1, $v1
    b       .L80005348
.L800053AC:
    li      $t7, 0x03000000
    and     $t7, $v0, $t7
    lui     $t8, 0xA07FFFFF >> 16
    ori     $t8, 0xA07FFFFF & 0xFFFF
    and     $v0, $v0, $t8
    li      $t8, 0x80000000
    beqz    $k1, .L800053F8
    or      $v0, $v0, $t8
    sll     $k1, $t7, 7
    beqzl   $k1, .L800053DC
    lbu     $t8, 0x0000($v0)
    lhu     $t8, 0x0000($v0)
.L800053DC:
    srl     $t7, $t7, 22
    andi    $t7, $t7, 0x0008
    beql    $v1, $t8, .L80005348
    add     $t9, $t9, $t7
    xori    $t7, $t7, 0x0008
    b       .L80005348
    add     $t9, $t9, $t7
.L800053F8:
    sll     $k1, $t7, 7
    beqzl   $k1, .L80005408
    sb      $v1, 0x0000($v0)
    sh      $v1, 0x0000($v0)
.L80005408:
    b       .L80005348
.L8000540C:
    ld      $t7, 0x0020($k0)
    ld      $t8, 0x0018($k0)
    ld      $t9, 0x0010($k0)
    ld      $v0, 0x0008($k0)
    j       0x80000120
    ld      $v1, 0x0000($k0)

_80005424:
    daddu   $sp, $s8, $0
    ld      $ra, 0x02A0($sp)
    ld      $s8, 0x0298($sp)
    ld      $s7, 0x0290($sp)
    ld      $s6, 0x0288($sp)
    ld      $s5, 0x0280($sp)
    ld      $s4, 0x0278($sp)
    ld      $s3, 0x0270($sp)
    addiu   $sp, $sp, 0x02A8
    jr      $ra

.globl os_8000544C
os_8000544C:
    addiu   $sp, $sp, -0x0020
    sd      $s8, 0x0018($sp)
    daddu   $s8, $sp, $0
    sw      $a0, 0x0020($s8)
    sw      $a1, 0x0028($s8)
    lw      $v0, 0x0020($s8)
    lw      $v0, 0x0000($v0)
    sw      $v0, 0x0014($s8)
    lw      $v0, 0x0020($s8)
    addiu   $v0, $v0, 0x0004
    lw      $v0, 0x0000($v0)
    sw      $v0, 0x0010($s8)
    sw      $0, 0x000C($s8)
    sh      $0, 0x0000($s8)
    j       .L800054C0
    nop
.L8000548C:
    lhu     $v0, 0x0000($s8)
    sll     $v0, $v0, 2
    lw      $v1, 0x0014($s8)
    addu    $v0, $v1, $v0
    sw      $0, 0x0000($v0)
    lhu     $v0, 0x0000($s8)
    sll     $v0, $v0, 2
    lw      $v1, 0x0010($s8)
    addu    $v0, $v1, $v0
    sw      $0, 0x0000($v0)
    lhu     $v0, 0x0000($s8)
    addiu   $v0, $v0, 0x0001
    sh      $v0, 0x0000($s8)
.L800054C0:
    lhu     $v0, 0x0000($s8)
    sltiu   $v0, $v0, 0x0046
    bnez    $v0, .L8000548C
    nop
    sh      $0, 0x0000($s8)
    j       .L8000574C
    nop
.L800054DC:
    lhu     $v0, 0x0000($s8)
    sll     $v0, $v0, 4
    sll     $v1, $v0, 2
    subu    $v0, $v1, $v0
    lw      $v1, 0x0028($s8)
    addu    $v0, $v1, $v0
    lhu     $v0, 0x0006($v0)
    beqz    $v0, .L80005700
    nop
    lhu     $v0, 0x0000($s8)
    sll     $v0, $v0, 4
    sll     $v1, $v0, 2
    subu    $v0, $v1, $v0
    lw      $v1, 0x0028($s8)
    addu    $v0, $v1, $v0
    lw      $v0, 0x0000($v0)
    sw      $v0, 0x0008($s8)
    lhu     $v0, 0x0000($s8)
    sll     $v0, $v0, 4
    sll     $v1, $v0, 2
    subu    $v0, $v1, $v0
    lw      $v1, 0x0028($s8)
    addu    $v0, $v1, $v0
    lhu     $v0, 0x0004($v0)
    sw      $v0, 0x0004($s8)
    lw      $v0, 0x000C($s8)
    beqz    $v0, .L80005590
    nop
    lw      $v0, 0x000C($s8)
    addiu   $v0, $v0, -0x0001
    sw      $v0, 0x000C($s8)
    lw      $v0, 0x0010($s8)
    lw      $v1, 0x0008($s8)
    sw      $v1, 0x0000($v0)
    lw      $v0, 0x0010($s8)
    addiu   $v0, $v0, 0x0004
    sw      $v0, 0x0010($s8)
    lw      $v0, 0x0010($s8)
    lw      $v1, 0x0004($s8)
    sw      $v1, 0x0000($v0)
    lw      $v0, 0x0010($s8)
    addiu   $v0, $v0, 0x0004
    sw      $v0, 0x0010($s8)
    j       .L80005740
    nop
.L80005590:
    lw      $v0, 0x0008($s8)
    srl     $v0, $v0, 24
    sltiu   $v1, $v0, 0x00D4
    beqz    $v1, .L800055DC
    nop
    sltiu   $v1, $v0, 0x00D0
    beqz    $v1, .L800056A8
    nop
    li      $v1, 0x0050
    beq     $v0, $v1, .L80005658
    nop
    li      $v1, 0x00CC
    beq     $v0, $v1, .L8000570C
    nop
    li      $v1, 0x0020
    beq     $v0, $v1, .L80005718
    nop
    j       .L800056A8
    nop
.L800055DC:
    sltiu   $v1, $v0, 0x00F2
    beqz    $v1, .L80005614
    nop
    sltiu   $v1, $v0, 0x00F0
    beqz    $v1, .L80005620
    nop
    li      $v1, 0x00DE
    beq     $v0, $v1, .L80005724
    nop
    li      $v1, 0x00EE
    beq     $v0, $v1, .L80005620
    nop
    j       .L800056A8
    nop
.L80005614:
    li      $v1, 0x00FF
    bne     $v0, $v1, .L800056A8
    nop
.L80005620:
    lw      $v0, 0x0014($s8)
    lw      $v1, 0x0008($s8)
    sw      $v1, 0x0000($v0)
    lw      $v0, 0x0014($s8)
    addiu   $v0, $v0, 0x0004
    sw      $v0, 0x0014($s8)
    lw      $v0, 0x0014($s8)
    lw      $v1, 0x0004($s8)
    sw      $v1, 0x0000($v0)
    lw      $v0, 0x0014($s8)
    addiu   $v0, $v0, 0x0004
    sw      $v0, 0x0014($s8)
    j       .L80005740
    nop
.L80005658:
    lw      $v0, 0x0008($s8)
    andi    $v0, $v0, 0xFF00
    beqz    $v0, .L80005730
    nop
    li      $v0, 0x0001
    sw      $v0, 0x000C($s8)
    lw      $v0, 0x0010($s8)
    lw      $v1, 0x0008($s8)
    sw      $v1, 0x0000($v0)
    lw      $v0, 0x0010($s8)
    addiu   $v0, $v0, 0x0004
    sw      $v0, 0x0010($s8)
    lw      $v0, 0x0010($s8)
    lw      $v1, 0x0004($s8)
    sw      $v1, 0x0000($v0)
    lw      $v0, 0x0010($s8)
    addiu   $v0, $v0, 0x0004
    sw      $v0, 0x0010($s8)
    j       .L80005740
    nop
.L800056A8:
    lw      $v1, 0x0008($s8)
    lui     $v0, 0x01000001 >> 16
    ori     $v0, 0x01000001 & 0xFFFF
    and     $v1, $v1, $v0
    lui     $v0, 0x01000001 >> 16
    ori     $v0, 0x01000001 & 0xFFFF
    beq     $v1, $v0, .L8000573C
    nop
    lw      $v0, 0x0010($s8)
    lw      $v1, 0x0008($s8)
    sw      $v1, 0x0000($v0)
    lw      $v0, 0x0010($s8)
    addiu   $v0, $v0, 0x0004
    sw      $v0, 0x0010($s8)
    lw      $v0, 0x0010($s8)
    lw      $v1, 0x0004($s8)
    sw      $v1, 0x0000($v0)
    lw      $v0, 0x0010($s8)
    addiu   $v0, $v0, 0x0004
    sw      $v0, 0x0010($s8)
    j       .L80005740
    nop
.L80005700:
    nop
    j       .L80005740
    nop
.L8000570C:
    nop
    j       .L80005740
    nop
.L80005718:
    nop
    j       .L80005740
    nop
.L80005724:
    nop
    j       .L80005740
    nop
.L80005730:
    nop
    j       .L80005740
    nop
.L8000573C:
    nop
.L80005740:
    lhu     $v0, 0x0000($s8)
    addiu   $v0, $v0, 0x0001
    sh      $v0, 0x0000($s8)
.L8000574C:
    lhu     $v0, 0x0000($s8)
    sltiu   $v0, $v0, 0x0022
    bnez    $v0, .L800054DC
    nop
    daddu   $sp, $s8, $0
    ld      $s8, 0x0018($sp)
    addiu   $sp, $sp, 0x0020
    jr      $ra
    nop

.globl os_80005770
os_80005770:
    addiu   $sp, $sp, -0x0108
    lui     $t1, %hi(__float_80051488)
    lui     $t0, %hi(__float_8005148C)
    lui     $a3, %hi(__float_80051490)
    lui     $v1, %hi(__float_80051494)
    lw      $v0, 0x0008($a0)
    sd      $s0, 0x0100($sp)
    lwc1    $f12, %lo(__float_80051488)($t1)
    lwc1    $f15, %lo(__float_8005148C)($t0)
    lwc1    $f14, %lo(__float_80051490)($a3)
    lwc1    $f13, %lo(__float_80051494)($v1)
    addiu   $a0, $a0, 0x0016
    daddu   $t2, $sp, $0
    j       .L80005910
    li      $t3, 0x0008
    nop
.L800057B0:
    bnez    $t5, .L80005920
    lh      $t6, 0x0030($a0)
    beqz    $t6, .L80005C38
    lh      $t7, 0x0040($a0)
    lh      $t8, 0x0050($a0)
    lh      $t9, 0x0060($a0)
    lh      $s0, 0x0070($a0)
    nop
.L800057D0:
    mtc1    $t4, $f3
    lwc1    $f2, 0x0020($v0)
    cvt.s.w $f7, $f3
    mtc1    $t6, $f3
    mul.s   $f7, $f7, $f2
    lwc1    $f4, 0x0060($v0)
    cvt.s.w $f11, $f3
    mtc1    $t8, $f2
    mtc1    $s0, $f3
    lwc1    $f1, 0x00A0($v0)
    mul.s   $f11, $f11, $f4
    lwc1    $f0, 0x00E0($v0)
    cvt.s.w $f10, $f2
    mtc1    $t5, $f4
    cvt.s.w $f2, $f3
    mul.s   $f10, $f10, $f1
    cvt.s.w $f19, $f4
    lh      $t4, 0x0000($a0)
    mtc1    $t9, $f4
    mtc1    $t4, $f1
    cvt.s.w $f18, $f4
    mul.s   $f0, $f2, $f0
    mtc1    $t7, $f4
    lwc1    $f3, 0x0040($v0)
    lwc1    $f8, 0x00C0($v0)
    cvt.s.w $f17, $f1
    cvt.s.w $f16, $f4
    sub.s   $f1, $f10, $f11
    lwc1    $f9, 0x0000($v0)
    lwc1    $f5, 0x0080($v0)
    sub.s   $f4, $f7, $f0
    mul.s   $f8, $f18, $f8
    mul.s   $f3, $f19, $f3
    add.s   $f6, $f1, $f4
    add.s   $f2, $f7, $f0
    mul.s   $f6, $f6, $f15
    sub.s   $f7, $f3, $f8
    add.s   $f10, $f10, $f11
    mul.s   $f1, $f1, $f14
    mul.s   $f5, $f16, $f5
    sub.s   $f0, $f2, $f10
    mul.s   $f9, $f17, $f9
    mul.s   $f7, $f7, $f12
    add.s   $f3, $f3, $f8
    add.s   $f2, $f2, $f10
    add.s   $f1, $f1, $f6
    mul.s   $f0, $f0, $f12
    mul.s   $f4, $f4, $f13
    sub.s   $f8, $f9, $f5
    sub.s   $f1, $f1, $f2
    sub.s   $f7, $f7, $f3
    add.s   $f9, $f9, $f5
    sub.s   $f0, $f0, $f1
    sub.s   $f5, $f9, $f3
    sub.s   $f4, $f4, $f6
    add.s   $f3, $f9, $f3
    sub.s   $f6, $f8, $f7
    add.s   $f7, $f8, $f7
    add.s   $f4, $f4, $f0
    sub.s   $f9, $f3, $f2
    sub.s   $f8, $f7, $f1
    swc1    $f9, 0x00E0($t2)
    swc1    $f8, 0x00C0($t2)
    sub.s   $f9, $f6, $f0
    sub.s   $f8, $f5, $f4
    swc1    $f9, 0x00A0($t2)
    add.s   $f3, $f3, $f2
    swc1    $f8, 0x0060($t2)
    add.s   $f1, $f7, $f1
    swc1    $f3, 0x0000($t2)
    add.s   $f0, $f6, $f0
    swc1    $f1, 0x0020($t2)
    add.s   $f4, $f5, $f4
    swc1    $f0, 0x0040($t2)
    swc1    $f4, 0x0080($t2)
.L800058FC:
    addiu   $t3, $t3, -0x0001
    addiu   $a0, $a0, 0x0002
    addiu   $v0, $v0, 0x0004
    beqz    $t3, .L80005938
    addiu   $t2, $t2, 0x0004
.L80005910:
    lh      $t4, 0x0010($a0)
    beqz    $t4, .L800057B0
    lh      $t5, 0x0020($a0)
    lh      $t6, 0x0030($a0)
.L80005920:
    lh      $t7, 0x0040($a0)
    lh      $t8, 0x0050($a0)
    lh      $t9, 0x0060($a0)
    j       .L800057D0
    lh      $s0, 0x0070($a0)
    nop
.L80005938:
    lwc1    $f14, %lo(__float_8005148C)($t0)
    lwc1    $f13, %lo(__float_80051490)($a3)
    lwc1    $f11, %lo(__float_80051488)($t1)
    lwc1    $f12, %lo(__float_80051494)($v1)
    addiu   $a3, $sp, 0x00E0
    daddu   $v0, $sp, $0
    j       .L80005B48
    li      $t0, 0xE0000000
.L80005958:
    addiu   $a0, $a0, 0x0080
    slti    $t1, $a0, 0x0100
    beqz    $t1, .L80005978
    li      $v1, 0x00FF
    nor     $t1, $0, $a0
    sra     $t1, $t1, 31
    andi    $v1, $a0, 0x00FF
    and     $v1, $v1, $t1
.L80005978:
    sub.s   $f2, $f7, $f2
    sb      $v1, 0x0000($a1)
    trunc.w.s $f2, $f2
    mfc1    $v1, $f2
    nop
    addiu   $v1, $v1, 0x0004
    bltz    $v1, .L80005C10
    sra     $a0, $v1, 3
.L80005998:
    addiu   $a0, $a0, 0x0080
    slti    $t1, $a0, 0x0100
    beqz    $t1, .L800059B8
    li      $v1, 0x00FF
    nor     $t1, $0, $a0
    sra     $t1, $t1, 31
    andi    $v1, $a0, 0x00FF
    and     $v1, $v1, $t1
.L800059B8:
    add.s   $f2, $f6, $f1
    sb      $v1, 0x0007($a1)
    trunc.w.s $f2, $f2
    mfc1    $v1, $f2
    nop
    addiu   $v1, $v1, 0x0004
    bltz    $v1, .L80005C08
    sra     $a0, $v1, 3
.L800059D8:
    addiu   $a0, $a0, 0x0080
    slti    $t1, $a0, 0x0100
    beqz    $t1, .L800059F8
    li      $v1, 0x00FF
    nor     $t1, $0, $a0
    sra     $t1, $t1, 31
    andi    $v1, $a0, 0x00FF
    and     $v1, $v1, $t1
.L800059F8:
    sub.s   $f1, $f6, $f1
    sb      $v1, 0x0001($a1)
    trunc.w.s $f1, $f1
    mfc1    $v1, $f1
    nop
    addiu   $v1, $v1, 0x0004
    bltz    $v1, .L80005C20
    sra     $a0, $v1, 3
.L80005A18:
    addiu   $a0, $a0, 0x0080
    slti    $t1, $a0, 0x0100
    beqz    $t1, .L80005A38
    li      $v1, 0x00FF
    nor     $t1, $0, $a0
    sra     $t1, $t1, 31
    andi    $v1, $a0, 0x00FF
    and     $v1, $v1, $t1
.L80005A38:
    add.s   $f1, $f5, $f0
    sb      $v1, 0x0006($a1)
    trunc.w.s $f1, $f1
    mfc1    $v1, $f1
    nop
    addiu   $v1, $v1, 0x0004
    bltz    $v1, .L80005C18
    sra     $a0, $v1, 3
.L80005A58:
    addiu   $a0, $a0, 0x0080
    slti    $t1, $a0, 0x0100
    beqz    $t1, .L80005A78
    li      $v1, 0x00FF
    nor     $t1, $0, $a0
    sra     $t1, $t1, 31
    andi    $v1, $a0, 0x00FF
    and     $v1, $v1, $t1
.L80005A78:
    sub.s   $f0, $f5, $f0
    sb      $v1, 0x0002($a1)
    trunc.w.s $f0, $f0
    mfc1    $v1, $f0
    nop
    addiu   $v1, $v1, 0x0004
    bltz    $v1, .L80005C00
    sra     $a0, $v1, 3
.L80005A98:
    addiu   $a0, $a0, 0x0080
    slti    $t1, $a0, 0x0100
    beqz    $t1, .L80005AB8
    li      $v1, 0x00FF
    nor     $t1, $0, $a0
    sra     $t1, $t1, 31
    andi    $v1, $a0, 0x00FF
    and     $v1, $v1, $t1
.L80005AB8:
    add.s   $f0, $f3, $f4
    sb      $v1, 0x0005($a1)
    trunc.w.s $f0, $f0
    mfc1    $v1, $f0
    nop
    addiu   $v1, $v1, 0x0004
    bltz    $v1, .L80005BF8
    sra     $a0, $v1, 3
.L80005AD8:
    addiu   $a0, $a0, 0x0080
    slti    $t1, $a0, 0x0100
    beqz    $t1, .L80005AF8
    li      $v1, 0x00FF
    nor     $t1, $0, $a0
    sra     $t1, $t1, 31
    andi    $v1, $a0, 0x00FF
    and     $v1, $v1, $t1
.L80005AF8:
    sub.s   $f3, $f3, $f4
    sb      $v1, 0x0004($a1)
    trunc.w.s $f3, $f3
    mfc1    $v1, $f3
    nop
    addiu   $v1, $v1, 0x0004
    bltz    $v1, .L80005BF0
    sra     $a0, $v1, 3
.L80005B18:
    addiu   $a0, $a0, 0x0080
    slti    $t1, $a0, 0x0100
    beqz    $t1, .L80005B38
    li      $v1, 0x00FF
    nor     $t1, $0, $a0
    sra     $t1, $t1, 31
    andi    $v1, $a0, 0x00FF
    and     $v1, $v1, $t1
.L80005B38:
    beq     $v0, $a3, .L80005C28
    sb      $v1, 0x0003($a1)
    addiu   $v0, $v0, 0x0020
    addu    $a1, $a1, $a2
.L80005B48:
    lwc1    $f8, 0x0014($v0)
    lwc1    $f0, 0x001C($v0)
    lwc1    $f7, 0x000C($v0)
    lwc1    $f2, 0x0004($v0)
    sub.s   $f1, $f8, $f7
    lwc1    $f5, 0x0008($v0)
    lwc1    $f6, 0x0000($v0)
    lwc1    $f10, 0x0010($v0)
    sub.s   $f4, $f2, $f0
    lwc1    $f3, 0x0018($v0)
    add.s   $f9, $f1, $f4
    add.s   $f7, $f8, $f7
    mul.s   $f9, $f9, $f14
    add.s   $f2, $f2, $f0
    mul.s   $f1, $f1, $f13
    sub.s   $f8, $f5, $f3
    add.s   $f3, $f5, $f3
    add.s   $f5, $f6, $f10
    sub.s   $f0, $f2, $f7
    add.s   $f2, $f2, $f7
    add.s   $f7, $f5, $f3
    add.s   $f1, $f1, $f9
    mul.s   $f8, $f8, $f11
    mul.s   $f0, $f0, $f11
    mul.s   $f4, $f4, $f12
    add.s   $f15, $f7, $f2
    sub.s   $f1, $f1, $f2
    trunc.w.s $f15, $f15
    mfc1    $v1, $f15
    sub.s   $f8, $f8, $f3
    addiu   $v1, $v1, 0x0004
    sra     $a0, $v1, 3
    sub.s   $f6, $f6, $f10
    sub.s   $f4, $f4, $f9
    sub.s   $f0, $f0, $f1
    sub.s   $f3, $f5, $f3
    add.s   $f4, $f4, $f0
    sub.s   $f5, $f6, $f8
    bgez    $v1, .L80005958
    add.s   $f6, $f6, $f8
    j       .L80005958
    or      $a0, $a0, $t0
.L80005BF0:
    j       .L80005B18
    or      $a0, $a0, $t0
.L80005BF8:
    j       .L80005AD8
    or      $a0, $a0, $t0
.L80005C00:
    j       .L80005A98
    or      $a0, $a0, $t0
.L80005C08:
    j       .L800059D8
    or      $a0, $a0, $t0
.L80005C10:
    j       .L80005998
    or      $a0, $a0, $t0
.L80005C18:
    j       .L80005A58
    or      $a0, $a0, $t0
.L80005C20:
    j       .L80005A18
    or      $a0, $a0, $t0
.L80005C28:
    ld      $s0, 0x0100($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0108
    nop
.L80005C38:
    beqz    $t7, .L80005C50
    lh      $t8, 0x0050($a0)
    lh      $t9, 0x0060($a0)
    j       .L800057D0
    lh      $s0, 0x0070($a0)
    nop
.L80005C50:
    bnez    $t8, .L80005CA8
    lh      $t9, 0x0060($a0)
    bnez    $t9, .L800057D0
    lh      $s0, 0x0070($a0)
    bnez    $s0, .L800057D0
    nop
    lh      $t4, 0x0000($a0)
    lwc1    $f0, 0x0000($v0)
    mtc1    $t4, $f2
    nop
    cvt.s.w $f1, $f2
    mul.s   $f0, $f1, $f0
    swc1    $f0, 0x00E0($t2)
    swc1    $f0, 0x0000($t2)
    swc1    $f0, 0x0020($t2)
    swc1    $f0, 0x0040($t2)
    swc1    $f0, 0x0060($t2)
    swc1    $f0, 0x0080($t2)
    swc1    $f0, 0x00A0($t2)
    j       .L800058FC
    swc1    $f0, 0x00C0($t2)
    nop
.L80005CA8:
    j       .L800057D0
    lh      $s0, 0x0070($a0)

.globl os_80005CB0
os_80005CB0:
    addiu   $sp, $sp, -0x0040
    sd      $ra, 0x0038($sp)
    sd      $s0, 0x0028($sp)
    sd      $s1, 0x0030($sp)
    jal     os_80013370
    andi    $s0, $a0, 0x00FF
    jal     os_80012DE0
    li      $a0, 0x000D
    li      $v0, 0x00F8
    beq     $s0, $v0, .L80005E68
    sltiu   $v0, $s0, 0x00F0
    beqzl   $v0, .L80005D88
    lui     $a0, %hi(__str_80050050)
    addiu   $s1, $s0, 0x0040
    andi    $s1, $s1, 0x00FF
    sltiu   $v0, $s1, 0x0019
    bnez    $v0, .L80005E08
    li      $v0, 0x0011
    beq     $s0, $v0, .L80005E98
    li      $v0, 0x0014
    beq     $s0, $v0, .L80005F08
    li      $v0, 0x0012
    beq     $s0, $v0, .L80005F88
    li      $v0, 0x0010
    beq     $s0, $v0, .L80005FA0
    li      $v0, 0x0015
    beq     $s0, $v0, .L80006000
    li      $v0, 0x0018
    beq     $s0, $v0, .L80005F48
    li      $v0, 0x0019
    beq     $s0, $v0, .L80006070
    li      $v0, 0x001A
    beq     $s0, $v0, .L80006098
    li      $v0, 0x001B
    beq     $s0, $v0, .L800060C8
    addiu   $v0, $s0, -0x001C
    andi    $v0, $v0, 0x00FF
    sltiu   $v0, $v0, 0x0004
    bnez    $v0, .L80005FD0
    li      $v0, 0x00B2
    beq     $s0, $v0, .L800060E0
    addiu   $v0, $s0, 0x004D
    andi    $v0, $v0, 0x00FF
    sltiu   $v0, $v0, 0x0002
    bnez    $v0, .L800060F4
    li      $v0, 0x0020
    beql    $s0, $v0, .L80005F60
    lui     $a0, %hi(__str_80050278)
    lui     $a0, %hi(__str_800502A8)
    jal     os_80013300
    addiu   $a0, %lo(__str_800502A8)
    j       .L80005D90
    nop
    nop
.L80005D88:
    jal     os_80013300
    addiu   $a0, %lo(__str_80050050)
.L80005D90:
    jal     os_80012B60
    li      $a0, 0x1400
    li      $s1, 0x0001
    li      $a0, 0x0020
    li      $a1, 0x0002
    li      $a2, 0x001A
    li      $a3, 0x0024
    jal     os_800131E8
    sw      $s1, 0x0024($sp)
    li      $a1, 0x0002
    li      $a2, 0x0002
    li      $a3, 0x0024
    li      $a0, 0x0020
    jal     os_800131E8
    sw      $s1, 0x0024($sp)
    jal     os_80012D90
    li      $a0, 0x0010
    lui     $a0, %hi(__str_800502C0)
    jal     os_80012B70
    addiu   $a0, %lo(__str_800502C0)
    jal     os_80012C78
    daddu   $a0, $s0, $0
    jal     sysRepaint
    nop
    ld      $ra, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    j       sys_os_80016148
    addiu   $sp, $sp, 0x0040
    nop
.L80005E08:
    lui     $a0, %hi(__str_80050060)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050060)
    lui     $a0, %hi(__str_80051050)
    addiu   $a0, %lo(__str_80051050)
    jal     os_80013300
    sltiu   $s1, $s1, 0x0012
    bnez    $s1, .L80005F38
    lui     $a0, %hi(__str_80050070)
    addiu   $v0, $s0, 0x002E
.L80005E30:
    andi    $v0, $v0, 0x00FF
    sltiu   $v0, $v0, 0x0002
    bnez    $v0, .L80006088
    lui     $a0, %hi(__str_80050080)
    addiu   $v0, $s0, 0x002C
.L80005E44:
    andi    $v0, $v0, 0x00FF
    sltiu   $v0, $v0, 0x0005
    beqz    $v0, .L80005D90
    nop
    lui     $a0, %hi(__str_80050098)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050098)
    j       .L80005D90
    nop
.L80005E68:
    lui     $a0, %hi(__str_80050020)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050020)
    lui     $a0, %hi(__str_80051050)
    jal     os_80013300
    addiu   $a0, %lo(__str_80051050)
    lui     $a0, %hi(__str_80050038)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050038)
    j       .L80005D90
    nop
    nop
.L80005E98:
    lui     $a0, %hi(__str_800500B0)
    jal     os_80013300
    addiu   $a0, %lo(__str_800500B0)
.L80005EA4:
    jal     os_80012B60
    li      $a0, 0x3400
    li      $s0, 0x0001
    li      $a0, 0x0020
    li      $a1, 0x0002
    li      $a2, 0x001A
    li      $a3, 0x0024
    jal     os_800131E8
    sw      $s0, 0x0024($sp)
    li      $a1, 0x0002
    li      $a2, 0x0002
    li      $a3, 0x0024
    li      $a0, 0x0020
    jal     os_800131E8
    sw      $s0, 0x0024($sp)
    lui     $a0, %hi(__str_800502C8)
    jal     os_80013300
    addiu   $a0, %lo(__str_800502C8)
    jal     sysRepaint
    nop
    ld      $ra, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    j       sys_os_80016148
    addiu   $sp, $sp, 0x0040
.L80005F08:
    lui     $a0, %hi(__str_800500D0)
    jal     os_80013300
    addiu   $a0, %lo(__str_800500D0)
    lui     $a0, %hi(__str_80051050)
    jal     os_80013300
    addiu   $a0, %lo(__str_80051050)
    lui     $a0, %hi(__str_800500E8)
    jal     os_80013300
    addiu   $a0, %lo(__str_800500E8)
    j       .L80005D90
    nop
    nop
.L80005F38:
    jal     os_80013300
    addiu   $a0, %lo(__str_80050070)
    j       .L80005E30
    addiu   $v0, $s0, 0x002E
.L80005F48:
    lui     $a0, %hi(__str_800501A0)
    jal     os_80013300
    addiu   $a0, %lo(__str_800501A0)
    j       .L80005D90
    nop
    nop
.L80005F60:
    jal     os_80013300
    addiu   $a0, %lo(__str_80050278)
    lui     $a0, %hi(__str_80051050)
    jal     os_80013300
    addiu   $a0, %lo(__str_80051050)
    lui     $a0, %hi(__str_80050290)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050290)
    j       .L80005D90
    nop
.L80005F88:
    lui     $a0, %hi(__str_80050100)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050100)
    j       .L80005D90
    nop
    nop
.L80005FA0:
    lui     $a0, %hi(__str_80050118)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050118)
    lui     $a0, %hi(__str_80051050)
    jal     os_80013300
    addiu   $a0, %lo(__str_80051050)
    lui     $a0, %hi(__str_80050138)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050138)
    j       .L80005EA4
    nop
    nop
.L80005FD0:
    lui     $a0, %hi(__str_80050228)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050228)
    lui     $a0, %hi(__str_80051050)
    jal     os_80013300
    addiu   $a0, %lo(__str_80051050)
    lui     $a0, %hi(__str_80050238)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050238)
    j       .L80005D90
    nop
    nop
.L80006000:
    jal     os_80012E40
    lui     $s0, %hi(__str_80051050)
    addiu   $v0, $v0, -0x0003
    jal     os_80012DE0
    andi    $a0, $v0, 0x00FF
    lui     $a0, %hi(__str_80050148)
    addiu   $s0, %lo(__str_80051050)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050148)
    jal     os_80013300
    daddu   $a0, $s0, $0
    lui     $a0, %hi(__str_80050160)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050160)
    jal     os_80013300
    daddu   $a0, $s0, $0
    lui     $a0, %hi(__str_80050180)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050180)
    jal     os_80013300
    daddu   $a0, $s0, $0
    jal     os_80013300
    daddu   $a0, $s0, $0
    lui     $a0, %hi(__str_80050138)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050138)
    j       .L80005EA4
    nop
.L80006070:
    lui     $a0, %hi(__str_800501B8)
    jal     os_80013300
    addiu   $a0, %lo(__str_800501B8)
    j       .L80005D90
    nop
    nop
.L80006088:
    jal     os_80013300
    addiu   $a0, %lo(__str_80050080)
    j       .L80005E44
    addiu   $v0, $s0, 0x002C
.L80006098:
    lui     $a0, %hi(__str_800501D0)
    jal     os_80013300
    addiu   $a0, %lo(__str_800501D0)
    lui     $a0, %hi(__str_80051050)
    jal     os_80013300
    addiu   $a0, %lo(__str_80051050)
    lui     $a0, %hi(__str_800501F0)
    jal     os_80013300
    addiu   $a0, %lo(__str_800501F0)
    j       .L80005D90
    nop
    nop
.L800060C8:
    lui     $a0, %hi(__str_80050210)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050210)
    j       .L80005D90
    nop
    nop
.L800060E0:
    lui     $a0, %hi(__str_80050248)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050248)
    j       .L80005D90
    nop
.L800060F4:
    lui     $a0, %hi(__str_80050258)
    jal     os_80013300
    addiu   $a0, %lo(__str_80050258)
    j       .L80005D90
    nop

.globl main
main:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     os_80008390
    nop
    bnez    $v0, .L80006138
    nop
.L80006120:
    jal     os_80007CD8
    nop
    jal     os_80005CB0
    daddu   $a0, $v0, $0
    j       .L80006120
    nop
.L80006138:
    jal     os_80005CB0
    daddu   $a0, $v0, $0
.L80006140:
    jal     usbListener
    nop
    jal     usbListener
    nop
    j       .L80006140
    nop
    addiu   $sp, $sp, -0x0238
    addiu   $a0, $sp, 0x0028
    sd      $ra, 0x0230($sp)
    sd      $s0, 0x0228($sp)
    daddu   $v0, $a0, $0
    addiu   $a1, $sp, 0x0228
    li      $v1, -0x0056
    sb      $v1, 0x0000($v0)
.L80006178:
    addiu   $v0, $v0, 0x0001
    bnel    $v0, $a1, .L80006178
    sb      $v1, 0x0000($v0)
    li      $v0, 0x0055
    addiu   $s0, $sp, 0x0020
    sb      $v0, 0x0029($sp)
    li      $v0, 0x0012
    daddu   $a1, $s0, $0
    sb      $v0, 0x002A($sp)
    li      $v0, -0x0031
    jal     sdCrc16
    sb      $v0, 0x002B($sp)
    lui     $a0, %hi(__str_800502D0)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800502D0)
    daddu   $a0, $s0, $0
    jal     os_80013018
    li      $a1, 0x0008
    jal     sysRepaint
    nop
    jal     sys_os_80016148
    nop
    ld      $ra, 0x0230($sp)
    ld      $s0, 0x0228($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0238
.L800061E0:
    addiu   $sp, $sp, -0x0058
    sd      $ra, 0x0050($sp)
    sd      $s4, 0x0048($sp)
    sd      $s3, 0x0040($sp)
    sd      $s2, 0x0038($sp)
    sd      $s1, 0x0030($sp)
    sd      $s0, 0x0028($sp)
    jal     os_80013370
    lui     $s3, %hi(_80078CF0)
    lui     $a0, %hi(__str_800502D8)
    addiu   $s3, %lo(_80078CF0)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800502D8)
    lbu     $a0, 0x0003($s3)
    jal     os_80012C78
    lui     $s1, %hi(_8007BDA8)
    lui     $a0, %hi(__str_800502E8)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800502E8)
    lbu     $a0, 0x0005($s3)
    jal     os_80012C78
    addiu   $s1, %lo(_8007BDA8)
    lui     $a0, %hi(__str_800502F8)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800502F8)
    lbu     $a0, 0x0006($s3)
    jal     os_80012C78
    addiu   $s0, $s1, 0x001C
    lui     $a0, %hi(__str_80050308)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050308)
    lbu     $a0, 0x0032($s1)
    jal     os_80012C78
    lui     $s2, %hi(_8007BDBC)
    lui     $a0, %hi(__str_80050318)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050318)
    lbu     $a0, 0x0004($s3)
    jal     os_80012C78
    daddu   $s4, $s1, $0
    lui     $a0, %hi(__str_80050328)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050328)
    lbu     $a0, 0x0002($s3)
    jal     os_80012C78
    addiu   $s2, %lo(_8007BDBC)
    lui     $a0, %hi(__str_80050338)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050338)
    lw      $a0, 0x0024($s1)
    jal     os_80012D10
    daddu   $s3, $s0, $0
    lui     $a0, %hi(__str_80050348)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050348)
    jal     os_80012D10
    lw      $a0, 0x0028($s1)
    lui     $a0, %hi(__str_80050358)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050358)
    lbu     $a0, 0x0000($s2)
.L800062D4:
    jal     os_80012C78
    addiu   $s2, $s2, 0x0001
    bnel    $s2, $s3, .L800062D4
    lbu     $a0, 0x0000($s2)
    lui     $a0, %hi(__str_80050368)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050368)
    addiu   $s2, $s4, 0x0024
    lbu     $a0, 0x0000($s0)
.L800062F8:
    jal     os_80012C78
    addiu   $s0, $s0, 0x0001
    bnel    $s0, $s2, .L800062F8
    lbu     $a0, 0x0000($s0)
    lui     $a0, %hi(__str_80050378)
    addiu   $s0, $sp, 0x0020
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050378)
    jal     BiRTCRd
    daddu   $a0, $s0, $0
    jal     os_8000A5A8
    daddu   $a0, $s0, $0
    lui     $a0, %hi(__str_80050388)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050388)
    daddu   $a0, $s0, $0
    jal     BiRTCSet
    li      $a1, 0x0001
    jal     BiRTCGet
    daddu   $a0, $s0, $0
    daddu   $a1, $0, $0
    jal     BiRTCSet
    daddu   $a0, $0, $0
    jal     os_8000A5A8
    daddu   $a0, $s0, $0
    lui     $a0, %hi(__str_80050398)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050398)
    lbu     $a0, 0x000D($s1)
    jal     os_80012C78
    lui     $s0, %hi(_80052908)
    lui     $a0, %hi(__str_800503A8)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800503A8)
    jal     BiBootCfgGet
    li      $a0, 0xFFFF
    jal     os_80012CE0
    daddu   $a0, $v0, $0
    lui     $a0, %hi(__str_800503B8)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800503B8)
    lbu     $a0, 0x0033($s1)
    jal     os_80012C78
    lui     $s1, %hi(__str_800503E8)
    lui     $a0, %hi(__str_80051050)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80051050)
    lui     $a0, %hi(__str_800503C8)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800503C8)
    lw      $a0, %lo(_80052908)($s0)
    li      $a1, 0x0017
    jal     os_80012BB0
    addiu   $a0, $a0, 0x0094
    lui     $a0, %hi(__str_800503D8)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800503D8)
    lw      $v0, %lo(_80052908)($s0)
    addiu   $s1, %lo(__str_800503E8)
    jal     os_80012C78
    lbu     $a0, 0x0063($v0)
    jal     os_80012B70
    daddu   $a0, $s1, $0
    lw      $v0, %lo(_80052908)($s0)
    lhu     $v1, 0x0062($v0)
    lui     $v0, %hi(_8004CB20)
    sll     $v1, $v1, 2
    addiu   $v0, %lo(_8004CB20)
    addu    $v0, $v1, $v0
    jal     os_80012B70
    lw      $a0, 0x0000($v0)
    lui     $a0, %hi(__str_800503F0)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800503F0)
    lw      $v0, %lo(_80052908)($s0)
    jal     os_80012C78
    lbu     $a0, 0x006D($v0)
    lui     $a0, %hi(__str_80050400)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050400)
    lw      $v0, %lo(_80052908)($s0)
    jal     os_80012C78
    lbu     $a0, 0x0065($v0)
    lui     $a0, %hi(__str_80050410)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050410)
    lw      $v0, %lo(_80052908)($s0)
    jal     os_80012C78
    lbu     $a0, 0x0067($v0)
    jal     os_80012B70
    daddu   $a0, $s1, $0
    lw      $v0, %lo(_80052908)($s0)
    lhu     $v1, 0x0066($v0)
    lui     $v0, %hi(_8004CB00)
    sll     $v1, $v1, 2
    addiu   $v0, %lo(_8004CB00)
    addu    $v0, $v1, $v0
    jal     os_80012B70
    lw      $a0, 0x0000($v0)
    lui     $a0, %hi(__str_80050420)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050420)
    lw      $v0, %lo(_80052908)($s0)
    jal     os_80012C78
    lbu     $a0, 0x006B($v0)
    lui     $a0, %hi(__str_80050430)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050430)
    lui     $v0, %hi(_80052928)
    jal     os_80013308
    lhu     $a0, %lo(_80052928)($v0)
    jal     sysRepaint
    nop
    jal     sys_os_80016148
    nop
    ld      $ra, 0x0050($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
    nop

.globl os_800064E8
os_800064E8:
    addiu   $sp, $sp, -0x0110
    lui     $v0, %hi(_80052908)
    sd      $s1, 0x00C8($sp)
    lw      $s1, %lo(_80052908)($v0)
    sd      $s4, 0x00E0($sp)
    sd      $s3, 0x00D8($sp)
    sd      $s2, 0x00D0($sp)
    sd      $s0, 0x00C0($sp)
    sd      $ra, 0x0108($sp)
    sd      $s8, 0x0100($sp)
    sd      $s7, 0x00F8($sp)
    sd      $s6, 0x00F0($sp)
    sd      $s5, 0x00E8($sp)
    sb      $0, 0x0020($sp)
    addiu   $s0, $sp, 0x0028
    lbu     $s8, 0x0053($s1)
    addiu   $s2, $sp, 0x0048
    daddu   $s3, $s0, $0
    addiu   $s4, $sp, 0x00B8
    nop
.L80006538:
    sw      $s2, 0x0000($s3)
    daddu   $a0, $s2, $0
    daddu   $a1, $0, $0
    li      $a2, 0x0010
    jal     os_80014778
    addiu   $s2, $s2, 0x0010
    bne     $s2, $s4, .L80006538
    addiu   $s3, $s3, 0x0004
    lw      $v1, 0x002C($sp)
    lui     $v0, %hi(_80051E28)
    lui     $a1, %hi(__str_8004F048)
    addiu   $a0, $s1, 0x0050
    addiu   $v0, %lo(_80051E28)
    addiu   $a1, %lo(__str_8004F048)
    lui     $a3, %hi(_80078CF0)
    sw      $a1, 0x0000($v1)
    sw      $a0, 0x0004($v1)
    sw      $v0, 0x0008($v1)
    addiu   $a3, %lo(_80078CF0)
    lbu     $a0, 0x0008($a3)
    bnez    $a0, .L800065A0
    sw      $0, 0x0044($sp)
    addiu   $a0, $sp, 0x0020
    sw      $a0, 0x0004($v1)
    li      $a0, -0x0080
    sb      $a0, 0x000C($v1)
.L800065A0:
    lw      $a2, 0x0028($sp)
    lw      $a1, 0x0030($sp)
    lw      $a0, 0x0034($sp)
    lw      $v1, 0x0038($sp)
    addiu   $t1, $s1, 0x0052
    addiu   $t4, $s1, 0x0053
    addiu   $t3, $s1, 0x0054
    addiu   $t2, $s1, 0x0051
    sw      $t4, 0x0004($a2)
    sw      $t3, 0x0004($a1)
    sw      $t2, 0x0004($a0)
    sw      $t1, 0x0004($v1)
    lui     $t1, %hi(__str_80050440)
    addiu   $t1, %lo(__str_80050440)
    sw      $t1, 0x0000($a2)
    lui     $t1, %hi(__str_80050450)
    addiu   $t1, %lo(__str_80050450)
    sw      $t1, 0x0000($a1)
    lui     $t1, %hi(__str_80050460)
    addiu   $t1, %lo(__str_80050460)
    sw      $t1, 0x0000($a0)
    lui     $t1, %hi(__str_80050470)
    addiu   $t1, %lo(__str_80050470)
    sw      $t1, 0x0000($v1)
    lw      $t0, 0x003C($sp)
    lui     $t1, %hi(__str_80050480)
    addiu   $t1, %lo(__str_80050480)
    sw      $v0, 0x0008($a2)
    sw      $t1, 0x0000($t0)
    sw      $v0, 0x0008($a1)
    sw      $v0, 0x0008($a0)
    sw      $v0, 0x0008($v1)
    lbu     $v0, 0x0006($a3)
    bnez    $v0, .L80006634
    lui     $v1, %hi(__str_8004EE58)
    li      $v0, -0x0080
    sb      $v0, 0x000C($t0)
.L80006634:
    lw      $v0, 0x0040($sp)
    addiu   $v1, %lo(__str_8004EE58)
    lui     $s3, %hi(__str_80050490)
    lui     $s7, %hi(_80051BE0)
    sw      $v1, 0x0000($v0)
    addiu   $s3, %lo(__str_80050490)
    addiu   $s7, %lo(_80051BE0)
    daddu   $a2, $0, $0
    li      $s2, 0x0005
    li      $s4, 0x0006
    li      $s5, 0x00FF
    li      $s6, 0x00FE
    nop
.L80006668:
    daddu   $a0, $s3, $0
.L8000666C:
    jal     os_80013D60
    daddu   $a1, $s0, $0
    beq     $v0, $s2, .L800066E8
    daddu   $a2, $v0, $0
    beq     $v0, $s4, .L80006700
    daddu   $a0, $s7, $0
    beq     $v0, $s5, .L80006710
    ld      $ra, 0x0108($sp)
    bne     $v0, $s6, .L8000666C
    daddu   $a0, $s3, $0
    lbu     $v0, 0x0053($s1)
    beq     $v0, $s8, .L800066B0
    nop
    jal     bios_os_80000788
    nop
    bnez    $v0, .L800066BC
    ld      $ra, 0x0108($sp)
.L800066B0:
    jal     os_80007990
    nop
    ld      $ra, 0x0108($sp)
.L800066BC:
    ld      $s8, 0x0100($sp)
    ld      $s7, 0x00F8($sp)
    ld      $s6, 0x00F0($sp)
    ld      $s5, 0x00E8($sp)
    ld      $s4, 0x00E0($sp)
    ld      $s3, 0x00D8($sp)
    ld      $s2, 0x00D0($sp)
    ld      $s1, 0x00C8($sp)
    ld      $s0, 0x00C0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0110
.L800066E8:
    jal     os_8000A668
    sd      $a2, 0x00B8($sp)
    beqz    $v0, .L80006668
    ld      $a2, 0x00B8($sp)
    j       .L800066BC
    ld      $ra, 0x0108($sp)
.L80006700:
    jal     os_800134D8
    sd      $a2, 0x00B8($sp)
    j       .L80006668
    ld      $a2, 0x00B8($sp)
.L80006710:
    daddu   $v0, $0, $0
    ld      $s8, 0x0100($sp)
    ld      $s7, 0x00F8($sp)
    ld      $s6, 0x00F0($sp)
    ld      $s5, 0x00E8($sp)
    ld      $s4, 0x00E0($sp)
    ld      $s3, 0x00D8($sp)
    ld      $s2, 0x00D0($sp)
    ld      $s1, 0x00C8($sp)
    ld      $s0, 0x00C0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0110

.globl os_80006740
os_80006740:
    addiu   $sp, $sp, -0x0030
    sd      $ra, 0x0028($sp)
    jal     os_80013370
    sd      $s0, 0x0020($sp)
    jal     os_80012B60
    li      $a0, 0x1000
    lui     $a0, %hi(__str_80050498)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050498)
    lui     $v0, %hi(_80078CF3)
    lbu     $a0, %lo(_80078CF3)($v0)
    lui     $s0, %hi(__str_80051050)
    jal     os_80013308
    addiu   $s0, %lo(__str_80051050)
    jal     os_80012F18
    daddu   $a0, $s0, $0
    jal     os_80012B60
    li      $a0, 0x3000
    lui     $a0, %hi(__str_800504A8)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800504A8)
    jal     os_80012B60
    li      $a0, 0x1000
    lui     $a0, %hi(__str_800504C0)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800504C0)
    jal     os_80012F18
    daddu   $a0, $s0, $0
    jal     os_80012B60
    li      $a0, 0x3000
    lui     $a0, %hi(__str_800504D8)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800504D8)
    jal     os_80012B60
    li      $a0, 0x1000
    lui     $a0, %hi(__str_800504F0)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800504F0)
    jal     os_80012F18
    daddu   $a0, $s0, $0
    jal     os_80012B60
    li      $a0, 0x3000
    lui     $a0, %hi(__str_80050500)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050500)
    jal     os_80012B60
    li      $a0, 0x1000
    lui     $a0, %hi(__str_80050518)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050518)
    lui     $a0, %hi(__str_80050538)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050538)
    lui     $a0, %hi(__str_80050558)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050558)
    lui     $a0, %hi(__str_80050570)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050570)
    lui     $a0, %hi(__str_80050588)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050588)
    lui     $a0, %hi(__str_800505A0)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800505A0)
    jal     os_80012DE0
    li      $a0, 0x001B
    lui     $a0, %hi(__str_800505C0)
    jal     os_80012F18
    addiu   $a0, %lo(__str_800505C0)
    jal     sysRepaint
    nop
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       sys_os_80016148
    addiu   $sp, $sp, 0x0030

.globl os_80006870
os_80006870:
    lui     $a0, %hi(__str_800505D0)
    addiu   $sp, $sp, -0x0048
    li      $a1, 0x000A
    li      $a2, 0x0018
    addiu   $a0, %lo(__str_800505D0)
    sd      $ra, 0x0040($sp)
    sd      $s2, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    jal     os_80013668
    sd      $s3, 0x0038($sp)
    daddu   $s1, $v0, $0
    lw      $v0, 0x0004($v0)
    lui     $s2, %hi(_80078CF0)
    lw      $a0, 0x0000($v0)
    jal     os_800150C8
    addiu   $s0, $s2, %lo(_80078CF0)
    lui     $a0, %hi(__str_800505E8)
    jal     os_800150F8
    addiu   $a0, %lo(__str_800505E8)
    lui     $a0, %hi(__str_80050498)
    jal     os_800150F8
    addiu   $a0, %lo(__str_80050498)
    jal     os_80015138
    lbu     $a0, 0x0003($s0)
    lw      $v0, 0x0004($s1)
    jal     os_800150C8
    lw      $a0, 0x0004($v0)
    lui     $a0, %hi(__str_800505F8)
    jal     os_800150F8
    addiu   $a0, %lo(__str_800505F8)
    lhu     $a0, 0x000A($s0)
    jal     os_80015138
    srl     $a0, $a0, 8
    lui     $a0, %hi(__str_8004F9A0)
    jal     os_800150F8
    addiu   $a0, %lo(__str_8004F9A0)
    jal     os_800151F8
    lbu     $a0, 0x000B($s0)
    lw      $v0, 0x0004($s1)
    jal     os_800150C8
    lw      $a0, 0x0008($v0)
    lui     $a0, %hi(__str_80050608)
    jal     os_800150F8
    addiu   $a0, %lo(__str_80050608)
    jal     os_800151F8
    lbu     $a0, 0x0001($s0)
    lw      $v0, 0x0004($s1)
    jal     os_800150C8
    lw      $a0, 0x000C($v0)
    lui     $a0, %hi(__str_80050618)
    jal     os_800150F8
    addiu   $a0, %lo(__str_80050618)
    jal     os_800151F8
    lbu     $a0, %lo(_80078CF0)($s2)
    lw      $v0, 0x0004($s1)
    jal     os_800150C8
    lw      $a0, 0x0010($v0)
    lui     $a0, %hi(__str_80050628)
    jal     os_800150F8
    addiu   $a0, %lo(__str_80050628)
    lbu     $v0, 0x0002($s0)
    li      $v1, 0x0001
    beql    $v0, $v1, .L80006B48
    lui     $a0, %hi(__str_8004F188)
    beqzl   $v0, .L80006AF0
    lui     $a0, %hi(__str_8004F180)
    lui     $a0, %hi(__str_8004F190)
    jal     os_800150F8
    addiu   $a0, %lo(__str_8004F190)
    lw      $v0, 0x0004($s1)
.L8000698C:
    jal     os_800150C8
    lw      $a0, 0x0014($v0)
    lui     $a0, %hi(__str_80050638)
    jal     os_800150F8
    addiu   $a0, %lo(__str_80050638)
    lbu     $v0, 0x0008($s0)
    beqzl   $v0, .L80006B20
    lui     $a0, %hi(__str_80050658)
    lui     $a0, %hi(__str_80050648)
.L800069B0:
    addiu   $a0, %lo(__str_80050648)
.L800069B4:
    jal     os_800150F8
    lui     $s2, %hi(_8007BDA8)
    lw      $v0, 0x0004($s1)
    lw      $a0, 0x0018($v0)
    jal     os_800150C8
    addiu   $s2, %lo(_8007BDA8)
    lui     $a0, %hi(__str_80050668)
    jal     os_800150F8
    addiu   $a0, %lo(__str_80050668)
    lhu     $a0, 0x002C($s2)
    jal     os_80015648
    lui     $s3, %hi(__str_8004EC28)
    lw      $v0, 0x0004($s1)
    addiu   $s3, %lo(__str_8004EC28)
    jal     os_800150C8
    lw      $a0, 0x001C($v0)
    lui     $a0, %hi(__str_80050678)
    jal     os_800150F8
    addiu   $a0, %lo(__str_80050678)
    jal     os_80015568
    lhu     $a0, 0x002E($s2)
    lw      $v0, 0x0004($s1)
    jal     os_800150C8
    lw      $a0, 0x0020($v0)
    lui     $a0, %hi(__str_80050688)
    jal     os_800150F8
    addiu   $a0, %lo(__str_80050688)
    jal     os_80015138
    lw      $a0, 0x0004($s2)
    lw      $v0, 0x0004($s1)
    jal     os_800150C8
    lw      $a0, 0x0024($v0)
    lui     $a0, %hi(__str_80050698)
    jal     os_800150F8
    addiu   $a0, %lo(__str_80050698)
    jal     os_80015138
    lw      $a0, 0x0008($s2)
    jal     os_80013370
    nop
    jal     os_80012B60
    li      $a0, 0x1000
    li      $a1, 0x001C
    jal     os_80012D40
    li      $a0, 0x000C
    lui     $a0, %hi(__str_800506A8)
    jal     os_80012B70
    addiu   $a0, %lo(__str_800506A8)
    jal     os_80012CE0
    lhu     $a0, 0x0026($s2)
    jal     os_80012B70
    daddu   $a0, $s3, $0
    jal     os_80012C78
    lbu     $a0, 0x0029($s2)
    jal     os_80012B70
    daddu   $a0, $s3, $0
    jal     os_80012CE0
    lhu     $a0, 0x002A($s2)
    li      $a1, 0x001A
    jal     os_80012D40
    daddu   $a0, $0, $0
    lbu     $v0, 0x000D($s1)
    daddu   $a0, $s1, $0
    ori     $v0, $v0, 0x0001
    jal     os_80014128
    sb      $v0, 0x000D($s1)
    jal     os_800145E0
    lhu     $a0, 0x0016($s1)
    jal     sys_os_80015E00
    nop
    li      $v1, 0x0040
    beql    $v0, $v1, .L80006B28
    lbu     $v0, 0x0007($s0)
    ld      $ra, 0x0040($sp)
.L80006AD8:
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048
.L80006AF0:
    jal     os_800150F8
    addiu   $a0, %lo(__str_8004F180)
    lw      $v0, 0x0004($s1)
    jal     os_800150C8
    lw      $a0, 0x0014($v0)
    lui     $a0, %hi(__str_80050638)
    jal     os_800150F8
    addiu   $a0, %lo(__str_80050638)
    lbu     $v0, 0x0008($s0)
    bnezl   $v0, .L800069B0
    li      $a0, 0x80050000
    li      $a0, 0x80050000
.L80006B20:
    j       .L800069B4
    addiu   $a0, %lo(__str_80050658)
.L80006B28:
    beqz    $v0, .L80006AD8
    ld      $ra, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       .L800061E0
    addiu   $sp, $sp, 0x0048
.L80006B48:
    jal     os_800150F8
    addiu   $a0, %lo(__str_8004F188)
    j       .L8000698C
    lw      $v0, 0x0004($s1)

.globl os_80006B58
os_80006B58:
    lui     $v0, %hi(__str_80050490)
    addiu   $sp, $sp, -0x00B8
    addiu   $v0, %lo(__str_80050490)
    sw      $v0, 0x0040($sp)
    lui     $v0, %hi(__str_800506B0)
    addiu   $v0, %lo(__str_800506B0)
    sw      $v0, 0x0044($sp)
    lui     $v0, %hi(__str_800506C0)
    addiu   $v0, %lo(__str_800506C0)
    sw      $v0, 0x0048($sp)
    lui     $v0, %hi(__str_8004F048)
    addiu   $v0, %lo(__str_8004F048)
    sw      $v0, 0x004C($sp)
    lui     $v0, %hi(__str_800506D0)
    addiu   $v0, %lo(__str_800506D0)
    sw      $v0, 0x0050($sp)
    lui     $v0, %hi(__str_800506E0)
    addiu   $v0, %lo(__str_800506E0)
    sw      $v0, 0x0054($sp)
    lui     $v0, %hi(__str_800506F0)
    addiu   $v0, %lo(__str_800506F0)
    sd      $s2, 0x0078($sp)
    sw      $v0, 0x0058($sp)
    addiu   $s2, $sp, 0x0020
    lui     $v0, %hi(__str_80050700)
    addiu   $v0, %lo(__str_80050700)
    sd      $s0, 0x0068($sp)
    daddu   $a0, $s2, $0
    daddu   $a1, $0, $0
    li      $a2, 0x0008
    addiu   $s0, $sp, 0x0028
    sw      $v0, 0x005C($sp)
    sd      $ra, 0x00B0($sp)
    sd      $s1, 0x0070($sp)
    sd      $s8, 0x00A8($sp)
    sd      $s7, 0x00A0($sp)
    sd      $s6, 0x0098($sp)
    sd      $s5, 0x0090($sp)
    sd      $s4, 0x0088($sp)
    sd      $s3, 0x0080($sp)
    sw      $0, 0x0060($sp)
    jal     os_80014778
    lui     $s1, %hi(_80052908)
    daddu   $a0, $s0, $0
    daddu   $a1, $0, $0
    jal     os_80014778
    li      $a2, 0x0018
    lw      $v0, %lo(_80052908)($s1)
    lbu     $v1, 0x0094($v0)
    beqzl   $v1, .L80006DE0
    li      $v0, -0x0080
    lhu     $v0, 0x006A($v0)
    bnez    $v0, .L80006DE0
    li      $v0, -0x0080
.L80006C30:
    lui     $v0, %hi(__str_80050708)
    addiu   $v0, %lo(__str_80050708)
    sw      $v0, 0x0028($sp)
    addiu   $v0, $sp, 0x0040
    sw      $v0, 0x002C($sp)
    li      $v0, 0x0001
    sw      $s2, 0x0030($sp)
    sb      $v0, 0x0035($sp)
    li      $s2, 0x00FF
    li      $s4, 0x0005
    li      $s3, 0x0001
    li      $s5, 0x0002
    li      $s6, 0x0003
    li      $s7, 0x0004
    li      $s8, 0x0006
    nop
.L80006C70:
    jal     os_80014128
    daddu   $a0, $s0, $0
    lbu     $v0, 0x0034($sp)
    beq     $v0, $s2, .L80006CE8
    sb      $0, 0x0035($sp)
.L80006C84:
    beqz    $v0, .L80006D20
    nop
    beq     $v0, $s4, .L80006D3C
    nop
.L80006C94:
    beq     $v0, $s3, .L80006D50
    nop
.L80006C9C:
    beq     $v0, $s5, .L80006DE8
    nop
    beql    $v0, $s6, .L80006D88
    lw      $a0, %lo(_80052908)($s1)
    beq     $v0, $s7, .L80006DA8
    nop
.L80006CB4:
    beq     $v0, $s8, .L80006DC8
    nop
.L80006CBC:
    li      $v1, 0x0007
.L80006CC0:
    bne     $v0, $v1, .L80006C70
    nop
    jal     os_80006740
    nop
    jal     os_80014128
    daddu   $a0, $s0, $0
    lbu     $v0, 0x0034($sp)
    bne     $v0, $s2, .L80006C84
    sb      $0, 0x0035($sp)
    nop
.L80006CE8:
    daddu   $v0, $0, $0
    ld      $ra, 0x00B0($sp)
.L80006CF0:
    ld      $s8, 0x00A8($sp)
    ld      $s7, 0x00A0($sp)
    ld      $s6, 0x0098($sp)
    ld      $s5, 0x0090($sp)
    ld      $s4, 0x0088($sp)
    ld      $s3, 0x0080($sp)
    ld      $s2, 0x0078($sp)
    ld      $s1, 0x0070($sp)
    ld      $s0, 0x0068($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00B8
    nop
.L80006D20:
    jal     os_800064E8
    nop
    bnez    $v0, .L80006CF0
    ld      $ra, 0x00B0($sp)
    lbu     $v0, 0x0034($sp)
    bne     $v0, $s4, .L80006C94
    nop
.L80006D3C:
    jal     os_80006870
    nop
    lbu     $v0, 0x0034($sp)
    bne     $v0, $s3, .L80006C9C
    nop
.L80006D50:
    jal     os_80008190
    nop
    ld      $ra, 0x00B0($sp)
    ld      $s8, 0x00A8($sp)
    ld      $s7, 0x00A0($sp)
    ld      $s6, 0x0098($sp)
    ld      $s5, 0x0090($sp)
    ld      $s4, 0x0088($sp)
    ld      $s3, 0x0080($sp)
    ld      $s2, 0x0078($sp)
    ld      $s1, 0x0070($sp)
    ld      $s0, 0x0068($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00B8
.L80006D88:
    jal     os_80003538
    addiu   $a0, $a0, 0x007C
    bnez    $v0, .L80006CF0
    ld      $ra, 0x00B0($sp)
    lbu     $v0, 0x0034($sp)
    bne     $v0, $s7, .L80006CB4
    nop
    nop
.L80006DA8:
    jal     os_80003DE0
    nop
    bnez    $v0, .L80006CF0
    ld      $ra, 0x00B0($sp)
    lbu     $v0, 0x0034($sp)
    bne     $v0, $s8, .L80006CC0
    li      $v1, 0x0007
    nop
.L80006DC8:
    jal     os_8000C338
    nop
    bnez    $v0, .L80006CF0
    ld      $ra, 0x00B0($sp)
    j       .L80006CBC
    lbu     $v0, 0x0034($sp)
.L80006DE0:
    j       .L80006C30
    sb      $v0, 0x0023($sp)
.L80006DE8:
    jal     os_80007FC0
    nop
    bnezl   $v0, .L80006CF0
    ld      $ra, 0x00B0($sp)
    jal     os_80007A28
    nop
    j       .L80006CF0
    ld      $ra, 0x00B0($sp)

.globl os_80006E08
os_80006E08:
    addiu   $sp, $sp, -0x0028
    sw      $a0, 0x0028($sp)
    li      $a1, 0xA8010000
    addiu   $a0, $sp, 0x0028
    sd      $ra, 0x0020($sp)
    jal     sysPI_wr
    li      $a2, 0x0004
    ld      $ra, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028
    addiu   $sp, $sp, -0x0030
    sd      $ra, 0x0028($sp)
    jal     os_80006E08
    li      $a0, 0xE1000000
    addiu   $a0, $sp, 0x0020
    li      $a1, 0xA8000000
    jal     sysPI_rd
    li      $a2, 0x0008
    ld      $ra, 0x0028($sp)
    ld      $v0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
.L80006E60:
    addiu   $sp, $sp, -0x0038
    li      $a0, 0xD2000000
    sd      $s0, 0x0028($sp)
    sd      $ra, 0x0030($sp)
    jal     os_80006E08
    addiu   $s0, $sp, 0x0020
    sd      $0, 0x0020($sp)
    nop
.L80006E80:
    daddu   $a0, $s0, $0
    li      $a1, 0xA8000000
    jal     sysPI_rd
    li      $a2, 0x0008
    ld      $v0, 0x0020($sp)
    andi    $v0, $v0, 0x0080
    beqz    $v0, .L80006E80
    sd      $v0, 0x0020($sp)
    ld      $ra, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038

.globl os_80006EB0
os_80006EB0:
    sll     $a0, $a0, 7
    li      $v0, 0x4B000000
    andi    $a0, $a0, 0xFF80
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     os_80006E08
    or      $a0, $a0, $v0
    jal     os_80006E08
    li      $a0, 0x78000000
    ld      $ra, 0x0020($sp)
    j       .L80006E60
    addiu   $sp, $sp, 0x0028

.globl os_80006EE0
os_80006EE0:
    addiu   $sp, $sp, -0x0038
    li      $a0, 0x0005
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0030($sp)
    jal     bi_set_save_type
    daddu   $s0, $0, $0
    li      $s1, 0x0008
    daddu   $a0, $s0, $0
.L80006F04:
    jal     os_80006EB0
    addiu   $s0, $s0, 0x0001
    bne     $s0, $s1, .L80006F04
    daddu   $a0, $s0, $0
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    daddu   $a0, $0, $0
    j       bi_set_save_type
    addiu   $sp, $sp, 0x0038
    nop

.globl os_80006F30
os_80006F30:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    daddu   $s0, $a0, $0
    sd      $ra, 0x0028($sp)
    jal     bi_set_save_type
    li      $a0, 0x0005
    jal     os_80006E08
    li      $a0, 0xD2000000
    jal     os_80006E08
    li      $a0, 0xF0000000
    daddu   $a0, $s0, $0
    li      $a1, 0xA8000000
    jal     sysPI_rd
    li      $a2, 0x00020000
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    daddu   $a0, $0, $0
    j       bi_set_save_type
    addiu   $sp, $sp, 0x0030
    nop

.globl os_80006F80
os_80006F80:
    addiu   $sp, $sp, -0x0038
    sd      $s1, 0x0028($sp)
    daddu   $s1, $a0, $0
    li      $a0, 0xB4000000
    sd      $ra, 0x0030($sp)
    sd      $s0, 0x0020($sp)
    jal     os_80006E08
    andi    $s0, $a1, 0xFFFF
    daddu   $a0, $s1, $0
    li      $a1, 0xA8000000
    jal     sysPI_wr
    li      $a2, 0x0080
    li      $a0, 0xA5000000
    jal     os_80006E08
    or      $a0, $s0, $a0
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       .L80006E60
    addiu   $sp, $sp, 0x0038

.globl os_80006FD0
os_80006FD0:
    addiu   $sp, $sp, -0x0040
    sd      $s1, 0x0028($sp)
    daddu   $s1, $a0, $0
    li      $a0, 0x0005
    sd      $s2, 0x0030($sp)
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0038($sp)
    jal     bi_set_save_type
    daddu   $s0, $0, $0
    li      $s2, 0x0400
.L80006FF8:
    daddu   $a0, $s1, $0
    daddu   $a1, $s0, $0
    jal     os_80006F80
    addiu   $s0, $s0, 0x0001
    bne     $s0, $s2, .L80006FF8
    addiu   $s1, $s1, 0x0080
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    daddu   $a0, $0, $0
    j       bi_set_save_type
    addiu   $sp, $sp, 0x0040
    nop

.globl os_80007030
os_80007030:
    addiu   $sp, $sp, -0x0040
    andi    $a1, $a1, 0x00FF
    li      $v0, 0x0002
    sd      $s2, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0038($sp)
    sd      $s0, 0x0020($sp)
    daddu   $s2, $a0, $0
    beq     $a1, $v0, .L8000705C
    li      $s1, 0x0800
    li      $s1, 0x0200
.L8000705C:
    jal     bi_set_save_type
    daddu   $a0, $a1, $0
    jal     eeprom_present
    daddu   $s0, $0, $0
    srl     $a0, $s0, 3
.L80007070:
    addu    $a1, $s2, $s0
    jal     eeprom_write
    addiu   $s0, $s0, 0x0008
    sltu    $v0, $s0, $s1
    bnez    $v0, .L80007070
    srl     $a0, $s0, 3
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    daddu   $a0, $0, $0
    j       bi_set_save_type
    addiu   $sp, $sp, 0x0040
    nop

.globl os_800070A8
os_800070A8:
    addiu   $sp, $sp, -0x0040
    andi    $a1, $a1, 0x00FF
    li      $v0, 0x0002
    sd      $s2, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0038($sp)
    sd      $s0, 0x0020($sp)
    daddu   $s2, $a0, $0
    beq     $a1, $v0, .L800070D4
    li      $s1, 0x0800
    li      $s1, 0x0200
.L800070D4:
    jal     bi_set_save_type
    daddu   $a0, $a1, $0
    jal     eeprom_present
    daddu   $s0, $0, $0
    srl     $a0, $s0, 3
.L800070E8:
    addu    $a1, $s2, $s0
    jal     eeprom_read
    addiu   $s0, $s0, 0x0008
    sltu    $v0, $s0, $s1
    bnez    $v0, .L800070E8
    srl     $a0, $s0, 3
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    daddu   $a0, $0, $0
    j       bi_set_save_type
    addiu   $sp, $sp, 0x0040
    nop

.globl os_80007120
os_80007120:
    lui     $v0, %hi(__str_80050720)
    lhu     $v1, %lo(__str_80050720)($v0)
    lhu     $v0, 0x0008($a0)
    beq     $v1, $v0, .L800071B0
    li      $v1, 0x0019
.L80007134:
    lui     $v1, %hi(__str_80050728)
    lhu     $v1, %lo(__str_80050728)($v1)
    beq     $v1, $v0, .L800071A8
    li      $v1, 0x001B
.L80007144:
    li      $v1, 0x4146
    beq     $v0, $v1, .L800071A0
    li      $v1, 0x0001
.L80007150:
    lui     $a1, 0xABA51D09 >> 16
    lw      $v1, 0x0018($a0)
    ori     $a1, 0xABA51D09 & 0xFFFF
    beq     $v1, $a1, .L80007198
    li      $a1, 0x0001
.L80007164:
    lui     $a1, 0xFA5A3DFF >> 16
    ori     $a1, 0xFA5A3DFF & 0xFFFF
    beq     $v1, $a1, .L80007190
    li      $v1, 0x0001
.L80007174:
    li      $v1, 0xED64
    beq     $v0, $v1, .L80007188
    li      $v0, 0x0001
    jr      $ra
    nop
.L80007188:
    jr      $ra
    sh      $v0, 0x0016($a0)
.L80007190:
    j       .L80007174
    sh      $v1, 0x0016($a0)
.L80007198:
    j       .L80007164
    sh      $a1, 0x0016($a0)
.L800071A0:
    j       .L80007150
    sh      $v1, 0x0014($a0)
.L800071A8:
    j       .L80007144
    sb      $v1, 0x0021($a0)
.L800071B0:
    j       .L80007134
    sb      $v1, 0x0021($a0)

.globl os_800071B8
os_800071B8:
    addiu   $sp, $sp, -0x0040
    sd      $s0, 0x0030($sp)
    addiu   $s0, $sp, 0x0020
    sd      $ra, 0x0038($sp)
    jal     BiRTCRd
    daddu   $a0, $s0, $0
    bnez    $v0, .L800071E0
    lbu     $v1, 0x0027($sp)
    bnez    $v1, .L800071F0
    li      $v1, 0x0002
.L800071E0:
    ld      $ra, 0x0038($sp)
.L800071E4:
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040
.L800071F0:
    li      $v0, 0x0001
    sb      $v1, 0x0024($sp)
    daddu   $a0, $s0, $0
    li      $v1, 0x0019
    sb      $v0, 0x0025($sp)
    sb      $v1, 0x0026($sp)
    sb      $0, 0x0020($sp)
    sb      $0, 0x0021($sp)
    sb      $0, 0x0022($sp)
    jal     BiRTCWr
    sb      $v0, 0x0023($sp)
    bnez    $v0, .L800071E4
    ld      $ra, 0x0038($sp)
    li      $a0, 0x00AA
    daddu   $a1, $0, $0
    li      $a2, 0x00020000
    jal     BiCartRamFill
    sd      $v0, 0x0028($sp)
    jal     os_80005CB0
    li      $a0, 0x0015
    j       .L800071E0
    ld      $v0, 0x0028($sp)

.globl os_80007248
os_80007248:
    addiu   $sp, $sp, -0x0050
    sd      $s4, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    sd      $ra, 0x0048($sp)
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    lui     $s4, %hi(_80051E38)
    sb      $0, 0x0000($a1)
    lw      $v0, %lo(_80051E38)($s4)
    daddu   $s3, $a1, $0
    beqz    $v0, .L80007318
    daddu   $s2, $a0, $0
    lui     $s0, %hi(_80051E38+4)
    addiu   $s0, %lo(_80051E38+4)
    j       .L8000729C
    daddu   $s1, $0, $0
    nop
.L80007290:
    addiu   $s1, $s1, 0x0001
    beqz    $v0, .L80007318
    addiu   $s0, $s0, 0x0004
.L8000729C:
    daddu   $a0, $v0, $0
    jal     os_80014F98
    daddu   $a1, $s2, $0
    beqzl   $v0, .L80007290
    lw      $v0, 0x0000($s0)
    lui     $a1, %hi(__str_80050730)
    daddu   $a0, $s3, $0
    jal     os_800152B0
    addiu   $a1, %lo(__str_80050730)
    addiu   $s4, %lo(_80051E38)
    lui     $a1, %hi(__str_80050738)
    sll     $s1, $s1, 2
    daddu   $a0, $s3, $0
    addu    $s1, $s1, $s4
    jal     os_800152B0
    addiu   $a1, %lo(__str_80050738)
    lw      $a1, 0x0000($s1)
    jal     os_800152B0
    daddu   $a0, $s3, $0
    lui     $a1, %hi(__str_80050740)
    daddu   $a0, $s3, $0
    ld      $ra, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    addiu   $a1, %lo(__str_80050740)
    j       os_800152B0
    addiu   $sp, $sp, 0x0050
    nop
.L80007318:
    ld      $ra, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050

.globl os_80007338
os_80007338:
    lui     $v0, %hi(iom_data_len)
    lui     $a0, %hi(iom_data)
    lw      $a1, %lo(iom_data_len)($v0)
    addiu   $sp, $sp, -0x0030
    sd      $ra, 0x0028($sp)
    jal     BiIOMWr
    addiu   $a0, %lo(iom_data)
    beqzl   $v0, .L80007368
    lui     $v0, %hi(mcn_data_len)
    ld      $ra, 0x0028($sp)
.L80007360:
    jr      $ra
    addiu   $sp, $sp, 0x0030
.L80007368:
    lui     $a0, %hi(mcn_data)
    lw      $a1, %lo(mcn_data_len)($v0)
    jal     BiMCNWr
    addiu   $a0, %lo(mcn_data)
    bnez    $v0, .L80007360
    ld      $ra, 0x0028($sp)
    jal     bi_init
    sd      $v0, 0x0020($sp)
    ld      $ra, 0x0028($sp)
    ld      $v0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030

.globl os_80007398
os_80007398:
    addiu   $sp, $sp, -0x0118
    sd      $s0, 0x0100($sp)
    lui     $s0, %hi(_80052908)
    lw      $v0, %lo(_80052908)($s0)
    sd      $ra, 0x0110($sp)
    sd      $s1, 0x0108($sp)
    lbu     $v1, 0x0054($v0)
    beqzl   $v1, .L800073D8
    ld      $ra, 0x0110($sp)
    lw      $a0, 0x005C($v0)
    bnez    $a0, .L80007420
    addiu   $s1, $sp, 0x0020
    lw      $a0, 0x0058($v0)
    bnez    $a0, .L800073F0
    addiu   $s0, $sp, 0x0020
    ld      $ra, 0x0110($sp)
.L800073D8:
    daddu   $v0, $0, $0
    ld      $s1, 0x0108($sp)
    ld      $s0, 0x0100($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0118
    nop
.L800073F0:
    jal     fat_os_80011390
    daddu   $a1, $s0, $0
    bnez    $v0, .L800073D8
    ld      $ra, 0x0110($sp)
    jal     os_8000A498
    daddu   $a0, $s0, $0
    beqzl   $v0, .L800073D8
    ld      $ra, 0x0110($sp)
    jal     os_80005CB0
    daddu   $a0, $v0, $0
    j       .L800073D8
    ld      $ra, 0x0110($sp)
.L80007420:
    jal     fat_os_80011390
    daddu   $a1, $s1, $0
    beqz    $v0, .L80007448
    lw      $v0, %lo(_80052908)($s0)
.L80007430:
    lw      $a0, 0x0058($v0)
    beqz    $a0, .L800073D8
    ld      $ra, 0x0110($sp)
    j       .L800073F0
    addiu   $s0, $sp, 0x0020
    nop
.L80007448:
    jal     os_8000A498
    daddu   $a0, $s1, $0
    beqzl   $v0, .L80007430
    lw      $v0, %lo(_80052908)($s0)
    jal     os_80005CB0
    daddu   $a0, $v0, $0
    j       .L80007430
    lw      $v0, %lo(_80052908)($s0)

.globl os_80007468
os_80007468:
    lui     $v0, %hi(_80052908)
    lw      $a0, %lo(_80052908)($v0)
    addiu   $sp, $sp, -0x0030
    daddu   $a1, $0, $0
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0028($sp)
    jal     fat_os_80011380
    addiu   $a0, $a0, 0x007C
    beqz    $v0, .L800074A8
    daddu   $s0, $v0, $0
.L80007490:
    ld      $ra, 0x0028($sp)
.L80007494:
    daddu   $v0, $s0, $0
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
    nop
.L800074A8:
    jal     fat_os_8000F7A0
    li      $s0, 0x0012
    lui     $v1, 0x0001F001 >> 16
    ori     $v1, 0x0001F001 & 0xFFFF
    sltu    $v0, $v0, $v1
    beqz    $v0, .L80007494
    ld      $ra, 0x0028($sp)
    jal     fat_os_8000F7A0
    nop
    daddu   $a1, $v0, $0
    jal     fat_os_800103A0
    li      $a0, 0x1000
    bnez    $v0, .L80007490
    daddu   $s0, $v0, $0
    jal     os_8000E948
    nop
    j       .L80007494
    ld      $ra, 0x0028($sp)

.globl os_800074F0
os_800074F0:
    addiu   $sp, $sp, -0x0050
    sd      $s1, 0x0038($sp)
    sd      $ra, 0x0048($sp)
    sd      $s2, 0x0040($sp)
    sd      $s0, 0x0030($sp)
    beqz    $a0, .L80007570
    daddu   $s1, $a1, $0
    addiu   $s0, $sp, 0x0020
    daddu   $a0, $s0, $0
    jal     os_800150C8
    sb      $0, 0x0020($sp)
    lw      $a0, 0x0018($s1)
    jal     os_80015280
    lui     $s2, %hi(__str_80050748)
    jal     os_800150C8
    daddu   $a0, $0, $0
    addiu   $s2, %lo(__str_80050748)
    lui     $a2, %hi(__str_8004F1F0)
    addiu   $a2, %lo(__str_8004F1F0)
    daddu   $a0, $s2, $0
    daddu   $a1, $s0, $0
    jal     fat_os_80011B80
    daddu   $a3, $0, $0
    beqz    $v0, .L80007590
    lui     $a2, %hi(__str_8004F1F8)
    daddu   $a0, $s2, $0
    daddu   $a1, $s0, $0
    addiu   $a2, %lo(__str_8004F1F8)
    jal     fat_os_80011B80
    daddu   $a3, $0, $0
    beqz    $v0, .L80007590
    nop
.L80007570:
    ld      $ra, 0x0048($sp)
    daddu   $v0, $0, $0
    ld      $s2, 0x0040($sp)
    ld      $s1, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
    nop
.L80007590:
    jal     fat_os_8000F7B0
    nop
    ld      $ra, 0x0048($sp)
    sw      $v0, 0x0004($s1)
    ld      $s2, 0x0040($sp)
    daddu   $v0, $0, $0
    ld      $s1, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050

.globl os_800075B8
os_800075B8:
    addiu   $sp, $sp, -0x0840
    sd      $s0, 0x0820($sp)
    daddu   $s0, $a1, $0
    sd      $s1, 0x0828($sp)
    daddu   $a1, $0, $0
    daddu   $s1, $a0, $0
    li      $a2, 0x0024
    daddu   $a0, $s0, $0
    sd      $ra, 0x0838($sp)
    jal     os_80014778
    sd      $s2, 0x0830($sp)
    beqz    $s1, .L80007744
    daddu   $a0, $s1, $0
    jal     fat_os_80011380
    daddu   $a1, $0, $0
    beqz    $v0, .L80007618
    addiu   $s2, $sp, 0x0020
.L800075FC:
    ld      $ra, 0x0838($sp)
    ld      $s2, 0x0830($sp)
    ld      $s1, 0x0828($sp)
    ld      $s0, 0x0820($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0840
    nop
.L80007618:
    daddu   $a0, $s2, $0
    jal     fat_os_80010840
    li      $a1, 0x0004
    bnez    $v0, .L800075FC
    lbu     $v1, 0x0020($sp)
.L8000762C:
    li      $v0, 0x0037
    beq     $v1, $v0, .L80007710
    lbu     $v1, 0x0021($sp)
    li      $v0, 0x0080
    beq     $v1, $v0, .L80007710
    addiu   $a0, $sp, 0x0030
    sh      $0, 0x0010($s0)
.L80007648:
    addiu   $a1, $s0, 0x0018
    jal     os_80014768
    li      $a2, 0x0004
    li      $a2, 0x0004
    addiu   $a0, $sp, 0x0034
    jal     os_80014768
    addiu   $a1, $s0, 0x001C
    lbu     $v0, 0x005C($sp)
    lbu     $v1, 0x005D($sp)
    sll     $v0, $v0, 8
    or      $v0, $v0, $v1
    lw      $a1, 0x0018($s0)
    daddu   $a0, $v0, $0
    jal     os_800085C0
    sh      $v0, 0x0008($s0)
    sh      $v0, 0x000A($s0)
    jal     os_8000E688
    daddu   $a0, $s2, $0
    sh      $v0, 0x000C($s0)
    jal     os_8000E5B8
    daddu   $a0, $s2, $0
    sh      $v0, 0x000E($s0)
    daddu   $a0, $s2, $0
    addiu   $a1, $s0, 0x0020
    jal     os_80014768
    li      $a2, 0x0004
    lbu     $v0, 0x0021($sp)
    lbu     $v1, 0x0021($sp)
    lbu     $a0, 0x0022($sp)
    lbu     $a1, 0x0023($sp)
    srl     $v0, $v0, 4
    andi    $v1, $v1, 0x000F
    sb      $a0, 0x0021($s0)
    sb      $v0, 0x0023($s0)
    sb      $a1, 0x0020($s0)
    sb      $v1, 0x0022($s0)
    jal     os_80007120
    daddu   $a0, $s0, $0
    beqz    $s1, .L800075FC
    daddu   $v0, $0, $0
    daddu   $a0, $s1, $0
    jal     os_800074F0
    daddu   $a1, $s0, $0
    ld      $ra, 0x0838($sp)
    daddu   $v0, $0, $0
    ld      $s2, 0x0830($sp)
    ld      $s1, 0x0828($sp)
    ld      $s0, 0x0820($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0840
.L80007710:
    li      $v0, 0x0001
    sh      $v0, 0x0010($s0)
    addiu   $a1, $sp, 0x0820
    daddu   $v0, $s2, $0
    lbu     $a0, 0x0000($v0)
.L80007724:
    lbu     $v1, 0x0001($v0)
    sb      $a0, 0x0001($v0)
    sb      $v1, 0x0000($v0)
    addiu   $v0, $v0, 0x0002
    bnel    $v0, $a1, .L80007724
    lbu     $a0, 0x0000($v0)
    j       .L80007648
    addiu   $a0, $sp, 0x0030
.L80007744:
    addiu   $s2, $sp, 0x0020
    daddu   $a0, $s2, $0
    daddu   $a1, $0, $0
    jal     BiCartRomRd
    li      $a2, 0x0800
    j       .L8000762C
    lbu     $v1, 0x0020($sp)

.globl os_80007760
os_80007760:
    addiu   $sp, $sp, -0x0060
    sd      $ra, 0x0058($sp)
    sd      $s0, 0x0050($sp)
    lui     $v0, %hi(_80078CF8)
    lbu     $s0, %lo(_80078CF8)($v0)
    lui     $v0, %hi(_80052908)
    lw      $v0, %lo(_80052908)($v0)
    sltu    $s0, $0, $s0
    lbu     $v0, 0x0051($v0)
    subu    $s0, $0, $s0
    beqz    $v0, .L800077A0
    and     $s0, $a0, $s0
    lui     $v0, %hi(_8007BDDA+1)
    lbu     $v0, %lo(_8007BDDA+1)($v0)
    bnez    $v0, .L80007890
    nop
.L800077A0:
    jal     diskCloseRW
    nop
    jal     BiLockRegs
    nop
    jal     sysVsync
    nop
    jal     sysDisplayOFF
    nop
    daddu   $a0, $0, $0
    jal     os_800075B8
    addiu   $a1, $sp, 0x0028
    lui     $v0, 0xA460002C >> 16
    lui     $v1, 0xA4400024 >> 16
    ori     $a2, $v1, 0x0010
    ori     $a3, $v1, 0x000C
    ori     $a1, $v0, 0x0010
    li      $a0, 0x0003
    ori     $v1, 0xA4400024 & 0xFFFF
    li      $t0, 0x03FF
    sw      $t0, 0x0000($a3)
    sw      $0, 0x0000($v1)
    sw      $0, 0x0000($a2)
    sw      $a0, 0x0000($a1)
    lbu     $a1, 0x0048($sp)
    ori     $v1, $v0, 0x0014
    sw      $a1, 0x0000($v1)
    lbu     $a1, 0x0049($sp)
    ori     $v1, $v0, 0x0018
    sw      $a1, 0x0000($v1)
    lbu     $a1, 0x004A($sp)
    ori     $v1, $v0, 0x001C
    sw      $a1, 0x0000($v1)
    lbu     $t1, 0x004B($sp)
    ori     $t0, $v0, 0x0020
    sw      $t1, 0x0000($t0)
    ori     $a3, $v0, 0x0024
    li      $t0, 0x0040
    sw      $t0, 0x0000($a3)
    ori     $a2, $v0, 0x0028
    li      $a3, 0x0012
    lhu     $v1, 0x003E($sp)
    sw      $a3, 0x0000($a2)
    ori     $a1, $v0, 0x0030
    li      $a2, 0x0007
    ori     $v0, 0xA460002C & 0xFFFF
    sw      $a2, 0x0000($v0)
    sw      $a0, 0x0000($a1)
    bnez    $v1, .L80007870
    lui     $v0, %hi(sys_boot_strap)
    lw      $v0, %lo(sys_boot_strap)($v0)
    lhu     $v1, 0x0034($sp)
    sw      $v1, 0x0000($v0)
.L80007870:
    lbu     $a0, 0x0037($sp)
    jal     os_80004DD8
    daddu   $a1, $s0, $0
    ld      $ra, 0x0058($sp)
    ld      $s0, 0x0050($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060
    nop
.L80007890:
    jal     os_8000E948
    nop
    beqz    $v0, .L800077A0
    nop
    jal     os_80012B60
    li      $a0, 0x0500
    li      $v0, 0x001E
    li      $a0, 0x0020
    daddu   $a1, $0, $0
    daddu   $a2, $0, $0
    li      $a3, 0x0028
    jal     os_800131E8
    sw      $v0, 0x0024($sp)
    jal     sysRepaint
    nop
    jal     sleep
    li      $a0, 0x00C8
    j       .L800077A0
    nop
    nop

.globl os_800078E0
os_800078E0:
    addiu   $sp, $sp, -0x0040
    li      $a0, 0x02D0
    li      $a1, 0x0200
    sd      $ra, 0x0038($sp)
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    jal     sys_800064C8
    sd      $s2, 0x0030($sp)
    lui     $a0, %hi(__str_80050758)
    addiu   $a0, %lo(__str_80050758)
    daddu   $a1, $0, $0
    jal     fat_os_80011AB8
    daddu   $s1, $v0, $0
    beqz    $v0, .L80007938
    daddu   $s0, $v0, $0
.L8000791C:
    ld      $ra, 0x0038($sp)
    daddu   $v0, $s0, $0
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040
.L80007938:
    lui     $s2, %hi(_80052908)
    srl     $a1, $s1, 9
    lw      $a0, %lo(_80052908)($s2)
    jal     fat_os_80010840
    andi    $a1, $a1, 0xFFFF
    bnez    $v0, .L8000791C
    daddu   $s0, $v0, $0
    lw      $v0, %lo(_80052908)($s2)
    li      $a1, 0x02C8
    lhu     $s1, 0x02C8($v0)
    daddu   $a0, $v0, $0
    jal     sys_80006558
    daddu   $a2, $0, $0
    beq     $s1, $v0, .L8000791C
    ld      $ra, 0x0038($sp)
    li      $s0, 0x0010
    daddu   $v0, $s0, $0
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040

.globl os_80007990
os_80007990:
    addiu   $sp, $sp, -0x0040
    sd      $s1, 0x0028($sp)
    li      $a0, 0x02D0
    li      $a1, 0x0200
    lui     $s1, %hi(_80052908)
    sd      $ra, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    jal     sys_800064C8
    sd      $s0, 0x0020($sp)
    lw      $s0, %lo(_80052908)($s1)
    daddu   $s2, $v0, $0
    li      $a1, 0x02C8
    daddu   $a0, $s0, $0
    daddu   $a2, $0, $0
    jal     sys_80006558
    srl     $s2, $s2, 9
    andi    $s2, $s2, 0xFFFF
    lui     $a0, %hi(__str_80050758)
    sh      $v0, 0x02C8($s0)
    addiu   $a0, %lo(__str_80050758)
    jal     fat_os_80011AB8
    daddu   $a1, $s2, $0
    beqz    $v0, .L80007A08
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040
    nop
.L80007A08:
    lw      $a0, %lo(_80052908)($s1)
    daddu   $a1, $s2, $0
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       fat_os_80010970
    addiu   $sp, $sp, 0x0040
    nop

.globl os_80007A28
os_80007A28:
    addiu   $sp, $sp, -0x06F8
    sd      $ra, 0x06F0($sp)
    sd      $s0, 0x06D0($sp)
    sd      $s3, 0x06E8($sp)
    sd      $s2, 0x06E0($sp)
    sd      $s1, 0x06D8($sp)
    jal     os_80013370
    lui     $s0, %hi(_80052908)
    jal     os_80012DE0
    li      $a0, 0x000D
    lw      $v0, %lo(_80052908)($s0)
    lw      $v1, 0x008C($v0)
    li      $v0, 0x8001
    sltu    $v0, $v1, $v0
    beqz    $v0, .L80007BC0
    lui     $a0, %hi(__str_8004F0A8)
.L80007A68:
    jal     sysRepaint
    nop
    jal     os_80007990
    nop
    bnez    $v0, .L80007BA0
    lui     $s1, %hi(_80078CF0)
    addiu   $s1, %lo(_80078CF0)
    lbu     $v0, 0x0005($s1)
    beqz    $v0, .L80007BD0
    lw      $a0, %lo(_80052908)($s0)
    lbu     $v0, 0x0050($a0)
    bnez    $v0, .L80007BF0
    daddu   $s2, $0, $0
.L80007A9C:
    lhu     $v0, 0x006A($a0)
    beqz    $v0, .L80007C18
    addiu   $s3, $sp, 0x0028
    addiu   $a0, $a0, 0x0094
    jal     os_80007248
    daddu   $a1, $s3, $0
    daddu   $a0, $s3, $0
    jal     fat_os_80011AB8
    daddu   $a1, $0, $0
    li      $v1, 0x00F0
    beql    $v0, $v1, .L80007BA0
    li      $v0, 0x0018
.L80007ACC:
    bnez    $v0, .L80007BA4
    ld      $ra, 0x06F0($sp)
    jal     fat_os_8000F7A0
    nop
    lui     $v1, 0x00020001 >> 16
    ori     $v1, 0x00020001 & 0xFFFF
    sltu    $v1, $v0, $v1
    daddu   $s3, $v0, $0
    beqz    $v1, .L80007BA0
    li      $v0, 0x0012
    sltiu   $v0, $s3, 0x0808
    bnez    $v0, .L80007C70
    lw      $v1, %lo(_80052908)($s0)
    sltiu   $v0, $s3, 0x4001
    lhu     $a0, 0x0068($v1)
    bnez    $v0, .L80007B20
    sltu    $a0, $0, $a0
    lui     $v0, %hi(_8007BDDA+1)
    lbu     $v0, %lo(_8007BDDA+1)($v0)
    beqzl   $v0, .L80007B20
    xori    $a0, $a0, 0x0001
.L80007B20:
    jal     bi_wr_swap
    nop
    daddu   $a1, $s3, $0
    jal     fat_os_800103A0
    daddu   $a0, $0, $0
    daddu   $a0, $0, $0
    jal     bi_wr_swap
    sd      $v0, 0x06C8($sp)
    ld      $v0, 0x06C8($sp)
    bnez    $v0, .L80007BA4
    ld      $ra, 0x06F0($sp)
    lw      $v0, %lo(_80052908)($s0)
    lhu     $v1, 0x006A($v0)
    bnez    $v1, .L80007C90
    nop
.L80007B5C:
    lhu     $a0, 0x0066($v0)
    li      $v1, 0x0007
    beq     $a0, $v1, .L80007CB0
    nop
    jal     bi_set_save_type
    lbu     $a0, 0x0063($v0)
    lw      $v0, %lo(_80052908)($s0)
.L80007B78:
    lhu     $v0, 0x006C($v0)
    beqz    $v0, .L80007B90
    nop
    lbu     $v0, 0x0006($s1)
    bnez    $v0, .L80007C48
    addiu   $s0, $sp, 0x0020
.L80007B90:
    jal     os_80007398
    nop
    beqz    $v0, .L80007C30
    nop
.L80007BA0:
    ld      $ra, 0x06F0($sp)
.L80007BA4:
    ld      $s3, 0x06E8($sp)
    ld      $s2, 0x06E0($sp)
    ld      $s1, 0x06D8($sp)
    ld      $s0, 0x06D0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x06F8
    nop
.L80007BC0:
    jal     os_80013300
    addiu   $a0, %lo(__str_8004F0A8)
    j       .L80007A68
    nop
.L80007BD0:
    jal     os_80008C48
    nop
    bnez    $v0, .L80007BA0
    lw      $a0, %lo(_80052908)($s0)
    lbu     $v0, 0x0050($a0)
    beqz    $v0, .L80007A9C
    daddu   $s2, $0, $0
    nop
.L80007BF0:
    addiu   $s2, $sp, 0x0068
    addiu   $a0, $a0, 0x0094
    jal     os_800028E0
    daddu   $a1, $s2, $0
    bnez    $v0, .L80007BA4
    ld      $ra, 0x06F0($sp)
    lui     $v0, %hi(_80052908)
    j       .L80007A9C
    lw      $a0, %lo(_80052908)($v0)
    nop
.L80007C18:
    addiu   $a0, $a0, 0x007C
    jal     fat_os_80011380
    daddu   $a1, $0, $0
    j       .L80007ACC
    nop
    nop
.L80007C30:
    jal     BiBootCfgSet
    li      $a0, 0x0008
    jal     os_80007760
    daddu   $a0, $s2, $0
    j       .L80007BA0
    li      $v0, 0x0013
.L80007C48:
    jal     BiRTCRd
    daddu   $a0, $s0, $0
    bnez    $v0, .L80007BA4
    ld      $ra, 0x06F0($sp)
    daddu   $a0, $s0, $0
    jal     BiRTCSet
    li      $a1, 0x0001
    j       .L80007B90
    nop
    nop
.L80007C70:
    daddu   $a0, $0, $0
    li      $a1, 0x1000
    jal     BiCartRomFill
    li      $a2, 0x00100000
    lw      $v0, %lo(_80052908)($s0)
    lhu     $a0, 0x0068($v0)
    j       .L80007B20
    sltu    $a0, $0, $a0
.L80007C90:
    jal     os_80007468
    nop
    bnez    $v0, .L80007BA4
    ld      $ra, 0x06F0($sp)
    lui     $v0, %hi(_80052908)
    j       .L80007B5C
    lw      $v0, %lo(_80052908)($v0)
    nop
.L80007CB0:
    jal     BiDDTblWr
    nop
    lw      $v0, %lo(_80052908)($s0)
    lbu     $a0, 0x0063($v0)
    ori     $a0, $a0, 0x0010
    jal     bi_set_save_type
    andi    $a0, $a0, 0x00FF
    j       .L80007B78
    lw      $v0, %lo(_80052908)($s0)
    nop

.globl os_80007CD8
os_80007CD8:
    addiu   $sp, $sp, -0x0060
    sd      $s5, 0x0048($sp)
    sd      $s0, 0x0020($sp)
    lui     $s5, %hi(_80078CF0)
    lui     $s0, %hi(_80052910)
    sd      $s6, 0x0050($sp)
    sd      $s4, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0058($sp)
    addiu   $s5, %lo(_80078CF0)
    lui     $s1, %hi(_80052908)
    daddu   $s6, $s0, $0
    li      $s2, 0x0001
    li      $s3, 0x0002
    li      $s4, 0x0003
    lw      $a0, %lo(_80052910)($s0)
.L80007D20:
    lw      $v0, %lo(_80052908)($s1)
.L80007D24:
    lbu     $v0, 0x0052($v0)
    beqzl   $v0, .L80007D38
    sw      $0, 0x0084($a0)
    lw      $v0, 0x000C($s5)
    sw      $v0, 0x0084($a0)
.L80007D38:
    jal     os_800128D8
    nop
    bnez    $v0, .L80007D74
    lw      $a0, %lo(_80052910)($s0)
    lhu     $v0, 0x008C($a0)
    beq     $v0, $s2, .L80007DA0
    nop
    beq     $v0, $s3, .L80007DC0
    nop
.L80007D5C:
    bne     $v0, $s4, .L80007D24
    lw      $v0, %lo(_80052908)($s1)
.L80007D64:
    jal     os_80007A28
    nop
    beqz    $v0, .L80007D20
    lw      $a0, %lo(_80052910)($s0)
.L80007D74:
    ld      $ra, 0x0058($sp)
    ld      $s6, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060
    nop
.L80007DA0:
    jal     os_80004BB0
    addiu   $a0, $a0, 0x0094
    bnez    $v0, .L80007D74
    lw      $a0, 0x2910($s6)
    lhu     $v0, 0x008C($a0)
    bne     $v0, $s3, .L80007D5C
    nop
    nop
.L80007DC0:
    jal     os_80006B58
    nop
    bnez    $v0, .L80007D74
    lw      $a0, %lo(_80052910)($s0)
    lhu     $v0, 0x008C($a0)
    bne     $v0, $s4, .L80007D24
    lw      $v0, %lo(_80052908)($s1)
    j       .L80007D64
    nop
    nop

.globl os_80007DE8
os_80007DE8:
    addiu   $sp, $sp, -0x0090
    sd      $ra, 0x0088($sp)
    sd      $s3, 0x0080($sp)
    sd      $s1, 0x0070($sp)
    andi    $s3, $a1, 0x00FF
    sd      $s0, 0x0068($sp)
    sd      $s2, 0x0078($sp)
    jal     os_80013370
    daddu   $s0, $a0, $0
    jal     os_80012DE0
    li      $a0, 0x000D
    lui     $s1, %hi(_80078CF0)
    lui     $a0, %hi(__str_80050770)
    addiu   $a0, %lo(__str_80050770)
    jal     os_80013300
    addiu   $s1, %lo(_80078CF0)
    jal     sysRepaint
    nop
    lbu     $v0, 0x0005($s1)
    beqz    $v0, .L80007E4C
    addiu   $s2, $sp, 0x0020
    jal     os_80008D90
    nop
    bnez    $v0, .L80007EAC
    ld      $ra, 0x0088($sp)
.L80007E4C:
    addiu   $a0, $s0, 0x0018
    jal     os_80007248
    daddu   $a1, $s2, $0
    lbu     $v0, 0x0020($sp)
    bnez    $v0, .L80007EC8
    daddu   $a0, $s2, $0
    lui     $s2, %hi(_80052908)
    lw      $a1, %lo(_80052908)($s2)
    daddu   $a0, $s0, $0
    jal     os_800075B8
    addiu   $a1, $a1, 0x0058
    bnez    $v0, .L80007EA8
    lw      $a1, %lo(_80052908)($s2)
    daddu   $a0, $s0, $0
    addiu   $a1, $a1, 0x007C
    jal     os_80014768
    li      $a2, 0x00DC
    bnezl   $s3, .L80007F28
    lw      $a1, 0x0000($s0)
.L80007E98:
    jal     os_80007990
    nop
    beqzl   $v0, .L80007F44
    lw      $v0, %lo(_80052908)($s2)
.L80007EA8:
    ld      $ra, 0x0088($sp)
.L80007EAC:
    ld      $s3, 0x0080($sp)
    ld      $s2, 0x0078($sp)
    ld      $s1, 0x0070($sp)
    ld      $s0, 0x0068($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0090
    nop
.L80007EC8:
    jal     fat_os_80011AB8
    daddu   $a1, $0, $0
    daddu   $v1, $v0, $0
    beqz    $v1, .L80007F78
    li      $a0, 0x00F0
    bne     $v1, $a0, .L80007EAC
    ld      $ra, 0x0088($sp)
    lui     $s2, %hi(_80052908)
    lw      $a0, %lo(_80052908)($s2)
    daddu   $a1, $0, $0
    addiu   $a0, $a0, 0x0058
    jal     os_80014778
    li      $a2, 0x0024
    lw      $a1, %lo(_80052908)($s2)
.L80007F00:
    li      $v0, 0x0001
    sh      $v0, 0x006E($a1)
    sh      $v0, 0x006A($a1)
    daddu   $a0, $s0, $0
    addiu   $a1, $a1, 0x007C
    jal     os_80014768
    li      $a2, 0x00DC
    beqz    $s3, .L80007E98
    nop
    lw      $a1, 0x0000($s0)
.L80007F28:
    jal     os_80014780
    lw      $a0, %lo(_80052908)($s2)
    jal     os_80007990
    nop
    bnez    $v0, .L80007EAC
    ld      $ra, 0x0088($sp)
    lw      $v0, %lo(_80052908)($s2)
.L80007F44:
    jal     os_80014A50
    lw      $a0, 0x007C($v0)
    bnez    $v0, .L80007EAC
    ld      $ra, 0x0088($sp)
    jal     sysRepaint
    sd      $v0, 0x0060($sp)
    lbu     $v1, 0x0005($s1)
    beqz    $v1, .L80007EA8
    ld      $v0, 0x0060($sp)
    jal     os_80008C48
    nop
    j       .L80007EAC
    ld      $ra, 0x0088($sp)
.L80007F78:
    lui     $s2, %hi(_80052908)
    lw      $a0, %lo(_80052908)($s2)
    daddu   $a1, $0, $0
    addiu   $a0, $a0, 0x0058
    jal     os_80014778
    li      $a2, 0x0024
    daddu   $a0, $0, $0
    jal     fat_os_800103A0
    li      $a1, 0x0008
    bnez    $v0, .L80007EAC
    ld      $ra, 0x0088($sp)
    lw      $a1, %lo(_80052908)($s2)
    daddu   $a0, $0, $0
    jal     os_800075B8
    addiu   $a1, $a1, 0x0058
    j       .L80007F00
    lw      $a1, %lo(_80052908)($s2)
    nop

.globl os_80007FC0
os_80007FC0:
    addiu   $sp, $sp, -0x0078
    lui     $v0, %hi(_80052910)
    sd      $s6, 0x0058($sp)
    lw      $s6, %lo(_80052910)($v0)
    lui     $a0, %hi(_80051E50)
    sd      $s5, 0x0050($sp)
    addiu   $a0, %lo(_80051E50)
    lw      $s5, 0x0080($s6)
    li      $a1, 0x0002
    sd      $s8, 0x0068($sp)
    sd      $s7, 0x0060($sp)
    sd      $s4, 0x0048($sp)
    sd      $s3, 0x0040($sp)
    sd      $s2, 0x0038($sp)
    sd      $s0, 0x0028($sp)
    sd      $ra, 0x0070($sp)
    sd      $s1, 0x0030($sp)
    jal     os_80014468
    lui     $s8, %hi(_80078CF0)
    addiu   $v0, $s6, 0x00AC
    li      $v1, 0x0001
    sw      $v0, 0x0020($sp)
    addiu   $s8, %lo(_80078CF0)
    addiu   $s7, $s6, 0x0094
    daddu   $s3, $s5, $0
    daddu   $v0, $0, $0
    daddu   $s2, $0, $0
    daddu   $s0, $0, $0
    bnez    $v1, .L80008060
    li      $s4, 0x0100
.L80008038:
    bnez    $s2, .L80008140
    daddu   $s3, $s5, $0
    daddu   $s1, $v0, $0
    li      $v1, 0x0001
.L80008048:
    addiu   $s0, $s0, 0x0001
    andi    $s0, $s0, 0xFFFF
    beq     $s0, $s4, .L800080FC
    lui     $a0, %hi(_80051E58)
.L80008058:
    beqz    $v1, .L80008038
    daddu   $v0, $s1, $0
.L80008060:
    jal     fat_os_80011460
    daddu   $a0, $s3, $0
    bnez    $v0, .L80008110
    ld      $ra, 0x0070($sp)
    jal     fat_os_8000F7C0
    li      $s1, 0x0009
    sltiu   $v1, $v0, 0x000A
    daddu   $s2, $v0, $0
    bnez    $v1, .L80008038
    andi    $v0, $v0, 0x00FF
.L80008088:
    jal     SysRandom
    nop
    jal     fat_os_8000F7C0
    daddu   $s3, $v0, $0
    divu    $0, $s3, $v0
    teq     $v0, $0, 7
    mfhi    $a0
    jal     fat_os_8000F7F0
    andi    $a0, $a0, 0xFFFF
    daddu   $a0, $v0, $0
    daddu   $a1, $s7, $0
    jal     fat_os_80011390
    daddu   $s3, $v0, $0
    lhu     $v0, 0x00A8($s6)
    beqz    $v0, .L800080D8
    lui     $a0, %hi(_80051E68)
    lw      $v0, 0x000C($s8)
    bne     $s3, $v0, .L80008048
    li      $v1, 0x0001
    li      $a0, 0x80050000
.L800080D8:
    lw      $a1, 0x0020($sp)
    jal     os_80014FE0
    addiu   $a0, %lo(_80051E68)
    bnez    $v0, .L80008158
    addiu   $s0, $s0, 0x0001
    andi    $s0, $s0, 0xFFFF
    bne     $s0, $s4, .L80008058
    daddu   $v1, $0, $0
    li      $a0, 0x80050000
.L800080FC:
    addiu   $a0, %lo(_80051E58)
    jal     os_80014468
    daddu   $a1, $0, $0
    daddu   $v0, $0, $0
    ld      $ra, 0x0070($sp)
.L80008110:
    ld      $s8, 0x0068($sp)
    ld      $s7, 0x0060($sp)
    ld      $s6, 0x0058($sp)
    ld      $s5, 0x0050($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0078
    nop
.L80008140:
    addiu   $s1, $v0, -0x0001
    bnez    $v0, .L80008088
    andi    $s1, $s1, 0x00FF
    daddu   $s3, $s5, $0
    j       .L80008048
    li      $v1, 0x0001
.L80008158:
    daddu   $a0, $s7, $0
    ld      $ra, 0x0070($sp)
    ld      $s8, 0x0068($sp)
    ld      $s7, 0x0060($sp)
    ld      $s6, 0x0058($sp)
    ld      $s5, 0x0050($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    li      $a1, 0x0001
    j       os_80007DE8
    addiu   $sp, $sp, 0x0078

.globl os_80008190
os_80008190:
    lui     $v0, %hi(_80052908)
    addiu   $sp, $sp, -0x0038
    lw      $a0, %lo(_80052908)($v0)
    addiu   $a1, $sp, 0x0020
    sd      $ra, 0x0030($sp)
    sd      $s0, 0x0028($sp)
    jal     os_800147A8
    sw      $0, 0x0020($sp)
    bnez    $v0, .L800081C8
    ld      $ra, 0x0030($sp)
    lw      $a0, 0x0020($sp)
    bnez    $a0, .L800081D8
    lui     $s0, %hi(_80052910)
    ld      $ra, 0x0030($sp)
.L800081C8:
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop
.L800081D8:
    lw      $a1, %lo(_80052910)($s0)
    jal     fat_os_80011390
    addiu   $a1, $a1, 0x0094
    bnez    $v0, .L800081C8
    ld      $ra, 0x0030($sp)
    lw      $a0, %lo(_80052910)($s0)
    daddu   $a1, $0, $0
    jal     os_80007DE8
    addiu   $a0, $a0, 0x0094
    bnezl   $v0, .L800081C8
    ld      $ra, 0x0030($sp)
    jal     os_80007A28
    nop
    j       .L800081C8
    ld      $ra, 0x0030($sp)
    nop

.globl os_80008218
os_80008218:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    li      $a0, 0x02D0
    lui     $s0, %hi(_80052908)
    sd      $ra, 0x0028($sp)
    jal     sys_800064C8
    li      $a1, 0x0200
    lw      $a0, %lo(_80052908)($s0)
    daddu   $a2, $v0, $0
    jal     os_80014778
    daddu   $a1, $0, $0
    lw      $v0, %lo(_80052908)($s0)
    li      $v1, 0x0001
    sb      $v1, 0x0054($v0)
    sb      $0, 0x02CC($v0)
    sb      $v1, 0x0051($v0)
    sb      $v1, 0x0050($v0)
    sb      $v1, 0x0053($v0)
    li      $a0, 0x444D
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    sh      $a0, 0x02CA($v0)
    j       os_80007990
    addiu   $sp, $sp, 0x0030

.globl os_80008278
os_80008278:
    addiu   $sp, $sp, -0x0038
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0030($sp)
    lui     $v0, %hi(_8007BDDA)
    lui     $s1, %hi(_80078CF0)
    lbu     $v0, %lo(_8007BDDA)($v0)
    addiu   $s0, $s1, %lo(_80078CF0)
    li      $v1, 0x0013
    beq     $v0, $v1, .L80008338
    sb      $0, 0x0003($s0)
    li      $v1, 0x0014
    bne     $v0, $v1, .L800082B4
    li      $v0, 0x0005
    sb      $v0, 0x0003($s0)
.L800082B4:
    jal     BiGetMCNVer
    nop
    jal     BiGetIOMVer
    sb      $v0, %lo(_80078CF0)($s1)
    sb      $v0, 0x0001($s0)
    li      $v0, 0x0301
    jal     sysGetTvType
    sh      $v0, 0x000A($s0)
    lbu     $v1, 0x0003($s0)
    lui     $a0, %hi(sys_boot_strap)
    xori    $v1, $v1, 0x0007
    sltiu   $v1, $v1, 0x0001
    lw      $a0, %lo(sys_boot_strap)($a0)
    sb      $v0, 0x0002($s0)
    sb      $v1, 0x0006($s0)
    sb      $v1, 0x0005($s0)
    lw      $v1, 0x0018($a0)
    lui     $v0, 0x00400001 >> 16
    ori     $v0, 0x00400001 & 0xFFFF
    sltu    $v0, $v1, $v0
    xori    $v0, $v0, 0x0001
    sb      $v0, 0x0008($s0)
    sb      $0, 0x0007($s0)
    lui     $a0, %hi(__str_80050730)
    lui     $a1, %hi(_80078CFC)
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    addiu   $a0, %lo(__str_80050730)
    addiu   $a1, %lo(_80078CFC)
    j       fat_os_80011668
    addiu   $sp, $sp, 0x0038
    nop
.L80008338:
    li      $v0, 0x0007
    j       .L800082B4
    sb      $v0, 0x0003($s0)
    nop

.globl os_80008348
os_80008348:
    addiu   $sp, $sp, -0x0050
    sd      $s0, 0x0040($sp)
    addiu   $s0, $sp, 0x0020
    daddu   $a0, $s0, $0
    li      $a1, 0x0020
    sd      $ra, 0x0048($sp)
    jal     BiBootRomRd
    li      $a2, 0x0020
    lui     $a0, %hi(__str_80050780)
    daddu   $a1, $s0, $0
    jal     os_80014DD8
    addiu   $a0, %lo(__str_80050780)
    ld      $ra, 0x0048($sp)
    sltiu   $v0, $v0, 0x0001
    sll     $v0, $v0, 5
    ld      $s0, 0x0040($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050

.globl os_80008390
os_80008390:
    addiu   $sp, $sp, -0x0050
    sd      $ra, 0x0048($sp)
    sd      $s3, 0x0040($sp)
    sd      $s2, 0x0038($sp)
    sd      $s1, 0x0030($sp)
    jal     os_800145C8
    sd      $s0, 0x0028($sp)
    jal     sysInit
    lui     $s2, %hi(_8005290C)
    jal     malloc
    li      $a0, 0x1400
    li      $a1, 0x0200
    li      $a0, 0x02D0
    jal     sys_800064C8
    sw      $v0, %lo(_8005290C)($s2)
    jal     malloc
    daddu   $a0, $v0, $0
    lui     $a0, %hi(_80078390)
    addiu   $v1, $v0, 0x0158
    addiu   $a0, %lo(_80078390)
    lui     $s1, %hi(_80052908)
    lui     $s3, %hi(_80052910)
    sw      $v1, %lo(_80052910)($s3)
    jal     os_800133E8
    sw      $v0, %lo(_80052908)($s1)
    lui     $a0, %hi(__str_80050798)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050798)
    jal     sysRepaint
    lui     $s0, %hi(_80078CF0)
    jal     bi_init
    addiu   $s0, %lo(_80078CF0)
    jal     BiBootCfgGet
    li      $a0, 0x0001
    sltiu   $v0, $v0, 0x0001
    jal     os_80008348
    sb      $v0, 0x0004($s0)
    bnez    $v0, .L8000845C
    ld      $ra, 0x0048($sp)
    lbu     $v0, 0x0004($s0)
    beqz    $v0, .L80008448
    nop
    jal     os_80007338
    nop
    bnez    $v0, .L8000845C
    ld      $ra, 0x0048($sp)
.L80008448:
    jal     diskInit
    nop
    beqz    $v0, .L80008478
    nop
.L80008458:
    ld      $ra, 0x0048($sp)
.L8000845C:
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
    nop
.L80008478:
    jal     fat_os_80011C90
    lw      $a0, %lo(_8005290C)($s2)
    bnez    $v0, .L8000845C
    ld      $ra, 0x0048($sp)
    jal     os_800078E0
    nop
    li      $v1, 0x00F0
    beq     $v0, $v1, .L80008580
    li      $v1, 0x0010
    beq     $v0, $v1, .L80008580
    nop
    bnez    $v0, .L8000845C
    ld      $ra, 0x0048($sp)
.L800084AC:
    jal     os_80014CF8
    lbu     $a0, 0x0004($s0)
    bnez    $v0, .L8000845C
    ld      $ra, 0x0048($sp)
    jal     os_80008278
    nop
    lbu     $v0, 0x0004($s0)
    beqz    $v0, .L800084EC
    lw      $a0, %lo(_80052910)($s3)
    daddu   $a1, $0, $0
    jal     os_80014778
    li      $a2, 0x0170
    jal     os_80007990
    nop
    bnez    $v0, .L8000845C
    ld      $ra, 0x0048($sp)
.L800084EC:
    jal     BiBootCfgSet
    li      $a0, 0x0001
    jal     os_800071B8
    nop
    bnez    $v0, .L8000845C
    ld      $ra, 0x0048($sp)
    jal     os_80008E80
    nop
    bnez    $v0, .L8000845C
    ld      $ra, 0x0048($sp)
    jal     BiBootCfgGet
    li      $a0, 0x0008
    beqz    $v0, .L80008558
    lw      $v0, %lo(_80052908)($s1)
    lhu     $v1, 0x0066($v0)
    li      $v0, 0x0007
    beq     $v1, $v0, .L800085A8
    nop
    lbu     $v0, 0x0005($s0)
.L80008538:
    bnez    $v0, .L80008550
    nop
    jal     os_80008D90
    nop
    bnez    $v0, .L8000845C
    ld      $ra, 0x0048($sp)
.L80008550:
    jal     BiBootCfgClr
    li      $a0, 0x0008
.L80008558:
    jal     bios_os_80000788
    nop
    bnez    $v0, .L80008458
    lui     $v1, %hi(_8007BDB4)
    lhu     $v1, %lo(_8007BDB4)($v1)
    sltiu   $v1, $v1, 0x0302
    beqzl   $v1, .L80008458
    li      $v0, 0x0014
    j       .L8000845C
    ld      $ra, 0x0048($sp)
.L80008580:
    jal     os_80008218
    nop
    li      $a0, 0x0010
    jal     os_80005CB0
    sd      $v0, 0x0020($sp)
    ld      $v0, 0x0020($sp)
    bnez    $v0, .L8000845C
    ld      $ra, 0x0048($sp)
    j       .L800084AC
    nop
.L800085A8:
    jal     os_800088D0
    nop
    beqzl   $v0, .L80008538
    lbu     $v0, 0x0005($s0)
    j       .L8000845C
    ld      $ra, 0x0048($sp)

.globl os_800085C0
os_800085C0:
    lui     $v1, %hi(_80078D00)
    addiu   $v1, %lo(_80078D00)
    lui     $t7, %hi(_80078D00+10)
    andi    $a0, $a0, 0xFFFF
    addiu   $t7, %lo(_80078D00+10)
    daddu   $v0, $0, $0
    daddu   $t2, $v1, $0
    li      $t1, 0x0030
    li      $t3, 0x0058
    j       .L800085FC
    li      $t6, 0x003D
    nop
.L800085F0:
    slti    $v0, $a2, 0x1000
.L800085F4:
    beqz    $v0, .L800086B8
    daddu   $v0, $a2, $0
.L800085FC:
    addu    $t0, $v0, $v1
    lbu     $a3, 0x0000($t0)
    beqzl   $a3, .L800086BC
    srl     $t1, $a0, 8
    bne     $a3, $t1, .L800085F0
    addiu   $a2, $v0, 0x0001
    addu    $a3, $a2, $t2
    lbu     $a3, 0x0000($a3)
    bnel    $a3, $t3, .L800085F4
    slti    $v0, $a2, 0x1000
    lbu     $a3, 0x000A($t0)
    bnel    $a3, $t6, .L800085F4
    slti    $v0, $a2, 0x1000
    addiu   $t8, $v0, 0x0002
    addu    $a2, $t2, $t8
    addu    $v0, $t7, $v0
    j       .L8000865C
    daddu   $t0, $0, $0
    nop
.L80008648:
    sll     $t0, $t0, 4
    andi    $a3, $a3, 0x000F
    addiu   $a2, $a2, 0x0001
    beq     $a2, $v0, .L8000868C
    or      $t0, $a3, $t0
.L8000865C:
    lbu     $a3, 0x0000($a2)
    addiu   $t5, $a3, -0x0037
    addiu   $t4, $a3, -0x0030
    sltiu   $a3, $a3, 0x0041
    beqz    $a3, .L80008648
    andi    $a3, $t5, 0x00FF
    andi    $a3, $t4, 0x00FF
    sll     $t0, $t0, 4
    andi    $a3, $a3, 0x000F
    addiu   $a2, $a2, 0x0001
    bne     $a2, $v0, .L8000865C
    or      $t0, $a3, $t0
.L8000868C:
    bne     $t0, $a1, .L800085F0
    addiu   $a2, $t8, 0x0009
    addu    $v0, $a2, $v1
    lbu     $v0, 0x0000($v0)
    addiu   $v0, $v0, -0x0030
    andi    $v0, $v0, 0x00FF
    sltiu   $a3, $v0, 0x0007
    beqzl   $a3, .L800085F4
    slti    $v0, $a2, 0x1000
.L800086B0:
    jr      $ra
    nop
.L800086B8:
    srl     $t1, $a0, 8
.L800086BC:
    li      $a2, 0x0001
    li      $t0, 0x003D
    andi    $t2, $a0, 0x00FF
    j       .L800086D8
    li      $a3, 0x1001
.L800086D0:
    beq     $a2, $a3, .L80008738
    addiu   $v1, $v1, 0x0001
.L800086D8:
    lbu     $v0, 0x0000($v1)
    beqz    $v0, .L80008738
    addiu   $a2, $a2, 0x0001
    bne     $v0, $t0, .L800086D0
    nop
    lbu     $v0, -0x0002($v1)
    bne     $v0, $t1, .L800086D0
    nop
    lbu     $v0, -0x0001($v1)
    bne     $t2, $v0, .L800086D0
    nop
    lbu     $v0, 0x0001($v1)
    sltiu   $t3, $v0, 0x0030
    bnez    $t3, .L800086D0
    sltiu   $t4, $v0, 0x0036
    addiu   $v0, $v0, -0x0030
    andi    $v0, $v0, 0x00FF
    beqz    $t4, .L800086D0
    sltiu   $t3, $v0, 0x0007
    beqz    $t3, .L800086D0
    nop
    j       .L800086B0
    nop
    nop
.L80008738:
    lui     $v1, 0xBCB1F89F >> 16
    ori     $v1, 0xBCB1F89F & 0xFFFF
    beq     $a1, $v1, .L800086B0
    li      $v0, 0x0001
    lui     $v0, 0x46039FB4 >> 16
    ori     $v0, 0x46039FB4 & 0xFFFF
    beq     $a1, $v0, .L800087E8
    nop
    lui     $v0, 0x0D93BA11 >> 16
    ori     $v0, 0x0D93BA11 & 0xFFFF
    beq     $a1, $v0, .L800087E8
    nop
    lui     $v0, 0xCE84793D >> 16
    ori     $v0, 0xCE84793D & 0xFFFF
    beq     $a1, $v0, .L800087F0
    nop
    lui     $v0, 0x4CBC3B56 >> 16
    ori     $v0, 0x4CBC3B56 & 0xFFFF
    beq     $a1, $v0, .L800087F0
    nop
    lui     $v0, %hi(__str_80050818)
    lhu     $v1, %lo(__str_80050818)($v0)
    beq     $v1, $a0, .L800086B0
    li      $v0, 0x0002
    lui     $t0, %hi(_8004CB50)
    lui     $a3, %hi(_8004CDB8)
    addiu   $t0, %lo(_8004CB50)
    addiu   $a3, %lo(_8004CDB8)
    daddu   $v0, $0, $0
    j       .L800087C8
    li      $a2, 0x00FF
    nop
.L800087B8:
    lw      $a1, 0x0004($a1)
    lhu     $a1, 0x0000($a1)
    beq     $a1, $a0, .L800087F8
    nop
.L800087C8:
    addu    $v1, $t0, $v0
    lw      $v1, 0x0004($v1)
    addu    $a1, $a3, $v0
    bne     $v1, $a2, .L800087B8
    addiu   $v0, $v0, 0x0004
    jr      $ra
    daddu   $v0, $0, $0
    nop
.L800087E8:
    jr      $ra
    li      $v0, 0x0002
.L800087F0:
    jr      $ra
    li      $v0, 0x0003
.L800087F8:
    jr      $ra
    andi    $v0, $v1, 0x00FF

.globl os_80008800
os_80008800:
    sltiu   $v0, $a0, 0x0006
    bnezl   $v0, .L80008818
    lui     $v0, %hi(_8004CB38)
    jr      $ra
    li      $v0, 0x0017
    nop
.L80008818:
    addiu   $v0, %lo(_8004CB38)
    sll     $a0, $a0, 2
    addu    $a0, $v0, $a0
    lw      $v0, 0x0000($a0)
    jr      $v0
    nop
    li      $v0, 0x0100
    sw      $v0, 0x0000($a1)
    lui     $v0, %hi(__str_8004F220)
    addiu   $v0, %lo(__str_8004F220)
    sw      $v0, 0x0000($a2)
    jr      $ra
    daddu   $v0, $0, $0
    nop
    li      $v0, 0x0001
    sw      $v0, 0x0000($a1)
    lui     $v0, %hi(__str_8004F218)
    addiu   $v0, %lo(__str_8004F218)
    sw      $v0, 0x0000($a2)
    jr      $ra
    daddu   $v0, $0, $0
    nop
    li      $v0, 0x0004
    sw      $v0, 0x0000($a1)
    lui     $v0, %hi(__str_8004F218)
    addiu   $v0, %lo(__str_8004F218)
    sw      $v0, 0x0000($a2)
    jr      $ra
    daddu   $v0, $0, $0
    nop
    li      $v0, 0x0040
    sw      $v0, 0x0000($a1)
    lui     $v0, %hi(__str_8004F210)
    addiu   $v0, %lo(__str_8004F210)
    sw      $v0, 0x0000($a2)
    jr      $ra
    daddu   $v0, $0, $0
    nop
    li      $v0, 0x00C0
    sw      $v0, 0x0000($a1)
    lui     $v0, %hi(__str_8004F210)
    addiu   $v0, %lo(__str_8004F210)
    sw      $v0, 0x0000($a2)
    jr      $ra
    daddu   $v0, $0, $0
    nop

.globl os_800088D0
os_800088D0:
    addiu   $sp, $sp, -0x7FF0
    sd      $s2, 0x7FC8($sp)
    sd      $s0, 0x7FB8($sp)
    sd      $ra, 0x7FE8($sp)
    sd      $s5, 0x7FE0($sp)
    sd      $s4, 0x7FD8($sp)
    sd      $s3, 0x7FD0($sp)
    sd      $s1, 0x7FC0($sp)
    addiu   $sp, $sp, -0x0868
    addiu   $s2, $sp, 0x0020
    jal     BiDDTblRd
    daddu   $a0, $s2, $0
    addiu   $s0, $sp, 0x0820
    j       .L80008918
    daddu   $v0, $s2, $0
    nop
.L80008910:
    beql    $s0, $v0, .L800089C4
    addiu   $sp, $sp, 0x0868
.L80008918:
    lbu     $v1, 0x0000($v0)
    beqz    $v1, .L80008910
    addiu   $v0, $v0, 0x0001
    lui     $a0, %hi(__str_80050820)
    addiu   $a0, %lo(__str_80050820)
    jal     os_800145A0
    li      $a1, 0x0002
    lui     $v0, %hi(_80052908)
    lw      $a0, %lo(_80052908)($v0)
    lhu     $a1, 0x008E($a0)
    jal     fat_os_80011380
    addiu   $a0, $a0, 0x007C
    bnez    $v0, .L800089F0
    daddu   $s3, $v0, $0
    daddu   $s1, $0, $0
    li      $s4, 0x0800
.L80008958:
    jal     fat_os_8000F7A0
    nop
    beqz    $v0, .L800089F4
    daddu   $v0, $s3, $0
    jal     fat_os_8000F7A0
    li      $s5, 0x0040
    sltiu   $v0, $v0, 0x0040
    bnez    $v0, .L80008A50
    nop
.L8000897C:
    addu    $v0, $s2, $s1
    lbu     $v0, 0x0000($v0)
    sll     $a1, $s1, 15
    li      $a2, 0x8000
    daddu   $a0, $s0, $0
    bnez    $v0, .L80008A20
    addiu   $s1, $s1, 0x0001
    jal     fat_os_800105E8
    daddu   $a0, $s5, $0
    bnezl   $v0, .L800089F8
    addiu   $sp, $sp, 0x0868
    bne     $s1, $s4, .L80008958
    nop
.L800089B0:
    jal     os_80013370
    nop
    jal     sysRepaint
    nop
    addiu   $sp, $sp, 0x0868
.L800089C4:
    ld      $ra, 0x7FE8($sp)
    daddu   $v0, $0, $0
    ld      $s5, 0x7FE0($sp)
    ld      $s4, 0x7FD8($sp)
    ld      $s3, 0x7FD0($sp)
    ld      $s2, 0x7FC8($sp)
    ld      $s1, 0x7FC0($sp)
    ld      $s0, 0x7FB8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
    nop
.L800089F0:
    daddu   $v0, $s3, $0
.L800089F4:
    addiu   $sp, $sp, 0x0868
.L800089F8:
    ld      $ra, 0x7FE8($sp)
    ld      $s5, 0x7FE0($sp)
    ld      $s4, 0x7FD8($sp)
    ld      $s3, 0x7FD0($sp)
    ld      $s2, 0x7FC8($sp)
    ld      $s1, 0x7FC0($sp)
    ld      $s0, 0x7FB8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
    nop
.L80008A20:
    jal     BiCartRomRd
    nop
    daddu   $a0, $s0, $0
    jal     fat_os_80010970
    daddu   $a1, $s5, $0
    bnezl   $v0, .L800089F8
    addiu   $sp, $sp, 0x0868
    bne     $s1, $s4, .L80008958
    nop
    j       .L800089B0
    nop
    nop
.L80008A50:
    jal     fat_os_8000F7A0
    nop
    j       .L8000897C
    andi    $s5, $v0, 0xFFFF

.globl os_80008A60
os_80008A60:
    lui     $v1, 0x00018050 >> 16
    addiu   $sp, $sp, -0x7FF0
    ori     $v1, 0x00018050 & 0xFFFF
    sd      $ra, 0x7FE8($sp)
    sd      $s1, 0x7FE0($sp)
    sd      $s0, 0x7FD8($sp)
    daddu   $a1, $0, $0
    jal     fat_os_80011380
    subu    $sp, $sp, $v1
    beqz    $v0, .L80008AA8
    lui     $t0, 0x00018050 >> 16
.L80008A8C:
    ori     $t0, 0x00018050 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $s1, 0x7FE0($sp)
    ld      $s0, 0x7FD8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
.L80008AA8:
    jal     fat_os_8000F7A0
    nop
    daddu   $s0, $v0, $0
    sltiu   $v0, $v0, 0x0101
    beqzl   $v0, .L80008B28
    li      $s0, 0x0100
    addiu   $s1, $sp, 0x0020
    daddu   $a0, $s1, $0
    jal     fat_os_80010840
    andi    $a1, $s0, 0xFFFF
    bnez    $v0, .L80008A8C
    li      $t0, 0x00010000
    lui     $v1, 0x00020020 >> 16
.L80008ADC:
    ori     $v1, 0x00020020 & 0xFFFF
    addu    $v1, $v1, $sp
    sd      $v0, 0x0000($v1)
    daddu   $a0, $s1, $0
    sll     $a2, $s0, 9
    jal     BiCartRamWr
    daddu   $a1, $0, $0
    lui     $v1, 0x00020020 >> 16
    lui     $t0, 0x00018050 >> 16
    ori     $v1, 0x00020020 & 0xFFFF
    ori     $t0, 0x00018050 & 0xFFFF
    addu    $v1, $v1, $sp
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $v0, 0x0000($v1)
    ld      $s1, 0x7FE0($sp)
    ld      $s0, 0x7FD8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
.L80008B28:
    addiu   $s1, $sp, 0x0020
    daddu   $a0, $s1, $0
    jal     fat_os_80010840
    andi    $a1, $s0, 0xFFFF
    bnez    $v0, .L80008A8C
    li      $t0, 0x00010000
    j       .L80008ADC
    li      $v1, 0x00020000

.globl os_80008B48
os_80008B48:
    lui     $v1, 0x00018050 >> 16
    addiu   $sp, $sp, -0x7FF0
    ori     $v1, 0x00018050 & 0xFFFF
    sd      $s0, 0x7FD0($sp)
    sd      $ra, 0x7FE8($sp)
    sd      $s2, 0x7FE0($sp)
    sd      $s1, 0x7FD8($sp)
    daddu   $a1, $0, $0
    subu    $sp, $sp, $v1
    jal     fat_os_80011380
    daddu   $s0, $a0, $0
    beqz    $v0, .L80008BA0
    lui     $t0, 0x00018050 >> 16
.L80008B7C:
    ori     $t0, 0x00018050 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $s2, 0x7FE0($sp)
    ld      $s1, 0x7FD8($sp)
    ld      $s0, 0x7FD0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
    nop
.L80008BA0:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v1, $v0, 0x0101
    beqzl   $v1, .L80008C10
    li      $v0, 0x0100
    addiu   $s2, $sp, 0x0020
    andi    $s1, $v0, 0xFFFF
    daddu   $a0, $s2, $0
    daddu   $a1, $0, $0
    jal     BiCartRamRd
    sll     $a2, $v0, 9
    daddu   $a0, $s0, $0
    jal     fat_os_80011380
    daddu   $a1, $s1, $0
    bnez    $v0, .L80008B7C
    li      $t0, 0x00010000
    daddu   $a0, $s2, $0
.L80008BE4:
    jal     fat_os_80010970
    daddu   $a1, $s1, $0
    lui     $t0, 0x00018050 >> 16
    ori     $t0, 0x00018050 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $s2, 0x7FE0($sp)
    ld      $s1, 0x7FD8($sp)
    ld      $s0, 0x7FD0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
.L80008C10:
    addiu   $s2, $sp, 0x0020
    andi    $s1, $v0, 0xFFFF
    daddu   $a0, $s2, $0
    daddu   $a1, $0, $0
    jal     BiCartRamRd
    sll     $a2, $v0, 9
    daddu   $a0, $s0, $0
    jal     fat_os_80011380
    daddu   $a1, $s1, $0
    bnez    $v0, .L80008B7C
    li      $t0, 0x00010000
    j       .L80008BE4
    daddu   $a0, $s2, $0
    nop

.globl os_80008C48
os_80008C48:
    lui     $v1, 0x00018058 >> 16
    addiu   $sp, $sp, -0x7FF0
    ori     $v1, 0x00018058 & 0xFFFF
    sd      $s1, 0x7FE0($sp)
    sd      $ra, 0x7FE8($sp)
    sd      $s0, 0x7FD8($sp)
    li      $a0, 0x00AA
    subu    $sp, $sp, $v1
    daddu   $a1, $0, $0
    li      $a2, 0x00020000
    lui     $s1, %hi(_80052908)
    sw      $0, 0x0020($sp)
    jal     BiCartRamFill
    sw      $0, 0x0024($sp)
    lw      $v1, %lo(_80052908)($s1)
    lhu     $a0, 0x0062($v1)
    bnez    $a0, .L80008CB0
    daddu   $v0, $0, $0
.L80008C90:
    lui     $t0, 0x00018058 >> 16
.L80008C94:
    ori     $t0, 0x00018058 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $s1, 0x7FE0($sp)
    ld      $s0, 0x7FD8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
.L80008CB0:
    addiu   $a1, $sp, 0x0020
    jal     os_80008800
    addiu   $a2, $sp, 0x0024
    beqz    $v0, .L80008CE8
    daddu   $s0, $v0, $0
    lui     $t0, 0x00018058 >> 16
    ori     $t0, 0x00018058 & 0xFFFF
.L80008CCC:
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    daddu   $v0, $s0, $0
    ld      $s1, 0x7FE0($sp)
    ld      $s0, 0x7FD8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
.L80008CE8:
    lw      $a1, %lo(_80052908)($s1)
    lui     $a0, %hi(__str_8004EB68)
    lw      $a2, 0x0024($sp)
    addiu   $a0, %lo(__str_8004EB68)
    addiu   $a1, $a1, 0x0094
    jal     fat_os_80011B80
    daddu   $a3, $0, $0
    beqz    $v0, .L80008D20
    li      $v1, 0x00F0
    bne     $v0, $v1, .L80008C94
    lui     $t0, 0x00018058 >> 16
    j       .L80008CCC
    ori     $t0, 0x00018058 & 0xFFFF
    nop
.L80008D20:
    jal     fat_os_8000F7A0
    lhu     $s0, 0x0022($sp)
    sltu    $v0, $v0, $s0
    bnez    $v0, .L80008D80
    nop
    addiu   $s1, $sp, 0x0028
.L80008D38:
    daddu   $a0, $s1, $0
    jal     fat_os_80010840
    daddu   $a1, $s0, $0
    bnez    $v0, .L80008C94
    li      $t0, 0x00010000
    lui     $v1, 0x00020028 >> 16
    ori     $v1, 0x00020028 & 0xFFFF
    addu    $v1, $v1, $sp
    sd      $v0, 0x0000($v1)
    daddu   $a0, $s1, $0
    sll     $a2, $s0, 9
    jal     BiCartRamWr
    daddu   $a1, $0, $0
    lui     $v1, 0x00020028 >> 16
    ori     $v1, 0x00020028 & 0xFFFF
    addu    $v1, $v1, $sp
    j       .L80008C90
    ld      $v0, 0x0000($v1)
.L80008D80:
    jal     fat_os_8000F7A0
    addiu   $s1, $sp, 0x0028
    j       .L80008D38
    andi    $s0, $v0, 0xFFFF

.globl os_80008D90
os_80008D90:
    addiu   $sp, $sp, -0x7FF0
    sd      $s2, 0x7FE0($sp)
    lui     $s2, %hi(_80052908)
    lui     $v1, 0x00018058 >> 16
    lw      $v0, %lo(_80052908)($s2)
    sd      $ra, 0x7FE8($sp)
    sd      $s1, 0x7FD8($sp)
    sd      $s0, 0x7FD0($sp)
    ori     $v1, 0x00018058 & 0xFFFF
    subu    $sp, $sp, $v1
    lbu     $v1, 0x0094($v0)
    beqz    $v1, .L80008DD0
    daddu   $s1, $0, $0
    lhu     $a0, 0x0062($v0)
    bnez    $a0, .L80008DF8
    addiu   $a1, $sp, 0x0020
.L80008DD0:
    lui     $t0, 0x00018058 >> 16
.L80008DD4:
    ori     $t0, 0x00018058 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    daddu   $v0, $s1, $0
    ld      $s2, 0x7FE0($sp)
    ld      $s1, 0x7FD8($sp)
    ld      $s0, 0x7FD0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
.L80008DF8:
    addiu   $a2, $sp, 0x0024
    sw      $0, 0x0024($sp)
    jal     os_80008800
    sw      $0, 0x0020($sp)
    bnez    $v0, .L80008DD0
    daddu   $s1, $v0, $0
    lw      $a2, 0x0020($sp)
    addiu   $s0, $sp, 0x0028
    sll     $a2, $a2, 9
    daddu   $a0, $s0, $0
    jal     BiCartRamRd
    daddu   $a1, $0, $0
    lw      $a2, 0x0020($sp)
    daddu   $a0, $s0, $0
    sll     $a2, $a2, 9
    jal     os_80014648
    li      $a1, 0x00AA
    bnez    $v0, .L80008DD4
    li      $t0, 0x00010000
    lw      $a1, %lo(_80052908)($s2)
    lw      $a2, 0x0024($sp)
    lhu     $a3, 0x0022($sp)
    lui     $a0, %hi(__str_8004EB68)
    addiu   $a0, %lo(__str_8004EB68)
    jal     fat_os_80011B80
    addiu   $a1, $a1, 0x0094
    bnez    $v0, .L80008DD0
    daddu   $s1, $v0, $0
    lhu     $a1, 0x0022($sp)
    jal     fat_os_80010970
    daddu   $a0, $s0, $0
    j       .L80008DD0
    daddu   $s1, $v0, $0
    nop

.globl os_80008E80
os_80008E80:
    addiu   $sp, $sp, -0x0038
    sd      $s0, 0x0028($sp)
    lui     $s0, %hi(_80078D00)
    addiu   $a0, $s0, %lo(_80078D00)
    daddu   $a1, $0, $0
    sd      $ra, 0x0030($sp)
    jal     os_80014778
    li      $a2, 0x1000
    lui     $a0, %hi(__str_80050838)
    addiu   $a0, %lo(__str_80050838)
    jal     fat_os_80011AB8
    daddu   $a1, $0, $0
    li      $v1, 0x00F0
    beq     $v0, $v1, .L80008F40
    ld      $ra, 0x0030($sp)
    beqz    $v0, .L80008ED0
    nop
.L80008EC4:
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
.L80008ED0:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v1, $v0, 0x0009
    beqzl   $v1, .L80008F20
    li      $v0, 0x0008
    addiu   $a0, $s0, %lo(_80078D00)
    jal     fat_os_80010840
    andi    $a1, $v0, 0xFFFF
    bnez    $v0, .L80008EC4
    ld      $ra, 0x0030($sp)
    lui     $a0, %hi(_80078D00)
.L80008EFC:
    addiu   $a0, %lo(_80078D00)
    li      $a1, 0x1000
    jal     os_800153E8
    sd      $v0, 0x0020($sp)
    ld      $ra, 0x0030($sp)
    ld      $v0, 0x0020($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
.L80008F20:
    addiu   $a0, $s0, %lo(_80078D00)
    jal     fat_os_80010840
    andi    $a1, $v0, 0xFFFF
    bnez    $v0, .L80008EC4
    ld      $ra, 0x0030($sp)
    j       .L80008EFC
    li      $a0, 0x80080000
    nop
.L80008F40:
    daddu   $v0, $0, $0
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    addiu   $sp, $sp, -0x0048
    sd      $s0, 0x0020($sp)
    lui     $s0, %hi(_8007D0B0)
    sd      $s2, 0x0030($sp)
    lw      $v0, %lo(_8007D0B0)($s0)
    lui     $s2, %hi(_8007D0B4)
    lw      $a1, %lo(_8007D0B4)($s2)
    srl     $v1, $v0, 9
    sd      $s3, 0x0038($sp)
    sd      $ra, 0x0040($sp)
    sd      $s1, 0x0028($sp)
    beq     $v1, $a1, .L80008FF8
    andi    $s3, $a0, 0x00FF
    lui     $s1, %hi(_8007CEA8)
    sll     $a1, $a1, 9
    addiu   $a0, $s1, %lo(_8007CEA8)
    jal     BiCartRomWr
    li      $a2, 0x0200
    lw      $v0, %lo(_8007D0B0)($s0)
    addiu   $a0, $s1, %lo(_8007CEA8)
    srl     $v0, $v0, 9
    sll     $a1, $v0, 9
    li      $a2, 0x0200
    jal     BiCartRomRd
    sw      $v0, %lo(_8007D0B4)($s2)
    lui     $v1, %hi(_8007D0B8)
    lbu     $v1, %lo(_8007D0B8)($v1)
    bnez    $v1, .L80009008
    lw      $v0, %lo(_8007D0B0)($s0)
.L80008FC4:
    andi    $v1, $v0, 0x01FF
    addiu   $s1, %lo(_8007CEA8)
    addu    $s1, $v1, $s1
    sb      $s3, 0x0000($s1)
    ld      $ra, 0x0040($sp)
    addiu   $v0, $v0, 0x0001
    sw      $v0, %lo(_8007D0B0)($s0)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048
.L80008FF8:
    lui     $v1, %hi(_8007D0B8)
    lbu     $v1, %lo(_8007D0B8)($v1)
    beqz    $v1, .L80008FC4
    li      $s1, 0x80080000
.L80009008:
    andi    $v1, $v0, 0x01FF
    xori    $v1, $v1, 0x0001
    addiu   $s1, %lo(_8007CEA8)
    addu    $s1, $v1, $s1
    sb      $s3, 0x0000($s1)
    ld      $ra, 0x0040($sp)
    addiu   $v0, $v0, 0x0001
    sw      $v0, %lo(_8007D0B0)($s0)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048

.globl os_80009040
os_80009040:
    addiu   $sp, $sp, -0x0040
    sd      $s0, 0x0020($sp)
    lui     $s0, %hi(_8007D0AC)
    lw      $v1, %lo(_8007D0AC)($s0)
    sd      $s2, 0x0030($sp)
    andi    $v0, $v1, 0x0FFF
    lui     $s2, %hi(_8007BEA0)
    sd      $ra, 0x0038($sp)
    sd      $s1, 0x0028($sp)
    beqz    $v0, .L800090A8
    sw      $v0, %lo(_8007BEA0)($s2)
    lui     $s1, %hi(_8007BEA8)
.L80009070:
    addiu   $s1, %lo(_8007BEA8)
    addu    $v0, $v0, $s1
    addiu   $v1, $v1, 0x0001
    lbu     $v0, 0x0000($v0)
    sw      $v1, %lo(_8007D0AC)($s0)
    lui     $v1, %hi(_8007D0A8)
    sb      $v0, %lo(_8007D0A8)($v1)
.L8000908C:
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040
    nop
.L800090A8:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    bnez    $v0, .L800090F0
    nop
    lui     $s1, %hi(_8007BEA8)
    addiu   $a0, $s1, %lo(_8007BEA8)
    jal     fat_os_80010840
    li      $a1, 0x0008
    daddu   $v1, $v0, $0
    lui     $v0, %hi(_8007D0A9)
    sb      $v1, %lo(_8007D0A9)($v0)
.L800090D8:
    bnez    $v1, .L8000908C
    daddu   $v0, $0, $0
    lw      $v0, %lo(_8007BEA0)($s2)
    j       .L80009070
    lw      $v1, %lo(_8007D0AC)($s0)
    nop
.L800090F0:
    jal     fat_os_8000F7A0
    lui     $s1, %hi(_8007BEA8)
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    addiu   $a0, $s1, %lo(_8007BEA8)
    daddu   $v1, $v0, $0
    lui     $v0, %hi(_8007D0A9)
    j       .L800090D8
    sb      $v1, %lo(_8007D0A9)($v0)
    nop
    addiu   $sp, $sp, -0x0058
    sd      $s0, 0x0020($sp)
    lui     $s0, %hi(_8007D0B0)
    sd      $s3, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    lui     $s3, %hi(_8007D0B4)
    lw      $s2, %lo(_8007D0B0)($s0)
    lw      $a1, %lo(_8007D0B4)($s3)
    srl     $v0, $s2, 9
    sd      $ra, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s4, 0x0040($sp)
    beq     $v0, $a1, .L80009208
    sd      $s1, 0x0028($sp)
    lui     $s1, %hi(_8007CEA8)
    sll     $a1, $a1, 9
    addiu   $a0, $s1, %lo(_8007CEA8)
    jal     BiCartRomWr
    li      $a2, 0x0200
    lw      $v0, %lo(_8007D0B0)($s0)
    addiu   $a0, $s1, %lo(_8007CEA8)
    srl     $v0, $v0, 9
    sll     $a1, $v0, 9
    li      $a2, 0x0200
    jal     BiCartRomRd
    sw      $v0, %lo(_8007D0B4)($s3)
    lui     $v0, %hi(_8007D0B8)
    lbu     $v0, %lo(_8007D0B8)($v0)
    bnez    $v0, .L80009218
    lw      $s2, %lo(_8007D0B0)($s0)
.L80009190:
    lui     $s3, %hi(_8007D0AC)
    lw      $a0, %lo(_8007D0AC)($s3)
    lui     $s4, %hi(_8007BEA0)
    andi    $v0, $a0, 0x0FFF
    beqz    $v0, .L80009298
    sw      $v0, %lo(_8007BEA0)($s4)
    daddu   $v1, $s2, $0
    lui     $s5, %hi(_8007BEA8)
.L800091B0:
    addiu   $s5, %lo(_8007BEA8)
    addu    $v0, $v0, $s5
    addiu   $a0, $a0, 0x0001
    lbu     $v0, 0x0000($v0)
    sw      $a0, %lo(_8007D0AC)($s3)
    lui     $a0, %hi(_8007D0A8)
    sb      $v0, %lo(_8007D0A8)($a0)
.L800091CC:
    andi    $s2, $s2, 0x01FF
    addiu   $s1, %lo(_8007CEA8)
    addu    $s1, $s2, $s1
    sb      $v0, 0x0000($s1)
    ld      $ra, 0x0050($sp)
    addiu   $v0, $v1, 0x0001
    sw      $v0, %lo(_8007D0B0)($s0)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
.L80009208:
    lui     $v0, %hi(_8007D0B8)
    lbu     $v0, %lo(_8007D0B8)($v0)
    beqz    $v0, .L80009190
    li      $s1, 0x80080000
.L80009218:
    lui     $s3, %hi(_8007D0AC)
    lw      $a0, %lo(_8007D0AC)($s3)
    lui     $s4, %hi(_8007BEA0)
    andi    $v0, $a0, 0x0FFF
    beqz    $v0, .L800092E0
    sw      $v0, %lo(_8007BEA0)($s4)
    daddu   $v1, $s2, $0
    lui     $s5, %hi(_8007BEA8)
.L80009238:
    addiu   $s5, %lo(_8007BEA8)
    addu    $v0, $v0, $s5
    addiu   $a0, $a0, 0x0001
    lbu     $v0, 0x0000($v0)
    sw      $a0, %lo(_8007D0AC)($s3)
    lui     $a0, %hi(_8007D0A8)
    sb      $v0, %lo(_8007D0A8)($a0)
.L80009254:
    andi    $s2, $s2, 0x01FF
    xori    $s2, $s2, 0x0001
    addiu   $s1, %lo(_8007CEA8)
    addu    $s1, $s2, $s1
    sb      $v0, 0x0000($s1)
    ld      $ra, 0x0050($sp)
    addiu   $v0, $v1, 0x0001
    sw      $v0, %lo(_8007D0B0)($s0)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
    nop
.L80009298:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L80009328
    lui     $s5, %hi(_8007BEA8)
    jal     fat_os_8000F7A0
    nop
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    addiu   $a0, $s5, %lo(_8007BEA8)
    lui     $v1, %hi(_8007D0A9)
    sb      $v0, %lo(_8007D0A9)($v1)
.L800092C8:
    bnez    $v0, .L80009340
    lw      $a0, %lo(_8007D0AC)($s3)
    lw      $v0, %lo(_8007BEA0)($s4)
    j       .L800091B0
    lw      $v1, %lo(_8007D0B0)($s0)
    nop
.L800092E0:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L80009350
    lui     $s5, %hi(_8007BEA8)
    jal     fat_os_8000F7A0
    nop
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    addiu   $a0, $s5, %lo(_8007BEA8)
    lui     $v1, %hi(_8007D0A9)
    sb      $v0, %lo(_8007D0A9)($v1)
.L80009310:
    bnez    $v0, .L80009368
    lw      $a0, %lo(_8007D0AC)($s3)
    lw      $v0, %lo(_8007BEA0)($s4)
    j       .L80009238
    lw      $v1, %lo(_8007D0B0)($s0)
    nop
.L80009328:
    addiu   $a0, $s5, %lo(_8007BEA8)
    jal     fat_os_80010840
    li      $a1, 0x0008
    lui     $v1, %hi(_8007D0A9)
    j       .L800092C8
    sb      $v0, %lo(_8007D0A9)($v1)
.L80009340:
    lw      $v1, %lo(_8007D0B0)($s0)
    j       .L800091CC
    daddu   $v0, $0, $0
    nop
.L80009350:
    addiu   $a0, $s5, %lo(_8007BEA8)
    jal     fat_os_80010840
    li      $a1, 0x0008
    lui     $v1, %hi(_8007D0A9)
    j       .L80009310
    sb      $v0, %lo(_8007D0A9)($v1)
.L80009368:
    lw      $v1, %lo(_8007D0B0)($s0)
    j       .L80009254
    daddu   $v0, $0, $0
    nop
.L80009378:
    addiu   $sp, $sp, -0x0088
    lui     $v0, %hi(_8007CEA8)
    sd      $s5, 0x0060($sp)
    sd      $s2, 0x0048($sp)
    sd      $s1, 0x0040($sp)
    sd      $s0, 0x0038($sp)
    daddu   $s2, $a0, $0
    daddu   $a1, $0, $0
    addiu   $a0, $v0, %lo(_8007CEA8)
    li      $a2, 0x0200
    lui     $s1, %hi(_8007D0B0)
    lui     $s0, %hi(_8007D0AC)
    lui     $s5, %hi(_8007D0B4)
    sd      $ra, 0x0080($sp)
    sd      $s8, 0x0078($sp)
    sd      $s7, 0x0070($sp)
    sd      $s6, 0x0068($sp)
    sd      $s4, 0x0058($sp)
    sd      $s3, 0x0050($sp)
    sw      $0, %lo(_8007D0B0)($s1)
    sw      $0, %lo(_8007D0AC)($s0)
    jal     BiCartRomRd
    sw      $0, %lo(_8007D0B4)($s5)
    daddu   $a0, $s2, $0
    jal     fat_os_80011380
    daddu   $a1, $0, $0
    daddu   $v1, $v0, $0
    bnez    $v1, .L80009660
    lui     $s3, %hi(_8007BEA8)
    lw      $v0, 0x000C($s2)
    addiu   $v0, $v0, -0x0003
    lui     $s4, %hi(__str_80050D08)
    lui     $s7, %hi(__str_80050D08+5)
    sw      $v0, 0x0024($sp)
    addiu   $s4, %lo(__str_80050D08)
    addiu   $s7, %lo(__str_80050D08+5)
    lui     $s2, %hi(_8007BEA0)
    addiu   $s6, $s3, %lo(_8007BEA8)
    lui     $s8, %hi(_8007D0A8)
    lw      $v1, %lo(_8007D0AC)($s0)
.L80009418:
    andi    $v0, $v1, 0x0FFF
    beqz    $v0, .L80009690
    sw      $v0, %lo(_8007BEA0)($s2)
.L80009424:
    addu    $v0, $v0, $s6
    lbu     $v0, 0x0000($v0)
    addiu   $v1, $v1, 0x0001
    sw      $v1, %lo(_8007D0AC)($s0)
    sb      $v0, %lo(_8007D0A8)($s8)
.L80009438:
    lb      $v1, 0x0000($s4)
    bne     $v1, $v0, .L80009AF0
    addiu   $s4, $s4, 0x0001
    bne     $s4, $s7, .L80009418
    lw      $v1, %lo(_8007D0AC)($s0)
    lui     $s7, %hi(_8007CEA8)
    addiu   $s7, %lo(_8007CEA8)
    lui     $v0, %hi(_8007D0B8)
    lw      $a0, %lo(_8007D0AC)($s0)
    sb      $0, %lo(_8007D0B8)($v0)
    addiu   $s3, %lo(_8007BEA8)
    daddu   $s8, $s7, $0
.L80009468:
    lw      $v1, 0x0024($sp)
    sltu    $v0, $a0, $v1
    beqz    $v0, .L80009C58
    lw      $a1, %lo(_8007D0B4)($s5)
    andi    $v0, $a0, 0x0FFF
    beqz    $v0, .L800097B8
    sw      $v0, %lo(_8007BEA0)($s2)
    lui     $s6, %hi(_8007D0A9)
.L80009488:
    addu    $v0, $v0, $s3
    lbu     $a1, 0x0000($v0)
    addiu   $a0, $a0, 0x0001
    lui     $v0, %hi(_8007D0A8)
    sb      $a1, %lo(_8007D0A8)($v0)
    sw      $a0, %lo(_8007D0AC)($s0)
    sll     $a1, $a1, 16
.L800094A4:
    andi    $v0, $a0, 0x0FFF
    sw      $a1, %lo(_8007D0B0)($s1)
    beqz    $v0, .L800099F0
    sw      $v0, %lo(_8007BEA0)($s2)
.L800094B4:
    addu    $v0, $v0, $s3
    lbu     $v1, 0x0000($v0)
    addiu   $a0, $a0, 0x0001
    lui     $v0, %hi(_8007D0A8)
    sb      $v1, %lo(_8007D0A8)($v0)
    sw      $a0, %lo(_8007D0AC)($s0)
    sll     $v1, $v1, 8
.L800094D0:
    or      $v1, $a1, $v1
    andi    $v0, $a0, 0x0FFF
    sw      $v1, %lo(_8007D0B0)($s1)
    beqz    $v0, .L800099B0
    sw      $v0, %lo(_8007BEA0)($s2)
.L800094E4:
    addu    $v0, $v0, $s3
    lbu     $v0, 0x0000($v0)
    addiu   $a0, $a0, 0x0001
    lui     $a1, %hi(_8007D0A8)
    sb      $v0, %lo(_8007D0A8)($a1)
    sw      $a0, %lo(_8007D0AC)($s0)
.L800094FC:
    or      $v1, $v1, $v0
    andi    $v0, $a0, 0x0FFF
    sw      $v1, %lo(_8007D0B0)($s1)
    beqz    $v0, .L80009970
    sw      $v0, %lo(_8007BEA0)($s2)
.L80009510:
    addu    $v0, $v0, $s3
    lbu     $s4, 0x0000($v0)
    addiu   $a0, $a0, 0x0001
    lui     $v0, %hi(_8007D0A8)
    sb      $s4, %lo(_8007D0A8)($v0)
    sw      $a0, %lo(_8007D0AC)($s0)
    sll     $s4, $s4, 8
.L8000952C:
    andi    $v0, $a0, 0x0FFF
    beqz    $v0, .L80009800
    sw      $v0, %lo(_8007BEA0)($s2)
    addu    $v0, $s3, $v0
    lbu     $v1, 0x0000($v0)
    lbu     $v0, %lo(_8007D0A9)($s6)
    lui     $a1, %hi(0x80080001)
    addiu   $a0, $a0, 0x0001
    sb      $v1, %lo(_8007D0A8)($a1)
    sw      $a0, %lo(_8007D0AC)($s0)
    bnez    $v0, .L80009660
    sw      $a1, 0x0020($sp)
    or      $s4, $v1, $s4
    beqz    $s4, .L80009860
    andi    $v0, $a0, 0x0FFF
.L80009568:
    addiu   $s4, $s4, -0x0001
    j       .L800095C8
    lw      $v1, %lo(_8007D0B0)($s1)
    nop
.L80009578:
    daddu   $a0, $v1, $0
    andi    $v0, $a1, 0x0FFF
    beqz    $v0, .L800096F8
    sw      $v0, %lo(_8007BEA0)($s2)
.L80009588:
    addiu   $a1, %lo(0x80080001)
    addu    $v0, $s3, $v0
    lbu     $v0, 0x0000($v0)
    sw      $a1, %lo(_8007D0AC)($s0)
    lw      $a1, 0x0020($sp)
    sb      $v0, -0x2F58($a1)
.L800095A0:
    andi    $v1, $v1, 0x01FF
    addu    $v1, $s7, $v1
    sb      $v0, 0x0000($v1)
    lbu     $v0, %lo(_8007D0A9)($s6)
    addiu   $v1, $a0, 0x0001
    bnez    $v0, .L80009660
    sw      $v1, %lo(_8007D0B0)($s1)
.L800095BC:
    beqz    $s4, .L80009468
    lw      $a0, %lo(_8007D0AC)($s0)
    addiu   $s4, $s4, -0x0001
.L800095C8:
    lw      $a1, %lo(_8007D0B4)($s5)
    srl     $v0, $v1, 9
    beq     $v0, $a1, .L80009608
    sll     $a1, $a1, 9
    daddu   $a0, $s8, $0
    jal     BiCartRomWr
    li      $a2, 0x0200
    lw      $v0, %lo(_8007D0B0)($s1)
    lui     $v1, %hi(_8007D0B4)
    srl     $v0, $v0, 9
    daddu   $a0, $s8, $0
    sll     $a1, $v0, 9
    li      $a2, 0x0200
    jal     BiCartRomRd
    sw      $v0, %lo(_8007D0B4)($v1)
    lw      $v1, %lo(_8007D0B0)($s1)
.L80009608:
    lui     $a0, %hi(_8007D0B8)
    lbu     $v0, %lo(_8007D0B8)($a0)
    beqz    $v0, .L80009578
    lw      $a1, %lo(_8007D0AC)($s0)
    daddu   $a0, $v1, $0
    andi    $v0, $a1, 0x0FFF
    beqz    $v0, .L80009740
    sw      $v0, %lo(_8007BEA0)($s2)
.L80009628:
    addiu   $a1, $a1, 0x0001
    addu    $v0, $s3, $v0
    lbu     $v0, 0x0000($v0)
    sw      $a1, %lo(_8007D0AC)($s0)
    lw      $a1, 0x0020($sp)
    sb      $v0, -0x2F58($a1)
.L80009640:
    andi    $v1, $v1, 0x01FF
    xori    $v1, $v1, 0x0001
    addu    $v1, $s7, $v1
    sb      $v0, 0x0000($v1)
    lbu     $v0, %lo(_8007D0A9)($s6)
    addiu   $v1, $a0, 0x0001
    beqz    $v0, .L800095BC
    sw      $v1, %lo(_8007D0B0)($s1)
.L80009660:
    ld      $ra, 0x0080($sp)
    ld      $s8, 0x0078($sp)
    ld      $s7, 0x0070($sp)
    ld      $s6, 0x0068($sp)
    ld      $s5, 0x0060($sp)
    ld      $s4, 0x0058($sp)
    ld      $s3, 0x0050($sp)
    ld      $s2, 0x0048($sp)
    ld      $s1, 0x0040($sp)
    ld      $s0, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0088
.L80009690:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    daddu   $a0, $s6, $0
    bnez    $v0, .L800096D0
    li      $a1, 0x0008
    jal     fat_os_80010840
    nop
    lui     $a1, %hi(_8007D0A9)
    daddu   $v1, $v0, $0
    sb      $v0, %lo(_8007D0A9)($a1)
.L800096BC:
    bnez    $v1, .L80009438
    daddu   $v0, $0, $0
    lw      $v1, %lo(_8007D0AC)($s0)
    j       .L80009424
    lw      $v0, %lo(_8007BEA0)($s2)
.L800096D0:
    jal     fat_os_8000F7A0
    nop
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    daddu   $a0, $s6, $0
    lui     $a0, %hi(_8007D0A9)
    daddu   $v1, $v0, $0
    j       .L800096BC
    sb      $v0, %lo(_8007D0A9)($a0)
    nop
.L800096F8:
    jal     fat_os_8000F7A0
    sd      $v1, 0x0030($sp)
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L80009790
    ld      $v1, 0x0030($sp)
    jal     fat_os_8000F7A0
    nop
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    daddu   $a0, $s3, $0
    sb      $v0, %lo(_8007D0A9)($s6)
    bnez    $v0, .L800097AC
    ld      $v1, 0x0030($sp)
.L8000972C:
    lw      $v0, %lo(_8007BEA0)($s2)
    lw      $a1, %lo(_8007D0AC)($s0)
    j       .L80009588
    lw      $a0, %lo(_8007D0B0)($s1)
    nop
.L80009740:
    jal     fat_os_8000F7A0
    sd      $v1, 0x0030($sp)
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L80009A30
    ld      $v1, 0x0030($sp)
    jal     fat_os_8000F7A0
    nop
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    daddu   $a0, $s3, $0
    sb      $v0, %lo(_8007D0A9)($s6)
    bnez    $v0, .L80009A4C
    ld      $v1, 0x0030($sp)
.L80009774:
    lw      $v0, %lo(_8007BEA0)($s2)
    lw      $a1, %lo(_8007D0AC)($s0)
    j       .L80009628
    lw      $a0, %lo(_8007D0B0)($s1)
    nop
.L80009788:
    j       .L80009468
    lw      $a0, %lo(_8007D0AC)($s0)
.L80009790:
    daddu   $a0, $s3, $0
    li      $a1, 0x0008
    jal     fat_os_80010840
    sd      $v1, 0x0030($sp)
    sb      $v0, %lo(_8007D0A9)($s6)
    beqz    $v0, .L8000972C
    ld      $v1, 0x0030($sp)
.L800097AC:
    lw      $a0, %lo(_8007D0B0)($s1)
    j       .L800095A0
    daddu   $v0, $0, $0
.L800097B8:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L80009A98
    daddu   $a0, $s3, $0
    jal     fat_os_8000F7A0
    nop
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    daddu   $a0, $s3, $0
    lui     $v1, %hi(_8007D0A9)
    sb      $v0, %lo(_8007D0A9)($v1)
    daddu   $s6, $v1, $0
.L800097EC:
    bnez    $v0, .L80009B48
    lw      $v0, %lo(_8007BEA0)($s2)
    j       .L80009488
    lw      $a0, %lo(_8007D0AC)($s0)
    nop
.L80009800:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L80009A88
    daddu   $a0, $s3, $0
    jal     fat_os_8000F7A0
    nop
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    daddu   $a0, $s3, $0
    sb      $v0, %lo(_8007D0A9)($s6)
.L8000982C:
    bnez    $v0, .L80009660
    lw      $a0, %lo(_8007D0AC)($s0)
    lw      $v0, %lo(_8007BEA0)($s2)
    addu    $v0, $s3, $v0
    lbu     $v1, 0x0000($v0)
    addiu   $a0, $a0, 0x0001
    lui     $v0, %hi(_8007D0A8)
    or      $s4, $v1, $s4
    sb      $v1, %lo(_8007D0A8)($v0)
    sw      $a0, %lo(_8007D0AC)($s0)
    bnez    $s4, .L80009568
    sw      $v0, 0x0020($sp)
    andi    $v0, $a0, 0x0FFF
.L80009860:
    beqz    $v0, .L80009AB0
    sw      $v0, %lo(_8007BEA0)($s2)
.L80009868:
    addu    $v0, $s3, $v0
    lbu     $v1, 0x0000($v0)
    lw      $a1, 0x0020($sp)
    addiu   $a0, $a0, 0x0001
    sb      $v1, -0x2F58($a1)
    sll     $v1, $v1, 8
    sw      $a0, %lo(_8007D0AC)($s0)
    sw      $v1, 0x0028($sp)
.L80009888:
    andi    $v0, $a0, 0x0FFF
    beqz    $v0, .L80009BC0
    sw      $v0, %lo(_8007BEA0)($s2)
.L80009894:
    addu    $v0, $s3, $v0
    lbu     $v1, 0x0000($v0)
    lw      $v0, 0x0020($sp)
    addiu   $a0, $a0, 0x0001
    sb      $v1, -0x2F58($v0)
    sw      $a0, %lo(_8007D0AC)($s0)
.L800098AC:
    andi    $v0, $a0, 0x0FFF
    beqz    $v0, .L80009B68
    sw      $v0, %lo(_8007BEA0)($s2)
    addu    $v0, $s3, $v0
    lbu     $s4, 0x0000($v0)
    lw      $a1, 0x0020($sp)
    lbu     $v0, %lo(_8007D0A9)($s6)
    addiu   $a0, $a0, 0x0001
    sb      $s4, -0x2F58($a1)
    bnez    $v0, .L80009660
    sw      $a0, %lo(_8007D0AC)($s0)
.L800098D8:
    lw      $a1, 0x0028($sp)
    or      $v1, $v1, $a1
    beqz    $v1, .L80009468
    lw      $v0, %lo(_8007D0B0)($s1)
    j       .L80009904
    addiu   $s6, $v1, -0x0001
.L800098F0:
    sb      $s4, 0x0000($a0)
.L800098F4:
    addiu   $v0, $v0, 0x0001
    beqz    $s6, .L80009788
    sw      $v0, %lo(_8007D0B0)($s1)
    addiu   $s6, $s6, -0x0001
.L80009904:
    lw      $v1, %lo(_8007D0B4)($s5)
    srl     $a3, $v0, 9
    daddu   $a0, $s8, $0
    li      $a2, 0x0200
    beq     $a3, $v1, .L80009948
    sll     $a1, $v1, 9
    jal     BiCartRomWr
    nop
    lw      $v0, %lo(_8007D0B0)($s1)
    lui     $v1, %hi(_8007D0B4)
    srl     $v0, $v0, 9
    sll     $a1, $v0, 9
    daddu   $a0, $s8, $0
    li      $a2, 0x0200
    jal     BiCartRomRd
    sw      $v0, %lo(_8007D0B4)($v1)
    lw      $v0, %lo(_8007D0B0)($s1)
.L80009948:
    lui     $a0, %hi(_8007D0B8)
    lbu     $v1, %lo(_8007D0B8)($a0)
    andi    $a0, $v0, 0x01FF
    beqz    $v1, .L800098F0
    addu    $a0, $s7, $a0
    andi    $v1, $v0, 0x01FF
    xori    $v1, $v1, 0x0001
    addu    $v1, $s7, $v1
    j       .L800098F4
    sb      $s4, 0x0000($v1)
.L80009970:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L80009A78
    daddu   $a0, $s3, $0
    jal     fat_os_8000F7A0
    nop
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    daddu   $a0, $s3, $0
    sb      $v0, %lo(_8007D0A9)($s6)
.L8000999C:
    bnez    $v0, .L80009B38
    lw      $v0, %lo(_8007BEA0)($s2)
    j       .L80009510
    lw      $a0, %lo(_8007D0AC)($s0)
    nop
.L800099B0:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L80009A68
    daddu   $a0, $s3, $0
    jal     fat_os_8000F7A0
    nop
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    daddu   $a0, $s3, $0
    sb      $v0, %lo(_8007D0A9)($s6)
.L800099DC:
    bnez    $v0, .L80009B28
    lw      $a0, %lo(_8007D0AC)($s0)
    lw      $v0, %lo(_8007BEA0)($s2)
    j       .L800094E4
    lw      $v1, %lo(_8007D0B0)($s1)
.L800099F0:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L80009A58
    daddu   $a0, $s3, $0
    jal     fat_os_8000F7A0
    nop
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    daddu   $a0, $s3, $0
    sb      $v0, %lo(_8007D0A9)($s6)
.L80009A1C:
    bnez    $v0, .L80009B58
    lw      $v0, %lo(_8007BEA0)($s2)
    lw      $a0, %lo(_8007D0AC)($s0)
    j       .L800094B4
    lw      $a1, %lo(_8007D0B0)($s1)
.L80009A30:
    daddu   $a0, $s3, $0
    li      $a1, 0x0008
    jal     fat_os_80010840
    sd      $v1, 0x0030($sp)
    sb      $v0, %lo(_8007D0A9)($s6)
    beqz    $v0, .L80009774
    ld      $v1, 0x0030($sp)
.L80009A4C:
    lw      $a0, %lo(_8007D0B0)($s1)
    j       .L80009640
    daddu   $v0, $0, $0
.L80009A58:
    jal     fat_os_80010840
    li      $a1, 0x0008
    j       .L80009A1C
    sb      $v0, %lo(_8007D0A9)($s6)
.L80009A68:
    jal     fat_os_80010840
    li      $a1, 0x0008
    j       .L800099DC
    sb      $v0, %lo(_8007D0A9)($s6)
.L80009A78:
    jal     fat_os_80010840
    li      $a1, 0x0008
    j       .L8000999C
    sb      $v0, %lo(_8007D0A9)($s6)
.L80009A88:
    jal     fat_os_80010840
    li      $a1, 0x0008
    j       .L8000982C
    sb      $v0, %lo(_8007D0A9)($s6)
.L80009A98:
    jal     fat_os_80010840
    li      $a1, 0x0008
    lui     $a0, %hi(_8007D0A9)
    sb      $v0, %lo(_8007D0A9)($a0)
    j       .L800097EC
    daddu   $s6, $a0, $0
.L80009AB0:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L80009C30
    daddu   $a0, $s3, $0
    jal     fat_os_8000F7A0
    nop
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    daddu   $a0, $s3, $0
    sb      $v0, %lo(_8007D0A9)($s6)
.L80009ADC:
    bnez    $v0, .L80009C4C
    lw      $v0, %lo(_8007BEA0)($s2)
    j       .L80009868
    lw      $a0, %lo(_8007D0AC)($s0)
    nop
.L80009AF0:
    ld      $ra, 0x0080($sp)
    li      $v0, 0x001D
    ld      $s8, 0x0078($sp)
    ld      $s7, 0x0070($sp)
    ld      $s6, 0x0068($sp)
    ld      $s5, 0x0060($sp)
    ld      $s4, 0x0058($sp)
    ld      $s3, 0x0050($sp)
    ld      $s2, 0x0048($sp)
    ld      $s1, 0x0040($sp)
    ld      $s0, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0088
    nop
.L80009B28:
    lw      $v1, %lo(_8007D0B0)($s1)
    j       .L800094FC
    daddu   $v0, $0, $0
    nop
.L80009B38:
    lw      $a0, %lo(_8007D0AC)($s0)
    j       .L8000952C
    daddu   $s4, $0, $0
    nop
.L80009B48:
    lw      $a0, %lo(_8007D0AC)($s0)
    j       .L800094A4
    daddu   $a1, $0, $0
    nop
.L80009B58:
    lw      $a0, %lo(_8007D0AC)($s0)
    lw      $a1, %lo(_8007D0B0)($s1)
    j       .L800094D0
    daddu   $v1, $0, $0
.L80009B68:
    jal     fat_os_8000F7A0
    sd      $v1, 0x0030($sp)
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L80009C10
    ld      $v1, 0x0030($sp)
    jal     fat_os_8000F7A0
    nop
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    daddu   $a0, $s3, $0
    ld      $v1, 0x0030($sp)
    sb      $v0, %lo(_8007D0A9)($s6)
.L80009B98:
    bnez    $v0, .L80009660
    lw      $a0, %lo(_8007D0AC)($s0)
    lw      $v0, %lo(_8007BEA0)($s2)
    addu    $v0, $s3, $v0
    lbu     $s4, 0x0000($v0)
    lw      $v0, 0x0020($sp)
    addiu   $a0, $a0, 0x0001
    sb      $s4, -0x2F58($v0)
    j       .L800098D8
    sw      $a0, %lo(_8007D0AC)($s0)
.L80009BC0:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L80009C00
    daddu   $a0, $s3, $0
    jal     fat_os_8000F7A0
    nop
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    daddu   $a0, $s3, $0
    sb      $v0, %lo(_8007D0A9)($s6)
.L80009BEC:
    bnez    $v0, .L80009C40
    lw      $v0, %lo(_8007BEA0)($s2)
    j       .L80009894
    lw      $a0, %lo(_8007D0AC)($s0)
    nop
.L80009C00:
    jal     fat_os_80010840
    li      $a1, 0x0008
    j       .L80009BEC
    sb      $v0, %lo(_8007D0A9)($s6)
.L80009C10:
    daddu   $a0, $s3, $0
    li      $a1, 0x0008
    jal     fat_os_80010840
    sd      $v1, 0x0030($sp)
    sb      $v0, %lo(_8007D0A9)($s6)
    j       .L80009B98
    ld      $v1, 0x0030($sp)
    nop
.L80009C30:
    jal     fat_os_80010840
    li      $a1, 0x0008
    j       .L80009ADC
    sb      $v0, %lo(_8007D0A9)($s6)
.L80009C40:
    lw      $a0, %lo(_8007D0AC)($s0)
    j       .L800098AC
    daddu   $v1, $0, $0
.L80009C4C:
    lw      $a0, %lo(_8007D0AC)($s0)
    j       .L80009888
    sw      $0, 0x0028($sp)
.L80009C58:
    lui     $v0, %hi(_8007CEA8)
    addiu   $a0, $v0, %lo(_8007CEA8)
    sll     $a1, $a1, 9
    jal     BiCartRomWr
    li      $a2, 0x0200
    j       .L80009660
    daddu   $v0, $0, $0
    nop
.L80009C78:
    addiu   $sp, $sp, -0x00E0
    sd      $s7, 0x00C8($sp)
    lui     $s7, %hi(_8007CEA8)
    sd      $s6, 0x00C0($sp)
    sd      $s5, 0x00B8($sp)
    sd      $s1, 0x0098($sp)
    sd      $s0, 0x0090($sp)
    daddu   $s1, $a0, $0
    daddu   $a1, $0, $0
    li      $a2, 0x0200
    addiu   $a0, $s7, %lo(_8007CEA8)
    lui     $s5, %hi(_8007D0B0)
    lui     $s0, %hi(_8007D0AC)
    lui     $s6, %hi(_8007D0B4)
    sd      $ra, 0x00D8($sp)
    sd      $s8, 0x00D0($sp)
    sd      $s4, 0x00B0($sp)
    sd      $s3, 0x00A8($sp)
    sd      $s2, 0x00A0($sp)
    sw      $0, %lo(_8007D0B0)($s5)
    sw      $0, %lo(_8007D0AC)($s0)
    jal     BiCartRomRd
    sw      $0, %lo(_8007D0B4)($s6)
    daddu   $a0, $s1, $0
    jal     fat_os_80011380
    daddu   $a1, $0, $0
    daddu   $v1, $v0, $0
    bnez    $v1, .L8000A05C
    lui     $a2, %hi(_8007BEA8)
    lw      $s1, 0x000C($s1)
    addiu   $v0, $sp, 0x006E
    sw      $s1, 0x0070($sp)
    lw      $a0, %lo(_8007D0AC)($s0)
    addiu   $s8, $sp, 0x0020
    sw      $v0, 0x0088($sp)
    lui     $s1, %hi(_8007BEA0)
    lui     $s2, %hi(_8007D0A9)
    j       .L80009D4C
    addiu   $v1, $a2, %lo(_8007BEA8)
    nop
.L80009D18:
    lbu     $a1, 0x0000($a1)
    lbu     $v0, %lo(_8007D0A9)($s2)
    lui     $a3, %hi(_8007D0A8)
    sb      $a1, %lo(_8007D0A8)($a3)
    sw      $a0, %lo(_8007D0AC)($s0)
    daddu   $s4, $v1, $0
    bnez    $v0, .L8000A05C
    daddu   $s3, $a3, $0
    lw      $v0, 0x0088($sp)
    sb      $a1, 0x0000($s8)
    addiu   $s8, $s8, 0x0001
    beql    $s8, $v0, .L80009DDC
    lbu     $v1, 0x0020($sp)
.L80009D4C:
    andi    $v0, $a0, 0x0FFF
    addu    $a1, $v1, $v0
    addiu   $a0, $a0, 0x0001
    bnez    $v0, .L80009D18
    sw      $v0, %lo(_8007BEA0)($s1)
    jal     fat_os_8000F7A0
    sd      $v1, 0x0080($sp)
    ld      $v1, 0x0080($sp)
    sltiu   $v0, $v0, 0x0008
    daddu   $a0, $v1, $0
    beqz    $v0, .L8000A048
    li      $a1, 0x0008
    jal     fat_os_8000F7A0
    nop
    ld      $v1, 0x0080($sp)
    andi    $a1, $v0, 0xFFFF
    jal     fat_os_80010840
    daddu   $a0, $v1, $0
    sb      $v0, %lo(_8007D0A9)($s2)
    bnez    $v0, .L8000A05C
    ld      $v1, 0x0080($sp)
.L80009DA0:
    lw      $v0, %lo(_8007BEA0)($s1)
    lw      $a0, %lo(_8007D0AC)($s0)
    addu    $v0, $v1, $v0
    lbu     $a1, 0x0000($v0)
    lw      $v0, 0x0088($sp)
    lui     $t0, %hi(_8007D0A8)
    addiu   $a0, $a0, 0x0001
    sb      $a1, 0x0000($s8)
    addiu   $s8, $s8, 0x0001
    sb      $a1, %lo(_8007D0A8)($t0)
    sw      $a0, %lo(_8007D0AC)($s0)
    daddu   $s4, $v1, $0
    bne     $s8, $v0, .L80009D4C
    daddu   $s3, $t0, $0
    lbu     $v1, 0x0020($sp)
.L80009DDC:
    li      $v0, 0x0041
    bne     $v1, $v0, .L8000A05C
    li      $v0, 0x001C
    lbu     $v1, 0x0021($sp)
    li      $v0, 0x0050
    bne     $v1, $v0, .L8000A05C
    li      $v0, 0x001C
    lbu     $v1, 0x0022($sp)
    li      $v0, 0x0053
    bne     $v1, $v0, .L8000A05C
    li      $v0, 0x001C
    lbu     $v1, 0x0023($sp)
    li      $v0, 0x0031
    bne     $v1, $v0, .L8000A05C
    li      $v0, 0x001C
    lbu     $v1, 0x0024($sp)
    li      $v0, 0x0030
    bne     $v1, $v0, .L8000A3D4
    lui     $s8, %hi(_8007CEA8)
    addiu   $s8, %lo(_8007CEA8)
    daddu   $v0, $0, $0
    li      $a2, 0x0008
    addiu   $a3, $sp, 0x0020
    addu    $a1, $s8, $v0
.L80009E3C:
    addu    $v1, $a3, $v0
    lbu     $a1, 0x0010($a1)
    lbu     $v1, 0x003D($v1)
    bne     $a1, $v1, .L8000A3CC
    addiu   $v0, $v0, 0x0001
    bne     $v0, $a2, .L80009E3C
    addu    $a1, $s8, $v0
    lbu     $v0, 0x0059($sp)
    lui     $t0, %hi(_8007D0B8)
    sltiu   $v0, $v0, 0x0001
    sb      $v0, %lo(_8007D0B8)($t0)
.L80009E68:
    lw      $v1, 0x0070($sp)
    sltu    $v0, $a0, $v1
    beqz    $v0, .L8000A480
    lw      $a1, %lo(_8007D0B4)($s6)
    andi    $v0, $a0, 0x0FFF
    beqz    $v0, .L8000A26C
    sw      $v0, %lo(_8007BEA0)($s1)
.L80009E84:
    addu    $v0, $s4, $v0
    lbu     $a1, 0x0000($v0)
    addiu   $v1, $a0, 0x0001
    sb      $a1, -0x2F58($s3)
    sw      $v1, %lo(_8007D0AC)($s0)
.L80009E98:
    andi    $v0, $v1, 0x0FFF
    sw      $a1, %lo(_8007D0B0)($s5)
    beqz    $v0, .L8000A2AC
    sw      $v0, %lo(_8007BEA0)($s1)
.L80009EA8:
    addu    $v0, $s4, $v0
    lbu     $v0, 0x0000($v0)
    addiu   $v1, $v1, 0x0001
    sb      $v0, -0x2F58($s3)
    sw      $v1, %lo(_8007D0AC)($s0)
    sll     $v0, $v0, 8
.L80009EC0:
    or      $a1, $a1, $v0
    andi    $v0, $v1, 0x0FFF
    sw      $a1, %lo(_8007D0B0)($s5)
    beqz    $v0, .L8000A228
    sw      $v0, %lo(_8007BEA0)($s1)
.L80009ED4:
    addu    $v0, $s4, $v0
    lbu     $a0, 0x0000($v0)
    addiu   $v1, $v1, 0x0001
    sb      $a0, -0x2F58($s3)
    sw      $v1, %lo(_8007D0AC)($s0)
    sll     $a0, $a0, 16
.L80009EEC:
    or      $a0, $a1, $a0
    andi    $v0, $v1, 0x0FFF
    sw      $a0, %lo(_8007D0B0)($s5)
    beqz    $v0, .L8000A1E4
    sw      $v0, %lo(_8007BEA0)($s1)
.L80009F00:
    addu    $v0, $s4, $v0
    lbu     $v0, 0x0000($v0)
    addiu   $v1, $v1, 0x0001
    sb      $v0, -0x2F58($s3)
    sw      $v1, %lo(_8007D0AC)($s0)
    sll     $v0, $v0, 24
.L80009F18:
    or      $a0, $a0, $v0
    andi    $v0, $v1, 0x0FFF
    sw      $a0, %lo(_8007D0B0)($s5)
    beqz    $v0, .L8000A18C
    sw      $v0, %lo(_8007BEA0)($s1)
    addu    $v0, $s4, $v0
    lbu     $a0, 0x0000($v0)
    lbu     $v0, %lo(_8007D0A9)($s2)
    addiu   $v1, $v1, 0x0001
    sw      $v1, %lo(_8007D0AC)($s0)
    bnez    $v0, .L8000A05C
    sb      $a0, -0x2F58($s3)
.L80009F48:
    beqz    $a0, .L8000A2F0
    lw      $a2, %lo(_8007D0B0)($s5)
    addiu   $v1, $a0, -0x0001
    j       .L80009FAC
    andi    $v1, $v1, 0xFFFF
    nop
.L80009F60:
    daddu   $a0, $a2, $0
    andi    $v0, $a1, 0x0FFF
    beqz    $v0, .L8000A08C
    sw      $v0, %lo(_8007BEA0)($s1)
.L80009F70:
    addu    $v0, $s4, $v0
    lbu     $a3, 0x0000($v0)
    addiu   $a1, $a1, 0x0001
    lbu     $v0, %lo(_8007D0A9)($s2)
    sw      $a1, %lo(_8007D0AC)($s0)
    sb      $a3, -0x2F58($s3)
.L80009F88:
    andi    $a2, $a2, 0x01FF
    addu    $a2, $s8, $a2
    sb      $a3, 0x0000($a2)
.L80009F94:
    addiu   $a2, $a0, 0x0001
    bnez    $v0, .L8000A05C
    sw      $a2, %lo(_8007D0B0)($s5)
    beqz    $v1, .L8000A184
    addiu   $v1, $v1, -0x0001
    andi    $v1, $v1, 0xFFFF
.L80009FAC:
    lw      $a1, %lo(_8007D0B4)($s6)
    srl     $v0, $a2, 9
    beq     $v0, $a1, .L80009FFC
    lui     $a0, %hi(_8007CEA8)
    sll     $a1, $a1, 9
    addiu   $a0, %lo(_8007CEA8)
    li      $a2, 0x0200
    jal     BiCartRomWr
    sd      $v1, 0x0080($sp)
    lw      $v0, %lo(_8007D0B0)($s5)
    lui     $a0, %hi(_8007CEA8)
    srl     $v0, $v0, 9
    li      $a2, 0x0200
    lui     $a3, %hi(_8007D0B4)
    addiu   $a0, %lo(_8007CEA8)
    sll     $a1, $v0, 9
    jal     BiCartRomRd
    sw      $v0, %lo(_8007D0B4)($a3)
    lw      $a2, %lo(_8007D0B0)($s5)
    ld      $v1, 0x0080($sp)
.L80009FFC:
    lui     $t0, %hi(_8007D0B8)
    lbu     $v0, %lo(_8007D0B8)($t0)
    beqz    $v0, .L80009F60
    lw      $a1, %lo(_8007D0AC)($s0)
    daddu   $a0, $a2, $0
    andi    $v0, $a1, 0x0FFF
    beqz    $v0, .L8000A0E0
    sw      $v0, %lo(_8007BEA0)($s1)
.L8000A01C:
    addu    $v0, $s4, $v0
    lbu     $a3, 0x0000($v0)
    addiu   $a1, $a1, 0x0001
    lbu     $v0, %lo(_8007D0A9)($s2)
    sw      $a1, %lo(_8007D0AC)($s0)
    sb      $a3, -0x2F58($s3)
.L8000A034:
    andi    $a1, $a2, 0x01FF
    xori    $a1, $a1, 0x0001
    addu    $a1, $s8, $a1
    j       .L80009F94
    sb      $a3, 0x0000($a1)
.L8000A048:
    jal     fat_os_80010840
    sd      $v1, 0x0080($sp)
    sb      $v0, %lo(_8007D0A9)($s2)
    beqz    $v0, .L80009DA0
    ld      $v1, 0x0080($sp)
.L8000A05C:
    ld      $ra, 0x00D8($sp)
.L8000A060:
    ld      $s8, 0x00D0($sp)
    ld      $s7, 0x00C8($sp)
    ld      $s6, 0x00C0($sp)
    ld      $s5, 0x00B8($sp)
    ld      $s4, 0x00B0($sp)
    ld      $s3, 0x00A8($sp)
    ld      $s2, 0x00A0($sp)
    ld      $s1, 0x0098($sp)
    ld      $s0, 0x0090($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00E0
.L8000A08C:
    sd      $v1, 0x0080($sp)
    jal     fat_os_8000F7A0
    sd      $a2, 0x0078($sp)
    sltiu   $v0, $v0, 0x0008
    ld      $v1, 0x0080($sp)
    beqz    $v0, .L8000A134
    ld      $a2, 0x0078($sp)
    jal     fat_os_8000F7A0
    nop
    lui     $a0, %hi(_8007BEA8)
    addiu   $a0, %lo(_8007BEA8)
    jal     fat_os_80010840
    andi    $a1, $v0, 0xFFFF
    ld      $v1, 0x0080($sp)
    ld      $a2, 0x0078($sp)
    sb      $v0, %lo(_8007D0A9)($s2)
.L8000A0CC:
    bnez    $v0, .L8000A3C0
    lw      $a1, %lo(_8007D0AC)($s0)
    lw      $v0, %lo(_8007BEA0)($s1)
    j       .L80009F70
    lw      $a0, %lo(_8007D0B0)($s5)
.L8000A0E0:
    sd      $v1, 0x0080($sp)
    jal     fat_os_8000F7A0
    sd      $a2, 0x0078($sp)
    sltiu   $v0, $v0, 0x0008
    ld      $v1, 0x0080($sp)
    beqz    $v0, .L8000A15C
    ld      $a2, 0x0078($sp)
    jal     fat_os_8000F7A0
    nop
    lui     $a0, %hi(_8007BEA8)
    addiu   $a0, %lo(_8007BEA8)
    jal     fat_os_80010840
    andi    $a1, $v0, 0xFFFF
    ld      $v1, 0x0080($sp)
    ld      $a2, 0x0078($sp)
    sb      $v0, %lo(_8007D0A9)($s2)
.L8000A120:
    bnez    $v0, .L8000A3DC
    lw      $a1, %lo(_8007D0AC)($s0)
    lw      $v0, %lo(_8007BEA0)($s1)
    j       .L8000A01C
    lw      $a0, %lo(_8007D0B0)($s5)
.L8000A134:
    lui     $a0, %hi(_8007BEA8)
    addiu   $a0, %lo(_8007BEA8)
    li      $a1, 0x0008
    sd      $v1, 0x0080($sp)
    jal     fat_os_80010840
    sd      $a2, 0x0078($sp)
    sb      $v0, %lo(_8007D0A9)($s2)
    ld      $a2, 0x0078($sp)
    j       .L8000A0CC
    ld      $v1, 0x0080($sp)
.L8000A15C:
    lui     $a0, %hi(_8007BEA8)
    addiu   $a0, %lo(_8007BEA8)
    li      $a1, 0x0008
    sd      $v1, 0x0080($sp)
    jal     fat_os_80010840
    sd      $a2, 0x0078($sp)
    sb      $v0, %lo(_8007D0A9)($s2)
    ld      $a2, 0x0078($sp)
    j       .L8000A120
    ld      $v1, 0x0080($sp)
.L8000A184:
    j       .L80009E68
    lw      $a0, %lo(_8007D0AC)($s0)
.L8000A18C:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L8000A438
    lui     $a0, %hi(_8007BEA8)
    jal     fat_os_8000F7A0
    nop
    lui     $a0, %hi(_8007BEA8)
    addiu   $a0, %lo(_8007BEA8)
    jal     fat_os_80010840
    andi    $a1, $v0, 0xFFFF
    sb      $v0, %lo(_8007D0A9)($s2)
.L8000A1BC:
    bnez    $v0, .L8000A060
    ld      $ra, 0x00D8($sp)
    lw      $v1, %lo(_8007BEA0)($s1)
    lw      $v0, %lo(_8007D0AC)($s0)
    addu    $v1, $s4, $v1
    lbu     $a0, 0x0000($v1)
    addiu   $v0, $v0, 0x0001
    sw      $v0, %lo(_8007D0AC)($s0)
    j       .L80009F48
    sb      $a0, -0x2F58($s3)
.L8000A1E4:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L8000A424
    lui     $a0, %hi(_8007BEA8)
    jal     fat_os_8000F7A0
    nop
    lui     $a0, %hi(_8007BEA8)
    addiu   $a0, %lo(_8007BEA8)
    jal     fat_os_80010840
    andi    $a1, $v0, 0xFFFF
    sb      $v0, %lo(_8007D0A9)($s2)
.L8000A214:
    bnez    $v0, .L8000A468
    lw      $v1, %lo(_8007D0AC)($s0)
    lw      $v0, %lo(_8007BEA0)($s1)
    j       .L80009F00
    lw      $a0, %lo(_8007D0B0)($s5)
.L8000A228:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L8000A410
    lui     $a0, %hi(_8007BEA8)
    jal     fat_os_8000F7A0
    nop
    lui     $a0, %hi(_8007BEA8)
    addiu   $a0, %lo(_8007BEA8)
    jal     fat_os_80010840
    andi    $a1, $v0, 0xFFFF
    sb      $v0, %lo(_8007D0A9)($s2)
.L8000A258:
    bnez    $v0, .L8000A458
    lw      $v0, %lo(_8007BEA0)($s1)
    lw      $v1, %lo(_8007D0AC)($s0)
    j       .L80009ED4
    lw      $a1, %lo(_8007D0B0)($s5)
.L8000A26C:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L8000A3FC
    lui     $a0, %hi(_8007BEA8)
    jal     fat_os_8000F7A0
    nop
    lui     $a0, %hi(_8007BEA8)
    addiu   $a0, %lo(_8007BEA8)
    jal     fat_os_80010840
    andi    $a1, $v0, 0xFFFF
    sb      $v0, %lo(_8007D0A9)($s2)
.L8000A29C:
    bnez    $v0, .L8000A474
    lw      $v0, %lo(_8007BEA0)($s1)
    j       .L80009E84
    lw      $a0, %lo(_8007D0AC)($s0)
.L8000A2AC:
    jal     fat_os_8000F7A0
    nop
    sltiu   $v0, $v0, 0x0008
    beqz    $v0, .L8000A3E8
    lui     $a0, %hi(_8007BEA8)
    jal     fat_os_8000F7A0
    nop
    lui     $a0, %hi(_8007BEA8)
    addiu   $a0, %lo(_8007BEA8)
    jal     fat_os_80010840
    andi    $a1, $v0, 0xFFFF
    sb      $v0, %lo(_8007D0A9)($s2)
.L8000A2DC:
    bnez    $v0, .L8000A44C
    lw      $v1, %lo(_8007D0AC)($s0)
    lw      $v0, %lo(_8007BEA0)($s1)
    j       .L80009EA8
    lw      $a1, %lo(_8007D0B0)($s5)
.L8000A2F0:
    jal     os_80009040
    nop
    daddu   $v1, $v0, $0
    jal     os_80009040
    sd      $v1, 0x0080($sp)
    daddu   $a3, $v0, $0
    lbu     $v0, %lo(_8007D0A9)($s2)
    bnez    $v0, .L8000A05C
    ld      $v1, 0x0080($sp)
    beqz    $v1, .L8000A184
    addiu   $v1, $v1, -0x0001
    lw      $t0, %lo(_8007D0B0)($s5)
    j       .L8000A340
    andi    $v1, $v1, 0xFFFF
.L8000A328:
    sb      $a3, 0x0000($a0)
.L8000A32C:
    addiu   $t0, $t0, 0x0001
    addiu   $v0, $v1, -0x0001
    beqz    $v1, .L8000A184
    sw      $t0, %lo(_8007D0B0)($s5)
    andi    $v1, $v0, 0xFFFF
.L8000A340:
    lw      $v0, %lo(_8007D0B4)($s6)
    lui     $a0, %hi(_8007CEA8)
    srl     $t1, $t0, 9
    addiu   $a0, %lo(_8007CEA8)
    li      $a2, 0x0200
    beq     $t1, $v0, .L8000A398
    sll     $a1, $v0, 9
    sd      $v1, 0x0080($sp)
    jal     BiCartRomWr
    sd      $a3, 0x0078($sp)
    lw      $v0, %lo(_8007D0B0)($s5)
    lui     $a0, %hi(_8007CEA8)
    srl     $v0, $v0, 9
    lui     $t0, %hi(_8007D0B4)
    addiu   $a0, %lo(_8007CEA8)
    sll     $a1, $v0, 9
    li      $a2, 0x0200
    jal     BiCartRomRd
    sw      $v0, %lo(_8007D0B4)($t0)
    lw      $t0, %lo(_8007D0B0)($s5)
    ld      $a3, 0x0078($sp)
    ld      $v1, 0x0080($sp)
.L8000A398:
    lui     $a0, %hi(_8007D0B8)
    lbu     $v0, %lo(_8007D0B8)($a0)
    andi    $a0, $t0, 0x01FF
    beqz    $v0, .L8000A328
    addu    $a0, $s8, $a0
    andi    $v0, $t0, 0x01FF
    xori    $v0, $v0, 0x0001
    addu    $v0, $s8, $v0
    j       .L8000A32C
    sb      $a3, 0x0000($v0)
.L8000A3C0:
    lw      $a0, %lo(_8007D0B0)($s5)
    j       .L80009F88
    daddu   $a3, $0, $0
.L8000A3CC:
    j       .L8000A05C
    li      $v0, 0x001F
.L8000A3D4:
    j       .L8000A05C
    li      $v0, 0x001C
.L8000A3DC:
    lw      $a0, %lo(_8007D0B0)($s5)
    j       .L8000A034
    daddu   $a3, $0, $0
.L8000A3E8:
    addiu   $a0, %lo(_8007BEA8)
    jal     fat_os_80010840
    li      $a1, 0x0008
    j       .L8000A2DC
    sb      $v0, %lo(_8007D0A9)($s2)
.L8000A3FC:
    addiu   $a0, %lo(_8007BEA8)
    jal     fat_os_80010840
    li      $a1, 0x0008
    j       .L8000A29C
    sb      $v0, %lo(_8007D0A9)($s2)
.L8000A410:
    addiu   $a0, %lo(_8007BEA8)
    jal     fat_os_80010840
    li      $a1, 0x0008
    j       .L8000A258
    sb      $v0, %lo(_8007D0A9)($s2)
.L8000A424:
    addiu   $a0, %lo(_8007BEA8)
    jal     fat_os_80010840
    li      $a1, 0x0008
    j       .L8000A214
    sb      $v0, %lo(_8007D0A9)($s2)
.L8000A438:
    addiu   $a0, %lo(_8007BEA8)
    jal     fat_os_80010840
    li      $a1, 0x0008
    j       .L8000A1BC
    sb      $v0, %lo(_8007D0A9)($s2)
.L8000A44C:
    lw      $a1, %lo(_8007D0B0)($s5)
    j       .L80009EC0
    daddu   $v0, $0, $0
.L8000A458:
    lw      $v1, %lo(_8007D0AC)($s0)
    lw      $a1, %lo(_8007D0B0)($s5)
    j       .L80009EEC
    daddu   $a0, $0, $0
.L8000A468:
    lw      $a0, %lo(_8007D0B0)($s5)
    j       .L80009F18
    daddu   $v0, $0, $0
.L8000A474:
    lw      $v1, %lo(_8007D0AC)($s0)
    j       .L80009E98
    daddu   $a1, $0, $0
.L8000A480:
    addiu   $a0, $s7, %lo(_8007CEA8)
    sll     $a1, $a1, 9
    jal     BiCartRomWr
    li      $a2, 0x0200
    j       .L8000A05C
    daddu   $v0, $0, $0

.globl os_8000A498
os_8000A498:
    addiu   $sp, $sp, -0x0038
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    addiu   $s1, $a0, 0x0018
    daddu   $s0, $a0, $0
    lui     $a0, %hi(__str_8004F1F0)
    addiu   $a0, %lo(__str_8004F1F0)
    sd      $ra, 0x0030($sp)
    jal     os_80014F98
    daddu   $a1, $s1, $0
    bnez    $v0, .L8000A508
    lui     $a0, %hi(__str_8004F1F8)
    addiu   $a0, %lo(__str_8004F1F8)
    jal     os_80014F98
    daddu   $a1, $s1, $0
    bnez    $v0, .L8000A4F0
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop
.L8000A4F0:
    daddu   $a0, $s0, $0
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       .L80009C78
    addiu   $sp, $sp, 0x0038
    nop
.L8000A508:
    daddu   $a0, $s0, $0
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       .L80009378
    addiu   $sp, $sp, 0x0038
    andi    $a0, $a0, 0x00FF
    andi    $a2, $a2, 0x00FF
    sltu    $a2, $a0, $a2
    beqz    $a2, .L8000A54C
    andi    $v0, $a1, 0x00FF
    andi    $v1, $a0, 0x000F
    li      $v0, 0x0009
    beql    $v1, $v0, .L8000A558
    andi    $v0, $a0, 0x00F0
    addiu   $a0, $a0, 0x0001
    andi    $v0, $a0, 0x00FF
.L8000A54C:
    jr      $ra
    nop
    nop
.L8000A558:
    addiu   $v0, $v0, 0x0010
    jr      $ra
    andi    $v0, $v0, 0x00FF
    nop
    andi    $a0, $a0, 0x00FF
    andi    $a1, $a1, 0x00FF
    beq     $a0, $a1, .L8000A59C
    andi    $v0, $a2, 0x00FF
    andi    $v0, $a0, 0x000F
    bnezl   $v0, .L8000A598
    addiu   $a0, $a0, -0x0001
    andi    $v0, $a0, 0x00F0
    addiu   $v0, $v0, -0x0007
    jr      $ra
    andi    $v0, $v0, 0x00FF
    nop
.L8000A598:
    andi    $v0, $a0, 0x00FF
.L8000A59C:
    jr      $ra
    nop
    nop

.globl os_8000A5A8
os_8000A5A8:
    addiu   $sp, $sp, -0x0038
    sd      $ra, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    lbu     $v0, 0x0004($a0)
    lui     $v1, %hi(_8004D020)
    andi    $v0, $v0, 0x0007
    addiu   $v1, %lo(_8004D020)
    sll     $v0, $v0, 2
    addu    $v0, $v0, $v1
    daddu   $s0, $a0, $0
    lw      $a0, 0x0000($v0)
    jal     os_80012B70
    lui     $s1, %hi(__str_8004EC28)
    lui     $a0, %hi(__str_8004ED30)
    jal     os_80012B70
    addiu   $a0, %lo(__str_8004ED30)
    lbu     $a0, 0x0003($s0)
    jal     os_80012C78
    addiu   $s1, %lo(__str_8004EC28)
    lui     $a0, %hi(__str_8004F9A0)
    jal     os_80012B70
    addiu   $a0, %lo(__str_8004F9A0)
    jal     os_80012C78
    lbu     $a0, 0x0005($s0)
    lui     $a0, %hi(__str_80050D10)
    jal     os_80012B70
    addiu   $a0, %lo(__str_80050D10)
    jal     os_80012C78
    lbu     $a0, 0x0006($s0)
    lui     $a0, %hi(__str_80050D18)
    jal     os_80012B70
    addiu   $a0, %lo(__str_80050D18)
    jal     os_80012C78
    lbu     $a0, 0x0002($s0)
    jal     os_80012B70
    daddu   $a0, $s1, $0
    jal     os_80012C78
    lbu     $a0, 0x0001($s0)
    jal     os_80012B70
    daddu   $a0, $s1, $0
    lbu     $a0, 0x0000($s0)
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       os_80012C78
    addiu   $sp, $sp, 0x0038
    nop

.globl os_8000A668
os_8000A668:
    addiu   $sp, $sp, -0x0088
    sd      $s8, 0x0078($sp)
    sd      $s7, 0x0070($sp)
    sd      $s5, 0x0060($sp)
    sd      $s3, 0x0050($sp)
    sd      $s2, 0x0048($sp)
    lui     $s8, %hi(__str_80050D20)
    lui     $s5, %hi(__str_80051050)
    lui     $s7, %hi(_8004D040)
    lui     $s2, %hi(_8004D060)
    lui     $s3, %hi(_8004D078)
    sd      $s6, 0x0068($sp)
    sd      $s4, 0x0058($sp)
    sd      $s1, 0x0040($sp)
    sd      $s0, 0x0038($sp)
    sd      $ra, 0x0080($sp)
    addiu   $s8, %lo(__str_80050D20)
    addiu   $s5, %lo(__str_80051050)
    addiu   $s7, %lo(_8004D040)
    addiu   $s2, %lo(_8004D060)
    addiu   $s3, %lo(_8004D078)
    daddu   $s6, $0, $0
    daddu   $s0, $0, $0
    daddu   $s4, $0, $0
    addiu   $s1, $sp, 0x0020
    nop
.L8000A6D0:
    bnez    $s4, .L8000A6E8
    nop
    jal     BiRTCRd
    daddu   $a0, $s1, $0
    bnez    $v0, .L8000A8A8
    ld      $ra, 0x0080($sp)
.L8000A6E8:
    jal     os_80013370
    nop
    jal     os_80012B60
    li      $a0, 0x2400
    li      $a1, 0x0016
    li      $a2, 0x0003
    jal     os_800139C0
    daddu   $a0, $s8, $0
    jal     os_80012F18
    daddu   $a0, $s5, $0
    jal     os_80012F18
    daddu   $a0, $s5, $0
    li      $v0, 0x0001
    sw      $v0, 0x002C($sp)
    sw      $s7, 0x0028($sp)
    j       .L8000A780
    daddu   $v0, $0, $0
    nop
.L8000A730:
    addu    $v1, $s1, $v1
    lbu     $v1, 0x0000($v1)
    andi    $v1, $v1, 0x0007
    sll     $v1, $v1, 2
    addu    $v1, $v1, $s3
    jal     os_80012B70
    lw      $a0, 0x0000($v1)
    jal     os_80012B60
    li      $a0, 0x3400
    lw      $a1, 0x0028($sp)
    jal     os_80012B70
    lw      $a0, 0x0000($a1)
    ld      $v0, 0x0030($sp)
.L8000A764:
    lw      $v1, 0x002C($sp)
    lw      $a0, 0x0028($sp)
    addiu   $v1, $v1, 0x0001
    addiu   $a0, $a0, 0x0004
    addiu   $v0, $v0, 0x0001
    sw      $v1, 0x002C($sp)
    sw      $a0, 0x0028($sp)
.L8000A780:
    beq     $s0, $v0, .L8000A78C
    li      $a0, 0x1400
    li      $a0, 0x3400
.L8000A78C:
    jal     os_80012B60
    sd      $v0, 0x0030($sp)
    ld      $v0, 0x0030($sp)
    addu    $v1, $s2, $v0
    beqz    $v0, .L8000A730
    lbu     $v1, 0x0000($v1)
    addu    $v1, $s1, $v1
    lbu     $a0, 0x0000($v1)
    jal     os_80012C78
    sd      $v0, 0x0030($sp)
    jal     os_80012B60
    li      $a0, 0x3400
    lw      $a3, 0x0028($sp)
    jal     os_80012B70
    lw      $a0, 0x0000($a3)
    lw      $a0, 0x002C($sp)
    slti    $v1, $a0, 0x0007
    bnez    $v1, .L8000A764
    ld      $v0, 0x0030($sp)
    jal     sysRepaint
    nop
    bnez    $s4, .L8000A870
    nop
    jal     sys_os_80015E00
    nop
    beq     $s6, $v0, .L8000A868
    li      $v1, 0x0020
    beq     $v0, $v1, .L8000A888
    li      $v1, 0x0006
    li      $v1, 0x0010
.L8000A804:
    beq     $v0, $v1, .L8000A8D8
    li      $v1, 0x0008
    bne     $v0, $v1, .L8000A900
    addu    $v1, $s2, $s0
    lbu     $v1, 0x0000($v1)
    lui     $a1, %hi(_8004D068)
    addiu   $a1, %lo(_8004D068)
    addu    $a0, $v1, $a1
    lui     $a3, %hi(_8004D070)
    addu    $a1, $s1, $v1
    lbu     $a2, 0x0000($a0)
    addiu   $a3, %lo(_8004D070)
    lbu     $a0, 0x0000($a1)
    addu    $v1, $v1, $a3
    beq     $a2, $a0, .L8000A860
    lbu     $v1, 0x0000($v1)
    andi    $v1, $a0, 0x000F
    bnez    $v1, .L8000A968
    addiu   $v1, $a0, -0x0001
    andi    $v1, $a0, 0x00F0
    addiu   $v1, $v1, -0x0010
    ori     $v1, $v1, 0x0009
    andi    $v1, $v1, 0x00FF
.L8000A860:
    sb      $v1, 0x0000($a1)
    li      $s4, 0x0001
.L8000A868:
    j       .L8000A6D0
    daddu   $s6, $v0, $0
.L8000A870:
    jal     sys_os_80016148
    nop
    li      $v1, 0x0020
    bne     $v0, $v1, .L8000A804
    li      $v1, 0x0010
    li      $v1, 0x0006
.L8000A888:
    beq     $s0, $v1, .L8000A978
    li      $v1, 0x0040
    addiu   $s0, $s0, 0x0001
    bne     $v0, $v1, .L8000A868
    andi    $s0, $s0, 0x00FF
.L8000A89C:
    bnez    $s4, .L8000A998
    daddu   $v0, $0, $0
    ld      $ra, 0x0080($sp)
.L8000A8A8:
    ld      $s8, 0x0078($sp)
    ld      $s7, 0x0070($sp)
    ld      $s6, 0x0068($sp)
    ld      $s5, 0x0060($sp)
    ld      $s4, 0x0058($sp)
    ld      $s3, 0x0050($sp)
    ld      $s2, 0x0048($sp)
    ld      $s1, 0x0040($sp)
    ld      $s0, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0088
    nop
.L8000A8D8:
    beqzl   $s0, .L8000A8E8
    li      $s0, 0x0006
    addiu   $s0, $s0, -0x0001
    andi    $s0, $s0, 0x00FF
.L8000A8E8:
    li      $v1, 0x0040
.L8000A8EC:
    beq     $v0, $v1, .L8000A89C
    daddu   $s6, $v0, $0
    j       .L8000A6D0
    nop
    nop
.L8000A900:
    li      $v1, 0x0800
    bne     $v0, $v1, .L8000A9D0
    addu    $v1, $s2, $s0
    lbu     $v1, 0x0000($v1)
    lui     $a0, %hi(_8004D070)
    addiu   $a0, %lo(_8004D070)
    addu    $a1, $v1, $a0
    addu    $a0, $s1, $v1
    lbu     $a2, 0x0000($a1)
    lui     $a3, %hi(_8004D068)
    lbu     $a1, 0x0000($a0)
    addiu   $a3, %lo(_8004D068)
    addu    $v1, $v1, $a3
    sltu    $a2, $a1, $a2
    beqz    $a2, .L8000A954
    lbu     $v1, 0x0000($v1)
    andi    $a2, $a1, 0x000F
    li      $v1, 0x0009
    beq     $a2, $v1, .L8000A980
    addiu   $v1, $a1, 0x0001
    andi    $v1, $v1, 0x00FF
.L8000A954:
    sb      $v1, 0x0000($a0)
    li      $s4, 0x0001
.L8000A95C:
    j       .L8000A6D0
    daddu   $s6, $v0, $0
    nop
.L8000A968:
    andi    $v1, $v1, 0x00FF
    sb      $v1, 0x0000($a1)
    j       .L8000A868
    li      $s4, 0x0001
.L8000A978:
    j       .L8000A8E8
    daddu   $s0, $0, $0
.L8000A980:
    andi    $v1, $a1, 0x00F0
    addiu   $v1, $v1, 0x0010
    andi    $v1, $v1, 0x00FF
    sb      $v1, 0x0000($a0)
    j       .L8000A95C
    li      $s4, 0x0001
.L8000A998:
    jal     BiRTCWr
    daddu   $a0, $s1, $0
    ld      $ra, 0x0080($sp)
    ld      $s8, 0x0078($sp)
    ld      $s7, 0x0070($sp)
    ld      $s6, 0x0068($sp)
    ld      $s5, 0x0060($sp)
    ld      $s4, 0x0058($sp)
    ld      $s3, 0x0050($sp)
    ld      $s2, 0x0048($sp)
    ld      $s1, 0x0040($sp)
    ld      $s0, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0088
.L8000A9D0:
    li      $v1, 0x0002
    beq     $v0, $v1, .L8000A89C
    li      $v1, 0x0040
    j       .L8000A8EC
    nop
    nop

.globl os_8000A9E8
os_8000A9E8:
    addiu   $sp, $sp, -0x0030
    sltu    $a1, $a1, $a0
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0028($sp)
    daddu   $s0, $a0, $0
    bnez    $a1, .L8000AA08
    li      $a0, 0x5000
    li      $a0, 0x6000
.L8000AA08:
    jal     os_80012B60
    nop
    jal     os_80012C78
    andi    $a0, $s0, 0x00FF
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    li      $a0, 0x1000
    j       os_80012B60
    addiu   $sp, $sp, 0x0030
    nop

.globl os_8000AA30
os_8000AA30:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    andi    $s0, $a0, 0x00FF
    beqz    $s0, .L8000AA78
    sd      $ra, 0x0028($sp)
    jal     os_80012B60
    li      $a0, 0x5000
    lui     $a0, %hi(__str_80050D58)
    jal     os_80012B70
    addiu   $a0, %lo(__str_80050D58)
    jal     os_80012C78
    daddu   $a0, $s0, $0
    jal     os_80012B60
    li      $a0, 0x1000
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       sysRepaint
    addiu   $sp, $sp, 0x0030
.L8000AA78:
    jal     os_80012B60
    li      $a0, 0x6000
    lui     $a0, %hi(__str_80050D60)
    jal     os_80012B70
    addiu   $a0, %lo(__str_80050D60)
    jal     os_80012B60
    li      $a0, 0x1000
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       sysRepaint
    addiu   $sp, $sp, 0x0030
    nop

.globl os_8000AAA8
os_8000AAA8:
    addiu   $sp, $sp, -0x0040
    sd      $ra, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    bnez    $a0, .L8000AAC4
    sd      $s0, 0x0020($sp)
    li      $a0, 0x0001
.L8000AAC4:
    srl     $v0, $a1, 20
    sll     $v1, $v0, 2
    sll     $s0, $v0, 7
    subu    $s0, $s0, $v1
    addu    $v0, $s0, $v0
    sll     $s0, $v0, 2
    addu    $v0, $v0, $s0
    sll     $s0, $v0, 2
    addu    $v0, $v0, $s0
    sll     $s0, $v0, 5
    divu    $0, $s0, $a0
    teq     $a0, $0, 7
    mflo    $s0
    sltiu   $v0, $s0, 0x0064
    beqz    $v0, .L8000AC38
    srl     $a1, $a1, 10
    sll     $v0, $a1, 2
    sll     $s0, $a1, 7
    subu    $s0, $s0, $v0
    addu    $a1, $s0, $a1
    sll     $s0, $a1, 2
    addu    $a1, $a1, $s0
    sll     $s0, $a1, 2
    addu    $s0, $a1, $s0
    sll     $s0, $s0, 5
    divu    $0, $s0, $a0
    teq     $a0, $0, 7
    lui     $s2, %hi(__str_80050D70)
    addiu   $s2, %lo(__str_80050D70)
    mflo    $s0
.L8000AB3C:
    lui     $s1, 0x51EB851F >> 16
    ori     $s1, 0x51EB851F & 0xFFFF
    multu   $s0, $s1
    mflo    $v0
    dsll32  $v0, $v0, 0
    dsrl32  $v0, $v0, 0
    mfhi    $s1
    dsll32  $s1, $s1, 0
    or      $s1, $s1, $v0
    dsrl32  $s1, $s1, 0
    srl     $s1, $s1, 5
    jal     os_80013308
    daddu   $a0, $s1, $0
    lui     $a0, %hi(__str_8004F9A0)
    jal     os_80012B70
    addiu   $a0, %lo(__str_8004F9A0)
    sll     $v0, $s1, 4
    sll     $s1, $s1, 2
    addu    $s1, $s1, $v0
    sll     $v0, $s1, 2
    addu    $s1, $s1, $v0
    subu    $s1, $s0, $s1
    dsll32  $s1, $s1, 0
    dsrl32  $s1, $s1, 0
    dsll    $v1, $s1, 4
    dsll    $v0, $s1, 2
    dsubu   $v0, $v1, $v0
    dsll    $v1, $v0, 4
    daddu   $v0, $v0, $v1
    dsll    $v1, $v0, 8
    daddu   $v0, $v0, $v1
    dsll    $v1, $v0, 16
    daddu   $v0, $v0, $v1
    daddu   $s1, $v0, $s1
    jal     os_80013308
    dsrl32  $a0, $s1, 3
    dsll32  $v0, $s0, 0
    dsrl32  $v0, $v0, 0
    dsll    $a0, $v0, 4
    dsll    $v1, $v0, 2
    dsubu   $v1, $a0, $v1
    dsll    $a0, $v1, 4
    daddu   $v1, $v1, $a0
    dsll    $a0, $v1, 8
    daddu   $v1, $v1, $a0
    dsll    $a0, $v1, 16
    daddu   $v1, $v1, $a0
    daddu   $v0, $v1, $v0
    dsrl32  $v0, $v0, 3
    sll     $v1, $v0, 3
    sll     $v0, $v0, 1
    addu    $a0, $v0, $v1
    jal     os_80013308
    subu    $a0, $s0, $a0
    jal     os_80012B70
    daddu   $a0, $s2, $0
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       sysRepaint
    addiu   $sp, $sp, 0x0040
    nop
.L8000AC38:
    lui     $s2, %hi(__str_80050D68)
    j       .L8000AB3C
    addiu   $s2, %lo(__str_80050D68)
    nop

.globl os_8000AC48
os_8000AC48:
    lui     $v0, 0xA4600024 >> 16
    addiu   $sp, $sp, -0x0878
    ori     $v1, $v0, 0x0028
    ori     $a1, $v0, 0x0014
    ori     $a0, $v0, 0x0018
    ori     $v0, 0xA4600024 & 0xFFFF
    sd      $s7, 0x0860($sp)
    sd      $s6, 0x0858($sp)
    lw      $s7, 0x0000($a1)
    sd      $s5, 0x0850($sp)
    lw      $s6, 0x0000($a0)
    sd      $s4, 0x0848($sp)
    sd      $s2, 0x0838($sp)
    sd      $s1, 0x0830($sp)
    lw      $s5, 0x0000($v0)
    sd      $ra, 0x0870($sp)
    lw      $s4, 0x0000($v1)
    sd      $s8, 0x0868($sp)
    sd      $s3, 0x0840($sp)
    sd      $s0, 0x0828($sp)
    jal     BiUsbWrNop
    addiu   $s1, $sp, 0x0020
    daddu   $s2, $v0, $0
    daddu   $v1, $s1, $0
    li      $a0, 0x00FF
    daddu   $v0, $0, $0
    li      $a1, 0x0100
    nop
.L8000ACB8:
    sb      $v0, 0x0000($v1)
    addiu   $v0, $v0, 0x0001
    sb      $a0, 0x0100($v1)
    addiu   $a0, $a0, -0x0001
    bne     $v0, $a1, .L8000ACB8
    addiu   $v1, $v1, 0x0001
    lui     $a0, %hi(__str_80050D78)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050D78)
    jal     sysRepaint
    addiu   $s0, $sp, 0x0420
    li      $v0, 0x0040
    sw      $v0, 0x0820($sp)
    li      $s8, 0x0001
.L8000ACF0:
    lw      $v0, 0x0820($sp)
    lui     $v1, 0xA4600014 >> 16
    ori     $v1, 0xA4600014 & 0xFFFF
    sw      $v0, 0x0000($v1)
    j       .L8000AD10
    daddu   $s3, $0, $0
.L8000AD08:
    beq     $s3, $v0, .L8000B270
    lw      $v1, 0x0820($sp)
.L8000AD10:
    jal     BiUsbWrNop
    addiu   $s3, $s3, 0x0001
    daddu   $a0, $s1, $0
    daddu   $a1, $s2, $0
    jal     sysPI_wr
    li      $a2, 0x0200
    jal     BiUsbRdNop
    nop
    daddu   $a0, $s0, $0
    daddu   $a1, $s2, $0
    jal     sysPI_rd
    li      $a2, 0x0200
    daddu   $a0, $s1, $0
    daddu   $a1, $s0, $0
    jal     os_80014678
    li      $a2, 0x0200
    beq     $v0, $s8, .L8000AD08
    li      $v0, 0x0020
    lw      $v1, 0x0820($sp)
    addiu   $a0, $v1, 0x0001
.L8000AD60:
    li      $s3, 0xA4600000
    ori     $v0, $s3, 0x0014
    li      $v1, 0x0040
    sw      $v1, 0x0000($v0)
    jal     os_8000A9E8
    li      $a1, 0x0001
    jal     sysRepaint
    li      $s8, 0x0001
    li      $v0, 0x0012
    sw      $v0, 0x0820($sp)
.L8000AD88:
    lw      $v0, 0x0820($sp)
    lui     $v1, 0xA4600018 >> 16
    ori     $v1, 0xA4600018 & 0xFFFF
    sw      $v0, 0x0000($v1)
    j       .L8000ADA8
    daddu   $s3, $0, $0
.L8000ADA0:
    beq     $s3, $v0, .L8000B2D0
    lw      $v1, 0x0820($sp)
.L8000ADA8:
    jal     BiUsbWrNop
    addiu   $s3, $s3, 0x0001
    daddu   $a0, $s1, $0
    daddu   $a1, $s2, $0
    jal     sysPI_wr
    li      $a2, 0x0200
    jal     BiUsbRdNop
    nop
    daddu   $a0, $s0, $0
    daddu   $a1, $s2, $0
    jal     sysPI_rd
    li      $a2, 0x0200
    daddu   $a0, $s1, $0
    daddu   $a1, $s0, $0
    jal     os_80014678
    li      $a2, 0x0200
    beq     $v0, $s8, .L8000ADA0
    li      $v0, 0x0100
    lw      $v1, 0x0820($sp)
    addiu   $s3, $v1, 0x0001
.L8000ADF8:
    lui     $s2, 0xA4600014 >> 16
    lui     $s8, %hi(__str_8004EC28)
    li      $v1, 0x0012
    ori     $v0, $s2, 0x0018
    addiu   $s8, %lo(__str_8004EC28)
    sw      $v1, 0x0000($v0)
    jal     os_80012B70
    daddu   $a0, $s8, $0
    li      $a1, 0x0002
    jal     os_8000A9E8
    daddu   $a0, $s3, $0
    jal     sysRepaint
    ori     $s2, 0xA4600014 & 0xFFFF
    lui     $a0, %hi(__str_80050D88)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050D88)
    jal     sysRepaint
    nop
    daddu   $a0, $s0, $0
    daddu   $a1, $0, $0
    jal     BiBootRomRd
    li      $a2, 0x0400
    daddu   $a0, $0, $0
    daddu   $a1, $s0, $0
    jal     os_8000E570
    li      $a2, 0x0400
    daddu   $s3, $v0, $0
    li      $v0, 0x0040
    sw      $v0, 0x0000($s2)
    jal     BiBootRomOn
    nop
    li      $v0, 0x0040
    sw      $v0, 0x0820($sp)
    nop
.L8000AE80:
    lw      $v0, 0x0820($sp)
    lui     $v1, 0xA4600014 >> 16
    ori     $v1, 0xA4600014 & 0xFFFF
    sw      $v0, 0x0000($v1)
    daddu   $s2, $0, $0
    daddu   $a0, $s0, $0
.L8000AE98:
    daddu   $a1, $0, $0
    jal     BiCartRomRd
    li      $a2, 0x0400
    daddu   $a0, $0, $0
    daddu   $a1, $s0, $0
    jal     os_8000E570
    li      $a2, 0x0400
    beq     $s3, $v0, .L8000B220
    lw      $v1, 0x0820($sp)
    addiu   $a0, $v1, 0x0001
.L8000AEC0:
    li      $s2, 0xA4600000
    ori     $v0, $s2, 0x0014
    li      $v1, 0x0040
    sw      $v1, 0x0000($v0)
    jal     os_8000A9E8
    li      $a1, 0x002E
    jal     sysRepaint
    nop
    li      $v0, 0x0012
    sw      $v0, 0x0820($sp)
.L8000AEE8:
    lw      $v0, 0x0820($sp)
    lui     $v1, 0xA4600018 >> 16
    ori     $v1, 0xA4600018 & 0xFFFF
    sw      $v0, 0x0000($v1)
    daddu   $s2, $0, $0
    daddu   $a0, $s0, $0
.L8000AF00:
    daddu   $a1, $0, $0
    jal     BiCartRomRd
    li      $a2, 0x0400
    daddu   $a0, $0, $0
    daddu   $a1, $s0, $0
    jal     os_8000E570
    li      $a2, 0x0400
    beq     $s3, $v0, .L8000B248
    lw      $v1, 0x0820($sp)
    addiu   $s3, $v1, 0x0001
.L8000AF28:
    li      $s2, 0xA4600000
    ori     $v0, $s2, 0x0018
    li      $v1, 0x0012
    sw      $v1, 0x0000($v0)
    jal     os_80012B70
    daddu   $a0, $s8, $0
    daddu   $a0, $s3, $0
    jal     os_8000A9E8
    li      $a1, 0x0009
    jal     sysRepaint
    li      $s3, 0x0001
    jal     BiBootRomOff
    nop
    lui     $a0, %hi(__str_80050D98)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050D98)
    jal     sysRepaint
    nop
    li      $v0, 0x0040
    sw      $v0, 0x0820($sp)
.L8000AF78:
    lw      $v0, 0x0820($sp)
    lui     $v1, 0xA4600014 >> 16
    ori     $v1, 0xA4600014 & 0xFFFF
    sw      $v0, 0x0000($v1)
    j       .L8000AF9C
    daddu   $s2, $0, $0
.L8000AF90:
    li      $v0, 0x0020
    beq     $s2, $v0, .L8000B288
    lw      $v1, 0x0820($sp)
.L8000AF9C:
    daddu   $a1, $0, $0
    li      $a2, 0x0200
    jal     BiCartRomWr
    daddu   $a0, $s1, $0
    daddu   $a0, $s0, $0
    li      $a2, 0x0200
    jal     BiCartRomRd
    daddu   $a1, $0, $0
    daddu   $a0, $s1, $0
    daddu   $a1, $s0, $0
    jal     os_80014678
    li      $a2, 0x0200
    beq     $v0, $s3, .L8000AF90
    addiu   $s2, $s2, 0x0001
    lw      $v1, 0x0820($sp)
    addiu   $a0, $v1, 0x0001
.L8000AFDC:
    li      $s2, 0xA4600000
    ori     $v0, $s2, 0x0014
    li      $v1, 0x0040
    sw      $v1, 0x0000($v0)
    jal     os_8000A9E8
    li      $a1, 0x0001
    jal     sysRepaint
    li      $s3, 0x0001
    li      $v0, 0x0012
    sw      $v0, 0x0820($sp)
.L8000B004:
    lw      $v0, 0x0820($sp)
    lui     $v1, 0xA4600018 >> 16
    ori     $v1, 0xA4600018 & 0xFFFF
    sw      $v0, 0x0000($v1)
    j       .L8000B02C
    daddu   $s2, $0, $0
    nop
.L8000B020:
    li      $v0, 0x0100
    beq     $s2, $v0, .L8000B2E8
    lw      $v1, 0x0820($sp)
.L8000B02C:
    daddu   $a1, $0, $0
    li      $a2, 0x0200
    jal     BiCartRomWr
    daddu   $a0, $s1, $0
    daddu   $a0, $s0, $0
    li      $a2, 0x0200
    jal     BiCartRomRd
    daddu   $a1, $0, $0
    daddu   $a0, $s1, $0
    daddu   $a1, $s0, $0
    jal     os_80014678
    li      $a2, 0x0200
    beq     $v0, $s3, .L8000B020
    addiu   $s2, $s2, 0x0001
    lw      $v1, 0x0820($sp)
    addiu   $s3, $v1, 0x0001
.L8000B06C:
    li      $s2, 0xA4600000
    ori     $v0, $s2, 0x0018
    li      $v1, 0x0012
    sw      $v1, 0x0000($v0)
    jal     os_80012B70
    daddu   $a0, $s8, $0
    daddu   $a0, $s3, $0
    jal     os_8000A9E8
    li      $a1, 0x000B
    jal     sysRepaint
    li      $s3, 0x0001
    lui     $a0, %hi(__str_80050DA8)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050DA8)
    jal     sysRepaint
    nop
    li      $v0, 0x0040
    sw      $v0, 0x0820($sp)
    nop
.L8000B0B8:
    lw      $v0, 0x0820($sp)
    lui     $v1, 0xA4600024 >> 16
    ori     $v1, 0xA4600024 & 0xFFFF
    sw      $v0, 0x0000($v1)
    j       .L8000B0DC
    daddu   $s2, $0, $0
.L8000B0D0:
    li      $v0, 0x0020
    beq     $s2, $v0, .L8000B2A0
    lw      $v1, 0x0820($sp)
.L8000B0DC:
    daddu   $a1, $0, $0
    li      $a2, 0x0200
    jal     BiCartRamWr
    daddu   $a0, $s1, $0
    daddu   $a0, $s0, $0
    li      $a2, 0x0200
    jal     BiCartRamRd
    daddu   $a1, $0, $0
    daddu   $a0, $s1, $0
    daddu   $a1, $s0, $0
    jal     os_80014678
    li      $a2, 0x0200
    beq     $v0, $s3, .L8000B0D0
    addiu   $s2, $s2, 0x0001
    lw      $v1, 0x0820($sp)
    addiu   $a0, $v1, 0x0001
.L8000B11C:
    li      $s2, 0xA4600000
    ori     $v0, $s2, 0x0024
    sw      $s5, 0x0000($v0)
    jal     os_8000A9E8
    li      $a1, 0x0001
    jal     sysRepaint
    li      $s3, 0x0001
    li      $v0, 0x0012
    sw      $v0, 0x0820($sp)
.L8000B140:
    lw      $v0, 0x0820($sp)
    lui     $v1, 0xA4600028 >> 16
    ori     $v1, 0xA4600028 & 0xFFFF
    sw      $v0, 0x0000($v1)
    j       .L8000B164
    daddu   $s2, $0, $0
.L8000B158:
    li      $v0, 0x0100
    beq     $s2, $v0, .L8000B2B8
    lw      $v1, 0x0820($sp)
.L8000B164:
    daddu   $a1, $0, $0
    li      $a2, 0x0200
    jal     BiCartRamWr
    daddu   $a0, $s1, $0
    daddu   $a0, $s0, $0
    li      $a2, 0x0200
    jal     BiCartRamRd
    daddu   $a1, $0, $0
    daddu   $a0, $s1, $0
    daddu   $a1, $s0, $0
    jal     os_80014678
    li      $a2, 0x0200
    beq     $v0, $s3, .L8000B158
    addiu   $s2, $s2, 0x0001
    lw      $v1, 0x0820($sp)
    addiu   $s2, $v1, 0x0001
.L8000B1A4:
    lui     $s0, 0xA4600018 >> 16
    ori     $s1, $s0, 0x0028
    daddu   $a0, $s8, $0
    sw      $s4, 0x0000($s1)
    jal     os_80012B70
    nop
    daddu   $a0, $s2, $0
    jal     os_8000A9E8
    li      $a1, 0x000B
    jal     sysRepaint
    nop
    ld      $ra, 0x0870($sp)
    ori     $v0, $s0, 0x0024
    ori     $v1, $s0, 0x0014
    ori     $s0, 0xA4600018 & 0xFFFF
    sw      $s7, 0x0000($v1)
    ld      $s8, 0x0868($sp)
    sw      $s6, 0x0000($s0)
    ld      $s7, 0x0860($sp)
    sw      $s5, 0x0000($v0)
    ld      $s6, 0x0858($sp)
    sw      $s4, 0x0000($s1)
    ld      $s5, 0x0850($sp)
    ld      $s4, 0x0848($sp)
    ld      $s3, 0x0840($sp)
    ld      $s2, 0x0838($sp)
    ld      $s1, 0x0830($sp)
    ld      $s0, 0x0828($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0878
    nop
.L8000B220:
    addiu   $s2, $s2, 0x0001
    li      $v0, 0x0020
    bne     $s2, $v0, .L8000AE98
    daddu   $a0, $s0, $0
    lw      $v1, 0x0820($sp)
    addiu   $v1, $v1, -0x0001
    bnez    $v1, .L8000AE80
    sw      $v1, 0x0820($sp)
    j       .L8000AEC0
    li      $a0, 0x0001
.L8000B248:
    addiu   $s2, $s2, 0x0001
    li      $v0, 0x0100
    bne     $s2, $v0, .L8000AF00
    daddu   $a0, $s0, $0
    lw      $v1, 0x0820($sp)
    addiu   $v1, $v1, -0x0001
    bnez    $v1, .L8000AEE8
    sw      $v1, 0x0820($sp)
    j       .L8000AF28
    li      $s3, 0x0001
.L8000B270:
    addiu   $v1, $v1, -0x0001
    bnez    $v1, .L8000ACF0
    sw      $v1, 0x0820($sp)
    j       .L8000AD60
    li      $a0, 0x0001
    nop
.L8000B288:
    addiu   $v1, $v1, -0x0001
    bnez    $v1, .L8000AF78
    sw      $v1, 0x0820($sp)
    j       .L8000AFDC
    li      $a0, 0x0001
    nop
.L8000B2A0:
    addiu   $v1, $v1, -0x0001
    bnez    $v1, .L8000B0B8
    sw      $v1, 0x0820($sp)
    j       .L8000B11C
    li      $a0, 0x0001
    nop
.L8000B2B8:
    addiu   $v1, $v1, -0x0001
    bnez    $v1, .L8000B140
    sw      $v1, 0x0820($sp)
    j       .L8000B1A4
    li      $s2, 0x0001
    nop
.L8000B2D0:
    addiu   $v1, $v1, -0x0001
    bnez    $v1, .L8000AD88
    sw      $v1, 0x0820($sp)
    j       .L8000ADF8
    li      $s3, 0x0001
    nop
.L8000B2E8:
    addiu   $v1, $v1, -0x0001
    bnez    $v1, .L8000B004
    sw      $v1, 0x0820($sp)
    j       .L8000B06C
    li      $s3, 0x0001
    nop

.globl os_8000B300
os_8000B300:
    addiu   $sp, $sp, -0x7FF0
    lui     $a0, %hi(__str_80050DB8)
    sd      $ra, 0x7FE8($sp)
    sd      $s2, 0x7FE0($sp)
    sd      $s1, 0x7FD8($sp)
    sd      $s0, 0x7FD0($sp)
    addiu   $a0, %lo(__str_80050DB8)
    jal     os_80012F18
    addiu   $sp, $sp, -0x0050
    jal     sysRepaint
    daddu   $s1, $0, $0
    jal     BiTimerSet
    daddu   $a0, $0, $0
    addiu   $s0, $sp, 0x0020
    li      $s2, 0x00800000
    daddu   $a0, $s0, $0
.L8000B340:
    daddu   $a1, $0, $0
    jal     BiCartRomRd
    li      $a2, 0x8000
    li      $v0, 0x8000
    addu    $s1, $s1, $v0
    bnel    $s1, $s2, .L8000B340
    daddu   $a0, $s0, $0
    jal     BiTimerGet
    daddu   $s1, $0, $0
    daddu   $a0, $v0, $0
    jal     os_8000AAA8
    li      $a1, 0x00800000
    lui     $a0, %hi(__str_80050DC8)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050DC8)
    jal     sysRepaint
    li      $s2, 0x00800000
    jal     BiTimerSet
    daddu   $a0, $0, $0
    daddu   $a0, $s0, $0
.L8000B390:
    daddu   $a1, $0, $0
    jal     BiCartRamRd
    li      $a2, 0x8000
    li      $v0, 0x8000
    addu    $s1, $s1, $v0
    bne     $s1, $s2, .L8000B390
    daddu   $a0, $s0, $0
    jal     BiTimerGet
    nop
    daddu   $a0, $v0, $0
    jal     os_8000AAA8
    li      $a1, 0x00800000
    addiu   $sp, $sp, 0x0050
    ld      $ra, 0x7FE8($sp)
    ld      $s2, 0x7FE0($sp)
    ld      $s1, 0x7FD8($sp)
    ld      $s0, 0x7FD0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
    nop

.globl os_8000B3E0
os_8000B3E0:
    lui     $a0, %hi(__str_80050DD8)
    addiu   $sp, $sp, -0x1058
    addiu   $a0, %lo(__str_80050DD8)
    sd      $ra, 0x1050($sp)
    sd      $s4, 0x1040($sp)
    sd      $s3, 0x1038($sp)
    sd      $s2, 0x1030($sp)
    sd      $s1, 0x1028($sp)
    sd      $s0, 0x1020($sp)
    sd      $s5, 0x1048($sp)
    jal     os_80012F18
    addiu   $s1, $sp, 0x0020
    jal     sysRepaint
    daddu   $s3, $s1, $0
    jal     BiUsbWrNop
    daddu   $s0, $0, $0
    li      $s4, 0x0100
    daddu   $s2, $v0, $0
.L8000B428:
    jal     SysRandom
    sb      $s0, 0x0000($s3)
    addiu   $s0, $s0, 0x0002
    sb      $v0, 0x0001($s3)
    bne     $s0, $s4, .L8000B428
    addiu   $s3, $s3, 0x0002
    addiu   $v0, $sp, 0x0120
    addiu   $a2, $sp, 0x01A0
    li      $a1, -0x0001
    li      $a0, -0x0056
    li      $v1, 0x0055
    sb      $a1, 0x0000($v0)
.L8000B458:
    sb      $a1, 0x0001($v0)
    sb      $0, 0x0002($v0)
    sb      $0, 0x0003($v0)
    sb      $a0, 0x0080($v0)
    sb      $a0, 0x0081($v0)
    sb      $v1, 0x0082($v0)
    sb      $v1, 0x0083($v0)
    addiu   $v0, $v0, 0x0004
    bnel    $v0, $a2, .L8000B458
    sb      $a1, 0x0000($v0)
    daddu   $s4, $0, $0
    addiu   $s3, $sp, 0x0220
    addiu   $s0, $s1, 0x0200
    li      $s5, 0x2000
.L8000B490:
    jal     BiUsbWrNop
    nop
    daddu   $a0, $s1, $0
    daddu   $a1, $s2, $0
    jal     sysPI_wr
    li      $a2, 0x0200
    jal     BiUsbRdNop
    nop
    daddu   $a0, $s3, $0
    daddu   $a1, $s2, $0
    jal     sysPI_rd
    li      $a2, 0x0200
    j       .L8000B4D0
    daddu   $v0, $s1, $0
.L8000B4C8:
    beql    $v0, $s0, .L8000B508
    addiu   $s4, $s4, 0x0001
.L8000B4D0:
    lw      $a0, 0x0000($v0)
    lw      $v1, 0x0200($v0)
    beq     $a0, $v1, .L8000B4C8
    addiu   $v0, $v0, 0x0004
    li      $v0, 0x0001
.L8000B4E4:
    ld      $ra, 0x1050($sp)
    ld      $s5, 0x1048($sp)
    ld      $s4, 0x1040($sp)
    ld      $s3, 0x1038($sp)
    ld      $s2, 0x1030($sp)
    ld      $s1, 0x1028($sp)
    ld      $s0, 0x1020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x1058
.L8000B508:
    bne     $s4, $s5, .L8000B490
    nop
    daddu   $s0, $0, $0
    j       .L8000B528
    li      $s3, 0x0400
    nop
.L8000B520:
    beq     $s0, $s3, .L8000B4E4
    daddu   $v0, $0, $0
.L8000B528:
    daddu   $a0, $s1, $0
    daddu   $a1, $0, $0
    jal     BiBootRomRd
    li      $a2, 0x1000
    daddu   $a1, $s1, $0
    li      $a2, 0x1000
    jal     os_8000E570
    daddu   $a0, $0, $0
    daddu   $a0, $s1, $0
    daddu   $a1, $0, $0
    li      $a2, 0x1000
    jal     BiBootRomRd
    daddu   $s2, $v0, $0
    daddu   $a0, $0, $0
    daddu   $a1, $s1, $0
    jal     os_8000E570
    li      $a2, 0x1000
    beq     $s2, $v0, .L8000B520
    addiu   $s0, $s0, 0x0001
    j       .L8000B4E4
    li      $v0, 0x0002
    nop

.globl os_8000B580
os_8000B580:
    addiu   $sp, $sp, -0x7FF0
    lui     $v1, 0x00018068 >> 16
    ori     $v1, 0x00018068 & 0xFFFF
    sd      $s1, 0x7FC8($sp)
    daddu   $s1, $a0, $0
    lui     $a0, %hi(__str_80050DE8)
    sd      $ra, 0x7FE8($sp)
    sd      $s2, 0x7FD0($sp)
    sd      $s0, 0x7FC0($sp)
    sd      $s4, 0x7FE0($sp)
    sd      $s3, 0x7FD8($sp)
    addiu   $a0, %lo(__str_80050DE8)
    jal     os_80012F18
    subu    $sp, $sp, $v1
    jal     sysRepaint
    addiu   $s0, $sp, 0x0028
    lui     $v1, 0xFF00AA55 >> 16
    lui     $v0, 0x00020028 >> 16
    ori     $v0, 0x00020028 & 0xFFFF
    ori     $v1, 0xFF00AA55 & 0xFFFF
    addu    $s2, $sp, $v0
    sw      $v1, 0x0020($sp)
    daddu   $v0, $s0, $0
    sw      $v1, 0x0000($v0)
.L8000B5E0:
    addiu   $v0, $v0, 0x0004
    bnel    $v0, $s2, .L8000B5E0
    sw      $v1, 0x0000($v0)
    blez    $s1, .L8000B680
    daddu   $s4, $0, $0
    addiu   $s3, $s0, 0x0004
    daddu   $a1, $0, $0
.L8000B5FC:
    li      $a2, 0x00020000
    jal     BiCartRamWr
    daddu   $a0, $s0, $0
    daddu   $a0, $s0, $0
    daddu   $a1, $0, $0
    jal     BiCartRamRd
    li      $a2, 0x00020000
    lw      $a0, 0x0000($s0)
    lw      $v0, 0x0020($sp)
    bne     $a0, $v0, .L8000B644
    daddu   $v0, $s3, $0
    j       .L8000B63C
    lw      $v1, 0x0000($v0)
.L8000B630:
    beql    $s2, $v0, .L8000B674
    addiu   $s4, $s4, 0x0001
    lw      $v1, 0x0000($v0)
.L8000B63C:
    beq     $v1, $a0, .L8000B630
    addiu   $v0, $v0, 0x0004
.L8000B644:
    li      $v0, 0x0001
.L8000B648:
    lui     $t0, 0x00018068 >> 16
    ori     $t0, 0x00018068 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $s4, 0x7FE0($sp)
    ld      $s3, 0x7FD8($sp)
    ld      $s2, 0x7FD0($sp)
    ld      $s1, 0x7FC8($sp)
    ld      $s0, 0x7FC0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
.L8000B674:
    slt     $v0, $s4, $s1
    bnez    $v0, .L8000B5FC
    daddu   $a1, $0, $0
.L8000B680:
    daddu   $s3, $s0, $0
    daddu   $s2, $0, $0
    li      $s4, 0x0200
    nop
.L8000B690:
    sra     $v0, $s2, 1
    jal     SysRandom
    sb      $v0, 0x0000($s3)
    addiu   $s2, $s2, 0x0002
    sb      $v0, 0x0001($s3)
    bne     $s2, $s4, .L8000B690
    addiu   $s3, $s3, 0x0002
    sll     $s1, $s1, 7
    daddu   $s3, $0, $0
    addiu   $s2, $sp, 0x0228
.L8000B6B8:
    slt     $v0, $s3, $s1
    beqz    $v0, .L8000B708
    daddu   $a1, $0, $0
    li      $a2, 0x0200
    jal     BiCartRamWr
    daddu   $a0, $s0, $0
    daddu   $a0, $s2, $0
    daddu   $a1, $0, $0
    jal     BiCartRamRd
    li      $a2, 0x0200
    j       .L8000B6F0
    daddu   $v0, $s0, $0
.L8000B6E8:
    beql    $v0, $s2, .L8000B6B8
    addiu   $s3, $s3, 0x0001
.L8000B6F0:
    lw      $a0, 0x0000($v0)
    lw      $v1, 0x0200($v0)
    beq     $a0, $v1, .L8000B6E8
    addiu   $v0, $v0, 0x0004
    j       .L8000B648
    li      $v0, 0x0002
.L8000B708:
    sw      $0, 0x0024($sp)
    addiu   $s0, $sp, 0x0024
.L8000B710:
    daddu   $a0, $s0, $0
    jal     BiCartRamWr
    li      $a2, 0x0004
    lw      $a1, 0x0024($sp)
    addiu   $a1, $a1, 0x0200
    sltiu   $v0, $a1, 0x4000
    bnez    $v0, .L8000B710
    sw      $a1, 0x0024($sp)
    daddu   $s0, $0, $0
    j       .L8000B748
    addiu   $s1, $sp, 0x0020
.L8000B73C:
    sltiu   $v0, $s0, 0x4000
    beqz    $v0, .L8000B648
    daddu   $v0, $0, $0
.L8000B748:
    daddu   $a1, $s0, $0
    daddu   $a0, $s1, $0
    jal     BiCartRamRd
    li      $a2, 0x0004
    lw      $v0, 0x0020($sp)
    beq     $v0, $s0, .L8000B73C
    addiu   $s0, $s0, 0x0200
    j       .L8000B648
    li      $v0, 0x0003
    nop

.globl os_8000B770
os_8000B770:
    addiu   $sp, $sp, -0x7FF0
    lui     $v1, 0x00018080 >> 16
    sd      $s1, 0x7FB0($sp)
    ori     $v1, 0x00018080 & 0xFFFF
    daddu   $s1, $a0, $0
    lui     $a0, %hi(__str_80050DF8)
    sd      $ra, 0x7FE8($sp)
    sd      $s6, 0x7FD8($sp)
    sd      $s5, 0x7FD0($sp)
    sd      $s4, 0x7FC8($sp)
    sd      $s3, 0x7FC0($sp)
    sd      $s2, 0x7FB8($sp)
    sd      $s0, 0x7FA8($sp)
    sd      $s7, 0x7FE0($sp)
    addiu   $a0, %lo(__str_80050DF8)
    jal     os_80012F18
    subu    $sp, $sp, $v1
    jal     sysRepaint
    lui     $s5, 0xAAAA5555 >> 16
    lui     $v0, 0x00020028 >> 16
    ori     $v0, 0x00020028 & 0xFFFF
    addiu   $s0, $sp, 0x0028
    ori     $s5, 0xAAAA5555 & 0xFFFF
    addu    $s2, $sp, $v0
    daddu   $s3, $0, $0
    addiu   $s4, $sp, 0x002C
    li      $s6, 0x0002
.L8000B7DC:
    bnez    $s3, .L8000B890
    li      $v1, 0xFFFF0000
.L8000B7E4:
    sw      $v1, 0x0020($sp)
    daddu   $v0, $s0, $0
    sw      $v1, 0x0000($v0)
.L8000B7F0:
    addiu   $v0, $v0, 0x0004
    bnel    $v0, $s2, .L8000B7F0
    sw      $v1, 0x0000($v0)
    blezl   $s1, .L8000B8A8
    addiu   $s3, $s3, 0x0001
    daddu   $s7, $0, $0
    daddu   $a1, $0, $0
.L8000B80C:
    li      $a2, 0x00020000
    jal     BiCartRomWr
    daddu   $a0, $s0, $0
    daddu   $a0, $s0, $0
    daddu   $a1, $0, $0
    jal     BiCartRomRd
    li      $a2, 0x00020000
    lw      $a0, 0x0000($s0)
    lw      $v0, 0x0020($sp)
    bne     $a0, $v0, .L8000B854
    daddu   $v0, $s4, $0
    j       .L8000B84C
    lw      $v1, 0x0000($v0)
.L8000B840:
    beql    $v0, $s2, .L8000B898
    addiu   $s7, $s7, 0x0001
    lw      $v1, 0x0000($v0)
.L8000B84C:
    beq     $v1, $a0, .L8000B840
    addiu   $v0, $v0, 0x0004
.L8000B854:
    li      $v0, 0x0001
.L8000B858:
    lui     $t0, 0x00018080 >> 16
    ori     $t0, 0x00018080 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $s7, 0x7FE0($sp)
    ld      $s6, 0x7FD8($sp)
    ld      $s5, 0x7FD0($sp)
    ld      $s4, 0x7FC8($sp)
    ld      $s3, 0x7FC0($sp)
    ld      $s2, 0x7FB8($sp)
    ld      $s1, 0x7FB0($sp)
    ld      $s0, 0x7FA8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
.L8000B890:
    j       .L8000B7E4
    daddu   $v1, $s5, $0
.L8000B898:
    slt     $v0, $s7, $s1
    bnez    $v0, .L8000B80C
    daddu   $a1, $0, $0
    addiu   $s3, $s3, 0x0001
.L8000B8A8:
    bne     $s3, $s6, .L8000B7DC
    nop
    daddu   $s3, $s0, $0
    daddu   $s2, $0, $0
    li      $s4, 0x0200
    nop
.L8000B8C0:
    sra     $v0, $s2, 1
    jal     SysRandom
    sb      $v0, 0x0000($s3)
    addiu   $s2, $s2, 0x0002
    sb      $v0, 0x0001($s3)
    bne     $s2, $s4, .L8000B8C0
    addiu   $s3, $s3, 0x0002
    sll     $s1, $s1, 7
    blezl   $s1, .L8000B988
    sw      $0, 0x0024($sp)
    addiu   $s3, $sp, 0x0228
    daddu   $s4, $0, $0
    addiu   $s2, $s0, 0x0400
    daddu   $a1, $0, $0
.L8000B8F8:
    li      $a2, 0x0200
    jal     BiCartRomWr
    daddu   $a0, $s0, $0
    daddu   $a0, $s3, $0
    daddu   $a1, $0, $0
    jal     BiCartRomRd
    li      $a2, 0x0200
    daddu   $v0, $s3, $0
    j       .L8000B928
    daddu   $v1, $s0, $0
.L8000B920:
    beql    $v0, $s2, .L8000B978
    addiu   $s4, $s4, 0x0001
.L8000B928:
    lw      $a1, 0x0000($v1)
    lw      $a0, 0x0000($v0)
    addiu   $v1, $v1, 0x0004
    beq     $a1, $a0, .L8000B920
    addiu   $v0, $v0, 0x0004
    lui     $t0, 0x00018080 >> 16
    ori     $t0, 0x00018080 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    li      $v0, 0x0002
    ld      $s7, 0x7FE0($sp)
    ld      $s6, 0x7FD8($sp)
    ld      $s5, 0x7FD0($sp)
    ld      $s4, 0x7FC8($sp)
    ld      $s3, 0x7FC0($sp)
    ld      $s2, 0x7FB8($sp)
    ld      $s1, 0x7FB0($sp)
    ld      $s0, 0x7FA8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
.L8000B978:
    slt     $v0, $s4, $s1
    bnez    $v0, .L8000B8F8
    daddu   $a1, $0, $0
    sw      $0, 0x0024($sp)
.L8000B988:
    daddu   $a1, $0, $0
    addiu   $s1, $sp, 0x0024
    li      $s0, 0x04000000
.L8000B994:
    daddu   $a0, $s1, $0
    jal     BiCartRomWr
    li      $a2, 0x0004
    lw      $a1, 0x0024($sp)
    addiu   $a1, $a1, 0x0200
    sltu    $v0, $a1, $s0
    bnez    $v0, .L8000B994
    sw      $a1, 0x0024($sp)
    daddu   $s0, $0, $0
    addiu   $s2, $sp, 0x0020
    j       .L8000B9D4
    li      $s1, 0x04000000
    nop
.L8000B9C8:
    sltu    $v0, $s0, $s1
    beqz    $v0, .L8000B858
    daddu   $v0, $0, $0
.L8000B9D4:
    daddu   $a1, $s0, $0
    daddu   $a0, $s2, $0
    jal     BiCartRomRd
    li      $a2, 0x0004
    lw      $v0, 0x0020($sp)
    beq     $v0, $s0, .L8000B9C8
    addiu   $s0, $s0, 0x0200
    j       .L8000B858
    li      $v0, 0x0003

.globl os_8000B9F8
os_8000B9F8:
    lui     $v1, 0x00018060 >> 16
    addiu   $sp, $sp, -0x7FF0
    ori     $v1, 0x00018060 & 0xFFFF
    lui     $a0, %hi(__str_80050E08)
    sd      $ra, 0x7FE8($sp)
    sd      $s2, 0x7FD0($sp)
    sd      $s1, 0x7FC8($sp)
    sd      $s0, 0x7FC0($sp)
    addiu   $a0, %lo(__str_80050E08)
    sd      $s4, 0x7FE0($sp)
    sd      $s3, 0x7FD8($sp)
    jal     os_80012F18
    subu    $sp, $sp, $v1
    jal     sysRepaint
    daddu   $s0, $0, $0
    jal     BiTimerSet
    daddu   $a0, $0, $0
    li      $s1, 0x8000
    j       .L8000BA50
    li      $s2, 0x02000000
.L8000BA48:
    beq     $s0, $s2, .L8000BAA0
    nop
.L8000BA50:
    sra     $a0, $s0, 9
    daddu   $a1, $a0, $0
    jal     diskReadToRom
    li      $a2, 0x0040
    daddu   $s4, $v0, $0
    beqz    $v0, .L8000BA48
    addu    $s0, $s0, $s1
.L8000BA6C:
    lui     $t0, 0x00018060 >> 16
.L8000BA70:
    ori     $t0, 0x00018060 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    daddu   $v0, $s4, $0
    ld      $s4, 0x7FE0($sp)
    ld      $s3, 0x7FD8($sp)
    ld      $s2, 0x7FD0($sp)
    ld      $s1, 0x7FC8($sp)
    ld      $s0, 0x7FC0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
    nop
.L8000BAA0:
    jal     BiTimerGet
    daddu   $s0, $0, $0
    daddu   $a0, $v0, $0
    jal     os_8000AAA8
    li      $a1, 0x02000000
    lui     $a0, %hi(__str_80050E18)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050E18)
    jal     sysRepaint
    addiu   $s1, $sp, 0x0020
    jal     BiTimerSet
    daddu   $a0, $0, $0
    li      $s2, 0x00020000
    li      $s3, 0x00200000
    sra     $a0, $s0, 9
.L8000BADC:
    daddu   $a1, $s1, $0
    jal     diskReadToRam
    li      $a2, 0x0100
    daddu   $s4, $v0, $0
    bnez    $v0, .L8000BA6C
    addu    $s0, $s0, $s2
    bnel    $s0, $s3, .L8000BADC
    sra     $a0, $s0, 9
    jal     BiTimerGet
    nop
    daddu   $a0, $v0, $0
    jal     os_8000AAA8
    li      $a1, 0x00200000
    lui     $a0, %hi(__str_80050E28)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050E28)
    jal     sysRepaint
    nop
    lui     $a0, %hi(__str_80050E38)
    addiu   $a0, %lo(__str_80050E38)
    jal     fat_os_80011AB8
    li      $a1, 0x0100
    bnez    $v0, .L8000BA6C
    daddu   $s4, $v0, $0
    jal     BiTimerSet
    daddu   $a0, $0, $0
    daddu   $a0, $s1, $0
    jal     fat_os_80010970
    li      $a1, 0x0100
    jal     BiTimerGet
    nop
    daddu   $a0, $v0, $0
    jal     os_8000AAA8
    li      $a1, 0x00020000
    j       .L8000BA70
    li      $t0, 0x00010000
    nop

.globl os_8000BB70
os_8000BB70:
    lui     $v1, 0x00018040 >> 16
    addiu   $sp, $sp, -0x7FF0
    ori     $v1, 0x00018040 & 0xFFFF
    sd      $s0, 0x7FE0($sp)
    sd      $ra, 0x7FE8($sp)
    subu    $sp, $sp, $v1
    addiu   $s0, $sp, 0x0020
    daddu   $a0, $s0, $0
    daddu   $a1, $0, $0
    jal     BiCartRamRd
    li      $a2, 0x00020000
    lui     $a0, %hi(__str_80050E50)
    addiu   $a0, %lo(__str_80050E50)
    jal     fat_os_80011AB8
    li      $a1, 0x0100
    bnez    $v0, .L8000BBC4
    lui     $t0, 0x00018040 >> 16
    daddu   $a0, $s0, $0
    jal     fat_os_80010970
    li      $a1, 0x0100
    li      $t0, 0x00010000
.L8000BBC4:
    ori     $t0, 0x00018040 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $s0, 0x7FE0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
    nop

.globl os_8000BBE0
os_8000BBE0:
    lui     $v1, 0x00018048 >> 16
    addiu   $sp, $sp, -0x7FF0
    ori     $v1, 0x00018048 & 0xFFFF
    lui     $a0, %hi(__str_80050E50)
    sd      $ra, 0x7FE8($sp)
    sd      $s0, 0x7FE0($sp)
    addiu   $a0, %lo(__str_80050E50)
    subu    $sp, $sp, $v1
    jal     fat_os_80011AB8
    daddu   $a1, $0, $0
    beqz    $v0, .L8000BC30
    addiu   $s0, $sp, 0x0020
    lui     $t0, 0x00018048 >> 16
.L8000BC14:
    ori     $t0, 0x00018048 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $s0, 0x7FE0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
    nop
.L8000BC30:
    daddu   $a0, $s0, $0
    jal     fat_os_80010840
    li      $a1, 0x0100
    bnez    $v0, .L8000BC14
    li      $t0, 0x00010000
    lui     $v1, 0x00020020 >> 16
    ori     $v1, 0x00020020 & 0xFFFF
    addu    $v1, $v1, $sp
    sd      $v0, 0x0000($v1)
    daddu   $a0, $s0, $0
    daddu   $a1, $0, $0
    jal     BiCartRamWr
    li      $a2, 0x00020000
    lui     $v1, 0x00020020 >> 16
    lui     $t0, 0x00018048 >> 16
    ori     $v1, 0x00020020 & 0xFFFF
    ori     $t0, 0x00018048 & 0xFFFF
    addu    $v1, $v1, $sp
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $v0, 0x0000($v1)
    ld      $s0, 0x7FE0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0

.globl os_8000BC90
os_8000BC90:
    lui     $v1, 0x00018068 >> 16
    addiu   $sp, $sp, -0x7FF0
    ori     $v1, 0x00018068 & 0xFFFF
    lui     $a0, %hi(__str_80050E68)
    sd      $ra, 0x7FE8($sp)
    sd      $s2, 0x7FC8($sp)
    sd      $s1, 0x7FC0($sp)
    sd      $s0, 0x7FB8($sp)
    sd      $s5, 0x7FE0($sp)
    sd      $s4, 0x7FD8($sp)
    sd      $s3, 0x7FD0($sp)
    addiu   $a0, %lo(__str_80050E68)
    jal     os_80012F18
    subu    $sp, $sp, $v1
    jal     sysRepaint
    addiu   $s1, $sp, 0x0020
    lui     $v0, 0x00020020 >> 16
    ori     $v0, 0x00020020 & 0xFFFF
    addu    $s2, $sp, $v0
    daddu   $s0, $s1, $0
.L8000BCE0:
    jal     SysRandom
    nop
    sb      $v0, 0x0000($s0)
    addiu   $s0, $s0, 0x0001
    bne     $s0, $s2, .L8000BCE0
    daddu   $a0, $0, $0
    lui     $s2, %hi(__str_80050E38)
    daddu   $a1, $s1, $0
    li      $a2, 0x00020000
    jal     os_8000E570
    addiu   $s2, %lo(__str_80050E38)
    daddu   $a0, $s2, $0
    li      $a1, 0x0100
    jal     fat_os_80011AB8
    daddu   $s4, $v0, $0
    beqz    $v0, .L8000BD58
    daddu   $s0, $v0, $0
.L8000BD24:
    lui     $t0, 0x00018068 >> 16
.L8000BD28:
    ori     $t0, 0x00018068 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    daddu   $v0, $s0, $0
    ld      $s5, 0x7FE0($sp)
    ld      $s4, 0x7FD8($sp)
    ld      $s3, 0x7FD0($sp)
    ld      $s2, 0x7FC8($sp)
    ld      $s1, 0x7FC0($sp)
    ld      $s0, 0x7FB8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
.L8000BD58:
    daddu   $a0, $s1, $0
    jal     fat_os_80010970
    li      $a1, 0x0100
    bnez    $v0, .L8000BD24
    daddu   $s0, $v0, $0
    daddu   $s3, $0, $0
    li      $s5, 0x000F
    daddu   $a0, $s2, $0
.L8000BD78:
    jal     fat_os_80011AB8
    daddu   $a1, $0, $0
    daddu   $s0, $v0, $0
    daddu   $a0, $s1, $0
    li      $a1, 0x0100
    bnez    $v0, .L8000BD24
    addiu   $s3, $s3, 0x0001
    jal     fat_os_80010840
    nop
    daddu   $s0, $v0, $0
    daddu   $a0, $0, $0
    daddu   $a1, $s1, $0
    bnez    $v0, .L8000BD24
    li      $a2, 0x00020000
    jal     os_8000E570
    nop
    bne     $s4, $v0, .L8000BD24
    li      $s0, 0x0001
    bne     $s3, $s5, .L8000BD78
    daddu   $a0, $s2, $0
    daddu   $s3, $0, $0
    li      $s5, 0x0020
.L8000BDD0:
    jal     fat_os_80011AB8
    daddu   $a1, $0, $0
    daddu   $s0, $v0, $0
    daddu   $a0, $0, $0
    li      $a1, 0x0100
    bnez    $v0, .L8000BD24
    addiu   $s3, $s3, 0x0001
    jal     fat_os_800103A0
    nop
    daddu   $s0, $v0, $0
    daddu   $a0, $s1, $0
    daddu   $a1, $0, $0
    bnez    $v0, .L8000BD24
    li      $a2, 0x00020000
    jal     BiCartRomRd
    nop
    daddu   $a0, $0, $0
    daddu   $a1, $s1, $0
    jal     os_8000E570
    li      $a2, 0x00020000
    bne     $s4, $v0, .L8000BD24
    li      $s0, 0x0002
    bne     $s3, $s5, .L8000BDD0
    daddu   $a0, $s2, $0
    daddu   $s3, $0, $0
    li      $s5, 0x000A
.L8000BE38:
    jal     fat_os_80011AB8
    li      $a1, 0x0100
    daddu   $s0, $v0, $0
    daddu   $a0, $s1, $0
    li      $a1, 0x0100
    bnez    $v0, .L8000BD24
    addiu   $s3, $s3, 0x0001
    jal     fat_os_80010970
    nop
    daddu   $s0, $v0, $0
    daddu   $a0, $s2, $0
    bnez    $v0, .L8000BD24
    daddu   $a1, $0, $0
    jal     fat_os_80011AB8
    nop
    daddu   $s0, $v0, $0
    daddu   $a0, $0, $0
    bnez    $v0, .L8000BD24
    li      $a1, 0x0100
    jal     fat_os_800103A0
    nop
    daddu   $s0, $v0, $0
    daddu   $a0, $s1, $0
    daddu   $a1, $0, $0
    bnez    $v0, .L8000BD24
    li      $a2, 0x00020000
    jal     BiCartRomRd
    nop
    daddu   $a0, $0, $0
    daddu   $a1, $s1, $0
    jal     os_8000E570
    li      $a2, 0x00020000
    bnel    $s4, $v0, .L8000BD24
    li      $s0, 0x0003
    bne     $s3, $s5, .L8000BE38
    daddu   $a0, $s2, $0
    j       .L8000BD28
    li      $t0, 0x00010000

.globl os_8000BED0
os_8000BED0:
    lui     $v1, 0x00018048 >> 16
    addiu   $sp, $sp, -0x7FF0
    ori     $v1, 0x00018048 & 0xFFFF
    lui     $a0, %hi(__str_80050E78)
    sd      $ra, 0x7FE8($sp)
    sd      $s0, 0x7FD8($sp)
    sd      $s1, 0x7FE0($sp)
    addiu   $a0, %lo(__str_80050E78)
    jal     os_80012F18
    subu    $sp, $sp, $v1
    jal     sysRepaint
    addiu   $s0, $sp, 0x0020
    daddu   $v0, $0, $0
    li      $a1, 0x00020000
.L8000BF08:
    addu    $v1, $s0, $v0
    sra     $a0, $v0, 10
    addiu   $v0, $v0, 0x0001
    bne     $v0, $a1, .L8000BF08
    sb      $a0, 0x0000($v1)
    daddu   $a1, $0, $0
    li      $a2, 0x00020000
    jal     BiCartRamWr
    daddu   $a0, $s0, $0
    jal     bi_set_save_type
    li      $a0, 0x0003
    daddu   $a0, $s0, $0
    li      $a1, 0xA8000000
    jal     sysPI_rd
    li      $a2, 0x8000
    li      $a0, 0x8000
    lui     $a1, 0xA8008000 >> 16
    addu    $a0, $s0, $a0
    ori     $a1, 0xA8008000 & 0xFFFF
    li      $a2, 0x8000
    jal     sysPI_rd
    li      $s1, 0x00010000
    addu    $a0, $s0, $s1
    li      $a1, 0xA8040000
    jal     sysPI_rd
    li      $a2, 0x8000
    ori     $a0, $s1, 0x8000
    lui     $a1, 0xA8088000 >> 16
    ori     $a1, 0xA8088000 & 0xFFFF
    addu    $a0, $s0, $a0
    jal     sysPI_rd
    li      $a2, 0x8000
    jal     bi_set_save_type
    daddu   $a0, $0, $0
    daddu   $v0, $0, $0
    j       .L8000BFA8
    li      $a1, 0x00020000
    nop
.L8000BFA0:
    beq     $v0, $a1, .L8000BFE4
    nop
.L8000BFA8:
    addu    $v1, $s0, $v0
    lbu     $a0, 0x0000($v1)
    andi    $v1, $v0, 0x7FFF
    sra     $v1, $v1, 10
    beq     $a0, $v1, .L8000BFA0
    addiu   $v0, $v0, 0x0001
    li      $v0, 0x0001
.L8000BFC4:
    lui     $t0, 0x00018048 >> 16
    ori     $t0, 0x00018048 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $s1, 0x7FE0($sp)
    ld      $s0, 0x7FD8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
.L8000BFE4:
    jal     bi_set_save_type
    li      $a0, 0x0004
    daddu   $a0, $s0, $0
    li      $a1, 0xA8000000
    jal     sysPI_rd
    li      $a2, 0x8000
    li      $a0, 0x8000
    addu    $a0, $s0, $a0
    li      $a1, 0xA8040000
    li      $a2, 0x8000
    jal     sysPI_rd
    lui     $s1, 0x00018000 >> 16
    addu    $a0, $s0, $s1
    li      $a1, 0xA8080000
    jal     sysPI_rd
    li      $a2, 0x8000
    jal     bi_set_save_type
    daddu   $a0, $0, $0
    ori     $s1, 0x00018000 & 0xFFFF
    j       .L8000C040
    daddu   $v0, $0, $0
.L8000C038:
    beql    $v0, $s1, .L8000BFC4
    daddu   $v0, $0, $0
.L8000C040:
    addu    $v1, $s0, $v0
    lbu     $a0, 0x0000($v1)
    sra     $v1, $v0, 10
    beq     $a0, $v1, .L8000C038
    addiu   $v0, $v0, 0x0001
    lui     $t0, 0x00018048 >> 16
    ori     $t0, 0x00018048 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    li      $v0, 0x0002
    ld      $s1, 0x7FE0($sp)
    ld      $s0, 0x7FD8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0

.globl os_8000C078
os_8000C078:
    lui     $v1, 0x00038050 >> 16
    addiu   $sp, $sp, -0x7FF0
    ori     $v1, 0x00038050 & 0xFFFF
    lui     $a0, %hi(__str_80050E88)
    sd      $ra, 0x7FE8($sp)
    sd      $s2, 0x7FE0($sp)
    sd      $s1, 0x7FD8($sp)
    sd      $s0, 0x7FD0($sp)
    addiu   $a0, %lo(__str_80050E88)
    jal     os_80012F18
    subu    $sp, $sp, $v1
    jal     sysRepaint
    addiu   $s0, $sp, 0x0020
    lui     $v0, 0x00020020 >> 16
    ori     $v0, 0x00020020 & 0xFFFF
    addu    $s2, $sp, $v0
    daddu   $s1, $s0, $0
    nop
.L8000C0C0:
    jal     SysRandom
    nop
    sb      $v0, 0x0000($s1)
    addiu   $s1, $s1, 0x0001
    bne     $s1, $s2, .L8000C0C0
    nop
    jal     os_80006FD0
    daddu   $a0, $s0, $0
    lui     $v0, 0x00020020 >> 16
    ori     $v0, 0x00020020 & 0xFFFF
    addu    $s2, $sp, $v0
    jal     os_80006F30
    daddu   $a0, $s2, $0
    lbu     $v1, 0x0020($sp)
    lbu     $v0, 0x0000($s2)
    bne     $v1, $v0, .L8000C130
    li      $s1, 0x0001
    j       .L8000C118
    li      $a0, 0x00020000
    nop
.L8000C110:
    beq     $s1, $a0, .L8000C158
    nop
.L8000C118:
    addu    $v1, $s0, $s1
    addu    $v0, $s2, $s1
    lbu     $v1, 0x0000($v1)
    lbu     $v0, 0x0000($v0)
    beq     $v1, $v0, .L8000C110
    addiu   $s1, $s1, 0x0001
.L8000C130:
    li      $v0, 0x0001
.L8000C134:
    lui     $t0, 0x00038050 >> 16
    ori     $t0, 0x00038050 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $s2, 0x7FE0($sp)
    ld      $s1, 0x7FD8($sp)
    ld      $s0, 0x7FD0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
.L8000C158:
    jal     os_80006EE0
    nop
    jal     os_80006F30
    daddu   $a0, $s2, $0
    lbu     $v1, 0x0000($s2)
    li      $v0, 0x00FF
    bne     $v1, $v0, .L8000C19C
    addu    $s1, $s2, $s1
    li      $v1, 0x00FF
    j       .L8000C190
    addiu   $s2, $s2, 0x0001
    nop
.L8000C188:
    beq     $s2, $s1, .L8000C134
    daddu   $v0, $0, $0
.L8000C190:
    lbu     $v0, 0x0000($s2)
    beq     $v0, $v1, .L8000C188
    addiu   $s2, $s2, 0x0001
.L8000C19C:
    lui     $t0, 0x00038050 >> 16
    ori     $t0, 0x00038050 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    li      $v0, 0x0002
    ld      $s2, 0x7FE0($sp)
    ld      $s1, 0x7FD8($sp)
    ld      $s0, 0x7FD0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
    nop

.globl os_8000C1C8
os_8000C1C8:
    addiu   $sp, $sp, -0x1048
    lui     $a0, %hi(__str_80050E98)
    sd      $s0, 0x1020($sp)
    addiu   $a0, %lo(__str_80050E98)
    addiu   $s0, $sp, 0x0020
    sd      $ra, 0x1040($sp)
    sd      $s3, 0x1038($sp)
    sd      $s2, 0x1030($sp)
    sd      $s1, 0x1028($sp)
    jal     os_80012F18
    daddu   $s2, $s0, $0
    jal     sysRepaint
    addiu   $s3, $sp, 0x0220
    daddu   $s1, $s0, $0
.L8000C200:
    jal     SysRandom
    nop
    sb      $v0, 0x0000($s1)
    addiu   $s1, $s1, 0x0001
    bne     $s1, $s3, .L8000C200
    daddu   $a0, $s0, $0
    li      $a1, 0x0001
    jal     os_80007030
    addiu   $s1, $sp, 0x0820
    li      $a1, 0x0001
    jal     os_800070A8
    daddu   $a0, $s1, $0
    daddu   $v0, $0, $0
    j       .L8000C248
    li      $a1, 0x0200
    nop
.L8000C240:
    beq     $v0, $a1, .L8000C280
    addiu   $s3, $s0, 0x0800
.L8000C248:
    addu    $a0, $s0, $v0
    addu    $v1, $s1, $v0
    lbu     $a0, 0x0000($a0)
    lbu     $v1, 0x0000($v1)
    beq     $a0, $v1, .L8000C240
    addiu   $v0, $v0, 0x0001
    li      $v0, 0x0001
.L8000C264:
    ld      $ra, 0x1040($sp)
    ld      $s3, 0x1038($sp)
    ld      $s2, 0x1030($sp)
    ld      $s1, 0x1028($sp)
    ld      $s0, 0x1020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x1048
.L8000C280:
    jal     SysRandom
    nop
    sb      $v0, 0x0000($s2)
    addiu   $s2, $s2, 0x0001
    bne     $s2, $s3, .L8000C280
    li      $a1, 0x0002
    jal     os_80007030
    daddu   $a0, $s0, $0
    li      $a1, 0x0002
    jal     os_800070A8
    daddu   $a0, $s1, $0
    daddu   $v0, $0, $0
    j       .L8000C2C0
    li      $a1, 0x0800
.L8000C2B8:
    beql    $v0, $a1, .L8000C2F8
    daddu   $a1, $0, $0
.L8000C2C0:
    addu    $a0, $s0, $v0
    addu    $v1, $s1, $v0
    lbu     $a0, 0x0000($a0)
    lbu     $v1, 0x0000($v1)
    beq     $a0, $v1, .L8000C2B8
    addiu   $v0, $v0, 0x0001
    ld      $ra, 0x1040($sp)
    li      $v0, 0x0002
    ld      $s3, 0x1038($sp)
    ld      $s2, 0x1030($sp)
    ld      $s1, 0x1028($sp)
    ld      $s0, 0x1020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x1048
.L8000C2F8:
    daddu   $a0, $s1, $0
    jal     BiCartRamRd
    li      $a2, 0x0800
    daddu   $v0, $0, $0
    j       .L8000C318
    li      $a1, 0x0800
.L8000C310:
    beql    $v0, $a1, .L8000C264
    daddu   $v0, $0, $0
.L8000C318:
    addu    $a0, $s0, $v0
    addu    $v1, $s1, $v0
    lbu     $a0, 0x0000($a0)
    lbu     $v1, 0x0000($v1)
    beq     $a0, $v1, .L8000C310
    addiu   $v0, $v0, 0x0001
    j       .L8000C264
    li      $v0, 0x0003

.globl os_8000C338
os_8000C338:
    addiu   $sp, $sp, -0x0038
    sd      $ra, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    jal     os_80013370
    sd      $s0, 0x0020($sp)
    lui     $a0, %hi(__str_80050EA8)
    addiu   $a0, %lo(__str_80050EA8)
    jal     os_80013300
    lui     $s1, %hi(__str_80051050)
    addiu   $s1, %lo(__str_80051050)
    li      $a1, 0x0024
    li      $a2, 0x0001
    jal     os_80013148
    li      $a0, 0x002D
    jal     sysRepaint
    nop
    jal     os_80012F18
    daddu   $a0, $s1, $0
    jal     os_80012F18
    daddu   $a0, $s1, $0
    jal     os_8000BB70
    nop
    beqz    $v0, .L8000C3B0
    daddu   $s0, $v0, $0
.L8000C398:
    ld      $ra, 0x0030($sp)
    daddu   $v0, $s0, $0
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
.L8000C3B0:
    jal     os_8000BC90
    nop
    jal     os_8000AA30
    daddu   $a0, $v0, $0
    jal     os_8000B3E0
    nop
    jal     os_8000AA30
    daddu   $a0, $v0, $0
    jal     os_8000B770
    li      $a0, 0x0004
    jal     os_8000AA30
    daddu   $a0, $v0, $0
    jal     os_8000B580
    li      $a0, 0x0004
    jal     os_8000AA30
    daddu   $a0, $v0, $0
    jal     os_8000C1C8
    nop
    jal     os_8000AA30
    daddu   $a0, $v0, $0
    jal     os_8000BED0
    nop
    jal     os_8000AA30
    daddu   $a0, $v0, $0
    jal     os_8000C078
    nop
    jal     os_8000AA30
    daddu   $a0, $v0, $0
    jal     os_8000B9F8
    nop
    bnez    $v0, .L8000C4C8
    nop
.L8000C430:
    jal     os_8000B300
    nop
    lui     $v0, %hi(_80078CF7)
    lbu     $v0, %lo(_80078CF7)($v0)
    bnez    $v0, .L8000C4B0
    nop
.L8000C448:
    jal     os_8000BBE0
    nop
    bnez    $v0, .L8000C398
    daddu   $s0, $v0, $0
    jal     os_80012F18
    daddu   $a0, $s1, $0
    li      $a1, 0x0024
    li      $a2, 0x0001
    jal     os_80013148
    li      $a0, 0x002D
    jal     os_80012F18
    daddu   $a0, $s1, $0
    lui     $a0, %hi(__str_80050138)
    jal     os_80012F18
    addiu   $a0, %lo(__str_80050138)
    jal     sysRepaint
    nop
    jal     sys_os_80016148
    nop
    ld      $ra, 0x0030($sp)
    daddu   $v0, $s0, $0
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop
.L8000C4B0:
    jal     os_80012F18
    daddu   $a0, $s1, $0
    jal     os_8000AC48
    nop
    j       .L8000C448
    nop
.L8000C4C8:
    jal     os_8000AA30
    daddu   $a0, $v0, $0
    j       .L8000C430
    nop

.globl os_8000C4D8
os_8000C4D8:
    lw      $v0, 0x000C($a0)
    lui     $v1, %hi(0x0000A750)
    addiu   $sp, $sp, -0x0030
    addu    $v1, $a0, $v1
    sd      $s0, 0x0000($sp)
    li      $t9, 0xA514
    sll     $s0, $v0, 1
    li      $t8, 0xA654
    li      $t7, 0xA614
    lw      $t5, %lo(0x0000A750)($v1)
    sd      $s5, 0x0028($sp)
    sd      $s4, 0x0020($sp)
    sd      $s3, 0x0018($sp)
    sd      $s2, 0x0010($sp)
    sd      $s1, 0x0008($sp)
    addu    $s0, $s0, $v0
    addu    $t9, $a0, $t9
    addu    $t8, $a0, $t8
    addu    $t7, $a0, $t7
    daddu   $t4, $0, $0
    li      $t3, 0x0008
    li      $t6, 0x0040
.L8000C530:
    addu    $t1, $t7, $t4
    addu    $t0, $t8, $t4
    addu    $a3, $t9, $t4
    daddu   $a0, $t5, $0
    daddu   $a2, $0, $0
    nop
.L8000C548:
    lbu     $v0, 0x0000($t1)
    lbu     $a1, 0x0000($a3)
    addiu   $v0, $v0, -0x0080
    sll     $v1, $v0, 2
    sll     $t2, $v0, 6
    subu    $t2, $t2, $v1
    addu    $t2, $t2, $v0
    sll     $s1, $v0, 5
    sll     $v1, $v0, 3
    subu    $v1, $s1, $v1
    sll     $s3, $t2, 2
    subu    $s3, $s3, $t2
    sll     $t2, $v1, 4
    subu    $v1, $t2, $v1
    sll     $s3, $s3, 2
    subu    $s3, $v0, $s3
    subu    $v0, $v1, $v0
    lbu     $v1, 0x0000($t0)
    sll     $v0, $v0, 2
    addiu   $v1, $v1, -0x0080
    sll     $s1, $v1, 2
    sll     $s5, $v1, 4
    sll     $t2, $v1, 3
    sll     $s4, $v1, 6
    subu    $s1, $s5, $s1
    subu    $t2, $s4, $t2
    subu    $t2, $t2, $v1
    subu    $s1, $v1, $s1
    sll     $s1, $s1, 5
    sll     $v1, $t2, 5
    addu    $s1, $s3, $s1
    addu    $v1, $t2, $v1
    sll     $a1, $a1, 10
    addiu   $s1, $s1, 0x0200
    addiu   $v0, $v0, 0x0200
    addiu   $v1, $v1, 0x0200
    addu    $v0, $v0, $a1
    addu    $v1, $v1, $a1
    addu    $a1, $s1, $a1
    sra     $v0, $v0, 10
    sra     $a1, $a1, 10
    sra     $v1, $v1, 10
    addiu   $a2, $a2, 0x0001
    slti    $s2, $v0, 0x0100
    slti    $s3, $a1, 0x0100
    slti    $s1, $v1, 0x0100
    addiu   $a3, $a3, 0x0001
    addiu   $t0, $t0, 0x0001
    addiu   $t1, $t1, 0x0001
    bltz    $v0, .L8000C620
    daddu   $t2, $0, $0
    bnez    $s2, .L8000C620
    andi    $t2, $v0, 0x00FF
    li      $t2, 0x00FF
.L8000C620:
    sb      $t2, 0x0000($a0)
    bltz    $a1, .L8000C638
    daddu   $v0, $0, $0
    bnez    $s3, .L8000C638
    andi    $v0, $a1, 0x00FF
    li      $v0, 0x00FF
.L8000C638:
    sb      $v0, 0x0001($a0)
    bltz    $v1, .L8000C650
    daddu   $v0, $0, $0
    bnez    $s1, .L8000C650
    andi    $v0, $v1, 0x00FF
    li      $v0, 0x00FF
.L8000C650:
    sb      $v0, 0x0002($a0)
    bne     $a2, $t3, .L8000C548
    addiu   $a0, $a0, 0x0003
    addiu   $t4, $t4, 0x0008
    bne     $t4, $t6, .L8000C530
    addu    $t5, $t5, $s0
    ld      $s5, 0x0028($sp)
    ld      $s4, 0x0020($sp)
    ld      $s3, 0x0018($sp)
    ld      $s2, 0x0010($sp)
    ld      $s1, 0x0008($sp)
    ld      $s0, 0x0000($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030

.globl os_8000C688
os_8000C688:
    lw      $v0, 0x000C($a0)
    lui     $v1, %hi(0x0000A750)
    addiu   $sp, $sp, -0x0038
    addu    $v1, $a0, $v1
    sd      $s1, 0x0008($sp)
    sd      $s0, 0x0000($sp)
    sll     $s1, $v0, 1
    li      $t6, 0xA514
    li      $s0, 0xA654
    li      $t9, 0xA614
    lw      $t7, %lo(0x0000A750)($v1)
    sd      $s6, 0x0030($sp)
    sd      $s5, 0x0028($sp)
    sd      $s4, 0x0020($sp)
    sd      $s3, 0x0018($sp)
    sd      $s2, 0x0010($sp)
    addu    $s1, $s1, $v0
    addu    $t6, $a0, $t6
    addu    $s0, $a0, $s0
    addu    $t9, $a0, $t9
    daddu   $t5, $0, $0
    li      $t4, 0x0008
    li      $t8, 0x0040
    nop
.L8000C6E8:
    addu    $t3, $t9, $t5
    addu    $t2, $s0, $t5
    daddu   $v0, $t7, $0
    daddu   $a1, $t6, $0
    daddu   $t1, $0, $0
    nop
.L8000C700:
    lbu     $v1, 0x0000($t3)
    lbu     $a0, 0x0000($t2)
    addiu   $v1, $v1, -0x0080
    sll     $a2, $v1, 3
    sll     $a3, $v1, 5
    subu    $a3, $a3, $a2
    sll     $t0, $v1, 6
    sll     $a2, $v1, 2
    subu    $a2, $t0, $a2
    sll     $s4, $a3, 4
    addiu   $a0, $a0, -0x0080
    addu    $a2, $a2, $v1
    subu    $s4, $s4, $a3
    sll     $s2, $a0, 3
    subu    $s4, $s4, $v1
    sll     $t0, $a0, 2
    sll     $s5, $a0, 4
    sll     $s3, $a0, 6
    lbu     $a3, 0x0000($a1)
    sll     $s6, $a2, 2
    subu    $t0, $s5, $t0
    subu    $s3, $s3, $s2
    subu    $a2, $s6, $a2
    sll     $s4, $s4, 2
    subu    $s3, $s3, $a0
    sll     $a3, $a3, 10
    subu    $a0, $a0, $t0
    addiu   $s4, $s4, 0x0200
    sll     $a2, $a2, 2
    sll     $s2, $s3, 5
    subu    $v1, $v1, $a2
    sll     $a0, $a0, 5
    addu    $t0, $s4, $a3
    addu    $s3, $s3, $s2
    addu    $v1, $v1, $a0
    sra     $t0, $t0, 10
    addiu   $t2, $t2, 0x0001
    addiu   $t3, $t3, 0x0001
    addiu   $v1, $v1, 0x0200
    addiu   $s3, $s3, 0x0200
    bltz    $t0, .L8000C7B8
    daddu   $s2, $0, $0
    slti    $a0, $t0, 0x0100
    bnez    $a0, .L8000C7B8
    andi    $s2, $t0, 0x00FF
    li      $s2, 0x00FF
.L8000C7B8:
    addu    $t0, $v1, $a3
    sra     $t0, $t0, 10
    sb      $s2, 0x0000($v0)
    bltz    $t0, .L8000C7DC
    daddu   $s2, $0, $0
    slti    $a0, $t0, 0x0100
    bnez    $a0, .L8000C7DC
    andi    $s2, $t0, 0x00FF
    li      $s2, 0x00FF
.L8000C7DC:
    addu    $a3, $s3, $a3
    sra     $t0, $a3, 10
    sb      $s2, 0x0001($v0)
    bltz    $t0, .L8000C800
    daddu   $s2, $0, $0
    slti    $a0, $t0, 0x0100
    bnez    $a0, .L8000C800
    andi    $s2, $t0, 0x00FF
    li      $s2, 0x00FF
.L8000C800:
    sb      $s2, 0x0002($v0)
    lbu     $a2, 0x0001($a1)
    daddu   $t0, $0, $0
    sll     $a2, $a2, 10
    addu    $a3, $s4, $a2
    sra     $a3, $a3, 10
    bltz    $a3, .L8000C830
    addiu   $a1, $a1, 0x0002
    slti    $a0, $a3, 0x0100
    bnez    $a0, .L8000C830
    andi    $t0, $a3, 0x00FF
    li      $t0, 0x00FF
.L8000C830:
    addu    $v1, $v1, $a2
    sra     $v1, $v1, 10
    sb      $t0, 0x0003($v0)
    bltz    $v1, .L8000C854
    daddu   $a0, $0, $0
    slti    $a3, $v1, 0x0100
    bnez    $a3, .L8000C854
    andi    $a0, $v1, 0x00FF
    li      $a0, 0x00FF
.L8000C854:
    addu    $a2, $s3, $a2
    sra     $a2, $a2, 10
    sb      $a0, 0x0004($v0)
    bltz    $a2, .L8000C878
    daddu   $v1, $0, $0
    slti    $a0, $a2, 0x0100
    bnez    $a0, .L8000C878
    andi    $v1, $a2, 0x00FF
    li      $v1, 0x00FF
.L8000C878:
    addiu   $t1, $t1, 0x0001
    sb      $v1, 0x0005($v0)
    bne     $t1, $t4, .L8000C700
    addiu   $v0, $v0, 0x0006
    addiu   $t5, $t5, 0x0008
    beq     $t5, $t8, .L8000C8A0
    addiu   $t6, $t6, 0x0010
    j       .L8000C6E8
    addu    $t7, $t7, $s1
    nop
.L8000C8A0:
    ld      $s6, 0x0030($sp)
    ld      $s5, 0x0028($sp)
    ld      $s4, 0x0020($sp)
    ld      $s3, 0x0018($sp)
    ld      $s2, 0x0010($sp)
    ld      $s1, 0x0008($sp)
    ld      $s0, 0x0000($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop

.globl os_8000C8C8
os_8000C8C8:
    addiu   $sp, $sp, -0x0050
    sd      $s2, 0x0018($sp)
    lui     $v0, %hi(0x0000A750)
    lw      $s2, 0x000C($a0)
    addu    $v0, $a0, $v0
    lw      $t9, %lo(0x0000A750)($v0)
    sll     $v0, $s2, 1
    sd      $s4, 0x0028($sp)
    sd      $s3, 0x0020($sp)
    sd      $s1, 0x0010($sp)
    sll     $s3, $s2, 3
    li      $s4, 0xA614
    addu    $s2, $v0, $s2
    li      $t8, 0xA514
    li      $s1, 0xA654
    sd      $s8, 0x0048($sp)
    sd      $s7, 0x0040($sp)
    sd      $s6, 0x0038($sp)
    sd      $s5, 0x0030($sp)
    sd      $s0, 0x0008($sp)
    addu    $s4, $a0, $s4
    subu    $s3, $s3, $v0
    addu    $s2, $t9, $s2
    addu    $t8, $a0, $t8
    addu    $s1, $a0, $s1
    daddu   $t7, $0, $0
    daddu   $t6, $0, $0
    li      $t5, 0x0008
.L8000C938:
    addu    $a1, $s2, $t7
    addu    $a0, $t9, $t7
    addu    $t4, $s4, $t6
    addu    $t3, $s1, $t6
    daddu   $a2, $t8, $0
    daddu   $t2, $0, $0
.L8000C950:
    lbu     $v0, 0x0000($t4)
    lbu     $v1, 0x0000($t3)
    addiu   $v0, $v0, -0x0080
    sll     $a3, $v0, 3
    sll     $t0, $v0, 5
    subu    $t0, $t0, $a3
    sll     $t1, $v0, 6
    sll     $a3, $v0, 2
    subu    $a3, $t1, $a3
    addu    $a3, $a3, $v0
    sll     $t1, $a3, 2
    sll     $s6, $t0, 4
    subu    $s6, $s6, $t0
    lbu     $t0, 0x0000($a2)
    sw      $t1, 0x0000($sp)
    addiu   $v1, $v1, -0x0080
    lw      $s0, 0x0000($sp)
    sll     $s7, $v1, 6
    subu    $s6, $s6, $v0
    sll     $t1, $v1, 2
    sll     $s8, $v1, 4
    sll     $s5, $v1, 3
    subu    $t1, $s8, $t1
    subu    $s5, $s7, $s5
    subu    $a3, $s0, $a3
    sll     $s6, $s6, 2
    subu    $s5, $s5, $v1
    addiu   $s6, $s6, 0x0200
    subu    $v1, $v1, $t1
    sll     $a3, $a3, 2
    sll     $t0, $t0, 10
    sll     $v1, $v1, 5
    subu    $v0, $v0, $a3
    sll     $s7, $s5, 5
    addu    $t1, $s6, $t0
    addu    $v0, $v0, $v1
    addu    $s5, $s5, $s7
    sra     $t1, $t1, 10
    addiu   $t3, $t3, 0x0001
    addiu   $t4, $t4, 0x0001
    addiu   $v0, $v0, 0x0200
    addiu   $s5, $s5, 0x0200
    addiu   $a2, $a2, 0x0001
    bltz    $t1, .L8000CA14
    daddu   $v1, $0, $0
    slti    $a3, $t1, 0x0100
    bnez    $a3, .L8000CA14
    andi    $v1, $t1, 0x00FF
    li      $v1, 0x00FF
.L8000CA14:
    addu    $t1, $v0, $t0
    sra     $t1, $t1, 10
    sb      $v1, 0x0000($a0)
    bltz    $t1, .L8000CA38
    daddu   $v1, $0, $0
    slti    $a3, $t1, 0x0100
    bnez    $a3, .L8000CA38
    andi    $v1, $t1, 0x00FF
    li      $v1, 0x00FF
.L8000CA38:
    addu    $t0, $s5, $t0
    sra     $t1, $t0, 10
    sb      $v1, 0x0001($a0)
    bltz    $t1, .L8000CA5C
    daddu   $v1, $0, $0
    slti    $a3, $t1, 0x0100
    bnez    $a3, .L8000CA5C
    andi    $v1, $t1, 0x00FF
    li      $v1, 0x00FF
.L8000CA5C:
    sb      $v1, 0x0002($a0)
    lbu     $a3, 0x0007($a2)
    addiu   $a0, $a0, 0x0003
    sll     $a3, $a3, 10
    addu    $t0, $s6, $a3
    sra     $t0, $t0, 10
    bltz    $t0, .L8000CA8C
    daddu   $t1, $0, $0
    slti    $v1, $t0, 0x0100
    bnez    $v1, .L8000CA8C
    andi    $t1, $t0, 0x00FF
    li      $t1, 0x00FF
.L8000CA8C:
    addu    $v0, $v0, $a3
    sra     $v0, $v0, 10
    sb      $t1, 0x0000($a1)
    bltz    $v0, .L8000CAB0
    daddu   $v1, $0, $0
    slti    $t0, $v0, 0x0100
    bnez    $t0, .L8000CAB0
    andi    $v1, $v0, 0x00FF
    li      $v1, 0x00FF
.L8000CAB0:
    addu    $a3, $s5, $a3
    sra     $a3, $a3, 10
    sb      $v1, 0x0001($a1)
    bltz    $a3, .L8000CAD4
    daddu   $v0, $0, $0
    slti    $v1, $a3, 0x0100
    bnez    $v1, .L8000CAD4
    andi    $v0, $a3, 0x00FF
    li      $v0, 0x00FF
.L8000CAD4:
    addiu   $t2, $t2, 0x0001
    sb      $v0, 0x0002($a1)
    bne     $t2, $t5, .L8000C950
    addiu   $a1, $a1, 0x0003
    addiu   $t6, $t6, 0x0008
    li      $v0, 0x0040
    beq     $t6, $v0, .L8000CB00
    addu    $t7, $t7, $s3
    j       .L8000C938
    addiu   $t8, $t8, 0x0010
    nop
.L8000CB00:
    ld      $s8, 0x0048($sp)
    ld      $s7, 0x0040($sp)
    ld      $s6, 0x0038($sp)
    ld      $s5, 0x0030($sp)
    ld      $s4, 0x0028($sp)
    ld      $s3, 0x0020($sp)
    ld      $s2, 0x0018($sp)
    ld      $s1, 0x0010($sp)
    ld      $s0, 0x0008($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
    nop

.globl os_8000CB30
os_8000CB30:
    addiu   $sp, $sp, -0x0050
    sd      $s2, 0x0018($sp)
    lui     $v0, %hi(0x0000A750)
    lw      $s2, 0x000C($a0)
    addu    $v0, $a0, $v0
    lw      $t9, %lo(0x0000A750)($v0)
    sll     $v0, $s2, 1
    sd      $s4, 0x0028($sp)
    sd      $s3, 0x0020($sp)
    sd      $s1, 0x0010($sp)
    sll     $s3, $s2, 3
    li      $s4, 0xA614
    addu    $s2, $v0, $s2
    li      $t8, 0xA514
    li      $s1, 0xA654
    sd      $s8, 0x0048($sp)
    sd      $s7, 0x0040($sp)
    sd      $s6, 0x0038($sp)
    sd      $s5, 0x0030($sp)
    sd      $s0, 0x0008($sp)
    addu    $s4, $a0, $s4
    subu    $s3, $s3, $v0
    addu    $s2, $t9, $s2
    addu    $t8, $a0, $t8
    addu    $s1, $a0, $s1
    daddu   $t7, $0, $0
    daddu   $t6, $0, $0
    li      $t5, 0x0008
.L8000CBA0:
    addu    $v1, $s2, $t7
    addu    $v0, $t9, $t7
    addu    $t4, $s4, $t6
    addu    $t3, $s1, $t6
    daddu   $a2, $t8, $0
    daddu   $t2, $0, $0
.L8000CBB8:
    lbu     $a0, 0x0000($t4)
    lbu     $a1, 0x0000($t3)
    addiu   $a0, $a0, -0x0080
    sll     $t0, $a0, 5
    sll     $a3, $a0, 3
    subu    $a3, $t0, $a3
    sll     $s5, $a0, 6
    sll     $t0, $a0, 2
    subu    $s5, $s5, $t0
    addu    $s5, $s5, $a0
    sll     $t0, $a3, 4
    subu    $t0, $t0, $a3
    sll     $a3, $s5, 2
    sw      $a3, 0x0000($sp)
    addiu   $a1, $a1, -0x0080
    lw      $s0, 0x0000($sp)
    subu    $t0, $t0, $a0
    sll     $s6, $a1, 2
    sll     $s8, $a1, 4
    sll     $a3, $a1, 3
    sll     $s7, $a1, 6
    lbu     $t1, 0x0000($a2)
    subu    $s6, $s8, $s6
    subu    $s5, $s0, $s5
    subu    $a3, $s7, $a3
    sll     $t0, $t0, 2
    subu    $a3, $a3, $a1
    sll     $s5, $s5, 2
    subu    $a1, $a1, $s6
    addiu   $t0, $t0, 0x0200
    sll     $t1, $t1, 10
    subu    $a0, $a0, $s5
    sll     $s6, $a3, 5
    sll     $a1, $a1, 5
    addu    $s5, $t0, $t1
    addu    $a3, $a3, $s6
    addu    $a0, $a0, $a1
    sra     $s5, $s5, 10
    addiu   $t3, $t3, 0x0001
    addiu   $t4, $t4, 0x0001
    addiu   $a0, $a0, 0x0200
    addiu   $a3, $a3, 0x0200
    bltz    $s5, .L8000CC78
    daddu   $s6, $0, $0
    slti    $a1, $s5, 0x0100
    bnez    $a1, .L8000CC78
    andi    $s6, $s5, 0x00FF
    li      $s6, 0x00FF
.L8000CC78:
    addu    $a1, $a0, $t1
    sra     $a1, $a1, 10
    sb      $s6, 0x0000($v0)
    bltz    $a1, .L8000CC9C
    daddu   $s5, $0, $0
    slti    $s6, $a1, 0x0100
    bnez    $s6, .L8000CC9C
    andi    $s5, $a1, 0x00FF
    li      $s5, 0x00FF
.L8000CC9C:
    addu    $t1, $a3, $t1
    sra     $t1, $t1, 10
    sb      $s5, 0x0001($v0)
    bltz    $t1, .L8000CCC0
    daddu   $a1, $0, $0
    slti    $s5, $t1, 0x0100
    bnez    $s5, .L8000CCC0
    andi    $a1, $t1, 0x00FF
    li      $a1, 0x00FF
.L8000CCC0:
    sb      $a1, 0x0002($v0)
    lbu     $a1, 0x0001($a2)
    daddu   $s5, $0, $0
    sll     $a1, $a1, 10
    addu    $t1, $t0, $a1
    sra     $t1, $t1, 10
    bltz    $t1, .L8000CCF0
    addiu   $a2, $a2, 0x0002
    slti    $s6, $t1, 0x0100
    bnez    $s6, .L8000CCF0
    andi    $s5, $t1, 0x00FF
    li      $s5, 0x00FF
.L8000CCF0:
    addu    $t1, $a0, $a1
    sra     $t1, $t1, 10
    sb      $s5, 0x0003($v0)
    bltz    $t1, .L8000CD14
    daddu   $s5, $0, $0
    slti    $s6, $t1, 0x0100
    bnez    $s6, .L8000CD14
    andi    $s5, $t1, 0x00FF
    li      $s5, 0x00FF
.L8000CD14:
    addu    $a1, $a3, $a1
    sra     $a1, $a1, 10
    sb      $s5, 0x0004($v0)
    bltz    $a1, .L8000CD38
    daddu   $t1, $0, $0
    slti    $s5, $a1, 0x0100
    bnez    $s5, .L8000CD38
    andi    $t1, $a1, 0x00FF
    li      $t1, 0x00FF
.L8000CD38:
    sb      $t1, 0x0005($v0)
    lbu     $a1, 0x000E($a2)
    addiu   $v0, $v0, 0x0006
    sll     $a1, $a1, 10
    addu    $t1, $t0, $a1
    sra     $t1, $t1, 10
    bltz    $t1, .L8000CD68
    daddu   $s5, $0, $0
    slti    $s6, $t1, 0x0100
    bnez    $s6, .L8000CD68
    andi    $s5, $t1, 0x00FF
    li      $s5, 0x00FF
.L8000CD68:
    addu    $t1, $a0, $a1
    sra     $t1, $t1, 10
    sb      $s5, 0x0000($v1)
    bltz    $t1, .L8000CD8C
    daddu   $s5, $0, $0
    slti    $s6, $t1, 0x0100
    bnez    $s6, .L8000CD8C
    andi    $s5, $t1, 0x00FF
    li      $s5, 0x00FF
.L8000CD8C:
    addu    $a1, $a3, $a1
    sra     $a1, $a1, 10
    sb      $s5, 0x0001($v1)
    bltz    $a1, .L8000CDB0
    daddu   $t1, $0, $0
    slti    $s5, $a1, 0x0100
    bnez    $s5, .L8000CDB0
    andi    $t1, $a1, 0x00FF
    li      $t1, 0x00FF
.L8000CDB0:
    sb      $t1, 0x0002($v1)
    lbu     $t1, 0x000F($a2)
    sll     $t1, $t1, 10
    addu    $t0, $t0, $t1
    sra     $t0, $t0, 10
    bltz    $t0, .L8000CDDC
    daddu   $s5, $0, $0
    slti    $a1, $t0, 0x0100
    bnez    $a1, .L8000CDDC
    andi    $s5, $t0, 0x00FF
    li      $s5, 0x00FF
.L8000CDDC:
    addu    $a0, $a0, $t1
    sra     $a0, $a0, 10
    sb      $s5, 0x0003($v1)
    bltz    $a0, .L8000CE00
    daddu   $a1, $0, $0
    slti    $t0, $a0, 0x0100
    bnez    $t0, .L8000CE00
    andi    $a1, $a0, 0x00FF
    li      $a1, 0x00FF
.L8000CE00:
    addu    $a3, $a3, $t1
    sra     $a3, $a3, 10
    sb      $a1, 0x0004($v1)
    bltz    $a3, .L8000CE24
    daddu   $a0, $0, $0
    slti    $a1, $a3, 0x0100
    bnez    $a1, .L8000CE24
    andi    $a0, $a3, 0x00FF
    li      $a0, 0x00FF
.L8000CE24:
    addiu   $t2, $t2, 0x0001
    sb      $a0, 0x0005($v1)
    bne     $t2, $t5, .L8000CBB8
    addiu   $v1, $v1, 0x0006
    addiu   $t6, $t6, 0x0008
    li      $v0, 0x0040
    beq     $t6, $v0, .L8000CE50
    addu    $t7, $t7, $s3
    j       .L8000CBA0
    addiu   $t8, $t8, 0x0020
    nop
.L8000CE50:
    ld      $s8, 0x0048($sp)
    ld      $s7, 0x0040($sp)
    ld      $s6, 0x0038($sp)
    ld      $s5, 0x0030($sp)
    ld      $s4, 0x0028($sp)
    ld      $s3, 0x0020($sp)
    ld      $s2, 0x0018($sp)
    ld      $s1, 0x0010($sp)
    ld      $s0, 0x0008($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
    nop
    lui     $v0, %hi(_8007D0C0)
    jr      $ra
    addiu   $v0, %lo(_8007D0C0)
    nop
    lw      $v0, 0x000C($a0)
    sw      $v0, 0x0000($a1)
    lw      $v0, 0x0010($a0)
    jr      $ra
    sw      $v0, 0x0000($a2)
    nop
    lw      $v0, 0x0000($a0)
    beqz    $v0, .L8000CED8
    daddu   $v1, $0, $0
    li      $a3, 0x000C
    addu    $a2, $a1, $v1
.L8000CEBC:
    sw      $v0, 0x0000($a2)
    addu    $v0, $a0, $v1
    lw      $v0, 0x0004($v0)
    beqz    $v0, .L8000CED8
    addiu   $v1, $v1, 0x0004
    bne     $v1, $a3, .L8000CEBC
    addu    $a2, $a1, $v1
.L8000CED8:
    jr      $ra
    daddu   $v0, $0, $0
    sltiu   $v0, $a2, 0x0004
    bnez    $v0, .L8000CF18
    nop
    li      $a2, 0x0003
    sll     $a2, $a2, 2
.L8000CEF4:
    daddu   $v0, $0, $0
.L8000CEF8:
    addu    $v1, $a1, $v0
    lw      $a3, 0x0000($v1)
    addu    $v1, $a0, $v0
    addiu   $v0, $v0, 0x0004
    bne     $v0, $a2, .L8000CEF8
    sw      $a3, 0x0000($v1)
    jr      $ra
    daddu   $v0, $0, $0
.L8000CF18:
    bnez    $a2, .L8000CEF4
    sll     $a2, $a2, 2
    jr      $ra
    daddu   $v0, $0, $0
    lw      $v0, 0x0014($a0)
    jr      $ra
    sw      $a1, 0x0014($a0)
    nop

.globl os_8000CF38
os_8000CF38:
    addiu   $sp, $sp, -0x0550
    sd      $s1, 0x0538($sp)
    addiu   $s1, $sp, 0x0020
    sd      $s2, 0x0540($sp)
    sd      $s0, 0x0530($sp)
    sd      $ra, 0x0548($sp)
    daddu   $s2, $a1, $0
    daddu   $s0, $a2, $0
    li      $a3, 0x0001
    daddu   $v0, $s1, $0
    li      $t0, 0x0011
.L8000CF64:
    lbu     $v1, 0x0001($a0)
    beqz    $v1, .L8000CF90
    li      $v1, 0x0001
    andi    $a2, $a3, 0x00FF
    nop
.L8000CF78:
    sb      $a2, 0x0000($v0)
    lbu     $a1, 0x0001($a0)
    addiu   $v1, $v1, 0x0001
    sltu    $a1, $a1, $v1
    beqz    $a1, .L8000CF78
    addiu   $v0, $v0, 0x0001
.L8000CF90:
    addiu   $a3, $a3, 0x0001
    bne     $a3, $t0, .L8000CF64
    addiu   $a0, $a0, 0x0001
    daddu   $a0, $s0, $0
    li      $a1, 0x00FF
    li      $a2, 0x0400
    jal     memset
    sb      $0, 0x0000($v0)
    daddu   $v0, $0, $0
    li      $v1, 0x0E00
.L8000CFB8:
    addu    $a0, $s0, $v0
    addiu   $v0, $v0, 0x0200
    bne     $v0, $v1, .L8000CFB8
    sh      $0, 0x0600($a0)
    lbu     $v0, 0x0020($sp)
    beqz    $v0, .L8000D060
    daddu   $a0, $s1, $0
    addiu   $a3, $sp, 0x0128
    daddu   $t1, $v0, $0
    daddu   $a2, $v0, $0
    daddu   $a1, $a3, $0
    daddu   $v1, $0, $0
.L8000CFE8:
    bne     $a2, $t1, .L8000D008
    daddu   $t0, $a2, $0
.L8000CFF0:
    sw      $v1, 0x0000($a1)
    addiu   $a0, $a0, 0x0001
    lbu     $a2, 0x0000($a0)
    addiu   $a1, $a1, 0x0004
    beq     $a2, $t0, .L8000CFF0
    addiu   $v1, $v1, 0x0001
.L8000D008:
    beqz    $a2, .L8000D078
    sll     $v1, $v1, 1
    j       .L8000CFE8
    addiu   $t1, $t1, 0x0001
.L8000D018:
    addiu   $v0, $v0, -0x000A
    sll     $v0, $v0, 9
    addu    $v0, $t3, $v0
    lhu     $v1, 0x0000($v0)
    beqzl   $v1, .L8000D044
    sh      $t0, 0x0000($v0)
    addiu   $v0, $v0, 0x0004
.L8000D034:
    lhu     $v1, 0x0000($v0)
    bnezl   $v1, .L8000D034
    addiu   $v0, $v0, 0x0004
    sh      $t0, 0x0000($v0)
.L8000D044:
    sh      $a1, 0x0002($v0)
    sh      $0, 0x0004($v0)
.L8000D04C:
    addiu   $a2, $a2, 0x0001
    addu    $v0, $s1, $a2
    lbu     $v0, 0x0000($v0)
    bnez    $v0, .L8000D088
    addiu   $a3, $a3, 0x0004
.L8000D060:
    ld      $ra, 0x0548($sp)
.L8000D064:
    ld      $s2, 0x0540($sp)
    ld      $s1, 0x0538($sp)
    ld      $s0, 0x0530($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0550
.L8000D078:
    addiu   $t3, $s0, 0x0600
    daddu   $a2, $0, $0
    li      $t2, 0x0009
    li      $t1, 0x0001
.L8000D088:
    addu    $v1, $s2, $a2
    lbu     $a1, 0x0000($v1)
    sltiu   $v1, $v0, 0x000A
    addu    $a0, $s0, $a1
    sb      $v0, 0x0400($a0)
    beqz    $v1, .L8000D018
    lw      $t0, 0x0000($a3)
    subu    $v0, $t2, $v0
    sllv    $a0, $t1, $v0
    beqz    $a0, .L8000D04C
    sllv    $v0, $t0, $v0
    sll     $v1, $v0, 1
    sll     $a1, $a1, 16
    sra     $a1, $a1, 16
    addu    $v1, $s0, $v1
    daddu   $v0, $0, $0
.L8000D0C8:
    addiu   $v0, $v0, 0x0001
    sh      $a1, 0x0000($v1)
    bne     $v0, $a0, .L8000D0C8
    addiu   $v1, $v1, 0x0002
    addiu   $a2, $a2, 0x0001
    addu    $v0, $s1, $a2
    lbu     $v0, 0x0000($v0)
    bnez    $v0, .L8000D088
    addiu   $a3, $a3, 0x0004
    j       .L8000D064
    ld      $ra, 0x0548($sp)
    nop

.globl os_8000D0F8
os_8000D0F8:
    lw      $v1, 0x002C($a0)
    addiu   $sp, $sp, -0x0028
    sltiu   $v0, $v1, 0x0009
    beqz    $v0, .L8000D1E8
    sd      $ra, 0x0020($sp)
    lw      $v0, 0x0024($a0)
    lw      $t1, 0x001C($a0)
    sltu    $a2, $v0, $t1
    bnez    $a2, .L8000D150
    li      $t2, 0x00FF
    j       .L8000D1F4
    li      $v0, 0xA698
.L8000D128:
    addiu   $v1, $v1, 0x0008
.L8000D12C:
    or      $a2, $a3, $a2
    sltiu   $v0, $v1, 0x0009
    sw      $a2, 0x0028($a0)
    beqz    $v0, .L8000D198
    sw      $v1, 0x002C($a0)
.L8000D140:
    lw      $v0, 0x0024($a0)
    sltu    $a2, $v0, $t1
    beqzl   $a2, .L8000D1F4
    li      $v0, 0xA698
.L8000D150:
    lw      $a2, 0x0028($a0)
    lbu     $a3, 0x0000($v0)
    sll     $a2, $a2, 8
    addiu   $t0, $v0, 0x0001
    sw      $t0, 0x0024($a0)
    bne     $a3, $t2, .L8000D128
    sw      $a2, 0x0028($a0)
    lbu     $t0, 0x0001($v0)
    bnez    $t0, .L8000D12C
    addiu   $v1, $v1, 0x0008
    addiu   $v0, $v0, 0x0002
    sw      $v0, 0x0024($a0)
    or      $a2, $a3, $a2
    sltiu   $v0, $v1, 0x0009
    sw      $a2, 0x0028($a0)
    bnez    $v0, .L8000D140
    sw      $v1, 0x002C($a0)
    nop
.L8000D198:
    addiu   $a3, $v1, -0x0009
    srlv    $a2, $a2, $a3
    sll     $a2, $a2, 1
    addu    $a2, $a1, $a2
    lh      $v0, 0x0000($a2)
    bltzl   $v0, .L8000D200
    addiu   $a1, $a1, 0x0600
    addu    $a1, $a1, $v0
    lbu     $a1, 0x0400($a1)
    lw      $a2, 0x0028($a0)
    subu    $v1, $v1, $a1
    li      $a1, 0x0001
    sllv    $a1, $a1, $v1
    addiu   $a1, $a1, -0x0001
    and     $a1, $a2, $a1
    sw      $a1, 0x0028($a0)
    sw      $v1, 0x002C($a0)
.L8000D1DC:
    ld      $ra, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028
.L8000D1E8:
    j       .L8000D198
    lw      $a2, 0x0028($a0)
.L8000D1F0:
    li      $v0, 0xA698
.L8000D1F4:
    addu    $a0, $a0, $v0
    jal     longjmp
    li      $a1, -0x0005
.L8000D200:
    li      $v0, 0x000A
    li      $t3, 0x00FF
    j       .L8000D220
    li      $t2, 0x0011
.L8000D210:
    or      $a3, $t0, $a3
.L8000D214:
    addiu   $v1, $v1, 0x0008
    sw      $a3, 0x0028($a0)
    sw      $v1, 0x002C($a0)
.L8000D220:
    sltu    $a2, $v1, $v0
    beqzl   $a2, .L8000D270
    lw      $t0, 0x0028($a0)
    lw      $a2, 0x0024($a0)
    lw      $a3, 0x001C($a0)
    sltu    $a3, $a2, $a3
    beqz    $a3, .L8000D1F0
    addiu   $t1, $a2, 0x0001
    lw      $a3, 0x0028($a0)
    lbu     $t0, 0x0000($a2)
    sll     $a3, $a3, 8
    sw      $t1, 0x0024($a0)
    bne     $t0, $t3, .L8000D210
    sw      $a3, 0x0028($a0)
    lbu     $t1, 0x0001($a2)
    bnezl   $t1, .L8000D214
    or      $a3, $t0, $a3
    addiu   $a2, $a2, 0x0002
    j       .L8000D210
    sw      $a2, 0x0024($a0)
.L8000D270:
    subu    $a3, $v1, $v0
    srlv    $t4, $t0, $a3
    j       .L8000D28C
    daddu   $a2, $a1, $0
.L8000D280:
    beql    $t1, $t4, .L8000D2AC
    li      $v0, 0x0001
    addiu   $a2, $a2, 0x0004
.L8000D28C:
    lhu     $t1, 0x0000($a2)
    bnez    $t1, .L8000D280
    nop
    addiu   $v0, $v0, 0x0001
    bne     $v0, $t2, .L8000D220
    addiu   $a1, $a1, 0x0200
    j       .L8000D1DC
    daddu   $v0, $0, $0
.L8000D2AC:
    sllv    $v0, $v0, $a3
    addiu   $v0, $v0, -0x0001
    and     $t0, $t0, $v0
    sw      $t0, 0x0028($a0)
    sw      $a3, 0x002C($a0)
    j       .L8000D1DC
    lhu     $v0, 0x0002($a2)

.globl os_8000D2C8
os_8000D2C8:
    addiu   $sp, $sp, -0x00F0
    sd      $s2, 0x00B0($sp)
    daddu   $s2, $a1, $0
    sd      $s4, 0x00C0($sp)
    sd      $s3, 0x00B8($sp)
    sll     $s4, $s2, 5
    sll     $s3, $s2, 3
    sd      $s5, 0x00C8($sp)
    addu    $s5, $s3, $s4
    subu    $s5, $s5, $s2
    sd      $s1, 0x00A8($sp)
    sd      $s0, 0x00A0($sp)
    addiu   $s1, $sp, 0x0020
    daddu   $s0, $a0, $0
    sll     $s5, $s5, 2
    daddu   $a1, $0, $0
    daddu   $a0, $s1, $0
    li      $a2, 0x0080
    addu    $s5, $s0, $s5
    sd      $ra, 0x00E8($sp)
    sd      $s8, 0x00E0($sp)
    sd      $s7, 0x00D8($sp)
    jal     memset
    sd      $s6, 0x00D0($sp)
    lw      $a1, 0x0040($s5)
    jal     os_8000D0F8
    daddu   $a0, $s0, $0
    beqzl   $v0, .L8000D458
    lhu     $v0, 0x0044($s5)
    lw      $a0, 0x002C($s0)
    sltu    $v1, $a0, $v0
    beqzl   $v1, .L8000D664
    lw      $a3, 0x0028($s0)
    lw      $v1, 0x0024($s0)
    lw      $t0, 0x001C($s0)
    sltu    $a1, $v1, $t0
    bnez    $a1, .L8000D390
    li      $t1, 0x00FF
    j       .L8000D658
    li      $a0, 0xA698
.L8000D368:
    addiu   $a0, $a0, 0x0008
.L8000D36C:
    or      $a1, $a2, $a1
    sltu    $v1, $a0, $v0
    sw      $a1, 0x0028($s0)
    beqz    $v1, .L8000D3D4
    sw      $a0, 0x002C($s0)
.L8000D380:
    lw      $v1, 0x0024($s0)
    sltu    $a1, $v1, $t0
    beqzl   $a1, .L8000D658
    li      $a0, 0xA698
.L8000D390:
    lw      $a1, 0x0028($s0)
    lbu     $a2, 0x0000($v1)
    sll     $a1, $a1, 8
    addiu   $a3, $v1, 0x0001
    sw      $a3, 0x0024($s0)
    bne     $a2, $t1, .L8000D368
    sw      $a1, 0x0028($s0)
    lbu     $a3, 0x0001($v1)
    bnez    $a3, .L8000D36C
    addiu   $a0, $a0, 0x0008
    addiu   $v1, $v1, 0x0002
    sw      $v1, 0x0024($s0)
    or      $a1, $a2, $a1
    sltu    $v1, $a0, $v0
    sw      $a1, 0x0028($s0)
    bnez    $v1, .L8000D380
    sw      $a0, 0x002C($s0)
.L8000D3D4:
    daddu   $a3, $a1, $0
.L8000D3D8:
    subu    $a0, $a0, $v0
    li      $a2, 0x0001
    srlv    $a1, $a1, $a0
    sllv    $a2, $a2, $a0
    sll     $a1, $a1, 16
    sra     $a1, $a1, 16
    addiu   $a2, $a2, -0x0001
    addiu   $v1, $v0, -0x0001
    and     $a3, $a3, $a2
    srlv    $v1, $a1, $v1
    sw      $a3, 0x0028($s0)
    sh      $a1, 0x0020($sp)
    bnez    $v1, .L8000D42C
    sw      $a0, 0x002C($s0)
    li      $v1, -0x0001
    sllv    $v0, $v1, $v0
    addiu   $v0, $v0, 0x0001
    addu    $a1, $v0, $a1
    sll     $a1, $a1, 16
    sra     $a1, $a1, 16
    sh      $a1, 0x0020($sp)
.L8000D42C:
    addu    $v0, $s3, $s4
    subu    $v0, $v0, $s2
    sll     $v0, $v0, 2
    addu    $v0, $s0, $v0
    lhu     $v1, 0x0044($v0)
    addu    $a1, $a1, $v1
    sll     $a1, $a1, 16
    sra     $a1, $a1, 16
    sh      $a1, 0x0044($v0)
    j       .L8000D45C
    sh      $a1, 0x0020($sp)
.L8000D458:
    sh      $v0, 0x0020($sp)
.L8000D45C:
    addu    $s7, $s3, $s4
    subu    $s7, $s7, $s2
    sll     $s7, $s7, 2
    addu    $s7, $s0, $s7
    li      $s6, 0x0001
    li      $s8, 0x0001
    j       .L8000D49C
    li      $s5, 0x00FF
    nop
.L8000D480:
    beqz    $v1, .L8000D5D0
    li      $v0, 0x000F
    beql    $v1, $v0, .L8000D648
    addiu   $s6, $s6, 0x0010
.L8000D490:
    sltiu   $v0, $s6, 0x0040
    beqzl   $v0, .L8000D5D4
    addu    $s3, $s3, $s4
.L8000D49C:
    lw      $a1, 0x003C($s7)
.L8000D4A0:
    jal     os_8000D0F8
    daddu   $a0, $s0, $0
    srl     $v1, $v0, 4
    andi    $v0, $v0, 0x000F
    beqz    $v0, .L8000D480
    andi    $v1, $v1, 0x00FF
    addu    $s6, $v1, $s6
    andi    $s6, $s6, 0x00FF
    sltiu   $v1, $s6, 0x0040
    beqz    $v1, .L8000D66C
    lui     $a0, %hi(_8007D0C0)
    lw      $a0, 0x002C($s0)
    sltu    $v1, $a0, $v0
    beqzl   $v1, .L8000D650
    lw      $a3, 0x0028($s0)
    lw      $v1, 0x0024($s0)
    lw      $t0, 0x001C($s0)
    sltu    $a1, $v1, $t0
    bnezl   $a1, .L8000D524
    lw      $a1, 0x0028($s0)
    j       .L8000D658
    li      $a0, 0xA698
.L8000D4F8:
    addiu   $a0, $a0, 0x0008
.L8000D4FC:
    or      $a1, $a2, $a1
    sltu    $v1, $a0, $v0
    sw      $a1, 0x0028($s0)
    beqz    $v1, .L8000D568
    sw      $a0, 0x002C($s0)
.L8000D510:
    lw      $v1, 0x0024($s0)
    sltu    $a1, $v1, $t0
    beqzl   $a1, .L8000D658
    li      $a0, 0xA698
    lw      $a1, 0x0028($s0)
.L8000D524:
    lbu     $a2, 0x0000($v1)
    sll     $a1, $a1, 8
    addiu   $a3, $v1, 0x0001
    sw      $a3, 0x0024($s0)
    bne     $a2, $s5, .L8000D4F8
    sw      $a1, 0x0028($s0)
    lbu     $a3, 0x0001($v1)
    bnez    $a3, .L8000D4FC
    addiu   $a0, $a0, 0x0008
    addiu   $v1, $v1, 0x0002
    sw      $v1, 0x0024($s0)
    or      $a1, $a2, $a1
    sltu    $v1, $a0, $v0
    sw      $a1, 0x0028($s0)
    bnez    $v1, .L8000D510
    sw      $a0, 0x002C($s0)
    nop
.L8000D568:
    daddu   $a3, $a1, $0
.L8000D56C:
    subu    $a0, $a0, $v0
    srlv    $a1, $a1, $a0
    sllv    $t0, $s8, $a0
    sll     $a1, $a1, 16
    sra     $a1, $a1, 16
    addiu   $t0, $t0, -0x0001
    sll     $v1, $s6, 1
    addiu   $a2, $v0, -0x0001
    and     $a3, $a3, $t0
    addu    $v1, $s1, $v1
    srlv    $a2, $a1, $a2
    sw      $a3, 0x0028($s0)
    sh      $a1, 0x0000($v1)
    bnez    $a2, .L8000D5BC
    sw      $a0, 0x002C($s0)
    li      $a0, -0x0001
    sllv    $v0, $a0, $v0
    addiu   $v0, $v0, 0x0001
    addu    $a1, $v0, $a1
    sh      $a1, 0x0000($v1)
.L8000D5BC:
    addiu   $s6, $s6, 0x0001
    andi    $s6, $s6, 0x00FF
    sltiu   $v0, $s6, 0x0040
    bnezl   $v0, .L8000D4A0
    lw      $a1, 0x003C($s7)
.L8000D5D0:
    addu    $s3, $s3, $s4
.L8000D5D4:
    subu    $s2, $s3, $s2
    sll     $s2, $s2, 2
    addu    $s0, $s0, $s2
    lui     $v0, %hi(_8004D110)
    lui     $a0, %hi(_8004D150)
    addiu   $v0, %lo(_8004D110)
    addiu   $s0, $s0, 0x0046
    addiu   $a0, %lo(_8004D150)
    nop
.L8000D5F8:
    lbu     $v1, 0x0000($v0)
    addiu   $v0, $v0, 0x0001
    sll     $v1, $v1, 1
    addu    $v1, $s1, $v1
    lhu     $v1, 0x0000($v1)
    sh      $v1, 0x0000($s0)
    bne     $v0, $a0, .L8000D5F8
    addiu   $s0, $s0, 0x0002
    ld      $ra, 0x00E8($sp)
    ld      $s8, 0x00E0($sp)
    ld      $s7, 0x00D8($sp)
    ld      $s6, 0x00D0($sp)
    ld      $s5, 0x00C8($sp)
    ld      $s4, 0x00C0($sp)
    ld      $s3, 0x00B8($sp)
    ld      $s2, 0x00B0($sp)
    ld      $s1, 0x00A8($sp)
    ld      $s0, 0x00A0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00F0
.L8000D648:
    j       .L8000D490
    andi    $s6, $s6, 0x00FF
.L8000D650:
    j       .L8000D56C
    daddu   $a1, $a3, $0
.L8000D658:
    addu    $a0, $s0, $a0
    jal     longjmp
    li      $a1, -0x0005
.L8000D664:
    j       .L8000D3D8
    daddu   $a1, $a3, $0
.L8000D66C:
    lui     $a2, %hi(__str_80050EC8)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80050EC8)
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000D5D4
    addu    $s3, $s3, $s4

.globl os_8000D688
os_8000D688:
    addiu   $sp, $sp, -0x0038
    sd      $s0, 0x0020($sp)
    daddu   $a1, $0, $0
    daddu   $s0, $a0, $0
    sd      $ra, 0x0030($sp)
    jal     os_8000D2C8
    sd      $s1, 0x0028($sp)
    addiu   $s1, $s0, 0x0030
    li      $a1, 0xA514
    addu    $a1, $s0, $a1
    li      $a2, 0x0010
    jal     os_80005770
    daddu   $a0, $s1, $0
    daddu   $a0, $s0, $0
    jal     os_8000D2C8
    daddu   $a1, $0, $0
    li      $a1, 0xA51C
    addu    $a1, $s0, $a1
    li      $a2, 0x0010
    jal     os_80005770
    daddu   $a0, $s1, $0
    daddu   $a0, $s0, $0
    jal     os_8000D2C8
    daddu   $a1, $0, $0
    li      $a1, 0xA594
    addu    $a1, $s0, $a1
    li      $a2, 0x0010
    jal     os_80005770
    daddu   $a0, $s1, $0
    daddu   $a0, $s0, $0
    jal     os_8000D2C8
    daddu   $a1, $0, $0
    li      $a1, 0xA59C
    addu    $a1, $s0, $a1
    daddu   $a0, $s1, $0
    jal     os_80005770
    li      $a2, 0x0010
    daddu   $a0, $s0, $0
    jal     os_8000D2C8
    li      $a1, 0x0001
    li      $a1, 0xA654
    addu    $a1, $s0, $a1
    li      $a2, 0x0008
    jal     os_80005770
    addiu   $a0, $s0, 0x00CC
    daddu   $a0, $s0, $0
    jal     os_8000D2C8
    li      $a1, 0x0002
    li      $a1, 0xA614
    addu    $a1, $s0, $a1
    addiu   $a0, $s0, 0x0168
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    li      $a2, 0x0008
    j       os_80005770
    addiu   $sp, $sp, 0x0038
    nop

.globl os_8000D770
os_8000D770:
    addiu   $sp, $sp, -0x0038
    sd      $s0, 0x0020($sp)
    daddu   $a1, $0, $0
    daddu   $s0, $a0, $0
    sd      $ra, 0x0030($sp)
    jal     os_8000D2C8
    sd      $s1, 0x0028($sp)
    addiu   $s1, $s0, 0x0030
    li      $a1, 0xA514
    addu    $a1, $s0, $a1
    li      $a2, 0x0010
    jal     os_80005770
    daddu   $a0, $s1, $0
    daddu   $a0, $s0, $0
    jal     os_8000D2C8
    daddu   $a1, $0, $0
    li      $a1, 0xA51C
    addu    $a1, $s0, $a1
    daddu   $a0, $s1, $0
    jal     os_80005770
    li      $a2, 0x0010
    daddu   $a0, $s0, $0
    jal     os_8000D2C8
    li      $a1, 0x0001
    li      $a1, 0xA654
    addu    $a1, $s0, $a1
    li      $a2, 0x0008
    jal     os_80005770
    addiu   $a0, $s0, 0x00CC
    daddu   $a0, $s0, $0
    jal     os_8000D2C8
    li      $a1, 0x0002
    li      $a1, 0xA614
    addu    $a1, $s0, $a1
    addiu   $a0, $s0, 0x0168
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    li      $a2, 0x0008
    j       os_80005770
    addiu   $sp, $sp, 0x0038
    nop

.globl os_8000D818
os_8000D818:
    addiu   $sp, $sp, -0x0038
    sd      $s0, 0x0020($sp)
    daddu   $a1, $0, $0
    daddu   $s0, $a0, $0
    sd      $ra, 0x0030($sp)
    jal     os_8000D2C8
    sd      $s1, 0x0028($sp)
    addiu   $s1, $s0, 0x0030
    li      $a1, 0xA514
    addu    $a1, $s0, $a1
    li      $a2, 0x0008
    jal     os_80005770
    daddu   $a0, $s1, $0
    daddu   $a0, $s0, $0
    jal     os_8000D2C8
    daddu   $a1, $0, $0
    li      $a1, 0xA554
    addu    $a1, $s0, $a1
    daddu   $a0, $s1, $0
    jal     os_80005770
    li      $a2, 0x0008
    daddu   $a0, $s0, $0
    jal     os_8000D2C8
    li      $a1, 0x0001
    li      $a1, 0xA654
    addu    $a1, $s0, $a1
    li      $a2, 0x0008
    jal     os_80005770
    addiu   $a0, $s0, 0x00CC
    daddu   $a0, $s0, $0
    jal     os_8000D2C8
    li      $a1, 0x0002
    li      $a1, 0xA614
    addu    $a1, $s0, $a1
    addiu   $a0, $s0, 0x0168
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    li      $a2, 0x0008
    j       os_80005770
    addiu   $sp, $sp, 0x0038
    nop

.globl os_8000D8C0
os_8000D8C0:
    addiu   $sp, $sp, -0x0030
    daddu   $a1, $0, $0
    sd      $ra, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    jal     os_8000D2C8
    daddu   $s0, $a0, $0
    li      $a1, 0xA514
    addu    $a1, $s0, $a1
    li      $a2, 0x0008
    jal     os_80005770
    addiu   $a0, $s0, 0x0030
    daddu   $a0, $s0, $0
    jal     os_8000D2C8
    li      $a1, 0x0001
    li      $a1, 0xA654
    addu    $a1, $s0, $a1
    li      $a2, 0x0008
    jal     os_80005770
    addiu   $a0, $s0, 0x00CC
    daddu   $a0, $s0, $0
    jal     os_8000D2C8
    li      $a1, 0x0002
    li      $a1, 0xA614
    addu    $a1, $s0, $a1
    addiu   $a0, $s0, 0x0168
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    li      $a2, 0x0008
    j       os_80005770
    addiu   $sp, $sp, 0x0030

.globl os_8000D938
os_8000D938:
    addiu   $sp, $sp, -0x0080
    sw      $a0, 0x0080($sp)
    lw      $v0, 0x0080($sp)
    li      $a0, 0xA698
    addu    $a0, $v0, $a0
    sd      $ra, 0x0078($sp)
    sd      $s8, 0x0070($sp)
    sd      $s7, 0x0068($sp)
    sd      $s6, 0x0060($sp)
    sd      $s5, 0x0058($sp)
    sd      $s4, 0x0050($sp)
    sd      $s3, 0x0048($sp)
    sd      $s2, 0x0040($sp)
    sd      $s1, 0x0038($sp)
    sd      $s0, 0x0030($sp)
    jal     setjmp
    sw      $a1, 0x0088($sp)
    bnez    $v0, .L8000DB00
    li      $v1, -0x0001
    lw      $v1, 0x0080($sp)
    lw      $v0, 0x0088($sp)
    lw      $a0, 0x0030($v1)
    lw      $a1, 0x0034($v1)
    lw      $a3, 0x0080($sp)
    li      $v1, 0x0001
    or      $a2, $a1, $a0
    sw      $v0, 0x0000($a3)
    beq     $a2, $v1, .L8000DC28
    lw      $v0, 0x000C($a3)
    beq     $a0, $v1, .L8000DC90
    li      $v1, 0x0002
    beq     $a1, $v1, .L8000DCB4
    li      $a1, 0x0008
    lui     $s3, %hi(os_8000C688)
    lui     $s4, %hi(os_8000D770)
    addiu   $s3, %lo(os_8000C688)
    addiu   $s4, %lo(os_8000D770)
    li      $s2, 0x0030
    sw      $a1, 0x0020($sp)
    li      $s5, 0x0010
.L8000D9D8:
    lw      $a3, 0x0080($sp)
    lui     $v1, %hi(0x0000A50C)
    addu    $v1, $a3, $v1
    lw      $a0, %lo(0x0000A508)($v1)
    sh      $0, 0x0044($a3)
    sh      $0, 0x00E0($a3)
    sh      $0, 0x017C($a3)
    sw      $0, 0x0028($a3)
    blez    $a0, .L8000DC70
    sw      $0, 0x002C($a3)
.L8000DA00:
    sw      $a0, %lo(0x0000A50C)($v1)
    lw      $a0, 0x0080($sp)
    lw      $a2, 0x0020($sp)
    lw      $v1, 0x0010($a0)
    sll     $a0, $v0, 1
    divu    $0, $v1, $a2
    teq     $a2, $0, 7
    addu    $v0, $a0, $v0
    mflo    $v1
    nop
    nop
    mult    $v0, $a2
    mflo    $a0
    beqz    $v1, .L8000DAFC
    sw      $a0, 0x0024($sp)
    lw      $a1, 0x0080($sp)
    lui     $s0, %hi(0x0000A510)
    addu    $s0, $a1, $s0
    daddu   $s7, $0, $0
    daddu   $s8, $0, $0
    li      $s6, 0x00FF
    sw      $s0, 0x0028($sp)
.L8000DA58:
    lw      $a2, 0x0080($sp)
    lw      $a1, 0x0000($a2)
    lw      $a0, 0x0004($a2)
    lw      $v1, 0x0008($a2)
    lw      $v0, 0x000C($a2)
    addu    $a1, $a1, $s7
    sw      $a1, %lo(0x0000A750)($s0)
    sw      $a0, %lo(0x0000A754)($s0)
    beqz    $v0, .L8000DAD0
    sw      $v1, %lo(0x0000A758)($s0)
    daddu   $s1, $0, $0
    nop
.L8000DA88:
    jalr    $s4
    lw      $a0, 0x0080($sp)
    jalr    $s3
    lw      $a0, 0x0080($sp)
    lw      $v1, %lo(0x0000A750)($s0)
    lw      $v0, %lo(0x0000A50C)($s0)
    addu    $v1, $v1, $s2
    blez    $v0, .L8000DAB8
    sw      $v1, %lo(0x0000A750)($s0)
    addiu   $v0, $v0, -0x0001
    beqz    $v0, .L8000DB38
    sw      $v0, %lo(0x0000A50C)($s0)
.L8000DAB8:
    lw      $v1, 0x0080($sp)
.L8000DABC:
    addu    $s1, $s1, $s5
    lw      $v0, 0x000C($v1)
    sltu    $v0, $s1, $v0
    bnez    $v0, .L8000DA88
    nop
.L8000DAD0:
    lw      $a0, 0x0080($sp)
    lw      $a1, 0x0020($sp)
    lw      $v0, 0x0010($a0)
    addiu   $s8, $s8, 0x0001
    divu    $0, $v0, $a1
    teq     $a1, $0, 7
    lw      $a2, 0x0024($sp)
    mflo    $a3
    sltu    $v0, $s8, $a3
    bnez    $v0, .L8000DA58
    addu    $s7, $s7, $a2
.L8000DAFC:
    daddu   $v1, $0, $0
.L8000DB00:
    ld      $ra, 0x0078($sp)
    daddu   $v0, $v1, $0
    ld      $s8, 0x0070($sp)
    ld      $s7, 0x0068($sp)
    ld      $s6, 0x0060($sp)
    ld      $s5, 0x0058($sp)
    ld      $s4, 0x0050($sp)
    ld      $s3, 0x0048($sp)
    ld      $s2, 0x0040($sp)
    ld      $s1, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0080
    nop
.L8000DB38:
    lw      $a3, 0x0080($sp)
    lw      $v1, %lo(0x0000A508)($s0)
    lw      $v0, 0x002C($a3)
    lw      $a0, 0x0024($a3)
    srl     $v0, $v0, 3
    subu    $v0, $a0, $v0
    sw      $v0, 0x0024($a3)
    sh      $0, 0x0044($a3)
    sh      $0, 0x00E0($a3)
    sh      $0, 0x017C($a3)
    sw      $0, 0x0028($a3)
    blez    $v1, .L8000DC20
    sw      $0, 0x002C($a3)
.L8000DB6C:
    sw      $v1, %lo(0x0000A50C)($s0)
    lbu     $v1, 0x0000($v0)
.L8000DB74:
    beq     $v1, $s6, .L8000DBE0
    addiu   $v0, $v0, 0x0001
    lw      $a0, 0x0080($sp)
    lw      $v1, 0x001C($a0)
    sltu    $v1, $v0, $v1
    bnezl   $v1, .L8000DB74
    lbu     $v1, 0x0000($v0)
    lui     $a0, %hi(_8007D0C0)
    lui     $a2, %hi(__str_80050EF0)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80050EF0)
    jal     snprintf
    li      $a1, 0x0100
    ld      $ra, 0x0078($sp)
    li      $v1, -0x0001
    daddu   $v0, $v1, $0
    ld      $s8, 0x0070($sp)
    ld      $s7, 0x0068($sp)
    ld      $s6, 0x0060($sp)
    ld      $s5, 0x0058($sp)
    ld      $s4, 0x0050($sp)
    ld      $s3, 0x0048($sp)
    ld      $s2, 0x0040($sp)
    ld      $s1, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0080
.L8000DBE0:
    lbu     $v1, 0x0000($v0)
    beq     $v1, $s6, .L8000DBE0
    addiu   $v0, $v0, 0x0001
    lw      $a0, %lo(0x0000A510)($s0)
    addiu   $a1, $a0, 0x00D0
    beq     $v1, $a1, .L8000DC78
    addiu   $a0, $a0, 0x0001
    addiu   $a0, $v1, -0x00D0
    sltiu   $a0, $a0, 0x0008
    bnez    $a0, .L8000DCD8
    li      $a1, 0x00D9
    bnel    $v1, $a1, .L8000DB74
    lbu     $v1, 0x0000($v0)
    j       .L8000DABC
    lw      $v1, 0x0080($sp)
    nop
.L8000DC20:
    j       .L8000DB6C
    li      $v1, -0x0001
.L8000DC28:
    lw      $a3, 0x0080($sp)
    li      $v1, 0x0008
    sw      $v1, 0x0020($sp)
    lui     $v1, %hi(0x0000A508)
    addu    $v1, $a3, $v1
    lw      $a0, %lo(0x0000A508)($v1)
    lui     $s3, %hi(os_8000C4D8)
    lui     $s4, %hi(os_8000D8C0)
    addiu   $s3, %lo(os_8000C4D8)
    addiu   $s4, %lo(os_8000D8C0)
    li      $s2, 0x0018
    li      $s5, 0x0008
    sh      $0, 0x0044($a3)
    sh      $0, 0x00E0($a3)
    sh      $0, 0x017C($a3)
    sw      $0, 0x0028($a3)
    bgtz    $a0, .L8000DA00
    sw      $0, 0x002C($a3)
.L8000DC70:
    j       .L8000DA00
    li      $a0, -0x0001
.L8000DC78:
    lw      $a2, 0x0080($sp)
    lw      $a3, 0x0028($sp)
    andi    $a0, $a0, 0x0007
    sw      $v0, 0x0024($a2)
    j       .L8000DAB8
    sw      $a0, -0x5AF0($a3)
.L8000DC90:
    lui     $s3, %hi(os_8000C8C8)
    lui     $s4, %hi(os_8000D818)
    li      $a0, 0x0010
    addiu   $s3, %lo(os_8000C8C8)
    addiu   $s4, %lo(os_8000D818)
    li      $s2, 0x0018
    sw      $a0, 0x0020($sp)
    j       .L8000D9D8
    li      $s5, 0x0008
.L8000DCB4:
    lui     $s3, %hi(os_8000CB30)
    lui     $s4, %hi(os_8000D688)
    li      $a2, 0x0010
    addiu   $s3, %lo(os_8000CB30)
    addiu   $s4, %lo(os_8000D688)
    li      $s2, 0x0030
    sw      $a2, 0x0020($sp)
    j       .L8000D9D8
    li      $s5, 0x0010
.L8000DCD8:
    lui     $a0, %hi(_8007D0C0)
    lui     $a2, %hi(__str_80050F18)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80050F18)
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000DB00
    li      $v1, -0x0001

.globl os_8000DCF8
os_8000DCF8:
    addiu   $sp, $sp, -0x00C8
    sd      $ra, 0x00C0($sp)
    sd      $s8, 0x00B8($sp)
    sd      $s7, 0x00B0($sp)
    sd      $s6, 0x00A8($sp)
    sd      $s5, 0x00A0($sp)
    sd      $s4, 0x0098($sp)
    sd      $s3, 0x0090($sp)
    sd      $s2, 0x0088($sp)
    sd      $s1, 0x0080($sp)
    sd      $s0, 0x0078($sp)
    lbu     $v1, 0x0000($a1)
    daddu   $v0, $a0, $0
    li      $a0, 0x00FF
    bne     $v1, $a0, .L8000E428
    li      $v1, 0x00D8
    lbu     $a0, 0x0001($a1)
    bne     $a0, $v1, .L8000E428
    addiu   $s8, $a1, 0x0002
    addiu   $a2, $a2, -0x0002
    addu    $v1, $s8, $a2
    lui     $s4, %hi(_8004D150)
    sw      $v1, 0x001C($v0)
    li      $v1, 0x00010000
    addiu   $s4, %lo(_8004D150)
    addu    $v1, $v0, $v1
    lui     $s6, %hi(_8004D110)
    lui     $s0, %hi(_8004D190)
    sw      $s8, 0x0018($v0)
    sw      $a2, 0x0020($v0)
    sw      $v1, 0x0050($sp)
    addiu   $s6, %lo(_8004D110)
    addiu   $s0, %lo(_8004D190)
    addiu   $t0, $v0, 0x0204
    daddu   $t2, $0, $0
    li      $s7, 0x00FF
    li      $s3, 0x0011
    daddu   $s5, $s4, $0
.L8000DD90:
    lbu     $v1, 0x0000($s8)
.L8000DD94:
    bnel    $v1, $s7, .L8000E180
    li      $v0, -0x0001
    lbu     $v1, 0x0001($s8)
    bne     $v1, $s7, .L8000DDB8
    addiu   $a0, $s8, 0x0001
    addiu   $a0, $a0, 0x0001
.L8000DDAC:
    lbu     $v1, 0x0000($a0)
    beql    $v1, $s7, .L8000DDAC
    addiu   $a0, $a0, 0x0001
.L8000DDB8:
    addiu   $t1, $a0, 0x0001
    lbu     $a2, 0x0001($a0)
    addiu   $a1, $v1, 0x0040
    lbu     $v1, 0x0001($t1)
    sll     $a2, $a2, 8
    andi    $a1, $a1, 0x00FF
    or      $v1, $v1, $a2
    sltiu   $a2, $a1, 0x001E
    beqz    $a2, .L8000DD90
    addu    $s8, $t1, $v1
    lui     $a2, %hi(_8004D098)
    sll     $a1, $a1, 2
    addiu   $a2, %lo(_8004D098)
    addu    $a1, $a2, $a1
    lw      $a1, 0x0000($a1)
    jr      $a1
    nop
    li      $a0, 0x0004
    bne     $v1, $a0, .L8000E168
    lui     $a0, %hi(_8007D0C0)
    lbu     $v1, 0x0002($t1)
    lbu     $a0, 0x0003($t1)
    sll     $v1, $v1, 8
    or      $v1, $v1, $a0
    lw      $a0, 0x0050($sp)
    j       .L8000DD90
    sw      $v1, -0x5AF8($a0)
    addiu   $v1, $t1, 0x0002
    sltu    $v1, $v1, $s8
    beqzl   $v1, .L8000DD94
    lbu     $v1, 0x0000($s8)
    lbu     $a3, 0x0002($t1)
    sra     $v1, $a3, 4
    bnez    $v1, .L8000E264
    slti    $v1, $a3, 0x0005
    beqz    $v1, .L8000E244
    addiu   $t1, $t1, 0x0003
    li      $t4, 0x0040
    sll     $a3, $a3, 8
.L8000DE54:
    addu    $a3, $t0, $a3
    daddu   $t3, $0, $0
    nop
.L8000DE60:
    addu    $v1, $s4, $t3
    ldc1    $f2, 0x0000($v1)
    addu    $a1, $s6, $t3
    daddu   $v1, $s5, $0
    daddu   $a0, $a3, $0
    nop
.L8000DE78:
    lbu     $a2, 0x0000($a1)
    ldc1    $f1, 0x0000($v1)
    addu    $a2, $t1, $a2
    lbu     $a2, 0x0000($a2)
    addiu   $v1, $v1, 0x0008
    mtc1    $a2, $f3
    addiu   $a1, $a1, 0x0001
    cvt.d.w $f0, $f3
    mul.d   $f0, $f0, $f2
    mul.d   $f0, $f0, $f1
    cvt.s.d $f0, $f0
    swc1    $f0, 0x0000($a0)
    bne     $v1, $s0, .L8000DE78
    addiu   $a0, $a0, 0x0004
    addiu   $t3, $t3, 0x0008
    bne     $t3, $t4, .L8000DE60
    addiu   $a3, $a3, 0x0020
    addiu   $v1, $t1, 0x0040
    sltu    $v1, $v1, $s8
    beqzl   $v1, .L8000DD94
    lbu     $v1, 0x0000($s8)
    lbu     $a3, 0x0040($t1)
    sra     $v1, $a3, 4
    bnez    $v1, .L8000E264
    slti    $v1, $a3, 0x0005
    beqz    $v1, .L8000E244
    addiu   $t1, $t1, 0x0041
    j       .L8000DE54
    sll     $a3, $a3, 8
    addiu   $v1, $v1, -0x0002
    blez    $v1, .L8000E160
    addiu   $t1, $t1, 0x0002
    addiu   $s2, $sp, 0x0038
    nop
.L8000DF00:
    lbu     $t2, 0x0000($t1)
    addiu   $a3, $t1, 0x0001
    sb      $0, 0x0038($sp)
    daddu   $s1, $0, $0
    li      $a0, 0x0001
    nop
.L8000DF18:
    addu    $a1, $t1, $a0
    lbu     $a1, 0x0000($a1)
    addu    $a2, $s2, $a0
    addiu   $a0, $a0, 0x0001
    sb      $a1, 0x0000($a2)
    bne     $a0, $s3, .L8000DF18
    addu    $s1, $s1, $a1
    sltiu   $a0, $s1, 0x0100
    beqz    $a0, .L8000E220
    addiu   $a3, $a3, 0x0010
    andi    $t1, $t2, 0x000F
    slti    $a0, $t1, 0x0004
    beqz    $a0, .L8000E1F8
    andi    $t2, $t2, 0x00F0
    beqz    $t2, .L8000E118
    sll     $a0, $t1, 12
    sll     $a2, $t1, 10
    addu    $a2, $a2, $a0
    addu    $a2, $v0, $a2
    daddu   $a1, $a3, $0
    addiu   $a2, $a2, 0x5504
    daddu   $a0, $s2, $0
    sd      $v0, 0x0070($sp)
    sd      $v1, 0x0058($sp)
    sd      $a3, 0x0060($sp)
    jal     os_8000CF38
    sd      $t0, 0x0068($sp)
    ld      $v1, 0x0058($sp)
    ld      $v0, 0x0070($sp)
    addiu   $v1, $v1, -0x0011
    subu    $v1, $v1, $s1
    ld      $a3, 0x0060($sp)
    blez    $v1, .L8000E160
    ld      $t0, 0x0068($sp)
.L8000DFA0:
    j       .L8000DF00
    addu    $t1, $a3, $s1
    lbu     $t5, 0x0002($t1)
    li      $t4, 0x0008
    lbu     $v1, 0x0003($t1)
    lbu     $t3, 0x0004($t1)
    lbu     $a3, 0x0005($t1)
    lbu     $a1, 0x0006($t1)
    bne     $t5, $t4, .L8000E408
    lbu     $a2, 0x0007($t1)
    sll     $a3, $a3, 8
    or      $a3, $a3, $a1
    sll     $v1, $v1, 8
    slti    $a1, $a3, 0x0801
    beqz    $a1, .L8000E464
    or      $v1, $v1, $t3
    slti    $a1, $v1, 0x0801
    beqzl   $a1, .L8000E468
    lui     $a0, %hi(_8007D0C0)
    li      $a1, 0x0003
    bnel    $a2, $a1, .L8000E448
    lui     $a0, %hi(_8007D0C0)
    andi    $a1, $v1, 0x000F
    bnezl   $a1, .L8000E4A4
    lui     $a0, %hi(_8007D0C0)
    andi    $a1, $a3, 0x000F
    bnez    $a1, .L8000E4C4
    addiu   $t1, $t1, 0x0008
    addiu   $a0, %lo(0x80080012)
    daddu   $a2, $v0, $0
.L8000E018:
    lbu     $a1, 0x0002($t1)
    lbu     $t5, 0x0000($t1)
    slti    $t4, $a1, 0x0003
    lbu     $t3, 0x0001($t1)
    sw      $t5, 0x00C8($a2)
    beqz    $t4, .L8000E1CC
    addiu   $t1, $t1, 0x0003
    sll     $a1, $a1, 8
    sra     $t4, $t3, 4
    addu    $a1, $t0, $a1
    andi    $t3, $t3, 0x000F
    sw      $t3, 0x0034($a2)
    sw      $t4, 0x0030($a2)
    sw      $a1, 0x0038($a2)
    bne     $a0, $t1, .L8000E018
    addiu   $a2, $a2, 0x009C
    sw      $a3, 0x000C($v0)
    j       .L8000DD90
    sw      $v1, 0x0010($v0)
    lbu     $a0, 0x0002($t1)
    li      $v1, 0x0003
    bnel    $a0, $v1, .L8000E1B0
    lui     $a0, %hi(_8007D0C0)
    addiu   $a1, $t1, 0x0003
    daddu   $a0, $v0, $0
    daddu   $v1, $0, $0
    j       .L8000E0E4
    li      $t3, 0x0003
.L8000E088:
    srl     $a2, $a2, 4
    sltiu   $t0, $a2, 0x0004
    beqzl   $t0, .L8000E3EC
    lui     $a0, %hi(_8007D0C0)
    lw      $t0, %lo(0x800800C8)($a0)
    bnel    $t1, $t0, .L8000E3C0
    lui     $a0, %hi(_8007D0C0)
    sll     $t1, $a3, 12
    sll     $t0, $a2, 12
    sll     $a3, $a3, 10
    sll     $a2, $a2, 10
    addu    $a3, $a3, $t1
    addu    $a2, $a2, $t0
    addu    $a3, $v0, $a3
    addu    $a2, $v0, $a2
    addiu   $a3, $a3, 0x5504
    addiu   $a2, $a2, 0x0504
    addiu   $v1, $v1, 0x0001
    sw      $a3, %lo(0x8008003C)($a0)
    sw      $a2, %lo(0x80080040)($a0)
    addiu   $a1, $a1, 0x0002
    beq     $v1, $t3, .L8000E284
    addiu   $a0, %lo(0x8008009C)
.L8000E0E4:
    lbu     $a2, 0x0001($a1)
    andi    $a3, $a2, 0x000F
    sltiu   $t0, $a3, 0x0004
    bnez    $t0, .L8000E088
    lbu     $t1, 0x0000($a1)
    lui     $a0, %hi(_8007D0C0)
    lui     $a2, %hi(__str_80051118)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80051118)
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000E180
    li      $v0, -0x0001
.L8000E118:
    sll     $a2, $t1, 10
    addu    $a2, $a2, $a0
    addu    $a2, $v0, $a2
    daddu   $a1, $a3, $0
    addiu   $a2, $a2, 0x0504
    daddu   $a0, $s2, $0
    sd      $v0, 0x0070($sp)
    sd      $v1, 0x0058($sp)
    sd      $a3, 0x0060($sp)
    jal     os_8000CF38
    sd      $t0, 0x0068($sp)
    ld      $v1, 0x0058($sp)
    ld      $t0, 0x0068($sp)
    addiu   $v1, $v1, -0x0011
    subu    $v1, $v1, $s1
    ld      $a3, 0x0060($sp)
    bgtz    $v1, .L8000DFA0
    ld      $v0, 0x0070($sp)
.L8000E160:
    j       .L8000DD90
    li      $t2, 0x0001
.L8000E168:
    lui     $a2, %hi(__str_80051238)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80051238)
    jal     snprintf
    li      $a1, 0x0100
    li      $v0, -0x0001
.L8000E180:
    ld      $ra, 0x00C0($sp)
    ld      $s8, 0x00B8($sp)
    ld      $s7, 0x00B0($sp)
    ld      $s6, 0x00A8($sp)
    ld      $s5, 0x00A0($sp)
    ld      $s4, 0x0098($sp)
    ld      $s3, 0x0090($sp)
    ld      $s2, 0x0088($sp)
    ld      $s1, 0x0080($sp)
    ld      $s0, 0x0078($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00C8
.L8000E1B0:
    lui     $a2, %hi(__str_800510F8)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_800510F8)
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000E180
    li      $v0, -0x0001
.L8000E1CC:
    lui     $a0, %hi(_8007D0C0)
    lui     $a2, %hi(__str_80051058)
    daddu   $a3, $a1, $0
    li      $v0, 0x0002
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80051058)
    li      $a1, 0x0100
    jal     snprintf
    sw      $v0, 0x0024($sp)
    j       .L8000E180
    li      $v0, -0x0001
.L8000E1F8:
    lui     $a0, %hi(_8007D0C0)
    lui     $a2, %hi(__str_80051200)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80051200)
    li      $a1, 0x0100
    li      $a3, 0x0004
    jal     snprintf
    sw      $t1, 0x0024($sp)
    j       .L8000E180
    li      $v0, -0x0001
.L8000E220:
    lui     $a0, %hi(_8007D0C0)
    lui     $a2, %hi(__str_800511C0)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_800511C0)
    li      $a1, 0x0100
    jal     snprintf
    li      $a3, 0x0100
    j       .L8000E180
    li      $v0, -0x0001
.L8000E244:
    lui     $a0, %hi(_8007D0C0)
    lui     $a2, %hi(__str_800510C0)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_800510C0)
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000E180
    li      $v0, -0x0001
.L8000E264:
    lui     $a0, %hi(_8007D0C0)
    lui     $a2, %hi(__str_80051090)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80051090)
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000E180
    li      $v0, -0x0001
.L8000E284:
    addiu   $a1, $a1, 0x0003
    bnez    $t2, .L8000E334
    sw      $a1, 0x0024($v0)
    lw      $v1, 0x0014($v0)
    andi    $v1, $v1, 0x0002
    beqz    $v1, .L8000E2B0
    lui     $v1, %hi(0x0000A504)
    addu    $v1, $v0, $v1
    lw      $v1, %lo(0x0000A504)($v1)
    bnezl   $v1, .L8000E338
    lw      $v1, 0x0030($v0)
.L8000E2B0:
    lui     $a0, %hi(_8004D190)
    lui     $a1, %hi(_8004D1A8)
    addiu   $a2, $v0, 0x0504
    addiu   $a0, %lo(_8004D190)
    addiu   $a1, %lo(_8004D1A8)
    jal     os_8000CF38
    sd      $v0, 0x0070($sp)
    ld      $v0, 0x0070($sp)
    lui     $a0, %hi(_8004D1B8)
    lui     $a1, %hi(_8004D1D0)
    addiu   $a2, $v0, 0x5504
    addiu   $a0, %lo(_8004D1B8)
    jal     os_8000CF38
    addiu   $a1, %lo(_8004D1D0)
    ld      $v0, 0x0070($sp)
    lui     $a0, %hi(_8004D278)
    lui     $a1, %hi(_8004D290)
    addiu   $a2, $v0, 0x1904
    addiu   $a0, %lo(_8004D278)
    jal     os_8000CF38
    addiu   $a1, %lo(_8004D290)
    ld      $v0, 0x0070($sp)
    lui     $a0, %hi(_8004D2A0)
    lui     $a1, %hi(_8004D2B8)
    addiu   $a0, %lo(_8004D2A0)
    addiu   $a2, $v0, 0x6904
    jal     os_8000CF38
    addiu   $a1, %lo(_8004D2B8)
    ld      $v0, 0x0070($sp)
    lui     $v1, %hi(0x0000A504)
    addu    $v1, $v0, $v1
    li      $a0, 0x0001
    sw      $a0, %lo(0x0000A504)($v1)
.L8000E334:
    lw      $v1, 0x0030($v0)
.L8000E338:
    lw      $a1, 0x00CC($v0)
    sltu    $a0, $v1, $a1
    bnez    $a0, .L8000E488
    li      $a0, 0x80080000
    lw      $a0, 0x0168($v0)
    sltu    $v1, $v1, $a0
    bnezl   $v1, .L8000E488
    lui     $a0, %hi(_8007D0C0)
    lw      $a3, 0x0034($v0)
    lw      $v1, 0x00D0($v0)
    sltu    $a2, $a3, $v1
    bnezl   $a2, .L8000E4E4
    li      $a0, 0x80080000
    lw      $a2, 0x016C($v0)
    sltu    $a3, $a3, $a2
    bnezl   $a3, .L8000E4E4
    lui     $a0, %hi(_8007D0C0)
    li      $v0, 0x0001
    bnel    $a1, $v0, .L8000E3A4
    li      $a0, 0x80080000
    bnel    $a0, $a1, .L8000E3A4
    li      $a0, 0x80080000
    bne     $v1, $a0, .L8000E3A4
    lui     $a0, %hi(_8007D0C0)
    beq     $a2, $v1, .L8000E180
    daddu   $v0, $0, $0
    li      $a0, 0x80080000
.L8000E3A4:
    lui     $a2, %hi(__str_80051328)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80051328)
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000E180
    li      $v0, -0x0001
.L8000E3C0:
    lui     $a2, %hi(__str_80051178)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80051178)
    daddu   $a3, $v1, $0
    li      $a1, 0x0100
    sw      $t1, 0x0024($sp)
    sw      $t0, 0x0034($sp)
    jal     snprintf
    sw      $v1, 0x002C($sp)
    j       .L8000E180
    li      $v0, -0x0001
.L8000E3EC:
    lui     $a2, %hi(__str_80051148)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80051148)
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000E180
    li      $v0, -0x0001
.L8000E408:
    lui     $a0, %hi(_8007D0C0)
    lui     $a2, %hi(__str_80050F58)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80050F58)
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000E180
    li      $v0, -0x0001
.L8000E428:
    lui     $a0, %hi(_8007D0C0)
    lui     $a2, %hi(__str_80050F40)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80050F40)
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000E180
    li      $v0, -0x0001
.L8000E448:
    lui     $a2, %hi(__str_80050FB8)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80050FB8)
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000E180
    li      $v0, -0x0001
.L8000E464:
    li      $a0, 0x80080000
.L8000E468:
    lui     $a2, %hi(__str_80050F88)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80050F88)
    li      $a1, 0x0100
    jal     snprintf
    sw      $v1, 0x0024($sp)
    j       .L8000E180
    li      $v0, -0x0001
.L8000E488:
    lui     $a2, %hi(__str_80051260)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80051260)
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000E180
    li      $v0, -0x0001
.L8000E4A4:
    lui     $a2, %hi(__str_80050FD8)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80050FD8)
    daddu   $a3, $v1, $0
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000E180
    li      $v0, -0x0001
.L8000E4C4:
    lui     $a0, %hi(_8007D0C0)
    lui     $a2, %hi(__str_80051018)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_80051018)
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000E180
    li      $v0, -0x0001
.L8000E4E4:
    lui     $a2, %hi(__str_800512C8)
    addiu   $a0, %lo(_8007D0C0)
    addiu   $a2, %lo(__str_800512C8)
    jal     snprintf
    li      $a1, 0x0100
    j       .L8000E180
    li      $v0, -0x0001
    addiu   $sp, $sp, -0x0048
    sd      $s3, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0040($sp)
    daddu   $s3, $a0, $0
    daddu   $s0, $a0, $0
    daddu   $s1, $0, $0
    li      $s2, 0x0003
.L8000E528:
    lw      $v0, 0x0000($s0)
    addiu   $s1, $s1, 0x0001
    beqz    $v0, .L8000E540
    daddu   $a0, $v0, $0
    jal     free
    nop
.L8000E540:
    sw      $0, 0x0000($s0)
    bne     $s1, $s2, .L8000E528
    addiu   $s0, $s0, 0x0004
    daddu   $a0, $s3, $0
    ld      $ra, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       free
    addiu   $sp, $sp, 0x0048
    nop

.globl os_8000E570
os_8000E570:
    beqz    $a2, .L8000E5AC
    nor     $v0, $0, $a0
    lui     $a3, %hi(_8004D360)
    addiu   $a3, %lo(_8004D360)
.L8000E580:
    lbu     $a0, 0x0000($a1)
    srl     $v1, $v0, 8
    xor     $v0, $v0, $a0
    andi    $v0, $v0, 0x00FF
    sll     $v0, $v0, 2
    addu    $v0, $a3, $v0
    lw      $v0, 0x0000($v0)
    addiu   $a2, $a2, -0x0001
    xor     $v0, $v0, $v1
    bnez    $a2, .L8000E580
    addiu   $a1, $a1, 0x0001
.L8000E5AC:
    jr      $ra
    nor     $v0, $0, $v0
    nop

.globl os_8000E5B8
os_8000E5B8:
    lui     $a2, %hi(_8004D360)
    addiu   $a3, $a0, 0x0428
    addiu   $a2, %lo(_8004D360)
    addiu   $a0, $a0, 0x0040
    li      $v0, -0x0001
    nop
.L8000E5D0:
    lbu     $a1, 0x0000($a0)
    srl     $v1, $v0, 8
    xor     $v0, $v0, $a1
    andi    $v0, $v0, 0x00FF
    sll     $v0, $v0, 2
    addu    $v0, $a2, $v0
    lw      $v0, 0x0000($v0)
    addiu   $a0, $a0, 0x0001
    bne     $a0, $a3, .L8000E5D0
    xor     $v0, $v0, $v1
    lui     $a0, 0x857A3FD8 >> 16
    nor     $v1, $0, $v0
    ori     $a1, $a0, 0x3FD7
    beq     $v1, $a1, .L8000E680
    li      $v0, 0x0007
    ori     $a0, 0x857A3FD8 & 0xFFFF
    sltu    $a0, $v1, $a0
    bnez    $a0, .L8000E650
    lui     $a0, 0x098D23DF >> 16
    lui     $a0, 0xE7CD9D51 >> 16
    ori     $a0, 0xE7CD9D51 & 0xFFFF
    beq     $v1, $a0, .L8000E680
    li      $v0, 0x0003
    lui     $v0, 0xF0DA3D50 >> 16
    ori     $v0, 0xF0DA3D50 & 0xFFFF
    beq     $v1, $v0, .L8000E66C
    lui     $a0, 0x86015F8F >> 16
    ori     $a0, 0x86015F8F & 0xFFFF
    beq     $v1, $a0, .L8000E680
    li      $v0, 0x0006
.L8000E648:
    jr      $ra
    li      $v0, 0x0002
.L8000E650:
    ori     $a0, 0x098D23DF & 0xFFFF
    beq     $v1, $a0, .L8000E680
    li      $v0, 0x0004
    lui     $v0, 0x303FAAC9 >> 16
    ori     $v0, 0x303FAAC9 & 0xFFFF
    bne     $v1, $v0, .L8000E674
    lui     $a0, 0x07AE65C9 >> 16
.L8000E66C:
    jr      $ra
    li      $v0, 0x0001
.L8000E674:
    ori     $a0, 0x07AE65C9 & 0xFFFF
    bne     $v1, $a0, .L8000E648
    li      $v0, 0x0005
.L8000E680:
    jr      $ra
    nop

.globl os_8000E688
os_8000E688:
    lbu     $v1, 0x003E($a0)
    addiu   $v1, $v1, -0x0037
    andi    $v1, $v1, 0x00FF
    sltiu   $a0, $v1, 0x0023
    beqz    $a0, .L8000E6B0
    li      $v0, 0x0001
    lui     $v0, %hi(_8004D760)
    addiu   $v0, %lo(_8004D760)
    addu    $v1, $v1, $v0
    lbu     $v0, 0x0000($v1)
.L8000E6B0:
    jr      $ra
    nop

.globl os_8000E6B8
os_8000E6B8:
    addiu   $sp, $sp, -0x0030
    addiu   $a0, $sp, 0x0020
    li      $a1, 0x0010
    li      $a2, 0x0008
    sd      $ra, 0x0028($sp)
    jal     BiCartRomRd
    sd      $0, 0x0020($sp)
    ld      $ra, 0x0028($sp)
    ld      $v0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
    nop

.globl os_8000E6E8
os_8000E6E8:
    addiu   $sp, $sp, -0x2098
    sd      $s0, 0x2048($sp)
    addiu   $s0, $sp, 0x0020
    daddu   $a1, $0, $0
    li      $a2, 0x1000
    daddu   $a0, $s0, $0
    sd      $ra, 0x2090($sp)
    sd      $s8, 0x2088($sp)
    sd      $s7, 0x2080($sp)
    sd      $s6, 0x2078($sp)
    sd      $s5, 0x2070($sp)
    sd      $s4, 0x2068($sp)
    sd      $s3, 0x2060($sp)
    sd      $s2, 0x2058($sp)
    jal     BiCartRomRd
    sd      $s1, 0x2050($sp)
    jal     os_8000E5B8
    daddu   $a0, $s0, $0
    li      $v1, 0x0003
    beq     $v0, $v1, .L8000E8CC
    li      $v1, 0x0005
    beq     $v0, $v1, .L8000E8D8
    li      $v1, 0x0006
    beq     $v0, $v1, .L8000E8F8
    lui     $s2, 0x1FEA617A >> 16
    lui     $s2, 0xF8CA4DDC >> 16
    ori     $s2, 0xF8CA4DDC & 0xFFFF
.L8000E754:
    daddu   $s3, $s2, $0
    daddu   $s5, $s2, $0
    daddu   $s4, $s2, $0
    daddu   $s1, $s2, $0
    daddu   $s6, $s2, $0
    li      $t0, 0x00100000
    li      $t1, 0x1000
    addiu   $s8, $sp, 0x1020
    li      $a3, 0x0020
    li      $v1, 0x0005
    sltiu   $a0, $t0, 0x1001
.L8000E780:
    bnez    $a0, .L8000E78C
    daddu   $s7, $t0, $0
    li      $s7, 0x1000
.L8000E78C:
    daddu   $a1, $t1, $0
    daddu   $a0, $s8, $0
    daddu   $a2, $s7, $0
    sd      $v0, 0x2030($sp)
    sd      $v1, 0x2040($sp)
    sd      $a3, 0x2038($sp)
    sd      $t0, 0x2020($sp)
    jal     BiCartRomRd
    sd      $t1, 0x2028($sp)
    ld      $t1, 0x2028($sp)
    ld      $v0, 0x2030($sp)
    addu    $t1, $t1, $s7
    ld      $v1, 0x2040($sp)
    ld      $a3, 0x2038($sp)
    beqz    $s7, .L8000E85C
    ld      $t0, 0x2020($sp)
    j       .L8000E7EC
    daddu   $a2, $0, $0
    nop
.L8000E7D8:
    addiu   $a2, $a2, 0x0004
    sltu    $a0, $a2, $s7
    addu    $s6, $s6, $a1
    beqz    $a0, .L8000E85C
    daddu   $s2, $t2, $0
.L8000E7EC:
    addu    $a0, $s8, $a2
    lw      $a0, 0x0000($a0)
    andi    $t3, $a0, 0x001F
    subu    $a1, $a3, $t3
    srlv    $a1, $a0, $a1
    sllv    $t3, $a0, $t3
    addu    $t2, $s2, $a0
    or      $a1, $a1, $t3
    sltu    $s2, $t2, $s2
    sltu    $t3, $a0, $s1
    xor     $t4, $s1, $a0
    addu    $s5, $s5, $s2
    addu    $s3, $s3, $a1
    xor     $s4, $s4, $a0
    bnez    $t3, .L8000E830
    xor     $s1, $s1, $a1
    xor     $s1, $t4, $t2
.L8000E830:
    bne     $v0, $v1, .L8000E7D8
    xor     $a1, $s3, $a0
    andi    $a1, $a2, 0x00FF
    addu    $a1, $s0, $a1
    lw      $a1, 0x0750($a1)
    addiu   $a2, $a2, 0x0004
    xor     $a0, $a0, $a1
    addu    $s6, $s6, $a0
    sltu    $a0, $a2, $s7
    bnez    $a0, .L8000E7EC
    daddu   $s2, $t2, $0
.L8000E85C:
    subu    $t0, $t0, $s7
    bnez    $t0, .L8000E780
    sltiu   $a0, $t0, 0x1001
    li      $v1, 0x0003
    beq     $v0, $v1, .L8000E8E4
    li      $v1, 0x0006
    beq     $v0, $v1, .L8000E900
    mult    $s2, $s5
    xor     $s4, $s5, $s4
    xor     $s6, $s1, $s6
    xor     $s2, $s4, $s2
    xor     $s3, $s6, $s3
.L8000E88C:
    dsll32  $s3, $s3, 0
    ld      $ra, 0x2090($sp)
    dsll32  $v0, $s2, 0
    dsrl32  $s3, $s3, 0
    or      $v0, $v0, $s3
    ld      $s8, 0x2088($sp)
    ld      $s7, 0x2080($sp)
    ld      $s6, 0x2078($sp)
    ld      $s5, 0x2070($sp)
    ld      $s4, 0x2068($sp)
    ld      $s3, 0x2060($sp)
    ld      $s2, 0x2058($sp)
    ld      $s1, 0x2050($sp)
    ld      $s0, 0x2048($sp)
    jr      $ra
    addiu   $sp, $sp, 0x2098
.L8000E8CC:
    lui     $s2, 0xA3886759 >> 16
    j       .L8000E754
    ori     $s2, 0xA3886759 & 0xFFFF
.L8000E8D8:
    lui     $s2, 0xDF26F436 >> 16
    j       .L8000E754
    ori     $s2, 0xDF26F436 & 0xFFFF
.L8000E8E4:
    xor     $s2, $s2, $s5
    xor     $s3, $s3, $s1
    addu    $s2, $s2, $s4
    j       .L8000E88C
    addu    $s3, $s3, $s6
.L8000E8F8:
    j       .L8000E754
    ori     $s2, 0x1FEA617A & 0xFFFF
.L8000E900:
    mflo    $s2
    addu    $s2, $s2, $s4
    nop
    mult    $s3, $s1
    mflo    $s3
    j       .L8000E88C
    addu    $s3, $s3, $s6
    nop

.globl os_8000E920
os_8000E920:
    addiu   $sp, $sp, -0x0028
    sd      $a0, 0x0028($sp)
    li      $a1, 0x0010
    addiu   $a0, $sp, 0x0028
    sd      $ra, 0x0020($sp)
    jal     BiCartRomWr
    li      $a2, 0x0008
    ld      $ra, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028

.globl os_8000E948
os_8000E948:
    addiu   $sp, $sp, -0x1030
    sd      $s0, 0x1020($sp)
    addiu   $s0, $sp, 0x0020
    daddu   $a1, $0, $0
    li      $a2, 0x1000
    sd      $ra, 0x1028($sp)
    jal     BiCartRomRd
    daddu   $a0, $s0, $0
    jal     os_8000E5B8
    daddu   $a0, $s0, $0
    li      $v1, 0x0007
    beq     $v0, $v1, .L8000E9B8
    li      $v1, 0x0004
    beq     $v0, $v1, .L8000E9BC
    ld      $ra, 0x1028($sp)
    jal     os_8000E6E8
    nop
    jal     os_8000E6B8
    daddu   $s0, $v0, $0
    beq     $s0, $v0, .L8000E9BC
    ld      $ra, 0x1028($sp)
    jal     os_8000E920
    daddu   $a0, $s0, $0
    ld      $ra, 0x1028($sp)
    li      $v0, 0x0001
    ld      $s0, 0x1020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x1030
.L8000E9B8:
    ld      $ra, 0x1028($sp)
.L8000E9BC:
    daddu   $v0, $0, $0
    ld      $s0, 0x1020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x1030
    nop

.globl UsbCmdc
UsbCmdc:
    addiu   $sp, $sp, -0x0240
    sd      $s2, 0x0230($sp)
    sd      $s1, 0x0228($sp)
    sd      $s0, 0x0220($sp)
    addiu   $s2, $sp, 0x0020
    lw      $a1, 0x000C($a0)
    lw      $s1, 0x0004($a0)
    lw      $s0, 0x0008($a0)
    sd      $ra, 0x0238($sp)
    daddu   $v0, $s2, $0
    addiu   $v1, $sp, 0x0220
    sw      $a1, 0x0000($v0)
.L8000EA00:
    addiu   $v0, $v0, 0x0004
    bnel    $v0, $v1, .L8000EA00
    sw      $a1, 0x0000($v0)
    beqz    $s0, .L8000EA38
    ld      $ra, 0x0238($sp)
    nop
.L8000EA18:
    daddu   $a1, $s1, $0
    daddu   $a0, $s2, $0
    li      $a2, 0x0200
    jal     sysPI_wr
    addiu   $s0, $s0, -0x0001
    bnez    $s0, .L8000EA18
    addiu   $s1, $s1, 0x0200
    ld      $ra, 0x0238($sp)
.L8000EA38:
    ld      $s2, 0x0230($sp)
    ld      $s1, 0x0228($sp)
    ld      $s0, 0x0220($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0240
    nop

.globl UsbCmdw
UsbCmdw:
    lw      $a1, 0x0008($a0)
    lw      $a0, 0x0004($a0)
    j       bi_usb_rd
    sll     $a1, $a1, 9

.globl UsbCmdr
UsbCmdr:
    lw      $a1, 0x0008($a0)
    lw      $a0, 0x0004($a0)
    j       bi_usb_wr
    sll     $a1, $a1, 9

.globl UsbResp
UsbResp:
    addiu   $sp, $sp, -0x0038
    li      $v0, 0x0063
    sb      $v0, 0x0020($sp)
    li      $v0, 0x006D
    sb      $v0, 0x0021($sp)
    li      $v0, 0x0064
    sb      $a0, 0x0024($sp)
    sb      $v0, 0x0022($sp)
    addiu   $a0, $sp, 0x0020
    li      $v0, 0x0072
    li      $a1, 0x0010
    sd      $ra, 0x0030($sp)
    jal     bi_usb_wr
    sb      $v0, 0x0023($sp)
    ld      $ra, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop

.globl UsbCmdW
UsbCmdW:
    addiu   $sp, $sp, -0x0248
    sd      $s0, 0x0228($sp)
    lw      $s0, 0x0008($a0)
    sd      $s1, 0x0230($sp)
    sd      $ra, 0x0240($sp)
    sd      $s2, 0x0238($sp)
    lw      $s1, 0x0004($a0)
    bnez    $s0, .L8000EAF8
    daddu   $v0, $0, $0
.L8000EADC:
    ld      $ra, 0x0240($sp)
    ld      $s2, 0x0238($sp)
    ld      $s1, 0x0230($sp)
    ld      $s0, 0x0228($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0248
    nop
.L8000EAF8:
    jal     bi_usb_rd_start
    addiu   $s0, $s0, -0x0001
    j       .L8000EB30
    addiu   $s2, $sp, 0x0020
.L8000EB08:
    daddu   $a1, $s1, $0
.L8000EB0C:
    daddu   $a0, $s2, $0
    bnez    $v0, .L8000EADC
    li      $a2, 0x0200
    jal     sysPI_wr
    sd      $v0, 0x0220($sp)
    beqz    $s0, .L8000EADC
    ld      $v0, 0x0220($sp)
    addiu   $s1, $s1, 0x0200
    addiu   $s0, $s0, -0x0001
.L8000EB30:
    jal     bi_usb_rd_end
    daddu   $a0, $s2, $0
    beqz    $s0, .L8000EB0C
    daddu   $a1, $s1, $0
    jal     bi_usb_rd_start
    sd      $v0, 0x0220($sp)
    j       .L8000EB08
    ld      $v0, 0x0220($sp)

.globl UsbCmdR
UsbCmdR:
    addiu   $sp, $sp, -0x0240
    sd      $s1, 0x0228($sp)
    lw      $s1, 0x0008($a0)
    sd      $s0, 0x0220($sp)
    sd      $ra, 0x0238($sp)
    sd      $s2, 0x0230($sp)
    lw      $s0, 0x0004($a0)
    beqz    $s1, .L8000EBB0
    daddu   $v0, $0, $0
    addiu   $s1, $s1, -0x0001
    j       .L8000EB8C
    addiu   $s2, $sp, 0x0020
.L8000EB80:
    beqz    $s1, .L8000EBB0
    addiu   $s0, $s0, 0x0200
    addiu   $s1, $s1, -0x0001
.L8000EB8C:
    daddu   $a1, $s0, $0
    daddu   $a0, $s2, $0
    jal     sysPI_rd
    li      $a2, 0x0200
    daddu   $a0, $s2, $0
    jal     bi_usb_wr
    li      $a1, 0x0200
    beqz    $v0, .L8000EB80
    nop
.L8000EBB0:
    ld      $ra, 0x0238($sp)
    ld      $s2, 0x0230($sp)
    ld      $s1, 0x0228($sp)
    ld      $s0, 0x0220($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0240

.globl UsbCmdf
UsbCmdf:
    lui     $v1, 0x00038048 >> 16
    addiu   $sp, $sp, -0x7FF0
    ori     $v1, 0x00038048 & 0xFFFF
    sd      $s0, 0x7FD8($sp)
    sd      $ra, 0x7FE8($sp)
    sd      $s1, 0x7FE0($sp)
    lw      $s0, 0x0008($a0)
    subu    $sp, $sp, $v1
    lui     $v1, 0x00040001 >> 16
    ori     $v1, 0x00040001 & 0xFFFF
    sltu    $v1, $s0, $v1
    bnez    $v1, .L8000EC20
    li      $v0, 0x0016
    lui     $t0, 0x00038048 >> 16
.L8000EC00:
    ori     $t0, 0x00038048 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $s1, 0x7FE0($sp)
    ld      $s0, 0x7FD8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
    nop
.L8000EC20:
    sll     $s0, $s0, 9
    addiu   $s1, $sp, 0x0020
    daddu   $a0, $s1, $0
    jal     bi_usb_rd
    daddu   $a1, $s0, $0
    bnez    $v0, .L8000EC00
    li      $t0, 0x00030000
    daddu   $a0, $s1, $0
    jal     BiMCNWr
    daddu   $a1, $s0, $0
    lui     $t0, 0x00038048 >> 16
    ori     $t0, 0x00038048 & 0xFFFF
    addu    $sp, $sp, $t0
    ld      $ra, 0x7FE8($sp)
    ld      $s1, 0x7FE0($sp)
    ld      $s0, 0x7FD8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0

.globl usbListener
usbListener:
    addiu   $sp, $sp, -0x0048
    sd      $s1, 0x0038($sp)
    sd      $ra, 0x0040($sp)
    jal     bi_usb_can_rd
    sd      $s0, 0x0030($sp)
    bnez    $v0, .L8000ECA0
    daddu   $s1, $0, $0
.L8000EC84:
    ld      $ra, 0x0040($sp)
.L8000EC88:
    daddu   $v0, $s1, $0
.L8000EC8C:
    ld      $s1, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048
    nop
.L8000ECA0:
    addiu   $s0, $sp, 0x0020
    daddu   $a0, $s0, $0
    jal     bi_usb_rd
    li      $a1, 0x0010
    bnez    $v0, .L8000EC84
    daddu   $s1, $v0, $0
    lbu     $v1, 0x0020($sp)
    li      $v0, 0x0063
    bne     $v1, $v0, .L8000EC88
    ld      $ra, 0x0040($sp)
    lbu     $v1, 0x0021($sp)
    li      $v0, 0x006D
    bne     $v1, $v0, .L8000EC8C
    daddu   $v0, $s1, $0
    lbu     $v1, 0x0022($sp)
    li      $v0, 0x0064
    bne     $v1, $v0, .L8000EC8C
    daddu   $v0, $s1, $0
    lbu     $v0, 0x0023($sp)
    li      $v1, 0x0074
    beq     $v0, $v1, .L8000ED40
    li      $v1, 0x0072
    beq     $v0, $v1, .L8000ED50
    li      $v1, 0x0077
    beq     $v0, $v1, .L8000ED60
    li      $v1, 0x0052
    beq     $v0, $v1, .L8000ED88
    li      $v1, 0x0057
    beq     $v0, $v1, .L8000ED98
    li      $v1, 0x0066
    beq     $v0, $v1, .L8000EDA8
    li      $v1, 0x0073
    beq     $v0, $v1, .L8000ED70
    li      $v1, 0x0063
    bne     $v0, $v1, .L8000EC8C
    daddu   $v0, $s1, $0
    jal     UsbCmdc
    daddu   $a0, $s0, $0
    j       .L8000EC88
    ld      $ra, 0x0040($sp)
.L8000ED40:
    jal     UsbResp
    daddu   $a0, $0, $0
    j       .L8000EC84
    daddu   $s1, $v0, $0
.L8000ED50:
    jal     UsbCmdr
    daddu   $a0, $s0, $0
    j       .L8000EC84
    daddu   $s1, $v0, $0
.L8000ED60:
    jal     UsbCmdw
    daddu   $a0, $s0, $0
    j       .L8000EC84
    daddu   $s1, $v0, $0
.L8000ED70:
    jal     BiBootCfgClr
    li      $a0, 0x0001
    jal     os_80007760
    daddu   $a0, $0, $0
    j       .L8000EC88
    ld      $ra, 0x0040($sp)
.L8000ED88:
    jal     UsbCmdR
    daddu   $a0, $s0, $0
    j       .L8000EC84
    daddu   $s1, $v0, $0
.L8000ED98:
    jal     UsbCmdW
    daddu   $a0, $s0, $0
    j       .L8000EC84
    daddu   $s1, $v0, $0
.L8000EDA8:
    jal     UsbCmdf
    daddu   $a0, $s0, $0
    daddu   $a0, $v0, $0
    jal     UsbResp
    daddu   $s1, $v0, $0
    j       .L8000EC88
    ld      $ra, 0x0040($sp)
    nop

.globl disk_8000EDC8
disk_8000EDC8:
    jr      $ra
    li      $v0, 0x00DF

.globl diskReadResp
diskReadResp:
    addiu   $sp, $sp, -0x0048
    andi    $a0, $a0, 0x00FF
    li      $v0, 0x0042
    sd      $ra, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    beq     $a0, $v0, .L8000EEA0
    sd      $s0, 0x0020($sp)
    li      $v0, 0x0049
    beq     $a0, $v0, .L8000EEA0
    li      $s1, 0x0006
.L8000EE00:
    jal     bi_sd_cmd_rd
    lui     $s0, %hi(sd_resp_buff)
    li      $a0, 0x0001
    sb      $v0, %lo(sd_resp_buff)($s0)
    jal     bi_sd_bitlen
    daddu   $s2, $0, $0
    li      $s3, 0x0800
    j       .L8000EE40
    lbu     $v0, %lo(sd_resp_buff)($s0)
    nop
.L8000EE28:
    jal     bi_sd_cmd_rd
    nop
    sb      $v0, %lo(sd_resp_buff)($s0)
    beq     $s2, $s3, .L8000EEA8
    addiu   $v1, $s2, 0x0001
    andi    $s2, $v1, 0xFFFF
.L8000EE40:
    andi    $v0, $v0, 0x00C0
    bnez    $v0, .L8000EE28
    li      $a0, 0x0008
    jal     bi_sd_bitlen
    lui     $s2, %hi(sd_resp_buff+1)
    addiu   $s2, %lo(sd_resp_buff+1)
    li      $s0, 0x0001
    nop
.L8000EE60:
    addiu   $s0, $s0, 0x0001
    jal     bi_sd_cmd_rd
    andi    $s0, $s0, 0xFFFF
    sltu    $v1, $s0, $s1
    sb      $v0, 0x0000($s2)
    bnez    $v1, .L8000EE60
    addiu   $s2, $s2, 0x0001
    ld      $ra, 0x0040($sp)
    daddu   $v0, $0, $0
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048
    nop
.L8000EEA0:
    j       .L8000EE00
    li      $s1, 0x0011
.L8000EEA8:
    ld      $ra, 0x0040($sp)
    li      $v0, 0x00D9
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048

.globl diskCmdSD
diskCmdSD:
    addiu   $sp, $sp, -0x0060
    sd      $s4, 0x0050($sp)
    sd      $s3, 0x0048($sp)
    sd      $s2, 0x0040($sp)
    daddu   $s4, $a1, $0
    srl     $s3, $a1, 16
    srl     $s2, $a1, 8
    sd      $s1, 0x0038($sp)
    sd      $s0, 0x0030($sp)
    andi    $s1, $a1, 0x00FF
    andi    $s0, $a0, 0x00FF
    li      $a1, 0x0005
    andi    $s3, $s3, 0x00FF
    andi    $s2, $s2, 0x00FF
    srl     $s4, $s4, 24
    addiu   $a0, $sp, 0x0020
    sd      $ra, 0x0058($sp)
    sb      $s0, 0x0020($sp)
    sb      $s4, 0x0021($sp)
    sb      $s3, 0x0022($sp)
    sb      $s2, 0x0023($sp)
    jal     crc7
    sb      $s1, 0x0024($sp)
    li      $a0, 0x0008
    jal     bi_sd_bitlen
    sd      $v0, 0x0028($sp)
    jal     bi_sd_cmd_wr
    li      $a0, 0x00FF
    jal     bi_sd_cmd_wr
    daddu   $a0, $s0, $0
    jal     bi_sd_cmd_wr
    daddu   $a0, $s4, $0
    jal     bi_sd_cmd_wr
    daddu   $a0, $s3, $0
    jal     bi_sd_cmd_wr
    daddu   $a0, $s2, $0
    jal     bi_sd_cmd_wr
    daddu   $a0, $s1, $0
    ld      $v0, 0x0028($sp)
    ori     $v0, $v0, 0x0001
    jal     bi_sd_cmd_wr
    andi    $a0, $v0, 0x00FF
    li      $v1, 0x0052
    beq     $s0, $v1, .L8000EF84
    daddu   $v0, $0, $0
    jal     diskReadResp
    daddu   $a0, $s0, $0
.L8000EF84:
    ld      $ra, 0x0058($sp)
    ld      $s4, 0x0050($sp)
    ld      $s3, 0x0048($sp)
    ld      $s2, 0x0040($sp)
    ld      $s1, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060
    nop

.globl diskCloseRW
diskCloseRW:
    addiu   $sp, $sp, -0x0040
    sd      $s0, 0x0020($sp)
    lui     $s0, %hi(disk_mode)
    lbu     $v0, %lo(disk_mode)($s0)
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    bnez    $v0, .L8000EFE8
    daddu   $s1, $0, $0
.L8000EFCC:
    ld      $ra, 0x0038($sp)
    daddu   $v0, $s1, $0
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040
.L8000EFE8:
    li      $a0, 0x004C
    jal     diskCmdSD
    daddu   $a1, $0, $0
    daddu   $s1, $v0, $0
    bnez    $v0, .L8000EFCC
    sb      $0, %lo(disk_mode)($s0)
    jal     bi_sd_bitlen
    li      $a0, 0x0001
    jal     bi_sd_dat_rd
    li      $s0, 0xFFFE
    jal     bi_sd_dat_rd
    li      $s2, 0x00FF
    jal     bi_sd_dat_rd
    addiu   $s0, $s0, -0x0001
    jal     bi_sd_bitlen
    li      $a0, 0x0002
    j       .L8000F038
    nop
.L8000F030:
    beqz    $s0, .L8000EFCC
    addiu   $s0, $s0, -0x0001
.L8000F038:
    jal     bi_sd_dat_rd
    andi    $s0, $s0, 0xFFFF
    bne     $v0, $s2, .L8000F030
    ld      $ra, 0x0038($sp)
    daddu   $v0, $s1, $0
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040

.globl diskOpenWrite
diskOpenWrite:
    addiu   $sp, $sp, -0x0040
    sd      $s0, 0x0028($sp)
    lui     $s0, %hi(disk_mode)
    lbu     $v0, %lo(disk_mode)($s0)
    li      $v1, 0x0002
    sd      $ra, 0x0038($sp)
    beq     $v0, $v1, .L8000F0E8
    sd      $s1, 0x0030($sp)
    lui     $s1, %hi(disk_cur_addr)
.L8000F084:
    jal     diskCloseRW
    sd      $a0, 0x0020($sp)
    lui     $v0, %hi(disk_card_type)
    lbu     $v0, %lo(disk_card_type)($v0)
    ld      $a0, 0x0020($sp)
    andi    $v0, $v0, 0x0001
    beqz    $v0, .L8000F0E0
    sw      $a0, %lo(disk_cur_addr)($s1)
.L8000F0A4:
    daddu   $a1, $a0, $0
    jal     diskCmdSD
    li      $a0, 0x0059
    bnez    $v0, .L8000F0C4
    li      $v1, 0x00D4
    li      $v0, 0x0002
    sb      $v0, %lo(disk_mode)($s0)
    daddu   $v1, $0, $0
.L8000F0C4:
    ld      $ra, 0x0038($sp)
.L8000F0C8:
    daddu   $v0, $v1, $0
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040
    nop
.L8000F0E0:
    j       .L8000F0A4
    sll     $a0, $a0, 9
.L8000F0E8:
    lui     $s1, %hi(disk_cur_addr)
    lw      $v0, %lo(disk_cur_addr)($s1)
    bne     $a0, $v0, .L8000F084
    daddu   $v1, $0, $0
    j       .L8000F0C8
    ld      $ra, 0x0038($sp)

.globl diskWrite
diskWrite:
    addiu   $sp, $sp, -0x0038
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0030($sp)
    daddu   $s0, $a1, $0
    jal     diskOpenWrite
    andi    $s1, $a2, 0xFFFF
    beqz    $v0, .L8000F138
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop
.L8000F138:
    lui     $v0, %hi(disk_cur_addr)
    lw      $v1, %lo(disk_cur_addr)($v0)
    daddu   $a0, $s0, $0
    addu    $v1, $s1, $v1
    daddu   $a1, $s1, $0
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    addiu   $sp, $sp, 0x0038
    j       bi_ram_to_sd
    sw      $v1, %lo(disk_cur_addr)($v0)

.globl diskOpenRead
diskOpenRead:
    addiu   $sp, $sp, -0x0040
    sd      $s0, 0x0028($sp)
    lui     $s0, %hi(disk_mode)
    lbu     $v0, %lo(disk_mode)($s0)
    li      $v1, 0x0001
    sd      $ra, 0x0038($sp)
    beq     $v0, $v1, .L8000F1E8
    sd      $s1, 0x0030($sp)
    lui     $s1, %hi(disk_cur_addr)
.L8000F184:
    jal     diskCloseRW
    sd      $a0, 0x0020($sp)
    lui     $v0, %hi(disk_card_type)
    lbu     $v0, %lo(disk_card_type)($v0)
    ld      $a0, 0x0020($sp)
    andi    $v0, $v0, 0x0001
    beqz    $v0, .L8000F1E0
    sw      $a0, %lo(disk_cur_addr)($s1)
.L8000F1A4:
    daddu   $a1, $a0, $0
    jal     diskCmdSD
    li      $a0, 0x0052
    bnez    $v0, .L8000F1C4
    li      $v1, 0x00D2
    li      $v0, 0x0001
    sb      $v0, %lo(disk_mode)($s0)
    daddu   $v1, $0, $0
.L8000F1C4:
    ld      $ra, 0x0038($sp)
.L8000F1C8:
    daddu   $v0, $v1, $0
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040
    nop
.L8000F1E0:
    j       .L8000F1A4
    sll     $a0, $a0, 9
.L8000F1E8:
    lui     $s1, %hi(disk_cur_addr)
    lw      $v0, %lo(disk_cur_addr)($s1)
    bne     $a0, $v0, .L8000F184
    daddu   $v1, $0, $0
    j       .L8000F1C8
    ld      $ra, 0x0038($sp)

.globl diskReadToRom
diskReadToRom:
    addiu   $sp, $sp, -0x0038
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0030($sp)
    daddu   $s0, $a1, $0
    jal     diskOpenRead
    andi    $s1, $a2, 0xFFFF
    beqz    $v0, .L8000F238
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop
.L8000F238:
    lui     $v0, %hi(disk_cur_addr)
    lw      $v1, %lo(disk_cur_addr)($v0)
    daddu   $a0, $s0, $0
    addu    $v1, $s1, $v1
    daddu   $a1, $s1, $0
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    addiu   $sp, $sp, 0x0038
    j       bi_sd_to_rom
    sw      $v1, %lo(disk_cur_addr)($v0)

.globl diskReadToRam
diskReadToRam:
    addiu   $sp, $sp, -0x0038
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0030($sp)
    daddu   $s0, $a1, $0
    jal     diskOpenRead
    andi    $s1, $a2, 0xFFFF
    beqz    $v0, .L8000F298
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop
.L8000F298:
    lui     $v0, %hi(disk_cur_addr)
    lw      $v1, %lo(disk_cur_addr)($v0)
    daddu   $a0, $s0, $0
    addu    $v1, $s1, $v1
    daddu   $a1, $s1, $0
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    addiu   $sp, $sp, 0x0038
    j       bi_sd_to_ram
    sw      $v1, %lo(disk_cur_addr)($v0)

.globl DiskCheckInit
DiskCheckInit:
    addiu   $sp, $sp, -0x0238
    li      $a0, 0x0002
    sd      $ra, 0x0230($sp)
    sd      $s1, 0x0228($sp)
    jal     BiBootCfgGet
    sd      $s0, 0x0220($sp)
    bnez    $v0, .L8000F2F8
    li      $v1, 0x0001
    ld      $ra, 0x0230($sp)
    daddu   $v0, $v1, $0
    ld      $s1, 0x0228($sp)
    ld      $s0, 0x0220($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0238
.L8000F2F8:
    li      $s1, 0x0001
    lui     $s0, %hi(disk_card_type)
    lui     $v0, %hi(disk_mode)
    li      $a0, 0x0004
    sb      $s1, %lo(disk_mode)($v0)
    jal     BiBootCfgGet
    sb      $0, %lo(disk_card_type)($s0)
    bnezl   $v0, .L8000F31C
    sb      $s1, %lo(disk_card_type)($s0)
.L8000F31C:
    jal     bi_sd_speed
    li      $a0, 0x0001
    jal     diskCloseRW
    nop
    addiu   $a1, $sp, 0x0020
    daddu   $a0, $0, $0
    jal     diskReadToRam
    li      $a2, 0x0001
    ld      $ra, 0x0230($sp)
    daddu   $v1, $v0, $0
    daddu   $v0, $v1, $0
    ld      $s1, 0x0228($sp)
    ld      $s0, 0x0220($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0238

.globl diskInit
diskInit:
    addiu   $sp, $sp, -0x0060
    sd      $ra, 0x0058($sp)
    sd      $s5, 0x0050($sp)
    sd      $s4, 0x0048($sp)
    sd      $s3, 0x0040($sp)
    sd      $s2, 0x0038($sp)
    sd      $s1, 0x0030($sp)
    sd      $s0, 0x0028($sp)
    sb      $0, 0x0020($sp)
    jal     DiskCheckInit
    nop
    sb      $v0, 0x0020($sp)
    lbu     $v0, 0x0020($sp)
    bnez    $v0, .L8000F3C0
    lui     $v0, %hi(disk_mode)
    daddu   $v0, $0, $0
.L8000F398:
    ld      $ra, 0x0058($sp)
    ld      $s5, 0x0050($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060
    nop
.L8000F3C0:
    li      $a0, 0x0006
    lui     $s4, %hi(disk_card_type)
    sb      $0, %lo(disk_mode)($v0)
    jal     BiBootCfgClr
    sb      $0, %lo(disk_card_type)($s4)
    jal     bi_sd_speed
    daddu   $a0, $0, $0
    jal     bi_sd_bitlen
    li      $a0, 0x0008
    daddu   $s0, $0, $0
    li      $s1, 0x0028
    addiu   $s0, $s0, 0x0001
.L8000F3F0:
    li      $a0, 0x00FF
    jal     bi_sd_cmd_wr
    andi    $s0, $s0, 0xFFFF
    bnel    $s0, $s1, .L8000F3F0
    addiu   $s0, $s0, 0x0001
    li      $a0, 0x0040
    jal     diskCmdSD
    li      $a1, 0x01AA
    daddu   $s0, $0, $0
    li      $s1, 0x0028
    addiu   $s0, $s0, 0x0001
.L8000F41C:
    li      $a0, 0x00FF
    jal     bi_sd_cmd_wr
    andi    $s0, $s0, 0xFFFF
    bnel    $s0, $s1, .L8000F41C
    addiu   $s0, $s0, 0x0001
    li      $a0, 0x0048
    jal     diskCmdSD
    li      $a1, 0x01AA
    sb      $v0, 0x0020($sp)
    lbu     $v0, 0x0020($sp)
    beqz    $v0, .L8000F460
    nop
    lbu     $a0, 0x0020($sp)
    li      $v1, 0x00D9
    andi    $a0, $a0, 0x00FF
    bne     $a0, $v1, .L8000F398
    li      $v0, 0x00C0
.L8000F460:
    lbu     $v0, 0x0020($sp)
    beqz    $v0, .L8000F4EC
    lbu     $v0, %lo(disk_card_type)($s4)
    lbu     $v0, %lo(disk_card_type)($s4)
.L8000F470:
    li      $v1, 0x0002
    beq     $v0, $v1, .L8000F648
    daddu   $s0, $0, $0
    lui     $s1, %hi(sd_resp_buff)
    addiu   $s1, %lo(sd_resp_buff)
    j       .L8000F4C0
    li      $s3, 0x0401
    nop
.L8000F490:
    jal     diskCmdSD
    nop
    sb      $v0, 0x0020($sp)
    lbu     $v0, 0x0020($sp)
    bnez    $v0, .L8000F640
    addiu   $v1, $s0, 0x0001
    lbu     $v0, 0x0001($s1)
    bnez    $v0, .L8000F4FC
    li      $v0, 0x0400
    andi    $s0, $v1, 0xFFFF
    beql    $s0, $s3, .L8000F508
    lbu     $v1, 0x0001($s2)
.L8000F4C0:
    li      $a0, 0x0077
    jal     diskCmdSD
    daddu   $a1, $0, $0
    sb      $v0, 0x0020($sp)
    lbu     $v0, 0x0020($sp)
    li      $a0, 0x0069
    li      $a1, 0x40300000
    beqz    $v0, .L8000F490
    daddu   $s2, $s1, $0
    j       .L8000F398
    li      $v0, 0x00C2
.L8000F4EC:
    ori     $v0, $v0, 0x0002
    andi    $v0, $v0, 0x00FF
    j       .L8000F470
    sb      $v0, %lo(disk_card_type)($s4)
.L8000F4FC:
    beq     $s0, $v0, .L8000F398
    li      $v0, 0x00C4
    lbu     $v1, 0x0001($s2)
.L8000F508:
    andi    $v1, $v1, 0x0040
.L8000F50C:
    beqz    $v1, .L8000F52C
    li      $a0, 0x0042
    lbu     $v0, %lo(disk_card_type)($s4)
    beqz    $v0, .L8000F52C
    lui     $v1, %hi(disk_card_type)
    ori     $v0, $v0, 0x0001
    sb      $v0, %lo(disk_card_type)($v1)
    li      $a0, 0x0042
.L8000F52C:
    jal     diskCmdSD
    daddu   $a1, $0, $0
    sb      $v0, 0x0020($sp)
    lbu     $v1, 0x0020($sp)
    bnez    $v1, .L8000F398
    li      $v0, 0x00C5
    li      $a0, 0x0043
    jal     diskCmdSD
    daddu   $a1, $0, $0
    sb      $v0, 0x0020($sp)
    lbu     $v1, 0x0020($sp)
    bnez    $v1, .L8000F398
    li      $v0, 0x00C6
    li      $a0, 0x0047
    jal     diskCmdSD
    daddu   $a1, $0, $0
    lbu     $s0, 0x0001($s2)
    lbu     $a1, 0x0002($s2)
    lbu     $a0, 0x0004($s2)
    sll     $a1, $a1, 16
    lbu     $v1, 0x0003($s2)
    sll     $s0, $s0, 24
    or      $s0, $s0, $a1
    sll     $v1, $v1, 8
    or      $s0, $s0, $a0
    or      $s0, $s0, $v1
    li      $a0, 0x0049
    daddu   $a1, $s0, $0
    sb      $v0, 0x0020($sp)
    jal     diskCmdSD
    nop
    sb      $v0, 0x0020($sp)
    lbu     $v1, 0x0020($sp)
    bnez    $v1, .L8000F398
    li      $v0, 0x00C7
    li      $a0, 0x0047
    jal     diskCmdSD
    daddu   $a1, $s0, $0
    sb      $v0, 0x0020($sp)
    lbu     $v1, 0x0020($sp)
    bnez    $v1, .L8000F398
    li      $v0, 0x00C8
    daddu   $a1, $s0, $0
    jal     diskCmdSD
    li      $a0, 0x0077
    sb      $v0, 0x0020($sp)
    lbu     $v1, 0x0020($sp)
    bnez    $v1, .L8000F398
    li      $v0, 0x00C9
    li      $a0, 0x0046
    jal     diskCmdSD
    li      $a1, 0x0002
    sb      $v0, 0x0020($sp)
    lbu     $v1, 0x0020($sp)
    bnez    $v1, .L8000F398
    li      $v0, 0x00CA
    jal     bi_sd_speed
    li      $a0, 0x0001
    jal     BiBootCfgSet
    li      $a0, 0x0002
    lbu     $v0, %lo(disk_card_type)($s4)
    andi    $v0, $v0, 0x0001
    beqzl   $v0, .L8000F398
    daddu   $v0, $0, $0
    jal     BiBootCfgSet
    li      $a0, 0x0004
    j       .L8000F398
    daddu   $v0, $0, $0
    nop
.L8000F640:
    j       .L8000F398
    li      $v0, 0x00C3
.L8000F648:
    lui     $s1, %hi(sd_resp_buff)
    addiu   $s1, %lo(sd_resp_buff)
    daddu   $s5, $s1, $0
    j       .L8000F66C
    li      $s3, 0x0400
    nop
.L8000F660:
    andi    $s0, $s0, 0xFFFF
    beq     $s0, $s3, .L8000F398
    li      $v0, 0x00C4
.L8000F66C:
    li      $a0, 0x0077

.globl fat_os_8000F670
fat_os_8000F670:
    jal     diskCmdSD
    daddu   $a1, $0, $0
    sb      $v0, 0x0020($sp)
    lbu     $v0, 0x0020($sp)
    bnez    $v0, .L8000F6C4
    daddu   $s2, $s1, $0
    lbu     $v0, 0x0003($s1)
    andi    $v0, $v0, 0x0001
    beqzl   $v0, .L8000F660
    addiu   $s0, $s0, 0x0001
    li      $a0, 0x0069
    jal     diskCmdSD
    li      $a1, 0x40300000
    lbu     $v1, 0x0001($s5)
    sb      $v0, 0x0020($sp)
    sll     $v0, $v1, 24
    sra     $v0, $v0, 24
    bgezl   $v0, .L8000F660
    addiu   $s0, $s0, 0x0001
    j       .L8000F50C
    andi    $v1, $v1, 0x0040
.L8000F6C4:
    j       .L8000F398
    li      $v0, 0x00C1
    nop
    lui     $v0, %hi(_80079D28)
    sw      $a1, 0x0000($a0)
    addiu   $v0, %lo(_80079D28)
    lbu     $v1, 0x0012($v0)
    addiu   $a1, $a1, -0x0002
    mult    $a1, $v1
    lw      $v0, 0x0004($v0)
    sb      $0, 0x0008($a0)
    mflo    $a1
    addu    $a1, $a1, $v0
    jr      $ra
    sw      $a1, 0x0004($a0)

.globl fat_os_8000F700
fat_os_8000F700:
    lui     $v0, %hi(_80079D28)
    addiu   $v0, %lo(_80079D28)
    lw      $v1, 0x0004($v0)
    lbu     $v0, 0x0012($v0)
    subu    $a2, $a1, $v1
    divu    $0, $a2, $v0
    teq     $v0, $0, 7
    sw      $a1, 0x0004($a0)
    mflo    $a2
    nop
    nop
    mult    $a2, $v0
    addiu   $a2, $a2, 0x0002
    sw      $a2, 0x0000($a0)
    mflo    $v0
    addu    $v1, $v0, $v1
    subu    $a1, $a1, $v1
    jr      $ra
    sb      $a1, 0x0008($a0)
    nop
    lui     $v1, %hi(_80079D28)
    addiu   $v1, %lo(_80079D28)
    lbu     $v0, 0x0012($v1)
    addiu   $a0, $a0, -0x0002
    mult    $a0, $v0
    lw      $v1, 0x0004($v1)
    mflo    $v0
    jr      $ra
    addu    $v0, $v0, $v1
    nop
    lui     $v1, %hi(_80079D28)
    addiu   $v1, %lo(_80079D28)
    lw      $a1, 0x0004($v1)
    lbu     $v0, 0x0012($v1)
    subu    $a1, $a0, $a1
    divu    $0, $a1, $v0
    teq     $v0, $0, 7
    mflo    $v0
    jr      $ra
    addiu   $v0, $v0, 0x0002

.globl fat_os_8000F7A0
fat_os_8000F7A0:
    lui     $v0, %hi(_80079D84)
    jr      $ra
    lw      $v0, %lo(_80079D84)($v0)
    nop

.globl fat_os_8000F7B0
fat_os_8000F7B0:
    lui     $v0, %hi(_80079D88)
    jr      $ra
    lw      $v0, %lo(_80079D88)($v0)
    nop

.globl fat_os_8000F7C0
fat_os_8000F7C0:
    lui     $v0, %hi(_80079D58)
    jr      $ra
    lhu     $v0, %lo(_80079D58)($v0)
    nop

.globl fat_os_8000F7D0
fat_os_8000F7D0:
    lui     $v0, %hi(_80079D4C)
    jr      $ra
    lw      $v0, %lo(_80079D4C)($v0)
    nop

.globl fat_os_8000F7E0
fat_os_8000F7E0:
    lui     $v0, %hi(_80079D50)
    jr      $ra
    lw      $v0, %lo(_80079D50)($v0)
    nop

.globl fat_os_8000F7F0
fat_os_8000F7F0:
    lui     $v0, %hi(_8005291C)
    lw      $v0, %lo(_8005291C)($v0)
    andi    $a0, $a0, 0xFFFF
    sll     $a0, $a0, 2
    addu    $a0, $v0, $a0
    jr      $ra
    lw      $v0, 0x0000($a0)
    nop
    lui     $v0, %hi(_80079D80)
    lbu     $v1, %lo(_80079D80)($v0)
    beqz    $v1, .L8000F840
    lui     $v0, %hi(_80079D3A)
    lbu     $v0, %lo(_80079D3A)($v0)
    subu    $v1, $v0, $v1
    andi    $v0, $v1, 0xFFFF
    sltu    $v1, $a0, $v0
    bnezl   $v1, .L8000F838
    andi    $v0, $a0, 0xFFFF
.L8000F838:
    jr      $ra
    nop
.L8000F840:
    lbu     $v0, %lo(_80079D3A)($v0)
    sltu    $v1, $v0, $a0
    bnezl   $v1, .L8000F858
    daddu   $a0, $v0, $0
    jr      $ra
    andi    $v0, $a0, 0xFFFF
.L8000F858:
    andi    $v0, $a0, 0xFFFF
    jr      $ra
    nop
    nop
    lbu     $a1, 0x0001($a0)
    lbu     $v0, 0x0002($a0)
    lbu     $v1, 0x0003($a0)
    sll     $a1, $a1, 8
    lbu     $a0, 0x0000($a0)
    sll     $v0, $v0, 16
    or      $v0, $a1, $v0
    or      $v0, $v0, $a0
    sll     $v1, $v1, 24
    jr      $ra
    or      $v0, $v0, $v1
    nop
    lbu     $v0, 0x0001($a0)
    lbu     $v1, 0x0000($a0)
    sll     $v0, $v0, 8
    jr      $ra
    or      $v0, $v0, $v1
    nop
    srl     $a2, $a0, 24
    srl     $v1, $a0, 8
    srl     $v0, $a0, 16
    sb      $a2, 0x0003($a1)
    sb      $v1, 0x0001($a1)
    sb      $v0, 0x0002($a1)
    jr      $ra
    sb      $a0, 0x0000($a1)

.globl fat_os_8000F8D0
fat_os_8000F8D0:
    lui     $v0, %hi(_80079D40)
    addiu   $v0, %lo(_80079D40)
    andi    $a1, $a1, 0xFFFF
    sw      $a2, 0x000C($v0)
    beqz    $a1, .L8000F924
    sh      $0, 0x0018($v0)
    addiu   $t0, $a1, -0x0001
    lui     $v1, %hi(_8005291C)
    andi    $t0, $t0, 0xFFFF
    lw      $t1, %lo(_8005291C)($v1)
    addiu   $t0, $t0, 0x0001
    daddu   $v1, $0, $0
.L8000F900:
    andi    $a2, $v1, 0xFFFF
    lw      $a3, 0x0000($a0)
    sll     $a2, $a2, 2
    addu    $a2, $t1, $a2
    addiu   $v1, $v1, 0x0001
    sw      $a3, 0x0000($a2)
    bne     $v1, $t0, .L8000F900
    addiu   $a0, $a0, 0x0004
    sh      $a1, 0x0018($v0)
.L8000F924:
    jr      $ra
    nop
    nop

.globl fat_os_8000F930
fat_os_8000F930:
    lui     $v1, %hi(_80079D40)
    addiu   $v1, %lo(_80079D40)
    lhu     $v0, 0x0018($v1)
    beqz    $v0, .L8000F9C0
    lui     $a1, %hi(_8005291C)
    lw      $t0, %lo(_8005291C)($a1)
    lw      $a2, 0x0000($t0)
    beq     $a2, $a0, .L8000F984
    daddu   $a1, $0, $0
    j       .L8000F968
    daddu   $a2, $t0, $0
    nop
.L8000F960:
    beq     $a3, $a0, .L8000F97C
    addiu   $a2, $a2, 0x0004
.L8000F968:
    addiu   $a1, $a1, 0x0001
    andi    $a1, $a1, 0xFFFF
    sltu    $a3, $a1, $v0
    bnezl   $a3, .L8000F960
    lw      $a3, 0x0004($a2)
.L8000F97C:
    beq     $a1, $v0, .L8000F9C0
    nop
.L8000F984:
    addiu   $v0, $v0, -0x0001
    andi    $v0, $v0, 0xFFFF
    sltu    $a0, $a1, $v0
    beqz    $a0, .L8000F9C0
    sh      $v0, 0x0018($v1)
.L8000F998:
    addiu   $v1, $a1, 0x0001
    sll     $a0, $v1, 2
    addu    $a0, $t0, $a0
    lw      $a2, 0x0000($a0)
    sll     $a0, $a1, 2
    andi    $a1, $v1, 0xFFFF
    addu    $a0, $t0, $a0
    sltu    $v1, $a1, $v0
    bnez    $v1, .L8000F998
    sw      $a2, 0x0000($a0)
.L8000F9C0:
    jr      $ra
    nop

.globl fat_os_8000F9C8
fat_os_8000F9C8:
    lbu     $v1, 0x0000($a0)
    lbu     $v0, 0x0000($a1)
    beq     $v1, $v0, .L8000F9E8
    sltu    $v0, $v1, $v0
    bnez    $v0, .L8000FA10
    nop
.L8000F9E0:
    jr      $ra
    li      $v0, 0x0002
.L8000F9E8:
    daddu   $v0, $0, $0
.L8000F9EC:
    addu    $v1, $a0, $v0
    addu    $a2, $a1, $v0
    lbu     $v1, 0x0001($v1)
    lbu     $a2, 0x0001($a2)
    beq     $v1, $a2, .L8000FA18
    nop
    sltu    $v1, $v1, $a2
    beqz    $v1, .L8000F9E0
    nop
.L8000FA10:
    jr      $ra
    li      $v0, 0x0001
.L8000FA18:
    bnez    $v1, .L8000F9EC
    addiu   $v0, $v0, 0x0001
    jr      $ra
    daddu   $v0, $0, $0

.globl fat_os_8000FA28
fat_os_8000FA28:
    addiu   $sp, $sp, -0x0078
    andi    $a0, $a0, 0xFFFF
    sd      $s2, 0x0038($sp)
    srl     $s2, $a0, 1
    sd      $s7, 0x0060($sp)
    sd      $ra, 0x0070($sp)
    sd      $s8, 0x0068($sp)
    sd      $s6, 0x0058($sp)
    sd      $s5, 0x0050($sp)
    sd      $s4, 0x0048($sp)
    sd      $s3, 0x0040($sp)
    sd      $s1, 0x0030($sp)
    sd      $s0, 0x0028($sp)
    sw      $a0, 0x0024($sp)
    beqz    $s2, .L8000FB48
    daddu   $s7, $a1, $0
    sw      $s2, 0x0020($sp)
.L8000FA6C:
    lw      $a0, 0x0024($sp)
    sltu    $v0, $s2, $a0
    beqzl   $v0, .L8000FB40
    srl     $s2, $s2, 1
    subu    $s8, $0, $s2
    andi    $s8, $s8, 0xFFFF
    daddu   $s5, $s2, $0
.L8000FA88:
    lw      $v1, 0x0020($sp)
    sltu    $v0, $v1, $s2
    bnez    $v0, .L8000FB24
    lw      $a0, 0x0024($sp)
    subu    $s3, $v1, $s2
    j       .L8000FAE0
    andi    $s3, $s3, 0xFFFF
    nop
.L8000FAA8:
    lui     $a0, %hi(_8005291C)
    lw      $v0, %lo(_8005291C)($a0)
    lw      $a1, 0x0000($s0)
    addu    $s6, $v0, $s6
    addu    $s5, $v0, $s5
    lw      $v0, 0x0000($s5)
    lw      $a0, 0x0000($s1)
    lw      $a2, 0x0000($s6)
    sw      $a1, 0x0000($s1)
    sw      $a2, 0x0000($s5)
    sw      $a0, 0x0000($s0)
    sw      $v0, 0x0000($s6)
    bnez    $v1, .L8000FB1C
    andi    $s5, $s4, 0xFFFF
.L8000FAE0:
    subu    $s4, $s5, $s2
    sll     $s6, $s4, 2
    sll     $s5, $s5, 2
    addu    $s1, $s7, $s5
    addu    $s0, $s7, $s6
    lw      $a0, 0x0000($s1)
    lw      $a1, 0x0000($s0)
    addu    $s3, $s3, $s8
    jal     fat_os_8000F9C8
    andi    $s3, $s3, 0xFFFF
    addu    $v1, $s3, $s2
    andi    $v1, $v1, 0xFFFF
    li      $a0, 0x0001
    beq     $v0, $a0, .L8000FAA8
    sltu    $v1, $v1, $s2
.L8000FB1C:
    lw      $v1, 0x0020($sp)
    lw      $a0, 0x0024($sp)
.L8000FB24:
    addiu   $v0, $v1, 0x0001
    andi    $v0, $v0, 0xFFFF
    sw      $v0, 0x0020($sp)
    sltu    $v0, $v0, $a0
    bnez    $v0, .L8000FA88
    lw      $s5, 0x0020($sp)
    srl     $s2, $s2, 1
.L8000FB40:
    bnez    $s2, .L8000FA6C
    sw      $s2, 0x0020($sp)
.L8000FB48:
    ld      $ra, 0x0070($sp)
    ld      $s8, 0x0068($sp)
    ld      $s7, 0x0060($sp)
    ld      $s6, 0x0058($sp)
    ld      $s5, 0x0050($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0078

.globl fat_os_8000FB78
fat_os_8000FB78:
    addiu   $sp, $sp, -0x0040
    sd      $s2, 0x0030($sp)
    sd      $s0, 0x0020($sp)
    li      $a2, 0x000B
    lui     $v0, %hi(_80079D58)
    daddu   $s0, $a1, $0
    daddu   $s2, $a0, $0
    daddu   $a0, $a1, $0
    li      $a1, 0x0020
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0038($sp)
    jal     os_80014778
    lhu     $s1, %lo(_80079D58)($v0)
    daddu   $v1, $0, $0
    li      $a2, 0x0020
    li      $a3, 0x002E
.L8000FBB8:
    lbu     $v0, 0x0000($s2)
    addiu   $a0, $v1, 0x0001
    beq     $v0, $a2, .L8000FBDC
    addu    $a1, $s0, $v1
    beq     $v0, $a3, .L8000FBE8
    nop
    beqz    $v0, .L8000FBE8
    andi    $v1, $a0, 0x00FF
    sb      $v0, 0x0000($a1)
.L8000FBDC:
    sltiu   $v0, $v1, 0x0004
    bnez    $v0, .L8000FBB8
    addiu   $s2, $s2, 0x0001
.L8000FBE8:
    jal     os_80015448
    daddu   $a0, $s2, $0
    daddu   $v1, $0, $0
    li      $a3, 0x0020
.L8000FBF8:
    lbu     $a0, 0x0000($v0)
    addiu   $a2, $v1, 0x0001
    beqz    $a0, .L8000FC24
    addu    $a1, $s0, $v1
    beql    $a0, $a3, .L8000FC1C
    sltiu   $a0, $v1, 0x0003
    sb      $a0, 0x0008($a1)
    andi    $v1, $a2, 0x00FF
    sltiu   $a0, $v1, 0x0003
.L8000FC1C:
    bnez    $a0, .L8000FBF8
    addiu   $v0, $v0, 0x0001
.L8000FC24:
    daddu   $a0, $s0, $0
    jal     os_800153E8
    li      $a1, 0x000B
    lbu     $v1, 0x0000($s0)
    li      $v0, 0x0020
    daddu   $a2, $0, $0
    beq     $v1, $v0, .L8000FDF4
    li      $a0, 0x0020
    addiu   $a2, $a2, 0x0001
.L8000FC48:
    andi    $a2, $a2, 0x00FF
    addu    $v0, $s0, $a2
    lbu     $v1, 0x0000($v0)
    bne     $v1, $a0, .L8000FC48
    addiu   $a2, $a2, 0x0001
    andi    $a2, $a2, 0x00FF
    addiu   $a1, $a2, 0x0001
    andi    $a1, $a1, 0x00FF
    addiu   $t3, $a1, 0x0001
    andi    $t3, $t3, 0x00FF
.L8000FC70:
    lui     $a0, 0x51EB851F >> 16
    ori     $a0, 0x51EB851F & 0xFFFF
    multu   $s1, $a0
    lui     $t1, 0x10624DD3 >> 16
    ori     $t1, 0x10624DD3 & 0xFFFF
    addu    $a2, $s0, $a2
    addu    $a1, $s0, $a1
    addu    $t3, $s0, $t3
    mflo    $v1
    dsll32  $v1, $v1, 0
    dsrl32  $v1, $v1, 0
    mfhi    $t2
    dsll32  $t2, $t2, 0
    or      $t2, $t2, $v1
    multu   $s1, $t1
    dsrl32  $t2, $t2, 0
    srl     $t4, $t2, 5
    sll     $t5, $t4, 4
    sll     $t2, $t4, 2
    addu    $t2, $t2, $t5
    dsll32  $v1, $s1, 0
    mfhi    $t1
    dsrl32  $v1, $v1, 0
    srl     $t1, $t1, 6
    sll     $t4, $t2, 2
    dsll    $t0, $v1, 4
    sll     $t5, $t1, 7
    dsll    $a3, $v1, 2
    addu    $t2, $t2, $t4
    sll     $t4, $t1, 2
    dsubu   $a3, $t0, $a3
    subu    $t0, $t5, $t4
    addu    $t1, $t0, $t1
    sll     $t1, $t1, 3
    subu    $t1, $s1, $t1
    subu    $t2, $s1, $t2
    andi    $t1, $t1, 0xFFFF
    andi    $t2, $t2, 0xFFFF
    multu   $t1, $a0
    dsll    $t0, $a3, 4
    daddu   $t0, $a3, $t0
    dsll    $t4, $t2, 4
    dsll    $a3, $t2, 2
    dsubu   $t4, $t4, $a3
    mflo    $t5
    dsll    $a3, $t0, 8
    daddu   $t0, $t0, $a3
    dsll    $a3, $t4, 4
    mfhi    $a0
    daddu   $a3, $t4, $a3
    dsll    $t1, $t0, 16
    daddu   $t0, $t0, $t1
    dsll    $t1, $a3, 8
    daddu   $a3, $a3, $t1
    daddu   $v1, $t0, $v1
    dsll32  $t5, $t5, 0
    dsrl32  $v1, $v1, 3
    dsll    $t0, $a3, 16
    dsrl32  $t5, $t5, 0
    dsll32  $a0, $a0, 0
    daddu   $a3, $a3, $t0
    or      $a0, $a0, $t5
    sll     $t0, $v1, 3
    sll     $v1, $v1, 1
    addu    $v1, $v1, $t0
    daddu   $t2, $a3, $t2
    dsrl32  $a0, $a0, 0
    subu    $s1, $s1, $v1
    srl     $a0, $a0, 5
    dsrl32  $t2, $t2, 3
    li      $v1, 0x007E
    addiu   $a0, $a0, 0x0030
    addiu   $t2, $t2, 0x0030
    addiu   $s1, $s1, 0x0030
    sb      $v1, 0x0000($v0)
    sb      $a0, 0x0000($a2)
    daddu   $v1, $0, $0
    sb      $t2, 0x0000($a1)
    daddu   $v0, $0, $0
    sb      $s1, 0x0000($t3)
    li      $a2, 0x000B
    nop
.L8000FDB8:
    addu    $a0, $s0, $v1
    srl     $a1, $v0, 1
    lbu     $a0, 0x0000($a0)
    sll     $v0, $v0, 7
    or      $v0, $v0, $a1
    addu    $v0, $v0, $a0
    addiu   $v1, $v1, 0x0001
    bne     $v1, $a2, .L8000FDB8
    andi    $v0, $v0, 0x00FF
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040
.L8000FDF4:
    daddu   $v0, $s0, $0
    li      $t3, 0x0003
    li      $a1, 0x0002
    j       .L8000FC70
    li      $a2, 0x0001

.globl fat_os_8000FE08
fat_os_8000FE08:
    addiu   $sp, $sp, -0x0048
    sd      $s0, 0x0020($sp)
    lui     $s0, %hi(_80079D18)
    lw      $v1, %lo(_80079D18)($s0)
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    daddu   $s1, $a0, $0
    beq     $v1, $a0, .L8000FEA4
    daddu   $v0, $0, $0
    addiu   $v0, $s0, %lo(_80079D18)
    lbu     $a0, 0x000C($v0)
    bnez    $a0, .L8000FE78
    lui     $s3, %hi(_80079D28)
    lui     $s2, %hi(_80052920)
    lw      $a0, %lo(_80079D28)($s3)
.L8000FE4C:
    lw      $a1, %lo(_80052920)($s2)
    sw      $s1, %lo(_80079D18)($s0)
    addu    $a0, $s1, $a0
    ld      $ra, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    li      $a2, 0x0001
    j       diskReadToRam
    addiu   $sp, $sp, 0x0048
.L8000FE78:
    lw      $a0, %lo(_80079D28)($s3)
    lui     $s2, %hi(_80052920)
    addu    $v1, $a0, $v1
    lw      $a1, %lo(_80052920)($s2)
    daddu   $a0, $v1, $0
    li      $a2, 0x0001
    sb      $0, 0x000C($v0)
    jal     diskWrite
    sw      $v1, %lo(_80079D18)($s0)
    beqzl   $v0, .L8000FEC0
    addiu   $v0, $s3, %lo(_80079D28)
.L8000FEA4:
    ld      $ra, 0x0040($sp)
.L8000FEA8:
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048
.L8000FEC0:
    lw      $a0, 0x0008($v0)
    lw      $v0, %lo(_80079D18)($s0)
    lw      $a1, %lo(_80052920)($s2)
    addu    $a0, $a0, $v0
    jal     diskWrite
    li      $a2, 0x0001
    bnez    $v0, .L8000FEA4
    lui     $v1, 0x0FFFFFFF >> 16
    ori     $v1, 0x0FFFFFFF & 0xFFFF
    bne     $s1, $v1, .L8000FE4C
    lw      $a0, %lo(_80079D28)($s3)
    j       .L8000FEA8
    ld      $ra, 0x0040($sp)
    nop

.globl fat_os_8000FEF8
fat_os_8000FEF8:
    addiu   $sp, $sp, -0x0058
    sd      $s3, 0x0038($sp)
    lui     $s3, %hi(_80079D18)
    addiu   $s3, %lo(_80079D18)
    sd      $s0, 0x0020($sp)
    lw      $s0, 0x0008($s3)
    sd      $ra, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s4, 0x0040($sp)
    sd      $s2, 0x0030($sp)
    beqz    $s0, .L80010050
    sd      $s1, 0x0028($sp)
    srl     $s0, $s0, 7
    li      $s1, 0x0001
.L8000FF30:
    lui     $s5, %hi(_80079D28)
    addiu   $s5, %lo(_80079D28)
    lui     $s2, %hi(_80052920)
    li      $s4, 0x0001
.L8000FF40:
    jal     fat_os_8000FE08
    daddu   $a0, $s0, $0
    bnez    $v0, .L8000FF94
    ld      $ra, 0x0050($sp)
    lw      $a0, %lo(_80052920)($s2)
.L8000FF54:
    lw      $v1, 0x01FC($a0)
    bnezl   $v1, .L8000FFB8
    lw      $v0, 0x0008($s5)
    beq     $s1, $s4, .L8000FFD8
    nop
    lw      $v1, 0x0008($s3)
    srl     $v1, $v1, 7
    beq     $v1, $s0, .L8000FFD8
    nop
    subu    $s0, $s0, $s1
    daddu   $a0, $s0, $0
    jal     fat_os_8000FE08
    li      $s1, 0x0001
    beqz    $v0, .L8000FF54
    lw      $a0, %lo(_80052920)($s2)
.L8000FF90:
    ld      $ra, 0x0050($sp)
.L8000FF94:
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
    nop
.L8000FFB8:
    addu    $s0, $s0, $s1
    sltu    $v0, $s0, $v0
    bnez    $v0, .L8000FF40
    nop
    beq     $s1, $s4, .L80010074
    subu    $s0, $s0, $s1
    j       .L8000FF40
    li      $s1, 0x0001
.L8000FFD8:
    beqz    $s0, .L80010068
    li      $a2, 0x0003
    daddu   $a2, $0, $0
    daddu   $a1, $0, $0
    daddu   $v1, $0, $0
.L8000FFEC:
    addu    $a1, $a0, $a1
    lw      $a1, 0x0000($a1)
    beqzl   $a1, .L80010020
    sll     $s0, $s0, 7
    nop
.L80010000:
    addiu   $v1, $v1, 0x0001
    andi    $v1, $v1, 0x00FF
    sll     $a1, $v1, 2
    addu    $a1, $a0, $a1
    lw      $a1, 0x0000($a1)
    bnez    $a1, .L80010000
    daddu   $a2, $v1, $0
    sll     $s0, $s0, 7
.L80010020:
    ld      $ra, 0x0050($sp)
    addu    $a2, $a2, $s0
    sw      $a2, 0x0008($s3)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
    nop
.L80010050:
    lui     $v0, %hi(_80079D38)
    lhu     $s1, %lo(_80079D38)($v0)
    li      $v0, 0x0003
    sw      $v0, 0x0008($s3)
    j       .L8000FF30
    daddu   $s0, $0, $0
.L80010068:
    li      $a1, 0x000C
    j       .L8000FFEC
    li      $v1, 0x0003
.L80010074:
    j       .L8000FF90
    li      $v0, 0x00F4
    nop

.globl fat_os_80010080
fat_os_80010080:
    addiu   $sp, $sp, -0x0038
    sd      $s0, 0x0028($sp)
    daddu   $s0, $a0, $0
    sd      $a1, 0x0020($sp)
    sd      $ra, 0x0030($sp)
    jal     fat_os_8000FE08
    srl     $a0, $a0, 7
    bnez    $v0, .L800100E0
    ld      $a1, 0x0020($sp)
    lui     $v1, %hi(_80052920)
    lw      $v1, %lo(_80052920)($v1)
    andi    $s0, $s0, 0x007F
    sll     $s0, $s0, 2
    addu    $s0, $v1, $s0
    srl     $a0, $a1, 8
    srl     $v1, $a1, 16
    sb      $a0, 0x0001($s0)
    sb      $v1, 0x0002($s0)
    srl     $a2, $a1, 24
    li      $a0, 0x0001
    lui     $v1, %hi(_80079D24)
    sb      $a2, 0x0003($s0)
    sb      $a1, 0x0000($s0)
    sb      $a0, %lo(_80079D24)($v1)
.L800100E0:
    ld      $ra, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038

.globl fat_os_800100F0
fat_os_800100F0:
    addiu   $sp, $sp, -0x0038
    sd      $s0, 0x0020($sp)
    lw      $s0, 0x0000($a0)
    sd      $s1, 0x0028($sp)
    daddu   $s1, $a0, $0
    sd      $ra, 0x0030($sp)
    jal     fat_os_8000FE08
    srl     $a0, $s0, 7
    bnez    $v0, .L80010164
    lui     $v1, %hi(_80052920)
    lw      $v1, %lo(_80052920)($v1)
    andi    $s0, $s0, 0x007F
    sll     $s0, $s0, 2
    addu    $s0, $v1, $s0
    lbu     $a2, 0x0001($s0)
    lbu     $v1, 0x0002($s0)
    sll     $a2, $a2, 8
    sll     $v1, $v1, 16
    lbu     $a0, 0x0003($s0)
    lbu     $a1, 0x0000($s0)
    or      $v1, $a2, $v1
    sll     $a0, $a0, 24
    or      $v1, $v1, $a1
    or      $v1, $v1, $a0
    lui     $a0, 0x0FFFFFFF >> 16
    ori     $a0, 0x0FFFFFFF & 0xFFFF
    beq     $v1, $a0, .L80010178
    ld      $ra, 0x0030($sp)
    sw      $v1, 0x0000($s1)
.L80010164:
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
.L80010178:
    li      $v0, 0x00F3
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop

.globl fat_os_80010190
fat_os_80010190:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0028($sp)
    jal     fat_os_800100F0
    daddu   $s0, $a0, $0
    bnez    $v0, .L800101D4
    lui     $v1, %hi(_80079D28)
    addiu   $v1, %lo(_80079D28)
    sb      $0, 0x0008($s0)
    lw      $a0, 0x0000($s0)
    lbu     $a1, 0x0012($v1)
    addiu   $a0, $a0, -0x0002
    mult    $a1, $a0
    lw      $a0, 0x0004($v1)
    mflo    $a1
    addu    $v1, $a1, $a0
    sw      $v1, 0x0004($s0)
.L800101D4:
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
    nop

.globl fat_os_800101E8
fat_os_800101E8:
    lui     $v1, %hi(_80079D78)
    addiu   $v1, %lo(_80079D78)
    lbu     $v0, 0x0008($v1)
    andi    $a0, $a0, 0xFFFF
    lui     $a1, %hi(_80079D3A)
    addu    $v0, $a0, $v0
    lbu     $a1, %lo(_80079D3A)($a1)
    andi    $v0, $v0, 0x00FF
    beq     $a1, $v0, .L80010228
    sb      $v0, 0x0008($v1)
    lw      $a1, 0x0004($v1)
    daddu   $v0, $0, $0
    addu    $a0, $a0, $a1
    jr      $ra
    sw      $a0, 0x0004($v1)
    nop
.L80010228:
    j       fat_os_80010190
    daddu   $a0, $v1, $0
.L80010230:
    addiu   $sp, $sp, -0x0060
    sd      $s2, 0x0030($sp)
    lui     $s2, %hi(_80079D78)
    addiu   $s2, %lo(_80079D78)
    lw      $v1, 0x000C($s2)
    sd      $s0, 0x0020($sp)
    daddu   $s0, $a1, $0
    sltu    $a1, $v1, $a1
    sd      $s4, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $ra, 0x0058($sp)
    sd      $s6, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s1, 0x0028($sp)
    daddu   $s3, $a0, $0
    andi    $s4, $a2, 0x00FF
    bnez    $a1, .L80010348
    li      $v0, 0x00F3
    subu    $v1, $v1, $s0
    beqz    $s0, .L80010370
    sw      $v1, 0x000C($s2)
    lbu     $v0, 0x0008($s2)
    lui     $s6, %hi(_80079D28)
    addiu   $s6, %lo(_80079D28)
    bnez    $v0, .L8001030C
    li      $s5, 0x0001
.L80010298:
    lbu     $v0, 0x0012($s6)
    sltu    $v1, $v0, $s0
    beqz    $v1, .L800102AC
    daddu   $s1, $s0, $0
    daddu   $s1, $v0, $0
.L800102AC:
    andi    $s1, $s1, 0xFFFF
.L800102B0:
    beql    $s4, $s5, .L80010330
    lw      $a0, 0x0004($s2)
.L800102B8:
    lw      $a0, 0x0004($s2)
    daddu   $a1, $s3, $0
    jal     diskReadToRom
    daddu   $a2, $s1, $0
    bnez    $v0, .L8001034C
    ld      $ra, 0x0058($sp)
    subu    $s0, $s0, $s1
.L800102D4:
    bnez    $s0, .L800102E8
    nop
    lw      $v0, 0x000C($s2)
    beqz    $v0, .L80010374
    ld      $ra, 0x0058($sp)
.L800102E8:
    jal     fat_os_800101E8
    daddu   $a0, $s1, $0
    bnez    $v0, .L8001034C
    ld      $ra, 0x0058($sp)
    beqzl   $s0, .L80010350
    ld      $s6, 0x0050($sp)
    lbu     $v0, 0x0008($s2)
    beqz    $v0, .L80010298
    addu    $s3, $s3, $s1
.L8001030C:
    lbu     $s1, 0x0012($s6)
    subu    $s1, $s1, $v0
    andi    $s1, $s1, 0xFFFF
    sltu    $v0, $s0, $s1
    beqz    $v0, .L800102B0
    nop
    bne     $s4, $s5, .L800102B8
    andi    $s1, $s0, 0xFFFF
    lw      $a0, 0x0004($s2)
.L80010330:
    daddu   $a1, $s3, $0
    jal     disk_8000EDC8
    daddu   $a2, $s1, $0
    beqz    $v0, .L800102D4
    subu    $s0, $s0, $s1
    nop
.L80010348:
    ld      $ra, 0x0058($sp)
.L8001034C:
    ld      $s6, 0x0050($sp)
.L80010350:
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060
.L80010370:
    ld      $ra, 0x0058($sp)
.L80010374:
    daddu   $v0, $0, $0
    ld      $s6, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060
    nop

.globl fat_os_800103A0
fat_os_800103A0:
    j       .L80010230
    daddu   $a2, $0, $0

.globl fat_os_800103A8
fat_os_800103A8:
    lbu     $v1, 0x0008($a0)
    lw      $a1, 0x0004($a0)
    addiu   $v1, $v1, 0x0001
    andi    $v1, $v1, 0x00FF
    addiu   $a1, $a1, 0x0001
    sw      $a1, 0x0004($a0)
    sb      $v1, 0x0008($a0)
    lui     $v0, %hi(_80079D3A)
    lbu     $v0, %lo(_80079D3A)($v0)
    beq     $v0, $v1, .L800103E0
    daddu   $v0, $0, $0
    jr      $ra
    nop
    nop
.L800103E0:
    j       fat_os_80010190
    nop

.globl fat_os_800103E8
fat_os_800103E8:
    addiu   $sp, $sp, -0x0080
    sd      $s0, 0x0030($sp)
    andi    $s0, $a2, 0xFFFF
    sd      $s8, 0x0070($sp)
    sd      $s4, 0x0050($sp)
    sd      $s2, 0x0040($sp)
    sd      $s1, 0x0038($sp)
    sd      $ra, 0x0078($sp)
    sd      $s7, 0x0068($sp)
    sd      $s6, 0x0060($sp)
    sd      $s5, 0x0058($sp)
    sd      $s3, 0x0048($sp)
    daddu   $s4, $a0, $0
    daddu   $s2, $a1, $0
    andi    $s8, $a3, 0x00FF
    beqz    $s0, .L80010488
    daddu   $s1, $0, $0
    lui     $s6, %hi(_80079D18)
    lui     $s7, 0x0FFFFFFF >> 16
    addiu   $s6, %lo(_80079D18)
    ori     $s7, 0x0FFFFFFF & 0xFFFF
    daddu   $s3, $0, $0
.L80010440:
    jal     fat_os_8000FEF8
    nop
    bnez    $v0, .L8001049C
    ld      $ra, 0x0078($sp)
    beqzl   $s3, .L800104C8
    lw      $s1, 0x0008($s6)
    daddu   $s5, $s6, $0
    bnez    $s4, .L800104D4
    lw      $v0, 0x0008($s6)
.L80010464:
    daddu   $a1, $s7, $0
    daddu   $a0, $v0, $0
    jal     fat_os_80010080
    addiu   $s3, $s3, 0x0001
    andi    $s3, $s3, 0xFFFF
    bnez    $v0, .L80010498
    sltu    $v1, $s3, $s0
    bnez    $v1, .L80010440
    lw      $s4, 0x0008($s5)
.L80010488:
    bnezl   $s2, .L80010490
    sw      $s1, 0x0000($s2)
.L80010490:
    bnez    $s8, .L800104E8
    daddu   $v0, $0, $0
.L80010498:
    ld      $ra, 0x0078($sp)
.L8001049C:
    ld      $s8, 0x0070($sp)
    ld      $s7, 0x0068($sp)
    ld      $s6, 0x0060($sp)
    ld      $s5, 0x0058($sp)
    ld      $s4, 0x0050($sp)
    ld      $s3, 0x0048($sp)
    ld      $s2, 0x0040($sp)
    ld      $s1, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0080
.L800104C8:
    daddu   $s5, $s6, $0
    beqz    $s4, .L80010464
    daddu   $v0, $s1, $0
.L800104D4:
    daddu   $a0, $s4, $0
    jal     fat_os_80010080
    daddu   $a1, $v0, $0
    j       .L80010464
    lw      $v0, 0x0008($s5)
.L800104E8:
    lui     $s2, %hi(_80079D28)
    addiu   $s2, %lo(_80079D28)
    lbu     $v0, 0x0012($s2)
    addiu   $v1, $s1, -0x0002
    mult    $v1, $v0
    lui     $s3, %hi(_80052924)
    lw      $v0, 0x0004($s2)
    lw      $a0, %lo(_80052924)($s3)
    daddu   $a1, $0, $0
    li      $a2, 0x0200
    mflo    $v1
    sw      $s1, 0x0020($sp)
    addu    $v0, $v1, $v0
    sw      $v0, 0x0024($sp)
    sb      $0, 0x0028($sp)
    jal     os_80014778
    addiu   $s4, $sp, 0x0020
    beqz    $s0, .L80010554
    lui     $v1, 0x0FFFFFFF >> 16
    lbu     $v0, 0x0012($s2)
.L80010538:
    bnez    $v0, .L80010598
    daddu   $s1, $0, $0
    addiu   $s0, $s0, -0x0001
.L80010544:
    andi    $s0, $s0, 0xFFFF
    bnezl   $s0, .L80010538
    lbu     $v0, 0x0012($s2)
    li      $v1, 0x0FFF0000
.L80010554:
    ld      $ra, 0x0078($sp)
    lui     $v0, %hi(_80079D1C)
    ori     $v1, 0x0FFFFFFF & 0xFFFF
    sw      $v1, %lo(_80079D1C)($v0)
    ld      $s8, 0x0070($sp)
    daddu   $v0, $0, $0
    ld      $s7, 0x0068($sp)
    ld      $s6, 0x0060($sp)
    ld      $s5, 0x0058($sp)
    ld      $s4, 0x0050($sp)
    ld      $s3, 0x0048($sp)
    ld      $s2, 0x0040($sp)
    ld      $s1, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0080
    nop
.L80010598:
    lw      $a0, 0x0024($sp)
.L8001059C:
    lw      $a1, %lo(_80052924)($s3)
    li      $a2, 0x0001
    jal     diskWrite
    addiu   $s1, $s1, 0x0001
    bnez    $v0, .L80010498
    andi    $s1, $s1, 0xFFFF
    lbu     $v0, 0x0012($s2)
    sltu    $v0, $s1, $v0
    beqzl   $v0, .L80010544
    addiu   $s0, $s0, -0x0001
    beqz    $s1, .L80010598
    daddu   $a0, $s4, $0
    jal     fat_os_800103A8
    nop
    beqz    $v0, .L8001059C
    lw      $a0, 0x0024($sp)
    j       .L8001049C
    ld      $ra, 0x0078($sp)
    nop

.globl fat_os_800105E8
fat_os_800105E8:
    addiu   $sp, $sp, -0x0058
    sd      $s1, 0x0028($sp)
    lui     $s1, %hi(_80079D78)
    addiu   $s1, %lo(_80079D78)
    lw      $v0, 0x000C($s1)
    sd      $s0, 0x0020($sp)
    andi    $s0, $a0, 0xFFFF
    subu    $v0, $v0, $s0
    sd      $ra, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s4, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    beqz    $s0, .L8001066C
    sw      $v0, 0x000C($s1)
    lui     $s2, %hi(_80079D28)
    addiu   $s2, %lo(_80079D28)
    daddu   $s5, $s2, $0
    daddu   $s3, $s1, $0
    daddu   $s4, $s1, $0
    lbu     $v0, 0x0012($s2)
.L8001063C:
    sltu    $v0, $s0, $v0
    bnez    $v0, .L80010654
    daddu   $a0, $s3, $0
    lbu     $v0, 0x0008($s1)
    beqz    $v0, .L80010698
    nop
.L80010654:
    jal     fat_os_800103A8
    addiu   $s0, $s0, -0x0001
    bnez    $v0, .L80010670
    andi    $s0, $s0, 0xFFFF
    bnezl   $s0, .L8001063C
    lbu     $v0, 0x0012($s2)
.L8001066C:
    daddu   $v0, $0, $0
.L80010670:
    ld      $ra, 0x0050($sp)
.L80010674:
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
    nop
.L80010698:
    jal     fat_os_80010190
    daddu   $a0, $s4, $0
    bnez    $v0, .L80010674
    ld      $ra, 0x0050($sp)
    lbu     $v0, 0x0012($s5)
    subu    $s0, $s0, $v0
    andi    $s0, $s0, 0xFFFF
    bnezl   $s0, .L8001063C
    lbu     $v0, 0x0012($s2)
    j       .L80010674
    daddu   $v0, $0, $0
    nop

.globl fat_os_800106C8
fat_os_800106C8:
    addiu   $sp, $sp, -0x0060
    sd      $s2, 0x0030($sp)
    lui     $s2, %hi(_80079D78)
    addiu   $s2, %lo(_80079D78)
    lw      $v1, 0x000C($s2)
    sd      $s0, 0x0020($sp)
    andi    $s0, $a1, 0xFFFF
    sltu    $a1, $v1, $s0
    sd      $s4, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $ra, 0x0058($sp)
    sd      $s6, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s1, 0x0028($sp)
    daddu   $s3, $a0, $0
    andi    $s4, $a2, 0x00FF
    bnez    $a1, .L800107E8
    li      $v0, 0x00F3
    subu    $v1, $v1, $s0
    beqz    $s0, .L80010810
    sw      $v1, 0x000C($s2)
    lbu     $v0, 0x0008($s2)
    lui     $s6, %hi(_80079D28)
    addiu   $s6, %lo(_80079D28)
    bnez    $v0, .L800107AC
    li      $s5, 0x0001
.L80010730:
    lbu     $v0, 0x0012($s6)
    sltu    $v1, $v0, $s0
    beqz    $v1, .L80010744
    daddu   $s1, $s0, $0
    daddu   $s1, $v0, $0
.L80010744:
    andi    $s1, $s1, 0xFFFF
.L80010748:
    beql    $s4, $s5, .L800107D0
    lw      $a0, 0x0004($s2)
.L80010750:
    lw      $a0, 0x0004($s2)
    daddu   $a1, $s3, $0
    jal     diskReadToRam
    daddu   $a2, $s1, $0
    bnez    $v0, .L800107EC
    ld      $ra, 0x0058($sp)
    subu    $s0, $s0, $s1
.L8001076C:
    andi    $s0, $s0, 0xFFFF
    bnez    $s0, .L80010784
    nop
    lw      $v0, 0x000C($s2)
    beqz    $v0, .L80010814
    ld      $ra, 0x0058($sp)
.L80010784:
    jal     fat_os_800101E8
    daddu   $a0, $s1, $0
    bnez    $v0, .L800107EC
    ld      $ra, 0x0058($sp)
    beqz    $s0, .L800107EC
    sll     $s1, $s1, 9
    lbu     $v0, 0x0008($s2)
    andi    $s1, $s1, 0xFFFF
    beqz    $v0, .L80010730
    addu    $s3, $s3, $s1
.L800107AC:
    lbu     $s1, 0x0012($s6)
    subu    $s1, $s1, $v0
    andi    $s1, $s1, 0xFFFF
    sltu    $v0, $s0, $s1
    beqz    $v0, .L80010748
    nop
    bne     $s4, $s5, .L80010750
    daddu   $s1, $s0, $0
    lw      $a0, 0x0004($s2)
.L800107D0:
    daddu   $a1, $s3, $0
    jal     diskWrite
    daddu   $a2, $s1, $0
    beqz    $v0, .L8001076C
    subu    $s0, $s0, $s1
    nop
.L800107E8:
    ld      $ra, 0x0058($sp)
.L800107EC:
    ld      $s6, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060
.L80010810:
    ld      $ra, 0x0058($sp)
.L80010814:
    daddu   $v0, $0, $0
    ld      $s6, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060
    nop

.globl fat_os_80010840
fat_os_80010840:
    andi    $a1, $a1, 0xFFFF
    j       fat_os_800106C8
    daddu   $a2, $0, $0
    nop

.globl fat_os_80010850
fat_os_80010850:
    addiu   $sp, $sp, -0x0040
    sd      $s0, 0x0020($sp)
    lui     $s0, %hi(_80079D18)
    addiu   $s0, %lo(_80079D18)
    lw      $v1, 0x0004($s0)
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    daddu   $s1, $a0, $0
    beq     $v1, $a0, .L800108B0
    daddu   $v0, $0, $0
    lbu     $v0, 0x000D($s0)
    beqz    $v0, .L800108C8
    lui     $s2, %hi(_80052924)
    lw      $a1, %lo(_80052924)($s2)
    daddu   $a0, $v1, $0
    li      $a2, 0x0001
    jal     diskWrite
    sb      $0, 0x000D($s0)
    bnez    $v0, .L800108B0
    lui     $v1, 0x0FFFFFFF >> 16
    ori     $v1, 0x0FFFFFFF & 0xFFFF
    bne     $s1, $v1, .L800108CC
    lw      $a1, %lo(_80052924)($s2)
.L800108B0:
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040
.L800108C8:
    lw      $a1, %lo(_80052924)($s2)
.L800108CC:
    sw      $s1, 0x0004($s0)
    daddu   $a0, $s1, $0
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    li      $a2, 0x0001
    j       diskReadToRam
    addiu   $sp, $sp, 0x0040

.globl fat_os_800108F0
fat_os_800108F0:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    lui     $s0, %hi(_80079D18)
    sd      $ra, 0x0028($sp)
    addiu   $s0, %lo(_80079D18)
    lbu     $v0, 0x000D($s0)
    bnez    $v0, .L80010940
    lui     $a0, 0x0FFFFFFF >> 16
    lbu     $v0, 0x000C($s0)
.L80010914:
    beqz    $v0, .L80010930
    ld      $ra, 0x0028($sp)
    lui     $a0, 0x0FFFFFFF >> 16
    jal     fat_os_8000FE08
    ori     $a0, 0x0FFFFFFF & 0xFFFF
    bnez    $v0, .L80010950
    ld      $ra, 0x0028($sp)
.L80010930:
    ld      $s0, 0x0020($sp)
    j       diskCloseRW
    addiu   $sp, $sp, 0x0030
    nop
.L80010940:
    jal     fat_os_80010850
    ori     $a0, 0x0FFFFFFF & 0xFFFF
    beqzl   $v0, .L80010914
    lbu     $v0, 0x000C($s0)
.L80010950:
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
.L80010960:
    lui     $v0, %hi(_80079D84)
    j       fat_os_800108F0
    sw      $0, %lo(_80079D84)($v0)
    nop

.globl fat_os_80010970
fat_os_80010970:
    addiu   $sp, $sp, -0x0028
    andi    $a1, $a1, 0xFFFF
    sd      $ra, 0x0020($sp)
    jal     fat_os_800106C8
    li      $a2, 0x0001
    beqz    $v0, .L80010998
    ld      $ra, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028
    nop
.L80010998:
    j       .L80010960
    addiu   $sp, $sp, 0x0028

.globl fat_os_800109A0
fat_os_800109A0:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    lui     $s0, %hi(_80079D60)
    addiu   $s0, %lo(_80079D60)
    lw      $v0, 0x000C($s0)
    li      $v1, 0x000F
    andi    $a0, $v0, 0x000F
    beq     $a0, $v1, .L800109F0
    sd      $ra, 0x0028($sp)
    lw      $v1, 0x0010($s0)
    addiu   $v0, $v0, 0x0001
    addiu   $v1, $v1, 0x0020
    sw      $v0, 0x000C($s0)
    sw      $v1, 0x0010($s0)
    daddu   $v0, $0, $0
    ld      $ra, 0x0028($sp)
.L800109E0:
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
    nop
.L800109F0:
    jal     fat_os_800103A8
    daddu   $a0, $s0, $0
    bnez    $v0, .L800109E0
    ld      $ra, 0x0028($sp)
    lw      $v0, 0x0004($s0)
    lui     $v1, %hi(_80052924)
    lw      $v1, %lo(_80052924)($v1)
    daddu   $a0, $v0, $0
    sll     $v0, $v0, 4
    sw      $v1, 0x0010($s0)
    sw      $v0, 0x000C($s0)
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       fat_os_80010850
    addiu   $sp, $sp, 0x0030
    nop

.globl fat_os_80010A30
fat_os_80010A30:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     fat_os_800109A0
    nop
    li      $v1, 0x00F3
    beql    $v0, $v1, .L80010A58
    lui     $v0, %hi(_80079D60)
    ld      $ra, 0x0020($sp)
.L80010A50:
    jr      $ra
    addiu   $sp, $sp, 0x0028
.L80010A58:
    lw      $a0, %lo(_80079D60)($v0)
    daddu   $a1, $0, $0
    li      $a2, 0x0001
    jal     fat_os_800103E8
    li      $a3, 0x0001
    bnez    $v0, .L80010A50
    ld      $ra, 0x0020($sp)
    j       fat_os_800109A0
    addiu   $sp, $sp, 0x0028
    nop

.globl fat_os_80010A80
fat_os_80010A80:
    addiu   $sp, $sp, -0x0058
    li      $v1, 0x0001
    lui     $v0, %hi(_80079D24+1)
    sd      $ra, 0x0050($sp)
    sd      $s4, 0x0048($sp)
    sd      $s3, 0x0040($sp)
    sd      $s2, 0x0038($sp)
    daddu   $s3, $a0, $0
    andi    $s2, $a1, 0x00FF
    sd      $s1, 0x0030($sp)
    sd      $s0, 0x0028($sp)
    daddu   $s0, $a2, $0
    jal     bios_os_800020B8
    sb      $v1, %lo(_80079D24+1)($v0)
    jal     bios_os_80002038
    daddu   $s1, $v0, $0
    lui     $v1, %hi(_80079D70)
    lw      $s4, %lo(_80079D70)($v1)
    li      $a2, 0x0020
    daddu   $a0, $s4, $0
    daddu   $a1, $0, $0
    jal     os_80014778
    sd      $v0, 0x0020($sp)
    daddu   $a0, $s3, $0
    daddu   $a1, $s4, $0
    jal     os_80014768
    li      $a2, 0x000B
    ld      $v0, 0x0020($sp)
    srl     $v1, $s1, 8
    srl     $a3, $s0, 8
    srl     $a2, $s0, 16
    srl     $a1, $s0, 24
    srl     $a0, $v0, 8
    sb      $a3, 0x001B($s4)
    sb      $s2, 0x000B($s4)
    sb      $a2, 0x0014($s4)
    sb      $a1, 0x0015($s4)
    sb      $a0, 0x0017($s4)
    sb      $v1, 0x0019($s4)
    sb      $v0, 0x0016($s4)
    sb      $s1, 0x0018($s4)
    sb      $s0, 0x001A($s4)
    ld      $ra, 0x0050($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    j       fat_os_80010A30
    addiu   $sp, $sp, 0x0058

.globl fat_os_80010B48
fat_os_80010B48:
    addiu   $sp, $sp, -0x0070
    sd      $s4, 0x0040($sp)
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0068($sp)
    daddu   $s0, $a0, $0
    sd      $s8, 0x0060($sp)
    sd      $s7, 0x0058($sp)
    sd      $s6, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s3, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    jal     os_80014F68
    andi    $s1, $a1, 0x00FF
    dsll32  $s4, $v0, 0
    lui     $v1, 0x4EC4EC4F >> 16
    dsrl32  $s4, $s4, 0
    ori     $v1, 0x4EC4EC4F & 0xFFFF
    dmult   $s4, $v1
    mflo    $s4
    dsrl32  $s4, $s4, 0
    srl     $s4, $s4, 2
    sll     $v1, $s4, 2
    sll     $a0, $s4, 4
    subu    $v1, $a0, $v1
    addu    $v1, $v1, $s4
    subu    $v0, $v0, $v1
    andi    $v0, $v0, 0x00FF
    beqz    $v0, .L80010BC8
    andi    $s4, $s4, 0x00FF
    addiu   $s4, $s4, 0x0001
    andi    $s4, $s4, 0x00FF
.L80010BC8:
    lui     $s8, %hi(_80079D18)
    lui     $s2, %hi(_80079D60)
    lui     $s7, %hi(lfn_char_struct)
    lui     $s3, %hi(lfn_char_struct+13)
    addiu   $s8, %lo(_80079D18)
    addiu   $s2, %lo(_80079D60)
    addiu   $s7, %lo(lfn_char_struct)
    addiu   $s3, %lo(lfn_char_struct+13)
    li      $s6, 0x0001
    li      $s5, 0x000F
.L80010BF0:
    beqz    $s4, .L80010D04
    addiu   $s4, $s4, -0x0001
    andi    $s4, $s4, 0x00FF
    sll     $v0, $s4, 2
    sll     $t0, $s4, 4
    subu    $t0, $t0, $v0
    addu    $t0, $t0, $s4
    addu    $t0, $s0, $t0
    lw      $a0, 0x0010($s2)
    sb      $s6, 0x000D($s8)
    daddu   $v0, $s7, $0
    daddu   $a1, $t0, $0
    daddu   $a2, $0, $0
    lbu     $v1, 0x0000($v0)
.L80010C28:
    lbu     $a3, 0x0000($a1)
    addu    $a0, $a0, $v1
    or      $a3, $a2, $a3
    sb      $a3, 0x0000($a0)
    lw      $a0, 0x0010($s2)
    addiu   $v0, $v0, 0x0001
    addu    $a0, $a0, $v1
    sb      $a2, 0x0001($a0)
    lw      $a0, 0x0010($s2)
    addu    $v1, $a0, $v1
    lbu     $v1, 0x0000($v1)
    bnez    $v1, .L80010C60
    addiu   $a1, $a1, 0x0001
    li      $a2, 0x00FF
.L80010C60:
    bnel    $v0, $s3, .L80010C28
    lbu     $v1, 0x0000($v0)
    bnez    $a2, .L80010CD4
    li      $v0, 0x0040
    lbu     $v1, 0x000D($t0)
    beqz    $v1, .L80010CD0
    daddu   $v0, $0, $0
    addiu   $v1, $s4, 0x0001
    or      $v0, $v0, $v1
    sb      $v0, 0x0000($a0)
    lw      $v0, 0x0010($s2)
    sb      $s5, 0x000B($v0)
    lw      $v0, 0x0010($s2)
    jal     fat_os_80010A30
    sb      $s1, 0x000D($v0)
    beqz    $v0, .L80010BF0
    ld      $ra, 0x0068($sp)
    ld      $s8, 0x0060($sp)
.L80010CA8:
    ld      $s7, 0x0058($sp)
    ld      $s6, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0070
.L80010CD0:
    li      $v0, 0x0040
.L80010CD4:
    addiu   $v1, $s4, 0x0001
    or      $v0, $v0, $v1
    sb      $v0, 0x0000($a0)
    lw      $v0, 0x0010($s2)
    sb      $s5, 0x000B($v0)
    lw      $v0, 0x0010($s2)
    jal     fat_os_80010A30
    sb      $s1, 0x000D($v0)
    beqz    $v0, .L80010BF0
    ld      $ra, 0x0068($sp)
    j       .L80010CA8
    ld      $s8, 0x0060($sp)
.L80010D04:
    ld      $ra, 0x0068($sp)
    daddu   $v0, $0, $0
    ld      $s8, 0x0060($sp)
    ld      $s7, 0x0058($sp)
    ld      $s6, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0070

.globl fat_os_80010D38
fat_os_80010D38:
    addiu   $sp, $sp, -0x0038
    sd      $s1, 0x0028($sp)
    daddu   $s1, $a0, $0
    lui     $a0, %hi(_80079D60)
    sd      $s0, 0x0020($sp)
    addiu   $s0, $a0, %lo(_80079D60)
    daddu   $a0, $s0, $0
    sd      $ra, 0x0030($sp)
    jal     fat_os_8000F700
    srl     $a1, $s1, 4
    jal     fat_os_80010850
    lw      $a0, 0x0004($s0)
    bnez    $v0, .L80010D88
    lui     $a0, %hi(_80052924)
    andi    $v1, $s1, 0x000F
    lw      $a0, %lo(_80052924)($a0)
    sll     $v1, $v1, 5
    addu    $v1, $a0, $v1
    sw      $v1, 0x0010($s0)
    sw      $s1, 0x000C($s0)
.L80010D88:
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop

.globl fat_os_80010DA0
fat_os_80010DA0:
    addiu   $sp, $sp, -0x0070
    sd      $s4, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0068($sp)
    sd      $s8, 0x0060($sp)
    sd      $s7, 0x0058($sp)
    sd      $s6, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s1, 0x0028($sp)
    daddu   $s0, $a1, $0
    daddu   $s2, $a2, $0
    jal     fat_os_80010D38
    daddu   $s4, $a0, $0
    bnez    $v0, .L80010FD0
    daddu   $s3, $v0, $0
    lui     $s7, %hi(_80079D60)
    addiu   $s7, %lo(_80079D60)
    beqz    $s2, .L80011004
    lw      $s1, 0x0010($s7)
    sb      $0, 0x0000($s2)
    li      $s8, 0x0001
.L80010DFC:
    lbu     $a0, 0x000B($s1)
    li      $v0, 0x000F
    bne     $a0, $v0, .L80010EE8
    addiu   $v1, $s1, 0x000B
    lbu     $v0, 0x0000($s1)
    li      $v1, 0x00E5
    beq     $v0, $v1, .L80010EB4
    lui     $s5, %hi(lfn_char_struct+13)
    addiu   $s5, %lo(lfn_char_struct+13)
    li      $s6, 0x000F
    nop
.L80010E28:
    beqz    $s8, .L80010E84
    addiu   $a0, $v0, -0x0001
    andi    $a0, $a0, 0x000F
    beq     $a0, $s6, .L80010E4C
    li      $v1, 0x00B6
    sll     $v1, $a0, 2
    sll     $a1, $a0, 4
    subu    $v1, $a1, $v1
    addu    $v1, $v1, $a0
.L80010E4C:
    andi    $v0, $v0, 0x0040
    beqz    $v0, .L80010E5C
    addu    $v1, $s2, $v1
    sb      $0, 0x000D($v1)
.L80010E5C:
    lui     $v0, %hi(lfn_char_struct)
    addiu   $v0, %lo(lfn_char_struct)
    nop
.L80010E68:
    lbu     $a0, 0x0000($v0)
    addiu   $v0, $v0, 0x0001
    addu    $a0, $s1, $a0
    lbu     $a0, 0x0000($a0)
    sb      $a0, 0x0000($v1)
    bne     $v0, $s5, .L80010E68
    addiu   $v1, $v1, 0x0001
.L80010E84:
    jal     fat_os_800109A0
    nop
    bnez    $v0, .L80010EBC
    ld      $ra, 0x0068($sp)
    lw      $s1, 0x0010($s7)
    lbu     $v0, 0x000B($s1)
    bne     $v0, $s6, .L80010EE8
    addiu   $v1, $s1, 0x000B
    lbu     $v0, 0x0000($s1)
    li      $v1, 0x00E5
    bne     $v0, $v1, .L80010E28
    nop
.L80010EB4:
    li      $v0, 0x00FA
.L80010EB8:
    ld      $ra, 0x0068($sp)
.L80010EBC:
    ld      $s8, 0x0060($sp)
    ld      $s7, 0x0058($sp)
    ld      $s6, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0070
.L80010EE8:
    lbu     $a0, 0x0000($s1)
    li      $v0, 0x00E5
    beq     $a0, $v0, .L80010EB8
    li      $v0, 0x00FA
    beqz    $s0, .L80010F8C
    addiu   $v0, $s1, 0x001C
    sw      $s4, 0x0000($s0)
    lw      $a0, 0x000C($s7)
    sw      $a0, 0x0004($s0)
    lbu     $v1, 0x0000($v1)
    andi    $v1, $v1, 0x0010
    sh      $v1, 0x0014($s0)
    lbu     $v1, 0x0015($s1)
    lbu     $a0, 0x0014($s1)
    sll     $v1, $v1, 8
    or      $v1, $v1, $a0
    sll     $v1, $v1, 16
    sw      $v1, 0x0008($s0)
    lbu     $a0, 0x001B($s1)
    lbu     $a1, 0x001A($s1)
    sll     $a0, $a0, 8
    or      $a0, $a0, $a1
    or      $v1, $v1, $a0
    sw      $v1, 0x0008($s0)
    lbu     $a1, 0x0001($v0)
    lbu     $v1, 0x0002($v0)
    lbu     $a0, 0x001C($s1)
    lbu     $v0, 0x0003($v0)
    sll     $a1, $a1, 8
    sll     $v1, $v1, 16
    or      $v1, $a1, $v1
    or      $v1, $v1, $a0
    sll     $v0, $v0, 24
    or      $v0, $v1, $v0
    srl     $v1, $v0, 9
    andi    $a0, $v0, 0x01FF
    sw      $v0, 0x000C($s0)
    beqz    $a0, .L80010F8C
    sw      $v1, 0x0010($s0)
    addiu   $v1, $v1, 0x0001
    sw      $v1, 0x0010($s0)
.L80010F8C:
    beqz    $s8, .L80010FD4
    ld      $ra, 0x0068($sp)
    lbu     $v0, 0x0000($s2)
    bnez    $v0, .L80010FD4
    li      $a1, 0x0008
.L80010FA0:
    addu    $v1, $s1, $v0
    lbu     $a0, 0x0000($v1)
    addu    $v1, $s2, $v0
    addiu   $v0, $v0, 0x0001
    bne     $v0, $a1, .L80010FA0
    sb      $a0, 0x0000($v1)
    jal     os_80015488
    addiu   $a0, $s2, 0x0007
    lbu     $a0, 0x0008($s1)
    li      $v1, 0x0020
    bne     $a0, $v1, .L8001100C
    li      $v1, 0x002E
.L80010FD0:
    ld      $ra, 0x0068($sp)
.L80010FD4:
    daddu   $v0, $s3, $0
    ld      $s8, 0x0060($sp)
    ld      $s7, 0x0058($sp)
    ld      $s6, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0070
.L80011004:
    j       .L80010DFC
    daddu   $s8, $0, $0
.L8001100C:
    sb      $v1, 0x0000($v0)
    lbu     $v1, 0x0008($s1)
    addiu   $a0, $v0, 0x0003
    sb      $v1, 0x0001($v0)
    lbu     $v1, 0x0009($s1)
    sb      $v1, 0x0002($v0)
    lbu     $v1, 0x000A($s1)
    jal     os_80015488
    sb      $v1, 0x0003($v0)
    j       .L80010EB8
    daddu   $v0, $0, $0

.globl fat_os_80011038
fat_os_80011038:
    addiu   $sp, $sp, -0x7FF0
    lui     $v0, %hi(_80079D58)
    sd      $s3, 0x7FC0($sp)
    lhu     $s3, %lo(_80079D58)($v0)
    sd      $ra, 0x7FE8($sp)
    sltiu   $v1, $s3, 0x0002
    sd      $s7, 0x7FE0($sp)
    sd      $s6, 0x7FD8($sp)
    sd      $s5, 0x7FD0($sp)
    sd      $s4, 0x7FC8($sp)
    sd      $s2, 0x7FB8($sp)
    sd      $s1, 0x7FB0($sp)
    sd      $s0, 0x7FA8($sp)
    daddu   $v0, $0, $0
    bnez    $v1, .L800110FC
    addiu   $sp, $sp, -0x1198
    addiu   $s7, $sp, 0x0038
    addiu   $s0, $sp, 0x1038
    daddu   $s2, $s7, $0
    daddu   $s1, $0, $0
    lui     $s5, %hi(_8005291C)
    addiu   $s4, $sp, 0x0020
    j       .L800110D0
    li      $s6, 0x0031
.L80011098:
    lhu     $v1, 0x0034($sp)
    sb      $0, 0x001F($s0)
    sltu    $v1, $0, $v1
    subu    $v1, $s6, $v1
    sb      $v1, 0x0000($s0)
    li      $v1, 0x9138
    addu    $v1, $v1, $sp
    jal     os_800153E8
    sd      $v0, 0x0000($v1)
    slt     $v1, $s1, $s3
    sw      $s0, 0x0000($s2)
    addiu   $s0, $s0, 0x0020
    beqz    $v1, .L80011130
    addiu   $s2, $s2, 0x0004
.L800110D0:
    lw      $v1, %lo(_8005291C)($s5)
    sll     $v0, $s1, 2
    addu    $v0, $v1, $v0
    lw      $a0, 0x0000($v0)
    daddu   $a1, $s4, $0
    jal     fat_os_80010DA0
    addiu   $a2, $s0, 0x0001
    addiu   $s1, $s1, 0x0001
    daddu   $a0, $s0, $0
    beqz    $v0, .L80011098
    li      $a1, 0x001F
.L800110FC:
    addiu   $sp, $sp, 0x1198
    ld      $ra, 0x7FE8($sp)
    ld      $s7, 0x7FE0($sp)
    ld      $s6, 0x7FD8($sp)
    ld      $s5, 0x7FD0($sp)
    ld      $s4, 0x7FC8($sp)
    ld      $s3, 0x7FC0($sp)
    ld      $s2, 0x7FB8($sp)
    ld      $s1, 0x7FB0($sp)
    ld      $s0, 0x7FA8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0
    nop
.L80011130:
    daddu   $a0, $s3, $0
    jal     fat_os_8000FA28
    daddu   $a1, $s7, $0
    li      $a0, 0x9138
    addu    $a0, $a0, $sp
    addiu   $sp, $sp, 0x1198
    ld      $ra, 0x7FE8($sp)
    ld      $v0, 0x0000($a0)
    ld      $s7, 0x7FE0($sp)
    ld      $s6, 0x7FD8($sp)
    ld      $s5, 0x7FD0($sp)
    ld      $s4, 0x7FC8($sp)
    ld      $s3, 0x7FC0($sp)
    ld      $s2, 0x7FB8($sp)
    ld      $s1, 0x7FB0($sp)
    ld      $s0, 0x7FA8($sp)
    jr      $ra
    addiu   $sp, $sp, 0x7FF0

.globl fat_os_80011178
fat_os_80011178:
    addiu   $sp, $sp, -0x0050
    sd      $s0, 0x0040($sp)
    daddu   $a2, $0, $0
    daddu   $s0, $a1, $0
    addiu   $a1, $sp, 0x0028
    sd      $ra, 0x0048($sp)
    jal     fat_os_80010DA0
    sw      $0, 0x0020($sp)
    bnez    $v0, .L80011280
    lw      $v1, 0x0038($sp)
    sltu    $a0, $v1, $s0
    beqz    $a0, .L80011284
    ld      $ra, 0x0048($sp)
    lui     $v0, %hi(_80079D3A)
    lbu     $v0, %lo(_80079D3A)($v0)
    divu    $0, $v1, $v0
    teq     $v0, $0, 7
    mfhi    $v1
    sltu    $v1, $0, $v1
    mflo    $a0
    addu    $a0, $a0, $v1
    nop
    divu    $0, $s0, $v0
    teq     $v0, $0, 7
    mfhi    $v0
    sltu    $v0, $0, $v0
    mflo    $a2
    addu    $a2, $a2, $v0
    subu    $a2, $a2, $a0
    beqz    $a2, .L8001120C
    lbu     $a3, 0x003D($sp)
    lw      $a0, 0x0030($sp)
    andi    $a2, $a2, 0xFFFF
    jal     fat_os_800103E8
    addiu   $a1, $sp, 0x0020
    bnez    $v0, .L80011284
    ld      $ra, 0x0048($sp)
.L8001120C:
    jal     fat_os_80010D38
    lw      $a0, 0x002C($sp)
    bnez    $v0, .L80011280
    li      $a0, 0x0001
    lui     $v1, %hi(_80079D24+1)
    sb      $a0, %lo(_80079D24+1)($v1)
    lw      $a0, 0x0030($sp)
    lui     $v1, %hi(_80079D70)
    bnez    $a0, .L80011258
    lw      $v1, %lo(_80079D70)($v1)
    lhu     $a0, 0x0020($sp)
    sb      $a0, 0x0014($v1)
    lbu     $a0, 0x0020($sp)
    sb      $a0, 0x0015($v1)
    lw      $a0, 0x0020($sp)
    sb      $a0, 0x001A($v1)
    lw      $a0, 0x0020($sp)
    srl     $a0, $a0, 8
    sb      $a0, 0x001B($v1)
.L80011258:
    lhu     $a0, 0x003C($sp)
    bnez    $a0, .L80011280
    sll     $s0, $s0, 9
    srl     $a1, $s0, 24
    srl     $a0, $s0, 8
    srl     $s0, $s0, 16
    sb      $a1, 0x001F($v1)
    sb      $a0, 0x001D($v1)
    sb      $s0, 0x001E($v1)
    sb      $0, 0x001C($v1)
.L80011280:
    ld      $ra, 0x0048($sp)
.L80011284:
    ld      $s0, 0x0040($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050

.globl fat_os_80011290
fat_os_80011290:
    addiu   $sp, $sp, -0x0058
    sd      $s0, 0x0038($sp)
    daddu   $a2, $0, $0
    andi    $s0, $a1, 0xFFFF
    addiu   $a1, $sp, 0x0020
    sd      $s1, 0x0040($sp)
    sd      $ra, 0x0050($sp)
    sd      $s2, 0x0048($sp)
    jal     fat_os_80010DA0
    daddu   $s1, $a0, $0
    bnez    $v0, .L80011314
    lhu     $v1, 0x0034($sp)
    bnez    $v1, .L80011330
    lui     $a0, %hi(_80079D28)
    addiu   $a0, %lo(_80079D28)
    lw      $v1, 0x0028($sp)
    lbu     $a3, 0x0012($a0)
    addiu   $a1, $v1, -0x0002
    mult    $a3, $a1
    lw      $a2, 0x0004($a0)
    lui     $a1, %hi(_80079D78)
    addiu   $s2, $a1, %lo(_80079D78)
    lw      $a0, 0x0030($sp)
    sw      $v1, %lo(_80079D78)($a1)
    mflo    $a3
    sb      $0, 0x0008($s2)
    addu    $a3, $a3, $a2
    sw      $a3, 0x0004($s2)
    lw      $a3, 0x0020($sp)
    sltu    $a2, $a0, $s0
    sw      $a3, 0x0010($s2)
    bnez    $a2, .L80011350
    sw      $a0, 0x000C($s2)
.L80011314:
    ld      $ra, 0x0050($sp)
.L80011318:
    ld      $s2, 0x0048($sp)
    ld      $s1, 0x0040($sp)
    ld      $s0, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
    nop
.L80011330:
    ld      $ra, 0x0050($sp)
    li      $v0, 0x00F5
    ld      $s2, 0x0048($sp)
    ld      $s1, 0x0040($sp)
    ld      $s0, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
    nop
.L80011350:
    daddu   $a0, $s1, $0
    jal     fat_os_80011178
    daddu   $a1, $s0, $0
    bnez    $v0, .L80011318
    ld      $ra, 0x0050($sp)
    jal     fat_os_800108F0
    nop
    beqzl   $v0, .L80011314
    sw      $s0, 0x000C($s2)
    j       .L80011318
    ld      $ra, 0x0050($sp)
    nop

.globl fat_os_80011380
fat_os_80011380:
    lw      $a0, 0x0004($a0)
    j       fat_os_80011290
    andi    $a1, $a1, 0xFFFF
    nop

.globl fat_os_80011390
fat_os_80011390:
    j       fat_os_80010DA0
    addiu   $a2, $a1, 0x0018

.globl fat_os_80011398
fat_os_80011398:
    addiu   $sp, $sp, -0x0050
    sd      $s1, 0x0040($sp)
    lui     $s1, %hi(_80079D40)
    sd      $s0, 0x0038($sp)
    sltiu   $v1, $a0, 0x0003
    addiu   $s0, $s1, %lo(_80079D40)
    sd      $ra, 0x0048($sp)
    sh      $0, 0x0018($s0)
    sw      $a0, 0x000C($s0)
    beqz    $v1, .L80011418
    sb      $0, 0x001A($s0)
.L800113C4:
    lui     $v1, %hi(_80079D28)
    sw      $0, 0x0010($s0)
    addiu   $v1, %lo(_80079D28)
    daddu   $a1, $0, $0
    li      $v0, 0x0002
    lw      $a0, 0x0004($v1)
.L800113DC:
    sw      $v0, %lo(_80079D40)($s1)
    addu    $v1, $a1, $a0
    sll     $v0, $v1, 4
    ori     $a0, $v0, 0x0001
    sw      $v0, 0x0014($s0)
    sw      $a0, 0x0010($s0)
    sw      $v1, 0x0004($s0)
    sb      $0, 0x0008($s0)
    daddu   $v0, $0, $0
.L80011400:
    ld      $ra, 0x0048($sp)
    ld      $s1, 0x0040($sp)
    ld      $s0, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
    nop
.L80011418:
    addiu   $a1, $sp, 0x0020
    jal     fat_os_80010DA0
    daddu   $a2, $0, $0
    bnez    $v0, .L80011400
    lhu     $v1, 0x0034($sp)
    beqz    $v1, .L80011400
    li      $v0, 0x00F6
    lw      $v0, 0x0028($sp)
    sltiu   $v1, $v0, 0x0003
    bnez    $v1, .L800113C4
    lui     $v1, %hi(_80079D28)
    addiu   $v1, %lo(_80079D28)
    lbu     $a1, 0x0012($v1)
    addiu   $a0, $v0, -0x0002
    mult    $a1, $a0
    mflo    $a1
    j       .L800113DC
    lw      $a0, 0x0004($v1)

.globl fat_os_80011460
fat_os_80011460:
    addiu   $sp, $sp, -0x0070
    sd      $ra, 0x0068($sp)
    sd      $s8, 0x0060($sp)
    sd      $s7, 0x0058($sp)
    sd      $s6, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s4, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    jal     fat_os_80011398
    sd      $s0, 0x0020($sp)
    bnez    $v0, .L80011570
    lui     $s3, %hi(_80079D40)
    addiu   $s3, %lo(_80079D40)
    lw      $a0, 0x0004($s3)
    daddu   $s0, $0, $0
    sll     $s6, $a0, 4
    li      $s1, 0x00E5
    li      $s4, 0x002E
    li      $s5, 0x000F
    li      $s7, 0x0400
    li      $s8, 0x0040
    li      $s2, 0x0010
.L800114C0:
    jal     fat_os_80010850
    nop
    bnez    $v0, .L80011574
    ld      $ra, 0x0068($sp)
    lui     $v0, %hi(_80052924)
    lw      $a0, %lo(_80052924)($v0)
    lui     $v1, %hi(_8005291C)
    lw      $a3, %lo(_8005291C)($v1)
    lbu     $v1, 0x0000($a0)
    daddu   $v0, $0, $0
    beqz    $v1, .L80011564
    andi    $a2, $v0, 0x00FF
.L800114F0:
    beql    $v1, $s1, .L80011548
    daddu   $s0, $0, $0
    beql    $v1, $s4, .L80011548
    daddu   $s0, $0, $0
    lbu     $a1, 0x000B($a0)
    beq     $a1, $s5, .L800115A0
    andi    $a1, $a1, 0x000A
    bnezl   $a1, .L80011548
    daddu   $s0, $0, $0
    bnezl   $s0, .L80011534
    lhu     $v1, 0x0018($s3)
    lhu     $v1, 0x0018($s3)
    or      $a1, $s6, $v0
    sll     $v1, $v1, 2
    addu    $v1, $a3, $v1
    sw      $a1, 0x0000($v1)
    lhu     $v1, 0x0018($s3)
.L80011534:
    addiu   $v1, $v1, 0x0001
    andi    $v1, $v1, 0xFFFF
    beq     $v1, $s7, .L80011638
    sh      $v1, 0x0018($s3)
    daddu   $s0, $0, $0
.L80011548:
    addiu   $v0, $v0, 0x0001
.L8001154C:
    beql    $v0, $s2, .L800115D0
    lbu     $v0, 0x0008($s3)
.L80011554:
    addiu   $a0, $a0, 0x0020
    lbu     $v1, 0x0000($a0)
    bnez    $v1, .L800114F0
    andi    $a2, $v0, 0x00FF
.L80011564:
    or      $s6, $a2, $s6
    sw      $s6, 0x0014($s3)
    daddu   $v0, $0, $0
.L80011570:
    ld      $ra, 0x0068($sp)
.L80011574:
    ld      $s8, 0x0060($sp)
    ld      $s7, 0x0058($sp)
    ld      $s6, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0070
.L800115A0:
    andi    $v1, $v1, 0x00F0
    bnel    $v1, $s8, .L8001154C
    addiu   $v0, $v0, 0x0001
    lhu     $v1, 0x0018($s3)
    or      $a1, $s6, $v0
    sll     $v1, $v1, 2
    addu    $v1, $a3, $v1
    addiu   $v0, $v0, 0x0001
    sw      $a1, 0x0000($v1)
    bne     $v0, $s2, .L80011554
    li      $s0, 0x0001
    lbu     $v0, 0x0008($s3)
.L800115D0:
    lui     $a1, %hi(_80079D28)
    lw      $a0, 0x0004($s3)
    addiu   $a1, %lo(_80079D28)
    addiu   $v0, $v0, 0x0001
    lbu     $v1, 0x0012($a1)
    andi    $v0, $v0, 0x00FF
    addiu   $a0, $a0, 0x0001
    sw      $a0, 0x0004($s3)
    sb      $v0, 0x0008($s3)
    beq     $v1, $v0, .L80011604
    addiu   $s6, $s6, 0x0010
    j       .L800114C0
    lw      $a0, 0x0004($s3)
.L80011604:
    lui     $a0, %hi(_80079D40)
    jal     fat_os_80010190
    addiu   $a0, %lo(_80079D40)
    li      $v1, 0x00F3
    beq     $v0, $v1, .L80011650
    lui     $v1, %hi(_80079D40)
    bnez    $v0, .L80011570
    lui     $a1, %hi(_80079D40)
    addiu   $a1, %lo(_80079D40)
    lw      $s6, 0x0004($a1)
    lw      $a0, 0x0004($s3)
    j       .L800114C0
    sll     $s6, $s6, 4
.L80011638:
    lui     $a1, %hi(_80079D40)
    or      $a2, $a2, $s6
    addiu   $a1, %lo(_80079D40)
    sw      $a2, 0x0014($a1)
    j       .L80011570
    daddu   $v0, $0, $0
.L80011650:
    li      $v0, 0x0001
    addiu   $v1, %lo(_80079D40)
    sb      $v0, 0x001A($v1)
    j       .L80011570
    daddu   $v0, $0, $0
    nop

.globl fat_os_80011668
fat_os_80011668:
    addiu   $sp, $sp, -0x0150
    sd      $s4, 0x0120($sp)
    sd      $s2, 0x0110($sp)
    sd      $ra, 0x0148($sp)
    sd      $s8, 0x0140($sp)
    sd      $s7, 0x0138($sp)
    sd      $s6, 0x0130($sp)
    sd      $s5, 0x0128($sp)
    sd      $s3, 0x0118($sp)
    sd      $s1, 0x0108($sp)
    sd      $s0, 0x0100($sp)
    lbu     $v0, 0x0000($a0)
    daddu   $s4, $a0, $0
    sw      $a1, 0x0158($sp)
    beqz    $v0, .L800117F0
    li      $s2, 0x00FB
    lw      $v0, 0x0158($sp)
    lui     $s7, %hi(_80079D40)
    sw      $0, 0x0000($v0)
    lbu     $v1, 0x0000($a0)
    li      $v0, 0x002F
    addiu   $s7, %lo(_80079D40)
    daddu   $a0, $0, $0
    addiu   $s5, $sp, 0x0038
    beq     $v1, $v0, .L800117C8
    addiu   $s6, $sp, 0x0020
    daddu   $s1, $0, $0
.L800116D4:
    bnez    $v1, .L800116F0
    daddu   $s3, $s4, $0
    j       .L80011708
    nop
    nop
.L800116E8:
    beq     $v0, $v1, .L80011708
    nop
.L800116F0:
    addiu   $s1, $s1, 0x0001
    andi    $s1, $s1, 0x00FF
    addu    $s3, $s4, $s1
    lbu     $v0, 0x0000($s3)
    bnez    $v0, .L800116E8
    li      $v1, 0x002F
.L80011708:
    jal     fat_os_80011460
    nop
    bnez    $v0, .L800117F0
    daddu   $s2, $v0, $0
    lhu     $v0, 0x0018($s7)
    beqz    $v0, .L800117DC
    daddu   $s0, $0, $0
    j       .L80011744
    addu    $s8, $s6, $s1
    nop
.L80011730:
    lhu     $v0, 0x0018($s7)
    andi    $s0, $s0, 0xFFFF
    sltu    $v1, $s0, $v0
    beqzl   $v1, .L800117AC
    lbu     $v1, 0x0000($s3)
.L80011744:
    lui     $v0, %hi(_8005291C)
    lw      $v1, %lo(_8005291C)($v0)
    sll     $v0, $s0, 2
    addu    $v0, $v1, $v0
    lw      $a0, 0x0000($v0)
    daddu   $a1, $s6, $0
    jal     fat_os_80010DA0
    daddu   $a2, $s5, $0
    bnez    $v0, .L800117F0
    daddu   $s2, $v0, $0
    lbu     $v0, 0x0018($s8)
    bnezl   $v0, .L80011730
    addiu   $s0, $s0, 0x0001
    daddu   $a0, $s4, $0
    daddu   $a1, $s5, $0
    jal     os_80014F00
    daddu   $a2, $s1, $0
    beqzl   $v0, .L80011730
    addiu   $s0, $s0, 0x0001
    lw      $v1, 0x0158($sp)
    lw      $v0, 0x0020($sp)
    sw      $v0, 0x0000($v1)
    lbu     $v1, 0x0000($s3)
    beqz    $v1, .L800117F4
    ld      $ra, 0x0148($sp)
    lhu     $v0, 0x0018($s7)
.L800117AC:
    beq     $v0, $s0, .L800117E0
    lw      $v0, 0x0158($sp)
    daddu   $s4, $s3, $0
    lw      $a0, 0x0000($v0)
.L800117BC:
    li      $v0, 0x002F
    bnel    $v1, $v0, .L800116D4
    daddu   $s1, $0, $0
.L800117C8:
    lw      $v0, 0x0158($sp)
    addiu   $s4, $s4, 0x0001
    lbu     $v1, 0x0000($s4)
    j       .L800117BC
    lw      $a0, 0x0000($v0)
.L800117DC:
    lbu     $v1, 0x0000($s3)
.L800117E0:
    beqz    $v1, .L800117F0
    li      $s2, 0x00F0
    li      $s2, 0x00F7
    nop
.L800117F0:
    ld      $ra, 0x0148($sp)
.L800117F4:
    daddu   $v0, $s2, $0
    ld      $s8, 0x0140($sp)
    ld      $s7, 0x0138($sp)
    ld      $s6, 0x0130($sp)
    ld      $s5, 0x0128($sp)
    ld      $s4, 0x0120($sp)
    ld      $s3, 0x0118($sp)
    ld      $s2, 0x0110($sp)
    ld      $s1, 0x0108($sp)
    ld      $s0, 0x0100($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0150
    nop

.globl fat_os_80011828
fat_os_80011828:
    addiu   $sp, $sp, -0x0088
    sd      $s1, 0x0040($sp)
    lui     $s1, %hi(_80079D40)
    sd      $s0, 0x0038($sp)
    addiu   $s0, $s1, %lo(_80079D40)
    sd      $s8, 0x0078($sp)
    sd      $s7, 0x0070($sp)
    sd      $s6, 0x0068($sp)
    sd      $s4, 0x0058($sp)
    sd      $s3, 0x0050($sp)
    sd      $s2, 0x0048($sp)
    sd      $ra, 0x0080($sp)
    sd      $s5, 0x0060($sp)
    daddu   $s2, $a0, $0
    daddu   $s8, $a1, $0
    andi    $s7, $a2, 0x00FF
    addiu   $s3, $sp, 0x0020
    li      $s4, 0x00F0
    daddu   $s6, $s0, $0
    daddu   $a1, $s3, $0
.L80011878:
    jal     fat_os_80011668
    daddu   $a0, $s2, $0
    daddu   $a1, $0, $0
    li      $a2, 0x0001
    beqz    $v0, .L800118F8
    li      $a3, 0x0001
    bne     $v0, $s4, .L800118C8
    ld      $ra, 0x0080($sp)
    lhu     $v0, 0x0018($s0)
    sltiu   $v0, $v0, 0x0400
    beqz    $v0, .L80011900
    daddu   $s5, $s0, $0
    lbu     $v0, 0x001A($s0)
    beqz    $v0, .L80011908
    nop
    jal     fat_os_800103E8
    lw      $a0, %lo(_80079D40)($s1)
    beqz    $v0, .L80011878
    daddu   $a1, $s3, $0
.L800118C4:
    ld      $ra, 0x0080($sp)
.L800118C8:
    ld      $s8, 0x0078($sp)
.L800118CC:
    ld      $s7, 0x0070($sp)
    ld      $s6, 0x0068($sp)
    ld      $s5, 0x0060($sp)
    ld      $s4, 0x0058($sp)
    ld      $s3, 0x0050($sp)
    ld      $s2, 0x0048($sp)
    ld      $s1, 0x0040($sp)
    ld      $s0, 0x0038($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0088
    nop
.L800118F8:
    j       .L800118C4
    li      $v0, 0x00F1
.L80011900:
    j       .L800118C4
    li      $v0, 0x00F2
.L80011908:
    jal     fat_os_80010D38
    lw      $a0, 0x0014($s6)
    bnez    $v0, .L800118C8
    ld      $ra, 0x0080($sp)
    jal     os_80015058
    daddu   $a0, $s2, $0
    daddu   $s1, $v0, $0
    bnez    $s7, .L80011930
    li      $s3, 0x0010
    li      $s3, 0x0020
.L80011930:
    addiu   $s0, $sp, 0x0028
    daddu   $a0, $s1, $0
    jal     fat_os_8000FB78
    daddu   $a1, $s0, $0
    daddu   $a1, $v0, $0
    jal     fat_os_80010B48
    daddu   $a0, $s1, $0
    bnez    $v0, .L800118C8
    ld      $ra, 0x0080($sp)
    daddu   $a1, $s3, $0
    daddu   $a0, $s0, $0
    jal     fat_os_80010A80
    daddu   $a2, $0, $0
    bnez    $v0, .L800118C8
    ld      $ra, 0x0080($sp)
    lui     $v0, %hi(_80079D70)
    lw      $a0, %lo(_80079D70)($v0)
    li      $v1, 0x0001
    lui     $v0, %hi(_80079D24+1)
    daddu   $a1, $0, $0
    li      $a2, 0x0020
    jal     os_80014778
    sb      $v1, %lo(_80079D24+1)($v0)
    beqz    $s7, .L8001199C
    daddu   $a0, $s2, $0
    lui     $v0, %hi(_80079D3A)
    lbu     $s8, %lo(_80079D3A)($v0)
.L8001199C:
    jal     fat_os_80011668
    addiu   $a1, $sp, 0x0024
    bnez    $v0, .L800118C8
    ld      $ra, 0x0080($sp)
    bnez    $s8, .L80011A6C
    lw      $a0, 0x0024($sp)
.L800119B4:
    beqz    $s7, .L80011A5C
    li      $a1, 0x0020
    daddu   $a0, $s0, $0
    jal     os_80014778
    li      $a2, 0x000B
    jal     fat_os_80011398
    lw      $a0, 0x0020($sp)
    bnez    $v0, .L800118C4
    li      $v1, 0x0002
    lui     $v0, %hi(_80079D40)
    lw      $v0, %lo(_80079D40)($v0)
    bne     $v0, $v1, .L800119EC
    sw      $v0, 0x0020($sp)
    sw      $0, 0x0020($sp)
.L800119EC:
    jal     fat_os_80011398
    lw      $a0, 0x0024($sp)
    bnez    $v0, .L800118C8
    ld      $ra, 0x0080($sp)
    jal     fat_os_80010D38
    lw      $a0, 0x0014($s5)
    bnez    $v0, .L800118C8
    ld      $ra, 0x0080($sp)
    lui     $v0, %hi(_80079D40)
    lw      $a2, %lo(_80079D40)($v0)
    li      $s1, 0x002E
    daddu   $a0, $s0, $0
    li      $a1, 0x0010
    jal     fat_os_80010A80
    sb      $s1, 0x0028($sp)
    bnez    $v0, .L800118C8
    ld      $ra, 0x0080($sp)
    lw      $a2, 0x0020($sp)
    daddu   $a0, $s0, $0
    li      $a1, 0x0010
    jal     fat_os_80010A80
    sb      $s1, 0x0029($sp)
    bnez    $v0, .L800118C8
    ld      $ra, 0x0080($sp)
    jal     fat_os_80011460
    lw      $a0, 0x0024($sp)
    bnezl   $v0, .L800118C8
    ld      $ra, 0x0080($sp)
.L80011A5C:
    jal     fat_os_800108F0
    nop
    j       .L800118C8
    ld      $ra, 0x0080($sp)
.L80011A6C:
    jal     fat_os_80011178
    daddu   $a1, $s8, $0
    beqz    $v0, .L800119B4
    ld      $ra, 0x0080($sp)
    j       .L800118CC
    ld      $s8, 0x0078($sp)
    nop
    addiu   $sp, $sp, -0x0028
    daddu   $a1, $0, $0
    sd      $ra, 0x0020($sp)
    jal     fat_os_80011828
    li      $a2, 0x0001
    xori    $v1, $v0, 0x00F1
    sltu    $v1, $0, $v1
    ld      $ra, 0x0020($sp)
    subu    $v1, $0, $v1
    and     $v0, $v0, $v1
    jr      $ra
    addiu   $sp, $sp, 0x0028

.globl fat_os_80011AB8
fat_os_80011AB8:
    addiu   $sp, $sp, -0x0048
    sd      $s2, 0x0038($sp)
    sd      $s1, 0x0030($sp)
    sd      $s0, 0x0028($sp)
    sd      $ra, 0x0040($sp)
    lbu     $v0, 0x0000($a0)
    addiu   $s1, $sp, 0x0020
    xori    $v0, $v0, 0x002F
    sltiu   $v0, $v0, 0x0001
    addu    $s0, $a0, $v0
    andi    $s2, $a1, 0xFFFF
    daddu   $a0, $s0, $0
    jal     fat_os_80011668
    daddu   $a1, $s1, $0
    li      $v1, 0x00F0
    beq     $v0, $v1, .L80011B40
    nop
    beqz    $v0, .L80011B20
    lw      $a0, 0x0020($sp)
    ld      $ra, 0x0040($sp)
.L80011B08:
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048
    nop
.L80011B20:
    jal     fat_os_80011290
    daddu   $a1, $s2, $0
    ld      $ra, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048
.L80011B40:
    beqz    $s2, .L80011B08
    ld      $ra, 0x0040($sp)
    daddu   $a0, $s0, $0
    daddu   $a1, $s2, $0
    jal     fat_os_80011828
    daddu   $a2, $0, $0
    bnez    $v0, .L80011B08
    ld      $ra, 0x0040($sp)
    daddu   $a0, $s0, $0
    jal     fat_os_80011668
    daddu   $a1, $s1, $0
    bnez    $v0, .L80011B08
    ld      $ra, 0x0040($sp)
    j       .L80011B20
    lw      $a0, 0x0020($sp)
    nop

.globl fat_os_80011B80
fat_os_80011B80:
    addiu   $sp, $sp, -0x0050
    sd      $s3, 0x0040($sp)
    sd      $s1, 0x0030($sp)
    sd      $s0, 0x0028($sp)
    sd      $ra, 0x0048($sp)
    sd      $s2, 0x0038($sp)
    lbu     $v0, 0x0000($a1)
    daddu   $s0, $a1, $0
    daddu   $s1, $a0, $0
    beqz    $v0, .L80011BB8
    andi    $s3, $a3, 0xFFFF
    lbu     $v0, 0x0000($a0)
    bnez    $v0, .L80011BD8
    li      $a0, 0x0140
.L80011BB8:
    ld      $ra, 0x0048($sp)
    li      $v0, 0x00FB
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
.L80011BD8:
    jal     os_80014718
    sd      $a2, 0x0020($sp)
    ld      $a2, 0x0020($sp)
    daddu   $s2, $v0, $0
    lbu     $v0, 0x0000($a2)
    daddu   $a0, $s1, $0
    xori    $v0, $v0, 0x002E
    sltiu   $v0, $v0, 0x0001
    addu    $a2, $a2, $v0
    daddu   $a1, $s2, $0
    jal     os_80015098
    sd      $a2, 0x0020($sp)
    lui     $a1, %hi(__str_80050738)
    daddu   $a0, $s2, $0
    jal     os_800152B0
    addiu   $a1, %lo(__str_80050738)
    daddu   $a0, $s2, $0
    jal     os_800152B0
    daddu   $a1, $s0, $0
    jal     os_80015448
    daddu   $a0, $s2, $0
    lbu     $v1, 0x0000($v0)
    bnez    $v1, .L80011C44
    ld      $a2, 0x0020($sp)
    li      $v1, 0x002E
    sb      $v1, 0x0000($v0)
    addiu   $v0, $v0, 0x0001
.L80011C44:
    daddu   $a1, $a2, $0
    daddu   $a0, $v0, $0
    jal     os_800152B0
    sb      $0, 0x0000($v0)
    daddu   $a0, $s2, $0
    jal     fat_os_80011AB8
    daddu   $a1, $s3, $0
    li      $a0, 0x0140
    jal     os_800145E0
    sd      $v0, 0x0020($sp)
    ld      $ra, 0x0048($sp)
    ld      $v0, 0x0020($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
    nop

.globl fat_os_80011C90
fat_os_80011C90:
    addiu   $sp, $sp, -0x0038
    addiu   $t0, $a0, 0x0200
    sd      $s1, 0x0028($sp)
    lui     $v1, %hi(_80052920)
    lui     $s1, %hi(_80079D18)
    daddu   $v0, $a0, $0
    addiu   $a3, $a0, 0x0400
    sw      $t0, %lo(_80052920)($v1)
    addiu   $a0, $s1, %lo(_80079D18)
    lui     $v1, %hi(_8005291C)
    sd      $s0, 0x0020($sp)
    li      $a1, 0x00FF
    li      $a2, 0x0010
    lui     $s0, %hi(_80052924)
    sw      $a3, %lo(_8005291C)($v1)
    addiu   $s1, %lo(_80079D18)
    sd      $ra, 0x0030($sp)
    jal     os_80014778
    sw      $v0, %lo(_80052924)($s0)
    lui     $v1, 0x0FFFFFFF >> 16
    ori     $v1, 0x0FFFFFFF & 0xFFFF
    lui     $v0, %hi(_80079D4C)
    daddu   $a0, $0, $0
    sb      $0, 0x000D($s1)
    sw      $0, 0x0008($s1)
    sb      $0, 0x000C($s1)
    jal     fat_os_80010850
    sw      $v1, %lo(_80079D4C)($v0)
    daddu   $v1, $v0, $0
    bnez    $v1, .L80011D28
    ld      $ra, 0x0030($sp)
    lw      $a0, %lo(_80052924)($s0)
    li      $v0, 0x0055
    lbu     $v1, 0x01FE($a0)
    beql    $v1, $v0, .L80011D38
    lbu     $v1, 0x01FF($a0)
    li      $v0, 0x00F8
.L80011D24:
    ld      $ra, 0x0030($sp)
.L80011D28:
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
.L80011D38:
    li      $v0, 0x00AA
    bne     $v1, $v0, .L80011D24
    li      $v0, 0x00F8
    lbu     $v1, 0x0000($a0)
    li      $v0, 0x00EB
    beql    $v1, $v0, .L80011E88
    lbu     $v1, 0x0002($a0)
.L80011D54:
    lbu     $v0, 0x01C2($a0)
    addiu   $v0, $v0, -0x000B
    andi    $v0, $v0, 0x00FF
    sltiu   $v0, $v0, 0x0002
    beqz    $v0, .L80011D24
    li      $v0, 0x00F8
    addiu   $v0, $a0, 0x01C6
    lbu     $s1, 0x0001($v0)
    lbu     $a1, 0x0002($v0)
    lbu     $v1, 0x01C6($a0)
    sll     $s1, $s1, 8
    sll     $a1, $a1, 16
    lbu     $v0, 0x0003($v0)
    or      $s1, $s1, $a1
    or      $s1, $s1, $v1
    sll     $v0, $v0, 24
    or      $s1, $s1, $v0
    jal     fat_os_80010850
    daddu   $a0, $s1, $0
    bnez    $v0, .L80011D28
    ld      $ra, 0x0030($sp)
    lw      $a0, %lo(_80052924)($s0)
    lbu     $v0, 0x0016($a0)
.L80011DB0:
    bnez    $v0, .L80011D24
    li      $v0, 0x00F8
    lui     $a1, %hi(__str_80051360)
    addiu   $a0, $a0, 0x0052
    addiu   $a1, %lo(__str_80051360)
    jal     os_80014E10
    li      $a2, 0x0003
    beqzl   $v0, .L80011E9C
    lw      $a0, %lo(_80052924)($s0)
    lw      $v0, %lo(_80052924)($s0)
.L80011DD8:
    li      $a1, 0x0400
    lbu     $v1, 0x000D($v0)
    lui     $a0, %hi(_80079D28)
    div     $0, $a1, $v1
    teq     $v1, $0, 7
    addiu   $a2, $a0, %lo(_80079D28)
    sb      $v1, 0x0012($a2)
    addiu   $v1, $v0, 0x0020
    lbu     $t0, 0x0001($v1)
    lbu     $a1, 0x0002($v1)
    lbu     $a3, 0x0020($v0)
    lbu     $v1, 0x0003($v1)
    sll     $t0, $t0, 8
    sll     $a1, $a1, 16
    or      $a1, $t0, $a1
    or      $a1, $a1, $a3
    sll     $v1, $v1, 24
    or      $v1, $a1, $v1
    lbu     $t0, 0x000F($v0)
    lbu     $a1, 0x000E($v0)
    sw      $v1, 0x000C($a2)
    addiu   $v1, $v0, 0x0024
    lbu     $a3, 0x0001($v1)
    lbu     $t2, 0x0002($v1)
    lbu     $t1, 0x0024($v0)
    sll     $a3, $a3, 8
    lbu     $v0, 0x0003($v1)
    sll     $v1, $t2, 16
    or      $a3, $a3, $v1
    or      $a3, $a3, $t1
    sll     $v1, $t0, 8
    sll     $v0, $v0, 24
    or      $v0, $a3, $v0
    or      $v1, $v1, $a1
    addu    $s1, $s1, $v1
    sll     $v1, $v0, 1
    addu    $v1, $s1, $v1
    sw      $v1, 0x0004($a2)
    sw      $v0, 0x0008($a2)
    sw      $s1, %lo(_80079D28)($a0)
    daddu   $v0, $0, $0
    mflo    $v1
    j       .L80011D24
    sh      $v1, 0x0010($a2)
.L80011E88:
    li      $v0, 0x0090
    bne     $v1, $v0, .L80011D54
    daddu   $s1, $0, $0
    j       .L80011DB0
    lbu     $v0, 0x0016($a0)
.L80011E9C:
    lui     $a1, %hi(__str_80051368)
    addiu   $a0, $a0, 0x0003
    addiu   $a1, %lo(__str_80051368)
    jal     os_80014E10
    li      $a2, 0x0005
    bnezl   $v0, .L80011DD8
    lw      $v0, %lo(_80052924)($s0)
    j       .L80011D24
    li      $v0, 0x00F8

.globl os_80011EC0
os_80011EC0:
    lui     $v0, %hi(_80052930)
    lw      $v0, %lo(_80052930)($v0)
    lhu     $v1, 0x0088($v0)
    sltiu   $a0, $v1, 0x0040
    beqz    $a0, .L80011EF8
    sll     $a1, $v1, 1
    lhu     $a2, 0x008A($v0)
    lw      $a0, 0x0094($v0)
    addu    $a1, $v0, $a1
    addiu   $v1, $v1, 0x0001
    sh      $a2, 0x0000($a1)
    sw      $a0, 0x0080($v0)
    sh      $v1, 0x0088($v0)
    sh      $0, 0x008A($v0)
.L80011EF8:
    jr      $ra
    nop

.globl os_80011F00
os_80011F00:
    lui     $v0, %hi(_8005292C)
    jr      $ra
    sw      $a0, %lo(_8005292C)($v0)
    nop

.globl os_80011F10
os_80011F10:
    addiu   $sp, $sp, -0x0030
    sd      $ra, 0x0028($sp)
    jal     os_80012E40
    sd      $a0, 0x0020($sp)
    ld      $a0, 0x0020($sp)
    jal     os_80013930
    sd      $v0, 0x0020($sp)
    ld      $v0, 0x0020($sp)
    ld      $ra, 0x0028($sp)
    daddu   $a0, $v0, $0
    j       os_80012DE0
    addiu   $sp, $sp, 0x0030

.globl os_80011F40
os_80011F40:
    lui     $v0, %hi(_8005292C)
    lw      $v0, %lo(_8005292C)($v0)
    addiu   $sp, $sp, -0x0040
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    andi    $s1, $a0, 0xFFFF
    sd      $ra, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    andi    $s0, $a1, 0xFFFF
    beqz    $v0, .L80011F70
    li      $a0, 0x1400
    li      $a0, 0x1000
.L80011F70:
    jal     os_80012B60
    lui     $s2, %hi(_80052930)
    lw      $v0, %lo(_80052930)($s2)
    lw      $v0, 0x0090($v0)
    beqzl   $v0, .L80011FB8
    lui     $a0, %hi(__str_80051370)
    jal     os_80012B60
    li      $a0, 0x3400
    lw      $v0, %lo(_80052930)($s2)
    ld      $ra, 0x0038($sp)
    lw      $a0, 0x0090($v0)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    daddu   $a1, $0, $0
    j       os_80013758
    addiu   $sp, $sp, 0x0040
    nop
.L80011FB8:
    dsll32  $s1, $s1, 0
    li      $a1, 0x0010
    dsrl32  $s1, $s1, 0
    jal     os_80013758
    addiu   $a0, %lo(__str_80051370)
    dsll    $v1, $s1, 4
    dsll    $v0, $s1, 2
    dsubu   $v0, $v1, $v0
    dsll    $v1, $v0, 4
    daddu   $v0, $v0, $v1
    dsll    $v1, $v0, 8
    daddu   $v0, $v0, $v1
    dsll    $a0, $v0, 16
    daddu   $v0, $v0, $a0
    daddu   $s1, $v0, $s1
    dsrl32  $a0, $s1, 4
    andi    $a0, $a0, 0xFFFF
    jal     os_80013308
    addiu   $a0, $a0, 0x0001
    lui     $a0, %hi(__str_8004EF58)
    jal     os_80012B70
    addiu   $a0, %lo(__str_8004EF58)
    daddu   $a0, $s0, $0
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       os_80013308
    addiu   $sp, $sp, 0x0040
    nop

.globl os_80012030
os_80012030:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0028($sp)
    jal     fat_os_8000F7C0
    sll     $s0, $a0, 16
    lui     $v1, %hi(_80052930)
    lw      $a0, %lo(_80052930)($v1)
    sra     $s0, $s0, 16
    daddu   $v1, $0, $0
    beqz    $v0, .L80012100
    lhu     $a1, 0x008A($a0)
    sltiu   $v1, $v0, 0x0015
    addiu   $v0, $v0, -0x0001
    bnez    $v1, .L80012118
    andi    $v0, $v0, 0xFFFF
    sll     $a2, $a1, 16
    sra     $a2, $a2, 16
    daddu   $v1, $a2, $0
    dsll    $t0, $v1, 3
    dsll    $a3, $v1, 1
    dsubu   $a3, $t0, $a3
    dsll    $t0, $a3, 4
    daddu   $a3, $a3, $t0
    dsll    $t0, $a3, 8
    daddu   $a3, $a3, $t0
    dsll    $t0, $a3, 16
    daddu   $a3, $a3, $t0
    daddu   $a3, $a3, $v1
    dsra32  $a3, $a3, 0
    sra     $t0, $a2, 31
    sra     $a3, $a3, 3
    subu    $a3, $a3, $t0
    sll     $v1, $s0, 4
    sll     $s0, $s0, 2
    addu    $s0, $s0, $v1
    sll     $t0, $a3, 4
    sll     $v1, $a3, 2
    addu    $v1, $v1, $t0
    addu    $s0, $a1, $s0
    subu    $v1, $a2, $v1
    sll     $s0, $s0, 16
    sra     $s0, $s0, 16
    sll     $v1, $v1, 16
    sra     $v1, $v1, 16
    slt     $a2, $v0, $s0
    bnez    $a2, .L80012140
    andi    $a3, $v1, 0xFFFF
    daddu   $v1, $s0, $0
.L800120F0:
    bltzl   $v1, .L80012170
    dsll32  $v1, $v0, 0
    sh      $v1, 0x008A($a0)
.L800120FC:
    li      $v1, 0x0002
.L80012100:
    ld      $ra, 0x0028($sp)
    daddu   $v0, $v1, $0
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
    nop
.L80012118:
    nor     $s0, $0, $s0
    sra     $s0, $s0, 31
    ld      $ra, 0x0028($sp)
    and     $v0, $v0, $s0
    li      $v1, 0x0001
    sh      $v0, 0x008A($a0)
    ld      $s0, 0x0020($sp)
    daddu   $v0, $v1, $0
    jr      $ra
    addiu   $sp, $sp, 0x0030
.L80012140:
    subu    $a1, $a1, $a3
    sll     $a1, $a1, 16
    sra     $a1, $a1, 16
    subu    $a1, $v0, $a1
    slti    $a1, $a1, 0x0014
    bnez    $a1, .L800120F0
    nop
    sll     $v1, $v0, 16
    sra     $v1, $v1, 16
    bgezl   $v1, .L800120FC
    sh      $v1, 0x008A($a0)
    dsll32  $v1, $v0, 0
.L80012170:
    dsrl32  $v1, $v1, 0
    dsll    $a2, $v1, 4
    dsll    $a1, $v1, 2
    dsubu   $a1, $a2, $a1
    dsll    $a2, $a1, 4
    daddu   $a1, $a1, $a2
    dsll    $a2, $a1, 8
    daddu   $a1, $a1, $a2
    dsll    $a2, $a1, 16
    daddu   $a1, $a1, $a2
    daddu   $v1, $a1, $v1
    dsrl32  $v1, $v1, 4
    sll     $a1, $v1, 4
    sll     $v1, $v1, 2
    addu    $v1, $v1, $a1
    addu    $v1, $a3, $v1
    sll     $v1, $v1, 16
    sra     $v1, $v1, 16
    slt     $a1, $v0, $v1
    beqzl   $a1, .L800120FC
    sh      $v1, 0x008A($a0)
    sll     $v1, $v0, 16
    sra     $v1, $v1, 16
    sh      $v1, 0x008A($a0)
    j       .L80012100
    li      $v1, 0x0002

.globl os_800121D8
os_800121D8:
    addiu   $sp, $sp, -0x0040
    sd      $s0, 0x0020($sp)
    lui     $s0, %hi(_80052930)
    lw      $v0, %lo(_80052930)($s0)
    sd      $s2, 0x0030($sp)
    sll     $s2, $a0, 16
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0038($sp)
    sra     $s2, $s2, 16
    jal     fat_os_8000F7C0
    lhu     $s1, 0x008A($v0)
    beqz    $v0, .L800122B0
    sll     $a1, $s1, 16
    sra     $a1, $a1, 16
    daddu   $v1, $a1, $0
    dsll    $a2, $v1, 3
    dsll    $a0, $v1, 1
    dsubu   $a0, $a2, $a0
    dsll    $a2, $a0, 4
    daddu   $a0, $a0, $a2
    dsll    $a2, $a0, 8
    daddu   $a0, $a0, $a2
    dsll    $a2, $a0, 16
    daddu   $a0, $a0, $a2
    daddu   $v1, $a0, $v1
    dsra32  $v1, $v1, 0
    sra     $a1, $a1, 31
    sra     $v1, $v1, 3
    subu    $v1, $v1, $a1
    sll     $a1, $v1, 4
    sll     $a0, $v1, 2
    addu    $a0, $a0, $a1
    andi    $a0, $a0, 0xFFFF
    addiu   $v1, $a0, 0x0013
    sll     $v1, $v1, 16
    sra     $v1, $v1, 16
    slt     $a1, $v1, $v0
    bnez    $a1, .L80012280
    addu    $s1, $s1, $s2
    addiu   $v0, $v0, -0x0001
    sll     $v1, $v0, 16
    sra     $v1, $v1, 16
.L80012280:
    sll     $a0, $a0, 16
    sll     $s1, $s1, 16
    sra     $a0, $a0, 16
    sra     $s1, $s1, 16
    slt     $v0, $s1, $a0
    bnez    $v0, .L800122C8
    lw      $v0, %lo(_80052930)($s0)
    slt     $v1, $v1, $s1
    bnezl   $v1, .L800122AC
    daddu   $s1, $a0, $0
    lw      $v0, %lo(_80052930)($s0)
.L800122AC:
    sh      $s1, 0x008A($v0)
.L800122B0:
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040
.L800122C8:
    daddu   $s1, $v1, $0
    j       .L800122B0
    sh      $s1, 0x008A($v0)
    nop

.globl os_800122D8
os_800122D8:
    addiu   $sp, $sp, -0x0038
    sd      $s1, 0x0028($sp)
    lui     $s1, %hi(_80052930)
    sd      $s0, 0x0020($sp)
    lw      $s0, %lo(_80052930)($s1)
    sd      $ra, 0x0030($sp)
    lhu     $v0, 0x0088($s0)
    beqz    $v0, .L80012330
    ld      $ra, 0x0030($sp)
    jal     fat_os_8000F7E0
    nop
    lw      $v1, %lo(_80052930)($s1)
    sw      $v0, 0x0080($s0)
    lhu     $v0, 0x0088($v1)
    addiu   $v0, $v0, -0x0001
    andi    $v0, $v0, 0xFFFF
    sll     $a0, $v0, 1
    addu    $a0, $v1, $a0
    lhu     $a0, 0x0000($a0)
    sh      $v0, 0x0088($v1)
    sh      $a0, 0x008A($v1)
    ld      $ra, 0x0030($sp)
.L80012330:
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038

.globl os_80012340
os_80012340:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     fat_os_8000F7F0
    andi    $a0, $a0, 0xFFFF
    lui     $v1, %hi(_80052930)
    lw      $a1, %lo(_80052930)($v1)
    ld      $ra, 0x0020($sp)
    daddu   $a0, $v0, $0
    addiu   $a1, $a1, 0x0094
    j       fat_os_80011390
    addiu   $sp, $sp, 0x0028
    nop

.globl os_80012370
os_80012370:
    addiu   $sp, $sp, -0x0040
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    lui     $s1, %hi(_80052930)
    andi    $s0, $a0, 0xFFFF
    sd      $s2, 0x0030($sp)
    lw      $s2, %lo(_80052930)($s1)
    sd      $ra, 0x0038($sp)
    jal     os_80012340
    daddu   $a0, $s0, $0
    li      $a0, 0x00FA
    addiu   $s2, $s2, 0x00AC
    beq     $v0, $a0, .L80012440
    daddu   $v1, $v0, $0
    bnez    $v0, .L800123E4
    lw      $v0, %lo(_80052930)($s1)
    lbu     $v1, 0x00A9($v0)
.L800123B4:
    lhu     $v0, 0x008A($v0)
    beq     $v0, $s0, .L80012400
    lui     $s1, %hi(_8005292C)
    bnez    $v1, .L800123CC
    li      $s0, 0x3000
    li      $s0, 0x2000
.L800123CC:
    jal     os_80012B60
    daddu   $a0, $s0, $0
    daddu   $a0, $s2, $0
    jal     os_80012E88
    li      $a1, 0x0024
    daddu   $v1, $0, $0
.L800123E4:
    ld      $ra, 0x0038($sp)
    daddu   $v0, $v1, $0
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040
.L80012400:
    lw      $v0, %lo(_8005292C)($s1)
    lui     $a0, %hi(_80052934)
    beqz    $v0, .L80012460
    sh      $s0, %lo(_80052934)($a0)
    bnez    $v1, .L8001241C
    li      $s0, 0x3000
    li      $s0, 0x1000
.L8001241C:
    jal     os_80012B60
    daddu   $a0, $s0, $0
    jal     os_80011F10
    daddu   $a0, $s2, $0
    lw      $v0, %lo(_8005292C)($s1)
    bnezl   $v0, .L800123CC
    li      $s0, 0x1000
    j       .L800123CC
    nop
.L80012440:
    lui     $a0, %hi(__str_80051378)
    addiu   $a0, %lo(__str_80051378)
    jal     os_80015098
    daddu   $a1, $s2, $0
    lw      $v0, %lo(_80052930)($s1)
    daddu   $v1, $0, $0
    j       .L800123B4
    sh      $0, 0x00A8($v0)
.L80012460:
    bnez    $v1, .L8001241C
    li      $s0, 0x3400
    j       .L8001241C
    li      $s0, 0x1400

.globl os_80012470
os_80012470:
    addiu   $sp, $sp, -0x0050
    sd      $s0, 0x0028($sp)
    lui     $s0, %hi(_80052930)
    lw      $v0, %lo(_80052930)($s0)
    sd      $ra, 0x0048($sp)
    sd      $s2, 0x0038($sp)
    sd      $s1, 0x0030($sp)
    sd      $s3, 0x0040($sp)
    jal     fat_os_8000F7C0
    lhu     $s1, 0x008A($v0)
    li      $a0, 0x1000
    jal     os_80012B60
    daddu   $s2, $v0, $0
    li      $v0, 0x0014
    daddu   $a0, $0, $0
    li      $a1, 0x0002
    li      $a2, 0x0004
    li      $a3, 0x0024
    jal     os_800131E8
    sw      $v0, 0x0024($sp)
    dsll32  $v1, $s2, 0
    dsrl32  $v1, $v1, 0
    dsll    $a0, $v1, 4
    dsll    $v0, $v1, 2
    dsll32  $s1, $s1, 0
    dsubu   $v0, $a0, $v0
    dsrl32  $s1, $s1, 0
    dsll    $a2, $s1, 4
    dsll    $a0, $s1, 2
    dsll    $a1, $v0, 4
    dsubu   $a0, $a2, $a0
    daddu   $v0, $v0, $a1
    dsll    $a2, $a0, 4
    dsll    $a1, $v0, 8
    daddu   $a0, $a0, $a2
    daddu   $v0, $v0, $a1
    dsll    $a2, $a0, 8
    dsll    $a1, $v0, 16
    daddu   $a0, $a0, $a2
    daddu   $v0, $v0, $a1
    daddu   $v0, $v0, $v1
    dsll    $v1, $a0, 16
    daddu   $a0, $a0, $v1
    dsrl32  $v0, $v0, 4
    daddu   $s1, $a0, $s1
    sll     $v1, $v0, 4
    sll     $a0, $v0, 2
    addu    $v1, $a0, $v1
    dsrl32  $s1, $s1, 4
    sll     $a0, $s1, 4
    subu    $v1, $s2, $v1
    sll     $s1, $s1, 2
    addu    $s1, $s1, $a0
    andi    $v1, $v1, 0xFFFF
    andi    $s1, $s1, 0xFFFF
    beqz    $v1, .L800125F0
    andi    $v0, $v0, 0xFFFF
    addiu   $v0, $v0, 0x0001
    andi    $v0, $v0, 0xFFFF
.L8001255C:
    daddu   $a1, $v0, $0
    jal     os_80011F40
    daddu   $a0, $s1, $0
    li      $a0, 0x0002
    jal     os_80012D40
    li      $a1, 0x0004
    beqz    $s2, .L80012618
    lui     $a0, %hi(__str_80051390)
    addiu   $v0, $s1, 0x0014
.L80012580:
    andi    $v0, $v0, 0xFFFF
    sltu    $v1, $v0, $s2
    bnezl   $v1, .L80012590
    daddu   $s2, $v0, $0
.L80012590:
    sltu    $v0, $s1, $s2
    beqz    $v0, .L80012648
    lui     $s3, %hi(_80079D90)
    j       .L800125BC
    addiu   $s3, %lo(_80079D90)
    nop
.L800125A8:
    lw      $v0, %lo(_80052930)($s0)
    lhu     $v0, 0x00A8($v0)
    beqz    $v1, .L80012648
    sb      $v0, 0x0000($s3)
    addiu   $s3, $s3, 0x0001
.L800125BC:
    daddu   $a0, $s1, $0
    jal     os_80012370
    addiu   $s1, $s1, 0x0001
    andi    $s1, $s1, 0xFFFF
    beqz    $v0, .L800125A8
    sltu    $v1, $s1, $s2
    ld      $ra, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
.L800125F0:
    bnez    $v0, .L8001255C
    li      $a1, 0x0001
    jal     os_80011F40
    daddu   $a0, $s1, $0
    li      $a0, 0x0002
    jal     os_80012D40
    li      $a1, 0x0004
    bnez    $s2, .L80012580
    addiu   $v0, $s1, 0x0014
    li      $a0, 0x80050000
.L80012618:
    addiu   $a0, %lo(__str_80051390)
    jal     os_800145A0
    li      $a1, 0x0003
    ld      $ra, 0x0048($sp)
    daddu   $v0, $0, $0
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
    nop
.L80012648:
    jal     sysRepaint
    nop
    ld      $ra, 0x0048($sp)
    daddu   $v0, $0, $0
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050

.globl os_80012670
os_80012670:
    lui     $v0, %hi(_80052934)
    lhu     $v0, %lo(_80052934)($v0)
    addiu   $sp, $sp, -0x0050
    dsll32  $v1, $v0, 0
    dsrl32  $v1, $v1, 0
    dsll    $a1, $v1, 4
    dsll    $a0, $v1, 2
    dsubu   $a0, $a1, $a0
    dsll    $a1, $a0, 4
    daddu   $a0, $a0, $a1
    dsll    $a1, $a0, 8
    daddu   $a0, $a0, $a1
    dsll    $a1, $a0, 16
    daddu   $a0, $a0, $a1
    daddu   $v1, $a0, $v1
    dsrl32  $v1, $v1, 4
    sll     $a0, $v1, 4
    sd      $s1, 0x0030($sp)
    sll     $s1, $v1, 2
    addu    $s1, $s1, $a0
    subu    $s1, $v0, $s1
    lui     $v1, %hi(_80079D90)
    andi    $s1, $s1, 0xFFFF
    addiu   $v1, %lo(_80079D90)
    sd      $s3, 0x0040($sp)
    sd      $s2, 0x0038($sp)
    sd      $s0, 0x0028($sp)
    sd      $ra, 0x0048($sp)
    addu    $v1, $s1, $v1
    lui     $s0, %hi(_80052930)
    lw      $a0, %lo(_80052930)($s0)
    lbu     $v1, 0x0000($v1)
    li      $s2, 0x3000
    bnez    $v1, .L80012700
    lhu     $s3, 0x008A($a0)
    li      $s2, 0x2000
.L80012700:
    beq     $s3, $v0, .L80012718
    daddu   $v0, $0, $0
    jal     fat_os_8000F7C0
    nop
    bnez    $v0, .L80012738
    daddu   $v0, $0, $0
.L80012718:
    ld      $ra, 0x0048($sp)
.L8001271C:
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
    nop
.L80012738:
    dsll32  $v0, $s3, 0
    dsrl32  $v0, $v0, 0
    dsll    $a0, $v0, 4
    dsll    $v1, $v0, 2
    dsubu   $v1, $a0, $v1
    dsll    $a0, $v1, 4
    daddu   $v1, $v1, $a0
    dsll    $a0, $v1, 8
    daddu   $v1, $v1, $a0
    dsll    $a0, $v1, 16
    daddu   $v1, $v1, $a0
    daddu   $v0, $v1, $v0
    dsrl32  $v0, $v0, 4
    sll     $v1, $v0, 4
    sll     $v0, $v0, 2
    addu    $v0, $v0, $v1
    subu    $s3, $s3, $v0
    addiu   $a0, $s3, 0x0004
    jal     os_80012DE0
    andi    $a0, $a0, 0x00FF
    lw      $v0, %lo(_80052930)($s0)
    jal     os_80012370
    lhu     $a0, 0x008A($v0)
    bnez    $v0, .L8001271C
    ld      $ra, 0x0048($sp)
    addiu   $a0, $s1, 0x0004
    andi    $a0, $a0, 0x00FF
    daddu   $a1, $s2, $0
    jal     os_80012F20
    sd      $v0, 0x0020($sp)
    jal     sysRepaint
    nop
    j       .L80012718
    ld      $v0, 0x0020($sp)

.globl os_800127C0
os_800127C0:
    addiu   $sp, $sp, -0x0030
    sd      $ra, 0x0028($sp)
    jal     fat_os_8000F7C0
    sd      $s0, 0x0020($sp)
    bnez    $v0, .L800127F0
    lui     $s0, %hi(_80052930)
    daddu   $v0, $0, $0
.L800127DC:
    ld      $ra, 0x0028($sp)
.L800127E0:
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
    nop
.L800127F0:
    lw      $v0, %lo(_80052930)($s0)
    jal     os_80012340
    lhu     $a0, 0x008A($v0)
    li      $v1, 0x00FA
    beql    $v0, $v1, .L800127DC
    daddu   $v0, $0, $0
    bnez    $v0, .L800127DC
    lw      $v1, %lo(_80052930)($s0)
    lhu     $a0, 0x00A8($v1)
    beqz    $a0, .L80012858
    li      $a0, 0x0001
    lhu     $a0, 0x0088($v1)
    sltiu   $a1, $a0, 0x0040
    beqz    $a1, .L800127E0
    ld      $ra, 0x0028($sp)
    lhu     $a3, 0x008A($v1)
    sll     $a2, $a0, 1
    lw      $a1, 0x0094($v1)
    addu    $a2, $v1, $a2
    addiu   $a0, $a0, 0x0001
    sh      $a3, 0x0000($a2)
    sw      $a1, 0x0080($v1)
    sh      $a0, 0x0088($v1)
    j       .L800127DC
    sh      $0, 0x008A($v1)
    nop
.L80012858:
    j       .L800127DC
    sh      $a0, 0x008C($v1)

.globl os_80012860
os_80012860:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    lui     $s0, %hi(_80052930)
    lw      $v0, %lo(_80052930)($s0)
    sd      $ra, 0x0028($sp)
    lhu     $v1, 0x0088($v0)
    bnez    $v1, .L80012890
    ld      $ra, 0x0028($sp)
    lw      $a0, 0x0084($v0)
    bnez    $a0, .L800128A0
    nop
.L8001288C:
    ld      $ra, 0x0028($sp)
.L80012890:
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030
    nop
.L800128A0:
    jal     fat_os_8000F930
    nop
    jal     fat_os_8000F7C0
    nop
    lw      $v1, %lo(_80052930)($s0)
    lhu     $a0, 0x008A($v1)
    sltu    $a0, $a0, $v0
    bnez    $a0, .L80012890
    ld      $ra, 0x0028($sp)
    beqz    $v0, .L80012890
    addiu   $v0, $v0, -0x0001
    j       .L8001288C
    sh      $v0, 0x008A($v1)
    nop

.globl os_800128D8
os_800128D8:
    addiu   $sp, $sp, -0x0070
    sd      $s2, 0x0030($sp)
    lui     $s2, %hi(_80052930)
    sd      $ra, 0x0068($sp)
    sd      $s8, 0x0060($sp)
    sd      $s7, 0x0058($sp)
    sd      $s6, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s4, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s1, 0x0028($sp)
    sw      $a0, %lo(_80052930)($s2)
    jal     os_80013370
    sd      $s0, 0x0020($sp)
    lui     $v0, %hi(_8005292C)
    lw      $a0, %lo(_8005292C)($v0)
    jal     sys_os_80015B90
    li      $s1, 0x0002
    lw      $v1, %lo(_80052930)($s2)
    li      $s4, 0x0002
    li      $s3, 0x0001
    li      $s5, 0x0800
    li      $s6, 0x0008
    li      $s7, 0x0010
    li      $s8, 0x0020
.L8001293C:
    lw      $s0, 0x0080($v1)
    jal     fat_os_8000F7D0
    sh      $0, 0x008C($v1)
    beq     $s0, $v0, .L80012A70
    nop
.L80012950:
    jal     BiTimerSet
    daddu   $a0, $0, $0
    lw      $v0, %lo(_80052930)($s2)
    jal     fat_os_80011460
    lw      $a0, 0x0080($v0)
    bnez    $v0, .L80012A08
    ld      $ra, 0x0068($sp)
    jal     fat_os_80011038
    nop
    bnez    $v0, .L80012A08
    ld      $ra, 0x0068($sp)
    jal     BiTimerGet
    nop
    lui     $v1, %hi(_80052928)
    sh      $v0, %lo(_80052928)($v1)
.L8001298C:
    jal     os_80012860
    nop
    jal     os_80012470
    nop
    bnez    $v0, .L80012A08
    ld      $ra, 0x0068($sp)
    nop
.L800129A8:
    jal     sys_os_80016148
    nop
    beq     $v0, $s5, .L80012AA0
    daddu   $s0, $v0, $0
.L800129B8:
    beq     $v0, $s6, .L80012B40
    nop
    beq     $v0, $s7, .L80012AE8
    nop
    beq     $v0, $s8, .L80012AD8
    nop
    beq     $v0, $s3, .L80012A38
    daddu   $s1, $0, $0
    beq     $s0, $s4, .L80012AB8
    lw      $v0, %lo(_80052930)($s2)
    li      $v1, 0x0040
.L800129E4:
    beq     $s0, $v1, .L80012B00
    lw      $v0, %lo(_80052930)($s2)
.L800129EC:
    li      $v0, 0x0080
    bne     $s0, $v0, .L8001293C
    lw      $v1, %lo(_80052930)($s2)
    li      $v0, 0x0002
    sh      $v0, 0x008C($v1)
    daddu   $v0, $0, $0
.L80012A04:
    ld      $ra, 0x0068($sp)
.L80012A08:
    ld      $s8, 0x0060($sp)
    ld      $s7, 0x0058($sp)
    ld      $s6, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0070
    nop
.L80012A38:
    jal     os_800127C0
    nop
    bnez    $v0, .L80012A04
    lw      $v1, %lo(_80052930)($s2)
    lhu     $a0, 0x008C($v1)
    bnez    $a0, .L80012A08
    ld      $ra, 0x0068($sp)
    lw      $s0, 0x0080($v1)
    sh      $0, 0x008C($v1)
    jal     fat_os_8000F7D0
    li      $s1, 0x0002
    bne     $s0, $v0, .L80012950
    nop
    nop
.L80012A70:
    beq     $s1, $s4, .L8001298C
    nop
    bne     $s1, $s3, .L800129A8
    nop
    jal     os_80012670
    nop
    bnez    $v0, .L80012A08
    ld      $ra, 0x0068($sp)
    jal     sys_os_80016148
    nop
    bne     $v0, $s5, .L800129B8
    daddu   $s0, $v0, $0
.L80012AA0:
    jal     os_800121D8
    li      $a0, -0x0001
    li      $s1, 0x0001
.L80012AAC:
    bne     $s0, $s4, .L800129E4
    li      $v1, 0x0040
    lw      $v0, %lo(_80052930)($s2)
.L80012AB8:
    lhu     $v1, 0x0088($v0)
    beqzl   $v1, .L80012B50
    li      $v1, 0x0004
    jal     os_800122D8
    nop
    lui     $v0, %hi(_80052930)
    j       .L8001293C
    lw      $v1, %lo(_80052930)($v0)
.L80012AD8:
    jal     os_80012030
    li      $a0, 0x0001
    j       .L800129EC
    daddu   $s1, $v0, $0
.L80012AE8:
    jal     os_80012030
    li      $a0, -0x0001
    li      $v1, 0x0040
    bne     $s0, $v1, .L800129EC
    daddu   $s1, $v0, $0
    lw      $v0, %lo(_80052930)($s2)
.L80012B00:
    ld      $ra, 0x0068($sp)
    li      $v1, 0x0003
    sh      $v1, 0x008C($v0)
    ld      $s8, 0x0060($sp)
    daddu   $v0, $0, $0
    ld      $s7, 0x0058($sp)
    ld      $s6, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0070
    nop
.L80012B40:
    jal     os_800121D8
    li      $a0, 0x0001
    j       .L80012AAC
    li      $s1, 0x0001
.L80012B50:
    sh      $v1, 0x008C($v0)
    j       .L80012A04
    daddu   $v0, $0, $0
    nop

.globl os_80012B60
os_80012B60:
    lui     $v0, %hi(_8005293A)
    jr      $ra
    sh      $a0, %lo(_8005293A)($v0)
    nop

.globl os_80012B70
os_80012B70:
    lbu     $v1, 0x0000($a0)
    beqz    $v1, .L80012BA8
    lui     $a2, %hi(_80052944)
    lw      $v0, %lo(_80052944)($a2)
    lui     $a3, %hi(_8005293A)
    lhu     $a1, %lo(_8005293A)($a3)
.L80012B88:
    addiu   $a0, $a0, 0x0001
    addu    $v1, $v1, $a1
    sh      $v1, 0x0000($v0)
    addiu   $v0, $v0, 0x0002
    sw      $v0, %lo(_80052944)($a2)
    lbu     $v1, 0x0000($a0)
    bnez    $v1, .L80012B88
    lhu     $a1, %lo(_8005293A)($a3)
.L80012BA8:
    jr      $ra
    nop

.globl os_80012BB0
os_80012BB0:
    lbu     $v0, 0x0000($a0)
    beqz    $v0, .L80012C04
    andi    $a1, $a1, 0x00FF
    beqz    $a1, .L80012C04
    lui     $a3, %hi(_80052944)
    addiu   $a1, $a1, -0x0001
    lw      $v1, %lo(_80052944)($a3)
    andi    $a1, $a1, 0x00FF
    j       .L80012BE0
    lui     $t0, %hi(_8005293A)
.L80012BD8:
    beqz    $a1, .L80012C04
    andi    $a1, $a2, 0x00FF
.L80012BE0:
    lhu     $a2, %lo(_8005293A)($t0)
    addiu   $a0, $a0, 0x0001
    addu    $v0, $v0, $a2
    sh      $v0, 0x0000($v1)
    addiu   $v1, $v1, 0x0002
    sw      $v1, %lo(_80052944)($a3)
    lbu     $v0, 0x0000($a0)
    bnez    $v0, .L80012BD8
    addiu   $a2, $a1, -0x0001
.L80012C04:
    jr      $ra
    nop
    nop

.globl os_80012C10
os_80012C10:
    lui     $v1, %hi(_80052944)
    lui     $v0, %hi(_8005293A)
    lhu     $a1, %lo(_8005293A)($v0)
    lw      $v0, %lo(_80052944)($v1)
    andi    $a0, $a0, 0x00FF
    addu    $a1, $a0, $a1
    addiu   $a0, $v0, 0x0002
    sw      $a0, %lo(_80052944)($v1)
    jr      $ra
    sh      $a1, 0x0000($v0)
    andi    $a0, $a0, 0x00FF
    sltiu   $v1, $a0, 0x000A
    bnez    $v1, .L80012C4C
    li      $v0, 0x0030
    li      $v0, 0x0037
.L80012C4C:
    lui     $v1, %hi(_80052944)
    addu    $a0, $v0, $a0
    lui     $v0, %hi(_8005293A)
    lhu     $a1, %lo(_8005293A)($v0)
    lw      $v0, %lo(_80052944)($v1)
    andi    $a0, $a0, 0x00FF
    addu    $a0, $a0, $a1
    addiu   $a1, $v0, 0x0002
    sw      $a1, %lo(_80052944)($v1)
    jr      $ra
    sh      $a0, 0x0000($v0)

.globl os_80012C78
os_80012C78:
    andi    $a0, $a0, 0x00FF
    srl     $v0, $a0, 4
    sltiu   $v1, $v0, 0x000A
    bnez    $v1, .L80012C90
    li      $a2, 0x0030
    li      $a2, 0x0037
.L80012C90:
    lui     $a1, %hi(_8005293A)
    lhu     $a3, %lo(_8005293A)($a1)
    lui     $v1, %hi(_80052944)
    addu    $a2, $a2, $v0
    andi    $a0, $a0, 0x000F
    lw      $v0, %lo(_80052944)($v1)
    addu    $a2, $a2, $a3
    sltiu   $t0, $a0, 0x000A
    sh      $a2, 0x0000($v0)
    addiu   $a3, $v0, 0x0002
    bnez    $t0, .L80012CC4
    li      $a2, 0x0030
    li      $a2, 0x0037
.L80012CC4:
    lhu     $a1, %lo(_8005293A)($a1)
    addu    $a0, $a2, $a0
    addu    $a0, $a0, $a1
    addiu   $a1, $a3, 0x0002
    sh      $a0, 0x0002($v0)
    jr      $ra
    sw      $a1, %lo(_80052944)($v1)

.globl os_80012CE0
os_80012CE0:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    andi    $s0, $a0, 0xFFFF
    sd      $ra, 0x0028($sp)
    jal     os_80012C78
    srl     $a0, $s0, 8
    andi    $a0, $s0, 0x00FF
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       os_80012C78
    addiu   $sp, $sp, 0x0030
    nop

.globl os_80012D10
os_80012D10:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    daddu   $s0, $a0, $0
    sd      $ra, 0x0028($sp)
    jal     os_80012CE0
    srl     $a0, $a0, 16
    andi    $a0, $s0, 0xFFFF
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       os_80012CE0
    addiu   $sp, $sp, 0x0030
    nop

.globl os_80012D40
os_80012D40:
    andi    $a1, $a1, 0x00FF
    sll     $v1, $a1, 3
    sll     $v0, $a1, 5
    addu    $v0, $v1, $v0
    andi    $a0, $a0, 0x00FF
    lui     $v1, %hi(_8005293C)
    addu    $v0, $a0, $v0
    lw      $a2, %lo(_8005293C)($v1)
    sll     $v1, $v0, 1
    addu    $a2, $a2, $v1
    lui     $v1, %hi(_80052944)
    sw      $a2, %lo(_80052944)($v1)
    lui     $v1, %hi(_80052938)
    sb      $a0, %lo(_80052938)($v1)
    lui     $v1, %hi(_80052940)
    sb      $a1, %lo(_80052940)($v1)
    lui     $v1, %hi(_80052948)
    jr      $ra
    sh      $v0, %lo(_80052948)($v1)
    nop

.globl os_80012D90
os_80012D90:
    lui     $v1, %hi(_80052940)
    lbu     $v0, %lo(_80052940)($v1)
    andi    $a0, $a0, 0x00FF
    sll     $a2, $v0, 3
    sll     $a1, $v0, 5
    addu    $a1, $a2, $a1
    lui     $a2, %hi(_8005293C)
    addu    $a1, $a0, $a1
    lw      $a3, %lo(_8005293C)($a2)
    sll     $a2, $a1, 1
    addu    $a3, $a3, $a2
    lui     $a2, %hi(_80052944)
    sw      $a3, %lo(_80052944)($a2)
    sb      $v0, %lo(_80052940)($v1)
    lui     $a2, %hi(_80052938)
    lui     $v0, %hi(_80052948)
    sb      $a0, %lo(_80052938)($a2)
    jr      $ra
    sh      $a1, %lo(_80052948)($v0)
    nop

.globl os_80012DE0
os_80012DE0:
    andi    $a0, $a0, 0x00FF
    lui     $v1, %hi(_80052938)
    lbu     $a1, %lo(_80052938)($v1)
    sll     $a2, $a0, 3
    sll     $v0, $a0, 5
    addu    $v0, $a2, $v0
    lui     $a2, %hi(_8005293C)
    addu    $v0, $a1, $v0
    lw      $a3, %lo(_8005293C)($a2)
    sb      $a1, %lo(_80052938)($v1)
    sll     $a2, $v0, 1
    lui     $v1, %hi(_80052940)
    addu    $a3, $a3, $a2
    sb      $a0, %lo(_80052940)($v1)
    lui     $a2, %hi(_80052944)
    lui     $v1, %hi(_80052948)
    sw      $a3, %lo(_80052944)($a2)
    jr      $ra
    sh      $v0, %lo(_80052948)($v1)
    nop

.globl os_80012E30
os_80012E30:
    lui     $v0, %hi(_80052938)
    jr      $ra
    lbu     $v0, %lo(_80052938)($v0)
    nop

.globl os_80012E40
os_80012E40:
    lui     $v0, %hi(_80052940)
    jr      $ra
    lbu     $v0, %lo(_80052940)($v0)
    nop

.globl os_80012E50
os_80012E50:
    lui     $v0, %hi(_8005293C)
    lw      $a0, %lo(_8005293C)($v0)
    lui     $v1, %hi(_80052948)
    li      $a1, 0x0052
    addiu   $a0, $a0, 0x00A4
    sh      $a1, %lo(_80052948)($v1)
    lui     $v1, %hi(_80052944)
    li      $v0, 0x0002
    sw      $a0, %lo(_80052944)($v1)
    lui     $v1, %hi(_80052940)
    sb      $v0, %lo(_80052940)($v1)
    lui     $v1, %hi(_80052938)
    jr      $ra
    sb      $v0, %lo(_80052938)($v1)

.globl os_80012E88
os_80012E88:
    lui     $a3, %hi(_80052948)
    lhu     $v1, %lo(_80052948)($a3)
    lui     $a2, %hi(_80052940)
    lui     $v0, %hi(_8005293C)
    lw      $t1, %lo(_8005293C)($v0)
    lbu     $t0, %lo(_80052940)($a2)
    sll     $v0, $v1, 1
    addu    $v0, $t1, $v0
    addiu   $t0, $t0, 0x0001
    addiu   $t1, $v1, 0x0028
    lui     $v1, %hi(_80052944)
    sh      $t1, %lo(_80052948)($a3)
    sb      $t0, %lo(_80052940)($a2)
    sw      $v0, %lo(_80052944)($v1)
    lbu     $a2, 0x0000($a0)
    beqz    $a2, .L80012F0C
    andi    $a1, $a1, 0x00FF
    beqz    $a1, .L80012F0C
    addiu   $a1, $a1, -0x0001
    andi    $a1, $a1, 0x00FF
    j       .L80012EE8
    lui     $t0, %hi(_8005293A)
.L80012EE0:
    beqz    $a1, .L80012F0C
    andi    $a1, $a3, 0x00FF
.L80012EE8:
    lhu     $a3, %lo(_8005293A)($t0)
    addiu   $a0, $a0, 0x0001
    addu    $a2, $a2, $a3
    sh      $a2, 0x0000($v0)
    addiu   $v0, $v0, 0x0002
    sw      $v0, %lo(_80052944)($v1)
    lbu     $a2, 0x0000($a0)
    bnez    $a2, .L80012EE0
    addiu   $a3, $a1, -0x0001
.L80012F0C:
    jr      $ra
    nop
    nop

.globl os_80012F18
os_80012F18:
    j       os_80012E88
    li      $a1, 0x0024

.globl os_80012F20
os_80012F20:
    andi    $a0, $a0, 0x00FF
    lui     $v0, %hi(_8005293C)
    sll     $v1, $a0, 6
    lw      $v0, %lo(_8005293C)($v0)
    sll     $a0, $a0, 4
    addu    $a0, $a0, $v1
    addu    $v0, $v0, $a0
    andi    $a1, $a1, 0xFFFF
    li      $v1, 0x0027
    li      $a2, 0x00FF
.L80012F48:
    lhu     $a0, 0x0000($v0)
    addiu   $v1, $v1, -0x0001
    andi    $a0, $a0, 0x007F
    addu    $a0, $a1, $a0
    andi    $v1, $v1, 0x00FF
    sh      $a0, 0x0000($v0)
    bne     $v1, $a2, .L80012F48
    addiu   $v0, $v0, 0x0002
    jr      $ra
    nop

.globl os_80012F70
os_80012F70:
    andi    $a2, $a2, 0x00FF
    sll     $v1, $a2, 3
    sll     $v0, $a2, 5
    addu    $v0, $v1, $v0
    lui     $v1, %hi(_8005293C)
    andi    $a1, $a1, 0x00FF
    lw      $t0, %lo(_8005293C)($v1)
    lui     $v1, %hi(_8005293A)
    addu    $v0, $a1, $v0
    lhu     $t1, %lo(_8005293A)($v1)
    sll     $v1, $v0, 1
    addu    $t1, $a0, $t1
    addu    $t2, $t0, $v1
    lui     $a0, %hi(_80052944)
    sw      $t2, %lo(_80052944)($a0)
    lui     $a0, %hi(_80052938)
    sb      $a1, %lo(_80052938)($a0)
    lui     $a0, %hi(_80052940)
    sb      $a2, %lo(_80052940)($a0)
    andi    $a3, $a3, 0x00FF
    lui     $a0, %hi(_80052948)
    sh      $v0, %lo(_80052948)($a0)
    beqz    $a3, .L80013010
    andi    $t1, $t1, 0xFFFF
    addiu   $a3, $a3, -0x0001
    andi    $a3, $a3, 0x00FF
    sll     $a0, $a3, 5
    sll     $a1, $a3, 3
    addu    $a1, $a1, $a0
    addiu   $a0, $v0, 0x0028
    addu    $a1, $a0, $a1
    j       .L80013000
    andi    $a1, $a1, 0xFFFF
    nop
.L80012FF8:
    addiu   $a0, $v0, 0x0028
    sll     $v1, $v0, 1
.L80013000:
    addu    $v1, $t0, $v1
    andi    $v0, $a0, 0xFFFF
    bne     $v0, $a1, .L80012FF8
    sh      $t1, 0x0000($v1)
.L80013010:
    jr      $ra
    nop

.globl os_80013018
os_80013018:
    addiu   $sp, $sp, -0x0048
    sd      $s2, 0x0030($sp)
    andi    $s2, $a1, 0xFFFF
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s0, 0x0020($sp)
    beqz    $s2, .L8001309C
    daddu   $s1, $a0, $0
    lui     $s3, %hi(__str_80051050)
    addiu   $s3, %lo(__str_80051050)
    j       .L8001306C
    daddu   $s0, $0, $0
    nop
.L80013050:
    lbu     $a0, 0x0000($s1)
    jal     os_80012C78
    addiu   $s1, $s1, 0x0001
    andi    $v0, $s0, 0xFFFF
    sltu    $v0, $v0, $s2
    beqz    $v0, .L800130A0
    ld      $ra, 0x0040($sp)
.L8001306C:
    andi    $v0, $s0, 0x000F
.L80013070:
    bnez    $v0, .L80013050
    addiu   $s0, $s0, 0x0001
    jal     os_80012F18
    daddu   $a0, $s3, $0
    lbu     $a0, 0x0000($s1)
    jal     os_80012C78
    addiu   $s1, $s1, 0x0001
    andi    $v0, $s0, 0xFFFF
    sltu    $v0, $v0, $s2
    bnez    $v0, .L80013070
    andi    $v0, $s0, 0x000F
.L8001309C:
    ld      $ra, 0x0040($sp)
.L800130A0:
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     os_80012F18
    nop
    jal     sysRepaint
    nop
    ld      $ra, 0x0020($sp)
    j       sys_os_80016148
    addiu   $sp, $sp, 0x0028
    nop

.globl os_800130E0
os_800130E0:
    andi    $v0, $a2, 0x00FF
    sll     $v1, $v0, 5
    sll     $t0, $v0, 3
    andi    $t1, $a1, 0x00FF
    addu    $t0, $t0, $v1
    lui     $v1, %hi(_8005293C)
    lw      $a2, %lo(_8005293C)($v1)
    addu    $t0, $t1, $t0
    lui     $v1, %hi(_8005293A)
    lhu     $a1, %lo(_8005293A)($v1)
    sll     $v1, $t0, 1
    addu    $v1, $a2, $v1
    andi    $a2, $a3, 0x00FF
    lui     $a3, %hi(_80052938)
    sb      $t1, %lo(_80052938)($a3)
    lui     $a3, %hi(_80052940)
    addu    $a1, $a0, $a1
    sb      $v0, %lo(_80052940)($a3)
    lui     $v0, %hi(_80052948)
    sh      $t0, %lo(_80052948)($v0)
    daddu   $a0, $v1, $0
    lui     $v0, %hi(_80052944)
    andi    $a1, $a1, 0xFFFF
    sll     $a2, $a2, 1
    j       os_80014600
    sw      $v1, %lo(_80052944)($v0)

.globl os_80013148
os_80013148:
    addiu   $sp, $sp, -0x0050
    lui     $v0, %hi(_8005293A)
    sd      $s4, 0x0040($sp)
    sd      $s0, 0x0020($sp)
    lhu     $s4, %lo(_8005293A)($v0)
    andi    $s0, $a2, 0x00FF
    lui     $v0, %hi(_80052948)
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0048($sp)
    sd      $s3, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    andi    $a0, $a0, 0xFFFF
    andi    $a1, $a1, 0x00FF
    beqz    $s0, .L800131C4
    lhu     $s1, %lo(_80052948)($v0)
    addu    $s4, $a0, $s4
    sll     $s3, $a1, 1
    andi    $s4, $s4, 0xFFFF
    andi    $s3, $s3, 0x00FF
    lui     $s2, %hi(_8005293C)
.L80013198:
    lw      $a0, %lo(_8005293C)($s2)
    sll     $v0, $s1, 1
    addiu   $s0, $s0, -0x0001
    addu    $a0, $a0, $v0
    daddu   $a1, $s4, $0
    daddu   $a2, $s3, $0
    addiu   $s1, $s1, 0x0028
    jal     os_80014600
    andi    $s0, $s0, 0x00FF
    bnez    $s0, .L80013198
    andi    $s1, $s1, 0xFFFF
.L800131C4:
    ld      $ra, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
    nop

.globl os_800131E8
os_800131E8:
    andi    $v0, $a2, 0x00FF
    sll     $a2, $v0, 3
    sll     $v1, $v0, 5
    andi    $t0, $a1, 0x00FF
    addu    $v1, $a2, $v1
    lui     $a1, %hi(_8005293C)
    addu    $v1, $t0, $v1
    lw      $t1, %lo(_8005293C)($a1)
    sll     $a1, $v1, 1
    addu    $t1, $t1, $a1
    andi    $a1, $a3, 0x00FF
    lui     $a3, %hi(_80052944)
    sw      $t1, %lo(_80052944)($a3)
    lui     $a3, %hi(_80052938)
    sb      $t0, %lo(_80052938)($a3)
    lbu     $a2, 0x0027($sp)
    lui     $a3, %hi(_80052940)
    sb      $v0, %lo(_80052940)($a3)
    andi    $a0, $a0, 0xFFFF
    lui     $v0, %hi(_80052948)
    j       os_80013148
    sh      $v1, %lo(_80052948)($v0)

.globl os_80013240
os_80013240:
    addiu   $sp, $sp, -0x0048
    andi    $a1, $a1, 0x00FF
    sd      $s2, 0x0038($sp)
    sd      $s1, 0x0030($sp)
    sd      $s0, 0x0028($sp)
    sd      $a1, 0x0020($sp)
    sd      $ra, 0x0040($sp)
    jal     os_80014F68
    daddu   $s2, $a0, $0
    ld      $a1, 0x0020($sp)
    andi    $v0, $v0, 0x00FF
    lui     $s0, %hi(_80052948)
    sltu    $a0, $a1, $v0
    beqz    $a0, .L80013280
    lhu     $s1, %lo(_80052948)($s0)
    daddu   $v0, $a1, $0
.L80013280:
    li      $a3, 0x0028
    lui     $a2, %hi(_80052940)
    subu    $v0, $a3, $v0
    lbu     $v1, %lo(_80052940)($a2)
    srl     $a3, $v0, 31
    addu    $v0, $a3, $v0
    sll     $a0, $v1, 3
    sra     $a3, $v0, 1
    sll     $v0, $v1, 5
    andi    $a3, $a3, 0x00FF
    addu    $v0, $a0, $v0
    lui     $a0, %hi(_8005293C)
    addu    $v0, $a3, $v0
    lw      $t1, %lo(_8005293C)($a0)
    sll     $a0, $v0, 1
    addu    $t1, $t1, $a0
    lui     $t0, %hi(_80052944)
    daddu   $a0, $s2, $0
    sw      $t1, %lo(_80052944)($t0)
    lui     $t0, %hi(_80052938)
    sh      $v0, %lo(_80052948)($s0)
    sb      $a3, %lo(_80052938)($t0)
    jal     os_80012E88
    sb      $v1, %lo(_80052940)($a2)
    ld      $ra, 0x0040($sp)
    addiu   $s1, $s1, 0x0028
    sh      $s1, %lo(_80052948)($s0)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048

.globl os_80013300
os_80013300:
    j       os_80013240
    li      $a1, 0x0024

.globl os_80013308
os_80013308:
    addiu   $sp, $sp, -0x0040
    sd      $s0, 0x0030($sp)
    addiu   $s0, $sp, 0x0020
    daddu   $a1, $a0, $0
    daddu   $a0, $s0, $0
    sd      $ra, 0x0038($sp)
    jal     os_80015310
    sb      $0, 0x0020($sp)
    lbu     $v0, 0x0020($sp)
    beqz    $v0, .L80013360
    lui     $a2, %hi(_80052944)
    lw      $v1, %lo(_80052944)($a2)
    lui     $a1, %hi(_8005293A)
    nop
.L80013340:
    lhu     $a0, %lo(_8005293A)($a1)
    addiu   $s0, $s0, 0x0001
    addu    $v0, $v0, $a0
    sh      $v0, 0x0000($v1)
    lbu     $v0, 0x0000($s0)
    bnez    $v0, .L80013340
    addiu   $v1, $v1, 0x0002
    sw      $v1, %lo(_80052944)($a2)
.L80013360:
    ld      $ra, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040

.globl os_80013370
os_80013370:
    lui     $v0, %hi(_8005293C)
    lw      $a3, %lo(_8005293C)($v0)
    li      $t0, 0x0052
    lui     $v1, %hi(_80052948)
    daddu   $a0, $a3, $0
    sh      $t0, %lo(_80052948)($v1)
    addiu   $a3, $a3, 0x00A4
    lui     $v1, %hi(_80052944)
    addiu   $sp, $sp, -0x0030
    li      $v0, 0x0002
    sw      $a3, %lo(_80052944)($v1)
    lui     $v1, %hi(_80052940)
    sd      $s0, 0x0020($sp)
    sb      $v0, %lo(_80052940)($v1)
    lui     $s0, %hi(_8005293A)
    lui     $v1, %hi(_80052938)
    li      $a1, 0x3000
    li      $a2, 0x0960
    sd      $ra, 0x0028($sp)
    sb      $v0, %lo(_80052938)($v1)
    jal     os_80014600
    sh      $0, %lo(_8005293A)($s0)
    li      $v0, 0x1000
    sh      $v0, %lo(_8005293A)($s0)
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    daddu   $a0, $0, $0
    j       sys_os_80015B90
    addiu   $sp, $sp, 0x0030
    nop

.globl os_800133E8
os_800133E8:
    addiu   $sp, $sp, -0x0028
    lui     $v0, %hi(_8005293C)
    sd      $ra, 0x0020($sp)
    jal     os_80013370
    sw      $a0, %lo(_8005293C)($v0)
    ld      $ra, 0x0020($sp)
    daddu   $a0, $0, $0
    j       os_800150C8
    addiu   $sp, $sp, 0x0028
    nop
    lbu     $v0, 0x0000($a0)
    andi    $a1, $a1, 0x00FF
    addiu   $v0, $v0, 0x0001
.L8001341C:
    andi    $v0, $v0, 0x00FF
    sltu    $v1, $v0, $a1
    subu    $v1, $0, $v1
    and     $v0, $v0, $v1
    addu    $v1, $a2, $v0
    beqz    $a2, .L80013448
    sb      $v0, 0x0000($a0)
    lbu     $v1, 0x0000($v1)
    andi    $v1, $v1, 0x0040
    bnez    $v1, .L8001341C
    addiu   $v0, $v0, 0x0001
.L80013448:
    jr      $ra
    nop
    addiu   $a1, $a1, -0x0001
    lbu     $v0, 0x0000($a0)
    j       .L80013480
    andi    $a1, $a1, 0x00FF
.L80013460:
    daddu   $v0, $a1, $0
    addu    $v1, $a2, $v0
    beqz    $a2, .L80013498
    sb      $v0, 0x0000($a0)
.L80013470:
    lbu     $v1, 0x0000($v1)
    andi    $v1, $v1, 0x0040
    beqz    $v1, .L80013498
    nop
.L80013480:
    beqz    $v0, .L80013460
    addiu   $v1, $v0, -0x0001
    andi    $v0, $v1, 0x00FF
    addu    $v1, $a2, $v0
    bnez    $a2, .L80013470
    sb      $v0, 0x0000($a0)
.L80013498:
    jr      $ra
    nop

.globl os_800134A0
os_800134A0:
    andi    $a1, $a1, 0x00FF
    li      $v0, 0x0008
    beq     $a1, $v0, .L800134C0
    andi    $a0, $a0, 0x00FF
    bnez    $a0, .L800134D0
    nop
    bnez    $a1, .L800134C8
    nop
.L800134C0:
    j       os_80012B60
    li      $a0, 0x3400
.L800134C8:
    j       os_80012B60
    li      $a0, 0x2400
.L800134D0:
    j       os_80012B60
    li      $a0, 0x1400

.globl os_800134D8
os_800134D8:
    addiu   $sp, $sp, -0x0070
    sd      $s1, 0x0028($sp)
    daddu   $s1, $a0, $0
    sd      $ra, 0x0068($sp)
    sd      $s8, 0x0060($sp)
    sd      $s7, 0x0058($sp)
    sd      $s6, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s4, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s2, 0x0030($sp)
    jal     os_80013370
    sd      $s0, 0x0020($sp)
    lw      $a1, 0x0000($s1)
    beqz    $a1, .L8001359C
    lui     $s2, %hi(__str_8004F630)
    lui     $s6, %hi(__str_8004F2B8)
    lui     $s7, %hi(__str_8004F2C0)
    lui     $s8, %hi(__str_8004F2D8)
    addiu   $s2, %lo(__str_8004F630)
    addiu   $s6, %lo(__str_8004F2B8)
    addiu   $s7, %lo(__str_8004F2C0)
    addiu   $s8, %lo(__str_8004F2D8)
    addiu   $s0, $s1, 0x0004
    daddu   $s3, $0, $0
    li      $s5, 0x1000
    li      $s4, 0x001A
    nop
.L80013548:
    beq     $s3, $s4, .L80013560
    nop
    jal     os_80014E48
    daddu   $a0, $s2, $0
    beqzl   $v0, .L8001357C
    lw      $a1, 0x0000($s1)
.L80013560:
    jal     sysRepaint
    daddu   $s3, $0, $0
    jal     sys_os_80016148
    nop
    jal     os_80013370
    nop
    lw      $a1, 0x0000($s1)
.L8001357C:
    jal     os_80014E48
    daddu   $a0, $s2, $0
    beqzl   $v0, .L800135D8
    lw      $a1, 0x0000($s1)
.L8001358C:
    lw      $a1, 0x0000($s0)
.L80013590:
    daddu   $s1, $s0, $0
    bnez    $a1, .L80013548
    addiu   $s0, $s0, 0x0004
.L8001359C:
    jal     sysRepaint
    nop
    ld      $ra, 0x0068($sp)
    ld      $s8, 0x0060($sp)
    ld      $s7, 0x0058($sp)
    ld      $s6, 0x0050($sp)
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       sys_os_80016148
    addiu   $sp, $sp, 0x0070
    nop
.L800135D8:
    jal     os_80014E48
    daddu   $a0, $s6, $0
    beqzl   $v0, .L800135F0
    lw      $a1, 0x0000($s1)
    j       .L8001358C
    li      $s5, 0x1400
.L800135F0:
    jal     os_80014E48
    daddu   $a0, $s7, $0
    beqzl   $v0, .L80013608
    lw      $a1, 0x0000($s1)
    j       .L8001358C
    li      $s5, 0x3000
.L80013608:
    jal     os_80014E48
    daddu   $a0, $s8, $0
    beqz    $v0, .L80013620
    nop
    j       .L8001358C
    li      $s5, 0x1000
.L80013620:
    jal     os_80012B60
    daddu   $a0, $s5, $0
    addiu   $s3, $s3, 0x0001
    li      $v0, 0x1400
    beq     $s5, $v0, .L80013648
    andi    $s3, $s3, 0x00FF
    jal     os_80012F18
    lw      $a0, 0x0000($s1)
    j       .L80013590
    lw      $a1, 0x0000($s0)
.L80013648:
    li      $a0, 0x0020
    li      $a1, 0x0024
    jal     os_80013148
    li      $a2, 0x0001
    jal     os_80013300
    lw      $a0, 0x0000($s1)
    j       .L80013590
    lw      $a1, 0x0000($s0)

.globl os_80013668
os_80013668:
    addiu   $sp, $sp, -0x0060
    sd      $s1, 0x0028($sp)
    andi    $s1, $a1, 0x00FF
    sd      $ra, 0x0058($sp)
    sd      $s6, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s4, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    andi    $s4, $a2, 0x00FF
    sd      $s2, 0x0030($sp)
    sd      $s0, 0x0020($sp)
    jal     os_80014628
    daddu   $s5, $a0, $0
    addiu   $a0, $s1, 0x0001
    sll     $a0, $a0, 2
    jal     os_80014718
    daddu   $s3, $v0, $0
    daddu   $s2, $v0, $0
    sll     $v0, $s1, 2
    addu    $v0, $s2, $v0
    sll     $a0, $s1, 5
    jal     os_80014718
    sw      $0, 0x0000($v0)
    li      $a0, 0x0018
    jal     os_80014718
    daddu   $s6, $v0, $0
    daddu   $a0, $v0, $0
    daddu   $a1, $0, $0
    li      $a2, 0x0018
    jal     os_80014778
    daddu   $s0, $v0, $0
    beqz    $s1, .L80013714
    addiu   $v1, $s1, -0x0001
    andi    $v1, $v1, 0x00FF
    sll     $v1, $v1, 5
    addiu   $v1, $v1, 0x0020
    addu    $v1, $s6, $v1
    daddu   $v0, $s2, $0
.L80013700:
    sw      $s6, 0x0000($v0)
    sb      $0, 0x0000($s6)
    addiu   $s6, $s6, 0x0020
    bne     $s6, $v1, .L80013700
    addiu   $v0, $v0, 0x0004
.L80013714:
    sw      $s5, 0x0000($s0)
    sw      $s2, 0x0004($s0)
    jal     os_80014628
    sb      $s4, 0x000D($s0)
    ld      $ra, 0x0058($sp)
    subu    $v0, $v0, $s3
    sh      $v0, 0x0016($s0)
    ld      $s6, 0x0050($sp)
    daddu   $v0, $s0, $0
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0060

.globl os_80013758
os_80013758:
    addiu   $sp, $sp, -0x0040
    sd      $s1, 0x0030($sp)
    andi    $s1, $a1, 0x00FF
    sd      $s0, 0x0028($sp)
    li      $v0, 0x0001
    daddu   $s0, $a0, $0
    daddu   $a1, $0, $0
    li      $a0, 0x0020
    li      $a2, 0x0002
    li      $a3, 0x0028
    andi    $s1, $s1, 0x0010
    sd      $ra, 0x0038($sp)
    jal     os_800131E8
    sw      $v0, 0x0024($sp)
    bnez    $s1, .L800137B8
    li      $a0, 0x0002
    jal     os_80014F68
    daddu   $a0, $s0, $0
    li      $v1, 0x0028
    subu    $v0, $v1, $v0
    srl     $a0, $v0, 31
    addu    $a0, $a0, $v0
    sra     $a0, $a0, 1
    andi    $a0, $a0, 0x00FF
.L800137B8:
    jal     os_80012D90
    nop
    daddu   $a0, $s0, $0
    ld      $ra, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    j       os_80012B70
    addiu   $sp, $sp, 0x0040

.globl os_800137D8
os_800137D8:
    addiu   $sp, $sp, -0x0058
    sd      $s3, 0x0038($sp)
    sd      $ra, 0x0050($sp)
    sd      $s5, 0x0048($sp)
    sd      $s4, 0x0040($sp)
    sd      $s2, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    lbu     $v0, 0x000E($a0)
    bnez    $v0, .L800138D8
    daddu   $s3, $a0, $0
    lw      $a0, 0x0000($a0)
    li      $v0, 0x0001
    sb      $v0, 0x000E($s3)
    lw      $s5, 0x0004($s3)
    lw      $s1, 0x0008($s3)
    beqz    $a0, .L8001382C
    daddu   $s2, $0, $0
    jal     os_80014F68
    nop
    daddu   $s2, $v0, $0
.L8001382C:
    lw      $a0, 0x0000($s5)
    beqz    $a0, .L80013920
    daddu   $v0, $0, $0
    daddu   $s4, $0, $0
    daddu   $s0, $0, $0
.L80013840:
    beqz    $s1, .L80013858
    addu    $v0, $s1, $v0
    lbu     $v0, 0x0000($v0)
    andi    $v0, $v0, 0x0040
    bnezl   $v0, .L8001387C
    addiu   $s0, $s0, 0x0001
.L80013858:
    jal     os_80014F68
    addiu   $s4, $s4, 0x0001
    andi    $v0, $v0, 0x00FF
    sltu    $v1, $v0, $s2
    bnezl   $v1, .L80013870
    daddu   $v0, $s2, $0
.L80013870:
    daddu   $s2, $v0, $0
    andi    $s4, $s4, 0x00FF
    addiu   $s0, $s0, 0x0001
.L8001387C:
    andi    $s0, $s0, 0x00FF
    sll     $v0, $s0, 2
    addu    $v0, $s5, $v0
    lw      $a0, 0x0000($v0)
    bnez    $a0, .L80013840
    daddu   $v0, $s0, $0
.L80013894:
    lbu     $v0, 0x0012($s3)
    bnez    $v0, .L800138B0
    sltu    $v1, $s2, $v0
    li      $v0, 0x0024
    sb      $v0, 0x0012($s3)
    li      $v0, 0x0024
    sltu    $v1, $s2, $v0
.L800138B0:
    bnez    $v1, .L80013900
    sb      $s0, 0x000F($s3)
    lbu     $v1, 0x000D($s3)
    sb      $v0, 0x0010($s3)
    andi    $v0, $v1, 0x0004
    bnez    $v0, .L800138D8
    sb      $s4, 0x0011($s3)
.L800138CC:
    sll     $s4, $s4, 1
    addiu   $s4, $s4, 0x0001
    sb      $s4, 0x0011($s3)
.L800138D8:
    ld      $ra, 0x0050($sp)
.L800138DC:
    ld      $s5, 0x0048($sp)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
    nop
.L80013900:
    lbu     $v1, 0x000D($s3)
    daddu   $v0, $s2, $0
    sb      $v0, 0x0010($s3)
    andi    $v0, $v1, 0x0004
    beqz    $v0, .L800138CC
    sb      $s4, 0x0011($s3)
    j       .L800138DC
    ld      $ra, 0x0050($sp)
.L80013920:
    daddu   $s4, $0, $0
    j       .L80013894
    daddu   $s0, $0, $0
    nop

.globl os_80013930
os_80013930:
    addiu   $sp, $sp, -0x0040
    sd      $s0, 0x0030($sp)
    li      $v0, 0x0002
    daddu   $s0, $a0, $0
    daddu   $a1, $0, $0
    li      $a0, 0x0020
    li      $a2, 0x001A
    li      $a3, 0x0028
    sd      $ra, 0x0038($sp)
    jal     os_800131E8
    sw      $v0, 0x0024($sp)
    jal     os_80012D90
    li      $a0, 0x0002
    beqz    $s0, .L800139B4
    ld      $ra, 0x0038($sp)
    jal     os_80014F68
    daddu   $a0, $s0, $0
    beqz    $v0, .L800139B0
    daddu   $a0, $s0, $0
    li      $a1, 0x0024
    jal     os_80012E88
    sd      $v0, 0x0028($sp)
    ld      $v0, 0x0028($sp)
    sltiu   $v0, $v0, 0x0025
    bnez    $v0, .L800139B0
    addiu   $a0, $s0, 0x0024
    ld      $ra, 0x0038($sp)
    ld      $s0, 0x0030($sp)
    li      $a1, 0x0024
    j       os_80012E88
    addiu   $sp, $sp, 0x0040
    nop
.L800139B0:
    ld      $ra, 0x0038($sp)
.L800139B4:
    ld      $s0, 0x0030($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0040

.globl os_800139C0
os_800139C0:
    addiu   $sp, $sp, -0x0070
    sd      $s3, 0x0040($sp)
    sd      $s2, 0x0038($sp)
    sd      $s1, 0x0030($sp)
    andi    $s3, $a1, 0x00FF
    andi    $s2, $a2, 0x00FF
    li      $v0, 0x001C
    li      $s1, 0x0028
    subu    $v0, $v0, $s2
    subu    $s1, $s1, $s3
    sd      $s0, 0x0028($sp)
    srl     $v1, $s1, 31
    srl     $s0, $v0, 31
    addu    $s0, $s0, $v0
    addu    $s1, $v1, $s1
    sra     $s1, $s1, 1
    sra     $s0, $s0, 1
    andi    $v0, $v0, 0x0001
    sd      $s7, 0x0060($sp)
    sd      $ra, 0x0068($sp)
    sd      $s6, 0x0058($sp)
    sd      $s5, 0x0050($sp)
    sd      $s4, 0x0048($sp)
    daddu   $s7, $a0, $0
    andi    $s1, $s1, 0x00FF
    beqz    $v0, .L80013A34
    andi    $s0, $s0, 0x00FF
    addiu   $s0, $s0, 0x0001
    andi    $s0, $s0, 0x00FF
.L80013A34:
    addiu   $s5, $s0, -0x0001
    daddu   $a3, $s3, $0
    li      $a0, 0x0020
    daddu   $a1, $s1, $0
    daddu   $a2, $s0, $0
    andi    $s5, $s5, 0x00FF
    addu    $s6, $s0, $s2
    andi    $s6, $s6, 0x00FF
    sw      $s2, 0x0024($sp)
    jal     os_800131E8
    addiu   $s4, $s1, -0x0001
    daddu   $a3, $s3, $0
    li      $a0, 0x0083
    daddu   $a1, $s1, $0
    jal     os_800130E0
    daddu   $a2, $s5, $0
    andi    $s4, $s4, 0x00FF
    daddu   $a3, $s3, $0
    li      $a0, 0x0083
    daddu   $a1, $s1, $0
    daddu   $a2, $s6, $0
    jal     os_800130E0
    addu    $s3, $s1, $s3
    andi    $s3, $s3, 0x00FF
    li      $a0, 0x0084
    daddu   $a1, $s4, $0
    daddu   $a2, $s0, $0
    jal     os_80012F70
    daddu   $a3, $s2, $0
    daddu   $a3, $s2, $0
    daddu   $a2, $s0, $0
    li      $a0, 0x0084
    jal     os_80012F70
    daddu   $a1, $s3, $0
    daddu   $a1, $s5, $0
    jal     os_80012D40
    daddu   $a0, $s4, $0
    jal     os_80012C10
    li      $a0, 0x0085
    jal     os_80012D90
    daddu   $a0, $s3, $0
    jal     os_80012C10
    li      $a0, 0x0086
    jal     os_80012DE0
    daddu   $a0, $s6, $0
    jal     os_80012C10
    li      $a0, 0x0088
    jal     os_80012D90
    daddu   $a0, $s4, $0
    jal     os_80012C10
    li      $a0, 0x0087
    beqz    $s7, .L80013B1C
    daddu   $a0, $s1, $0
    jal     os_80012DE0
    daddu   $a0, $s5, $0
    jal     os_80013300
    daddu   $a0, $s7, $0
    daddu   $a0, $s1, $0
.L80013B1C:
    daddu   $a1, $s0, $0
    ld      $ra, 0x0068($sp)
    ld      $s7, 0x0060($sp)
    ld      $s6, 0x0058($sp)
    ld      $s5, 0x0050($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    j       os_80012D40
    addiu   $sp, $sp, 0x0070
    nop

.globl os_80013B50
os_80013B50:
    lw      $v0, 0x0000($a0)
    addiu   $sp, $sp, -0x0058
    sd      $s2, 0x0038($sp)
    sd      $s1, 0x0030($sp)
    sd      $s0, 0x0028($sp)
    sd      $ra, 0x0050($sp)
    sd      $s4, 0x0048($sp)
    sd      $s3, 0x0040($sp)
    daddu   $s0, $a0, $0
    andi    $s2, $a1, 0x00FF
    daddu   $v1, $0, $0
    beqz    $v0, .L80013BAC
    li      $s1, 0x0004
    addiu   $v1, $v1, 0x0001
.L80013B88:
    andi    $v1, $v1, 0x00FF
    sll     $v0, $v1, 2
    addu    $v0, $s0, $v0
    lw      $v0, 0x0000($v0)
    bnezl   $v0, .L80013B88
    addiu   $v1, $v1, 0x0001
    sll     $s1, $v1, 1
    addiu   $s1, $s1, 0x0004
    andi    $s1, $s1, 0x00FF
.L80013BAC:
    daddu   $a0, $s0, $0
    jal     os_80015370
    andi    $s2, $s2, 0x0001
    beqz    $s2, .L80013D50
    nop
.L80013BC0:
    li      $a0, 0x3400
    jal     os_80012B60
    sd      $v0, 0x0020($sp)
    ld      $v0, 0x0020($sp)
    daddu   $a2, $s1, $0
    daddu   $a1, $v0, $0
    jal     os_800139C0
    daddu   $a0, $0, $0
    jal     os_80012B60
    li      $a0, 0x1400
    lw      $v0, 0x0000($s0)
    beqz    $v0, .L80013C2C
    lui     $s3, %hi(__str_80051050)
    addiu   $s3, %lo(__str_80051050)
    daddu   $s2, $s0, $0
    daddu   $s1, $0, $0
    addiu   $s1, $s1, 0x0001
.L80013C04:
    daddu   $a0, $s3, $0
    jal     os_80012F18
    andi    $s1, $s1, 0x00FF
    lw      $a0, 0x0000($s2)
    sll     $s2, $s1, 2
    jal     os_80013300
    addu    $s2, $s0, $s2
    lw      $v0, 0x0000($s2)
    bnez    $v0, .L80013C04
    addiu   $s1, $s1, 0x0001
.L80013C2C:
    jal     os_80012E40
    lui     $s3, %hi(__str_800513A8)
    addiu   $v0, $v0, 0x0002
    andi    $a0, $v0, 0x00FF
    jal     os_80012DE0
    lui     $s2, %hi(__str_800513B0)
    addiu   $s3, %lo(__str_800513A8)
    addiu   $s2, %lo(__str_800513B0)
    li      $s0, 0x0001
    li      $s1, 0x0001
    li      $s4, 0x0020
.L80013C58:
    jal     os_80012D90
    li      $a0, 0x0010
    jal     os_80012B60
    li      $a0, 0x2400
    beq     $s0, $s1, .L80013CE0
    li      $a0, 0x2400
.L80013C70:
    jal     os_80012B60
    nop
    jal     os_80012B70
    daddu   $a0, $s2, $0
    jal     os_80012D90
    li      $a0, 0x0014
    jal     os_80012B60
    li      $a0, 0x1000
    jal     os_80012B70
    daddu   $a0, $s3, $0
    jal     sysRepaint
    nop
    jal     sys_os_80016148
    nop
    andi    $v1, $v0, 0x0001
    bnez    $v1, .L80013D24
    ld      $ra, 0x0050($sp)
.L80013CB4:
    beq     $v0, $s4, .L80013D48
    li      $v1, 0x0010
    bne     $v0, $v1, .L80013C58
    nop
    jal     os_80012D90
    li      $a0, 0x0010
    li      $s0, 0x0001
    jal     os_80012B60
    li      $a0, 0x2400
    bne     $s0, $s1, .L80013C70
    li      $a0, 0x2400
.L80013CE0:
    jal     os_80012B60
    li      $a0, 0x1000
    jal     os_80012B70
    daddu   $a0, $s2, $0
    jal     os_80012D90
    li      $a0, 0x0014
    jal     os_80012B60
    li      $a0, 0x2400
    jal     os_80012B70
    daddu   $a0, $s3, $0
    jal     sysRepaint
    nop
    jal     sys_os_80016148
    nop
    andi    $v1, $v0, 0x0001
    beqz    $v1, .L80013CB4
    ld      $ra, 0x0050($sp)
.L80013D24:
    daddu   $v0, $s0, $0
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
    nop
.L80013D48:
    j       .L80013C58
    daddu   $s0, $0, $0
.L80013D50:
    jal     os_80013370
    sd      $v0, 0x0020($sp)
    j       .L80013BC0
    ld      $v0, 0x0020($sp)

.globl os_80013D60
os_80013D60:
    addiu   $sp, $sp, -0x00A0
    sd      $s4, 0x0070($sp)
    daddu   $s4, $a1, $0
    sd      $s1, 0x0058($sp)
    sd      $ra, 0x0098($sp)
    sd      $s8, 0x0090($sp)
    sd      $s7, 0x0088($sp)
    sd      $s6, 0x0080($sp)
    sd      $s5, 0x0078($sp)
    sd      $s3, 0x0068($sp)
    sd      $s2, 0x0060($sp)
    sd      $s0, 0x0050($sp)
    sw      $a0, 0x00A0($sp)
    jal     os_80013370
    andi    $s1, $a2, 0x00FF
    lw      $v0, 0x0000($s4)
    beqz    $v0, .L80014114
    daddu   $s3, $s4, $0
    daddu   $s6, $0, $0
    daddu   $s5, $0, $0
    daddu   $s0, $0, $0
    lw      $a0, 0x0008($v0)
.L80013DB8:
    jal     os_80015370
    daddu   $s2, $s6, $0
    andi    $v0, $v0, 0x00FF
    sltu    $v1, $s6, $v0
    bnezl   $v1, .L80013DD0
    daddu   $s2, $v0, $0
.L80013DD0:
    lw      $v0, 0x0000($s3)
    addiu   $s0, $s0, 0x0001
    lw      $a0, 0x0000($v0)
    jal     os_80014F68
    andi    $s0, $s0, 0x00FF
    andi    $v0, $v0, 0x00FF
    sll     $s3, $s0, 2
    sltu    $v1, $s5, $v0
    daddu   $s6, $s2, $0
    beqz    $v1, .L80013E00
    addu    $s3, $s4, $s3
    daddu   $s5, $v0, $0
.L80013E00:
    lw      $v0, 0x0000($s3)
    bnezl   $v0, .L80013DB8
    lw      $a0, 0x0008($v0)
    addu    $s8, $s5, $s2
    sll     $s7, $s0, 1
    addiu   $s8, $s8, 0x0003
    addiu   $s7, $s7, 0x0001
    andi    $s8, $s8, 0x00FF
    andi    $s7, $s7, 0x00FF
.L80013E24:
    addiu   $v0, $s0, -0x0001
    andi    $a0, $v0, 0x00FF
    lui     $s2, %hi(__str_80051050)
    lui     $s3, %hi(__str_800513B8)
    sll     $a1, $a0, 2
    sw      $v0, 0x0030($sp)
    sw      $a0, 0x0038($sp)
    addiu   $s2, %lo(__str_80051050)
    addiu   $s3, %lo(__str_800513B8)
    sw      $0, 0x0034($sp)
    sll     $s6, $s1, 2
    sw      $a1, 0x003C($sp)
    nop
.L80013E58:
    jal     os_80012B60
    li      $a0, 0x2400
    lw      $a0, 0x00A0($sp)
    daddu   $a1, $s8, $0
    jal     os_800139C0
    daddu   $a2, $s7, $0
    jal     os_80012E40
    nop
    jal     os_80012E30
    sw      $v0, 0x002C($sp)
    beqz    $s0, .L80014050
    sw      $v0, 0x0028($sp)
.L80013E88:
    sw      $s4, 0x0024($sp)
    sw      $s4, 0x0020($sp)
    daddu   $v1, $0, $0
    lw      $v0, 0x0020($sp)
.L80013E98:
    xor     $a0, $s1, $v1
    lw      $a2, 0x0000($v0)
    sltiu   $a0, $a0, 0x0001
    lbu     $a1, 0x000C($a2)
    sd      $v1, 0x0048($sp)
    andi    $a1, $a1, 0x0080
    jal     os_800134A0
    sd      $a2, 0x0040($sp)
    jal     os_80012F18
    daddu   $a0, $s2, $0
    ld      $a2, 0x0040($sp)
    lw      $a1, 0x0020($sp)
    lw      $a0, 0x0000($a2)
    addiu   $a1, $a1, 0x0004
    jal     os_80012F18
    sw      $a1, 0x0020($sp)
    ld      $v1, 0x0048($sp)
    addiu   $v1, $v1, 0x0001
    andi    $v1, $v1, 0x00FF
    sltu    $v0, $v1, $s0
    bnez    $v0, .L80013E98
    lw      $v0, 0x0020($sp)
    jal     os_80012DE0
    lw      $a0, 0x002C($sp)
    lw      $a2, 0x0028($sp)
    addu    $a0, $a2, $s5
    jal     os_80012D90
    andi    $a0, $a0, 0x00FF
    daddu   $v1, $0, $0
    lw      $a0, 0x0024($sp)
.L80013F10:
    lw      $v0, 0x0000($a0)
    xor     $a0, $s1, $v1
    lbu     $a1, 0x000C($v0)
    sltiu   $a0, $a0, 0x0001
    andi    $a1, $a1, 0x0080
    sd      $v0, 0x0040($sp)
    jal     os_800134A0
    sd      $v1, 0x0048($sp)
    jal     os_80012F18
    daddu   $a0, $s2, $0
    ld      $v0, 0x0040($sp)
    lw      $a2, 0x0024($sp)
    lw      $a1, 0x0004($v0)
    addiu   $a2, $a2, 0x0004
    daddu   $a0, $s3, $0
    sw      $a2, 0x0024($sp)
    beqz    $a1, .L80013F84
    ld      $v1, 0x0048($sp)
    jal     os_80012F18
    nop
    ld      $v0, 0x0040($sp)
    lw      $a1, 0x0004($v0)
    lw      $a0, 0x0008($v0)
    lbu     $v0, 0x0000($a1)
    sll     $v0, $v0, 2
    addu    $v0, $a0, $v0
    jal     os_80012B70
    lw      $a0, 0x0000($v0)
    ld      $v1, 0x0048($sp)
.L80013F84:
    addiu   $v1, $v1, 0x0001
    andi    $v1, $v1, 0x00FF
    sltu    $v0, $v1, $s0
    bnez    $v0, .L80013F10
    lw      $a0, 0x0024($sp)
    jal     sysRepaint
    nop
    jal     sys_os_80016148
    nop
    addu    $v1, $s4, $s6
    li      $a0, 0x0002
    beq     $v0, $a0, .L80014088
    lw      $v1, 0x0000($v1)
.L80013FB8:
    li      $a2, 0x0800
    beq     $v0, $a2, .L800140E8
    li      $a0, 0x0008
    beq     $v0, $a0, .L800140C8
    li      $a2, 0x0001
    bne     $v0, $a2, .L80013E58
    nop
    lb      $v0, 0x000C($v1)
    bltz    $v0, .L80013E58
    nop
    lw      $v0, 0x0004($v1)
    beqz    $v0, .L80014098
    ld      $ra, 0x0098($sp)
    lbu     $a0, 0x0000($v0)
    sw      $a2, 0x0034($sp)
    addiu   $a0, $a0, 0x0001
    sb      $a0, 0x0000($v0)
    lw      $v0, 0x0004($v1)
    lw      $a0, 0x0008($v1)
    lbu     $v1, 0x0000($v0)
    sll     $v1, $v1, 2
    addu    $v1, $a0, $v1
    lw      $v1, 0x0000($v1)
    bnez    $v1, .L80013E58
    nop
    sb      $0, 0x0000($v0)
    jal     os_80012B60
    li      $a0, 0x2400
    lw      $a0, 0x00A0($sp)
    daddu   $a1, $s8, $0
    jal     os_800139C0
    daddu   $a2, $s7, $0
    jal     os_80012E40
    nop
    jal     os_80012E30
    sw      $v0, 0x002C($sp)
    bnez    $s0, .L80013E88
    sw      $v0, 0x0028($sp)
.L80014050:
    jal     os_80012DE0
    lw      $a0, 0x002C($sp)
    lw      $v0, 0x0028($sp)
    addu    $a0, $v0, $s5
    jal     os_80012D90
    andi    $a0, $a0, 0x00FF
    jal     sysRepaint
    nop
    jal     sys_os_80016148
    nop
    addu    $v1, $s4, $s6
    li      $a0, 0x0002
    bne     $v0, $a0, .L80013FB8
    lw      $v1, 0x0000($v1)
.L80014088:
    lw      $a1, 0x0034($sp)
    li      $s1, 0x00FF
    subu    $s1, $s1, $a1
    ld      $ra, 0x0098($sp)
.L80014098:
    daddu   $v0, $s1, $0
    ld      $s8, 0x0090($sp)
    ld      $s7, 0x0088($sp)
    ld      $s6, 0x0080($sp)
    ld      $s5, 0x0078($sp)
    ld      $s4, 0x0070($sp)
    ld      $s3, 0x0068($sp)
    ld      $s2, 0x0060($sp)
    ld      $s1, 0x0058($sp)
    ld      $s0, 0x0050($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00A0
.L800140C8:
    lw      $a1, 0x0030($sp)
    beql    $s1, $a1, .L8001410C
    daddu   $s1, $0, $0
    addiu   $s1, $s1, 0x0001
    andi    $s1, $s1, 0x00FF
    j       .L80013E58
    sll     $s6, $s1, 2
    nop
.L800140E8:
    bnezl   $s1, .L80014100
    addiu   $s1, $s1, -0x0001
    lw      $s1, 0x0038($sp)
    j       .L80013E58
    lw      $s6, 0x003C($sp)
    nop
.L80014100:
    andi    $s1, $s1, 0x00FF
    j       .L80013E58
    sll     $s6, $s1, 2
.L8001410C:
    j       .L80013E58
    daddu   $s6, $0, $0
.L80014114:
    li      $s7, 0x0001
    li      $s8, 0x0003
    daddu   $s5, $0, $0
    j       .L80013E24
    daddu   $s0, $0, $0

.globl os_80014128
os_80014128:
    addiu   $sp, $sp, -0x0090
    sd      $s2, 0x0050($sp)
    sd      $s1, 0x0048($sp)
    sd      $s0, 0x0040($sp)
    sd      $ra, 0x0088($sp)
    sd      $s8, 0x0080($sp)
    sd      $s7, 0x0078($sp)
    sd      $s6, 0x0070($sp)
    sd      $s5, 0x0068($sp)
    sd      $s4, 0x0060($sp)
    sd      $s3, 0x0058($sp)
    lbu     $s6, 0x000D($a0)
    daddu   $s1, $a0, $0
    andi    $v0, $s6, 0x0001
    lw      $s2, 0x0004($a0)
    beqz    $v0, .L80014458
    lw      $s0, 0x0008($a0)
.L8001416C:
    jal     os_800137D8
    daddu   $a0, $s1, $0
    lhu     $a0, 0x0014($s1)
    bnez    $a0, .L80014448
    lbu     $s3, 0x0012($s1)
    jal     os_80012B60
    li      $a0, 0x2400
    lw      $a0, 0x0000($s1)
.L8001418C:
    lbu     $a1, 0x0010($s1)
    lbu     $a2, 0x0011($s1)
    jal     os_800139C0
    andi    $s4, $s6, 0x0008
    jal     os_80012E40
    andi    $s8, $s6, 0x0004
    sw      $v0, 0x0024($sp)
    andi    $v0, $s6, 0x0020
    daddu   $s5, $0, $0
    sw      $v0, 0x0028($sp)
    sw      $s4, 0x0020($sp)
    li      $s7, -0x0080
    andi    $s6, $s6, 0x0010
.L800141C0:
    jal     os_80012DE0
    lw      $a0, 0x0024($sp)
    lw      $v0, 0x0000($s2)
    beqz    $v0, .L8001428C
    daddu   $v1, $s2, $0
    daddu   $a0, $0, $0
    j       .L80014208
    daddu   $v0, $0, $0
.L800141E0:
    jal     os_80012E88
    lw      $a0, 0x0000($v1)
    ld      $v0, 0x0038($sp)
    addiu   $v0, $v0, 0x0001
.L800141F0:
    andi    $v0, $v0, 0x00FF
    sll     $v1, $v0, 2
    addu    $v1, $s2, $v1
    lw      $a1, 0x0000($v1)
    beqz    $a1, .L8001428C
    daddu   $a0, $v0, $0
.L80014208:
    beqz    $s0, .L80014214
    addu    $a0, $s0, $a0
    lbu     $s5, 0x0000($a0)
.L80014214:
    andi    $a0, $s5, 0x0040
    bnezl   $a0, .L800141F0
    addiu   $v0, $v0, 0x0001
    beqz    $s8, .L80014330
    lui     $a0, %hi(__str_80051050)
.L80014228:
    lbu     $a0, 0x000C($s1)
    lw      $a2, 0x0020($sp)
    xor     $a0, $a0, $v0
    and     $a1, $s5, $s7
    or      $a1, $a2, $a1
    sltiu   $a0, $a0, 0x0001
    sd      $v0, 0x0038($sp)
    jal     os_800134A0
    sd      $v1, 0x0030($sp)
    daddu   $a1, $s3, $0
    ld      $v0, 0x0038($sp)
    bnez    $s6, .L800141E0
    ld      $v1, 0x0030($sp)
    lw      $a0, 0x0000($v1)
    daddu   $a1, $s3, $0
    jal     os_80013240
    sd      $v0, 0x0038($sp)
    ld      $v0, 0x0038($sp)
    addiu   $v0, $v0, 0x0001
    andi    $v0, $v0, 0x00FF
    sll     $v1, $v0, 2
    addu    $v1, $s2, $v1
    lw      $a1, 0x0000($v1)
    bnez    $a1, .L80014208
    daddu   $a0, $v0, $0
.L8001428C:
    lw      $v0, 0x0028($sp)
    bnez    $v0, .L80014390
    nop
.L80014298:
    jal     sysRepaint
    nop
    lbu     $v0, 0x000D($s1)
    andi    $v0, $v0, 0x0002
    bnez    $v0, .L80014300
    ld      $ra, 0x0088($sp)
    jal     sys_os_80016148
    nop
    beqz    $s0, .L800142CC
    nop
    lbu     $v1, 0x000C($s1)
    addu    $v1, $s0, $v1
    lbu     $s5, 0x0000($v1)
.L800142CC:
    bnez    $s4, .L800142FC
    li      $v1, 0x0800
    beq     $v0, $v1, .L80014400
    li      $a2, 0x0008
    beq     $v0, $a2, .L800143B8
    li      $v1, 0x0001
    bnel    $v0, $v1, .L80014354
    li      $a2, 0x0002
    sll     $v0, $s5, 24
    sra     $v0, $v0, 24
    bltz    $v0, .L800141C0
    nop
.L800142FC:
    ld      $ra, 0x0088($sp)
.L80014300:
    ld      $s8, 0x0080($sp)
    ld      $s7, 0x0078($sp)
    ld      $s6, 0x0070($sp)
    ld      $s5, 0x0068($sp)
    ld      $s4, 0x0060($sp)
    ld      $s3, 0x0058($sp)
    ld      $s2, 0x0050($sp)
    ld      $s1, 0x0048($sp)
    ld      $s0, 0x0040($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0090
    nop
.L80014330:
    addiu   $a0, %lo(__str_80051050)
    sd      $v0, 0x0038($sp)
    jal     os_80012F18
    sd      $v1, 0x0030($sp)
    ld      $v1, 0x0030($sp)
    j       .L80014228
    ld      $v0, 0x0038($sp)
    nop
.L80014350:
    li      $a2, 0x0002
.L80014354:
    bne     $v0, $a2, .L800141C0
    li      $v0, -0x0001
    sb      $v0, 0x000C($s1)
    ld      $ra, 0x0088($sp)
    ld      $s8, 0x0080($sp)
    ld      $s7, 0x0078($sp)
    ld      $s6, 0x0070($sp)
    ld      $s5, 0x0068($sp)
    ld      $s4, 0x0060($sp)
    ld      $s3, 0x0058($sp)
    ld      $s2, 0x0050($sp)
    ld      $s1, 0x0048($sp)
    ld      $s0, 0x0040($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0090
.L80014390:
    jal     os_80012B60
    li      $a0, 0x1400
    lbu     $v0, 0x000C($s1)
    sll     $v0, $v0, 2
    addu    $v0, $s2, $v0
    jal     os_80013930
    lw      $a0, 0x0000($v0)
    j       .L80014298
    nop
    nop
.L800143B8:
    lbu     $a0, 0x000F($s1)
    lbu     $v0, 0x000C($s1)
    addiu   $v0, $v0, 0x0001
.L800143C4:
    andi    $v0, $v0, 0x00FF
    sltu    $v1, $v0, $a0
    bnez    $v1, .L800143D8
    sb      $v0, 0x000C($s1)
    sb      $0, 0x000C($s1)
.L800143D8:
    beqz    $s0, .L800141C0
    nop
    lbu     $v0, 0x000C($s1)
    addu    $v1, $s0, $v0
    lbu     $v1, 0x0000($v1)
    andi    $v1, $v1, 0x0040
    bnez    $v1, .L800143C4
    addiu   $v0, $v0, 0x0001
    j       .L800141C0
    nop
.L80014400:
    lbu     $a1, 0x000F($s1)
    lbu     $v1, 0x000C($s1)
    addiu   $a1, $a1, -0x0001
    j       .L80014438
    andi    $a1, $a1, 0x00FF
    nop
.L80014418:
    daddu   $v1, $a1, $0
.L8001441C:
    addu    $a0, $s0, $v1
    beqz    $s0, .L80014350
    sb      $v1, 0x000C($s1)
    lbu     $a0, 0x0000($a0)
    andi    $a0, $a0, 0x0040
    beqz    $a0, .L80014354
    li      $a2, 0x0002
.L80014438:
    beqz    $v1, .L80014418
    addiu   $a0, $v1, -0x0001
    j       .L8001441C
    andi    $v1, $a0, 0x00FF
.L80014448:
    jal     os_80012B60
    nop
    j       .L8001418C
    lw      $a0, 0x0000($s1)
.L80014458:
    jal     os_80013370
    nop
    j       .L8001416C
    nop

.globl os_80014468
os_80014468:
    lw      $v0, 0x0000($a0)
    addiu   $sp, $sp, -0x0058
    sd      $s2, 0x0038($sp)
    sd      $s1, 0x0030($sp)
    sd      $s0, 0x0028($sp)
    sd      $ra, 0x0050($sp)
    sd      $s4, 0x0048($sp)
    sd      $s3, 0x0040($sp)
    daddu   $s0, $a0, $0
    andi    $s1, $a1, 0x00FF
    daddu   $v1, $0, $0
    beqz    $v0, .L800144C4
    li      $s2, 0x0001
    addiu   $v1, $v1, 0x0001
.L800144A0:
    andi    $v1, $v1, 0x00FF
    sll     $v0, $v1, 2
    addu    $v0, $s0, $v0
    lw      $v0, 0x0000($v0)
    bnezl   $v0, .L800144A0
    addiu   $v1, $v1, 0x0001
    sll     $s2, $v1, 1
    addiu   $s2, $s2, 0x0001
    andi    $s2, $s2, 0x00FF
.L800144C4:
    jal     os_80015370
    daddu   $a0, $s0, $0
    andi    $v1, $s1, 0x0001
    beqz    $v1, .L80014590
    nop
.L800144D8:
    li      $a0, 0x3400
    jal     os_80012B60
    sd      $v0, 0x0020($sp)
    ld      $v0, 0x0020($sp)
    daddu   $a2, $s2, $0
    daddu   $a1, $v0, $0
    jal     os_800139C0
    daddu   $a0, $0, $0
    jal     os_80012B60
    li      $a0, 0x1400
    lw      $v0, 0x0000($s0)
    beqz    $v0, .L80014544
    lui     $s4, %hi(__str_80051050)
    addiu   $s4, %lo(__str_80051050)
    daddu   $s3, $s0, $0
    daddu   $s2, $0, $0
    addiu   $s2, $s2, 0x0001
.L8001451C:
    daddu   $a0, $s4, $0
    jal     os_80012F18
    andi    $s2, $s2, 0x00FF
    lw      $a0, 0x0000($s3)
    sll     $s3, $s2, 2
    jal     os_80013300
    addu    $s3, $s0, $s3
    lw      $v0, 0x0000($s3)
    bnez    $v0, .L8001451C
    addiu   $s2, $s2, 0x0001
.L80014544:
    jal     sysRepaint
    andi    $s1, $s1, 0x0002
    beqz    $s1, .L80014570
    ld      $ra, 0x0050($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
.L80014570:
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    j       sys_os_80016148
    addiu   $sp, $sp, 0x0058
    nop
.L80014590:
    jal     os_80013370
    sd      $v0, 0x0020($sp)
    j       .L800144D8
    ld      $v0, 0x0020($sp)

.globl os_800145A0
os_800145A0:
    addiu   $sp, $sp, -0x0030
    sw      $a0, 0x0020($sp)
    andi    $a1, $a1, 0x00FF
    addiu   $a0, $sp, 0x0020
    sd      $ra, 0x0028($sp)
    jal     os_80014468
    sw      $0, 0x0024($sp)
    ld      $ra, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030

.globl os_800145C8
os_800145C8:
    lui     $v0, %hi(_80052950)
    sw      $0, %lo(_80052950)($v0)
    lui     $v0, %hi(_80052954)
    jr      $ra
    sw      $0, %lo(_80052954)($v0)
    nop

.globl os_800145E0
os_800145E0:
    andi    $v0, $a0, 0x0003
    bnezl   $v0, .L800145EC
    addiu   $a0, $v0, 0x0004
.L800145EC:
    lui     $v0, %hi(_80052950)
    lw      $v1, %lo(_80052950)($v0)
    subu    $a0, $v1, $a0
    jr      $ra
    sw      $a0, %lo(_80052950)($v0)

.globl os_80014600
os_80014600:
    srl     $a2, $a2, 1
    beqz    $a2, .L80014620
    andi    $a1, $a1, 0xFFFF
    nop
.L80014610:
    addiu   $a2, $a2, -0x0001
    sh      $a1, 0x0000($a0)
    bnez    $a2, .L80014610
    addiu   $a0, $a0, 0x0002
.L80014620:
    jr      $ra
    nop

.globl os_80014628
os_80014628:
    lui     $v0, %hi(_80052950)
    jr      $ra
    lw      $v0, %lo(_80052950)($v0)
    nop
    lui     $v0, %hi(_80052954)
    jr      $ra
    lw      $v0, %lo(_80052954)($v0)
    nop

.globl os_80014648
os_80014648:
    beqz    $a2, .L80014664
    andi    $a1, $a1, 0x00FF
.L80014650:
    lbu     $v0, 0x0000($a0)
    bne     $v0, $a1, .L80014670
    addiu   $a2, $a2, -0x0001
    bnez    $a2, .L80014650
    addiu   $a0, $a0, 0x0001
.L80014664:
    jr      $ra
    li      $v0, 0x0001
    nop
.L80014670:
    jr      $ra
    daddu   $v0, $0, $0

.globl os_80014678
os_80014678:
    daddu   $v0, $0, $0
    nop
.L80014680:
    addu    $a3, $a0, $v0
    beqz    $a2, .L800146A8
    addu    $v1, $a1, $v0
    lbu     $a3, 0x0000($a3)
    lbu     $v1, 0x0000($v1)
    addiu   $v0, $v0, 0x0001
    beq     $a3, $v1, .L80014680
    addiu   $a2, $a2, -0x0001
    jr      $ra
    daddu   $v0, $0, $0
.L800146A8:
    jr      $ra
    li      $v0, 0x0001

.globl os_800146B0
os_800146B0:
    lui     $v1, %hi(_80052954)
    lui     $v0, %hi(_80052950)
    lw      $v0, %lo(_80052950)($v0)
    lw      $a0, %lo(_80052954)($v1)
    addiu   $sp, $sp, -0x0028
    sltu    $a0, $a0, $v0
    beqz    $a0, .L800146D4
    sd      $ra, 0x0020($sp)
    sw      $v0, %lo(_80052954)($v1)
.L800146D4:
    sltiu   $v0, $v0, 0x2001
    beqz    $v0, .L800146E8
    ld      $ra, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028
.L800146E8:
    jal     os_80013370
    nop
    jal     os_80012DE0
    li      $a0, 0x000F
    lui     $a0, %hi(__str_800513C0)
    jal     os_80013300
    addiu   $a0, %lo(__str_800513C0)
    jal     sysRepaint
    nop
.L8001470C:
    j       .L8001470C
    nop
    nop

.globl os_80014718
os_80014718:
    addiu   $sp, $sp, -0x0030
    lui     $v0, %hi(_80052950)
    andi    $v1, $a0, 0x0003
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0028($sp)
    beqz    $v1, .L80014740
    lw      $s0, %lo(_80052950)($v0)
    li      $v1, -0x0004
    and     $a0, $a0, $v1
    addiu   $a0, $a0, 0x0004
.L80014740:
    addu    $a0, $a0, $s0
    jal     os_800146B0
    sw      $a0, %lo(_80052950)($v0)
    lui     $v0, %hi(_80079DA8)
    ld      $ra, 0x0028($sp)
    addiu   $v0, %lo(_80079DA8)
    addu    $v0, $v0, $s0
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030

.globl os_80014768
os_80014768:
    daddu   $v0, $a0, $0
    daddu   $a0, $a1, $0
    j       memcpy
    daddu   $a1, $v0, $0

.globl os_80014778
os_80014778:
    j       memset
    andi    $a1, $a1, 0x00FF

.globl os_80014780
os_80014780:
    daddu   $v0, $a0, $0
    li      $v1, 0x0013
.L80014788:
    lw      $a2, 0x0048($v0)
    addiu   $v1, $v1, -0x0001
    andi    $v1, $v1, 0x00FF
    sw      $a2, 0x004C($v0)
    bnez    $v1, .L80014788
    addiu   $v0, $v0, -0x0004
    jr      $ra
    sw      $a1, 0x0000($a0)

.globl os_800147A8
os_800147A8:
    addiu   $sp, $sp, -0x0058
    sd      $s1, 0x0030($sp)
    sw      $0, 0x0000($a1)
    daddu   $s1, $a0, $0
    li      $a0, 0x0170
    sd      $ra, 0x0050($sp)
    sd      $s2, 0x0038($sp)
    sd      $s0, 0x0028($sp)
    daddu   $s2, $a1, $0
    sd      $s4, 0x0048($sp)
    jal     os_80014718
    sd      $s3, 0x0040($sp)
    daddu   $a0, $v0, $0
    daddu   $a1, $0, $0
    li      $a2, 0x0170
    jal     os_80014778
    daddu   $s0, $v0, $0
    li      $v0, -0x0002
    sw      $v0, 0x0080($s0)
    lui     $v0, %hi(__str_800506B0)
    addiu   $v0, %lo(__str_800506B0)
    sw      $v0, 0x0090($s0)
    daddu   $a1, $0, $0
    daddu   $v0, $s1, $0
    li      $a2, 0x0014
    lw      $v1, 0x0000($v0)
.L80014810:
    addiu   $a0, $a1, 0x0001
    beqz    $v1, .L80014828
    addiu   $v0, $v0, 0x0004
    andi    $a1, $a0, 0x00FF
    bnel    $a1, $a2, .L80014810
    lw      $v1, 0x0000($v0)
.L80014828:
    daddu   $a0, $s1, $0
    jal     fat_os_8000F8D0
    li      $a2, -0x0002
    li      $s3, 0x0002
    li      $s4, 0x0003
.L8001483C:
    jal     os_800128D8
    daddu   $a0, $s0, $0
    bnezl   $v0, .L8001487C
    li      $a0, 0x0170
    lhu     $v1, 0x008C($s0)
    beq     $v1, $s3, .L8001483C
    nop
    beq     $v1, $s4, .L8001483C
    li      $a0, 0x0001
    bne     $v1, $a0, .L8001487C
    li      $a0, 0x0170
    lhu     $v1, 0x008A($s0)
    sll     $v1, $v1, 2
    addu    $s1, $s1, $v1
    lw      $v1, 0x0000($s1)
    sw      $v1, 0x0000($s2)
.L8001487C:
    jal     os_800145E0
    sd      $v0, 0x0020($sp)
    ld      $ra, 0x0050($sp)
    ld      $v0, 0x0020($sp)
    ld      $s4, 0x0048($sp)
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0058
    andi    $a1, $a1, 0x00FF
    beqz    $a1, .L800148E0
    daddu   $v0, $0, $0
    addiu   $a1, $a1, -0x0001
    andi    $a1, $a1, 0x00FF
    addiu   $v1, $a0, 0x0001
    j       .L800148CC
    addu    $a1, $v1, $a1
.L800148C8:
    addiu   $v1, $v1, 0x0001
.L800148CC:
    lbu     $a0, 0x0000($a0)
    sll     $v0, $v0, 8
    or      $v0, $v0, $a0
    bne     $v1, $a1, .L800148C8
    daddu   $a0, $v1, $0
.L800148E0:
    jr      $ra
    nop

.globl os_800148E8
os_800148E8:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    lui     $s0, %hi(_8007BDA8)
    addiu   $a1, $s0, %lo(_8007BDA8)
    daddu   $a0, $0, $0
    li      $a2, 0x0010
    sd      $ra, 0x0028($sp)
    jal     sys_os_80016A10
    addiu   $s0, %lo(_8007BDA8)
    sw      $v0, 0x0010($s0)
    daddu   $a0, $s0, $0
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    daddu   $a1, $0, $0
    li      $a2, 0x0014
    j       BiI2CWr
    addiu   $sp, $sp, 0x0030
    nop

.globl os_80014930
os_80014930:
    addiu   $sp, $sp, -0x0050
    sd      $s0, 0x0028($sp)
    li      $v1, 0x0052
    lui     $s0, %hi(_8007BDA8)
    li      $v0, 0x0045
    sb      $v1, 0x0021($sp)
    addiu   $a0, $s0, %lo(_8007BDA8)
    li      $v1, 0x0047
    daddu   $a1, $0, $0
    li      $a2, 0x0014
    sd      $s1, 0x0030($sp)
    sd      $ra, 0x0048($sp)
    sd      $s3, 0x0040($sp)
    sd      $s2, 0x0038($sp)
    sb      $v0, 0x0022($sp)
    sb      $v1, 0x0023($sp)
    jal     BiI2CRd
    sb      $v0, 0x0020($sp)
    beqz    $v0, .L800149A0
    daddu   $s1, $v0, $0
    ld      $ra, 0x0048($sp)
    daddu   $v0, $s1, $0
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
.L800149A0:
    daddu   $a0, $0, $0
    addiu   $a1, $s0, %lo(_8007BDA8)
    li      $a2, 0x0010
    jal     sys_os_80016A10
    addiu   $s2, $sp, 0x0020
    daddu   $a0, $s2, $0
    addiu   $a1, $s0, %lo(_8007BDA8)
    li      $a2, 0x0004
    jal     os_80014E10
    daddu   $s3, $v0, $0
    addiu   $v1, $s0, %lo(_8007BDA8)
    lw      $v1, 0x0010($v1)
    beq     $s3, $v1, .L80014A28
    nop
.L800149D8:
    addiu   $a0, $s0, %lo(_8007BDA8)
    daddu   $a1, $0, $0
    jal     os_80014778
    li      $a2, 0x0014
    daddu   $a0, $s2, $0
    addiu   $a1, $s0, %lo(_8007BDA8)
    jal     os_80014768
    li      $a2, 0x0004
    jal     os_800148E8
    nop
    ld      $ra, 0x0048($sp)
    daddu   $s1, $v0, $0
    daddu   $v0, $s1, $0
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
    nop
.L80014A28:
    beqz    $v0, .L800149D8
    ld      $ra, 0x0048($sp)
    daddu   $v0, $s1, $0
    ld      $s3, 0x0040($sp)
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0050
    nop

.globl os_80014A50
os_80014A50:
    addiu   $sp, $sp, -0x0028
    sd      $ra, 0x0020($sp)
    jal     os_80014930
    nop
    beqz    $v0, .L80014A70
    ld      $ra, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0028
.L80014A70:
    lui     $v0, %hi(_8007BDA8)
    addiu   $v0, %lo(_8007BDA8)
    lw      $v1, 0x0008($v0)
    addiu   $v1, $v1, 0x0001
    sw      $v1, 0x0008($v0)
    j       os_800148E8
    addiu   $sp, $sp, 0x0028
    nop

.globl os_80014A90
os_80014A90:
    addiu   $sp, $sp, -0x0090
    sd      $s2, 0x0070($sp)
    addiu   $s2, $sp, 0x0020
    daddu   $a0, $s2, $0
    sd      $s1, 0x0068($sp)
    sd      $ra, 0x0088($sp)
    sd      $s4, 0x0080($sp)
    sd      $s3, 0x0078($sp)
    jal     bios_os_80000E30
    sd      $s0, 0x0060($sp)
    bnez    $v0, .L80014BFC
    daddu   $s1, $v0, $0
    lbu     $v0, 0x002C($sp)
    lbu     $a0, 0x002D($sp)
    sll     $v0, $v0, 8
    or      $v0, $v0, $a0
    lbu     $a0, 0x002E($sp)
    sll     $v0, $v0, 8
    or      $v0, $v0, $a0
    lbu     $a0, 0x002F($sp)
    lbu     $v1, 0x0028($sp)
    sll     $v0, $v0, 8
    lui     $s0, %hi(_8007BDA8)
    addiu   $s0, %lo(_8007BDA8)
    lbu     $a1, 0x0029($sp)
    or      $v0, $v0, $a0
    sw      $v0, 0x0028($s0)
    sll     $v1, $v1, 8
    lbu     $v0, 0x004D($sp)
    or      $v1, $v1, $a1
    lbu     $a1, 0x002A($sp)
    lbu     $a3, 0x0024($sp)
    lbu     $a2, 0x0026($sp)
    sb      $v0, 0x0030($s0)
    sll     $v1, $v1, 8
    lbu     $v0, 0x0054($sp)
    or      $v1, $v1, $a1
    lbu     $t1, 0x0025($sp)
    lbu     $a1, 0x002B($sp)
    lbu     $t0, 0x0027($sp)
    sb      $v0, 0x0031($s0)
    sll     $a3, $a3, 8
    lbu     $v0, 0x004C($sp)
    sll     $a2, $a2, 8
    sll     $v1, $v1, 8
    or      $v1, $v1, $a1
    or      $a3, $a3, $t1
    or      $a2, $a2, $t0
    daddu   $a0, $s2, $0
    li      $a1, 0x0030
    sw      $v1, 0x0024($s0)
    sh      $a3, 0x002C($s0)
    sh      $a2, 0x002E($s0)
    sb      $v0, 0x0032($s0)
    lbu     $s4, 0x0052($sp)
    jal     sys_80006500
    lbu     $s3, 0x0053($sp)
    lw      $a0, 0x0024($s0)
    li      $v1, 0xF001
    beql    $a0, $v1, .L80014CE0
    lw      $a0, 0x0028($s0)
.L80014B84:
    addiu   $v1, $sp, 0x0038
.L80014B88:
    addiu   $t3, $sp, 0x003C
    lbu     $a0, 0x0000($v1)
.L80014B90:
    lbu     $t0, 0x0020($v1)
    lbu     $a1, 0x0004($v1)
    lbu     $t2, 0x0024($v1)
    lbu     $t1, 0x0010($v1)
    lbu     $a3, 0x0008($v1)
    lbu     $a2, 0x000C($v1)
    xor     $a3, $a0, $a3
    xor     $a2, $a1, $a2
    xor     $t0, $a0, $t0
    xor     $a1, $a1, $t2
    xor     $a0, $a0, $t1
    sb      $t0, 0x0020($v1)
    sb      $a1, 0x0024($v1)
    sb      $a0, 0x0010($v1)
    sb      $a3, 0x0008($v1)
    sb      $a2, 0x000C($v1)
    addiu   $v1, $v1, 0x0001
    bnel    $v1, $t3, .L80014B90
    lbu     $a0, 0x0000($v1)
    lbu     $v1, 0x0050($sp)
    sll     $s4, $s4, 8
    nor     $v1, $0, $v1
    andi    $v1, $v1, 0x00FF
    or      $s3, $s4, $s3
    sb      $v1, 0x0050($sp)
    beq     $s3, $v0, .L80014C20
    lbu     $a0, 0x0051($sp)
.L80014BFC:
    ld      $ra, 0x0088($sp)
.L80014C00:
    daddu   $v0, $s1, $0
.L80014C04:
    ld      $s4, 0x0080($sp)
    ld      $s3, 0x0078($sp)
    ld      $s2, 0x0070($sp)
    ld      $s1, 0x0068($sp)
    ld      $s0, 0x0060($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0090
.L80014C20:
    nor     $a0, $0, $a0
    lbu     $v0, 0x0052($sp)
    andi    $a0, $a0, 0x00FF
    bne     $v0, $v1, .L80014BFC
    sb      $a0, 0x0051($sp)
    lbu     $v0, 0x0053($sp)
    bne     $v0, $a0, .L80014C00
    ld      $ra, 0x0088($sp)
    lui     $v1, %hi(_8007BDC8)
    addiu   $v1, %lo(_8007BDC8)
    addiu   $v0, $sp, 0x0048
    addiu   $a2, $s2, 0x002C
.L80014C50:
    lbu     $a1, 0x0000($v0)
    lbu     $a0, -0x0024($v0)
    bne     $a1, $a0, .L80014C00
    ld      $ra, 0x0088($sp)
    lbu     $a1, -0x0008($v0)
    lbu     $a0, -0x0004($v1)
    bnel    $a1, $a0, .L80014C04
    daddu   $v0, $s1, $0
    lbu     $a1, -0x0004($v0)
    lbu     $a0, 0x0000($v1)
    bne     $a1, $a0, .L80014C00
    addiu   $v0, $v0, 0x0001
    bne     $v0, $a2, .L80014C50
    addiu   $v1, $v1, 0x0001
    lbu     $v0, 0x000E($s0)
    bnez    $v0, .L80014C04
    daddu   $v0, $s1, $0
    jal     bios_os_800015E0
    nop
    bnez    $v0, .L80014BFC
    daddu   $a2, $s0, $0
    li      $a1, 0x0008
    addu    $a0, $s2, $v0
.L80014CAC:
    addu    $v1, $s0, $v0
    lbu     $a0, 0x0038($a0)
    lbu     $v1, 0x0014($v1)
    bne     $a0, $v1, .L80014BFC
    addiu   $v0, $v0, 0x0001
    bnel    $v0, $a1, .L80014CAC
    addu    $a0, $s2, $v0
    lbu     $v0, 0x0033($a2)
    bnez    $v0, .L80014BFC
    li      $v0, 0x0001
    j       .L80014BFC
    sb      $v0, 0x0033($a2)
    nop
.L80014CE0:
    li      $v1, 0xF002
    bne     $a0, $v1, .L80014B88
    addiu   $v1, $sp, 0x0038
    li      $v1, 0x0001
    j       .L80014B84
    sb      $v1, 0x0034($s0)

.globl os_80014CF8
os_80014CF8:
    addiu   $sp, $sp, -0x0048
    sd      $s1, 0x0030($sp)
    lui     $s1, %hi(_8007BDA8)
    sd      $s2, 0x0038($sp)
    sd      $s0, 0x0028($sp)
    daddu   $a1, $0, $0
    li      $a2, 0x0038
    andi    $s2, $a0, 0x00FF
    lui     $s0, %hi(_8007BDBC)
    sd      $ra, 0x0040($sp)
    jal     os_80014778
    addiu   $a0, $s1, %lo(_8007BDA8)
    addiu   $a0, $s0, %lo(_8007BDBC)
    li      $a1, 0x00F8
    jal     BiI2CWr
    li      $a2, 0x0008
    beqz    $v0, .L80014D58
    addiu   $a0, $s0, %lo(_8007BDBC)
    ld      $ra, 0x0040($sp)
.L80014D44:
    ld      $s2, 0x0038($sp)
    ld      $s1, 0x0030($sp)
    ld      $s0, 0x0028($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048
.L80014D58:
    li      $a1, 0x00F8
    jal     BiI2CRd
    li      $a2, 0x0008
    bnez    $v0, .L80014D44
    ld      $ra, 0x0040($sp)
    addiu   $s0, $sp, 0x0020
    jal     bios_os_80000E58
    daddu   $a0, $s0, $0
    lui     $a1, %hi(_8007BDC4)
    daddu   $a0, $s0, $0
    addiu   $a1, %lo(_8007BDC4)
    jal     os_80014768
    li      $a2, 0x0008
    jal     os_80014930
    nop
    bnez    $v0, .L80014D44
    ld      $ra, 0x0040($sp)
    bnez    $s2, .L80014DB8
    addiu   $s1, %lo(_8007BDA8)
    jal     os_80014A90
    nop
    j       .L80014D44
    ld      $ra, 0x0040($sp)
    nop
.L80014DB8:
    lw      $v0, 0x0004($s1)
    addiu   $v0, $v0, 0x0001
    jal     os_800148E8
    sw      $v0, 0x0004($s1)
    jal     os_80014A90
    nop
    j       .L80014D44
    ld      $ra, 0x0040($sp)

.globl os_80014DD8
os_80014DD8:
    lbu     $v0, 0x0000($a0)
.L80014DDC:
    beqz    $v0, .L80014E00
    addiu   $a0, $a0, 0x0001
    lbu     $v1, 0x0000($a1)
    beqz    $v1, .L80014E04
    addiu   $a1, $a1, 0x0001
    beql    $v0, $v1, .L80014DDC
    lbu     $v0, 0x0000($a0)
    jr      $ra
    daddu   $v0, $0, $0
.L80014E00:
    lbu     $v1, 0x0000($a1)
.L80014E04:
    xor     $v0, $v0, $v1
    jr      $ra
    sltiu   $v0, $v0, 0x0001

.globl os_80014E10
os_80014E10:
    j       .L80014E20
    andi    $a2, $a2, 0x00FF
.L80014E18:
    addiu   $a0, $a0, 0x0001
    addiu   $a1, $a1, 0x0001
.L80014E20:
    beqz    $a2, .L80014E40
    addiu   $v0, $a2, -0x0001
    lbu     $a3, 0x0000($a0)
    lbu     $v1, 0x0000($a1)
    beq     $a3, $v1, .L80014E18
    andi    $a2, $v0, 0x00FF
    jr      $ra
    daddu   $v0, $0, $0
.L80014E40:
    jr      $ra
    li      $v0, 0x0001

.globl os_80014E48
os_80014E48:
    lbu     $v0, 0x0000($a0)
    beqz    $v0, .L80014E6C
    daddu   $v1, $0, $0
    addiu   $v0, $a0, 0x0001
.L80014E58:
    lbu     $a2, 0x0000($v0)
    addiu   $v1, $v1, 0x0001
    andi    $v1, $v1, 0x00FF
    bnez    $a2, .L80014E58
    addiu   $v0, $v0, 0x0001
.L80014E6C:
    lbu     $v0, 0x0000($a1)
    beqz    $v0, .L80014E94
    daddu   $a2, $0, $0
    addiu   $v0, $a1, 0x0001
    nop
.L80014E80:
    lbu     $a3, 0x0000($v0)
    addiu   $a2, $a2, 0x0001
    andi    $a2, $a2, 0x00FF
    bnez    $a3, .L80014E80
    addiu   $v0, $v0, 0x0001
.L80014E94:
    beq     $v1, $a2, .L80014EB0
    nop
.L80014E9C:
    jr      $ra
    daddu   $v0, $0, $0
    nop
.L80014EA8:
    bne     $a2, $v0, .L80014E9C
    addiu   $a1, $a1, 0x0001
.L80014EB0:
    beqz    $v1, .L80014EF8
    addiu   $v0, $v1, -0x0001
    lbu     $a2, 0x0000($a0)
    andi    $v1, $v0, 0x00FF
    addiu   $a3, $a2, -0x0041
    andi    $a3, $a3, 0x00FF
    sltiu   $a3, $a3, 0x001A
    addiu   $a0, $a0, 0x0001
    beqz    $a3, .L80014EDC
    lbu     $v0, 0x0000($a1)
    ori     $a2, $a2, 0x0020
.L80014EDC:
    addiu   $a3, $v0, -0x0041
    andi    $a3, $a3, 0x00FF
    sltiu   $a3, $a3, 0x001A
    bnezl   $a3, .L80014EA8
    ori     $v0, $v0, 0x0020
    j       .L80014EA8
    nop
.L80014EF8:
    jr      $ra
    li      $v0, 0x0001

.globl os_80014F00
os_80014F00:
    andi    $a2, $a2, 0x00FF
    beqz    $a2, .L80014F58
    addiu   $v0, $a2, -0x0001
    nop
.L80014F10:
    lbu     $v1, 0x0000($a0)
    andi    $a2, $v0, 0x00FF
    addiu   $a3, $v1, -0x0041
    andi    $a3, $a3, 0x00FF
    sltiu   $a3, $a3, 0x001A
    addiu   $a0, $a0, 0x0001
    beqz    $a3, .L80014F34
    lbu     $v0, 0x0000($a1)
    ori     $v1, $v1, 0x0020
.L80014F34:
    addiu   $a3, $v0, -0x0041
    andi    $a3, $a3, 0x00FF
    sltiu   $a3, $a3, 0x001A
    bnezl   $a3, .L80014F48
    ori     $v0, $v0, 0x0020
.L80014F48:
    bne     $v1, $v0, .L80014F60
    addiu   $a1, $a1, 0x0001
    bnez    $a2, .L80014F10
    addiu   $v0, $a2, -0x0001
.L80014F58:
    jr      $ra
    li      $v0, 0x0001
.L80014F60:
    jr      $ra
    daddu   $v0, $0, $0

.globl os_80014F68
os_80014F68:
    lbu     $v1, 0x0000($a0)
    beqz    $v1, .L80014F8C
    daddu   $v0, $0, $0
    addiu   $a0, $a0, 0x0001
.L80014F78:
    lbu     $v1, 0x0000($a0)
    addiu   $v0, $v0, 0x0001
    andi    $v0, $v0, 0x00FF
    bnez    $v1, .L80014F78
    addiu   $a0, $a0, 0x0001
.L80014F8C:
    jr      $ra
    nop
    nop

.globl os_80014F98
os_80014F98:
    lbu     $v0, 0x0000($a0)
    lbu     $v1, 0x0000($a1)
    xori    $v0, $v0, 0x002E
    sltiu   $v0, $v0, 0x0001
    beqz    $v1, .L80014FD8
    addu    $a0, $a0, $v0
    daddu   $a2, $0, $0
    li      $v0, 0x002E
.L80014FB8:
    beql    $v1, $v0, .L80014FC0
    daddu   $a2, $a1, $0
.L80014FC0:
    addiu   $a1, $a1, 0x0001
    lbu     $v1, 0x0000($a1)
    bnez    $v1, .L80014FB8
    nop
    bnezl   $a2, .L80014FD8
    addiu   $a1, $a2, 0x0001
.L80014FD8:
    j       os_80014E48
    nop

.globl os_80014FE0
os_80014FE0:
    addiu   $sp, $sp, -0x0038
    sd      $s0, 0x0020($sp)
    daddu   $s0, $a0, $0
    lw      $a0, 0x0000($a0)
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0030($sp)
    bnez    $a0, .L80015010
    daddu   $s1, $a1, $0
    j       .L80015040
    ld      $ra, 0x0030($sp)
.L80015008:
    beqz    $a0, .L80015040
    ld      $ra, 0x0030($sp)
.L80015010:
    daddu   $a1, $s1, $0
    jal     os_80014F98
    addiu   $s0, $s0, 0x0004
    beqzl   $v0, .L80015008
    lw      $a0, 0x0000($s0)
    ld      $ra, 0x0030($sp)
    li      $v0, 0x0001
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop
.L80015040:
    daddu   $v0, $0, $0
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038
    nop

.globl os_80015058
os_80015058:
    lbu     $v1, 0x0000($a0)
    daddu   $v0, $a0, $0
    li      $a1, 0x002F
    beqz    $v1, .L80015084
    addiu   $a0, $a0, 0x0002
    lbu     $v1, -0x0001($a0)
.L80015070:
    beql    $v1, $a1, .L80015090
    daddu   $v0, $a0, $0
    addiu   $a0, $a0, 0x0001
.L8001507C:
    bnezl   $v1, .L80015070
    lbu     $v1, -0x0001($a0)
.L80015084:
    jr      $ra
    nop
    nop
.L80015090:
    j       .L8001507C
    addiu   $a0, $a0, 0x0001

.globl os_80015098
os_80015098:
    lbu     $v0, 0x0000($a0)
    beqz    $v0, .L800150BC
    nop
    nop
.L800150A8:
    sb      $v0, 0x0000($a1)
    addiu   $a0, $a0, 0x0001
    lbu     $v0, 0x0000($a0)
    bnez    $v0, .L800150A8
    addiu   $a1, $a1, 0x0001
.L800150BC:
    jr      $ra
    sb      $0, 0x0000($a1)
    nop

.globl os_800150C8
os_800150C8:
    lui     $v1, %hi(_80052958)
    bnez    $a0, .L800150E4
    sw      $a0, %lo(_80052958)($v1)
    j       .L800150F0
    nop
    nop
.L800150E0:
    sw      $a0, %lo(_80052958)($v1)
.L800150E4:
    lbu     $v0, 0x0000($a0)
    bnez    $v0, .L800150E0
    addiu   $a0, $a0, 0x0001
.L800150F0:
    jr      $ra
    nop

.globl os_800150F8
os_800150F8:
    lbu     $v1, 0x0000($a0)
    beqz    $v1, .L8001512C
    lui     $a1, %hi(_80052958)
    lw      $v0, %lo(_80052958)($a1)
    sb      $v1, 0x0000($v0)
.L8001510C:
    addiu   $v0, $v0, 0x0001
    sw      $v0, %lo(_80052958)($a1)
    addiu   $a0, $a0, 0x0001
    lbu     $v1, 0x0000($a0)
    bnezl   $v1, .L8001510C
    sb      $v1, 0x0000($v0)
.L80015124:
    jr      $ra
    sb      $0, 0x0000($v0)
.L8001512C:
    lui     $v0, %hi(_80052958)
    j       .L80015124
    lw      $v0, %lo(_80052958)($v0)

.globl os_80015138
os_80015138:
    addiu   $sp, $sp, -0x0010
    sb      $0, 0x000A($sp)
    bnez    $a0, .L80015188
    addiu   $v0, $sp, 0x000A
    li      $v0, 0x0030
    sb      $v0, 0x0009($sp)
    li      $v1, 0x0030
    addiu   $v0, $sp, 0x0009
    lui     $a1, %hi(_80052958)
.L8001515C:
    lw      $a0, %lo(_80052958)($a1)
.L80015160:
    sb      $v1, 0x0000($a0)
    addiu   $v0, $v0, 0x0001
    lbu     $v1, 0x0000($v0)
    addiu   $a0, $a0, 0x0001
    bnez    $v1, .L80015160
    sw      $a0, %lo(_80052958)($a1)
.L80015178:
    sb      $0, 0x0000($a0)
    jr      $ra
    addiu   $sp, $sp, 0x0010
    nop
.L80015188:
    dsll32  $v1, $a0, 0
    dsrl32  $v1, $v1, 0
    dsll    $a2, $v1, 4
    dsll    $a1, $v1, 2
    dsubu   $a1, $a2, $a1
    dsll    $a2, $a1, 4
    daddu   $a1, $a1, $a2
    dsll    $a2, $a1, 8
    daddu   $a1, $a1, $a2
    dsll    $a2, $a1, 16
    daddu   $a1, $a1, $a2
    daddu   $a1, $a1, $v1
    dsrl32  $a1, $a1, 3
    sll     $a2, $a1, 1
    sll     $v1, $a1, 3
    addu    $v1, $a2, $v1
    subu    $v1, $a0, $v1
    addiu   $v1, $v1, 0x0030
    addiu   $v0, $v0, -0x0001
    andi    $v1, $v1, 0x00FF
    daddu   $a0, $a1, $0
    bnez    $a1, .L80015188
    sb      $v1, 0x0000($v0)
    bnezl   $v1, .L8001515C
    li      $a1, 0x80050000
    lui     $v0, %hi(_80052958)
    j       .L80015178
    lw      $a0, %lo(_80052958)($v0)

.globl os_800151F8
os_800151F8:
    andi    $a0, $a0, 0x00FF
    srl     $a1, $a0, 4
    sltiu   $v0, $a1, 0x000A
    andi    $a0, $a0, 0x000F
    bnez    $v0, .L80015214
    li      $a3, 0x0030
    li      $a3, 0x0037
.L80015214:
    sltiu   $v0, $a0, 0x000A
    bnez    $v0, .L80015224
    li      $a2, 0x0030
    li      $a2, 0x0037
.L80015224:
    lui     $v1, %hi(_80052958)
    lw      $v0, %lo(_80052958)($v1)
    addu    $a1, $a3, $a1
    addu    $a0, $a2, $a0
    addiu   $t0, $v0, 0x0002
    sb      $a1, 0x0000($v0)
    sb      $a0, 0x0001($v0)
    sw      $t0, %lo(_80052958)($v1)
    jr      $ra
    sb      $0, 0x0002($v0)
    nop

.globl os_80015250
os_80015250:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    andi    $s0, $a0, 0xFFFF
    sd      $ra, 0x0028($sp)
    jal     os_800151F8
    srl     $a0, $s0, 8
    andi    $a0, $s0, 0x00FF
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       os_800151F8
    addiu   $sp, $sp, 0x0030
    nop

.globl os_80015280
os_80015280:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    daddu   $s0, $a0, $0
    sd      $ra, 0x0028($sp)
    jal     os_80015250
    srl     $a0, $a0, 16
    andi    $a0, $s0, 0xFFFF
    ld      $ra, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       os_80015250
    addiu   $sp, $sp, 0x0030
    nop

.globl os_800152B0
os_800152B0:
    lui     $v0, %hi(_80052958)
    lw      $a2, %lo(_80052958)($v0)
    bnez    $a0, .L800152CC
    sw      $a0, %lo(_80052958)($v0)
    j       .L800152F8
    lbu     $v1, 0x0000($a1)
.L800152C8:
    sw      $a0, %lo(_80052958)($v0)
.L800152CC:
    lbu     $v1, 0x0000($a0)
    bnezl   $v1, .L800152C8
    addiu   $a0, $a0, 0x0001
    lbu     $v1, 0x0000($a1)
    beqzl   $v1, .L80015304
    sb      $0, 0x0000($a0)
    sb      $v1, 0x0000($a0)
.L800152E8:
    addiu   $a0, $a0, 0x0001
    sw      $a0, %lo(_80052958)($v0)
    addiu   $a1, $a1, 0x0001
    lbu     $v1, 0x0000($a1)
.L800152F8:
    bnezl   $v1, .L800152E8
    sb      $v1, 0x0000($a0)
    sb      $0, 0x0000($a0)
.L80015304:
    jr      $ra
    sw      $a2, %lo(_80052958)($v0)
    nop

.globl os_80015310
os_80015310:
    addiu   $sp, $sp, -0x0038
    daddu   $v0, $a0, $0
    sd      $s0, 0x0020($sp)
    lui     $s0, %hi(_80052958)
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0030($sp)
    lw      $s1, %lo(_80052958)($s0)
    daddu   $a0, $a1, $0
    bnez    $v0, .L80015344
    sw      $v0, %lo(_80052958)($s0)
    j       .L80015350
    nop
.L80015340:
    sw      $v0, %lo(_80052958)($s0)
.L80015344:
    lbu     $v1, 0x0000($v0)
    bnez    $v1, .L80015340
    addiu   $v0, $v0, 0x0001
.L80015350:
    jal     os_80015138
    nop
    ld      $ra, 0x0030($sp)
    sw      $s1, %lo(_80052958)($s0)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038

.globl os_80015370
os_80015370:
    beqz    $a0, .L800153DC
    nop
    lw      $v1, 0x0000($a0)
    beqz    $v1, .L800153DC
    daddu   $a3, $0, $0
    daddu   $v0, $0, $0
.L80015388:
    lbu     $a2, 0x0000($v1)
    daddu   $a1, $0, $0
    beqz    $a2, .L800153AC
    addiu   $v1, $v1, 0x0001
.L80015398:
    lbu     $a2, 0x0000($v1)
    addiu   $a1, $a1, 0x0001
    andi    $a1, $a1, 0x00FF
    bnez    $a2, .L80015398
    addiu   $v1, $v1, 0x0001
.L800153AC:
    sltu    $v1, $a1, $v0
    bnezl   $v1, .L800153B8
    daddu   $a1, $v0, $0
.L800153B8:
    addiu   $a3, $a3, 0x0001
    andi    $a3, $a3, 0x00FF
    sll     $v0, $a3, 2
    addu    $v0, $a0, $v0
    lw      $v1, 0x0000($v0)
    bnez    $v1, .L80015388
    daddu   $v0, $a1, $0
    jr      $ra
    nop
.L800153DC:
    jr      $ra
    daddu   $v0, $0, $0
    nop

.globl os_800153E8
os_800153E8:
    lbu     $v0, 0x0000($a0)
    beqz    $v0, .L8001543C
    andi    $a1, $a1, 0xFFFF
    beqz    $a1, .L8001543C
    li      $a2, -0x0021
    j       .L80015410
    addiu   $v1, $v0, -0x0061
    nop
.L80015408:
    beqz    $a1, .L8001543C
    addiu   $v1, $v0, -0x0061
.L80015410:
    andi    $v1, $v1, 0x00FF
    addiu   $a1, $a1, -0x0001
    sltiu   $v1, $v1, 0x001A
    andi    $a1, $a1, 0xFFFF
    beqz    $v1, .L8001542C
    and     $v0, $v0, $a2
    sb      $v0, 0x0000($a0)
.L8001542C:
    addiu   $a0, $a0, 0x0001
    lbu     $v0, 0x0000($a0)
    bnez    $v0, .L80015408
    nop
.L8001543C:
    jr      $ra
    nop
    nop

.globl os_80015448
os_80015448:
    lbu     $v1, 0x0000($a0)
    beqz    $v1, .L80015480
    daddu   $v0, $a0, $0
    daddu   $a1, $0, $0
    li      $a0, 0x002E
    nop
.L80015460:
    beql    $v1, $a0, .L80015468
    daddu   $a1, $v0, $0
.L80015468:
    addiu   $v0, $v0, 0x0001
    lbu     $v1, 0x0000($v0)
    bnez    $v1, .L80015460
    nop
    bnezl   $a1, .L80015480
    addiu   $v0, $a1, 0x0001
.L80015480:
    jr      $ra
    nop

.globl os_80015488
os_80015488:
    lbu     $v1, 0x0000($a0)
    li      $v0, 0x0020
    bnel    $v1, $v0, .L800154B4
    sb      $0, 0x0001($a0)
    li      $v1, 0x0020
    sb      $0, 0x0000($a0)
.L800154A0:
    addiu   $a0, $a0, -0x0001
    lbu     $v0, 0x0000($a0)
    beql    $v0, $v1, .L800154A0
    sb      $0, 0x0000($a0)
    sb      $0, 0x0001($a0)
.L800154B4:
    jr      $ra
    addiu   $v0, $a0, 0x0001
    nop

.globl os_800154C0
os_800154C0:
    lbu     $v1, 0x0000($a0)
    li      $v0, 0x0020
    bne     $v1, $v0, .L8001555C
    daddu   $v0, $a0, $0
    daddu   $a2, $0, $0
    li      $a1, 0x0020
.L800154D8:
    addiu   $v0, $v0, 0x0001
    lbu     $v1, 0x0000($v0)
    addiu   $a2, $a2, 0x0001
    beq     $v1, $a1, .L800154D8
    andi    $a2, $a2, 0x00FF
.L800154EC:
    beqz    $v1, .L80015554
    daddu   $a1, $0, $0
    daddu   $a3, $0, $0
    li      $t0, 0x0020
    addiu   $a1, $a1, 0x0001
.L80015500:
    addiu   $v0, $v0, 0x0001
    beq     $v1, $t0, .L80015510
    andi    $a1, $a1, 0x00FF
    daddu   $a3, $a1, $0
.L80015510:
    lbu     $v1, 0x0000($v0)
    bnezl   $v1, .L80015500
    addiu   $a1, $a1, 0x0001
    beqz    $a3, .L80015554
    addiu   $a3, $a3, -0x0001
    andi    $a3, $a3, 0x00FF
    addu    $a2, $a0, $a2
    addiu   $a3, $a3, 0x0001
    daddu   $v0, $0, $0
    nop
.L80015538:
    addu    $v1, $a2, $v0
    lbu     $a1, 0x0000($v1)
    addu    $v1, $a0, $v0
    addiu   $v0, $v0, 0x0001
    bne     $v0, $a3, .L80015538
    sb      $a1, 0x0000($v1)
    addu    $a0, $a0, $v0
.L80015554:
    jr      $ra
    sb      $0, 0x0000($a0)
.L8001555C:
    j       .L800154EC
    daddu   $a2, $0, $0
    nop

.globl os_80015568
os_80015568:
    addiu   $sp, $sp, -0x0048
    sd      $s2, 0x0030($sp)
    andi    $s2, $a0, 0xFFFF
    srl     $a0, $s2, 11
    sd      $ra, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s0, 0x0020($sp)
    jal     SysDecToBCD
    sd      $s1, 0x0028($sp)
    lui     $s3, %hi(__str_8004EC28)
    jal     os_800151F8
    daddu   $a0, $v0, $0
    lbu     $v1, %lo(__str_8004EC28)($s3)
    beqz    $v1, .L80015638
    addiu   $s0, $s3, %lo(__str_8004EC28)
    lui     $s1, %hi(_80052958)
    lw      $v0, %lo(_80052958)($s1)
    daddu   $a0, $s0, $0
.L800155B0:
    sb      $v1, 0x0000($v0)
    addiu   $a0, $a0, 0x0001
    lbu     $v1, 0x0000($a0)
    addiu   $v0, $v0, 0x0001
    bnez    $v1, .L800155B0
    sw      $v0, %lo(_80052958)($s1)
.L800155C8:
    srl     $a0, $s2, 5
    andi    $a0, $a0, 0x003F
    jal     SysDecToBCD
    sb      $0, 0x0000($v0)
    jal     os_800151F8
    daddu   $a0, $v0, $0
    lbu     $v1, %lo(__str_8004EC28)($s3)
    beqz    $v1, .L80015608
    lw      $v0, %lo(_80052958)($s1)
    nop
.L800155F0:
    sb      $v1, 0x0000($v0)
    addiu   $s0, $s0, 0x0001
    lbu     $v1, 0x0000($s0)
    addiu   $v0, $v0, 0x0001
    bnez    $v1, .L800155F0
    sw      $v0, %lo(_80052958)($s1)
.L80015608:
    andi    $a0, $s2, 0x001F
    sll     $a0, $a0, 1
    jal     SysDecToBCD
    sb      $0, 0x0000($v0)
    daddu   $a0, $v0, $0
    ld      $ra, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       os_800151F8
    addiu   $sp, $sp, 0x0048
.L80015638:
    lui     $s1, %hi(_80052958)
    j       .L800155C8
    lw      $v0, %lo(_80052958)($s1)
    nop

.globl os_80015648
os_80015648:
    addiu   $sp, $sp, -0x0048
    sd      $s2, 0x0030($sp)
    andi    $s2, $a0, 0xFFFF
    andi    $a0, $s2, 0x001F
    sd      $ra, 0x0040($sp)
    sd      $s3, 0x0038($sp)
    sd      $s0, 0x0020($sp)
    jal     SysDecToBCD
    sd      $s1, 0x0028($sp)
    lui     $s3, %hi(__str_8004F9A0)
    jal     os_800151F8
    daddu   $a0, $v0, $0
    lbu     $v1, %lo(__str_8004F9A0)($s3)
    beqz    $v1, .L80015710
    addiu   $s0, $s3, %lo(__str_8004F9A0)
    lui     $s1, %hi(_80052958)
    lw      $v0, %lo(_80052958)($s1)
    daddu   $a0, $s0, $0
.L80015690:
    sb      $v1, 0x0000($v0)
    addiu   $a0, $a0, 0x0001
    lbu     $v1, 0x0000($a0)
    addiu   $v0, $v0, 0x0001
    bnez    $v1, .L80015690
    sw      $v0, %lo(_80052958)($s1)
.L800156A8:
    srl     $a0, $s2, 5
    andi    $a0, $a0, 0x000F
    jal     SysDecToBCD
    sb      $0, 0x0000($v0)
    jal     os_800151F8
    daddu   $a0, $v0, $0
    lbu     $v1, %lo(__str_8004F9A0)($s3)
    beqz    $v1, .L800156E8
    lw      $v0, %lo(_80052958)($s1)
    nop
.L800156D0:
    sb      $v1, 0x0000($v0)
    addiu   $s0, $s0, 0x0001
    lbu     $v1, 0x0000($s0)
    addiu   $v0, $v0, 0x0001
    bnez    $v1, .L800156D0
    sw      $v0, %lo(_80052958)($s1)
.L800156E8:
    sb      $0, 0x0000($v0)
    srl     $a0, $s2, 9
    ld      $ra, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    addiu   $a0, $a0, 0x07BC
    j       os_80015138
    addiu   $sp, $sp, 0x0048
.L80015710:
    lui     $s1, %hi(_80052958)
    j       .L800156A8
    lw      $v0, %lo(_80052958)($s1)
    nop

.globl sysDrawChar8X8
sysDrawChar8X8:
    srl     $v0, $a0, 7
    lui     $a3, %hi(pal)
    addiu   $a3, %lo(pal)
    andi    $v0, $v0, 0x001E
    addu    $v0, $v0, $a3
    lhu     $t0, 0x0000($v0)
    lui     $v0, %hi(screen)
    addiu   $v0, %lo(screen)
    lw      $v1, 0x0008($v0)
    dsll    $t1, $t0, 16
    or      $t0, $t1, $t0
    mult    $a2, $v1
    dsll    $t1, $t0, 16
    or      $t0, $t1, $t0
    srl     $t1, $a0, 12
    sll     $t1, $t1, 1
    dsll    $t2, $t0, 16
    mflo    $a2
    or      $t0, $t2, $t0
    addu    $a3, $t1, $a3
    li      $t4, 0x0001
    lhu     $a3, 0x0000($a3)
    dsll    $t2, $t0, 16
    addiu   $sp, $sp, -0x0008
    addiu   $v1, $v1, -0x0008
    li      $t1, 0xFFFF0000
    dsll32  $t4, $t4, 16
    addu    $a2, $a2, $a1
    or      $t0, $t2, $t0
    sd      $s0, 0x0000($sp)
    lw      $t2, 0x0024($v0)
    srl     $v1, $v1, 2
    andi    $a0, $a0, 0x00FF
    ori     $s0, $t1, 0x0001
    daddiu  $t4, $t4, -0x0001
    lui     $a1, %hi(font)
    li      $t9, -0x0001
    sll     $a0, $a0, 3
    sll     $a2, $a2, 4
    sll     $v1, $v1, 3
    and     $t4, $t0, $t4
    dsll32  $s0, $s0, 0
    dsll32  $v0, $a3, 16
    addiu   $a1, %lo(font)
    dsll32  $t9, $t9, 0
    addu    $a2, $t2, $a2
    addu    $a0, $a1, $a0
    or      $t4, $t4, $v0
    daddiu  $s0, $s0, -0x0001
    ori     $t9, $t9, 0xFFFF
    addiu   $v1, $v1, 0x0010
    dsll32  $t8, $a3, 0
    dsll    $t7, $a3, 16
    daddu   $t3, $0, $0
    j       .L80015804
    li      $t2, 0x0008
.L80015800:
    addu    $a2, $a2, $v1
.L80015804:
    lbu     $v0, 0x0000($a0)
    daddu   $a1, $t4, $0
    andi    $t5, $v0, 0x0080
    bnez    $t5, .L8001581C
    addiu   $a0, $a0, 0x0001
    daddu   $a1, $t0, $0
.L8001581C:
    andi    $t5, $v0, 0x0040
    beqz    $t5, .L80015830
    andi    $t5, $v0, 0x0020
    and     $a1, $a1, $s0
    or      $a1, $a1, $t8
.L80015830:
    beqz    $t5, .L80015840
    andi    $t5, $v0, 0x0010
    and     $a1, $a1, $t9
    or      $a1, $a1, $t7
.L80015840:
    beqz    $t5, .L80015850
    andi    $t6, $v0, 0x0008
    and     $a1, $a1, $t1
    or      $a1, $a1, $a3
.L80015850:
    sd      $a1, 0x0000($a2)
    addiu   $t5, $a2, 0x0008
    bnez    $t6, .L80015864
    daddu   $a1, $t4, $0
    daddu   $a1, $t0, $0
.L80015864:
    andi    $t6, $v0, 0x0004
    beqz    $t6, .L80015878
    andi    $t6, $v0, 0x0002
    and     $a1, $a1, $s0
    or      $a1, $t8, $a1
.L80015878:
    beqz    $t6, .L80015888
    andi    $v0, $v0, 0x0001
    and     $a1, $a1, $t9
    or      $a1, $t7, $a1
.L80015888:
    beqz    $v0, .L80015898
    addiu   $t3, $t3, 0x0001
    and     $a1, $a1, $t1
    or      $a1, $a1, $a3
.L80015898:
    bne     $t3, $t2, .L80015800
    sd      $a1, 0x0000($t5)
    ld      $s0, 0x0000($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0008
    nop

.globl sys_os_800158B0
sys_os_800158B0:
    lui     $v0, %hi(screen)
    addiu   $v0, %lo(screen)
    srl     $t0, $a0, 7
    lui     $v1, %hi(pal)
    andi    $t0, $t0, 0x001E
    addiu   $v1, %lo(pal)
    lw      $a3, 0x0028($v0)
    addiu   $sp, $sp, -0x0008
    addu    $t0, $t0, $v1
    sd      $s0, 0x0000($sp)
    beqz    $a3, .L80015A30
    lhu     $t0, 0x0000($t0)
    bnez    $t0, .L80015A30
    srl     $t0, $a0, 12
    lw      $a3, 0x0008($v0)
    mult    $a2, $a3
    sll     $t0, $t0, 1
    addu    $v1, $t0, $v1
    addiu   $s0, $a3, -0x0008
    andi    $a0, $a0, 0x00FF
    li      $t3, 0xFFFF0000
    mflo    $a2
    lhu     $t2, 0x0000($v1)
    addu    $a1, $a2, $a1
    sll     $v1, $a0, 3
    lw      $v0, 0x0024($v0)
    srl     $s0, $s0, 2
    ori     $t9, $t3, 0x0001
    lui     $a0, %hi(font)
    li      $a3, 0x0001
    li      $t8, -0x0001
    sll     $a1, $a1, 4
    sll     $s0, $s0, 3
    dsll32  $t9, $t9, 0
    addiu   $a0, %lo(font)
    dsll32  $a3, $a3, 16
    dsll32  $t8, $t8, 0
    addu    $a0, $a0, $v1
    addu    $a1, $v0, $a1
    daddiu  $a3, $a3, -0x0001
    daddiu  $t9, $t9, -0x0001
    ori     $t8, $t8, 0xFFFF
    addiu   $s0, $s0, 0x0010
    dsll32  $t7, $t2, 16
    dsll32  $t6, $t2, 0
    dsll    $t5, $t2, 16
    daddu   $a2, $0, $0
    j       .L8001597C
    li      $t4, 0x0008
    nop
.L80015978:
    addu    $a1, $a1, $s0
.L8001597C:
    lbu     $v0, 0x0000($a0)
    ld      $v1, 0x0000($a1)
    andi    $t0, $v0, 0x0080
    beqz    $t0, .L80015998
    addiu   $a0, $a0, 0x0001
    and     $v1, $v1, $a3
    or      $v1, $v1, $t7
.L80015998:
    andi    $t0, $v0, 0x0040
    beqz    $t0, .L800159AC
    andi    $t0, $v0, 0x0020
    and     $v1, $v1, $t9
    or      $v1, $v1, $t6
.L800159AC:
    beqz    $t0, .L800159BC
    andi    $t0, $v0, 0x0010
    and     $v1, $v1, $t8
    or      $v1, $v1, $t5
.L800159BC:
    beqz    $t0, .L800159CC
    andi    $t1, $v0, 0x0008
    and     $v1, $v1, $t3
    or      $v1, $v1, $t2
.L800159CC:
    sd      $v1, 0x0000($a1)
    addiu   $t0, $a1, 0x0008
    beqz    $t1, .L800159E4
    ld      $v1, 0x0008($a1)
    and     $v1, $v1, $a3
    or      $v1, $t7, $v1
.L800159E4:
    andi    $t1, $v0, 0x0004
    beqz    $t1, .L800159F8
    andi    $t1, $v0, 0x0002
    and     $v1, $v1, $t9
    or      $v1, $t6, $v1
.L800159F8:
    beqz    $t1, .L80015A08
    andi    $v0, $v0, 0x0001
    and     $v1, $v1, $t8
    or      $v1, $t5, $v1
.L80015A08:
    beqz    $v0, .L80015A18
    addiu   $a2, $a2, 0x0001
    and     $v1, $v1, $t3
    or      $v1, $v1, $t2
.L80015A18:
    bne     $a2, $t4, .L80015978
    sd      $v1, 0x0000($t0)
    ld      $s0, 0x0000($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0008
    nop
.L80015A30:
    ld      $s0, 0x0000($sp)
    j       sysDrawChar8X8
    addiu   $sp, $sp, 0x0008
    nop

.globl sysBlank
sysBlank:
    lui     $v0, %hi(vregs)
    lw      $v1, %lo(vregs)($v0)
    li      $a0, 0x0200
    addiu   $v1, $v1, 0x0010
.L80015A50:
    lw      $v0, 0x0000($v1)
    bne     $v0, $a0, .L80015A50
    nop
    jr      $ra
    nop
    nop

.globl sysVsync
sysVsync:
    lui     $v0, %hi(vregs)
    lw      $v0, %lo(vregs)($v0)
    li      $a0, 0x0200
    addiu   $v0, $v0, 0x0010
.L80015A78:
    lw      $v1, 0x0000($v0)
    beq     $v1, $a0, .L80015A78
    nop
    li      $a0, 0x0200
.L80015A88:
    lw      $v1, 0x0000($v0)
    bne     $v1, $a0, .L80015A88
    nop
    jr      $ra
    nop
    nop

.globl sysDisplayOFF
sysDisplayOFF:
    lui     $a0, 0xA4400010 >> 16
    lui     $v0, %hi(vregs)
    sw      $a0, %lo(vregs)($v0)
    ori     $a0, 0xA4400010 & 0xFFFF
.L80015AB0:
    lw      $v0, 0x0000($a0)
    sltiu   $v0, $v0, 0x000B
    beqz    $v0, .L80015AB0
    lui     $v1, %hi(0xA4400000)
    ori     $v0, $v1, 0x0024
    sw      $0, %lo(0xA4400000)($v1)
    sw      $0, 0x0000($v0)
    jr      $ra
    nop
    nop

.globl sysGetTvType
sysGetTvType:
    lui     $v0, %hi(sys_boot_strap)
    lw      $v0, %lo(sys_boot_strap)($v0)
    lw      $v0, 0x0000($v0)
    jr      $ra
    andi    $v0, $v0, 0x00FF
    nop

.globl SysRandom
SysRandom:
    lui     $a0, %hi(_8005295E)
    lhu     $v0, %lo(_8005295E)($a0)
    lui     $v1, %hi(0x80000102)
    addiu   $v0, $v0, 0x0001
    andi    $v0, $v0, 0xFFFF
    andi    $a1, $v0, 0x1065
    sll     $a1, $a1, 2
    addu    $a1, $v1, $a1
    lw      $t0, 0x0100($a1)
    lui     $a1, %hi(_8007D1C0)
    srl     $t0, $t0, 3
    addu    $t0, $v0, $t0
    andi    $t0, $t0, 0xFFFF
    andi    $v0, $t0, 0x1FFF
    sll     $v0, $v0, 2
    addu    $v0, $v1, $v0
    lw      $a3, 0x0400($v0)
    lhu     $a2, %lo(_8007D1C0)($a1)
    srl     $a3, $a3, 1
    addu    $a3, $t0, $a3
    andi    $a3, $a3, 0xFFFF
    andi    $v0, $a3, 0x1065
    sll     $v0, $v0, 2
    addu    $v1, $v1, $v0
    lhu     $v1, %lo(0x80000102)($v1)
    xor     $v0, $a3, $a2
    xor     $v0, $v0, $v1
    addiu   $a2, $a2, 0x0001
    sh      $a2, %lo(_8007D1C0)($a1)
    jr      $ra
    sh      $v0, %lo(_8005295E)($a0)
    nop

.globl sysSI_dmaBusy
sysSI_dmaBusy:
    lui     $v1, %hi(0xA4800018)
    nop
.L80015B78:
    lw      $v0, %lo(0xA4800018)($v1)
    andi    $v0, $v0, 0x0003
    bnez    $v0, .L80015B78
    nop
    jr      $ra
    nop

.globl sys_os_80015B90
sys_os_80015B90:
    lui     $v0, %hi(screen+40)
    jr      $ra
    sw      $a0, %lo(screen+40)($v0)
    nop

.globl sysExecPIF
sysExecPIF:
    addiu   $sp, $sp, -0x00C0
    sd      $s0, 0x00A0($sp)
    addiu   $s0, $sp, 0x0020
    sd      $s2, 0x00B0($sp)
    sd      $s1, 0x00A8($sp)
    daddu   $s2, $a0, $0
    daddu   $s1, $a1, $0
    daddu   $a0, $s0, $0
    sd      $ra, 0x00B8($sp)
    jal     data_cache_hit_writeback_invalidate
    li      $a1, 0x0040
    li      $a1, 0x20000000
    daddu   $a0, $s2, $0
    or      $a1, $s0, $a1
    jal     os_80014768
    li      $a2, 0x0040
    jal     disable_interrupts
    nop
    lui     $a0, %hi(0xA4800018)
    nop
.L80015BF0:
    lw      $v0, %lo(0xA4800018)($a0)
    andi    $v0, $v0, 0x0003
    bnez    $v0, .L80015BF0
    lui     $v1, %hi(0xA4800018)
    sw      $s0, %lo(0xA4800000)($v1)
    lui     $v0, 0x1FC007C0 >> 16
    ori     $v0, 0x1FC007C0 & 0xFFFF
    sw      $v0, %lo(0xA4800010)($v1)
.L80015C10:
    lw      $v0, %lo(0xA4800018)($v1)
    andi    $v0, $v0, 0x0003
    bnez    $v0, .L80015C10
    lui     $s0, %hi(0xA4800004)
    addiu   $s2, $sp, 0x0060
    daddu   $a0, $s2, $0
    jal     data_cache_hit_writeback_invalidate
    li      $a1, 0x0040
    sw      $s2, %lo(0xA4800000)($s0)
    lui     $v0, 0x1FC007C0 >> 16
    ori     $v0, 0x1FC007C0 & 0xFFFF
    sw      $v0, %lo(0xA4800004)($s0)
    lui     $v1, %hi(0xA4800018)
    nop
.L80015C48:
    lw      $v0, %lo(0xA4800018)($v1)
    andi    $v0, $v0, 0x0003
    bnez    $v0, .L80015C48
    nop
    jal     enable_interrupts
    nop
    li      $a0, 0x20000000
    or      $a0, $s2, $a0
    daddu   $a1, $s1, $0
    jal     os_80014768
    li      $a2, 0x0040
    ld      $ra, 0x00B8($sp)
    ld      $s2, 0x00B0($sp)
    ld      $s1, 0x00A8($sp)
    ld      $s0, 0x00A0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00C0
    nop

.globl sysDisplayInit
sysDisplayInit:
    lui     $v0, 0x80000300 >> 16
    addiu   $sp, $sp, -0x0030
    ori     $v0, 0x80000300 & 0xFFFF
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0028($sp)
    jal     disable_interrupts
    lw      $s0, 0x0000($v0)
    lui     $v0, %hi(screen)
    li      $v1, 0x0028
    addiu   $a2, $v0, %lo(screen)
    sw      $v1, %lo(screen)($v0)
    li      $v0, 0x001E
    sw      $v0, 0x0004($a2)
    li      $v0, 0x0140
    sw      $v0, 0x0008($a2)
    li      $v0, 0x00F0
    sw      $v0, 0x000C($a2)
    lui     $v0, 0x00012C00 >> 16
    ori     $v0, 0x00012C00 & 0xFFFF
    sw      $v0, 0x0014($a2)
    li      $v0, 0x0008
    sw      $v0, 0x0010($a2)
    li      $v0, 0x0001
    beq     $s0, $v0, .L80015DB0
    lui     $a1, %hi(ntsc_320)
    bnez    $s0, .L80015DA8
    lui     $a1, %hi(mpal_320)
    lui     $a1, %hi(pal_320)
    addiu   $a1, %lo(pal_320)
.L80015D04:
    lui     $v1, 0xA4400010 >> 16
    ori     $v1, 0xA4400010 & 0xFFFF
    nop
.L80015D10:
    lw      $v0, 0x0000($v1)
    sltiu   $v0, $v0, 0x000B
    beqz    $v0, .L80015D10
    lui     $v0, %hi(vregs)
    lw      $a0, %lo(vregs)($v0)
    lw      $v0, 0x0024($a2)
    lui     $v1, %hi(0xA4400000)
    sw      $0, %lo(0xA4400000)($v1)
    sw      $v0, 0x0004($a0)
    lw      $v1, 0x0008($a1)
    daddu   $v0, $a1, $0
    sw      $v1, 0x0008($a0)
    addiu   $a3, $a1, 0x0010
    addiu   $v1, $a0, 0x0014
.L80015D48:
    lw      $a2, 0x0014($v0)
    addiu   $v0, $v0, 0x0004
    sw      $a2, 0x0000($v1)
    bne     $v0, $a3, .L80015D48
    addiu   $v1, $v1, 0x0004
    lw      $v0, 0x0024($a1)
    ld      $ra, 0x0028($sp)
    sw      $v0, 0x0024($a0)
    lw      $v0, 0x0028($a1)
    ld      $s0, 0x0020($sp)
    sw      $v0, 0x0028($a0)
    lw      $v0, 0x002C($a1)
    addiu   $sp, $sp, 0x0030
    sw      $v0, 0x002C($a0)
    lw      $v0, 0x000C($a1)
    sw      $v0, 0x000C($a0)
    lw      $v0, 0x0030($a1)
    sw      $v0, 0x0030($a0)
    lw      $v0, 0x0034($a1)
    sw      $v0, 0x0034($a0)
    lw      $v0, 0x0000($a1)
    sw      $v0, 0x0000($a0)
    j       enable_interrupts
    nop
.L80015DA8:
    j       .L80015D04
    addiu   $a1, %lo(mpal_320)
.L80015DB0:
    j       .L80015D04
    addiu   $a1, %lo(ntsc_320)

.globl sleep
sleep:
    addiu   $sp, $sp, -0x0038
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    sd      $ra, 0x0030($sp)
    jal     get_ticks_ms
    daddu   $s1, $a0, $0
    daddu   $s0, $v0, $0
    nop
.L80015DD8:
    jal     get_ticks_ms
    nop
    subu    $v0, $v0, $s0
    sltu    $v0, $v0, $s1
    bnez    $v0, .L80015DD8
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0038

.globl sys_os_80015E00
sys_os_80015E00:
    addiu   $sp, $sp, -0x00E0
    sd      $s0, 0x00C0($sp)
    sd      $ra, 0x00D8($sp)
    sd      $s2, 0x00D0($sp)
    jal     get_controllers_present
    sd      $s1, 0x00C8($sp)
    daddu   $s0, $v0, $0
    lui     $v0, %hi(_8005295E)
    lhu     $a0, %lo(_8005295E)($v0)
    lui     $v1, %hi(_8005295C)
    lbu     $v1, %lo(_8005295C)($v1)
    addiu   $a0, $a0, 0x0001
    beqz    $v1, .L80016138
    sh      $a0, %lo(_8005295E)($v0)
    lui     $s1, %hi(_8007D1C2)
.L80015E3C:
    jal     usbListener
    nop
    lui     $v0, %hi(vregs)
    lw      $v0, %lo(vregs)($v0)
    li      $a0, 0x0200
    addiu   $v0, $v0, 0x0010
    nop
.L80015E58:
    lw      $v1, 0x0000($v0)
    beq     $v1, $a0, .L80015E58
    nop
    li      $a0, 0x0200
.L80015E68:
    lw      $v1, 0x0000($v0)
    bne     $v1, $a0, .L80015E68
    nop
    jal     controller_scan
    addiu   $s2, $sp, 0x0020
    jal     get_keys_pressed
    daddu   $a0, $s2, $0
    lui     $a2, %hi(_8004D840)
    addiu   $a2, %lo(_8004D840)
    lhu     $a0, 0x0000($a2)
    lui     $t2, 0xFFFF6000 >> 16
    and     $a3, $s0, $a0
    ori     $t2, 0xFFFF6000 & 0xFFFF
    daddu   $a1, $0, $0
    daddu   $v0, $0, $0
    daddu   $v1, $0, $0
    beq     $a0, $a3, .L80015ECC
    li      $t0, 0x0004
.L80015EB0:
    addiu   $v1, $v1, 0x0001
    beq     $v1, $t0, .L800160B0
    addiu   $a2, $a2, 0x0002
.L80015EBC:
    lhu     $a0, 0x0000($a2)
    and     $a3, $s0, $a0
    bne     $a0, $a3, .L80015EB0
    daddu   $v0, $a1, $0
.L80015ECC:
    sll     $a0, $v1, 3
    addu    $a3, $s2, $a0
    ld      $a3, 0x0000($a3)
    dsrl    $a3, $a3, 27
    sll     $a3, $a3, 0
    andi    $a3, $a3, 0x0001
    beqz    $a3, .L80015EF8
    addu    $a3, $s2, $a0
    ori     $v0, $v0, 0x0800
    andi    $v0, $v0, 0xFFFF
    daddu   $a1, $v0, $0
.L80015EF8:
    ld      $a3, 0x0000($a3)
    dsrl    $a3, $a3, 26
    sll     $a3, $a3, 0
    andi    $a3, $a3, 0x0001
    beqz    $a3, .L80015F1C
    addu    $a3, $s2, $a0
    ori     $v0, $v0, 0x0008
    andi    $v0, $v0, 0xFFFF
    daddu   $a1, $v0, $0
.L80015F1C:
    ld      $a3, 0x0000($a3)
    dsrl    $a3, $a3, 25
    sll     $a3, $a3, 0
    andi    $a3, $a3, 0x0001
    beqz    $a3, .L80015F40
    addu    $a3, $s2, $a0
    ori     $v0, $v0, 0x0010
    andi    $v0, $v0, 0xFFFF
    daddu   $a1, $v0, $0
.L80015F40:
    ld      $a3, 0x0000($a3)
    dsrl    $a3, $a3, 24
    sll     $a3, $a3, 0
    andi    $a3, $a3, 0x0001
    beqz    $a3, .L80015F64
    addu    $a3, $s2, $a0
    ori     $v0, $v0, 0x0020
    andi    $v0, $v0, 0xFFFF
    daddu   $a1, $v0, $0
.L80015F64:
    ld      $a3, 0x0000($a3)
    dsrl    $a3, $a3, 31
    sll     $a3, $a3, 0
    andi    $a3, $a3, 0x0001
    beqz    $a3, .L80015F88
    addu    $a3, $s2, $a0
    ori     $v0, $v0, 0x0001
    andi    $v0, $v0, 0xFFFF
    daddu   $a1, $v0, $0
.L80015F88:
    ld      $a3, 0x0000($a3)
    dsrl    $a3, $a3, 30
    sll     $a3, $a3, 0
    andi    $a3, $a3, 0x0001
    beqz    $a3, .L80015FAC
    addu    $a3, $s2, $a0
    ori     $v0, $v0, 0x0002
    andi    $v0, $v0, 0xFFFF
    daddu   $a1, $v0, $0
.L80015FAC:
    ld      $a3, 0x0000($a3)
    dsrl    $a3, $a3, 29
    sll     $a3, $a3, 0
    andi    $a3, $a3, 0x0001
    beqz    $a3, .L80015FD0
    addu    $a3, $s2, $a0
    ori     $v0, $v0, 0x0080
    andi    $v0, $v0, 0xFFFF
    daddu   $a1, $v0, $0
.L80015FD0:
    ld      $a3, 0x0000($a3)
    dsrl    $a3, $a3, 28
    sll     $a3, $a3, 0
    andi    $a3, $a3, 0x0001
    beqz    $a3, .L80015FF4
    addu    $a3, $s2, $a0
    ori     $v0, $v0, 0x0040
    andi    $v0, $v0, 0xFFFF
    daddu   $a1, $v0, $0
.L80015FF4:
    ld      $a3, 0x0000($a3)
    dsrl    $a3, $a3, 21
    sll     $a3, $a3, 0
    andi    $a3, $a3, 0x0001
    beqz    $a3, .L80016018
    addu    $a3, $s2, $a0
    ori     $v0, $v0, 0x0100
    andi    $v0, $v0, 0xFFFF
    daddu   $a1, $v0, $0
.L80016018:
    ld      $a3, 0x0000($a3)
    dsrl    $a3, $a3, 20
    sll     $a3, $a3, 0
    andi    $a3, $a3, 0x0001
    beqz    $a3, .L8001603C
    addu    $a0, $s2, $a0
    ori     $v0, $v0, 0x0200
    andi    $v0, $v0, 0xFFFF
    daddu   $a1, $v0, $0
.L8001603C:
    lw      $a0, 0x0004($a0)
    andi    $a3, $a0, 0x00FF
    addiu   $t1, $a3, -0x0040
    sltiu   $t1, $t1, 0x0021
    beqz    $t1, .L80016060
    addiu   $a3, $a3, -0x00A0
    ori     $v0, $v0, 0x0800
    andi    $v0, $v0, 0xFFFF
    daddu   $a1, $v0, $0
.L80016060:
    sltiu   $a3, $a3, 0x0021
    beqz    $a3, .L80016078
    andi    $a0, $a0, 0xFF00
    ori     $v0, $v0, 0x0008
    andi    $v0, $v0, 0xFFFF
    daddu   $a1, $v0, $0
.L80016078:
    addiu   $a3, $a0, -0x4000
    sltiu   $a3, $a3, 0x2001
    beqz    $a3, .L80016094
    addu    $a0, $a0, $t2
    ori     $v0, $v0, 0x0020
    andi    $v0, $v0, 0xFFFF
    daddu   $a1, $v0, $0
.L80016094:
    sltiu   $a0, $a0, 0x2001
    bnez    $a0, .L80016108
    ori     $v0, $v0, 0x0010
    addiu   $v1, $v1, 0x0001
    daddu   $v0, $a1, $0
    bne     $v1, $t0, .L80015EBC
    addiu   $a2, $a2, 0x0002
.L800160B0:
    lui     $v1, %hi(_80052960)
    andi    $a0, $v0, 0x0B38
    beqz    $a0, .L80016118
    sh      $a1, %lo(_80052960)($v1)
    lbu     $a0, %lo(_8007D1C2)($s1)
    addiu   $a0, $a0, 0x0001
    andi    $a0, $a0, 0x00FF
    sltiu   $a1, $a0, 0x0010
    bnez    $a1, .L800160EC
    sb      $a0, %lo(_8007D1C2)($s1)
    lui     $v0, %hi(_8007D1C2)
    addiu   $a0, $a0, -0x0002
    sb      $a0, %lo(_8007D1C2)($v0)
    sh      $0, %lo(_80052960)($v1)
    daddu   $v0, $0, $0
.L800160EC:
    ld      $ra, 0x00D8($sp)
    ld      $s2, 0x00D0($sp)
    ld      $s1, 0x00C8($sp)
    ld      $s0, 0x00C0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00E0
    nop
.L80016108:
    andi    $v0, $v0, 0xFFFF
    j       .L80015EB0
    daddu   $a1, $v0, $0
    nop
.L80016118:
    ld      $ra, 0x00D8($sp)
    sb      $0, %lo(_8007D1C2)($s1)
    ld      $s2, 0x00D0($sp)
    ld      $s1, 0x00C8($sp)
    ld      $s0, 0x00C0($sp)
    jr      $ra
    addiu   $sp, $sp, 0x00E0
    nop
.L80016138:
    lui     $s1, %hi(_8007D1C2)
    j       .L80015E3C
    sb      $0, %lo(_8007D1C2)($s1)
    nop

.globl sys_os_80016148
sys_os_80016148:
    addiu   $sp, $sp, -0x0030
    sd      $s0, 0x0020($sp)
    li      $v0, 0x0001
    lui     $s0, %hi(_8005295C)
    sd      $ra, 0x0028($sp)
    j       .L80016170
    sb      $v0, %lo(_8005295C)($s0)
    nop
.L80016168:
    jal     SysRandom
    nop
.L80016170:
    jal     sys_os_80015E00
    nop
    bnez    $v0, .L80016168
    nop
    jal     sys_os_80015E00
    nop
    bnez    $v0, .L800161A8
    ld      $ra, 0x0028($sp)
.L80016190:
    jal     SysRandom
    nop
    jal     sys_os_80015E00
    nop
    beqz    $v0, .L80016190
    ld      $ra, 0x0028($sp)
.L800161A8:
    lui     $v0, %hi(_80052960)
    sb      $0, %lo(_8005295C)($s0)
    lhu     $v0, %lo(_80052960)($v0)
    ld      $s0, 0x0020($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0030

.globl sysRepaint
sysRepaint:
    addiu   $sp, $sp, -0x0050
    sd      $s3, 0x0038($sp)
    lui     $s3, %hi(screen)
    sd      $s4, 0x0040($sp)
    addiu   $s4, $s3, %lo(screen)
    lw      $v0, 0x0018($s4)
    lw      $a0, 0x0028($s4)
    andi    $v0, $v0, 0x0001
    xori    $v0, $v0, 0x0001
    addiu   $v1, $v0, 0x0006
    sll     $v1, $v1, 2
    addu    $v1, $s4, $v1
    lw      $a1, 0x0004($v1)
    lui     $v1, %hi(_8005293C)
    sd      $s1, 0x0028($sp)
    sd      $ra, 0x0048($sp)
    sd      $s2, 0x0030($sp)
    sd      $s0, 0x0020($sp)
    lw      $s1, %lo(_8005293C)($v1)
    sw      $v0, 0x0018($s4)
    beqz    $a0, .L80016230
    sw      $a1, 0x0024($s4)
    lw      $a2, 0x0008($s4)
    lw      $v0, 0x000C($s4)
    mult    $a2, $v0
    mflo    $a2
    jal     os_80014768
    sll     $a2, $a2, 1
.L80016230:
    lw      $v0, 0x0004($s4)
    beqz    $v0, .L80016280
    daddu   $s2, $0, $0
    lw      $v0, %lo(screen)($s3)
.L80016240:
    beqz    $v0, .L8001626C
    daddu   $s0, $0, $0
.L80016248:
    lhu     $a0, 0x0000($s1)
    daddu   $a1, $s0, $0
    jal     sys_os_800158B0
    daddu   $a2, $s2, $0
    lw      $v0, %lo(screen)($s3)
    addiu   $s0, $s0, 0x0001
    sltu    $v0, $s0, $v0
    bnez    $v0, .L80016248
    addiu   $s1, $s1, 0x0002
.L8001626C:
    lw      $v0, 0x0004($s4)
    addiu   $s2, $s2, 0x0001
    sltu    $v0, $s2, $v0
    bnez    $v0, .L80016240
    lw      $v0, %lo(screen)($s3)
.L80016280:
    lw      $a1, 0x0014($s4)
    lw      $a0, 0x0024($s4)
    jal     data_cache_hit_writeback
    sll     $a1, $a1, 1
    lui     $v0, %hi(vregs)
    lw      $a1, %lo(vregs)($v0)
    li      $a0, 0x0200
    addiu   $v1, $a1, 0x0010
.L800162A0:
    lw      $v0, 0x0000($v1)
    bne     $v0, $a0, .L800162A0
    ld      $ra, 0x0048($sp)
    lw      $v0, 0x0024($s4)
    ld      $s4, 0x0040($sp)
    ld      $s3, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    sw      $v0, 0x0004($a1)
    jr      $ra
    addiu   $sp, $sp, 0x0050

.globl sysPI_wr
sysPI_wr:
    addiu   $sp, $sp, -0x0040
    sd      $s2, 0x0030($sp)
    daddu   $s2, $a1, $0
    daddu   $a1, $a2, $0
    sd      $ra, 0x0038($sp)
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    daddu   $s1, $a0, $0
    jal     data_cache_hit_writeback
    daddu   $s0, $a2, $0
    jal     disable_interrupts
    nop
.L80016300:
    jal     dma_busy
    nop
    bnez    $v0, .L80016300
    lui     $v1, 0x1FFFFFFF >> 16
    lui     $v0, %hi(0xA4600008)
    ori     $v1, 0x1FFFFFFF & 0xFFFF
    and     $s2, $s2, $v1
    addiu   $s0, $s0, -0x0001
    ori     $v1, $v0, 0x0010
    li      $a0, 0x0003
    sw      $a0, 0x0000($v1)
    sw      $s1, %lo(0xA4600000)($v0)
    sw      $s2, %lo(0xA4600004)($v0)
    sw      $s0, %lo(0xA4600008)($v0)
.L80016338:
    jal     dma_busy
    nop
    bnez    $v0, .L80016338
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       enable_interrupts
    addiu   $sp, $sp, 0x0040
    nop

.globl sysPI_rd
sysPI_rd:
    addiu   $sp, $sp, -0x0040
    sd      $s2, 0x0030($sp)
    daddu   $s2, $a1, $0
    daddu   $a1, $a2, $0
    sd      $ra, 0x0038($sp)
    sd      $s1, 0x0028($sp)
    sd      $s0, 0x0020($sp)
    daddu   $s1, $a0, $0
    jal     data_cache_hit_writeback_invalidate
    daddu   $s0, $a2, $0
    jal     disable_interrupts
    nop
.L80016390:
    jal     dma_busy
    nop
    bnez    $v0, .L80016390
    lui     $v1, 0x1FFFFFFF >> 16
    lui     $v0, %hi(0xA460000C)
    ori     $v1, 0x1FFFFFFF & 0xFFFF
    and     $s2, $s2, $v1
    addiu   $s0, $s0, -0x0001
    ori     $v1, $v0, 0x0010
    li      $a0, 0x0003
    sw      $a0, 0x0000($v1)
    sw      $s1, %lo(0xA4600000)($v0)
    sw      $s2, %lo(0xA4600004)($v0)
    sw      $s0, %lo(0xA460000C)($v0)
.L800163C8:
    jal     dma_busy
    nop
    bnez    $v0, .L800163C8
    ld      $ra, 0x0038($sp)
    ld      $s2, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       enable_interrupts
    addiu   $sp, $sp, 0x0040
    nop

.globl sysInit
sysInit:
    addiu   $sp, $sp, -0x0038
    sd      $ra, 0x0030($sp)
    sd      $s1, 0x0028($sp)
    jal     disable_interrupts
    sd      $s0, 0x0020($sp)
    jal     set_AI_interrupt
    daddu   $a0, $0, $0
    daddu   $a1, $0, $0
    jal     set_VI_interrupt
    daddu   $a0, $0, $0
    jal     set_PI_interrupt
    daddu   $a0, $0, $0
    jal     set_DP_interrupt
    daddu   $a0, $0, $0
    lui     $v0, 0xA460002C >> 16
    ori     $t3, $v0, 0x0010
    li      $v1, 0x0003
    sw      $v1, 0x0000($t3)
    ori     $t2, $v0, 0x0014
    li      $t3, 0x0040
    sw      $t3, 0x0000($t2)
    ori     $t1, $v0, 0x0018
    li      $t2, 0x0012
    sw      $t2, 0x0000($t1)
    ori     $t0, $v0, 0x001C
    ori     $a3, $v0, 0x0020
    li      $t1, 0x0007
    sw      $t1, 0x0000($t0)
    ori     $a2, $v0, 0x0024
    sw      $v1, 0x0000($a3)
    li      $v1, 0x0005
    sw      $v1, 0x0000($a2)
    ori     $a1, $v0, 0x0028
    li      $v1, 0x000C
    sw      $v1, 0x0000($a1)
    ori     $a0, $v0, 0x0030
    li      $v1, 0x000D
    ori     $v0, 0xA460002C & 0xFFFF
    sw      $v1, 0x0000($v0)
    lui     $s0, %hi(screen)
    li      $v0, 0x0002
    addiu   $s0, %lo(screen)
    sw      $v0, 0x0000($a0)
    jal     rdp_init
    li      $s1, 0x00020000
    ori     $a0, $s1, 0x5800
    jal     malloc
    sw      $0, 0x0018($s0)
    sw      $v0, 0x001C($s0)
    jal     malloc
    ori     $a0, $s1, 0x5800
    lw      $v1, 0x0018($s0)
    sw      $v0, 0x0020($s0)
    addiu   $v1, $v1, 0x0006
    sll     $v1, $v1, 2
    addu    $v1, $v1, $s0
    lw      $v0, 0x0004($v1)
    sw      $0, 0x0028($s0)
    sw      $v0, 0x0024($s0)
    ld      $ra, 0x0030($sp)
    ld      $s1, 0x0028($sp)
    ld      $s0, 0x0020($sp)
    j       sysDisplayInit
    addiu   $sp, $sp, 0x0038

.globl sys_800064C8
sys_800064C8:
    andi    $v0, $a0, 0xFFFF
    andi    $a1, $a1, 0xFFFF
    divu    $0, $v0, $a1
    teq     $a1, $0, 7
    mfhi    $v1
    andi    $v1, $v1, 0xFFFF
    beqz    $v1, .L8001651C
    nop
    addu    $v0, $a1, $v0
    subu    $v0, $v0, $v1
    andi    $v0, $v0, 0xFFFF
.L8001651C:
    jr      $ra
    nop
    nop

.globl sys_80006500
sys_80006500:
    andi    $a1, $a1, 0xFFFF
    beqz    $a1, .L80016574
    daddu   $v0, $0, $0
    addiu   $a1, $a1, -0x0001
    addiu   $v0, $a0, 0x0001
    andi    $a1, $a1, 0xFFFF
    addu    $a1, $v0, $a1
    daddu   $v1, $0, $0
    daddu   $v0, $0, $0
    nop
.L80016550:
    lbu     $a2, 0x0000($a0)
    addiu   $a0, $a0, 0x0001
    addu    $v1, $v1, $a2
    andi    $v1, $v1, 0x00FF
    addu    $v0, $v1, $v0
    bne     $a0, $a1, .L80016550
    andi    $v0, $v0, 0x00FF
    sll     $v1, $v1, 8
    or      $v0, $v1, $v0
.L80016574:
    jr      $ra
    nop
    nop

.globl sys_80006558
sys_80006558:
    andi    $a1, $a1, 0xFFFF
    beqz    $a1, .L800165D4
    andi    $v0, $a2, 0xFFFF
    addiu   $a1, $a1, -0x0001
    andi    $a1, $a1, 0xFFFF
    addiu   $v1, $a0, 0x0001
    lui     $a3, %hi(crc_16_table)
    addu    $a1, $v1, $a1
    addiu   $a3, %lo(crc_16_table)
    nop
.L800165A8:
    lbu     $v1, 0x0000($a0)
    srl     $a2, $v0, 8
    xor     $v1, $a2, $v1
    sll     $v1, $v1, 1
    addu    $v1, $a3, $v1
    lhu     $v1, 0x0000($v1)
    sll     $v0, $v0, 8
    xor     $v0, $v1, $v0
    addiu   $a0, $a0, 0x0001
    bne     $a0, $a1, .L800165A8
    andi    $v0, $v0, 0xFFFF
.L800165D4:
    jr      $ra
    nop
    nop

.globl SysDecToBCD
SysDecToBCD:
    andi    $a0, $a0, 0x00FF
    sltiu   $v0, $a0, 0x0064
    beqzl   $v0, .L800165F0
    li      $a0, 0x0063
.L800165F0:
    dsll32  $v0, $a0, 0
    dsrl32  $v0, $v0, 0
    dsll    $a1, $v0, 4
    dsll    $v1, $v0, 2
    dsubu   $v1, $a1, $v1
    dsll    $a1, $v1, 4
    daddu   $v1, $v1, $a1
    dsll    $a1, $v1, 8
    daddu   $v1, $v1, $a1
    dsll    $a1, $v1, 16
    daddu   $v1, $v1, $a1
    daddu   $v1, $v1, $v0
    dsrl32  $v1, $v1, 3
    sll     $a1, $v1, 1
    sll     $v0, $v1, 3
    addu    $v0, $a1, $v0
    andi    $v1, $v1, 0x00FF
    subu    $a0, $a0, $v0
    sll     $v0, $v1, 4
    or      $v0, $v0, $a0
    jr      $ra
    andi    $v0, $v0, 0x00FF

.globl SysBCDToDec
SysBCDToDec:
    andi    $a0, $a0, 0x00FF
    srl     $v0, $a0, 4
    sll     $v1, $v0, 3
    sll     $v0, $v0, 1
    addu    $v0, $v0, $v1
    andi    $a0, $a0, 0x000F
    addu    $v0, $v0, $a0
    jr      $ra
    andi    $v0, $v0, 0x00FF
    nop

.globl crc7
crc7:
    beqz    $a1, .L800166AC
    daddu   $v0, $0, $0
.L80016678:
    lbu     $a2, 0x0000($a0)
    li      $v1, 0x0008
    xor     $v0, $v0, $a2
    sll     $v0, $v0, 1
.L80016688:
    andi    $a2, $v0, 0x0100
    beqz    $a2, .L80016698
    addiu   $v1, $v1, -0x0001
    xori    $v0, $v0, 0x0012
.L80016698:
    bnezl   $v1, .L80016688
    sll     $v0, $v0, 1
    addiu   $a1, $a1, -0x0001
    bnez    $a1, .L80016678
    addiu   $a0, $a0, 0x0001
.L800166AC:
    jr      $ra
    andi    $v0, $v0, 0x00FE
    nop

.globl sdCrc16
sdCrc16:
    addiu   $sp, $sp, -0x0048
    lui     $t2, %hi(crc_bit_table)
    lui     $t1, %hi(crc_16_table)
    sd      $s7, 0x0040($sp)
    sd      $s6, 0x0038($sp)
    sd      $s5, 0x0030($sp)
    sd      $s4, 0x0028($sp)
    sd      $s3, 0x0020($sp)
    sd      $s2, 0x0018($sp)
    sd      $s1, 0x0010($sp)
    sd      $s0, 0x0008($sp)
    sh      $0, 0x0000($sp)
    sh      $0, 0x0002($sp)
    sh      $0, 0x0004($sp)
    sh      $0, 0x0006($sp)
    addiu   $t2, %lo(crc_bit_table)
    addiu   $t1, %lo(crc_16_table)
    daddu   $t5, $0, $0
    daddu   $t4, $0, $0
    addiu   $t7, $a0, 0x0200
    daddu   $t3, $0, $0
    daddu   $t0, $0, $0
    li      $t6, -0x0078
    nop
.L80016718:
    lbu     $a2, 0x0000($a0)
    lbu     $a3, 0x0001($a0)
    lbu     $v1, 0x0002($a0)
    lbu     $v0, 0x0003($a0)
    andi    $s2, $a3, 0x0088
    andi    $t9, $v1, 0x0088
    andi    $s1, $a2, 0x0011
    andi    $t8, $a2, 0x0022
    andi    $s0, $a2, 0x0044
    sll     $s0, $s0, 1
    sra     $t9, $t9, 2
    andi    $s7, $v0, 0x0011
    andi    $s5, $a3, 0x0011
    andi    $s6, $v1, 0x0022
    andi    $s4, $a3, 0x0022
    andi    $s3, $v1, 0x0044
    sll     $s1, $s1, 3
    sll     $t8, $t8, 2
    sra     $s2, $s2, 1
    andi    $a3, $a3, 0x0044
    or      $a3, $s0, $a3
    or      $s2, $s2, $t9
    andi    $s0, $v0, 0x0022
    andi    $t9, $v0, 0x0088
    or      $s1, $s1, $s7
    or      $t8, $t8, $s6
    sll     $s5, $s5, 2
    sll     $s4, $s4, 1
    sra     $s3, $s3, 1
    and     $a2, $a2, $t6
    andi    $v1, $v1, 0x0011
    andi    $v0, $v0, 0x0044
    or      $s1, $s1, $s5
    or      $a3, $a3, $s3
    sra     $s0, $s0, 1
    sra     $t9, $t9, 3
    or      $t8, $t8, $s4
    or      $a2, $s2, $a2
    sll     $v1, $v1, 1
    sra     $v0, $v0, 2
    or      $v1, $s1, $v1
    or      $t8, $t8, $s0
    or      $v0, $a3, $v0
    or      $a2, $a2, $t9
    addu    $v1, $t2, $v1
    addu    $t8, $t2, $t8
    addu    $v0, $t2, $v0
    addu    $a2, $t2, $a2
    lbu     $a3, 0x0000($v1)
    lbu     $s0, 0x0000($t8)
    lbu     $v1, 0x0000($v0)
    lbu     $v0, 0x0000($a2)
    srl     $s1, $t0, 8
    srl     $a2, $t5, 8
    srl     $t9, $t4, 8
    srl     $t8, $t3, 8
    xor     $a3, $s1, $a3
    xor     $a2, $a2, $s0
    xor     $v1, $t9, $v1
    xor     $v0, $t8, $v0
    sll     $a3, $a3, 1
    sll     $a2, $a2, 1
    sll     $v1, $v1, 1
    sll     $v0, $v0, 1
    addu    $a3, $t1, $a3
    addu    $a2, $t1, $a2
    addu    $v1, $t1, $v1
    addu    $v0, $t1, $v0
    lhu     $a3, 0x0000($a3)
    lhu     $a2, 0x0000($a2)
    lhu     $v1, 0x0000($v1)
    lhu     $v0, 0x0000($v0)
    sll     $t0, $t0, 8
    sll     $t5, $t5, 8
    sll     $t4, $t4, 8
    sll     $t3, $t3, 8
    xor     $t0, $a3, $t0
    xor     $t5, $a2, $t5
    xor     $t4, $v1, $t4
    xor     $t3, $v0, $t3
    addiu   $a0, $a0, 0x0004
    andi    $t0, $t0, 0xFFFF
    andi    $t5, $t5, 0xFFFF
    andi    $t4, $t4, 0xFFFF
    bne     $a0, $t7, .L80016718
    andi    $t3, $t3, 0xFFFF
    sh      $t3, 0x0006($sp)
    sh      $t5, 0x0002($sp)
    sh      $t4, 0x0004($sp)
    sh      $t0, 0x0000($sp)
    daddu   $t2, $0, $0
    li      $t1, 0x0010
    li      $t3, 0x0004
.L8001688C:
    lhu     $a0, 0x0006($a1)
    daddu   $v0, $0, $0
    j       .L800168A4
    daddu   $v1, $0, $0
    nop
.L800168A0:
    lhu     $t0, 0x0000($a3)
.L800168A4:
    sll     $a2, $t0, 15
    sll     $v1, $v1, 1
    srl     $a0, $a0, 1
    addiu   $v0, $v0, 0x0001
    or      $a0, $a2, $a0
    addu    $a2, $sp, $v1
    andi    $v1, $v0, 0x0003
    srl     $t0, $t0, 1
    sll     $a3, $v1, 1
    addu    $a3, $sp, $a3
    sh      $t0, 0x0000($a2)
    bne     $v0, $t1, .L800168A0
    andi    $a0, $a0, 0xFFFF
    addiu   $t2, $t2, 0x0001
    andi    $t2, $t2, 0xFFFF
    sh      $a0, 0x0006($a1)
    beq     $t2, $t3, .L800168F8
    addiu   $a1, $a1, -0x0002
    j       .L8001688C
    lhu     $t0, 0x0000($sp)
    nop
.L800168F8:
    ld      $s7, 0x0040($sp)
    ld      $s6, 0x0038($sp)
    ld      $s5, 0x0030($sp)
    ld      $s4, 0x0028($sp)
    ld      $s3, 0x0020($sp)
    ld      $s2, 0x0018($sp)
    ld      $s1, 0x0010($sp)
    ld      $s0, 0x0008($sp)
    jr      $ra
    addiu   $sp, $sp, 0x0048

.globl sys_800068B0
sys_800068B0:
    andi    $a0, $a0, 0xFFFF
    andi    $a2, $a2, 0xFFFF
    divu    $0, $a0, $a2
    teq     $a2, $0, 7
    mflo    $v1
    addu    $v1, $a1, $v1
    andi    $v1, $v1, 0xFFFF
    sll     $v0, $v1, 16
    sra     $v0, $v0, 16
    bgez    $v0, .L80016958
    andi    $a3, $a3, 0xFFFF
    addu    $v0, $v1, $a3
    sll     $v0, $v0, 16
    sra     $v0, $v0, 16
.L80016958:
    div     $0, $v0, $a3
    teq     $a3, $0, 7
    mfhi    $a3
    nop
    nop
    divu    $0, $a0, $a2
    teq     $a2, $0, 7
    mfhi    $v0
    nop
    nop
    mult    $a2, $a3
    mflo    $a3
    addu    $v0, $a3, $v0
    jr      $ra
    andi    $v0, $v0, 0xFFFF
    nop

.globl sys_80006928
sys_80006928:
    andi    $a0, $a0, 0xFFFF
    andi    $a2, $a2, 0xFFFF
    divu    $0, $a0, $a2
    teq     $a2, $0, 7
    mfhi    $v0
    addu    $v0, $a1, $v0
    andi    $v0, $v0, 0xFFFF
    sll     $v1, $v0, 16
    sra     $v1, $v1, 16
    bgez    $v1, .L800169D0
    nop
    addu    $v0, $v0, $a2
    sll     $v1, $v0, 16
    sra     $v1, $v1, 16
.L800169D0:
    divu    $0, $a0, $a2
    teq     $a2, $0, 7
    mflo    $a0
    nop
    nop
    div     $0, $v1, $a2
    teq     $a2, $0, 7
    mfhi    $v0
    nop
    nop
    mult    $a2, $a0
    mflo    $a0
    addu    $v0, $v0, $a0
    jr      $ra
    andi    $v0, $v0, 0xFFFF
    nop

.globl sys_os_80016A10
sys_os_80016A10:
    beqz    $a2, .L80016A4C
    nor     $v0, $0, $a0
    lui     $a3, %hi(_8004D848)
    addiu   $a3, %lo(_8004D848)
.L80016A20:
    lbu     $a0, 0x0000($a1)
    srl     $v1, $v0, 8
    xor     $v0, $v0, $a0
    andi    $v0, $v0, 0x00FF
    sll     $v0, $v0, 2
    addu    $v0, $a3, $v0
    lw      $v0, 0x0000($v0)
    addiu   $a2, $a2, -0x0001
    xor     $v0, $v0, $v1
    bnez    $a2, .L80016A20
    addiu   $a1, $a1, 0x0001
.L80016A4C:
    jr      $ra
    nor     $v0, $0, $v0
    nop
    nop
    nop
