OUTPUT_FORMAT("elf32-bigmips")
OUTPUT_ARCH(mips)
EXTERN(_start)
ENTRY(_start)
SECTIONS
{
    . = 0x80000400;
    .text :
    {
        FILL(0);

        build/src/libdragon/entrypoint.o(.boot);

        . = ALIGN(16);
        __text_start = .;

        build/src/os.o(.text);
        build/src/incs.o(.text);
        build/src/libdragon/n64sys.o(.text);
        build/src/libdragon/interrupt.o(.text);
        build/src/libdragon/controller.o(.text);
        build/src/libdragon/mempak.o(.text);
        build/src/libdragon/rdp.o(.text);
        build/src/libdragon/dma.o(.text);
        build/src/libdragon/inthandler.o(.text);
        build/src/libdragon/display.o(.text);
        build/src/libdragon/exception.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-malloc.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-mallocr.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-memcmp.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-memcpy.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-memset.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-mlock.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-sbrkr.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-setjmp.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-snprintf.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-svfprintf.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-dtoa.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-freer.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-locale.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-memchr.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-memmove.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-mprec.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-reallocr.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-reent.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-s_isinfd.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-s_isnand.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-strcmp.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-strlen.o(.text);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-callocr.o(.text);
        tools/mips64/mips64-elf/lib/libnosys.a:sbrk.o(.text);

        build/src/os_data.o(.rodata);
        build/src/libdragon/controller.o(.rodata);
        build/src/libdragon/mempak.o(.rodata);
        build/src/libdragon/display.o(.rodata);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-svfprintf.o(.rodata);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-locale.o(.rodata);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-mprec.o(.rodata);

        build/src/os_data.o(.rodata.str1.8);
        build/src/libdragon/exception.o(.rodata.str1.8);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-svfprintf.o(.rodata.str1.8);
        build/src/zero.o(.rodata.str1.8);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-dtoa.o(.rodata.str1.8);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-locale.o(.rodata.str1.8);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-impure.o(.rodata.str1.8);

        build/src/os_data.o(.rodata.cst8);
        build/src/libdragon/rdp.o(.rodata.cst8);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-dtoa.o(.rodata.cst8);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-mprec.o(.rodata.cst8);

        build/src/eh_frame.o(.rodata);

        __text_end = .;
    }
    .data :
    {
        FILL(0xAA);
        . = ALIGN(16);
        __data_start = .;

        build/src/os_data.o(.data);
        build/src/libdragon/n64sys.o(.data);
        build/src/libdragon/interrupt.o(.data);
        build/src/libdragon/controller.o(.data);
        build/src/libdragon/rdp.o(.data);
        build/src/libdragon/display.o(.data);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-mallocr.o(.data);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-impure.o(.data);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-locale.o(.data);

        . = ALIGN(16);
        _gp = .;

        tools/mips64/mips64-elf/lib/libc.a:lib_a-impure.o(.sdata);

        __data_end = .;
    }
    .bss (NOLOAD) :
    {
        __bss_start = .;

        build/src/os_data.o(.scommon);
        build/src/libdragon/display.o(.scommon);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-reent.o(.scommon);

        build/src/libdragon/inthandler.o(.sbss);

        build/src/os_data.o(COMMON);
        build/src/libdragon/display.o(COMMON);

        build/src/os_data.o(.bss);
        build/src/libdragon/interrupt.o(.bss);
        build/src/libdragon/controller.o(.bss);
        build/src/libdragon/rdp.o(.bss);
        build/src/libdragon/inthandler.o(.bss);
        build/src/libdragon/display.o(.bss);
        build/src/libdragon/exception.o(.bss);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-mallocr.o(.bss);
        tools/mips64/mips64-elf/lib/libc.a:lib_a-locale.o(.bss);
        tools/mips64/mips64-elf/lib/libnosys.a:sbrk.o(.bss);

        __bss_end = .;
        end = .;
    }
    /DISCARD/ : {*(*)}
}
