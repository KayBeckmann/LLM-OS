.section ".text.boot"

.global _start

_start:
    mrs     x0, mpidr_el1
    and     x0, x0, #0xFF
    cbz     x0, .Lcpu_zero_master
.Lcpu_wait:
    wfe
    b       .Lcpu_wait

.Lcpu_zero_master:
    ldr     x0, =__stack_top
    mov     sp, x0

    ldr     x0, =__bss_start
    ldr     x1, =__bss_end
.Lbss_loop:
    cmp     x0, x1
    b.ge    .Ljump_to_rust
    str     xzr, [x0], #8
    b       .Lbss_loop

.Ljump_to_rust:
    bl      kmain

.Lhalt:
    wfe
    b       .Lhalt
