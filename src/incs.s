.align 4
.globl font
font:
.incbin "src/font64.bin"

.align 4
.globl mcn_data
mcn_data:
.incbin "src/mcn_data.rbf"

.align 4
.globl iom_data
iom_data:
.incbin "src/iom_data.rbf"

.align 4
.globl iom_data_len
iom_data_len:
.word 32220

.align 4
.globl mpk_data
mpk_data:
.incbin "src/mpk_data.bin"

.align 4
.globl mcn_data_len
mcn_data_len:
.word 122156

.align 4
.ascii "A golova suselikov puskaet. Dva-dva u Natalicha!"

.align 4
.incbin "src/unknown.jpg"
