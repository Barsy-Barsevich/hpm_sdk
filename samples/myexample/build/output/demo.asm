
/home/victor/Documents/ComputerResearch/RISC-V/barsotion_hpm_sdk/samples/myexample/build/output/demo.elf:     tiedostomuoto elf32-littleriscv


Lohkon .start disassemblointi:

80003000 <_start>:

_start:
    /* Initialize global pointer */
    .option push
    .option norelax
    la gp, __global_pointer$
80003000:	8107e197          	auipc	gp,0x8107e
80003004:	80018193          	addi	gp,gp,-2048 # 1080800 <__global_pointer$>
    la tp, __thread_pointer$
80003008:	8107d217          	auipc	tp,0x8107d
8000300c:	1c020213          	addi	tp,tp,448 # 10801c8 <__sf>
    .option pop

    /* reset mstatus to 0*/
    csrrw x0, mstatus, x0
80003010:	30001073          	csrw	mstatus,zero
    /* Initialize FCSR */
    fscsr zero
#endif

    /* Enable LMM1 clock */
    la t0, 0xF4000800
80003014:	f40012b7          	lui	t0,0xf4001
80003018:	80028293          	addi	t0,t0,-2048 # f4000800 <__fast_load_addr__+0x73ff2640>
    lw t1, 0(t0)
8000301c:	0002a303          	lw	t1,0(t0)
    ori t1, t1, 0x80
80003020:	08036313          	ori	t1,t1,128
    sw t1, 0(t0)
80003024:	0062a023          	sw	t1,0(t0)
    mv sp, t0
    call _init_ext_ram
#endif

    /* Initialize stack pointer */
    la t0, _stack
80003028:	80085297          	auipc	t0,0x80085
8000302c:	fd828293          	addi	t0,t0,-40 # 88000 <_stack>
    mv sp, t0
80003030:	8116                	mv	sp,t0

#ifdef CONFIG_NOT_ENABLE_ICACHE
    call l1c_ic_disable
#else
    call l1c_ic_enable
80003032:	465020ef          	jal	80005c96 <l1c_ic_enable>
#endif
#ifdef CONFIG_NOT_ENABLE_DCACHE
    call l1c_dc_invalidate_all
    call l1c_dc_disable
#else
    call l1c_dc_enable
80003036:	42d020ef          	jal	80005c62 <l1c_dc_enable>
    call l1c_dc_invalidate_all
8000303a:	489020ef          	jal	80005cc2 <l1c_dc_invalidate_all>

    /*
     * Initialize LMA/VMA sections.
     * Relocation for any sections that need to be copied from LMA to VMA.
     */
    call c_startup
8000303e:	219020ef          	jal	80005a56 <c_startup>
    la t1, __SEGGER_RTL_init_heap
    jalr t1
#endif

    /* Do global constructors */
    call __libc_init_array
80003042:	786020ef          	jal	800057c8 <__libc_init_array>

#ifndef NO_CLEANUP_AT_START
    /* clean up */
    call _clean_up
80003046:	009020ef          	jal	8000584e <_clean_up>
    #define HANDLER_TRAP irq_handler_trap
#endif

#if !defined(USE_NONVECTOR_MODE) || (USE_NONVECTOR_MODE == 0)
    /* Initial machine trap-vector Base */
    la t0, __vector_table
8000304a:	00000293          	li	t0,0
    csrw mtvec, t0
8000304e:	30529073          	csrw	mtvec,t0

    /* Enable vectored external PLIC interrupt */
    csrsi CSR_MMISC_CTL, 2
80003052:	7d016073          	csrsi	0x7d0,2
    /* Disable vectored external PLIC interrupt */
    csrci CSR_MMISC_CTL, 2
#endif

    /* System reset handler */
    call reset_handler
80003056:	2c3020ef          	jal	80005b18 <reset_handler>

    /* Infinite loop, if returned accidentally */
1:    j 1b
8000305a:	a001                	j	8000305a <_start+0x5a>

8000305c <exit>:

    .weak exit
exit:
1:    j 1b
8000305c:	a001                	j	8000305c <exit>
	...

Lohkon .vectors disassemblointi:

00000000 <__vector_ram_start__>:
   0:	0208                	addi	a0,sp,256
   2:	0000                	unimp
   4:	0204                	addi	s1,sp,256
   6:	0000                	unimp
   8:	0204                	addi	s1,sp,256
   a:	0000                	unimp
   c:	0204                	addi	s1,sp,256
   e:	0000                	unimp
  10:	0204                	addi	s1,sp,256
  12:	0000                	unimp
  14:	0204                	addi	s1,sp,256
  16:	0000                	unimp
  18:	0204                	addi	s1,sp,256
  1a:	0000                	unimp
  1c:	0204                	addi	s1,sp,256
  1e:	0000                	unimp
  20:	0204                	addi	s1,sp,256
  22:	0000                	unimp
  24:	0204                	addi	s1,sp,256
  26:	0000                	unimp
  28:	0204                	addi	s1,sp,256
  2a:	0000                	unimp
  2c:	0204                	addi	s1,sp,256
  2e:	0000                	unimp
  30:	0204                	addi	s1,sp,256
  32:	0000                	unimp
  34:	0204                	addi	s1,sp,256
  36:	0000                	unimp
  38:	0204                	addi	s1,sp,256
  3a:	0000                	unimp
  3c:	0204                	addi	s1,sp,256
  3e:	0000                	unimp
  40:	0204                	addi	s1,sp,256
  42:	0000                	unimp
  44:	0204                	addi	s1,sp,256
  46:	0000                	unimp
  48:	0204                	addi	s1,sp,256
  4a:	0000                	unimp
  4c:	0204                	addi	s1,sp,256
  4e:	0000                	unimp
  50:	0204                	addi	s1,sp,256
  52:	0000                	unimp
  54:	0204                	addi	s1,sp,256
  56:	0000                	unimp
  58:	0204                	addi	s1,sp,256
  5a:	0000                	unimp
  5c:	0204                	addi	s1,sp,256
  5e:	0000                	unimp
  60:	0204                	addi	s1,sp,256
  62:	0000                	unimp
  64:	0204                	addi	s1,sp,256
  66:	0000                	unimp
  68:	0204                	addi	s1,sp,256
  6a:	0000                	unimp
  6c:	0204                	addi	s1,sp,256
  6e:	0000                	unimp
  70:	0204                	addi	s1,sp,256
  72:	0000                	unimp
  74:	0204                	addi	s1,sp,256
  76:	0000                	unimp
  78:	0204                	addi	s1,sp,256
  7a:	0000                	unimp
  7c:	0204                	addi	s1,sp,256
  7e:	0000                	unimp
  80:	0204                	addi	s1,sp,256
  82:	0000                	unimp
  84:	0204                	addi	s1,sp,256
  86:	0000                	unimp
  88:	0204                	addi	s1,sp,256
  8a:	0000                	unimp
  8c:	0204                	addi	s1,sp,256
  8e:	0000                	unimp
  90:	0204                	addi	s1,sp,256
  92:	0000                	unimp
  94:	0204                	addi	s1,sp,256
  96:	0000                	unimp
  98:	0204                	addi	s1,sp,256
  9a:	0000                	unimp
  9c:	0204                	addi	s1,sp,256
  9e:	0000                	unimp
  a0:	0204                	addi	s1,sp,256
  a2:	0000                	unimp
  a4:	0204                	addi	s1,sp,256
  a6:	0000                	unimp
  a8:	0204                	addi	s1,sp,256
  aa:	0000                	unimp
  ac:	0204                	addi	s1,sp,256
  ae:	0000                	unimp
  b0:	0204                	addi	s1,sp,256
  b2:	0000                	unimp
  b4:	0204                	addi	s1,sp,256
  b6:	0000                	unimp
  b8:	0204                	addi	s1,sp,256
  ba:	0000                	unimp
  bc:	0204                	addi	s1,sp,256
  be:	0000                	unimp
  c0:	0204                	addi	s1,sp,256
  c2:	0000                	unimp
  c4:	0204                	addi	s1,sp,256
  c6:	0000                	unimp
  c8:	0204                	addi	s1,sp,256
  ca:	0000                	unimp
  cc:	0204                	addi	s1,sp,256
  ce:	0000                	unimp
  d0:	0204                	addi	s1,sp,256
  d2:	0000                	unimp
  d4:	0204                	addi	s1,sp,256
  d6:	0000                	unimp
  d8:	0204                	addi	s1,sp,256
  da:	0000                	unimp
  dc:	0204                	addi	s1,sp,256
  de:	0000                	unimp
  e0:	0204                	addi	s1,sp,256
  e2:	0000                	unimp
  e4:	0204                	addi	s1,sp,256
  e6:	0000                	unimp
  e8:	0204                	addi	s1,sp,256
  ea:	0000                	unimp
  ec:	0204                	addi	s1,sp,256
  ee:	0000                	unimp
  f0:	0204                	addi	s1,sp,256
  f2:	0000                	unimp
  f4:	0204                	addi	s1,sp,256
  f6:	0000                	unimp
  f8:	0204                	addi	s1,sp,256
  fa:	0000                	unimp
  fc:	0204                	addi	s1,sp,256
  fe:	0000                	unimp
 100:	0204                	addi	s1,sp,256
 102:	0000                	unimp
 104:	0204                	addi	s1,sp,256
 106:	0000                	unimp
 108:	0204                	addi	s1,sp,256
 10a:	0000                	unimp
 10c:	0398                	addi	a4,sp,448
 10e:	0000                	unimp
 110:	0204                	addi	s1,sp,256
 112:	0000                	unimp
 114:	0204                	addi	s1,sp,256
 116:	0000                	unimp
 118:	0204                	addi	s1,sp,256
 11a:	0000                	unimp
 11c:	0204                	addi	s1,sp,256
 11e:	0000                	unimp
 120:	0204                	addi	s1,sp,256
 122:	0000                	unimp
 124:	0204                	addi	s1,sp,256
 126:	0000                	unimp
 128:	0204                	addi	s1,sp,256
 12a:	0000                	unimp
 12c:	0204                	addi	s1,sp,256
 12e:	0000                	unimp
 130:	0204                	addi	s1,sp,256
 132:	0000                	unimp
 134:	0204                	addi	s1,sp,256
 136:	0000                	unimp
 138:	0204                	addi	s1,sp,256
 13a:	0000                	unimp
 13c:	0204                	addi	s1,sp,256
 13e:	0000                	unimp
 140:	0204                	addi	s1,sp,256
 142:	0000                	unimp
 144:	0204                	addi	s1,sp,256
 146:	0000                	unimp
 148:	0204                	addi	s1,sp,256
 14a:	0000                	unimp
 14c:	0204                	addi	s1,sp,256
 14e:	0000                	unimp
 150:	0204                	addi	s1,sp,256
 152:	0000                	unimp
 154:	0204                	addi	s1,sp,256
 156:	0000                	unimp
 158:	0204                	addi	s1,sp,256
 15a:	0000                	unimp
 15c:	0204                	addi	s1,sp,256
 15e:	0000                	unimp
 160:	0204                	addi	s1,sp,256
 162:	0000                	unimp
 164:	0204                	addi	s1,sp,256
 166:	0000                	unimp
 168:	0204                	addi	s1,sp,256
 16a:	0000                	unimp
 16c:	0204                	addi	s1,sp,256
 16e:	0000                	unimp
 170:	0204                	addi	s1,sp,256
 172:	0000                	unimp
 174:	0204                	addi	s1,sp,256
 176:	0000                	unimp
 178:	0204                	addi	s1,sp,256
 17a:	0000                	unimp
 17c:	0204                	addi	s1,sp,256
 17e:	0000                	unimp
 180:	0204                	addi	s1,sp,256
 182:	0000                	unimp
 184:	0204                	addi	s1,sp,256
 186:	0000                	unimp
 188:	0204                	addi	s1,sp,256
 18a:	0000                	unimp
 18c:	0204                	addi	s1,sp,256
 18e:	0000                	unimp
 190:	0204                	addi	s1,sp,256
 192:	0000                	unimp
 194:	0204                	addi	s1,sp,256
 196:	0000                	unimp
 198:	0204                	addi	s1,sp,256
 19a:	0000                	unimp
 19c:	0204                	addi	s1,sp,256
 19e:	0000                	unimp
 1a0:	0204                	addi	s1,sp,256
 1a2:	0000                	unimp
 1a4:	0204                	addi	s1,sp,256
 1a6:	0000                	unimp
 1a8:	0204                	addi	s1,sp,256
 1aa:	0000                	unimp
 1ac:	0204                	addi	s1,sp,256
 1ae:	0000                	unimp
 1b0:	0204                	addi	s1,sp,256
 1b2:	0000                	unimp
 1b4:	0204                	addi	s1,sp,256
 1b6:	0000                	unimp
 1b8:	0204                	addi	s1,sp,256
 1ba:	0000                	unimp
 1bc:	0204                	addi	s1,sp,256
 1be:	0000                	unimp
 1c0:	0204                	addi	s1,sp,256
 1c2:	0000                	unimp
 1c4:	0204                	addi	s1,sp,256
 1c6:	0000                	unimp
 1c8:	0204                	addi	s1,sp,256
 1ca:	0000                	unimp
 1cc:	0204                	addi	s1,sp,256
 1ce:	0000                	unimp
 1d0:	0204                	addi	s1,sp,256
 1d2:	0000                	unimp
 1d4:	0204                	addi	s1,sp,256
 1d6:	0000                	unimp
 1d8:	0204                	addi	s1,sp,256
 1da:	0000                	unimp
 1dc:	0204                	addi	s1,sp,256
 1de:	0000                	unimp
 1e0:	0204                	addi	s1,sp,256
 1e2:	0000                	unimp
 1e4:	0204                	addi	s1,sp,256
 1e6:	0000                	unimp
 1e8:	0204                	addi	s1,sp,256
 1ea:	0000                	unimp
 1ec:	0204                	addi	s1,sp,256
 1ee:	0000                	unimp
 1f0:	0204                	addi	s1,sp,256
 1f2:	0000                	unimp
 1f4:	0204                	addi	s1,sp,256
 1f6:	0000                	unimp
 1f8:	0204                	addi	s1,sp,256
 1fa:	0000                	unimp
 1fc:	0204                	addi	s1,sp,256
	...

00000200 <nmi_handler>:

    .section .isr_vector, "ax"
    .weak nmi_handler
nmi_handler:
1:    j 1b
 200:	a001                	j	200 <nmi_handler>
 202:	0001                	nop

00000204 <default_irq_handler>:
#else

.weak default_irq_handler
.align 2
default_irq_handler:
1:    j 1b
 204:	a001                	j	204 <default_irq_handler>
 206:	0001                	nop

00000208 <irq_handler_trap>:
#if defined(__ICCRISCV__) && (IRQ_HANDLER_TRAP_AS_ISR == 1)
extern int __vector_table[];
HPM_ATTR_MACHINE_INTERRUPT
#endif
void irq_handler_trap(void)
{
 208:	7175                	addi	sp,sp,-144
 20a:	c706                	sw	ra,140(sp)
 20c:	c516                	sw	t0,136(sp)
 20e:	c31a                	sw	t1,132(sp)
 210:	c11e                	sw	t2,128(sp)
 212:	deaa                	sw	a0,124(sp)
 214:	dcae                	sw	a1,120(sp)
 216:	dab2                	sw	a2,116(sp)
 218:	d8b6                	sw	a3,112(sp)
 21a:	d6ba                	sw	a4,108(sp)
 21c:	d4be                	sw	a5,104(sp)
 21e:	d2c2                	sw	a6,100(sp)
 220:	d0c6                	sw	a7,96(sp)
 222:	cef2                	sw	t3,92(sp)
 224:	ccf6                	sw	t4,88(sp)
 226:	cafa                	sw	t5,84(sp)
 228:	c8fe                	sw	t6,80(sp)
    long mcause = read_csr(CSR_MCAUSE);
 22a:	342027f3          	csrr	a5,mcause
 22e:	c4be                	sw	a5,72(sp)
 230:	47a6                	lw	a5,72(sp)
 232:	c2be                	sw	a5,68(sp)
    long mepc = read_csr(CSR_MEPC);
 234:	341027f3          	csrr	a5,mepc
 238:	c0be                	sw	a5,64(sp)
 23a:	4786                	lw	a5,64(sp)
 23c:	c6be                	sw	a5,76(sp)
    long mstatus = read_csr(CSR_MSTATUS);
 23e:	300027f3          	csrr	a5,mstatus
 242:	de3e                	sw	a5,60(sp)
 244:	57f2                	lw	a5,60(sp)
 246:	dc3e                	sw	a5,56(sp)
    int ucode = read_csr(CSR_UCODE);
#endif
#ifdef __riscv_flen
    int fcsr = read_fcsr();
#endif
    int mcctlbeginaddr = read_csr(CSR_MCCTLBEGINADDR);
 248:	7cb027f3          	csrr	a5,0x7cb
 24c:	da3e                	sw	a5,52(sp)
 24e:	57d2                	lw	a5,52(sp)
 250:	d83e                	sw	a5,48(sp)
    int mcctldata = read_csr(CSR_MCCTLDATA);
 252:	7cd027f3          	csrr	a5,0x7cd
 256:	d63e                	sw	a5,44(sp)
 258:	57b2                	lw	a5,44(sp)
 25a:	d43e                	sw	a5,40(sp)
#else
    __asm volatile("" : : : "a7", "a0", "a1", "a2", "a3");
#endif

    /* Do your trap handling */
    if ((mcause & CSR_MCAUSE_INTERRUPT_MASK) && ((mcause & CSR_MCAUSE_EXCEPTION_CODE_MASK) == IRQ_M_TIMER)) {
 25c:	4796                	lw	a5,68(sp)
 25e:	0007de63          	bgez	a5,27a <irq_handler_trap+0x72>
 262:	4796                	lw	a5,68(sp)
 264:	07d2                	slli	a5,a5,0x14
 266:	0147d713          	srli	a4,a5,0x14
 26a:	479d                	li	a5,7
 26c:	00f71763          	bne	a4,a5,27a <irq_handler_trap+0x72>
        /* Machine timer interrupt */
        mchtmr_isr();
 270:	80006097          	auipc	ra,0x80006
 274:	8c2080e7          	jalr	-1854(ra) # 80005b32 <mchtmr_isr>
 278:	a06d                	j	322 <irq_handler_trap+0x11a>
            __plic_complete_irq(HPM_PLIC_BASE, HPM_PLIC_TARGET_M_MODE, irq_index);
        }
    }
#endif

    else if ((mcause & CSR_MCAUSE_INTERRUPT_MASK) && ((mcause & CSR_MCAUSE_EXCEPTION_CODE_MASK) == IRQ_M_SOFT)) {
 27a:	4796                	lw	a5,68(sp)
 27c:	0607d463          	bgez	a5,2e4 <irq_handler_trap+0xdc>
 280:	4796                	lw	a5,68(sp)
 282:	07d2                	slli	a5,a5,0x14
 284:	0147d713          	srli	a4,a5,0x14
 288:	478d                	li	a5,3
 28a:	04f71d63          	bne	a4,a5,2e4 <irq_handler_trap+0xdc>
 28e:	e64007b7          	lui	a5,0xe6400
 292:	ca3e                	sw	a5,20(sp)
 294:	c802                	sw	zero,16(sp)
 */
ATTR_ALWAYS_INLINE static inline uint32_t __plic_claim_irq(uint32_t base, uint32_t target)
{
    volatile uint32_t *claim_addr = (volatile uint32_t *)(base +
            HPM_PLIC_CLAIM_OFFSET +
            (target << HPM_PLIC_CLAIM_SHIFT_PER_TARGET));
 296:	47c2                	lw	a5,16(sp)
 298:	00c79713          	slli	a4,a5,0xc
            HPM_PLIC_CLAIM_OFFSET +
 29c:	47d2                	lw	a5,20(sp)
 29e:	973e                	add	a4,a4,a5
 2a0:	002007b7          	lui	a5,0x200
 2a4:	0791                	addi	a5,a5,4 # 200004 <_stack+0x178004>
 2a6:	97ba                	add	a5,a5,a4
    volatile uint32_t *claim_addr = (volatile uint32_t *)(base +
 2a8:	c63e                	sw	a5,12(sp)
    return *claim_addr;
 2aa:	47b2                	lw	a5,12(sp)
 2ac:	439c                	lw	a5,0(a5)
 *
 */
ATTR_ALWAYS_INLINE static inline void intc_m_claim_swi(void)
{
    __plic_claim_irq(HPM_PLICSW_BASE, 0);
}
 2ae:	0001                	nop
        /* Machine SWI interrupt */
        intc_m_claim_swi();
        swi_isr();
 2b0:	80006097          	auipc	ra,0x80006
 2b4:	886080e7          	jalr	-1914(ra) # 80005b36 <swi_isr>
 2b8:	e64007b7          	lui	a5,0xe6400
 2bc:	d23e                	sw	a5,36(sp)
 2be:	d002                	sw	zero,32(sp)
 2c0:	4785                	li	a5,1
 2c2:	ce3e                	sw	a5,28(sp)
                                                          uint32_t target,
                                                          uint32_t irq)
{
    volatile uint32_t *claim_addr = (volatile uint32_t *)(base +
            HPM_PLIC_CLAIM_OFFSET +
            (target << HPM_PLIC_CLAIM_SHIFT_PER_TARGET));
 2c4:	5782                	lw	a5,32(sp)
 2c6:	00c79713          	slli	a4,a5,0xc
            HPM_PLIC_CLAIM_OFFSET +
 2ca:	5792                	lw	a5,36(sp)
 2cc:	973e                	add	a4,a4,a5
 2ce:	002007b7          	lui	a5,0x200
 2d2:	0791                	addi	a5,a5,4 # 200004 <_stack+0x178004>
 2d4:	97ba                	add	a5,a5,a4
    volatile uint32_t *claim_addr = (volatile uint32_t *)(base +
 2d6:	cc3e                	sw	a5,24(sp)
    *claim_addr = irq;
 2d8:	47e2                	lw	a5,24(sp)
 2da:	4772                	lw	a4,28(sp)
 2dc:	c398                	sw	a4,0(a5)
}
 2de:	0001                	nop
 *
 */
ATTR_ALWAYS_INLINE static inline void intc_m_complete_swi(void)
{
    __plic_complete_irq(HPM_PLICSW_BASE, HPM_PLIC_TARGET_M_MODE, PLICSWI);
}
 2e0:	0001                	nop
        intc_m_complete_swi();
 2e2:	a081                	j	322 <irq_handler_trap+0x11a>
    } else if (!(mcause & CSR_MCAUSE_INTERRUPT_MASK) && ((mcause & CSR_MCAUSE_EXCEPTION_CODE_MASK) == MCAUSE_ECALL_FROM_MACHINE_MODE)) {
 2e4:	4796                	lw	a5,68(sp)
 2e6:	0207c763          	bltz	a5,314 <irq_handler_trap+0x10c>
 2ea:	4796                	lw	a5,68(sp)
 2ec:	07d2                	slli	a5,a5,0x14
 2ee:	0147d713          	srli	a4,a5,0x14
 2f2:	47ad                	li	a5,11
 2f4:	02f71063          	bne	a4,a5,314 <irq_handler_trap+0x10c>
        /* Machine Syscal call */
        __asm volatile(
 2f8:	800067b7          	lui	a5,0x80006
 2fc:	b3a78793          	addi	a5,a5,-1222 # 80005b3a <syscall_handler>
 300:	8736                	mv	a4,a3
 302:	86b2                	mv	a3,a2
 304:	862e                	mv	a2,a1
 306:	85aa                	mv	a1,a0
 308:	8546                	mv	a0,a7
 30a:	9782                	jalr	a5
        "mv a0, a7\n"
        #endif
        "jalr %0\n"
        : : "r"(syscall_handler) : "a4"
        );
        mepc += 4;
 30c:	47b6                	lw	a5,76(sp)
 30e:	0791                	addi	a5,a5,4
 310:	c6be                	sw	a5,76(sp)
 312:	a801                	j	322 <irq_handler_trap+0x11a>
    } else {
        mepc = exception_handler(mcause, mepc);
 314:	45b6                	lw	a1,76(sp)
 316:	4516                	lw	a0,68(sp)
 318:	80006097          	auipc	ra,0x80006
 31c:	834080e7          	jalr	-1996(ra) # 80005b4c <exception_handler>
 320:	c6aa                	sw	a0,76(sp)
    }

    /* Restore CSR */
    write_csr(CSR_MSTATUS, mstatus);
 322:	57e2                	lw	a5,56(sp)
 324:	30079073          	csrw	mstatus,a5
    write_csr(CSR_MEPC, mepc);
 328:	47b6                	lw	a5,76(sp)
 32a:	34179073          	csrw	mepc,a5
    write_csr(CSR_UCODE, ucode);
#endif
#ifdef __riscv_flen
    write_fcsr(fcsr);
#endif
    write_csr(CSR_MCCTLDATA, mcctldata);
 32e:	57a2                	lw	a5,40(sp)
 330:	7cd79073          	csrw	0x7cd,a5
    write_csr(CSR_MCCTLBEGINADDR, mcctlbeginaddr);
 334:	57c2                	lw	a5,48(sp)
 336:	7cb79073          	csrw	0x7cb,a5
}
 33a:	0001                	nop
 33c:	40ba                	lw	ra,140(sp)
 33e:	42aa                	lw	t0,136(sp)
 340:	431a                	lw	t1,132(sp)
 342:	438a                	lw	t2,128(sp)
 344:	5576                	lw	a0,124(sp)
 346:	55e6                	lw	a1,120(sp)
 348:	5656                	lw	a2,116(sp)
 34a:	56c6                	lw	a3,112(sp)
 34c:	5736                	lw	a4,108(sp)
 34e:	57a6                	lw	a5,104(sp)
 350:	5816                	lw	a6,100(sp)
 352:	5886                	lw	a7,96(sp)
 354:	4e76                	lw	t3,92(sp)
 356:	4ee6                	lw	t4,88(sp)
 358:	4f56                	lw	t5,84(sp)
 35a:	4fc6                	lw	t6,80(sp)
 35c:	6149                	addi	sp,sp,144
 35e:	30200073          	mret
	...

00000364 <board_timer_isr>:

#if !defined(NO_BOARD_TIMER_SUPPORT) || !NO_BOARD_TIMER_SUPPORT
static board_timer_cb timer_cb;
SDK_DECLARE_EXT_ISR_M(BOARD_CALLBACK_TIMER_IRQ, board_timer_isr)
void board_timer_isr(void)
{
 364:	1141                	addi	sp,sp,-16
 366:	c606                	sw	ra,12(sp)
    if (gptmr_check_status(BOARD_CALLBACK_TIMER, GPTMR_CH_RLD_STAT_MASK(BOARD_CALLBACK_TIMER_CH))) {
 368:	45c1                	li	a1,16
 36a:	f301c537          	lui	a0,0xf301c
 36e:	80006097          	auipc	ra,0x80006
 372:	c64080e7          	jalr	-924(ra) # 80005fd2 <gptmr_check_status>
 376:	87aa                	mv	a5,a0
 378:	cb99                	beqz	a5,38e <board_timer_isr+0x2a>
        gptmr_clear_status(BOARD_CALLBACK_TIMER, GPTMR_CH_RLD_STAT_MASK(BOARD_CALLBACK_TIMER_CH));
 37a:	45c1                	li	a1,16
 37c:	f301c537          	lui	a0,0xf301c
 380:	80006097          	auipc	ra,0x80006
 384:	c76080e7          	jalr	-906(ra) # 80005ff6 <gptmr_clear_status>
        timer_cb();
 388:	b001a783          	lw	a5,-1280(gp) # 1080300 <timer_cb>
 38c:	9782                	jalr	a5
    }
}
 38e:	0001                	nop
 390:	40b2                	lw	ra,12(sp)
 392:	0141                	addi	sp,sp,16
 394:	8082                	ret
 396:	0001                	nop

00000398 <default_isr_67>:
SDK_DECLARE_EXT_ISR_M(BOARD_CALLBACK_TIMER_IRQ, board_timer_isr)
 398:	711d                	addi	sp,sp,-96
 39a:	c006                	sw	ra,0(sp)
 39c:	c216                	sw	t0,4(sp)
 39e:	c41a                	sw	t1,8(sp)
 3a0:	c61e                	sw	t2,12(sp)
 3a2:	c826                	sw	s1,16(sp)
 3a4:	ca2a                	sw	a0,20(sp)
 3a6:	cc2e                	sw	a1,24(sp)
 3a8:	ce32                	sw	a2,28(sp)
 3aa:	d036                	sw	a3,32(sp)
 3ac:	d23a                	sw	a4,36(sp)
 3ae:	d43e                	sw	a5,40(sp)
 3b0:	d642                	sw	a6,44(sp)
 3b2:	d846                	sw	a7,48(sp)
 3b4:	da4a                	sw	s2,52(sp)
 3b6:	dc4e                	sw	s3,56(sp)
 3b8:	de52                	sw	s4,60(sp)
 3ba:	c0d6                	sw	s5,64(sp)
 3bc:	c2da                	sw	s6,68(sp)
 3be:	c4f2                	sw	t3,72(sp)
 3c0:	c6f6                	sw	t4,76(sp)
 3c2:	c8fa                	sw	t5,80(sp)
 3c4:	cafe                	sw	t6,84(sp)
 3c6:	34102973          	csrr	s2,mepc
 3ca:	300029f3          	csrr	s3,mstatus
 3ce:	7cb02af3          	csrr	s5,0x7cb
 3d2:	7cd02b73          	csrr	s6,0x7cd
 3d6:	30046073          	csrsi	mstatus,8
 3da:	00000317          	auipc	t1,0x0
 3de:	f8a30313          	addi	t1,t1,-118 # 364 <board_timer_isr>
 3e2:	9302                	jalr	t1
 3e4:	30047073          	csrci	mstatus,8
 3e8:	e4200737          	lui	a4,0xe4200
 3ec:	04300693          	li	a3,67
 3f0:	c354                	sw	a3,4(a4)
 3f2:	30099073          	csrw	mstatus,s3
 3f6:	34191073          	csrw	mepc,s2
 3fa:	7cdb1073          	csrw	0x7cd,s6
 3fe:	7cba9073          	csrw	0x7cb,s5
 402:	4082                	lw	ra,0(sp)
 404:	4292                	lw	t0,4(sp)
 406:	4322                	lw	t1,8(sp)
 408:	43b2                	lw	t2,12(sp)
 40a:	44c2                	lw	s1,16(sp)
 40c:	4552                	lw	a0,20(sp)
 40e:	45e2                	lw	a1,24(sp)
 410:	4672                	lw	a2,28(sp)
 412:	5682                	lw	a3,32(sp)
 414:	5712                	lw	a4,36(sp)
 416:	57a2                	lw	a5,40(sp)
 418:	5832                	lw	a6,44(sp)
 41a:	58c2                	lw	a7,48(sp)
 41c:	5952                	lw	s2,52(sp)
 41e:	59e2                	lw	s3,56(sp)
 420:	5a72                	lw	s4,60(sp)
 422:	4a86                	lw	s5,64(sp)
 424:	4b16                	lw	s6,68(sp)
 426:	4e26                	lw	t3,72(sp)
 428:	4eb6                	lw	t4,76(sp)
 42a:	4f46                	lw	t5,80(sp)
 42c:	4fd6                	lw	t6,84(sp)
 42e:	6125                	addi	sp,sp,96
 430:	0cc0000f          	fence	io,io
 434:	30200073          	mret

Lohkon .text disassemblointi:

80003498 <__udivdi3>:
80003498:	8732                	mv	a4,a2
8000349a:	88b6                	mv	a7,a3
8000349c:	882a                	mv	a6,a0
8000349e:	832e                	mv	t1,a1
800034a0:	1c069363          	bnez	a3,80003666 <__udivdi3+0x1ce>
800034a4:	8000e7b7          	lui	a5,0x8000e
800034a8:	8a878793          	addi	a5,a5,-1880 # 8000d8a8 <__clz_tab>
800034ac:	0ac5fb63          	bgeu	a1,a2,80003562 <__udivdi3+0xca>
800034b0:	66c1                	lui	a3,0x10
800034b2:	08d67e63          	bgeu	a2,a3,8000354e <__udivdi3+0xb6>
800034b6:	10063693          	sltiu	a3,a2,256
800034ba:	0016b693          	seqz	a3,a3
800034be:	068e                	slli	a3,a3,0x3
800034c0:	00d65e33          	srl	t3,a2,a3
800034c4:	97f2                	add	a5,a5,t3
800034c6:	0007c783          	lbu	a5,0(a5)
800034ca:	97b6                	add	a5,a5,a3
800034cc:	02000693          	li	a3,32
800034d0:	00d78d63          	beq	a5,a3,800034ea <__udivdi3+0x52>
800034d4:	8e9d                	sub	a3,a3,a5
800034d6:	00d59333          	sll	t1,a1,a3
800034da:	00f557b3          	srl	a5,a0,a5
800034de:	00d61733          	sll	a4,a2,a3
800034e2:	0067e333          	or	t1,a5,t1
800034e6:	00d51833          	sll	a6,a0,a3
800034ea:	01075513          	srli	a0,a4,0x10
800034ee:	02a357b3          	divu	a5,t1,a0
800034f2:	01071593          	slli	a1,a4,0x10
800034f6:	81c1                	srli	a1,a1,0x10
800034f8:	01085693          	srli	a3,a6,0x10
800034fc:	02a37333          	remu	t1,t1,a0
80003500:	02f58633          	mul	a2,a1,a5
80003504:	0342                	slli	t1,t1,0x10
80003506:	0066e6b3          	or	a3,a3,t1
8000350a:	00c6f863          	bgeu	a3,a2,8000351a <__udivdi3+0x82>
8000350e:	96ba                	add	a3,a3,a4
80003510:	00c6f463          	bgeu	a3,a2,80003518 <__udivdi3+0x80>
80003514:	04e6f463          	bgeu	a3,a4,8000355c <__udivdi3+0xc4>
80003518:	17fd                	addi	a5,a5,-1
8000351a:	8e91                	sub	a3,a3,a2
8000351c:	02a6d633          	divu	a2,a3,a0
80003520:	0842                	slli	a6,a6,0x10
80003522:	01085813          	srli	a6,a6,0x10
80003526:	02a6f6b3          	remu	a3,a3,a0
8000352a:	02c585b3          	mul	a1,a1,a2
8000352e:	06c2                	slli	a3,a3,0x10
80003530:	00d86833          	or	a6,a6,a3
80003534:	00b87863          	bgeu	a6,a1,80003544 <__udivdi3+0xac>
80003538:	983a                	add	a6,a6,a4
8000353a:	00b87463          	bgeu	a6,a1,80003542 <__udivdi3+0xaa>
8000353e:	12e87263          	bgeu	a6,a4,80003662 <__udivdi3+0x1ca>
80003542:	167d                	addi	a2,a2,-1
80003544:	07c2                	slli	a5,a5,0x10
80003546:	8fd1                	or	a5,a5,a2
80003548:	853e                	mv	a0,a5
8000354a:	85c6                	mv	a1,a7
8000354c:	8082                	ret
8000354e:	01000e37          	lui	t3,0x1000
80003552:	46e1                	li	a3,24
80003554:	f7c676e3          	bgeu	a2,t3,800034c0 <__udivdi3+0x28>
80003558:	46c1                	li	a3,16
8000355a:	b79d                	j	800034c0 <__udivdi3+0x28>
8000355c:	17f9                	addi	a5,a5,-2
8000355e:	96ba                	add	a3,a3,a4
80003560:	bf6d                	j	8000351a <__udivdi3+0x82>
80003562:	4681                	li	a3,0
80003564:	ca09                	beqz	a2,80003576 <__udivdi3+0xde>
80003566:	66c1                	lui	a3,0x10
80003568:	04d67e63          	bgeu	a2,a3,800035c4 <__udivdi3+0x12c>
8000356c:	10063693          	sltiu	a3,a2,256
80003570:	0016b693          	seqz	a3,a3
80003574:	068e                	slli	a3,a3,0x3
80003576:	00d658b3          	srl	a7,a2,a3
8000357a:	97c6                	add	a5,a5,a7
8000357c:	0007c783          	lbu	a5,0(a5)
80003580:	97b6                	add	a5,a5,a3
80003582:	02000693          	li	a3,32
80003586:	04d79663          	bne	a5,a3,800035d2 <__udivdi3+0x13a>
8000358a:	40c58633          	sub	a2,a1,a2
8000358e:	4885                	li	a7,1
80003590:	01075513          	srli	a0,a4,0x10
80003594:	02a657b3          	divu	a5,a2,a0
80003598:	01071593          	slli	a1,a4,0x10
8000359c:	81c1                	srli	a1,a1,0x10
8000359e:	01085693          	srli	a3,a6,0x10
800035a2:	02a67633          	remu	a2,a2,a0
800035a6:	02f58333          	mul	t1,a1,a5
800035aa:	0642                	slli	a2,a2,0x10
800035ac:	8ed1                	or	a3,a3,a2
800035ae:	0066f863          	bgeu	a3,t1,800035be <__udivdi3+0x126>
800035b2:	96ba                	add	a3,a3,a4
800035b4:	0066f463          	bgeu	a3,t1,800035bc <__udivdi3+0x124>
800035b8:	0ae6f263          	bgeu	a3,a4,8000365c <__udivdi3+0x1c4>
800035bc:	17fd                	addi	a5,a5,-1
800035be:	406686b3          	sub	a3,a3,t1
800035c2:	bfa9                	j	8000351c <__udivdi3+0x84>
800035c4:	010008b7          	lui	a7,0x1000
800035c8:	46e1                	li	a3,24
800035ca:	fb1676e3          	bgeu	a2,a7,80003576 <__udivdi3+0xde>
800035ce:	46c1                	li	a3,16
800035d0:	b75d                	j	80003576 <__udivdi3+0xde>
800035d2:	40f68833          	sub	a6,a3,a5
800035d6:	01061733          	sll	a4,a2,a6
800035da:	00f5d6b3          	srl	a3,a1,a5
800035de:	010595b3          	sll	a1,a1,a6
800035e2:	00f557b3          	srl	a5,a0,a5
800035e6:	01051833          	sll	a6,a0,a6
800035ea:	01075513          	srli	a0,a4,0x10
800035ee:	02a6d8b3          	divu	a7,a3,a0
800035f2:	01071613          	slli	a2,a4,0x10
800035f6:	8241                	srli	a2,a2,0x10
800035f8:	8fcd                	or	a5,a5,a1
800035fa:	02a6f6b3          	remu	a3,a3,a0
800035fe:	03160333          	mul	t1,a2,a7
80003602:	01069593          	slli	a1,a3,0x10
80003606:	0107d693          	srli	a3,a5,0x10
8000360a:	8ecd                	or	a3,a3,a1
8000360c:	0066f863          	bgeu	a3,t1,8000361c <__udivdi3+0x184>
80003610:	96ba                	add	a3,a3,a4
80003612:	0066f463          	bgeu	a3,t1,8000361a <__udivdi3+0x182>
80003616:	02e6fd63          	bgeu	a3,a4,80003650 <__udivdi3+0x1b8>
8000361a:	18fd                	addi	a7,a7,-1 # ffffff <_flash_size+0x7fffff>
8000361c:	406686b3          	sub	a3,a3,t1
80003620:	02a6d5b3          	divu	a1,a3,a0
80003624:	07c2                	slli	a5,a5,0x10
80003626:	83c1                	srli	a5,a5,0x10
80003628:	02a6f6b3          	remu	a3,a3,a0
8000362c:	02b60633          	mul	a2,a2,a1
80003630:	06c2                	slli	a3,a3,0x10
80003632:	8fd5                	or	a5,a5,a3
80003634:	00c7f863          	bgeu	a5,a2,80003644 <__udivdi3+0x1ac>
80003638:	97ba                	add	a5,a5,a4
8000363a:	00c7f463          	bgeu	a5,a2,80003642 <__udivdi3+0x1aa>
8000363e:	00e7fc63          	bgeu	a5,a4,80003656 <__udivdi3+0x1be>
80003642:	15fd                	addi	a1,a1,-1
80003644:	08c2                	slli	a7,a7,0x10
80003646:	40c78633          	sub	a2,a5,a2
8000364a:	00b8e8b3          	or	a7,a7,a1
8000364e:	b789                	j	80003590 <__udivdi3+0xf8>
80003650:	18f9                	addi	a7,a7,-2
80003652:	96ba                	add	a3,a3,a4
80003654:	b7e1                	j	8000361c <__udivdi3+0x184>
80003656:	15f9                	addi	a1,a1,-2
80003658:	97ba                	add	a5,a5,a4
8000365a:	b7ed                	j	80003644 <__udivdi3+0x1ac>
8000365c:	17f9                	addi	a5,a5,-2
8000365e:	96ba                	add	a3,a3,a4
80003660:	bfb9                	j	800035be <__udivdi3+0x126>
80003662:	1679                	addi	a2,a2,-2
80003664:	b5c5                	j	80003544 <__udivdi3+0xac>
80003666:	12d5eb63          	bltu	a1,a3,8000379c <__udivdi3+0x304>
8000366a:	67c1                	lui	a5,0x10
8000366c:	02f6fe63          	bgeu	a3,a5,800036a8 <__udivdi3+0x210>
80003670:	1006b793          	sltiu	a5,a3,256
80003674:	0017b793          	seqz	a5,a5
80003678:	078e                	slli	a5,a5,0x3
8000367a:	8000e737          	lui	a4,0x8000e
8000367e:	00f6d833          	srl	a6,a3,a5
80003682:	8a870713          	addi	a4,a4,-1880 # 8000d8a8 <__clz_tab>
80003686:	9742                	add	a4,a4,a6
80003688:	00074703          	lbu	a4,0(a4)
8000368c:	02000813          	li	a6,32
80003690:	973e                	add	a4,a4,a5
80003692:	03071263          	bne	a4,a6,800036b6 <__udivdi3+0x21e>
80003696:	00c537b3          	sltu	a5,a0,a2
8000369a:	0017b793          	seqz	a5,a5
8000369e:	00b6b6b3          	sltu	a3,a3,a1
800036a2:	8fd5                	or	a5,a5,a3
800036a4:	4881                	li	a7,0
800036a6:	b54d                	j	80003548 <__udivdi3+0xb0>
800036a8:	01000737          	lui	a4,0x1000
800036ac:	47e1                	li	a5,24
800036ae:	fce6f6e3          	bgeu	a3,a4,8000367a <__udivdi3+0x1e2>
800036b2:	47c1                	li	a5,16
800036b4:	b7d9                	j	8000367a <__udivdi3+0x1e2>
800036b6:	40e80833          	sub	a6,a6,a4
800036ba:	00e658b3          	srl	a7,a2,a4
800036be:	010696b3          	sll	a3,a3,a6
800036c2:	00d8e8b3          	or	a7,a7,a3
800036c6:	0108de13          	srli	t3,a7,0x10
800036ca:	00e5d6b3          	srl	a3,a1,a4
800036ce:	03c6d7b3          	divu	a5,a3,t3
800036d2:	01089313          	slli	t1,a7,0x10
800036d6:	01035313          	srli	t1,t1,0x10
800036da:	010595b3          	sll	a1,a1,a6
800036de:	00e55733          	srl	a4,a0,a4
800036e2:	8f4d                	or	a4,a4,a1
800036e4:	01061633          	sll	a2,a2,a6
800036e8:	03c6f6b3          	remu	a3,a3,t3
800036ec:	02f30eb3          	mul	t4,t1,a5
800036f0:	01069593          	slli	a1,a3,0x10
800036f4:	01075693          	srli	a3,a4,0x10
800036f8:	8ecd                	or	a3,a3,a1
800036fa:	01d6f863          	bgeu	a3,t4,8000370a <__udivdi3+0x272>
800036fe:	96c6                	add	a3,a3,a7
80003700:	01d6f463          	bgeu	a3,t4,80003708 <__udivdi3+0x270>
80003704:	0916f663          	bgeu	a3,a7,80003790 <__udivdi3+0x2f8>
80003708:	17fd                	addi	a5,a5,-1 # ffff <__fw_size__+0x4e3f>
8000370a:	41d686b3          	sub	a3,a3,t4
8000370e:	03c6d5b3          	divu	a1,a3,t3
80003712:	0742                	slli	a4,a4,0x10
80003714:	8341                	srli	a4,a4,0x10
80003716:	03c6f6b3          	remu	a3,a3,t3
8000371a:	02b30333          	mul	t1,t1,a1
8000371e:	06c2                	slli	a3,a3,0x10
80003720:	8f55                	or	a4,a4,a3
80003722:	00677863          	bgeu	a4,t1,80003732 <__udivdi3+0x29a>
80003726:	9746                	add	a4,a4,a7
80003728:	00677463          	bgeu	a4,t1,80003730 <__udivdi3+0x298>
8000372c:	07177563          	bgeu	a4,a7,80003796 <__udivdi3+0x2fe>
80003730:	15fd                	addi	a1,a1,-1
80003732:	07c2                	slli	a5,a5,0x10
80003734:	8fcd                	or	a5,a5,a1
80003736:	40670733          	sub	a4,a4,t1
8000373a:	05c2                	slli	a1,a1,0x10
8000373c:	01061313          	slli	t1,a2,0x10
80003740:	81c1                	srli	a1,a1,0x10
80003742:	0107d893          	srli	a7,a5,0x10
80003746:	01035313          	srli	t1,t1,0x10
8000374a:	8241                	srli	a2,a2,0x10
8000374c:	02658e33          	mul	t3,a1,t1
80003750:	02688333          	mul	t1,a7,t1
80003754:	010e5693          	srli	a3,t3,0x10
80003758:	02c585b3          	mul	a1,a1,a2
8000375c:	02c888b3          	mul	a7,a7,a2
80003760:	959a                	add	a1,a1,t1
80003762:	96ae                	add	a3,a3,a1
80003764:	0066f463          	bgeu	a3,t1,8000376c <__udivdi3+0x2d4>
80003768:	6641                	lui	a2,0x10
8000376a:	98b2                	add	a7,a7,a2
8000376c:	0106d613          	srli	a2,a3,0x10
80003770:	9646                	add	a2,a2,a7
80003772:	00c76d63          	bltu	a4,a2,8000378c <__udivdi3+0x2f4>
80003776:	0e42                	slli	t3,t3,0x10
80003778:	06c2                	slli	a3,a3,0x10
8000377a:	010e5e13          	srli	t3,t3,0x10
8000377e:	01051533          	sll	a0,a0,a6
80003782:	96f2                	add	a3,a3,t3
80003784:	f2d570e3          	bgeu	a0,a3,800036a4 <__udivdi3+0x20c>
80003788:	f0c71ee3          	bne	a4,a2,800036a4 <__udivdi3+0x20c>
8000378c:	17fd                	addi	a5,a5,-1
8000378e:	bf19                	j	800036a4 <__udivdi3+0x20c>
80003790:	17f9                	addi	a5,a5,-2
80003792:	96c6                	add	a3,a3,a7
80003794:	bf9d                	j	8000370a <__udivdi3+0x272>
80003796:	15f9                	addi	a1,a1,-2
80003798:	9746                	add	a4,a4,a7
8000379a:	bf61                	j	80003732 <__udivdi3+0x29a>
8000379c:	4881                	li	a7,0
8000379e:	4781                	li	a5,0
800037a0:	b365                	j	80003548 <__udivdi3+0xb0>

800037a2 <__adddf3>:
800037a2:	00c59793          	slli	a5,a1,0xc
800037a6:	1101                	addi	sp,sp,-32
800037a8:	01d55713          	srli	a4,a0,0x1d
800037ac:	83a5                	srli	a5,a5,0x9
800037ae:	0146d893          	srli	a7,a3,0x14
800037b2:	cc22                	sw	s0,24(sp)
800037b4:	8fd9                	or	a5,a5,a4
800037b6:	0145d413          	srli	s0,a1,0x14
800037ba:	00c69713          	slli	a4,a3,0xc
800037be:	ca26                	sw	s1,20(sp)
800037c0:	7ff47413          	andi	s0,s0,2047
800037c4:	01f5d493          	srli	s1,a1,0x1f
800037c8:	7ff8f893          	andi	a7,a7,2047
800037cc:	01d65593          	srli	a1,a2,0x1d
800037d0:	8325                	srli	a4,a4,0x9
800037d2:	ce06                	sw	ra,28(sp)
800037d4:	c84a                	sw	s2,16(sp)
800037d6:	c64e                	sw	s3,12(sp)
800037d8:	82fd                	srli	a3,a3,0x1f
800037da:	050e                	slli	a0,a0,0x3
800037dc:	8f4d                	or	a4,a4,a1
800037de:	060e                	slli	a2,a2,0x3
800037e0:	41140833          	sub	a6,s0,a7
800037e4:	7ff00313          	li	t1,2047
800037e8:	24d49f63          	bne	s1,a3,80003a46 <__adddf3+0x2a4>
800037ec:	11005b63          	blez	a6,80003902 <__adddf3+0x160>
800037f0:	06089663          	bnez	a7,8000385c <__adddf3+0xba>
800037f4:	00c766b3          	or	a3,a4,a2
800037f8:	ce99                	beqz	a3,80003816 <__adddf3+0x74>
800037fa:	fff40813          	addi	a6,s0,-1
800037fe:	00081a63          	bnez	a6,80003812 <__adddf3+0x70>
80003802:	962a                	add	a2,a2,a0
80003804:	97ba                	add	a5,a5,a4
80003806:	00a63533          	sltu	a0,a2,a0
8000380a:	00a78733          	add	a4,a5,a0
8000380e:	4405                	li	s0,1
80003810:	a851                	j	800038a4 <__adddf3+0x102>
80003812:	04641a63          	bne	s0,t1,80003866 <__adddf3+0xc4>
80003816:	01d79713          	slli	a4,a5,0x1d
8000381a:	810d                	srli	a0,a0,0x3
8000381c:	7ff00693          	li	a3,2047
80003820:	8f49                	or	a4,a4,a0
80003822:	838d                	srli	a5,a5,0x3
80003824:	00d41963          	bne	s0,a3,80003836 <__adddf3+0x94>
80003828:	8f5d                	or	a4,a4,a5
8000382a:	4781                	li	a5,0
8000382c:	c709                	beqz	a4,80003836 <__adddf3+0x94>
8000382e:	000807b7          	lui	a5,0x80
80003832:	4701                	li	a4,0
80003834:	4481                	li	s1,0
80003836:	7ff47413          	andi	s0,s0,2047
8000383a:	07b2                	slli	a5,a5,0xc
8000383c:	83b1                	srli	a5,a5,0xc
8000383e:	0452                	slli	s0,s0,0x14
80003840:	01f49593          	slli	a1,s1,0x1f
80003844:	8c5d                	or	s0,s0,a5
80003846:	40f2                	lw	ra,28(sp)
80003848:	00b467b3          	or	a5,s0,a1
8000384c:	4462                	lw	s0,24(sp)
8000384e:	44d2                	lw	s1,20(sp)
80003850:	4942                	lw	s2,16(sp)
80003852:	49b2                	lw	s3,12(sp)
80003854:	853a                	mv	a0,a4
80003856:	85be                	mv	a1,a5
80003858:	6105                	addi	sp,sp,32
8000385a:	8082                	ret
8000385c:	20640c63          	beq	s0,t1,80003a74 <__adddf3+0x2d2>
80003860:	008006b7          	lui	a3,0x800
80003864:	8f55                	or	a4,a4,a3
80003866:	03800693          	li	a3,56
8000386a:	0906c763          	blt	a3,a6,800038f8 <__adddf3+0x156>
8000386e:	46fd                	li	a3,31
80003870:	02000893          	li	a7,32
80003874:	0506cf63          	blt	a3,a6,800038d2 <__adddf3+0x130>
80003878:	410888b3          	sub	a7,a7,a6
8000387c:	011716b3          	sll	a3,a4,a7
80003880:	010655b3          	srl	a1,a2,a6
80003884:	011618b3          	sll	a7,a2,a7
80003888:	8ecd                	or	a3,a3,a1
8000388a:	011038b3          	snez	a7,a7
8000388e:	0116e6b3          	or	a3,a3,a7
80003892:	01075833          	srl	a6,a4,a6
80003896:	00a68633          	add	a2,a3,a0
8000389a:	983e                	add	a6,a6,a5
8000389c:	00d636b3          	sltu	a3,a2,a3
800038a0:	00d80733          	add	a4,a6,a3
800038a4:	00871793          	slli	a5,a4,0x8
800038a8:	1607db63          	bgez	a5,80003a1e <__adddf3+0x27c>
800038ac:	0405                	addi	s0,s0,1
800038ae:	7ff00793          	li	a5,2047
800038b2:	48f40a63          	beq	s0,a5,80003d46 <__adddf3+0x5a4>
800038b6:	ff8007b7          	lui	a5,0xff800
800038ba:	17fd                	addi	a5,a5,-1 # ff7fffff <__fast_load_addr__+0x7f7f1e3f>
800038bc:	8ff9                	and	a5,a5,a4
800038be:	00165713          	srli	a4,a2,0x1
800038c2:	8a05                	andi	a2,a2,1
800038c4:	8f51                	or	a4,a4,a2
800038c6:	01f79613          	slli	a2,a5,0x1f
800038ca:	8e59                	or	a2,a2,a4
800038cc:	0017d713          	srli	a4,a5,0x1
800038d0:	a2b9                	j	80003a1e <__adddf3+0x27c>
800038d2:	fe080693          	addi	a3,a6,-32
800038d6:	00d756b3          	srl	a3,a4,a3
800038da:	4581                	li	a1,0
800038dc:	01180863          	beq	a6,a7,800038ec <__adddf3+0x14a>
800038e0:	04000593          	li	a1,64
800038e4:	410585b3          	sub	a1,a1,a6
800038e8:	00b715b3          	sll	a1,a4,a1
800038ec:	8dd1                	or	a1,a1,a2
800038ee:	00b035b3          	snez	a1,a1
800038f2:	8ecd                	or	a3,a3,a1
800038f4:	4801                	li	a6,0
800038f6:	b745                	j	80003896 <__adddf3+0xf4>
800038f8:	00c766b3          	or	a3,a4,a2
800038fc:	00d036b3          	snez	a3,a3
80003900:	bfd5                	j	800038f4 <__adddf3+0x152>
80003902:	0a080463          	beqz	a6,800039aa <__adddf3+0x208>
80003906:	408886b3          	sub	a3,a7,s0
8000390a:	ec39                	bnez	s0,80003968 <__adddf3+0x1c6>
8000390c:	00a7e5b3          	or	a1,a5,a0
80003910:	e589                	bnez	a1,8000391a <__adddf3+0x178>
80003912:	87ba                	mv	a5,a4
80003914:	8532                	mv	a0,a2
80003916:	8436                	mv	s0,a3
80003918:	bdfd                	j	80003816 <__adddf3+0x74>
8000391a:	fff68593          	addi	a1,a3,-1 # 7fffff <_stack+0x777fff>
8000391e:	ee0582e3          	beqz	a1,80003802 <__adddf3+0x60>
80003922:	fe6688e3          	beq	a3,t1,80003912 <__adddf3+0x170>
80003926:	03800693          	li	a3,56
8000392a:	06b6cb63          	blt	a3,a1,800039a0 <__adddf3+0x1fe>
8000392e:	46fd                	li	a3,31
80003930:	02000313          	li	t1,32
80003934:	04b6c163          	blt	a3,a1,80003976 <__adddf3+0x1d4>
80003938:	40b30333          	sub	t1,t1,a1
8000393c:	006796b3          	sll	a3,a5,t1
80003940:	00b55833          	srl	a6,a0,a1
80003944:	00651333          	sll	t1,a0,t1
80003948:	0106e6b3          	or	a3,a3,a6
8000394c:	00603333          	snez	t1,t1
80003950:	0066e6b3          	or	a3,a3,t1
80003954:	00b7d5b3          	srl	a1,a5,a1
80003958:	9636                	add	a2,a2,a3
8000395a:	95ba                	add	a1,a1,a4
8000395c:	00d636b3          	sltu	a3,a2,a3
80003960:	00d58733          	add	a4,a1,a3
80003964:	8446                	mv	s0,a7
80003966:	bf3d                	j	800038a4 <__adddf3+0x102>
80003968:	3e688763          	beq	a7,t1,80003d56 <__adddf3+0x5b4>
8000396c:	008005b7          	lui	a1,0x800
80003970:	8fcd                	or	a5,a5,a1
80003972:	85b6                	mv	a1,a3
80003974:	bf4d                	j	80003926 <__adddf3+0x184>
80003976:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_stack+0x777fe0>
8000397a:	00d7d6b3          	srl	a3,a5,a3
8000397e:	4801                	li	a6,0
80003980:	00658863          	beq	a1,t1,80003990 <__adddf3+0x1ee>
80003984:	04000813          	li	a6,64
80003988:	40b80833          	sub	a6,a6,a1
8000398c:	01079833          	sll	a6,a5,a6
80003990:	00a86833          	or	a6,a6,a0
80003994:	01003833          	snez	a6,a6
80003998:	0106e6b3          	or	a3,a3,a6
8000399c:	4581                	li	a1,0
8000399e:	bf6d                	j	80003958 <__adddf3+0x1b6>
800039a0:	00a7e6b3          	or	a3,a5,a0
800039a4:	00d036b3          	snez	a3,a3
800039a8:	bfd5                	j	8000399c <__adddf3+0x1fa>
800039aa:	00140693          	addi	a3,s0,1
800039ae:	7fe6f593          	andi	a1,a3,2046
800039b2:	e9a1                	bnez	a1,80003a02 <__adddf3+0x260>
800039b4:	00a7e6b3          	or	a3,a5,a0
800039b8:	e815                	bnez	s0,800039ec <__adddf3+0x24a>
800039ba:	22068863          	beqz	a3,80003bea <__adddf3+0x448>
800039be:	00c766b3          	or	a3,a4,a2
800039c2:	36068363          	beqz	a3,80003d28 <__adddf3+0x586>
800039c6:	00c506b3          	add	a3,a0,a2
800039ca:	97ba                	add	a5,a5,a4
800039cc:	00a6b533          	sltu	a0,a3,a0
800039d0:	00a78733          	add	a4,a5,a0
800039d4:	00871793          	slli	a5,a4,0x8
800039d8:	8636                	mv	a2,a3
800039da:	2007d863          	bgez	a5,80003bea <__adddf3+0x448>
800039de:	ff8007b7          	lui	a5,0xff800
800039e2:	17fd                	addi	a5,a5,-1 # ff7fffff <__fast_load_addr__+0x7f7f1e3f>
800039e4:	8ff9                	and	a5,a5,a4
800039e6:	8536                	mv	a0,a3
800039e8:	4405                	li	s0,1
800039ea:	b535                	j	80003816 <__adddf3+0x74>
800039ec:	36068563          	beqz	a3,80003d56 <__adddf3+0x5b4>
800039f0:	8f51                	or	a4,a4,a2
800039f2:	841a                	mv	s0,t1
800039f4:	e20701e3          	beqz	a4,80003816 <__adddf3+0x74>
800039f8:	4481                	li	s1,0
800039fa:	004007b7          	lui	a5,0x400
800039fe:	4501                	li	a0,0
80003a00:	bd19                	j	80003816 <__adddf3+0x74>
80003a02:	34668163          	beq	a3,t1,80003d44 <__adddf3+0x5a2>
80003a06:	962a                	add	a2,a2,a0
80003a08:	97ba                	add	a5,a5,a4
80003a0a:	00a63533          	sltu	a0,a2,a0
80003a0e:	97aa                	add	a5,a5,a0
80003a10:	01f79713          	slli	a4,a5,0x1f
80003a14:	8205                	srli	a2,a2,0x1
80003a16:	8e59                	or	a2,a2,a4
80003a18:	8436                	mv	s0,a3
80003a1a:	0017d713          	srli	a4,a5,0x1
80003a1e:	00767793          	andi	a5,a2,7
80003a22:	30079663          	bnez	a5,80003d2e <__adddf3+0x58c>
80003a26:	87ba                	mv	a5,a4
80003a28:	8532                	mv	a0,a2
80003a2a:	00879713          	slli	a4,a5,0x8
80003a2e:	de0754e3          	bgez	a4,80003816 <__adddf3+0x74>
80003a32:	0405                	addi	s0,s0,1
80003a34:	7ff00713          	li	a4,2047
80003a38:	30e40763          	beq	s0,a4,80003d46 <__adddf3+0x5a4>
80003a3c:	ff800737          	lui	a4,0xff800
80003a40:	177d                	addi	a4,a4,-1 # ff7fffff <__fast_load_addr__+0x7f7f1e3f>
80003a42:	8ff9                	and	a5,a5,a4
80003a44:	bbc9                	j	80003816 <__adddf3+0x74>
80003a46:	0d005163          	blez	a6,80003b08 <__adddf3+0x366>
80003a4a:	02089863          	bnez	a7,80003a7a <__adddf3+0x2d8>
80003a4e:	00c766b3          	or	a3,a4,a2
80003a52:	dc0682e3          	beqz	a3,80003816 <__adddf3+0x74>
80003a56:	fff40813          	addi	a6,s0,-1
80003a5a:	00081b63          	bnez	a6,80003a70 <__adddf3+0x2ce>
80003a5e:	40c50633          	sub	a2,a0,a2
80003a62:	8f99                	sub	a5,a5,a4
80003a64:	00c53533          	sltu	a0,a0,a2
80003a68:	40a78733          	sub	a4,a5,a0
80003a6c:	4405                	li	s0,1
80003a6e:	a899                	j	80003ac4 <__adddf3+0x322>
80003a70:	00641a63          	bne	s0,t1,80003a84 <__adddf3+0x2e2>
80003a74:	7ff00413          	li	s0,2047
80003a78:	bb79                	j	80003816 <__adddf3+0x74>
80003a7a:	d8640ee3          	beq	s0,t1,80003816 <__adddf3+0x74>
80003a7e:	008006b7          	lui	a3,0x800
80003a82:	8f55                	or	a4,a4,a3
80003a84:	03800693          	li	a3,56
80003a88:	0706cb63          	blt	a3,a6,80003afe <__adddf3+0x35c>
80003a8c:	46fd                	li	a3,31
80003a8e:	02000893          	li	a7,32
80003a92:	0506c363          	blt	a3,a6,80003ad8 <__adddf3+0x336>
80003a96:	410888b3          	sub	a7,a7,a6
80003a9a:	011716b3          	sll	a3,a4,a7
80003a9e:	010655b3          	srl	a1,a2,a6
80003aa2:	011618b3          	sll	a7,a2,a7
80003aa6:	8ecd                	or	a3,a3,a1
80003aa8:	011038b3          	snez	a7,a7
80003aac:	0116e6b3          	or	a3,a3,a7
80003ab0:	01075833          	srl	a6,a4,a6
80003ab4:	40d50633          	sub	a2,a0,a3
80003ab8:	41078833          	sub	a6,a5,a6
80003abc:	00c53533          	sltu	a0,a0,a2
80003ac0:	40a80733          	sub	a4,a6,a0
80003ac4:	00871793          	slli	a5,a4,0x8
80003ac8:	f407dbe3          	bgez	a5,80003a1e <__adddf3+0x27c>
80003acc:	00971913          	slli	s2,a4,0x9
80003ad0:	00995913          	srli	s2,s2,0x9
80003ad4:	89b2                	mv	s3,a2
80003ad6:	a24d                	j	80003c78 <__adddf3+0x4d6>
80003ad8:	fe080693          	addi	a3,a6,-32
80003adc:	00d756b3          	srl	a3,a4,a3
80003ae0:	4581                	li	a1,0
80003ae2:	01180863          	beq	a6,a7,80003af2 <__adddf3+0x350>
80003ae6:	04000593          	li	a1,64
80003aea:	410585b3          	sub	a1,a1,a6
80003aee:	00b715b3          	sll	a1,a4,a1
80003af2:	8dd1                	or	a1,a1,a2
80003af4:	00b035b3          	snez	a1,a1
80003af8:	8ecd                	or	a3,a3,a1
80003afa:	4801                	li	a6,0
80003afc:	bf65                	j	80003ab4 <__adddf3+0x312>
80003afe:	00c766b3          	or	a3,a4,a2
80003b02:	00d036b3          	snez	a3,a3
80003b06:	bfd5                	j	80003afa <__adddf3+0x358>
80003b08:	0c080263          	beqz	a6,80003bcc <__adddf3+0x42a>
80003b0c:	40888833          	sub	a6,a7,s0
80003b10:	ec35                	bnez	s0,80003b8c <__adddf3+0x3ea>
80003b12:	00a7e5b3          	or	a1,a5,a0
80003b16:	e591                	bnez	a1,80003b22 <__adddf3+0x380>
80003b18:	84b6                	mv	s1,a3
80003b1a:	87ba                	mv	a5,a4
80003b1c:	8532                	mv	a0,a2
80003b1e:	8442                	mv	s0,a6
80003b20:	b9dd                	j	80003816 <__adddf3+0x74>
80003b22:	fff80593          	addi	a1,a6,-1
80003b26:	ed81                	bnez	a1,80003b3e <__adddf3+0x39c>
80003b28:	40a60533          	sub	a0,a2,a0
80003b2c:	00a635b3          	sltu	a1,a2,a0
80003b30:	40f707b3          	sub	a5,a4,a5
80003b34:	862a                	mv	a2,a0
80003b36:	40b78733          	sub	a4,a5,a1
80003b3a:	84b6                	mv	s1,a3
80003b3c:	bf05                	j	80003a6c <__adddf3+0x2ca>
80003b3e:	fc680de3          	beq	a6,t1,80003b18 <__adddf3+0x376>
80003b42:	03800813          	li	a6,56
80003b46:	06b84f63          	blt	a6,a1,80003bc4 <__adddf3+0x422>
80003b4a:	487d                	li	a6,31
80003b4c:	02000e13          	li	t3,32
80003b50:	04b84563          	blt	a6,a1,80003b9a <__adddf3+0x3f8>
80003b54:	40be0e33          	sub	t3,t3,a1
80003b58:	00b55333          	srl	t1,a0,a1
80003b5c:	01c79833          	sll	a6,a5,t3
80003b60:	01c51e33          	sll	t3,a0,t3
80003b64:	00686833          	or	a6,a6,t1
80003b68:	01c03e33          	snez	t3,t3
80003b6c:	01c86533          	or	a0,a6,t3
80003b70:	00b7d5b3          	srl	a1,a5,a1
80003b74:	40a60533          	sub	a0,a2,a0
80003b78:	00a637b3          	sltu	a5,a2,a0
80003b7c:	40b705b3          	sub	a1,a4,a1
80003b80:	862a                	mv	a2,a0
80003b82:	40f58733          	sub	a4,a1,a5
80003b86:	8446                	mv	s0,a7
80003b88:	84b6                	mv	s1,a3
80003b8a:	bf2d                	j	80003ac4 <__adddf3+0x322>
80003b8c:	1c688463          	beq	a7,t1,80003d54 <__adddf3+0x5b2>
80003b90:	008005b7          	lui	a1,0x800
80003b94:	8fcd                	or	a5,a5,a1
80003b96:	85c2                	mv	a1,a6
80003b98:	b76d                	j	80003b42 <__adddf3+0x3a0>
80003b9a:	fe058813          	addi	a6,a1,-32 # 7fffe0 <_stack+0x777fe0>
80003b9e:	0107d833          	srl	a6,a5,a6
80003ba2:	4301                	li	t1,0
80003ba4:	01c58863          	beq	a1,t3,80003bb4 <__adddf3+0x412>
80003ba8:	04000313          	li	t1,64
80003bac:	40b30333          	sub	t1,t1,a1
80003bb0:	00679333          	sll	t1,a5,t1
80003bb4:	00a36333          	or	t1,t1,a0
80003bb8:	00603333          	snez	t1,t1
80003bbc:	00686533          	or	a0,a6,t1
80003bc0:	4581                	li	a1,0
80003bc2:	bf4d                	j	80003b74 <__adddf3+0x3d2>
80003bc4:	8d5d                	or	a0,a0,a5
80003bc6:	00a03533          	snez	a0,a0
80003bca:	bfdd                	j	80003bc0 <__adddf3+0x41e>
80003bcc:	00140593          	addi	a1,s0,1
80003bd0:	7fe5f593          	andi	a1,a1,2046
80003bd4:	eda5                	bnez	a1,80003c4c <__adddf3+0x4aa>
80003bd6:	00a7e833          	or	a6,a5,a0
80003bda:	00c765b3          	or	a1,a4,a2
80003bde:	e831                	bnez	s0,80003c32 <__adddf3+0x490>
80003be0:	00081a63          	bnez	a6,80003bf4 <__adddf3+0x452>
80003be4:	16058363          	beqz	a1,80003d4a <__adddf3+0x5a8>
80003be8:	84b6                	mv	s1,a3
80003bea:	00c76533          	or	a0,a4,a2
80003bee:	c565                	beqz	a0,80003cd6 <__adddf3+0x534>
80003bf0:	4401                	li	s0,0
80003bf2:	b535                	j	80003a1e <__adddf3+0x27c>
80003bf4:	12058a63          	beqz	a1,80003d28 <__adddf3+0x586>
80003bf8:	40c50833          	sub	a6,a0,a2
80003bfc:	010538b3          	sltu	a7,a0,a6
80003c00:	40e785b3          	sub	a1,a5,a4
80003c04:	411585b3          	sub	a1,a1,a7
80003c08:	00859893          	slli	a7,a1,0x8
80003c0c:	0008dc63          	bgez	a7,80003c24 <__adddf3+0x482>
80003c10:	40a60533          	sub	a0,a2,a0
80003c14:	00a635b3          	sltu	a1,a2,a0
80003c18:	40f707b3          	sub	a5,a4,a5
80003c1c:	862a                	mv	a2,a0
80003c1e:	40b78733          	sub	a4,a5,a1
80003c22:	b7d9                	j	80003be8 <__adddf3+0x446>
80003c24:	00b86533          	or	a0,a6,a1
80003c28:	12050363          	beqz	a0,80003d4e <__adddf3+0x5ac>
80003c2c:	872e                	mv	a4,a1
80003c2e:	8642                	mv	a2,a6
80003c30:	bf6d                	j	80003bea <__adddf3+0x448>
80003c32:	00081963          	bnez	a6,80003c44 <__adddf3+0x4a2>
80003c36:	10059f63          	bnez	a1,80003d54 <__adddf3+0x5b2>
80003c3a:	4481                	li	s1,0
80003c3c:	4501                	li	a0,0
80003c3e:	004007b7          	lui	a5,0x400
80003c42:	bd0d                	j	80003a74 <__adddf3+0x2d2>
80003c44:	841a                	mv	s0,t1
80003c46:	bc0588e3          	beqz	a1,80003816 <__adddf3+0x74>
80003c4a:	b37d                	j	800039f8 <__adddf3+0x256>
80003c4c:	40c505b3          	sub	a1,a0,a2
80003c50:	00b53833          	sltu	a6,a0,a1
80003c54:	40e78933          	sub	s2,a5,a4
80003c58:	41090933          	sub	s2,s2,a6
80003c5c:	00891813          	slli	a6,s2,0x8
80003c60:	89ae                	mv	s3,a1
80003c62:	06085663          	bgez	a6,80003cce <__adddf3+0x52c>
80003c66:	40a609b3          	sub	s3,a2,a0
80003c6a:	40f70933          	sub	s2,a4,a5
80003c6e:	01363633          	sltu	a2,a2,s3
80003c72:	40c90933          	sub	s2,s2,a2
80003c76:	84b6                	mv	s1,a3
80003c78:	06090263          	beqz	s2,80003cdc <__adddf3+0x53a>
80003c7c:	854a                	mv	a0,s2
80003c7e:	0e6010ef          	jal	80004d64 <__clzsi2>
80003c82:	ff850793          	addi	a5,a0,-8 # f301bff8 <__fast_load_addr__+0x7300de38>
80003c86:	02000713          	li	a4,32
80003c8a:	8f1d                	sub	a4,a4,a5
80003c8c:	00f91933          	sll	s2,s2,a5
80003c90:	00e9d733          	srl	a4,s3,a4
80003c94:	01276733          	or	a4,a4,s2
80003c98:	00f99633          	sll	a2,s3,a5
80003c9c:	0887c063          	blt	a5,s0,80003d1c <__adddf3+0x57a>
80003ca0:	8f81                	sub	a5,a5,s0
80003ca2:	00178513          	addi	a0,a5,1 # 400001 <_stack+0x378001>
80003ca6:	46fd                	li	a3,31
80003ca8:	02000593          	li	a1,32
80003cac:	04a6c663          	blt	a3,a0,80003cf8 <__adddf3+0x556>
80003cb0:	8d89                	sub	a1,a1,a0
80003cb2:	00b717b3          	sll	a5,a4,a1
80003cb6:	00a656b3          	srl	a3,a2,a0
80003cba:	00b615b3          	sll	a1,a2,a1
80003cbe:	8fd5                	or	a5,a5,a3
80003cc0:	00b035b3          	snez	a1,a1
80003cc4:	00b7e633          	or	a2,a5,a1
80003cc8:	00a75733          	srl	a4,a4,a0
80003ccc:	bf39                	j	80003bea <__adddf3+0x448>
80003cce:	0125e533          	or	a0,a1,s2
80003cd2:	f15d                	bnez	a0,80003c78 <__adddf3+0x4d6>
80003cd4:	4481                	li	s1,0
80003cd6:	4781                	li	a5,0
80003cd8:	4401                	li	s0,0
80003cda:	be35                	j	80003816 <__adddf3+0x74>
80003cdc:	854e                	mv	a0,s3
80003cde:	086010ef          	jal	80004d64 <__clzsi2>
80003ce2:	01850793          	addi	a5,a0,24
80003ce6:	477d                	li	a4,31
80003ce8:	f8f75fe3          	bge	a4,a5,80003c86 <__adddf3+0x4e4>
80003cec:	ff850713          	addi	a4,a0,-8
80003cf0:	00e99733          	sll	a4,s3,a4
80003cf4:	4601                	li	a2,0
80003cf6:	b75d                	j	80003c9c <__adddf3+0x4fa>
80003cf8:	1785                	addi	a5,a5,-31
80003cfa:	00f757b3          	srl	a5,a4,a5
80003cfe:	4681                	li	a3,0
80003d00:	00b50763          	beq	a0,a1,80003d0e <__adddf3+0x56c>
80003d04:	04000693          	li	a3,64
80003d08:	8e89                	sub	a3,a3,a0
80003d0a:	00d716b3          	sll	a3,a4,a3
80003d0e:	8ed1                	or	a3,a3,a2
80003d10:	00d036b3          	snez	a3,a3
80003d14:	00d7e633          	or	a2,a5,a3
80003d18:	4701                	li	a4,0
80003d1a:	bdc1                	j	80003bea <__adddf3+0x448>
80003d1c:	8c1d                	sub	s0,s0,a5
80003d1e:	ff8007b7          	lui	a5,0xff800
80003d22:	17fd                	addi	a5,a5,-1 # ff7fffff <__fast_load_addr__+0x7f7f1e3f>
80003d24:	8f7d                	and	a4,a4,a5
80003d26:	b9e5                	j	80003a1e <__adddf3+0x27c>
80003d28:	873e                	mv	a4,a5
80003d2a:	862a                	mv	a2,a0
80003d2c:	bd7d                	j	80003bea <__adddf3+0x448>
80003d2e:	00f67793          	andi	a5,a2,15
80003d32:	4691                	li	a3,4
80003d34:	ced789e3          	beq	a5,a3,80003a26 <__adddf3+0x284>
80003d38:	00d60533          	add	a0,a2,a3
80003d3c:	00c537b3          	sltu	a5,a0,a2
80003d40:	97ba                	add	a5,a5,a4
80003d42:	b1e5                	j	80003a2a <__adddf3+0x288>
80003d44:	8436                	mv	s0,a3
80003d46:	4781                	li	a5,0
80003d48:	b95d                	j	800039fe <__adddf3+0x25c>
80003d4a:	4481                	li	s1,0
80003d4c:	bfed                	j	80003d46 <__adddf3+0x5a4>
80003d4e:	4481                	li	s1,0
80003d50:	4781                	li	a5,0
80003d52:	b4d1                	j	80003816 <__adddf3+0x74>
80003d54:	84b6                	mv	s1,a3
80003d56:	87ba                	mv	a5,a4
80003d58:	8532                	mv	a0,a2
80003d5a:	bb29                	j	80003a74 <__adddf3+0x2d2>

80003d5c <__divdf3>:
80003d5c:	7179                	addi	sp,sp,-48
80003d5e:	ca56                	sw	s5,20(sp)
80003d60:	0145da93          	srli	s5,a1,0x14
80003d64:	d422                	sw	s0,40(sp)
80003d66:	d226                	sw	s1,36(sp)
80003d68:	d04a                	sw	s2,32(sp)
80003d6a:	ce4e                	sw	s3,28(sp)
80003d6c:	c85a                	sw	s6,16(sp)
80003d6e:	c65e                	sw	s7,12(sp)
80003d70:	8b2a                	mv	s6,a0
80003d72:	842a                	mv	s0,a0
80003d74:	00c59493          	slli	s1,a1,0xc
80003d78:	d606                	sw	ra,44(sp)
80003d7a:	cc52                	sw	s4,24(sp)
80003d7c:	7ffaf513          	andi	a0,s5,2047
80003d80:	8bb2                	mv	s7,a2
80003d82:	8936                	mv	s2,a3
80003d84:	80b1                	srli	s1,s1,0xc
80003d86:	01f5d993          	srli	s3,a1,0x1f
80003d8a:	2c050d63          	beqz	a0,80004064 <__divdf3+0x308>
80003d8e:	7ff00793          	li	a5,2047
80003d92:	32f50563          	beq	a0,a5,800040bc <__divdf3+0x360>
80003d96:	01db5693          	srli	a3,s6,0x1d
80003d9a:	048e                	slli	s1,s1,0x3
80003d9c:	8ec5                	or	a3,a3,s1
80003d9e:	008007b7          	lui	a5,0x800
80003da2:	00f6ea33          	or	s4,a3,a5
80003da6:	003b1413          	slli	s0,s6,0x3
80003daa:	c0150a93          	addi	s5,a0,-1023
80003dae:	4b01                	li	s6,0
80003db0:	01495713          	srli	a4,s2,0x14
80003db4:	00c91493          	slli	s1,s2,0xc
80003db8:	7ff77713          	andi	a4,a4,2047
80003dbc:	88de                	mv	a7,s7
80003dbe:	80b1                	srli	s1,s1,0xc
80003dc0:	01f95913          	srli	s2,s2,0x1f
80003dc4:	30070c63          	beqz	a4,800040dc <__divdf3+0x380>
80003dc8:	7ff00793          	li	a5,2047
80003dcc:	36f70163          	beq	a4,a5,8000412e <__divdf3+0x3d2>
80003dd0:	01dbd793          	srli	a5,s7,0x1d
80003dd4:	048e                	slli	s1,s1,0x3
80003dd6:	8cdd                	or	s1,s1,a5
80003dd8:	008007b7          	lui	a5,0x800
80003ddc:	8fc5                	or	a5,a5,s1
80003dde:	003b9893          	slli	a7,s7,0x3
80003de2:	c0170713          	addi	a4,a4,-1023
80003de6:	4681                	li	a3,0
80003de8:	40ea8533          	sub	a0,s5,a4
80003dec:	002b1713          	slli	a4,s6,0x2
80003df0:	8f55                	or	a4,a4,a3
80003df2:	461d                	li	a2,7
80003df4:	0129c833          	xor	a6,s3,s2
80003df8:	34e64863          	blt	a2,a4,80004148 <__divdf3+0x3ec>
80003dfc:	4605                	li	a2,1
80003dfe:	48c70263          	beq	a4,a2,80004282 <__divdf3+0x526>
80003e02:	ffe70593          	addi	a1,a4,-2
80003e06:	4315                	li	t1,5
80003e08:	34b37c63          	bgeu	t1,a1,80004160 <__divdf3+0x404>
80003e0c:	0147e663          	bltu	a5,s4,80003e18 <__divdf3+0xbc>
80003e10:	39146663          	bltu	s0,a7,8000419c <__divdf3+0x440>
80003e14:	38fa1463          	bne	s4,a5,8000419c <__divdf3+0x440>
80003e18:	01fa1693          	slli	a3,s4,0x1f
80003e1c:	00145713          	srli	a4,s0,0x1
80003e20:	01f41293          	slli	t0,s0,0x1f
80003e24:	001a5a13          	srli	s4,s4,0x1
80003e28:	00e6e433          	or	s0,a3,a4
80003e2c:	00879e13          	slli	t3,a5,0x8
80003e30:	0188d613          	srli	a2,a7,0x18
80003e34:	01c66633          	or	a2,a2,t3
80003e38:	010e5e13          	srli	t3,t3,0x10
80003e3c:	03ca57b3          	divu	a5,s4,t3
80003e40:	01061e93          	slli	t4,a2,0x10
80003e44:	010ede93          	srli	t4,t4,0x10
80003e48:	01045713          	srli	a4,s0,0x10
80003e4c:	00889593          	slli	a1,a7,0x8
80003e50:	03ca76b3          	remu	a3,s4,t3
80003e54:	02fe8333          	mul	t1,t4,a5
80003e58:	06c2                	slli	a3,a3,0x10
80003e5a:	8f55                	or	a4,a4,a3
80003e5c:	00677863          	bgeu	a4,t1,80003e6c <__divdf3+0x110>
80003e60:	9732                	add	a4,a4,a2
80003e62:	00c76463          	bltu	a4,a2,80003e6a <__divdf3+0x10e>
80003e66:	32676e63          	bltu	a4,t1,800041a2 <__divdf3+0x446>
80003e6a:	17fd                	addi	a5,a5,-1 # 7fffff <_stack+0x777fff>
80003e6c:	40670733          	sub	a4,a4,t1
80003e70:	03c75333          	divu	t1,a4,t3
80003e74:	01041693          	slli	a3,s0,0x10
80003e78:	82c1                	srli	a3,a3,0x10
80003e7a:	03c77733          	remu	a4,a4,t3
80003e7e:	026e8f33          	mul	t5,t4,t1
80003e82:	0742                	slli	a4,a4,0x10
80003e84:	8f55                	or	a4,a4,a3
80003e86:	01e77863          	bgeu	a4,t5,80003e96 <__divdf3+0x13a>
80003e8a:	9732                	add	a4,a4,a2
80003e8c:	01e77463          	bgeu	a4,t5,80003e94 <__divdf3+0x138>
80003e90:	30c77c63          	bgeu	a4,a2,800041a8 <__divdf3+0x44c>
80003e94:	137d                	addi	t1,t1,-1
80003e96:	07c2                	slli	a5,a5,0x10
80003e98:	0067e7b3          	or	a5,a5,t1
80003e9c:	01079693          	slli	a3,a5,0x10
80003ea0:	01059f93          	slli	t6,a1,0x10
80003ea4:	0107d393          	srli	t2,a5,0x10
80003ea8:	82c1                	srli	a3,a3,0x10
80003eaa:	010fdf93          	srli	t6,t6,0x10
80003eae:	41e70733          	sub	a4,a4,t5
80003eb2:	0105df13          	srli	t5,a1,0x10
80003eb6:	03f68433          	mul	s0,a3,t6
80003eba:	03f384b3          	mul	s1,t2,t6
80003ebe:	01045313          	srli	t1,s0,0x10
80003ec2:	02df06b3          	mul	a3,t5,a3
80003ec6:	03e383b3          	mul	t2,t2,t5
80003eca:	96a6                	add	a3,a3,s1
80003ecc:	9336                	add	t1,t1,a3
80003ece:	00937463          	bgeu	t1,s1,80003ed6 <__divdf3+0x17a>
80003ed2:	66c1                	lui	a3,0x10
80003ed4:	93b6                	add	t2,t2,a3
80003ed6:	01035693          	srli	a3,t1,0x10
80003eda:	0442                	slli	s0,s0,0x10
80003edc:	0342                	slli	t1,t1,0x10
80003ede:	8041                	srli	s0,s0,0x10
80003ee0:	969e                	add	a3,a3,t2
80003ee2:	9322                	add	t1,t1,s0
80003ee4:	00d76663          	bltu	a4,a3,80003ef0 <__divdf3+0x194>
80003ee8:	02d71a63          	bne	a4,a3,80003f1c <__divdf3+0x1c0>
80003eec:	0262f863          	bgeu	t0,t1,80003f1c <__divdf3+0x1c0>
80003ef0:	00b283b3          	add	t2,t0,a1
80003ef4:	0053b433          	sltu	s0,t2,t0
80003ef8:	00c40933          	add	s2,s0,a2
80003efc:	974a                	add	a4,a4,s2
80003efe:	fff78493          	addi	s1,a5,-1
80003f02:	829e                	mv	t0,t2
80003f04:	00e66563          	bltu	a2,a4,80003f0e <__divdf3+0x1b2>
80003f08:	00e61963          	bne	a2,a4,80003f1a <__divdf3+0x1be>
80003f0c:	e419                	bnez	s0,80003f1a <__divdf3+0x1be>
80003f0e:	2ad76063          	bltu	a4,a3,800041ae <__divdf3+0x452>
80003f12:	0063f463          	bgeu	t2,t1,80003f1a <__divdf3+0x1be>
80003f16:	28e68c63          	beq	a3,a4,800041ae <__divdf3+0x452>
80003f1a:	87a6                	mv	a5,s1
80003f1c:	40628333          	sub	t1,t0,t1
80003f20:	8f15                	sub	a4,a4,a3
80003f22:	0062b2b3          	sltu	t0,t0,t1
80003f26:	40570733          	sub	a4,a4,t0
80003f2a:	547d                	li	s0,-1
80003f2c:	0ce60463          	beq	a2,a4,80003ff4 <__divdf3+0x298>
80003f30:	03c75433          	divu	s0,a4,t3
80003f34:	01035693          	srli	a3,t1,0x10
80003f38:	03c77733          	remu	a4,a4,t3
80003f3c:	028e82b3          	mul	t0,t4,s0
80003f40:	0742                	slli	a4,a4,0x10
80003f42:	8ed9                	or	a3,a3,a4
80003f44:	0056f863          	bgeu	a3,t0,80003f54 <__divdf3+0x1f8>
80003f48:	96b2                	add	a3,a3,a2
80003f4a:	0056f463          	bgeu	a3,t0,80003f52 <__divdf3+0x1f6>
80003f4e:	26c6f863          	bgeu	a3,a2,800041be <__divdf3+0x462>
80003f52:	147d                	addi	s0,s0,-1
80003f54:	405686b3          	sub	a3,a3,t0
80003f58:	03c6d2b3          	divu	t0,a3,t3
80003f5c:	01031713          	slli	a4,t1,0x10
80003f60:	8341                	srli	a4,a4,0x10
80003f62:	03c6f6b3          	remu	a3,a3,t3
80003f66:	025e8eb3          	mul	t4,t4,t0
80003f6a:	06c2                	slli	a3,a3,0x10
80003f6c:	8f55                	or	a4,a4,a3
80003f6e:	01d77863          	bgeu	a4,t4,80003f7e <__divdf3+0x222>
80003f72:	9732                	add	a4,a4,a2
80003f74:	01d77463          	bgeu	a4,t4,80003f7c <__divdf3+0x220>
80003f78:	24c77663          	bgeu	a4,a2,800041c4 <__divdf3+0x468>
80003f7c:	12fd                	addi	t0,t0,-1
80003f7e:	0442                	slli	s0,s0,0x10
80003f80:	00546433          	or	s0,s0,t0
80003f84:	01041693          	slli	a3,s0,0x10
80003f88:	82c1                	srli	a3,a3,0x10
80003f8a:	01045e13          	srli	t3,s0,0x10
80003f8e:	41d70733          	sub	a4,a4,t4
80003f92:	02df8eb3          	mul	t4,t6,a3
80003f96:	03cf8fb3          	mul	t6,t6,t3
80003f9a:	03cf0e33          	mul	t3,t5,t3
80003f9e:	02df0f33          	mul	t5,t5,a3
80003fa2:	010ed693          	srli	a3,t4,0x10
80003fa6:	9f7e                	add	t5,t5,t6
80003fa8:	96fa                	add	a3,a3,t5
80003faa:	01f6f463          	bgeu	a3,t6,80003fb2 <__divdf3+0x256>
80003fae:	6341                	lui	t1,0x10
80003fb0:	9e1a                	add	t3,t3,t1
80003fb2:	0106d313          	srli	t1,a3,0x10
80003fb6:	0ec2                	slli	t4,t4,0x10
80003fb8:	06c2                	slli	a3,a3,0x10
80003fba:	010ede93          	srli	t4,t4,0x10
80003fbe:	9372                	add	t1,t1,t3
80003fc0:	96f6                	add	a3,a3,t4
80003fc2:	00676663          	bltu	a4,t1,80003fce <__divdf3+0x272>
80003fc6:	20671d63          	bne	a4,t1,800041e0 <__divdf3+0x484>
80003fca:	20068863          	beqz	a3,800041da <__divdf3+0x47e>
80003fce:	00e60e33          	add	t3,a2,a4
80003fd2:	fff40e93          	addi	t4,s0,-1
80003fd6:	8772                	mv	a4,t3
80003fd8:	00ce6863          	bltu	t3,a2,80003fe8 <__divdf3+0x28c>
80003fdc:	1e6e6763          	bltu	t3,t1,800041ca <__divdf3+0x46e>
80003fe0:	1e6e1f63          	bne	t3,t1,800041de <__divdf3+0x482>
80003fe4:	1ed5e363          	bltu	a1,a3,800041ca <__divdf3+0x46e>
80003fe8:	88ae                	mv	a7,a1
80003fea:	8476                	mv	s0,t4
80003fec:	1ed89a63          	bne	a7,a3,800041e0 <__divdf3+0x484>
80003ff0:	1e671863          	bne	a4,t1,800041e0 <__divdf3+0x484>
80003ff4:	3ff50713          	addi	a4,a0,1023
80003ff8:	1ee05b63          	blez	a4,800041ee <__divdf3+0x492>
80003ffc:	00747693          	andi	a3,s0,7
80004000:	ce81                	beqz	a3,80004018 <__divdf3+0x2bc>
80004002:	00f47693          	andi	a3,s0,15
80004006:	4611                	li	a2,4
80004008:	00c68863          	beq	a3,a2,80004018 <__divdf3+0x2bc>
8000400c:	00c406b3          	add	a3,s0,a2
80004010:	0086b633          	sltu	a2,a3,s0
80004014:	97b2                	add	a5,a5,a2
80004016:	8436                	mv	s0,a3
80004018:	00779693          	slli	a3,a5,0x7
8000401c:	0006d863          	bgez	a3,8000402c <__divdf3+0x2d0>
80004020:	ff000737          	lui	a4,0xff000
80004024:	177d                	addi	a4,a4,-1 # feffffff <__fast_load_addr__+0x7eff1e3f>
80004026:	8ff9                	and	a5,a5,a4
80004028:	40050713          	addi	a4,a0,1024
8000402c:	7fe00693          	li	a3,2046
80004030:	24e6c963          	blt	a3,a4,80004282 <__divdf3+0x526>
80004034:	01d79613          	slli	a2,a5,0x1d
80004038:	800d                	srli	s0,s0,0x3
8000403a:	8e41                	or	a2,a2,s0
8000403c:	838d                	srli	a5,a5,0x3
8000403e:	50b2                	lw	ra,44(sp)
80004040:	5422                	lw	s0,40(sp)
80004042:	07b2                	slli	a5,a5,0xc
80004044:	0752                	slli	a4,a4,0x14
80004046:	83b1                	srli	a5,a5,0xc
80004048:	8f5d                	or	a4,a4,a5
8000404a:	087e                	slli	a6,a6,0x1f
8000404c:	5492                	lw	s1,36(sp)
8000404e:	5902                	lw	s2,32(sp)
80004050:	49f2                	lw	s3,28(sp)
80004052:	4a62                	lw	s4,24(sp)
80004054:	4ad2                	lw	s5,20(sp)
80004056:	4b42                	lw	s6,16(sp)
80004058:	4bb2                	lw	s7,12(sp)
8000405a:	8532                	mv	a0,a2
8000405c:	010765b3          	or	a1,a4,a6
80004060:	6145                	addi	sp,sp,48
80004062:	8082                	ret
80004064:	0164ea33          	or	s4,s1,s6
80004068:	060a0263          	beqz	s4,800040cc <__divdf3+0x370>
8000406c:	c88d                	beqz	s1,8000409e <__divdf3+0x342>
8000406e:	8526                	mv	a0,s1
80004070:	4f5000ef          	jal	80004d64 <__clzsi2>
80004074:	87aa                	mv	a5,a0
80004076:	ff550713          	addi	a4,a0,-11
8000407a:	46f5                	li	a3,29
8000407c:	ff878613          	addi	a2,a5,-8
80004080:	8e99                	sub	a3,a3,a4
80004082:	00c494b3          	sll	s1,s1,a2
80004086:	00db56b3          	srl	a3,s6,a3
8000408a:	0096ea33          	or	s4,a3,s1
8000408e:	00cb14b3          	sll	s1,s6,a2
80004092:	c0d00513          	li	a0,-1011
80004096:	40f50ab3          	sub	s5,a0,a5
8000409a:	8426                	mv	s0,s1
8000409c:	bb09                	j	80003dae <__divdf3+0x52>
8000409e:	855a                	mv	a0,s6
800040a0:	4c5000ef          	jal	80004d64 <__clzsi2>
800040a4:	01550713          	addi	a4,a0,21
800040a8:	46f1                	li	a3,28
800040aa:	02050793          	addi	a5,a0,32
800040ae:	fce6d6e3          	bge	a3,a4,8000407a <__divdf3+0x31e>
800040b2:	ff850693          	addi	a3,a0,-8
800040b6:	00db1a33          	sll	s4,s6,a3
800040ba:	bfe1                	j	80004092 <__divdf3+0x336>
800040bc:	0164ea33          	or	s4,s1,s6
800040c0:	000a1a63          	bnez	s4,800040d4 <__divdf3+0x378>
800040c4:	4401                	li	s0,0
800040c6:	8aaa                	mv	s5,a0
800040c8:	4b09                	li	s6,2
800040ca:	b1dd                	j	80003db0 <__divdf3+0x54>
800040cc:	4401                	li	s0,0
800040ce:	4a81                	li	s5,0
800040d0:	4b05                	li	s6,1
800040d2:	b9f9                	j	80003db0 <__divdf3+0x54>
800040d4:	8a26                	mv	s4,s1
800040d6:	8aaa                	mv	s5,a0
800040d8:	4b0d                	li	s6,3
800040da:	b9d9                	j	80003db0 <__divdf3+0x54>
800040dc:	0174e7b3          	or	a5,s1,s7
800040e0:	cfa9                	beqz	a5,8000413a <__divdf3+0x3de>
800040e2:	c49d                	beqz	s1,80004110 <__divdf3+0x3b4>
800040e4:	8526                	mv	a0,s1
800040e6:	47f000ef          	jal	80004d64 <__clzsi2>
800040ea:	86aa                	mv	a3,a0
800040ec:	ff550713          	addi	a4,a0,-11
800040f0:	47f5                	li	a5,29
800040f2:	ff868613          	addi	a2,a3,-8 # fff8 <__fw_size__+0x4e38>
800040f6:	8f99                	sub	a5,a5,a4
800040f8:	00c494b3          	sll	s1,s1,a2
800040fc:	00fbd7b3          	srl	a5,s7,a5
80004100:	8fc5                	or	a5,a5,s1
80004102:	00cb94b3          	sll	s1,s7,a2
80004106:	c0d00713          	li	a4,-1011
8000410a:	8f15                	sub	a4,a4,a3
8000410c:	88a6                	mv	a7,s1
8000410e:	b9e1                	j	80003de6 <__divdf3+0x8a>
80004110:	855e                	mv	a0,s7
80004112:	453000ef          	jal	80004d64 <__clzsi2>
80004116:	01550713          	addi	a4,a0,21
8000411a:	47f1                	li	a5,28
8000411c:	02050693          	addi	a3,a0,32
80004120:	fce7d8e3          	bge	a5,a4,800040f0 <__divdf3+0x394>
80004124:	ff850793          	addi	a5,a0,-8
80004128:	00fb97b3          	sll	a5,s7,a5
8000412c:	bfe9                	j	80004106 <__divdf3+0x3aa>
8000412e:	0174e7b3          	or	a5,s1,s7
80004132:	eb81                	bnez	a5,80004142 <__divdf3+0x3e6>
80004134:	4881                	li	a7,0
80004136:	4689                	li	a3,2
80004138:	b945                	j	80003de8 <__divdf3+0x8c>
8000413a:	4881                	li	a7,0
8000413c:	4701                	li	a4,0
8000413e:	4685                	li	a3,1
80004140:	b165                	j	80003de8 <__divdf3+0x8c>
80004142:	87a6                	mv	a5,s1
80004144:	468d                	li	a3,3
80004146:	b14d                	j	80003de8 <__divdf3+0x8c>
80004148:	1759                	addi	a4,a4,-10
8000414a:	4615                	li	a2,5
8000414c:	12e66b63          	bltu	a2,a4,80004282 <__divdf3+0x526>
80004150:	8000e637          	lui	a2,0x8000e
80004154:	070a                	slli	a4,a4,0x2
80004156:	89060613          	addi	a2,a2,-1904 # 8000d890 <_lseek+0x558>
8000415a:	9732                	add	a4,a4,a2
8000415c:	4318                	lw	a4,0(a4)
8000415e:	8702                	jr	a4
80004160:	00e61633          	sll	a2,a2,a4
80004164:	05467593          	andi	a1,a2,84
80004168:	e59d                	bnez	a1,80004196 <__divdf3+0x43a>
8000416a:	08867613          	andi	a2,a2,136
8000416e:	ee25                	bnez	a2,800041e6 <__divdf3+0x48a>
80004170:	c8671ee3          	bne	a4,t1,80003e0c <__divdf3+0xb0>
80004174:	000807b7          	lui	a5,0x80
80004178:	7ff00713          	li	a4,2047
8000417c:	4801                	li	a6,0
8000417e:	b5c1                	j	8000403e <__divdf3+0x2e2>
80004180:	884e                	mv	a6,s3
80004182:	87d2                	mv	a5,s4
80004184:	4709                	li	a4,2
80004186:	0eeb0e63          	beq	s6,a4,80004282 <__divdf3+0x526>
8000418a:	470d                	li	a4,3
8000418c:	0eeb0763          	beq	s6,a4,8000427a <__divdf3+0x51e>
80004190:	4705                	li	a4,1
80004192:	e6eb11e3          	bne	s6,a4,80003ff4 <__divdf3+0x298>
80004196:	4781                	li	a5,0
80004198:	4601                	li	a2,0
8000419a:	a84d                	j	8000424c <__divdf3+0x4f0>
8000419c:	157d                	addi	a0,a0,-1
8000419e:	4281                	li	t0,0
800041a0:	b171                	j	80003e2c <__divdf3+0xd0>
800041a2:	17f9                	addi	a5,a5,-2 # 7fffe <_noncacheable_size+0x3fffe>
800041a4:	9732                	add	a4,a4,a2
800041a6:	b1d9                	j	80003e6c <__divdf3+0x110>
800041a8:	1379                	addi	t1,t1,-2 # fffe <__fw_size__+0x4e3e>
800041aa:	9732                	add	a4,a4,a2
800041ac:	b1ed                	j	80003e96 <__divdf3+0x13a>
800041ae:	007582b3          	add	t0,a1,t2
800041b2:	00b2b3b3          	sltu	t2,t0,a1
800041b6:	93b2                	add	t2,t2,a2
800041b8:	17f9                	addi	a5,a5,-2
800041ba:	971e                	add	a4,a4,t2
800041bc:	b385                	j	80003f1c <__divdf3+0x1c0>
800041be:	1479                	addi	s0,s0,-2
800041c0:	96b2                	add	a3,a3,a2
800041c2:	bb49                	j	80003f54 <__divdf3+0x1f8>
800041c4:	12f9                	addi	t0,t0,-2
800041c6:	9732                	add	a4,a4,a2
800041c8:	bb5d                	j	80003f7e <__divdf3+0x222>
800041ca:	08a6                	slli	a7,a7,0x9
800041cc:	00b8b5b3          	sltu	a1,a7,a1
800041d0:	95b2                	add	a1,a1,a2
800041d2:	1479                	addi	s0,s0,-2
800041d4:	00be0733          	add	a4,t3,a1
800041d8:	bd11                	j	80003fec <__divdf3+0x290>
800041da:	4881                	li	a7,0
800041dc:	bd01                	j	80003fec <__divdf3+0x290>
800041de:	8476                	mv	s0,t4
800041e0:	00146413          	ori	s0,s0,1
800041e4:	bd01                	j	80003ff4 <__divdf3+0x298>
800041e6:	884a                	mv	a6,s2
800041e8:	8446                	mv	s0,a7
800041ea:	8b36                	mv	s6,a3
800041ec:	bf61                	j	80004184 <__divdf3+0x428>
800041ee:	c32d                	beqz	a4,80004250 <__divdf3+0x4f4>
800041f0:	fc900693          	li	a3,-55
800041f4:	fad741e3          	blt	a4,a3,80004196 <__divdf3+0x43a>
800041f8:	5689                	li	a3,-30
800041fa:	04d74d63          	blt	a4,a3,80004254 <__divdf3+0x4f8>
800041fe:	4685                	li	a3,1
80004200:	8e99                	sub	a3,a3,a4
80004202:	41e50513          	addi	a0,a0,1054
80004206:	00d45733          	srl	a4,s0,a3
8000420a:	00a41433          	sll	s0,s0,a0
8000420e:	00803433          	snez	s0,s0
80004212:	00a79533          	sll	a0,a5,a0
80004216:	8c49                	or	s0,s0,a0
80004218:	8f41                	or	a4,a4,s0
8000421a:	00d7d7b3          	srl	a5,a5,a3
8000421e:	00777693          	andi	a3,a4,7
80004222:	ce81                	beqz	a3,8000423a <__divdf3+0x4de>
80004224:	00f77693          	andi	a3,a4,15
80004228:	4611                	li	a2,4
8000422a:	00c68863          	beq	a3,a2,8000423a <__divdf3+0x4de>
8000422e:	00c706b3          	add	a3,a4,a2
80004232:	00e6b633          	sltu	a2,a3,a4
80004236:	97b2                	add	a5,a5,a2
80004238:	8736                	mv	a4,a3
8000423a:	00879693          	slli	a3,a5,0x8
8000423e:	0406c763          	bltz	a3,8000428c <__divdf3+0x530>
80004242:	01d79613          	slli	a2,a5,0x1d
80004246:	830d                	srli	a4,a4,0x3
80004248:	8e59                	or	a2,a2,a4
8000424a:	838d                	srli	a5,a5,0x3
8000424c:	4701                	li	a4,0
8000424e:	bbc5                	j	8000403e <__divdf3+0x2e2>
80004250:	4685                	li	a3,1
80004252:	bf45                	j	80004202 <__divdf3+0x4a6>
80004254:	5585                	li	a1,-31
80004256:	40e586b3          	sub	a3,a1,a4
8000425a:	00d7d6b3          	srl	a3,a5,a3
8000425e:	4601                	li	a2,0
80004260:	00b70663          	beq	a4,a1,8000426c <__divdf3+0x510>
80004264:	43e50513          	addi	a0,a0,1086
80004268:	00a79633          	sll	a2,a5,a0
8000426c:	8e41                	or	a2,a2,s0
8000426e:	00c03633          	snez	a2,a2
80004272:	00c6e733          	or	a4,a3,a2
80004276:	4781                	li	a5,0
80004278:	b75d                	j	8000421e <__divdf3+0x4c2>
8000427a:	000807b7          	lui	a5,0x80
8000427e:	4601                	li	a2,0
80004280:	bde5                	j	80004178 <__divdf3+0x41c>
80004282:	4781                	li	a5,0
80004284:	4601                	li	a2,0
80004286:	7ff00713          	li	a4,2047
8000428a:	bb55                	j	8000403e <__divdf3+0x2e2>
8000428c:	4781                	li	a5,0
8000428e:	4601                	li	a2,0
80004290:	4705                	li	a4,1
80004292:	b375                	j	8000403e <__divdf3+0x2e2>

80004294 <__muldf3>:
80004294:	7179                	addi	sp,sp,-48
80004296:	cc52                	sw	s4,24(sp)
80004298:	0145da13          	srli	s4,a1,0x14
8000429c:	d422                	sw	s0,40(sp)
8000429e:	d226                	sw	s1,36(sp)
800042a0:	ce4e                	sw	s3,28(sp)
800042a2:	ca56                	sw	s5,20(sp)
800042a4:	c65e                	sw	s7,12(sp)
800042a6:	00c59493          	slli	s1,a1,0xc
800042aa:	d606                	sw	ra,44(sp)
800042ac:	d04a                	sw	s2,32(sp)
800042ae:	c85a                	sw	s6,16(sp)
800042b0:	7ffa7a13          	andi	s4,s4,2047
800042b4:	842a                	mv	s0,a0
800042b6:	8bb2                	mv	s7,a2
800042b8:	89b6                	mv	s3,a3
800042ba:	80b1                	srli	s1,s1,0xc
800042bc:	01f5da93          	srli	s5,a1,0x1f
800042c0:	080a0c63          	beqz	s4,80004358 <__muldf3+0xc4>
800042c4:	7ff00793          	li	a5,2047
800042c8:	0efa0363          	beq	s4,a5,800043ae <__muldf3+0x11a>
800042cc:	048e                	slli	s1,s1,0x3
800042ce:	01d55793          	srli	a5,a0,0x1d
800042d2:	8fc5                	or	a5,a5,s1
800042d4:	008004b7          	lui	s1,0x800
800042d8:	8cdd                	or	s1,s1,a5
800042da:	00351913          	slli	s2,a0,0x3
800042de:	c01a0a13          	addi	s4,s4,-1023
800042e2:	4b01                	li	s6,0
800042e4:	0149d713          	srli	a4,s3,0x14
800042e8:	00c99413          	slli	s0,s3,0xc
800042ec:	7ff77713          	andi	a4,a4,2047
800042f0:	8031                	srli	s0,s0,0xc
800042f2:	01f9d993          	srli	s3,s3,0x1f
800042f6:	cb71                	beqz	a4,800043ca <__muldf3+0x136>
800042f8:	7ff00793          	li	a5,2047
800042fc:	12f70163          	beq	a4,a5,8000441e <__muldf3+0x18a>
80004300:	040e                	slli	s0,s0,0x3
80004302:	01dbd793          	srli	a5,s7,0x1d
80004306:	8fc1                	or	a5,a5,s0
80004308:	00800437          	lui	s0,0x800
8000430c:	8c5d                	or	s0,s0,a5
8000430e:	c0170713          	addi	a4,a4,-1023
80004312:	003b9793          	slli	a5,s7,0x3
80004316:	4801                	li	a6,0
80004318:	9a3a                	add	s4,s4,a4
8000431a:	002b1713          	slli	a4,s6,0x2
8000431e:	01076733          	or	a4,a4,a6
80004322:	46ad                	li	a3,11
80004324:	001a0513          	addi	a0,s4,1
80004328:	12e6ca63          	blt	a3,a4,8000445c <__muldf3+0x1c8>
8000432c:	4609                	li	a2,2
8000432e:	013ac5b3          	xor	a1,s5,s3
80004332:	4685                	li	a3,1
80004334:	10e64263          	blt	a2,a4,80004438 <__muldf3+0x1a4>
80004338:	177d                	addi	a4,a4,-1
8000433a:	12e6ec63          	bltu	a3,a4,80004472 <__muldf3+0x1de>
8000433e:	8b42                	mv	s6,a6
80004340:	4709                	li	a4,2
80004342:	38eb0563          	beq	s6,a4,800046cc <__muldf3+0x438>
80004346:	470d                	li	a4,3
80004348:	10eb0e63          	beq	s6,a4,80004464 <__muldf3+0x1d0>
8000434c:	4705                	li	a4,1
8000434e:	26eb1963          	bne	s6,a4,800045c0 <__muldf3+0x32c>
80004352:	4401                	li	s0,0
80004354:	4601                	li	a2,0
80004356:	a6a9                	j	800046a0 <__muldf3+0x40c>
80004358:	00a4e933          	or	s2,s1,a0
8000435c:	06090063          	beqz	s2,800043bc <__muldf3+0x128>
80004360:	c88d                	beqz	s1,80004392 <__muldf3+0xfe>
80004362:	8526                	mv	a0,s1
80004364:	201000ef          	jal	80004d64 <__clzsi2>
80004368:	872a                	mv	a4,a0
8000436a:	ff550693          	addi	a3,a0,-11
8000436e:	47f5                	li	a5,29
80004370:	ff870613          	addi	a2,a4,-8
80004374:	8f95                	sub	a5,a5,a3
80004376:	00c494b3          	sll	s1,s1,a2
8000437a:	00f457b3          	srl	a5,s0,a5
8000437e:	8fc5                	or	a5,a5,s1
80004380:	00c414b3          	sll	s1,s0,a2
80004384:	c0d00a13          	li	s4,-1011
80004388:	8926                	mv	s2,s1
8000438a:	40ea0a33          	sub	s4,s4,a4
8000438e:	84be                	mv	s1,a5
80004390:	bf89                	j	800042e2 <__muldf3+0x4e>
80004392:	1d3000ef          	jal	80004d64 <__clzsi2>
80004396:	01550693          	addi	a3,a0,21
8000439a:	47f1                	li	a5,28
8000439c:	02050713          	addi	a4,a0,32
800043a0:	fcd7d7e3          	bge	a5,a3,8000436e <__muldf3+0xda>
800043a4:	ff850793          	addi	a5,a0,-8
800043a8:	00f417b3          	sll	a5,s0,a5
800043ac:	bfe1                	j	80004384 <__muldf3+0xf0>
800043ae:	00a4e933          	or	s2,s1,a0
800043b2:	00091963          	bnez	s2,800043c4 <__muldf3+0x130>
800043b6:	4481                	li	s1,0
800043b8:	4b09                	li	s6,2
800043ba:	b72d                	j	800042e4 <__muldf3+0x50>
800043bc:	4481                	li	s1,0
800043be:	4a01                	li	s4,0
800043c0:	4b05                	li	s6,1
800043c2:	b70d                	j	800042e4 <__muldf3+0x50>
800043c4:	892a                	mv	s2,a0
800043c6:	4b0d                	li	s6,3
800043c8:	bf31                	j	800042e4 <__muldf3+0x50>
800043ca:	017467b3          	or	a5,s0,s7
800043ce:	cfb1                	beqz	a5,8000442a <__muldf3+0x196>
800043d0:	c805                	beqz	s0,80004400 <__muldf3+0x16c>
800043d2:	8522                	mv	a0,s0
800043d4:	191000ef          	jal	80004d64 <__clzsi2>
800043d8:	87aa                	mv	a5,a0
800043da:	ff550713          	addi	a4,a0,-11
800043de:	46f5                	li	a3,29
800043e0:	ff878613          	addi	a2,a5,-8 # 7fff8 <_noncacheable_size+0x3fff8>
800043e4:	8e99                	sub	a3,a3,a4
800043e6:	00c41433          	sll	s0,s0,a2
800043ea:	00dbd6b3          	srl	a3,s7,a3
800043ee:	8ec1                	or	a3,a3,s0
800043f0:	00cb9433          	sll	s0,s7,a2
800043f4:	c0d00713          	li	a4,-1011
800043f8:	8f1d                	sub	a4,a4,a5
800043fa:	87a2                	mv	a5,s0
800043fc:	8436                	mv	s0,a3
800043fe:	bf21                	j	80004316 <__muldf3+0x82>
80004400:	855e                	mv	a0,s7
80004402:	163000ef          	jal	80004d64 <__clzsi2>
80004406:	01550713          	addi	a4,a0,21
8000440a:	46f1                	li	a3,28
8000440c:	02050793          	addi	a5,a0,32
80004410:	fce6d7e3          	bge	a3,a4,800043de <__muldf3+0x14a>
80004414:	ff850693          	addi	a3,a0,-8
80004418:	00db96b3          	sll	a3,s7,a3
8000441c:	bfe1                	j	800043f4 <__muldf3+0x160>
8000441e:	017467b3          	or	a5,s0,s7
80004422:	eb81                	bnez	a5,80004432 <__muldf3+0x19e>
80004424:	4401                	li	s0,0
80004426:	4809                	li	a6,2
80004428:	bdc5                	j	80004318 <__muldf3+0x84>
8000442a:	4401                	li	s0,0
8000442c:	4701                	li	a4,0
8000442e:	4805                	li	a6,1
80004430:	b5e5                	j	80004318 <__muldf3+0x84>
80004432:	87de                	mv	a5,s7
80004434:	480d                	li	a6,3
80004436:	b5cd                	j	80004318 <__muldf3+0x84>
80004438:	00e69733          	sll	a4,a3,a4
8000443c:	53077693          	andi	a3,a4,1328
80004440:	1e069b63          	bnez	a3,80004636 <__muldf3+0x3a2>
80004444:	6605                	lui	a2,0x1
80004446:	88860613          	addi	a2,a2,-1912 # 888 <__ramfunc_end__+0x450>
8000444a:	8e79                	and	a2,a2,a4
8000444c:	1e061363          	bnez	a2,80004632 <__muldf3+0x39e>
80004450:	24077713          	andi	a4,a4,576
80004454:	cf19                	beqz	a4,80004472 <__muldf3+0x1de>
80004456:	00080437          	lui	s0,0x80
8000445a:	a801                	j	8000446a <__muldf3+0x1d6>
8000445c:	47bd                	li	a5,15
8000445e:	85d6                	mv	a1,s5
80004460:	1cf71b63          	bne	a4,a5,80004636 <__muldf3+0x3a2>
80004464:	00080437          	lui	s0,0x80
80004468:	4601                	li	a2,0
8000446a:	7ff00713          	li	a4,2047
8000446e:	4581                	li	a1,0
80004470:	aa69                	j	8000460a <__muldf3+0x376>
80004472:	01095893          	srli	a7,s2,0x10
80004476:	01079e13          	slli	t3,a5,0x10
8000447a:	0942                	slli	s2,s2,0x10
8000447c:	0107d613          	srli	a2,a5,0x10
80004480:	01095913          	srli	s2,s2,0x10
80004484:	010e5e13          	srli	t3,t3,0x10
80004488:	03c907b3          	mul	a5,s2,t3
8000448c:	03c88333          	mul	t1,a7,t3
80004490:	0107d813          	srli	a6,a5,0x10
80004494:	03260733          	mul	a4,a2,s2
80004498:	02c886b3          	mul	a3,a7,a2
8000449c:	971a                	add	a4,a4,t1
8000449e:	983a                	add	a6,a6,a4
800044a0:	00687463          	bgeu	a6,t1,800044a8 <__muldf3+0x214>
800044a4:	6741                	lui	a4,0x10
800044a6:	96ba                	add	a3,a3,a4
800044a8:	01045713          	srli	a4,s0,0x10
800044ac:	07c2                	slli	a5,a5,0x10
800044ae:	0442                	slli	s0,s0,0x10
800044b0:	83c1                	srli	a5,a5,0x10
800044b2:	8041                	srli	s0,s0,0x10
800044b4:	01085f93          	srli	t6,a6,0x10
800044b8:	0842                	slli	a6,a6,0x10
800044ba:	02890f33          	mul	t5,s2,s0
800044be:	983e                	add	a6,a6,a5
800044c0:	02e90933          	mul	s2,s2,a4
800044c4:	010f5313          	srli	t1,t5,0x10
800044c8:	028887b3          	mul	a5,a7,s0
800044cc:	02e888b3          	mul	a7,a7,a4
800044d0:	993e                	add	s2,s2,a5
800044d2:	934a                	add	t1,t1,s2
800044d4:	00f37463          	bgeu	t1,a5,800044dc <__muldf3+0x248>
800044d8:	67c1                	lui	a5,0x10
800044da:	98be                	add	a7,a7,a5
800044dc:	0f42                	slli	t5,t5,0x10
800044de:	010f5f13          	srli	t5,t5,0x10
800044e2:	01031793          	slli	a5,t1,0x10
800044e6:	97fa                	add	a5,a5,t5
800044e8:	0104df13          	srli	t5,s1,0x10
800044ec:	04c2                	slli	s1,s1,0x10
800044ee:	80c1                	srli	s1,s1,0x10
800044f0:	029e02b3          	mul	t0,t3,s1
800044f4:	01035e93          	srli	t4,t1,0x10
800044f8:	9ec6                	add	t4,t4,a7
800044fa:	9fbe                	add	t6,t6,a5
800044fc:	03ee0e33          	mul	t3,t3,t5
80004500:	0102d893          	srli	a7,t0,0x10
80004504:	03e603b3          	mul	t2,a2,t5
80004508:	02960633          	mul	a2,a2,s1
8000450c:	9672                	add	a2,a2,t3
8000450e:	98b2                	add	a7,a7,a2
80004510:	01c8f463          	bgeu	a7,t3,80004518 <__muldf3+0x284>
80004514:	6641                	lui	a2,0x10
80004516:	93b2                	add	t2,t2,a2
80004518:	02940633          	mul	a2,s0,s1
8000451c:	02c2                	slli	t0,t0,0x10
8000451e:	0108d313          	srli	t1,a7,0x10
80004522:	0102d293          	srli	t0,t0,0x10
80004526:	08c2                	slli	a7,a7,0x10
80004528:	931e                	add	t1,t1,t2
8000452a:	9896                	add	a7,a7,t0
8000452c:	03e40433          	mul	s0,s0,t5
80004530:	01065e13          	srli	t3,a2,0x10
80004534:	03e70f33          	mul	t5,a4,t5
80004538:	02970733          	mul	a4,a4,s1
8000453c:	9722                	add	a4,a4,s0
8000453e:	9e3a                	add	t3,t3,a4
80004540:	008e7463          	bgeu	t3,s0,80004548 <__muldf3+0x2b4>
80004544:	6741                	lui	a4,0x10
80004546:	9f3a                	add	t5,t5,a4
80004548:	0642                	slli	a2,a2,0x10
8000454a:	010e1713          	slli	a4,t3,0x10
8000454e:	8241                	srli	a2,a2,0x10
80004550:	96fe                	add	a3,a3,t6
80004552:	9732                	add	a4,a4,a2
80004554:	9eba                	add	t4,t4,a4
80004556:	00f6b7b3          	sltu	a5,a3,a5
8000455a:	97f6                	add	a5,a5,t4
8000455c:	98b6                	add	a7,a7,a3
8000455e:	933e                	add	t1,t1,a5
80004560:	00d8b6b3          	sltu	a3,a7,a3
80004564:	00eeb633          	sltu	a2,t4,a4
80004568:	969a                	add	a3,a3,t1
8000456a:	01d7beb3          	sltu	t4,a5,t4
8000456e:	00f33733          	sltu	a4,t1,a5
80004572:	01d66633          	or	a2,a2,t4
80004576:	0066b333          	sltu	t1,a3,t1
8000457a:	010e5e13          	srli	t3,t3,0x10
8000457e:	00989793          	slli	a5,a7,0x9
80004582:	9672                	add	a2,a2,t3
80004584:	00676733          	or	a4,a4,t1
80004588:	9732                	add	a4,a4,a2
8000458a:	0107e7b3          	or	a5,a5,a6
8000458e:	977a                	add	a4,a4,t5
80004590:	00f037b3          	snez	a5,a5
80004594:	0178d893          	srli	a7,a7,0x17
80004598:	0726                	slli	a4,a4,0x9
8000459a:	0176d413          	srli	s0,a3,0x17
8000459e:	0117e7b3          	or	a5,a5,a7
800045a2:	06a6                	slli	a3,a3,0x9
800045a4:	8fd5                	or	a5,a5,a3
800045a6:	00771693          	slli	a3,a4,0x7
800045aa:	8c59                	or	s0,s0,a4
800045ac:	0806d863          	bgez	a3,8000463c <__muldf3+0x3a8>
800045b0:	0017d713          	srli	a4,a5,0x1
800045b4:	8b85                	andi	a5,a5,1
800045b6:	8f5d                	or	a4,a4,a5
800045b8:	01f41793          	slli	a5,s0,0x1f
800045bc:	8fd9                	or	a5,a5,a4
800045be:	8005                	srli	s0,s0,0x1
800045c0:	3ff50713          	addi	a4,a0,1023
800045c4:	06e05e63          	blez	a4,80004640 <__muldf3+0x3ac>
800045c8:	0077f693          	andi	a3,a5,7
800045cc:	ce81                	beqz	a3,800045e4 <__muldf3+0x350>
800045ce:	00f7f693          	andi	a3,a5,15
800045d2:	4611                	li	a2,4
800045d4:	00c68863          	beq	a3,a2,800045e4 <__muldf3+0x350>
800045d8:	00c786b3          	add	a3,a5,a2
800045dc:	00f6b633          	sltu	a2,a3,a5
800045e0:	9432                	add	s0,s0,a2
800045e2:	87b6                	mv	a5,a3
800045e4:	00741693          	slli	a3,s0,0x7
800045e8:	0006d863          	bgez	a3,800045f8 <__muldf3+0x364>
800045ec:	ff000737          	lui	a4,0xff000
800045f0:	177d                	addi	a4,a4,-1 # feffffff <__fast_load_addr__+0x7eff1e3f>
800045f2:	8c79                	and	s0,s0,a4
800045f4:	40050713          	addi	a4,a0,1024
800045f8:	7fe00693          	li	a3,2046
800045fc:	0ce6c863          	blt	a3,a4,800046cc <__muldf3+0x438>
80004600:	01d41613          	slli	a2,s0,0x1d
80004604:	838d                	srli	a5,a5,0x3
80004606:	8e5d                	or	a2,a2,a5
80004608:	800d                	srli	s0,s0,0x3
8000460a:	0432                	slli	s0,s0,0xc
8000460c:	8031                	srli	s0,s0,0xc
8000460e:	0752                	slli	a4,a4,0x14
80004610:	50b2                	lw	ra,44(sp)
80004612:	8f41                	or	a4,a4,s0
80004614:	5422                	lw	s0,40(sp)
80004616:	05fe                	slli	a1,a1,0x1f
80004618:	00b767b3          	or	a5,a4,a1
8000461c:	5492                	lw	s1,36(sp)
8000461e:	5902                	lw	s2,32(sp)
80004620:	49f2                	lw	s3,28(sp)
80004622:	4a62                	lw	s4,24(sp)
80004624:	4ad2                	lw	s5,20(sp)
80004626:	4b42                	lw	s6,16(sp)
80004628:	4bb2                	lw	s7,12(sp)
8000462a:	8532                	mv	a0,a2
8000462c:	85be                	mv	a1,a5
8000462e:	6145                	addi	sp,sp,48
80004630:	8082                	ret
80004632:	85ce                	mv	a1,s3
80004634:	b329                	j	8000433e <__muldf3+0xaa>
80004636:	8426                	mv	s0,s1
80004638:	87ca                	mv	a5,s2
8000463a:	b319                	j	80004340 <__muldf3+0xac>
8000463c:	8552                	mv	a0,s4
8000463e:	b749                	j	800045c0 <__muldf3+0x32c>
80004640:	c335                	beqz	a4,800046a4 <__muldf3+0x410>
80004642:	fc900693          	li	a3,-55
80004646:	d0d746e3          	blt	a4,a3,80004352 <__muldf3+0xbe>
8000464a:	5689                	li	a3,-30
8000464c:	04d74e63          	blt	a4,a3,800046a8 <__muldf3+0x414>
80004650:	4685                	li	a3,1
80004652:	40e68733          	sub	a4,a3,a4
80004656:	41e50513          	addi	a0,a0,1054
8000465a:	00e7d6b3          	srl	a3,a5,a4
8000465e:	00a797b3          	sll	a5,a5,a0
80004662:	00f037b3          	snez	a5,a5
80004666:	00a41533          	sll	a0,s0,a0
8000466a:	8fc9                	or	a5,a5,a0
8000466c:	8fd5                	or	a5,a5,a3
8000466e:	00e45433          	srl	s0,s0,a4
80004672:	0077f713          	andi	a4,a5,7
80004676:	cf01                	beqz	a4,8000468e <__muldf3+0x3fa>
80004678:	00f7f713          	andi	a4,a5,15
8000467c:	4691                	li	a3,4
8000467e:	00d70863          	beq	a4,a3,8000468e <__muldf3+0x3fa>
80004682:	00d78733          	add	a4,a5,a3
80004686:	00f736b3          	sltu	a3,a4,a5
8000468a:	9436                	add	s0,s0,a3
8000468c:	87ba                	mv	a5,a4
8000468e:	00841713          	slli	a4,s0,0x8
80004692:	04074263          	bltz	a4,800046d6 <__muldf3+0x442>
80004696:	01d41613          	slli	a2,s0,0x1d
8000469a:	838d                	srli	a5,a5,0x3
8000469c:	8e5d                	or	a2,a2,a5
8000469e:	800d                	srli	s0,s0,0x3
800046a0:	4701                	li	a4,0
800046a2:	b7a5                	j	8000460a <__muldf3+0x376>
800046a4:	4705                	li	a4,1
800046a6:	bf45                	j	80004656 <__muldf3+0x3c2>
800046a8:	5805                	li	a6,-31
800046aa:	40e806b3          	sub	a3,a6,a4
800046ae:	00d456b3          	srl	a3,s0,a3
800046b2:	4601                	li	a2,0
800046b4:	01070663          	beq	a4,a6,800046c0 <__muldf3+0x42c>
800046b8:	43e50513          	addi	a0,a0,1086
800046bc:	00a41633          	sll	a2,s0,a0
800046c0:	8fd1                	or	a5,a5,a2
800046c2:	00f037b3          	snez	a5,a5
800046c6:	8fd5                	or	a5,a5,a3
800046c8:	4401                	li	s0,0
800046ca:	b765                	j	80004672 <__muldf3+0x3de>
800046cc:	4401                	li	s0,0
800046ce:	4601                	li	a2,0
800046d0:	7ff00713          	li	a4,2047
800046d4:	bf1d                	j	8000460a <__muldf3+0x376>
800046d6:	4401                	li	s0,0
800046d8:	4601                	li	a2,0
800046da:	4705                	li	a4,1
800046dc:	b73d                	j	8000460a <__muldf3+0x376>

800046de <__subdf3>:
800046de:	1101                	addi	sp,sp,-32
800046e0:	0145d713          	srli	a4,a1,0x14
800046e4:	00c59793          	slli	a5,a1,0xc
800046e8:	cc22                	sw	s0,24(sp)
800046ea:	83a5                	srli	a5,a5,0x9
800046ec:	7ff77413          	andi	s0,a4,2047
800046f0:	01d55713          	srli	a4,a0,0x1d
800046f4:	8fd9                	or	a5,a5,a4
800046f6:	00c69713          	slli	a4,a3,0xc
800046fa:	0146d893          	srli	a7,a3,0x14
800046fe:	ca26                	sw	s1,20(sp)
80004700:	8325                	srli	a4,a4,0x9
80004702:	01f5d493          	srli	s1,a1,0x1f
80004706:	01d65593          	srli	a1,a2,0x1d
8000470a:	8f4d                	or	a4,a4,a1
8000470c:	ce06                	sw	ra,28(sp)
8000470e:	c84a                	sw	s2,16(sp)
80004710:	c64e                	sw	s3,12(sp)
80004712:	7ff8f893          	andi	a7,a7,2047
80004716:	7ff00593          	li	a1,2047
8000471a:	050e                	slli	a0,a0,0x3
8000471c:	82fd                	srli	a3,a3,0x1f
8000471e:	060e                	slli	a2,a2,0x3
80004720:	00b89563          	bne	a7,a1,8000472a <__subdf3+0x4c>
80004724:	00c765b3          	or	a1,a4,a2
80004728:	e199                	bnez	a1,8000472e <__subdf3+0x50>
8000472a:	0016c693          	xori	a3,a3,1
8000472e:	41140833          	sub	a6,s0,a7
80004732:	7ff00313          	li	t1,2047
80004736:	24969863          	bne	a3,s1,80004986 <__subdf3+0x2a8>
8000473a:	11005963          	blez	a6,8000484c <__subdf3+0x16e>
8000473e:	06089563          	bnez	a7,800047a8 <__subdf3+0xca>
80004742:	00c766b3          	or	a3,a4,a2
80004746:	ce91                	beqz	a3,80004762 <__subdf3+0x84>
80004748:	fff40813          	addi	a6,s0,-1 # 7ffff <_noncacheable_size+0x3ffff>
8000474c:	00081963          	bnez	a6,8000475e <__subdf3+0x80>
80004750:	962a                	add	a2,a2,a0
80004752:	97ba                	add	a5,a5,a4
80004754:	00a63533          	sltu	a0,a2,a0
80004758:	97aa                	add	a5,a5,a0
8000475a:	4405                	li	s0,1
8000475c:	a851                	j	800047f0 <__subdf3+0x112>
8000475e:	04641a63          	bne	s0,t1,800047b2 <__subdf3+0xd4>
80004762:	01d79693          	slli	a3,a5,0x1d
80004766:	810d                	srli	a0,a0,0x3
80004768:	7ff00713          	li	a4,2047
8000476c:	8ec9                	or	a3,a3,a0
8000476e:	838d                	srli	a5,a5,0x3
80004770:	00e41963          	bne	s0,a4,80004782 <__subdf3+0xa4>
80004774:	8edd                	or	a3,a3,a5
80004776:	4781                	li	a5,0
80004778:	c689                	beqz	a3,80004782 <__subdf3+0xa4>
8000477a:	000807b7          	lui	a5,0x80
8000477e:	4681                	li	a3,0
80004780:	4481                	li	s1,0
80004782:	7ff47713          	andi	a4,s0,2047
80004786:	07b2                	slli	a5,a5,0xc
80004788:	40f2                	lw	ra,28(sp)
8000478a:	4462                	lw	s0,24(sp)
8000478c:	83b1                	srli	a5,a5,0xc
8000478e:	0752                	slli	a4,a4,0x14
80004790:	01f49593          	slli	a1,s1,0x1f
80004794:	8f5d                	or	a4,a4,a5
80004796:	00b767b3          	or	a5,a4,a1
8000479a:	44d2                	lw	s1,20(sp)
8000479c:	4942                	lw	s2,16(sp)
8000479e:	49b2                	lw	s3,12(sp)
800047a0:	8536                	mv	a0,a3
800047a2:	85be                	mv	a1,a5
800047a4:	6105                	addi	sp,sp,32
800047a6:	8082                	ret
800047a8:	20640563          	beq	s0,t1,800049b2 <__subdf3+0x2d4>
800047ac:	008006b7          	lui	a3,0x800
800047b0:	8f55                	or	a4,a4,a3
800047b2:	03800693          	li	a3,56
800047b6:	0906c663          	blt	a3,a6,80004842 <__subdf3+0x164>
800047ba:	46fd                	li	a3,31
800047bc:	02000893          	li	a7,32
800047c0:	0506ce63          	blt	a3,a6,8000481c <__subdf3+0x13e>
800047c4:	410888b3          	sub	a7,a7,a6
800047c8:	011716b3          	sll	a3,a4,a7
800047cc:	010655b3          	srl	a1,a2,a6
800047d0:	011618b3          	sll	a7,a2,a7
800047d4:	8ecd                	or	a3,a3,a1
800047d6:	011038b3          	snez	a7,a7
800047da:	0116e6b3          	or	a3,a3,a7
800047de:	01075833          	srl	a6,a4,a6
800047e2:	00a68633          	add	a2,a3,a0
800047e6:	983e                	add	a6,a6,a5
800047e8:	00d636b3          	sltu	a3,a2,a3
800047ec:	00d807b3          	add	a5,a6,a3
800047f0:	00879713          	slli	a4,a5,0x8
800047f4:	16075663          	bgez	a4,80004960 <__subdf3+0x282>
800047f8:	0405                	addi	s0,s0,1
800047fa:	7ff00713          	li	a4,2047
800047fe:	48e40163          	beq	s0,a4,80004c80 <__subdf3+0x5a2>
80004802:	ff800737          	lui	a4,0xff800
80004806:	177d                	addi	a4,a4,-1 # ff7fffff <__fast_load_addr__+0x7f7f1e3f>
80004808:	8ff9                	and	a5,a5,a4
8000480a:	00165713          	srli	a4,a2,0x1
8000480e:	8a05                	andi	a2,a2,1
80004810:	8f51                	or	a4,a4,a2
80004812:	01f79613          	slli	a2,a5,0x1f
80004816:	8e59                	or	a2,a2,a4
80004818:	8385                	srli	a5,a5,0x1
8000481a:	a299                	j	80004960 <__subdf3+0x282>
8000481c:	fe080693          	addi	a3,a6,-32
80004820:	00d756b3          	srl	a3,a4,a3
80004824:	4581                	li	a1,0
80004826:	01180863          	beq	a6,a7,80004836 <__subdf3+0x158>
8000482a:	04000593          	li	a1,64
8000482e:	410585b3          	sub	a1,a1,a6
80004832:	00b715b3          	sll	a1,a4,a1
80004836:	8dd1                	or	a1,a1,a2
80004838:	00b035b3          	snez	a1,a1
8000483c:	8ecd                	or	a3,a3,a1
8000483e:	4801                	li	a6,0
80004840:	b74d                	j	800047e2 <__subdf3+0x104>
80004842:	00c766b3          	or	a3,a4,a2
80004846:	00d036b3          	snez	a3,a3
8000484a:	bfd5                	j	8000483e <__subdf3+0x160>
8000484c:	0a080463          	beqz	a6,800048f4 <__subdf3+0x216>
80004850:	408886b3          	sub	a3,a7,s0
80004854:	ec39                	bnez	s0,800048b2 <__subdf3+0x1d4>
80004856:	00a7e5b3          	or	a1,a5,a0
8000485a:	e589                	bnez	a1,80004864 <__subdf3+0x186>
8000485c:	87ba                	mv	a5,a4
8000485e:	8532                	mv	a0,a2
80004860:	8436                	mv	s0,a3
80004862:	b701                	j	80004762 <__subdf3+0x84>
80004864:	fff68593          	addi	a1,a3,-1 # 7fffff <_stack+0x777fff>
80004868:	ee0584e3          	beqz	a1,80004750 <__subdf3+0x72>
8000486c:	fe6688e3          	beq	a3,t1,8000485c <__subdf3+0x17e>
80004870:	03800693          	li	a3,56
80004874:	06b6cb63          	blt	a3,a1,800048ea <__subdf3+0x20c>
80004878:	46fd                	li	a3,31
8000487a:	02000313          	li	t1,32
8000487e:	04b6c163          	blt	a3,a1,800048c0 <__subdf3+0x1e2>
80004882:	40b30333          	sub	t1,t1,a1
80004886:	006796b3          	sll	a3,a5,t1
8000488a:	00b55833          	srl	a6,a0,a1
8000488e:	00651333          	sll	t1,a0,t1
80004892:	0106e6b3          	or	a3,a3,a6
80004896:	00603333          	snez	t1,t1
8000489a:	0066e6b3          	or	a3,a3,t1
8000489e:	00b7d5b3          	srl	a1,a5,a1
800048a2:	9636                	add	a2,a2,a3
800048a4:	95ba                	add	a1,a1,a4
800048a6:	00d636b3          	sltu	a3,a2,a3
800048aa:	00d587b3          	add	a5,a1,a3
800048ae:	8446                	mv	s0,a7
800048b0:	b781                	j	800047f0 <__subdf3+0x112>
800048b2:	3c688d63          	beq	a7,t1,80004c8c <__subdf3+0x5ae>
800048b6:	008005b7          	lui	a1,0x800
800048ba:	8fcd                	or	a5,a5,a1
800048bc:	85b6                	mv	a1,a3
800048be:	bf4d                	j	80004870 <__subdf3+0x192>
800048c0:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_stack+0x777fe0>
800048c4:	00d7d6b3          	srl	a3,a5,a3
800048c8:	4801                	li	a6,0
800048ca:	00658863          	beq	a1,t1,800048da <__subdf3+0x1fc>
800048ce:	04000813          	li	a6,64
800048d2:	40b80833          	sub	a6,a6,a1
800048d6:	01079833          	sll	a6,a5,a6
800048da:	00a86833          	or	a6,a6,a0
800048de:	01003833          	snez	a6,a6
800048e2:	0106e6b3          	or	a3,a3,a6
800048e6:	4581                	li	a1,0
800048e8:	bf6d                	j	800048a2 <__subdf3+0x1c4>
800048ea:	00a7e6b3          	or	a3,a5,a0
800048ee:	00d036b3          	snez	a3,a3
800048f2:	bfd5                	j	800048e6 <__subdf3+0x208>
800048f4:	00140693          	addi	a3,s0,1
800048f8:	7fe6f593          	andi	a1,a3,2046
800048fc:	e5a9                	bnez	a1,80004946 <__subdf3+0x268>
800048fe:	00a7e6b3          	or	a3,a5,a0
80004902:	e41d                	bnez	s0,80004930 <__subdf3+0x252>
80004904:	34068e63          	beqz	a3,80004c60 <__subdf3+0x582>
80004908:	00c766b3          	or	a3,a4,a2
8000490c:	34068c63          	beqz	a3,80004c64 <__subdf3+0x586>
80004910:	962a                	add	a2,a2,a0
80004912:	97ba                	add	a5,a5,a4
80004914:	00a63533          	sltu	a0,a2,a0
80004918:	97aa                	add	a5,a5,a0
8000491a:	00879713          	slli	a4,a5,0x8
8000491e:	22075c63          	bgez	a4,80004b56 <__subdf3+0x478>
80004922:	ff800737          	lui	a4,0xff800
80004926:	177d                	addi	a4,a4,-1 # ff7fffff <__fast_load_addr__+0x7f7f1e3f>
80004928:	8ff9                	and	a5,a5,a4
8000492a:	8532                	mv	a0,a2
8000492c:	4405                	li	s0,1
8000492e:	bd15                	j	80004762 <__subdf3+0x84>
80004930:	34068e63          	beqz	a3,80004c8c <__subdf3+0x5ae>
80004934:	8f51                	or	a4,a4,a2
80004936:	841a                	mv	s0,t1
80004938:	e20705e3          	beqz	a4,80004762 <__subdf3+0x84>
8000493c:	4481                	li	s1,0
8000493e:	004007b7          	lui	a5,0x400
80004942:	4501                	li	a0,0
80004944:	bd39                	j	80004762 <__subdf3+0x84>
80004946:	32668c63          	beq	a3,t1,80004c7e <__subdf3+0x5a0>
8000494a:	962a                	add	a2,a2,a0
8000494c:	97ba                	add	a5,a5,a4
8000494e:	00a63533          	sltu	a0,a2,a0
80004952:	97aa                	add	a5,a5,a0
80004954:	01f79713          	slli	a4,a5,0x1f
80004958:	8205                	srli	a2,a2,0x1
8000495a:	8e59                	or	a2,a2,a4
8000495c:	8385                	srli	a5,a5,0x1
8000495e:	8436                	mv	s0,a3
80004960:	00767713          	andi	a4,a2,7
80004964:	30071263          	bnez	a4,80004c68 <__subdf3+0x58a>
80004968:	8532                	mv	a0,a2
8000496a:	00879713          	slli	a4,a5,0x8
8000496e:	de075ae3          	bgez	a4,80004762 <__subdf3+0x84>
80004972:	0405                	addi	s0,s0,1
80004974:	7ff00713          	li	a4,2047
80004978:	30e40463          	beq	s0,a4,80004c80 <__subdf3+0x5a2>
8000497c:	ff800737          	lui	a4,0xff800
80004980:	177d                	addi	a4,a4,-1 # ff7fffff <__fast_load_addr__+0x7f7f1e3f>
80004982:	8ff9                	and	a5,a5,a4
80004984:	bbf9                	j	80004762 <__subdf3+0x84>
80004986:	0d005063          	blez	a6,80004a46 <__subdf3+0x368>
8000498a:	02089763          	bnez	a7,800049b8 <__subdf3+0x2da>
8000498e:	00c766b3          	or	a3,a4,a2
80004992:	dc0688e3          	beqz	a3,80004762 <__subdf3+0x84>
80004996:	fff40813          	addi	a6,s0,-1
8000499a:	00081a63          	bnez	a6,800049ae <__subdf3+0x2d0>
8000499e:	40c50633          	sub	a2,a0,a2
800049a2:	8f99                	sub	a5,a5,a4
800049a4:	00c53533          	sltu	a0,a0,a2
800049a8:	8f89                	sub	a5,a5,a0
800049aa:	4405                	li	s0,1
800049ac:	a899                	j	80004a02 <__subdf3+0x324>
800049ae:	00641a63          	bne	s0,t1,800049c2 <__subdf3+0x2e4>
800049b2:	7ff00413          	li	s0,2047
800049b6:	b375                	j	80004762 <__subdf3+0x84>
800049b8:	da6405e3          	beq	s0,t1,80004762 <__subdf3+0x84>
800049bc:	008006b7          	lui	a3,0x800
800049c0:	8f55                	or	a4,a4,a3
800049c2:	03800693          	li	a3,56
800049c6:	0706cb63          	blt	a3,a6,80004a3c <__subdf3+0x35e>
800049ca:	46fd                	li	a3,31
800049cc:	02000893          	li	a7,32
800049d0:	0506c363          	blt	a3,a6,80004a16 <__subdf3+0x338>
800049d4:	410888b3          	sub	a7,a7,a6
800049d8:	011716b3          	sll	a3,a4,a7
800049dc:	010655b3          	srl	a1,a2,a6
800049e0:	011618b3          	sll	a7,a2,a7
800049e4:	8ecd                	or	a3,a3,a1
800049e6:	011038b3          	snez	a7,a7
800049ea:	0116e6b3          	or	a3,a3,a7
800049ee:	01075833          	srl	a6,a4,a6
800049f2:	40d50633          	sub	a2,a0,a3
800049f6:	41078833          	sub	a6,a5,a6
800049fa:	00c53533          	sltu	a0,a0,a2
800049fe:	40a807b3          	sub	a5,a6,a0
80004a02:	00879713          	slli	a4,a5,0x8
80004a06:	f4075de3          	bgez	a4,80004960 <__subdf3+0x282>
80004a0a:	00979913          	slli	s2,a5,0x9
80004a0e:	00995913          	srli	s2,s2,0x9
80004a12:	89b2                	mv	s3,a2
80004a14:	a245                	j	80004bb4 <__subdf3+0x4d6>
80004a16:	fe080693          	addi	a3,a6,-32
80004a1a:	00d756b3          	srl	a3,a4,a3
80004a1e:	4581                	li	a1,0
80004a20:	01180863          	beq	a6,a7,80004a30 <__subdf3+0x352>
80004a24:	04000593          	li	a1,64
80004a28:	410585b3          	sub	a1,a1,a6
80004a2c:	00b715b3          	sll	a1,a4,a1
80004a30:	8dd1                	or	a1,a1,a2
80004a32:	00b035b3          	snez	a1,a1
80004a36:	8ecd                	or	a3,a3,a1
80004a38:	4801                	li	a6,0
80004a3a:	bf65                	j	800049f2 <__subdf3+0x314>
80004a3c:	00c766b3          	or	a3,a4,a2
80004a40:	00d036b3          	snez	a3,a3
80004a44:	bfd5                	j	80004a38 <__subdf3+0x35a>
80004a46:	0c080163          	beqz	a6,80004b08 <__subdf3+0x42a>
80004a4a:	40888833          	sub	a6,a7,s0
80004a4e:	ec2d                	bnez	s0,80004ac8 <__subdf3+0x3ea>
80004a50:	00a7e5b3          	or	a1,a5,a0
80004a54:	e591                	bnez	a1,80004a60 <__subdf3+0x382>
80004a56:	84b6                	mv	s1,a3
80004a58:	87ba                	mv	a5,a4
80004a5a:	8532                	mv	a0,a2
80004a5c:	8442                	mv	s0,a6
80004a5e:	b311                	j	80004762 <__subdf3+0x84>
80004a60:	fff80593          	addi	a1,a6,-1
80004a64:	e999                	bnez	a1,80004a7a <__subdf3+0x39c>
80004a66:	40a60533          	sub	a0,a2,a0
80004a6a:	00a635b3          	sltu	a1,a2,a0
80004a6e:	40f707b3          	sub	a5,a4,a5
80004a72:	862a                	mv	a2,a0
80004a74:	8f8d                	sub	a5,a5,a1
80004a76:	84b6                	mv	s1,a3
80004a78:	bf0d                	j	800049aa <__subdf3+0x2cc>
80004a7a:	fc680ee3          	beq	a6,t1,80004a56 <__subdf3+0x378>
80004a7e:	03800813          	li	a6,56
80004a82:	06b84f63          	blt	a6,a1,80004b00 <__subdf3+0x422>
80004a86:	487d                	li	a6,31
80004a88:	02000e13          	li	t3,32
80004a8c:	04b84563          	blt	a6,a1,80004ad6 <__subdf3+0x3f8>
80004a90:	40be0e33          	sub	t3,t3,a1
80004a94:	00b55333          	srl	t1,a0,a1
80004a98:	01c79833          	sll	a6,a5,t3
80004a9c:	01c51e33          	sll	t3,a0,t3
80004aa0:	00686833          	or	a6,a6,t1
80004aa4:	01c03e33          	snez	t3,t3
80004aa8:	01c86533          	or	a0,a6,t3
80004aac:	00b7d5b3          	srl	a1,a5,a1
80004ab0:	40a60533          	sub	a0,a2,a0
80004ab4:	00a637b3          	sltu	a5,a2,a0
80004ab8:	40b705b3          	sub	a1,a4,a1
80004abc:	862a                	mv	a2,a0
80004abe:	40f587b3          	sub	a5,a1,a5
80004ac2:	8446                	mv	s0,a7
80004ac4:	84b6                	mv	s1,a3
80004ac6:	bf35                	j	80004a02 <__subdf3+0x324>
80004ac8:	1c688163          	beq	a7,t1,80004c8a <__subdf3+0x5ac>
80004acc:	008005b7          	lui	a1,0x800
80004ad0:	8fcd                	or	a5,a5,a1
80004ad2:	85c2                	mv	a1,a6
80004ad4:	b76d                	j	80004a7e <__subdf3+0x3a0>
80004ad6:	fe058813          	addi	a6,a1,-32 # 7fffe0 <_stack+0x777fe0>
80004ada:	0107d833          	srl	a6,a5,a6
80004ade:	4301                	li	t1,0
80004ae0:	01c58863          	beq	a1,t3,80004af0 <__subdf3+0x412>
80004ae4:	04000313          	li	t1,64
80004ae8:	40b30333          	sub	t1,t1,a1
80004aec:	00679333          	sll	t1,a5,t1
80004af0:	00a36333          	or	t1,t1,a0
80004af4:	00603333          	snez	t1,t1
80004af8:	00686533          	or	a0,a6,t1
80004afc:	4581                	li	a1,0
80004afe:	bf4d                	j	80004ab0 <__subdf3+0x3d2>
80004b00:	8d5d                	or	a0,a0,a5
80004b02:	00a03533          	snez	a0,a0
80004b06:	bfdd                	j	80004afc <__subdf3+0x41e>
80004b08:	00140593          	addi	a1,s0,1
80004b0c:	7fe5f593          	andi	a1,a1,2046
80004b10:	eda5                	bnez	a1,80004b88 <__subdf3+0x4aa>
80004b12:	00c765b3          	or	a1,a4,a2
80004b16:	00a7e833          	or	a6,a5,a0
80004b1a:	e831                	bnez	s0,80004b6e <__subdf3+0x490>
80004b1c:	00081663          	bnez	a6,80004b28 <__subdf3+0x44a>
80004b20:	87ba                	mv	a5,a4
80004b22:	e98d                	bnez	a1,80004b54 <__subdf3+0x476>
80004b24:	4481                	li	s1,0
80004b26:	aaa9                	j	80004c80 <__subdf3+0x5a2>
80004b28:	12058e63          	beqz	a1,80004c64 <__subdf3+0x586>
80004b2c:	40c50833          	sub	a6,a0,a2
80004b30:	010538b3          	sltu	a7,a0,a6
80004b34:	40e785b3          	sub	a1,a5,a4
80004b38:	411585b3          	sub	a1,a1,a7
80004b3c:	00859893          	slli	a7,a1,0x8
80004b40:	0208d063          	bgez	a7,80004b60 <__subdf3+0x482>
80004b44:	40a60533          	sub	a0,a2,a0
80004b48:	00a635b3          	sltu	a1,a2,a0
80004b4c:	40f707b3          	sub	a5,a4,a5
80004b50:	862a                	mv	a2,a0
80004b52:	8f8d                	sub	a5,a5,a1
80004b54:	84b6                	mv	s1,a3
80004b56:	00c7e533          	or	a0,a5,a2
80004b5a:	c95d                	beqz	a0,80004c10 <__subdf3+0x532>
80004b5c:	4401                	li	s0,0
80004b5e:	b509                	j	80004960 <__subdf3+0x282>
80004b60:	00b86533          	or	a0,a6,a1
80004b64:	12050063          	beqz	a0,80004c84 <__subdf3+0x5a6>
80004b68:	87ae                	mv	a5,a1
80004b6a:	8642                	mv	a2,a6
80004b6c:	b7ed                	j	80004b56 <__subdf3+0x478>
80004b6e:	00081963          	bnez	a6,80004b80 <__subdf3+0x4a2>
80004b72:	10059c63          	bnez	a1,80004c8a <__subdf3+0x5ac>
80004b76:	4481                	li	s1,0
80004b78:	4501                	li	a0,0
80004b7a:	004007b7          	lui	a5,0x400
80004b7e:	bd15                	j	800049b2 <__subdf3+0x2d4>
80004b80:	841a                	mv	s0,t1
80004b82:	be0580e3          	beqz	a1,80004762 <__subdf3+0x84>
80004b86:	bb5d                	j	8000493c <__subdf3+0x25e>
80004b88:	40c505b3          	sub	a1,a0,a2
80004b8c:	00b53833          	sltu	a6,a0,a1
80004b90:	40e78933          	sub	s2,a5,a4
80004b94:	41090933          	sub	s2,s2,a6
80004b98:	00891813          	slli	a6,s2,0x8
80004b9c:	89ae                	mv	s3,a1
80004b9e:	06085563          	bgez	a6,80004c08 <__subdf3+0x52a>
80004ba2:	40a609b3          	sub	s3,a2,a0
80004ba6:	40f70933          	sub	s2,a4,a5
80004baa:	01363633          	sltu	a2,a2,s3
80004bae:	40c90933          	sub	s2,s2,a2
80004bb2:	84b6                	mv	s1,a3
80004bb4:	06090163          	beqz	s2,80004c16 <__subdf3+0x538>
80004bb8:	854a                	mv	a0,s2
80004bba:	226d                	jal	80004d64 <__clzsi2>
80004bbc:	ff850713          	addi	a4,a0,-8
80004bc0:	02000793          	li	a5,32
80004bc4:	8f99                	sub	a5,a5,a4
80004bc6:	00e91933          	sll	s2,s2,a4
80004bca:	00f9d7b3          	srl	a5,s3,a5
80004bce:	0127e7b3          	or	a5,a5,s2
80004bd2:	00e99633          	sll	a2,s3,a4
80004bd6:	06874f63          	blt	a4,s0,80004c54 <__subdf3+0x576>
80004bda:	8f01                	sub	a4,a4,s0
80004bdc:	00170513          	addi	a0,a4,1
80004be0:	46fd                	li	a3,31
80004be2:	02000593          	li	a1,32
80004be6:	04a6c563          	blt	a3,a0,80004c30 <__subdf3+0x552>
80004bea:	8d89                	sub	a1,a1,a0
80004bec:	00b79733          	sll	a4,a5,a1
80004bf0:	00a656b3          	srl	a3,a2,a0
80004bf4:	00b615b3          	sll	a1,a2,a1
80004bf8:	8f55                	or	a4,a4,a3
80004bfa:	00b035b3          	snez	a1,a1
80004bfe:	00b76633          	or	a2,a4,a1
80004c02:	00a7d7b3          	srl	a5,a5,a0
80004c06:	bf81                	j	80004b56 <__subdf3+0x478>
80004c08:	0125e533          	or	a0,a1,s2
80004c0c:	f545                	bnez	a0,80004bb4 <__subdf3+0x4d6>
80004c0e:	4481                	li	s1,0
80004c10:	4781                	li	a5,0
80004c12:	4401                	li	s0,0
80004c14:	b6b9                	j	80004762 <__subdf3+0x84>
80004c16:	854e                	mv	a0,s3
80004c18:	22b1                	jal	80004d64 <__clzsi2>
80004c1a:	01850713          	addi	a4,a0,24
80004c1e:	47fd                	li	a5,31
80004c20:	fae7d0e3          	bge	a5,a4,80004bc0 <__subdf3+0x4e2>
80004c24:	ff850793          	addi	a5,a0,-8
80004c28:	00f997b3          	sll	a5,s3,a5
80004c2c:	4601                	li	a2,0
80004c2e:	b765                	j	80004bd6 <__subdf3+0x4f8>
80004c30:	1705                	addi	a4,a4,-31
80004c32:	00e7d733          	srl	a4,a5,a4
80004c36:	4681                	li	a3,0
80004c38:	00b50763          	beq	a0,a1,80004c46 <__subdf3+0x568>
80004c3c:	04000693          	li	a3,64
80004c40:	8e89                	sub	a3,a3,a0
80004c42:	00d796b3          	sll	a3,a5,a3
80004c46:	8ed1                	or	a3,a3,a2
80004c48:	00d036b3          	snez	a3,a3
80004c4c:	00d76633          	or	a2,a4,a3
80004c50:	4781                	li	a5,0
80004c52:	b711                	j	80004b56 <__subdf3+0x478>
80004c54:	8c19                	sub	s0,s0,a4
80004c56:	ff800737          	lui	a4,0xff800
80004c5a:	177d                	addi	a4,a4,-1 # ff7fffff <__fast_load_addr__+0x7f7f1e3f>
80004c5c:	8ff9                	and	a5,a5,a4
80004c5e:	b309                	j	80004960 <__subdf3+0x282>
80004c60:	87ba                	mv	a5,a4
80004c62:	bdd5                	j	80004b56 <__subdf3+0x478>
80004c64:	862a                	mv	a2,a0
80004c66:	bdc5                	j	80004b56 <__subdf3+0x478>
80004c68:	00f67713          	andi	a4,a2,15
80004c6c:	4691                	li	a3,4
80004c6e:	ced70de3          	beq	a4,a3,80004968 <__subdf3+0x28a>
80004c72:	00d60533          	add	a0,a2,a3
80004c76:	00c53633          	sltu	a2,a0,a2
80004c7a:	97b2                	add	a5,a5,a2
80004c7c:	b1fd                	j	8000496a <__subdf3+0x28c>
80004c7e:	8436                	mv	s0,a3
80004c80:	4781                	li	a5,0
80004c82:	b1c1                	j	80004942 <__subdf3+0x264>
80004c84:	4481                	li	s1,0
80004c86:	4781                	li	a5,0
80004c88:	bce9                	j	80004762 <__subdf3+0x84>
80004c8a:	84b6                	mv	s1,a3
80004c8c:	87ba                	mv	a5,a4
80004c8e:	8532                	mv	a0,a2
80004c90:	b30d                	j	800049b2 <__subdf3+0x2d4>

80004c92 <__fixunsdfsi>:
80004c92:	0145d713          	srli	a4,a1,0x14
80004c96:	00c59693          	slli	a3,a1,0xc
80004c9a:	7ff77713          	andi	a4,a4,2047
80004c9e:	3fe00793          	li	a5,1022
80004ca2:	862a                	mv	a2,a0
80004ca4:	82b1                	srli	a3,a3,0xc
80004ca6:	81fd                	srli	a1,a1,0x1f
80004ca8:	00e7c463          	blt	a5,a4,80004cb0 <__fixunsdfsi+0x1e>
80004cac:	4501                	li	a0,0
80004cae:	8082                	ret
80004cb0:	41f00793          	li	a5,1055
80004cb4:	8f8d                	sub	a5,a5,a1
80004cb6:	fff58513          	addi	a0,a1,-1
80004cba:	02f75a63          	bge	a4,a5,80004cee <__fixunsdfsi+0x5c>
80004cbe:	f5fd                	bnez	a1,80004cac <__fixunsdfsi+0x1a>
80004cc0:	001007b7          	lui	a5,0x100
80004cc4:	8fd5                	or	a5,a5,a3
80004cc6:	41300693          	li	a3,1043
80004cca:	00e6df63          	bge	a3,a4,80004ce8 <__fixunsdfsi+0x56>
80004cce:	bed70693          	addi	a3,a4,-1043
80004cd2:	00d797b3          	sll	a5,a5,a3
80004cd6:	43300693          	li	a3,1075
80004cda:	40e68733          	sub	a4,a3,a4
80004cde:	00e65633          	srl	a2,a2,a4
80004ce2:	00c7e533          	or	a0,a5,a2
80004ce6:	8082                	ret
80004ce8:	8e99                	sub	a3,a3,a4
80004cea:	00d7d533          	srl	a0,a5,a3
80004cee:	8082                	ret

80004cf0 <__floatunsidf>:
80004cf0:	1141                	addi	sp,sp,-16
80004cf2:	c422                	sw	s0,8(sp)
80004cf4:	c606                	sw	ra,12(sp)
80004cf6:	842a                	mv	s0,a0
80004cf8:	cd15                	beqz	a0,80004d34 <__floatunsidf+0x44>
80004cfa:	20ad                	jal	80004d64 <__clzsi2>
80004cfc:	41e00713          	li	a4,1054
80004d00:	47a9                	li	a5,10
80004d02:	8f09                	sub	a4,a4,a0
80004d04:	02a7c363          	blt	a5,a0,80004d2a <__floatunsidf+0x3a>
80004d08:	47ad                	li	a5,11
80004d0a:	8f89                	sub	a5,a5,a0
80004d0c:	0555                	addi	a0,a0,21
80004d0e:	00f457b3          	srl	a5,s0,a5
80004d12:	00a41433          	sll	s0,s0,a0
80004d16:	40b2                	lw	ra,12(sp)
80004d18:	8522                	mv	a0,s0
80004d1a:	4422                	lw	s0,8(sp)
80004d1c:	07b2                	slli	a5,a5,0xc
80004d1e:	0752                	slli	a4,a4,0x14
80004d20:	83b1                	srli	a5,a5,0xc
80004d22:	00f765b3          	or	a1,a4,a5
80004d26:	0141                	addi	sp,sp,16
80004d28:	8082                	ret
80004d2a:	1555                	addi	a0,a0,-11
80004d2c:	00a417b3          	sll	a5,s0,a0
80004d30:	4401                	li	s0,0
80004d32:	b7d5                	j	80004d16 <__floatunsidf+0x26>
80004d34:	4781                	li	a5,0
80004d36:	4701                	li	a4,0
80004d38:	bff9                	j	80004d16 <__floatunsidf+0x26>

80004d3a <__ashldi3>:
80004d3a:	ca09                	beqz	a2,80004d4c <__ashldi3+0x12>
80004d3c:	47fd                	li	a5,31
80004d3e:	00c7d863          	bge	a5,a2,80004d4e <__ashldi3+0x14>
80004d42:	1601                	addi	a2,a2,-32 # ffe0 <__fw_size__+0x4e20>
80004d44:	00c515b3          	sll	a1,a0,a2
80004d48:	4701                	li	a4,0
80004d4a:	853a                	mv	a0,a4
80004d4c:	8082                	ret
80004d4e:	02000793          	li	a5,32
80004d52:	8f91                	sub	a5,a5,a2
80004d54:	00c51733          	sll	a4,a0,a2
80004d58:	00c595b3          	sll	a1,a1,a2
80004d5c:	00f55533          	srl	a0,a0,a5
80004d60:	8dc9                	or	a1,a1,a0
80004d62:	b7e5                	j	80004d4a <__ashldi3+0x10>

80004d64 <__clzsi2>:
80004d64:	67c1                	lui	a5,0x10
80004d66:	02f57663          	bgeu	a0,a5,80004d92 <__clzsi2+0x2e>
80004d6a:	10053793          	sltiu	a5,a0,256
80004d6e:	0017b793          	seqz	a5,a5
80004d72:	078e                	slli	a5,a5,0x3
80004d74:	8000e737          	lui	a4,0x8000e
80004d78:	00f55533          	srl	a0,a0,a5
80004d7c:	8a870713          	addi	a4,a4,-1880 # 8000d8a8 <__clz_tab>
80004d80:	972a                	add	a4,a4,a0
80004d82:	00074503          	lbu	a0,0(a4)
80004d86:	02000693          	li	a3,32
80004d8a:	8e9d                	sub	a3,a3,a5
80004d8c:	40a68533          	sub	a0,a3,a0
80004d90:	8082                	ret
80004d92:	01000737          	lui	a4,0x1000
80004d96:	47e1                	li	a5,24
80004d98:	fce57ee3          	bgeu	a0,a4,80004d74 <__clzsi2+0x10>
80004d9c:	47c1                	li	a5,16
80004d9e:	bfd9                	j	80004d74 <__clzsi2+0x10>

80004da0 <memset>:
80004da0:	86aa                	mv	a3,a0
80004da2:	c611                	beqz	a2,80004dae <memset+0xe>
80004da4:	00b68023          	sb	a1,0(a3) # 800000 <_flash_size>
80004da8:	167d                	addi	a2,a2,-1
80004daa:	0685                	addi	a3,a3,1
80004dac:	fe65                	bnez	a2,80004da4 <memset+0x4>
80004dae:	8082                	ret

80004db0 <memcpy>:
80004db0:	86aa                	mv	a3,a0
80004db2:	ca09                	beqz	a2,80004dc4 <memcpy+0x14>
80004db4:	0005c703          	lbu	a4,0(a1)
80004db8:	00e68023          	sb	a4,0(a3)
80004dbc:	167d                	addi	a2,a2,-1
80004dbe:	0685                	addi	a3,a3,1
80004dc0:	0585                	addi	a1,a1,1
80004dc2:	fa6d                	bnez	a2,80004db4 <memcpy+0x4>
80004dc4:	8082                	ret

80004dc6 <memmove>:
80004dc6:	c205                	beqz	a2,80004de6 <memmove+0x20>
80004dc8:	872a                	mv	a4,a0
80004dca:	4685                	li	a3,1
80004dcc:	00b56763          	bltu	a0,a1,80004dda <memmove+0x14>
80004dd0:	56fd                	li	a3,-1
80004dd2:	9732                	add	a4,a4,a2
80004dd4:	95b2                	add	a1,a1,a2
80004dd6:	9736                	add	a4,a4,a3
80004dd8:	95b6                	add	a1,a1,a3
80004dda:	0005c783          	lbu	a5,0(a1)
80004dde:	167d                	addi	a2,a2,-1
80004de0:	00f70023          	sb	a5,0(a4) # 1000000 <_extram_size>
80004de4:	fa6d                	bnez	a2,80004dd6 <memmove+0x10>
80004de6:	8082                	ret

80004de8 <__eqdf2>:
80004de8:	0145d813          	srli	a6,a1,0x14
80004dec:	00c59793          	slli	a5,a1,0xc
80004df0:	00c69713          	slli	a4,a3,0xc
80004df4:	0146d893          	srli	a7,a3,0x14
80004df8:	7ff87813          	andi	a6,a6,2047
80004dfc:	7ff00313          	li	t1,2047
80004e00:	83b1                	srli	a5,a5,0xc
80004e02:	01f5de93          	srli	t4,a1,0x1f
80004e06:	8331                	srli	a4,a4,0xc
80004e08:	7ff8f893          	andi	a7,a7,2047
80004e0c:	01f6de13          	srli	t3,a3,0x1f
80004e10:	00681963          	bne	a6,t1,80004e22 <__eqdf2+0x3a>
80004e14:	00a7ef33          	or	t5,a5,a0
80004e18:	000f0563          	beqz	t5,80004e22 <__eqdf2+0x3a>
80004e1c:	4705                	li	a4,1
80004e1e:	853a                	mv	a0,a4
80004e20:	8082                	ret
80004e22:	00689463          	bne	a7,t1,80004e2a <__eqdf2+0x42>
80004e26:	8f51                	or	a4,a4,a2
80004e28:	fb75                	bnez	a4,80004e1c <__eqdf2+0x34>
80004e2a:	8ead                	xor	a3,a3,a1
80004e2c:	0686                	slli	a3,a3,0x1
80004e2e:	f6fd                	bnez	a3,80004e1c <__eqdf2+0x34>
80004e30:	fec516e3          	bne	a0,a2,80004e1c <__eqdf2+0x34>
80004e34:	4701                	li	a4,0
80004e36:	ffce84e3          	beq	t4,t3,80004e1e <__eqdf2+0x36>
80004e3a:	fe0811e3          	bnez	a6,80004e1c <__eqdf2+0x34>
80004e3e:	8fc9                	or	a5,a5,a0
80004e40:	00f03733          	snez	a4,a5
80004e44:	bfe9                	j	80004e1e <__eqdf2+0x36>

80004e46 <__gedf2>:
80004e46:	0145d313          	srli	t1,a1,0x14
80004e4a:	00c59893          	slli	a7,a1,0xc
80004e4e:	00c69713          	slli	a4,a3,0xc
80004e52:	0146d813          	srli	a6,a3,0x14
80004e56:	7ff37313          	andi	t1,t1,2047
80004e5a:	7ff00793          	li	a5,2047
80004e5e:	00c8d893          	srli	a7,a7,0xc
80004e62:	81fd                	srli	a1,a1,0x1f
80004e64:	8331                	srli	a4,a4,0xc
80004e66:	7ff87813          	andi	a6,a6,2047
80004e6a:	82fd                	srli	a3,a3,0x1f
80004e6c:	02f30e63          	beq	t1,a5,80004ea8 <__gedf2+0x62>
80004e70:	7ff00e13          	li	t3,2047
80004e74:	87c2                	mv	a5,a6
80004e76:	01c81663          	bne	a6,t3,80004e82 <__gedf2+0x3c>
80004e7a:	00c76e33          	or	t3,a4,a2
80004e7e:	020e1863          	bnez	t3,80004eae <__gedf2+0x68>
80004e82:	4e01                	li	t3,0
80004e84:	00031663          	bnez	t1,80004e90 <__gedf2+0x4a>
80004e88:	00a8ee33          	or	t3,a7,a0
80004e8c:	001e3e13          	seqz	t3,t3
80004e90:	04081963          	bnez	a6,80004ee2 <__gedf2+0x9c>
80004e94:	00c76eb3          	or	t4,a4,a2
80004e98:	000e0e63          	beqz	t3,80004eb4 <__gedf2+0x6e>
80004e9c:	000e8a63          	beqz	t4,80004eb0 <__gedf2+0x6a>
80004ea0:	00169793          	slli	a5,a3,0x1
80004ea4:	17fd                	addi	a5,a5,-1 # ffff <__fw_size__+0x4e3f>
80004ea6:	a029                	j	80004eb0 <__gedf2+0x6a>
80004ea8:	00a8e7b3          	or	a5,a7,a0
80004eac:	d3f1                	beqz	a5,80004e70 <__gedf2+0x2a>
80004eae:	57f9                	li	a5,-2
80004eb0:	853e                	mv	a0,a5
80004eb2:	8082                	ret
80004eb4:	020e9963          	bnez	t4,80004ee6 <__gedf2+0xa0>
80004eb8:	40b005b3          	neg	a1,a1
80004ebc:	0015e793          	ori	a5,a1,1
80004ec0:	bfc5                	j	80004eb0 <__gedf2+0x6a>
80004ec2:	fd034fe3          	blt	t1,a6,80004ea0 <__gedf2+0x5a>
80004ec6:	ff1769e3          	bltu	a4,a7,80004eb8 <__gedf2+0x72>
80004eca:	00a67463          	bgeu	a2,a0,80004ed2 <__gedf2+0x8c>
80004ece:	fee885e3          	beq	a7,a4,80004eb8 <__gedf2+0x72>
80004ed2:	00c56563          	bltu	a0,a2,80004edc <__gedf2+0x96>
80004ed6:	4781                	li	a5,0
80004ed8:	fce8fce3          	bgeu	a7,a4,80004eb0 <__gedf2+0x6a>
80004edc:	00159793          	slli	a5,a1,0x1
80004ee0:	b7d1                	j	80004ea4 <__gedf2+0x5e>
80004ee2:	fa0e1fe3          	bnez	t3,80004ea0 <__gedf2+0x5a>
80004ee6:	fcb699e3          	bne	a3,a1,80004eb8 <__gedf2+0x72>
80004eea:	fc685ce3          	bge	a6,t1,80004ec2 <__gedf2+0x7c>
80004eee:	40d006b3          	neg	a3,a3
80004ef2:	0016e793          	ori	a5,a3,1
80004ef6:	bf6d                	j	80004eb0 <__gedf2+0x6a>

80004ef8 <__ledf2>:
80004ef8:	0145d313          	srli	t1,a1,0x14
80004efc:	00c59893          	slli	a7,a1,0xc
80004f00:	00c69713          	slli	a4,a3,0xc
80004f04:	0146d813          	srli	a6,a3,0x14
80004f08:	7ff37313          	andi	t1,t1,2047
80004f0c:	7ff00793          	li	a5,2047
80004f10:	00c8d893          	srli	a7,a7,0xc
80004f14:	81fd                	srli	a1,a1,0x1f
80004f16:	8331                	srli	a4,a4,0xc
80004f18:	7ff87813          	andi	a6,a6,2047
80004f1c:	82fd                	srli	a3,a3,0x1f
80004f1e:	02f30e63          	beq	t1,a5,80004f5a <__ledf2+0x62>
80004f22:	7ff00e13          	li	t3,2047
80004f26:	87c2                	mv	a5,a6
80004f28:	01c81663          	bne	a6,t3,80004f34 <__ledf2+0x3c>
80004f2c:	00c76e33          	or	t3,a4,a2
80004f30:	020e1863          	bnez	t3,80004f60 <__ledf2+0x68>
80004f34:	4e01                	li	t3,0
80004f36:	00031663          	bnez	t1,80004f42 <__ledf2+0x4a>
80004f3a:	00a8ee33          	or	t3,a7,a0
80004f3e:	001e3e13          	seqz	t3,t3
80004f42:	04081963          	bnez	a6,80004f94 <__ledf2+0x9c>
80004f46:	00c76eb3          	or	t4,a4,a2
80004f4a:	000e0e63          	beqz	t3,80004f66 <__ledf2+0x6e>
80004f4e:	000e8a63          	beqz	t4,80004f62 <__ledf2+0x6a>
80004f52:	00169793          	slli	a5,a3,0x1
80004f56:	17fd                	addi	a5,a5,-1
80004f58:	a029                	j	80004f62 <__ledf2+0x6a>
80004f5a:	00a8e7b3          	or	a5,a7,a0
80004f5e:	d3f1                	beqz	a5,80004f22 <__ledf2+0x2a>
80004f60:	4789                	li	a5,2
80004f62:	853e                	mv	a0,a5
80004f64:	8082                	ret
80004f66:	020e9963          	bnez	t4,80004f98 <__ledf2+0xa0>
80004f6a:	40b005b3          	neg	a1,a1
80004f6e:	0015e793          	ori	a5,a1,1
80004f72:	bfc5                	j	80004f62 <__ledf2+0x6a>
80004f74:	fd034fe3          	blt	t1,a6,80004f52 <__ledf2+0x5a>
80004f78:	ff1769e3          	bltu	a4,a7,80004f6a <__ledf2+0x72>
80004f7c:	00a67463          	bgeu	a2,a0,80004f84 <__ledf2+0x8c>
80004f80:	fee885e3          	beq	a7,a4,80004f6a <__ledf2+0x72>
80004f84:	00c56563          	bltu	a0,a2,80004f8e <__ledf2+0x96>
80004f88:	4781                	li	a5,0
80004f8a:	fce8fce3          	bgeu	a7,a4,80004f62 <__ledf2+0x6a>
80004f8e:	00159793          	slli	a5,a1,0x1
80004f92:	b7d1                	j	80004f56 <__ledf2+0x5e>
80004f94:	fa0e1fe3          	bnez	t3,80004f52 <__ledf2+0x5a>
80004f98:	fcb699e3          	bne	a3,a1,80004f6a <__ledf2+0x72>
80004f9c:	fc685ce3          	bge	a6,t1,80004f74 <__ledf2+0x7c>
80004fa0:	40d006b3          	neg	a3,a3
80004fa4:	0016e793          	ori	a5,a3,1
80004fa8:	bf6d                	j	80004f62 <__ledf2+0x6a>

80004faa <__unorddf2>:
80004faa:	00c59713          	slli	a4,a1,0xc
80004fae:	81d1                	srli	a1,a1,0x14
80004fb0:	00c69793          	slli	a5,a3,0xc
80004fb4:	7ff5f593          	andi	a1,a1,2047
80004fb8:	82d1                	srli	a3,a3,0x14
80004fba:	7ff00813          	li	a6,2047
80004fbe:	8331                	srli	a4,a4,0xc
80004fc0:	83b1                	srli	a5,a5,0xc
80004fc2:	7ff6f693          	andi	a3,a3,2047
80004fc6:	01059563          	bne	a1,a6,80004fd0 <__unorddf2+0x26>
80004fca:	8f49                	or	a4,a4,a0
80004fcc:	4505                	li	a0,1
80004fce:	e719                	bnez	a4,80004fdc <__unorddf2+0x32>
80004fd0:	4501                	li	a0,0
80004fd2:	01069563          	bne	a3,a6,80004fdc <__unorddf2+0x32>
80004fd6:	8fd1                	or	a5,a5,a2
80004fd8:	00f03533          	snez	a0,a5
80004fdc:	8082                	ret

80004fde <__fixdfsi>:
80004fde:	0145d713          	srli	a4,a1,0x14
80004fe2:	00c59793          	slli	a5,a1,0xc
80004fe6:	7ff77713          	andi	a4,a4,2047
80004fea:	3fe00693          	li	a3,1022
80004fee:	83b1                	srli	a5,a5,0xc
80004ff0:	81fd                	srli	a1,a1,0x1f
80004ff2:	04e6d563          	bge	a3,a4,8000503c <__fixdfsi+0x5e>
80004ff6:	41d00693          	li	a3,1053
80004ffa:	00e6d763          	bge	a3,a4,80005008 <__fixdfsi+0x2a>
80004ffe:	80000537          	lui	a0,0x80000
80005002:	157d                	addi	a0,a0,-1 # 7fffffff <__share_mem_end__+0x7ee7ffff>
80005004:	952e                	add	a0,a0,a1
80005006:	8082                	ret
80005008:	001006b7          	lui	a3,0x100
8000500c:	8fd5                	or	a5,a5,a3
8000500e:	41300693          	li	a3,1043
80005012:	02e6d163          	bge	a3,a4,80005034 <__fixdfsi+0x56>
80005016:	bed70693          	addi	a3,a4,-1043
8000501a:	00d797b3          	sll	a5,a5,a3
8000501e:	43300693          	li	a3,1075
80005022:	40e68733          	sub	a4,a3,a4
80005026:	00e55533          	srl	a0,a0,a4
8000502a:	8d5d                	or	a0,a0,a5
8000502c:	c989                	beqz	a1,8000503e <__fixdfsi+0x60>
8000502e:	40a00533          	neg	a0,a0
80005032:	8082                	ret
80005034:	8e99                	sub	a3,a3,a4
80005036:	00d7d533          	srl	a0,a5,a3
8000503a:	bfcd                	j	8000502c <__fixdfsi+0x4e>
8000503c:	4501                	li	a0,0
8000503e:	8082                	ret

80005040 <__floatsidf>:
80005040:	1141                	addi	sp,sp,-16
80005042:	c606                	sw	ra,12(sp)
80005044:	c422                	sw	s0,8(sp)
80005046:	c226                	sw	s1,4(sp)
80005048:	87aa                	mv	a5,a0
8000504a:	c929                	beqz	a0,8000509c <__floatsidf+0x5c>
8000504c:	41f55713          	srai	a4,a0,0x1f
80005050:	00a74433          	xor	s0,a4,a0
80005054:	8c19                	sub	s0,s0,a4
80005056:	01f55493          	srli	s1,a0,0x1f
8000505a:	8522                	mv	a0,s0
8000505c:	3321                	jal	80004d64 <__clzsi2>
8000505e:	41e00793          	li	a5,1054
80005062:	4729                	li	a4,10
80005064:	8f89                	sub	a5,a5,a0
80005066:	02a74663          	blt	a4,a0,80005092 <__floatsidf+0x52>
8000506a:	472d                	li	a4,11
8000506c:	8f09                	sub	a4,a4,a0
8000506e:	0555                	addi	a0,a0,21
80005070:	00e45733          	srl	a4,s0,a4
80005074:	00a41433          	sll	s0,s0,a0
80005078:	40b2                	lw	ra,12(sp)
8000507a:	8522                	mv	a0,s0
8000507c:	0732                	slli	a4,a4,0xc
8000507e:	4422                	lw	s0,8(sp)
80005080:	07d2                	slli	a5,a5,0x14
80005082:	8331                	srli	a4,a4,0xc
80005084:	04fe                	slli	s1,s1,0x1f
80005086:	8fd9                	or	a5,a5,a4
80005088:	0097e5b3          	or	a1,a5,s1
8000508c:	4492                	lw	s1,4(sp)
8000508e:	0141                	addi	sp,sp,16
80005090:	8082                	ret
80005092:	1555                	addi	a0,a0,-11
80005094:	00a41733          	sll	a4,s0,a0
80005098:	4401                	li	s0,0
8000509a:	bff9                	j	80005078 <__floatsidf+0x38>
8000509c:	4481                	li	s1,0
8000509e:	4701                	li	a4,0
800050a0:	bfe5                	j	80005098 <__floatsidf+0x58>

800050a2 <__fixdfdi>:
800050a2:	0145d613          	srli	a2,a1,0x14
800050a6:	7ff67613          	andi	a2,a2,2047
800050aa:	3fe00713          	li	a4,1022
800050ae:	08c75363          	bge	a4,a2,80005134 <__fixdfdi+0x92>
800050b2:	1141                	addi	sp,sp,-16
800050b4:	c422                	sw	s0,8(sp)
800050b6:	c606                	sw	ra,12(sp)
800050b8:	43d00713          	li	a4,1085
800050bc:	01f5d413          	srli	s0,a1,0x1f
800050c0:	00c75c63          	bge	a4,a2,800050d8 <__fixdfdi+0x36>
800050c4:	800005b7          	lui	a1,0x80000
800050c8:	15fd                	addi	a1,a1,-1 # 7fffffff <__share_mem_end__+0x7ee7ffff>
800050ca:	fff40513          	addi	a0,s0,-1
800050ce:	95a2                	add	a1,a1,s0
800050d0:	40b2                	lw	ra,12(sp)
800050d2:	4422                	lw	s0,8(sp)
800050d4:	0141                	addi	sp,sp,16
800050d6:	8082                	ret
800050d8:	00c59793          	slli	a5,a1,0xc
800050dc:	83b1                	srli	a5,a5,0xc
800050de:	00100737          	lui	a4,0x100
800050e2:	00e7e5b3          	or	a1,a5,a4
800050e6:	43200793          	li	a5,1074
800050ea:	00c7de63          	bge	a5,a2,80005106 <__fixdfdi+0x64>
800050ee:	bcd60613          	addi	a2,a2,-1075
800050f2:	31a1                	jal	80004d3a <__ashldi3>
800050f4:	dc71                	beqz	s0,800050d0 <__fixdfdi+0x2e>
800050f6:	00a037b3          	snez	a5,a0
800050fa:	40b005b3          	neg	a1,a1
800050fe:	8d9d                	sub	a1,a1,a5
80005100:	40a00533          	neg	a0,a0
80005104:	b7f1                	j	800050d0 <__fixdfdi+0x2e>
80005106:	41300793          	li	a5,1043
8000510a:	00c7df63          	bge	a5,a2,80005128 <__fixdfdi+0x86>
8000510e:	43300793          	li	a5,1075
80005112:	8f91                	sub	a5,a5,a2
80005114:	bed60613          	addi	a2,a2,-1043
80005118:	00c59633          	sll	a2,a1,a2
8000511c:	00f55533          	srl	a0,a0,a5
80005120:	8d51                	or	a0,a0,a2
80005122:	00f5d5b3          	srl	a1,a1,a5
80005126:	b7f9                	j	800050f4 <__fixdfdi+0x52>
80005128:	40c78533          	sub	a0,a5,a2
8000512c:	00a5d533          	srl	a0,a1,a0
80005130:	4581                	li	a1,0
80005132:	b7c9                	j	800050f4 <__fixdfdi+0x52>
80005134:	4501                	li	a0,0
80005136:	4581                	li	a1,0
80005138:	8082                	ret

8000513a <__floatdidf>:
8000513a:	1101                	addi	sp,sp,-32
8000513c:	ce06                	sw	ra,28(sp)
8000513e:	cc22                	sw	s0,24(sp)
80005140:	ca26                	sw	s1,20(sp)
80005142:	c84a                	sw	s2,16(sp)
80005144:	c64e                	sw	s3,12(sp)
80005146:	c452                	sw	s4,8(sp)
80005148:	c256                	sw	s5,4(sp)
8000514a:	00b567b3          	or	a5,a0,a1
8000514e:	14078363          	beqz	a5,80005294 <__floatdidf+0x15a>
80005152:	41f5d793          	srai	a5,a1,0x1f
80005156:	8d3d                	xor	a0,a0,a5
80005158:	00b7c433          	xor	s0,a5,a1
8000515c:	40f50ab3          	sub	s5,a0,a5
80005160:	01553533          	sltu	a0,a0,s5
80005164:	8c1d                	sub	s0,s0,a5
80005166:	8c09                	sub	s0,s0,a0
80005168:	01f5d493          	srli	s1,a1,0x1f
8000516c:	8922                	mv	s2,s0
8000516e:	c449                	beqz	s0,800051f8 <__floatdidf+0xbe>
80005170:	8522                	mv	a0,s0
80005172:	3ecd                	jal	80004d64 <__clzsi2>
80005174:	43e00793          	li	a5,1086
80005178:	40a789b3          	sub	s3,a5,a0
8000517c:	47a9                	li	a5,10
8000517e:	8a2a                	mv	s4,a0
80005180:	0ca7c763          	blt	a5,a0,8000524e <__floatdidf+0x114>
80005184:	479d                	li	a5,7
80005186:	0ea7c163          	blt	a5,a0,80005268 <__floatdidf+0x12e>
8000518a:	03850613          	addi	a2,a0,56
8000518e:	85a2                	mv	a1,s0
80005190:	8556                	mv	a0,s5
80005192:	3665                	jal	80004d3a <__ashldi3>
80005194:	4621                	li	a2,8
80005196:	00b56933          	or	s2,a0,a1
8000519a:	41460633          	sub	a2,a2,s4
8000519e:	85a2                	mv	a1,s0
800051a0:	8556                	mv	a0,s5
800051a2:	2361                	jal	8000572a <__lshrdi3>
800051a4:	01203933          	snez	s2,s2
800051a8:	00a96533          	or	a0,s2,a0
800051ac:	842e                	mv	s0,a1
800051ae:	ff8007b7          	lui	a5,0xff800
800051b2:	17fd                	addi	a5,a5,-1 # ff7fffff <__fast_load_addr__+0x7f7f1e3f>
800051b4:	8fe1                	and	a5,a5,s0
800051b6:	00757713          	andi	a4,a0,7
800051ba:	cb05                	beqz	a4,800051ea <__floatdidf+0xb0>
800051bc:	00f57713          	andi	a4,a0,15
800051c0:	4691                	li	a3,4
800051c2:	02d70463          	beq	a4,a3,800051ea <__floatdidf+0xb0>
800051c6:	00d50733          	add	a4,a0,a3
800051ca:	00a736b3          	sltu	a3,a4,a0
800051ce:	97b6                	add	a5,a5,a3
800051d0:	853a                	mv	a0,a4
800051d2:	00879713          	slli	a4,a5,0x8
800051d6:	00075a63          	bgez	a4,800051ea <__floatdidf+0xb0>
800051da:	ff800737          	lui	a4,0xff800
800051de:	177d                	addi	a4,a4,-1 # ff7fffff <__fast_load_addr__+0x7f7f1e3f>
800051e0:	43f00993          	li	s3,1087
800051e4:	8ff9                	and	a5,a5,a4
800051e6:	414989b3          	sub	s3,s3,s4
800051ea:	810d                	srli	a0,a0,0x3
800051ec:	01d79713          	slli	a4,a5,0x1d
800051f0:	8f49                	or	a4,a4,a0
800051f2:	0037d413          	srli	s0,a5,0x3
800051f6:	a815                	j	8000522a <__floatdidf+0xf0>
800051f8:	8556                	mv	a0,s5
800051fa:	36ad                	jal	80004d64 <__clzsi2>
800051fc:	43e00793          	li	a5,1086
80005200:	02050a13          	addi	s4,a0,32
80005204:	414789b3          	sub	s3,a5,s4
80005208:	02a00793          	li	a5,42
8000520c:	0547c863          	blt	a5,s4,8000525c <__floatdidf+0x122>
80005210:	02b00413          	li	s0,43
80005214:	ff5a0713          	addi	a4,s4,-11
80005218:	41440433          	sub	s0,s0,s4
8000521c:	00e917b3          	sll	a5,s2,a4
80005220:	008ad433          	srl	s0,s5,s0
80005224:	8c5d                	or	s0,s0,a5
80005226:	00ea9733          	sll	a4,s5,a4
8000522a:	0432                	slli	s0,s0,0xc
8000522c:	01499793          	slli	a5,s3,0x14
80005230:	8031                	srli	s0,s0,0xc
80005232:	40f2                	lw	ra,28(sp)
80005234:	8fc1                	or	a5,a5,s0
80005236:	4462                	lw	s0,24(sp)
80005238:	04fe                	slli	s1,s1,0x1f
8000523a:	4942                	lw	s2,16(sp)
8000523c:	49b2                	lw	s3,12(sp)
8000523e:	4a22                	lw	s4,8(sp)
80005240:	4a92                	lw	s5,4(sp)
80005242:	0097e5b3          	or	a1,a5,s1
80005246:	853a                	mv	a0,a4
80005248:	44d2                	lw	s1,20(sp)
8000524a:	6105                	addi	sp,sp,32
8000524c:	8082                	ret
8000524e:	47ad                	li	a5,11
80005250:	8756                	mv	a4,s5
80005252:	faf51fe3          	bne	a0,a5,80005210 <__floatdidf+0xd6>
80005256:	43300993          	li	s3,1075
8000525a:	bfc1                	j	8000522a <__floatdidf+0xf0>
8000525c:	ff550413          	addi	s0,a0,-11
80005260:	4701                	li	a4,0
80005262:	008a9433          	sll	s0,s5,s0
80005266:	b7d1                	j	8000522a <__floatdidf+0xf0>
80005268:	47a1                	li	a5,8
8000526a:	8556                	mv	a0,s5
8000526c:	f4fa01e3          	beq	s4,a5,800051ae <__floatdidf+0x74>
80005270:	02800793          	li	a5,40
80005274:	ff8a0713          	addi	a4,s4,-8
80005278:	414787b3          	sub	a5,a5,s4
8000527c:	00e41433          	sll	s0,s0,a4
80005280:	00fad7b3          	srl	a5,s5,a5
80005284:	00ea9533          	sll	a0,s5,a4
80005288:	ff800737          	lui	a4,0xff800
8000528c:	8fc1                	or	a5,a5,s0
8000528e:	177d                	addi	a4,a4,-1 # ff7fffff <__fast_load_addr__+0x7f7f1e3f>
80005290:	8ff9                	and	a5,a5,a4
80005292:	b715                	j	800051b6 <__floatdidf+0x7c>
80005294:	4481                	li	s1,0
80005296:	4401                	li	s0,0
80005298:	4701                	li	a4,0
8000529a:	4981                	li	s3,0
8000529c:	b779                	j	8000522a <__floatdidf+0xf0>

8000529e <__extenddftf2>:
8000529e:	01465793          	srli	a5,a2,0x14
800052a2:	7179                	addi	sp,sp,-48
800052a4:	00c61693          	slli	a3,a2,0xc
800052a8:	7ff7f793          	andi	a5,a5,2047
800052ac:	d226                	sw	s1,36(sp)
800052ae:	00c6d713          	srli	a4,a3,0xc
800052b2:	01f65493          	srli	s1,a2,0x1f
800052b6:	00178613          	addi	a2,a5,1
800052ba:	d422                	sw	s0,40(sp)
800052bc:	d04a                	sw	s2,32(sp)
800052be:	d606                	sw	ra,44(sp)
800052c0:	c82e                	sw	a1,16(sp)
800052c2:	ca3a                	sw	a4,20(sp)
800052c4:	ce02                	sw	zero,28(sp)
800052c6:	cc02                	sw	zero,24(sp)
800052c8:	7fe67613          	andi	a2,a2,2046
800052cc:	892a                	mv	s2,a0
800052ce:	842e                	mv	s0,a1
800052d0:	ca31                	beqz	a2,80005324 <__extenddftf2+0x86>
800052d2:	82c1                	srli	a3,a3,0x10
800052d4:	6611                	lui	a2,0x4
800052d6:	ce36                	sw	a3,28(sp)
800052d8:	0772                	slli	a4,a4,0x1c
800052da:	0045d693          	srli	a3,a1,0x4
800052de:	c0060613          	addi	a2,a2,-1024 # 3c00 <__app_offset__+0x1c00>
800052e2:	8f55                	or	a4,a4,a3
800052e4:	01c59413          	slli	s0,a1,0x1c
800052e8:	97b2                	add	a5,a5,a2
800052ea:	cc3a                	sw	a4,24(sp)
800052ec:	ca22                	sw	s0,20(sp)
800052ee:	c802                	sw	zero,16(sp)
800052f0:	45f2                	lw	a1,28(sp)
800052f2:	04be                	slli	s1,s1,0xf
800052f4:	8cdd                	or	s1,s1,a5
800052f6:	00911723          	sh	s1,14(sp)
800052fa:	00b11623          	sh	a1,12(sp)
800052fe:	4642                	lw	a2,16(sp)
80005300:	46d2                	lw	a3,20(sp)
80005302:	4762                	lw	a4,24(sp)
80005304:	47b2                	lw	a5,12(sp)
80005306:	50b2                	lw	ra,44(sp)
80005308:	5422                	lw	s0,40(sp)
8000530a:	00c92023          	sw	a2,0(s2)
8000530e:	00d92223          	sw	a3,4(s2)
80005312:	00e92423          	sw	a4,8(s2)
80005316:	00f92623          	sw	a5,12(s2)
8000531a:	5492                	lw	s1,36(sp)
8000531c:	854a                	mv	a0,s2
8000531e:	5902                	lw	s2,32(sp)
80005320:	6145                	addi	sp,sp,48
80005322:	8082                	ret
80005324:	00b76533          	or	a0,a4,a1
80005328:	e3d5                	bnez	a5,800053cc <__extenddftf2+0x12e>
8000532a:	d179                	beqz	a0,800052f0 <__extenddftf2+0x52>
8000532c:	cb1d                	beqz	a4,80005362 <__extenddftf2+0xc4>
8000532e:	853a                	mv	a0,a4
80005330:	3c15                	jal	80004d64 <__clzsi2>
80005332:	03150693          	addi	a3,a0,49
80005336:	4056d813          	srai	a6,a3,0x5
8000533a:	8afd                	andi	a3,a3,31
8000533c:	0818                	addi	a4,sp,16
8000533e:	c695                	beqz	a3,8000536a <__extenddftf2+0xcc>
80005340:	02000893          	li	a7,32
80005344:	00281613          	slli	a2,a6,0x2
80005348:	087c                	addi	a5,sp,28
8000534a:	40d888b3          	sub	a7,a7,a3
8000534e:	8f91                	sub	a5,a5,a2
80005350:	04f71f63          	bne	a4,a5,800053ae <__extenddftf2+0x110>
80005354:	963a                	add	a2,a2,a4
80005356:	00d416b3          	sll	a3,s0,a3
8000535a:	fff80793          	addi	a5,a6,-1
8000535e:	c214                	sw	a3,0(a2)
80005360:	a015                	j	80005384 <__extenddftf2+0xe6>
80005362:	3409                	jal	80004d64 <__clzsi2>
80005364:	02050513          	addi	a0,a0,32
80005368:	b7e9                	j	80005332 <__extenddftf2+0x94>
8000536a:	478d                	li	a5,3
8000536c:	410787b3          	sub	a5,a5,a6
80005370:	078a                	slli	a5,a5,0x2
80005372:	97ba                	add	a5,a5,a4
80005374:	439c                	lw	a5,0(a5)
80005376:	4689                	li	a3,2
80005378:	ce3e                	sw	a5,28(sp)
8000537a:	87b6                	mv	a5,a3
8000537c:	00d81463          	bne	a6,a3,80005384 <__extenddftf2+0xe6>
80005380:	cc22                	sw	s0,24(sp)
80005382:	4785                	li	a5,1
80005384:	0785                	addi	a5,a5,1
80005386:	078a                	slli	a5,a5,0x2
80005388:	46a1                	li	a3,8
8000538a:	00d7e863          	bltu	a5,a3,8000539a <__extenddftf2+0xfc>
8000538e:	00072023          	sw	zero,0(a4)
80005392:	00072223          	sw	zero,4(a4)
80005396:	17e1                	addi	a5,a5,-8
80005398:	0838                	addi	a4,sp,24
8000539a:	4691                	li	a3,4
8000539c:	00d7e463          	bltu	a5,a3,800053a4 <__extenddftf2+0x106>
800053a0:	00072023          	sw	zero,0(a4)
800053a4:	6791                	lui	a5,0x4
800053a6:	c0c78793          	addi	a5,a5,-1012 # 3c0c <__app_offset__+0x1c0c>
800053aa:	8f89                	sub	a5,a5,a0
800053ac:	b791                	j	800052f0 <__extenddftf2+0x52>
800053ae:	438c                	lw	a1,0(a5)
800053b0:	ffc7a303          	lw	t1,-4(a5)
800053b4:	00c78e33          	add	t3,a5,a2
800053b8:	00d595b3          	sll	a1,a1,a3
800053bc:	01135333          	srl	t1,t1,a7
800053c0:	0065e5b3          	or	a1,a1,t1
800053c4:	00be2023          	sw	a1,0(t3) # 1000000 <_extram_size>
800053c8:	17f1                	addi	a5,a5,-4
800053ca:	b759                	j	80005350 <__extenddftf2+0xb2>
800053cc:	cd11                	beqz	a0,800053e8 <__extenddftf2+0x14a>
800053ce:	0045d793          	srli	a5,a1,0x4
800053d2:	0772                	slli	a4,a4,0x1c
800053d4:	8f5d                	or	a4,a4,a5
800053d6:	82c1                	srli	a3,a3,0x10
800053d8:	67a1                	lui	a5,0x8
800053da:	01c59413          	slli	s0,a1,0x1c
800053de:	8edd                	or	a3,a3,a5
800053e0:	cc3a                	sw	a4,24(sp)
800053e2:	ca22                	sw	s0,20(sp)
800053e4:	c802                	sw	zero,16(sp)
800053e6:	ce36                	sw	a3,28(sp)
800053e8:	67a1                	lui	a5,0x8
800053ea:	17fd                	addi	a5,a5,-1 # 7fff <HEAP_SIZE+0x3fff>
800053ec:	b711                	j	800052f0 <__extenddftf2+0x52>

800053ee <__truncdfsf2>:
800053ee:	0145d713          	srli	a4,a1,0x14
800053f2:	7ff77713          	andi	a4,a4,2047
800053f6:	00c59793          	slli	a5,a1,0xc
800053fa:	00170613          	addi	a2,a4,1
800053fe:	0097d693          	srli	a3,a5,0x9
80005402:	7fe67613          	andi	a2,a2,2046
80005406:	01d55793          	srli	a5,a0,0x1d
8000540a:	8fd5                	or	a5,a5,a3
8000540c:	81fd                	srli	a1,a1,0x1f
8000540e:	00351693          	slli	a3,a0,0x3
80005412:	c659                	beqz	a2,800054a0 <__truncdfsf2+0xb2>
80005414:	c8070613          	addi	a2,a4,-896
80005418:	0fe00813          	li	a6,254
8000541c:	0ac84d63          	blt	a6,a2,800054d6 <__truncdfsf2+0xe8>
80005420:	06c04763          	bgtz	a2,8000548e <__truncdfsf2+0xa0>
80005424:	5525                	li	a0,-23
80005426:	0aa64563          	blt	a2,a0,800054d0 <__truncdfsf2+0xe2>
8000542a:	00800537          	lui	a0,0x800
8000542e:	8d5d                	or	a0,a0,a5
80005430:	57fd                	li	a5,-1
80005432:	02f64b63          	blt	a2,a5,80005468 <__truncdfsf2+0x7a>
80005436:	47f9                	li	a5,30
80005438:	c8270713          	addi	a4,a4,-894
8000543c:	8f91                	sub	a5,a5,a2
8000543e:	00f6d7b3          	srl	a5,a3,a5
80005442:	00e696b3          	sll	a3,a3,a4
80005446:	00d036b3          	snez	a3,a3
8000544a:	00e51533          	sll	a0,a0,a4
8000544e:	8ec9                	or	a3,a3,a0
80005450:	8fd5                	or	a5,a5,a3
80005452:	4701                	li	a4,0
80005454:	0077f693          	andi	a3,a5,7
80005458:	c691                	beqz	a3,80005464 <__truncdfsf2+0x76>
8000545a:	00f7f693          	andi	a3,a5,15
8000545e:	4611                	li	a2,4
80005460:	04c69463          	bne	a3,a2,800054a8 <__truncdfsf2+0xba>
80005464:	838d                	srli	a5,a5,0x3
80005466:	a8b9                	j	800054c4 <__truncdfsf2+0xd6>
80005468:	58f9                	li	a7,-2
8000546a:	40c887b3          	sub	a5,a7,a2
8000546e:	00f557b3          	srl	a5,a0,a5
80005472:	4801                	li	a6,0
80005474:	01160663          	beq	a2,a7,80005480 <__truncdfsf2+0x92>
80005478:	ca270713          	addi	a4,a4,-862
8000547c:	00e51833          	sll	a6,a0,a4
80005480:	00d86833          	or	a6,a6,a3
80005484:	01003833          	snez	a6,a6
80005488:	0107e7b3          	or	a5,a5,a6
8000548c:	b7d9                	j	80005452 <__truncdfsf2+0x64>
8000548e:	051a                	slli	a0,a0,0x6
80005490:	00a03533          	snez	a0,a0
80005494:	078e                	slli	a5,a5,0x3
80005496:	82f5                	srli	a3,a3,0x1d
80005498:	8fc9                	or	a5,a5,a0
8000549a:	8fd5                	or	a5,a5,a3
8000549c:	8732                	mv	a4,a2
8000549e:	bf5d                	j	80005454 <__truncdfsf2+0x66>
800054a0:	8fd5                	or	a5,a5,a3
800054a2:	eb19                	bnez	a4,800054b8 <__truncdfsf2+0xca>
800054a4:	d3e1                	beqz	a5,80005464 <__truncdfsf2+0x76>
800054a6:	4785                	li	a5,1
800054a8:	0791                	addi	a5,a5,4
800054aa:	00579693          	slli	a3,a5,0x5
800054ae:	fa06dbe3          	bgez	a3,80005464 <__truncdfsf2+0x76>
800054b2:	0705                	addi	a4,a4,1
800054b4:	4781                	li	a5,0
800054b6:	a039                	j	800054c4 <__truncdfsf2+0xd6>
800054b8:	0ff00713          	li	a4,255
800054bc:	c781                	beqz	a5,800054c4 <__truncdfsf2+0xd6>
800054be:	4581                	li	a1,0
800054c0:	004007b7          	lui	a5,0x400
800054c4:	075e                	slli	a4,a4,0x17
800054c6:	8f5d                	or	a4,a4,a5
800054c8:	01f59513          	slli	a0,a1,0x1f
800054cc:	8d59                	or	a0,a0,a4
800054ce:	8082                	ret
800054d0:	4785                	li	a5,1
800054d2:	4701                	li	a4,0
800054d4:	bfd1                	j	800054a8 <__truncdfsf2+0xba>
800054d6:	0ff00713          	li	a4,255
800054da:	bfe9                	j	800054b4 <__truncdfsf2+0xc6>

800054dc <__trunctfdf2>:
800054dc:	454c                	lw	a1,12(a0)
800054de:	451c                	lw	a5,8(a0)
800054e0:	1101                	addi	sp,sp,-32
800054e2:	4158                	lw	a4,4(a0)
800054e4:	c43e                	sw	a5,8(sp)
800054e6:	cc3e                	sw	a5,24(sp)
800054e8:	01059793          	slli	a5,a1,0x10
800054ec:	4114                	lw	a3,0(a0)
800054ee:	83c1                	srli	a5,a5,0x10
800054f0:	ce3e                	sw	a5,28(sp)
800054f2:	00159793          	slli	a5,a1,0x1
800054f6:	c23a                	sw	a4,4(sp)
800054f8:	ca3a                	sw	a4,20(sp)
800054fa:	0117d713          	srli	a4,a5,0x11
800054fe:	081c                	addi	a5,sp,16
80005500:	c62e                	sw	a1,12(sp)
80005502:	c036                	sw	a3,0(sp)
80005504:	c836                	sw	a3,16(sp)
80005506:	81fd                	srli	a1,a1,0x1f
80005508:	00410893          	addi	a7,sp,4
8000550c:	863e                	mv	a2,a5
8000550e:	4648                	lw	a0,12(a2)
80005510:	00862803          	lw	a6,8(a2)
80005514:	1671                	addi	a2,a2,-4
80005516:	050e                	slli	a0,a0,0x3
80005518:	01d85813          	srli	a6,a6,0x1d
8000551c:	01056533          	or	a0,a0,a6
80005520:	ca08                	sw	a0,16(a2)
80005522:	ff1616e3          	bne	a2,a7,8000550e <__trunctfdf2+0x32>
80005526:	00369513          	slli	a0,a3,0x3
8000552a:	00170693          	addi	a3,a4,1
8000552e:	01169613          	slli	a2,a3,0x11
80005532:	c82a                	sw	a0,16(sp)
80005534:	8249                	srli	a2,a2,0x12
80005536:	16060563          	beqz	a2,800056a0 <__trunctfdf2+0x1c4>
8000553a:	76f1                	lui	a3,0xffffc
8000553c:	40068693          	addi	a3,a3,1024 # ffffc400 <__fast_load_addr__+0x7ffee240>
80005540:	9736                	add	a4,a4,a3
80005542:	7fe00693          	li	a3,2046
80005546:	1ce6c863          	blt	a3,a4,80005716 <__trunctfdf2+0x23a>
8000554a:	02e05963          	blez	a4,8000557c <__trunctfdf2+0xa0>
8000554e:	4862                	lw	a6,24(sp)
80005550:	47f2                	lw	a5,28(sp)
80005552:	4652                	lw	a2,20(sp)
80005554:	01c85693          	srli	a3,a6,0x1c
80005558:	0792                	slli	a5,a5,0x4
8000555a:	8fd5                	or	a5,a5,a3
8000555c:	00461693          	slli	a3,a2,0x4
80005560:	8ec9                	or	a3,a3,a0
80005562:	8271                	srli	a2,a2,0x1c
80005564:	0812                	slli	a6,a6,0x4
80005566:	00d036b3          	snez	a3,a3
8000556a:	01066633          	or	a2,a2,a6
8000556e:	8ed1                	or	a3,a3,a2
80005570:	0076f613          	andi	a2,a3,7
80005574:	18061963          	bnez	a2,80005706 <__trunctfdf2+0x22a>
80005578:	8636                	mv	a2,a3
8000557a:	a2ad                	j	800056e4 <__trunctfdf2+0x208>
8000557c:	fcc00693          	li	a3,-52
80005580:	18d74063          	blt	a4,a3,80005700 <__trunctfdf2+0x224>
80005584:	4672                	lw	a2,28(sp)
80005586:	000806b7          	lui	a3,0x80
8000558a:	853e                	mv	a0,a5
8000558c:	00d66e33          	or	t3,a2,a3
80005590:	03d00613          	li	a2,61
80005594:	40e60733          	sub	a4,a2,a4
80005598:	40575e93          	srai	t4,a4,0x5
8000559c:	01f77613          	andi	a2,a4,31
800055a0:	ce72                	sw	t3,28(sp)
800055a2:	4701                	li	a4,0
800055a4:	4681                	li	a3,0
800055a6:	00052803          	lw	a6,0(a0) # 800000 <_flash_size>
800055aa:	0705                	addi	a4,a4,1
800055ac:	0511                	addi	a0,a0,4
800055ae:	0106e6b3          	or	a3,a3,a6
800055b2:	feee9ae3          	bne	t4,a4,800055a6 <__trunctfdf2+0xca>
800055b6:	002e9813          	slli	a6,t4,0x2
800055ba:	ee19                	bnez	a2,800055d8 <__trunctfdf2+0xfc>
800055bc:	983e                	add	a6,a6,a5
800055be:	00082603          	lw	a2,0(a6)
800055c2:	ffee8713          	addi	a4,t4,-2
800055c6:	00173713          	seqz	a4,a4
800055ca:	c832                	sw	a2,16(sp)
800055cc:	4609                	li	a2,2
800055ce:	00ce9363          	bne	t4,a2,800055d4 <__trunctfdf2+0xf8>
800055d2:	ca72                	sw	t3,20(sp)
800055d4:	0705                	addi	a4,a4,1
800055d6:	a80d                	j	80005608 <__trunctfdf2+0x12c>
800055d8:	01078733          	add	a4,a5,a6
800055dc:	4308                	lw	a0,0(a4)
800055de:	02000313          	li	t1,32
800055e2:	40c30333          	sub	t1,t1,a2
800055e6:	00651533          	sll	a0,a0,t1
800055ea:	8ec9                	or	a3,a3,a0
800055ec:	450d                	li	a0,3
800055ee:	41d50533          	sub	a0,a0,t4
800055f2:	4f01                	li	t5,0
800055f4:	09e51563          	bne	a0,t5,8000567e <__trunctfdf2+0x1a2>
800055f8:	050a                	slli	a0,a0,0x2
800055fa:	4711                	li	a4,4
800055fc:	953e                	add	a0,a0,a5
800055fe:	00ce5633          	srl	a2,t3,a2
80005602:	41d70733          	sub	a4,a4,t4
80005606:	c110                	sw	a2,0(a0)
80005608:	4611                	li	a2,4
8000560a:	8e19                	sub	a2,a2,a4
8000560c:	070a                	slli	a4,a4,0x2
8000560e:	97ba                	add	a5,a5,a4
80005610:	00261713          	slli	a4,a2,0x2
80005614:	4621                	li	a2,8
80005616:	00c76863          	bltu	a4,a2,80005626 <__trunctfdf2+0x14a>
8000561a:	0007a023          	sw	zero,0(a5) # 400000 <_stack+0x378000>
8000561e:	0007a223          	sw	zero,4(a5)
80005622:	1761                	addi	a4,a4,-8
80005624:	97b2                	add	a5,a5,a2
80005626:	4611                	li	a2,4
80005628:	00c76463          	bltu	a4,a2,80005630 <__trunctfdf2+0x154>
8000562c:	0007a023          	sw	zero,0(a5)
80005630:	47c2                	lw	a5,16(sp)
80005632:	00d036b3          	snez	a3,a3
80005636:	8edd                	or	a3,a3,a5
80005638:	47d2                	lw	a5,20(sp)
8000563a:	00f6e633          	or	a2,a3,a5
8000563e:	ea71                	bnez	a2,80005712 <__trunctfdf2+0x236>
80005640:	4781                	li	a5,0
80005642:	4701                	li	a4,0
80005644:	820d                	srli	a2,a2,0x3
80005646:	01d79693          	slli	a3,a5,0x1d
8000564a:	8ed1                	or	a3,a3,a2
8000564c:	7ff00613          	li	a2,2047
80005650:	838d                	srli	a5,a5,0x3
80005652:	00c71963          	bne	a4,a2,80005664 <__trunctfdf2+0x188>
80005656:	8edd                	or	a3,a3,a5
80005658:	4781                	li	a5,0
8000565a:	c689                	beqz	a3,80005664 <__trunctfdf2+0x188>
8000565c:	4581                	li	a1,0
8000565e:	000807b7          	lui	a5,0x80
80005662:	4681                	li	a3,0
80005664:	7ff77713          	andi	a4,a4,2047
80005668:	07b2                	slli	a5,a5,0xc
8000566a:	83b1                	srli	a5,a5,0xc
8000566c:	0752                	slli	a4,a4,0x14
8000566e:	05fe                	slli	a1,a1,0x1f
80005670:	8f5d                	or	a4,a4,a5
80005672:	00b767b3          	or	a5,a4,a1
80005676:	8536                	mv	a0,a3
80005678:	85be                	mv	a1,a5
8000567a:	6105                	addi	sp,sp,32
8000567c:	8082                	ret
8000567e:	00072883          	lw	a7,0(a4)
80005682:	00472f83          	lw	t6,4(a4)
80005686:	410702b3          	sub	t0,a4,a6
8000568a:	00c8d8b3          	srl	a7,a7,a2
8000568e:	006f9fb3          	sll	t6,t6,t1
80005692:	01f8e8b3          	or	a7,a7,t6
80005696:	0112a023          	sw	a7,0(t0)
8000569a:	0f05                	addi	t5,t5,1
8000569c:	0711                	addi	a4,a4,4
8000569e:	bf99                	j	800055f4 <__trunctfdf2+0x118>
800056a0:	46d2                	lw	a3,20(sp)
800056a2:	47e2                	lw	a5,24(sp)
800056a4:	4872                	lw	a6,28(sp)
800056a6:	00f6e633          	or	a2,a3,a5
800056aa:	01066633          	or	a2,a2,a6
800056ae:	8e49                	or	a2,a2,a0
800056b0:	eb11                	bnez	a4,800056c4 <__trunctfdf2+0x1e8>
800056b2:	4781                	li	a5,0
800056b4:	4685                	li	a3,1
800056b6:	d659                	beqz	a2,80005644 <__trunctfdf2+0x168>
800056b8:	00468613          	addi	a2,a3,4 # 80004 <__fast_ram_bss_end__+0x4>
800056bc:	00d636b3          	sltu	a3,a2,a3
800056c0:	97b6                	add	a5,a5,a3
800056c2:	a00d                	j	800056e4 <__trunctfdf2+0x208>
800056c4:	ce31                	beqz	a2,80005720 <__trunctfdf2+0x244>
800056c6:	00479713          	slli	a4,a5,0x4
800056ca:	82f1                	srli	a3,a3,0x1c
800056cc:	83f1                	srli	a5,a5,0x1c
800056ce:	0812                	slli	a6,a6,0x4
800056d0:	8ed9                	or	a3,a3,a4
800056d2:	0107e7b3          	or	a5,a5,a6
800056d6:	00400737          	lui	a4,0x400
800056da:	8fd9                	or	a5,a5,a4
800056dc:	ff86f613          	andi	a2,a3,-8
800056e0:	7ff00713          	li	a4,2047
800056e4:	00879693          	slli	a3,a5,0x8
800056e8:	f406dee3          	bgez	a3,80005644 <__trunctfdf2+0x168>
800056ec:	0705                	addi	a4,a4,1 # 400001 <_stack+0x378001>
800056ee:	7ff00693          	li	a3,2047
800056f2:	02d70963          	beq	a4,a3,80005724 <__trunctfdf2+0x248>
800056f6:	ff8006b7          	lui	a3,0xff800
800056fa:	16fd                	addi	a3,a3,-1 # ff7fffff <__fast_load_addr__+0x7f7f1e3f>
800056fc:	8ff5                	and	a5,a5,a3
800056fe:	b799                	j	80005644 <__trunctfdf2+0x168>
80005700:	4701                	li	a4,0
80005702:	4685                	li	a3,1
80005704:	4781                	li	a5,0
80005706:	00f6f613          	andi	a2,a3,15
8000570a:	4511                	li	a0,4
8000570c:	faa616e3          	bne	a2,a0,800056b8 <__trunctfdf2+0x1dc>
80005710:	b5a5                	j	80005578 <__trunctfdf2+0x9c>
80005712:	4701                	li	a4,0
80005714:	bdb1                	j	80005570 <__trunctfdf2+0x94>
80005716:	4781                	li	a5,0
80005718:	4601                	li	a2,0
8000571a:	7ff00713          	li	a4,2047
8000571e:	b71d                	j	80005644 <__trunctfdf2+0x168>
80005720:	4781                	li	a5,0
80005722:	bfe5                	j	8000571a <__trunctfdf2+0x23e>
80005724:	4781                	li	a5,0
80005726:	4601                	li	a2,0
80005728:	bf31                	j	80005644 <__trunctfdf2+0x168>

8000572a <__lshrdi3>:
8000572a:	ca09                	beqz	a2,8000573c <__lshrdi3+0x12>
8000572c:	47fd                	li	a5,31
8000572e:	00c7d863          	bge	a5,a2,8000573e <__lshrdi3+0x14>
80005732:	1601                	addi	a2,a2,-32
80005734:	00c5d533          	srl	a0,a1,a2
80005738:	4701                	li	a4,0
8000573a:	85ba                	mv	a1,a4
8000573c:	8082                	ret
8000573e:	02000793          	li	a5,32
80005742:	8f91                	sub	a5,a5,a2
80005744:	00c5d733          	srl	a4,a1,a2
80005748:	00c55533          	srl	a0,a0,a2
8000574c:	00f595b3          	sll	a1,a1,a5
80005750:	8d4d                	or	a0,a0,a1
80005752:	b7e5                	j	8000573a <__lshrdi3+0x10>

80005754 <gpio_set_pin_output>:
 * @param ptr GPIO base address
 * @param port Port index
 * @param pin Pin index
 */
static inline void gpio_set_pin_output(GPIO_Type *ptr, uint32_t port, uint8_t pin)
{
80005754:	1141                	addi	sp,sp,-16
80005756:	c62a                	sw	a0,12(sp)
80005758:	c42e                	sw	a1,8(sp)
8000575a:	87b2                	mv	a5,a2
8000575c:	00f103a3          	sb	a5,7(sp)
    ptr->OE[port].SET = 1 << pin;
80005760:	00714783          	lbu	a5,7(sp)
80005764:	4705                	li	a4,1
80005766:	00f717b3          	sll	a5,a4,a5
8000576a:	86be                	mv	a3,a5
8000576c:	4732                	lw	a4,12(sp)
8000576e:	47a2                	lw	a5,8(sp)
80005770:	02078793          	addi	a5,a5,32 # 80020 <__fast_ram_bss_end__+0x20>
80005774:	0792                	slli	a5,a5,0x4
80005776:	97ba                	add	a5,a5,a4
80005778:	c3d4                	sw	a3,4(a5)
}
8000577a:	0001                	nop
8000577c:	0141                	addi	sp,sp,16
8000577e:	8082                	ret

80005780 <main>:
#include "hpm_gpio_drv.h"

#define LED_FLASH_PERIOD_IN_MS 300

int main(void)
{
80005780:	1141                	addi	sp,sp,-16
80005782:	c606                	sw	ra,12(sp)
    int u;
    board_init();
80005784:	2ef000ef          	jal	80006272 <board_init>

    gpio_set_pin_output(HPM_GPIO0, GPIO_DI_GPIOE, 28);
80005788:	4671                	li	a2,28
8000578a:	4591                	li	a1,4
8000578c:	f0000537          	lui	a0,0xf0000
80005790:	37d1                	jal	80005754 <gpio_set_pin_output>

    printf("hello world\n");
80005792:	8000d7b7          	lui	a5,0x8000d
80005796:	36478513          	addi	a0,a5,868 # 8000d364 <_lseek+0x2c>
8000579a:	25d030ef          	jal	800091f6 <iprintf>
//        u = getchar();
//        if (u == '\r') {
//            u = '\n';
//        }
//        printf("%c", u);
        printf("hello world\n");
8000579e:	8000d7b7          	lui	a5,0x8000d
800057a2:	36478513          	addi	a0,a5,868 # 8000d364 <_lseek+0x2c>
800057a6:	251030ef          	jal	800091f6 <iprintf>
        board_hb_led_write(1);
800057aa:	4505                	li	a0,1
800057ac:	2f9000ef          	jal	800062a4 <board_hb_led_write>
        board_delay_ms(500);
800057b0:	1f400513          	li	a0,500
800057b4:	2dd000ef          	jal	80006290 <board_delay_ms>
        board_hb_led_write(0);
800057b8:	4501                	li	a0,0
800057ba:	2eb000ef          	jal	800062a4 <board_hb_led_write>
        board_delay_ms(500);
800057be:	1f400513          	li	a0,500
800057c2:	2cf000ef          	jal	80006290 <board_delay_ms>
        printf("hello world\n");
800057c6:	bfe1                	j	8000579e <main+0x1e>

800057c8 <__libc_init_array>:
 * to prevent been instrumented for coverage analysis when GCOV=1 is applied.
 */
/* Iterate over all the init routines.  */
void __libc_init_array(void) __attribute__((no_profile_instrument_function));
void __libc_init_array(void)
{
800057c8:	1101                	addi	sp,sp,-32
800057ca:	ce06                	sw	ra,28(sp)
    uint32_t count;
    uint32_t i;

    count = __preinit_array_end - __preinit_array_start;
800057cc:	010807b7          	lui	a5,0x1080
800057d0:	1c878713          	addi	a4,a5,456 # 10801c8 <__sf>
800057d4:	010807b7          	lui	a5,0x1080
800057d8:	1c878793          	addi	a5,a5,456 # 10801c8 <__sf>
800057dc:	40f707b3          	sub	a5,a4,a5
800057e0:	8789                	srai	a5,a5,0x2
800057e2:	c43e                	sw	a5,8(sp)
    for (i = 0; i < count; i++) {
800057e4:	c602                	sw	zero,12(sp)
800057e6:	a829                	j	80005800 <__libc_init_array+0x38>
        __preinit_array_start[i]();
800057e8:	010807b7          	lui	a5,0x1080
800057ec:	1c878713          	addi	a4,a5,456 # 10801c8 <__sf>
800057f0:	47b2                	lw	a5,12(sp)
800057f2:	078a                	slli	a5,a5,0x2
800057f4:	97ba                	add	a5,a5,a4
800057f6:	439c                	lw	a5,0(a5)
800057f8:	9782                	jalr	a5
    for (i = 0; i < count; i++) {
800057fa:	47b2                	lw	a5,12(sp)
800057fc:	0785                	addi	a5,a5,1
800057fe:	c63e                	sw	a5,12(sp)
80005800:	4732                	lw	a4,12(sp)
80005802:	47a2                	lw	a5,8(sp)
80005804:	fef762e3          	bltu	a4,a5,800057e8 <__libc_init_array+0x20>
    }

    count = __init_array_end - __init_array_start;
80005808:	010807b7          	lui	a5,0x1080
8000580c:	1c878713          	addi	a4,a5,456 # 10801c8 <__sf>
80005810:	010807b7          	lui	a5,0x1080
80005814:	1c878793          	addi	a5,a5,456 # 10801c8 <__sf>
80005818:	40f707b3          	sub	a5,a4,a5
8000581c:	8789                	srai	a5,a5,0x2
8000581e:	c43e                	sw	a5,8(sp)
    for (i = 0; i < count; i++) {
80005820:	c602                	sw	zero,12(sp)
80005822:	a829                	j	8000583c <__libc_init_array+0x74>
        __init_array_start[i]();
80005824:	010807b7          	lui	a5,0x1080
80005828:	1c878713          	addi	a4,a5,456 # 10801c8 <__sf>
8000582c:	47b2                	lw	a5,12(sp)
8000582e:	078a                	slli	a5,a5,0x2
80005830:	97ba                	add	a5,a5,a4
80005832:	439c                	lw	a5,0(a5)
80005834:	9782                	jalr	a5
    for (i = 0; i < count; i++) {
80005836:	47b2                	lw	a5,12(sp)
80005838:	0785                	addi	a5,a5,1
8000583a:	c63e                	sw	a5,12(sp)
8000583c:	4732                	lw	a4,12(sp)
8000583e:	47a2                	lw	a5,8(sp)
80005840:	fef762e3          	bltu	a4,a5,80005824 <__libc_init_array+0x5c>
    }
}
80005844:	0001                	nop
80005846:	0001                	nop
80005848:	40f2                	lw	ra,28(sp)
8000584a:	6105                	addi	sp,sp,32
8000584c:	8082                	ret

8000584e <_clean_up>:
#define MAIN_ENTRY main
#endif
extern int MAIN_ENTRY(void);

__attribute__((weak)) void _clean_up(void)
{
8000584e:	7139                	addi	sp,sp,-64
    clear_csr(CSR_MIE, CSR_MIE_MEIE_MASK);
80005850:	6785                	lui	a5,0x1
80005852:	80078793          	addi	a5,a5,-2048 # 800 <__ramfunc_end__+0x3c8>
80005856:	3047b073          	csrc	mie,a5
}
8000585a:	0001                	nop
8000585c:	da02                	sw	zero,52(sp)
8000585e:	d802                	sw	zero,48(sp)
80005860:	e40007b7          	lui	a5,0xe4000
80005864:	d63e                	sw	a5,44(sp)
80005866:	57d2                	lw	a5,52(sp)
80005868:	d43e                	sw	a5,40(sp)
8000586a:	57c2                	lw	a5,48(sp)
8000586c:	d23e                	sw	a5,36(sp)
            (target << HPM_PLIC_THRESHOLD_SHIFT_PER_TARGET));
8000586e:	57a2                	lw	a5,40(sp)
80005870:	00c79713          	slli	a4,a5,0xc
            HPM_PLIC_THRESHOLD_OFFSET +
80005874:	57b2                	lw	a5,44(sp)
80005876:	973e                	add	a4,a4,a5
80005878:	002007b7          	lui	a5,0x200
8000587c:	97ba                	add	a5,a5,a4
    volatile uint32_t *threshold_ptr = (volatile uint32_t *)(base +
8000587e:	d03e                	sw	a5,32(sp)
    *threshold_ptr = threshold;
80005880:	5782                	lw	a5,32(sp)
80005882:	5712                	lw	a4,36(sp)
80005884:	c398                	sw	a4,0(a5)
}
80005886:	0001                	nop
 * @param[in] threshold Threshold of IRQ can be serviced
 */
ATTR_ALWAYS_INLINE static inline void intc_set_threshold(uint32_t target, uint32_t threshold)
{
    __plic_set_threshold(HPM_PLIC_BASE, target, threshold);
}
80005888:	0001                	nop
    /* clean up plic, it will help while debugging */
    disable_irq_from_intc();
    intc_m_set_threshold(0);
    for (uint32_t irq = 0; irq < 128; irq++) {
8000588a:	de02                	sw	zero,60(sp)
8000588c:	a82d                	j	800058c6 <_clean_up+0x78>
8000588e:	ce02                	sw	zero,28(sp)
80005890:	57f2                	lw	a5,60(sp)
80005892:	cc3e                	sw	a5,24(sp)
80005894:	e40007b7          	lui	a5,0xe4000
80005898:	ca3e                	sw	a5,20(sp)
8000589a:	47f2                	lw	a5,28(sp)
8000589c:	c83e                	sw	a5,16(sp)
8000589e:	47e2                	lw	a5,24(sp)
800058a0:	c63e                	sw	a5,12(sp)
            (target << HPM_PLIC_CLAIM_SHIFT_PER_TARGET));
800058a2:	47c2                	lw	a5,16(sp)
800058a4:	00c79713          	slli	a4,a5,0xc
            HPM_PLIC_CLAIM_OFFSET +
800058a8:	47d2                	lw	a5,20(sp)
800058aa:	973e                	add	a4,a4,a5
800058ac:	002007b7          	lui	a5,0x200
800058b0:	0791                	addi	a5,a5,4 # 200004 <_stack+0x178004>
800058b2:	97ba                	add	a5,a5,a4
    volatile uint32_t *claim_addr = (volatile uint32_t *)(base +
800058b4:	c43e                	sw	a5,8(sp)
    *claim_addr = irq;
800058b6:	47a2                	lw	a5,8(sp)
800058b8:	4732                	lw	a4,12(sp)
800058ba:	c398                	sw	a4,0(a5)
}
800058bc:	0001                	nop
 *
 */
ATTR_ALWAYS_INLINE static inline void intc_complete_irq(uint32_t target, uint32_t irq)
{
    __plic_complete_irq(HPM_PLIC_BASE, target, irq);
}
800058be:	0001                	nop
800058c0:	57f2                	lw	a5,60(sp)
800058c2:	0785                	addi	a5,a5,1
800058c4:	de3e                	sw	a5,60(sp)
800058c6:	5772                	lw	a4,60(sp)
800058c8:	07f00793          	li	a5,127
800058cc:	fce7f1e3          	bgeu	a5,a4,8000588e <_clean_up+0x40>
        intc_m_complete_irq(irq);
    }
    /* clear any bits left in plic enable register */
    for (uint32_t i = 0; i < 4; i++) {
800058d0:	dc02                	sw	zero,56(sp)
800058d2:	a821                	j	800058ea <_clean_up+0x9c>
        *(volatile uint32_t *)(HPM_PLIC_BASE + HPM_PLIC_ENABLE_OFFSET + (i << 2)) = 0;
800058d4:	57e2                	lw	a5,56(sp)
800058d6:	00279713          	slli	a4,a5,0x2
800058da:	e40027b7          	lui	a5,0xe4002
800058de:	97ba                	add	a5,a5,a4
800058e0:	0007a023          	sw	zero,0(a5) # e4002000 <__fast_load_addr__+0x63ff3e40>
    for (uint32_t i = 0; i < 4; i++) {
800058e4:	57e2                	lw	a5,56(sp)
800058e6:	0785                	addi	a5,a5,1
800058e8:	dc3e                	sw	a5,56(sp)
800058ea:	5762                	lw	a4,56(sp)
800058ec:	478d                	li	a5,3
800058ee:	fee7f3e3          	bgeu	a5,a4,800058d4 <_clean_up+0x86>
    }
}
800058f2:	0001                	nop
800058f4:	0001                	nop
800058f6:	6121                	addi	sp,sp,64
800058f8:	8082                	ret

800058fa <section_clear>:

/* Clear a memory section with word-aligned optimization */
static void section_clear(uint8_t *dst_start, uint8_t *dst_end)
{
800058fa:	7179                	addi	sp,sp,-48
800058fc:	c62a                	sw	a0,12(sp)
800058fe:	c42e                	sw	a1,8(sp)
    uint32_t i, size;
    uint32_t *dst_word;
    uint8_t *dst_byte;
    uint32_t word_count, byte_count;

    size = dst_end - dst_start;
80005900:	4722                	lw	a4,8(sp)
80005902:	47b2                	lw	a5,12(sp)
80005904:	40f707b3          	sub	a5,a4,a5
80005908:	d43e                	sw	a5,40(sp)
    dst_byte = dst_start;
8000590a:	47b2                	lw	a5,12(sp)
8000590c:	d23e                	sw	a5,36(sp)
    if (((uintptr_t)dst_byte & 0x3) == 0) {
8000590e:	5792                	lw	a5,36(sp)
80005910:	8b8d                	andi	a5,a5,3
80005912:	efa1                	bnez	a5,8000596a <section_clear+0x70>
        /* Word-aligned, use word clear */
        word_count = size / 4;
80005914:	57a2                	lw	a5,40(sp)
80005916:	8389                	srli	a5,a5,0x2
80005918:	d03e                	sw	a5,32(sp)
        byte_count = size % 4;
8000591a:	57a2                	lw	a5,40(sp)
8000591c:	8b8d                	andi	a5,a5,3
8000591e:	ce3e                	sw	a5,28(sp)
        dst_word = (uint32_t *)dst_byte;
80005920:	5792                	lw	a5,36(sp)
80005922:	cc3e                	sw	a5,24(sp)
        for (i = 0; i < word_count; i++) {
80005924:	d602                	sw	zero,44(sp)
80005926:	a811                	j	8000593a <section_clear+0x40>
            dst_word[i] = 0;
80005928:	57b2                	lw	a5,44(sp)
8000592a:	078a                	slli	a5,a5,0x2
8000592c:	4762                	lw	a4,24(sp)
8000592e:	97ba                	add	a5,a5,a4
80005930:	0007a023          	sw	zero,0(a5)
        for (i = 0; i < word_count; i++) {
80005934:	57b2                	lw	a5,44(sp)
80005936:	0785                	addi	a5,a5,1
80005938:	d63e                	sw	a5,44(sp)
8000593a:	5732                	lw	a4,44(sp)
8000593c:	5782                	lw	a5,32(sp)
8000593e:	fef765e3          	bltu	a4,a5,80005928 <section_clear+0x2e>
        }
        dst_byte = (uint8_t *)(dst_word + word_count);
80005942:	5782                	lw	a5,32(sp)
80005944:	078a                	slli	a5,a5,0x2
80005946:	4762                	lw	a4,24(sp)
80005948:	97ba                	add	a5,a5,a4
8000594a:	d23e                	sw	a5,36(sp)
        for (i = 0; i < byte_count; i++) {
8000594c:	d602                	sw	zero,44(sp)
8000594e:	a809                	j	80005960 <section_clear+0x66>
            dst_byte[i] = 0;
80005950:	5712                	lw	a4,36(sp)
80005952:	57b2                	lw	a5,44(sp)
80005954:	97ba                	add	a5,a5,a4
80005956:	00078023          	sb	zero,0(a5)
        for (i = 0; i < byte_count; i++) {
8000595a:	57b2                	lw	a5,44(sp)
8000595c:	0785                	addi	a5,a5,1
8000595e:	d63e                	sw	a5,44(sp)
80005960:	5732                	lw	a4,44(sp)
80005962:	47f2                	lw	a5,28(sp)
80005964:	fef766e3          	bltu	a4,a5,80005950 <section_clear+0x56>
        /* Not word-aligned, use byte clear */
        for (i = 0; i < size; i++) {
            dst_byte[i] = 0;
        }
    }
}
80005968:	a839                	j	80005986 <section_clear+0x8c>
        for (i = 0; i < size; i++) {
8000596a:	d602                	sw	zero,44(sp)
8000596c:	a809                	j	8000597e <section_clear+0x84>
            dst_byte[i] = 0;
8000596e:	5712                	lw	a4,36(sp)
80005970:	57b2                	lw	a5,44(sp)
80005972:	97ba                	add	a5,a5,a4
80005974:	00078023          	sb	zero,0(a5)
        for (i = 0; i < size; i++) {
80005978:	57b2                	lw	a5,44(sp)
8000597a:	0785                	addi	a5,a5,1
8000597c:	d63e                	sw	a5,44(sp)
8000597e:	5732                	lw	a4,44(sp)
80005980:	57a2                	lw	a5,40(sp)
80005982:	fef766e3          	bltu	a4,a5,8000596e <section_clear+0x74>
}
80005986:	0001                	nop
80005988:	6145                	addi	sp,sp,48
8000598a:	8082                	ret

8000598c <section_copy>:

/* Copy a memory section with word-aligned optimization */
static void section_copy(uint8_t *dst_start, uint8_t *dst_end, uint8_t *src_start)
{
8000598c:	7179                	addi	sp,sp,-48
8000598e:	c62a                	sw	a0,12(sp)
80005990:	c42e                	sw	a1,8(sp)
80005992:	c232                	sw	a2,4(sp)
    uint32_t i, size;
    uint32_t *dst_word, *src_word;
    uint8_t *dst_byte, *src_byte;
    uint32_t word_count, byte_count;

    size = dst_end - dst_start;
80005994:	4722                	lw	a4,8(sp)
80005996:	47b2                	lw	a5,12(sp)
80005998:	40f707b3          	sub	a5,a4,a5
8000599c:	d43e                	sw	a5,40(sp)
    dst_byte = dst_start;
8000599e:	47b2                	lw	a5,12(sp)
800059a0:	d23e                	sw	a5,36(sp)
    src_byte = src_start;
800059a2:	4792                	lw	a5,4(sp)
800059a4:	d03e                	sw	a5,32(sp)
    if ((((uintptr_t)dst_byte & 0x3) == 0) && (((uintptr_t)src_byte & 0x3) == 0)) {
800059a6:	5792                	lw	a5,36(sp)
800059a8:	8b8d                	andi	a5,a5,3
800059aa:	efbd                	bnez	a5,80005a28 <section_copy+0x9c>
800059ac:	5782                	lw	a5,32(sp)
800059ae:	8b8d                	andi	a5,a5,3
800059b0:	efa5                	bnez	a5,80005a28 <section_copy+0x9c>
        /* Both addresses are word-aligned, use word copy */
        word_count = size / 4;
800059b2:	57a2                	lw	a5,40(sp)
800059b4:	8389                	srli	a5,a5,0x2
800059b6:	ce3e                	sw	a5,28(sp)
        byte_count = size % 4;
800059b8:	57a2                	lw	a5,40(sp)
800059ba:	8b8d                	andi	a5,a5,3
800059bc:	cc3e                	sw	a5,24(sp)
        dst_word = (uint32_t *)dst_byte;
800059be:	5792                	lw	a5,36(sp)
800059c0:	ca3e                	sw	a5,20(sp)
        src_word = (uint32_t *)src_byte;
800059c2:	5782                	lw	a5,32(sp)
800059c4:	c83e                	sw	a5,16(sp)
        for (i = 0; i < word_count; i++) {
800059c6:	d602                	sw	zero,44(sp)
800059c8:	a831                	j	800059e4 <section_copy+0x58>
            dst_word[i] = src_word[i];
800059ca:	57b2                	lw	a5,44(sp)
800059cc:	078a                	slli	a5,a5,0x2
800059ce:	4742                	lw	a4,16(sp)
800059d0:	973e                	add	a4,a4,a5
800059d2:	57b2                	lw	a5,44(sp)
800059d4:	078a                	slli	a5,a5,0x2
800059d6:	46d2                	lw	a3,20(sp)
800059d8:	97b6                	add	a5,a5,a3
800059da:	4318                	lw	a4,0(a4)
800059dc:	c398                	sw	a4,0(a5)
        for (i = 0; i < word_count; i++) {
800059de:	57b2                	lw	a5,44(sp)
800059e0:	0785                	addi	a5,a5,1
800059e2:	d63e                	sw	a5,44(sp)
800059e4:	5732                	lw	a4,44(sp)
800059e6:	47f2                	lw	a5,28(sp)
800059e8:	fef761e3          	bltu	a4,a5,800059ca <section_copy+0x3e>
        }
        dst_byte = (uint8_t *)(dst_word + word_count);
800059ec:	47f2                	lw	a5,28(sp)
800059ee:	078a                	slli	a5,a5,0x2
800059f0:	4752                	lw	a4,20(sp)
800059f2:	97ba                	add	a5,a5,a4
800059f4:	d23e                	sw	a5,36(sp)
        src_byte = (uint8_t *)(src_word + word_count);
800059f6:	47f2                	lw	a5,28(sp)
800059f8:	078a                	slli	a5,a5,0x2
800059fa:	4742                	lw	a4,16(sp)
800059fc:	97ba                	add	a5,a5,a4
800059fe:	d03e                	sw	a5,32(sp)
        for (i = 0; i < byte_count; i++) {
80005a00:	d602                	sw	zero,44(sp)
80005a02:	a831                	j	80005a1e <section_copy+0x92>
            dst_byte[i] = src_byte[i];
80005a04:	5702                	lw	a4,32(sp)
80005a06:	57b2                	lw	a5,44(sp)
80005a08:	973e                	add	a4,a4,a5
80005a0a:	5692                	lw	a3,36(sp)
80005a0c:	57b2                	lw	a5,44(sp)
80005a0e:	97b6                	add	a5,a5,a3
80005a10:	00074703          	lbu	a4,0(a4)
80005a14:	00e78023          	sb	a4,0(a5)
        for (i = 0; i < byte_count; i++) {
80005a18:	57b2                	lw	a5,44(sp)
80005a1a:	0785                	addi	a5,a5,1
80005a1c:	d63e                	sw	a5,44(sp)
80005a1e:	5732                	lw	a4,44(sp)
80005a20:	47e2                	lw	a5,24(sp)
80005a22:	fef761e3          	bltu	a4,a5,80005a04 <section_copy+0x78>
    if ((((uintptr_t)dst_byte & 0x3) == 0) && (((uintptr_t)src_byte & 0x3) == 0)) {
80005a26:	a02d                	j	80005a50 <section_copy+0xc4>
        }
    } else {
        /* Not word-aligned, use byte copy */
        for (i = 0; i < size; i++) {
80005a28:	d602                	sw	zero,44(sp)
80005a2a:	a831                	j	80005a46 <section_copy+0xba>
            dst_byte[i] = src_byte[i];
80005a2c:	5702                	lw	a4,32(sp)
80005a2e:	57b2                	lw	a5,44(sp)
80005a30:	973e                	add	a4,a4,a5
80005a32:	5692                	lw	a3,36(sp)
80005a34:	57b2                	lw	a5,44(sp)
80005a36:	97b6                	add	a5,a5,a3
80005a38:	00074703          	lbu	a4,0(a4)
80005a3c:	00e78023          	sb	a4,0(a5)
        for (i = 0; i < size; i++) {
80005a40:	57b2                	lw	a5,44(sp)
80005a42:	0785                	addi	a5,a5,1
80005a44:	d63e                	sw	a5,44(sp)
80005a46:	5732                	lw	a4,44(sp)
80005a48:	57a2                	lw	a5,40(sp)
80005a4a:	fef761e3          	bltu	a4,a5,80005a2c <section_copy+0xa0>
        }
    }
}
80005a4e:	0001                	nop
80005a50:	0001                	nop
80005a52:	6145                	addi	sp,sp,48
80005a54:	8082                	ret

80005a56 <c_startup>:

__attribute__((weak)) void c_startup(void)
{
80005a56:	1141                	addi	sp,sp,-16
80005a58:	c606                	sw	ra,12(sp)
    extern uint8_t __fast_ram_bss_start__[], __fast_ram_bss_end__[];
    extern uint8_t __fast_ram_init_start__[], __fast_ram_init_end__[], __fast_ram_init_load_addr__[];

#if defined(FLASH_XIP) || defined(FLASH_UF2) || defined(FLASH_DFU)
    extern uint8_t __vector_ram_start__[], __vector_ram_end__[], __vector_load_addr__[];
    section_copy(__vector_ram_start__, __vector_ram_end__, __vector_load_addr__);
80005a5a:	800037b7          	lui	a5,0x80003
80005a5e:	06078613          	addi	a2,a5,96 # 80003060 <__vector_load_addr__>
80005a62:	43800593          	li	a1,1080
80005a66:	00000513          	li	a0,0
80005a6a:	370d                	jal	8000598c <section_copy>
#endif

    /* bss section */
    section_clear(__bss_start__, __bss_end__);
80005a6c:	010807b7          	lui	a5,0x1080
80005a70:	32078593          	addi	a1,a5,800 # 1080320 <__bss_end__>
80005a74:	9c818513          	addi	a0,gp,-1592 # 10801c8 <__sf>
80005a78:	3549                	jal	800058fa <section_clear>

    /* noncacheable bss section */
    section_clear(__noncacheable_bss_start__, __noncacheable_bss_end__);
80005a7a:	011007b7          	lui	a5,0x1100
80005a7e:	00078593          	mv	a1,a5
80005a82:	011007b7          	lui	a5,0x1100
80005a86:	00078513          	mv	a0,a5
80005a8a:	3d85                	jal	800058fa <section_clear>

    /* fast_ram bss section */
    section_clear(__fast_ram_bss_start__, __fast_ram_bss_end__);
80005a8c:	000807b7          	lui	a5,0x80
80005a90:	00078593          	mv	a1,a5
80005a94:	000807b7          	lui	a5,0x80
80005a98:	00078513          	mv	a0,a5
80005a9c:	3db9                	jal	800058fa <section_clear>

    /* data section LMA: etext */
    section_copy(__data_start__, __data_end__, __data_load_addr__);
80005a9e:	8000e7b7          	lui	a5,0x8000e
80005aa2:	ff878613          	addi	a2,a5,-8 # 8000dff8 <__data_load_addr__>
80005aa6:	010807b7          	lui	a5,0x1080
80005aaa:	1c878593          	addi	a1,a5,456 # 10801c8 <__sf>
80005aae:	010807b7          	lui	a5,0x1080
80005ab2:	00078513          	mv	a0,a5
80005ab6:	3dd9                	jal	8000598c <section_copy>

    /* ramfunc section LMA: etext + data length */
    section_copy(__ramfunc_start__, __ramfunc_end__, __fast_load_addr__);
80005ab8:	8000e7b7          	lui	a5,0x8000e
80005abc:	1c078613          	addi	a2,a5,448 # 8000e1c0 <__fast_load_addr__>
80005ac0:	43800593          	li	a1,1080
80005ac4:	43800513          	li	a0,1080
80005ac8:	35d1                	jal	8000598c <section_copy>

    /* tdata section LMA: etext + data length + ramfunc length */
    section_copy(__tdata_start__, __tdata_end__, __tdata_load_addr__);
80005aca:	8000e7b7          	lui	a5,0x8000e
80005ace:	1c078613          	addi	a2,a5,448 # 8000e1c0 <__fast_load_addr__>
80005ad2:	9c818593          	addi	a1,gp,-1592 # 10801c8 <__sf>
80005ad6:	9c818513          	addi	a0,gp,-1592 # 10801c8 <__sf>
80005ada:	3d4d                	jal	8000598c <section_copy>

    /* noncacheable init section LMA: etext + data length + ramfunc length + tdata length*/
    section_copy(__noncacheable_init_start__, __noncacheable_init_end__, __noncacheable_init_load_addr__);
80005adc:	8000e7b7          	lui	a5,0x8000e
80005ae0:	1c078613          	addi	a2,a5,448 # 8000e1c0 <__fast_load_addr__>
80005ae4:	011007b7          	lui	a5,0x1100
80005ae8:	00078593          	mv	a1,a5
80005aec:	011007b7          	lui	a5,0x1100
80005af0:	00078513          	mv	a0,a5
80005af4:	3d61                	jal	8000598c <section_copy>

    /* fast_ram init section LMA: etext + data length + ramfunc length + tdata length*/
    section_copy(__fast_ram_init_start__, __fast_ram_init_end__, __fast_ram_init_load_addr__);
80005af6:	8000e7b7          	lui	a5,0x8000e
80005afa:	1c078613          	addi	a2,a5,448 # 8000e1c0 <__fast_load_addr__>
80005afe:	000807b7          	lui	a5,0x80
80005b02:	00078593          	mv	a1,a5
80005b06:	000807b7          	lui	a5,0x80
80005b0a:	00078513          	mv	a0,a5
80005b0e:	3dbd                	jal	8000598c <section_copy>
}
80005b10:	0001                	nop
80005b12:	40b2                	lw	ra,12(sp)
80005b14:	0141                	addi	sp,sp,16
80005b16:	8082                	ret

80005b18 <reset_handler>:
        ;
    }
}

__attribute__((weak)) void reset_handler(void)
{
80005b18:	1141                	addi	sp,sp,-16
80005b1a:	c606                	sw	ra,12(sp)
    fencei();
80005b1c:	0000100f          	fence.i

    /* Call platform specific hardware initialization */
    system_init();
80005b20:	2f1000ef          	jal	80006610 <system_init>

    /* Entry function */
    MAIN_ENTRY();
80005b24:	39b1                	jal	80005780 <main>
}
80005b26:	0001                	nop
80005b28:	40b2                	lw	ra,12(sp)
80005b2a:	0141                	addi	sp,sp,16
80005b2c:	8082                	ret

80005b2e <_init>:
__attribute__((weak)) void *__dso_handle = (void *) &__dso_handle;
#endif

__attribute__((weak)) void _init(void)
{
}
80005b2e:	0001                	nop
80005b30:	8082                	ret

80005b32 <mchtmr_isr>:
}
80005b32:	0001                	nop
80005b34:	8082                	ret

80005b36 <swi_isr>:
}
80005b36:	0001                	nop
80005b38:	8082                	ret

80005b3a <syscall_handler>:
{
80005b3a:	1101                	addi	sp,sp,-32
80005b3c:	ce2a                	sw	a0,28(sp)
80005b3e:	cc2e                	sw	a1,24(sp)
80005b40:	ca32                	sw	a2,20(sp)
80005b42:	c836                	sw	a3,16(sp)
80005b44:	c63a                	sw	a4,12(sp)
}
80005b46:	0001                	nop
80005b48:	6105                	addi	sp,sp,32
80005b4a:	8082                	ret

80005b4c <exception_handler>:
{
80005b4c:	1141                	addi	sp,sp,-16
80005b4e:	c62a                	sw	a0,12(sp)
80005b50:	c42e                	sw	a1,8(sp)
    switch (cause) {
80005b52:	4732                	lw	a4,12(sp)
80005b54:	47bd                	li	a5,15
80005b56:	0cf70563          	beq	a4,a5,80005c20 <exception_handler+0xd4>
80005b5a:	4732                	lw	a4,12(sp)
80005b5c:	47bd                	li	a5,15
80005b5e:	0ce7c363          	blt	a5,a4,80005c24 <exception_handler+0xd8>
80005b62:	4732                	lw	a4,12(sp)
80005b64:	47b5                	li	a5,13
80005b66:	0cf70163          	beq	a4,a5,80005c28 <exception_handler+0xdc>
80005b6a:	4732                	lw	a4,12(sp)
80005b6c:	47b5                	li	a5,13
80005b6e:	0ae7cb63          	blt	a5,a4,80005c24 <exception_handler+0xd8>
80005b72:	4732                	lw	a4,12(sp)
80005b74:	47b1                	li	a5,12
80005b76:	0af70b63          	beq	a4,a5,80005c2c <exception_handler+0xe0>
80005b7a:	4732                	lw	a4,12(sp)
80005b7c:	47b1                	li	a5,12
80005b7e:	0ae7c363          	blt	a5,a4,80005c24 <exception_handler+0xd8>
80005b82:	4732                	lw	a4,12(sp)
80005b84:	47ad                	li	a5,11
80005b86:	0af70563          	beq	a4,a5,80005c30 <exception_handler+0xe4>
80005b8a:	4732                	lw	a4,12(sp)
80005b8c:	47ad                	li	a5,11
80005b8e:	08e7cb63          	blt	a5,a4,80005c24 <exception_handler+0xd8>
80005b92:	4732                	lw	a4,12(sp)
80005b94:	47a5                	li	a5,9
80005b96:	08f70f63          	beq	a4,a5,80005c34 <exception_handler+0xe8>
80005b9a:	4732                	lw	a4,12(sp)
80005b9c:	47a5                	li	a5,9
80005b9e:	08e7c363          	blt	a5,a4,80005c24 <exception_handler+0xd8>
80005ba2:	4732                	lw	a4,12(sp)
80005ba4:	47a1                	li	a5,8
80005ba6:	08f70963          	beq	a4,a5,80005c38 <exception_handler+0xec>
80005baa:	4732                	lw	a4,12(sp)
80005bac:	47a1                	li	a5,8
80005bae:	06e7cb63          	blt	a5,a4,80005c24 <exception_handler+0xd8>
80005bb2:	4732                	lw	a4,12(sp)
80005bb4:	479d                	li	a5,7
80005bb6:	08f70363          	beq	a4,a5,80005c3c <exception_handler+0xf0>
80005bba:	4732                	lw	a4,12(sp)
80005bbc:	479d                	li	a5,7
80005bbe:	06e7c363          	blt	a5,a4,80005c24 <exception_handler+0xd8>
80005bc2:	4732                	lw	a4,12(sp)
80005bc4:	4799                	li	a5,6
80005bc6:	06f70d63          	beq	a4,a5,80005c40 <exception_handler+0xf4>
80005bca:	4732                	lw	a4,12(sp)
80005bcc:	4799                	li	a5,6
80005bce:	04e7cb63          	blt	a5,a4,80005c24 <exception_handler+0xd8>
80005bd2:	4732                	lw	a4,12(sp)
80005bd4:	4795                	li	a5,5
80005bd6:	06f70763          	beq	a4,a5,80005c44 <exception_handler+0xf8>
80005bda:	4732                	lw	a4,12(sp)
80005bdc:	4795                	li	a5,5
80005bde:	04e7c363          	blt	a5,a4,80005c24 <exception_handler+0xd8>
80005be2:	4732                	lw	a4,12(sp)
80005be4:	4791                	li	a5,4
80005be6:	06f70163          	beq	a4,a5,80005c48 <exception_handler+0xfc>
80005bea:	4732                	lw	a4,12(sp)
80005bec:	4791                	li	a5,4
80005bee:	02e7cb63          	blt	a5,a4,80005c24 <exception_handler+0xd8>
80005bf2:	4732                	lw	a4,12(sp)
80005bf4:	478d                	li	a5,3
80005bf6:	04f70b63          	beq	a4,a5,80005c4c <exception_handler+0x100>
80005bfa:	4732                	lw	a4,12(sp)
80005bfc:	478d                	li	a5,3
80005bfe:	02e7c363          	blt	a5,a4,80005c24 <exception_handler+0xd8>
80005c02:	4732                	lw	a4,12(sp)
80005c04:	4789                	li	a5,2
80005c06:	04f70563          	beq	a4,a5,80005c50 <exception_handler+0x104>
80005c0a:	4732                	lw	a4,12(sp)
80005c0c:	4789                	li	a5,2
80005c0e:	00e7cb63          	blt	a5,a4,80005c24 <exception_handler+0xd8>
80005c12:	47b2                	lw	a5,12(sp)
80005c14:	c3a1                	beqz	a5,80005c54 <exception_handler+0x108>
80005c16:	4732                	lw	a4,12(sp)
80005c18:	4785                	li	a5,1
80005c1a:	02f70f63          	beq	a4,a5,80005c58 <exception_handler+0x10c>
        break;
80005c1e:	a019                	j	80005c24 <exception_handler+0xd8>
        break;
80005c20:	0001                	nop
80005c22:	a825                	j	80005c5a <exception_handler+0x10e>
        break;
80005c24:	0001                	nop
80005c26:	a815                	j	80005c5a <exception_handler+0x10e>
        break;
80005c28:	0001                	nop
80005c2a:	a805                	j	80005c5a <exception_handler+0x10e>
        break;
80005c2c:	0001                	nop
80005c2e:	a035                	j	80005c5a <exception_handler+0x10e>
        break;
80005c30:	0001                	nop
80005c32:	a025                	j	80005c5a <exception_handler+0x10e>
        break;
80005c34:	0001                	nop
80005c36:	a015                	j	80005c5a <exception_handler+0x10e>
        break;
80005c38:	0001                	nop
80005c3a:	a005                	j	80005c5a <exception_handler+0x10e>
        break;
80005c3c:	0001                	nop
80005c3e:	a831                	j	80005c5a <exception_handler+0x10e>
        break;
80005c40:	0001                	nop
80005c42:	a821                	j	80005c5a <exception_handler+0x10e>
        break;
80005c44:	0001                	nop
80005c46:	a811                	j	80005c5a <exception_handler+0x10e>
        break;
80005c48:	0001                	nop
80005c4a:	a801                	j	80005c5a <exception_handler+0x10e>
        break;
80005c4c:	0001                	nop
80005c4e:	a031                	j	80005c5a <exception_handler+0x10e>
        break;
80005c50:	0001                	nop
80005c52:	a021                	j	80005c5a <exception_handler+0x10e>
        break;
80005c54:	0001                	nop
80005c56:	a011                	j	80005c5a <exception_handler+0x10e>
        break;
80005c58:	0001                	nop
    return epc;
80005c5a:	47a2                	lw	a5,8(sp)
}
80005c5c:	853e                	mv	a0,a5
80005c5e:	0141                	addi	sp,sp,16
80005c60:	8082                	ret

80005c62 <l1c_dc_enable>:
    }
#endif
}

void l1c_dc_enable(void)
{
80005c62:	1101                	addi	sp,sp,-32
80005c64:	ce06                	sw	ra,28(sp)
#endif

/* get cache control register value */
ATTR_ALWAYS_INLINE static inline uint32_t l1c_get_control(void)
{
    return read_csr(CSR_MCACHE_CTL);
80005c66:	7ca027f3          	csrr	a5,0x7ca
80005c6a:	c63e                	sw	a5,12(sp)
80005c6c:	47b2                	lw	a5,12(sp)
80005c6e:	0001                	nop
}

ATTR_ALWAYS_INLINE static inline bool l1c_dc_is_enabled(void)
{
    return l1c_get_control() & HPM_MCACHE_CTL_DC_EN_MASK;
80005c70:	8b89                	andi	a5,a5,2
80005c72:	8385                	srli	a5,a5,0x1
80005c74:	8b85                	andi	a5,a5,1
80005c76:	0ff7f793          	zext.b	a5,a5
    if (!l1c_dc_is_enabled()) {
80005c7a:	0017c793          	xori	a5,a5,1
80005c7e:	0ff7f793          	zext.b	a5,a5
80005c82:	c791                	beqz	a5,80005c8e <l1c_dc_enable+0x2c>
#ifdef L1C_DC_DISABLE_WRITEAROUND_ON_ENABLE
        l1c_dc_disable_writearound();
#else
        l1c_dc_enable_writearound();
80005c84:	2899                	jal	80005cda <l1c_dc_enable_writearound>
#endif
        set_csr(CSR_MCACHE_CTL, HPM_MCACHE_CTL_DPREF_EN_MASK | HPM_MCACHE_CTL_DC_EN_MASK);
80005c86:	40200793          	li	a5,1026
80005c8a:	7ca7a073          	csrs	0x7ca,a5
    }
}
80005c8e:	0001                	nop
80005c90:	40f2                	lw	ra,28(sp)
80005c92:	6105                	addi	sp,sp,32
80005c94:	8082                	ret

80005c96 <l1c_ic_enable>:
        clear_csr(CSR_MCACHE_CTL, HPM_MCACHE_CTL_DC_EN_MASK);
    }
}

void l1c_ic_enable(void)
{
80005c96:	1141                	addi	sp,sp,-16
    return read_csr(CSR_MCACHE_CTL);
80005c98:	7ca027f3          	csrr	a5,0x7ca
80005c9c:	c63e                	sw	a5,12(sp)
80005c9e:	47b2                	lw	a5,12(sp)
80005ca0:	0001                	nop
}

ATTR_ALWAYS_INLINE static inline bool l1c_ic_is_enabled(void)
{
    return l1c_get_control() & HPM_MCACHE_CTL_IC_EN_MASK;
80005ca2:	8b85                	andi	a5,a5,1
80005ca4:	8b85                	andi	a5,a5,1
80005ca6:	0ff7f793          	zext.b	a5,a5
    if (!l1c_ic_is_enabled()) {
80005caa:	0017c793          	xori	a5,a5,1
80005cae:	0ff7f793          	zext.b	a5,a5
80005cb2:	c789                	beqz	a5,80005cbc <l1c_ic_enable+0x26>
        set_csr(CSR_MCACHE_CTL, HPM_MCACHE_CTL_IPREF_EN_MASK
80005cb4:	30100793          	li	a5,769
80005cb8:	7ca7a073          	csrs	0x7ca,a5
                              | HPM_MCACHE_CTL_CCTL_SUEN_MASK
                              | HPM_MCACHE_CTL_IC_EN_MASK);
    }
}
80005cbc:	0001                	nop
80005cbe:	0141                	addi	sp,sp,16
80005cc0:	8082                	ret

80005cc2 <l1c_dc_invalidate_all>:
{
    __asm("fence.i");
}

void l1c_dc_invalidate_all(void)
{
80005cc2:	1141                	addi	sp,sp,-16
80005cc4:	47dd                	li	a5,23
80005cc6:	00f107a3          	sb	a5,15(sp)
}

/* send command */
ATTR_ALWAYS_INLINE static inline void l1c_cctl_cmd(uint8_t cmd)
{
    write_csr(CSR_MCCTLCOMMAND, cmd);
80005cca:	00f14783          	lbu	a5,15(sp)
80005cce:	7cc79073          	csrw	0x7cc,a5
}
80005cd2:	0001                	nop
    l1c_cctl_cmd(HPM_L1C_CCTL_CMD_L1D_INVAL_ALL);
}
80005cd4:	0001                	nop
80005cd6:	0141                	addi	sp,sp,16
80005cd8:	8082                	ret

80005cda <l1c_dc_enable_writearound>:
    l1c_op(HPM_L1C_CCTL_CMD_L1I_VA_UNLOCK, address, size);
}

void l1c_dc_enable_writearound(void)
{
    set_csr(CSR_MCACHE_CTL, HPM_MCACHE_CTL_DC_WAROUND_MASK);
80005cda:	6799                	lui	a5,0x6
80005cdc:	7ca7a073          	csrs	0x7ca,a5
}
80005ce0:	0001                	nop
80005ce2:	8082                	ret

80005ce4 <init_uart0_pins>:


/* PY port IO needs to configure PIOC as well */
void init_uart0_pins(void)
{
    HPM_IOC->PAD[IOC_PAD_PY07].FUNC_CTL = IOC_PY07_FUNC_CTL_UART0_RXD;
80005ce4:	f4040737          	lui	a4,0xf4040
80005ce8:	6785                	lui	a5,0x1
80005cea:	97ba                	add	a5,a5,a4
80005cec:	4709                	li	a4,2
80005cee:	e2e7ac23          	sw	a4,-456(a5) # e38 <__ramfunc_end__+0xa00>
    HPM_PIOC->PAD[IOC_PAD_PY07].FUNC_CTL = PIOC_PY07_FUNC_CTL_SOC_PY_07;
80005cf2:	f40d8737          	lui	a4,0xf40d8
80005cf6:	6785                	lui	a5,0x1
80005cf8:	97ba                	add	a5,a5,a4
80005cfa:	470d                	li	a4,3
80005cfc:	e2e7ac23          	sw	a4,-456(a5) # e38 <__ramfunc_end__+0xa00>

    HPM_IOC->PAD[IOC_PAD_PY06].FUNC_CTL = IOC_PY06_FUNC_CTL_UART0_TXD;
80005d00:	f4040737          	lui	a4,0xf4040
80005d04:	6785                	lui	a5,0x1
80005d06:	97ba                	add	a5,a5,a4
80005d08:	4709                	li	a4,2
80005d0a:	e2e7a823          	sw	a4,-464(a5) # e30 <__ramfunc_end__+0x9f8>
    HPM_PIOC->PAD[IOC_PAD_PY06].FUNC_CTL = PIOC_PY06_FUNC_CTL_SOC_PY_06;
80005d0e:	f40d8737          	lui	a4,0xf40d8
80005d12:	6785                	lui	a5,0x1
80005d14:	97ba                	add	a5,a5,a4
80005d16:	470d                	li	a4,3
80005d18:	e2e7a823          	sw	a4,-464(a5) # e30 <__ramfunc_end__+0x9f8>
}
80005d1c:	0001                	nop
80005d1e:	8082                	ret

80005d20 <init_uart6_pins>:

void init_uart6_pins(void)
{
    HPM_IOC->PAD[IOC_PAD_PE27].FUNC_CTL = IOC_PE27_FUNC_CTL_UART6_RXD;
80005d20:	f40407b7          	lui	a5,0xf4040
80005d24:	4709                	li	a4,2
80005d26:	4ce7ac23          	sw	a4,1240(a5) # f40404d8 <__fast_load_addr__+0x74032318>

    HPM_IOC->PAD[IOC_PAD_PE28].FUNC_CTL = IOC_PE28_FUNC_CTL_UART6_TXD;
80005d2a:	f40407b7          	lui	a5,0xf4040
80005d2e:	4709                	li	a4,2
80005d30:	4ee7a023          	sw	a4,1248(a5) # f40404e0 <__fast_load_addr__+0x74032320>
}
80005d34:	0001                	nop
80005d36:	8082                	ret

80005d38 <init_uart7_pins>:

void init_uart7_pins(void)
{
    HPM_IOC->PAD[IOC_PAD_PC02].FUNC_CTL = IOC_PC02_FUNC_CTL_UART7_RXD;
80005d38:	f40407b7          	lui	a5,0xf4040
80005d3c:	4709                	li	a4,2
80005d3e:	20e7a823          	sw	a4,528(a5) # f4040210 <__fast_load_addr__+0x74032050>

    HPM_IOC->PAD[IOC_PAD_PC03].FUNC_CTL = IOC_PC03_FUNC_CTL_UART7_TXD;
80005d42:	f40407b7          	lui	a5,0xf4040
80005d46:	4709                	li	a4,2
80005d48:	20e7ac23          	sw	a4,536(a5) # f4040218 <__fast_load_addr__+0x74032058>
}
80005d4c:	0001                	nop
80005d4e:	8082                	ret

80005d50 <init_uart13_pins>:

/* PZ port IO needs to configure BIOC as well */
void init_uart13_pins(void)
{
    HPM_IOC->PAD[IOC_PAD_PZ08].FUNC_CTL = IOC_PZ08_FUNC_CTL_UART13_RXD;
80005d50:	f4040737          	lui	a4,0xf4040
80005d54:	6785                	lui	a5,0x1
80005d56:	97ba                	add	a5,a5,a4
80005d58:	4709                	li	a4,2
80005d5a:	f4e7a023          	sw	a4,-192(a5) # f40 <__ramfunc_end__+0xb08>
    HPM_BIOC->PAD[IOC_PAD_PZ08].FUNC_CTL = BIOC_PZ08_FUNC_CTL_SOC_PZ_08;
80005d5e:	f5010737          	lui	a4,0xf5010
80005d62:	6785                	lui	a5,0x1
80005d64:	97ba                	add	a5,a5,a4
80005d66:	470d                	li	a4,3
80005d68:	f4e7a023          	sw	a4,-192(a5) # f40 <__ramfunc_end__+0xb08>

    HPM_IOC->PAD[IOC_PAD_PZ09].FUNC_CTL = IOC_PZ09_FUNC_CTL_UART13_TXD;
80005d6c:	f4040737          	lui	a4,0xf4040
80005d70:	6785                	lui	a5,0x1
80005d72:	97ba                	add	a5,a5,a4
80005d74:	4709                	li	a4,2
80005d76:	f4e7a423          	sw	a4,-184(a5) # f48 <__ramfunc_end__+0xb10>
    HPM_BIOC->PAD[IOC_PAD_PZ09].FUNC_CTL = BIOC_PZ09_FUNC_CTL_SOC_PZ_09;
80005d7a:	f5010737          	lui	a4,0xf5010
80005d7e:	6785                	lui	a5,0x1
80005d80:	97ba                	add	a5,a5,a4
80005d82:	470d                	li	a4,3
80005d84:	f4e7a423          	sw	a4,-184(a5) # f48 <__ramfunc_end__+0xb10>
}
80005d88:	0001                	nop
80005d8a:	8082                	ret

80005d8c <init_uart14_pins>:

/* PZ port IO needs to configure BIOC as well */
void init_uart14_pins(void)
{
    HPM_IOC->PAD[IOC_PAD_PZ10].FUNC_CTL = IOC_PZ10_FUNC_CTL_UART14_RXD;
80005d8c:	f4040737          	lui	a4,0xf4040
80005d90:	6785                	lui	a5,0x1
80005d92:	97ba                	add	a5,a5,a4
80005d94:	4709                	li	a4,2
80005d96:	f4e7a823          	sw	a4,-176(a5) # f50 <__ramfunc_end__+0xb18>
    HPM_BIOC->PAD[IOC_PAD_PZ10].FUNC_CTL = BIOC_PZ10_FUNC_CTL_SOC_PZ_10;
80005d9a:	f5010737          	lui	a4,0xf5010
80005d9e:	6785                	lui	a5,0x1
80005da0:	97ba                	add	a5,a5,a4
80005da2:	470d                	li	a4,3
80005da4:	f4e7a823          	sw	a4,-176(a5) # f50 <__ramfunc_end__+0xb18>

    HPM_IOC->PAD[IOC_PAD_PZ11].FUNC_CTL = IOC_PZ11_FUNC_CTL_UART14_TXD;
80005da8:	f4040737          	lui	a4,0xf4040
80005dac:	6785                	lui	a5,0x1
80005dae:	97ba                	add	a5,a5,a4
80005db0:	4709                	li	a4,2
80005db2:	f4e7ac23          	sw	a4,-168(a5) # f58 <__ramfunc_end__+0xb20>
    HPM_BIOC->PAD[IOC_PAD_PZ11].FUNC_CTL = BIOC_PZ11_FUNC_CTL_SOC_PZ_11;
80005db6:	f5010737          	lui	a4,0xf5010
80005dba:	6785                	lui	a5,0x1
80005dbc:	97ba                	add	a5,a5,a4
80005dbe:	470d                	li	a4,3
80005dc0:	f4e7ac23          	sw	a4,-168(a5) # f58 <__ramfunc_end__+0xb20>
}
80005dc4:	0001                	nop
80005dc6:	8082                	ret

80005dc8 <init_puart_pins>:

void init_puart_pins(void)
{
    HPM_PIOC->PAD[IOC_PAD_PY06].FUNC_CTL = PIOC_PY06_FUNC_CTL_PUART_TXD;
80005dc8:	f40d8737          	lui	a4,0xf40d8
80005dcc:	6785                	lui	a5,0x1
80005dce:	97ba                	add	a5,a5,a4
80005dd0:	4705                	li	a4,1
80005dd2:	e2e7a823          	sw	a4,-464(a5) # e30 <__ramfunc_end__+0x9f8>

    HPM_PIOC->PAD[IOC_PAD_PY07].FUNC_CTL = PIOC_PY07_FUNC_CTL_PUART_RXD;
80005dd6:	f40d8737          	lui	a4,0xf40d8
80005dda:	6785                	lui	a5,0x1
80005ddc:	97ba                	add	a5,a5,a4
80005dde:	4705                	li	a4,1
80005de0:	e2e7ac23          	sw	a4,-456(a5) # e38 <__ramfunc_end__+0xa00>
}
80005de4:	0001                	nop
80005de6:	8082                	ret

80005de8 <init_board_clock>:
#include "hpm_clock_drv.h"
#include "hpm_pllctl_drv.h"


void init_board_clock(void)
{
80005de8:	1141                	addi	sp,sp,-16
80005dea:	c606                	sw	ra,12(sp)
    clock_add_to_group(clock_cpu0, 0);
80005dec:	4581                	li	a1,0
80005dee:	4501                	li	a0,0
80005df0:	082010ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_mchtmr0, 0);
80005df4:	4581                	li	a1,0
80005df6:	010807b7          	lui	a5,0x1080
80005dfa:	00178513          	addi	a0,a5,1 # 1080001 <_impure_data+0x1>
80005dfe:	074010ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_axi0, 0);
80005e02:	4581                	li	a1,0
80005e04:	010107b7          	lui	a5,0x1010
80005e08:	00478513          	addi	a0,a5,4 # 1010004 <_extram_size+0x10004>
80005e0c:	066010ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_axi1, 0);
80005e10:	4581                	li	a1,0
80005e12:	010207b7          	lui	a5,0x1020
80005e16:	00578513          	addi	a0,a5,5 # 1020005 <_extram_size+0x20005>
80005e1a:	058010ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_axi2, 0);
80005e1e:	4581                	li	a1,0
80005e20:	010307b7          	lui	a5,0x1030
80005e24:	00678513          	addi	a0,a5,6 # 1030006 <_extram_size+0x30006>
80005e28:	04a010ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_ahb, 0);
80005e2c:	4581                	li	a1,0
80005e2e:	010007b7          	lui	a5,0x1000
80005e32:	00778513          	addi	a0,a5,7 # 1000007 <_extram_size+0x7>
80005e36:	03c010ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_xdma, 0);
80005e3a:	4581                	li	a1,0
80005e3c:	011207b7          	lui	a5,0x1120
80005e40:	60178513          	addi	a0,a5,1537 # 1120601 <__noncacheable_bss_end__+0x20601>
80005e44:	02e010ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_hdma, 0);
80005e48:	4581                	li	a1,0
80005e4a:	011107b7          	lui	a5,0x1110
80005e4e:	50478513          	addi	a0,a5,1284 # 1110504 <__noncacheable_bss_end__+0x10504>
80005e52:	020010ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_xpi0, 0);
80005e56:	4581                	li	a1,0
80005e58:	010c07b7          	lui	a5,0x10c0
80005e5c:	00978513          	addi	a0,a5,9 # 10c0009 <__global_pointer$+0x3f809>
80005e60:	012010ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_xpi1, 0);
80005e64:	4581                	li	a1,0
80005e66:	010d07b7          	lui	a5,0x10d0
80005e6a:	00a78513          	addi	a0,a5,10 # 10d000a <__global_pointer$+0x4f80a>
80005e6e:	004010ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_ram0, 0);
80005e72:	4581                	li	a1,0
80005e74:	010a07b7          	lui	a5,0x10a0
80005e78:	60378513          	addi	a0,a5,1539 # 10a0603 <__global_pointer$+0x1fe03>
80005e7c:	7f7000ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_ram1, 0);
80005e80:	4581                	li	a1,0
80005e82:	010b07b7          	lui	a5,0x10b0
80005e86:	60478513          	addi	a0,a5,1540 # 10b0604 <__global_pointer$+0x2fe04>
80005e8a:	7e9000ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_lmm0, 0);
80005e8e:	4581                	li	a1,0
80005e90:	010617b7          	lui	a5,0x1061
80005e94:	90078513          	addi	a0,a5,-1792 # 1060900 <_extram_size+0x60900>
80005e98:	7db000ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_lmm1, 0);
80005e9c:	4581                	li	a1,0
80005e9e:	010717b7          	lui	a5,0x1071
80005ea2:	a0078513          	addi	a0,a5,-1536 # 1070a00 <_extram_size+0x70a00>
80005ea6:	7cd000ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_gpio, 0);
80005eaa:	4581                	li	a1,0
80005eac:	011307b7          	lui	a5,0x1130
80005eb0:	50178513          	addi	a0,a5,1281 # 1130501 <__noncacheable_bss_end__+0x30501>
80005eb4:	7bf000ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_mot0, 0);
80005eb8:	4581                	li	a1,0
80005eba:	014b07b7          	lui	a5,0x14b0
80005ebe:	50678513          	addi	a0,a5,1286 # 14b0506 <__share_mem_end__+0x330506>
80005ec2:	7b1000ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_mot1, 0);
80005ec6:	4581                	li	a1,0
80005ec8:	014c07b7          	lui	a5,0x14c0
80005ecc:	50778513          	addi	a0,a5,1287 # 14c0507 <__share_mem_end__+0x340507>
80005ed0:	7a3000ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_mot2, 0);
80005ed4:	4581                	li	a1,0
80005ed6:	014d07b7          	lui	a5,0x14d0
80005eda:	50878513          	addi	a0,a5,1288 # 14d0508 <__share_mem_end__+0x350508>
80005ede:	795000ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_mot3, 0);
80005ee2:	4581                	li	a1,0
80005ee4:	014e07b7          	lui	a5,0x14e0
80005ee8:	50978513          	addi	a0,a5,1289 # 14e0509 <__share_mem_end__+0x360509>
80005eec:	787000ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_synt, 0);
80005ef0:	4581                	li	a1,0
80005ef2:	014a07b7          	lui	a5,0x14a0
80005ef6:	50c78513          	addi	a0,a5,1292 # 14a050c <__share_mem_end__+0x32050c>
80005efa:	779000ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_ptpc, 0);
80005efe:	4581                	li	a1,0
80005f00:	013e07b7          	lui	a5,0x13e0
80005f04:	02f78513          	addi	a0,a5,47 # 13e002f <__share_mem_end__+0x26002f>
80005f08:	76b000ef          	jal	80006e72 <clock_add_to_group>
}
80005f0c:	0001                	nop
80005f0e:	40b2                	lw	ra,12(sp)
80005f10:	0141                	addi	sp,sp,16
80005f12:	8082                	ret

80005f14 <init_board_cpu1_clock>:

void init_board_cpu1_clock(void)
{
80005f14:	1141                	addi	sp,sp,-16
80005f16:	c606                	sw	ra,12(sp)
    clock_add_to_group(clock_mchtmr1, 1);
80005f18:	4585                	li	a1,1
80005f1a:	010907b7          	lui	a5,0x1090
80005f1e:	00378513          	addi	a0,a5,3 # 1090003 <__global_pointer$+0xf803>
80005f22:	751000ef          	jal	80006e72 <clock_add_to_group>

    clock_add_to_group(clock_cpu1, 1);
80005f26:	4585                	li	a1,1
80005f28:	000807b7          	lui	a5,0x80
80005f2c:	00278513          	addi	a0,a5,2 # 80002 <__fast_ram_bss_end__+0x2>
80005f30:	743000ef          	jal	80006e72 <clock_add_to_group>
}
80005f34:	0001                	nop
80005f36:	40b2                	lw	ra,12(sp)
80005f38:	0141                	addi	sp,sp,16
80005f3a:	8082                	ret

80005f3c <init_board_clock_source>:

void init_board_clock_source(void)
{
80005f3c:	1141                	addi	sp,sp,-16
80005f3e:	c606                	sw	ra,12(sp)
    /* Generate clk_top_cpu0 code */
    clock_set_source_divider(clock_cpu0, clk_src_pll0_clk0, 1);
80005f40:	4605                	li	a2,1
80005f42:	4585                	li	a1,1
80005f44:	4501                	li	a0,0
80005f46:	5ed000ef          	jal	80006d32 <clock_set_source_divider>

    /* Generate clk_top_cpu1 code */
    clock_set_source_divider(clock_cpu1, clk_src_pll0_clk0, 1);
80005f4a:	4605                	li	a2,1
80005f4c:	4585                	li	a1,1
80005f4e:	000807b7          	lui	a5,0x80
80005f52:	00278513          	addi	a0,a5,2 # 80002 <__fast_ram_bss_end__+0x2>
80005f56:	5dd000ef          	jal	80006d32 <clock_set_source_divider>

    /* Generate clk_top_ahb code */
    clock_set_source_divider(clock_ahb, clk_src_pll1_clk1, 2);
80005f5a:	4609                	li	a2,2
80005f5c:	458d                	li	a1,3
80005f5e:	010007b7          	lui	a5,0x1000
80005f62:	00778513          	addi	a0,a5,7 # 1000007 <_extram_size+0x7>
80005f66:	5cd000ef          	jal	80006d32 <clock_set_source_divider>

    /* Generate clk_top_mct0 code */
    clock_set_source_divider(clock_mchtmr0, clk_src_osc24m, 1);
80005f6a:	4605                	li	a2,1
80005f6c:	4581                	li	a1,0
80005f6e:	010807b7          	lui	a5,0x1080
80005f72:	00178513          	addi	a0,a5,1 # 1080001 <_impure_data+0x1>
80005f76:	5bd000ef          	jal	80006d32 <clock_set_source_divider>

    /* Generate clk_top_mct1 code */
    clock_set_source_divider(clock_mchtmr1, clk_src_osc24m, 1);
80005f7a:	4605                	li	a2,1
80005f7c:	4581                	li	a1,0
80005f7e:	010907b7          	lui	a5,0x1090
80005f82:	00378513          	addi	a0,a5,3 # 1090003 <__global_pointer$+0xf803>
80005f86:	5ad000ef          	jal	80006d32 <clock_set_source_divider>
}
80005f8a:	0001                	nop
80005f8c:	40b2                	lw	ra,12(sp)
80005f8e:	0141                	addi	sp,sp,16
80005f90:	8082                	ret

80005f92 <init_uart0_clock>:

    clock_add_to_group(clock_femc, 0);
}

void init_uart0_clock(void)
{
80005f92:	1141                	addi	sp,sp,-16
80005f94:	c606                	sw	ra,12(sp)
    clock_add_to_group(clock_uart0, 0);
80005f96:	4581                	li	a1,0
80005f98:	012207b7          	lui	a5,0x1220
80005f9c:	01378513          	addi	a0,a5,19 # 1220013 <__share_mem_end__+0xa0013>
80005fa0:	6d3000ef          	jal	80006e72 <clock_add_to_group>
}
80005fa4:	0001                	nop
80005fa6:	40b2                	lw	ra,12(sp)
80005fa8:	0141                	addi	sp,sp,16
80005faa:	8082                	ret

80005fac <sysctl_clock_set_preset>:
 * @param[in] ptr SYSCTL_Type base address
 * @param[in] preset preset
 */
static inline void sysctl_clock_set_preset(SYSCTL_Type *ptr,
                                           sysctl_preset_t preset)
{
80005fac:	1141                	addi	sp,sp,-16
80005fae:	c62a                	sw	a0,12(sp)
80005fb0:	c42e                	sw	a1,8(sp)
    ptr->GLOBAL00 = (ptr->GLOBAL00 & ~SYSCTL_GLOBAL00_PRESET_MASK)
80005fb2:	4732                	lw	a4,12(sp)
80005fb4:	6789                	lui	a5,0x2
80005fb6:	97ba                	add	a5,a5,a4
80005fb8:	439c                	lw	a5,0(a5)
80005fba:	ff07f713          	andi	a4,a5,-16
                | SYSCTL_GLOBAL00_PRESET_SET(preset);
80005fbe:	47a2                	lw	a5,8(sp)
80005fc0:	8bbd                	andi	a5,a5,15
80005fc2:	8f5d                	or	a4,a4,a5
    ptr->GLOBAL00 = (ptr->GLOBAL00 & ~SYSCTL_GLOBAL00_PRESET_MASK)
80005fc4:	46b2                	lw	a3,12(sp)
80005fc6:	6789                	lui	a5,0x2
80005fc8:	97b6                	add	a5,a5,a3
80005fca:	c398                	sw	a4,0(a5)
}
80005fcc:	0001                	nop
80005fce:	0141                	addi	sp,sp,16
80005fd0:	8082                	ret

80005fd2 <gptmr_check_status>:
 *
 * @param [in] ptr GPTMR base address
 * @param [in] mask channel flag mask
 */
static inline bool gptmr_check_status(GPTMR_Type *ptr, uint32_t mask)
{
80005fd2:	1141                	addi	sp,sp,-16
80005fd4:	c62a                	sw	a0,12(sp)
80005fd6:	c42e                	sw	a1,8(sp)
    return (ptr->SR & mask) == mask;
80005fd8:	47b2                	lw	a5,12(sp)
80005fda:	2007a703          	lw	a4,512(a5) # 2200 <__app_offset__+0x200>
80005fde:	47a2                	lw	a5,8(sp)
80005fe0:	8ff9                	and	a5,a5,a4
80005fe2:	4722                	lw	a4,8(sp)
80005fe4:	40f707b3          	sub	a5,a4,a5
80005fe8:	0017b793          	seqz	a5,a5
80005fec:	0ff7f793          	zext.b	a5,a5
}
80005ff0:	853e                	mv	a0,a5
80005ff2:	0141                	addi	sp,sp,16
80005ff4:	8082                	ret

80005ff6 <gptmr_clear_status>:
 *
 * @param [in] ptr GPTMR base address
 * @param [in] mask channel flag mask
 */
static inline void gptmr_clear_status(GPTMR_Type *ptr, uint32_t mask)
{
80005ff6:	1141                	addi	sp,sp,-16
80005ff8:	c62a                	sw	a0,12(sp)
80005ffa:	c42e                	sw	a1,8(sp)
    ptr->SR = mask;
80005ffc:	47b2                	lw	a5,12(sp)
80005ffe:	4722                	lw	a4,8(sp)
80006000:	20e7a023          	sw	a4,512(a5)
}
80006004:	0001                	nop
80006006:	0141                	addi	sp,sp,16
80006008:	8082                	ret

8000600a <gpio_write_pin>:
{
8000600a:	1141                	addi	sp,sp,-16
8000600c:	c62a                	sw	a0,12(sp)
8000600e:	c42e                	sw	a1,8(sp)
80006010:	87b2                	mv	a5,a2
80006012:	8736                	mv	a4,a3
80006014:	00f103a3          	sb	a5,7(sp)
80006018:	87ba                	mv	a5,a4
8000601a:	00f10323          	sb	a5,6(sp)
    if (high) {
8000601e:	00614783          	lbu	a5,6(sp)
80006022:	cf91                	beqz	a5,8000603e <gpio_write_pin+0x34>
        ptr->DO[port].SET = 1 << pin;
80006024:	00714783          	lbu	a5,7(sp)
80006028:	4705                	li	a4,1
8000602a:	00f717b3          	sll	a5,a4,a5
8000602e:	86be                	mv	a3,a5
80006030:	4732                	lw	a4,12(sp)
80006032:	47a2                	lw	a5,8(sp)
80006034:	07c1                	addi	a5,a5,16
80006036:	0792                	slli	a5,a5,0x4
80006038:	97ba                	add	a5,a5,a4
8000603a:	c3d4                	sw	a3,4(a5)
}
8000603c:	a829                	j	80006056 <gpio_write_pin+0x4c>
        ptr->DO[port].CLEAR = 1 << pin;
8000603e:	00714783          	lbu	a5,7(sp)
80006042:	4705                	li	a4,1
80006044:	00f717b3          	sll	a5,a4,a5
80006048:	86be                	mv	a3,a5
8000604a:	4732                	lw	a4,12(sp)
8000604c:	47a2                	lw	a5,8(sp)
8000604e:	07c1                	addi	a5,a5,16
80006050:	0792                	slli	a5,a5,0x4
80006052:	97ba                	add	a5,a5,a4
80006054:	c794                	sw	a3,8(a5)
}
80006056:	0001                	nop
80006058:	0141                	addi	sp,sp,16
8000605a:	8082                	ret

8000605c <pllctl_xtal_set_rampup_time>:
 * @param [in] ptr Base address of the PLLCTL peripheral
 * @param [in] cycles Number of IRC24M clock cycles for ramp-up
 * @note The ramp-up time affects crystal oscillator startup
 */
static inline void pllctl_xtal_set_rampup_time(PLLCTL_Type *ptr, uint32_t cycles)
{
8000605c:	1141                	addi	sp,sp,-16
8000605e:	c62a                	sw	a0,12(sp)
80006060:	c42e                	sw	a1,8(sp)
    ptr->XTAL = (ptr->XTAL & ~PLLCTL_XTAL_RAMP_TIME_MASK) | PLLCTL_XTAL_RAMP_TIME_SET(cycles);
80006062:	47b2                	lw	a5,12(sp)
80006064:	4398                	lw	a4,0(a5)
80006066:	fff007b7          	lui	a5,0xfff00
8000606a:	8f7d                	and	a4,a4,a5
8000606c:	47a2                	lw	a5,8(sp)
8000606e:	07b2                	slli	a5,a5,0xc
80006070:	83b1                	srli	a5,a5,0xc
80006072:	8f5d                	or	a4,a4,a5
80006074:	47b2                	lw	a5,12(sp)
80006076:	c398                	sw	a4,0(a5)
}
80006078:	0001                	nop
8000607a:	0141                	addi	sp,sp,16
8000607c:	8082                	ret

8000607e <board_init_console>:
{
8000607e:	1101                	addi	sp,sp,-32
80006080:	ce06                	sw	ra,28(sp)
    init_uart_pins((UART_Type *) BOARD_CONSOLE_UART_BASE);
80006082:	f0040537          	lui	a0,0xf0040
80006086:	29cd                	jal	80006578 <init_uart_pins>
    init_uart0_clock();
80006088:	3729                	jal	80005f92 <init_uart0_clock>
    cfg.type = BOARD_CONSOLE_TYPE;
8000608a:	c002                	sw	zero,0(sp)
    cfg.base = (uint32_t) BOARD_CONSOLE_UART_BASE;
8000608c:	f00407b7          	lui	a5,0xf0040
80006090:	c23e                	sw	a5,4(sp)
    cfg.src_freq_in_hz = clock_get_frequency(BOARD_CONSOLE_UART_CLK_NAME);
80006092:	012207b7          	lui	a5,0x1220
80006096:	01378513          	addi	a0,a5,19 # 1220013 <__share_mem_end__+0xa0013>
8000609a:	07d000ef          	jal	80006916 <clock_get_frequency>
8000609e:	87aa                	mv	a5,a0
800060a0:	c43e                	sw	a5,8(sp)
    cfg.baudrate = BOARD_CONSOLE_UART_BAUDRATE;
800060a2:	67f1                	lui	a5,0x1c
800060a4:	20078793          	addi	a5,a5,512 # 1c200 <__fw_size__+0x11040>
800060a8:	c63e                	sw	a5,12(sp)
    if (status_success != console_init(&cfg)) {
800060aa:	878a                	mv	a5,sp
800060ac:	853e                	mv	a0,a5
800060ae:	194020ef          	jal	80008242 <console_init>
800060b2:	87aa                	mv	a5,a0
800060b4:	c391                	beqz	a5,800060b8 <board_init_console+0x3a>
        while (1) {
800060b6:	a001                	j	800060b6 <board_init_console+0x38>
}
800060b8:	0001                	nop
800060ba:	40f2                	lw	ra,28(sp)
800060bc:	6105                	addi	sp,sp,32
800060be:	8082                	ret

800060c0 <board_print_clock_freq>:
{
800060c0:	1141                	addi	sp,sp,-16
800060c2:	c606                	sw	ra,12(sp)
    printf("==============================\n");
800060c4:	8000d7b7          	lui	a5,0x8000d
800060c8:	37478513          	addi	a0,a5,884 # 8000d374 <_lseek+0x3c>
800060cc:	12a030ef          	jal	800091f6 <iprintf>
    printf(" %s clock summary\n", BOARD_NAME);
800060d0:	8000d7b7          	lui	a5,0x8000d
800060d4:	39478593          	addi	a1,a5,916 # 8000d394 <_lseek+0x5c>
800060d8:	8000d7b7          	lui	a5,0x8000d
800060dc:	3a478513          	addi	a0,a5,932 # 8000d3a4 <_lseek+0x6c>
800060e0:	116030ef          	jal	800091f6 <iprintf>
    printf("==============================\n");
800060e4:	8000d7b7          	lui	a5,0x8000d
800060e8:	37478513          	addi	a0,a5,884 # 8000d374 <_lseek+0x3c>
800060ec:	10a030ef          	jal	800091f6 <iprintf>
    printf("cpu0:\t\t %luHz\n", clock_get_frequency(clock_cpu0));
800060f0:	4501                	li	a0,0
800060f2:	025000ef          	jal	80006916 <clock_get_frequency>
800060f6:	87aa                	mv	a5,a0
800060f8:	85be                	mv	a1,a5
800060fa:	8000d7b7          	lui	a5,0x8000d
800060fe:	3b878513          	addi	a0,a5,952 # 8000d3b8 <_lseek+0x80>
80006102:	0f4030ef          	jal	800091f6 <iprintf>
    printf("cpu1:\t\t %luHz\n", clock_get_frequency(clock_cpu1));
80006106:	000807b7          	lui	a5,0x80
8000610a:	00278513          	addi	a0,a5,2 # 80002 <__fast_ram_bss_end__+0x2>
8000610e:	009000ef          	jal	80006916 <clock_get_frequency>
80006112:	87aa                	mv	a5,a0
80006114:	85be                	mv	a1,a5
80006116:	8000d7b7          	lui	a5,0x8000d
8000611a:	3c878513          	addi	a0,a5,968 # 8000d3c8 <_lseek+0x90>
8000611e:	0d8030ef          	jal	800091f6 <iprintf>
    printf("axi0:\t\t %luHz\n", clock_get_frequency(clock_axi0));
80006122:	010107b7          	lui	a5,0x1010
80006126:	00478513          	addi	a0,a5,4 # 1010004 <_extram_size+0x10004>
8000612a:	27f5                	jal	80006916 <clock_get_frequency>
8000612c:	87aa                	mv	a5,a0
8000612e:	85be                	mv	a1,a5
80006130:	8000d7b7          	lui	a5,0x8000d
80006134:	3d878513          	addi	a0,a5,984 # 8000d3d8 <_lseek+0xa0>
80006138:	0be030ef          	jal	800091f6 <iprintf>
    printf("axi1:\t\t %luHz\n", clock_get_frequency(clock_axi1));
8000613c:	010207b7          	lui	a5,0x1020
80006140:	00578513          	addi	a0,a5,5 # 1020005 <_extram_size+0x20005>
80006144:	2fc9                	jal	80006916 <clock_get_frequency>
80006146:	87aa                	mv	a5,a0
80006148:	85be                	mv	a1,a5
8000614a:	8000d7b7          	lui	a5,0x8000d
8000614e:	3e878513          	addi	a0,a5,1000 # 8000d3e8 <_lseek+0xb0>
80006152:	0a4030ef          	jal	800091f6 <iprintf>
    printf("axi2:\t\t %luHz\n", clock_get_frequency(clock_axi2));
80006156:	010307b7          	lui	a5,0x1030
8000615a:	00678513          	addi	a0,a5,6 # 1030006 <_extram_size+0x30006>
8000615e:	2f65                	jal	80006916 <clock_get_frequency>
80006160:	87aa                	mv	a5,a0
80006162:	85be                	mv	a1,a5
80006164:	8000d7b7          	lui	a5,0x8000d
80006168:	3f878513          	addi	a0,a5,1016 # 8000d3f8 <_lseek+0xc0>
8000616c:	08a030ef          	jal	800091f6 <iprintf>
    printf("ahb:\t\t %luHz\n", clock_get_frequency(clock_ahb));
80006170:	010007b7          	lui	a5,0x1000
80006174:	00778513          	addi	a0,a5,7 # 1000007 <_extram_size+0x7>
80006178:	2f79                	jal	80006916 <clock_get_frequency>
8000617a:	87aa                	mv	a5,a0
8000617c:	85be                	mv	a1,a5
8000617e:	8000d7b7          	lui	a5,0x8000d
80006182:	40878513          	addi	a0,a5,1032 # 8000d408 <_lseek+0xd0>
80006186:	070030ef          	jal	800091f6 <iprintf>
    printf("mchtmr0:\t %luHz\n", clock_get_frequency(clock_mchtmr0));
8000618a:	010807b7          	lui	a5,0x1080
8000618e:	00178513          	addi	a0,a5,1 # 1080001 <_impure_data+0x1>
80006192:	2751                	jal	80006916 <clock_get_frequency>
80006194:	87aa                	mv	a5,a0
80006196:	85be                	mv	a1,a5
80006198:	8000d7b7          	lui	a5,0x8000d
8000619c:	41878513          	addi	a0,a5,1048 # 8000d418 <_lseek+0xe0>
800061a0:	056030ef          	jal	800091f6 <iprintf>
    printf("mchtmr1:\t %luHz\n", clock_get_frequency(clock_mchtmr1));
800061a4:	010907b7          	lui	a5,0x1090
800061a8:	00378513          	addi	a0,a5,3 # 1090003 <__global_pointer$+0xf803>
800061ac:	27ad                	jal	80006916 <clock_get_frequency>
800061ae:	87aa                	mv	a5,a0
800061b0:	85be                	mv	a1,a5
800061b2:	8000d7b7          	lui	a5,0x8000d
800061b6:	42c78513          	addi	a0,a5,1068 # 8000d42c <_lseek+0xf4>
800061ba:	03c030ef          	jal	800091f6 <iprintf>
    printf("xpi0:\t\t %luHz\n", clock_get_frequency(clock_xpi0));
800061be:	010c07b7          	lui	a5,0x10c0
800061c2:	00978513          	addi	a0,a5,9 # 10c0009 <__global_pointer$+0x3f809>
800061c6:	2f81                	jal	80006916 <clock_get_frequency>
800061c8:	87aa                	mv	a5,a0
800061ca:	85be                	mv	a1,a5
800061cc:	8000d7b7          	lui	a5,0x8000d
800061d0:	44078513          	addi	a0,a5,1088 # 8000d440 <_lseek+0x108>
800061d4:	022030ef          	jal	800091f6 <iprintf>
    printf("xpi1:\t\t %luHz\n", clock_get_frequency(clock_xpi1));
800061d8:	010d07b7          	lui	a5,0x10d0
800061dc:	00a78513          	addi	a0,a5,10 # 10d000a <__global_pointer$+0x4f80a>
800061e0:	2f1d                	jal	80006916 <clock_get_frequency>
800061e2:	87aa                	mv	a5,a0
800061e4:	85be                	mv	a1,a5
800061e6:	8000d7b7          	lui	a5,0x8000d
800061ea:	45078513          	addi	a0,a5,1104 # 8000d450 <_lseek+0x118>
800061ee:	008030ef          	jal	800091f6 <iprintf>
    printf("femc:\t\t %luHz\n", clock_get_frequency(clock_femc));
800061f2:	010407b7          	lui	a5,0x1040
800061f6:	00878513          	addi	a0,a5,8 # 1040008 <_extram_size+0x40008>
800061fa:	2f31                	jal	80006916 <clock_get_frequency>
800061fc:	87aa                	mv	a5,a0
800061fe:	85be                	mv	a1,a5
80006200:	8000d7b7          	lui	a5,0x8000d
80006204:	46078513          	addi	a0,a5,1120 # 8000d460 <_lseek+0x128>
80006208:	7ef020ef          	jal	800091f6 <iprintf>
    printf("==============================\n");
8000620c:	8000d7b7          	lui	a5,0x8000d
80006210:	37478513          	addi	a0,a5,884 # 8000d374 <_lseek+0x3c>
80006214:	7e3020ef          	jal	800091f6 <iprintf>
}
80006218:	0001                	nop
8000621a:	40b2                	lw	ra,12(sp)
8000621c:	0141                	addi	sp,sp,16
8000621e:	8082                	ret

80006220 <board_print_banner>:
{
80006220:	d8010113          	addi	sp,sp,-640
80006224:	26112e23          	sw	ra,636(sp)
    const uint8_t banner[] = {"\n\
80006228:	8000d7b7          	lui	a5,0x8000d
8000622c:	48c78713          	addi	a4,a5,1164 # 8000d48c <_lseek+0x154>
80006230:	878a                	mv	a5,sp
80006232:	86ba                	mv	a3,a4
80006234:	26f00713          	li	a4,623
80006238:	863a                	mv	a2,a4
8000623a:	85b6                	mv	a1,a3
8000623c:	853e                	mv	a0,a5
8000623e:	b73fe0ef          	jal	80004db0 <memcpy>
    printf("hpm_sdk: %s\n", SDK_VERSION_STRING);
80006242:	8000d7b7          	lui	a5,0x8000d
80006246:	47078593          	addi	a1,a5,1136 # 8000d470 <_lseek+0x138>
8000624a:	8000d7b7          	lui	a5,0x8000d
8000624e:	47878513          	addi	a0,a5,1144 # 8000d478 <_lseek+0x140>
80006252:	7a5020ef          	jal	800091f6 <iprintf>
    printf("%s", banner);
80006256:	878a                	mv	a5,sp
80006258:	85be                	mv	a1,a5
8000625a:	8000d7b7          	lui	a5,0x8000d
8000625e:	48878513          	addi	a0,a5,1160 # 8000d488 <_lseek+0x150>
80006262:	795020ef          	jal	800091f6 <iprintf>
}
80006266:	0001                	nop
80006268:	27c12083          	lw	ra,636(sp)
8000626c:	28010113          	addi	sp,sp,640
80006270:	8082                	ret

80006272 <board_init>:
{
80006272:	1141                	addi	sp,sp,-16
80006274:	c606                	sw	ra,12(sp)
    pcfg_dcdc_switch_to_dcm_mode(HPM_PCFG);
80006276:	f40c4537          	lui	a0,0xf40c4
8000627a:	563010ef          	jal	80007fdc <pcfg_dcdc_switch_to_dcm_mode>
    board_init_clock();
8000627e:	2c8d                	jal	800064f0 <board_init_clock>
    board_init_console();
80006280:	3bfd                	jal	8000607e <board_init_console>
    board_init_pmp();
80006282:	2091                	jal	800062c6 <board_init_pmp>
    board_print_clock_freq();
80006284:	3d35                	jal	800060c0 <board_print_clock_freq>
    board_print_banner();
80006286:	3f69                	jal	80006220 <board_print_banner>
}
80006288:	0001                	nop
8000628a:	40b2                	lw	ra,12(sp)
8000628c:	0141                	addi	sp,sp,16
8000628e:	8082                	ret

80006290 <board_delay_ms>:
{
80006290:	1101                	addi	sp,sp,-32
80006292:	ce06                	sw	ra,28(sp)
80006294:	c62a                	sw	a0,12(sp)
    clock_cpu_delay_ms(ms);
80006296:	4532                	lw	a0,12(sp)
80006298:	463000ef          	jal	80006efa <clock_cpu_delay_ms>
}
8000629c:	0001                	nop
8000629e:	40f2                	lw	ra,28(sp)
800062a0:	6105                	addi	sp,sp,32
800062a2:	8082                	ret

800062a4 <board_hb_led_write>:
{
    gpio_write_pin(BOARD_LED_GPIO_CTRL, BOARD_LED_GPIO_INDEX, BOARD_LED_GPIO_PIN, state);
}

void board_hb_led_write(uint8_t state)
{
800062a4:	1101                	addi	sp,sp,-32
800062a6:	ce06                	sw	ra,28(sp)
800062a8:	87aa                	mv	a5,a0
800062aa:	00f107a3          	sb	a5,15(sp)
    gpio_write_pin(BOARD_HB_LED_GPIO_CTRL, BOARD_HB_LED_GPIO_INDEX, BOARD_HB_LED_GPIO_PIN, state);
800062ae:	00f14783          	lbu	a5,15(sp)
800062b2:	86be                	mv	a3,a5
800062b4:	4671                	li	a2,28
800062b6:	4591                	li	a1,4
800062b8:	f0000537          	lui	a0,0xf0000
800062bc:	33b9                	jal	8000600a <gpio_write_pin>
}
800062be:	0001                	nop
800062c0:	40f2                	lw	ra,28(sp)
800062c2:	6105                	addi	sp,sp,32
800062c4:	8082                	ret

800062c6 <board_init_pmp>:
        init_usb0_clock();
    }
}

void board_init_pmp(void)
{
800062c6:	712d                	addi	sp,sp,-288
800062c8:	10112e23          	sw	ra,284(sp)
    uint32_t start_addr;
    uint32_t end_addr;
    uint32_t length;
    pmp_entry_t pmp_entry[16] = {0};
800062cc:	878a                	mv	a5,sp
800062ce:	10000713          	li	a4,256
800062d2:	863a                	mv	a2,a4
800062d4:	4581                	li	a1,0
800062d6:	853e                	mv	a0,a5
800062d8:	ac9fe0ef          	jal	80004da0 <memset>
    uint8_t index = 0;
800062dc:	100107a3          	sb	zero,271(sp)

    /* Init noncachable memory */
    extern uint32_t __noncacheable_start__[];
    extern uint32_t __noncacheable_end__[];
    start_addr = (uint32_t) __noncacheable_start__;
800062e0:	011007b7          	lui	a5,0x1100
800062e4:	00078793          	mv	a5,a5
800062e8:	10f12423          	sw	a5,264(sp)
    end_addr = (uint32_t) __noncacheable_end__;
800062ec:	011407b7          	lui	a5,0x1140
800062f0:	00078793          	mv	a5,a5
800062f4:	10f12223          	sw	a5,260(sp)
    length = end_addr - start_addr;
800062f8:	10412703          	lw	a4,260(sp)
800062fc:	10812783          	lw	a5,264(sp)
80006300:	40f707b3          	sub	a5,a4,a5
80006304:	10f12023          	sw	a5,256(sp)
    if (length > 0) {
80006308:	10012783          	lw	a5,256(sp)
8000630c:	cbe1                	beqz	a5,800063dc <board_init_pmp+0x116>
        /* Ensure the address and the length are power of 2 aligned */
        assert((length & (length - 1U)) == 0U);
8000630e:	10012783          	lw	a5,256(sp)
80006312:	fff78713          	addi	a4,a5,-1 # 113ffff <__noncacheable_bss_end__+0x3ffff>
80006316:	10012783          	lw	a5,256(sp)
8000631a:	8ff9                	and	a5,a5,a4
8000631c:	c38d                	beqz	a5,8000633e <board_init_pmp+0x78>
8000631e:	8000d7b7          	lui	a5,0x8000d
80006322:	79878693          	addi	a3,a5,1944 # 8000d798 <_lseek+0x460>
80006326:	8000e7b7          	lui	a5,0x8000e
8000632a:	9a878613          	addi	a2,a5,-1624 # 8000d9a8 <__func__.0>
8000632e:	27800593          	li	a1,632
80006332:	8000d7b7          	lui	a5,0x8000d
80006336:	7b878513          	addi	a0,a5,1976 # 8000d7b8 <_lseek+0x480>
8000633a:	03a020ef          	jal	80008374 <__assert_func>
        assert((start_addr & (length - 1U)) == 0U);
8000633e:	10012783          	lw	a5,256(sp)
80006342:	fff78713          	addi	a4,a5,-1
80006346:	10812783          	lw	a5,264(sp)
8000634a:	8ff9                	and	a5,a5,a4
8000634c:	c38d                	beqz	a5,8000636e <board_init_pmp+0xa8>
8000634e:	8000e7b7          	lui	a5,0x8000e
80006352:	80c78693          	addi	a3,a5,-2036 # 8000d80c <_lseek+0x4d4>
80006356:	8000e7b7          	lui	a5,0x8000e
8000635a:	9a878613          	addi	a2,a5,-1624 # 8000d9a8 <__func__.0>
8000635e:	27900593          	li	a1,633
80006362:	8000d7b7          	lui	a5,0x8000d
80006366:	7b878513          	addi	a0,a5,1976 # 8000d7b8 <_lseek+0x480>
8000636a:	00a020ef          	jal	80008374 <__assert_func>
        pmp_entry[index].pmp_addr = PMP_NAPOT_ADDR(start_addr, length);
8000636e:	10012783          	lw	a5,256(sp)
80006372:	0017d713          	srli	a4,a5,0x1
80006376:	10812783          	lw	a5,264(sp)
8000637a:	97ba                	add	a5,a5,a4
8000637c:	fff78713          	addi	a4,a5,-1
80006380:	10f14783          	lbu	a5,271(sp)
80006384:	8309                	srli	a4,a4,0x2
80006386:	0792                	slli	a5,a5,0x4
80006388:	0a14                	addi	a3,sp,272
8000638a:	97b6                	add	a5,a5,a3
8000638c:	eee7aa23          	sw	a4,-268(a5)
        pmp_entry[index].pmp_cfg.val = PMP_CFG(READ_EN, WRITE_EN, EXECUTE_EN, ADDR_MATCH_NAPOT, REG_UNLOCK);
80006390:	10f14783          	lbu	a5,271(sp)
80006394:	0792                	slli	a5,a5,0x4
80006396:	0a18                	addi	a4,sp,272
80006398:	97ba                	add	a5,a5,a4
8000639a:	477d                	li	a4,31
8000639c:	eee78823          	sb	a4,-272(a5)
        pmp_entry[index].pma_addr = PMA_NAPOT_ADDR(start_addr, length);
800063a0:	10012783          	lw	a5,256(sp)
800063a4:	0017d713          	srli	a4,a5,0x1
800063a8:	10812783          	lw	a5,264(sp)
800063ac:	97ba                	add	a5,a5,a4
800063ae:	fff78713          	addi	a4,a5,-1
800063b2:	10f14783          	lbu	a5,271(sp)
800063b6:	8309                	srli	a4,a4,0x2
800063b8:	0792                	slli	a5,a5,0x4
800063ba:	0a14                	addi	a3,sp,272
800063bc:	97b6                	add	a5,a5,a3
800063be:	eee7ae23          	sw	a4,-260(a5)
        pmp_entry[index].pma_cfg.val = PMA_CFG(ADDR_MATCH_NAPOT, MEM_TYPE_MEM_NON_CACHE_BUF, AMO_EN);
800063c2:	10f14783          	lbu	a5,271(sp)
800063c6:	0792                	slli	a5,a5,0x4
800063c8:	0a18                	addi	a4,sp,272
800063ca:	97ba                	add	a5,a5,a4
800063cc:	473d                	li	a4,15
800063ce:	eee78c23          	sb	a4,-264(a5)
        index++;
800063d2:	10f14783          	lbu	a5,271(sp)
800063d6:	0785                	addi	a5,a5,1
800063d8:	10f107a3          	sb	a5,271(sp)
    }

    /* Init share memory */
    extern uint32_t __share_mem_start__[];
    extern uint32_t __share_mem_end__[];
    start_addr = (uint32_t)__share_mem_start__;
800063dc:	0117c7b7          	lui	a5,0x117c
800063e0:	00078793          	mv	a5,a5
800063e4:	10f12423          	sw	a5,264(sp)
    end_addr = (uint32_t)__share_mem_end__;
800063e8:	011807b7          	lui	a5,0x1180
800063ec:	00078793          	mv	a5,a5
800063f0:	10f12223          	sw	a5,260(sp)
    length = end_addr - start_addr;
800063f4:	10412703          	lw	a4,260(sp)
800063f8:	10812783          	lw	a5,264(sp)
800063fc:	40f707b3          	sub	a5,a4,a5
80006400:	10f12023          	sw	a5,256(sp)
    if (length > 0) {
80006404:	10012783          	lw	a5,256(sp)
80006408:	cbe1                	beqz	a5,800064d8 <board_init_pmp+0x212>
        /* Ensure the address and the length are power of 2 aligned */
        assert((length & (length - 1U)) == 0U);
8000640a:	10012783          	lw	a5,256(sp)
8000640e:	fff78713          	addi	a4,a5,-1 # 117ffff <__share_mem_start__+0x3fff>
80006412:	10012783          	lw	a5,256(sp)
80006416:	8ff9                	and	a5,a5,a4
80006418:	c38d                	beqz	a5,8000643a <board_init_pmp+0x174>
8000641a:	8000d7b7          	lui	a5,0x8000d
8000641e:	79878693          	addi	a3,a5,1944 # 8000d798 <_lseek+0x460>
80006422:	8000e7b7          	lui	a5,0x8000e
80006426:	9a878613          	addi	a2,a5,-1624 # 8000d9a8 <__func__.0>
8000642a:	28900593          	li	a1,649
8000642e:	8000d7b7          	lui	a5,0x8000d
80006432:	7b878513          	addi	a0,a5,1976 # 8000d7b8 <_lseek+0x480>
80006436:	73f010ef          	jal	80008374 <__assert_func>
        assert((start_addr & (length - 1U)) == 0U);
8000643a:	10012783          	lw	a5,256(sp)
8000643e:	fff78713          	addi	a4,a5,-1
80006442:	10812783          	lw	a5,264(sp)
80006446:	8ff9                	and	a5,a5,a4
80006448:	c38d                	beqz	a5,8000646a <board_init_pmp+0x1a4>
8000644a:	8000e7b7          	lui	a5,0x8000e
8000644e:	80c78693          	addi	a3,a5,-2036 # 8000d80c <_lseek+0x4d4>
80006452:	8000e7b7          	lui	a5,0x8000e
80006456:	9a878613          	addi	a2,a5,-1624 # 8000d9a8 <__func__.0>
8000645a:	28a00593          	li	a1,650
8000645e:	8000d7b7          	lui	a5,0x8000d
80006462:	7b878513          	addi	a0,a5,1976 # 8000d7b8 <_lseek+0x480>
80006466:	70f010ef          	jal	80008374 <__assert_func>
        pmp_entry[index].pmp_addr = PMP_NAPOT_ADDR(start_addr, length);
8000646a:	10012783          	lw	a5,256(sp)
8000646e:	0017d713          	srli	a4,a5,0x1
80006472:	10812783          	lw	a5,264(sp)
80006476:	97ba                	add	a5,a5,a4
80006478:	fff78713          	addi	a4,a5,-1
8000647c:	10f14783          	lbu	a5,271(sp)
80006480:	8309                	srli	a4,a4,0x2
80006482:	0792                	slli	a5,a5,0x4
80006484:	0a14                	addi	a3,sp,272
80006486:	97b6                	add	a5,a5,a3
80006488:	eee7aa23          	sw	a4,-268(a5)
        pmp_entry[index].pmp_cfg.val = PMP_CFG(READ_EN, WRITE_EN, EXECUTE_EN, ADDR_MATCH_NAPOT, REG_UNLOCK);
8000648c:	10f14783          	lbu	a5,271(sp)
80006490:	0792                	slli	a5,a5,0x4
80006492:	0a18                	addi	a4,sp,272
80006494:	97ba                	add	a5,a5,a4
80006496:	477d                	li	a4,31
80006498:	eee78823          	sb	a4,-272(a5)
        pmp_entry[index].pma_addr = PMA_NAPOT_ADDR(start_addr, length);
8000649c:	10012783          	lw	a5,256(sp)
800064a0:	0017d713          	srli	a4,a5,0x1
800064a4:	10812783          	lw	a5,264(sp)
800064a8:	97ba                	add	a5,a5,a4
800064aa:	fff78713          	addi	a4,a5,-1
800064ae:	10f14783          	lbu	a5,271(sp)
800064b2:	8309                	srli	a4,a4,0x2
800064b4:	0792                	slli	a5,a5,0x4
800064b6:	0a14                	addi	a3,sp,272
800064b8:	97b6                	add	a5,a5,a3
800064ba:	eee7ae23          	sw	a4,-260(a5)
        pmp_entry[index].pma_cfg.val = PMA_CFG(ADDR_MATCH_NAPOT, MEM_TYPE_MEM_NON_CACHE_BUF, AMO_EN);
800064be:	10f14783          	lbu	a5,271(sp)
800064c2:	0792                	slli	a5,a5,0x4
800064c4:	0a18                	addi	a4,sp,272
800064c6:	97ba                	add	a5,a5,a4
800064c8:	473d                	li	a4,15
800064ca:	eee78c23          	sb	a4,-264(a5)
        index++;
800064ce:	10f14783          	lbu	a5,271(sp)
800064d2:	0785                	addi	a5,a5,1
800064d4:	10f107a3          	sb	a5,271(sp)
    }

    pmp_config(&pmp_entry[0], index);
800064d8:	10f14703          	lbu	a4,271(sp)
800064dc:	878a                	mv	a5,sp
800064de:	85ba                	mv	a1,a4
800064e0:	853e                	mv	a0,a5
800064e2:	47e010ef          	jal	80007960 <pmp_config>
}
800064e6:	0001                	nop
800064e8:	11c12083          	lw	ra,284(sp)
800064ec:	6115                	addi	sp,sp,288
800064ee:	8082                	ret

800064f0 <board_init_clock>:

void board_init_clock(void)
{
800064f0:	1101                	addi	sp,sp,-32
800064f2:	ce06                	sw	ra,28(sp)
    uint32_t cpu0_freq = clock_get_frequency(clock_cpu0);
800064f4:	4501                	li	a0,0
800064f6:	2105                	jal	80006916 <clock_get_frequency>
800064f8:	c62a                	sw	a0,12(sp)
    if (cpu0_freq == PLLCTL_SOC_PLL_REFCLK_FREQ) {
800064fa:	4732                	lw	a4,12(sp)
800064fc:	016e37b7          	lui	a5,0x16e3
80006500:	60078793          	addi	a5,a5,1536 # 16e3600 <__share_mem_end__+0x563600>
80006504:	00f71d63          	bne	a4,a5,8000651e <board_init_clock+0x2e>
        /* Configure the External OSC ramp-up time: ~9ms */
        pllctl_xtal_set_rampup_time(HPM_PLLCTL, 32UL * 1000UL * 9U);
80006508:	000467b7          	lui	a5,0x46
8000650c:	50078593          	addi	a1,a5,1280 # 46500 <_noncacheable_size+0x6500>
80006510:	f4100537          	lui	a0,0xf4100
80006514:	36a1                	jal	8000605c <pllctl_xtal_set_rampup_time>

        /* Select clock setting preset1 */
        sysctl_clock_set_preset(HPM_SYSCTL, sysctl_preset_1);
80006516:	4589                	li	a1,2
80006518:	f4000537          	lui	a0,0xf4000
8000651c:	3c41                	jal	80005fac <sysctl_clock_set_preset>
    }

    /* Add clocks to group 0 */
    init_board_clock();
8000651e:	30e9                	jal	80005de8 <init_board_clock>

    /* Connect Group0 to CPU0 */
    clock_connect_group_to_cpu(0, 0);
80006520:	4581                	li	a1,0
80006522:	4501                	li	a0,0
80006524:	181000ef          	jal	80006ea4 <clock_connect_group_to_cpu>

    /* Add clocks to Group1 */
    init_board_cpu1_clock();
80006528:	32f5                	jal	80005f14 <init_board_cpu1_clock>

    /* Connect Group1 to CPU1 */
    clock_connect_group_to_cpu(1, 1);
8000652a:	4585                	li	a1,1
8000652c:	4505                	li	a0,1
8000652e:	177000ef          	jal	80006ea4 <clock_connect_group_to_cpu>

    /* Note: When using an external DCDC, don't set the internal DCDC voltage. The following call of pcfg_dcdc_set_voltage() function should be commented out. */
    /* Bump up DCDC voltage to 1275mv */
    pcfg_dcdc_set_voltage(HPM_PCFG, 1275);
80006532:	4fb00593          	li	a1,1275
80006536:	f40c4537          	lui	a0,0xf40c4
8000653a:	247010ef          	jal	80007f80 <pcfg_dcdc_set_voltage>

    if (status_success != pllctl_init_int_pll_with_freq(HPM_PLLCTL, 0, BOARD_CPU_FREQ)) {
8000653e:	30a337b7          	lui	a5,0x30a33
80006542:	c0078613          	addi	a2,a5,-1024 # 30a32c00 <__share_mem_end__+0x2f8b2c00>
80006546:	4581                	li	a1,0
80006548:	f4100537          	lui	a0,0xf4100
8000654c:	656010ef          	jal	80007ba2 <pllctl_init_int_pll_with_freq>
80006550:	87aa                	mv	a5,a0
80006552:	cf81                	beqz	a5,8000656a <board_init_clock+0x7a>
        printf("Failed to set pll0_clk0 to %ldHz\n", BOARD_CPU_FREQ);
80006554:	30a337b7          	lui	a5,0x30a33
80006558:	c0078593          	addi	a1,a5,-1024 # 30a32c00 <__share_mem_end__+0x2f8b2c00>
8000655c:	8000e7b7          	lui	a5,0x8000e
80006560:	83078513          	addi	a0,a5,-2000 # 8000d830 <_lseek+0x4f8>
80006564:	493020ef          	jal	800091f6 <iprintf>
        while (1) {
80006568:	a001                	j	80006568 <board_init_clock+0x78>
        }
    }

    init_board_clock_source();
8000656a:	3ac9                	jal	80005f3c <init_board_clock_source>

    clock_update_core_clock();
8000656c:	21f000ef          	jal	80006f8a <clock_update_core_clock>
}
80006570:	0001                	nop
80006572:	40f2                	lw	ra,28(sp)
80006574:	6105                	addi	sp,sp,32
80006576:	8082                	ret

80006578 <init_uart_pins>:
#endif
    return freq;
}

void init_uart_pins(UART_Type *ptr)
{
80006578:	1101                	addi	sp,sp,-32
8000657a:	ce06                	sw	ra,28(sp)
8000657c:	c62a                	sw	a0,12(sp)
    if (ptr == HPM_UART0) {
8000657e:	4732                	lw	a4,12(sp)
80006580:	f00407b7          	lui	a5,0xf0040
80006584:	00f71563          	bne	a4,a5,8000658e <init_uart_pins+0x16>
        init_uart0_pins();
80006588:	f5cff0ef          	jal	80005ce4 <init_uart0_pins>
    } else if (ptr == HPM_UART14) {
        init_uart14_pins();
    } else if (ptr == HPM_PUART) {
        init_puart_pins();
    }
}
8000658c:	a881                	j	800065dc <init_uart_pins+0x64>
    } else if (ptr == HPM_UART6) {
8000658e:	4732                	lw	a4,12(sp)
80006590:	f00587b7          	lui	a5,0xf0058
80006594:	00f71563          	bne	a4,a5,8000659e <init_uart_pins+0x26>
        init_uart6_pins();
80006598:	f88ff0ef          	jal	80005d20 <init_uart6_pins>
}
8000659c:	a081                	j	800065dc <init_uart_pins+0x64>
    } else if (ptr == HPM_UART7) {
8000659e:	4732                	lw	a4,12(sp)
800065a0:	f005c7b7          	lui	a5,0xf005c
800065a4:	00f71563          	bne	a4,a5,800065ae <init_uart_pins+0x36>
        init_uart7_pins();
800065a8:	f90ff0ef          	jal	80005d38 <init_uart7_pins>
}
800065ac:	a805                	j	800065dc <init_uart_pins+0x64>
    } else if (ptr == HPM_UART13) {
800065ae:	4732                	lw	a4,12(sp)
800065b0:	f00747b7          	lui	a5,0xf0074
800065b4:	00f71563          	bne	a4,a5,800065be <init_uart_pins+0x46>
        init_uart13_pins();
800065b8:	f98ff0ef          	jal	80005d50 <init_uart13_pins>
}
800065bc:	a005                	j	800065dc <init_uart_pins+0x64>
    } else if (ptr == HPM_UART14) {
800065be:	4732                	lw	a4,12(sp)
800065c0:	f00787b7          	lui	a5,0xf0078
800065c4:	00f71563          	bne	a4,a5,800065ce <init_uart_pins+0x56>
        init_uart14_pins();
800065c8:	fc4ff0ef          	jal	80005d8c <init_uart14_pins>
}
800065cc:	a801                	j	800065dc <init_uart_pins+0x64>
    } else if (ptr == HPM_PUART) {
800065ce:	4732                	lw	a4,12(sp)
800065d0:	f40e47b7          	lui	a5,0xf40e4
800065d4:	00f71463          	bne	a4,a5,800065dc <init_uart_pins+0x64>
        init_puart_pins();
800065d8:	ff0ff0ef          	jal	80005dc8 <init_puart_pins>
}
800065dc:	0001                	nop
800065de:	40f2                	lw	ra,28(sp)
800065e0:	6105                	addi	sp,sp,32
800065e2:	8082                	ret

800065e4 <enable_plic_feature>:
#ifndef CONFIG_DISABLE_GLOBAL_IRQ_ON_STARTUP
#define CONFIG_DISABLE_GLOBAL_IRQ_ON_STARTUP 0
#endif

void enable_plic_feature(void)
{
800065e4:	1141                	addi	sp,sp,-16
    uint32_t plic_feature = 0;
800065e6:	c602                	sw	zero,12(sp)
#if !defined(USE_NONVECTOR_MODE) || (USE_NONVECTOR_MODE == 0)
    /* enabled vector mode and preemptive priority interrupt */
    plic_feature |= HPM_PLIC_FEATURE_VECTORED_MODE;
800065e8:	47b2                	lw	a5,12(sp)
800065ea:	0027e793          	ori	a5,a5,2
800065ee:	c63e                	sw	a5,12(sp)
#endif
#if !defined(DISABLE_IRQ_PREEMPTIVE) || (DISABLE_IRQ_PREEMPTIVE == 0)
    /* enabled preemptive priority interrupt */
    plic_feature |= HPM_PLIC_FEATURE_PREEMPTIVE_PRIORITY_IRQ;
800065f0:	47b2                	lw	a5,12(sp)
800065f2:	0017e793          	ori	a5,a5,1
800065f6:	c63e                	sw	a5,12(sp)
800065f8:	e40007b7          	lui	a5,0xe4000
800065fc:	c43e                	sw	a5,8(sp)
800065fe:	47b2                	lw	a5,12(sp)
80006600:	c23e                	sw	a5,4(sp)
    *(volatile uint32_t *)(base + HPM_PLIC_FEATURE_OFFSET) = feature;
80006602:	47a2                	lw	a5,8(sp)
80006604:	4712                	lw	a4,4(sp)
80006606:	c398                	sw	a4,0(a5)
}
80006608:	0001                	nop
#endif
    __plic_set_feature(HPM_PLIC_BASE, plic_feature);
}
8000660a:	0001                	nop
8000660c:	0141                	addi	sp,sp,16
8000660e:	8082                	ret

80006610 <system_init>:

__attribute__((weak)) void system_init(void)
{
80006610:	7179                	addi	sp,sp,-48
80006612:	d606                	sw	ra,44(sp)
80006614:	47a1                	li	a5,8
80006616:	c83e                	sw	a5,16(sp)
    return read_clear_csr(CSR_MSTATUS, mask);
80006618:	c602                	sw	zero,12(sp)
8000661a:	47c2                	lw	a5,16(sp)
8000661c:	3007b7f3          	csrrc	a5,mstatus,a5
80006620:	c63e                	sw	a5,12(sp)
80006622:	47b2                	lw	a5,12(sp)
80006624:	0001                	nop
    clear_csr(CSR_MIE, CSR_MIE_MEIE_MASK);
80006626:	6785                	lui	a5,0x1
80006628:	80078793          	addi	a5,a5,-2048 # 800 <__ramfunc_end__+0x3c8>
8000662c:	3047b073          	csrc	mie,a5
}
80006630:	0001                	nop
    disable_global_irq(CSR_MSTATUS_MIE_MASK);
    disable_irq_from_intc();
    enable_plic_feature();
80006632:	3f4d                	jal	800065e4 <enable_plic_feature>
    set_csr(CSR_MIE, CSR_MIE_MEIE_MASK);
80006634:	6785                	lui	a5,0x1
80006636:	80078793          	addi	a5,a5,-2048 # 800 <__ramfunc_end__+0x3c8>
8000663a:	3047a073          	csrs	mie,a5
}
8000663e:	0001                	nop
80006640:	47a1                	li	a5,8
80006642:	ca3e                	sw	a5,20(sp)
    set_csr(CSR_MSTATUS, mask);
80006644:	47d2                	lw	a5,20(sp)
80006646:	3007a073          	csrs	mstatus,a5
}
8000664a:	0001                	nop
#if !CONFIG_DISABLE_GLOBAL_IRQ_ON_STARTUP
    enable_global_irq(CSR_MSTATUS_MIE_MASK);
#endif

#ifndef CONFIG_NOT_ENALBE_ACCESS_TO_CYCLE_CSR
    uint32_t mcounteren = read_csr(CSR_MCOUNTEREN);
8000664c:	306027f3          	csrr	a5,mcounteren
80006650:	ce3e                	sw	a5,28(sp)
80006652:	47f2                	lw	a5,28(sp)
80006654:	cc3e                	sw	a5,24(sp)
    write_csr(CSR_MCOUNTEREN, mcounteren | 1); /* Enable MCYCLE */
80006656:	47e2                	lw	a5,24(sp)
80006658:	0017e793          	ori	a5,a5,1
8000665c:	30679073          	csrw	mcounteren,a5
#endif

#if defined(CONFIG_ENABLE_BPOR_RETENTION) && CONFIG_ENABLE_BPOR_RETENTION
    bpor_enable_reg_value_retention(HPM_BPOR);
#endif
}
80006660:	0001                	nop
80006662:	50b2                	lw	ra,44(sp)
80006664:	6145                	addi	sp,sp,48
80006666:	8082                	ret

80006668 <sysctl_resource_target_is_busy>:
{
80006668:	1141                	addi	sp,sp,-16
8000666a:	c62a                	sw	a0,12(sp)
8000666c:	c42e                	sw	a1,8(sp)
    return ptr->RESOURCE[resource] & SYSCTL_RESOURCE_LOC_BUSY_MASK;
8000666e:	4732                	lw	a4,12(sp)
80006670:	47a2                	lw	a5,8(sp)
80006672:	078a                	slli	a5,a5,0x2
80006674:	97ba                	add	a5,a5,a4
80006676:	4398                	lw	a4,0(a5)
80006678:	400007b7          	lui	a5,0x40000
8000667c:	8ff9                	and	a5,a5,a4
8000667e:	83f9                	srli	a5,a5,0x1e
80006680:	8b85                	andi	a5,a5,1
80006682:	0ff7f793          	zext.b	a5,a5
}
80006686:	853e                	mv	a0,a5
80006688:	0141                	addi	sp,sp,16
8000668a:	8082                	ret

8000668c <sysctl_clock_target_is_busy>:
{
8000668c:	1141                	addi	sp,sp,-16
8000668e:	c62a                	sw	a0,12(sp)
80006690:	c42e                	sw	a1,8(sp)
    return ptr->CLOCK[clock] & SYSCTL_CLOCK_LOC_BUSY_MASK;
80006692:	4732                	lw	a4,12(sp)
80006694:	47a2                	lw	a5,8(sp)
80006696:	60078793          	addi	a5,a5,1536 # 40000600 <__share_mem_end__+0x3ee80600>
8000669a:	078a                	slli	a5,a5,0x2
8000669c:	97ba                	add	a5,a5,a4
8000669e:	4398                	lw	a4,0(a5)
800066a0:	400007b7          	lui	a5,0x40000
800066a4:	8ff9                	and	a5,a5,a4
800066a6:	83f9                	srli	a5,a5,0x1e
800066a8:	8b85                	andi	a5,a5,1
800066aa:	0ff7f793          	zext.b	a5,a5
}
800066ae:	853e                	mv	a0,a5
800066b0:	0141                	addi	sp,sp,16
800066b2:	8082                	ret

800066b4 <sysctl_enable_group_resource>:

hpm_stat_t sysctl_enable_group_resource(SYSCTL_Type *ptr,
                                        uint8_t group,
                                        sysctl_resource_t resource,
                                        bool enable)
{
800066b4:	7179                	addi	sp,sp,-48
800066b6:	d606                	sw	ra,44(sp)
800066b8:	c62a                	sw	a0,12(sp)
800066ba:	87ae                	mv	a5,a1
800066bc:	c232                	sw	a2,4(sp)
800066be:	8736                	mv	a4,a3
800066c0:	00f105a3          	sb	a5,11(sp)
800066c4:	87ba                	mv	a5,a4
800066c6:	00f10523          	sb	a5,10(sp)
    uint32_t index, offset;
    if (resource < sysctl_resource_linkable_start) {
800066ca:	4712                	lw	a4,4(sp)
800066cc:	0ff00793          	li	a5,255
800066d0:	00e7e463          	bltu	a5,a4,800066d8 <sysctl_enable_group_resource+0x24>
        return status_invalid_argument;
800066d4:	4789                	li	a5,2
800066d6:	a8c1                	j	800067a6 <sysctl_enable_group_resource+0xf2>
    }

    index = (resource - sysctl_resource_linkable_start) / 32;
800066d8:	4792                	lw	a5,4(sp)
800066da:	f0078793          	addi	a5,a5,-256 # 3fffff00 <__share_mem_end__+0x3ee7ff00>
800066de:	8395                	srli	a5,a5,0x5
800066e0:	ce3e                	sw	a5,28(sp)
    offset = (resource - sysctl_resource_linkable_start) % 32;
800066e2:	4792                	lw	a5,4(sp)
800066e4:	8bfd                	andi	a5,a5,31
800066e6:	cc3e                	sw	a5,24(sp)
    switch (group) {
800066e8:	00b14783          	lbu	a5,11(sp)
800066ec:	c789                	beqz	a5,800066f6 <sysctl_enable_group_resource+0x42>
800066ee:	4705                	li	a4,1
800066f0:	04e78c63          	beq	a5,a4,80006748 <sysctl_enable_group_resource+0x94>
800066f4:	a05d                	j	8000679a <sysctl_enable_group_resource+0xe6>
    case SYSCTL_RESOURCE_GROUP0:
        ptr->GROUP0[index].VALUE = (ptr->GROUP0[index].VALUE & ~(1UL << offset))
800066f6:	4732                	lw	a4,12(sp)
800066f8:	47f2                	lw	a5,28(sp)
800066fa:	08078793          	addi	a5,a5,128
800066fe:	0792                	slli	a5,a5,0x4
80006700:	97ba                	add	a5,a5,a4
80006702:	4398                	lw	a4,0(a5)
80006704:	47e2                	lw	a5,24(sp)
80006706:	4685                	li	a3,1
80006708:	00f697b3          	sll	a5,a3,a5
8000670c:	fff7c793          	not	a5,a5
80006710:	8f7d                	and	a4,a4,a5
            | (enable ? (1UL << offset) : 0);
80006712:	00a14783          	lbu	a5,10(sp)
80006716:	c791                	beqz	a5,80006722 <sysctl_enable_group_resource+0x6e>
80006718:	47e2                	lw	a5,24(sp)
8000671a:	4685                	li	a3,1
8000671c:	00f697b3          	sll	a5,a3,a5
80006720:	a011                	j	80006724 <sysctl_enable_group_resource+0x70>
80006722:	4781                	li	a5,0
80006724:	8f5d                	or	a4,a4,a5
        ptr->GROUP0[index].VALUE = (ptr->GROUP0[index].VALUE & ~(1UL << offset))
80006726:	46b2                	lw	a3,12(sp)
80006728:	47f2                	lw	a5,28(sp)
8000672a:	08078793          	addi	a5,a5,128
8000672e:	0792                	slli	a5,a5,0x4
80006730:	97b6                	add	a5,a5,a3
80006732:	c398                	sw	a4,0(a5)
        if (enable) {
80006734:	00a14783          	lbu	a5,10(sp)
80006738:	c3bd                	beqz	a5,8000679e <sysctl_enable_group_resource+0xea>
            while (sysctl_resource_target_is_busy(ptr, resource)) {
8000673a:	0001                	nop
8000673c:	4592                	lw	a1,4(sp)
8000673e:	4532                	lw	a0,12(sp)
80006740:	3725                	jal	80006668 <sysctl_resource_target_is_busy>
80006742:	87aa                	mv	a5,a0
80006744:	ffe5                	bnez	a5,8000673c <sysctl_enable_group_resource+0x88>
                ;
            }
        }
        break;
80006746:	a8a1                	j	8000679e <sysctl_enable_group_resource+0xea>
    case SYSCTL_RESOURCE_GROUP1:
        ptr->GROUP1[index].VALUE = (ptr->GROUP1[index].VALUE & ~(1UL << offset))
80006748:	4732                	lw	a4,12(sp)
8000674a:	47f2                	lw	a5,28(sp)
8000674c:	08478793          	addi	a5,a5,132
80006750:	0792                	slli	a5,a5,0x4
80006752:	97ba                	add	a5,a5,a4
80006754:	4398                	lw	a4,0(a5)
80006756:	47e2                	lw	a5,24(sp)
80006758:	4685                	li	a3,1
8000675a:	00f697b3          	sll	a5,a3,a5
8000675e:	fff7c793          	not	a5,a5
80006762:	8f7d                	and	a4,a4,a5
            | (enable ? (1UL << offset) : 0);
80006764:	00a14783          	lbu	a5,10(sp)
80006768:	c791                	beqz	a5,80006774 <sysctl_enable_group_resource+0xc0>
8000676a:	47e2                	lw	a5,24(sp)
8000676c:	4685                	li	a3,1
8000676e:	00f697b3          	sll	a5,a3,a5
80006772:	a011                	j	80006776 <sysctl_enable_group_resource+0xc2>
80006774:	4781                	li	a5,0
80006776:	8f5d                	or	a4,a4,a5
        ptr->GROUP1[index].VALUE = (ptr->GROUP1[index].VALUE & ~(1UL << offset))
80006778:	46b2                	lw	a3,12(sp)
8000677a:	47f2                	lw	a5,28(sp)
8000677c:	08478793          	addi	a5,a5,132
80006780:	0792                	slli	a5,a5,0x4
80006782:	97b6                	add	a5,a5,a3
80006784:	c398                	sw	a4,0(a5)
        if (enable) {
80006786:	00a14783          	lbu	a5,10(sp)
8000678a:	cf81                	beqz	a5,800067a2 <sysctl_enable_group_resource+0xee>
            while (sysctl_resource_target_is_busy(ptr, resource)) {
8000678c:	0001                	nop
8000678e:	4592                	lw	a1,4(sp)
80006790:	4532                	lw	a0,12(sp)
80006792:	3dd9                	jal	80006668 <sysctl_resource_target_is_busy>
80006794:	87aa                	mv	a5,a0
80006796:	ffe5                	bnez	a5,8000678e <sysctl_enable_group_resource+0xda>
                ;
            }
        }
        break;
80006798:	a029                	j	800067a2 <sysctl_enable_group_resource+0xee>
    default:
        return status_invalid_argument;
8000679a:	4789                	li	a5,2
8000679c:	a029                	j	800067a6 <sysctl_enable_group_resource+0xf2>
        break;
8000679e:	0001                	nop
800067a0:	a011                	j	800067a4 <sysctl_enable_group_resource+0xf0>
        break;
800067a2:	0001                	nop
    }

    return status_success;
800067a4:	4781                	li	a5,0
}
800067a6:	853e                	mv	a0,a5
800067a8:	50b2                	lw	ra,44(sp)
800067aa:	6145                	addi	sp,sp,48
800067ac:	8082                	ret

800067ae <sysctl_config_clock>:
    return status_success;
}

hpm_stat_t sysctl_config_clock(SYSCTL_Type *ptr, clock_node_t node,
                                clock_source_t source, uint32_t divide_by)
{
800067ae:	1101                	addi	sp,sp,-32
800067b0:	ce06                	sw	ra,28(sp)
800067b2:	c62a                	sw	a0,12(sp)
800067b4:	c42e                	sw	a1,8(sp)
800067b6:	c232                	sw	a2,4(sp)
800067b8:	c036                	sw	a3,0(sp)
    if (node >= clock_node_adc_i2s_start) {
800067ba:	4722                	lw	a4,8(sp)
800067bc:	04200793          	li	a5,66
800067c0:	00e7f463          	bgeu	a5,a4,800067c8 <sysctl_config_clock+0x1a>
        return status_invalid_argument;
800067c4:	4789                	li	a5,2
800067c6:	a095                	j	8000682a <sysctl_config_clock+0x7c>
    }

    if (source >= clock_source_general_source_end) {
800067c8:	4712                	lw	a4,4(sp)
800067ca:	479d                	li	a5,7
800067cc:	00e7f463          	bgeu	a5,a4,800067d4 <sysctl_config_clock+0x26>
        return status_invalid_argument;
800067d0:	4789                	li	a5,2
800067d2:	a8a1                	j	8000682a <sysctl_config_clock+0x7c>
    }
    ptr->CLOCK[node] = (ptr->CLOCK[node] &
800067d4:	4732                	lw	a4,12(sp)
800067d6:	47a2                	lw	a5,8(sp)
800067d8:	60078793          	addi	a5,a5,1536
800067dc:	078a                	slli	a5,a5,0x2
800067de:	97ba                	add	a5,a5,a4
800067e0:	4398                	lw	a4,0(a5)
800067e2:	77fd                	lui	a5,0xfffff
800067e4:	8f7d                	and	a4,a4,a5
            ~(SYSCTL_CLOCK_MUX_MASK | SYSCTL_CLOCK_DIV_MASK))
            | (SYSCTL_CLOCK_MUX_SET(source) | SYSCTL_CLOCK_DIV_SET(divide_by - 1));
800067e6:	4792                	lw	a5,4(sp)
800067e8:	00879693          	slli	a3,a5,0x8
800067ec:	6785                	lui	a5,0x1
800067ee:	f0078793          	addi	a5,a5,-256 # f00 <__ramfunc_end__+0xac8>
800067f2:	8efd                	and	a3,a3,a5
800067f4:	4782                	lw	a5,0(sp)
800067f6:	17fd                	addi	a5,a5,-1
800067f8:	0ff7f793          	zext.b	a5,a5
800067fc:	8fd5                	or	a5,a5,a3
800067fe:	8f5d                	or	a4,a4,a5
    ptr->CLOCK[node] = (ptr->CLOCK[node] &
80006800:	46b2                	lw	a3,12(sp)
80006802:	47a2                	lw	a5,8(sp)
80006804:	60078793          	addi	a5,a5,1536
80006808:	078a                	slli	a5,a5,0x2
8000680a:	97b6                	add	a5,a5,a3
8000680c:	c398                	sw	a4,0(a5)
    while (sysctl_clock_target_is_busy(ptr, node)) {
8000680e:	0001                	nop
80006810:	45a2                	lw	a1,8(sp)
80006812:	4532                	lw	a0,12(sp)
80006814:	3da5                	jal	8000668c <sysctl_clock_target_is_busy>
80006816:	87aa                	mv	a5,a0
80006818:	ffe5                	bnez	a5,80006810 <sysctl_config_clock+0x62>
    }

    if ((node == clock_node_cpu0) || (node == clock_node_cpu1)) {
8000681a:	47a2                	lw	a5,8(sp)
8000681c:	c789                	beqz	a5,80006826 <sysctl_config_clock+0x78>
8000681e:	4722                	lw	a4,8(sp)
80006820:	4789                	li	a5,2
80006822:	00f71363          	bne	a4,a5,80006828 <sysctl_config_clock+0x7a>
        clock_update_core_clock();
80006826:	2795                	jal	80006f8a <clock_update_core_clock>
    }
    return status_success;
80006828:	4781                	li	a5,0
}
8000682a:	853e                	mv	a0,a5
8000682c:	40f2                	lw	ra,28(sp)
8000682e:	6105                	addi	sp,sp,32
80006830:	8082                	ret

80006832 <hpm_csr_get_core_cycle>:
 *          - in user mode if the device supports M/U mode
 *
 * @return CSR cycle value in 64-bit
 */
static inline uint64_t hpm_csr_get_core_cycle(void)
{
80006832:	7179                	addi	sp,sp,-48
    uint64_t result;
    uint32_t resultl_first = read_csr(CSR_CYCLE);
80006834:	c0002f73          	rdcycle	t5
80006838:	d27a                	sw	t5,36(sp)
8000683a:	5f12                	lw	t5,36(sp)
8000683c:	d07a                	sw	t5,32(sp)
    uint32_t resulth = read_csr(CSR_CYCLEH);
8000683e:	c8002f73          	rdcycleh	t5
80006842:	ce7a                	sw	t5,28(sp)
80006844:	4f72                	lw	t5,28(sp)
80006846:	cc7a                	sw	t5,24(sp)
    uint32_t resultl_second = read_csr(CSR_CYCLE);
80006848:	c0002f73          	rdcycle	t5
8000684c:	ca7a                	sw	t5,20(sp)
8000684e:	4f52                	lw	t5,20(sp)
80006850:	c87a                	sw	t5,16(sp)
    if (resultl_first < resultl_second) {
80006852:	5f82                	lw	t6,32(sp)
80006854:	4f42                	lw	t5,16(sp)
80006856:	03eff263          	bgeu	t6,t5,8000687a <hpm_csr_get_core_cycle+0x48>
        result = ((uint64_t)resulth << 32) | resultl_first; /* if CYCLE didn't roll over, return the value directly */
8000685a:	47e2                	lw	a5,24(sp)
8000685c:	8e3e                	mv	t3,a5
8000685e:	4e81                	li	t4,0
80006860:	000e1693          	slli	a3,t3,0x0
80006864:	4601                	li	a2,0
80006866:	5782                	lw	a5,32(sp)
80006868:	883e                	mv	a6,a5
8000686a:	4881                	li	a7,0
8000686c:	010667b3          	or	a5,a2,a6
80006870:	d43e                	sw	a5,40(sp)
80006872:	0116e7b3          	or	a5,a3,a7
80006876:	d63e                	sw	a5,44(sp)
80006878:	a025                	j	800068a0 <hpm_csr_get_core_cycle+0x6e>
    } else {
        resulth = read_csr(CSR_CYCLEH);
8000687a:	c80026f3          	rdcycleh	a3
8000687e:	c636                	sw	a3,12(sp)
80006880:	46b2                	lw	a3,12(sp)
80006882:	cc36                	sw	a3,24(sp)
        result = ((uint64_t)resulth << 32) | resultl_second; /* if CYCLE rolled over, need to get the CYCLEH again */
80006884:	46e2                	lw	a3,24(sp)
80006886:	8336                	mv	t1,a3
80006888:	4381                	li	t2,0
8000688a:	00031793          	slli	a5,t1,0x0
8000688e:	4701                	li	a4,0
80006890:	46c2                	lw	a3,16(sp)
80006892:	8536                	mv	a0,a3
80006894:	4581                	li	a1,0
80006896:	00a766b3          	or	a3,a4,a0
8000689a:	d436                	sw	a3,40(sp)
8000689c:	8fcd                	or	a5,a5,a1
8000689e:	d63e                	sw	a5,44(sp)
    }
    return result;
800068a0:	5722                	lw	a4,40(sp)
800068a2:	57b2                	lw	a5,44(sp)
 }
800068a4:	853a                	mv	a0,a4
800068a6:	85be                	mv	a1,a5
800068a8:	6145                	addi	sp,sp,48
800068aa:	8082                	ret

800068ac <pllctl_get_div>:
{
800068ac:	1141                	addi	sp,sp,-16
800068ae:	c62a                	sw	a0,12(sp)
800068b0:	87ae                	mv	a5,a1
800068b2:	8732                	mv	a4,a2
800068b4:	00f105a3          	sb	a5,11(sp)
800068b8:	87ba                	mv	a5,a4
800068ba:	00f10523          	sb	a5,10(sp)
    if ((pll > (PLLCTL_SOC_PLL_MAX_COUNT - 1))
800068be:	00b14703          	lbu	a4,11(sp)
800068c2:	4791                	li	a5,4
800068c4:	00e7ec63          	bltu	a5,a4,800068dc <pllctl_get_div+0x30>
            || !(PLLCTL_SOC_PLL_HAS_DIV0(pll))) {
800068c8:	00b14703          	lbu	a4,11(sp)
800068cc:	4785                	li	a5,1
800068ce:	00f70963          	beq	a4,a5,800068e0 <pllctl_get_div+0x34>
800068d2:	00b14703          	lbu	a4,11(sp)
800068d6:	4789                	li	a5,2
800068d8:	00f70463          	beq	a4,a5,800068e0 <pllctl_get_div+0x34>
        return status_invalid_argument;
800068dc:	4789                	li	a5,2
800068de:	a80d                	j	80006910 <pllctl_get_div+0x64>
    if (div_index) {
800068e0:	00a14783          	lbu	a5,10(sp)
800068e4:	cf81                	beqz	a5,800068fc <pllctl_get_div+0x50>
        return PLLCTL_PLL_DIV0_DIV_GET(ptr->PLL[pll].DIV1) + 1;
800068e6:	00b14783          	lbu	a5,11(sp)
800068ea:	4732                	lw	a4,12(sp)
800068ec:	079e                	slli	a5,a5,0x7
800068ee:	97ba                	add	a5,a5,a4
800068f0:	0c47a783          	lw	a5,196(a5)
800068f4:	0ff7f793          	zext.b	a5,a5
800068f8:	0785                	addi	a5,a5,1
800068fa:	a819                	j	80006910 <pllctl_get_div+0x64>
        return PLLCTL_PLL_DIV0_DIV_GET(ptr->PLL[pll].DIV0) + 1;
800068fc:	00b14783          	lbu	a5,11(sp)
80006900:	4732                	lw	a4,12(sp)
80006902:	079e                	slli	a5,a5,0x7
80006904:	97ba                	add	a5,a5,a4
80006906:	0c07a783          	lw	a5,192(a5)
8000690a:	0ff7f793          	zext.b	a5,a5
8000690e:	0785                	addi	a5,a5,1
}
80006910:	853e                	mv	a0,a5
80006912:	0141                	addi	sp,sp,16
80006914:	8082                	ret

80006916 <clock_get_frequency>:

/***********************************************************************************************************************
 * Codes
 **********************************************************************************************************************/
uint32_t clock_get_frequency(clock_name_t clock_name)
{
80006916:	7179                	addi	sp,sp,-48
80006918:	d606                	sw	ra,44(sp)
8000691a:	c62a                	sw	a0,12(sp)
    uint32_t clk_freq = 0UL;
8000691c:	ce02                	sw	zero,28(sp)
    uint32_t clk_src_type = GET_CLK_SRC_GROUP_FROM_NAME(clock_name);
8000691e:	47b2                	lw	a5,12(sp)
80006920:	83a1                	srli	a5,a5,0x8
80006922:	0ff7f793          	zext.b	a5,a5
80006926:	cc3e                	sw	a5,24(sp)
    uint32_t node_or_instance = GET_CLK_NODE_FROM_NAME(clock_name);
80006928:	47b2                	lw	a5,12(sp)
8000692a:	0ff7f793          	zext.b	a5,a5
8000692e:	ca3e                	sw	a5,20(sp)
    switch (clk_src_type) {
80006930:	4762                	lw	a4,24(sp)
80006932:	47b1                	li	a5,12
80006934:	0cf70f63          	beq	a4,a5,80006a12 <clock_get_frequency+0xfc>
80006938:	4762                	lw	a4,24(sp)
8000693a:	47b1                	li	a5,12
8000693c:	12e7e063          	bltu	a5,a4,80006a5c <clock_get_frequency+0x146>
80006940:	4762                	lw	a4,24(sp)
80006942:	47ad                	li	a5,11
80006944:	10f70863          	beq	a4,a5,80006a54 <clock_get_frequency+0x13e>
80006948:	4762                	lw	a4,24(sp)
8000694a:	47ad                	li	a5,11
8000694c:	10e7e863          	bltu	a5,a4,80006a5c <clock_get_frequency+0x146>
80006950:	4762                	lw	a4,24(sp)
80006952:	47a9                	li	a5,10
80006954:	0ef70c63          	beq	a4,a5,80006a4c <clock_get_frequency+0x136>
80006958:	4762                	lw	a4,24(sp)
8000695a:	47a9                	li	a5,10
8000695c:	10e7e063          	bltu	a5,a4,80006a5c <clock_get_frequency+0x146>
80006960:	4762                	lw	a4,24(sp)
80006962:	47a5                	li	a5,9
80006964:	0ef70063          	beq	a4,a5,80006a44 <clock_get_frequency+0x12e>
80006968:	4762                	lw	a4,24(sp)
8000696a:	47a5                	li	a5,9
8000696c:	0ee7e863          	bltu	a5,a4,80006a5c <clock_get_frequency+0x146>
80006970:	4762                	lw	a4,24(sp)
80006972:	47a1                	li	a5,8
80006974:	0cf70463          	beq	a4,a5,80006a3c <clock_get_frequency+0x126>
80006978:	4762                	lw	a4,24(sp)
8000697a:	47a1                	li	a5,8
8000697c:	0ee7e063          	bltu	a5,a4,80006a5c <clock_get_frequency+0x146>
80006980:	4762                	lw	a4,24(sp)
80006982:	479d                	li	a5,7
80006984:	0af70863          	beq	a4,a5,80006a34 <clock_get_frequency+0x11e>
80006988:	4762                	lw	a4,24(sp)
8000698a:	479d                	li	a5,7
8000698c:	0ce7e863          	bltu	a5,a4,80006a5c <clock_get_frequency+0x146>
80006990:	4762                	lw	a4,24(sp)
80006992:	4799                	li	a5,6
80006994:	08f70c63          	beq	a4,a5,80006a2c <clock_get_frequency+0x116>
80006998:	4762                	lw	a4,24(sp)
8000699a:	4799                	li	a5,6
8000699c:	0ce7e063          	bltu	a5,a4,80006a5c <clock_get_frequency+0x146>
800069a0:	4762                	lw	a4,24(sp)
800069a2:	4795                	li	a5,5
800069a4:	08f70063          	beq	a4,a5,80006a24 <clock_get_frequency+0x10e>
800069a8:	4762                	lw	a4,24(sp)
800069aa:	4795                	li	a5,5
800069ac:	0ae7e863          	bltu	a5,a4,80006a5c <clock_get_frequency+0x146>
800069b0:	4762                	lw	a4,24(sp)
800069b2:	4791                	li	a5,4
800069b4:	06f70263          	beq	a4,a5,80006a18 <clock_get_frequency+0x102>
800069b8:	4762                	lw	a4,24(sp)
800069ba:	4791                	li	a5,4
800069bc:	0ae7e063          	bltu	a5,a4,80006a5c <clock_get_frequency+0x146>
800069c0:	4762                	lw	a4,24(sp)
800069c2:	478d                	li	a5,3
800069c4:	04f70363          	beq	a4,a5,80006a0a <clock_get_frequency+0xf4>
800069c8:	4762                	lw	a4,24(sp)
800069ca:	478d                	li	a5,3
800069cc:	08e7e863          	bltu	a5,a4,80006a5c <clock_get_frequency+0x146>
800069d0:	4762                	lw	a4,24(sp)
800069d2:	4789                	li	a5,2
800069d4:	02f70663          	beq	a4,a5,80006a00 <clock_get_frequency+0xea>
800069d8:	4762                	lw	a4,24(sp)
800069da:	4789                	li	a5,2
800069dc:	08e7e063          	bltu	a5,a4,80006a5c <clock_get_frequency+0x146>
800069e0:	47e2                	lw	a5,24(sp)
800069e2:	c791                	beqz	a5,800069ee <clock_get_frequency+0xd8>
800069e4:	4762                	lw	a4,24(sp)
800069e6:	4785                	li	a5,1
800069e8:	00f70763          	beq	a4,a5,800069f6 <clock_get_frequency+0xe0>
800069ec:	a885                	j	80006a5c <clock_get_frequency+0x146>
    case CLK_SRC_GROUP_COMMON:
        clk_freq = get_frequency_for_ip_in_common_group((clock_node_t) node_or_instance);
800069ee:	4552                	lw	a0,20(sp)
800069f0:	22c1                	jal	80006bb0 <get_frequency_for_ip_in_common_group>
800069f2:	ce2a                	sw	a0,28(sp)
        break;
800069f4:	a0b5                	j	80006a60 <clock_get_frequency+0x14a>
    case CLK_SRC_GROUP_ADC:
        clk_freq = get_frequency_for_i2s_or_adc(CLK_SRC_GROUP_ADC, node_or_instance);
800069f6:	45d2                	lw	a1,20(sp)
800069f8:	4505                	li	a0,1
800069fa:	2c29                	jal	80006c14 <get_frequency_for_i2s_or_adc>
800069fc:	ce2a                	sw	a0,28(sp)
        break;
800069fe:	a08d                	j	80006a60 <clock_get_frequency+0x14a>
    case CLK_SRC_GROUP_I2S:
        clk_freq = get_frequency_for_i2s_or_adc(CLK_SRC_GROUP_I2S, node_or_instance);
80006a00:	45d2                	lw	a1,20(sp)
80006a02:	4509                	li	a0,2
80006a04:	2c01                	jal	80006c14 <get_frequency_for_i2s_or_adc>
80006a06:	ce2a                	sw	a0,28(sp)
        break;
80006a08:	a8a1                	j	80006a60 <clock_get_frequency+0x14a>
    case CLK_SRC_GROUP_WDG:
        clk_freq = get_frequency_for_wdg(node_or_instance);
80006a0a:	4552                	lw	a0,20(sp)
80006a0c:	2cc1                	jal	80006cdc <get_frequency_for_wdg>
80006a0e:	ce2a                	sw	a0,28(sp)
        break;
80006a10:	a881                	j	80006a60 <clock_get_frequency+0x14a>
    case CLK_SRC_GROUP_PWDG:
        clk_freq = get_frequency_for_pwdg();
80006a12:	2cf5                	jal	80006d0e <get_frequency_for_pwdg>
80006a14:	ce2a                	sw	a0,28(sp)
        break;
80006a16:	a0a9                	j	80006a60 <clock_get_frequency+0x14a>
    case CLK_SRC_GROUP_PMIC:
        clk_freq = FREQ_PRESET1_OSC0_CLK0;
80006a18:	016e37b7          	lui	a5,0x16e3
80006a1c:	60078793          	addi	a5,a5,1536 # 16e3600 <__share_mem_end__+0x563600>
80006a20:	ce3e                	sw	a5,28(sp)
        break;
80006a22:	a83d                	j	80006a60 <clock_get_frequency+0x14a>
    case CLK_SRC_GROUP_AHB:
        clk_freq = get_frequency_for_ip_in_common_group(clock_node_ahb0);
80006a24:	451d                	li	a0,7
80006a26:	2269                	jal	80006bb0 <get_frequency_for_ip_in_common_group>
80006a28:	ce2a                	sw	a0,28(sp)
        break;
80006a2a:	a81d                	j	80006a60 <clock_get_frequency+0x14a>
    case CLK_SRC_GROUP_AXI0:
        clk_freq = get_frequency_for_ip_in_common_group(clock_node_axi0);
80006a2c:	4511                	li	a0,4
80006a2e:	2249                	jal	80006bb0 <get_frequency_for_ip_in_common_group>
80006a30:	ce2a                	sw	a0,28(sp)
        break;
80006a32:	a03d                	j	80006a60 <clock_get_frequency+0x14a>
    case CLK_SRC_GROUP_AXI1:
        clk_freq = get_frequency_for_ip_in_common_group(clock_node_axi1);
80006a34:	4515                	li	a0,5
80006a36:	2aad                	jal	80006bb0 <get_frequency_for_ip_in_common_group>
80006a38:	ce2a                	sw	a0,28(sp)
        break;
80006a3a:	a01d                	j	80006a60 <clock_get_frequency+0x14a>
    case CLK_SRC_GROUP_AXI2:
        clk_freq = get_frequency_for_ip_in_common_group(clock_node_axi2);
80006a3c:	4519                	li	a0,6
80006a3e:	2a8d                	jal	80006bb0 <get_frequency_for_ip_in_common_group>
80006a40:	ce2a                	sw	a0,28(sp)
        break;
80006a42:	a839                	j	80006a60 <clock_get_frequency+0x14a>
    case CLK_SRC_GROUP_CPU0:
        clk_freq = get_frequency_for_ip_in_common_group(clock_node_cpu0);
80006a44:	4501                	li	a0,0
80006a46:	22ad                	jal	80006bb0 <get_frequency_for_ip_in_common_group>
80006a48:	ce2a                	sw	a0,28(sp)
        break;
80006a4a:	a819                	j	80006a60 <clock_get_frequency+0x14a>
    case CLK_SRC_GROUP_CPU1:
        clk_freq = get_frequency_for_ip_in_common_group(clock_node_cpu1);
80006a4c:	4509                	li	a0,2
80006a4e:	228d                	jal	80006bb0 <get_frequency_for_ip_in_common_group>
80006a50:	ce2a                	sw	a0,28(sp)
        break;
80006a52:	a039                	j	80006a60 <clock_get_frequency+0x14a>
    case CLK_SRC_GROUP_SRC:
        clk_freq = get_frequency_for_source((clock_source_t) node_or_instance);
80006a54:	4552                	lw	a0,20(sp)
80006a56:	2811                	jal	80006a6a <get_frequency_for_source>
80006a58:	ce2a                	sw	a0,28(sp)
        break;
80006a5a:	a019                	j	80006a60 <clock_get_frequency+0x14a>
    default:
        clk_freq = 0UL;
80006a5c:	ce02                	sw	zero,28(sp)
        break;
80006a5e:	0001                	nop
    }
    return clk_freq;
80006a60:	47f2                	lw	a5,28(sp)
}
80006a62:	853e                	mv	a0,a5
80006a64:	50b2                	lw	ra,44(sp)
80006a66:	6145                	addi	sp,sp,48
80006a68:	8082                	ret

80006a6a <get_frequency_for_source>:

uint32_t get_frequency_for_source(clock_source_t source)
{
80006a6a:	7179                	addi	sp,sp,-48
80006a6c:	d606                	sw	ra,44(sp)
80006a6e:	c62a                	sw	a0,12(sp)
    uint32_t clk_freq = 0UL;
80006a70:	ce02                	sw	zero,28(sp)
    uint32_t div = 1;
80006a72:	4785                	li	a5,1
80006a74:	cc3e                	sw	a5,24(sp)
    switch (source) {
80006a76:	4732                	lw	a4,12(sp)
80006a78:	479d                	li	a5,7
80006a7a:	10f70d63          	beq	a4,a5,80006b94 <get_frequency_for_source+0x12a>
80006a7e:	4732                	lw	a4,12(sp)
80006a80:	479d                	li	a5,7
80006a82:	12e7e063          	bltu	a5,a4,80006ba2 <get_frequency_for_source+0x138>
80006a86:	4732                	lw	a4,12(sp)
80006a88:	4799                	li	a5,6
80006a8a:	0ef70e63          	beq	a4,a5,80006b86 <get_frequency_for_source+0x11c>
80006a8e:	4732                	lw	a4,12(sp)
80006a90:	4799                	li	a5,6
80006a92:	10e7e863          	bltu	a5,a4,80006ba2 <get_frequency_for_source+0x138>
80006a96:	4732                	lw	a4,12(sp)
80006a98:	4795                	li	a5,5
80006a9a:	0cf70563          	beq	a4,a5,80006b64 <get_frequency_for_source+0xfa>
80006a9e:	4732                	lw	a4,12(sp)
80006aa0:	4795                	li	a5,5
80006aa2:	10e7e063          	bltu	a5,a4,80006ba2 <get_frequency_for_source+0x138>
80006aa6:	4732                	lw	a4,12(sp)
80006aa8:	4791                	li	a5,4
80006aaa:	08f70c63          	beq	a4,a5,80006b42 <get_frequency_for_source+0xd8>
80006aae:	4732                	lw	a4,12(sp)
80006ab0:	4791                	li	a5,4
80006ab2:	0ee7e863          	bltu	a5,a4,80006ba2 <get_frequency_for_source+0x138>
80006ab6:	4732                	lw	a4,12(sp)
80006ab8:	478d                	li	a5,3
80006aba:	06f70363          	beq	a4,a5,80006b20 <get_frequency_for_source+0xb6>
80006abe:	4732                	lw	a4,12(sp)
80006ac0:	478d                	li	a5,3
80006ac2:	0ee7e063          	bltu	a5,a4,80006ba2 <get_frequency_for_source+0x138>
80006ac6:	4732                	lw	a4,12(sp)
80006ac8:	4789                	li	a5,2
80006aca:	02f70a63          	beq	a4,a5,80006afe <get_frequency_for_source+0x94>
80006ace:	4732                	lw	a4,12(sp)
80006ad0:	4789                	li	a5,2
80006ad2:	0ce7e863          	bltu	a5,a4,80006ba2 <get_frequency_for_source+0x138>
80006ad6:	47b2                	lw	a5,12(sp)
80006ad8:	c791                	beqz	a5,80006ae4 <get_frequency_for_source+0x7a>
80006ada:	4732                	lw	a4,12(sp)
80006adc:	4785                	li	a5,1
80006ade:	00f70963          	beq	a4,a5,80006af0 <get_frequency_for_source+0x86>
80006ae2:	a0c1                	j	80006ba2 <get_frequency_for_source+0x138>
    case clock_source_osc0_clk0:
        clk_freq = FREQ_PRESET1_OSC0_CLK0;
80006ae4:	016e37b7          	lui	a5,0x16e3
80006ae8:	60078793          	addi	a5,a5,1536 # 16e3600 <__share_mem_end__+0x563600>
80006aec:	ce3e                	sw	a5,28(sp)
        break;
80006aee:	a865                	j	80006ba6 <get_frequency_for_source+0x13c>
    case clock_source_pll0_clk0:
        clk_freq = pllctl_get_pll_freq_in_hz(HPM_PLLCTL, 0U);
80006af0:	4581                	li	a1,0
80006af2:	f4100537          	lui	a0,0xf4100
80006af6:	30a010ef          	jal	80007e00 <pllctl_get_pll_freq_in_hz>
80006afa:	ce2a                	sw	a0,28(sp)
        break;
80006afc:	a06d                	j	80006ba6 <get_frequency_for_source+0x13c>
    case clock_source_pll1_clk0:
        div = pllctl_get_div(HPM_PLLCTL, 1, 0);
80006afe:	4601                	li	a2,0
80006b00:	4585                	li	a1,1
80006b02:	f4100537          	lui	a0,0xf4100
80006b06:	335d                	jal	800068ac <pllctl_get_div>
80006b08:	cc2a                	sw	a0,24(sp)
        clk_freq = pllctl_get_pll_freq_in_hz(HPM_PLLCTL, 1U) / div;
80006b0a:	4585                	li	a1,1
80006b0c:	f4100537          	lui	a0,0xf4100
80006b10:	2f0010ef          	jal	80007e00 <pllctl_get_pll_freq_in_hz>
80006b14:	872a                	mv	a4,a0
80006b16:	47e2                	lw	a5,24(sp)
80006b18:	02f757b3          	divu	a5,a4,a5
80006b1c:	ce3e                	sw	a5,28(sp)
        break;
80006b1e:	a061                	j	80006ba6 <get_frequency_for_source+0x13c>
    case clock_source_pll1_clk1:
        div = pllctl_get_div(HPM_PLLCTL, 1, 1);
80006b20:	4605                	li	a2,1
80006b22:	4585                	li	a1,1
80006b24:	f4100537          	lui	a0,0xf4100
80006b28:	3351                	jal	800068ac <pllctl_get_div>
80006b2a:	cc2a                	sw	a0,24(sp)
        clk_freq = pllctl_get_pll_freq_in_hz(HPM_PLLCTL, 1U) / div;
80006b2c:	4585                	li	a1,1
80006b2e:	f4100537          	lui	a0,0xf4100
80006b32:	2ce010ef          	jal	80007e00 <pllctl_get_pll_freq_in_hz>
80006b36:	872a                	mv	a4,a0
80006b38:	47e2                	lw	a5,24(sp)
80006b3a:	02f757b3          	divu	a5,a4,a5
80006b3e:	ce3e                	sw	a5,28(sp)
        break;
80006b40:	a09d                	j	80006ba6 <get_frequency_for_source+0x13c>
    case clock_source_pll2_clk0:
        div = pllctl_get_div(HPM_PLLCTL, 2, 0);
80006b42:	4601                	li	a2,0
80006b44:	4589                	li	a1,2
80006b46:	f4100537          	lui	a0,0xf4100
80006b4a:	338d                	jal	800068ac <pllctl_get_div>
80006b4c:	cc2a                	sw	a0,24(sp)
        clk_freq = pllctl_get_pll_freq_in_hz(HPM_PLLCTL, 2U) / div;
80006b4e:	4589                	li	a1,2
80006b50:	f4100537          	lui	a0,0xf4100
80006b54:	2ac010ef          	jal	80007e00 <pllctl_get_pll_freq_in_hz>
80006b58:	872a                	mv	a4,a0
80006b5a:	47e2                	lw	a5,24(sp)
80006b5c:	02f757b3          	divu	a5,a4,a5
80006b60:	ce3e                	sw	a5,28(sp)
        break;
80006b62:	a091                	j	80006ba6 <get_frequency_for_source+0x13c>
    case clock_source_pll2_clk1:
        div = pllctl_get_div(HPM_PLLCTL, 2, 1);
80006b64:	4605                	li	a2,1
80006b66:	4589                	li	a1,2
80006b68:	f4100537          	lui	a0,0xf4100
80006b6c:	3381                	jal	800068ac <pllctl_get_div>
80006b6e:	cc2a                	sw	a0,24(sp)
        clk_freq = pllctl_get_pll_freq_in_hz(HPM_PLLCTL, 2U) / div;
80006b70:	4589                	li	a1,2
80006b72:	f4100537          	lui	a0,0xf4100
80006b76:	28a010ef          	jal	80007e00 <pllctl_get_pll_freq_in_hz>
80006b7a:	872a                	mv	a4,a0
80006b7c:	47e2                	lw	a5,24(sp)
80006b7e:	02f757b3          	divu	a5,a4,a5
80006b82:	ce3e                	sw	a5,28(sp)
        break;
80006b84:	a00d                	j	80006ba6 <get_frequency_for_source+0x13c>
    case clock_source_pll3_clk0:
        clk_freq = pllctl_get_pll_freq_in_hz(HPM_PLLCTL, 3U);
80006b86:	458d                	li	a1,3
80006b88:	f4100537          	lui	a0,0xf4100
80006b8c:	274010ef          	jal	80007e00 <pllctl_get_pll_freq_in_hz>
80006b90:	ce2a                	sw	a0,28(sp)
        break;
80006b92:	a811                	j	80006ba6 <get_frequency_for_source+0x13c>
    case clock_source_pll4_clk0:
        clk_freq = pllctl_get_pll_freq_in_hz(HPM_PLLCTL, 4U);
80006b94:	4591                	li	a1,4
80006b96:	f4100537          	lui	a0,0xf4100
80006b9a:	266010ef          	jal	80007e00 <pllctl_get_pll_freq_in_hz>
80006b9e:	ce2a                	sw	a0,28(sp)
        break;
80006ba0:	a019                	j	80006ba6 <get_frequency_for_source+0x13c>
    default:
        clk_freq = 0UL;
80006ba2:	ce02                	sw	zero,28(sp)
        break;
80006ba4:	0001                	nop
    }

    return clk_freq;
80006ba6:	47f2                	lw	a5,28(sp)
}
80006ba8:	853e                	mv	a0,a5
80006baa:	50b2                	lw	ra,44(sp)
80006bac:	6145                	addi	sp,sp,48
80006bae:	8082                	ret

80006bb0 <get_frequency_for_ip_in_common_group>:

static uint32_t get_frequency_for_ip_in_common_group(clock_node_t node)
{
80006bb0:	7139                	addi	sp,sp,-64
80006bb2:	de06                	sw	ra,60(sp)
80006bb4:	c62a                	sw	a0,12(sp)
    uint32_t clk_freq = 0UL;
80006bb6:	d602                	sw	zero,44(sp)
    uint32_t node_or_instance = GET_CLK_NODE_FROM_NAME(node);
80006bb8:	47b2                	lw	a5,12(sp)
80006bba:	0ff7f793          	zext.b	a5,a5
80006bbe:	d43e                	sw	a5,40(sp)

    if (node_or_instance < clock_node_end) {
80006bc0:	5722                	lw	a4,40(sp)
80006bc2:	04a00793          	li	a5,74
80006bc6:	04e7e263          	bltu	a5,a4,80006c0a <get_frequency_for_ip_in_common_group+0x5a>
        uint32_t clk_node = (uint32_t) node_or_instance;
80006bca:	57a2                	lw	a5,40(sp)
80006bcc:	d23e                	sw	a5,36(sp)

        uint32_t clk_div = 1UL + SYSCTL_CLOCK_DIV_GET(HPM_SYSCTL->CLOCK[clk_node]);
80006bce:	f4000737          	lui	a4,0xf4000
80006bd2:	5792                	lw	a5,36(sp)
80006bd4:	60078793          	addi	a5,a5,1536
80006bd8:	078a                	slli	a5,a5,0x2
80006bda:	97ba                	add	a5,a5,a4
80006bdc:	439c                	lw	a5,0(a5)
80006bde:	0ff7f793          	zext.b	a5,a5
80006be2:	0785                	addi	a5,a5,1
80006be4:	d03e                	sw	a5,32(sp)
        clock_source_t clk_mux = (clock_source_t) SYSCTL_CLOCK_MUX_GET(HPM_SYSCTL->CLOCK[clk_node]);
80006be6:	f4000737          	lui	a4,0xf4000
80006bea:	5792                	lw	a5,36(sp)
80006bec:	60078793          	addi	a5,a5,1536
80006bf0:	078a                	slli	a5,a5,0x2
80006bf2:	97ba                	add	a5,a5,a4
80006bf4:	439c                	lw	a5,0(a5)
80006bf6:	83a1                	srli	a5,a5,0x8
80006bf8:	8bbd                	andi	a5,a5,15
80006bfa:	ce3e                	sw	a5,28(sp)
        clk_freq = get_frequency_for_source(clk_mux) / clk_div;
80006bfc:	4572                	lw	a0,28(sp)
80006bfe:	35b5                	jal	80006a6a <get_frequency_for_source>
80006c00:	872a                	mv	a4,a0
80006c02:	5782                	lw	a5,32(sp)
80006c04:	02f757b3          	divu	a5,a4,a5
80006c08:	d63e                	sw	a5,44(sp)
    }
    return clk_freq;
80006c0a:	57b2                	lw	a5,44(sp)
}
80006c0c:	853e                	mv	a0,a5
80006c0e:	50f2                	lw	ra,60(sp)
80006c10:	6121                	addi	sp,sp,64
80006c12:	8082                	ret

80006c14 <get_frequency_for_i2s_or_adc>:

static uint32_t get_frequency_for_i2s_or_adc(uint32_t clk_src_type, uint32_t instance)
{
80006c14:	7139                	addi	sp,sp,-64
80006c16:	de06                	sw	ra,60(sp)
80006c18:	c62a                	sw	a0,12(sp)
80006c1a:	c42e                	sw	a1,8(sp)
    uint32_t clk_freq = 0UL;
80006c1c:	d602                	sw	zero,44(sp)
    bool is_mux_valid = false;
80006c1e:	020105a3          	sb	zero,43(sp)
    clock_node_t node = clock_node_end;
80006c22:	04b00793          	li	a5,75
80006c26:	d23e                	sw	a5,36(sp)
    if (clk_src_type == CLK_SRC_GROUP_ADC) {
80006c28:	4732                	lw	a4,12(sp)
80006c2a:	4785                	li	a5,1
80006c2c:	04f71463          	bne	a4,a5,80006c74 <get_frequency_for_i2s_or_adc+0x60>
        uint32_t adc_index = instance;
80006c30:	47a2                	lw	a5,8(sp)
80006c32:	cc3e                	sw	a5,24(sp)
        if (adc_index < ADC_INSTANCE_NUM) {
80006c34:	4762                	lw	a4,24(sp)
80006c36:	478d                	li	a5,3
80006c38:	06e7ef63          	bltu	a5,a4,80006cb6 <get_frequency_for_i2s_or_adc+0xa2>
            uint32_t mux_in_reg = SYSCTL_ADCCLK_MUX_GET(HPM_SYSCTL->ADCCLK[adc_index]);
80006c3c:	f4000737          	lui	a4,0xf4000
80006c40:	47e2                	lw	a5,24(sp)
80006c42:	70078793          	addi	a5,a5,1792
80006c46:	078a                	slli	a5,a5,0x2
80006c48:	97ba                	add	a5,a5,a4
80006c4a:	439c                	lw	a5,0(a5)
80006c4c:	83a1                	srli	a5,a5,0x8
80006c4e:	8b9d                	andi	a5,a5,7
80006c50:	ca3e                	sw	a5,20(sp)
            if (mux_in_reg < ARRAY_SIZE(s_adc_clk_mux_node)) {
80006c52:	4752                	lw	a4,20(sp)
80006c54:	478d                	li	a5,3
80006c56:	06e7e063          	bltu	a5,a4,80006cb6 <get_frequency_for_i2s_or_adc+0xa2>
                node = s_adc_clk_mux_node[mux_in_reg];
80006c5a:	8000e7b7          	lui	a5,0x8000e
80006c5e:	9b878713          	addi	a4,a5,-1608 # 8000d9b8 <s_adc_clk_mux_node>
80006c62:	47d2                	lw	a5,20(sp)
80006c64:	078a                	slli	a5,a5,0x2
80006c66:	97ba                	add	a5,a5,a4
80006c68:	439c                	lw	a5,0(a5)
80006c6a:	d23e                	sw	a5,36(sp)
                is_mux_valid = true;
80006c6c:	4785                	li	a5,1
80006c6e:	02f105a3          	sb	a5,43(sp)
80006c72:	a091                	j	80006cb6 <get_frequency_for_i2s_or_adc+0xa2>
            }
        }
    } else {
        uint32_t i2s_index = instance;
80006c74:	47a2                	lw	a5,8(sp)
80006c76:	d03e                	sw	a5,32(sp)
        if (i2s_index < I2S_INSTANCE_NUM) {
80006c78:	5702                	lw	a4,32(sp)
80006c7a:	478d                	li	a5,3
80006c7c:	02e7ed63          	bltu	a5,a4,80006cb6 <get_frequency_for_i2s_or_adc+0xa2>
            uint32_t mux_in_reg = SYSCTL_I2SCLK_MUX_GET(HPM_SYSCTL->I2SCLK[i2s_index]);
80006c80:	f4000737          	lui	a4,0xf4000
80006c84:	5782                	lw	a5,32(sp)
80006c86:	70478793          	addi	a5,a5,1796
80006c8a:	078a                	slli	a5,a5,0x2
80006c8c:	97ba                	add	a5,a5,a4
80006c8e:	439c                	lw	a5,0(a5)
80006c90:	83a1                	srli	a5,a5,0x8
80006c92:	8b9d                	andi	a5,a5,7
80006c94:	ce3e                	sw	a5,28(sp)
            if (mux_in_reg < ARRAY_SIZE(s_i2s_clk_mux_node)) {
80006c96:	4772                	lw	a4,28(sp)
80006c98:	478d                	li	a5,3
80006c9a:	00e7ee63          	bltu	a5,a4,80006cb6 <get_frequency_for_i2s_or_adc+0xa2>
                node = s_i2s_clk_mux_node[mux_in_reg];
80006c9e:	8000e7b7          	lui	a5,0x8000e
80006ca2:	9c878713          	addi	a4,a5,-1592 # 8000d9c8 <s_i2s_clk_mux_node>
80006ca6:	47f2                	lw	a5,28(sp)
80006ca8:	078a                	slli	a5,a5,0x2
80006caa:	97ba                	add	a5,a5,a4
80006cac:	439c                	lw	a5,0(a5)
80006cae:	d23e                	sw	a5,36(sp)
                is_mux_valid = true;
80006cb0:	4785                	li	a5,1
80006cb2:	02f105a3          	sb	a5,43(sp)
            }
        }
    }

    if (is_mux_valid) {
80006cb6:	02b14783          	lbu	a5,43(sp)
80006cba:	cf81                	beqz	a5,80006cd2 <get_frequency_for_i2s_or_adc+0xbe>
        if (node == clock_node_ahb0) {
80006cbc:	5712                	lw	a4,36(sp)
80006cbe:	479d                	li	a5,7
80006cc0:	00f71663          	bne	a4,a5,80006ccc <get_frequency_for_i2s_or_adc+0xb8>
            clk_freq = get_frequency_for_ip_in_common_group(clock_node_ahb0);
80006cc4:	451d                	li	a0,7
80006cc6:	35ed                	jal	80006bb0 <get_frequency_for_ip_in_common_group>
80006cc8:	d62a                	sw	a0,44(sp)
80006cca:	a021                	j	80006cd2 <get_frequency_for_i2s_or_adc+0xbe>
        } else {
            clk_freq = get_frequency_for_ip_in_common_group(node);
80006ccc:	5512                	lw	a0,36(sp)
80006cce:	35cd                	jal	80006bb0 <get_frequency_for_ip_in_common_group>
80006cd0:	d62a                	sw	a0,44(sp)
        }
    }
    return clk_freq;
80006cd2:	57b2                	lw	a5,44(sp)
}
80006cd4:	853e                	mv	a0,a5
80006cd6:	50f2                	lw	ra,60(sp)
80006cd8:	6121                	addi	sp,sp,64
80006cda:	8082                	ret

80006cdc <get_frequency_for_wdg>:

static uint32_t get_frequency_for_wdg(uint32_t instance)
{
80006cdc:	7179                	addi	sp,sp,-48
80006cde:	d606                	sw	ra,44(sp)
80006ce0:	c62a                	sw	a0,12(sp)
    uint32_t freq_in_hz;
    /* EXT clock is chosen */
    if (WDG_CTRL_CLKSEL_GET(s_wdgs[instance]->CTRL) == 0) {
80006ce2:	8000e7b7          	lui	a5,0x8000e
80006ce6:	9d878713          	addi	a4,a5,-1576 # 8000d9d8 <s_wdgs>
80006cea:	47b2                	lw	a5,12(sp)
80006cec:	078a                	slli	a5,a5,0x2
80006cee:	97ba                	add	a5,a5,a4
80006cf0:	439c                	lw	a5,0(a5)
80006cf2:	4b9c                	lw	a5,16(a5)
80006cf4:	8b89                	andi	a5,a5,2
80006cf6:	e789                	bnez	a5,80006d00 <get_frequency_for_wdg+0x24>
        freq_in_hz = get_frequency_for_ip_in_common_group(clock_node_ahb0);
80006cf8:	451d                	li	a0,7
80006cfa:	3d5d                	jal	80006bb0 <get_frequency_for_ip_in_common_group>
80006cfc:	ce2a                	sw	a0,28(sp)
80006cfe:	a019                	j	80006d04 <get_frequency_for_wdg+0x28>
    }
        /* PCLK is chosen */
    else {
        freq_in_hz = FREQ_32KHz;
80006d00:	67a1                	lui	a5,0x8
80006d02:	ce3e                	sw	a5,28(sp)
    }

    return freq_in_hz;
80006d04:	47f2                	lw	a5,28(sp)
}
80006d06:	853e                	mv	a0,a5
80006d08:	50b2                	lw	ra,44(sp)
80006d0a:	6145                	addi	sp,sp,48
80006d0c:	8082                	ret

80006d0e <get_frequency_for_pwdg>:

static uint32_t get_frequency_for_pwdg(void)
{
80006d0e:	1141                	addi	sp,sp,-16
    uint32_t freq_in_hz;
    if (WDG_CTRL_CLKSEL_GET(HPM_PWDG->CTRL) == 0) {
80006d10:	f40e87b7          	lui	a5,0xf40e8
80006d14:	4b9c                	lw	a5,16(a5)
80006d16:	8b89                	andi	a5,a5,2
80006d18:	e799                	bnez	a5,80006d26 <get_frequency_for_pwdg+0x18>
        freq_in_hz = FREQ_PRESET1_OSC0_CLK0;
80006d1a:	016e37b7          	lui	a5,0x16e3
80006d1e:	60078793          	addi	a5,a5,1536 # 16e3600 <__share_mem_end__+0x563600>
80006d22:	c63e                	sw	a5,12(sp)
80006d24:	a019                	j	80006d2a <get_frequency_for_pwdg+0x1c>
    } else {
        freq_in_hz = FREQ_32KHz;
80006d26:	67a1                	lui	a5,0x8
80006d28:	c63e                	sw	a5,12(sp)
    }

    return freq_in_hz;
80006d2a:	47b2                	lw	a5,12(sp)
}
80006d2c:	853e                	mv	a0,a5
80006d2e:	0141                	addi	sp,sp,16
80006d30:	8082                	ret

80006d32 <clock_set_source_divider>:
    }
    return status_success;
}

hpm_stat_t clock_set_source_divider(clock_name_t clock_name, clk_src_t src, uint32_t div)
{
80006d32:	7179                	addi	sp,sp,-48
80006d34:	d606                	sw	ra,44(sp)
80006d36:	c62a                	sw	a0,12(sp)
80006d38:	c42e                	sw	a1,8(sp)
80006d3a:	c232                	sw	a2,4(sp)
    hpm_stat_t status = status_success;
80006d3c:	ce02                	sw	zero,28(sp)
    uint32_t clk_src_type = GET_CLK_SRC_GROUP_FROM_NAME(clock_name);
80006d3e:	47b2                	lw	a5,12(sp)
80006d40:	83a1                	srli	a5,a5,0x8
80006d42:	0ff7f793          	zext.b	a5,a5
80006d46:	cc3e                	sw	a5,24(sp)
    uint32_t node_or_instance = GET_CLK_NODE_FROM_NAME(clock_name);
80006d48:	47b2                	lw	a5,12(sp)
80006d4a:	0ff7f793          	zext.b	a5,a5
80006d4e:	ca3e                	sw	a5,20(sp)
    switch (clk_src_type) {
80006d50:	4762                	lw	a4,24(sp)
80006d52:	47b1                	li	a5,12
80006d54:	10e7e563          	bltu	a5,a4,80006e5e <clock_set_source_divider+0x12c>
80006d58:	4762                	lw	a4,24(sp)
80006d5a:	47ad                	li	a5,11
80006d5c:	0af77963          	bgeu	a4,a5,80006e0e <clock_set_source_divider+0xdc>
80006d60:	4762                	lw	a4,24(sp)
80006d62:	47a9                	li	a5,10
80006d64:	0ef70863          	beq	a4,a5,80006e54 <clock_set_source_divider+0x122>
80006d68:	4762                	lw	a4,24(sp)
80006d6a:	47a9                	li	a5,10
80006d6c:	0ee7e963          	bltu	a5,a4,80006e5e <clock_set_source_divider+0x12c>
80006d70:	4762                	lw	a4,24(sp)
80006d72:	47a5                	li	a5,9
80006d74:	0cf70b63          	beq	a4,a5,80006e4a <clock_set_source_divider+0x118>
80006d78:	4762                	lw	a4,24(sp)
80006d7a:	47a5                	li	a5,9
80006d7c:	0ee7e163          	bltu	a5,a4,80006e5e <clock_set_source_divider+0x12c>
80006d80:	4762                	lw	a4,24(sp)
80006d82:	47a1                	li	a5,8
80006d84:	0af70e63          	beq	a4,a5,80006e40 <clock_set_source_divider+0x10e>
80006d88:	4762                	lw	a4,24(sp)
80006d8a:	47a1                	li	a5,8
80006d8c:	0ce7e963          	bltu	a5,a4,80006e5e <clock_set_source_divider+0x12c>
80006d90:	4762                	lw	a4,24(sp)
80006d92:	479d                	li	a5,7
80006d94:	0af70163          	beq	a4,a5,80006e36 <clock_set_source_divider+0x104>
80006d98:	4762                	lw	a4,24(sp)
80006d9a:	479d                	li	a5,7
80006d9c:	0ce7e163          	bltu	a5,a4,80006e5e <clock_set_source_divider+0x12c>
80006da0:	4762                	lw	a4,24(sp)
80006da2:	4799                	li	a5,6
80006da4:	08f70463          	beq	a4,a5,80006e2c <clock_set_source_divider+0xfa>
80006da8:	4762                	lw	a4,24(sp)
80006daa:	4799                	li	a5,6
80006dac:	0ae7e963          	bltu	a5,a4,80006e5e <clock_set_source_divider+0x12c>
80006db0:	4762                	lw	a4,24(sp)
80006db2:	4795                	li	a5,5
80006db4:	06f70763          	beq	a4,a5,80006e22 <clock_set_source_divider+0xf0>
80006db8:	4762                	lw	a4,24(sp)
80006dba:	4795                	li	a5,5
80006dbc:	0ae7e163          	bltu	a5,a4,80006e5e <clock_set_source_divider+0x12c>
80006dc0:	4762                	lw	a4,24(sp)
80006dc2:	4791                	li	a5,4
80006dc4:	04f70a63          	beq	a4,a5,80006e18 <clock_set_source_divider+0xe6>
80006dc8:	4762                	lw	a4,24(sp)
80006dca:	4791                	li	a5,4
80006dcc:	08e7e963          	bltu	a5,a4,80006e5e <clock_set_source_divider+0x12c>
80006dd0:	47e2                	lw	a5,24(sp)
80006dd2:	cb81                	beqz	a5,80006de2 <clock_set_source_divider+0xb0>
80006dd4:	47e2                	lw	a5,24(sp)
80006dd6:	fff78713          	addi	a4,a5,-1 # 7fff <HEAP_SIZE+0x3fff>
80006dda:	4789                	li	a5,2
80006ddc:	08e7e163          	bltu	a5,a4,80006e5e <clock_set_source_divider+0x12c>
80006de0:	a03d                	j	80006e0e <clock_set_source_divider+0xdc>
    case CLK_SRC_GROUP_COMMON:
        if ((div < 1U) || (div > 256U)) {
80006de2:	4792                	lw	a5,4(sp)
80006de4:	c791                	beqz	a5,80006df0 <clock_set_source_divider+0xbe>
80006de6:	4712                	lw	a4,4(sp)
80006de8:	10000793          	li	a5,256
80006dec:	00e7f763          	bgeu	a5,a4,80006dfa <clock_set_source_divider+0xc8>
            status = status_clk_div_invalid;
80006df0:	6795                	lui	a5,0x5
80006df2:	5f078793          	addi	a5,a5,1520 # 55f0 <HEAP_SIZE+0x15f0>
80006df6:	ce3e                	sw	a5,28(sp)
        } else {
            clock_source_t clk_src = GET_CLOCK_SOURCE_FROM_CLK_SRC(src);
            sysctl_config_clock(HPM_SYSCTL, (clock_node_t) node_or_instance, clk_src, div);
        }
        break;
80006df8:	a885                	j	80006e68 <clock_set_source_divider+0x136>
            clock_source_t clk_src = GET_CLOCK_SOURCE_FROM_CLK_SRC(src);
80006dfa:	47a2                	lw	a5,8(sp)
80006dfc:	8bbd                	andi	a5,a5,15
80006dfe:	c83e                	sw	a5,16(sp)
            sysctl_config_clock(HPM_SYSCTL, (clock_node_t) node_or_instance, clk_src, div);
80006e00:	4692                	lw	a3,4(sp)
80006e02:	4642                	lw	a2,16(sp)
80006e04:	45d2                	lw	a1,20(sp)
80006e06:	f4000537          	lui	a0,0xf4000
80006e0a:	3255                	jal	800067ae <sysctl_config_clock>
        break;
80006e0c:	a8b1                	j	80006e68 <clock_set_source_divider+0x136>
    case CLK_SRC_GROUP_ADC:
    case CLK_SRC_GROUP_I2S:
    case CLK_SRC_GROUP_WDG:
    case CLK_SRC_GROUP_PWDG:
    case CLK_SRC_GROUP_SRC:
        status = status_clk_operation_unsupported;
80006e0e:	6795                	lui	a5,0x5
80006e10:	5f378793          	addi	a5,a5,1523 # 55f3 <HEAP_SIZE+0x15f3>
80006e14:	ce3e                	sw	a5,28(sp)
        break;
80006e16:	a889                	j	80006e68 <clock_set_source_divider+0x136>
    case CLK_SRC_GROUP_PMIC:
        status = status_clk_fixed;
80006e18:	6795                	lui	a5,0x5
80006e1a:	5fa78793          	addi	a5,a5,1530 # 55fa <HEAP_SIZE+0x15fa>
80006e1e:	ce3e                	sw	a5,28(sp)
        break;
80006e20:	a0a1                	j	80006e68 <clock_set_source_divider+0x136>
    case CLK_SRC_GROUP_AHB:
        status = status_clk_shared_ahb;
80006e22:	6795                	lui	a5,0x5
80006e24:	5f478793          	addi	a5,a5,1524 # 55f4 <HEAP_SIZE+0x15f4>
80006e28:	ce3e                	sw	a5,28(sp)
        break;
80006e2a:	a83d                	j	80006e68 <clock_set_source_divider+0x136>
    case CLK_SRC_GROUP_AXI0:
        status = status_clk_shared_axi0;
80006e2c:	6795                	lui	a5,0x5
80006e2e:	5f578793          	addi	a5,a5,1525 # 55f5 <HEAP_SIZE+0x15f5>
80006e32:	ce3e                	sw	a5,28(sp)
        break;
80006e34:	a815                	j	80006e68 <clock_set_source_divider+0x136>
    case CLK_SRC_GROUP_AXI1:
        status = status_clk_shared_axi1;
80006e36:	6795                	lui	a5,0x5
80006e38:	5f678793          	addi	a5,a5,1526 # 55f6 <HEAP_SIZE+0x15f6>
80006e3c:	ce3e                	sw	a5,28(sp)
        break;
80006e3e:	a02d                	j	80006e68 <clock_set_source_divider+0x136>
    case CLK_SRC_GROUP_AXI2:
        status = status_clk_shared_axi2;
80006e40:	6795                	lui	a5,0x5
80006e42:	5f778793          	addi	a5,a5,1527 # 55f7 <HEAP_SIZE+0x15f7>
80006e46:	ce3e                	sw	a5,28(sp)
        break;
80006e48:	a005                	j	80006e68 <clock_set_source_divider+0x136>
    case CLK_SRC_GROUP_CPU0:
        status = status_clk_shared_cpu0;
80006e4a:	6795                	lui	a5,0x5
80006e4c:	5f878793          	addi	a5,a5,1528 # 55f8 <HEAP_SIZE+0x15f8>
80006e50:	ce3e                	sw	a5,28(sp)
        break;
80006e52:	a819                	j	80006e68 <clock_set_source_divider+0x136>
    case CLK_SRC_GROUP_CPU1:
        status = status_clk_shared_cpu1;
80006e54:	6795                	lui	a5,0x5
80006e56:	5f978793          	addi	a5,a5,1529 # 55f9 <HEAP_SIZE+0x15f9>
80006e5a:	ce3e                	sw	a5,28(sp)
        break;
80006e5c:	a031                	j	80006e68 <clock_set_source_divider+0x136>
    default:
        status = status_clk_src_invalid;
80006e5e:	6795                	lui	a5,0x5
80006e60:	5f178793          	addi	a5,a5,1521 # 55f1 <HEAP_SIZE+0x15f1>
80006e64:	ce3e                	sw	a5,28(sp)
        break;
80006e66:	0001                	nop
    }

    return status;
80006e68:	47f2                	lw	a5,28(sp)
}
80006e6a:	853e                	mv	a0,a5
80006e6c:	50b2                	lw	ra,44(sp)
80006e6e:	6145                	addi	sp,sp,48
80006e70:	8082                	ret

80006e72 <clock_add_to_group>:
{
    switch_ip_clock(clock_name, CLOCK_OFF);
}

void clock_add_to_group(clock_name_t clock_name, uint32_t group)
{
80006e72:	7179                	addi	sp,sp,-48
80006e74:	d606                	sw	ra,44(sp)
80006e76:	c62a                	sw	a0,12(sp)
80006e78:	c42e                	sw	a1,8(sp)
    uint32_t resource = GET_CLK_RESOURCE_FROM_NAME(clock_name);
80006e7a:	47b2                	lw	a5,12(sp)
80006e7c:	83c1                	srli	a5,a5,0x10
80006e7e:	ce3e                	sw	a5,28(sp)

    if (resource < sysctl_resource_end) {
80006e80:	4772                	lw	a4,28(sp)
80006e82:	15d00793          	li	a5,349
80006e86:	00e7eb63          	bltu	a5,a4,80006e9c <clock_add_to_group+0x2a>
        sysctl_enable_group_resource(HPM_SYSCTL, group, resource, true);
80006e8a:	47a2                	lw	a5,8(sp)
80006e8c:	0ff7f793          	zext.b	a5,a5
80006e90:	4685                	li	a3,1
80006e92:	4672                	lw	a2,28(sp)
80006e94:	85be                	mv	a1,a5
80006e96:	f4000537          	lui	a0,0xf4000
80006e9a:	3829                	jal	800066b4 <sysctl_enable_group_resource>
    }
}
80006e9c:	0001                	nop
80006e9e:	50b2                	lw	ra,44(sp)
80006ea0:	6145                	addi	sp,sp,48
80006ea2:	8082                	ret

80006ea4 <clock_connect_group_to_cpu>:

    return sysctl_check_group_resource_enable(HPM_SYSCTL, group, resource);
}

void clock_connect_group_to_cpu(uint32_t group, uint32_t cpu)
{
80006ea4:	1141                	addi	sp,sp,-16
80006ea6:	c62a                	sw	a0,12(sp)
80006ea8:	c42e                	sw	a1,8(sp)
    if (cpu < 2U) {
80006eaa:	4722                	lw	a4,8(sp)
80006eac:	4785                	li	a5,1
80006eae:	00e7ee63          	bltu	a5,a4,80006eca <clock_connect_group_to_cpu+0x26>
        HPM_SYSCTL->AFFILIATE[cpu].SET = (1UL << group);
80006eb2:	f40006b7          	lui	a3,0xf4000
80006eb6:	47b2                	lw	a5,12(sp)
80006eb8:	4705                	li	a4,1
80006eba:	00f71733          	sll	a4,a4,a5
80006ebe:	47a2                	lw	a5,8(sp)
80006ec0:	09078793          	addi	a5,a5,144
80006ec4:	0792                	slli	a5,a5,0x4
80006ec6:	97b6                	add	a5,a5,a3
80006ec8:	c3d8                	sw	a4,4(a5)
    }
}
80006eca:	0001                	nop
80006ecc:	0141                	addi	sp,sp,16
80006ece:	8082                	ret

80006ed0 <clock_get_core_clock_ticks_per_ms>:
    }
    return (hpm_core_clock + FREQ_1MHz - 1U) / FREQ_1MHz;
}

uint32_t clock_get_core_clock_ticks_per_ms(void)
{
80006ed0:	1141                	addi	sp,sp,-16
80006ed2:	c606                	sw	ra,12(sp)
    if (hpm_core_clock == 0U) {
80006ed4:	b041a783          	lw	a5,-1276(gp) # 1080304 <hpm_core_clock>
80006ed8:	e391                	bnez	a5,80006edc <clock_get_core_clock_ticks_per_ms+0xc>
        clock_update_core_clock();
80006eda:	2845                	jal	80006f8a <clock_update_core_clock>
    }
    return (hpm_core_clock + FREQ_1KHz - 1U) / FREQ_1KHz;
80006edc:	b041a783          	lw	a5,-1276(gp) # 1080304 <hpm_core_clock>
80006ee0:	3e778713          	addi	a4,a5,999
80006ee4:	106257b7          	lui	a5,0x10625
80006ee8:	dd378793          	addi	a5,a5,-557 # 10624dd3 <__share_mem_end__+0xf4a4dd3>
80006eec:	02f737b3          	mulhu	a5,a4,a5
80006ef0:	8399                	srli	a5,a5,0x6
}
80006ef2:	853e                	mv	a0,a5
80006ef4:	40b2                	lw	ra,12(sp)
80006ef6:	0141                	addi	sp,sp,16
80006ef8:	8082                	ret

80006efa <clock_cpu_delay_ms>:
    while (hpm_csr_get_core_cycle() < expected_ticks) {
    }
}

void clock_cpu_delay_ms(uint32_t ms)
{
80006efa:	715d                	addi	sp,sp,-80
80006efc:	c686                	sw	ra,76(sp)
80006efe:	c4a2                	sw	s0,72(sp)
80006f00:	c2a6                	sw	s1,68(sp)
80006f02:	c0ca                	sw	s2,64(sp)
80006f04:	de4e                	sw	s3,60(sp)
80006f06:	dc52                	sw	s4,56(sp)
80006f08:	da56                	sw	s5,52(sp)
80006f0a:	d85a                	sw	s6,48(sp)
80006f0c:	d65e                	sw	s7,44(sp)
80006f0e:	c62a                	sw	a0,12(sp)
    uint64_t expected_ticks = hpm_csr_get_core_cycle() + (uint64_t)clock_get_core_clock_ticks_per_ms() * (uint64_t)ms;
80006f10:	320d                	jal	80006832 <hpm_csr_get_core_cycle>
80006f12:	8b2a                	mv	s6,a0
80006f14:	8bae                	mv	s7,a1
80006f16:	3f6d                	jal	80006ed0 <clock_get_core_clock_ticks_per_ms>
80006f18:	87aa                	mv	a5,a0
80006f1a:	8a3e                	mv	s4,a5
80006f1c:	4a81                	li	s5,0
80006f1e:	47b2                	lw	a5,12(sp)
80006f20:	893e                	mv	s2,a5
80006f22:	4981                	li	s3,0
80006f24:	032a8733          	mul	a4,s5,s2
80006f28:	034987b3          	mul	a5,s3,s4
80006f2c:	97ba                	add	a5,a5,a4
80006f2e:	032a0733          	mul	a4,s4,s2
80006f32:	032a34b3          	mulhu	s1,s4,s2
80006f36:	843a                	mv	s0,a4
80006f38:	97a6                	add	a5,a5,s1
80006f3a:	84be                	mv	s1,a5
80006f3c:	008b0733          	add	a4,s6,s0
80006f40:	86ba                	mv	a3,a4
80006f42:	0166b6b3          	sltu	a3,a3,s6
80006f46:	009b87b3          	add	a5,s7,s1
80006f4a:	96be                	add	a3,a3,a5
80006f4c:	87b6                	mv	a5,a3
80006f4e:	cc3a                	sw	a4,24(sp)
80006f50:	ce3e                	sw	a5,28(sp)
    while (hpm_csr_get_core_cycle() < expected_ticks) {
80006f52:	0001                	nop
80006f54:	38f9                	jal	80006832 <hpm_csr_get_core_cycle>
80006f56:	872a                	mv	a4,a0
80006f58:	87ae                	mv	a5,a1
80006f5a:	46f2                	lw	a3,28(sp)
80006f5c:	863e                	mv	a2,a5
80006f5e:	fed66be3          	bltu	a2,a3,80006f54 <clock_cpu_delay_ms+0x5a>
80006f62:	46f2                	lw	a3,28(sp)
80006f64:	863e                	mv	a2,a5
80006f66:	00c69663          	bne	a3,a2,80006f72 <clock_cpu_delay_ms+0x78>
80006f6a:	46e2                	lw	a3,24(sp)
80006f6c:	87ba                	mv	a5,a4
80006f6e:	fed7e3e3          	bltu	a5,a3,80006f54 <clock_cpu_delay_ms+0x5a>
    }
}
80006f72:	0001                	nop
80006f74:	40b6                	lw	ra,76(sp)
80006f76:	4426                	lw	s0,72(sp)
80006f78:	4496                	lw	s1,68(sp)
80006f7a:	4906                	lw	s2,64(sp)
80006f7c:	59f2                	lw	s3,60(sp)
80006f7e:	5a62                	lw	s4,56(sp)
80006f80:	5ad2                	lw	s5,52(sp)
80006f82:	5b42                	lw	s6,48(sp)
80006f84:	5bb2                	lw	s7,44(sp)
80006f86:	6161                	addi	sp,sp,80
80006f88:	8082                	ret

80006f8a <clock_update_core_clock>:

void clock_update_core_clock(void)
{
80006f8a:	1101                	addi	sp,sp,-32
80006f8c:	ce06                	sw	ra,28(sp)
    uint32_t hart_id = read_csr(CSR_MHARTID);
80006f8e:	f14027f3          	csrr	a5,mhartid
80006f92:	c43e                	sw	a5,8(sp)
80006f94:	47a2                	lw	a5,8(sp)
80006f96:	c23e                	sw	a5,4(sp)
    clock_name_t cpu_clk_name = (hart_id == 1U) ? clock_cpu1 : clock_cpu0;
80006f98:	4712                	lw	a4,4(sp)
80006f9a:	4785                	li	a5,1
80006f9c:	00f71763          	bne	a4,a5,80006faa <clock_update_core_clock+0x20>
80006fa0:	000807b7          	lui	a5,0x80
80006fa4:	0789                	addi	a5,a5,2 # 80002 <__fast_ram_bss_end__+0x2>
80006fa6:	c63e                	sw	a5,12(sp)
80006fa8:	a011                	j	80006fac <clock_update_core_clock+0x22>
80006faa:	c602                	sw	zero,12(sp)
    hpm_core_clock = clock_get_frequency(cpu_clk_name);
80006fac:	4532                	lw	a0,12(sp)
80006fae:	32a5                	jal	80006916 <clock_get_frequency>
80006fb0:	872a                	mv	a4,a0
80006fb2:	b0e1a223          	sw	a4,-1276(gp) # 1080304 <hpm_core_clock>
80006fb6:	0001                	nop
80006fb8:	40f2                	lw	ra,28(sp)
80006fba:	6105                	addi	sp,sp,32
80006fbc:	8082                	ret

80006fbe <uart_modem_config>:
 *
 * @param [in] ptr UART base address
 * @param config Pointer to modem config struct
 */
static inline void uart_modem_config(UART_Type *ptr, uart_modem_config_t *config)
{
80006fbe:	1141                	addi	sp,sp,-16
80006fc0:	c62a                	sw	a0,12(sp)
80006fc2:	c42e                	sw	a1,8(sp)
    ptr->MCR = UART_MCR_AFE_SET(config->auto_flow_ctrl_en)
80006fc4:	47a2                	lw	a5,8(sp)
80006fc6:	0007c783          	lbu	a5,0(a5)
80006fca:	0796                	slli	a5,a5,0x5
80006fcc:	0207f713          	andi	a4,a5,32
        | UART_MCR_LOOP_SET(config->loop_back_en)
80006fd0:	47a2                	lw	a5,8(sp)
80006fd2:	0017c783          	lbu	a5,1(a5)
80006fd6:	0792                	slli	a5,a5,0x4
80006fd8:	8bc1                	andi	a5,a5,16
80006fda:	8f5d                	or	a4,a4,a5
        | UART_MCR_RTS_SET(!config->set_rts_high);
80006fdc:	47a2                	lw	a5,8(sp)
80006fde:	0027c783          	lbu	a5,2(a5)
80006fe2:	0017c793          	xori	a5,a5,1
80006fe6:	0ff7f793          	zext.b	a5,a5
80006fea:	0786                	slli	a5,a5,0x1
80006fec:	8b89                	andi	a5,a5,2
80006fee:	8f5d                	or	a4,a4,a5
    ptr->MCR = UART_MCR_AFE_SET(config->auto_flow_ctrl_en)
80006ff0:	47b2                	lw	a5,12(sp)
80006ff2:	db98                	sw	a4,48(a5)
}
80006ff4:	0001                	nop
80006ff6:	0141                	addi	sp,sp,16
80006ff8:	8082                	ret

80006ffa <uart_default_config>:
#endif

#define HPM_UART_BAUDRATE_SCALE (1000U)

void uart_default_config(UART_Type *ptr, uart_config_t *config)
{
80006ffa:	1141                	addi	sp,sp,-16
80006ffc:	c62a                	sw	a0,12(sp)
80006ffe:	c42e                	sw	a1,8(sp)
    (void) ptr;
    config->baudrate = 115200;
80007000:	47a2                	lw	a5,8(sp)
80007002:	6771                	lui	a4,0x1c
80007004:	20070713          	addi	a4,a4,512 # 1c200 <__fw_size__+0x11040>
80007008:	c3d8                	sw	a4,4(a5)
    config->word_length = word_length_8_bits;
8000700a:	47a2                	lw	a5,8(sp)
8000700c:	470d                	li	a4,3
8000700e:	00e784a3          	sb	a4,9(a5)
    config->parity = parity_none;
80007012:	47a2                	lw	a5,8(sp)
80007014:	00078523          	sb	zero,10(a5)
    config->num_of_stop_bits = stop_bits_1;
80007018:	47a2                	lw	a5,8(sp)
8000701a:	00078423          	sb	zero,8(a5)
    config->fifo_enable = true;
8000701e:	47a2                	lw	a5,8(sp)
80007020:	4705                	li	a4,1
80007022:	00e78723          	sb	a4,14(a5)
    config->rx_fifo_level = uart_rx_fifo_trg_not_empty;
80007026:	47a2                	lw	a5,8(sp)
80007028:	00078623          	sb	zero,12(a5)
    config->tx_fifo_level = uart_tx_fifo_trg_not_full;
8000702c:	47a2                	lw	a5,8(sp)
8000702e:	000785a3          	sb	zero,11(a5)
    config->dma_enable = false;
80007032:	47a2                	lw	a5,8(sp)
80007034:	000786a3          	sb	zero,13(a5)
    config->modem_config.auto_flow_ctrl_en = false;
80007038:	47a2                	lw	a5,8(sp)
8000703a:	000787a3          	sb	zero,15(a5)
    config->modem_config.loop_back_en = false;
8000703e:	47a2                	lw	a5,8(sp)
80007040:	00078823          	sb	zero,16(a5)
    config->modem_config.set_rts_high = false;
80007044:	47a2                	lw	a5,8(sp)
80007046:	000788a3          	sb	zero,17(a5)
#endif
#if defined(HPM_IP_FEATURE_UART_TXRX_POL) && (HPM_IP_FEATURE_UART_TXRX_POL == 1)
    config->tx_pin_level_invert = false;
    config->rx_pin_level_invert = false;
#endif
}
8000704a:	0001                	nop
8000704c:	0141                	addi	sp,sp,16
8000704e:	8082                	ret

80007050 <uart_calculate_baudrate>:

static bool uart_calculate_baudrate(uint32_t freq, uint32_t baudrate, uint16_t *div_out, uint8_t *osc_out)
{
80007050:	711d                	addi	sp,sp,-96
80007052:	ce86                	sw	ra,92(sp)
80007054:	cca2                	sw	s0,88(sp)
80007056:	caa6                	sw	s1,84(sp)
80007058:	c8ca                	sw	s2,80(sp)
8000705a:	c6ce                	sw	s3,76(sp)
8000705c:	c4d2                	sw	s4,72(sp)
8000705e:	c2d6                	sw	s5,68(sp)
80007060:	c0da                	sw	s6,64(sp)
80007062:	de5e                	sw	s7,60(sp)
80007064:	dc62                	sw	s8,56(sp)
80007066:	da66                	sw	s9,52(sp)
80007068:	c62a                	sw	a0,12(sp)
8000706a:	c42e                	sw	a1,8(sp)
8000706c:	c232                	sw	a2,4(sp)
8000706e:	c036                	sw	a3,0(sp)
    uint32_t div, osc, delta;
    uint64_t tmp;
    if ((div_out == NULL) || (!freq) || (!baudrate)
80007070:	4692                	lw	a3,4(sp)
80007072:	ca9d                	beqz	a3,800070a8 <uart_calculate_baudrate+0x58>
80007074:	46b2                	lw	a3,12(sp)
80007076:	ca8d                	beqz	a3,800070a8 <uart_calculate_baudrate+0x58>
80007078:	46a2                	lw	a3,8(sp)
8000707a:	c69d                	beqz	a3,800070a8 <uart_calculate_baudrate+0x58>
            || (baudrate < HPM_UART_MINIMUM_BAUDRATE)
8000707c:	4622                	lw	a2,8(sp)
8000707e:	0c700693          	li	a3,199
80007082:	02c6f363          	bgeu	a3,a2,800070a8 <uart_calculate_baudrate+0x58>
            || (freq / HPM_UART_BAUDRATE_DIV_MIN < baudrate * HPM_UART_OSC_MIN)
80007086:	46a2                	lw	a3,8(sp)
80007088:	068e                	slli	a3,a3,0x3
8000708a:	4632                	lw	a2,12(sp)
8000708c:	00d66e63          	bltu	a2,a3,800070a8 <uart_calculate_baudrate+0x58>
            || (freq / HPM_UART_BAUDRATE_DIV_MAX > (baudrate * HPM_UART_OSC_MAX))) {
80007090:	4632                	lw	a2,12(sp)
80007092:	800086b7          	lui	a3,0x80008
80007096:	0685                	addi	a3,a3,1 # 80008001 <pcfg_dcdc_switch_to_dcm_mode+0x25>
80007098:	02d636b3          	mulhu	a3,a2,a3
8000709c:	00f6d613          	srli	a2,a3,0xf
800070a0:	46a2                	lw	a3,8(sp)
800070a2:	0696                	slli	a3,a3,0x5
800070a4:	00c6f463          	bgeu	a3,a2,800070ac <uart_calculate_baudrate+0x5c>
        return 0;
800070a8:	4781                	li	a5,0
800070aa:	aa79                	j	80007248 <uart_calculate_baudrate+0x1f8>
    }

    tmp = ((uint64_t)freq * HPM_UART_BAUDRATE_SCALE) / baudrate;
800070ac:	46b2                	lw	a3,12(sp)
800070ae:	8736                	mv	a4,a3
800070b0:	4781                	li	a5,0
800070b2:	3e800693          	li	a3,1000
800070b6:	02d78633          	mul	a2,a5,a3
800070ba:	4681                	li	a3,0
800070bc:	02d706b3          	mul	a3,a4,a3
800070c0:	9636                	add	a2,a2,a3
800070c2:	3e800693          	li	a3,1000
800070c6:	02d705b3          	mul	a1,a4,a3
800070ca:	02d738b3          	mulhu	a7,a4,a3
800070ce:	882e                	mv	a6,a1
800070d0:	011607b3          	add	a5,a2,a7
800070d4:	88be                	mv	a7,a5
800070d6:	47a2                	lw	a5,8(sp)
800070d8:	833e                	mv	t1,a5
800070da:	4381                	li	t2,0
800070dc:	861a                	mv	a2,t1
800070de:	869e                	mv	a3,t2
800070e0:	8542                	mv	a0,a6
800070e2:	85c6                	mv	a1,a7
800070e4:	bb4fc0ef          	jal	80003498 <__udivdi3>
800070e8:	872a                	mv	a4,a0
800070ea:	87ae                	mv	a5,a1
800070ec:	d03a                	sw	a4,32(sp)
800070ee:	d23e                	sw	a5,36(sp)

    for (osc = HPM_UART_OSC_MIN; osc <= UART_SOC_OVERSAMPLE_MAX; osc += 2) {
800070f0:	47a1                	li	a5,8
800070f2:	d63e                	sw	a5,44(sp)
800070f4:	a2a1                	j	8000723c <uart_calculate_baudrate+0x1ec>
        /* osc range: HPM_UART_OSC_MIN - UART_SOC_OVERSAMPLE_MAX, even number */
        delta = 0;
800070f6:	d402                	sw	zero,40(sp)
        /* Calculate divider with rounding */
        div = (uint32_t)((tmp + osc * (HPM_UART_BAUDRATE_SCALE / 2)) / (osc * HPM_UART_BAUDRATE_SCALE));
800070f8:	5732                	lw	a4,44(sp)
800070fa:	1f400793          	li	a5,500
800070fe:	02f707b3          	mul	a5,a4,a5
80007102:	843e                	mv	s0,a5
80007104:	4481                	li	s1,0
80007106:	5602                	lw	a2,32(sp)
80007108:	5692                	lw	a3,36(sp)
8000710a:	00c40733          	add	a4,s0,a2
8000710e:	85ba                	mv	a1,a4
80007110:	0085b5b3          	sltu	a1,a1,s0
80007114:	00d487b3          	add	a5,s1,a3
80007118:	00f586b3          	add	a3,a1,a5
8000711c:	87b6                	mv	a5,a3
8000711e:	853a                	mv	a0,a4
80007120:	85be                	mv	a1,a5
80007122:	5732                	lw	a4,44(sp)
80007124:	3e800793          	li	a5,1000
80007128:	02f707b3          	mul	a5,a4,a5
8000712c:	8b3e                	mv	s6,a5
8000712e:	4b81                	li	s7,0
80007130:	865a                	mv	a2,s6
80007132:	86de                	mv	a3,s7
80007134:	b64fc0ef          	jal	80003498 <__udivdi3>
80007138:	872a                	mv	a4,a0
8000713a:	87ae                	mv	a5,a1
8000713c:	ce3a                	sw	a4,28(sp)
        if (div < HPM_UART_BAUDRATE_DIV_MIN || div > HPM_UART_BAUDRATE_DIV_MAX) {
8000713e:	47f2                	lw	a5,28(sp)
80007140:	cbe5                	beqz	a5,80007230 <uart_calculate_baudrate+0x1e0>
80007142:	4772                	lw	a4,28(sp)
80007144:	67c1                	lui	a5,0x10
80007146:	0ef77563          	bgeu	a4,a5,80007230 <uart_calculate_baudrate+0x1e0>
            /* invalid div */
            continue;
        }
        if ((div * osc * HPM_UART_BAUDRATE_SCALE) > tmp) {
8000714a:	4772                	lw	a4,28(sp)
8000714c:	57b2                	lw	a5,44(sp)
8000714e:	02f70733          	mul	a4,a4,a5
80007152:	3e800793          	li	a5,1000
80007156:	02f707b3          	mul	a5,a4,a5
8000715a:	893e                	mv	s2,a5
8000715c:	4981                	li	s3,0
8000715e:	5792                	lw	a5,36(sp)
80007160:	874e                	mv	a4,s3
80007162:	00e7ea63          	bltu	a5,a4,80007176 <uart_calculate_baudrate+0x126>
80007166:	5792                	lw	a5,36(sp)
80007168:	874e                	mv	a4,s3
8000716a:	02e79363          	bne	a5,a4,80007190 <uart_calculate_baudrate+0x140>
8000716e:	5782                	lw	a5,32(sp)
80007170:	874a                	mv	a4,s2
80007172:	00e7ff63          	bgeu	a5,a4,80007190 <uart_calculate_baudrate+0x140>
            delta = (uint32_t)((div * osc * HPM_UART_BAUDRATE_SCALE) - tmp);
80007176:	4772                	lw	a4,28(sp)
80007178:	57b2                	lw	a5,44(sp)
8000717a:	02f70733          	mul	a4,a4,a5
8000717e:	3e800793          	li	a5,1000
80007182:	02f70733          	mul	a4,a4,a5
80007186:	5782                	lw	a5,32(sp)
80007188:	40f707b3          	sub	a5,a4,a5
8000718c:	d43e                	sw	a5,40(sp)
8000718e:	a099                	j	800071d4 <uart_calculate_baudrate+0x184>
        } else if ((div * osc * HPM_UART_BAUDRATE_SCALE) < tmp) {
80007190:	4772                	lw	a4,28(sp)
80007192:	57b2                	lw	a5,44(sp)
80007194:	02f70733          	mul	a4,a4,a5
80007198:	3e800793          	li	a5,1000
8000719c:	02f707b3          	mul	a5,a4,a5
800071a0:	8a3e                	mv	s4,a5
800071a2:	4a81                	li	s5,0
800071a4:	5792                	lw	a5,36(sp)
800071a6:	8756                	mv	a4,s5
800071a8:	00f76a63          	bltu	a4,a5,800071bc <uart_calculate_baudrate+0x16c>
800071ac:	5792                	lw	a5,36(sp)
800071ae:	8756                	mv	a4,s5
800071b0:	02e79263          	bne	a5,a4,800071d4 <uart_calculate_baudrate+0x184>
800071b4:	5782                	lw	a5,32(sp)
800071b6:	8752                	mv	a4,s4
800071b8:	00f77e63          	bgeu	a4,a5,800071d4 <uart_calculate_baudrate+0x184>
            delta = (uint32_t)(tmp - (div * osc * HPM_UART_BAUDRATE_SCALE));
800071bc:	5702                	lw	a4,32(sp)
800071be:	46f2                	lw	a3,28(sp)
800071c0:	57b2                	lw	a5,44(sp)
800071c2:	02f686b3          	mul	a3,a3,a5
800071c6:	3e800793          	li	a5,1000
800071ca:	02f687b3          	mul	a5,a3,a5
800071ce:	40f707b3          	sub	a5,a4,a5
800071d2:	d43e                	sw	a5,40(sp)
        }
        if (delta && (((delta * 100) / tmp) > HPM_UART_BAUDRATE_TOLERANCE)) {
800071d4:	57a2                	lw	a5,40(sp)
800071d6:	c79d                	beqz	a5,80007204 <uart_calculate_baudrate+0x1b4>
800071d8:	5722                	lw	a4,40(sp)
800071da:	06400793          	li	a5,100
800071de:	02f707b3          	mul	a5,a4,a5
800071e2:	8c3e                	mv	s8,a5
800071e4:	4c81                	li	s9,0
800071e6:	5602                	lw	a2,32(sp)
800071e8:	5692                	lw	a3,36(sp)
800071ea:	8562                	mv	a0,s8
800071ec:	85e6                	mv	a1,s9
800071ee:	aaafc0ef          	jal	80003498 <__udivdi3>
800071f2:	872a                	mv	a4,a0
800071f4:	87ae                	mv	a5,a1
800071f6:	86be                	mv	a3,a5
800071f8:	ee95                	bnez	a3,80007234 <uart_calculate_baudrate+0x1e4>
800071fa:	86be                	mv	a3,a5
800071fc:	e681                	bnez	a3,80007204 <uart_calculate_baudrate+0x1b4>
800071fe:	478d                	li	a5,3
80007200:	02e7ea63          	bltu	a5,a4,80007234 <uart_calculate_baudrate+0x1e4>
            continue;
        } else {
            *div_out = div;
80007204:	47f2                	lw	a5,28(sp)
80007206:	01079713          	slli	a4,a5,0x10
8000720a:	8341                	srli	a4,a4,0x10
8000720c:	4792                	lw	a5,4(sp)
8000720e:	00e79023          	sh	a4,0(a5) # 10000 <__fw_size__+0x4e40>
            *osc_out = (osc == HPM_UART_OSC_MAX) ? 0 : osc; /* osc == 0 in bitfield, oversample rate is 32 */
80007212:	5732                	lw	a4,44(sp)
80007214:	02000793          	li	a5,32
80007218:	00f70663          	beq	a4,a5,80007224 <uart_calculate_baudrate+0x1d4>
8000721c:	57b2                	lw	a5,44(sp)
8000721e:	0ff7f793          	zext.b	a5,a5
80007222:	a011                	j	80007226 <uart_calculate_baudrate+0x1d6>
80007224:	4781                	li	a5,0
80007226:	4702                	lw	a4,0(sp)
80007228:	00f70023          	sb	a5,0(a4)
            return true;
8000722c:	4785                	li	a5,1
8000722e:	a829                	j	80007248 <uart_calculate_baudrate+0x1f8>
            continue;
80007230:	0001                	nop
80007232:	a011                	j	80007236 <uart_calculate_baudrate+0x1e6>
            continue;
80007234:	0001                	nop
    for (osc = HPM_UART_OSC_MIN; osc <= UART_SOC_OVERSAMPLE_MAX; osc += 2) {
80007236:	57b2                	lw	a5,44(sp)
80007238:	0789                	addi	a5,a5,2
8000723a:	d63e                	sw	a5,44(sp)
8000723c:	5732                	lw	a4,44(sp)
8000723e:	02000793          	li	a5,32
80007242:	eae7fae3          	bgeu	a5,a4,800070f6 <uart_calculate_baudrate+0xa6>
        }
    }
    return false;
80007246:	4781                	li	a5,0
}
80007248:	853e                	mv	a0,a5
8000724a:	40f6                	lw	ra,92(sp)
8000724c:	4466                	lw	s0,88(sp)
8000724e:	44d6                	lw	s1,84(sp)
80007250:	4946                	lw	s2,80(sp)
80007252:	49b6                	lw	s3,76(sp)
80007254:	4a26                	lw	s4,72(sp)
80007256:	4a96                	lw	s5,68(sp)
80007258:	4b06                	lw	s6,64(sp)
8000725a:	5bf2                	lw	s7,60(sp)
8000725c:	5c62                	lw	s8,56(sp)
8000725e:	5cd2                	lw	s9,52(sp)
80007260:	6125                	addi	sp,sp,96
80007262:	8082                	ret

80007264 <uart_init>:

hpm_stat_t uart_init(UART_Type *ptr, uart_config_t *config)
{
80007264:	7179                	addi	sp,sp,-48
80007266:	d606                	sw	ra,44(sp)
80007268:	c62a                	sw	a0,12(sp)
8000726a:	c42e                	sw	a1,8(sp)
    uint32_t tmp;
    uint8_t osc;
    uint16_t div;

    /* disable all interrupts */
    ptr->IER = 0;
8000726c:	47b2                	lw	a5,12(sp)
8000726e:	0207a223          	sw	zero,36(a5)
    /* Set DLAB to 1 */
    ptr->LCR |= UART_LCR_DLAB_MASK;
80007272:	47b2                	lw	a5,12(sp)
80007274:	57dc                	lw	a5,44(a5)
80007276:	0807e713          	ori	a4,a5,128
8000727a:	47b2                	lw	a5,12(sp)
8000727c:	d7d8                	sw	a4,44(a5)

    if (!uart_calculate_baudrate(config->src_freq_in_hz, config->baudrate, &div, &osc)) {
8000727e:	47a2                	lw	a5,8(sp)
80007280:	4398                	lw	a4,0(a5)
80007282:	47a2                	lw	a5,8(sp)
80007284:	43dc                	lw	a5,4(a5)
80007286:	01b10693          	addi	a3,sp,27
8000728a:	0830                	addi	a2,sp,24
8000728c:	85be                	mv	a1,a5
8000728e:	853a                	mv	a0,a4
80007290:	33c1                	jal	80007050 <uart_calculate_baudrate>
80007292:	87aa                	mv	a5,a0
80007294:	0017c793          	xori	a5,a5,1
80007298:	0ff7f793          	zext.b	a5,a5
8000729c:	c781                	beqz	a5,800072a4 <uart_init+0x40>
        return status_uart_no_suitable_baudrate_parameter_found;
8000729e:	3e900793          	li	a5,1001
800072a2:	a2b9                	j	800073f0 <uart_init+0x18c>
    }
    ptr->OSCR = (ptr->OSCR & ~UART_OSCR_OSC_MASK)
800072a4:	47b2                	lw	a5,12(sp)
800072a6:	4bdc                	lw	a5,20(a5)
800072a8:	fe07f713          	andi	a4,a5,-32
        | UART_OSCR_OSC_SET(osc);
800072ac:	01b14783          	lbu	a5,27(sp)
800072b0:	8bfd                	andi	a5,a5,31
800072b2:	8f5d                	or	a4,a4,a5
    ptr->OSCR = (ptr->OSCR & ~UART_OSCR_OSC_MASK)
800072b4:	47b2                	lw	a5,12(sp)
800072b6:	cbd8                	sw	a4,20(a5)
    ptr->DLL = UART_DLL_DLL_SET(div >> 0);
800072b8:	01815783          	lhu	a5,24(sp)
800072bc:	0ff7f713          	zext.b	a4,a5
800072c0:	47b2                	lw	a5,12(sp)
800072c2:	d398                	sw	a4,32(a5)
    ptr->DLM = UART_DLM_DLM_SET(div >> 8);
800072c4:	01815783          	lhu	a5,24(sp)
800072c8:	83a1                	srli	a5,a5,0x8
800072ca:	07c2                	slli	a5,a5,0x10
800072cc:	83c1                	srli	a5,a5,0x10
800072ce:	0ff7f713          	zext.b	a4,a5
800072d2:	47b2                	lw	a5,12(sp)
800072d4:	d3d8                	sw	a4,36(a5)

    /* DLAB bit needs to be cleared once baudrate is configured */
    tmp = ptr->LCR & (~UART_LCR_DLAB_MASK);
800072d6:	47b2                	lw	a5,12(sp)
800072d8:	57dc                	lw	a5,44(a5)
800072da:	f7f7f793          	andi	a5,a5,-129
800072de:	ce3e                	sw	a5,28(sp)

    tmp &= ~(UART_LCR_SPS_MASK | UART_LCR_EPS_MASK | UART_LCR_PEN_MASK);
800072e0:	47f2                	lw	a5,28(sp)
800072e2:	fc77f793          	andi	a5,a5,-57
800072e6:	ce3e                	sw	a5,28(sp)
    switch (config->parity) {
800072e8:	47a2                	lw	a5,8(sp)
800072ea:	00a7c783          	lbu	a5,10(a5)
800072ee:	4711                	li	a4,4
800072f0:	04e78463          	beq	a5,a4,80007338 <uart_init+0xd4>
800072f4:	4711                	li	a4,4
800072f6:	04f74663          	blt	a4,a5,80007342 <uart_init+0xde>
800072fa:	470d                	li	a4,3
800072fc:	02e78963          	beq	a5,a4,8000732e <uart_init+0xca>
80007300:	470d                	li	a4,3
80007302:	04f74063          	blt	a4,a5,80007342 <uart_init+0xde>
80007306:	4709                	li	a4,2
80007308:	00e78e63          	beq	a5,a4,80007324 <uart_init+0xc0>
8000730c:	4709                	li	a4,2
8000730e:	02f74a63          	blt	a4,a5,80007342 <uart_init+0xde>
80007312:	cb95                	beqz	a5,80007346 <uart_init+0xe2>
80007314:	4705                	li	a4,1
80007316:	02e79663          	bne	a5,a4,80007342 <uart_init+0xde>
    case parity_none:
        break;
    case parity_odd:
        tmp |= UART_LCR_PEN_MASK;
8000731a:	47f2                	lw	a5,28(sp)
8000731c:	0087e793          	ori	a5,a5,8
80007320:	ce3e                	sw	a5,28(sp)
        break;
80007322:	a01d                	j	80007348 <uart_init+0xe4>
    case parity_even:
        tmp |= UART_LCR_PEN_MASK | UART_LCR_EPS_MASK;
80007324:	47f2                	lw	a5,28(sp)
80007326:	0187e793          	ori	a5,a5,24
8000732a:	ce3e                	sw	a5,28(sp)
        break;
8000732c:	a831                	j	80007348 <uart_init+0xe4>
    case parity_always_1:
        tmp |= UART_LCR_PEN_MASK | UART_LCR_SPS_MASK;
8000732e:	47f2                	lw	a5,28(sp)
80007330:	0287e793          	ori	a5,a5,40
80007334:	ce3e                	sw	a5,28(sp)
        break;
80007336:	a809                	j	80007348 <uart_init+0xe4>
    case parity_always_0:
        tmp |= UART_LCR_EPS_MASK | UART_LCR_PEN_MASK
80007338:	47f2                	lw	a5,28(sp)
8000733a:	0387e793          	ori	a5,a5,56
8000733e:	ce3e                	sw	a5,28(sp)
            | UART_LCR_SPS_MASK;
        break;
80007340:	a021                	j	80007348 <uart_init+0xe4>
    default:
        /* invalid configuration */
        return status_invalid_argument;
80007342:	4789                	li	a5,2
80007344:	a075                	j	800073f0 <uart_init+0x18c>
        break;
80007346:	0001                	nop
    }

    tmp &= ~(UART_LCR_STB_MASK | UART_LCR_WLS_MASK);
80007348:	47f2                	lw	a5,28(sp)
8000734a:	9be1                	andi	a5,a5,-8
8000734c:	ce3e                	sw	a5,28(sp)
    switch (config->num_of_stop_bits) {
8000734e:	47a2                	lw	a5,8(sp)
80007350:	0087c783          	lbu	a5,8(a5)
80007354:	4709                	li	a4,2
80007356:	00e78e63          	beq	a5,a4,80007372 <uart_init+0x10e>
8000735a:	4709                	li	a4,2
8000735c:	02f74663          	blt	a4,a5,80007388 <uart_init+0x124>
80007360:	c795                	beqz	a5,8000738c <uart_init+0x128>
80007362:	4705                	li	a4,1
80007364:	02e79263          	bne	a5,a4,80007388 <uart_init+0x124>
    case stop_bits_1:
        break;
    case stop_bits_1_5:
        tmp |= UART_LCR_STB_MASK;
80007368:	47f2                	lw	a5,28(sp)
8000736a:	0047e793          	ori	a5,a5,4
8000736e:	ce3e                	sw	a5,28(sp)
        break;
80007370:	a839                	j	8000738e <uart_init+0x12a>
    case stop_bits_2:
        if (config->word_length < word_length_6_bits) {
80007372:	47a2                	lw	a5,8(sp)
80007374:	0097c783          	lbu	a5,9(a5)
80007378:	e399                	bnez	a5,8000737e <uart_init+0x11a>
            /* invalid configuration */
            return status_invalid_argument;
8000737a:	4789                	li	a5,2
8000737c:	a895                	j	800073f0 <uart_init+0x18c>
        }
        tmp |= UART_LCR_STB_MASK;
8000737e:	47f2                	lw	a5,28(sp)
80007380:	0047e793          	ori	a5,a5,4
80007384:	ce3e                	sw	a5,28(sp)
        break;
80007386:	a021                	j	8000738e <uart_init+0x12a>
    default:
        /* invalid configuration */
        return status_invalid_argument;
80007388:	4789                	li	a5,2
8000738a:	a09d                	j	800073f0 <uart_init+0x18c>
        break;
8000738c:	0001                	nop
    }

    ptr->LCR = tmp | UART_LCR_WLS_SET(config->word_length);
8000738e:	47a2                	lw	a5,8(sp)
80007390:	0097c783          	lbu	a5,9(a5)
80007394:	0037f713          	andi	a4,a5,3
80007398:	47f2                	lw	a5,28(sp)
8000739a:	8f5d                	or	a4,a4,a5
8000739c:	47b2                	lw	a5,12(sp)
8000739e:	d7d8                	sw	a4,44(a5)
#endif
        | UART_FCRR_DMAE_SET(config->dma_enable);

#else
    /* reset TX and RX fifo */
    ptr->FCR = UART_FCR_TFIFORST_MASK | UART_FCR_RFIFORST_MASK;
800073a0:	47b2                	lw	a5,12(sp)
800073a2:	4719                	li	a4,6
800073a4:	d798                	sw	a4,40(a5)
    /* Enable FIFO */
    tmp = UART_FCR_FIFOE_SET(config->fifo_enable)
800073a6:	47a2                	lw	a5,8(sp)
800073a8:	00e7c783          	lbu	a5,14(a5)
800073ac:	873e                	mv	a4,a5
        | UART_FCR_TFIFOT_SET(config->tx_fifo_level)
800073ae:	47a2                	lw	a5,8(sp)
800073b0:	00b7c783          	lbu	a5,11(a5)
800073b4:	0792                	slli	a5,a5,0x4
800073b6:	0307f793          	andi	a5,a5,48
800073ba:	8f5d                	or	a4,a4,a5
        | UART_FCR_RFIFOT_SET(config->rx_fifo_level)
800073bc:	47a2                	lw	a5,8(sp)
800073be:	00c7c783          	lbu	a5,12(a5)
800073c2:	079a                	slli	a5,a5,0x6
800073c4:	0ff7f793          	zext.b	a5,a5
800073c8:	8f5d                	or	a4,a4,a5
        | UART_FCR_DMAE_SET(config->dma_enable);
800073ca:	47a2                	lw	a5,8(sp)
800073cc:	00d7c783          	lbu	a5,13(a5)
800073d0:	078e                	slli	a5,a5,0x3
800073d2:	8ba1                	andi	a5,a5,8
    tmp = UART_FCR_FIFOE_SET(config->fifo_enable)
800073d4:	8fd9                	or	a5,a5,a4
800073d6:	ce3e                	sw	a5,28(sp)
    ptr->FCR = tmp;
800073d8:	47b2                	lw	a5,12(sp)
800073da:	4772                	lw	a4,28(sp)
800073dc:	d798                	sw	a4,40(a5)
    /* store FCR register value */
    ptr->GPR = tmp;
800073de:	47b2                	lw	a5,12(sp)
800073e0:	4772                	lw	a4,28(sp)
800073e2:	dfd8                	sw	a4,60(a5)
#endif

    uart_modem_config(ptr, &config->modem_config);
800073e4:	47a2                	lw	a5,8(sp)
800073e6:	07bd                	addi	a5,a5,15
800073e8:	85be                	mv	a1,a5
800073ea:	4532                	lw	a0,12(sp)
800073ec:	3ec9                	jal	80006fbe <uart_modem_config>

#if defined(HPM_IP_FEATURE_UART_TXRX_POL) && (HPM_IP_FEATURE_UART_TXRX_POL == 1)
    uart_set_rx_pin_level_invert(ptr, config->rx_pin_level_invert);
    uart_set_tx_pin_level_invert(ptr, config->tx_pin_level_invert);
#endif
    return status_success;
800073ee:	4781                	li	a5,0
}
800073f0:	853e                	mv	a0,a5
800073f2:	50b2                	lw	ra,44(sp)
800073f4:	6145                	addi	sp,sp,48
800073f6:	8082                	ret

800073f8 <uart_send_byte>:

    return status_success;
}

hpm_stat_t uart_send_byte(UART_Type *ptr, uint8_t c)
{
800073f8:	1101                	addi	sp,sp,-32
800073fa:	c62a                	sw	a0,12(sp)
800073fc:	87ae                	mv	a5,a1
800073fe:	00f105a3          	sb	a5,11(sp)
    uint32_t retry = 0;
80007402:	ce02                	sw	zero,28(sp)

    while (!(ptr->LSR & UART_LSR_THRE_MASK)) {
80007404:	a811                	j	80007418 <uart_send_byte+0x20>
        if (retry > HPM_UART_DRV_RETRY_COUNT) {
80007406:	4772                	lw	a4,28(sp)
80007408:	6785                	lui	a5,0x1
8000740a:	38878793          	addi	a5,a5,904 # 1388 <__ramfunc_end__+0xf50>
8000740e:	00e7eb63          	bltu	a5,a4,80007424 <uart_send_byte+0x2c>
            break;
        }
        retry++;
80007412:	47f2                	lw	a5,28(sp)
80007414:	0785                	addi	a5,a5,1
80007416:	ce3e                	sw	a5,28(sp)
    while (!(ptr->LSR & UART_LSR_THRE_MASK)) {
80007418:	47b2                	lw	a5,12(sp)
8000741a:	5bdc                	lw	a5,52(a5)
8000741c:	0207f793          	andi	a5,a5,32
80007420:	d3fd                	beqz	a5,80007406 <uart_send_byte+0xe>
80007422:	a011                	j	80007426 <uart_send_byte+0x2e>
            break;
80007424:	0001                	nop
    }

    if (retry > HPM_UART_DRV_RETRY_COUNT) {
80007426:	4772                	lw	a4,28(sp)
80007428:	6785                	lui	a5,0x1
8000742a:	38878793          	addi	a5,a5,904 # 1388 <__ramfunc_end__+0xf50>
8000742e:	00e7f463          	bgeu	a5,a4,80007436 <uart_send_byte+0x3e>
        return status_timeout;
80007432:	478d                	li	a5,3
80007434:	a031                	j	80007440 <uart_send_byte+0x48>
    }

    ptr->THR = UART_THR_THR_SET(c);
80007436:	00b14703          	lbu	a4,11(sp)
8000743a:	47b2                	lw	a5,12(sp)
8000743c:	d398                	sw	a4,32(a5)
    return status_success;
8000743e:	4781                	li	a5,0
}
80007440:	853e                	mv	a0,a5
80007442:	6105                	addi	sp,sp,32
80007444:	8082                	ret

80007446 <uart_flush>:

hpm_stat_t uart_flush(UART_Type *ptr)
{
80007446:	1101                	addi	sp,sp,-32
80007448:	c62a                	sw	a0,12(sp)
    uint32_t retry = 0;
8000744a:	ce02                	sw	zero,28(sp)

    while (!(ptr->LSR & UART_LSR_TEMT_MASK)) {
8000744c:	a811                	j	80007460 <uart_flush+0x1a>
        if (retry > HPM_UART_DRV_RETRY_COUNT) {
8000744e:	4772                	lw	a4,28(sp)
80007450:	6785                	lui	a5,0x1
80007452:	38878793          	addi	a5,a5,904 # 1388 <__ramfunc_end__+0xf50>
80007456:	00e7eb63          	bltu	a5,a4,8000746c <uart_flush+0x26>
            break;
        }
        retry++;
8000745a:	47f2                	lw	a5,28(sp)
8000745c:	0785                	addi	a5,a5,1
8000745e:	ce3e                	sw	a5,28(sp)
    while (!(ptr->LSR & UART_LSR_TEMT_MASK)) {
80007460:	47b2                	lw	a5,12(sp)
80007462:	5bdc                	lw	a5,52(a5)
80007464:	0407f793          	andi	a5,a5,64
80007468:	d3fd                	beqz	a5,8000744e <uart_flush+0x8>
8000746a:	a011                	j	8000746e <uart_flush+0x28>
            break;
8000746c:	0001                	nop
    }
    if (retry > HPM_UART_DRV_RETRY_COUNT) {
8000746e:	4772                	lw	a4,28(sp)
80007470:	6785                	lui	a5,0x1
80007472:	38878793          	addi	a5,a5,904 # 1388 <__ramfunc_end__+0xf50>
80007476:	00e7f463          	bgeu	a5,a4,8000747e <uart_flush+0x38>
        return status_timeout;
8000747a:	478d                	li	a5,3
8000747c:	a011                	j	80007480 <uart_flush+0x3a>
    }

    return status_success;
8000747e:	4781                	li	a5,0
}
80007480:	853e                	mv	a0,a5
80007482:	6105                	addi	sp,sp,32
80007484:	8082                	ret

80007486 <uart_receive_byte>:

hpm_stat_t uart_receive_byte(UART_Type *ptr, uint8_t *byte)
{
80007486:	1101                	addi	sp,sp,-32
80007488:	c62a                	sw	a0,12(sp)
8000748a:	c42e                	sw	a1,8(sp)
    uint32_t retry = 0;
8000748c:	ce02                	sw	zero,28(sp)

    while (!(ptr->LSR & UART_LSR_DR_MASK)) {
8000748e:	a811                	j	800074a2 <uart_receive_byte+0x1c>
        if (retry > HPM_UART_DRV_RETRY_COUNT) {
80007490:	4772                	lw	a4,28(sp)
80007492:	6785                	lui	a5,0x1
80007494:	38878793          	addi	a5,a5,904 # 1388 <__ramfunc_end__+0xf50>
80007498:	00e7ea63          	bltu	a5,a4,800074ac <uart_receive_byte+0x26>
            break;
        }
        retry++;
8000749c:	47f2                	lw	a5,28(sp)
8000749e:	0785                	addi	a5,a5,1
800074a0:	ce3e                	sw	a5,28(sp)
    while (!(ptr->LSR & UART_LSR_DR_MASK)) {
800074a2:	47b2                	lw	a5,12(sp)
800074a4:	5bdc                	lw	a5,52(a5)
800074a6:	8b85                	andi	a5,a5,1
800074a8:	d7e5                	beqz	a5,80007490 <uart_receive_byte+0xa>
800074aa:	a011                	j	800074ae <uart_receive_byte+0x28>
            break;
800074ac:	0001                	nop
    }

    if (retry > HPM_UART_DRV_RETRY_COUNT) {
800074ae:	4772                	lw	a4,28(sp)
800074b0:	6785                	lui	a5,0x1
800074b2:	38878793          	addi	a5,a5,904 # 1388 <__ramfunc_end__+0xf50>
800074b6:	00e7f463          	bgeu	a5,a4,800074be <uart_receive_byte+0x38>
        return status_timeout;
800074ba:	478d                	li	a5,3
800074bc:	a809                	j	800074ce <uart_receive_byte+0x48>
    }

    *byte = ptr->RBR & UART_RBR_RBR_MASK;
800074be:	47b2                	lw	a5,12(sp)
800074c0:	539c                	lw	a5,32(a5)
800074c2:	0ff7f713          	zext.b	a4,a5
800074c6:	47a2                	lw	a5,8(sp)
800074c8:	00e78023          	sb	a4,0(a5)
    return status_success;
800074cc:	4781                	li	a5,0
}
800074ce:	853e                	mv	a0,a5
800074d0:	6105                	addi	sp,sp,32
800074d2:	8082                	ret

800074d4 <read_pmp_cfg>:

#define PMP_ENTRY_MAX 16
#define PMA_ENTRY_MAX 16

uint32_t read_pmp_cfg(uint32_t idx)
{
800074d4:	7179                	addi	sp,sp,-48
800074d6:	c62a                	sw	a0,12(sp)
    uint32_t pmp_cfg = 0;
800074d8:	d602                	sw	zero,44(sp)
    switch (idx) {
800074da:	4732                	lw	a4,12(sp)
800074dc:	478d                	li	a5,3
800074de:	04f70763          	beq	a4,a5,8000752c <read_pmp_cfg+0x58>
800074e2:	4732                	lw	a4,12(sp)
800074e4:	478d                	li	a5,3
800074e6:	04e7e963          	bltu	a5,a4,80007538 <read_pmp_cfg+0x64>
800074ea:	4732                	lw	a4,12(sp)
800074ec:	4789                	li	a5,2
800074ee:	02f70963          	beq	a4,a5,80007520 <read_pmp_cfg+0x4c>
800074f2:	4732                	lw	a4,12(sp)
800074f4:	4789                	li	a5,2
800074f6:	04e7e163          	bltu	a5,a4,80007538 <read_pmp_cfg+0x64>
800074fa:	47b2                	lw	a5,12(sp)
800074fc:	c791                	beqz	a5,80007508 <read_pmp_cfg+0x34>
800074fe:	4732                	lw	a4,12(sp)
80007500:	4785                	li	a5,1
80007502:	00f70963          	beq	a4,a5,80007514 <read_pmp_cfg+0x40>
    case 3:
        pmp_cfg = read_csr(CSR_PMPCFG3);
        break;
    default:
        /* Do nothing */
        break;
80007506:	a80d                	j	80007538 <read_pmp_cfg+0x64>
        pmp_cfg = read_csr(CSR_PMPCFG0);
80007508:	3a0027f3          	csrr	a5,pmpcfg0
8000750c:	ce3e                	sw	a5,28(sp)
8000750e:	47f2                	lw	a5,28(sp)
80007510:	d63e                	sw	a5,44(sp)
        break;
80007512:	a025                	j	8000753a <read_pmp_cfg+0x66>
        pmp_cfg = read_csr(CSR_PMPCFG1);
80007514:	3a1027f3          	csrr	a5,pmpcfg1
80007518:	d03e                	sw	a5,32(sp)
8000751a:	5782                	lw	a5,32(sp)
8000751c:	d63e                	sw	a5,44(sp)
        break;
8000751e:	a831                	j	8000753a <read_pmp_cfg+0x66>
        pmp_cfg = read_csr(CSR_PMPCFG2);
80007520:	3a2027f3          	csrr	a5,pmpcfg2
80007524:	d23e                	sw	a5,36(sp)
80007526:	5792                	lw	a5,36(sp)
80007528:	d63e                	sw	a5,44(sp)
        break;
8000752a:	a801                	j	8000753a <read_pmp_cfg+0x66>
        pmp_cfg = read_csr(CSR_PMPCFG3);
8000752c:	3a3027f3          	csrr	a5,pmpcfg3
80007530:	d43e                	sw	a5,40(sp)
80007532:	57a2                	lw	a5,40(sp)
80007534:	d63e                	sw	a5,44(sp)
        break;
80007536:	a011                	j	8000753a <read_pmp_cfg+0x66>
        break;
80007538:	0001                	nop
    }
    return pmp_cfg;
8000753a:	57b2                	lw	a5,44(sp)
}
8000753c:	853e                	mv	a0,a5
8000753e:	6145                	addi	sp,sp,48
80007540:	8082                	ret

80007542 <write_pmp_cfg>:

void write_pmp_cfg(uint32_t value, uint32_t idx)
{
80007542:	1141                	addi	sp,sp,-16
80007544:	c62a                	sw	a0,12(sp)
80007546:	c42e                	sw	a1,8(sp)
    switch (idx) {
80007548:	4722                	lw	a4,8(sp)
8000754a:	478d                	li	a5,3
8000754c:	04f70163          	beq	a4,a5,8000758e <write_pmp_cfg+0x4c>
80007550:	4722                	lw	a4,8(sp)
80007552:	478d                	li	a5,3
80007554:	04e7e163          	bltu	a5,a4,80007596 <write_pmp_cfg+0x54>
80007558:	4722                	lw	a4,8(sp)
8000755a:	4789                	li	a5,2
8000755c:	02f70563          	beq	a4,a5,80007586 <write_pmp_cfg+0x44>
80007560:	4722                	lw	a4,8(sp)
80007562:	4789                	li	a5,2
80007564:	02e7e963          	bltu	a5,a4,80007596 <write_pmp_cfg+0x54>
80007568:	47a2                	lw	a5,8(sp)
8000756a:	c791                	beqz	a5,80007576 <write_pmp_cfg+0x34>
8000756c:	4722                	lw	a4,8(sp)
8000756e:	4785                	li	a5,1
80007570:	00f70763          	beq	a4,a5,8000757e <write_pmp_cfg+0x3c>
    case 3:
        write_csr(CSR_PMPCFG3, value);
        break;
    default:
        /* Do nothing */
        break;
80007574:	a00d                	j	80007596 <write_pmp_cfg+0x54>
        write_csr(CSR_PMPCFG0, value);
80007576:	47b2                	lw	a5,12(sp)
80007578:	3a079073          	csrw	pmpcfg0,a5
        break;
8000757c:	a831                	j	80007598 <write_pmp_cfg+0x56>
        write_csr(CSR_PMPCFG1, value);
8000757e:	47b2                	lw	a5,12(sp)
80007580:	3a179073          	csrw	pmpcfg1,a5
        break;
80007584:	a811                	j	80007598 <write_pmp_cfg+0x56>
        write_csr(CSR_PMPCFG2, value);
80007586:	47b2                	lw	a5,12(sp)
80007588:	3a279073          	csrw	pmpcfg2,a5
        break;
8000758c:	a031                	j	80007598 <write_pmp_cfg+0x56>
        write_csr(CSR_PMPCFG3, value);
8000758e:	47b2                	lw	a5,12(sp)
80007590:	3a379073          	csrw	pmpcfg3,a5
        break;
80007594:	a011                	j	80007598 <write_pmp_cfg+0x56>
        break;
80007596:	0001                	nop
    }
}
80007598:	0001                	nop
8000759a:	0141                	addi	sp,sp,16
8000759c:	8082                	ret

8000759e <write_pmp_addr>:

void write_pmp_addr(uint32_t value, uint32_t idx)
{
8000759e:	1141                	addi	sp,sp,-16
800075a0:	c62a                	sw	a0,12(sp)
800075a2:	c42e                	sw	a1,8(sp)
    switch (idx) {
800075a4:	4722                	lw	a4,8(sp)
800075a6:	47bd                	li	a5,15
800075a8:	16f70163          	beq	a4,a5,8000770a <write_pmp_addr+0x16c>
800075ac:	4722                	lw	a4,8(sp)
800075ae:	47bd                	li	a5,15
800075b0:	16e7e163          	bltu	a5,a4,80007712 <write_pmp_addr+0x174>
800075b4:	4722                	lw	a4,8(sp)
800075b6:	47b9                	li	a5,14
800075b8:	14f70563          	beq	a4,a5,80007702 <write_pmp_addr+0x164>
800075bc:	4722                	lw	a4,8(sp)
800075be:	47b9                	li	a5,14
800075c0:	14e7e963          	bltu	a5,a4,80007712 <write_pmp_addr+0x174>
800075c4:	4722                	lw	a4,8(sp)
800075c6:	47b5                	li	a5,13
800075c8:	12f70963          	beq	a4,a5,800076fa <write_pmp_addr+0x15c>
800075cc:	4722                	lw	a4,8(sp)
800075ce:	47b5                	li	a5,13
800075d0:	14e7e163          	bltu	a5,a4,80007712 <write_pmp_addr+0x174>
800075d4:	4722                	lw	a4,8(sp)
800075d6:	47b1                	li	a5,12
800075d8:	10f70d63          	beq	a4,a5,800076f2 <write_pmp_addr+0x154>
800075dc:	4722                	lw	a4,8(sp)
800075de:	47b1                	li	a5,12
800075e0:	12e7e963          	bltu	a5,a4,80007712 <write_pmp_addr+0x174>
800075e4:	4722                	lw	a4,8(sp)
800075e6:	47ad                	li	a5,11
800075e8:	10f70163          	beq	a4,a5,800076ea <write_pmp_addr+0x14c>
800075ec:	4722                	lw	a4,8(sp)
800075ee:	47ad                	li	a5,11
800075f0:	12e7e163          	bltu	a5,a4,80007712 <write_pmp_addr+0x174>
800075f4:	4722                	lw	a4,8(sp)
800075f6:	47a9                	li	a5,10
800075f8:	0ef70563          	beq	a4,a5,800076e2 <write_pmp_addr+0x144>
800075fc:	4722                	lw	a4,8(sp)
800075fe:	47a9                	li	a5,10
80007600:	10e7e963          	bltu	a5,a4,80007712 <write_pmp_addr+0x174>
80007604:	4722                	lw	a4,8(sp)
80007606:	47a5                	li	a5,9
80007608:	0cf70963          	beq	a4,a5,800076da <write_pmp_addr+0x13c>
8000760c:	4722                	lw	a4,8(sp)
8000760e:	47a5                	li	a5,9
80007610:	10e7e163          	bltu	a5,a4,80007712 <write_pmp_addr+0x174>
80007614:	4722                	lw	a4,8(sp)
80007616:	47a1                	li	a5,8
80007618:	0af70d63          	beq	a4,a5,800076d2 <write_pmp_addr+0x134>
8000761c:	4722                	lw	a4,8(sp)
8000761e:	47a1                	li	a5,8
80007620:	0ee7e963          	bltu	a5,a4,80007712 <write_pmp_addr+0x174>
80007624:	4722                	lw	a4,8(sp)
80007626:	479d                	li	a5,7
80007628:	0af70163          	beq	a4,a5,800076ca <write_pmp_addr+0x12c>
8000762c:	4722                	lw	a4,8(sp)
8000762e:	479d                	li	a5,7
80007630:	0ee7e163          	bltu	a5,a4,80007712 <write_pmp_addr+0x174>
80007634:	4722                	lw	a4,8(sp)
80007636:	4799                	li	a5,6
80007638:	08f70563          	beq	a4,a5,800076c2 <write_pmp_addr+0x124>
8000763c:	4722                	lw	a4,8(sp)
8000763e:	4799                	li	a5,6
80007640:	0ce7e963          	bltu	a5,a4,80007712 <write_pmp_addr+0x174>
80007644:	4722                	lw	a4,8(sp)
80007646:	4795                	li	a5,5
80007648:	06f70963          	beq	a4,a5,800076ba <write_pmp_addr+0x11c>
8000764c:	4722                	lw	a4,8(sp)
8000764e:	4795                	li	a5,5
80007650:	0ce7e163          	bltu	a5,a4,80007712 <write_pmp_addr+0x174>
80007654:	4722                	lw	a4,8(sp)
80007656:	4791                	li	a5,4
80007658:	04f70d63          	beq	a4,a5,800076b2 <write_pmp_addr+0x114>
8000765c:	4722                	lw	a4,8(sp)
8000765e:	4791                	li	a5,4
80007660:	0ae7e963          	bltu	a5,a4,80007712 <write_pmp_addr+0x174>
80007664:	4722                	lw	a4,8(sp)
80007666:	478d                	li	a5,3
80007668:	04f70163          	beq	a4,a5,800076aa <write_pmp_addr+0x10c>
8000766c:	4722                	lw	a4,8(sp)
8000766e:	478d                	li	a5,3
80007670:	0ae7e163          	bltu	a5,a4,80007712 <write_pmp_addr+0x174>
80007674:	4722                	lw	a4,8(sp)
80007676:	4789                	li	a5,2
80007678:	02f70563          	beq	a4,a5,800076a2 <write_pmp_addr+0x104>
8000767c:	4722                	lw	a4,8(sp)
8000767e:	4789                	li	a5,2
80007680:	08e7e963          	bltu	a5,a4,80007712 <write_pmp_addr+0x174>
80007684:	47a2                	lw	a5,8(sp)
80007686:	c791                	beqz	a5,80007692 <write_pmp_addr+0xf4>
80007688:	4722                	lw	a4,8(sp)
8000768a:	4785                	li	a5,1
8000768c:	00f70763          	beq	a4,a5,8000769a <write_pmp_addr+0xfc>
    case 15:
        write_csr(CSR_PMPADDR15, value);
        break;
    default:
        /* Do nothing */
        break;
80007690:	a049                	j	80007712 <write_pmp_addr+0x174>
        write_csr(CSR_PMPADDR0, value);
80007692:	47b2                	lw	a5,12(sp)
80007694:	3b079073          	csrw	pmpaddr0,a5
        break;
80007698:	a8b5                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR1, value);
8000769a:	47b2                	lw	a5,12(sp)
8000769c:	3b179073          	csrw	pmpaddr1,a5
        break;
800076a0:	a895                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR2, value);
800076a2:	47b2                	lw	a5,12(sp)
800076a4:	3b279073          	csrw	pmpaddr2,a5
        break;
800076a8:	a0b5                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR3, value);
800076aa:	47b2                	lw	a5,12(sp)
800076ac:	3b379073          	csrw	pmpaddr3,a5
        break;
800076b0:	a095                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR4, value);
800076b2:	47b2                	lw	a5,12(sp)
800076b4:	3b479073          	csrw	pmpaddr4,a5
        break;
800076b8:	a8b1                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR5, value);
800076ba:	47b2                	lw	a5,12(sp)
800076bc:	3b579073          	csrw	pmpaddr5,a5
        break;
800076c0:	a891                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR6, value);
800076c2:	47b2                	lw	a5,12(sp)
800076c4:	3b679073          	csrw	pmpaddr6,a5
        break;
800076c8:	a0b1                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR7, value);
800076ca:	47b2                	lw	a5,12(sp)
800076cc:	3b779073          	csrw	pmpaddr7,a5
        break;
800076d0:	a091                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR8, value);
800076d2:	47b2                	lw	a5,12(sp)
800076d4:	3b879073          	csrw	pmpaddr8,a5
        break;
800076d8:	a835                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR9, value);
800076da:	47b2                	lw	a5,12(sp)
800076dc:	3b979073          	csrw	pmpaddr9,a5
        break;
800076e0:	a815                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR10, value);
800076e2:	47b2                	lw	a5,12(sp)
800076e4:	3ba79073          	csrw	pmpaddr10,a5
        break;
800076e8:	a035                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR11, value);
800076ea:	47b2                	lw	a5,12(sp)
800076ec:	3bb79073          	csrw	pmpaddr11,a5
        break;
800076f0:	a015                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR12, value);
800076f2:	47b2                	lw	a5,12(sp)
800076f4:	3bc79073          	csrw	pmpaddr12,a5
        break;
800076f8:	a831                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR13, value);
800076fa:	47b2                	lw	a5,12(sp)
800076fc:	3bd79073          	csrw	pmpaddr13,a5
        break;
80007700:	a811                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR14, value);
80007702:	47b2                	lw	a5,12(sp)
80007704:	3be79073          	csrw	pmpaddr14,a5
        break;
80007708:	a031                	j	80007714 <write_pmp_addr+0x176>
        write_csr(CSR_PMPADDR15, value);
8000770a:	47b2                	lw	a5,12(sp)
8000770c:	3bf79073          	csrw	pmpaddr15,a5
        break;
80007710:	a011                	j	80007714 <write_pmp_addr+0x176>
        break;
80007712:	0001                	nop
    }
}
80007714:	0001                	nop
80007716:	0141                	addi	sp,sp,16
80007718:	8082                	ret

8000771a <read_pma_cfg>:
    return status_success;
}

#if (!defined(PMP_SUPPORT_PMA)) || (defined(PMP_SUPPORT_PMA) && (PMP_SUPPORT_PMA == 1))
uint32_t read_pma_cfg(uint32_t idx)
{
8000771a:	7179                	addi	sp,sp,-48
8000771c:	c62a                	sw	a0,12(sp)
    uint32_t pma_cfg = 0;
8000771e:	d602                	sw	zero,44(sp)
    switch (idx) {
80007720:	4732                	lw	a4,12(sp)
80007722:	478d                	li	a5,3
80007724:	04f70763          	beq	a4,a5,80007772 <read_pma_cfg+0x58>
80007728:	4732                	lw	a4,12(sp)
8000772a:	478d                	li	a5,3
8000772c:	04e7e963          	bltu	a5,a4,8000777e <read_pma_cfg+0x64>
80007730:	4732                	lw	a4,12(sp)
80007732:	4789                	li	a5,2
80007734:	02f70963          	beq	a4,a5,80007766 <read_pma_cfg+0x4c>
80007738:	4732                	lw	a4,12(sp)
8000773a:	4789                	li	a5,2
8000773c:	04e7e163          	bltu	a5,a4,8000777e <read_pma_cfg+0x64>
80007740:	47b2                	lw	a5,12(sp)
80007742:	c791                	beqz	a5,8000774e <read_pma_cfg+0x34>
80007744:	4732                	lw	a4,12(sp)
80007746:	4785                	li	a5,1
80007748:	00f70963          	beq	a4,a5,8000775a <read_pma_cfg+0x40>
    case 3:
        pma_cfg = read_csr(CSR_PMACFG3);
        break;
    default:
        /* Do nothing */
        break;
8000774c:	a80d                	j	8000777e <read_pma_cfg+0x64>
        pma_cfg = read_csr(CSR_PMACFG0);
8000774e:	bc0027f3          	csrr	a5,0xbc0
80007752:	ce3e                	sw	a5,28(sp)
80007754:	47f2                	lw	a5,28(sp)
80007756:	d63e                	sw	a5,44(sp)
        break;
80007758:	a025                	j	80007780 <read_pma_cfg+0x66>
        pma_cfg = read_csr(CSR_PMACFG1);
8000775a:	bc1027f3          	csrr	a5,0xbc1
8000775e:	d03e                	sw	a5,32(sp)
80007760:	5782                	lw	a5,32(sp)
80007762:	d63e                	sw	a5,44(sp)
        break;
80007764:	a831                	j	80007780 <read_pma_cfg+0x66>
        pma_cfg = read_csr(CSR_PMACFG2);
80007766:	bc2027f3          	csrr	a5,0xbc2
8000776a:	d23e                	sw	a5,36(sp)
8000776c:	5792                	lw	a5,36(sp)
8000776e:	d63e                	sw	a5,44(sp)
        break;
80007770:	a801                	j	80007780 <read_pma_cfg+0x66>
        pma_cfg = read_csr(CSR_PMACFG3);
80007772:	bc3027f3          	csrr	a5,0xbc3
80007776:	d43e                	sw	a5,40(sp)
80007778:	57a2                	lw	a5,40(sp)
8000777a:	d63e                	sw	a5,44(sp)
        break;
8000777c:	a011                	j	80007780 <read_pma_cfg+0x66>
        break;
8000777e:	0001                	nop
    }
    return pma_cfg;
80007780:	57b2                	lw	a5,44(sp)
}
80007782:	853e                	mv	a0,a5
80007784:	6145                	addi	sp,sp,48
80007786:	8082                	ret

80007788 <write_pma_cfg>:

void write_pma_cfg(uint32_t value, uint32_t idx)
{
80007788:	1141                	addi	sp,sp,-16
8000778a:	c62a                	sw	a0,12(sp)
8000778c:	c42e                	sw	a1,8(sp)
    switch (idx) {
8000778e:	4722                	lw	a4,8(sp)
80007790:	478d                	li	a5,3
80007792:	04f70163          	beq	a4,a5,800077d4 <write_pma_cfg+0x4c>
80007796:	4722                	lw	a4,8(sp)
80007798:	478d                	li	a5,3
8000779a:	04e7e163          	bltu	a5,a4,800077dc <write_pma_cfg+0x54>
8000779e:	4722                	lw	a4,8(sp)
800077a0:	4789                	li	a5,2
800077a2:	02f70563          	beq	a4,a5,800077cc <write_pma_cfg+0x44>
800077a6:	4722                	lw	a4,8(sp)
800077a8:	4789                	li	a5,2
800077aa:	02e7e963          	bltu	a5,a4,800077dc <write_pma_cfg+0x54>
800077ae:	47a2                	lw	a5,8(sp)
800077b0:	c791                	beqz	a5,800077bc <write_pma_cfg+0x34>
800077b2:	4722                	lw	a4,8(sp)
800077b4:	4785                	li	a5,1
800077b6:	00f70763          	beq	a4,a5,800077c4 <write_pma_cfg+0x3c>
    case 3:
        write_csr(CSR_PMACFG3, value);
        break;
    default:
        /* Do nothing */
        break;
800077ba:	a00d                	j	800077dc <write_pma_cfg+0x54>
        write_csr(CSR_PMACFG0, value);
800077bc:	47b2                	lw	a5,12(sp)
800077be:	bc079073          	csrw	0xbc0,a5
        break;
800077c2:	a831                	j	800077de <write_pma_cfg+0x56>
        write_csr(CSR_PMACFG1, value);
800077c4:	47b2                	lw	a5,12(sp)
800077c6:	bc179073          	csrw	0xbc1,a5
        break;
800077ca:	a811                	j	800077de <write_pma_cfg+0x56>
        write_csr(CSR_PMACFG2, value);
800077cc:	47b2                	lw	a5,12(sp)
800077ce:	bc279073          	csrw	0xbc2,a5
        break;
800077d2:	a031                	j	800077de <write_pma_cfg+0x56>
        write_csr(CSR_PMACFG3, value);
800077d4:	47b2                	lw	a5,12(sp)
800077d6:	bc379073          	csrw	0xbc3,a5
        break;
800077da:	a011                	j	800077de <write_pma_cfg+0x56>
        break;
800077dc:	0001                	nop
    }
}
800077de:	0001                	nop
800077e0:	0141                	addi	sp,sp,16
800077e2:	8082                	ret

800077e4 <write_pma_addr>:
void write_pma_addr(uint32_t value, uint32_t idx)
{
800077e4:	1141                	addi	sp,sp,-16
800077e6:	c62a                	sw	a0,12(sp)
800077e8:	c42e                	sw	a1,8(sp)
    switch (idx) {
800077ea:	4722                	lw	a4,8(sp)
800077ec:	47bd                	li	a5,15
800077ee:	16f70163          	beq	a4,a5,80007950 <write_pma_addr+0x16c>
800077f2:	4722                	lw	a4,8(sp)
800077f4:	47bd                	li	a5,15
800077f6:	16e7e163          	bltu	a5,a4,80007958 <write_pma_addr+0x174>
800077fa:	4722                	lw	a4,8(sp)
800077fc:	47b9                	li	a5,14
800077fe:	14f70563          	beq	a4,a5,80007948 <write_pma_addr+0x164>
80007802:	4722                	lw	a4,8(sp)
80007804:	47b9                	li	a5,14
80007806:	14e7e963          	bltu	a5,a4,80007958 <write_pma_addr+0x174>
8000780a:	4722                	lw	a4,8(sp)
8000780c:	47b5                	li	a5,13
8000780e:	12f70963          	beq	a4,a5,80007940 <write_pma_addr+0x15c>
80007812:	4722                	lw	a4,8(sp)
80007814:	47b5                	li	a5,13
80007816:	14e7e163          	bltu	a5,a4,80007958 <write_pma_addr+0x174>
8000781a:	4722                	lw	a4,8(sp)
8000781c:	47b1                	li	a5,12
8000781e:	10f70d63          	beq	a4,a5,80007938 <write_pma_addr+0x154>
80007822:	4722                	lw	a4,8(sp)
80007824:	47b1                	li	a5,12
80007826:	12e7e963          	bltu	a5,a4,80007958 <write_pma_addr+0x174>
8000782a:	4722                	lw	a4,8(sp)
8000782c:	47ad                	li	a5,11
8000782e:	10f70163          	beq	a4,a5,80007930 <write_pma_addr+0x14c>
80007832:	4722                	lw	a4,8(sp)
80007834:	47ad                	li	a5,11
80007836:	12e7e163          	bltu	a5,a4,80007958 <write_pma_addr+0x174>
8000783a:	4722                	lw	a4,8(sp)
8000783c:	47a9                	li	a5,10
8000783e:	0ef70563          	beq	a4,a5,80007928 <write_pma_addr+0x144>
80007842:	4722                	lw	a4,8(sp)
80007844:	47a9                	li	a5,10
80007846:	10e7e963          	bltu	a5,a4,80007958 <write_pma_addr+0x174>
8000784a:	4722                	lw	a4,8(sp)
8000784c:	47a5                	li	a5,9
8000784e:	0cf70963          	beq	a4,a5,80007920 <write_pma_addr+0x13c>
80007852:	4722                	lw	a4,8(sp)
80007854:	47a5                	li	a5,9
80007856:	10e7e163          	bltu	a5,a4,80007958 <write_pma_addr+0x174>
8000785a:	4722                	lw	a4,8(sp)
8000785c:	47a1                	li	a5,8
8000785e:	0af70d63          	beq	a4,a5,80007918 <write_pma_addr+0x134>
80007862:	4722                	lw	a4,8(sp)
80007864:	47a1                	li	a5,8
80007866:	0ee7e963          	bltu	a5,a4,80007958 <write_pma_addr+0x174>
8000786a:	4722                	lw	a4,8(sp)
8000786c:	479d                	li	a5,7
8000786e:	0af70163          	beq	a4,a5,80007910 <write_pma_addr+0x12c>
80007872:	4722                	lw	a4,8(sp)
80007874:	479d                	li	a5,7
80007876:	0ee7e163          	bltu	a5,a4,80007958 <write_pma_addr+0x174>
8000787a:	4722                	lw	a4,8(sp)
8000787c:	4799                	li	a5,6
8000787e:	08f70563          	beq	a4,a5,80007908 <write_pma_addr+0x124>
80007882:	4722                	lw	a4,8(sp)
80007884:	4799                	li	a5,6
80007886:	0ce7e963          	bltu	a5,a4,80007958 <write_pma_addr+0x174>
8000788a:	4722                	lw	a4,8(sp)
8000788c:	4795                	li	a5,5
8000788e:	06f70963          	beq	a4,a5,80007900 <write_pma_addr+0x11c>
80007892:	4722                	lw	a4,8(sp)
80007894:	4795                	li	a5,5
80007896:	0ce7e163          	bltu	a5,a4,80007958 <write_pma_addr+0x174>
8000789a:	4722                	lw	a4,8(sp)
8000789c:	4791                	li	a5,4
8000789e:	04f70d63          	beq	a4,a5,800078f8 <write_pma_addr+0x114>
800078a2:	4722                	lw	a4,8(sp)
800078a4:	4791                	li	a5,4
800078a6:	0ae7e963          	bltu	a5,a4,80007958 <write_pma_addr+0x174>
800078aa:	4722                	lw	a4,8(sp)
800078ac:	478d                	li	a5,3
800078ae:	04f70163          	beq	a4,a5,800078f0 <write_pma_addr+0x10c>
800078b2:	4722                	lw	a4,8(sp)
800078b4:	478d                	li	a5,3
800078b6:	0ae7e163          	bltu	a5,a4,80007958 <write_pma_addr+0x174>
800078ba:	4722                	lw	a4,8(sp)
800078bc:	4789                	li	a5,2
800078be:	02f70563          	beq	a4,a5,800078e8 <write_pma_addr+0x104>
800078c2:	4722                	lw	a4,8(sp)
800078c4:	4789                	li	a5,2
800078c6:	08e7e963          	bltu	a5,a4,80007958 <write_pma_addr+0x174>
800078ca:	47a2                	lw	a5,8(sp)
800078cc:	c791                	beqz	a5,800078d8 <write_pma_addr+0xf4>
800078ce:	4722                	lw	a4,8(sp)
800078d0:	4785                	li	a5,1
800078d2:	00f70763          	beq	a4,a5,800078e0 <write_pma_addr+0xfc>
    case 15:
        write_csr(CSR_PMAADDR15, value);
        break;
    default:
        /* Do nothing */
        break;
800078d6:	a049                	j	80007958 <write_pma_addr+0x174>
        write_csr(CSR_PMAADDR0, value);
800078d8:	47b2                	lw	a5,12(sp)
800078da:	bd079073          	csrw	0xbd0,a5
        break;
800078de:	a8b5                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR1, value);
800078e0:	47b2                	lw	a5,12(sp)
800078e2:	bd179073          	csrw	0xbd1,a5
        break;
800078e6:	a895                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR2, value);
800078e8:	47b2                	lw	a5,12(sp)
800078ea:	bd279073          	csrw	0xbd2,a5
        break;
800078ee:	a0b5                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR3, value);
800078f0:	47b2                	lw	a5,12(sp)
800078f2:	bd379073          	csrw	0xbd3,a5
        break;
800078f6:	a095                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR4, value);
800078f8:	47b2                	lw	a5,12(sp)
800078fa:	bd479073          	csrw	0xbd4,a5
        break;
800078fe:	a8b1                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR5, value);
80007900:	47b2                	lw	a5,12(sp)
80007902:	bd579073          	csrw	0xbd5,a5
        break;
80007906:	a891                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR6, value);
80007908:	47b2                	lw	a5,12(sp)
8000790a:	bd679073          	csrw	0xbd6,a5
        break;
8000790e:	a0b1                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR7, value);
80007910:	47b2                	lw	a5,12(sp)
80007912:	bd779073          	csrw	0xbd7,a5
        break;
80007916:	a091                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR8, value);
80007918:	47b2                	lw	a5,12(sp)
8000791a:	bd879073          	csrw	0xbd8,a5
        break;
8000791e:	a835                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR9, value);
80007920:	47b2                	lw	a5,12(sp)
80007922:	bd979073          	csrw	0xbd9,a5
        break;
80007926:	a815                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR10, value);
80007928:	47b2                	lw	a5,12(sp)
8000792a:	bda79073          	csrw	0xbda,a5
        break;
8000792e:	a035                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR11, value);
80007930:	47b2                	lw	a5,12(sp)
80007932:	bdb79073          	csrw	0xbdb,a5
        break;
80007936:	a015                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR12, value);
80007938:	47b2                	lw	a5,12(sp)
8000793a:	bdc79073          	csrw	0xbdc,a5
        break;
8000793e:	a831                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR13, value);
80007940:	47b2                	lw	a5,12(sp)
80007942:	bdd79073          	csrw	0xbdd,a5
        break;
80007946:	a811                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR14, value);
80007948:	47b2                	lw	a5,12(sp)
8000794a:	bde79073          	csrw	0xbde,a5
        break;
8000794e:	a031                	j	8000795a <write_pma_addr+0x176>
        write_csr(CSR_PMAADDR15, value);
80007950:	47b2                	lw	a5,12(sp)
80007952:	bdf79073          	csrw	0xbdf,a5
        break;
80007956:	a011                	j	8000795a <write_pma_addr+0x176>
        break;
80007958:	0001                	nop
    }
}
8000795a:	0001                	nop
8000795c:	0141                	addi	sp,sp,16
8000795e:	8082                	ret

80007960 <pmp_config>:

    return status;
}

hpm_stat_t pmp_config(const pmp_entry_t *entry, uint32_t num_of_entries)
{
80007960:	7139                	addi	sp,sp,-64
80007962:	de06                	sw	ra,60(sp)
80007964:	c62a                	sw	a0,12(sp)
80007966:	c42e                	sw	a1,8(sp)
    hpm_stat_t status = status_invalid_argument;
80007968:	4789                	li	a5,2
8000796a:	d63e                	sw	a5,44(sp)
    do {
        HPM_BREAK_IF((entry == NULL) || (num_of_entries < 1U) || (num_of_entries > PMP_ENTRY_MAX));
8000796c:	47b2                	lw	a5,12(sp)
8000796e:	0e078063          	beqz	a5,80007a4e <pmp_config+0xee>
80007972:	47a2                	lw	a5,8(sp)
80007974:	cfe9                	beqz	a5,80007a4e <pmp_config+0xee>
80007976:	4722                	lw	a4,8(sp)
80007978:	47c1                	li	a5,16
8000797a:	0ce7ea63          	bltu	a5,a4,80007a4e <pmp_config+0xee>

        status = status_success;
8000797e:	d602                	sw	zero,44(sp)
        for (uint32_t i = 0; i < num_of_entries; i++) {
80007980:	d402                	sw	zero,40(sp)
80007982:	a875                	j	80007a3e <pmp_config+0xde>
            uint32_t idx = i / 4;
80007984:	57a2                	lw	a5,40(sp)
80007986:	8389                	srli	a5,a5,0x2
80007988:	d23e                	sw	a5,36(sp)
            uint32_t offset = (i * 8) & 0x1F;
8000798a:	57a2                	lw	a5,40(sp)
8000798c:	078e                	slli	a5,a5,0x3
8000798e:	8be1                	andi	a5,a5,24
80007990:	d03e                	sw	a5,32(sp)
            uint32_t pmp_cfg = read_pmp_cfg(idx);
80007992:	5512                	lw	a0,36(sp)
80007994:	3681                	jal	800074d4 <read_pmp_cfg>
80007996:	ce2a                	sw	a0,28(sp)

            /* Check if the PMP entry is locked */
            uint32_t pmpi_cfg = (pmp_cfg & (0xFFUL << offset)) >> offset;
80007998:	5782                	lw	a5,32(sp)
8000799a:	0ff00713          	li	a4,255
8000799e:	00f71733          	sll	a4,a4,a5
800079a2:	47f2                	lw	a5,28(sp)
800079a4:	8f7d                	and	a4,a4,a5
800079a6:	5782                	lw	a5,32(sp)
800079a8:	00f757b3          	srl	a5,a4,a5
800079ac:	cc3e                	sw	a5,24(sp)
            if ((pmpi_cfg & PMP_REG_LOCK_MASK) != 0) {
800079ae:	47e2                	lw	a5,24(sp)
800079b0:	0807f793          	andi	a5,a5,128
800079b4:	c781                	beqz	a5,800079bc <pmp_config+0x5c>
                status = status_fail;
800079b6:	4785                	li	a5,1
800079b8:	d63e                	sw	a5,44(sp)
                break;
800079ba:	a071                	j	80007a46 <pmp_config+0xe6>
            }

            pmp_cfg &= ~(0xFFUL << offset);
800079bc:	5782                	lw	a5,32(sp)
800079be:	0ff00713          	li	a4,255
800079c2:	00f717b3          	sll	a5,a4,a5
800079c6:	fff7c793          	not	a5,a5
800079ca:	4772                	lw	a4,28(sp)
800079cc:	8ff9                	and	a5,a5,a4
800079ce:	ce3e                	sw	a5,28(sp)
            pmp_cfg |= ((uint32_t)entry->pmp_cfg.val) << offset;
800079d0:	47b2                	lw	a5,12(sp)
800079d2:	0007c783          	lbu	a5,0(a5)
800079d6:	873e                	mv	a4,a5
800079d8:	5782                	lw	a5,32(sp)
800079da:	00f717b3          	sll	a5,a4,a5
800079de:	4772                	lw	a4,28(sp)
800079e0:	8fd9                	or	a5,a5,a4
800079e2:	ce3e                	sw	a5,28(sp)
            write_pmp_addr(entry->pmp_addr, i);
800079e4:	47b2                	lw	a5,12(sp)
800079e6:	43dc                	lw	a5,4(a5)
800079e8:	55a2                	lw	a1,40(sp)
800079ea:	853e                	mv	a0,a5
800079ec:	3e4d                	jal	8000759e <write_pmp_addr>
            write_pmp_cfg(pmp_cfg, idx);
800079ee:	5592                	lw	a1,36(sp)
800079f0:	4572                	lw	a0,28(sp)
800079f2:	3e81                	jal	80007542 <write_pmp_cfg>
#if (!defined(PMP_SUPPORT_PMA)) || (defined(PMP_SUPPORT_PMA) && (PMP_SUPPORT_PMA == 1))
            uint32_t pma_cfg = read_pma_cfg(idx);
800079f4:	5512                	lw	a0,36(sp)
800079f6:	3315                	jal	8000771a <read_pma_cfg>
800079f8:	ca2a                	sw	a0,20(sp)
            pma_cfg &= ~(0xFFUL << offset);
800079fa:	5782                	lw	a5,32(sp)
800079fc:	0ff00713          	li	a4,255
80007a00:	00f717b3          	sll	a5,a4,a5
80007a04:	fff7c793          	not	a5,a5
80007a08:	4752                	lw	a4,20(sp)
80007a0a:	8ff9                	and	a5,a5,a4
80007a0c:	ca3e                	sw	a5,20(sp)
            pma_cfg |= ((uint32_t)entry->pma_cfg.val) << offset;
80007a0e:	47b2                	lw	a5,12(sp)
80007a10:	0087c783          	lbu	a5,8(a5)
80007a14:	873e                	mv	a4,a5
80007a16:	5782                	lw	a5,32(sp)
80007a18:	00f717b3          	sll	a5,a4,a5
80007a1c:	4752                	lw	a4,20(sp)
80007a1e:	8fd9                	or	a5,a5,a4
80007a20:	ca3e                	sw	a5,20(sp)
            write_pma_cfg(pma_cfg, idx);
80007a22:	5592                	lw	a1,36(sp)
80007a24:	4552                	lw	a0,20(sp)
80007a26:	338d                	jal	80007788 <write_pma_cfg>
            write_pma_addr(entry->pma_addr, i);
80007a28:	47b2                	lw	a5,12(sp)
80007a2a:	47dc                	lw	a5,12(a5)
80007a2c:	55a2                	lw	a1,40(sp)
80007a2e:	853e                	mv	a0,a5
80007a30:	3b55                	jal	800077e4 <write_pma_addr>
#endif
            ++entry;
80007a32:	47b2                	lw	a5,12(sp)
80007a34:	07c1                	addi	a5,a5,16
80007a36:	c63e                	sw	a5,12(sp)
        for (uint32_t i = 0; i < num_of_entries; i++) {
80007a38:	57a2                	lw	a5,40(sp)
80007a3a:	0785                	addi	a5,a5,1
80007a3c:	d43e                	sw	a5,40(sp)
80007a3e:	5722                	lw	a4,40(sp)
80007a40:	47a2                	lw	a5,8(sp)
80007a42:	f4f761e3          	bltu	a4,a5,80007984 <pmp_config+0x24>
        }

        /* Only call fencei if all entries were configured successfully */
        if (status == status_success) {
80007a46:	57b2                	lw	a5,44(sp)
80007a48:	e399                	bnez	a5,80007a4e <pmp_config+0xee>
            fencei();
80007a4a:	0000100f          	fence.i
        }

    } while (false);

    return status;
80007a4e:	57b2                	lw	a5,44(sp)
}
80007a50:	853e                	mv	a0,a5
80007a52:	50f2                	lw	ra,60(sp)
80007a54:	6121                	addi	sp,sp,64
80007a56:	8082                	ret

80007a58 <pllctl_pll_powerdown>:
{
80007a58:	1141                	addi	sp,sp,-16
80007a5a:	c62a                	sw	a0,12(sp)
80007a5c:	87ae                	mv	a5,a1
80007a5e:	00f105a3          	sb	a5,11(sp)
    if (pll > (PLLCTL_SOC_PLL_MAX_COUNT - 1)) {
80007a62:	00b14703          	lbu	a4,11(sp)
80007a66:	4791                	li	a5,4
80007a68:	00e7f463          	bgeu	a5,a4,80007a70 <pllctl_pll_powerdown+0x18>
        return status_invalid_argument;
80007a6c:	4789                	li	a5,2
80007a6e:	a805                	j	80007a9e <pllctl_pll_powerdown+0x46>
    ptr->PLL[pll].CFG1 = (ptr->PLL[pll].CFG1 &
80007a70:	00b14783          	lbu	a5,11(sp)
80007a74:	4732                	lw	a4,12(sp)
80007a76:	0785                	addi	a5,a5,1
80007a78:	079e                	slli	a5,a5,0x7
80007a7a:	97ba                	add	a5,a5,a4
80007a7c:	43d8                	lw	a4,4(a5)
            | PLLCTL_PLL_CFG1_PLLPD_SW_MASK;
80007a7e:	7a0007b7          	lui	a5,0x7a000
80007a82:	17fd                	addi	a5,a5,-1 # 79ffffff <__share_mem_end__+0x78e7ffff>
80007a84:	00f776b3          	and	a3,a4,a5
    ptr->PLL[pll].CFG1 = (ptr->PLL[pll].CFG1 &
80007a88:	00b14783          	lbu	a5,11(sp)
            | PLLCTL_PLL_CFG1_PLLPD_SW_MASK;
80007a8c:	02000737          	lui	a4,0x2000
80007a90:	8f55                	or	a4,a4,a3
    ptr->PLL[pll].CFG1 = (ptr->PLL[pll].CFG1 &
80007a92:	46b2                	lw	a3,12(sp)
80007a94:	0785                	addi	a5,a5,1
80007a96:	079e                	slli	a5,a5,0x7
80007a98:	97b6                	add	a5,a5,a3
80007a9a:	c3d8                	sw	a4,4(a5)
    return status_success;
80007a9c:	4781                	li	a5,0
}
80007a9e:	853e                	mv	a0,a5
80007aa0:	0141                	addi	sp,sp,16
80007aa2:	8082                	ret

80007aa4 <pllctl_pll_poweron>:
{
80007aa4:	1101                	addi	sp,sp,-32
80007aa6:	c62a                	sw	a0,12(sp)
80007aa8:	87ae                	mv	a5,a1
80007aaa:	00f105a3          	sb	a5,11(sp)
    if (pll > (PLLCTL_SOC_PLL_MAX_COUNT - 1)) {
80007aae:	00b14703          	lbu	a4,11(sp)
80007ab2:	4791                	li	a5,4
80007ab4:	00e7f463          	bgeu	a5,a4,80007abc <pllctl_pll_poweron+0x18>
        return status_invalid_argument;
80007ab8:	4789                	li	a5,2
80007aba:	a079                	j	80007b48 <pllctl_pll_poweron+0xa4>
    cfg = ptr->PLL[pll].CFG1;
80007abc:	00b14783          	lbu	a5,11(sp)
80007ac0:	4732                	lw	a4,12(sp)
80007ac2:	0785                	addi	a5,a5,1
80007ac4:	079e                	slli	a5,a5,0x7
80007ac6:	97ba                	add	a5,a5,a4
80007ac8:	43dc                	lw	a5,4(a5)
80007aca:	ce3e                	sw	a5,28(sp)
    if (!(cfg & PLLCTL_PLL_CFG1_PLLPD_SW_MASK)) {
80007acc:	4772                	lw	a4,28(sp)
80007ace:	020007b7          	lui	a5,0x2000
80007ad2:	8ff9                	and	a5,a5,a4
80007ad4:	e399                	bnez	a5,80007ada <pllctl_pll_poweron+0x36>
        return status_success;
80007ad6:	4781                	li	a5,0
80007ad8:	a885                	j	80007b48 <pllctl_pll_poweron+0xa4>
    if (cfg & PLLCTL_PLL_CFG1_PLLCTRL_HW_EN_MASK) {
80007ada:	47f2                	lw	a5,28(sp)
80007adc:	0207d263          	bgez	a5,80007b00 <pllctl_pll_poweron+0x5c>
        ptr->PLL[pll].CFG1 &= ~PLLCTL_PLL_CFG1_PLLCTRL_HW_EN_MASK;
80007ae0:	00b14783          	lbu	a5,11(sp)
80007ae4:	4732                	lw	a4,12(sp)
80007ae6:	0785                	addi	a5,a5,1 # 2000001 <__share_mem_end__+0xe80001>
80007ae8:	079e                	slli	a5,a5,0x7
80007aea:	97ba                	add	a5,a5,a4
80007aec:	43d8                	lw	a4,4(a5)
80007aee:	00b14783          	lbu	a5,11(sp)
80007af2:	0706                	slli	a4,a4,0x1
80007af4:	8305                	srli	a4,a4,0x1
80007af6:	46b2                	lw	a3,12(sp)
80007af8:	0785                	addi	a5,a5,1
80007afa:	079e                	slli	a5,a5,0x7
80007afc:	97b6                	add	a5,a5,a3
80007afe:	c3d8                	sw	a4,4(a5)
    ptr->PLL[pll].CFG1 &= ~PLLCTL_PLL_CFG1_PLLPD_SW_MASK;
80007b00:	00b14783          	lbu	a5,11(sp)
80007b04:	4732                	lw	a4,12(sp)
80007b06:	0785                	addi	a5,a5,1
80007b08:	079e                	slli	a5,a5,0x7
80007b0a:	97ba                	add	a5,a5,a4
80007b0c:	43d4                	lw	a3,4(a5)
80007b0e:	00b14783          	lbu	a5,11(sp)
80007b12:	fe000737          	lui	a4,0xfe000
80007b16:	177d                	addi	a4,a4,-1 # fdffffff <__fast_load_addr__+0x7dff1e3f>
80007b18:	8f75                	and	a4,a4,a3
80007b1a:	46b2                	lw	a3,12(sp)
80007b1c:	0785                	addi	a5,a5,1
80007b1e:	079e                	slli	a5,a5,0x7
80007b20:	97b6                	add	a5,a5,a3
80007b22:	c3d8                	sw	a4,4(a5)
    ptr->PLL[pll].CFG1 |= PLLCTL_PLL_CFG1_PLLCTRL_HW_EN_MASK;
80007b24:	00b14783          	lbu	a5,11(sp)
80007b28:	4732                	lw	a4,12(sp)
80007b2a:	0785                	addi	a5,a5,1
80007b2c:	079e                	slli	a5,a5,0x7
80007b2e:	97ba                	add	a5,a5,a4
80007b30:	43d4                	lw	a3,4(a5)
80007b32:	00b14783          	lbu	a5,11(sp)
80007b36:	80000737          	lui	a4,0x80000
80007b3a:	8f55                	or	a4,a4,a3
80007b3c:	46b2                	lw	a3,12(sp)
80007b3e:	0785                	addi	a5,a5,1
80007b40:	079e                	slli	a5,a5,0x7
80007b42:	97b6                	add	a5,a5,a3
80007b44:	c3d8                	sw	a4,4(a5)
    return status_success;
80007b46:	4781                	li	a5,0
}
80007b48:	853e                	mv	a0,a5
80007b4a:	6105                	addi	sp,sp,32
80007b4c:	8082                	ret

80007b4e <pllctl_pll_is_enabled>:
{
80007b4e:	1141                	addi	sp,sp,-16
80007b50:	c62a                	sw	a0,12(sp)
80007b52:	87ae                	mv	a5,a1
80007b54:	00f105a3          	sb	a5,11(sp)
    return (ptr->PLL[pll].STATUS & PLLCTL_PLL_STATUS_ENABLE_MASK);
80007b58:	00b14783          	lbu	a5,11(sp)
80007b5c:	4732                	lw	a4,12(sp)
80007b5e:	079e                	slli	a5,a5,0x7
80007b60:	97ba                	add	a5,a5,a4
80007b62:	0a07a703          	lw	a4,160(a5)
80007b66:	080007b7          	lui	a5,0x8000
80007b6a:	8ff9                	and	a5,a5,a4
80007b6c:	83ed                	srli	a5,a5,0x1b
80007b6e:	8b85                	andi	a5,a5,1
80007b70:	0ff7f793          	zext.b	a5,a5
}
80007b74:	853e                	mv	a0,a5
80007b76:	0141                	addi	sp,sp,16
80007b78:	8082                	ret

80007b7a <pllctl_pll_is_locked>:
 * @param [in] ptr Base address of the PLLCTL peripheral
 * @param [in] pll Index of the PLL to check
 * @return true if PLL is locked, false otherwise
 */
static inline bool pllctl_pll_is_locked(PLLCTL_Type *ptr, uint8_t pll)
{
80007b7a:	1141                	addi	sp,sp,-16
80007b7c:	c62a                	sw	a0,12(sp)
80007b7e:	87ae                	mv	a5,a1
80007b80:	00f105a3          	sb	a5,11(sp)
    return ((ptr->PLL[pll].STATUS & PLLCTL_PLL_STATUS_PLL_LOCK_COMB_MASK));
80007b84:	00b14783          	lbu	a5,11(sp)
80007b88:	4732                	lw	a4,12(sp)
80007b8a:	079e                	slli	a5,a5,0x7
80007b8c:	97ba                	add	a5,a5,a4
80007b8e:	0a07a783          	lw	a5,160(a5) # 80000a0 <__share_mem_end__+0x6e800a0>
80007b92:	8b89                	andi	a5,a5,2
80007b94:	8385                	srli	a5,a5,0x1
80007b96:	8b85                	andi	a5,a5,1
80007b98:	0ff7f793          	zext.b	a5,a5
}
80007b9c:	853e                	mv	a0,a5
80007b9e:	0141                	addi	sp,sp,16
80007ba0:	8082                	ret

80007ba2 <pllctl_init_int_pll_with_freq>:
    return status_success;
}

hpm_stat_t pllctl_init_int_pll_with_freq(PLLCTL_Type *ptr, uint8_t pll,
                                    uint32_t freq_in_hz)
{
80007ba2:	7179                	addi	sp,sp,-48
80007ba4:	d606                	sw	ra,44(sp)
80007ba6:	c62a                	sw	a0,12(sp)
80007ba8:	87ae                	mv	a5,a1
80007baa:	c232                	sw	a2,4(sp)
80007bac:	00f105a3          	sb	a5,11(sp)
    if ((ptr == NULL) || (pll >= PLLCTL_SOC_PLL_MAX_COUNT)) {
80007bb0:	47b2                	lw	a5,12(sp)
80007bb2:	c791                	beqz	a5,80007bbe <pllctl_init_int_pll_with_freq+0x1c>
80007bb4:	00b14703          	lbu	a4,11(sp)
80007bb8:	4791                	li	a5,4
80007bba:	00e7f463          	bgeu	a5,a4,80007bc2 <pllctl_init_int_pll_with_freq+0x20>
        return status_invalid_argument;
80007bbe:	4789                	li	a5,2
80007bc0:	ac25                	j	80007df8 <pllctl_init_int_pll_with_freq+0x256>
    }
    uint32_t freq, fbdiv, refdiv, postdiv;
    if ((freq_in_hz < PLLCTL_PLL_VCO_FREQ_MIN)
80007bc2:	4712                	lw	a4,4(sp)
80007bc4:	165a17b7          	lui	a5,0x165a1
80007bc8:	bbf78793          	addi	a5,a5,-1089 # 165a0bbf <__share_mem_end__+0x15420bbf>
80007bcc:	00e7f963          	bgeu	a5,a4,80007bde <pllctl_init_int_pll_with_freq+0x3c>
            || (freq_in_hz > PLLCTL_PLL_VCO_FREQ_MAX)) {
80007bd0:	4712                	lw	a4,4(sp)
80007bd2:	832157b7          	lui	a5,0x83215
80007bd6:	60078793          	addi	a5,a5,1536 # 83215600 <__fast_load_addr__+0x3207440>
80007bda:	00e7f463          	bgeu	a5,a4,80007be2 <pllctl_init_int_pll_with_freq+0x40>
        return status_invalid_argument;
80007bde:	4789                	li	a5,2
80007be0:	ac21                	j	80007df8 <pllctl_init_int_pll_with_freq+0x256>
    }

    freq = freq_in_hz;
80007be2:	4792                	lw	a5,4(sp)
80007be4:	ca3e                	sw	a5,20(sp)
    refdiv = PLLCTL_PLL_CFG0_REFDIV_GET(ptr->PLL[pll].CFG0);
80007be6:	00b14783          	lbu	a5,11(sp)
80007bea:	4732                	lw	a4,12(sp)
80007bec:	0785                	addi	a5,a5,1
80007bee:	079e                	slli	a5,a5,0x7
80007bf0:	97ba                	add	a5,a5,a4
80007bf2:	439c                	lw	a5,0(a5)
80007bf4:	83e1                	srli	a5,a5,0x18
80007bf6:	03f7f793          	andi	a5,a5,63
80007bfa:	cc3e                	sw	a5,24(sp)
    postdiv = PLLCTL_PLL_CFG0_POSTDIV1_GET(ptr->PLL[pll].CFG0);
80007bfc:	00b14783          	lbu	a5,11(sp)
80007c00:	4732                	lw	a4,12(sp)
80007c02:	0785                	addi	a5,a5,1
80007c04:	079e                	slli	a5,a5,0x7
80007c06:	97ba                	add	a5,a5,a4
80007c08:	439c                	lw	a5,0(a5)
80007c0a:	83d1                	srli	a5,a5,0x14
80007c0c:	8b9d                	andi	a5,a5,7
80007c0e:	c83e                	sw	a5,16(sp)
    fbdiv = freq / (PLLCTL_SOC_PLL_REFCLK_FREQ / (refdiv * postdiv));
80007c10:	4762                	lw	a4,24(sp)
80007c12:	47c2                	lw	a5,16(sp)
80007c14:	02f707b3          	mul	a5,a4,a5
80007c18:	016e3737          	lui	a4,0x16e3
80007c1c:	60070713          	addi	a4,a4,1536 # 16e3600 <__share_mem_end__+0x563600>
80007c20:	02f757b3          	divu	a5,a4,a5
80007c24:	4752                	lw	a4,20(sp)
80007c26:	02f757b3          	divu	a5,a4,a5
80007c2a:	ce3e                	sw	a5,28(sp)
    if (fbdiv > PLLCTL_INT_PLL_MAX_FBDIV) {
80007c2c:	4772                	lw	a4,28(sp)
80007c2e:	6785                	lui	a5,0x1
80007c30:	96078793          	addi	a5,a5,-1696 # 960 <__ramfunc_end__+0x528>
80007c34:	04e7f163          	bgeu	a5,a4,80007c76 <pllctl_init_int_pll_with_freq+0xd4>
        /* current refdiv can't be used for the given frequency */
        refdiv--;
80007c38:	47e2                	lw	a5,24(sp)
80007c3a:	17fd                	addi	a5,a5,-1
80007c3c:	cc3e                	sw	a5,24(sp)
        do {
            fbdiv = freq / (PLLCTL_SOC_PLL_REFCLK_FREQ / (refdiv * postdiv));
80007c3e:	4762                	lw	a4,24(sp)
80007c40:	47c2                	lw	a5,16(sp)
80007c42:	02f707b3          	mul	a5,a4,a5
80007c46:	016e3737          	lui	a4,0x16e3
80007c4a:	60070713          	addi	a4,a4,1536 # 16e3600 <__share_mem_end__+0x563600>
80007c4e:	02f757b3          	divu	a5,a4,a5
80007c52:	4752                	lw	a4,20(sp)
80007c54:	02f757b3          	divu	a5,a4,a5
80007c58:	ce3e                	sw	a5,28(sp)
            if (fbdiv > PLLCTL_INT_PLL_MAX_FBDIV) {
80007c5a:	4772                	lw	a4,28(sp)
80007c5c:	6785                	lui	a5,0x1
80007c5e:	96078793          	addi	a5,a5,-1696 # 960 <__ramfunc_end__+0x528>
80007c62:	04e7fc63          	bgeu	a5,a4,80007cba <pllctl_init_int_pll_with_freq+0x118>
                refdiv--;
80007c66:	47e2                	lw	a5,24(sp)
80007c68:	17fd                	addi	a5,a5,-1
80007c6a:	cc3e                	sw	a5,24(sp)
            } else {
                break;
            }
        } while (refdiv > PLLCTL_PLL_MIN_REFDIV);
80007c6c:	4762                	lw	a4,24(sp)
80007c6e:	4785                	li	a5,1
80007c70:	fce7e7e3          	bltu	a5,a4,80007c3e <pllctl_init_int_pll_with_freq+0x9c>
80007c74:	a0b1                	j	80007cc0 <pllctl_init_int_pll_with_freq+0x11e>
    } else if (fbdiv < PLLCTL_INT_PLL_MIN_FBDIV) {
80007c76:	4772                	lw	a4,28(sp)
80007c78:	47bd                	li	a5,15
80007c7a:	04e7e363          	bltu	a5,a4,80007cc0 <pllctl_init_int_pll_with_freq+0x11e>
        /* current refdiv can't be used for the given frequency */
        refdiv++;
80007c7e:	47e2                	lw	a5,24(sp)
80007c80:	0785                	addi	a5,a5,1
80007c82:	cc3e                	sw	a5,24(sp)
        do {
            fbdiv = freq / (PLLCTL_SOC_PLL_REFCLK_FREQ / (refdiv * postdiv));
80007c84:	4762                	lw	a4,24(sp)
80007c86:	47c2                	lw	a5,16(sp)
80007c88:	02f707b3          	mul	a5,a4,a5
80007c8c:	016e3737          	lui	a4,0x16e3
80007c90:	60070713          	addi	a4,a4,1536 # 16e3600 <__share_mem_end__+0x563600>
80007c94:	02f757b3          	divu	a5,a4,a5
80007c98:	4752                	lw	a4,20(sp)
80007c9a:	02f757b3          	divu	a5,a4,a5
80007c9e:	ce3e                	sw	a5,28(sp)
            if (fbdiv < PLLCTL_INT_PLL_MIN_FBDIV) {
80007ca0:	4772                	lw	a4,28(sp)
80007ca2:	47bd                	li	a5,15
80007ca4:	00e7ed63          	bltu	a5,a4,80007cbe <pllctl_init_int_pll_with_freq+0x11c>
                refdiv++;
80007ca8:	47e2                	lw	a5,24(sp)
80007caa:	0785                	addi	a5,a5,1
80007cac:	cc3e                	sw	a5,24(sp)
            } else {
                break;
            }
        } while (refdiv < PLLCTL_PLL_MAX_REFDIV);
80007cae:	4762                	lw	a4,24(sp)
80007cb0:	03e00793          	li	a5,62
80007cb4:	fce7f8e3          	bgeu	a5,a4,80007c84 <pllctl_init_int_pll_with_freq+0xe2>
80007cb8:	a021                	j	80007cc0 <pllctl_init_int_pll_with_freq+0x11e>
                break;
80007cba:	0001                	nop
80007cbc:	a011                	j	80007cc0 <pllctl_init_int_pll_with_freq+0x11e>
                break;
80007cbe:	0001                	nop
    }

    if ((refdiv > PLLCTL_PLL_MAX_REFDIV)
80007cc0:	4762                	lw	a4,24(sp)
80007cc2:	03f00793          	li	a5,63
80007cc6:	02e7eb63          	bltu	a5,a4,80007cfc <pllctl_init_int_pll_with_freq+0x15a>
            || (refdiv < PLLCTL_PLL_MIN_REFDIV)
80007cca:	47e2                	lw	a5,24(sp)
80007ccc:	cb85                	beqz	a5,80007cfc <pllctl_init_int_pll_with_freq+0x15a>
            || (fbdiv > PLLCTL_INT_PLL_MAX_FBDIV)
80007cce:	4772                	lw	a4,28(sp)
80007cd0:	6785                	lui	a5,0x1
80007cd2:	96078793          	addi	a5,a5,-1696 # 960 <__ramfunc_end__+0x528>
80007cd6:	02e7e363          	bltu	a5,a4,80007cfc <pllctl_init_int_pll_with_freq+0x15a>
            || (fbdiv < PLLCTL_INT_PLL_MIN_FBDIV)
80007cda:	4772                	lw	a4,28(sp)
80007cdc:	47bd                	li	a5,15
80007cde:	00e7ff63          	bgeu	a5,a4,80007cfc <pllctl_init_int_pll_with_freq+0x15a>
            || (((PLLCTL_SOC_PLL_REFCLK_FREQ / refdiv) < PLLCTL_INT_PLL_MIN_REF))) {
80007ce2:	016e37b7          	lui	a5,0x16e3
80007ce6:	60078713          	addi	a4,a5,1536 # 16e3600 <__share_mem_end__+0x563600>
80007cea:	47e2                	lw	a5,24(sp)
80007cec:	02f75733          	divu	a4,a4,a5
80007cf0:	000f47b7          	lui	a5,0xf4
80007cf4:	23f78793          	addi	a5,a5,575 # f423f <_stack+0x6c23f>
80007cf8:	00e7e663          	bltu	a5,a4,80007d04 <pllctl_init_int_pll_with_freq+0x162>
        return status_pllctl_out_of_range;
80007cfc:	6799                	lui	a5,0x6
80007cfe:	9da78793          	addi	a5,a5,-1574 # 59da <HEAP_SIZE+0x19da>
80007d02:	a8dd                	j	80007df8 <pllctl_init_int_pll_with_freq+0x256>
    }

    if (!(ptr->PLL[pll].CFG0 & PLLCTL_PLL_CFG0_DSMPD_MASK)) {
80007d04:	00b14783          	lbu	a5,11(sp)
80007d08:	4732                	lw	a4,12(sp)
80007d0a:	0785                	addi	a5,a5,1
80007d0c:	079e                	slli	a5,a5,0x7
80007d0e:	97ba                	add	a5,a5,a4
80007d10:	439c                	lw	a5,0(a5)
80007d12:	8ba1                	andi	a5,a5,8
80007d14:	e795                	bnez	a5,80007d40 <pllctl_init_int_pll_with_freq+0x19e>
        /* it was at frac mode, then it needs to be power down */
        pllctl_pll_powerdown(ptr, pll);
80007d16:	00b14783          	lbu	a5,11(sp)
80007d1a:	85be                	mv	a1,a5
80007d1c:	4532                	lw	a0,12(sp)
80007d1e:	3b2d                	jal	80007a58 <pllctl_pll_powerdown>
        ptr->PLL[pll].CFG0 |= PLLCTL_PLL_CFG0_DSMPD_MASK;
80007d20:	00b14783          	lbu	a5,11(sp)
80007d24:	4732                	lw	a4,12(sp)
80007d26:	0785                	addi	a5,a5,1
80007d28:	079e                	slli	a5,a5,0x7
80007d2a:	97ba                	add	a5,a5,a4
80007d2c:	4398                	lw	a4,0(a5)
80007d2e:	00b14783          	lbu	a5,11(sp)
80007d32:	00876713          	ori	a4,a4,8
80007d36:	46b2                	lw	a3,12(sp)
80007d38:	0785                	addi	a5,a5,1
80007d3a:	079e                	slli	a5,a5,0x7
80007d3c:	97b6                	add	a5,a5,a3
80007d3e:	c398                	sw	a4,0(a5)
    }

    if (PLLCTL_PLL_CFG0_REFDIV_GET(ptr->PLL[pll].CFG0) != refdiv) {
80007d40:	00b14783          	lbu	a5,11(sp)
80007d44:	4732                	lw	a4,12(sp)
80007d46:	0785                	addi	a5,a5,1
80007d48:	079e                	slli	a5,a5,0x7
80007d4a:	97ba                	add	a5,a5,a4
80007d4c:	439c                	lw	a5,0(a5)
80007d4e:	83e1                	srli	a5,a5,0x18
80007d50:	03f7f793          	andi	a5,a5,63
80007d54:	4762                	lw	a4,24(sp)
80007d56:	04f70163          	beq	a4,a5,80007d98 <pllctl_init_int_pll_with_freq+0x1f6>
        /* if refdiv is different, it needs to be power down */
        pllctl_pll_powerdown(ptr, pll);
80007d5a:	00b14783          	lbu	a5,11(sp)
80007d5e:	85be                	mv	a1,a5
80007d60:	4532                	lw	a0,12(sp)
80007d62:	39dd                	jal	80007a58 <pllctl_pll_powerdown>
        ptr->PLL[pll].CFG0 = (ptr->PLL[pll].CFG0 & ~PLLCTL_PLL_CFG0_REFDIV_MASK)
80007d64:	00b14783          	lbu	a5,11(sp)
80007d68:	4732                	lw	a4,12(sp)
80007d6a:	0785                	addi	a5,a5,1
80007d6c:	079e                	slli	a5,a5,0x7
80007d6e:	97ba                	add	a5,a5,a4
80007d70:	4398                	lw	a4,0(a5)
80007d72:	c10007b7          	lui	a5,0xc1000
80007d76:	17fd                	addi	a5,a5,-1 # c0ffffff <__fast_load_addr__+0x40ff1e3f>
80007d78:	00f776b3          	and	a3,a4,a5
            | PLLCTL_PLL_CFG0_REFDIV_SET(refdiv);
80007d7c:	47e2                	lw	a5,24(sp)
80007d7e:	01879713          	slli	a4,a5,0x18
80007d82:	3f0007b7          	lui	a5,0x3f000
80007d86:	8f7d                	and	a4,a4,a5
        ptr->PLL[pll].CFG0 = (ptr->PLL[pll].CFG0 & ~PLLCTL_PLL_CFG0_REFDIV_MASK)
80007d88:	00b14783          	lbu	a5,11(sp)
            | PLLCTL_PLL_CFG0_REFDIV_SET(refdiv);
80007d8c:	8f55                	or	a4,a4,a3
        ptr->PLL[pll].CFG0 = (ptr->PLL[pll].CFG0 & ~PLLCTL_PLL_CFG0_REFDIV_MASK)
80007d8e:	46b2                	lw	a3,12(sp)
80007d90:	0785                	addi	a5,a5,1 # 3f000001 <__share_mem_end__+0x3de80001>
80007d92:	079e                	slli	a5,a5,0x7
80007d94:	97b6                	add	a5,a5,a3
80007d96:	c398                	sw	a4,0(a5)
    }

    ptr->PLL[pll].CFG2 = (ptr->PLL[pll].CFG2 & ~(PLLCTL_PLL_CFG2_FBDIV_INT_MASK)) | PLLCTL_PLL_CFG2_FBDIV_INT_SET(fbdiv);
80007d98:	00b14783          	lbu	a5,11(sp)
80007d9c:	4732                	lw	a4,12(sp)
80007d9e:	0785                	addi	a5,a5,1
80007da0:	079e                	slli	a5,a5,0x7
80007da2:	97ba                	add	a5,a5,a4
80007da4:	4798                	lw	a4,8(a5)
80007da6:	77fd                	lui	a5,0xfffff
80007da8:	00f776b3          	and	a3,a4,a5
80007dac:	47f2                	lw	a5,28(sp)
80007dae:	07d2                	slli	a5,a5,0x14
80007db0:	0147d713          	srli	a4,a5,0x14
80007db4:	00b14783          	lbu	a5,11(sp)
80007db8:	8f55                	or	a4,a4,a3
80007dba:	46b2                	lw	a3,12(sp)
80007dbc:	0785                	addi	a5,a5,1 # fffff001 <__fast_load_addr__+0x7fff0e41>
80007dbe:	079e                	slli	a5,a5,0x7
80007dc0:	97b6                	add	a5,a5,a3
80007dc2:	c798                	sw	a4,8(a5)

    pllctl_pll_poweron(ptr, pll);
80007dc4:	00b14783          	lbu	a5,11(sp)
80007dc8:	85be                	mv	a1,a5
80007dca:	4532                	lw	a0,12(sp)
80007dcc:	39e1                	jal	80007aa4 <pllctl_pll_poweron>

    while (pllctl_pll_is_enabled(ptr, pll) && !pllctl_pll_is_locked(ptr, pll)) {
80007dce:	a011                	j	80007dd2 <pllctl_init_int_pll_with_freq+0x230>
        NOP();
80007dd0:	0001                	nop
    while (pllctl_pll_is_enabled(ptr, pll) && !pllctl_pll_is_locked(ptr, pll)) {
80007dd2:	00b14783          	lbu	a5,11(sp)
80007dd6:	85be                	mv	a1,a5
80007dd8:	4532                	lw	a0,12(sp)
80007dda:	3b95                	jal	80007b4e <pllctl_pll_is_enabled>
80007ddc:	87aa                	mv	a5,a0
80007dde:	cf81                	beqz	a5,80007df6 <pllctl_init_int_pll_with_freq+0x254>
80007de0:	00b14783          	lbu	a5,11(sp)
80007de4:	85be                	mv	a1,a5
80007de6:	4532                	lw	a0,12(sp)
80007de8:	3b49                	jal	80007b7a <pllctl_pll_is_locked>
80007dea:	87aa                	mv	a5,a0
80007dec:	0017c793          	xori	a5,a5,1
80007df0:	0ff7f793          	zext.b	a5,a5
80007df4:	fff1                	bnez	a5,80007dd0 <pllctl_init_int_pll_with_freq+0x22e>
    }
    return status_success;
80007df6:	4781                	li	a5,0
}
80007df8:	853e                	mv	a0,a5
80007dfa:	50b2                	lw	ra,44(sp)
80007dfc:	6145                	addi	sp,sp,48
80007dfe:	8082                	ret

80007e00 <pllctl_get_pll_freq_in_hz>:
    }
    return status_success;
}

uint32_t pllctl_get_pll_freq_in_hz(PLLCTL_Type *ptr, uint8_t pll)
{
80007e00:	715d                	addi	sp,sp,-80
80007e02:	c686                	sw	ra,76(sp)
80007e04:	c4a2                	sw	s0,72(sp)
80007e06:	c2a6                	sw	s1,68(sp)
80007e08:	c0ca                	sw	s2,64(sp)
80007e0a:	de4e                	sw	s3,60(sp)
80007e0c:	c62a                	sw	a0,12(sp)
80007e0e:	87ae                	mv	a5,a1
80007e10:	00f105a3          	sb	a5,11(sp)
    if ((ptr == NULL) || (pll >= PLLCTL_SOC_PLL_MAX_COUNT)) {
80007e14:	47b2                	lw	a5,12(sp)
80007e16:	c791                	beqz	a5,80007e22 <pllctl_get_pll_freq_in_hz+0x22>
80007e18:	00b14703          	lbu	a4,11(sp)
80007e1c:	4791                	li	a5,4
80007e1e:	00e7f463          	bgeu	a5,a4,80007e26 <pllctl_get_pll_freq_in_hz+0x26>
        return status_invalid_argument;
80007e22:	4789                	li	a5,2
80007e24:	aa15                	j	80007f58 <pllctl_get_pll_freq_in_hz+0x158>
    }
    uint32_t fbdiv, frac, refdiv, postdiv, refclk, freq;
    if (ptr->PLL[pll].CFG1 & PLLCTL_PLL_CFG1_PLLPD_SW_MASK) {
80007e26:	00b14783          	lbu	a5,11(sp)
80007e2a:	4732                	lw	a4,12(sp)
80007e2c:	0785                	addi	a5,a5,1
80007e2e:	079e                	slli	a5,a5,0x7
80007e30:	97ba                	add	a5,a5,a4
80007e32:	43d8                	lw	a4,4(a5)
80007e34:	020007b7          	lui	a5,0x2000
80007e38:	8ff9                	and	a5,a5,a4
80007e3a:	c399                	beqz	a5,80007e40 <pllctl_get_pll_freq_in_hz+0x40>
        /* pll is powered down */
        return 0;
80007e3c:	4781                	li	a5,0
80007e3e:	aa29                	j	80007f58 <pllctl_get_pll_freq_in_hz+0x158>
    }

    refdiv = PLLCTL_PLL_CFG0_REFDIV_GET(ptr->PLL[pll].CFG0);
80007e40:	00b14783          	lbu	a5,11(sp)
80007e44:	4732                	lw	a4,12(sp)
80007e46:	0785                	addi	a5,a5,1 # 2000001 <__share_mem_end__+0xe80001>
80007e48:	079e                	slli	a5,a5,0x7
80007e4a:	97ba                	add	a5,a5,a4
80007e4c:	439c                	lw	a5,0(a5)
80007e4e:	83e1                	srli	a5,a5,0x18
80007e50:	03f7f793          	andi	a5,a5,63
80007e54:	d43e                	sw	a5,40(sp)
    postdiv = PLLCTL_PLL_CFG0_POSTDIV1_GET(ptr->PLL[pll].CFG0);
80007e56:	00b14783          	lbu	a5,11(sp)
80007e5a:	4732                	lw	a4,12(sp)
80007e5c:	0785                	addi	a5,a5,1
80007e5e:	079e                	slli	a5,a5,0x7
80007e60:	97ba                	add	a5,a5,a4
80007e62:	439c                	lw	a5,0(a5)
80007e64:	83d1                	srli	a5,a5,0x14
80007e66:	8b9d                	andi	a5,a5,7
80007e68:	d23e                	sw	a5,36(sp)
    refclk = PLLCTL_SOC_PLL_REFCLK_FREQ / (refdiv * postdiv);
80007e6a:	5722                	lw	a4,40(sp)
80007e6c:	5792                	lw	a5,36(sp)
80007e6e:	02f707b3          	mul	a5,a4,a5
80007e72:	016e3737          	lui	a4,0x16e3
80007e76:	60070713          	addi	a4,a4,1536 # 16e3600 <__share_mem_end__+0x563600>
80007e7a:	02f757b3          	divu	a5,a4,a5
80007e7e:	d03e                	sw	a5,32(sp)

    if (ptr->PLL[pll].CFG0 & PLLCTL_PLL_CFG0_DSMPD_MASK) {
80007e80:	00b14783          	lbu	a5,11(sp)
80007e84:	4732                	lw	a4,12(sp)
80007e86:	0785                	addi	a5,a5,1
80007e88:	079e                	slli	a5,a5,0x7
80007e8a:	97ba                	add	a5,a5,a4
80007e8c:	439c                	lw	a5,0(a5)
80007e8e:	8ba1                	andi	a5,a5,8
80007e90:	c38d                	beqz	a5,80007eb2 <pllctl_get_pll_freq_in_hz+0xb2>
        /* pll int mode */
        fbdiv = PLLCTL_PLL_CFG2_FBDIV_INT_GET(ptr->PLL[pll].CFG2);
80007e92:	00b14783          	lbu	a5,11(sp)
80007e96:	4732                	lw	a4,12(sp)
80007e98:	0785                	addi	a5,a5,1
80007e9a:	079e                	slli	a5,a5,0x7
80007e9c:	97ba                	add	a5,a5,a4
80007e9e:	479c                	lw	a5,8(a5)
80007ea0:	07d2                	slli	a5,a5,0x14
80007ea2:	83d1                	srli	a5,a5,0x14
80007ea4:	ce3e                	sw	a5,28(sp)
        freq = refclk * fbdiv;
80007ea6:	5702                	lw	a4,32(sp)
80007ea8:	47f2                	lw	a5,28(sp)
80007eaa:	02f707b3          	mul	a5,a4,a5
80007eae:	d63e                	sw	a5,44(sp)
80007eb0:	a05d                	j	80007f56 <pllctl_get_pll_freq_in_hz+0x156>
    } else {
        /* pll frac mode */
        fbdiv = PLLCTL_PLL_FREQ_FBDIV_FRAC_GET(ptr->PLL[pll].FREQ);
80007eb2:	00b14783          	lbu	a5,11(sp)
80007eb6:	4732                	lw	a4,12(sp)
80007eb8:	0785                	addi	a5,a5,1
80007eba:	079e                	slli	a5,a5,0x7
80007ebc:	97ba                	add	a5,a5,a4
80007ebe:	47dc                	lw	a5,12(a5)
80007ec0:	0ff7f793          	zext.b	a5,a5
80007ec4:	ce3e                	sw	a5,28(sp)
        frac = PLLCTL_PLL_FREQ_FRAC_GET(ptr->PLL[pll].FREQ);
80007ec6:	00b14783          	lbu	a5,11(sp)
80007eca:	4732                	lw	a4,12(sp)
80007ecc:	0785                	addi	a5,a5,1
80007ece:	079e                	slli	a5,a5,0x7
80007ed0:	97ba                	add	a5,a5,a4
80007ed2:	47dc                	lw	a5,12(a5)
80007ed4:	83a1                	srli	a5,a5,0x8
80007ed6:	07a2                	slli	a5,a5,0x8
80007ed8:	83a1                	srli	a5,a5,0x8
80007eda:	cc3e                	sw	a5,24(sp)
        freq = (uint32_t)((refclk * (fbdiv + ((double) frac / (1 << 24)))) + (double) 0.5);
80007edc:	5502                	lw	a0,32(sp)
80007ede:	e13fc0ef          	jal	80004cf0 <__floatunsidf>
80007ee2:	842a                	mv	s0,a0
80007ee4:	84ae                	mv	s1,a1
80007ee6:	4572                	lw	a0,28(sp)
80007ee8:	e09fc0ef          	jal	80004cf0 <__floatunsidf>
80007eec:	892a                	mv	s2,a0
80007eee:	89ae                	mv	s3,a1
80007ef0:	4562                	lw	a0,24(sp)
80007ef2:	dfffc0ef          	jal	80004cf0 <__floatunsidf>
80007ef6:	872a                	mv	a4,a0
80007ef8:	87ae                	mv	a5,a1
80007efa:	8000e6b7          	lui	a3,0x8000e
80007efe:	8606a603          	lw	a2,-1952(a3) # 8000d860 <_lseek+0x528>
80007f02:	8646a683          	lw	a3,-1948(a3)
80007f06:	853a                	mv	a0,a4
80007f08:	85be                	mv	a1,a5
80007f0a:	e53fb0ef          	jal	80003d5c <__divdf3>
80007f0e:	872a                	mv	a4,a0
80007f10:	87ae                	mv	a5,a1
80007f12:	863a                	mv	a2,a4
80007f14:	86be                	mv	a3,a5
80007f16:	854a                	mv	a0,s2
80007f18:	85ce                	mv	a1,s3
80007f1a:	889fb0ef          	jal	800037a2 <__adddf3>
80007f1e:	872a                	mv	a4,a0
80007f20:	87ae                	mv	a5,a1
80007f22:	863a                	mv	a2,a4
80007f24:	86be                	mv	a3,a5
80007f26:	8522                	mv	a0,s0
80007f28:	85a6                	mv	a1,s1
80007f2a:	b6afc0ef          	jal	80004294 <__muldf3>
80007f2e:	872a                	mv	a4,a0
80007f30:	87ae                	mv	a5,a1
80007f32:	853a                	mv	a0,a4
80007f34:	85be                	mv	a1,a5
80007f36:	8000e7b7          	lui	a5,0x8000e
80007f3a:	8687a603          	lw	a2,-1944(a5) # 8000d868 <_lseek+0x530>
80007f3e:	86c7a683          	lw	a3,-1940(a5)
80007f42:	861fb0ef          	jal	800037a2 <__adddf3>
80007f46:	872a                	mv	a4,a0
80007f48:	87ae                	mv	a5,a1
80007f4a:	853a                	mv	a0,a4
80007f4c:	85be                	mv	a1,a5
80007f4e:	d45fc0ef          	jal	80004c92 <__fixunsdfsi>
80007f52:	87aa                	mv	a5,a0
80007f54:	d63e                	sw	a5,44(sp)
    }
    return freq;
80007f56:	57b2                	lw	a5,44(sp)
}
80007f58:	853e                	mv	a0,a5
80007f5a:	40b6                	lw	ra,76(sp)
80007f5c:	4426                	lw	s0,72(sp)
80007f5e:	4496                	lw	s1,68(sp)
80007f60:	4906                	lw	s2,64(sp)
80007f62:	59f2                	lw	s3,60(sp)
80007f64:	6161                	addi	sp,sp,80
80007f66:	8082                	ret

80007f68 <pcfg_dcdc_is_stable>:
 * @brief check if DCDC is stable or not
 * @param[in] ptr base address
 * @retval true if DCDC is stable
 */
static inline bool pcfg_dcdc_is_stable(PCFG_Type *ptr)
{
80007f68:	1141                	addi	sp,sp,-16
80007f6a:	c62a                	sw	a0,12(sp)
    return PCFG_DCDC_MODE_READY_GET(ptr->DCDC_MODE);
80007f6c:	47b2                	lw	a5,12(sp)
80007f6e:	4b9c                	lw	a5,16(a5)
80007f70:	83f1                	srli	a5,a5,0x1c
80007f72:	8b85                	andi	a5,a5,1
80007f74:	8b85                	andi	a5,a5,1
80007f76:	0ff7f793          	zext.b	a5,a5
}
80007f7a:	853e                	mv	a0,a5
80007f7c:	0141                	addi	sp,sp,16
80007f7e:	8082                	ret

80007f80 <pcfg_dcdc_set_voltage>:

    return PCFG_DCDC_CURRENT_LEVEL_GET(ptr->DCDC_CURRENT) * PCFG_CURRENT_MEASUREMENT_STEP;
}

hpm_stat_t pcfg_dcdc_set_voltage(PCFG_Type *ptr, uint16_t mv)
{
80007f80:	7179                	addi	sp,sp,-48
80007f82:	d606                	sw	ra,44(sp)
80007f84:	c62a                	sw	a0,12(sp)
80007f86:	87ae                	mv	a5,a1
80007f88:	00f11523          	sh	a5,10(sp)
    bool dcm_mode = ((ptr->DCDC_ADVMODE & PCFG_DCDC_ADVMODE_EN_DCM_MASK) != 0) ? true : false;
80007f8c:	47b2                	lw	a5,12(sp)
80007f8e:	539c                	lw	a5,32(a5)
80007f90:	8b85                	andi	a5,a5,1
80007f92:	8b85                	andi	a5,a5,1
80007f94:	00f10fa3          	sb	a5,31(sp)

    hpm_stat_t stat = status_success;
80007f98:	cc02                	sw	zero,24(sp)
    if ((mv < PCFG_SOC_DCDC_MIN_VOLTAGE_IN_MV) || (mv > PCFG_SOC_DCDC_MAX_VOLTAGE_IN_MV)) {
80007f9a:	00a15703          	lhu	a4,10(sp)
80007f9e:	25700793          	li	a5,599
80007fa2:	00e7f863          	bgeu	a5,a4,80007fb2 <pcfg_dcdc_set_voltage+0x32>
80007fa6:	00a15703          	lhu	a4,10(sp)
80007faa:	55f00793          	li	a5,1375
80007fae:	00e7f463          	bgeu	a5,a4,80007fb6 <pcfg_dcdc_set_voltage+0x36>
        return status_invalid_argument;
80007fb2:	4789                	li	a5,2
80007fb4:	a005                	j	80007fd4 <pcfg_dcdc_set_voltage+0x54>
    }

    if (dcm_mode) {
80007fb6:	01f14783          	lbu	a5,31(sp)
80007fba:	c799                	beqz	a5,80007fc8 <pcfg_dcdc_set_voltage+0x48>
        pcfg_dcdc_set_voltage_dcm_mode(ptr, mv);
80007fbc:	00a15783          	lhu	a5,10(sp)
80007fc0:	85be                	mv	a1,a5
80007fc2:	4532                	lw	a0,12(sp)
80007fc4:	2285                	jal	80008124 <pcfg_dcdc_set_voltage_dcm_mode>
80007fc6:	a031                	j	80007fd2 <pcfg_dcdc_set_voltage+0x52>
    } else {
        pcfg_dcdc_set_voltage_ccm_mode(ptr, mv);
80007fc8:	00a15783          	lhu	a5,10(sp)
80007fcc:	85be                	mv	a1,a5
80007fce:	4532                	lw	a0,12(sp)
80007fd0:	2a69                	jal	8000816a <pcfg_dcdc_set_voltage_ccm_mode>
    }

    return stat;
80007fd2:	47e2                	lw	a5,24(sp)
}
80007fd4:	853e                	mv	a0,a5
80007fd6:	50b2                	lw	ra,44(sp)
80007fd8:	6145                	addi	sp,sp,48
80007fda:	8082                	ret

80007fdc <pcfg_dcdc_switch_to_dcm_mode>:
    ptr->DCDC_LPMODE = (ptr->DCDC_LPMODE & ~PCFG_DCDC_LPMODE_STBY_VOLT_MASK) | PCFG_DCDC_LPMODE_STBY_VOLT_SET(mv);
    return stat;
}

void pcfg_dcdc_switch_to_dcm_mode(PCFG_Type *ptr)
{
80007fdc:	715d                	addi	sp,sp,-80
80007fde:	c686                	sw	ra,76(sp)
80007fe0:	c62a                	sw	a0,12(sp)
    const uint8_t pcfc_dcdc_min_duty_cycle[] = {
80007fe2:	8000e7b7          	lui	a5,0x8000e
80007fe6:	87078793          	addi	a5,a5,-1936 # 8000d870 <_lseek+0x538>
80007fea:	0007a883          	lw	a7,0(a5)
80007fee:	0047a803          	lw	a6,4(a5)
80007ff2:	4788                	lw	a0,8(a5)
80007ff4:	47cc                	lw	a1,12(a5)
80007ff6:	4b90                	lw	a2,16(a5)
80007ff8:	4bd4                	lw	a3,20(a5)
80007ffa:	4f98                	lw	a4,24(a5)
80007ffc:	ce46                	sw	a7,28(sp)
80007ffe:	d042                	sw	a6,32(sp)
80008000:	d22a                	sw	a0,36(sp)
80008002:	d42e                	sw	a1,40(sp)
80008004:	d632                	sw	a2,44(sp)
80008006:	d836                	sw	a3,48(sp)
80008008:	da3a                	sw	a4,52(sp)
8000800a:	4fdc                	lw	a5,28(a5)
8000800c:	dc3e                	sw	a5,56(sp)
        0x76, 0x78, 0x78, 0x78, 0x78, 0x7A, 0x7A, 0x7A,
        0x7A, 0x7C, 0x7C, 0x7C, 0x7E, 0x7E, 0x7E, 0x7E
    };
    uint16_t voltage;

    ptr->DCDC_MODE |= 0x77000u;
8000800e:	47b2                	lw	a5,12(sp)
80008010:	4b98                	lw	a4,16(a5)
80008012:	000777b7          	lui	a5,0x77
80008016:	8f5d                	or	a4,a4,a5
80008018:	47b2                	lw	a5,12(sp)
8000801a:	cb98                	sw	a4,16(a5)
    ptr->DCDC_ADVMODE = (ptr->DCDC_ADVMODE & ~0x73F0067u) | 0x4120067u;
8000801c:	47b2                	lw	a5,12(sp)
8000801e:	5398                	lw	a4,32(a5)
80008020:	f8c107b7          	lui	a5,0xf8c10
80008024:	f9878793          	addi	a5,a5,-104 # f8c0ff98 <__fast_load_addr__+0x78c01dd8>
80008028:	8f7d                	and	a4,a4,a5
8000802a:	041207b7          	lui	a5,0x4120
8000802e:	06778793          	addi	a5,a5,103 # 4120067 <__share_mem_end__+0x2fa0067>
80008032:	8f5d                	or	a4,a4,a5
80008034:	47b2                	lw	a5,12(sp)
80008036:	d398                	sw	a4,32(a5)
    ptr->DCDC_PROT &= ~PCFG_DCDC_PROT_SHORT_CURRENT_MASK;
80008038:	47b2                	lw	a5,12(sp)
8000803a:	4f9c                	lw	a5,24(a5)
8000803c:	fef7f713          	andi	a4,a5,-17
80008040:	47b2                	lw	a5,12(sp)
80008042:	cf98                	sw	a4,24(a5)
    ptr->DCDC_PROT |= PCFG_DCDC_PROT_DISABLE_SHORT_MASK;
80008044:	47b2                	lw	a5,12(sp)
80008046:	4f9c                	lw	a5,24(a5)
80008048:	0807e713          	ori	a4,a5,128
8000804c:	47b2                	lw	a5,12(sp)
8000804e:	cf98                	sw	a4,24(a5)
    ptr->DCDC_MISC = 0x100000u;
80008050:	47b2                	lw	a5,12(sp)
80008052:	00100737          	lui	a4,0x100
80008056:	d798                	sw	a4,40(a5)
    voltage = PCFG_DCDC_MODE_VOLT_GET(ptr->DCDC_MODE);
80008058:	47b2                	lw	a5,12(sp)
8000805a:	4b9c                	lw	a5,16(a5)
8000805c:	07c2                	slli	a5,a5,0x10
8000805e:	83c1                	srli	a5,a5,0x10
80008060:	07d2                	slli	a5,a5,0x14
80008062:	83d1                	srli	a5,a5,0x14
80008064:	02f11f23          	sh	a5,62(sp)
    voltage = (voltage - 600) / 25;
80008068:	03e15783          	lhu	a5,62(sp)
8000806c:	da878793          	addi	a5,a5,-600
80008070:	51eb8737          	lui	a4,0x51eb8
80008074:	51f70713          	addi	a4,a4,1311 # 51eb851f <__share_mem_end__+0x50d3851f>
80008078:	02e79733          	mulh	a4,a5,a4
8000807c:	870d                	srai	a4,a4,0x3
8000807e:	87fd                	srai	a5,a5,0x1f
80008080:	40f707b3          	sub	a5,a4,a5
80008084:	02f11f23          	sh	a5,62(sp)
    ptr->DCDC_ADVPARAM = (ptr->DCDC_ADVPARAM & ~PCFG_DCDC_ADVPARAM_MIN_DUT_MASK) | PCFG_DCDC_ADVPARAM_MIN_DUT_SET(pcfc_dcdc_min_duty_cycle[voltage]);
80008088:	47b2                	lw	a5,12(sp)
8000808a:	53d8                	lw	a4,36(a5)
8000808c:	77e1                	lui	a5,0xffff8
8000808e:	0ff78793          	addi	a5,a5,255 # ffff80ff <__fast_load_addr__+0x7ffe9f3f>
80008092:	8f7d                	and	a4,a4,a5
80008094:	03e15783          	lhu	a5,62(sp)
80008098:	0094                	addi	a3,sp,64
8000809a:	97b6                	add	a5,a5,a3
8000809c:	fdc7c783          	lbu	a5,-36(a5)
800080a0:	00879693          	slli	a3,a5,0x8
800080a4:	67a1                	lui	a5,0x8
800080a6:	f0078793          	addi	a5,a5,-256 # 7f00 <HEAP_SIZE+0x3f00>
800080aa:	8ff5                	and	a5,a5,a3
800080ac:	8f5d                	or	a4,a4,a5
800080ae:	47b2                	lw	a5,12(sp)
800080b0:	d3d8                	sw	a4,36(a5)
    while (!pcfg_dcdc_is_stable(ptr)) {
800080b2:	a011                	j	800080b6 <pcfg_dcdc_switch_to_dcm_mode+0xda>
        NOP();
800080b4:	0001                	nop
    while (!pcfg_dcdc_is_stable(ptr)) {
800080b6:	4532                	lw	a0,12(sp)
800080b8:	3d45                	jal	80007f68 <pcfg_dcdc_is_stable>
800080ba:	87aa                	mv	a5,a0
800080bc:	0017c793          	xori	a5,a5,1
800080c0:	0ff7f793          	zext.b	a5,a5
800080c4:	fbe5                	bnez	a5,800080b4 <pcfg_dcdc_switch_to_dcm_mode+0xd8>
    }
}
800080c6:	0001                	nop
800080c8:	0001                	nop
800080ca:	40b6                	lw	ra,76(sp)
800080cc:	6161                	addi	sp,sp,80
800080ce:	8082                	ret

800080d0 <pcfg_dcdc_switch_to_ccm_mode>:

void pcfg_dcdc_switch_to_ccm_mode(PCFG_Type *ptr)
{
800080d0:	1101                	addi	sp,sp,-32
800080d2:	ce06                	sw	ra,28(sp)
800080d4:	c62a                	sw	a0,12(sp)
    /* Attention: Need first switch to dcm */
    pcfg_dcdc_switch_to_dcm_mode(ptr);
800080d6:	4532                	lw	a0,12(sp)
800080d8:	3711                	jal	80007fdc <pcfg_dcdc_switch_to_dcm_mode>

    ptr->DCDC_MODE = (ptr->DCDC_MODE & ~0x77000u) | 0x11000u;
800080da:	47b2                	lw	a5,12(sp)
800080dc:	4b98                	lw	a4,16(a5)
800080de:	fff897b7          	lui	a5,0xfff89
800080e2:	17fd                	addi	a5,a5,-1 # fff88fff <__fast_load_addr__+0x7ff7ae3f>
800080e4:	8f7d                	and	a4,a4,a5
800080e6:	67c5                	lui	a5,0x11
800080e8:	8f5d                	or	a4,a4,a5
800080ea:	47b2                	lw	a5,12(sp)
800080ec:	cb98                	sw	a4,16(a5)
    ptr->DCDC_ADVPARAM = (ptr->DCDC_ADVPARAM & ~PCFG_DCDC_ADVPARAM_MIN_DUT_MASK) | PCFG_DCDC_ADVPARAM_MIN_DUT_SET(0x6A);
800080ee:	47b2                	lw	a5,12(sp)
800080f0:	53d8                	lw	a4,36(a5)
800080f2:	77e1                	lui	a5,0xffff8
800080f4:	0ff78793          	addi	a5,a5,255 # ffff80ff <__fast_load_addr__+0x7ffe9f3f>
800080f8:	8f7d                	and	a4,a4,a5
800080fa:	679d                	lui	a5,0x7
800080fc:	a0078793          	addi	a5,a5,-1536 # 6a00 <HEAP_SIZE+0x2a00>
80008100:	8f5d                	or	a4,a4,a5
80008102:	47b2                	lw	a5,12(sp)
80008104:	d3d8                	sw	a4,36(a5)
    while (!pcfg_dcdc_is_stable(ptr)) {
80008106:	a011                	j	8000810a <pcfg_dcdc_switch_to_ccm_mode+0x3a>
        NOP();
80008108:	0001                	nop
    while (!pcfg_dcdc_is_stable(ptr)) {
8000810a:	4532                	lw	a0,12(sp)
8000810c:	3db1                	jal	80007f68 <pcfg_dcdc_is_stable>
8000810e:	87aa                	mv	a5,a0
80008110:	0017c793          	xori	a5,a5,1
80008114:	0ff7f793          	zext.b	a5,a5
80008118:	fbe5                	bnez	a5,80008108 <pcfg_dcdc_switch_to_ccm_mode+0x38>
    }
}
8000811a:	0001                	nop
8000811c:	0001                	nop
8000811e:	40f2                	lw	ra,28(sp)
80008120:	6105                	addi	sp,sp,32
80008122:	8082                	ret

80008124 <pcfg_dcdc_set_voltage_dcm_mode>:

void pcfg_dcdc_set_voltage_dcm_mode(PCFG_Type *ptr, uint16_t voltage)
{
80008124:	7179                	addi	sp,sp,-48
80008126:	d606                	sw	ra,44(sp)
80008128:	c62a                	sw	a0,12(sp)
8000812a:	87ae                	mv	a5,a1
8000812c:	00f11523          	sh	a5,10(sp)
    uint8_t mode = PCFG_DCDC_MODE_MODE_GET(ptr->DCDC_MODE);
80008130:	47b2                	lw	a5,12(sp)
80008132:	4b9c                	lw	a5,16(a5)
80008134:	83c1                	srli	a5,a5,0x10
80008136:	0ff7f793          	zext.b	a5,a5
8000813a:	8b9d                	andi	a5,a5,7
8000813c:	00f10fa3          	sb	a5,31(sp)
    ptr->DCDC_MODE = (ptr->DCDC_MODE & ~(PCFG_DCDC_MODE_VOLT_MASK | 0xF000)) | PCFG_DCDC_MODE_VOLT_SET(voltage) | (mode << 12u);
80008140:	47b2                	lw	a5,12(sp)
80008142:	4b98                	lw	a4,16(a5)
80008144:	77c1                	lui	a5,0xffff0
80008146:	8f7d                	and	a4,a4,a5
80008148:	00a15783          	lhu	a5,10(sp)
8000814c:	07d2                	slli	a5,a5,0x14
8000814e:	83d1                	srli	a5,a5,0x14
80008150:	8f5d                	or	a4,a4,a5
80008152:	01f14783          	lbu	a5,31(sp)
80008156:	07b2                	slli	a5,a5,0xc
80008158:	8f5d                	or	a4,a4,a5
8000815a:	47b2                	lw	a5,12(sp)
8000815c:	cb98                	sw	a4,16(a5)

    pcfg_dcdc_switch_to_dcm_mode(ptr);
8000815e:	4532                	lw	a0,12(sp)
80008160:	3db5                	jal	80007fdc <pcfg_dcdc_switch_to_dcm_mode>
}
80008162:	0001                	nop
80008164:	50b2                	lw	ra,44(sp)
80008166:	6145                	addi	sp,sp,48
80008168:	8082                	ret

8000816a <pcfg_dcdc_set_voltage_ccm_mode>:

void pcfg_dcdc_set_voltage_ccm_mode(PCFG_Type *ptr, uint16_t voltage)
{
8000816a:	7179                	addi	sp,sp,-48
8000816c:	d606                	sw	ra,44(sp)
8000816e:	c62a                	sw	a0,12(sp)
80008170:	87ae                	mv	a5,a1
80008172:	00f11523          	sh	a5,10(sp)
    uint8_t mode = PCFG_DCDC_MODE_MODE_GET(ptr->DCDC_MODE);
80008176:	47b2                	lw	a5,12(sp)
80008178:	4b9c                	lw	a5,16(a5)
8000817a:	83c1                	srli	a5,a5,0x10
8000817c:	0ff7f793          	zext.b	a5,a5
80008180:	8b9d                	andi	a5,a5,7
80008182:	00f10fa3          	sb	a5,31(sp)
    ptr->DCDC_MODE = (ptr->DCDC_MODE & ~(PCFG_DCDC_MODE_VOLT_MASK | 0xF000)) | PCFG_DCDC_MODE_VOLT_SET(voltage) | (mode << 12u);
80008186:	47b2                	lw	a5,12(sp)
80008188:	4b98                	lw	a4,16(a5)
8000818a:	77c1                	lui	a5,0xffff0
8000818c:	8f7d                	and	a4,a4,a5
8000818e:	00a15783          	lhu	a5,10(sp)
80008192:	07d2                	slli	a5,a5,0x14
80008194:	83d1                	srli	a5,a5,0x14
80008196:	8f5d                	or	a4,a4,a5
80008198:	01f14783          	lbu	a5,31(sp)
8000819c:	07b2                	slli	a5,a5,0xc
8000819e:	8f5d                	or	a4,a4,a5
800081a0:	47b2                	lw	a5,12(sp)
800081a2:	cb98                	sw	a4,16(a5)

    if ((ptr->DCDC_ADVMODE & PCFG_DCDC_ADVMODE_EN_DCM_MASK) != 0) {
800081a4:	47b2                	lw	a5,12(sp)
800081a6:	539c                	lw	a5,32(a5)
800081a8:	8b85                	andi	a5,a5,1
800081aa:	c781                	beqz	a5,800081b2 <pcfg_dcdc_set_voltage_ccm_mode+0x48>
        pcfg_dcdc_switch_to_ccm_mode(ptr);
800081ac:	4532                	lw	a0,12(sp)
800081ae:	370d                	jal	800080d0 <pcfg_dcdc_switch_to_ccm_mode>
        ptr->DCDC_ADVPARAM = (ptr->DCDC_ADVPARAM & ~PCFG_DCDC_ADVPARAM_MIN_DUT_MASK) | PCFG_DCDC_ADVPARAM_MIN_DUT_SET(0x6A);
        while (!pcfg_dcdc_is_stable(ptr)) {
            NOP();
        }
    }
}
800081b0:	a03d                	j	800081de <pcfg_dcdc_set_voltage_ccm_mode+0x74>
        ptr->DCDC_ADVPARAM = (ptr->DCDC_ADVPARAM & ~PCFG_DCDC_ADVPARAM_MIN_DUT_MASK) | PCFG_DCDC_ADVPARAM_MIN_DUT_SET(0x6A);
800081b2:	47b2                	lw	a5,12(sp)
800081b4:	53d8                	lw	a4,36(a5)
800081b6:	77e1                	lui	a5,0xffff8
800081b8:	0ff78793          	addi	a5,a5,255 # ffff80ff <__fast_load_addr__+0x7ffe9f3f>
800081bc:	8f7d                	and	a4,a4,a5
800081be:	679d                	lui	a5,0x7
800081c0:	a0078793          	addi	a5,a5,-1536 # 6a00 <HEAP_SIZE+0x2a00>
800081c4:	8f5d                	or	a4,a4,a5
800081c6:	47b2                	lw	a5,12(sp)
800081c8:	d3d8                	sw	a4,36(a5)
        while (!pcfg_dcdc_is_stable(ptr)) {
800081ca:	a011                	j	800081ce <pcfg_dcdc_set_voltage_ccm_mode+0x64>
            NOP();
800081cc:	0001                	nop
        while (!pcfg_dcdc_is_stable(ptr)) {
800081ce:	4532                	lw	a0,12(sp)
800081d0:	3b61                	jal	80007f68 <pcfg_dcdc_is_stable>
800081d2:	87aa                	mv	a5,a0
800081d4:	0017c793          	xori	a5,a5,1
800081d8:	0ff7f793          	zext.b	a5,a5
800081dc:	fbe5                	bnez	a5,800081cc <pcfg_dcdc_set_voltage_ccm_mode+0x62>
}
800081de:	0001                	nop
800081e0:	50b2                	lw	ra,44(sp)
800081e2:	6145                	addi	sp,sp,48
800081e4:	8082                	ret

800081e6 <_sbrk>:
#include <stdio.h>
#include <errno.h>
#include "hpm_common.h"

void *_sbrk(int incr)
{
800081e6:	7179                	addi	sp,sp,-48
800081e8:	d606                	sw	ra,44(sp)
800081ea:	c62a                	sw	a0,12(sp)
    extern char __heap_start__, __heap_end__;
    static char *heap_end;
    char *prev_heap_end;
    void *ret;

    if (heap_end == NULL)
800081ec:	b081a783          	lw	a5,-1272(gp) # 1080308 <heap_end.0>
800081f0:	e799                	bnez	a5,800081fe <_sbrk+0x18>
    {
        heap_end = &__heap_start__;
800081f2:	00080737          	lui	a4,0x80
800081f6:	00070713          	mv	a4,a4
800081fa:	b0e1a423          	sw	a4,-1272(gp) # 1080308 <heap_end.0>
    }

    prev_heap_end = heap_end;
800081fe:	b081a783          	lw	a5,-1272(gp) # 1080308 <heap_end.0>
80008202:	cc3e                	sw	a5,24(sp)

    /* Check if heap boundary would be exceeded */
    if (heap_end + incr > &__heap_end__)
80008204:	b081a703          	lw	a4,-1272(gp) # 1080308 <heap_end.0>
80008208:	47b2                	lw	a5,12(sp)
8000820a:	973e                	add	a4,a4,a5
8000820c:	000847b7          	lui	a5,0x84
80008210:	00078793          	mv	a5,a5
80008214:	00e7fa63          	bgeu	a5,a4,80008228 <_sbrk+0x42>
    {
        errno = ENOMEM;
80008218:	1ae010ef          	jal	800093c6 <__errno>
8000821c:	872a                	mv	a4,a0
8000821e:	47b1                	li	a5,12
80008220:	c31c                	sw	a5,0(a4)
        ret = (void *)-1;
80008222:	57fd                	li	a5,-1
80008224:	ce3e                	sw	a5,28(sp)
80008226:	a809                	j	80008238 <_sbrk+0x52>
    }
    else
    {
        heap_end += incr;
80008228:	b081a703          	lw	a4,-1272(gp) # 1080308 <heap_end.0>
8000822c:	47b2                	lw	a5,12(sp)
8000822e:	973e                	add	a4,a4,a5
80008230:	b0e1a423          	sw	a4,-1272(gp) # 1080308 <heap_end.0>
        ret = (void *)prev_heap_end;
80008234:	47e2                	lw	a5,24(sp)
80008236:	ce3e                	sw	a5,28(sp)
    }

    return ret;
80008238:	47f2                	lw	a5,28(sp)
}
8000823a:	853e                	mv	a0,a5
8000823c:	50b2                	lw	ra,44(sp)
8000823e:	6145                	addi	sp,sp,48
80008240:	8082                	ret

80008242 <console_init>:
#include "hpm_uart_drv.h"

static UART_Type* g_console_uart = NULL;

hpm_stat_t console_init(console_config_t *cfg)
{
80008242:	7139                	addi	sp,sp,-64
80008244:	de06                	sw	ra,60(sp)
80008246:	c62a                	sw	a0,12(sp)
    hpm_stat_t stat = status_fail;
80008248:	4785                	li	a5,1
8000824a:	d63e                	sw	a5,44(sp)

#if !defined(CONFIG_CONSOLE_NO_SETVBUF) || !CONFIG_CONSOLE_NO_SETVBUF
    /* disable buffer in standard library */
    setvbuf(stdin, NULL, _IONBF, 0);
8000824c:	9c41a783          	lw	a5,-1596(gp) # 10801c4 <_impure_ptr>
80008250:	43dc                	lw	a5,4(a5)
80008252:	4681                	li	a3,0
80008254:	4609                	li	a2,2
80008256:	4581                	li	a1,0
80008258:	853e                	mv	a0,a5
8000825a:	7c7000ef          	jal	80009220 <setvbuf>
    setvbuf(stdout, NULL, _IONBF, 0);
8000825e:	9c41a783          	lw	a5,-1596(gp) # 10801c4 <_impure_ptr>
80008262:	479c                	lw	a5,8(a5)
80008264:	4681                	li	a3,0
80008266:	4609                	li	a2,2
80008268:	4581                	li	a1,0
8000826a:	853e                	mv	a0,a5
8000826c:	7b5000ef          	jal	80009220 <setvbuf>
#endif

    if (cfg->type == CONSOLE_TYPE_UART) {
80008270:	47b2                	lw	a5,12(sp)
80008272:	439c                	lw	a5,0(a5)
80008274:	e7a1                	bnez	a5,800082bc <console_init+0x7a>
        uart_config_t config = {0};
80008276:	cc02                	sw	zero,24(sp)
80008278:	ce02                	sw	zero,28(sp)
8000827a:	d002                	sw	zero,32(sp)
8000827c:	d202                	sw	zero,36(sp)
8000827e:	d402                	sw	zero,40(sp)
        uart_default_config((UART_Type *)cfg->base, &config);
80008280:	47b2                	lw	a5,12(sp)
80008282:	43dc                	lw	a5,4(a5)
80008284:	873e                	mv	a4,a5
80008286:	083c                	addi	a5,sp,24
80008288:	85be                	mv	a1,a5
8000828a:	853a                	mv	a0,a4
8000828c:	d6ffe0ef          	jal	80006ffa <uart_default_config>
        config.src_freq_in_hz = cfg->src_freq_in_hz;
80008290:	47b2                	lw	a5,12(sp)
80008292:	479c                	lw	a5,8(a5)
80008294:	cc3e                	sw	a5,24(sp)
        config.baudrate = cfg->baudrate;
80008296:	47b2                	lw	a5,12(sp)
80008298:	47dc                	lw	a5,12(a5)
8000829a:	ce3e                	sw	a5,28(sp)
        stat = uart_init((UART_Type *)cfg->base, &config);
8000829c:	47b2                	lw	a5,12(sp)
8000829e:	43dc                	lw	a5,4(a5)
800082a0:	873e                	mv	a4,a5
800082a2:	083c                	addi	a5,sp,24
800082a4:	85be                	mv	a1,a5
800082a6:	853a                	mv	a0,a4
800082a8:	fbdfe0ef          	jal	80007264 <uart_init>
800082ac:	d62a                	sw	a0,44(sp)
        if (status_success == stat) {
800082ae:	57b2                	lw	a5,44(sp)
800082b0:	e791                	bnez	a5,800082bc <console_init+0x7a>
            g_console_uart = (UART_Type *)cfg->base;
800082b2:	47b2                	lw	a5,12(sp)
800082b4:	43dc                	lw	a5,4(a5)
800082b6:	873e                	mv	a4,a5
800082b8:	b0e1a623          	sw	a4,-1268(gp) # 108030c <g_console_uart>
        }
    }

    return stat;
800082bc:	57b2                	lw	a5,44(sp)
}
800082be:	853e                	mv	a0,a5
800082c0:	50f2                	lw	ra,60(sp)
800082c2:	6121                	addi	sp,sp,64
800082c4:	8082                	ret

800082c6 <_write>:
}

#endif

int _write(int file, char *data, int size)
{
800082c6:	7179                	addi	sp,sp,-48
800082c8:	d606                	sw	ra,44(sp)
800082ca:	c62a                	sw	a0,12(sp)
800082cc:	c42e                	sw	a1,8(sp)
800082ce:	c232                	sw	a2,4(sp)
    int count;
    (void)file;
    for (count = 0; count < size; count++) {
800082d0:	ce02                	sw	zero,28(sp)
800082d2:	a099                	j	80008318 <_write+0x52>
        if (data[count] == '\n') {
800082d4:	47f2                	lw	a5,28(sp)
800082d6:	4722                	lw	a4,8(sp)
800082d8:	97ba                	add	a5,a5,a4
800082da:	0007c703          	lbu	a4,0(a5) # 84000 <__heap_end__>
800082de:	47a9                	li	a5,10
800082e0:	00f71b63          	bne	a4,a5,800082f6 <_write+0x30>
            while (status_success != uart_send_byte(g_console_uart, '\r')) {
800082e4:	0001                	nop
800082e6:	b0c1a783          	lw	a5,-1268(gp) # 108030c <g_console_uart>
800082ea:	45b5                	li	a1,13
800082ec:	853e                	mv	a0,a5
800082ee:	90aff0ef          	jal	800073f8 <uart_send_byte>
800082f2:	87aa                	mv	a5,a0
800082f4:	fbed                	bnez	a5,800082e6 <_write+0x20>
            }
        }
        while (status_success != uart_send_byte(g_console_uart, data[count])) {
800082f6:	0001                	nop
800082f8:	b0c1a683          	lw	a3,-1268(gp) # 108030c <g_console_uart>
800082fc:	47f2                	lw	a5,28(sp)
800082fe:	4722                	lw	a4,8(sp)
80008300:	97ba                	add	a5,a5,a4
80008302:	0007c783          	lbu	a5,0(a5)
80008306:	85be                	mv	a1,a5
80008308:	8536                	mv	a0,a3
8000830a:	8eeff0ef          	jal	800073f8 <uart_send_byte>
8000830e:	87aa                	mv	a5,a0
80008310:	f7e5                	bnez	a5,800082f8 <_write+0x32>
    for (count = 0; count < size; count++) {
80008312:	47f2                	lw	a5,28(sp)
80008314:	0785                	addi	a5,a5,1
80008316:	ce3e                	sw	a5,28(sp)
80008318:	4772                	lw	a4,28(sp)
8000831a:	4792                	lw	a5,4(sp)
8000831c:	faf74ce3          	blt	a4,a5,800082d4 <_write+0xe>
        }
    }
    while (status_success != uart_flush(g_console_uart)) {
80008320:	0001                	nop
80008322:	b0c1a783          	lw	a5,-1268(gp) # 108030c <g_console_uart>
80008326:	853e                	mv	a0,a5
80008328:	91eff0ef          	jal	80007446 <uart_flush>
8000832c:	87aa                	mv	a5,a0
8000832e:	fbf5                	bnez	a5,80008322 <_write+0x5c>
    }
    return count;
80008330:	47f2                	lw	a5,28(sp)
}
80008332:	853e                	mv	a0,a5
80008334:	50b2                	lw	ra,44(sp)
80008336:	6145                	addi	sp,sp,48
80008338:	8082                	ret

8000833a <_read>:

int _read(int file, char *s, int size)
{
8000833a:	1101                	addi	sp,sp,-32
8000833c:	ce06                	sw	ra,28(sp)
8000833e:	c62a                	sw	a0,12(sp)
80008340:	c42e                	sw	a1,8(sp)
80008342:	c232                	sw	a2,4(sp)
    (void)file;
    (void) size;
    while (status_success != uart_receive_byte(g_console_uart, (uint8_t *)s)) {
80008344:	0001                	nop
80008346:	b0c1a783          	lw	a5,-1268(gp) # 108030c <g_console_uart>
8000834a:	45a2                	lw	a1,8(sp)
8000834c:	853e                	mv	a0,a5
8000834e:	938ff0ef          	jal	80007486 <uart_receive_byte>
80008352:	87aa                	mv	a5,a0
80008354:	fbed                	bnez	a5,80008346 <_read+0xc>
    }
    return 1;
80008356:	4785                	li	a5,1
}
80008358:	853e                	mv	a0,a5
8000835a:	40f2                	lw	ra,28(sp)
8000835c:	6105                	addi	sp,sp,32
8000835e:	8082                	ret

80008360 <_fstat>:

#endif

#ifndef __ICCRISCV__
int _fstat(int file, struct stat *s)
{
80008360:	1141                	addi	sp,sp,-16
80008362:	c62a                	sw	a0,12(sp)
80008364:	c42e                	sw	a1,8(sp)
    (void) file;
    s->st_mode = S_IFCHR;
80008366:	47a2                	lw	a5,8(sp)
80008368:	6709                	lui	a4,0x2
8000836a:	c3d8                	sw	a4,4(a5)
    return 0;
8000836c:	4781                	li	a5,0
}
8000836e:	853e                	mv	a0,a5
80008370:	0141                	addi	sp,sp,16
80008372:	8082                	ret

80008374 <__assert_func>:
80008374:	9c41a783          	lw	a5,-1596(gp) # 10801c4 <_impure_ptr>
80008378:	1141                	addi	sp,sp,-16
8000837a:	8832                	mv	a6,a2
8000837c:	c606                	sw	ra,12(sp)
8000837e:	88aa                	mv	a7,a0
80008380:	872e                	mv	a4,a1
80008382:	47c8                	lw	a0,12(a5)
80008384:	8636                	mv	a2,a3
80008386:	00080f63          	beqz	a6,800083a4 <__assert_func+0x30>
8000838a:	8000e7b7          	lui	a5,0x8000e
8000838e:	9e878793          	addi	a5,a5,-1560 # 8000d9e8 <s_wdgs+0x10>
80008392:	8000e5b7          	lui	a1,0x8000e
80008396:	86c6                	mv	a3,a7
80008398:	9f858593          	addi	a1,a1,-1544 # 8000d9f8 <s_wdgs+0x20>
8000839c:	635000ef          	jal	800091d0 <fiprintf>
800083a0:	062010ef          	jal	80009402 <abort>
800083a4:	8000e7b7          	lui	a5,0x8000e
800083a8:	9f478793          	addi	a5,a5,-1548 # 8000d9f4 <s_wdgs+0x1c>
800083ac:	883e                	mv	a6,a5
800083ae:	b7d5                	j	80008392 <__assert_func+0x1e>

800083b0 <__cvt>:
800083b0:	7139                	addi	sp,sp,-64
800083b2:	dc22                	sw	s0,56(sp)
800083b4:	da26                	sw	s1,52(sp)
800083b6:	d64e                	sw	s3,44(sp)
800083b8:	d452                	sw	s4,40(sp)
800083ba:	d256                	sw	s5,36(sp)
800083bc:	d05a                	sw	s6,32(sp)
800083be:	de06                	sw	ra,60(sp)
800083c0:	d84a                	sw	s2,48(sp)
800083c2:	ce5e                	sw	s7,28(sp)
800083c4:	89ba                	mv	s3,a4
800083c6:	8a2e                	mv	s4,a1
800083c8:	8432                	mv	s0,a2
800083ca:	84b6                	mv	s1,a3
800083cc:	8ac2                	mv	s5,a6
800083ce:	8b46                	mv	s6,a7
800083d0:	4701                	li	a4,0
800083d2:	00065863          	bgez	a2,800083e2 <__cvt+0x32>
800083d6:	80000737          	lui	a4,0x80000
800083da:	00e64433          	xor	s0,a2,a4
800083de:	02d00713          	li	a4,45
800083e2:	00e78023          	sb	a4,0(a5)
800083e6:	fdfb7b93          	andi	s7,s6,-33
800083ea:	04600793          	li	a5,70
800083ee:	468d                	li	a3,3
800083f0:	00fb8863          	beq	s7,a5,80008400 <__cvt+0x50>
800083f4:	fbbb8793          	addi	a5,s7,-69
800083f8:	0017b793          	seqz	a5,a5
800083fc:	94be                	add	s1,s1,a5
800083fe:	4689                	li	a3,2
80008400:	87d6                	mv	a5,s5
80008402:	00c10893          	addi	a7,sp,12
80008406:	00810813          	addi	a6,sp,8
8000840a:	8726                	mv	a4,s1
8000840c:	85d2                	mv	a1,s4
8000840e:	8622                	mv	a2,s0
80008410:	138010ef          	jal	80009548 <_dtoa_r>
80008414:	04700793          	li	a5,71
80008418:	892a                	mv	s2,a0
8000841a:	02fb9363          	bne	s7,a5,80008440 <__cvt+0x90>
8000841e:	0019f993          	andi	s3,s3,1
80008422:	06098563          	beqz	s3,8000848c <__cvt+0xdc>
80008426:	009509b3          	add	s3,a0,s1
8000842a:	4601                	li	a2,0
8000842c:	4681                	li	a3,0
8000842e:	8552                	mv	a0,s4
80008430:	85a2                	mv	a1,s0
80008432:	9b7fc0ef          	jal	80004de8 <__eqdf2>
80008436:	e111                	bnez	a0,8000843a <__cvt+0x8a>
80008438:	c64e                	sw	s3,12(sp)
8000843a:	03000713          	li	a4,48
8000843e:	a0a1                	j	80008486 <__cvt+0xd6>
80008440:	06600793          	li	a5,102
80008444:	009509b3          	add	s3,a0,s1
80008448:	00fb0663          	beq	s6,a5,80008454 <__cvt+0xa4>
8000844c:	04600793          	li	a5,70
80008450:	fcfb1de3          	bne	s6,a5,8000842a <__cvt+0x7a>
80008454:	00094783          	lbu	a5,0(s2)
80008458:	fd078793          	addi	a5,a5,-48
8000845c:	ef81                	bnez	a5,80008474 <__cvt+0xc4>
8000845e:	4601                	li	a2,0
80008460:	4681                	li	a3,0
80008462:	8552                	mv	a0,s4
80008464:	85a2                	mv	a1,s0
80008466:	983fc0ef          	jal	80004de8 <__eqdf2>
8000846a:	c509                	beqz	a0,80008474 <__cvt+0xc4>
8000846c:	4785                	li	a5,1
8000846e:	8f85                	sub	a5,a5,s1
80008470:	00faa023          	sw	a5,0(s5)
80008474:	000aa783          	lw	a5,0(s5)
80008478:	99be                	add	s3,s3,a5
8000847a:	bf45                	j	8000842a <__cvt+0x7a>
8000847c:	00178693          	addi	a3,a5,1
80008480:	c636                	sw	a3,12(sp)
80008482:	00e78023          	sb	a4,0(a5)
80008486:	47b2                	lw	a5,12(sp)
80008488:	ff37eae3          	bltu	a5,s3,8000847c <__cvt+0xcc>
8000848c:	47b2                	lw	a5,12(sp)
8000848e:	4706                	lw	a4,64(sp)
80008490:	50f2                	lw	ra,60(sp)
80008492:	5462                	lw	s0,56(sp)
80008494:	412787b3          	sub	a5,a5,s2
80008498:	c31c                	sw	a5,0(a4)
8000849a:	54d2                	lw	s1,52(sp)
8000849c:	59b2                	lw	s3,44(sp)
8000849e:	5a22                	lw	s4,40(sp)
800084a0:	5a92                	lw	s5,36(sp)
800084a2:	5b02                	lw	s6,32(sp)
800084a4:	4bf2                	lw	s7,28(sp)
800084a6:	854a                	mv	a0,s2
800084a8:	5942                	lw	s2,48(sp)
800084aa:	6121                	addi	sp,sp,64
800084ac:	8082                	ret

800084ae <__exponent>:
800084ae:	00c50023          	sb	a2,0(a0) # f4000000 <__fast_load_addr__+0x73ff1e40>
800084b2:	02b00793          	li	a5,43
800084b6:	0005d663          	bgez	a1,800084c2 <__exponent+0x14>
800084ba:	40b005b3          	neg	a1,a1
800084be:	02d00793          	li	a5,45
800084c2:	00f500a3          	sb	a5,1(a0)
800084c6:	47a5                	li	a5,9
800084c8:	06b7d463          	bge	a5,a1,80008530 <__exponent+0x82>
800084cc:	1141                	addi	sp,sp,-16
800084ce:	00f10613          	addi	a2,sp,15
800084d2:	00250793          	addi	a5,a0,2
800084d6:	8832                	mv	a6,a2
800084d8:	48a9                	li	a7,10
800084da:	06300313          	li	t1,99
800084de:	0315e733          	rem	a4,a1,a7
800084e2:	86b2                	mv	a3,a2
800084e4:	167d                	addi	a2,a2,-1
800084e6:	03070713          	addi	a4,a4,48 # 80000030 <__share_mem_end__+0x7ee80030>
800084ea:	fee68fa3          	sb	a4,-1(a3)
800084ee:	872e                	mv	a4,a1
800084f0:	0315c5b3          	div	a1,a1,a7
800084f4:	fee345e3          	blt	t1,a4,800084de <__exponent+0x30>
800084f8:	03058593          	addi	a1,a1,48
800084fc:	ffe68713          	addi	a4,a3,-2
80008500:	feb60fa3          	sb	a1,-1(a2)
80008504:	863e                	mv	a2,a5
80008506:	85ba                	mv	a1,a4
80008508:	01076d63          	bltu	a4,a6,80008522 <__exponent+0x74>
8000850c:	4701                	li	a4,0
8000850e:	00b86563          	bltu	a6,a1,80008518 <__exponent+0x6a>
80008512:	01110713          	addi	a4,sp,17
80008516:	8f15                	sub	a4,a4,a3
80008518:	97ba                	add	a5,a5,a4
8000851a:	40a78533          	sub	a0,a5,a0
8000851e:	0141                	addi	sp,sp,16
80008520:	8082                	ret
80008522:	00074883          	lbu	a7,0(a4)
80008526:	0705                	addi	a4,a4,1
80008528:	0605                	addi	a2,a2,1
8000852a:	ff160fa3          	sb	a7,-1(a2)
8000852e:	bfe9                	j	80008508 <__exponent+0x5a>
80008530:	03000793          	li	a5,48
80008534:	00f50123          	sb	a5,2(a0)
80008538:	03058593          	addi	a1,a1,48
8000853c:	00450793          	addi	a5,a0,4
80008540:	00b501a3          	sb	a1,3(a0)
80008544:	40a78533          	sub	a0,a5,a0
80008548:	8082                	ret

8000854a <_printf_float>:
8000854a:	7119                	addi	sp,sp,-128
8000854c:	cc3a                	sw	a4,24(sp)
8000854e:	de86                	sw	ra,124(sp)
80008550:	dca2                	sw	s0,120(sp)
80008552:	daa6                	sw	s1,116(sp)
80008554:	842e                	mv	s0,a1
80008556:	84b6                	mv	s1,a3
80008558:	d6ce                	sw	s3,108(sp)
8000855a:	d4d2                	sw	s4,104(sp)
8000855c:	cce2                	sw	s8,88(sp)
8000855e:	cae6                	sw	s9,84(sp)
80008560:	c8ea                	sw	s10,80(sp)
80008562:	c6ee                	sw	s11,76(sp)
80008564:	8cb2                	mv	s9,a2
80008566:	d8ca                	sw	s2,112(sp)
80008568:	d2d6                	sw	s5,100(sp)
8000856a:	d0da                	sw	s6,96(sp)
8000856c:	cede                	sw	s7,92(sp)
8000856e:	8c2a                	mv	s8,a0
80008570:	651000ef          	jal	800093c0 <_localeconv_r>
80008574:	411c                	lw	a5,0(a0)
80008576:	853e                	mv	a0,a5
80008578:	8d3e                	mv	s10,a5
8000857a:	653000ef          	jal	800093cc <strlen>
8000857e:	00042a03          	lw	s4,0(s0)
80008582:	4762                	lw	a4,24(sp)
80008584:	dc02                	sw	zero,56(sp)
80008586:	100a7693          	andi	a3,s4,256
8000858a:	01844983          	lbu	s3,24(s0)
8000858e:	431c                	lw	a5,0(a4)
80008590:	8daa                	mv	s11,a0
80008592:	c2e5                	beqz	a3,80008672 <_printf_float+0x128>
80008594:	00478693          	addi	a3,a5,4
80008598:	c314                	sw	a3,0(a4)
8000859a:	439c                	lw	a5,0(a5)
8000859c:	1008                	addi	a0,sp,32
8000859e:	4398                	lw	a4,0(a5)
800085a0:	d03a                	sw	a4,32(sp)
800085a2:	43d8                	lw	a4,4(a5)
800085a4:	d23a                	sw	a4,36(sp)
800085a6:	4798                	lw	a4,8(a5)
800085a8:	d43a                	sw	a4,40(sp)
800085aa:	47dc                	lw	a5,12(a5)
800085ac:	d63e                	sw	a5,44(sp)
800085ae:	f2ffc0ef          	jal	800054dc <__trunctfdf2>
800085b2:	8aaa                	mv	s5,a0
800085b4:	892e                	mv	s2,a1
800085b6:	8000e7b7          	lui	a5,0x8000e
800085ba:	f447a803          	lw	a6,-188(a5) # 8000df44 <_ctype_+0x10c>
800085be:	f407a783          	lw	a5,-192(a5)
800085c2:	00191b13          	slli	s6,s2,0x1
800085c6:	05542423          	sw	s5,72(s0)
800085ca:	05242623          	sw	s2,76(s0)
800085ce:	863e                	mv	a2,a5
800085d0:	86c2                	mv	a3,a6
800085d2:	8556                	mv	a0,s5
800085d4:	001b5593          	srli	a1,s6,0x1
800085d8:	cc3e                	sw	a5,24(sp)
800085da:	ce42                	sw	a6,28(sp)
800085dc:	9cffc0ef          	jal	80004faa <__unorddf2>
800085e0:	e15d                	bnez	a0,80008686 <_printf_float+0x13c>
800085e2:	4662                	lw	a2,24(sp)
800085e4:	46f2                	lw	a3,28(sp)
800085e6:	8556                	mv	a0,s5
800085e8:	001b5593          	srli	a1,s6,0x1
800085ec:	90dfc0ef          	jal	80004ef8 <__ledf2>
800085f0:	08a05b63          	blez	a0,80008686 <_printf_float+0x13c>
800085f4:	4601                	li	a2,0
800085f6:	4681                	li	a3,0
800085f8:	8556                	mv	a0,s5
800085fa:	85ca                	mv	a1,s2
800085fc:	8fdfc0ef          	jal	80004ef8 <__ledf2>
80008600:	00055663          	bgez	a0,8000860c <_printf_float+0xc2>
80008604:	02d00793          	li	a5,45
80008608:	04f401a3          	sb	a5,67(s0)
8000860c:	04700793          	li	a5,71
80008610:	0b37e163          	bltu	a5,s3,800086b2 <_printf_float+0x168>
80008614:	8000e937          	lui	s2,0x8000e
80008618:	a2890913          	addi	s2,s2,-1496 # 8000da28 <s_wdgs+0x50>
8000861c:	ffba7a13          	andi	s4,s4,-5
80008620:	478d                	li	a5,3
80008622:	01442023          	sw	s4,0(s0)
80008626:	c81c                	sw	a5,16(s0)
80008628:	4a01                	li	s4,0
8000862a:	8726                	mv	a4,s1
8000862c:	86e6                	mv	a3,s9
8000862e:	1870                	addi	a2,sp,60
80008630:	85a2                	mv	a1,s0
80008632:	8562                	mv	a0,s8
80008634:	26c9                	jal	800089f6 <_printf_common>
80008636:	5afd                	li	s5,-1
80008638:	01550e63          	beq	a0,s5,80008654 <_printf_float+0x10a>
8000863c:	401c                	lw	a5,0(s0)
8000863e:	4007f713          	andi	a4,a5,1024
80008642:	16071b63          	bnez	a4,800087b8 <_printf_float+0x26e>
80008646:	4814                	lw	a3,16(s0)
80008648:	864a                	mv	a2,s2
8000864a:	85e6                	mv	a1,s9
8000864c:	8562                	mv	a0,s8
8000864e:	9482                	jalr	s1
80008650:	1b551c63          	bne	a0,s5,80008808 <_printf_float+0x2be>
80008654:	50f6                	lw	ra,124(sp)
80008656:	5466                	lw	s0,120(sp)
80008658:	54d6                	lw	s1,116(sp)
8000865a:	5946                	lw	s2,112(sp)
8000865c:	59b6                	lw	s3,108(sp)
8000865e:	5a26                	lw	s4,104(sp)
80008660:	5a96                	lw	s5,100(sp)
80008662:	5b06                	lw	s6,96(sp)
80008664:	4bf6                	lw	s7,92(sp)
80008666:	4c66                	lw	s8,88(sp)
80008668:	4cd6                	lw	s9,84(sp)
8000866a:	4d46                	lw	s10,80(sp)
8000866c:	4db6                	lw	s11,76(sp)
8000866e:	6109                	addi	sp,sp,128
80008670:	8082                	ret
80008672:	079d                	addi	a5,a5,7
80008674:	9be1                	andi	a5,a5,-8
80008676:	00878693          	addi	a3,a5,8
8000867a:	0007aa83          	lw	s5,0(a5)
8000867e:	0047a903          	lw	s2,4(a5)
80008682:	c314                	sw	a3,0(a4)
80008684:	bf0d                	j	800085b6 <_printf_float+0x6c>
80008686:	8656                	mv	a2,s5
80008688:	86ca                	mv	a3,s2
8000868a:	8556                	mv	a0,s5
8000868c:	85ca                	mv	a1,s2
8000868e:	91dfc0ef          	jal	80004faa <__unorddf2>
80008692:	c915                	beqz	a0,800086c6 <_printf_float+0x17c>
80008694:	00095663          	bgez	s2,800086a0 <_printf_float+0x156>
80008698:	02d00793          	li	a5,45
8000869c:	04f401a3          	sb	a5,67(s0)
800086a0:	04700793          	li	a5,71
800086a4:	0137ec63          	bltu	a5,s3,800086bc <_printf_float+0x172>
800086a8:	8000e937          	lui	s2,0x8000e
800086ac:	a3090913          	addi	s2,s2,-1488 # 8000da30 <s_wdgs+0x58>
800086b0:	b7b5                	j	8000861c <_printf_float+0xd2>
800086b2:	8000e937          	lui	s2,0x8000e
800086b6:	a2c90913          	addi	s2,s2,-1492 # 8000da2c <s_wdgs+0x54>
800086ba:	b78d                	j	8000861c <_printf_float+0xd2>
800086bc:	8000e937          	lui	s2,0x8000e
800086c0:	a3490913          	addi	s2,s2,-1484 # 8000da34 <s_wdgs+0x5c>
800086c4:	bfa1                	j	8000861c <_printf_float+0xd2>
800086c6:	405c                	lw	a5,4(s0)
800086c8:	577d                	li	a4,-1
800086ca:	0df9fb13          	andi	s6,s3,223
800086ce:	06e79d63          	bne	a5,a4,80008748 <_printf_float+0x1fe>
800086d2:	4799                	li	a5,6
800086d4:	c05c                	sw	a5,4(s0)
800086d6:	400a6713          	ori	a4,s4,1024
800086da:	c018                	sw	a4,0(s0)
800086dc:	183c                	addi	a5,sp,56
800086de:	c03e                	sw	a5,0(sp)
800086e0:	c202                	sw	zero,4(sp)
800086e2:	4054                	lw	a3,4(s0)
800086e4:	03310793          	addi	a5,sp,51
800086e8:	864a                	mv	a2,s2
800086ea:	85d6                	mv	a1,s5
800086ec:	88ce                	mv	a7,s3
800086ee:	03410813          	addi	a6,sp,52
800086f2:	8562                	mv	a0,s8
800086f4:	3975                	jal	800083b0 <__cvt>
800086f6:	04700793          	li	a5,71
800086fa:	55d2                	lw	a1,52(sp)
800086fc:	892a                	mv	s2,a0
800086fe:	04fb1c63          	bne	s6,a5,80008756 <_printf_float+0x20c>
80008702:	57f5                	li	a5,-3
80008704:	00f5c563          	blt	a1,a5,8000870e <_printf_float+0x1c4>
80008708:	405c                	lw	a5,4(s0)
8000870a:	08b7d763          	bge	a5,a1,80008798 <_printf_float+0x24e>
8000870e:	19f9                	addi	s3,s3,-2
80008710:	0ff9f993          	zext.b	s3,s3
80008714:	15fd                	addi	a1,a1,-1
80008716:	864e                	mv	a2,s3
80008718:	05040513          	addi	a0,s0,80
8000871c:	da2e                	sw	a1,52(sp)
8000871e:	3b41                	jal	800084ae <__exponent>
80008720:	5762                	lw	a4,56(sp)
80008722:	4685                	li	a3,1
80008724:	8a2a                	mv	s4,a0
80008726:	00a707b3          	add	a5,a4,a0
8000872a:	04e6cd63          	blt	a3,a4,80008784 <_printf_float+0x23a>
8000872e:	4018                	lw	a4,0(s0)
80008730:	8f75                	and	a4,a4,a3
80008732:	eb29                	bnez	a4,80008784 <_printf_float+0x23a>
80008734:	c81c                	sw	a5,16(s0)
80008736:	03314783          	lbu	a5,51(sp)
8000873a:	ee0788e3          	beqz	a5,8000862a <_printf_float+0xe0>
8000873e:	02d00793          	li	a5,45
80008742:	04f401a3          	sb	a5,67(s0)
80008746:	b5d5                	j	8000862a <_printf_float+0xe0>
80008748:	04700713          	li	a4,71
8000874c:	f8eb15e3          	bne	s6,a4,800086d6 <_printf_float+0x18c>
80008750:	f3d9                	bnez	a5,800086d6 <_printf_float+0x18c>
80008752:	4785                	li	a5,1
80008754:	b741                	j	800086d4 <_printf_float+0x18a>
80008756:	06500793          	li	a5,101
8000875a:	fb37fde3          	bgeu	a5,s3,80008714 <_printf_float+0x1ca>
8000875e:	06600793          	li	a5,102
80008762:	02f99d63          	bne	s3,a5,8000879c <_printf_float+0x252>
80008766:	4058                	lw	a4,4(s0)
80008768:	02b05063          	blez	a1,80008788 <_printf_float+0x23e>
8000876c:	e709                	bnez	a4,80008776 <_printf_float+0x22c>
8000876e:	4014                	lw	a3,0(s0)
80008770:	87ae                	mv	a5,a1
80008772:	8a85                	andi	a3,a3,1
80008774:	c681                	beqz	a3,8000877c <_printf_float+0x232>
80008776:	0705                	addi	a4,a4,1
80008778:	00b707b3          	add	a5,a4,a1
8000877c:	c81c                	sw	a5,16(s0)
8000877e:	cc2c                	sw	a1,88(s0)
80008780:	4a01                	li	s4,0
80008782:	bf55                	j	80008736 <_printf_float+0x1ec>
80008784:	0785                	addi	a5,a5,1
80008786:	b77d                	j	80008734 <_printf_float+0x1ea>
80008788:	e709                	bnez	a4,80008792 <_printf_float+0x248>
8000878a:	4014                	lw	a3,0(s0)
8000878c:	4785                	li	a5,1
8000878e:	8a85                	andi	a3,a3,1
80008790:	d6f5                	beqz	a3,8000877c <_printf_float+0x232>
80008792:	00270793          	addi	a5,a4,2
80008796:	b7dd                	j	8000877c <_printf_float+0x232>
80008798:	06700993          	li	s3,103
8000879c:	57e2                	lw	a5,56(sp)
8000879e:	00f5c663          	blt	a1,a5,800087aa <_printf_float+0x260>
800087a2:	401c                	lw	a5,0(s0)
800087a4:	8b85                	andi	a5,a5,1
800087a6:	97ae                	add	a5,a5,a1
800087a8:	bfd1                	j	8000877c <_printf_float+0x232>
800087aa:	4705                	li	a4,1
800087ac:	00b04463          	bgtz	a1,800087b4 <_printf_float+0x26a>
800087b0:	4709                	li	a4,2
800087b2:	8f0d                	sub	a4,a4,a1
800087b4:	97ba                	add	a5,a5,a4
800087b6:	b7d9                	j	8000877c <_printf_float+0x232>
800087b8:	06500713          	li	a4,101
800087bc:	1b377263          	bgeu	a4,s3,80008960 <_printf_float+0x416>
800087c0:	4428                	lw	a0,72(s0)
800087c2:	446c                	lw	a1,76(s0)
800087c4:	4601                	li	a2,0
800087c6:	4681                	li	a3,0
800087c8:	e20fc0ef          	jal	80004de8 <__eqdf2>
800087cc:	e135                	bnez	a0,80008830 <_printf_float+0x2e6>
800087ce:	8000e637          	lui	a2,0x8000e
800087d2:	4685                	li	a3,1
800087d4:	a3860613          	addi	a2,a2,-1480 # 8000da38 <s_wdgs+0x60>
800087d8:	85e6                	mv	a1,s9
800087da:	8562                	mv	a0,s8
800087dc:	9482                	jalr	s1
800087de:	e7550be3          	beq	a0,s5,80008654 <_printf_float+0x10a>
800087e2:	5962                	lw	s2,56(sp)
800087e4:	57d2                	lw	a5,52(sp)
800087e6:	0127c563          	blt	a5,s2,800087f0 <_printf_float+0x2a6>
800087ea:	401c                	lw	a5,0(s0)
800087ec:	8b85                	andi	a5,a5,1
800087ee:	cf89                	beqz	a5,80008808 <_printf_float+0x2be>
800087f0:	86ee                	mv	a3,s11
800087f2:	866a                	mv	a2,s10
800087f4:	85e6                	mv	a1,s9
800087f6:	8562                	mv	a0,s8
800087f8:	9482                	jalr	s1
800087fa:	5a7d                	li	s4,-1
800087fc:	e5450ce3          	beq	a0,s4,80008654 <_printf_float+0x10a>
80008800:	9952                	add	s2,s2,s4
80008802:	4981                	li	s3,0
80008804:	0129cc63          	blt	s3,s2,8000881c <_printf_float+0x2d2>
80008808:	401c                	lw	a5,0(s0)
8000880a:	8b89                	andi	a5,a5,2
8000880c:	1e079263          	bnez	a5,800089f0 <_printf_float+0x4a6>
80008810:	57f2                	lw	a5,60(sp)
80008812:	4448                	lw	a0,12(s0)
80008814:	e4f550e3          	bge	a0,a5,80008654 <_printf_float+0x10a>
80008818:	853e                	mv	a0,a5
8000881a:	bd2d                	j	80008654 <_printf_float+0x10a>
8000881c:	4685                	li	a3,1
8000881e:	01a40613          	addi	a2,s0,26
80008822:	85e6                	mv	a1,s9
80008824:	8562                	mv	a0,s8
80008826:	9482                	jalr	s1
80008828:	e34506e3          	beq	a0,s4,80008654 <_printf_float+0x10a>
8000882c:	0985                	addi	s3,s3,1
8000882e:	bfd9                	j	80008804 <_printf_float+0x2ba>
80008830:	57d2                	lw	a5,52(sp)
80008832:	06f04563          	bgtz	a5,8000889c <_printf_float+0x352>
80008836:	8000e637          	lui	a2,0x8000e
8000883a:	4685                	li	a3,1
8000883c:	a3860613          	addi	a2,a2,-1480 # 8000da38 <s_wdgs+0x60>
80008840:	85e6                	mv	a1,s9
80008842:	8562                	mv	a0,s8
80008844:	9482                	jalr	s1
80008846:	e15507e3          	beq	a0,s5,80008654 <_printf_float+0x10a>
8000884a:	5a62                	lw	s4,56(sp)
8000884c:	57d2                	lw	a5,52(sp)
8000884e:	00fa67b3          	or	a5,s4,a5
80008852:	e781                	bnez	a5,8000885a <_printf_float+0x310>
80008854:	401c                	lw	a5,0(s0)
80008856:	8b85                	andi	a5,a5,1
80008858:	dbc5                	beqz	a5,80008808 <_printf_float+0x2be>
8000885a:	86ee                	mv	a3,s11
8000885c:	866a                	mv	a2,s10
8000885e:	85e6                	mv	a1,s9
80008860:	8562                	mv	a0,s8
80008862:	9482                	jalr	s1
80008864:	5afd                	li	s5,-1
80008866:	4981                	li	s3,0
80008868:	df5506e3          	beq	a0,s5,80008654 <_printf_float+0x10a>
8000886c:	57d2                	lw	a5,52(sp)
8000886e:	40f007b3          	neg	a5,a5
80008872:	00f9cb63          	blt	s3,a5,80008888 <_printf_float+0x33e>
80008876:	86d2                	mv	a3,s4
80008878:	864a                	mv	a2,s2
8000887a:	85e6                	mv	a1,s9
8000887c:	8562                	mv	a0,s8
8000887e:	9482                	jalr	s1
80008880:	57fd                	li	a5,-1
80008882:	f8f513e3          	bne	a0,a5,80008808 <_printf_float+0x2be>
80008886:	b3f9                	j	80008654 <_printf_float+0x10a>
80008888:	4685                	li	a3,1
8000888a:	01a40613          	addi	a2,s0,26
8000888e:	85e6                	mv	a1,s9
80008890:	8562                	mv	a0,s8
80008892:	9482                	jalr	s1
80008894:	dd5500e3          	beq	a0,s5,80008654 <_printf_float+0x10a>
80008898:	0985                	addi	s3,s3,1
8000889a:	bfc9                	j	8000886c <_printf_float+0x322>
8000889c:	5a62                	lw	s4,56(sp)
8000889e:	05842983          	lw	s3,88(s0)
800088a2:	013a5363          	bge	s4,s3,800088a8 <_printf_float+0x35e>
800088a6:	89d2                	mv	s3,s4
800088a8:	01305a63          	blez	s3,800088bc <_printf_float+0x372>
800088ac:	86ce                	mv	a3,s3
800088ae:	864a                	mv	a2,s2
800088b0:	85e6                	mv	a1,s9
800088b2:	8562                	mv	a0,s8
800088b4:	9482                	jalr	s1
800088b6:	57fd                	li	a5,-1
800088b8:	d8f50ee3          	beq	a0,a5,80008654 <_printf_float+0x10a>
800088bc:	fff9c793          	not	a5,s3
800088c0:	87fd                	srai	a5,a5,0x1f
800088c2:	00f9f9b3          	and	s3,s3,a5
800088c6:	4b01                	li	s6,0
800088c8:	01a40613          	addi	a2,s0,26
800088cc:	5bfd                	li	s7,-1
800088ce:	05842a83          	lw	s5,88(s0)
800088d2:	413a87b3          	sub	a5,s5,s3
800088d6:	06fb4b63          	blt	s6,a5,8000894c <_printf_float+0x402>
800088da:	57d2                	lw	a5,52(sp)
800088dc:	0147c563          	blt	a5,s4,800088e6 <_printf_float+0x39c>
800088e0:	401c                	lw	a5,0(s0)
800088e2:	8b85                	andi	a5,a5,1
800088e4:	cb89                	beqz	a5,800088f6 <_printf_float+0x3ac>
800088e6:	86ee                	mv	a3,s11
800088e8:	866a                	mv	a2,s10
800088ea:	85e6                	mv	a1,s9
800088ec:	8562                	mv	a0,s8
800088ee:	9482                	jalr	s1
800088f0:	57fd                	li	a5,-1
800088f2:	d6f501e3          	beq	a0,a5,80008654 <_printf_float+0x10a>
800088f6:	59d2                	lw	s3,52(sp)
800088f8:	415a07b3          	sub	a5,s4,s5
800088fc:	413a09b3          	sub	s3,s4,s3
80008900:	0137d363          	bge	a5,s3,80008906 <_printf_float+0x3bc>
80008904:	89be                	mv	s3,a5
80008906:	01305b63          	blez	s3,8000891c <_printf_float+0x3d2>
8000890a:	86ce                	mv	a3,s3
8000890c:	01590633          	add	a2,s2,s5
80008910:	85e6                	mv	a1,s9
80008912:	8562                	mv	a0,s8
80008914:	9482                	jalr	s1
80008916:	57fd                	li	a5,-1
80008918:	d2f50ee3          	beq	a0,a5,80008654 <_printf_float+0x10a>
8000891c:	fff9c793          	not	a5,s3
80008920:	87fd                	srai	a5,a5,0x1f
80008922:	00f9f9b3          	and	s3,s3,a5
80008926:	4901                	li	s2,0
80008928:	5b7d                	li	s6,-1
8000892a:	57d2                	lw	a5,52(sp)
8000892c:	40fa07b3          	sub	a5,s4,a5
80008930:	413787b3          	sub	a5,a5,s3
80008934:	ecf95ae3          	bge	s2,a5,80008808 <_printf_float+0x2be>
80008938:	4685                	li	a3,1
8000893a:	01a40613          	addi	a2,s0,26
8000893e:	85e6                	mv	a1,s9
80008940:	8562                	mv	a0,s8
80008942:	9482                	jalr	s1
80008944:	d16508e3          	beq	a0,s6,80008654 <_printf_float+0x10a>
80008948:	0905                	addi	s2,s2,1
8000894a:	b7c5                	j	8000892a <_printf_float+0x3e0>
8000894c:	4685                	li	a3,1
8000894e:	85e6                	mv	a1,s9
80008950:	8562                	mv	a0,s8
80008952:	cc32                	sw	a2,24(sp)
80008954:	9482                	jalr	s1
80008956:	cf750fe3          	beq	a0,s7,80008654 <_printf_float+0x10a>
8000895a:	4662                	lw	a2,24(sp)
8000895c:	0b05                	addi	s6,s6,1
8000895e:	bf85                	j	800088ce <_printf_float+0x384>
80008960:	59e2                	lw	s3,56(sp)
80008962:	4685                	li	a3,1
80008964:	0136c463          	blt	a3,s3,8000896c <_printf_float+0x422>
80008968:	8ff5                	and	a5,a5,a3
8000896a:	c3b5                	beqz	a5,800089ce <_printf_float+0x484>
8000896c:	4685                	li	a3,1
8000896e:	864a                	mv	a2,s2
80008970:	85e6                	mv	a1,s9
80008972:	8562                	mv	a0,s8
80008974:	9482                	jalr	s1
80008976:	5afd                	li	s5,-1
80008978:	cd550ee3          	beq	a0,s5,80008654 <_printf_float+0x10a>
8000897c:	86ee                	mv	a3,s11
8000897e:	866a                	mv	a2,s10
80008980:	85e6                	mv	a1,s9
80008982:	8562                	mv	a0,s8
80008984:	9482                	jalr	s1
80008986:	cd5507e3          	beq	a0,s5,80008654 <_printf_float+0x10a>
8000898a:	4428                	lw	a0,72(s0)
8000898c:	446c                	lw	a1,76(s0)
8000898e:	4601                	li	a2,0
80008990:	4681                	li	a3,0
80008992:	99d6                	add	s3,s3,s5
80008994:	c54fc0ef          	jal	80004de8 <__eqdf2>
80008998:	c90d                	beqz	a0,800089ca <_printf_float+0x480>
8000899a:	86ce                	mv	a3,s3
8000899c:	00190613          	addi	a2,s2,1
800089a0:	85e6                	mv	a1,s9
800089a2:	8562                	mv	a0,s8
800089a4:	9482                	jalr	s1
800089a6:	01551e63          	bne	a0,s5,800089c2 <_printf_float+0x478>
800089aa:	b16d                	j	80008654 <_printf_float+0x10a>
800089ac:	4685                	li	a3,1
800089ae:	01a40613          	addi	a2,s0,26
800089b2:	85e6                	mv	a1,s9
800089b4:	8562                	mv	a0,s8
800089b6:	9482                	jalr	s1
800089b8:	c9550ee3          	beq	a0,s5,80008654 <_printf_float+0x10a>
800089bc:	0905                	addi	s2,s2,1
800089be:	ff3947e3          	blt	s2,s3,800089ac <_printf_float+0x462>
800089c2:	86d2                	mv	a3,s4
800089c4:	05040613          	addi	a2,s0,80
800089c8:	bd4d                	j	8000887a <_printf_float+0x330>
800089ca:	4901                	li	s2,0
800089cc:	bfcd                	j	800089be <_printf_float+0x474>
800089ce:	864a                	mv	a2,s2
800089d0:	bfc1                	j	800089a0 <_printf_float+0x456>
800089d2:	4685                	li	a3,1
800089d4:	01940613          	addi	a2,s0,25
800089d8:	85e6                	mv	a1,s9
800089da:	8562                	mv	a0,s8
800089dc:	9482                	jalr	s1
800089de:	c7450be3          	beq	a0,s4,80008654 <_printf_float+0x10a>
800089e2:	0905                	addi	s2,s2,1
800089e4:	445c                	lw	a5,12(s0)
800089e6:	5772                	lw	a4,60(sp)
800089e8:	8f99                	sub	a5,a5,a4
800089ea:	fef944e3          	blt	s2,a5,800089d2 <_printf_float+0x488>
800089ee:	b50d                	j	80008810 <_printf_float+0x2c6>
800089f0:	4901                	li	s2,0
800089f2:	5a7d                	li	s4,-1
800089f4:	bfc5                	j	800089e4 <_printf_float+0x49a>

800089f6 <_printf_common>:
800089f6:	7179                	addi	sp,sp,-48
800089f8:	d04a                	sw	s2,32(sp)
800089fa:	499c                	lw	a5,16(a1)
800089fc:	893a                	mv	s2,a4
800089fe:	4598                	lw	a4,8(a1)
80008a00:	d422                	sw	s0,40(sp)
80008a02:	ce4e                	sw	s3,28(sp)
80008a04:	c85a                	sw	s6,16(sp)
80008a06:	c65e                	sw	s7,12(sp)
80008a08:	d606                	sw	ra,44(sp)
80008a0a:	d226                	sw	s1,36(sp)
80008a0c:	cc52                	sw	s4,24(sp)
80008a0e:	ca56                	sw	s5,20(sp)
80008a10:	8b2a                	mv	s6,a0
80008a12:	842e                	mv	s0,a1
80008a14:	89b2                	mv	s3,a2
80008a16:	8bb6                	mv	s7,a3
80008a18:	00e7d363          	bge	a5,a4,80008a1e <_printf_common+0x28>
80008a1c:	87ba                	mv	a5,a4
80008a1e:	00f9a023          	sw	a5,0(s3)
80008a22:	04344703          	lbu	a4,67(s0)
80008a26:	c701                	beqz	a4,80008a2e <_printf_common+0x38>
80008a28:	0785                	addi	a5,a5,1
80008a2a:	00f9a023          	sw	a5,0(s3)
80008a2e:	401c                	lw	a5,0(s0)
80008a30:	0207f793          	andi	a5,a5,32
80008a34:	c791                	beqz	a5,80008a40 <_printf_common+0x4a>
80008a36:	0009a783          	lw	a5,0(s3)
80008a3a:	0789                	addi	a5,a5,2
80008a3c:	00f9a023          	sw	a5,0(s3)
80008a40:	4004                	lw	s1,0(s0)
80008a42:	8899                	andi	s1,s1,6
80008a44:	e891                	bnez	s1,80008a58 <_printf_common+0x62>
80008a46:	01940a13          	addi	s4,s0,25
80008a4a:	5afd                	li	s5,-1
80008a4c:	445c                	lw	a5,12(s0)
80008a4e:	0009a703          	lw	a4,0(s3)
80008a52:	8f99                	sub	a5,a5,a4
80008a54:	06f4c763          	blt	s1,a5,80008ac2 <_printf_common+0xcc>
80008a58:	401c                	lw	a5,0(s0)
80008a5a:	04344683          	lbu	a3,67(s0)
80008a5e:	0207f793          	andi	a5,a5,32
80008a62:	00d036b3          	snez	a3,a3
80008a66:	e7bd                	bnez	a5,80008ad4 <_printf_common+0xde>
80008a68:	04340613          	addi	a2,s0,67
80008a6c:	85de                	mv	a1,s7
80008a6e:	855a                	mv	a0,s6
80008a70:	9902                	jalr	s2
80008a72:	57fd                	li	a5,-1
80008a74:	02f50c63          	beq	a0,a5,80008aac <_printf_common+0xb6>
80008a78:	401c                	lw	a5,0(s0)
80008a7a:	4711                	li	a4,4
80008a7c:	4481                	li	s1,0
80008a7e:	8b99                	andi	a5,a5,6
80008a80:	00e79a63          	bne	a5,a4,80008a94 <_printf_common+0x9e>
80008a84:	0009a783          	lw	a5,0(s3)
80008a88:	4444                	lw	s1,12(s0)
80008a8a:	8c9d                	sub	s1,s1,a5
80008a8c:	fff4c793          	not	a5,s1
80008a90:	87fd                	srai	a5,a5,0x1f
80008a92:	8cfd                	and	s1,s1,a5
80008a94:	441c                	lw	a5,8(s0)
80008a96:	4818                	lw	a4,16(s0)
80008a98:	00f75463          	bge	a4,a5,80008aa0 <_printf_common+0xaa>
80008a9c:	8f99                	sub	a5,a5,a4
80008a9e:	94be                	add	s1,s1,a5
80008aa0:	4981                	li	s3,0
80008aa2:	0469                	addi	s0,s0,26
80008aa4:	5a7d                	li	s4,-1
80008aa6:	05349663          	bne	s1,s3,80008af2 <_printf_common+0xfc>
80008aaa:	4501                	li	a0,0
80008aac:	50b2                	lw	ra,44(sp)
80008aae:	5422                	lw	s0,40(sp)
80008ab0:	5492                	lw	s1,36(sp)
80008ab2:	5902                	lw	s2,32(sp)
80008ab4:	49f2                	lw	s3,28(sp)
80008ab6:	4a62                	lw	s4,24(sp)
80008ab8:	4ad2                	lw	s5,20(sp)
80008aba:	4b42                	lw	s6,16(sp)
80008abc:	4bb2                	lw	s7,12(sp)
80008abe:	6145                	addi	sp,sp,48
80008ac0:	8082                	ret
80008ac2:	4685                	li	a3,1
80008ac4:	8652                	mv	a2,s4
80008ac6:	85de                	mv	a1,s7
80008ac8:	855a                	mv	a0,s6
80008aca:	9902                	jalr	s2
80008acc:	ff5500e3          	beq	a0,s5,80008aac <_printf_common+0xb6>
80008ad0:	0485                	addi	s1,s1,1 # 800001 <_flash_size+0x1>
80008ad2:	bfad                	j	80008a4c <_printf_common+0x56>
80008ad4:	00d40733          	add	a4,s0,a3
80008ad8:	03000613          	li	a2,48
80008adc:	04c701a3          	sb	a2,67(a4)
80008ae0:	04544703          	lbu	a4,69(s0)
80008ae4:	00168793          	addi	a5,a3,1
80008ae8:	97a2                	add	a5,a5,s0
80008aea:	0689                	addi	a3,a3,2
80008aec:	04e781a3          	sb	a4,67(a5)
80008af0:	bfa5                	j	80008a68 <_printf_common+0x72>
80008af2:	4685                	li	a3,1
80008af4:	8622                	mv	a2,s0
80008af6:	85de                	mv	a1,s7
80008af8:	855a                	mv	a0,s6
80008afa:	9902                	jalr	s2
80008afc:	fb4508e3          	beq	a0,s4,80008aac <_printf_common+0xb6>
80008b00:	0985                	addi	s3,s3,1
80008b02:	b755                	j	80008aa6 <_printf_common+0xb0>

80008b04 <_printf_i>:
80008b04:	7139                	addi	sp,sp,-64
80008b06:	dc22                	sw	s0,56(sp)
80008b08:	da26                	sw	s1,52(sp)
80008b0a:	d452                	sw	s4,40(sp)
80008b0c:	d256                	sw	s5,36(sp)
80008b0e:	de06                	sw	ra,60(sp)
80008b10:	d84a                	sw	s2,48(sp)
80008b12:	d64e                	sw	s3,44(sp)
80008b14:	0185c783          	lbu	a5,24(a1)
80008b18:	84b6                	mv	s1,a3
80008b1a:	07800693          	li	a3,120
80008b1e:	8a2a                	mv	s4,a0
80008b20:	842e                	mv	s0,a1
80008b22:	8ab2                	mv	s5,a2
80008b24:	00f6ee63          	bltu	a3,a5,80008b40 <_printf_i+0x3c>
80008b28:	06200693          	li	a3,98
80008b2c:	04358613          	addi	a2,a1,67
80008b30:	00f6eb63          	bltu	a3,a5,80008b46 <_printf_i+0x42>
80008b34:	1e078263          	beqz	a5,80008d18 <_printf_i+0x214>
80008b38:	05800693          	li	a3,88
80008b3c:	16d78263          	beq	a5,a3,80008ca0 <_printf_i+0x19c>
80008b40:	04240913          	addi	s2,s0,66
80008b44:	a03d                	j	80008b72 <_printf_i+0x6e>
80008b46:	f9d78693          	addi	a3,a5,-99
80008b4a:	0ff6f693          	zext.b	a3,a3
80008b4e:	45d5                	li	a1,21
80008b50:	fed5e8e3          	bltu	a1,a3,80008b40 <_printf_i+0x3c>
80008b54:	8000e5b7          	lui	a1,0x8000e
80008b58:	068a                	slli	a3,a3,0x2
80008b5a:	c0458593          	addi	a1,a1,-1020 # 8000dc04 <s_wdgs+0x22c>
80008b5e:	96ae                	add	a3,a3,a1
80008b60:	4294                	lw	a3,0(a3)
80008b62:	8682                	jr	a3
80008b64:	431c                	lw	a5,0(a4)
80008b66:	04240913          	addi	s2,s0,66
80008b6a:	00478693          	addi	a3,a5,4
80008b6e:	439c                	lw	a5,0(a5)
80008b70:	c314                	sw	a3,0(a4)
80008b72:	04f40123          	sb	a5,66(s0)
80008b76:	4785                	li	a5,1
80008b78:	a2d9                	j	80008d3e <_printf_i+0x23a>
80008b7a:	401c                	lw	a5,0(s0)
80008b7c:	4308                	lw	a0,0(a4)
80008b7e:	0807f693          	andi	a3,a5,128
80008b82:	00450593          	addi	a1,a0,4
80008b86:	c28d                	beqz	a3,80008ba8 <_printf_i+0xa4>
80008b88:	411c                	lw	a5,0(a0)
80008b8a:	c30c                	sw	a1,0(a4)
80008b8c:	8000e6b7          	lui	a3,0x8000e
80008b90:	0007d863          	bgez	a5,80008ba0 <_printf_i+0x9c>
80008b94:	02d00713          	li	a4,45
80008b98:	40f007b3          	neg	a5,a5
80008b9c:	04e401a3          	sb	a4,67(s0)
80008ba0:	a3c68693          	addi	a3,a3,-1476 # 8000da3c <s_wdgs+0x64>
80008ba4:	4729                	li	a4,10
80008ba6:	a0b1                	j	80008bf2 <_printf_i+0xee>
80008ba8:	0407f693          	andi	a3,a5,64
80008bac:	411c                	lw	a5,0(a0)
80008bae:	c30c                	sw	a1,0(a4)
80008bb0:	def1                	beqz	a3,80008b8c <_printf_i+0x88>
80008bb2:	07c2                	slli	a5,a5,0x10
80008bb4:	87c1                	srai	a5,a5,0x10
80008bb6:	bfd9                	j	80008b8c <_printf_i+0x88>
80008bb8:	4014                	lw	a3,0(s0)
80008bba:	431c                	lw	a5,0(a4)
80008bbc:	0806f513          	andi	a0,a3,128
80008bc0:	00478593          	addi	a1,a5,4
80008bc4:	c501                	beqz	a0,80008bcc <_printf_i+0xc8>
80008bc6:	c30c                	sw	a1,0(a4)
80008bc8:	439c                	lw	a5,0(a5)
80008bca:	a039                	j	80008bd8 <_printf_i+0xd4>
80008bcc:	0406f693          	andi	a3,a3,64
80008bd0:	c30c                	sw	a1,0(a4)
80008bd2:	dafd                	beqz	a3,80008bc8 <_printf_i+0xc4>
80008bd4:	0007d783          	lhu	a5,0(a5)
80008bd8:	01844583          	lbu	a1,24(s0)
80008bdc:	8000e6b7          	lui	a3,0x8000e
80008be0:	06f00713          	li	a4,111
80008be4:	a3c68693          	addi	a3,a3,-1476 # 8000da3c <s_wdgs+0x64>
80008be8:	10e59263          	bne	a1,a4,80008cec <_printf_i+0x1e8>
80008bec:	4721                	li	a4,8
80008bee:	040401a3          	sb	zero,67(s0)
80008bf2:	404c                	lw	a1,4(s0)
80008bf4:	c40c                	sw	a1,8(s0)
80008bf6:	0005c863          	bltz	a1,80008c06 <_printf_i+0x102>
80008bfa:	4008                	lw	a0,0(s0)
80008bfc:	8ddd                	or	a1,a1,a5
80008bfe:	8932                	mv	s2,a2
80008c00:	996d                	andi	a0,a0,-5
80008c02:	c008                	sw	a0,0(s0)
80008c04:	cd99                	beqz	a1,80008c22 <_printf_i+0x11e>
80008c06:	8932                	mv	s2,a2
80008c08:	02e7f5b3          	remu	a1,a5,a4
80008c0c:	197d                	addi	s2,s2,-1
80008c0e:	95b6                	add	a1,a1,a3
80008c10:	0005c583          	lbu	a1,0(a1)
80008c14:	00b90023          	sb	a1,0(s2)
80008c18:	85be                	mv	a1,a5
80008c1a:	02e7d7b3          	divu	a5,a5,a4
80008c1e:	fee5f5e3          	bgeu	a1,a4,80008c08 <_printf_i+0x104>
80008c22:	47a1                	li	a5,8
80008c24:	00f71e63          	bne	a4,a5,80008c40 <_printf_i+0x13c>
80008c28:	401c                	lw	a5,0(s0)
80008c2a:	8b85                	andi	a5,a5,1
80008c2c:	cb91                	beqz	a5,80008c40 <_printf_i+0x13c>
80008c2e:	4058                	lw	a4,4(s0)
80008c30:	481c                	lw	a5,16(s0)
80008c32:	00e7c763          	blt	a5,a4,80008c40 <_printf_i+0x13c>
80008c36:	03000793          	li	a5,48
80008c3a:	fef90fa3          	sb	a5,-1(s2)
80008c3e:	197d                	addi	s2,s2,-1
80008c40:	41260633          	sub	a2,a2,s2
80008c44:	c810                	sw	a2,16(s0)
80008c46:	8726                	mv	a4,s1
80008c48:	86d6                	mv	a3,s5
80008c4a:	0870                	addi	a2,sp,28
80008c4c:	85a2                	mv	a1,s0
80008c4e:	8552                	mv	a0,s4
80008c50:	335d                	jal	800089f6 <_printf_common>
80008c52:	59fd                	li	s3,-1
80008c54:	03350263          	beq	a0,s3,80008c78 <_printf_i+0x174>
80008c58:	4814                	lw	a3,16(s0)
80008c5a:	864a                	mv	a2,s2
80008c5c:	85d6                	mv	a1,s5
80008c5e:	8552                	mv	a0,s4
80008c60:	9482                	jalr	s1
80008c62:	01350b63          	beq	a0,s3,80008c78 <_printf_i+0x174>
80008c66:	401c                	lw	a5,0(s0)
80008c68:	8b89                	andi	a5,a5,2
80008c6a:	0e079d63          	bnez	a5,80008d64 <_printf_i+0x260>
80008c6e:	47f2                	lw	a5,28(sp)
80008c70:	4448                	lw	a0,12(s0)
80008c72:	00f55363          	bge	a0,a5,80008c78 <_printf_i+0x174>
80008c76:	853e                	mv	a0,a5
80008c78:	50f2                	lw	ra,60(sp)
80008c7a:	5462                	lw	s0,56(sp)
80008c7c:	54d2                	lw	s1,52(sp)
80008c7e:	5942                	lw	s2,48(sp)
80008c80:	59b2                	lw	s3,44(sp)
80008c82:	5a22                	lw	s4,40(sp)
80008c84:	5a92                	lw	s5,36(sp)
80008c86:	6121                	addi	sp,sp,64
80008c88:	8082                	ret
80008c8a:	401c                	lw	a5,0(s0)
80008c8c:	0207e793          	ori	a5,a5,32
80008c90:	c01c                	sw	a5,0(s0)
80008c92:	07800793          	li	a5,120
80008c96:	8000e6b7          	lui	a3,0x8000e
80008c9a:	a5068693          	addi	a3,a3,-1456 # 8000da50 <s_wdgs+0x78>
80008c9e:	a029                	j	80008ca8 <_printf_i+0x1a4>
80008ca0:	8000e6b7          	lui	a3,0x8000e
80008ca4:	a3c68693          	addi	a3,a3,-1476 # 8000da3c <s_wdgs+0x64>
80008ca8:	400c                	lw	a1,0(s0)
80008caa:	04f402a3          	sb	a5,69(s0)
80008cae:	431c                	lw	a5,0(a4)
80008cb0:	0805f813          	andi	a6,a1,128
80008cb4:	00478513          	addi	a0,a5,4
80008cb8:	00080563          	beqz	a6,80008cc2 <_printf_i+0x1be>
80008cbc:	c308                	sw	a0,0(a4)
80008cbe:	439c                	lw	a5,0(a5)
80008cc0:	a801                	j	80008cd0 <_printf_i+0x1cc>
80008cc2:	0405f813          	andi	a6,a1,64
80008cc6:	c308                	sw	a0,0(a4)
80008cc8:	fe080be3          	beqz	a6,80008cbe <_printf_i+0x1ba>
80008ccc:	0007d783          	lhu	a5,0(a5)
80008cd0:	0015f713          	andi	a4,a1,1
80008cd4:	c701                	beqz	a4,80008cdc <_printf_i+0x1d8>
80008cd6:	0205e593          	ori	a1,a1,32
80008cda:	c00c                	sw	a1,0(s0)
80008cdc:	c399                	beqz	a5,80008ce2 <_printf_i+0x1de>
80008cde:	4741                	li	a4,16
80008ce0:	b739                	j	80008bee <_printf_i+0xea>
80008ce2:	4018                	lw	a4,0(s0)
80008ce4:	fdf77713          	andi	a4,a4,-33
80008ce8:	c018                	sw	a4,0(s0)
80008cea:	bfd5                	j	80008cde <_printf_i+0x1da>
80008cec:	4729                	li	a4,10
80008cee:	b701                	j	80008bee <_printf_i+0xea>
80008cf0:	4014                	lw	a3,0(s0)
80008cf2:	431c                	lw	a5,0(a4)
80008cf4:	484c                	lw	a1,20(s0)
80008cf6:	0806f813          	andi	a6,a3,128
80008cfa:	00478513          	addi	a0,a5,4
80008cfe:	00080663          	beqz	a6,80008d0a <_printf_i+0x206>
80008d02:	c308                	sw	a0,0(a4)
80008d04:	439c                	lw	a5,0(a5)
80008d06:	c38c                	sw	a1,0(a5)
80008d08:	a801                	j	80008d18 <_printf_i+0x214>
80008d0a:	c308                	sw	a0,0(a4)
80008d0c:	0406f693          	andi	a3,a3,64
80008d10:	439c                	lw	a5,0(a5)
80008d12:	daf5                	beqz	a3,80008d06 <_printf_i+0x202>
80008d14:	00b79023          	sh	a1,0(a5)
80008d18:	00042823          	sw	zero,16(s0)
80008d1c:	8932                	mv	s2,a2
80008d1e:	b725                	j	80008c46 <_printf_i+0x142>
80008d20:	431c                	lw	a5,0(a4)
80008d22:	4050                	lw	a2,4(s0)
80008d24:	4581                	li	a1,0
80008d26:	00478693          	addi	a3,a5,4
80008d2a:	c314                	sw	a3,0(a4)
80008d2c:	0007a903          	lw	s2,0(a5)
80008d30:	854a                	mv	a0,s2
80008d32:	2575                	jal	800093de <memchr>
80008d34:	c501                	beqz	a0,80008d3c <_printf_i+0x238>
80008d36:	41250533          	sub	a0,a0,s2
80008d3a:	c048                	sw	a0,4(s0)
80008d3c:	405c                	lw	a5,4(s0)
80008d3e:	c81c                	sw	a5,16(s0)
80008d40:	040401a3          	sb	zero,67(s0)
80008d44:	b709                	j	80008c46 <_printf_i+0x142>
80008d46:	4685                	li	a3,1
80008d48:	85d6                	mv	a1,s5
80008d4a:	8552                	mv	a0,s4
80008d4c:	c632                	sw	a2,12(sp)
80008d4e:	9482                	jalr	s1
80008d50:	f33504e3          	beq	a0,s3,80008c78 <_printf_i+0x174>
80008d54:	4632                	lw	a2,12(sp)
80008d56:	0905                	addi	s2,s2,1
80008d58:	445c                	lw	a5,12(s0)
80008d5a:	4772                	lw	a4,28(sp)
80008d5c:	8f99                	sub	a5,a5,a4
80008d5e:	fef944e3          	blt	s2,a5,80008d46 <_printf_i+0x242>
80008d62:	b731                	j	80008c6e <_printf_i+0x16a>
80008d64:	4901                	li	s2,0
80008d66:	01940613          	addi	a2,s0,25
80008d6a:	b7fd                	j	80008d58 <_printf_i+0x254>

80008d6c <_scanf_float>:
80008d6c:	459c                	lw	a5,8(a1)
80008d6e:	711d                	addi	sp,sp,-96
80008d70:	cca2                	sw	s0,88(sp)
80008d72:	c6ce                	sw	s3,76(sp)
80008d74:	c0da                	sw	s6,64(sp)
80008d76:	d66e                	sw	s11,44(sp)
80008d78:	8b36                	mv	s6,a3
80008d7a:	ce86                	sw	ra,92(sp)
80008d7c:	caa6                	sw	s1,84(sp)
80008d7e:	c8ca                	sw	s2,80(sp)
80008d80:	c4d2                	sw	s4,72(sp)
80008d82:	c2d6                	sw	s5,68(sp)
80008d84:	de5e                	sw	s7,60(sp)
80008d86:	dc62                	sw	s8,56(sp)
80008d88:	da66                	sw	s9,52(sp)
80008d8a:	d86a                	sw	s10,48(sp)
80008d8c:	c42a                	sw	a0,8(sp)
80008d8e:	fff78693          	addi	a3,a5,-1
80008d92:	15c00713          	li	a4,348
80008d96:	842e                	mv	s0,a1
80008d98:	89b2                	mv	s3,a2
80008d9a:	4d81                	li	s11,0
80008d9c:	00d77763          	bgeu	a4,a3,80008daa <_scanf_float+0x3e>
80008da0:	ea378d93          	addi	s11,a5,-349
80008da4:	15d00793          	li	a5,349
80008da8:	c59c                	sw	a5,8(a1)
80008daa:	401c                	lw	a5,0(s0)
80008dac:	01c40a93          	addi	s5,s0,28
80008db0:	8000e6b7          	lui	a3,0x8000e
80008db4:	7807e793          	ori	a5,a5,1920
80008db8:	8000e637          	lui	a2,0x8000e
80008dbc:	8000e837          	lui	a6,0x8000e
80008dc0:	c01c                	sw	a5,0(s0)
80008dc2:	84d6                	mv	s1,s5
80008dc4:	4901                	li	s2,0
80008dc6:	4d01                	li	s10,0
80008dc8:	4b81                	li	s7,0
80008dca:	4c01                	li	s8,0
80008dcc:	4c81                	li	s9,0
80008dce:	4a01                	li	s4,0
80008dd0:	04e00893          	li	a7,78
80008dd4:	c5c68693          	addi	a3,a3,-932 # 8000dc5c <s_wdgs+0x284>
80008dd8:	c5c60613          	addi	a2,a2,-932 # 8000dc5c <s_wdgs+0x284>
80008ddc:	c9480813          	addi	a6,a6,-876 # 8000dc94 <s_wdgs+0x2bc>
80008de0:	440c                	lw	a1,8(s0)
80008de2:	c195                	beqz	a1,80008e06 <_scanf_float+0x9a>
80008de4:	0009a783          	lw	a5,0(s3)
80008de8:	0007c783          	lbu	a5,0(a5)
80008dec:	08f8e363          	bltu	a7,a5,80008e72 <_scanf_float+0x106>
80008df0:	04000713          	li	a4,64
80008df4:	06f76163          	bltu	a4,a5,80008e56 <_scanf_float+0xea>
80008df8:	fd578713          	addi	a4,a5,-43
80008dfc:	0ff77713          	zext.b	a4,a4
80008e00:	4539                	li	a0,14
80008e02:	06e57463          	bgeu	a0,a4,80008e6a <_scanf_float+0xfe>
80008e06:	000c8663          	beqz	s9,80008e12 <_scanf_float+0xa6>
80008e0a:	401c                	lw	a5,0(s0)
80008e0c:	eff7f793          	andi	a5,a5,-257
80008e10:	c01c                	sw	a5,0(s0)
80008e12:	1d7d                	addi	s10,s10,-1
80008e14:	4785                	li	a5,1
80008e16:	21a7ea63          	bltu	a5,s10,8000902a <_scanf_float+0x2be>
80008e1a:	1e9aec63          	bltu	s5,s1,80009012 <_scanf_float+0x2a6>
80008e1e:	4d05                	li	s10,1
80008e20:	40f6                	lw	ra,92(sp)
80008e22:	4466                	lw	s0,88(sp)
80008e24:	44d6                	lw	s1,84(sp)
80008e26:	4946                	lw	s2,80(sp)
80008e28:	49b6                	lw	s3,76(sp)
80008e2a:	4a26                	lw	s4,72(sp)
80008e2c:	4a96                	lw	s5,68(sp)
80008e2e:	4b06                	lw	s6,64(sp)
80008e30:	5bf2                	lw	s7,60(sp)
80008e32:	5c62                	lw	s8,56(sp)
80008e34:	5cd2                	lw	s9,52(sp)
80008e36:	5db2                	lw	s11,44(sp)
80008e38:	856a                	mv	a0,s10
80008e3a:	5d42                	lw	s10,48(sp)
80008e3c:	6125                	addi	sp,sp,96
80008e3e:	8082                	ret
80008e40:	f9f78713          	addi	a4,a5,-97
80008e44:	0ff77713          	zext.b	a4,a4
80008e48:	45b5                	li	a1,13
80008e4a:	fae5eee3          	bltu	a1,a4,80008e06 <_scanf_float+0x9a>
80008e4e:	070a                	slli	a4,a4,0x2
80008e50:	9736                	add	a4,a4,a3
80008e52:	4318                	lw	a4,0(a4)
80008e54:	8702                	jr	a4
80008e56:	fbf78713          	addi	a4,a5,-65
80008e5a:	0ff77713          	zext.b	a4,a4
80008e5e:	45b5                	li	a1,13
80008e60:	fae5e3e3          	bltu	a1,a4,80008e06 <_scanf_float+0x9a>
80008e64:	070a                	slli	a4,a4,0x2
80008e66:	9732                	add	a4,a4,a2
80008e68:	b7ed                	j	80008e52 <_scanf_float+0xe6>
80008e6a:	070a                	slli	a4,a4,0x2
80008e6c:	9742                	add	a4,a4,a6
80008e6e:	4318                	lw	a4,0(a4)
80008e70:	8702                	jr	a4
80008e72:	06e00713          	li	a4,110
80008e76:	02f76363          	bltu	a4,a5,80008e9c <_scanf_float+0x130>
80008e7a:	06000713          	li	a4,96
80008e7e:	fcf761e3          	bltu	a4,a5,80008e40 <_scanf_float+0xd4>
80008e82:	05400713          	li	a4,84
80008e86:	10e78663          	beq	a5,a4,80008f92 <_scanf_float+0x226>
80008e8a:	05900713          	li	a4,89
80008e8e:	f6e79ce3          	bne	a5,a4,80008e06 <_scanf_float+0x9a>
80008e92:	471d                	li	a4,7
80008e94:	f6e919e3          	bne	s2,a4,80008e06 <_scanf_float+0x9a>
80008e98:	4921                	li	s2,8
80008e9a:	a08d                	j	80008efc <_scanf_float+0x190>
80008e9c:	07400713          	li	a4,116
80008ea0:	0ee78963          	beq	a5,a4,80008f92 <_scanf_float+0x226>
80008ea4:	07900713          	li	a4,121
80008ea8:	b7dd                	j	80008e8e <_scanf_float+0x122>
80008eaa:	4018                	lw	a4,0(s0)
80008eac:	10077513          	andi	a0,a4,256
80008eb0:	cd0d                	beqz	a0,80008eea <_scanf_float+0x17e>
80008eb2:	f7f77713          	andi	a4,a4,-129
80008eb6:	c018                	sw	a4,0(s0)
80008eb8:	0c85                	addi	s9,s9,1
80008eba:	000d8563          	beqz	s11,80008ec4 <_scanf_float+0x158>
80008ebe:	0585                	addi	a1,a1,1
80008ec0:	1dfd                	addi	s11,s11,-1
80008ec2:	c40c                	sw	a1,8(s0)
80008ec4:	441c                	lw	a5,8(s0)
80008ec6:	17fd                	addi	a5,a5,-1
80008ec8:	c41c                	sw	a5,8(s0)
80008eca:	481c                	lw	a5,16(s0)
80008ecc:	0785                	addi	a5,a5,1
80008ece:	c81c                	sw	a5,16(s0)
80008ed0:	0049a783          	lw	a5,4(s3)
80008ed4:	17fd                	addi	a5,a5,-1
80008ed6:	00f9a223          	sw	a5,4(s3)
80008eda:	10f05663          	blez	a5,80008fe6 <_scanf_float+0x27a>
80008ede:	0009a783          	lw	a5,0(s3)
80008ee2:	0785                	addi	a5,a5,1
80008ee4:	00f9a023          	sw	a5,0(s3)
80008ee8:	bde5                	j	80008de0 <_scanf_float+0x74>
80008eea:	012d0733          	add	a4,s10,s2
80008eee:	ff01                	bnez	a4,80008e06 <_scanf_float+0x9a>
80008ef0:	4018                	lw	a4,0(s0)
80008ef2:	4901                	li	s2,0
80008ef4:	4d01                	li	s10,0
80008ef6:	e7f77713          	andi	a4,a4,-385
80008efa:	c018                	sw	a4,0(s0)
80008efc:	00f48023          	sb	a5,0(s1)
80008f00:	0485                	addi	s1,s1,1
80008f02:	b7c9                	j	80008ec4 <_scanf_float+0x158>
80008f04:	4018                	lw	a4,0(s0)
80008f06:	08077593          	andi	a1,a4,128
80008f0a:	ee058ee3          	beqz	a1,80008e06 <_scanf_float+0x9a>
80008f0e:	f7f77713          	andi	a4,a4,-129
80008f12:	c018                	sw	a4,0(s0)
80008f14:	b7e5                	j	80008efc <_scanf_float+0x190>
80008f16:	020d1063          	bnez	s10,80008f36 <_scanf_float+0x1ca>
80008f1a:	020c9163          	bnez	s9,80008f3c <_scanf_float+0x1d0>
80008f1e:	4018                	lw	a4,0(s0)
80008f20:	70000593          	li	a1,1792
80008f24:	70077513          	andi	a0,a4,1792
80008f28:	00b51a63          	bne	a0,a1,80008f3c <_scanf_float+0x1d0>
80008f2c:	87f77713          	andi	a4,a4,-1921
80008f30:	c018                	sw	a4,0(s0)
80008f32:	4d05                	li	s10,1
80008f34:	b7e1                	j	80008efc <_scanf_float+0x190>
80008f36:	4709                	li	a4,2
80008f38:	0aed0563          	beq	s10,a4,80008fe2 <_scanf_float+0x276>
80008f3c:	4749                	li	a4,18
80008f3e:	01275733          	srl	a4,a4,s2
80008f42:	8b05                	andi	a4,a4,1
80008f44:	ec0701e3          	beqz	a4,80008e06 <_scanf_float+0x9a>
80008f48:	0905                	addi	s2,s2,1
80008f4a:	0ff97913          	zext.b	s2,s2
80008f4e:	b77d                	j	80008efc <_scanf_float+0x190>
80008f50:	4705                	li	a4,1
80008f52:	eaed1ae3          	bne	s10,a4,80008e06 <_scanf_float+0x9a>
80008f56:	4d09                	li	s10,2
80008f58:	b755                	j	80008efc <_scanf_float+0x190>
80008f5a:	02091063          	bnez	s2,80008f7a <_scanf_float+0x20e>
80008f5e:	ea0c96e3          	bnez	s9,80008e0a <_scanf_float+0x9e>
80008f62:	4018                	lw	a4,0(s0)
80008f64:	70000593          	li	a1,1792
80008f68:	70077513          	andi	a0,a4,1792
80008f6c:	eab513e3          	bne	a0,a1,80008e12 <_scanf_float+0xa6>
80008f70:	87f77713          	andi	a4,a4,-1921
80008f74:	c018                	sw	a4,0(s0)
80008f76:	4905                	li	s2,1
80008f78:	b751                	j	80008efc <_scanf_float+0x190>
80008f7a:	ffd90713          	addi	a4,s2,-3
80008f7e:	0fd77713          	andi	a4,a4,253
80008f82:	e80712e3          	bnez	a4,80008e06 <_scanf_float+0x9a>
80008f86:	b7c9                	j	80008f48 <_scanf_float+0x1dc>
80008f88:	4709                	li	a4,2
80008f8a:	e6e91ee3          	bne	s2,a4,80008e06 <_scanf_float+0x9a>
80008f8e:	490d                	li	s2,3
80008f90:	b7b5                	j	80008efc <_scanf_float+0x190>
80008f92:	4719                	li	a4,6
80008f94:	e6e919e3          	bne	s2,a4,80008e06 <_scanf_float+0x9a>
80008f98:	491d                	li	s2,7
80008f9a:	b78d                	j	80008efc <_scanf_float+0x190>
80008f9c:	4018                	lw	a4,0(s0)
80008f9e:	20077593          	andi	a1,a4,512
80008fa2:	e60582e3          	beqz	a1,80008e06 <_scanf_float+0x9a>
80008fa6:	d7f77713          	andi	a4,a4,-641
80008faa:	c018                	sw	a4,0(s0)
80008fac:	8a66                	mv	s4,s9
80008fae:	b7b9                	j	80008efc <_scanf_float+0x190>
80008fb0:	4018                	lw	a4,0(s0)
80008fb2:	40000593          	li	a1,1024
80008fb6:	50077513          	andi	a0,a4,1280
80008fba:	00b50763          	beq	a0,a1,80008fc8 <_scanf_float+0x25c>
80008fbe:	8df9                	and	a1,a1,a4
80008fc0:	e40583e3          	beqz	a1,80008e06 <_scanf_float+0x9a>
80008fc4:	e40c87e3          	beqz	s9,80008e12 <_scanf_float+0xa6>
80008fc8:	20077593          	andi	a1,a4,512
80008fcc:	e581                	bnez	a1,80008fd4 <_scanf_float+0x268>
80008fce:	414c8c33          	sub	s8,s9,s4
80008fd2:	8ba6                	mv	s7,s1
80008fd4:	87f77713          	andi	a4,a4,-1921
80008fd8:	18076713          	ori	a4,a4,384
80008fdc:	c018                	sw	a4,0(s0)
80008fde:	4c81                	li	s9,0
80008fe0:	bf31                	j	80008efc <_scanf_float+0x190>
80008fe2:	4d0d                	li	s10,3
80008fe4:	bf21                	j	80008efc <_scanf_float+0x190>
80008fe6:	18042783          	lw	a5,384(s0)
80008fea:	4522                	lw	a0,8(sp)
80008fec:	85ce                	mv	a1,s3
80008fee:	9782                	jalr	a5
80008ff0:	8000e7b7          	lui	a5,0x8000e
80008ff4:	c5c78693          	addi	a3,a5,-932 # 8000dc5c <s_wdgs+0x284>
80008ff8:	8000e7b7          	lui	a5,0x8000e
80008ffc:	c5c78613          	addi	a2,a5,-932 # 8000dc5c <s_wdgs+0x284>
80009000:	8000e7b7          	lui	a5,0x8000e
80009004:	04e00893          	li	a7,78
80009008:	c9478813          	addi	a6,a5,-876 # 8000dc94 <s_wdgs+0x2bc>
8000900c:	dc050ae3          	beqz	a0,80008de0 <_scanf_float+0x74>
80009010:	bbdd                	j	80008e06 <_scanf_float+0x9a>
80009012:	17c42783          	lw	a5,380(s0)
80009016:	4522                	lw	a0,8(sp)
80009018:	fff4c583          	lbu	a1,-1(s1)
8000901c:	864e                	mv	a2,s3
8000901e:	14fd                	addi	s1,s1,-1
80009020:	9782                	jalr	a5
80009022:	481c                	lw	a5,16(s0)
80009024:	17fd                	addi	a5,a5,-1
80009026:	c81c                	sw	a5,16(s0)
80009028:	bbcd                	j	80008e1a <_scanf_float+0xae>
8000902a:	fff90793          	addi	a5,s2,-1
8000902e:	4719                	li	a4,6
80009030:	02f76463          	bltu	a4,a5,80009058 <_scanf_float+0x2ec>
80009034:	4789                	li	a5,2
80009036:	8d26                	mv	s10,s1
80009038:	0727fe63          	bgeu	a5,s2,800090b4 <_scanf_float+0x348>
8000903c:	40990733          	sub	a4,s2,s1
80009040:	4d8d                	li	s11,3
80009042:	00ed07b3          	add	a5,s10,a4
80009046:	0ff7f793          	zext.b	a5,a5
8000904a:	03b79c63          	bne	a5,s11,80009082 <_scanf_float+0x316>
8000904e:	1975                	addi	s2,s2,-3
80009050:	0ff97913          	zext.b	s2,s2
80009054:	412484b3          	sub	s1,s1,s2
80009058:	401c                	lw	a5,0(s0)
8000905a:	1007f713          	andi	a4,a5,256
8000905e:	cf3d                	beqz	a4,800090dc <_scanf_float+0x370>
80009060:	4007f793          	andi	a5,a5,1024
80009064:	cbb9                	beqz	a5,800090ba <_scanf_float+0x34e>
80009066:	da9afce3          	bgeu	s5,s1,80008e1e <_scanf_float+0xb2>
8000906a:	17c42783          	lw	a5,380(s0)
8000906e:	4522                	lw	a0,8(sp)
80009070:	fff4c583          	lbu	a1,-1(s1)
80009074:	864e                	mv	a2,s3
80009076:	14fd                	addi	s1,s1,-1
80009078:	9782                	jalr	a5
8000907a:	481c                	lw	a5,16(s0)
8000907c:	17fd                	addi	a5,a5,-1
8000907e:	c81c                	sw	a5,16(s0)
80009080:	b7dd                	j	80009066 <_scanf_float+0x2fa>
80009082:	17c42783          	lw	a5,380(s0)
80009086:	4522                	lw	a0,8(sp)
80009088:	fffd4583          	lbu	a1,-1(s10)
8000908c:	864e                	mv	a2,s3
8000908e:	c63a                	sw	a4,12(sp)
80009090:	9782                	jalr	a5
80009092:	481c                	lw	a5,16(s0)
80009094:	1d7d                	addi	s10,s10,-1
80009096:	4732                	lw	a4,12(sp)
80009098:	17fd                	addi	a5,a5,-1
8000909a:	c81c                	sw	a5,16(s0)
8000909c:	b75d                	j	80009042 <_scanf_float+0x2d6>
8000909e:	17c42783          	lw	a5,380(s0)
800090a2:	4522                	lw	a0,8(sp)
800090a4:	fff4c583          	lbu	a1,-1(s1)
800090a8:	864e                	mv	a2,s3
800090aa:	14fd                	addi	s1,s1,-1
800090ac:	9782                	jalr	a5
800090ae:	481c                	lw	a5,16(s0)
800090b0:	17fd                	addi	a5,a5,-1
800090b2:	c81c                	sw	a5,16(s0)
800090b4:	fe9ae5e3          	bltu	s5,s1,8000909e <_scanf_float+0x332>
800090b8:	b39d                	j	80008e1e <_scanf_float+0xb2>
800090ba:	481c                	lw	a5,16(s0)
800090bc:	fff4c583          	lbu	a1,-1(s1)
800090c0:	fff48713          	addi	a4,s1,-1
800090c4:	17fd                	addi	a5,a5,-1
800090c6:	c81c                	sw	a5,16(s0)
800090c8:	06500793          	li	a5,101
800090cc:	06f59363          	bne	a1,a5,80009132 <_scanf_float+0x3c6>
800090d0:	84ba                	mv	s1,a4
800090d2:	17c42783          	lw	a5,380(s0)
800090d6:	4522                	lw	a0,8(sp)
800090d8:	864e                	mv	a2,s3
800090da:	9782                	jalr	a5
800090dc:	00042d03          	lw	s10,0(s0)
800090e0:	010d7d13          	andi	s10,s10,16
800090e4:	0e0d1463          	bnez	s10,800091cc <_scanf_float+0x460>
800090e8:	00048023          	sb	zero,0(s1)
800090ec:	401c                	lw	a5,0(s0)
800090ee:	40000713          	li	a4,1024
800090f2:	6007f793          	andi	a5,a5,1536
800090f6:	04e79e63          	bne	a5,a4,80009152 <_scanf_float+0x3e6>
800090fa:	419a0633          	sub	a2,s4,s9
800090fe:	074c9663          	bne	s9,s4,8000916a <_scanf_float+0x3fe>
80009102:	4522                	lw	a0,8(sp)
80009104:	4601                	li	a2,0
80009106:	85d6                	mv	a1,s5
80009108:	227020ef          	jal	8000bb2e <_strtod_r>
8000910c:	4018                	lw	a4,0(s0)
8000910e:	000b2783          	lw	a5,0(s6)
80009112:	892a                	mv	s2,a0
80009114:	00277613          	andi	a2,a4,2
80009118:	89ae                	mv	s3,a1
8000911a:	00478693          	addi	a3,a5,4
8000911e:	c23d                	beqz	a2,80009184 <_scanf_float+0x418>
80009120:	00db2023          	sw	a3,0(s6)
80009124:	439c                	lw	a5,0(a5)
80009126:	c388                	sw	a0,0(a5)
80009128:	c3cc                	sw	a1,4(a5)
8000912a:	445c                	lw	a5,12(s0)
8000912c:	0785                	addi	a5,a5,1
8000912e:	c45c                	sw	a5,12(s0)
80009130:	b9c5                	j	80008e20 <_scanf_float+0xb4>
80009132:	04500793          	li	a5,69
80009136:	f8f58de3          	beq	a1,a5,800090d0 <_scanf_float+0x364>
8000913a:	17c42783          	lw	a5,380(s0)
8000913e:	4522                	lw	a0,8(sp)
80009140:	864e                	mv	a2,s3
80009142:	14f9                	addi	s1,s1,-2
80009144:	9782                	jalr	a5
80009146:	481c                	lw	a5,16(s0)
80009148:	0004c583          	lbu	a1,0(s1)
8000914c:	17fd                	addi	a5,a5,-1
8000914e:	c81c                	sw	a5,16(s0)
80009150:	b749                	j	800090d2 <_scanf_float+0x366>
80009152:	fa0c08e3          	beqz	s8,80009102 <_scanf_float+0x396>
80009156:	4522                	lw	a0,8(sp)
80009158:	4601                	li	a2,0
8000915a:	46a9                	li	a3,10
8000915c:	001b8593          	addi	a1,s7,1
80009160:	30d020ef          	jal	8000bc6c <_strtol_r>
80009164:	41850633          	sub	a2,a0,s8
80009168:	84de                	mv	s1,s7
8000916a:	16f40793          	addi	a5,s0,367
8000916e:	00f4e463          	bltu	s1,a5,80009176 <_scanf_float+0x40a>
80009172:	16e40493          	addi	s1,s0,366
80009176:	8000e5b7          	lui	a1,0x8000e
8000917a:	a6458593          	addi	a1,a1,-1436 # 8000da64 <s_wdgs+0x8c>
8000917e:	8526                	mv	a0,s1
80009180:	2af5                	jal	8000937c <siprintf>
80009182:	b741                	j	80009102 <_scanf_float+0x396>
80009184:	00db2023          	sw	a3,0(s6)
80009188:	8b11                	andi	a4,a4,4
8000918a:	4384                	lw	s1,0(a5)
8000918c:	cf19                	beqz	a4,800091aa <_scanf_float+0x43e>
8000918e:	85aa                	mv	a1,a0
80009190:	864e                	mv	a2,s3
80009192:	0808                	addi	a0,sp,16
80009194:	90afc0ef          	jal	8000529e <__extenddftf2>
80009198:	4642                	lw	a2,16(sp)
8000919a:	46d2                	lw	a3,20(sp)
8000919c:	4762                	lw	a4,24(sp)
8000919e:	47f2                	lw	a5,28(sp)
800091a0:	c090                	sw	a2,0(s1)
800091a2:	c0d4                	sw	a3,4(s1)
800091a4:	c498                	sw	a4,8(s1)
800091a6:	c4dc                	sw	a5,12(s1)
800091a8:	b749                	j	8000912a <_scanf_float+0x3be>
800091aa:	862a                	mv	a2,a0
800091ac:	86ae                	mv	a3,a1
800091ae:	dfdfb0ef          	jal	80004faa <__unorddf2>
800091b2:	c901                	beqz	a0,800091c2 <_scanf_float+0x456>
800091b4:	8000e537          	lui	a0,0x8000e
800091b8:	9f450513          	addi	a0,a0,-1548 # 8000d9f4 <s_wdgs+0x1c>
800091bc:	2c35                	jal	800093f8 <nanf>
800091be:	c088                	sw	a0,0(s1)
800091c0:	b7ad                	j	8000912a <_scanf_float+0x3be>
800091c2:	854a                	mv	a0,s2
800091c4:	85ce                	mv	a1,s3
800091c6:	a28fc0ef          	jal	800053ee <__truncdfsf2>
800091ca:	bfd5                	j	800091be <_scanf_float+0x452>
800091cc:	4d01                	li	s10,0
800091ce:	b989                	j	80008e20 <_scanf_float+0xb4>

800091d0 <fiprintf>:
800091d0:	7139                	addi	sp,sp,-64
800091d2:	da3e                	sw	a5,52(sp)
800091d4:	d432                	sw	a2,40(sp)
800091d6:	862e                	mv	a2,a1
800091d8:	85aa                	mv	a1,a0
800091da:	9c41a503          	lw	a0,-1596(gp) # 10801c4 <_impure_ptr>
800091de:	d636                	sw	a3,44(sp)
800091e0:	1034                	addi	a3,sp,40
800091e2:	ce06                	sw	ra,28(sp)
800091e4:	d83a                	sw	a4,48(sp)
800091e6:	dc42                	sw	a6,56(sp)
800091e8:	de46                	sw	a7,60(sp)
800091ea:	c636                	sw	a3,12(sp)
800091ec:	63f020ef          	jal	8000c02a <_vfiprintf_r>
800091f0:	40f2                	lw	ra,28(sp)
800091f2:	6121                	addi	sp,sp,64
800091f4:	8082                	ret

800091f6 <iprintf>:
800091f6:	7139                	addi	sp,sp,-64
800091f8:	da3e                	sw	a5,52(sp)
800091fa:	9c41a783          	lw	a5,-1596(gp) # 10801c4 <_impure_ptr>
800091fe:	d432                	sw	a2,40(sp)
80009200:	d636                	sw	a3,44(sp)
80009202:	d22e                	sw	a1,36(sp)
80009204:	d83a                	sw	a4,48(sp)
80009206:	dc42                	sw	a6,56(sp)
80009208:	de46                	sw	a7,60(sp)
8000920a:	478c                	lw	a1,8(a5)
8000920c:	1054                	addi	a3,sp,36
8000920e:	862a                	mv	a2,a0
80009210:	853e                	mv	a0,a5
80009212:	ce06                	sw	ra,28(sp)
80009214:	c636                	sw	a3,12(sp)
80009216:	615020ef          	jal	8000c02a <_vfiprintf_r>
8000921a:	40f2                	lw	ra,28(sp)
8000921c:	6121                	addi	sp,sp,64
8000921e:	8082                	ret

80009220 <setvbuf>:
80009220:	7179                	addi	sp,sp,-48
80009222:	ce4e                	sw	s3,28(sp)
80009224:	9c41a983          	lw	s3,-1596(gp) # 10801c4 <_impure_ptr>
80009228:	d422                	sw	s0,40(sp)
8000922a:	d226                	sw	s1,36(sp)
8000922c:	d04a                	sw	s2,32(sp)
8000922e:	cc52                	sw	s4,24(sp)
80009230:	d606                	sw	ra,44(sp)
80009232:	ca56                	sw	s5,20(sp)
80009234:	842a                	mv	s0,a0
80009236:	892e                	mv	s2,a1
80009238:	8a32                	mv	s4,a2
8000923a:	84b6                	mv	s1,a3
8000923c:	00098863          	beqz	s3,8000924c <setvbuf+0x2c>
80009240:	0209a783          	lw	a5,32(s3)
80009244:	e781                	bnez	a5,8000924c <setvbuf+0x2c>
80009246:	854e                	mv	a0,s3
80009248:	29e030ef          	jal	8000c4e6 <__sinit>
8000924c:	4789                	li	a5,2
8000924e:	00fa0863          	beq	s4,a5,8000925e <setvbuf+0x3e>
80009252:	002a3793          	sltiu	a5,s4,2
80009256:	12078163          	beqz	a5,80009378 <setvbuf+0x158>
8000925a:	1004cf63          	bltz	s1,80009378 <setvbuf+0x158>
8000925e:	85a2                	mv	a1,s0
80009260:	854e                	mv	a0,s3
80009262:	15e030ef          	jal	8000c3c0 <_fflush_r>
80009266:	584c                	lw	a1,52(s0)
80009268:	c991                	beqz	a1,8000927c <setvbuf+0x5c>
8000926a:	04440793          	addi	a5,s0,68
8000926e:	00f58563          	beq	a1,a5,80009278 <setvbuf+0x58>
80009272:	854e                	mv	a0,s3
80009274:	6e1000ef          	jal	8000a154 <_free_r>
80009278:	02042a23          	sw	zero,52(s0)
8000927c:	00c45783          	lhu	a5,12(s0)
80009280:	00042c23          	sw	zero,24(s0)
80009284:	00042223          	sw	zero,4(s0)
80009288:	0807f793          	andi	a5,a5,128
8000928c:	c789                	beqz	a5,80009296 <setvbuf+0x76>
8000928e:	480c                	lw	a1,16(s0)
80009290:	854e                	mv	a0,s3
80009292:	6c3000ef          	jal	8000a154 <_free_r>
80009296:	00c45783          	lhu	a5,12(s0)
8000929a:	777d                	lui	a4,0xfffff
8000929c:	35c70713          	addi	a4,a4,860 # fffff35c <__fast_load_addr__+0x7fff119c>
800092a0:	8ff9                	and	a5,a5,a4
800092a2:	00f41623          	sh	a5,12(s0)
800092a6:	4789                	li	a5,2
800092a8:	0cfa0163          	beq	s4,a5,8000936a <setvbuf+0x14a>
800092ac:	0074                	addi	a3,sp,12
800092ae:	0030                	addi	a2,sp,8
800092b0:	85a2                	mv	a1,s0
800092b2:	854e                	mv	a0,s3
800092b4:	2aa030ef          	jal	8000c55e <__swhatbuf_r>
800092b8:	00c45783          	lhu	a5,12(s0)
800092bc:	8fc9                	or	a5,a5,a0
800092be:	00f41623          	sh	a5,12(s0)
800092c2:	e0b9                	bnez	s1,80009308 <setvbuf+0xe8>
800092c4:	44a2                	lw	s1,8(sp)
800092c6:	8526                	mv	a0,s1
800092c8:	72b000ef          	jal	8000a1f2 <malloc>
800092cc:	892a                	mv	s2,a0
800092ce:	8aa6                	mv	s5,s1
800092d0:	e549                	bnez	a0,8000935a <setvbuf+0x13a>
800092d2:	4aa2                	lw	s5,8(sp)
800092d4:	069a9e63          	bne	s5,s1,80009350 <setvbuf+0x130>
800092d8:	557d                	li	a0,-1
800092da:	00c45783          	lhu	a5,12(s0)
800092de:	00042423          	sw	zero,8(s0)
800092e2:	0027e793          	ori	a5,a5,2
800092e6:	00f41623          	sh	a5,12(s0)
800092ea:	04740793          	addi	a5,s0,71
800092ee:	c01c                	sw	a5,0(s0)
800092f0:	c81c                	sw	a5,16(s0)
800092f2:	4785                	li	a5,1
800092f4:	c85c                	sw	a5,20(s0)
800092f6:	50b2                	lw	ra,44(sp)
800092f8:	5422                	lw	s0,40(sp)
800092fa:	5492                	lw	s1,36(sp)
800092fc:	5902                	lw	s2,32(sp)
800092fe:	49f2                	lw	s3,28(sp)
80009300:	4a62                	lw	s4,24(sp)
80009302:	4ad2                	lw	s5,20(sp)
80009304:	6145                	addi	sp,sp,48
80009306:	8082                	ret
80009308:	fa090fe3          	beqz	s2,800092c6 <setvbuf+0xa6>
8000930c:	0209a783          	lw	a5,32(s3)
80009310:	e781                	bnez	a5,80009318 <setvbuf+0xf8>
80009312:	854e                	mv	a0,s3
80009314:	1d2030ef          	jal	8000c4e6 <__sinit>
80009318:	4785                	li	a5,1
8000931a:	00fa1863          	bne	s4,a5,8000932a <setvbuf+0x10a>
8000931e:	00c45783          	lhu	a5,12(s0)
80009322:	0147e7b3          	or	a5,a5,s4
80009326:	00f41623          	sh	a5,12(s0)
8000932a:	00c41783          	lh	a5,12(s0)
8000932e:	01242023          	sw	s2,0(s0)
80009332:	01242823          	sw	s2,16(s0)
80009336:	c844                	sw	s1,20(s0)
80009338:	0087f713          	andi	a4,a5,8
8000933c:	cb1d                	beqz	a4,80009372 <setvbuf+0x152>
8000933e:	8b85                	andi	a5,a5,1
80009340:	c79d                	beqz	a5,8000936e <setvbuf+0x14e>
80009342:	409004b3          	neg	s1,s1
80009346:	00042423          	sw	zero,8(s0)
8000934a:	cc04                	sw	s1,24(s0)
8000934c:	4501                	li	a0,0
8000934e:	b765                	j	800092f6 <setvbuf+0xd6>
80009350:	8556                	mv	a0,s5
80009352:	6a1000ef          	jal	8000a1f2 <malloc>
80009356:	892a                	mv	s2,a0
80009358:	d141                	beqz	a0,800092d8 <setvbuf+0xb8>
8000935a:	00c45783          	lhu	a5,12(s0)
8000935e:	84d6                	mv	s1,s5
80009360:	0807e793          	ori	a5,a5,128
80009364:	00f41623          	sh	a5,12(s0)
80009368:	b755                	j	8000930c <setvbuf+0xec>
8000936a:	4501                	li	a0,0
8000936c:	b7bd                	j	800092da <setvbuf+0xba>
8000936e:	c404                	sw	s1,8(s0)
80009370:	bff1                	j	8000934c <setvbuf+0x12c>
80009372:	00042423          	sw	zero,8(s0)
80009376:	bfd9                	j	8000934c <setvbuf+0x12c>
80009378:	557d                	li	a0,-1
8000937a:	bfb5                	j	800092f6 <setvbuf+0xd6>

8000937c <siprintf>:
8000937c:	7135                	addi	sp,sp,-160
8000937e:	cb3e                	sw	a5,148(sp)
80009380:	800007b7          	lui	a5,0x80000
80009384:	17fd                	addi	a5,a5,-1 # 7fffffff <__share_mem_end__+0x7ee7ffff>
80009386:	ce3e                	sw	a5,28(sp)
80009388:	c83e                	sw	a5,16(sp)
8000938a:	77c1                	lui	a5,0xffff0
8000938c:	20878793          	addi	a5,a5,520 # ffff0208 <__fast_load_addr__+0x7ffe2048>
80009390:	ca3e                	sw	a5,20(sp)
80009392:	c42a                	sw	a0,8(sp)
80009394:	cc2a                	sw	a0,24(sp)
80009396:	9c41a503          	lw	a0,-1596(gp) # 10801c4 <_impure_ptr>
8000939a:	c532                	sw	a2,136(sp)
8000939c:	c736                	sw	a3,140(sp)
8000939e:	862e                	mv	a2,a1
800093a0:	0134                	addi	a3,sp,136
800093a2:	002c                	addi	a1,sp,8
800093a4:	de86                	sw	ra,124(sp)
800093a6:	c93a                	sw	a4,144(sp)
800093a8:	cd42                	sw	a6,152(sp)
800093aa:	cf46                	sw	a7,156(sp)
800093ac:	d682                	sw	zero,108(sp)
800093ae:	c236                	sw	a3,4(sp)
800093b0:	1af020ef          	jal	8000bd5e <_svfiprintf_r>
800093b4:	47a2                	lw	a5,8(sp)
800093b6:	00078023          	sb	zero,0(a5)
800093ba:	50f6                	lw	ra,124(sp)
800093bc:	610d                	addi	sp,sp,160
800093be:	8082                	ret

800093c0 <_localeconv_r>:
800093c0:	94818513          	addi	a0,gp,-1720 # 1080148 <__global_locale+0xf0>
800093c4:	8082                	ret

800093c6 <__errno>:
800093c6:	9c41a503          	lw	a0,-1596(gp) # 10801c4 <_impure_ptr>
800093ca:	8082                	ret

800093cc <strlen>:
800093cc:	87aa                	mv	a5,a0
800093ce:	0007c703          	lbu	a4,0(a5)
800093d2:	0785                	addi	a5,a5,1
800093d4:	ff6d                	bnez	a4,800093ce <strlen+0x2>
800093d6:	40a78533          	sub	a0,a5,a0
800093da:	157d                	addi	a0,a0,-1
800093dc:	8082                	ret

800093de <memchr>:
800093de:	0ff5f593          	zext.b	a1,a1
800093e2:	962a                	add	a2,a2,a0
800093e4:	00c51463          	bne	a0,a2,800093ec <memchr+0xe>
800093e8:	4501                	li	a0,0
800093ea:	8082                	ret
800093ec:	00054783          	lbu	a5,0(a0)
800093f0:	feb78de3          	beq	a5,a1,800093ea <memchr+0xc>
800093f4:	0505                	addi	a0,a0,1
800093f6:	b7fd                	j	800093e4 <memchr+0x6>

800093f8 <nanf>:
800093f8:	8000e7b7          	lui	a5,0x8000e
800093fc:	fc87a503          	lw	a0,-56(a5) # 8000dfc8 <_ctype_+0x190>
80009400:	8082                	ret

80009402 <abort>:
80009402:	1141                	addi	sp,sp,-16
80009404:	4519                	li	a0,6
80009406:	c606                	sw	ra,12(sp)
80009408:	4be030ef          	jal	8000c8c6 <raise>
8000940c:	4505                	li	a0,1
8000940e:	6d1030ef          	jal	8000d2de <_exit>

80009412 <quorem>:
80009412:	1101                	addi	sp,sp,-32
80009414:	cc22                	sw	s0,24(sp)
80009416:	491c                	lw	a5,16(a0)
80009418:	4980                	lw	s0,16(a1)
8000941a:	ce06                	sw	ra,28(sp)
8000941c:	ca26                	sw	s1,20(sp)
8000941e:	c84a                	sw	s2,16(sp)
80009420:	c64e                	sw	s3,12(sp)
80009422:	c452                	sw	s4,8(sp)
80009424:	c256                	sw	s5,4(sp)
80009426:	1087cf63          	blt	a5,s0,80009544 <quorem+0x132>
8000942a:	147d                	addi	s0,s0,-1
8000942c:	00241693          	slli	a3,s0,0x2
80009430:	01458913          	addi	s2,a1,20
80009434:	00d90a33          	add	s4,s2,a3
80009438:	01450993          	addi	s3,a0,20
8000943c:	000a2783          	lw	a5,0(s4)
80009440:	96ce                	add	a3,a3,s3
80009442:	4298                	lw	a4,0(a3)
80009444:	0785                	addi	a5,a5,1
80009446:	02f754b3          	divu	s1,a4,a5
8000944a:	06f76763          	bltu	a4,a5,800094b8 <quorem+0xa6>
8000944e:	834e                	mv	t1,s3
80009450:	88ca                	mv	a7,s2
80009452:	4e01                	li	t3,0
80009454:	4e81                	li	t4,0
80009456:	0008a703          	lw	a4,0(a7)
8000945a:	0891                	addi	a7,a7,4
8000945c:	0311                	addi	t1,t1,4
8000945e:	01071813          	slli	a6,a4,0x10
80009462:	01085813          	srli	a6,a6,0x10
80009466:	02980833          	mul	a6,a6,s1
8000946a:	8341                	srli	a4,a4,0x10
8000946c:	02970733          	mul	a4,a4,s1
80009470:	9872                	add	a6,a6,t3
80009472:	01085793          	srli	a5,a6,0x10
80009476:	0842                	slli	a6,a6,0x10
80009478:	01085813          	srli	a6,a6,0x10
8000947c:	973e                	add	a4,a4,a5
8000947e:	ffc32783          	lw	a5,-4(t1)
80009482:	01075e13          	srli	t3,a4,0x10
80009486:	0742                	slli	a4,a4,0x10
80009488:	01079613          	slli	a2,a5,0x10
8000948c:	8241                	srli	a2,a2,0x10
8000948e:	41060633          	sub	a2,a2,a6
80009492:	9676                	add	a2,a2,t4
80009494:	8341                	srli	a4,a4,0x10
80009496:	83c1                	srli	a5,a5,0x10
80009498:	8f99                	sub	a5,a5,a4
8000949a:	41065713          	srai	a4,a2,0x10
8000949e:	97ba                	add	a5,a5,a4
800094a0:	0642                	slli	a2,a2,0x10
800094a2:	4107de93          	srai	t4,a5,0x10
800094a6:	8241                	srli	a2,a2,0x10
800094a8:	07c2                	slli	a5,a5,0x10
800094aa:	8fd1                	or	a5,a5,a2
800094ac:	fef32e23          	sw	a5,-4(t1)
800094b0:	fb1a73e3          	bgeu	s4,a7,80009456 <quorem+0x44>
800094b4:	429c                	lw	a5,0(a3)
800094b6:	cbad                	beqz	a5,80009528 <quorem+0x116>
800094b8:	8aaa                	mv	s5,a0
800094ba:	55e010ef          	jal	8000aa18 <__mcmp>
800094be:	04054863          	bltz	a0,8000950e <quorem+0xfc>
800094c2:	0485                	addi	s1,s1,1
800094c4:	864e                	mv	a2,s3
800094c6:	874a                	mv	a4,s2
800094c8:	4501                	li	a0,0
800094ca:	430c                	lw	a1,0(a4)
800094cc:	421c                	lw	a5,0(a2)
800094ce:	0711                	addi	a4,a4,4
800094d0:	01059813          	slli	a6,a1,0x10
800094d4:	01079693          	slli	a3,a5,0x10
800094d8:	82c1                	srli	a3,a3,0x10
800094da:	01085813          	srli	a6,a6,0x10
800094de:	410686b3          	sub	a3,a3,a6
800094e2:	96aa                	add	a3,a3,a0
800094e4:	81c1                	srli	a1,a1,0x10
800094e6:	83c1                	srli	a5,a5,0x10
800094e8:	8f8d                	sub	a5,a5,a1
800094ea:	4106d593          	srai	a1,a3,0x10
800094ee:	97ae                	add	a5,a5,a1
800094f0:	06c2                	slli	a3,a3,0x10
800094f2:	4107d513          	srai	a0,a5,0x10
800094f6:	82c1                	srli	a3,a3,0x10
800094f8:	07c2                	slli	a5,a5,0x10
800094fa:	8fd5                	or	a5,a5,a3
800094fc:	c21c                	sw	a5,0(a2)
800094fe:	0611                	addi	a2,a2,4
80009500:	fcea75e3          	bgeu	s4,a4,800094ca <quorem+0xb8>
80009504:	00241793          	slli	a5,s0,0x2
80009508:	97ce                	add	a5,a5,s3
8000950a:	4398                	lw	a4,0(a5)
8000950c:	c715                	beqz	a4,80009538 <quorem+0x126>
8000950e:	8526                	mv	a0,s1
80009510:	40f2                	lw	ra,28(sp)
80009512:	4462                	lw	s0,24(sp)
80009514:	44d2                	lw	s1,20(sp)
80009516:	4942                	lw	s2,16(sp)
80009518:	49b2                	lw	s3,12(sp)
8000951a:	4a22                	lw	s4,8(sp)
8000951c:	4a92                	lw	s5,4(sp)
8000951e:	6105                	addi	sp,sp,32
80009520:	8082                	ret
80009522:	429c                	lw	a5,0(a3)
80009524:	e789                	bnez	a5,8000952e <quorem+0x11c>
80009526:	147d                	addi	s0,s0,-1
80009528:	16f1                	addi	a3,a3,-4
8000952a:	fed9ece3          	bltu	s3,a3,80009522 <quorem+0x110>
8000952e:	c900                	sw	s0,16(a0)
80009530:	b761                	j	800094b8 <quorem+0xa6>
80009532:	4398                	lw	a4,0(a5)
80009534:	e709                	bnez	a4,8000953e <quorem+0x12c>
80009536:	147d                	addi	s0,s0,-1
80009538:	17f1                	addi	a5,a5,-4
8000953a:	fef9ece3          	bltu	s3,a5,80009532 <quorem+0x120>
8000953e:	008aa823          	sw	s0,16(s5)
80009542:	b7f1                	j	8000950e <quorem+0xfc>
80009544:	4501                	li	a0,0
80009546:	b7e9                	j	80009510 <quorem+0xfe>

80009548 <_dtoa_r>:
80009548:	7171                	addi	sp,sp,-176
8000954a:	c42a                	sw	a0,8(sp)
8000954c:	4d48                	lw	a0,28(a0)
8000954e:	d522                	sw	s0,168(sp)
80009550:	d326                	sw	s1,164(sp)
80009552:	d14a                	sw	s2,160(sp)
80009554:	cd52                	sw	s4,152(sp)
80009556:	d706                	sw	ra,172(sp)
80009558:	cf4e                	sw	s3,156(sp)
8000955a:	cb56                	sw	s5,148(sp)
8000955c:	c95a                	sw	s6,144(sp)
8000955e:	c75e                	sw	s7,140(sp)
80009560:	c562                	sw	s8,136(sp)
80009562:	c366                	sw	s9,132(sp)
80009564:	c16a                	sw	s10,128(sp)
80009566:	deee                	sw	s11,124(sp)
80009568:	cc3a                	sw	a4,24(sp)
8000956a:	da3e                	sw	a5,52(sp)
8000956c:	d246                	sw	a7,36(sp)
8000956e:	de2e                	sw	a1,60(sp)
80009570:	d632                	sw	a2,44(sp)
80009572:	892e                	mv	s2,a1
80009574:	84b2                	mv	s1,a2
80009576:	8436                	mv	s0,a3
80009578:	8a42                	mv	s4,a6
8000957a:	ed05                	bnez	a0,800095b2 <_dtoa_r+0x6a>
8000957c:	4541                	li	a0,16
8000957e:	475000ef          	jal	8000a1f2 <malloc>
80009582:	47a2                	lw	a5,8(sp)
80009584:	cfc8                	sw	a0,28(a5)
80009586:	ed11                	bnez	a0,800095a2 <_dtoa_r+0x5a>
80009588:	8000e6b7          	lui	a3,0x8000e
8000958c:	a7c68693          	addi	a3,a3,-1412 # 8000da7c <s_wdgs+0xa4>
80009590:	4601                	li	a2,0
80009592:	0ef00593          	li	a1,239
80009596:	8000e537          	lui	a0,0x8000e
8000959a:	a9450513          	addi	a0,a0,-1388 # 8000da94 <s_wdgs+0xbc>
8000959e:	dd7fe0ef          	jal	80008374 <__assert_func>
800095a2:	00052223          	sw	zero,4(a0)
800095a6:	00052423          	sw	zero,8(a0)
800095aa:	00052023          	sw	zero,0(a0)
800095ae:	00052623          	sw	zero,12(a0)
800095b2:	410c                	lw	a1,0(a0)
800095b4:	cd91                	beqz	a1,800095d0 <_dtoa_r+0x88>
800095b6:	4158                	lw	a4,4(a0)
800095b8:	4785                	li	a5,1
800095ba:	4522                	lw	a0,8(sp)
800095bc:	00e797b3          	sll	a5,a5,a4
800095c0:	c59c                	sw	a5,8(a1)
800095c2:	c1d8                	sw	a4,4(a1)
800095c4:	64f000ef          	jal	8000a412 <_Bfree>
800095c8:	47a2                	lw	a5,8(sp)
800095ca:	4fdc                	lw	a5,28(a5)
800095cc:	0007a023          	sw	zero,0(a5)
800095d0:	89a6                	mv	s3,s1
800095d2:	0404da63          	bgez	s1,80009626 <_dtoa_r+0xde>
800095d6:	4785                	li	a5,1
800095d8:	00149613          	slli	a2,s1,0x1
800095dc:	00fa2023          	sw	a5,0(s4)
800095e0:	00165793          	srli	a5,a2,0x1
800095e4:	d63e                	sw	a5,44(sp)
800095e6:	89be                	mv	s3,a5
800095e8:	7ff007b7          	lui	a5,0x7ff00
800095ec:	00f9f733          	and	a4,s3,a5
800095f0:	02f71e63          	bne	a4,a5,8000962c <_dtoa_r+0xe4>
800095f4:	5752                	lw	a4,52(sp)
800095f6:	6789                	lui	a5,0x2
800095f8:	09b2                	slli	s3,s3,0xc
800095fa:	70f78793          	addi	a5,a5,1807 # 270f <__app_offset__+0x70f>
800095fe:	00c9d993          	srli	s3,s3,0xc
80009602:	c31c                	sw	a5,0(a4)
80009604:	0129e9b3          	or	s3,s3,s2
80009608:	300985e3          	beqz	s3,8000a112 <_dtoa_r+0xbca>
8000960c:	5712                	lw	a4,36(sp)
8000960e:	8000e7b7          	lui	a5,0x8000e
80009612:	a7878493          	addi	s1,a5,-1416 # 8000da78 <s_wdgs+0xa0>
80009616:	30070ae3          	beqz	a4,8000a12a <_dtoa_r+0xbe2>
8000961a:	8000e7b7          	lui	a5,0x8000e
8000961e:	a7b78793          	addi	a5,a5,-1413 # 8000da7b <s_wdgs+0xa3>
80009622:	3050006f          	j	8000a126 <_dtoa_r+0xbde>
80009626:	000a2023          	sw	zero,0(s4)
8000962a:	bf7d                	j	800095e8 <_dtoa_r+0xa0>
8000962c:	5bb2                	lw	s7,44(sp)
8000962e:	4601                	li	a2,0
80009630:	4681                	li	a3,0
80009632:	854a                	mv	a0,s2
80009634:	85de                	mv	a1,s7
80009636:	8b4a                	mv	s6,s2
80009638:	ce4a                	sw	s2,28(sp)
8000963a:	d05e                	sw	s7,32(sp)
8000963c:	facfb0ef          	jal	80004de8 <__eqdf2>
80009640:	e115                	bnez	a0,80009664 <_dtoa_r+0x11c>
80009642:	5752                	lw	a4,52(sp)
80009644:	4785                	li	a5,1
80009646:	c31c                	sw	a5,0(a4)
80009648:	5792                	lw	a5,36(sp)
8000964a:	c799                	beqz	a5,80009658 <_dtoa_r+0x110>
8000964c:	5712                	lw	a4,36(sp)
8000964e:	8000e7b7          	lui	a5,0x8000e
80009652:	a3978793          	addi	a5,a5,-1479 # 8000da39 <s_wdgs+0x61>
80009656:	c31c                	sw	a5,0(a4)
80009658:	8000e7b7          	lui	a5,0x8000e
8000965c:	a3878493          	addi	s1,a5,-1480 # 8000da38 <s_wdgs+0x60>
80009660:	2cb0006f          	j	8000a12a <_dtoa_r+0xbe2>
80009664:	4522                	lw	a0,8(sp)
80009666:	10b8                	addi	a4,sp,104
80009668:	10f4                	addi	a3,sp,108
8000966a:	865e                	mv	a2,s7
8000966c:	85ca                	mv	a1,s2
8000966e:	636010ef          	jal	8000aca4 <__d2b>
80009672:	c62a                	sw	a0,12(sp)
80009674:	0149da13          	srli	s4,s3,0x14
80009678:	5aa6                	lw	s5,104(sp)
8000967a:	120a0463          	beqz	s4,800097a2 <_dtoa_r+0x25a>
8000967e:	09b2                	slli	s3,s3,0xc
80009680:	00c9d993          	srli	s3,s3,0xc
80009684:	3ff007b7          	lui	a5,0x3ff00
80009688:	00f9e9b3          	or	s3,s3,a5
8000968c:	c01a0a13          	addi	s4,s4,-1023
80009690:	dc02                	sw	zero,56(sp)
80009692:	8000e7b7          	lui	a5,0x8000e
80009696:	f487a603          	lw	a2,-184(a5) # 8000df48 <_ctype_+0x110>
8000969a:	f4c7a683          	lw	a3,-180(a5)
8000969e:	855a                	mv	a0,s6
800096a0:	85ce                	mv	a1,s3
800096a2:	83cfb0ef          	jal	800046de <__subdf3>
800096a6:	8000e7b7          	lui	a5,0x8000e
800096aa:	f507a603          	lw	a2,-176(a5) # 8000df50 <_ctype_+0x118>
800096ae:	f547a683          	lw	a3,-172(a5)
800096b2:	be3fa0ef          	jal	80004294 <__muldf3>
800096b6:	8000e7b7          	lui	a5,0x8000e
800096ba:	f587a603          	lw	a2,-168(a5) # 8000df58 <_ctype_+0x120>
800096be:	f5c7a683          	lw	a3,-164(a5)
800096c2:	8e0fa0ef          	jal	800037a2 <__adddf3>
800096c6:	892a                	mv	s2,a0
800096c8:	8552                	mv	a0,s4
800096ca:	89ae                	mv	s3,a1
800096cc:	975fb0ef          	jal	80005040 <__floatsidf>
800096d0:	8000e7b7          	lui	a5,0x8000e
800096d4:	f607a603          	lw	a2,-160(a5) # 8000df60 <_ctype_+0x128>
800096d8:	f647a683          	lw	a3,-156(a5)
800096dc:	bb9fa0ef          	jal	80004294 <__muldf3>
800096e0:	862a                	mv	a2,a0
800096e2:	86ae                	mv	a3,a1
800096e4:	854a                	mv	a0,s2
800096e6:	85ce                	mv	a1,s3
800096e8:	8bafa0ef          	jal	800037a2 <__adddf3>
800096ec:	8b2a                	mv	s6,a0
800096ee:	8bae                	mv	s7,a1
800096f0:	8effb0ef          	jal	80004fde <__fixdfsi>
800096f4:	89aa                	mv	s3,a0
800096f6:	4601                	li	a2,0
800096f8:	4681                	li	a3,0
800096fa:	855a                	mv	a0,s6
800096fc:	85de                	mv	a1,s7
800096fe:	ffafb0ef          	jal	80004ef8 <__ledf2>
80009702:	00055d63          	bgez	a0,8000971c <_dtoa_r+0x1d4>
80009706:	854e                	mv	a0,s3
80009708:	939fb0ef          	jal	80005040 <__floatsidf>
8000970c:	865a                	mv	a2,s6
8000970e:	86de                	mv	a3,s7
80009710:	ed8fb0ef          	jal	80004de8 <__eqdf2>
80009714:	00a03533          	snez	a0,a0
80009718:	40a989b3          	sub	s3,s3,a0
8000971c:	4705                	li	a4,1
8000971e:	47d9                	li	a5,22
80009720:	d83a                	sw	a4,48(sp)
80009722:	0337e363          	bltu	a5,s3,80009748 <_dtoa_r+0x200>
80009726:	8000e737          	lui	a4,0x8000e
8000972a:	00399793          	slli	a5,s3,0x3
8000972e:	d0870713          	addi	a4,a4,-760 # 8000dd08 <__mprec_tens>
80009732:	97ba                	add	a5,a5,a4
80009734:	4390                	lw	a2,0(a5)
80009736:	43d4                	lw	a3,4(a5)
80009738:	4572                	lw	a0,28(sp)
8000973a:	5582                	lw	a1,32(sp)
8000973c:	fbcfb0ef          	jal	80004ef8 <__ledf2>
80009740:	00055363          	bgez	a0,80009746 <_dtoa_r+0x1fe>
80009744:	19fd                	addi	s3,s3,-1
80009746:	d802                	sw	zero,48(sp)
80009748:	414a8ab3          	sub	s5,s5,s4
8000974c:	fffa8c13          	addi	s8,s5,-1
80009750:	4b01                	li	s6,0
80009752:	000c5663          	bgez	s8,8000975e <_dtoa_r+0x216>
80009756:	4b05                	li	s6,1
80009758:	415b0b33          	sub	s6,s6,s5
8000975c:	4c01                	li	s8,0
8000975e:	0809c363          	bltz	s3,800097e4 <_dtoa_r+0x29c>
80009762:	9c4e                	add	s8,s8,s3
80009764:	d44e                	sw	s3,40(sp)
80009766:	c802                	sw	zero,16(sp)
80009768:	47a5                	li	a5,9
8000976a:	0c87ef63          	bltu	a5,s0,80009848 <_dtoa_r+0x300>
8000976e:	4795                	li	a5,5
80009770:	4905                	li	s2,1
80009772:	0087d463          	bge	a5,s0,8000977a <_dtoa_r+0x232>
80009776:	1471                	addi	s0,s0,-4
80009778:	4901                	li	s2,0
8000977a:	4791                	li	a5,4
8000977c:	06f40b63          	beq	s0,a5,800097f2 <_dtoa_r+0x2aa>
80009780:	4795                	li	a5,5
80009782:	0af40763          	beq	s0,a5,80009830 <_dtoa_r+0x2e8>
80009786:	4789                	li	a5,2
80009788:	0af40263          	beq	s0,a5,8000982c <_dtoa_r+0x2e4>
8000978c:	478d                	li	a5,3
8000978e:	ca02                	sw	zero,20(sp)
80009790:	0af40263          	beq	s0,a5,80009834 <_dtoa_r+0x2ec>
80009794:	4785                	li	a5,1
80009796:	ca3e                	sw	a5,20(sp)
80009798:	5cfd                	li	s9,-1
8000979a:	8be6                	mv	s7,s9
8000979c:	47c9                	li	a5,18
8000979e:	cc02                	sw	zero,24(sp)
800097a0:	a085                	j	80009800 <_dtoa_r+0x2b8>
800097a2:	5a36                	lw	s4,108(sp)
800097a4:	02000793          	li	a5,32
800097a8:	9a56                	add	s4,s4,s5
800097aa:	432a0713          	addi	a4,s4,1074
800097ae:	02e7d763          	bge	a5,a4,800097dc <_dtoa_r+0x294>
800097b2:	04000793          	li	a5,64
800097b6:	8f99                	sub	a5,a5,a4
800097b8:	00f999b3          	sll	s3,s3,a5
800097bc:	412a0793          	addi	a5,s4,1042
800097c0:	00f957b3          	srl	a5,s2,a5
800097c4:	00f9e533          	or	a0,s3,a5
800097c8:	d28fb0ef          	jal	80004cf0 <__floatunsidf>
800097cc:	fe1009b7          	lui	s3,0xfe100
800097d0:	4785                	li	a5,1
800097d2:	8b2a                	mv	s6,a0
800097d4:	99ae                	add	s3,s3,a1
800097d6:	1a7d                	addi	s4,s4,-1
800097d8:	dc3e                	sw	a5,56(sp)
800097da:	bd65                	j	80009692 <_dtoa_r+0x14a>
800097dc:	8f99                	sub	a5,a5,a4
800097de:	00f91533          	sll	a0,s2,a5
800097e2:	b7dd                	j	800097c8 <_dtoa_r+0x280>
800097e4:	413007b3          	neg	a5,s3
800097e8:	413b0b33          	sub	s6,s6,s3
800097ec:	c83e                	sw	a5,16(sp)
800097ee:	d402                	sw	zero,40(sp)
800097f0:	bfa5                	j	80009768 <_dtoa_r+0x220>
800097f2:	4785                	li	a5,1
800097f4:	ca3e                	sw	a5,20(sp)
800097f6:	47e2                	lw	a5,24(sp)
800097f8:	04f05c63          	blez	a5,80009850 <_dtoa_r+0x308>
800097fc:	8cbe                	mv	s9,a5
800097fe:	8bbe                	mv	s7,a5
80009800:	4722                	lw	a4,8(sp)
80009802:	4581                	li	a1,0
80009804:	4f54                	lw	a3,28(a4)
80009806:	4711                	li	a4,4
80009808:	01470613          	addi	a2,a4,20
8000980c:	04c7f763          	bgeu	a5,a2,8000985a <_dtoa_r+0x312>
80009810:	4522                	lw	a0,8(sp)
80009812:	c2cc                	sw	a1,4(a3)
80009814:	363000ef          	jal	8000a376 <_Balloc>
80009818:	84aa                	mv	s1,a0
8000981a:	e139                	bnez	a0,80009860 <_dtoa_r+0x318>
8000981c:	8000e6b7          	lui	a3,0x8000e
80009820:	af468693          	addi	a3,a3,-1292 # 8000daf4 <s_wdgs+0x11c>
80009824:	4601                	li	a2,0
80009826:	1af00593          	li	a1,431
8000982a:	b3b5                	j	80009596 <_dtoa_r+0x4e>
8000982c:	ca02                	sw	zero,20(sp)
8000982e:	b7e1                	j	800097f6 <_dtoa_r+0x2ae>
80009830:	4785                	li	a5,1
80009832:	ca3e                	sw	a5,20(sp)
80009834:	47e2                	lw	a5,24(sp)
80009836:	00f98cb3          	add	s9,s3,a5
8000983a:	001c8b93          	addi	s7,s9,1
8000983e:	87de                	mv	a5,s7
80009840:	fd7040e3          	bgtz	s7,80009800 <_dtoa_r+0x2b8>
80009844:	4785                	li	a5,1
80009846:	bf6d                	j	80009800 <_dtoa_r+0x2b8>
80009848:	4905                	li	s2,1
8000984a:	4401                	li	s0,0
8000984c:	ca4a                	sw	s2,20(sp)
8000984e:	b7a9                	j	80009798 <_dtoa_r+0x250>
80009850:	4c85                	li	s9,1
80009852:	8be6                	mv	s7,s9
80009854:	87e6                	mv	a5,s9
80009856:	cc66                	sw	s9,24(sp)
80009858:	b765                	j	80009800 <_dtoa_r+0x2b8>
8000985a:	0585                	addi	a1,a1,1
8000985c:	0706                	slli	a4,a4,0x1
8000985e:	b76d                	j	80009808 <_dtoa_r+0x2c0>
80009860:	47a2                	lw	a5,8(sp)
80009862:	4fdc                	lw	a5,28(a5)
80009864:	c388                	sw	a0,0(a5)
80009866:	00fbb793          	sltiu	a5,s7,15
8000986a:	cfe1                	beqz	a5,80009942 <_dtoa_r+0x3fa>
8000986c:	0c090b63          	beqz	s2,80009942 <_dtoa_r+0x3fa>
80009870:	1b305363          	blez	s3,80009a16 <_dtoa_r+0x4ce>
80009874:	00f9f793          	andi	a5,s3,15
80009878:	8000e737          	lui	a4,0x8000e
8000987c:	d0870713          	addi	a4,a4,-760 # 8000dd08 <__mprec_tens>
80009880:	078e                	slli	a5,a5,0x3
80009882:	97ba                	add	a5,a5,a4
80009884:	4049da13          	srai	s4,s3,0x4
80009888:	4398                	lw	a4,0(a5)
8000988a:	0047ad83          	lw	s11,4(a5)
8000988e:	8000e937          	lui	s2,0x8000e
80009892:	010a7793          	andi	a5,s4,16
80009896:	ce090913          	addi	s2,s2,-800 # 8000dce0 <__mprec_bigtens>
8000989a:	16078a63          	beqz	a5,80009a0e <_dtoa_r+0x4c6>
8000989e:	02092603          	lw	a2,32(s2)
800098a2:	02492683          	lw	a3,36(s2)
800098a6:	4572                	lw	a0,28(sp)
800098a8:	5582                	lw	a1,32(sp)
800098aa:	c0ba                	sw	a4,64(sp)
800098ac:	00fa7a13          	andi	s4,s4,15
800098b0:	cacfa0ef          	jal	80003d5c <__divdf3>
800098b4:	4706                	lw	a4,64(sp)
800098b6:	882a                	mv	a6,a0
800098b8:	8d2e                	mv	s10,a1
800098ba:	4a8d                	li	s5,3
800098bc:	120a1563          	bnez	s4,800099e6 <_dtoa_r+0x49e>
800098c0:	863a                	mv	a2,a4
800098c2:	85ea                	mv	a1,s10
800098c4:	86ee                	mv	a3,s11
800098c6:	8542                	mv	a0,a6
800098c8:	c94fa0ef          	jal	80003d5c <__divdf3>
800098cc:	872a                	mv	a4,a0
800098ce:	8d2e                	mv	s10,a1
800098d0:	57c2                	lw	a5,48(sp)
800098d2:	1a079563          	bnez	a5,80009a7c <_dtoa_r+0x534>
800098d6:	8dce                	mv	s11,s3
800098d8:	895e                	mv	s2,s7
800098da:	8556                	mv	a0,s5
800098dc:	c0ba                	sw	a4,64(sp)
800098de:	f62fb0ef          	jal	80005040 <__floatsidf>
800098e2:	4606                	lw	a2,64(sp)
800098e4:	86ea                	mv	a3,s10
800098e6:	fcc00a37          	lui	s4,0xfcc00
800098ea:	9abfa0ef          	jal	80004294 <__muldf3>
800098ee:	8000e6b7          	lui	a3,0x8000e
800098f2:	f786a603          	lw	a2,-136(a3) # 8000df78 <_ctype_+0x140>
800098f6:	f7c6a683          	lw	a3,-132(a3)
800098fa:	ea9f90ef          	jal	800037a2 <__adddf3>
800098fe:	4706                	lw	a4,64(sp)
80009900:	8aaa                	mv	s5,a0
80009902:	9a2e                	add	s4,s4,a1
80009904:	1a091f63          	bnez	s2,80009ac2 <_dtoa_r+0x57a>
80009908:	8000e6b7          	lui	a3,0x8000e
8000990c:	f806a603          	lw	a2,-128(a3) # 8000df80 <_ctype_+0x148>
80009910:	f846a683          	lw	a3,-124(a3)
80009914:	853a                	mv	a0,a4
80009916:	85ea                	mv	a1,s10
80009918:	dc7fa0ef          	jal	800046de <__subdf3>
8000991c:	8656                	mv	a2,s5
8000991e:	86d2                	mv	a3,s4
80009920:	c0aa                	sw	a0,64(sp)
80009922:	c2ae                	sw	a1,68(sp)
80009924:	d22fb0ef          	jal	80004e46 <__gedf2>
80009928:	5ea04363          	bgtz	a0,80009f0e <_dtoa_r+0x9c6>
8000992c:	4506                	lw	a0,64(sp)
8000992e:	4596                	lw	a1,68(sp)
80009930:	800007b7          	lui	a5,0x80000
80009934:	8656                	mv	a2,s5
80009936:	00fa46b3          	xor	a3,s4,a5
8000993a:	dbefb0ef          	jal	80004ef8 <__ledf2>
8000993e:	36054063          	bltz	a0,80009c9e <_dtoa_r+0x756>
80009942:	57b6                	lw	a5,108(sp)
80009944:	3c07c963          	bltz	a5,80009d16 <_dtoa_r+0x7ce>
80009948:	00f9a713          	slti	a4,s3,15
8000994c:	3c070563          	beqz	a4,80009d16 <_dtoa_r+0x7ce>
80009950:	8000e737          	lui	a4,0x8000e
80009954:	00399793          	slli	a5,s3,0x3
80009958:	d0870713          	addi	a4,a4,-760 # 8000dd08 <__mprec_tens>
8000995c:	97ba                	add	a5,a5,a4
8000995e:	0007ad03          	lw	s10,0(a5) # 80000000 <__share_mem_end__+0x7ee80000>
80009962:	0047ad83          	lw	s11,4(a5)
80009966:	01704563          	bgtz	s7,80009970 <_dtoa_r+0x428>
8000996a:	47e2                	lw	a5,24(sp)
8000996c:	3007c563          	bltz	a5,80009c76 <_dtoa_r+0x72e>
80009970:	8000e7b7          	lui	a5,0x8000e
80009974:	f707ac03          	lw	s8,-144(a5) # 8000df70 <_ctype_+0x138>
80009978:	f747ac83          	lw	s9,-140(a5)
8000997c:	00148a93          	addi	s5,s1,1
80009980:	9ba6                	add	s7,s7,s1
80009982:	4572                	lw	a0,28(sp)
80009984:	5582                	lw	a1,32(sp)
80009986:	866a                	mv	a2,s10
80009988:	86ee                	mv	a3,s11
8000998a:	bd2fa0ef          	jal	80003d5c <__divdf3>
8000998e:	e50fb0ef          	jal	80004fde <__fixdfsi>
80009992:	8a2a                	mv	s4,a0
80009994:	eacfb0ef          	jal	80005040 <__floatsidf>
80009998:	866a                	mv	a2,s10
8000999a:	86ee                	mv	a3,s11
8000999c:	8f9fa0ef          	jal	80004294 <__muldf3>
800099a0:	862a                	mv	a2,a0
800099a2:	86ae                	mv	a3,a1
800099a4:	4572                	lw	a0,28(sp)
800099a6:	5582                	lw	a1,32(sp)
800099a8:	8956                	mv	s2,s5
800099aa:	d35fa0ef          	jal	800046de <__subdf3>
800099ae:	030a0793          	addi	a5,s4,48 # fcc00030 <__fast_load_addr__+0x7cbf1e70>
800099b2:	fefa8fa3          	sb	a5,-1(s5)
800099b6:	862a                	mv	a2,a0
800099b8:	86ae                	mv	a3,a1
800099ba:	355b9063          	bne	s7,s5,80009cfa <_dtoa_r+0x7b2>
800099be:	de5f90ef          	jal	800037a2 <__adddf3>
800099c2:	866a                	mv	a2,s10
800099c4:	86ee                	mv	a3,s11
800099c6:	8aaa                	mv	s5,a0
800099c8:	8b2e                	mv	s6,a1
800099ca:	c7cfb0ef          	jal	80004e46 <__gedf2>
800099ce:	30a04363          	bgtz	a0,80009cd4 <_dtoa_r+0x78c>
800099d2:	866a                	mv	a2,s10
800099d4:	86ee                	mv	a3,s11
800099d6:	8556                	mv	a0,s5
800099d8:	85da                	mv	a1,s6
800099da:	c0efb0ef          	jal	80004de8 <__eqdf2>
800099de:	2e050763          	beqz	a0,80009ccc <_dtoa_r+0x784>
800099e2:	8dce                	mv	s11,s3
800099e4:	a49d                	j	80009c4a <_dtoa_r+0x702>
800099e6:	001a7693          	andi	a3,s4,1
800099ea:	ce91                	beqz	a3,80009a06 <_dtoa_r+0x4be>
800099ec:	00092603          	lw	a2,0(s2)
800099f0:	00492683          	lw	a3,4(s2)
800099f4:	853a                	mv	a0,a4
800099f6:	85ee                	mv	a1,s11
800099f8:	c0c2                	sw	a6,64(sp)
800099fa:	89bfa0ef          	jal	80004294 <__muldf3>
800099fe:	4806                	lw	a6,64(sp)
80009a00:	0a85                	addi	s5,s5,1
80009a02:	872a                	mv	a4,a0
80009a04:	8dae                	mv	s11,a1
80009a06:	401a5a13          	srai	s4,s4,0x1
80009a0a:	0921                	addi	s2,s2,8
80009a0c:	bd45                	j	800098bc <_dtoa_r+0x374>
80009a0e:	4872                	lw	a6,28(sp)
80009a10:	5d02                	lw	s10,32(sp)
80009a12:	4a89                	li	s5,2
80009a14:	b565                	j	800098bc <_dtoa_r+0x374>
80009a16:	04098f63          	beqz	s3,80009a74 <_dtoa_r+0x52c>
80009a1a:	41300933          	neg	s2,s3
80009a1e:	00f97793          	andi	a5,s2,15
80009a22:	8000e737          	lui	a4,0x8000e
80009a26:	d0870713          	addi	a4,a4,-760 # 8000dd08 <__mprec_tens>
80009a2a:	078e                	slli	a5,a5,0x3
80009a2c:	97ba                	add	a5,a5,a4
80009a2e:	4390                	lw	a2,0(a5)
80009a30:	43d4                	lw	a3,4(a5)
80009a32:	4572                	lw	a0,28(sp)
80009a34:	5582                	lw	a1,32(sp)
80009a36:	8000ea37          	lui	s4,0x8000e
80009a3a:	40495913          	srai	s2,s2,0x4
80009a3e:	857fa0ef          	jal	80004294 <__muldf3>
80009a42:	872a                	mv	a4,a0
80009a44:	8d2e                	mv	s10,a1
80009a46:	ce0a0a13          	addi	s4,s4,-800 # 8000dce0 <__mprec_bigtens>
80009a4a:	4a89                	li	s5,2
80009a4c:	e80902e3          	beqz	s2,800098d0 <_dtoa_r+0x388>
80009a50:	00197693          	andi	a3,s2,1
80009a54:	ce81                	beqz	a3,80009a6c <_dtoa_r+0x524>
80009a56:	000a2603          	lw	a2,0(s4)
80009a5a:	004a2683          	lw	a3,4(s4)
80009a5e:	853a                	mv	a0,a4
80009a60:	85ea                	mv	a1,s10
80009a62:	833fa0ef          	jal	80004294 <__muldf3>
80009a66:	0a85                	addi	s5,s5,1
80009a68:	872a                	mv	a4,a0
80009a6a:	8d2e                	mv	s10,a1
80009a6c:	40195913          	srai	s2,s2,0x1
80009a70:	0a21                	addi	s4,s4,8
80009a72:	bfe9                	j	80009a4c <_dtoa_r+0x504>
80009a74:	4772                	lw	a4,28(sp)
80009a76:	5d02                	lw	s10,32(sp)
80009a78:	4a89                	li	s5,2
80009a7a:	bd99                	j	800098d0 <_dtoa_r+0x388>
80009a7c:	8000e6b7          	lui	a3,0x8000e
80009a80:	f686a603          	lw	a2,-152(a3) # 8000df68 <_ctype_+0x130>
80009a84:	f6c6a683          	lw	a3,-148(a3)
80009a88:	853a                	mv	a0,a4
80009a8a:	85ea                	mv	a1,s10
80009a8c:	c0ba                	sw	a4,64(sp)
80009a8e:	c6afb0ef          	jal	80004ef8 <__ledf2>
80009a92:	4706                	lw	a4,64(sp)
80009a94:	e40551e3          	bgez	a0,800098d6 <_dtoa_r+0x38e>
80009a98:	e20b8fe3          	beqz	s7,800098d6 <_dtoa_r+0x38e>
80009a9c:	eb9053e3          	blez	s9,80009942 <_dtoa_r+0x3fa>
80009aa0:	8000e6b7          	lui	a3,0x8000e
80009aa4:	f706a603          	lw	a2,-144(a3) # 8000df70 <_ctype_+0x138>
80009aa8:	f746a683          	lw	a3,-140(a3)
80009aac:	853a                	mv	a0,a4
80009aae:	85ea                	mv	a1,s10
80009ab0:	fe4fa0ef          	jal	80004294 <__muldf3>
80009ab4:	fff98d93          	addi	s11,s3,-1 # fe0fffff <__fast_load_addr__+0x7e0f1e3f>
80009ab8:	872a                	mv	a4,a0
80009aba:	8d2e                	mv	s10,a1
80009abc:	0a85                	addi	s5,s5,1
80009abe:	8966                	mv	s2,s9
80009ac0:	bd29                	j	800098da <_dtoa_r+0x392>
80009ac2:	fff90693          	addi	a3,s2,-1
80009ac6:	8000e637          	lui	a2,0x8000e
80009aca:	47d2                	lw	a5,20(sp)
80009acc:	068e                	slli	a3,a3,0x3
80009ace:	d0860613          	addi	a2,a2,-760 # 8000dd08 <__mprec_tens>
80009ad2:	96b2                	add	a3,a3,a2
80009ad4:	c4ba                	sw	a4,72(sp)
80009ad6:	4288                	lw	a0,0(a3)
80009ad8:	42cc                	lw	a1,4(a3)
80009ada:	c3f1                	beqz	a5,80009b9e <_dtoa_r+0x656>
80009adc:	86ae                	mv	a3,a1
80009ade:	8000e5b7          	lui	a1,0x8000e
80009ae2:	862a                	mv	a2,a0
80009ae4:	f885a503          	lw	a0,-120(a1) # 8000df88 <_ctype_+0x150>
80009ae8:	f8c5a583          	lw	a1,-116(a1)
80009aec:	a70fa0ef          	jal	80003d5c <__divdf3>
80009af0:	86d2                	mv	a3,s4
80009af2:	8656                	mv	a2,s5
80009af4:	bebfa0ef          	jal	800046de <__subdf3>
80009af8:	012487b3          	add	a5,s1,s2
80009afc:	8000e6b7          	lui	a3,0x8000e
80009b00:	f6c6a803          	lw	a6,-148(a3) # 8000df6c <_ctype_+0x134>
80009b04:	ccbe                	sw	a5,88(sp)
80009b06:	f686a783          	lw	a5,-152(a3)
80009b0a:	8000e6b7          	lui	a3,0x8000e
80009b0e:	cac2                	sw	a6,84(sp)
80009b10:	c8be                	sw	a5,80(sp)
80009b12:	f746a803          	lw	a6,-140(a3) # 8000df74 <_ctype_+0x13c>
80009b16:	f706a783          	lw	a5,-144(a3)
80009b1a:	4726                	lw	a4,72(sp)
80009b1c:	8aaa                	mv	s5,a0
80009b1e:	8a2e                	mv	s4,a1
80009b20:	8926                	mv	s2,s1
80009b22:	c0be                	sw	a5,64(sp)
80009b24:	c2c2                	sw	a6,68(sp)
80009b26:	853a                	mv	a0,a4
80009b28:	85ea                	mv	a1,s10
80009b2a:	c4ba                	sw	a4,72(sp)
80009b2c:	cb2fb0ef          	jal	80004fde <__fixdfsi>
80009b30:	ceaa                	sw	a0,92(sp)
80009b32:	d0efb0ef          	jal	80005040 <__floatsidf>
80009b36:	862a                	mv	a2,a0
80009b38:	4526                	lw	a0,72(sp)
80009b3a:	86ae                	mv	a3,a1
80009b3c:	85ea                	mv	a1,s10
80009b3e:	ba1fa0ef          	jal	800046de <__subdf3>
80009b42:	47f6                	lw	a5,92(sp)
80009b44:	0905                	addi	s2,s2,1
80009b46:	8656                	mv	a2,s5
80009b48:	03078793          	addi	a5,a5,48
80009b4c:	fef90fa3          	sb	a5,-1(s2)
80009b50:	86d2                	mv	a3,s4
80009b52:	c4aa                	sw	a0,72(sp)
80009b54:	c6ae                	sw	a1,76(sp)
80009b56:	ba2fb0ef          	jal	80004ef8 <__ledf2>
80009b5a:	0e054863          	bltz	a0,80009c4a <_dtoa_r+0x702>
80009b5e:	4626                	lw	a2,72(sp)
80009b60:	46b6                	lw	a3,76(sp)
80009b62:	4546                	lw	a0,80(sp)
80009b64:	45d6                	lw	a1,84(sp)
80009b66:	b79fa0ef          	jal	800046de <__subdf3>
80009b6a:	8656                	mv	a2,s5
80009b6c:	86d2                	mv	a3,s4
80009b6e:	b8afb0ef          	jal	80004ef8 <__ledf2>
80009b72:	16054263          	bltz	a0,80009cd6 <_dtoa_r+0x78e>
80009b76:	47e6                	lw	a5,88(sp)
80009b78:	dcf905e3          	beq	s2,a5,80009942 <_dtoa_r+0x3fa>
80009b7c:	4606                	lw	a2,64(sp)
80009b7e:	4696                	lw	a3,68(sp)
80009b80:	8556                	mv	a0,s5
80009b82:	85d2                	mv	a1,s4
80009b84:	f10fa0ef          	jal	80004294 <__muldf3>
80009b88:	4606                	lw	a2,64(sp)
80009b8a:	4696                	lw	a3,68(sp)
80009b8c:	8aaa                	mv	s5,a0
80009b8e:	8a2e                	mv	s4,a1
80009b90:	4526                	lw	a0,72(sp)
80009b92:	45b6                	lw	a1,76(sp)
80009b94:	f00fa0ef          	jal	80004294 <__muldf3>
80009b98:	872a                	mv	a4,a0
80009b9a:	8d2e                	mv	s10,a1
80009b9c:	b769                	j	80009b26 <_dtoa_r+0x5de>
80009b9e:	8656                	mv	a2,s5
80009ba0:	86d2                	mv	a3,s4
80009ba2:	ef2fa0ef          	jal	80004294 <__muldf3>
80009ba6:	012487b3          	add	a5,s1,s2
80009baa:	8000e6b7          	lui	a3,0x8000e
80009bae:	f746a803          	lw	a6,-140(a3) # 8000df74 <_ctype_+0x13c>
80009bb2:	ccbe                	sw	a5,88(sp)
80009bb4:	f706a783          	lw	a5,-144(a3)
80009bb8:	4726                	lw	a4,72(sp)
80009bba:	c0aa                	sw	a0,64(sp)
80009bbc:	c2ae                	sw	a1,68(sp)
80009bbe:	8aa6                	mv	s5,s1
80009bc0:	c8be                	sw	a5,80(sp)
80009bc2:	cac2                	sw	a6,84(sp)
80009bc4:	853a                	mv	a0,a4
80009bc6:	85ea                	mv	a1,s10
80009bc8:	c4ba                	sw	a4,72(sp)
80009bca:	c14fb0ef          	jal	80004fde <__fixdfsi>
80009bce:	03050a13          	addi	s4,a0,48
80009bd2:	c6efb0ef          	jal	80005040 <__floatsidf>
80009bd6:	862a                	mv	a2,a0
80009bd8:	4526                	lw	a0,72(sp)
80009bda:	86ae                	mv	a3,a1
80009bdc:	85ea                	mv	a1,s10
80009bde:	b01fa0ef          	jal	800046de <__subdf3>
80009be2:	47e6                	lw	a5,88(sp)
80009be4:	0a85                	addi	s5,s5,1
80009be6:	c4aa                	sw	a0,72(sp)
80009be8:	c6ae                	sw	a1,76(sp)
80009bea:	ff4a8fa3          	sb	s4,-1(s5)
80009bee:	06fa9d63          	bne	s5,a5,80009c68 <_dtoa_r+0x720>
80009bf2:	8000ea37          	lui	s4,0x8000e
80009bf6:	f88a2603          	lw	a2,-120(s4) # 8000df88 <_ctype_+0x150>
80009bfa:	f8ca2683          	lw	a3,-116(s4)
80009bfe:	4506                	lw	a0,64(sp)
80009c00:	4596                	lw	a1,68(sp)
80009c02:	9926                	add	s2,s2,s1
80009c04:	b9ff90ef          	jal	800037a2 <__adddf3>
80009c08:	862a                	mv	a2,a0
80009c0a:	86ae                	mv	a3,a1
80009c0c:	4526                	lw	a0,72(sp)
80009c0e:	45b6                	lw	a1,76(sp)
80009c10:	a36fb0ef          	jal	80004e46 <__gedf2>
80009c14:	0ca04163          	bgtz	a0,80009cd6 <_dtoa_r+0x78e>
80009c18:	4606                	lw	a2,64(sp)
80009c1a:	4696                	lw	a3,68(sp)
80009c1c:	f88a2503          	lw	a0,-120(s4)
80009c20:	f8ca2583          	lw	a1,-116(s4)
80009c24:	abbfa0ef          	jal	800046de <__subdf3>
80009c28:	862a                	mv	a2,a0
80009c2a:	86ae                	mv	a3,a1
80009c2c:	4526                	lw	a0,72(sp)
80009c2e:	45b6                	lw	a1,76(sp)
80009c30:	ac8fb0ef          	jal	80004ef8 <__ledf2>
80009c34:	d00557e3          	bgez	a0,80009942 <_dtoa_r+0x3fa>
80009c38:	03000713          	li	a4,48
80009c3c:	87ca                	mv	a5,s2
80009c3e:	fff94683          	lbu	a3,-1(s2)
80009c42:	197d                	addi	s2,s2,-1
80009c44:	fee68ce3          	beq	a3,a4,80009c3c <_dtoa_r+0x6f4>
80009c48:	893e                	mv	s2,a5
80009c4a:	45b2                	lw	a1,12(sp)
80009c4c:	4522                	lw	a0,8(sp)
80009c4e:	27d1                	jal	8000a412 <_Bfree>
80009c50:	5752                	lw	a4,52(sp)
80009c52:	001d8793          	addi	a5,s11,1
80009c56:	00090023          	sb	zero,0(s2)
80009c5a:	c31c                	sw	a5,0(a4)
80009c5c:	5792                	lw	a5,36(sp)
80009c5e:	4c078663          	beqz	a5,8000a12a <_dtoa_r+0xbe2>
80009c62:	0127a023          	sw	s2,0(a5)
80009c66:	a1d1                	j	8000a12a <_dtoa_r+0xbe2>
80009c68:	4646                	lw	a2,80(sp)
80009c6a:	46d6                	lw	a3,84(sp)
80009c6c:	e28fa0ef          	jal	80004294 <__muldf3>
80009c70:	872a                	mv	a4,a0
80009c72:	8d2e                	mv	s10,a1
80009c74:	bf81                	j	80009bc4 <_dtoa_r+0x67c>
80009c76:	020b9463          	bnez	s7,80009c9e <_dtoa_r+0x756>
80009c7a:	8000e7b7          	lui	a5,0x8000e
80009c7e:	f807a603          	lw	a2,-128(a5) # 8000df80 <_ctype_+0x148>
80009c82:	f847a683          	lw	a3,-124(a5)
80009c86:	856a                	mv	a0,s10
80009c88:	85ee                	mv	a1,s11
80009c8a:	e0afa0ef          	jal	80004294 <__muldf3>
80009c8e:	862a                	mv	a2,a0
80009c90:	86ae                	mv	a3,a1
80009c92:	4572                	lw	a0,28(sp)
80009c94:	5582                	lw	a1,32(sp)
80009c96:	a62fb0ef          	jal	80004ef8 <__ledf2>
80009c9a:	26a04963          	bgtz	a0,80009f0c <_dtoa_r+0x9c4>
80009c9e:	4a81                	li	s5,0
80009ca0:	4a01                	li	s4,0
80009ca2:	47e2                	lw	a5,24(sp)
80009ca4:	8926                	mv	s2,s1
80009ca6:	fff7cd93          	not	s11,a5
80009caa:	4b01                	li	s6,0
80009cac:	4522                	lw	a0,8(sp)
80009cae:	85d6                	mv	a1,s5
80009cb0:	278d                	jal	8000a412 <_Bfree>
80009cb2:	f80a0ce3          	beqz	s4,80009c4a <_dtoa_r+0x702>
80009cb6:	014b0763          	beq	s6,s4,80009cc4 <_dtoa_r+0x77c>
80009cba:	000b0563          	beqz	s6,80009cc4 <_dtoa_r+0x77c>
80009cbe:	4522                	lw	a0,8(sp)
80009cc0:	85da                	mv	a1,s6
80009cc2:	2f81                	jal	8000a412 <_Bfree>
80009cc4:	4522                	lw	a0,8(sp)
80009cc6:	85d2                	mv	a1,s4
80009cc8:	27a9                	jal	8000a412 <_Bfree>
80009cca:	b741                	j	80009c4a <_dtoa_r+0x702>
80009ccc:	001a7a13          	andi	s4,s4,1
80009cd0:	d00a09e3          	beqz	s4,800099e2 <_dtoa_r+0x49a>
80009cd4:	8dce                	mv	s11,s3
80009cd6:	87ca                	mv	a5,s2
80009cd8:	03900693          	li	a3,57
80009cdc:	893e                	mv	s2,a5
80009cde:	fff7c703          	lbu	a4,-1(a5)
80009ce2:	17fd                	addi	a5,a5,-1
80009ce4:	00d71763          	bne	a4,a3,80009cf2 <_dtoa_r+0x7aa>
80009ce8:	fef49ae3          	bne	s1,a5,80009cdc <_dtoa_r+0x794>
80009cec:	0d85                	addi	s11,s11,1
80009cee:	03000713          	li	a4,48
80009cf2:	0705                	addi	a4,a4,1
80009cf4:	00e78023          	sb	a4,0(a5)
80009cf8:	bf89                	j	80009c4a <_dtoa_r+0x702>
80009cfa:	8662                	mv	a2,s8
80009cfc:	86e6                	mv	a3,s9
80009cfe:	d96fa0ef          	jal	80004294 <__muldf3>
80009d02:	4601                	li	a2,0
80009d04:	4681                	li	a3,0
80009d06:	ce2a                	sw	a0,28(sp)
80009d08:	d02e                	sw	a1,32(sp)
80009d0a:	0a85                	addi	s5,s5,1
80009d0c:	8dcfb0ef          	jal	80004de8 <__eqdf2>
80009d10:	c60519e3          	bnez	a0,80009982 <_dtoa_r+0x43a>
80009d14:	b1f9                	j	800099e2 <_dtoa_r+0x49a>
80009d16:	4752                	lw	a4,20(sp)
80009d18:	18070863          	beqz	a4,80009ea8 <_dtoa_r+0x960>
80009d1c:	4705                	li	a4,1
80009d1e:	14874a63          	blt	a4,s0,80009e72 <_dtoa_r+0x92a>
80009d22:	5762                	lw	a4,56(sp)
80009d24:	43378793          	addi	a5,a5,1075
80009d28:	e709                	bnez	a4,80009d32 <_dtoa_r+0x7ea>
80009d2a:	5726                	lw	a4,104(sp)
80009d2c:	03600793          	li	a5,54
80009d30:	8f99                	sub	a5,a5,a4
80009d32:	4ac2                	lw	s5,16(sp)
80009d34:	895a                	mv	s2,s6
80009d36:	4522                	lw	a0,8(sp)
80009d38:	4585                	li	a1,1
80009d3a:	9b3e                	add	s6,s6,a5
80009d3c:	9c3e                	add	s8,s8,a5
80009d3e:	151000ef          	jal	8000a68e <__i2b>
80009d42:	8a2a                	mv	s4,a0
80009d44:	00090e63          	beqz	s2,80009d60 <_dtoa_r+0x818>
80009d48:	01805c63          	blez	s8,80009d60 <_dtoa_r+0x818>
80009d4c:	87ca                	mv	a5,s2
80009d4e:	012c5363          	bge	s8,s2,80009d54 <_dtoa_r+0x80c>
80009d52:	87e2                	mv	a5,s8
80009d54:	40fb0b33          	sub	s6,s6,a5
80009d58:	40f90933          	sub	s2,s2,a5
80009d5c:	40fc0c33          	sub	s8,s8,a5
80009d60:	47c2                	lw	a5,16(sp)
80009d62:	c3b1                	beqz	a5,80009da6 <_dtoa_r+0x85e>
80009d64:	47d2                	lw	a5,20(sp)
80009d66:	14078563          	beqz	a5,80009eb0 <_dtoa_r+0x968>
80009d6a:	4db2                	lw	s11,12(sp)
80009d6c:	020a8763          	beqz	s5,80009d9a <_dtoa_r+0x852>
80009d70:	4522                	lw	a0,8(sp)
80009d72:	85d2                	mv	a1,s4
80009d74:	8656                	mv	a2,s5
80009d76:	2d5000ef          	jal	8000a84a <__pow5mult>
80009d7a:	85aa                	mv	a1,a0
80009d7c:	4632                	lw	a2,12(sp)
80009d7e:	8a2a                	mv	s4,a0
80009d80:	4522                	lw	a0,8(sp)
80009d82:	143000ef          	jal	8000a6c4 <__multiply>
80009d86:	8daa                	mv	s11,a0
80009d88:	45b2                	lw	a1,12(sp)
80009d8a:	4522                	lw	a0,8(sp)
80009d8c:	2559                	jal	8000a412 <_Bfree>
80009d8e:	47c2                	lw	a5,16(sp)
80009d90:	c66e                	sw	s11,12(sp)
80009d92:	415787b3          	sub	a5,a5,s5
80009d96:	c83e                	sw	a5,16(sp)
80009d98:	c799                	beqz	a5,80009da6 <_dtoa_r+0x85e>
80009d9a:	4642                	lw	a2,16(sp)
80009d9c:	85ee                	mv	a1,s11
80009d9e:	4522                	lw	a0,8(sp)
80009da0:	2ab000ef          	jal	8000a84a <__pow5mult>
80009da4:	c62a                	sw	a0,12(sp)
80009da6:	4522                	lw	a0,8(sp)
80009da8:	4585                	li	a1,1
80009daa:	0e5000ef          	jal	8000a68e <__i2b>
80009dae:	57a2                	lw	a5,40(sp)
80009db0:	8aaa                	mv	s5,a0
80009db2:	38078c63          	beqz	a5,8000a14a <_dtoa_r+0xc02>
80009db6:	85aa                	mv	a1,a0
80009db8:	4522                	lw	a0,8(sp)
80009dba:	863e                	mv	a2,a5
80009dbc:	4d01                	li	s10,0
80009dbe:	28d000ef          	jal	8000a84a <__pow5mult>
80009dc2:	4785                	li	a5,1
80009dc4:	8aaa                	mv	s5,a0
80009dc6:	0087c963          	blt	a5,s0,80009dd8 <_dtoa_r+0x890>
80009dca:	57f2                	lw	a5,60(sp)
80009dcc:	0e078563          	beqz	a5,80009eb6 <_dtoa_r+0x96e>
80009dd0:	4d01                	li	s10,0
80009dd2:	57a2                	lw	a5,40(sp)
80009dd4:	4505                	li	a0,1
80009dd6:	cf89                	beqz	a5,80009df0 <_dtoa_r+0x8a8>
80009dd8:	010aa783          	lw	a5,16(s5)
80009ddc:	078d                	addi	a5,a5,3
80009dde:	078a                	slli	a5,a5,0x2
80009de0:	97d6                	add	a5,a5,s5
80009de2:	43c8                	lw	a0,4(a5)
80009de4:	7fa000ef          	jal	8000a5de <__hi0bits>
80009de8:	02000793          	li	a5,32
80009dec:	40a78533          	sub	a0,a5,a0
80009df0:	9562                	add	a0,a0,s8
80009df2:	897d                	andi	a0,a0,31
80009df4:	0e050663          	beqz	a0,80009ee0 <_dtoa_r+0x998>
80009df8:	476d                	li	a4,27
80009dfa:	47f1                	li	a5,28
80009dfc:	0ca74c63          	blt	a4,a0,80009ed4 <_dtoa_r+0x98c>
80009e00:	8f89                	sub	a5,a5,a0
80009e02:	9b3e                	add	s6,s6,a5
80009e04:	993e                	add	s2,s2,a5
80009e06:	9c3e                	add	s8,s8,a5
80009e08:	01605863          	blez	s6,80009e18 <_dtoa_r+0x8d0>
80009e0c:	45b2                	lw	a1,12(sp)
80009e0e:	4522                	lw	a0,8(sp)
80009e10:	865a                	mv	a2,s6
80009e12:	30f000ef          	jal	8000a920 <__lshift>
80009e16:	c62a                	sw	a0,12(sp)
80009e18:	01805863          	blez	s8,80009e28 <_dtoa_r+0x8e0>
80009e1c:	4522                	lw	a0,8(sp)
80009e1e:	85d6                	mv	a1,s5
80009e20:	8662                	mv	a2,s8
80009e22:	2ff000ef          	jal	8000a920 <__lshift>
80009e26:	8aaa                	mv	s5,a0
80009e28:	57c2                	lw	a5,48(sp)
80009e2a:	c799                	beqz	a5,80009e38 <_dtoa_r+0x8f0>
80009e2c:	4532                	lw	a0,12(sp)
80009e2e:	85d6                	mv	a1,s5
80009e30:	3e9000ef          	jal	8000aa18 <__mcmp>
80009e34:	0a054b63          	bltz	a0,80009eea <_dtoa_r+0x9a2>
80009e38:	8dce                	mv	s11,s3
80009e3a:	8cde                	mv	s9,s7
80009e3c:	0d904c63          	bgtz	s9,80009f14 <_dtoa_r+0x9cc>
80009e40:	00342793          	slti	a5,s0,3
80009e44:	ebe1                	bnez	a5,80009f14 <_dtoa_r+0x9cc>
80009e46:	e40c9ee3          	bnez	s9,80009ca2 <_dtoa_r+0x75a>
80009e4a:	4522                	lw	a0,8(sp)
80009e4c:	85d6                	mv	a1,s5
80009e4e:	4681                	li	a3,0
80009e50:	4615                	li	a2,5
80009e52:	2d31                	jal	8000a46e <__multadd>
80009e54:	8aaa                	mv	s5,a0
80009e56:	85aa                	mv	a1,a0
80009e58:	4532                	lw	a0,12(sp)
80009e5a:	3bf000ef          	jal	8000aa18 <__mcmp>
80009e5e:	e4a052e3          	blez	a0,80009ca2 <_dtoa_r+0x75a>
80009e62:	03100793          	li	a5,49
80009e66:	00148913          	addi	s2,s1,1
80009e6a:	00f48023          	sb	a5,0(s1)
80009e6e:	0d85                	addi	s11,s11,1
80009e70:	bd2d                	j	80009caa <_dtoa_r+0x762>
80009e72:	47c2                	lw	a5,16(sp)
80009e74:	fffb8a93          	addi	s5,s7,-1
80009e78:	0157c963          	blt	a5,s5,80009e8a <_dtoa_r+0x942>
80009e7c:	41578ab3          	sub	s5,a5,s5
80009e80:	020bc063          	bltz	s7,80009ea0 <_dtoa_r+0x958>
80009e84:	895a                	mv	s2,s6
80009e86:	87de                	mv	a5,s7
80009e88:	b57d                	j	80009d36 <_dtoa_r+0x7ee>
80009e8a:	47c2                	lw	a5,16(sp)
80009e8c:	5722                	lw	a4,40(sp)
80009e8e:	c856                	sw	s5,16(sp)
80009e90:	40fa87b3          	sub	a5,s5,a5
80009e94:	97ba                	add	a5,a5,a4
80009e96:	d43e                	sw	a5,40(sp)
80009e98:	895a                	mv	s2,s6
80009e9a:	87de                	mv	a5,s7
80009e9c:	4a81                	li	s5,0
80009e9e:	bd61                	j	80009d36 <_dtoa_r+0x7ee>
80009ea0:	417b0933          	sub	s2,s6,s7
80009ea4:	4781                	li	a5,0
80009ea6:	bd41                	j	80009d36 <_dtoa_r+0x7ee>
80009ea8:	4ac2                	lw	s5,16(sp)
80009eaa:	895a                	mv	s2,s6
80009eac:	4a01                	li	s4,0
80009eae:	bd59                	j	80009d44 <_dtoa_r+0x7fc>
80009eb0:	4642                	lw	a2,16(sp)
80009eb2:	45b2                	lw	a1,12(sp)
80009eb4:	b5ed                	j	80009d9e <_dtoa_r+0x856>
80009eb6:	57b2                	lw	a5,44(sp)
80009eb8:	07b2                	slli	a5,a5,0xc
80009eba:	f0079be3          	bnez	a5,80009dd0 <_dtoa_r+0x888>
80009ebe:	5732                	lw	a4,44(sp)
80009ec0:	01475793          	srli	a5,a4,0x14
80009ec4:	7ff7f793          	andi	a5,a5,2047
80009ec8:	f00784e3          	beqz	a5,80009dd0 <_dtoa_r+0x888>
80009ecc:	0b05                	addi	s6,s6,1
80009ece:	0c05                	addi	s8,s8,1
80009ed0:	4d05                	li	s10,1
80009ed2:	b701                	j	80009dd2 <_dtoa_r+0x88a>
80009ed4:	f2f50ae3          	beq	a0,a5,80009e08 <_dtoa_r+0x8c0>
80009ed8:	02000793          	li	a5,32
80009edc:	40a78533          	sub	a0,a5,a0
80009ee0:	0571                	addi	a0,a0,28
80009ee2:	9b2a                	add	s6,s6,a0
80009ee4:	992a                	add	s2,s2,a0
80009ee6:	9c2a                	add	s8,s8,a0
80009ee8:	b705                	j	80009e08 <_dtoa_r+0x8c0>
80009eea:	45b2                	lw	a1,12(sp)
80009eec:	4522                	lw	a0,8(sp)
80009eee:	4681                	li	a3,0
80009ef0:	4629                	li	a2,10
80009ef2:	2bb5                	jal	8000a46e <__multadd>
80009ef4:	47d2                	lw	a5,20(sp)
80009ef6:	c62a                	sw	a0,12(sp)
80009ef8:	fff98d93          	addi	s11,s3,-1
80009efc:	d3a1                	beqz	a5,80009e3c <_dtoa_r+0x8f4>
80009efe:	4522                	lw	a0,8(sp)
80009f00:	85d2                	mv	a1,s4
80009f02:	4681                	li	a3,0
80009f04:	4629                	li	a2,10
80009f06:	23a5                	jal	8000a46e <__multadd>
80009f08:	8a2a                	mv	s4,a0
80009f0a:	bf0d                	j	80009e3c <_dtoa_r+0x8f4>
80009f0c:	8dce                	mv	s11,s3
80009f0e:	4a81                	li	s5,0
80009f10:	4a01                	li	s4,0
80009f12:	bf81                	j	80009e62 <_dtoa_r+0x91a>
80009f14:	47d2                	lw	a5,20(sp)
80009f16:	16078f63          	beqz	a5,8000a094 <_dtoa_r+0xb4c>
80009f1a:	01205863          	blez	s2,80009f2a <_dtoa_r+0x9e2>
80009f1e:	4522                	lw	a0,8(sp)
80009f20:	85d2                	mv	a1,s4
80009f22:	864a                	mv	a2,s2
80009f24:	1fd000ef          	jal	8000a920 <__lshift>
80009f28:	8a2a                	mv	s4,a0
80009f2a:	8552                	mv	a0,s4
80009f2c:	020d0f63          	beqz	s10,80009f6a <_dtoa_r+0xa22>
80009f30:	004a2583          	lw	a1,4(s4)
80009f34:	4522                	lw	a0,8(sp)
80009f36:	2181                	jal	8000a376 <_Balloc>
80009f38:	892a                	mv	s2,a0
80009f3a:	e911                	bnez	a0,80009f4e <_dtoa_r+0xa06>
80009f3c:	8000e6b7          	lui	a3,0x8000e
80009f40:	af468693          	addi	a3,a3,-1292 # 8000daf4 <s_wdgs+0x11c>
80009f44:	4601                	li	a2,0
80009f46:	2ef00593          	li	a1,751
80009f4a:	e4cff06f          	j	80009596 <_dtoa_r+0x4e>
80009f4e:	010a2603          	lw	a2,16(s4)
80009f52:	00ca0593          	addi	a1,s4,12
80009f56:	0531                	addi	a0,a0,12
80009f58:	0609                	addi	a2,a2,2
80009f5a:	060a                	slli	a2,a2,0x2
80009f5c:	e55fa0ef          	jal	80004db0 <memcpy>
80009f60:	4522                	lw	a0,8(sp)
80009f62:	4605                	li	a2,1
80009f64:	85ca                	mv	a1,s2
80009f66:	1bb000ef          	jal	8000a920 <__lshift>
80009f6a:	009c87b3          	add	a5,s9,s1
80009f6e:	cc3e                	sw	a5,24(sp)
80009f70:	57f2                	lw	a5,60(sp)
80009f72:	8b52                	mv	s6,s4
80009f74:	00148c13          	addi	s8,s1,1
80009f78:	8b85                	andi	a5,a5,1
80009f7a:	8a2a                	mv	s4,a0
80009f7c:	c83e                	sw	a5,16(sp)
80009f7e:	4532                	lw	a0,12(sp)
80009f80:	85d6                	mv	a1,s5
80009f82:	fffc0c93          	addi	s9,s8,-1
80009f86:	c8cff0ef          	jal	80009412 <quorem>
80009f8a:	8d2a                	mv	s10,a0
80009f8c:	03050993          	addi	s3,a0,48
80009f90:	4532                	lw	a0,12(sp)
80009f92:	85da                	mv	a1,s6
80009f94:	285000ef          	jal	8000aa18 <__mcmp>
80009f98:	8baa                	mv	s7,a0
80009f9a:	4522                	lw	a0,8(sp)
80009f9c:	85d6                	mv	a1,s5
80009f9e:	8652                	mv	a2,s4
80009fa0:	2af000ef          	jal	8000aa4e <__mdiff>
80009fa4:	4554                	lw	a3,12(a0)
80009fa6:	4752                	lw	a4,20(sp)
80009fa8:	85aa                	mv	a1,a0
80009faa:	e699                	bnez	a3,80009fb8 <_dtoa_r+0xa70>
80009fac:	ce2a                	sw	a0,28(sp)
80009fae:	4532                	lw	a0,12(sp)
80009fb0:	269000ef          	jal	8000aa18 <__mcmp>
80009fb4:	45f2                	lw	a1,28(sp)
80009fb6:	872a                	mv	a4,a0
80009fb8:	4522                	lw	a0,8(sp)
80009fba:	ce3a                	sw	a4,28(sp)
80009fbc:	8962                	mv	s2,s8
80009fbe:	2991                	jal	8000a412 <_Bfree>
80009fc0:	4772                	lw	a4,28(sp)
80009fc2:	47c2                	lw	a5,16(sp)
80009fc4:	008766b3          	or	a3,a4,s0
80009fc8:	8edd                	or	a3,a3,a5
80009fca:	ee81                	bnez	a3,80009fe2 <_dtoa_r+0xa9a>
80009fcc:	03900713          	li	a4,57
80009fd0:	04e98763          	beq	s3,a4,8000a01e <_dtoa_r+0xad6>
80009fd4:	01705463          	blez	s7,80009fdc <_dtoa_r+0xa94>
80009fd8:	031d0993          	addi	s3,s10,49
80009fdc:	013c8023          	sb	s3,0(s9)
80009fe0:	b1f1                	j	80009cac <_dtoa_r+0x764>
80009fe2:	000bc963          	bltz	s7,80009ff4 <_dtoa_r+0xaac>
80009fe6:	47c2                	lw	a5,16(sp)
80009fe8:	008bebb3          	or	s7,s7,s0
80009fec:	00fbebb3          	or	s7,s7,a5
80009ff0:	040b9863          	bnez	s7,8000a040 <_dtoa_r+0xaf8>
80009ff4:	fee054e3          	blez	a4,80009fdc <_dtoa_r+0xa94>
80009ff8:	45b2                	lw	a1,12(sp)
80009ffa:	4522                	lw	a0,8(sp)
80009ffc:	4605                	li	a2,1
80009ffe:	123000ef          	jal	8000a920 <__lshift>
8000a002:	85d6                	mv	a1,s5
8000a004:	c62a                	sw	a0,12(sp)
8000a006:	213000ef          	jal	8000aa18 <__mcmp>
8000a00a:	00a04663          	bgtz	a0,8000a016 <_dtoa_r+0xace>
8000a00e:	f579                	bnez	a0,80009fdc <_dtoa_r+0xa94>
8000a010:	0019f713          	andi	a4,s3,1
8000a014:	d761                	beqz	a4,80009fdc <_dtoa_r+0xa94>
8000a016:	03900713          	li	a4,57
8000a01a:	fae99fe3          	bne	s3,a4,80009fd8 <_dtoa_r+0xa90>
8000a01e:	03900793          	li	a5,57
8000a022:	00fc8023          	sb	a5,0(s9)
8000a026:	87ca                	mv	a5,s2
8000a028:	03900693          	li	a3,57
8000a02c:	893e                	mv	s2,a5
8000a02e:	fff94703          	lbu	a4,-1(s2)
8000a032:	17fd                	addi	a5,a5,-1
8000a034:	0cd70763          	beq	a4,a3,8000a102 <_dtoa_r+0xbba>
8000a038:	0705                	addi	a4,a4,1
8000a03a:	00e78023          	sb	a4,0(a5)
8000a03e:	b1bd                	j	80009cac <_dtoa_r+0x764>
8000a040:	00e05b63          	blez	a4,8000a056 <_dtoa_r+0xb0e>
8000a044:	03900713          	li	a4,57
8000a048:	fce98be3          	beq	s3,a4,8000a01e <_dtoa_r+0xad6>
8000a04c:	00198793          	addi	a5,s3,1
8000a050:	00fc8023          	sb	a5,0(s9)
8000a054:	b9a1                	j	80009cac <_dtoa_r+0x764>
8000a056:	47e2                	lw	a5,24(sp)
8000a058:	ff3c0fa3          	sb	s3,-1(s8)
8000a05c:	07878a63          	beq	a5,s8,8000a0d0 <_dtoa_r+0xb88>
8000a060:	45b2                	lw	a1,12(sp)
8000a062:	4522                	lw	a0,8(sp)
8000a064:	4681                	li	a3,0
8000a066:	4629                	li	a2,10
8000a068:	2119                	jal	8000a46e <__multadd>
8000a06a:	c62a                	sw	a0,12(sp)
8000a06c:	4681                	li	a3,0
8000a06e:	4522                	lw	a0,8(sp)
8000a070:	4629                	li	a2,10
8000a072:	85da                	mv	a1,s6
8000a074:	014b1763          	bne	s6,s4,8000a082 <_dtoa_r+0xb3a>
8000a078:	2edd                	jal	8000a46e <__multadd>
8000a07a:	8b2a                	mv	s6,a0
8000a07c:	8a2a                	mv	s4,a0
8000a07e:	0c05                	addi	s8,s8,1
8000a080:	bdfd                	j	80009f7e <_dtoa_r+0xa36>
8000a082:	26f5                	jal	8000a46e <__multadd>
8000a084:	8b2a                	mv	s6,a0
8000a086:	4522                	lw	a0,8(sp)
8000a088:	85d2                	mv	a1,s4
8000a08a:	4681                	li	a3,0
8000a08c:	4629                	li	a2,10
8000a08e:	26c5                	jal	8000a46e <__multadd>
8000a090:	8a2a                	mv	s4,a0
8000a092:	b7f5                	j	8000a07e <_dtoa_r+0xb36>
8000a094:	4901                	li	s2,0
8000a096:	4532                	lw	a0,12(sp)
8000a098:	85d6                	mv	a1,s5
8000a09a:	b78ff0ef          	jal	80009412 <quorem>
8000a09e:	01248733          	add	a4,s1,s2
8000a0a2:	03050993          	addi	s3,a0,48
8000a0a6:	01370023          	sb	s3,0(a4)
8000a0aa:	0905                	addi	s2,s2,1
8000a0ac:	01995963          	bge	s2,s9,8000a0be <_dtoa_r+0xb76>
8000a0b0:	45b2                	lw	a1,12(sp)
8000a0b2:	4522                	lw	a0,8(sp)
8000a0b4:	4681                	li	a3,0
8000a0b6:	4629                	li	a2,10
8000a0b8:	2e5d                	jal	8000a46e <__multadd>
8000a0ba:	c62a                	sw	a0,12(sp)
8000a0bc:	bfe9                	j	8000a096 <_dtoa_r+0xb4e>
8000a0be:	4901                	li	s2,0
8000a0c0:	01905463          	blez	s9,8000a0c8 <_dtoa_r+0xb80>
8000a0c4:	fffc8913          	addi	s2,s9,-1
8000a0c8:	00148713          	addi	a4,s1,1
8000a0cc:	993a                	add	s2,s2,a4
8000a0ce:	4b01                	li	s6,0
8000a0d0:	45b2                	lw	a1,12(sp)
8000a0d2:	4522                	lw	a0,8(sp)
8000a0d4:	4605                	li	a2,1
8000a0d6:	04b000ef          	jal	8000a920 <__lshift>
8000a0da:	85d6                	mv	a1,s5
8000a0dc:	c62a                	sw	a0,12(sp)
8000a0de:	13b000ef          	jal	8000aa18 <__mcmp>
8000a0e2:	f4a042e3          	bgtz	a0,8000a026 <_dtoa_r+0xade>
8000a0e6:	e501                	bnez	a0,8000a0ee <_dtoa_r+0xba6>
8000a0e8:	0019f793          	andi	a5,s3,1
8000a0ec:	ff8d                	bnez	a5,8000a026 <_dtoa_r+0xade>
8000a0ee:	87ca                	mv	a5,s2
8000a0f0:	03000713          	li	a4,48
8000a0f4:	893e                	mv	s2,a5
8000a0f6:	fff7c683          	lbu	a3,-1(a5)
8000a0fa:	17fd                	addi	a5,a5,-1
8000a0fc:	fee68ce3          	beq	a3,a4,8000a0f4 <_dtoa_r+0xbac>
8000a100:	b675                	j	80009cac <_dtoa_r+0x764>
8000a102:	f2f495e3          	bne	s1,a5,8000a02c <_dtoa_r+0xae4>
8000a106:	03100793          	li	a5,49
8000a10a:	0d85                	addi	s11,s11,1
8000a10c:	00f48023          	sb	a5,0(s1)
8000a110:	be71                	j	80009cac <_dtoa_r+0x764>
8000a112:	5712                	lw	a4,36(sp)
8000a114:	8000e7b7          	lui	a5,0x8000e
8000a118:	a6c78493          	addi	s1,a5,-1428 # 8000da6c <s_wdgs+0x94>
8000a11c:	c719                	beqz	a4,8000a12a <_dtoa_r+0xbe2>
8000a11e:	8000e7b7          	lui	a5,0x8000e
8000a122:	a7478793          	addi	a5,a5,-1420 # 8000da74 <s_wdgs+0x9c>
8000a126:	5712                	lw	a4,36(sp)
8000a128:	c31c                	sw	a5,0(a4)
8000a12a:	50ba                	lw	ra,172(sp)
8000a12c:	542a                	lw	s0,168(sp)
8000a12e:	590a                	lw	s2,160(sp)
8000a130:	49fa                	lw	s3,156(sp)
8000a132:	4a6a                	lw	s4,152(sp)
8000a134:	4ada                	lw	s5,148(sp)
8000a136:	4b4a                	lw	s6,144(sp)
8000a138:	4bba                	lw	s7,140(sp)
8000a13a:	4c2a                	lw	s8,136(sp)
8000a13c:	4c9a                	lw	s9,132(sp)
8000a13e:	4d0a                	lw	s10,128(sp)
8000a140:	5df6                	lw	s11,124(sp)
8000a142:	8526                	mv	a0,s1
8000a144:	549a                	lw	s1,164(sp)
8000a146:	614d                	addi	sp,sp,176
8000a148:	8082                	ret
8000a14a:	4505                	li	a0,1
8000a14c:	4d01                	li	s10,0
8000a14e:	ca8541e3          	blt	a0,s0,80009df0 <_dtoa_r+0x8a8>
8000a152:	b9a5                	j	80009dca <_dtoa_r+0x882>

8000a154 <_free_r>:
8000a154:	cdd1                	beqz	a1,8000a1f0 <_free_r+0x9c>
8000a156:	ffc5a783          	lw	a5,-4(a1)
8000a15a:	1101                	addi	sp,sp,-32
8000a15c:	cc22                	sw	s0,24(sp)
8000a15e:	ce06                	sw	ra,28(sp)
8000a160:	ffc58413          	addi	s0,a1,-4
8000a164:	0007d363          	bgez	a5,8000a16a <_free_r+0x16>
8000a168:	943e                	add	s0,s0,a5
8000a16a:	c62a                	sw	a0,12(sp)
8000a16c:	2419                	jal	8000a372 <__malloc_lock>
8000a16e:	b141a783          	lw	a5,-1260(gp) # 1080314 <__malloc_free_list>
8000a172:	4532                	lw	a0,12(sp)
8000a174:	eb89                	bnez	a5,8000a186 <_free_r+0x32>
8000a176:	00042223          	sw	zero,4(s0)
8000a17a:	b081aa23          	sw	s0,-1260(gp) # 1080314 <__malloc_free_list>
8000a17e:	4462                	lw	s0,24(sp)
8000a180:	40f2                	lw	ra,28(sp)
8000a182:	6105                	addi	sp,sp,32
8000a184:	aac5                	j	8000a374 <__malloc_unlock>
8000a186:	00f47d63          	bgeu	s0,a5,8000a1a0 <_free_r+0x4c>
8000a18a:	4010                	lw	a2,0(s0)
8000a18c:	00c406b3          	add	a3,s0,a2
8000a190:	00d79663          	bne	a5,a3,8000a19c <_free_r+0x48>
8000a194:	4394                	lw	a3,0(a5)
8000a196:	43dc                	lw	a5,4(a5)
8000a198:	96b2                	add	a3,a3,a2
8000a19a:	c014                	sw	a3,0(s0)
8000a19c:	c05c                	sw	a5,4(s0)
8000a19e:	bff1                	j	8000a17a <_free_r+0x26>
8000a1a0:	873e                	mv	a4,a5
8000a1a2:	43dc                	lw	a5,4(a5)
8000a1a4:	c399                	beqz	a5,8000a1aa <_free_r+0x56>
8000a1a6:	fef47de3          	bgeu	s0,a5,8000a1a0 <_free_r+0x4c>
8000a1aa:	4314                	lw	a3,0(a4)
8000a1ac:	00d70633          	add	a2,a4,a3
8000a1b0:	00861f63          	bne	a2,s0,8000a1ce <_free_r+0x7a>
8000a1b4:	4010                	lw	a2,0(s0)
8000a1b6:	96b2                	add	a3,a3,a2
8000a1b8:	c314                	sw	a3,0(a4)
8000a1ba:	00d70633          	add	a2,a4,a3
8000a1be:	fcc790e3          	bne	a5,a2,8000a17e <_free_r+0x2a>
8000a1c2:	4390                	lw	a2,0(a5)
8000a1c4:	43dc                	lw	a5,4(a5)
8000a1c6:	96b2                	add	a3,a3,a2
8000a1c8:	c314                	sw	a3,0(a4)
8000a1ca:	c35c                	sw	a5,4(a4)
8000a1cc:	bf4d                	j	8000a17e <_free_r+0x2a>
8000a1ce:	00c47563          	bgeu	s0,a2,8000a1d8 <_free_r+0x84>
8000a1d2:	47b1                	li	a5,12
8000a1d4:	c11c                	sw	a5,0(a0)
8000a1d6:	b765                	j	8000a17e <_free_r+0x2a>
8000a1d8:	4010                	lw	a2,0(s0)
8000a1da:	00c406b3          	add	a3,s0,a2
8000a1de:	00d79663          	bne	a5,a3,8000a1ea <_free_r+0x96>
8000a1e2:	4394                	lw	a3,0(a5)
8000a1e4:	43dc                	lw	a5,4(a5)
8000a1e6:	96b2                	add	a3,a3,a2
8000a1e8:	c014                	sw	a3,0(s0)
8000a1ea:	c05c                	sw	a5,4(s0)
8000a1ec:	c340                	sw	s0,4(a4)
8000a1ee:	bf41                	j	8000a17e <_free_r+0x2a>
8000a1f0:	8082                	ret

8000a1f2 <malloc>:
8000a1f2:	85aa                	mv	a1,a0
8000a1f4:	9c41a503          	lw	a0,-1596(gp) # 10801c4 <_impure_ptr>
8000a1f8:	a8a1                	j	8000a250 <_malloc_r>

8000a1fa <sbrk_aligned>:
8000a1fa:	1141                	addi	sp,sp,-16
8000a1fc:	c422                	sw	s0,8(sp)
8000a1fe:	b101a783          	lw	a5,-1264(gp) # 1080310 <__malloc_sbrk_start>
8000a202:	c226                	sw	s1,4(sp)
8000a204:	c04a                	sw	s2,0(sp)
8000a206:	c606                	sw	ra,12(sp)
8000a208:	892a                	mv	s2,a0
8000a20a:	84ae                	mv	s1,a1
8000a20c:	e791                	bnez	a5,8000a218 <sbrk_aligned+0x1e>
8000a20e:	4581                	li	a1,0
8000a210:	7d6020ef          	jal	8000c9e6 <_sbrk_r>
8000a214:	b0a1a823          	sw	a0,-1264(gp) # 1080310 <__malloc_sbrk_start>
8000a218:	85a6                	mv	a1,s1
8000a21a:	854a                	mv	a0,s2
8000a21c:	7ca020ef          	jal	8000c9e6 <_sbrk_r>
8000a220:	54fd                	li	s1,-1
8000a222:	842a                	mv	s0,a0
8000a224:	00950f63          	beq	a0,s1,8000a242 <sbrk_aligned+0x48>
8000a228:	00350413          	addi	s0,a0,3
8000a22c:	9871                	andi	s0,s0,-4
8000a22e:	00850a63          	beq	a0,s0,8000a242 <sbrk_aligned+0x48>
8000a232:	40a405b3          	sub	a1,s0,a0
8000a236:	854a                	mv	a0,s2
8000a238:	7ae020ef          	jal	8000c9e6 <_sbrk_r>
8000a23c:	00951363          	bne	a0,s1,8000a242 <sbrk_aligned+0x48>
8000a240:	842a                	mv	s0,a0
8000a242:	40b2                	lw	ra,12(sp)
8000a244:	8522                	mv	a0,s0
8000a246:	4422                	lw	s0,8(sp)
8000a248:	4492                	lw	s1,4(sp)
8000a24a:	4902                	lw	s2,0(sp)
8000a24c:	0141                	addi	sp,sp,16
8000a24e:	8082                	ret

8000a250 <_malloc_r>:
8000a250:	1101                	addi	sp,sp,-32
8000a252:	ca26                	sw	s1,20(sp)
8000a254:	00358493          	addi	s1,a1,3
8000a258:	98f1                	andi	s1,s1,-4
8000a25a:	ce06                	sw	ra,28(sp)
8000a25c:	cc22                	sw	s0,24(sp)
8000a25e:	c84a                	sw	s2,16(sp)
8000a260:	c64e                	sw	s3,12(sp)
8000a262:	c452                	sw	s4,8(sp)
8000a264:	c256                	sw	s5,4(sp)
8000a266:	04a1                	addi	s1,s1,8
8000a268:	47b1                	li	a5,12
8000a26a:	00f4f363          	bgeu	s1,a5,8000a270 <_malloc_r+0x20>
8000a26e:	84be                	mv	s1,a5
8000a270:	0004c463          	bltz	s1,8000a278 <_malloc_r+0x28>
8000a274:	00b4ff63          	bgeu	s1,a1,8000a292 <_malloc_r+0x42>
8000a278:	47b1                	li	a5,12
8000a27a:	c11c                	sw	a5,0(a0)
8000a27c:	4901                	li	s2,0
8000a27e:	40f2                	lw	ra,28(sp)
8000a280:	4462                	lw	s0,24(sp)
8000a282:	44d2                	lw	s1,20(sp)
8000a284:	49b2                	lw	s3,12(sp)
8000a286:	4a22                	lw	s4,8(sp)
8000a288:	4a92                	lw	s5,4(sp)
8000a28a:	854a                	mv	a0,s2
8000a28c:	4942                	lw	s2,16(sp)
8000a28e:	6105                	addi	sp,sp,32
8000a290:	8082                	ret
8000a292:	89aa                	mv	s3,a0
8000a294:	28f9                	jal	8000a372 <__malloc_lock>
8000a296:	b141a783          	lw	a5,-1260(gp) # 1080314 <__malloc_free_list>
8000a29a:	843e                	mv	s0,a5
8000a29c:	e829                	bnez	s0,8000a2ee <_malloc_r+0x9e>
8000a29e:	85a6                	mv	a1,s1
8000a2a0:	854e                	mv	a0,s3
8000a2a2:	3fa1                	jal	8000a1fa <sbrk_aligned>
8000a2a4:	57fd                	li	a5,-1
8000a2a6:	842a                	mv	s0,a0
8000a2a8:	0cf51363          	bne	a0,a5,8000a36e <_malloc_r+0x11e>
8000a2ac:	b141a403          	lw	s0,-1260(gp) # 1080314 <__malloc_free_list>
8000a2b0:	8922                	mv	s2,s0
8000a2b2:	08091d63          	bnez	s2,8000a34c <_malloc_r+0xfc>
8000a2b6:	c455                	beqz	s0,8000a362 <_malloc_r+0x112>
8000a2b8:	00042a83          	lw	s5,0(s0)
8000a2bc:	4581                	li	a1,0
8000a2be:	854e                	mv	a0,s3
8000a2c0:	9aa2                	add	s5,s5,s0
8000a2c2:	724020ef          	jal	8000c9e6 <_sbrk_r>
8000a2c6:	08aa9e63          	bne	s5,a0,8000a362 <_malloc_r+0x112>
8000a2ca:	401c                	lw	a5,0(s0)
8000a2cc:	854e                	mv	a0,s3
8000a2ce:	8c9d                	sub	s1,s1,a5
8000a2d0:	85a6                	mv	a1,s1
8000a2d2:	3725                	jal	8000a1fa <sbrk_aligned>
8000a2d4:	57fd                	li	a5,-1
8000a2d6:	08f50663          	beq	a0,a5,8000a362 <_malloc_r+0x112>
8000a2da:	401c                	lw	a5,0(s0)
8000a2dc:	97a6                	add	a5,a5,s1
8000a2de:	c01c                	sw	a5,0(s0)
8000a2e0:	b141a783          	lw	a5,-1260(gp) # 1080314 <__malloc_free_list>
8000a2e4:	43d8                	lw	a4,4(a5)
8000a2e6:	e73d                	bnez	a4,8000a354 <_malloc_r+0x104>
8000a2e8:	b001aa23          	sw	zero,-1260(gp) # 1080314 <__malloc_free_list>
8000a2ec:	a015                	j	8000a310 <_malloc_r+0xc0>
8000a2ee:	4014                	lw	a3,0(s0)
8000a2f0:	8e85                	sub	a3,a3,s1
8000a2f2:	0406ca63          	bltz	a3,8000a346 <_malloc_r+0xf6>
8000a2f6:	472d                	li	a4,11
8000a2f8:	02d77f63          	bgeu	a4,a3,8000a336 <_malloc_r+0xe6>
8000a2fc:	c004                	sw	s1,0(s0)
8000a2fe:	00940733          	add	a4,s0,s1
8000a302:	02879863          	bne	a5,s0,8000a332 <_malloc_r+0xe2>
8000a306:	b0e1aa23          	sw	a4,-1260(gp) # 1080314 <__malloc_free_list>
8000a30a:	405c                	lw	a5,4(s0)
8000a30c:	c314                	sw	a3,0(a4)
8000a30e:	c35c                	sw	a5,4(a4)
8000a310:	854e                	mv	a0,s3
8000a312:	208d                	jal	8000a374 <__malloc_unlock>
8000a314:	00b40913          	addi	s2,s0,11
8000a318:	00440793          	addi	a5,s0,4
8000a31c:	ff897913          	andi	s2,s2,-8
8000a320:	40f90733          	sub	a4,s2,a5
8000a324:	f4f90de3          	beq	s2,a5,8000a27e <_malloc_r+0x2e>
8000a328:	943a                	add	s0,s0,a4
8000a32a:	412787b3          	sub	a5,a5,s2
8000a32e:	c01c                	sw	a5,0(s0)
8000a330:	b7b9                	j	8000a27e <_malloc_r+0x2e>
8000a332:	c3d8                	sw	a4,4(a5)
8000a334:	bfd9                	j	8000a30a <_malloc_r+0xba>
8000a336:	4058                	lw	a4,4(s0)
8000a338:	00879563          	bne	a5,s0,8000a342 <_malloc_r+0xf2>
8000a33c:	b0e1aa23          	sw	a4,-1260(gp) # 1080314 <__malloc_free_list>
8000a340:	bfc1                	j	8000a310 <_malloc_r+0xc0>
8000a342:	c3d8                	sw	a4,4(a5)
8000a344:	b7f1                	j	8000a310 <_malloc_r+0xc0>
8000a346:	87a2                	mv	a5,s0
8000a348:	4040                	lw	s0,4(s0)
8000a34a:	bf89                	j	8000a29c <_malloc_r+0x4c>
8000a34c:	844a                	mv	s0,s2
8000a34e:	00492903          	lw	s2,4(s2)
8000a352:	b785                	j	8000a2b2 <_malloc_r+0x62>
8000a354:	873e                	mv	a4,a5
8000a356:	43dc                	lw	a5,4(a5)
8000a358:	fe879ee3          	bne	a5,s0,8000a354 <_malloc_r+0x104>
8000a35c:	00072223          	sw	zero,4(a4)
8000a360:	bf45                	j	8000a310 <_malloc_r+0xc0>
8000a362:	47b1                	li	a5,12
8000a364:	00f9a023          	sw	a5,0(s3)
8000a368:	854e                	mv	a0,s3
8000a36a:	2029                	jal	8000a374 <__malloc_unlock>
8000a36c:	bf09                	j	8000a27e <_malloc_r+0x2e>
8000a36e:	c104                	sw	s1,0(a0)
8000a370:	b745                	j	8000a310 <_malloc_r+0xc0>

8000a372 <__malloc_lock>:
8000a372:	8082                	ret

8000a374 <__malloc_unlock>:
8000a374:	8082                	ret

8000a376 <_Balloc>:
8000a376:	1141                	addi	sp,sp,-16
8000a378:	c422                	sw	s0,8(sp)
8000a37a:	4d40                	lw	s0,28(a0)
8000a37c:	c226                	sw	s1,4(sp)
8000a37e:	c04a                	sw	s2,0(sp)
8000a380:	c606                	sw	ra,12(sp)
8000a382:	84aa                	mv	s1,a0
8000a384:	892e                	mv	s2,a1
8000a386:	e81d                	bnez	s0,8000a3bc <_Balloc+0x46>
8000a388:	4541                	li	a0,16
8000a38a:	35a5                	jal	8000a1f2 <malloc>
8000a38c:	ccc8                	sw	a0,28(s1)
8000a38e:	842a                	mv	s0,a0
8000a390:	ed11                	bnez	a0,8000a3ac <_Balloc+0x36>
8000a392:	8000e6b7          	lui	a3,0x8000e
8000a396:	8000e537          	lui	a0,0x8000e
8000a39a:	a7c68693          	addi	a3,a3,-1412 # 8000da7c <s_wdgs+0xa4>
8000a39e:	4601                	li	a2,0
8000a3a0:	06b00593          	li	a1,107
8000a3a4:	b0850513          	addi	a0,a0,-1272 # 8000db08 <s_wdgs+0x130>
8000a3a8:	fcdfd0ef          	jal	80008374 <__assert_func>
8000a3ac:	00052223          	sw	zero,4(a0)
8000a3b0:	00052423          	sw	zero,8(a0)
8000a3b4:	00052023          	sw	zero,0(a0)
8000a3b8:	00052623          	sw	zero,12(a0)
8000a3bc:	4448                	lw	a0,12(s0)
8000a3be:	e919                	bnez	a0,8000a3d4 <_Balloc+0x5e>
8000a3c0:	02100613          	li	a2,33
8000a3c4:	4591                	li	a1,4
8000a3c6:	8526                	mv	a0,s1
8000a3c8:	688020ef          	jal	8000ca50 <_calloc_r>
8000a3cc:	4cdc                	lw	a5,28(s1)
8000a3ce:	c448                	sw	a0,12(s0)
8000a3d0:	47c8                	lw	a0,12(a5)
8000a3d2:	cd01                	beqz	a0,8000a3ea <_Balloc+0x74>
8000a3d4:	00291793          	slli	a5,s2,0x2
8000a3d8:	97aa                	add	a5,a5,a0
8000a3da:	4388                	lw	a0,0(a5)
8000a3dc:	cd09                	beqz	a0,8000a3f6 <_Balloc+0x80>
8000a3de:	4118                	lw	a4,0(a0)
8000a3e0:	c398                	sw	a4,0(a5)
8000a3e2:	00052823          	sw	zero,16(a0)
8000a3e6:	00052623          	sw	zero,12(a0)
8000a3ea:	40b2                	lw	ra,12(sp)
8000a3ec:	4422                	lw	s0,8(sp)
8000a3ee:	4492                	lw	s1,4(sp)
8000a3f0:	4902                	lw	s2,0(sp)
8000a3f2:	0141                	addi	sp,sp,16
8000a3f4:	8082                	ret
8000a3f6:	4585                	li	a1,1
8000a3f8:	01259433          	sll	s0,a1,s2
8000a3fc:	00540613          	addi	a2,s0,5
8000a400:	060a                	slli	a2,a2,0x2
8000a402:	8526                	mv	a0,s1
8000a404:	64c020ef          	jal	8000ca50 <_calloc_r>
8000a408:	d16d                	beqz	a0,8000a3ea <_Balloc+0x74>
8000a40a:	01252223          	sw	s2,4(a0)
8000a40e:	c500                	sw	s0,8(a0)
8000a410:	bfc9                	j	8000a3e2 <_Balloc+0x6c>

8000a412 <_Bfree>:
8000a412:	4d5c                	lw	a5,28(a0)
8000a414:	1101                	addi	sp,sp,-32
8000a416:	cc22                	sw	s0,24(sp)
8000a418:	ce06                	sw	ra,28(sp)
8000a41a:	842a                	mv	s0,a0
8000a41c:	ef85                	bnez	a5,8000a454 <_Bfree+0x42>
8000a41e:	4541                	li	a0,16
8000a420:	c62e                	sw	a1,12(sp)
8000a422:	3bc1                	jal	8000a1f2 <malloc>
8000a424:	cc48                	sw	a0,28(s0)
8000a426:	45b2                	lw	a1,12(sp)
8000a428:	ed11                	bnez	a0,8000a444 <_Bfree+0x32>
8000a42a:	8000e6b7          	lui	a3,0x8000e
8000a42e:	8000e537          	lui	a0,0x8000e
8000a432:	a7c68693          	addi	a3,a3,-1412 # 8000da7c <s_wdgs+0xa4>
8000a436:	4601                	li	a2,0
8000a438:	08f00593          	li	a1,143
8000a43c:	b0850513          	addi	a0,a0,-1272 # 8000db08 <s_wdgs+0x130>
8000a440:	f35fd0ef          	jal	80008374 <__assert_func>
8000a444:	00052223          	sw	zero,4(a0)
8000a448:	00052423          	sw	zero,8(a0)
8000a44c:	00052023          	sw	zero,0(a0)
8000a450:	00052623          	sw	zero,12(a0)
8000a454:	c989                	beqz	a1,8000a466 <_Bfree+0x54>
8000a456:	4c5c                	lw	a5,28(s0)
8000a458:	41d8                	lw	a4,4(a1)
8000a45a:	47dc                	lw	a5,12(a5)
8000a45c:	070a                	slli	a4,a4,0x2
8000a45e:	97ba                	add	a5,a5,a4
8000a460:	4398                	lw	a4,0(a5)
8000a462:	c198                	sw	a4,0(a1)
8000a464:	c38c                	sw	a1,0(a5)
8000a466:	40f2                	lw	ra,28(sp)
8000a468:	4462                	lw	s0,24(sp)
8000a46a:	6105                	addi	sp,sp,32
8000a46c:	8082                	ret

8000a46e <__multadd>:
8000a46e:	1101                	addi	sp,sp,-32
8000a470:	cc22                	sw	s0,24(sp)
8000a472:	ca26                	sw	s1,20(sp)
8000a474:	c84a                	sw	s2,16(sp)
8000a476:	4984                	lw	s1,16(a1)
8000a478:	842e                	mv	s0,a1
8000a47a:	8936                	mv	s2,a3
8000a47c:	ce06                	sw	ra,28(sp)
8000a47e:	01458693          	addi	a3,a1,20
8000a482:	c64e                	sw	s3,12(sp)
8000a484:	c452                	sw	s4,8(sp)
8000a486:	4581                	li	a1,0
8000a488:	429c                	lw	a5,0(a3)
8000a48a:	0585                	addi	a1,a1,1
8000a48c:	01079713          	slli	a4,a5,0x10
8000a490:	8341                	srli	a4,a4,0x10
8000a492:	02c70733          	mul	a4,a4,a2
8000a496:	83c1                	srli	a5,a5,0x10
8000a498:	02c787b3          	mul	a5,a5,a2
8000a49c:	974a                	add	a4,a4,s2
8000a49e:	01075813          	srli	a6,a4,0x10
8000a4a2:	0742                	slli	a4,a4,0x10
8000a4a4:	8341                	srli	a4,a4,0x10
8000a4a6:	97c2                	add	a5,a5,a6
8000a4a8:	0107d913          	srli	s2,a5,0x10
8000a4ac:	07c2                	slli	a5,a5,0x10
8000a4ae:	97ba                	add	a5,a5,a4
8000a4b0:	c29c                	sw	a5,0(a3)
8000a4b2:	0691                	addi	a3,a3,4
8000a4b4:	fc95cae3          	blt	a1,s1,8000a488 <__multadd+0x1a>
8000a4b8:	04090c63          	beqz	s2,8000a510 <__multadd+0xa2>
8000a4bc:	441c                	lw	a5,8(s0)
8000a4be:	04f4c163          	blt	s1,a5,8000a500 <__multadd+0x92>
8000a4c2:	404c                	lw	a1,4(s0)
8000a4c4:	8a2a                	mv	s4,a0
8000a4c6:	0585                	addi	a1,a1,1
8000a4c8:	357d                	jal	8000a376 <_Balloc>
8000a4ca:	89aa                	mv	s3,a0
8000a4cc:	ed11                	bnez	a0,8000a4e8 <__multadd+0x7a>
8000a4ce:	8000e6b7          	lui	a3,0x8000e
8000a4d2:	8000e537          	lui	a0,0x8000e
8000a4d6:	af468693          	addi	a3,a3,-1292 # 8000daf4 <s_wdgs+0x11c>
8000a4da:	4601                	li	a2,0
8000a4dc:	0ba00593          	li	a1,186
8000a4e0:	b0850513          	addi	a0,a0,-1272 # 8000db08 <s_wdgs+0x130>
8000a4e4:	e91fd0ef          	jal	80008374 <__assert_func>
8000a4e8:	4810                	lw	a2,16(s0)
8000a4ea:	00c40593          	addi	a1,s0,12
8000a4ee:	0531                	addi	a0,a0,12
8000a4f0:	0609                	addi	a2,a2,2
8000a4f2:	060a                	slli	a2,a2,0x2
8000a4f4:	8bdfa0ef          	jal	80004db0 <memcpy>
8000a4f8:	85a2                	mv	a1,s0
8000a4fa:	8552                	mv	a0,s4
8000a4fc:	3f19                	jal	8000a412 <_Bfree>
8000a4fe:	844e                	mv	s0,s3
8000a500:	00448793          	addi	a5,s1,4
8000a504:	078a                	slli	a5,a5,0x2
8000a506:	97a2                	add	a5,a5,s0
8000a508:	0127a223          	sw	s2,4(a5)
8000a50c:	0485                	addi	s1,s1,1
8000a50e:	c804                	sw	s1,16(s0)
8000a510:	40f2                	lw	ra,28(sp)
8000a512:	8522                	mv	a0,s0
8000a514:	4462                	lw	s0,24(sp)
8000a516:	44d2                	lw	s1,20(sp)
8000a518:	4942                	lw	s2,16(sp)
8000a51a:	49b2                	lw	s3,12(sp)
8000a51c:	4a22                	lw	s4,8(sp)
8000a51e:	6105                	addi	sp,sp,32
8000a520:	8082                	ret

8000a522 <__s2b>:
8000a522:	7179                	addi	sp,sp,-48
8000a524:	00868793          	addi	a5,a3,8
8000a528:	ce4e                	sw	s3,28(sp)
8000a52a:	89b6                	mv	s3,a3
8000a52c:	46a5                	li	a3,9
8000a52e:	02d7c7b3          	div	a5,a5,a3
8000a532:	d422                	sw	s0,40(sp)
8000a534:	d226                	sw	s1,36(sp)
8000a536:	ca56                	sw	s5,20(sp)
8000a538:	842e                	mv	s0,a1
8000a53a:	d606                	sw	ra,44(sp)
8000a53c:	d04a                	sw	s2,32(sp)
8000a53e:	cc52                	sw	s4,24(sp)
8000a540:	8aaa                	mv	s5,a0
8000a542:	84b2                	mv	s1,a2
8000a544:	4685                	li	a3,1
8000a546:	4581                	li	a1,0
8000a548:	02f6c463          	blt	a3,a5,8000a570 <__s2b+0x4e>
8000a54c:	8556                	mv	a0,s5
8000a54e:	c63a                	sw	a4,12(sp)
8000a550:	351d                	jal	8000a376 <_Balloc>
8000a552:	4732                	lw	a4,12(sp)
8000a554:	e10d                	bnez	a0,8000a576 <__s2b+0x54>
8000a556:	8000e6b7          	lui	a3,0x8000e
8000a55a:	8000e537          	lui	a0,0x8000e
8000a55e:	af468693          	addi	a3,a3,-1292 # 8000daf4 <s_wdgs+0x11c>
8000a562:	4601                	li	a2,0
8000a564:	0d300593          	li	a1,211
8000a568:	b0850513          	addi	a0,a0,-1272 # 8000db08 <s_wdgs+0x130>
8000a56c:	e09fd0ef          	jal	80008374 <__assert_func>
8000a570:	0686                	slli	a3,a3,0x1
8000a572:	0585                	addi	a1,a1,1
8000a574:	bfd1                	j	8000a548 <__s2b+0x26>
8000a576:	4785                	li	a5,1
8000a578:	c91c                	sw	a5,16(a0)
8000a57a:	c958                	sw	a4,20(a0)
8000a57c:	47a5                	li	a5,9
8000a57e:	0497dd63          	bge	a5,s1,8000a5d8 <__s2b+0xb6>
8000a582:	00f40933          	add	s2,s0,a5
8000a586:	8a4a                	mv	s4,s2
8000a588:	9426                	add	s0,s0,s1
8000a58a:	000a4683          	lbu	a3,0(s4)
8000a58e:	0a05                	addi	s4,s4,1
8000a590:	85aa                	mv	a1,a0
8000a592:	fd068693          	addi	a3,a3,-48
8000a596:	4629                	li	a2,10
8000a598:	8556                	mv	a0,s5
8000a59a:	3dd1                	jal	8000a46e <__multadd>
8000a59c:	fe8a17e3          	bne	s4,s0,8000a58a <__s2b+0x68>
8000a5a0:	9926                	add	s2,s2,s1
8000a5a2:	ff890413          	addi	s0,s2,-8
8000a5a6:	8926                	mv	s2,s1
8000a5a8:	a829                	j	8000a5c2 <__s2b+0xa0>
8000a5aa:	409907b3          	sub	a5,s2,s1
8000a5ae:	97a2                	add	a5,a5,s0
8000a5b0:	0007c683          	lbu	a3,0(a5)
8000a5b4:	85aa                	mv	a1,a0
8000a5b6:	4629                	li	a2,10
8000a5b8:	fd068693          	addi	a3,a3,-48
8000a5bc:	8556                	mv	a0,s5
8000a5be:	3d45                	jal	8000a46e <__multadd>
8000a5c0:	0905                	addi	s2,s2,1
8000a5c2:	ff3944e3          	blt	s2,s3,8000a5aa <__s2b+0x88>
8000a5c6:	50b2                	lw	ra,44(sp)
8000a5c8:	5422                	lw	s0,40(sp)
8000a5ca:	5492                	lw	s1,36(sp)
8000a5cc:	5902                	lw	s2,32(sp)
8000a5ce:	49f2                	lw	s3,28(sp)
8000a5d0:	4a62                	lw	s4,24(sp)
8000a5d2:	4ad2                	lw	s5,20(sp)
8000a5d4:	6145                	addi	sp,sp,48
8000a5d6:	8082                	ret
8000a5d8:	0429                	addi	s0,s0,10
8000a5da:	84be                	mv	s1,a5
8000a5dc:	b7e9                	j	8000a5a6 <__s2b+0x84>

8000a5de <__hi0bits>:
8000a5de:	87aa                	mv	a5,a0
8000a5e0:	6741                	lui	a4,0x10
8000a5e2:	4501                	li	a0,0
8000a5e4:	00e7f463          	bgeu	a5,a4,8000a5ec <__hi0bits+0xe>
8000a5e8:	07c2                	slli	a5,a5,0x10
8000a5ea:	4541                	li	a0,16
8000a5ec:	01000737          	lui	a4,0x1000
8000a5f0:	00e7f463          	bgeu	a5,a4,8000a5f8 <__hi0bits+0x1a>
8000a5f4:	0521                	addi	a0,a0,8
8000a5f6:	07a2                	slli	a5,a5,0x8
8000a5f8:	10000737          	lui	a4,0x10000
8000a5fc:	00e7f463          	bgeu	a5,a4,8000a604 <__hi0bits+0x26>
8000a600:	0511                	addi	a0,a0,4
8000a602:	0792                	slli	a5,a5,0x4
8000a604:	40000737          	lui	a4,0x40000
8000a608:	00e7f463          	bgeu	a5,a4,8000a610 <__hi0bits+0x32>
8000a60c:	0509                	addi	a0,a0,2
8000a60e:	078a                	slli	a5,a5,0x2
8000a610:	0007ca63          	bltz	a5,8000a624 <__hi0bits+0x46>
8000a614:	00179713          	slli	a4,a5,0x1
8000a618:	00075463          	bgez	a4,8000a620 <__hi0bits+0x42>
8000a61c:	0505                	addi	a0,a0,1
8000a61e:	8082                	ret
8000a620:	02000513          	li	a0,32
8000a624:	8082                	ret

8000a626 <__lo0bits>:
8000a626:	411c                	lw	a5,0(a0)
8000a628:	0077f713          	andi	a4,a5,7
8000a62c:	c30d                	beqz	a4,8000a64e <__lo0bits+0x28>
8000a62e:	0017f693          	andi	a3,a5,1
8000a632:	4701                	li	a4,0
8000a634:	e699                	bnez	a3,8000a642 <__lo0bits+0x1c>
8000a636:	0027f713          	andi	a4,a5,2
8000a63a:	c711                	beqz	a4,8000a646 <__lo0bits+0x20>
8000a63c:	8385                	srli	a5,a5,0x1
8000a63e:	c11c                	sw	a5,0(a0)
8000a640:	4705                	li	a4,1
8000a642:	853a                	mv	a0,a4
8000a644:	8082                	ret
8000a646:	8389                	srli	a5,a5,0x2
8000a648:	c11c                	sw	a5,0(a0)
8000a64a:	4709                	li	a4,2
8000a64c:	bfdd                	j	8000a642 <__lo0bits+0x1c>
8000a64e:	01079693          	slli	a3,a5,0x10
8000a652:	82c1                	srli	a3,a3,0x10
8000a654:	e299                	bnez	a3,8000a65a <__lo0bits+0x34>
8000a656:	83c1                	srli	a5,a5,0x10
8000a658:	4741                	li	a4,16
8000a65a:	0ff7f693          	zext.b	a3,a5
8000a65e:	e299                	bnez	a3,8000a664 <__lo0bits+0x3e>
8000a660:	0721                	addi	a4,a4,8 # 40000008 <__share_mem_end__+0x3ee80008>
8000a662:	83a1                	srli	a5,a5,0x8
8000a664:	00f7f693          	andi	a3,a5,15
8000a668:	e299                	bnez	a3,8000a66e <__lo0bits+0x48>
8000a66a:	0711                	addi	a4,a4,4
8000a66c:	8391                	srli	a5,a5,0x4
8000a66e:	0037f693          	andi	a3,a5,3
8000a672:	e299                	bnez	a3,8000a678 <__lo0bits+0x52>
8000a674:	0709                	addi	a4,a4,2
8000a676:	8389                	srli	a5,a5,0x2
8000a678:	0017f693          	andi	a3,a5,1
8000a67c:	e681                	bnez	a3,8000a684 <__lo0bits+0x5e>
8000a67e:	8385                	srli	a5,a5,0x1
8000a680:	c781                	beqz	a5,8000a688 <__lo0bits+0x62>
8000a682:	0705                	addi	a4,a4,1
8000a684:	c11c                	sw	a5,0(a0)
8000a686:	bf75                	j	8000a642 <__lo0bits+0x1c>
8000a688:	02000713          	li	a4,32
8000a68c:	bf5d                	j	8000a642 <__lo0bits+0x1c>

8000a68e <__i2b>:
8000a68e:	1141                	addi	sp,sp,-16
8000a690:	c422                	sw	s0,8(sp)
8000a692:	842e                	mv	s0,a1
8000a694:	4585                	li	a1,1
8000a696:	c606                	sw	ra,12(sp)
8000a698:	39f9                	jal	8000a376 <_Balloc>
8000a69a:	ed11                	bnez	a0,8000a6b6 <__i2b+0x28>
8000a69c:	8000e6b7          	lui	a3,0x8000e
8000a6a0:	8000e537          	lui	a0,0x8000e
8000a6a4:	af468693          	addi	a3,a3,-1292 # 8000daf4 <s_wdgs+0x11c>
8000a6a8:	4601                	li	a2,0
8000a6aa:	14500593          	li	a1,325
8000a6ae:	b0850513          	addi	a0,a0,-1272 # 8000db08 <s_wdgs+0x130>
8000a6b2:	cc3fd0ef          	jal	80008374 <__assert_func>
8000a6b6:	40b2                	lw	ra,12(sp)
8000a6b8:	c940                	sw	s0,20(a0)
8000a6ba:	4422                	lw	s0,8(sp)
8000a6bc:	4705                	li	a4,1
8000a6be:	c918                	sw	a4,16(a0)
8000a6c0:	0141                	addi	sp,sp,16
8000a6c2:	8082                	ret

8000a6c4 <__multiply>:
8000a6c4:	7179                	addi	sp,sp,-48
8000a6c6:	d226                	sw	s1,36(sp)
8000a6c8:	d04a                	sw	s2,32(sp)
8000a6ca:	4984                	lw	s1,16(a1)
8000a6cc:	01062903          	lw	s2,16(a2)
8000a6d0:	ce4e                	sw	s3,28(sp)
8000a6d2:	d606                	sw	ra,44(sp)
8000a6d4:	d422                	sw	s0,40(sp)
8000a6d6:	89ae                	mv	s3,a1
8000a6d8:	0124c863          	blt	s1,s2,8000a6e8 <__multiply+0x24>
8000a6dc:	87ca                	mv	a5,s2
8000a6de:	8926                	mv	s2,s1
8000a6e0:	84be                	mv	s1,a5
8000a6e2:	87b2                	mv	a5,a2
8000a6e4:	89be                	mv	s3,a5
8000a6e6:	862e                	mv	a2,a1
8000a6e8:	461c                	lw	a5,8(a2)
8000a6ea:	424c                	lw	a1,4(a2)
8000a6ec:	00990433          	add	s0,s2,s1
8000a6f0:	0087a7b3          	slt	a5,a5,s0
8000a6f4:	95be                	add	a1,a1,a5
8000a6f6:	c632                	sw	a2,12(sp)
8000a6f8:	39bd                	jal	8000a376 <_Balloc>
8000a6fa:	4632                	lw	a2,12(sp)
8000a6fc:	ed11                	bnez	a0,8000a718 <__multiply+0x54>
8000a6fe:	8000e6b7          	lui	a3,0x8000e
8000a702:	8000e537          	lui	a0,0x8000e
8000a706:	af468693          	addi	a3,a3,-1292 # 8000daf4 <s_wdgs+0x11c>
8000a70a:	4601                	li	a2,0
8000a70c:	16200593          	li	a1,354
8000a710:	b0850513          	addi	a0,a0,-1272 # 8000db08 <s_wdgs+0x130>
8000a714:	c61fd0ef          	jal	80008374 <__assert_func>
8000a718:	01450893          	addi	a7,a0,20
8000a71c:	00241313          	slli	t1,s0,0x2
8000a720:	9346                	add	t1,t1,a7
8000a722:	87c6                	mv	a5,a7
8000a724:	0467e563          	bltu	a5,t1,8000a76e <__multiply+0xaa>
8000a728:	01460e93          	addi	t4,a2,20
8000a72c:	00291713          	slli	a4,s2,0x2
8000a730:	9776                	add	a4,a4,t4
8000a732:	01560e13          	addi	t3,a2,21
8000a736:	01498593          	addi	a1,s3,20
8000a73a:	00249813          	slli	a6,s1,0x2
8000a73e:	01c73e33          	sltu	t3,a4,t3
8000a742:	40c70633          	sub	a2,a4,a2
8000a746:	982e                	add	a6,a6,a1
8000a748:	001e4e13          	xori	t3,t3,1
8000a74c:	162d                	addi	a2,a2,-21
8000a74e:	0305e463          	bltu	a1,a6,8000a776 <__multiply+0xb2>
8000a752:	00805663          	blez	s0,8000a75e <__multiply+0x9a>
8000a756:	ffc32783          	lw	a5,-4(t1)
8000a75a:	1371                	addi	t1,t1,-4
8000a75c:	c7ed                	beqz	a5,8000a846 <__multiply+0x182>
8000a75e:	50b2                	lw	ra,44(sp)
8000a760:	c900                	sw	s0,16(a0)
8000a762:	5422                	lw	s0,40(sp)
8000a764:	5492                	lw	s1,36(sp)
8000a766:	5902                	lw	s2,32(sp)
8000a768:	49f2                	lw	s3,28(sp)
8000a76a:	6145                	addi	sp,sp,48
8000a76c:	8082                	ret
8000a76e:	0007a023          	sw	zero,0(a5)
8000a772:	0791                	addi	a5,a5,4
8000a774:	bf45                	j	8000a724 <__multiply+0x60>
8000a776:	0005d383          	lhu	t2,0(a1)
8000a77a:	06038063          	beqz	t2,8000a7da <__multiply+0x116>
8000a77e:	8fc6                	mv	t6,a7
8000a780:	8f76                	mv	t5,t4
8000a782:	4481                	li	s1,0
8000a784:	000f2783          	lw	a5,0(t5)
8000a788:	000fa283          	lw	t0,0(t6)
8000a78c:	0f11                	addi	t5,t5,4
8000a78e:	01079693          	slli	a3,a5,0x10
8000a792:	82c1                	srli	a3,a3,0x10
8000a794:	027686b3          	mul	a3,a3,t2
8000a798:	83c1                	srli	a5,a5,0x10
8000a79a:	01029913          	slli	s2,t0,0x10
8000a79e:	01095913          	srli	s2,s2,0x10
8000a7a2:	0102d293          	srli	t0,t0,0x10
8000a7a6:	0f91                	addi	t6,t6,4
8000a7a8:	027787b3          	mul	a5,a5,t2
8000a7ac:	96ca                	add	a3,a3,s2
8000a7ae:	96a6                	add	a3,a3,s1
8000a7b0:	9796                	add	a5,a5,t0
8000a7b2:	0106d293          	srli	t0,a3,0x10
8000a7b6:	9796                	add	a5,a5,t0
8000a7b8:	06c2                	slli	a3,a3,0x10
8000a7ba:	0107d493          	srli	s1,a5,0x10
8000a7be:	82c1                	srli	a3,a3,0x10
8000a7c0:	07c2                	slli	a5,a5,0x10
8000a7c2:	8fd5                	or	a5,a5,a3
8000a7c4:	feffae23          	sw	a5,-4(t6)
8000a7c8:	faef6ee3          	bltu	t5,a4,8000a784 <__multiply+0xc0>
8000a7cc:	4781                	li	a5,0
8000a7ce:	000e0463          	beqz	t3,8000a7d6 <__multiply+0x112>
8000a7d2:	ffc67793          	andi	a5,a2,-4
8000a7d6:	97c6                	add	a5,a5,a7
8000a7d8:	c3c4                	sw	s1,4(a5)
8000a7da:	0025d383          	lhu	t2,2(a1)
8000a7de:	06038163          	beqz	t2,8000a840 <__multiply+0x17c>
8000a7e2:	0008a783          	lw	a5,0(a7)
8000a7e6:	8f76                	mv	t5,t4
8000a7e8:	82c6                	mv	t0,a7
8000a7ea:	8fbe                	mv	t6,a5
8000a7ec:	4481                	li	s1,0
8000a7ee:	000f5683          	lhu	a3,0(t5)
8000a7f2:	010fdf93          	srli	t6,t6,0x10
8000a7f6:	07c2                	slli	a5,a5,0x10
8000a7f8:	027686b3          	mul	a3,a3,t2
8000a7fc:	83c1                	srli	a5,a5,0x10
8000a7fe:	0f11                	addi	t5,t5,4
8000a800:	0291                	addi	t0,t0,4
8000a802:	96a6                	add	a3,a3,s1
8000a804:	96fe                	add	a3,a3,t6
8000a806:	01069f93          	slli	t6,a3,0x10
8000a80a:	00ffe7b3          	or	a5,t6,a5
8000a80e:	fef2ae23          	sw	a5,-4(t0)
8000a812:	ffef5783          	lhu	a5,-2(t5)
8000a816:	0002af83          	lw	t6,0(t0)
8000a81a:	82c1                	srli	a3,a3,0x10
8000a81c:	027787b3          	mul	a5,a5,t2
8000a820:	010f9493          	slli	s1,t6,0x10
8000a824:	80c1                	srli	s1,s1,0x10
8000a826:	97a6                	add	a5,a5,s1
8000a828:	97b6                	add	a5,a5,a3
8000a82a:	0107d493          	srli	s1,a5,0x10
8000a82e:	fcef60e3          	bltu	t5,a4,8000a7ee <__multiply+0x12a>
8000a832:	4681                	li	a3,0
8000a834:	000e0463          	beqz	t3,8000a83c <__multiply+0x178>
8000a838:	ffc67693          	andi	a3,a2,-4
8000a83c:	96c6                	add	a3,a3,a7
8000a83e:	c2dc                	sw	a5,4(a3)
8000a840:	0591                	addi	a1,a1,4
8000a842:	0891                	addi	a7,a7,4
8000a844:	b729                	j	8000a74e <__multiply+0x8a>
8000a846:	147d                	addi	s0,s0,-1
8000a848:	b729                	j	8000a752 <__multiply+0x8e>

8000a84a <__pow5mult>:
8000a84a:	1101                	addi	sp,sp,-32
8000a84c:	cc22                	sw	s0,24(sp)
8000a84e:	c64e                	sw	s3,12(sp)
8000a850:	c452                	sw	s4,8(sp)
8000a852:	ce06                	sw	ra,28(sp)
8000a854:	ca26                	sw	s1,20(sp)
8000a856:	c84a                	sw	s2,16(sp)
8000a858:	00367793          	andi	a5,a2,3
8000a85c:	8a2a                	mv	s4,a0
8000a85e:	89b2                	mv	s3,a2
8000a860:	842e                	mv	s0,a1
8000a862:	cf81                	beqz	a5,8000a87a <__pow5mult+0x30>
8000a864:	8000e737          	lui	a4,0x8000e
8000a868:	17fd                	addi	a5,a5,-1
8000a86a:	cd070713          	addi	a4,a4,-816 # 8000dcd0 <p05.0>
8000a86e:	078a                	slli	a5,a5,0x2
8000a870:	97ba                	add	a5,a5,a4
8000a872:	4390                	lw	a2,0(a5)
8000a874:	4681                	li	a3,0
8000a876:	3ee5                	jal	8000a46e <__multadd>
8000a878:	842a                	mv	s0,a0
8000a87a:	4029d993          	srai	s3,s3,0x2
8000a87e:	08098863          	beqz	s3,8000a90e <__pow5mult+0xc4>
8000a882:	01ca2903          	lw	s2,28(s4)
8000a886:	02091d63          	bnez	s2,8000a8c0 <__pow5mult+0x76>
8000a88a:	4541                	li	a0,16
8000a88c:	329d                	jal	8000a1f2 <malloc>
8000a88e:	00aa2e23          	sw	a0,28(s4)
8000a892:	892a                	mv	s2,a0
8000a894:	ed11                	bnez	a0,8000a8b0 <__pow5mult+0x66>
8000a896:	8000e6b7          	lui	a3,0x8000e
8000a89a:	8000e537          	lui	a0,0x8000e
8000a89e:	a7c68693          	addi	a3,a3,-1412 # 8000da7c <s_wdgs+0xa4>
8000a8a2:	4601                	li	a2,0
8000a8a4:	1b300593          	li	a1,435
8000a8a8:	b0850513          	addi	a0,a0,-1272 # 8000db08 <s_wdgs+0x130>
8000a8ac:	ac9fd0ef          	jal	80008374 <__assert_func>
8000a8b0:	00052223          	sw	zero,4(a0)
8000a8b4:	00052423          	sw	zero,8(a0)
8000a8b8:	00052023          	sw	zero,0(a0)
8000a8bc:	00052623          	sw	zero,12(a0)
8000a8c0:	00892483          	lw	s1,8(s2)
8000a8c4:	e891                	bnez	s1,8000a8d8 <__pow5mult+0x8e>
8000a8c6:	27100593          	li	a1,625
8000a8ca:	8552                	mv	a0,s4
8000a8cc:	33c9                	jal	8000a68e <__i2b>
8000a8ce:	00a92423          	sw	a0,8(s2)
8000a8d2:	84aa                	mv	s1,a0
8000a8d4:	00052023          	sw	zero,0(a0)
8000a8d8:	0019f793          	andi	a5,s3,1
8000a8dc:	8922                	mv	s2,s0
8000a8de:	4019d993          	srai	s3,s3,0x1
8000a8e2:	cb99                	beqz	a5,8000a8f8 <__pow5mult+0xae>
8000a8e4:	85a2                	mv	a1,s0
8000a8e6:	8626                	mv	a2,s1
8000a8e8:	8552                	mv	a0,s4
8000a8ea:	3be9                	jal	8000a6c4 <__multiply>
8000a8ec:	842a                	mv	s0,a0
8000a8ee:	85ca                	mv	a1,s2
8000a8f0:	8552                	mv	a0,s4
8000a8f2:	3605                	jal	8000a412 <_Bfree>
8000a8f4:	00098d63          	beqz	s3,8000a90e <__pow5mult+0xc4>
8000a8f8:	4088                	lw	a0,0(s1)
8000a8fa:	e901                	bnez	a0,8000a90a <__pow5mult+0xc0>
8000a8fc:	8626                	mv	a2,s1
8000a8fe:	85a6                	mv	a1,s1
8000a900:	8552                	mv	a0,s4
8000a902:	33c9                	jal	8000a6c4 <__multiply>
8000a904:	c088                	sw	a0,0(s1)
8000a906:	00052023          	sw	zero,0(a0)
8000a90a:	84aa                	mv	s1,a0
8000a90c:	b7f1                	j	8000a8d8 <__pow5mult+0x8e>
8000a90e:	40f2                	lw	ra,28(sp)
8000a910:	8522                	mv	a0,s0
8000a912:	4462                	lw	s0,24(sp)
8000a914:	44d2                	lw	s1,20(sp)
8000a916:	4942                	lw	s2,16(sp)
8000a918:	49b2                	lw	s3,12(sp)
8000a91a:	4a22                	lw	s4,8(sp)
8000a91c:	6105                	addi	sp,sp,32
8000a91e:	8082                	ret

8000a920 <__lshift>:
8000a920:	7179                	addi	sp,sp,-48
8000a922:	d422                	sw	s0,40(sp)
8000a924:	842e                	mv	s0,a1
8000a926:	d04a                	sw	s2,32(sp)
8000a928:	01042903          	lw	s2,16(s0)
8000a92c:	d226                	sw	s1,36(sp)
8000a92e:	41cc                	lw	a1,4(a1)
8000a930:	40565493          	srai	s1,a2,0x5
8000a934:	441c                	lw	a5,8(s0)
8000a936:	9926                	add	s2,s2,s1
8000a938:	cc52                	sw	s4,24(sp)
8000a93a:	ca56                	sw	s5,20(sp)
8000a93c:	d606                	sw	ra,44(sp)
8000a93e:	ce4e                	sw	s3,28(sp)
8000a940:	8aaa                	mv	s5,a0
8000a942:	00190a13          	addi	s4,s2,1
8000a946:	0347c563          	blt	a5,s4,8000a970 <__lshift+0x50>
8000a94a:	8556                	mv	a0,s5
8000a94c:	c632                	sw	a2,12(sp)
8000a94e:	3425                	jal	8000a376 <_Balloc>
8000a950:	4632                	lw	a2,12(sp)
8000a952:	89aa                	mv	s3,a0
8000a954:	e10d                	bnez	a0,8000a976 <__lshift+0x56>
8000a956:	8000e6b7          	lui	a3,0x8000e
8000a95a:	8000e537          	lui	a0,0x8000e
8000a95e:	af468693          	addi	a3,a3,-1292 # 8000daf4 <s_wdgs+0x11c>
8000a962:	4601                	li	a2,0
8000a964:	1de00593          	li	a1,478
8000a968:	b0850513          	addi	a0,a0,-1272 # 8000db08 <s_wdgs+0x130>
8000a96c:	a09fd0ef          	jal	80008374 <__assert_func>
8000a970:	0585                	addi	a1,a1,1
8000a972:	0786                	slli	a5,a5,0x1
8000a974:	bfc9                	j	8000a946 <__lshift+0x26>
8000a976:	01450693          	addi	a3,a0,20
8000a97a:	8736                	mv	a4,a3
8000a97c:	4781                	li	a5,0
8000a97e:	0697cf63          	blt	a5,s1,8000a9fc <__lshift+0xdc>
8000a982:	fff4c793          	not	a5,s1
8000a986:	87fd                	srai	a5,a5,0x1f
8000a988:	4818                	lw	a4,16(s0)
8000a98a:	8cfd                	and	s1,s1,a5
8000a98c:	048a                	slli	s1,s1,0x2
8000a98e:	96a6                	add	a3,a3,s1
8000a990:	01440793          	addi	a5,s0,20
8000a994:	070a                	slli	a4,a4,0x2
8000a996:	8a7d                	andi	a2,a2,31
8000a998:	8836                	mv	a6,a3
8000a99a:	973e                	add	a4,a4,a5
8000a99c:	c62d                	beqz	a2,8000aa06 <__lshift+0xe6>
8000a99e:	02000893          	li	a7,32
8000a9a2:	40c888b3          	sub	a7,a7,a2
8000a9a6:	4581                	li	a1,0
8000a9a8:	4388                	lw	a0,0(a5)
8000a9aa:	8336                	mv	t1,a3
8000a9ac:	0691                	addi	a3,a3,4
8000a9ae:	00c51533          	sll	a0,a0,a2
8000a9b2:	8dc9                	or	a1,a1,a0
8000a9b4:	00b32023          	sw	a1,0(t1)
8000a9b8:	438c                	lw	a1,0(a5)
8000a9ba:	0791                	addi	a5,a5,4
8000a9bc:	0115d5b3          	srl	a1,a1,a7
8000a9c0:	fee7e4e3          	bltu	a5,a4,8000a9a8 <__lshift+0x88>
8000a9c4:	01540793          	addi	a5,s0,21
8000a9c8:	4681                	li	a3,0
8000a9ca:	00f76663          	bltu	a4,a5,8000a9d6 <__lshift+0xb6>
8000a9ce:	8f01                	sub	a4,a4,s0
8000a9d0:	172d                	addi	a4,a4,-21
8000a9d2:	ffc77693          	andi	a3,a4,-4
8000a9d6:	9836                	add	a6,a6,a3
8000a9d8:	00b82223          	sw	a1,4(a6)
8000a9dc:	ed85                	bnez	a1,8000aa14 <__lshift+0xf4>
8000a9de:	0129a823          	sw	s2,16(s3)
8000a9e2:	8556                	mv	a0,s5
8000a9e4:	85a2                	mv	a1,s0
8000a9e6:	3435                	jal	8000a412 <_Bfree>
8000a9e8:	50b2                	lw	ra,44(sp)
8000a9ea:	5422                	lw	s0,40(sp)
8000a9ec:	5492                	lw	s1,36(sp)
8000a9ee:	5902                	lw	s2,32(sp)
8000a9f0:	4a62                	lw	s4,24(sp)
8000a9f2:	4ad2                	lw	s5,20(sp)
8000a9f4:	854e                	mv	a0,s3
8000a9f6:	49f2                	lw	s3,28(sp)
8000a9f8:	6145                	addi	sp,sp,48
8000a9fa:	8082                	ret
8000a9fc:	00072023          	sw	zero,0(a4)
8000aa00:	0785                	addi	a5,a5,1
8000aa02:	0711                	addi	a4,a4,4
8000aa04:	bfad                	j	8000a97e <__lshift+0x5e>
8000aa06:	438c                	lw	a1,0(a5)
8000aa08:	0791                	addi	a5,a5,4
8000aa0a:	c28c                	sw	a1,0(a3)
8000aa0c:	0691                	addi	a3,a3,4
8000aa0e:	fee7ece3          	bltu	a5,a4,8000aa06 <__lshift+0xe6>
8000aa12:	b7f1                	j	8000a9de <__lshift+0xbe>
8000aa14:	8952                	mv	s2,s4
8000aa16:	b7e1                	j	8000a9de <__lshift+0xbe>

8000aa18 <__mcmp>:
8000aa18:	4914                	lw	a3,16(a0)
8000aa1a:	499c                	lw	a5,16(a1)
8000aa1c:	872a                	mv	a4,a0
8000aa1e:	40f68533          	sub	a0,a3,a5
8000aa22:	02f69563          	bne	a3,a5,8000aa4c <__mcmp+0x34>
8000aa26:	078a                	slli	a5,a5,0x2
8000aa28:	0751                	addi	a4,a4,20
8000aa2a:	05d1                	addi	a1,a1,20
8000aa2c:	00f706b3          	add	a3,a4,a5
8000aa30:	95be                	add	a1,a1,a5
8000aa32:	16f1                	addi	a3,a3,-4
8000aa34:	15f1                	addi	a1,a1,-4
8000aa36:	4290                	lw	a2,0(a3)
8000aa38:	419c                	lw	a5,0(a1)
8000aa3a:	00f60763          	beq	a2,a5,8000aa48 <__mcmp+0x30>
8000aa3e:	4505                	li	a0,1
8000aa40:	00f67663          	bgeu	a2,a5,8000aa4c <__mcmp+0x34>
8000aa44:	557d                	li	a0,-1
8000aa46:	8082                	ret
8000aa48:	fed765e3          	bltu	a4,a3,8000aa32 <__mcmp+0x1a>
8000aa4c:	8082                	ret

8000aa4e <__mdiff>:
8000aa4e:	1101                	addi	sp,sp,-32
8000aa50:	cc22                	sw	s0,24(sp)
8000aa52:	842e                	mv	s0,a1
8000aa54:	c64e                	sw	s3,12(sp)
8000aa56:	85b2                	mv	a1,a2
8000aa58:	89aa                	mv	s3,a0
8000aa5a:	8522                	mv	a0,s0
8000aa5c:	ca26                	sw	s1,20(sp)
8000aa5e:	ce06                	sw	ra,28(sp)
8000aa60:	c84a                	sw	s2,16(sp)
8000aa62:	84b2                	mv	s1,a2
8000aa64:	3f55                	jal	8000aa18 <__mcmp>
8000aa66:	ed0d                	bnez	a0,8000aaa0 <__mdiff+0x52>
8000aa68:	4581                	li	a1,0
8000aa6a:	854e                	mv	a0,s3
8000aa6c:	3229                	jal	8000a376 <_Balloc>
8000aa6e:	ed11                	bnez	a0,8000aa8a <__mdiff+0x3c>
8000aa70:	8000e6b7          	lui	a3,0x8000e
8000aa74:	af468693          	addi	a3,a3,-1292 # 8000daf4 <s_wdgs+0x11c>
8000aa78:	4601                	li	a2,0
8000aa7a:	23700593          	li	a1,567
8000aa7e:	8000e537          	lui	a0,0x8000e
8000aa82:	b0850513          	addi	a0,a0,-1272 # 8000db08 <s_wdgs+0x130>
8000aa86:	8effd0ef          	jal	80008374 <__assert_func>
8000aa8a:	4785                	li	a5,1
8000aa8c:	c91c                	sw	a5,16(a0)
8000aa8e:	00052a23          	sw	zero,20(a0)
8000aa92:	40f2                	lw	ra,28(sp)
8000aa94:	4462                	lw	s0,24(sp)
8000aa96:	44d2                	lw	s1,20(sp)
8000aa98:	4942                	lw	s2,16(sp)
8000aa9a:	49b2                	lw	s3,12(sp)
8000aa9c:	6105                	addi	sp,sp,32
8000aa9e:	8082                	ret
8000aaa0:	4901                	li	s2,0
8000aaa2:	00055663          	bgez	a0,8000aaae <__mdiff+0x60>
8000aaa6:	87a2                	mv	a5,s0
8000aaa8:	4905                	li	s2,1
8000aaaa:	8426                	mv	s0,s1
8000aaac:	84be                	mv	s1,a5
8000aaae:	404c                	lw	a1,4(s0)
8000aab0:	854e                	mv	a0,s3
8000aab2:	30d1                	jal	8000a376 <_Balloc>
8000aab4:	e909                	bnez	a0,8000aac6 <__mdiff+0x78>
8000aab6:	8000e6b7          	lui	a3,0x8000e
8000aaba:	af468693          	addi	a3,a3,-1292 # 8000daf4 <s_wdgs+0x11c>
8000aabe:	4601                	li	a2,0
8000aac0:	24500593          	li	a1,581
8000aac4:	bf6d                	j	8000aa7e <__mdiff+0x30>
8000aac6:	01042803          	lw	a6,16(s0)
8000aaca:	489c                	lw	a5,16(s1)
8000aacc:	0451                	addi	s0,s0,20
8000aace:	00281893          	slli	a7,a6,0x2
8000aad2:	01448613          	addi	a2,s1,20
8000aad6:	078a                	slli	a5,a5,0x2
8000aad8:	01450593          	addi	a1,a0,20
8000aadc:	01252623          	sw	s2,12(a0)
8000aae0:	98a2                	add	a7,a7,s0
8000aae2:	97b2                	add	a5,a5,a2
8000aae4:	8eae                	mv	t4,a1
8000aae6:	8f22                	mv	t5,s0
8000aae8:	4301                	li	t1,0
8000aaea:	000f2703          	lw	a4,0(t5)
8000aaee:	00062e03          	lw	t3,0(a2)
8000aaf2:	0611                	addi	a2,a2,4
8000aaf4:	01071693          	slli	a3,a4,0x10
8000aaf8:	010e1f93          	slli	t6,t3,0x10
8000aafc:	82c1                	srli	a3,a3,0x10
8000aafe:	010fdf93          	srli	t6,t6,0x10
8000ab02:	41f686b3          	sub	a3,a3,t6
8000ab06:	969a                	add	a3,a3,t1
8000ab08:	8341                	srli	a4,a4,0x10
8000ab0a:	010e5e13          	srli	t3,t3,0x10
8000ab0e:	4106d313          	srai	t1,a3,0x10
8000ab12:	41c70733          	sub	a4,a4,t3
8000ab16:	971a                	add	a4,a4,t1
8000ab18:	06c2                	slli	a3,a3,0x10
8000ab1a:	41075313          	srai	t1,a4,0x10
8000ab1e:	82c1                	srli	a3,a3,0x10
8000ab20:	0742                	slli	a4,a4,0x10
8000ab22:	8ed9                	or	a3,a3,a4
8000ab24:	00dea023          	sw	a3,0(t4)
8000ab28:	0f11                	addi	t5,t5,4
8000ab2a:	0e91                	addi	t4,t4,4
8000ab2c:	faf66fe3          	bltu	a2,a5,8000aaea <__mdiff+0x9c>
8000ab30:	01548693          	addi	a3,s1,21
8000ab34:	4701                	li	a4,0
8000ab36:	00d7e663          	bltu	a5,a3,8000ab42 <__mdiff+0xf4>
8000ab3a:	8f85                	sub	a5,a5,s1
8000ab3c:	17ad                	addi	a5,a5,-21
8000ab3e:	ffc7f713          	andi	a4,a5,-4
8000ab42:	00e406b3          	add	a3,s0,a4
8000ab46:	00e58e33          	add	t3,a1,a4
8000ab4a:	00468e93          	addi	t4,a3,4
8000ab4e:	0e11                	addi	t3,t3,4
8000ab50:	8676                	mv	a2,t4
8000ab52:	8d81                	sub	a1,a1,s0
8000ab54:	03166363          	bltu	a2,a7,8000ab7a <__mdiff+0x12c>
8000ab58:	00168713          	addi	a4,a3,1
8000ab5c:	4781                	li	a5,0
8000ab5e:	00e8e763          	bltu	a7,a4,8000ab6c <__mdiff+0x11e>
8000ab62:	088d                	addi	a7,a7,3
8000ab64:	41d888b3          	sub	a7,a7,t4
8000ab68:	ffc8f793          	andi	a5,a7,-4
8000ab6c:	97f2                	add	a5,a5,t3
8000ab6e:	17f1                	addi	a5,a5,-4
8000ab70:	4398                	lw	a4,0(a5)
8000ab72:	cb1d                	beqz	a4,8000aba8 <__mdiff+0x15a>
8000ab74:	01052823          	sw	a6,16(a0)
8000ab78:	bf29                	j	8000aa92 <__mdiff+0x44>
8000ab7a:	4218                	lw	a4,0(a2)
8000ab7c:	8f1a                	mv	t5,t1
8000ab7e:	00b60fb3          	add	t6,a2,a1
8000ab82:	01071793          	slli	a5,a4,0x10
8000ab86:	83c1                	srli	a5,a5,0x10
8000ab88:	979a                	add	a5,a5,t1
8000ab8a:	87c1                	srai	a5,a5,0x10
8000ab8c:	01075313          	srli	t1,a4,0x10
8000ab90:	977a                	add	a4,a4,t5
8000ab92:	979a                	add	a5,a5,t1
8000ab94:	0742                	slli	a4,a4,0x10
8000ab96:	4107d313          	srai	t1,a5,0x10
8000ab9a:	8341                	srli	a4,a4,0x10
8000ab9c:	07c2                	slli	a5,a5,0x10
8000ab9e:	8f5d                	or	a4,a4,a5
8000aba0:	0611                	addi	a2,a2,4
8000aba2:	00efa023          	sw	a4,0(t6)
8000aba6:	b77d                	j	8000ab54 <__mdiff+0x106>
8000aba8:	187d                	addi	a6,a6,-1
8000abaa:	b7d1                	j	8000ab6e <__mdiff+0x120>

8000abac <__ulp>:
8000abac:	7ff007b7          	lui	a5,0x7ff00
8000abb0:	8dfd                	and	a1,a1,a5
8000abb2:	fcc007b7          	lui	a5,0xfcc00
8000abb6:	95be                	add	a1,a1,a5
8000abb8:	00b04d63          	bgtz	a1,8000abd2 <__ulp+0x26>
8000abbc:	40b005b3          	neg	a1,a1
8000abc0:	4145d793          	srai	a5,a1,0x14
8000abc4:	474d                	li	a4,19
8000abc6:	00f74863          	blt	a4,a5,8000abd6 <__ulp+0x2a>
8000abca:	000805b7          	lui	a1,0x80
8000abce:	40f5d5b3          	sra	a1,a1,a5
8000abd2:	4781                	li	a5,0
8000abd4:	a819                	j	8000abea <__ulp+0x3e>
8000abd6:	fec78713          	addi	a4,a5,-20 # fcbfffec <__fast_load_addr__+0x7cbf1e2c>
8000abda:	47f9                	li	a5,30
8000abdc:	00e7c963          	blt	a5,a4,8000abee <__ulp+0x42>
8000abe0:	800007b7          	lui	a5,0x80000
8000abe4:	00e7d7b3          	srl	a5,a5,a4
8000abe8:	4581                	li	a1,0
8000abea:	853e                	mv	a0,a5
8000abec:	8082                	ret
8000abee:	4581                	li	a1,0
8000abf0:	4785                	li	a5,1
8000abf2:	bfe5                	j	8000abea <__ulp+0x3e>

8000abf4 <__b2d>:
8000abf4:	7179                	addi	sp,sp,-48
8000abf6:	d226                	sw	s1,36(sp)
8000abf8:	4904                	lw	s1,16(a0)
8000abfa:	ce4e                	sw	s3,28(sp)
8000abfc:	01450993          	addi	s3,a0,20
8000ac00:	048a                	slli	s1,s1,0x2
8000ac02:	94ce                	add	s1,s1,s3
8000ac04:	d422                	sw	s0,40(sp)
8000ac06:	ffc4a403          	lw	s0,-4(s1)
8000ac0a:	d04a                	sw	s2,32(sp)
8000ac0c:	c62e                	sw	a1,12(sp)
8000ac0e:	8522                	mv	a0,s0
8000ac10:	d606                	sw	ra,44(sp)
8000ac12:	32f1                	jal	8000a5de <__hi0bits>
8000ac14:	45b2                	lw	a1,12(sp)
8000ac16:	02000793          	li	a5,32
8000ac1a:	8f89                	sub	a5,a5,a0
8000ac1c:	c19c                	sw	a5,0(a1)
8000ac1e:	47a9                	li	a5,10
8000ac20:	ffc48913          	addi	s2,s1,-4
8000ac24:	02a7cd63          	blt	a5,a0,8000ac5e <__b2d+0x6a>
8000ac28:	46ad                	li	a3,11
8000ac2a:	8e89                	sub	a3,a3,a0
8000ac2c:	3ff007b7          	lui	a5,0x3ff00
8000ac30:	00d45733          	srl	a4,s0,a3
8000ac34:	8f5d                	or	a4,a4,a5
8000ac36:	4781                	li	a5,0
8000ac38:	0129f463          	bgeu	s3,s2,8000ac40 <__b2d+0x4c>
8000ac3c:	ff84a783          	lw	a5,-8(s1)
8000ac40:	0555                	addi	a0,a0,21
8000ac42:	00a41433          	sll	s0,s0,a0
8000ac46:	00d7d7b3          	srl	a5,a5,a3
8000ac4a:	8fc1                	or	a5,a5,s0
8000ac4c:	50b2                	lw	ra,44(sp)
8000ac4e:	5422                	lw	s0,40(sp)
8000ac50:	5492                	lw	s1,36(sp)
8000ac52:	5902                	lw	s2,32(sp)
8000ac54:	49f2                	lw	s3,28(sp)
8000ac56:	853e                	mv	a0,a5
8000ac58:	85ba                	mv	a1,a4
8000ac5a:	6145                	addi	sp,sp,48
8000ac5c:	8082                	ret
8000ac5e:	4781                	li	a5,0
8000ac60:	0129f663          	bgeu	s3,s2,8000ac6c <__b2d+0x78>
8000ac64:	ff84a783          	lw	a5,-8(s1)
8000ac68:	ff848913          	addi	s2,s1,-8
8000ac6c:	1555                	addi	a0,a0,-11
8000ac6e:	c51d                	beqz	a0,8000ac9c <__b2d+0xa8>
8000ac70:	02000613          	li	a2,32
8000ac74:	8e09                	sub	a2,a2,a0
8000ac76:	00c7d733          	srl	a4,a5,a2
8000ac7a:	00a41433          	sll	s0,s0,a0
8000ac7e:	8c59                	or	s0,s0,a4
8000ac80:	3ff00737          	lui	a4,0x3ff00
8000ac84:	8f41                	or	a4,a4,s0
8000ac86:	4681                	li	a3,0
8000ac88:	0129f463          	bgeu	s3,s2,8000ac90 <__b2d+0x9c>
8000ac8c:	ffc92683          	lw	a3,-4(s2)
8000ac90:	00a797b3          	sll	a5,a5,a0
8000ac94:	00c6d6b3          	srl	a3,a3,a2
8000ac98:	8fd5                	or	a5,a5,a3
8000ac9a:	bf4d                	j	8000ac4c <__b2d+0x58>
8000ac9c:	3ff00737          	lui	a4,0x3ff00
8000aca0:	8f41                	or	a4,a4,s0
8000aca2:	b76d                	j	8000ac4c <__b2d+0x58>

8000aca4 <__d2b>:
8000aca4:	7179                	addi	sp,sp,-48
8000aca6:	d422                	sw	s0,40(sp)
8000aca8:	842e                	mv	s0,a1
8000acaa:	4585                	li	a1,1
8000acac:	d226                	sw	s1,36(sp)
8000acae:	d04a                	sw	s2,32(sp)
8000acb0:	cc52                	sw	s4,24(sp)
8000acb2:	d606                	sw	ra,44(sp)
8000acb4:	ce4e                	sw	s3,28(sp)
8000acb6:	84b2                	mv	s1,a2
8000acb8:	8936                	mv	s2,a3
8000acba:	8a3a                	mv	s4,a4
8000acbc:	ebaff0ef          	jal	8000a376 <_Balloc>
8000acc0:	ed11                	bnez	a0,8000acdc <__d2b+0x38>
8000acc2:	8000e6b7          	lui	a3,0x8000e
8000acc6:	8000e537          	lui	a0,0x8000e
8000acca:	af468693          	addi	a3,a3,-1292 # 8000daf4 <s_wdgs+0x11c>
8000acce:	4601                	li	a2,0
8000acd0:	30f00593          	li	a1,783
8000acd4:	b0850513          	addi	a0,a0,-1272 # 8000db08 <s_wdgs+0x130>
8000acd8:	e9cfd0ef          	jal	80008374 <__assert_func>
8000acdc:	00c49793          	slli	a5,s1,0xc
8000ace0:	80d1                	srli	s1,s1,0x14
8000ace2:	7ff4f493          	andi	s1,s1,2047
8000ace6:	89aa                	mv	s3,a0
8000ace8:	83b1                	srli	a5,a5,0xc
8000acea:	c481                	beqz	s1,8000acf2 <__d2b+0x4e>
8000acec:	00100737          	lui	a4,0x100
8000acf0:	8fd9                	or	a5,a5,a4
8000acf2:	c63e                	sw	a5,12(sp)
8000acf4:	c035                	beqz	s0,8000ad58 <__d2b+0xb4>
8000acf6:	0028                	addi	a0,sp,8
8000acf8:	c422                	sw	s0,8(sp)
8000acfa:	3235                	jal	8000a626 <__lo0bits>
8000acfc:	46a2                	lw	a3,8(sp)
8000acfe:	c931                	beqz	a0,8000ad52 <__d2b+0xae>
8000ad00:	4732                	lw	a4,12(sp)
8000ad02:	02000793          	li	a5,32
8000ad06:	8f89                	sub	a5,a5,a0
8000ad08:	00f717b3          	sll	a5,a4,a5
8000ad0c:	8fd5                	or	a5,a5,a3
8000ad0e:	00a75733          	srl	a4,a4,a0
8000ad12:	00f9aa23          	sw	a5,20(s3)
8000ad16:	c63a                	sw	a4,12(sp)
8000ad18:	4432                	lw	s0,12(sp)
8000ad1a:	0089ac23          	sw	s0,24(s3)
8000ad1e:	00803433          	snez	s0,s0
8000ad22:	0405                	addi	s0,s0,1
8000ad24:	0089a823          	sw	s0,16(s3)
8000ad28:	c0a9                	beqz	s1,8000ad6a <__d2b+0xc6>
8000ad2a:	bcd48493          	addi	s1,s1,-1075
8000ad2e:	94aa                	add	s1,s1,a0
8000ad30:	00992023          	sw	s1,0(s2)
8000ad34:	03500413          	li	s0,53
8000ad38:	40a40533          	sub	a0,s0,a0
8000ad3c:	50b2                	lw	ra,44(sp)
8000ad3e:	5422                	lw	s0,40(sp)
8000ad40:	00aa2023          	sw	a0,0(s4)
8000ad44:	5492                	lw	s1,36(sp)
8000ad46:	5902                	lw	s2,32(sp)
8000ad48:	4a62                	lw	s4,24(sp)
8000ad4a:	854e                	mv	a0,s3
8000ad4c:	49f2                	lw	s3,28(sp)
8000ad4e:	6145                	addi	sp,sp,48
8000ad50:	8082                	ret
8000ad52:	00d9aa23          	sw	a3,20(s3)
8000ad56:	b7c9                	j	8000ad18 <__d2b+0x74>
8000ad58:	0068                	addi	a0,sp,12
8000ad5a:	30f1                	jal	8000a626 <__lo0bits>
8000ad5c:	47b2                	lw	a5,12(sp)
8000ad5e:	02050513          	addi	a0,a0,32
8000ad62:	4405                	li	s0,1
8000ad64:	00f9aa23          	sw	a5,20(s3)
8000ad68:	bf75                	j	8000ad24 <__d2b+0x80>
8000ad6a:	00241793          	slli	a5,s0,0x2
8000ad6e:	bce50513          	addi	a0,a0,-1074
8000ad72:	97ce                	add	a5,a5,s3
8000ad74:	00a92023          	sw	a0,0(s2)
8000ad78:	4b88                	lw	a0,16(a5)
8000ad7a:	0416                	slli	s0,s0,0x5
8000ad7c:	308d                	jal	8000a5de <__hi0bits>
8000ad7e:	bf6d                	j	8000ad38 <__d2b+0x94>

8000ad80 <__ratio>:
8000ad80:	7179                	addi	sp,sp,-48
8000ad82:	d04a                	sw	s2,32(sp)
8000ad84:	892e                	mv	s2,a1
8000ad86:	002c                	addi	a1,sp,8
8000ad88:	d606                	sw	ra,44(sp)
8000ad8a:	d422                	sw	s0,40(sp)
8000ad8c:	d226                	sw	s1,36(sp)
8000ad8e:	ce4e                	sw	s3,28(sp)
8000ad90:	cc52                	sw	s4,24(sp)
8000ad92:	89aa                	mv	s3,a0
8000ad94:	3585                	jal	8000abf4 <__b2d>
8000ad96:	8a2a                	mv	s4,a0
8000ad98:	84ae                	mv	s1,a1
8000ad9a:	842e                	mv	s0,a1
8000ad9c:	854a                	mv	a0,s2
8000ad9e:	006c                	addi	a1,sp,12
8000ada0:	3d91                	jal	8000abf4 <__b2d>
8000ada2:	01092703          	lw	a4,16(s2)
8000ada6:	0109a783          	lw	a5,16(s3)
8000adaa:	4632                	lw	a2,12(sp)
8000adac:	8f99                	sub	a5,a5,a4
8000adae:	4722                	lw	a4,8(sp)
8000adb0:	0796                	slli	a5,a5,0x5
8000adb2:	8f11                	sub	a4,a4,a2
8000adb4:	97ba                	add	a5,a5,a4
8000adb6:	02f05363          	blez	a5,8000addc <__ratio+0x5c>
8000adba:	07d2                	slli	a5,a5,0x14
8000adbc:	86ae                	mv	a3,a1
8000adbe:	00978433          	add	s0,a5,s1
8000adc2:	862a                	mv	a2,a0
8000adc4:	85a2                	mv	a1,s0
8000adc6:	8552                	mv	a0,s4
8000adc8:	f95f80ef          	jal	80003d5c <__divdf3>
8000adcc:	50b2                	lw	ra,44(sp)
8000adce:	5422                	lw	s0,40(sp)
8000add0:	5492                	lw	s1,36(sp)
8000add2:	5902                	lw	s2,32(sp)
8000add4:	49f2                	lw	s3,28(sp)
8000add6:	4a62                	lw	s4,24(sp)
8000add8:	6145                	addi	sp,sp,48
8000adda:	8082                	ret
8000addc:	fff00737          	lui	a4,0xfff00
8000ade0:	02e787b3          	mul	a5,a5,a4
8000ade4:	00b786b3          	add	a3,a5,a1
8000ade8:	bfe9                	j	8000adc2 <__ratio+0x42>

8000adea <__copybits>:
8000adea:	fff58793          	addi	a5,a1,-1 # 7ffff <_noncacheable_size+0x3ffff>
8000adee:	4a18                	lw	a4,16(a2)
8000adf0:	8795                	srai	a5,a5,0x5
8000adf2:	0785                	addi	a5,a5,1 # 3ff00001 <__share_mem_end__+0x3ed80001>
8000adf4:	078a                	slli	a5,a5,0x2
8000adf6:	01460693          	addi	a3,a2,20
8000adfa:	070a                	slli	a4,a4,0x2
8000adfc:	97aa                	add	a5,a5,a0
8000adfe:	9736                	add	a4,a4,a3
8000ae00:	85aa                	mv	a1,a0
8000ae02:	00e6ef63          	bltu	a3,a4,8000ae20 <__copybits+0x36>
8000ae06:	01160693          	addi	a3,a2,17
8000ae0a:	4581                	li	a1,0
8000ae0c:	00d76663          	bltu	a4,a3,8000ae18 <__copybits+0x2e>
8000ae10:	8f11                	sub	a4,a4,a2
8000ae12:	173d                	addi	a4,a4,-17 # ffefffef <__fast_load_addr__+0x7fef1e2f>
8000ae14:	ffc77593          	andi	a1,a4,-4
8000ae18:	952e                	add	a0,a0,a1
8000ae1a:	00f56a63          	bltu	a0,a5,8000ae2e <__copybits+0x44>
8000ae1e:	8082                	ret
8000ae20:	0006a803          	lw	a6,0(a3)
8000ae24:	0691                	addi	a3,a3,4
8000ae26:	0105a023          	sw	a6,0(a1)
8000ae2a:	0591                	addi	a1,a1,4
8000ae2c:	bfd9                	j	8000ae02 <__copybits+0x18>
8000ae2e:	00052023          	sw	zero,0(a0)
8000ae32:	0511                	addi	a0,a0,4
8000ae34:	b7dd                	j	8000ae1a <__copybits+0x30>

8000ae36 <__any_on>:
8000ae36:	491c                	lw	a5,16(a0)
8000ae38:	4055d713          	srai	a4,a1,0x5
8000ae3c:	01450693          	addi	a3,a0,20
8000ae40:	00e7c763          	blt	a5,a4,8000ae4e <__any_on+0x18>
8000ae44:	00f75463          	bge	a4,a5,8000ae4c <__any_on+0x16>
8000ae48:	89fd                	andi	a1,a1,31
8000ae4a:	e981                	bnez	a1,8000ae5a <__any_on+0x24>
8000ae4c:	87ba                	mv	a5,a4
8000ae4e:	078a                	slli	a5,a5,0x2
8000ae50:	97b6                	add	a5,a5,a3
8000ae52:	02f6e063          	bltu	a3,a5,8000ae72 <__any_on+0x3c>
8000ae56:	4501                	li	a0,0
8000ae58:	8082                	ret
8000ae5a:	00271793          	slli	a5,a4,0x2
8000ae5e:	97b6                	add	a5,a5,a3
8000ae60:	4390                	lw	a2,0(a5)
8000ae62:	00b657b3          	srl	a5,a2,a1
8000ae66:	00b797b3          	sll	a5,a5,a1
8000ae6a:	fef601e3          	beq	a2,a5,8000ae4c <__any_on+0x16>
8000ae6e:	4505                	li	a0,1
8000ae70:	8082                	ret
8000ae72:	17f1                	addi	a5,a5,-4
8000ae74:	4398                	lw	a4,0(a5)
8000ae76:	df71                	beqz	a4,8000ae52 <__any_on+0x1c>
8000ae78:	bfdd                	j	8000ae6e <__any_on+0x38>

8000ae7a <sulp>:
8000ae7a:	1101                	addi	sp,sp,-32
8000ae7c:	cc22                	sw	s0,24(sp)
8000ae7e:	c632                	sw	a2,12(sp)
8000ae80:	ce06                	sw	ra,28(sp)
8000ae82:	842e                	mv	s0,a1
8000ae84:	3325                	jal	8000abac <__ulp>
8000ae86:	4632                	lw	a2,12(sp)
8000ae88:	872a                	mv	a4,a0
8000ae8a:	87ae                	mv	a5,a1
8000ae8c:	c21d                	beqz	a2,8000aeb2 <sulp+0x38>
8000ae8e:	8051                	srli	s0,s0,0x14
8000ae90:	7ff47413          	andi	s0,s0,2047
8000ae94:	06b00693          	li	a3,107
8000ae98:	8e81                	sub	a3,a3,s0
8000ae9a:	00d05c63          	blez	a3,8000aeb2 <sulp+0x38>
8000ae9e:	06d2                	slli	a3,a3,0x14
8000aea0:	3ff007b7          	lui	a5,0x3ff00
8000aea4:	97b6                	add	a5,a5,a3
8000aea6:	86be                	mv	a3,a5
8000aea8:	4601                	li	a2,0
8000aeaa:	beaf90ef          	jal	80004294 <__muldf3>
8000aeae:	872a                	mv	a4,a0
8000aeb0:	87ae                	mv	a5,a1
8000aeb2:	40f2                	lw	ra,28(sp)
8000aeb4:	4462                	lw	s0,24(sp)
8000aeb6:	853a                	mv	a0,a4
8000aeb8:	85be                	mv	a1,a5
8000aeba:	6105                	addi	sp,sp,32
8000aebc:	8082                	ret

8000aebe <_strtod_l>:
8000aebe:	7171                	addi	sp,sp,-176
8000aec0:	d522                	sw	s0,168(sp)
8000aec2:	d326                	sw	s1,164(sp)
8000aec4:	d14a                	sw	s2,160(sp)
8000aec6:	ce32                	sw	a2,28(sp)
8000aec8:	d706                	sw	ra,172(sp)
8000aeca:	cf4e                	sw	s3,156(sp)
8000aecc:	cd52                	sw	s4,152(sp)
8000aece:	cb56                	sw	s5,148(sp)
8000aed0:	c95a                	sw	s6,144(sp)
8000aed2:	c75e                	sw	s7,140(sp)
8000aed4:	c562                	sw	s8,136(sp)
8000aed6:	c366                	sw	s9,132(sp)
8000aed8:	c16a                	sw	s10,128(sp)
8000aeda:	deee                	sw	s11,124(sp)
8000aedc:	c02a                	sw	a0,0(sp)
8000aede:	892e                	mv	s2,a1
8000aee0:	d082                	sw	zero,96(sp)
8000aee2:	4481                	li	s1,0
8000aee4:	4401                	li	s0,0
8000aee6:	872e                	mv	a4,a1
8000aee8:	02b00613          	li	a2,43
8000aeec:	ceba                	sw	a4,92(sp)
8000aeee:	00074783          	lbu	a5,0(a4)
8000aef2:	0cc78e63          	beq	a5,a2,8000afce <_strtod_l+0x110>
8000aef6:	08f66b63          	bltu	a2,a5,8000af8c <_strtod_l+0xce>
8000aefa:	45b5                	li	a1,13
8000aefc:	08f5e263          	bltu	a1,a5,8000af80 <_strtod_l+0xc2>
8000af00:	45a1                	li	a1,8
8000af02:	08f5e363          	bltu	a1,a5,8000af88 <_strtod_l+0xca>
8000af06:	cfd9                	beqz	a5,8000afa4 <_strtod_l+0xe6>
8000af08:	8aba                	mv	s5,a4
8000af0a:	c202                	sw	zero,4(sp)
8000af0c:	4b81                	li	s7,0
8000af0e:	8556                	mv	a0,s5
8000af10:	4d81                	li	s11,0
8000af12:	4b01                	li	s6,0
8000af14:	4c81                	li	s9,0
8000af16:	46a5                	li	a3,9
8000af18:	4621                	li	a2,8
8000af1a:	4729                	li	a4,10
8000af1c:	00054a03          	lbu	s4,0(a0)
8000af20:	fd0a0793          	addi	a5,s4,-48
8000af24:	0ff7f793          	zext.b	a5,a5
8000af28:	1af6f063          	bgeu	a3,a5,8000b0c8 <_strtod_l+0x20a>
8000af2c:	8000e5b7          	lui	a1,0x8000e
8000af30:	4605                	li	a2,1
8000af32:	b6858593          	addi	a1,a1,-1176 # 8000db68 <s_wdgs+0x190>
8000af36:	105010ef          	jal	8000c83a <strncmp>
8000af3a:	1a050863          	beqz	a0,8000b0ea <_strtod_l+0x22c>
8000af3e:	87d2                	mv	a5,s4
8000af40:	8d66                	mv	s10,s9
8000af42:	4701                	li	a4,0
8000af44:	4c01                	li	s8,0
8000af46:	4501                	li	a0,0
8000af48:	fdf7f693          	andi	a3,a5,-33
8000af4c:	04500613          	li	a2,69
8000af50:	34c69863          	bne	a3,a2,8000b2a0 <_strtod_l+0x3e2>
8000af54:	00ed67b3          	or	a5,s10,a4
8000af58:	0177e7b3          	or	a5,a5,s7
8000af5c:	c7a1                	beqz	a5,8000afa4 <_strtod_l+0xe6>
8000af5e:	4976                	lw	s2,92(sp)
8000af60:	02b00693          	li	a3,43
8000af64:	00190793          	addi	a5,s2,1
8000af68:	cebe                	sw	a5,92(sp)
8000af6a:	00194783          	lbu	a5,1(s2)
8000af6e:	22d78d63          	beq	a5,a3,8000b1a8 <_strtod_l+0x2ea>
8000af72:	02d00693          	li	a3,45
8000af76:	4801                	li	a6,0
8000af78:	22d79e63          	bne	a5,a3,8000b1b4 <_strtod_l+0x2f6>
8000af7c:	4805                	li	a6,1
8000af7e:	a435                	j	8000b1aa <_strtod_l+0x2ec>
8000af80:	02000593          	li	a1,32
8000af84:	f8b792e3          	bne	a5,a1,8000af08 <_strtod_l+0x4a>
8000af88:	0705                	addi	a4,a4,1
8000af8a:	b78d                	j	8000aeec <_strtod_l+0x2e>
8000af8c:	02d00613          	li	a2,45
8000af90:	04c79163          	bne	a5,a2,8000afd2 <_strtod_l+0x114>
8000af94:	4785                	li	a5,1
8000af96:	c23e                	sw	a5,4(sp)
8000af98:	00170a93          	addi	s5,a4,1
8000af9c:	ced6                	sw	s5,92(sp)
8000af9e:	00174783          	lbu	a5,1(a4)
8000afa2:	eb95                	bnez	a5,8000afd6 <_strtod_l+0x118>
8000afa4:	47f2                	lw	a5,28(sp)
8000afa6:	ceca                	sw	s2,92(sp)
8000afa8:	c202                	sw	zero,4(sp)
8000afaa:	efad                	bnez	a5,8000b024 <_strtod_l+0x166>
8000afac:	50ba                	lw	ra,172(sp)
8000afae:	85a2                	mv	a1,s0
8000afb0:	542a                	lw	s0,168(sp)
8000afb2:	590a                	lw	s2,160(sp)
8000afb4:	49fa                	lw	s3,156(sp)
8000afb6:	4a6a                	lw	s4,152(sp)
8000afb8:	4ada                	lw	s5,148(sp)
8000afba:	4b4a                	lw	s6,144(sp)
8000afbc:	4bba                	lw	s7,140(sp)
8000afbe:	4c2a                	lw	s8,136(sp)
8000afc0:	4c9a                	lw	s9,132(sp)
8000afc2:	4d0a                	lw	s10,128(sp)
8000afc4:	5df6                	lw	s11,124(sp)
8000afc6:	8526                	mv	a0,s1
8000afc8:	549a                	lw	s1,164(sp)
8000afca:	614d                	addi	sp,sp,176
8000afcc:	8082                	ret
8000afce:	c202                	sw	zero,4(sp)
8000afd0:	b7e1                	j	8000af98 <_strtod_l+0xda>
8000afd2:	8aba                	mv	s5,a4
8000afd4:	c202                	sw	zero,4(sp)
8000afd6:	03000713          	li	a4,48
8000afda:	4b81                	li	s7,0
8000afdc:	f2e799e3          	bne	a5,a4,8000af0e <_strtod_l+0x50>
8000afe0:	001ac703          	lbu	a4,1(s5)
8000afe4:	05800613          	li	a2,88
8000afe8:	001a8b13          	addi	s6,s5,1
8000afec:	0df77713          	andi	a4,a4,223
8000aff0:	0cc71263          	bne	a4,a2,8000b0b4 <_strtod_l+0x1f6>
8000aff4:	4792                	lw	a5,4(sp)
8000aff6:	4502                	lw	a0,0(sp)
8000aff8:	8000e637          	lui	a2,0x8000e
8000affc:	8836                	mv	a6,a3
8000affe:	1098                	addi	a4,sp,96
8000b000:	10d4                	addi	a3,sp,100
8000b002:	df860613          	addi	a2,a2,-520 # 8000ddf8 <fpi.1>
8000b006:	08ec                	addi	a1,sp,92
8000b008:	36b010ef          	jal	8000cb72 <__gethex>
8000b00c:	00f57913          	andi	s2,a0,15
8000b010:	8a2a                	mv	s4,a0
8000b012:	00090763          	beqz	s2,8000b020 <_strtod_l+0x162>
8000b016:	4799                	li	a5,6
8000b018:	00f91f63          	bne	s2,a5,8000b036 <_strtod_l+0x178>
8000b01c:	ceda                	sw	s6,92(sp)
8000b01e:	c202                	sw	zero,4(sp)
8000b020:	47f2                	lw	a5,28(sp)
8000b022:	c781                	beqz	a5,8000b02a <_strtod_l+0x16c>
8000b024:	47f6                	lw	a5,92(sp)
8000b026:	4772                	lw	a4,28(sp)
8000b028:	c31c                	sw	a5,0(a4)
8000b02a:	4792                	lw	a5,4(sp)
8000b02c:	d3c1                	beqz	a5,8000afac <_strtod_l+0xee>
8000b02e:	800007b7          	lui	a5,0x80000
8000b032:	8c3d                	xor	s0,s0,a5
8000b034:	bfa5                	j	8000afac <_strtod_l+0xee>
8000b036:	5606                	lw	a2,96(sp)
8000b038:	ca09                	beqz	a2,8000b04a <_strtod_l+0x18c>
8000b03a:	03500593          	li	a1,53
8000b03e:	10a8                	addi	a0,sp,104
8000b040:	336d                	jal	8000adea <__copybits>
8000b042:	5586                	lw	a1,96(sp)
8000b044:	4502                	lw	a0,0(sp)
8000b046:	bccff0ef          	jal	8000a412 <_Bfree>
8000b04a:	197d                	addi	s2,s2,-1
8000b04c:	4791                	li	a5,4
8000b04e:	0127ed63          	bltu	a5,s2,8000b068 <_strtod_l+0x1aa>
8000b052:	8000e7b7          	lui	a5,0x8000e
8000b056:	dd078793          	addi	a5,a5,-560 # 8000ddd0 <__mprec_tens+0xc8>
8000b05a:	090a                	slli	s2,s2,0x2
8000b05c:	993e                	add	s2,s2,a5
8000b05e:	00092783          	lw	a5,0(s2)
8000b062:	8782                	jr	a5
8000b064:	54a6                	lw	s1,104(sp)
8000b066:	5436                	lw	s0,108(sp)
8000b068:	100a7a13          	andi	s4,s4,256
8000b06c:	000a0563          	beqz	s4,8000b076 <_strtod_l+0x1b8>
8000b070:	800007b7          	lui	a5,0x80000
8000b074:	8c5d                	or	s0,s0,a5
8000b076:	01445793          	srli	a5,s0,0x14
8000b07a:	7ff7f793          	andi	a5,a5,2047
8000b07e:	f3cd                	bnez	a5,8000b020 <_strtod_l+0x162>
8000b080:	b46fe0ef          	jal	800093c6 <__errno>
8000b084:	02200793          	li	a5,34
8000b088:	c11c                	sw	a5,0(a0)
8000b08a:	bf59                	j	8000b020 <_strtod_l+0x162>
8000b08c:	5436                	lw	s0,108(sp)
8000b08e:	fff007b7          	lui	a5,0xfff00
8000b092:	17fd                	addi	a5,a5,-1 # ffefffff <__fast_load_addr__+0x7fef1e3f>
8000b094:	8c7d                	and	s0,s0,a5
8000b096:	5796                	lw	a5,100(sp)
8000b098:	54a6                	lw	s1,104(sp)
8000b09a:	43378793          	addi	a5,a5,1075
8000b09e:	07d2                	slli	a5,a5,0x14
8000b0a0:	8c5d                	or	s0,s0,a5
8000b0a2:	b7d9                	j	8000b068 <_strtod_l+0x1aa>
8000b0a4:	7ff00437          	lui	s0,0x7ff00
8000b0a8:	b7c1                	j	8000b068 <_strtod_l+0x1aa>
8000b0aa:	80000437          	lui	s0,0x80000
8000b0ae:	147d                	addi	s0,s0,-1 # 7fffffff <__share_mem_end__+0x7ee7ffff>
8000b0b0:	54fd                	li	s1,-1
8000b0b2:	bf5d                	j	8000b068 <_strtod_l+0x1aa>
8000b0b4:	8ada                	mv	s5,s6
8000b0b6:	ceda                	sw	s6,92(sp)
8000b0b8:	000ac703          	lbu	a4,0(s5)
8000b0bc:	0b05                	addi	s6,s6,1
8000b0be:	fef70be3          	beq	a4,a5,8000b0b4 <_strtod_l+0x1f6>
8000b0c2:	df39                	beqz	a4,8000b020 <_strtod_l+0x162>
8000b0c4:	4b85                	li	s7,1
8000b0c6:	b5a1                	j	8000af0e <_strtod_l+0x50>
8000b0c8:	01964b63          	blt	a2,s9,8000b0de <_strtod_l+0x220>
8000b0cc:	02eb0b33          	mul	s6,s6,a4
8000b0d0:	fd0b0b13          	addi	s6,s6,-48
8000b0d4:	9b52                	add	s6,s6,s4
8000b0d6:	0505                	addi	a0,a0,1
8000b0d8:	0c85                	addi	s9,s9,1
8000b0da:	ceaa                	sw	a0,92(sp)
8000b0dc:	b581                	j	8000af1c <_strtod_l+0x5e>
8000b0de:	02ed8db3          	mul	s11,s11,a4
8000b0e2:	fd0d8d93          	addi	s11,s11,-48
8000b0e6:	9dd2                	add	s11,s11,s4
8000b0e8:	b7fd                	j	8000b0d6 <_strtod_l+0x218>
8000b0ea:	47f6                	lw	a5,92(sp)
8000b0ec:	00178713          	addi	a4,a5,1
8000b0f0:	ceba                	sw	a4,92(sp)
8000b0f2:	0017c783          	lbu	a5,1(a5)
8000b0f6:	4701                	li	a4,0
8000b0f8:	060c8b63          	beqz	s9,8000b16e <_strtod_l+0x2b0>
8000b0fc:	4c01                	li	s8,0
8000b0fe:	8d66                	mv	s10,s9
8000b100:	fd078693          	addi	a3,a5,-48
8000b104:	4625                	li	a2,9
8000b106:	02d67663          	bgeu	a2,a3,8000b132 <_strtod_l+0x274>
8000b10a:	4505                	li	a0,1
8000b10c:	bd35                	j	8000af48 <_strtod_l+0x8a>
8000b10e:	47f6                	lw	a5,92(sp)
8000b110:	0705                	addi	a4,a4,1
8000b112:	00178613          	addi	a2,a5,1
8000b116:	ceb2                	sw	a2,92(sp)
8000b118:	0017c783          	lbu	a5,1(a5)
8000b11c:	fed789e3          	beq	a5,a3,8000b10e <_strtod_l+0x250>
8000b120:	fcf78693          	addi	a3,a5,-49
8000b124:	4621                	li	a2,8
8000b126:	06d66e63          	bltu	a2,a3,8000b1a2 <_strtod_l+0x2e4>
8000b12a:	4af6                	lw	s5,92(sp)
8000b12c:	8c3a                	mv	s8,a4
8000b12e:	4d01                	li	s10,0
8000b130:	4701                	li	a4,0
8000b132:	fd078793          	addi	a5,a5,-48
8000b136:	00170693          	addi	a3,a4,1
8000b13a:	c395                	beqz	a5,8000b15e <_strtod_l+0x2a0>
8000b13c:	9c36                	add	s8,s8,a3
8000b13e:	976a                	add	a4,a4,s10
8000b140:	46a1                	li	a3,8
8000b142:	4541                	li	a0,16
8000b144:	4629                	li	a2,10
8000b146:	03a71763          	bne	a4,s10,8000b174 <_strtod_l+0x2b6>
8000b14a:	00170d13          	addi	s10,a4,1
8000b14e:	04e6c063          	blt	a3,a4,8000b18e <_strtod_l+0x2d0>
8000b152:	4729                	li	a4,10
8000b154:	02eb0733          	mul	a4,s6,a4
8000b158:	4681                	li	a3,0
8000b15a:	00e78b33          	add	s6,a5,a4
8000b15e:	47f6                	lw	a5,92(sp)
8000b160:	00178713          	addi	a4,a5,1
8000b164:	ceba                	sw	a4,92(sp)
8000b166:	0017c783          	lbu	a5,1(a5)
8000b16a:	8736                	mv	a4,a3
8000b16c:	bf51                	j	8000b100 <_strtod_l+0x242>
8000b16e:	03000693          	li	a3,48
8000b172:	b76d                	j	8000b11c <_strtod_l+0x25e>
8000b174:	001d0593          	addi	a1,s10,1
8000b178:	01a6c663          	blt	a3,s10,8000b184 <_strtod_l+0x2c6>
8000b17c:	02cb0b33          	mul	s6,s6,a2
8000b180:	8d2e                	mv	s10,a1
8000b182:	b7d1                	j	8000b146 <_strtod_l+0x288>
8000b184:	feb54ee3          	blt	a0,a1,8000b180 <_strtod_l+0x2c2>
8000b188:	02cd8db3          	mul	s11,s11,a2
8000b18c:	bfd5                	j	8000b180 <_strtod_l+0x2c2>
8000b18e:	463d                	li	a2,15
8000b190:	4681                	li	a3,0
8000b192:	fce646e3          	blt	a2,a4,8000b15e <_strtod_l+0x2a0>
8000b196:	4729                	li	a4,10
8000b198:	02ed8733          	mul	a4,s11,a4
8000b19c:	00e78db3          	add	s11,a5,a4
8000b1a0:	bf7d                	j	8000b15e <_strtod_l+0x2a0>
8000b1a2:	4c01                	li	s8,0
8000b1a4:	4d01                	li	s10,0
8000b1a6:	b795                	j	8000b10a <_strtod_l+0x24c>
8000b1a8:	4801                	li	a6,0
8000b1aa:	00290793          	addi	a5,s2,2
8000b1ae:	cebe                	sw	a5,92(sp)
8000b1b0:	00294783          	lbu	a5,2(s2)
8000b1b4:	fd078693          	addi	a3,a5,-48
8000b1b8:	4625                	li	a2,9
8000b1ba:	0ed66263          	bltu	a2,a3,8000b29e <_strtod_l+0x3e0>
8000b1be:	03000693          	li	a3,48
8000b1c2:	0cd78063          	beq	a5,a3,8000b282 <_strtod_l+0x3c4>
8000b1c6:	fcf78693          	addi	a3,a5,-49
8000b1ca:	4621                	li	a2,8
8000b1cc:	4a01                	li	s4,0
8000b1ce:	04d66363          	bltu	a2,a3,8000b214 <_strtod_l+0x356>
8000b1d2:	48f6                	lw	a7,92(sp)
8000b1d4:	fd078693          	addi	a3,a5,-48
8000b1d8:	4325                	li	t1,9
8000b1da:	00188613          	addi	a2,a7,1
8000b1de:	4e29                	li	t3,10
8000b1e0:	ceb2                	sw	a2,92(sp)
8000b1e2:	00064783          	lbu	a5,0(a2)
8000b1e6:	fd078593          	addi	a1,a5,-48
8000b1ea:	0ff5f593          	zext.b	a1,a1
8000b1ee:	0ab37163          	bgeu	t1,a1,8000b290 <_strtod_l+0x3d2>
8000b1f2:	6a15                	lui	s4,0x5
8000b1f4:	41160633          	sub	a2,a2,a7
8000b1f8:	e1fa0a13          	addi	s4,s4,-481 # 4e1f <HEAP_SIZE+0xe1f>
8000b1fc:	48a1                	li	a7,8
8000b1fe:	85d2                	mv	a1,s4
8000b200:	00c8c663          	blt	a7,a2,8000b20c <_strtod_l+0x34e>
8000b204:	8a36                	mv	s4,a3
8000b206:	00d5d363          	bge	a1,a3,8000b20c <_strtod_l+0x34e>
8000b20a:	8a2e                	mv	s4,a1
8000b20c:	00080463          	beqz	a6,8000b214 <_strtod_l+0x356>
8000b210:	41400a33          	neg	s4,s4
8000b214:	0c0d1f63          	bnez	s10,8000b2f2 <_strtod_l+0x434>
8000b218:	01776733          	or	a4,a4,s7
8000b21c:	e00712e3          	bnez	a4,8000b020 <_strtod_l+0x162>
8000b220:	d80512e3          	bnez	a0,8000afa4 <_strtod_l+0xe6>
8000b224:	06900713          	li	a4,105
8000b228:	08e78163          	beq	a5,a4,8000b2aa <_strtod_l+0x3ec>
8000b22c:	06f74c63          	blt	a4,a5,8000b2a4 <_strtod_l+0x3e6>
8000b230:	04900713          	li	a4,73
8000b234:	06e78b63          	beq	a5,a4,8000b2aa <_strtod_l+0x3ec>
8000b238:	04e00713          	li	a4,78
8000b23c:	d6e794e3          	bne	a5,a4,8000afa4 <_strtod_l+0xe6>
8000b240:	8000e5b7          	lui	a1,0x8000e
8000b244:	b7858593          	addi	a1,a1,-1160 # 8000db78 <s_wdgs+0x1a0>
8000b248:	08e8                	addi	a0,sp,92
8000b24a:	5f1010ef          	jal	8000d03a <__match>
8000b24e:	d4050be3          	beqz	a0,8000afa4 <_strtod_l+0xe6>
8000b252:	47f6                	lw	a5,92(sp)
8000b254:	0007c703          	lbu	a4,0(a5)
8000b258:	02800793          	li	a5,40
8000b25c:	08f71263          	bne	a4,a5,8000b2e0 <_strtod_l+0x422>
8000b260:	8000e5b7          	lui	a1,0x8000e
8000b264:	10b0                	addi	a2,sp,104
8000b266:	de458593          	addi	a1,a1,-540 # 8000dde4 <fpinan.0>
8000b26a:	08e8                	addi	a0,sp,92
8000b26c:	5fb010ef          	jal	8000d066 <__hexnan>
8000b270:	4795                	li	a5,5
8000b272:	06f51763          	bne	a0,a5,8000b2e0 <_strtod_l+0x422>
8000b276:	5436                	lw	s0,108(sp)
8000b278:	7ff007b7          	lui	a5,0x7ff00
8000b27c:	54a6                	lw	s1,104(sp)
8000b27e:	8c5d                	or	s0,s0,a5
8000b280:	b345                	j	8000b020 <_strtod_l+0x162>
8000b282:	47f6                	lw	a5,92(sp)
8000b284:	00178613          	addi	a2,a5,1 # 7ff00001 <__share_mem_end__+0x7ed80001>
8000b288:	ceb2                	sw	a2,92(sp)
8000b28a:	0017c783          	lbu	a5,1(a5)
8000b28e:	bf15                	j	8000b1c2 <_strtod_l+0x304>
8000b290:	03c686b3          	mul	a3,a3,t3
8000b294:	0605                	addi	a2,a2,1
8000b296:	96be                	add	a3,a3,a5
8000b298:	fd068693          	addi	a3,a3,-48
8000b29c:	b791                	j	8000b1e0 <_strtod_l+0x322>
8000b29e:	ceca                	sw	s2,92(sp)
8000b2a0:	4a01                	li	s4,0
8000b2a2:	bf8d                	j	8000b214 <_strtod_l+0x356>
8000b2a4:	06e00713          	li	a4,110
8000b2a8:	bf51                	j	8000b23c <_strtod_l+0x37e>
8000b2aa:	8000e5b7          	lui	a1,0x8000e
8000b2ae:	b6c58593          	addi	a1,a1,-1172 # 8000db6c <s_wdgs+0x194>
8000b2b2:	08e8                	addi	a0,sp,92
8000b2b4:	587010ef          	jal	8000d03a <__match>
8000b2b8:	ce0506e3          	beqz	a0,8000afa4 <_strtod_l+0xe6>
8000b2bc:	47f6                	lw	a5,92(sp)
8000b2be:	8000e5b7          	lui	a1,0x8000e
8000b2c2:	b7058593          	addi	a1,a1,-1168 # 8000db70 <s_wdgs+0x198>
8000b2c6:	17fd                	addi	a5,a5,-1
8000b2c8:	08e8                	addi	a0,sp,92
8000b2ca:	cebe                	sw	a5,92(sp)
8000b2cc:	56f010ef          	jal	8000d03a <__match>
8000b2d0:	e501                	bnez	a0,8000b2d8 <_strtod_l+0x41a>
8000b2d2:	47f6                	lw	a5,92(sp)
8000b2d4:	0785                	addi	a5,a5,1
8000b2d6:	cebe                	sw	a5,92(sp)
8000b2d8:	7ff00437          	lui	s0,0x7ff00
8000b2dc:	4481                	li	s1,0
8000b2de:	b389                	j	8000b020 <_strtod_l+0x162>
8000b2e0:	8000e537          	lui	a0,0x8000e
8000b2e4:	9f450513          	addi	a0,a0,-1548 # 8000d9f4 <s_wdgs+0x1c>
8000b2e8:	75a010ef          	jal	8000ca42 <nan>
8000b2ec:	84aa                	mv	s1,a0
8000b2ee:	842e                	mv	s0,a1
8000b2f0:	bb05                	j	8000b020 <_strtod_l+0x162>
8000b2f2:	418a0bb3          	sub	s7,s4,s8
8000b2f6:	000c9363          	bnez	s9,8000b2fc <_strtod_l+0x43e>
8000b2fa:	8cea                	mv	s9,s10
8000b2fc:	47c1                	li	a5,16
8000b2fe:	896a                	mv	s2,s10
8000b300:	01a7d363          	bge	a5,s10,8000b306 <_strtod_l+0x448>
8000b304:	893e                	mv	s2,a5
8000b306:	855a                	mv	a0,s6
8000b308:	9e9f90ef          	jal	80004cf0 <__floatunsidf>
8000b30c:	47a5                	li	a5,9
8000b30e:	03a7ca63          	blt	a5,s10,8000b342 <_strtod_l+0x484>
8000b312:	84aa                	mv	s1,a0
8000b314:	842e                	mv	s0,a1
8000b316:	d00b85e3          	beqz	s7,8000b020 <_strtod_l+0x162>
8000b31a:	11705f63          	blez	s7,8000b438 <_strtod_l+0x57a>
8000b31e:	47d9                	li	a5,22
8000b320:	0d77cd63          	blt	a5,s7,8000b3fa <_strtod_l+0x53c>
8000b324:	8000e7b7          	lui	a5,0x8000e
8000b328:	0b8e                	slli	s7,s7,0x3
8000b32a:	d0878793          	addi	a5,a5,-760 # 8000dd08 <__mprec_tens>
8000b32e:	9bbe                	add	s7,s7,a5
8000b330:	000ba503          	lw	a0,0(s7)
8000b334:	004ba583          	lw	a1,4(s7)
8000b338:	8626                	mv	a2,s1
8000b33a:	86a2                	mv	a3,s0
8000b33c:	f59f80ef          	jal	80004294 <__muldf3>
8000b340:	b775                	j	8000b2ec <_strtod_l+0x42e>
8000b342:	ff790793          	addi	a5,s2,-9
8000b346:	8000e737          	lui	a4,0x8000e
8000b34a:	d0870713          	addi	a4,a4,-760 # 8000dd08 <__mprec_tens>
8000b34e:	078e                	slli	a5,a5,0x3
8000b350:	97ba                	add	a5,a5,a4
8000b352:	4390                	lw	a2,0(a5)
8000b354:	43d4                	lw	a3,4(a5)
8000b356:	f3ff80ef          	jal	80004294 <__muldf3>
8000b35a:	842a                	mv	s0,a0
8000b35c:	856e                	mv	a0,s11
8000b35e:	84ae                	mv	s1,a1
8000b360:	991f90ef          	jal	80004cf0 <__floatunsidf>
8000b364:	862a                	mv	a2,a0
8000b366:	86ae                	mv	a3,a1
8000b368:	8522                	mv	a0,s0
8000b36a:	85a6                	mv	a1,s1
8000b36c:	c36f80ef          	jal	800037a2 <__adddf3>
8000b370:	47bd                	li	a5,15
8000b372:	84aa                	mv	s1,a0
8000b374:	842e                	mv	s0,a1
8000b376:	fba7d0e3          	bge	a5,s10,8000b316 <_strtod_l+0x458>
8000b37a:	412d0933          	sub	s2,s10,s2
8000b37e:	995e                	add	s2,s2,s7
8000b380:	3b205463          	blez	s2,8000b728 <_strtod_l+0x86a>
8000b384:	00f97793          	andi	a5,s2,15
8000b388:	ff097913          	andi	s2,s2,-16
8000b38c:	c38d                	beqz	a5,8000b3ae <_strtod_l+0x4f0>
8000b38e:	8000e737          	lui	a4,0x8000e
8000b392:	d0870713          	addi	a4,a4,-760 # 8000dd08 <__mprec_tens>
8000b396:	078e                	slli	a5,a5,0x3
8000b398:	97ba                	add	a5,a5,a4
8000b39a:	4388                	lw	a0,0(a5)
8000b39c:	43cc                	lw	a1,4(a5)
8000b39e:	8626                	mv	a2,s1
8000b3a0:	86a2                	mv	a3,s0
8000b3a2:	ef3f80ef          	jal	80004294 <__muldf3>
8000b3a6:	84aa                	mv	s1,a0
8000b3a8:	842e                	mv	s0,a1
8000b3aa:	10090963          	beqz	s2,8000b4bc <_strtod_l+0x5fe>
8000b3ae:	13400793          	li	a5,308
8000b3b2:	0b27da63          	bge	a5,s2,8000b466 <_strtod_l+0x5a8>
8000b3b6:	4b01                	li	s6,0
8000b3b8:	4a01                	li	s4,0
8000b3ba:	4981                	li	s3,0
8000b3bc:	4a81                	li	s5,0
8000b3be:	4702                	lw	a4,0(sp)
8000b3c0:	02200793          	li	a5,34
8000b3c4:	7ff00437          	lui	s0,0x7ff00
8000b3c8:	c31c                	sw	a5,0(a4)
8000b3ca:	4481                	li	s1,0
8000b3cc:	c4098ae3          	beqz	s3,8000b020 <_strtod_l+0x162>
8000b3d0:	5586                	lw	a1,96(sp)
8000b3d2:	4502                	lw	a0,0(sp)
8000b3d4:	83eff0ef          	jal	8000a412 <_Bfree>
8000b3d8:	4502                	lw	a0,0(sp)
8000b3da:	85d6                	mv	a1,s5
8000b3dc:	836ff0ef          	jal	8000a412 <_Bfree>
8000b3e0:	4502                	lw	a0,0(sp)
8000b3e2:	85d2                	mv	a1,s4
8000b3e4:	82eff0ef          	jal	8000a412 <_Bfree>
8000b3e8:	4502                	lw	a0,0(sp)
8000b3ea:	85ce                	mv	a1,s3
8000b3ec:	826ff0ef          	jal	8000a412 <_Bfree>
8000b3f0:	4502                	lw	a0,0(sp)
8000b3f2:	85da                	mv	a1,s6
8000b3f4:	81eff0ef          	jal	8000a412 <_Bfree>
8000b3f8:	b125                	j	8000b020 <_strtod_l+0x162>
8000b3fa:	02500793          	li	a5,37
8000b3fe:	41a787b3          	sub	a5,a5,s10
8000b402:	f777cce3          	blt	a5,s7,8000b37a <_strtod_l+0x4bc>
8000b406:	493d                	li	s2,15
8000b408:	41a90933          	sub	s2,s2,s10
8000b40c:	8000e9b7          	lui	s3,0x8000e
8000b410:	00391793          	slli	a5,s2,0x3
8000b414:	d0898993          	addi	s3,s3,-760 # 8000dd08 <__mprec_tens>
8000b418:	97ce                	add	a5,a5,s3
8000b41a:	4388                	lw	a0,0(a5)
8000b41c:	43cc                	lw	a1,4(a5)
8000b41e:	412b8933          	sub	s2,s7,s2
8000b422:	8626                	mv	a2,s1
8000b424:	86a2                	mv	a3,s0
8000b426:	090e                	slli	s2,s2,0x3
8000b428:	e6df80ef          	jal	80004294 <__muldf3>
8000b42c:	994e                	add	s2,s2,s3
8000b42e:	00092603          	lw	a2,0(s2)
8000b432:	00492683          	lw	a3,4(s2)
8000b436:	b719                	j	8000b33c <_strtod_l+0x47e>
8000b438:	57a9                	li	a5,-22
8000b43a:	f4fbc0e3          	blt	s7,a5,8000b37a <_strtod_l+0x4bc>
8000b43e:	414c0a33          	sub	s4,s8,s4
8000b442:	8000e7b7          	lui	a5,0x8000e
8000b446:	d0878793          	addi	a5,a5,-760 # 8000dd08 <__mprec_tens>
8000b44a:	0a0e                	slli	s4,s4,0x3
8000b44c:	9a3e                	add	s4,s4,a5
8000b44e:	000a2603          	lw	a2,0(s4)
8000b452:	004a2683          	lw	a3,4(s4)
8000b456:	8526                	mv	a0,s1
8000b458:	85a2                	mv	a1,s0
8000b45a:	903f80ef          	jal	80003d5c <__divdf3>
8000b45e:	b579                	j	8000b2ec <_strtod_l+0x42e>
8000b460:	4b01                	li	s6,0
8000b462:	4a01                	li	s4,0
8000b464:	bfa1                	j	8000b3bc <_strtod_l+0x4fe>
8000b466:	85a2                	mv	a1,s0
8000b468:	8000e437          	lui	s0,0x8000e
8000b46c:	ce040413          	addi	s0,s0,-800 # 8000dce0 <__mprec_bigtens>
8000b470:	8526                	mv	a0,s1
8000b472:	40495913          	srai	s2,s2,0x4
8000b476:	4481                	li	s1,0
8000b478:	8da2                	mv	s11,s0
8000b47a:	4985                	li	s3,1
8000b47c:	29391663          	bne	s2,s3,8000b708 <_strtod_l+0x84a>
8000b480:	048e                	slli	s1,s1,0x3
8000b482:	9da6                	add	s11,s11,s1
8000b484:	fcb007b7          	lui	a5,0xfcb00
8000b488:	00b786b3          	add	a3,a5,a1
8000b48c:	862a                	mv	a2,a0
8000b48e:	004da583          	lw	a1,4(s11)
8000b492:	000da503          	lw	a0,0(s11)
8000b496:	dfff80ef          	jal	80004294 <__muldf3>
8000b49a:	7ff007b7          	lui	a5,0x7ff00
8000b49e:	8fed                	and	a5,a5,a1
8000b4a0:	7ca00737          	lui	a4,0x7ca00
8000b4a4:	84aa                	mv	s1,a0
8000b4a6:	f0f768e3          	bltu	a4,a5,8000b3b6 <_strtod_l+0x4f8>
8000b4aa:	7c900737          	lui	a4,0x7c900
8000b4ae:	26f77963          	bgeu	a4,a5,8000b720 <_strtod_l+0x862>
8000b4b2:	7ff00437          	lui	s0,0x7ff00
8000b4b6:	147d                	addi	s0,s0,-1 # 7fefffff <__share_mem_end__+0x7ed7ffff>
8000b4b8:	54fd                	li	s1,-1
8000b4ba:	4901                	li	s2,0
8000b4bc:	4502                	lw	a0,0(sp)
8000b4be:	875a                	mv	a4,s6
8000b4c0:	86ea                	mv	a3,s10
8000b4c2:	8666                	mv	a2,s9
8000b4c4:	85d6                	mv	a1,s5
8000b4c6:	85cff0ef          	jal	8000a522 <__s2b>
8000b4ca:	89aa                	mv	s3,a0
8000b4cc:	d951                	beqz	a0,8000b460 <_strtod_l+0x5a2>
8000b4ce:	fffbc793          	not	a5,s7
8000b4d2:	87fd                	srai	a5,a5,0x1f
8000b4d4:	00fbf7b3          	and	a5,s7,a5
8000b4d8:	cc3e                	sw	a5,24(sp)
8000b4da:	012037b3          	snez	a5,s2
8000b4de:	d43e                	sw	a5,40(sp)
8000b4e0:	00193793          	seqz	a5,s2
8000b4e4:	d23e                	sw	a5,36(sp)
8000b4e6:	00c50793          	addi	a5,a0,12
8000b4ea:	d63e                	sw	a5,44(sp)
8000b4ec:	8000e7b7          	lui	a5,0x8000e
8000b4f0:	f947a803          	lw	a6,-108(a5) # 8000df94 <_ctype_+0x15c>
8000b4f4:	f907a783          	lw	a5,-112(a5)
8000b4f8:	414c0733          	sub	a4,s8,s4
8000b4fc:	da42                	sw	a6,52(sp)
8000b4fe:	d83e                	sw	a5,48(sp)
8000b500:	8000e7b7          	lui	a5,0x8000e
8000b504:	f8c7a803          	lw	a6,-116(a5) # 8000df8c <_ctype_+0x154>
8000b508:	f887a783          	lw	a5,-120(a5)
8000b50c:	c43a                	sw	a4,8(sp)
8000b50e:	46a2                	lw	a3,8(sp)
8000b510:	dc3e                	sw	a5,56(sp)
8000b512:	8000e7b7          	lui	a5,0x8000e
8000b516:	de42                	sw	a6,60(sp)
8000b518:	f9c7a803          	lw	a6,-100(a5) # 8000df9c <_ctype_+0x164>
8000b51c:	f987a783          	lw	a5,-104(a5)
8000b520:	41fbd713          	srai	a4,s7,0x1f
8000b524:	8f75                	and	a4,a4,a3
8000b526:	c43a                	sw	a4,8(sp)
8000b528:	4b01                	li	s6,0
8000b52a:	4a01                	li	s4,0
8000b52c:	c0be                	sw	a5,64(sp)
8000b52e:	c2c2                	sw	a6,68(sp)
8000b530:	0049a583          	lw	a1,4(s3)
8000b534:	4502                	lw	a0,0(sp)
8000b536:	e41fe0ef          	jal	8000a376 <_Balloc>
8000b53a:	8aaa                	mv	s5,a0
8000b53c:	e80501e3          	beqz	a0,8000b3be <_strtod_l+0x500>
8000b540:	0109a603          	lw	a2,16(s3)
8000b544:	55b2                	lw	a1,44(sp)
8000b546:	0531                	addi	a0,a0,12
8000b548:	0609                	addi	a2,a2,2
8000b54a:	060a                	slli	a2,a2,0x2
8000b54c:	865f90ef          	jal	80004db0 <memcpy>
8000b550:	4502                	lw	a0,0(sp)
8000b552:	10b8                	addi	a4,sp,104
8000b554:	10d4                	addi	a3,sp,100
8000b556:	8622                	mv	a2,s0
8000b558:	85a6                	mv	a1,s1
8000b55a:	c626                	sw	s1,12(sp)
8000b55c:	ca22                	sw	s0,20(sp)
8000b55e:	f46ff0ef          	jal	8000aca4 <__d2b>
8000b562:	d0aa                	sw	a0,96(sp)
8000b564:	e4050de3          	beqz	a0,8000b3be <_strtod_l+0x500>
8000b568:	4502                	lw	a0,0(sp)
8000b56a:	4585                	li	a1,1
8000b56c:	922ff0ef          	jal	8000a68e <__i2b>
8000b570:	8a2a                	mv	s4,a0
8000b572:	e40506e3          	beqz	a0,8000b3be <_strtod_l+0x500>
8000b576:	5796                	lw	a5,100(sp)
8000b578:	2807c563          	bltz	a5,8000b802 <_strtod_l+0x944>
8000b57c:	4722                	lw	a4,8(sp)
8000b57e:	4c62                	lw	s8,24(sp)
8000b580:	00e78db3          	add	s11,a5,a4
8000b584:	56a6                	lw	a3,104(sp)
8000b586:	412787b3          	sub	a5,a5,s2
8000b58a:	03600713          	li	a4,54
8000b58e:	97b6                	add	a5,a5,a3
8000b590:	8f15                	sub	a4,a4,a3
8000b592:	17fd                	addi	a5,a5,-1
8000b594:	c0200693          	li	a3,-1022
8000b598:	28d7d263          	bge	a5,a3,8000b81c <_strtod_l+0x95e>
8000b59c:	8e9d                	sub	a3,a3,a5
8000b59e:	be300613          	li	a2,-1053
8000b5a2:	8f15                	sub	a4,a4,a3
8000b5a4:	4d05                	li	s10,1
8000b5a6:	26c7c363          	blt	a5,a2,8000b80c <_strtod_l+0x94e>
8000b5aa:	00dd1d33          	sll	s10,s10,a3
8000b5ae:	c802                	sw	zero,16(sp)
8000b5b0:	9c3a                	add	s8,s8,a4
8000b5b2:	00ed8cb3          	add	s9,s11,a4
8000b5b6:	9c4a                	add	s8,s8,s2
8000b5b8:	87ee                	mv	a5,s11
8000b5ba:	01bcd363          	bge	s9,s11,8000b5c0 <_strtod_l+0x702>
8000b5be:	87e6                	mv	a5,s9
8000b5c0:	00fc5363          	bge	s8,a5,8000b5c6 <_strtod_l+0x708>
8000b5c4:	87e2                	mv	a5,s8
8000b5c6:	00f05863          	blez	a5,8000b5d6 <_strtod_l+0x718>
8000b5ca:	40fc8cb3          	sub	s9,s9,a5
8000b5ce:	40fc0c33          	sub	s8,s8,a5
8000b5d2:	40fd8db3          	sub	s11,s11,a5
8000b5d6:	47a2                	lw	a5,8(sp)
8000b5d8:	02f05963          	blez	a5,8000b60a <_strtod_l+0x74c>
8000b5dc:	4502                	lw	a0,0(sp)
8000b5de:	85d2                	mv	a1,s4
8000b5e0:	863e                	mv	a2,a5
8000b5e2:	a68ff0ef          	jal	8000a84a <__pow5mult>
8000b5e6:	8a2a                	mv	s4,a0
8000b5e8:	dc050be3          	beqz	a0,8000b3be <_strtod_l+0x500>
8000b5ec:	85aa                	mv	a1,a0
8000b5ee:	5606                	lw	a2,96(sp)
8000b5f0:	4502                	lw	a0,0(sp)
8000b5f2:	8d2ff0ef          	jal	8000a6c4 <__multiply>
8000b5f6:	87aa                	mv	a5,a0
8000b5f8:	dc0503e3          	beqz	a0,8000b3be <_strtod_l+0x500>
8000b5fc:	5586                	lw	a1,96(sp)
8000b5fe:	4502                	lw	a0,0(sp)
8000b600:	d03e                	sw	a5,32(sp)
8000b602:	e11fe0ef          	jal	8000a412 <_Bfree>
8000b606:	5782                	lw	a5,32(sp)
8000b608:	d0be                	sw	a5,96(sp)
8000b60a:	01905a63          	blez	s9,8000b61e <_strtod_l+0x760>
8000b60e:	5586                	lw	a1,96(sp)
8000b610:	4502                	lw	a0,0(sp)
8000b612:	8666                	mv	a2,s9
8000b614:	b0cff0ef          	jal	8000a920 <__lshift>
8000b618:	d0aa                	sw	a0,96(sp)
8000b61a:	da0502e3          	beqz	a0,8000b3be <_strtod_l+0x500>
8000b61e:	01705a63          	blez	s7,8000b632 <_strtod_l+0x774>
8000b622:	4662                	lw	a2,24(sp)
8000b624:	4502                	lw	a0,0(sp)
8000b626:	85d6                	mv	a1,s5
8000b628:	a22ff0ef          	jal	8000a84a <__pow5mult>
8000b62c:	8aaa                	mv	s5,a0
8000b62e:	d80508e3          	beqz	a0,8000b3be <_strtod_l+0x500>
8000b632:	01805a63          	blez	s8,8000b646 <_strtod_l+0x788>
8000b636:	4502                	lw	a0,0(sp)
8000b638:	85d6                	mv	a1,s5
8000b63a:	8662                	mv	a2,s8
8000b63c:	ae4ff0ef          	jal	8000a920 <__lshift>
8000b640:	8aaa                	mv	s5,a0
8000b642:	d6050ee3          	beqz	a0,8000b3be <_strtod_l+0x500>
8000b646:	01b05a63          	blez	s11,8000b65a <_strtod_l+0x79c>
8000b64a:	4502                	lw	a0,0(sp)
8000b64c:	85d2                	mv	a1,s4
8000b64e:	866e                	mv	a2,s11
8000b650:	ad0ff0ef          	jal	8000a920 <__lshift>
8000b654:	8a2a                	mv	s4,a0
8000b656:	d60504e3          	beqz	a0,8000b3be <_strtod_l+0x500>
8000b65a:	5586                	lw	a1,96(sp)
8000b65c:	4502                	lw	a0,0(sp)
8000b65e:	8656                	mv	a2,s5
8000b660:	beeff0ef          	jal	8000aa4e <__mdiff>
8000b664:	8b2a                	mv	s6,a0
8000b666:	d4050ce3          	beqz	a0,8000b3be <_strtod_l+0x500>
8000b66a:	00c52c03          	lw	s8,12(a0)
8000b66e:	85d2                	mv	a1,s4
8000b670:	00052623          	sw	zero,12(a0)
8000b674:	ba4ff0ef          	jal	8000aa18 <__mcmp>
8000b678:	1a055563          	bgez	a0,8000b822 <_strtod_l+0x964>
8000b67c:	009c67b3          	or	a5,s8,s1
8000b680:	1e079663          	bnez	a5,8000b86c <_strtod_l+0x9ae>
8000b684:	00c41793          	slli	a5,s0,0xc
8000b688:	1e079263          	bnez	a5,8000b86c <_strtod_l+0x9ae>
8000b68c:	7ff007b7          	lui	a5,0x7ff00
8000b690:	8fe1                	and	a5,a5,s0
8000b692:	06b00737          	lui	a4,0x6b00
8000b696:	1cf77b63          	bgeu	a4,a5,8000b86c <_strtod_l+0x9ae>
8000b69a:	014b2783          	lw	a5,20(s6)
8000b69e:	e791                	bnez	a5,8000b6aa <_strtod_l+0x7ec>
8000b6a0:	010b2703          	lw	a4,16(s6)
8000b6a4:	4785                	li	a5,1
8000b6a6:	1ce7d363          	bge	a5,a4,8000b86c <_strtod_l+0x9ae>
8000b6aa:	4502                	lw	a0,0(sp)
8000b6ac:	85da                	mv	a1,s6
8000b6ae:	4605                	li	a2,1
8000b6b0:	a70ff0ef          	jal	8000a920 <__lshift>
8000b6b4:	85d2                	mv	a1,s4
8000b6b6:	8b2a                	mv	s6,a0
8000b6b8:	b60ff0ef          	jal	8000aa18 <__mcmp>
8000b6bc:	1aa05863          	blez	a0,8000b86c <_strtod_l+0x9ae>
8000b6c0:	7ff007b7          	lui	a5,0x7ff00
8000b6c4:	8fe1                	and	a5,a5,s0
8000b6c6:	1e090863          	beqz	s2,8000b8b6 <_strtod_l+0x9f8>
8000b6ca:	06b00737          	lui	a4,0x6b00
8000b6ce:	1ef76463          	bltu	a4,a5,8000b8b6 <_strtod_l+0x9f8>
8000b6d2:	03700737          	lui	a4,0x3700
8000b6d6:	10f77063          	bgeu	a4,a5,8000b7d6 <_strtod_l+0x918>
8000b6da:	8000e7b7          	lui	a5,0x8000e
8000b6de:	fb87a603          	lw	a2,-72(a5) # 8000dfb8 <_ctype_+0x180>
8000b6e2:	fbc7a683          	lw	a3,-68(a5)
8000b6e6:	8526                	mv	a0,s1
8000b6e8:	85a2                	mv	a1,s0
8000b6ea:	babf80ef          	jal	80004294 <__muldf3>
8000b6ee:	0145d793          	srli	a5,a1,0x14
8000b6f2:	7ff7f793          	andi	a5,a5,2047
8000b6f6:	84aa                	mv	s1,a0
8000b6f8:	842e                	mv	s0,a1
8000b6fa:	cc079be3          	bnez	a5,8000b3d0 <_strtod_l+0x512>
8000b6fe:	4702                	lw	a4,0(sp)
8000b700:	02200793          	li	a5,34
8000b704:	c31c                	sw	a5,0(a4)
8000b706:	b1e9                	j	8000b3d0 <_strtod_l+0x512>
8000b708:	00197793          	andi	a5,s2,1
8000b70c:	c789                	beqz	a5,8000b716 <_strtod_l+0x858>
8000b70e:	4010                	lw	a2,0(s0)
8000b710:	4054                	lw	a3,4(s0)
8000b712:	b83f80ef          	jal	80004294 <__muldf3>
8000b716:	0485                	addi	s1,s1,1
8000b718:	40195913          	srai	s2,s2,0x1
8000b71c:	0421                	addi	s0,s0,8
8000b71e:	bbb9                	j	8000b47c <_strtod_l+0x5be>
8000b720:	03500437          	lui	s0,0x3500
8000b724:	942e                	add	s0,s0,a1
8000b726:	bb51                	j	8000b4ba <_strtod_l+0x5fc>
8000b728:	d8090ae3          	beqz	s2,8000b4bc <_strtod_l+0x5fe>
8000b72c:	41200933          	neg	s2,s2
8000b730:	00f97793          	andi	a5,s2,15
8000b734:	40495913          	srai	s2,s2,0x4
8000b738:	c38d                	beqz	a5,8000b75a <_strtod_l+0x89c>
8000b73a:	8000e737          	lui	a4,0x8000e
8000b73e:	d0870713          	addi	a4,a4,-760 # 8000dd08 <__mprec_tens>
8000b742:	078e                	slli	a5,a5,0x3
8000b744:	97ba                	add	a5,a5,a4
8000b746:	4390                	lw	a2,0(a5)
8000b748:	43d4                	lw	a3,4(a5)
8000b74a:	8526                	mv	a0,s1
8000b74c:	85a2                	mv	a1,s0
8000b74e:	e0ef80ef          	jal	80003d5c <__divdf3>
8000b752:	84aa                	mv	s1,a0
8000b754:	842e                	mv	s0,a1
8000b756:	d60903e3          	beqz	s2,8000b4bc <_strtod_l+0x5fe>
8000b75a:	47fd                	li	a5,31
8000b75c:	0727c963          	blt	a5,s2,8000b7ce <_strtod_l+0x910>
8000b760:	01097d93          	andi	s11,s2,16
8000b764:	000d8463          	beqz	s11,8000b76c <_strtod_l+0x8ae>
8000b768:	06a00d93          	li	s11,106
8000b76c:	85a2                	mv	a1,s0
8000b76e:	8000e437          	lui	s0,0x8000e
8000b772:	87a6                	mv	a5,s1
8000b774:	e1040413          	addi	s0,s0,-496 # 8000de10 <tinytens>
8000b778:	00197713          	andi	a4,s2,1
8000b77c:	c719                	beqz	a4,8000b78a <_strtod_l+0x8cc>
8000b77e:	4010                	lw	a2,0(s0)
8000b780:	4054                	lw	a3,4(s0)
8000b782:	853e                	mv	a0,a5
8000b784:	b11f80ef          	jal	80004294 <__muldf3>
8000b788:	87aa                	mv	a5,a0
8000b78a:	40195913          	srai	s2,s2,0x1
8000b78e:	0421                	addi	s0,s0,8
8000b790:	fe0914e3          	bnez	s2,8000b778 <_strtod_l+0x8ba>
8000b794:	84be                	mv	s1,a5
8000b796:	842e                	mv	s0,a1
8000b798:	020d8463          	beqz	s11,8000b7c0 <_strtod_l+0x902>
8000b79c:	81d1                	srli	a1,a1,0x14
8000b79e:	7ff5f593          	andi	a1,a1,2047
8000b7a2:	06b00793          	li	a5,107
8000b7a6:	8f8d                	sub	a5,a5,a1
8000b7a8:	00f05c63          	blez	a5,8000b7c0 <_strtod_l+0x902>
8000b7ac:	477d                	li	a4,31
8000b7ae:	04f75363          	bge	a4,a5,8000b7f4 <_strtod_l+0x936>
8000b7b2:	03400713          	li	a4,52
8000b7b6:	4481                	li	s1,0
8000b7b8:	02f75663          	bge	a4,a5,8000b7e4 <_strtod_l+0x926>
8000b7bc:	03700437          	lui	s0,0x3700
8000b7c0:	4601                	li	a2,0
8000b7c2:	4681                	li	a3,0
8000b7c4:	8526                	mv	a0,s1
8000b7c6:	85a2                	mv	a1,s0
8000b7c8:	e20f90ef          	jal	80004de8 <__eqdf2>
8000b7cc:	e90d                	bnez	a0,8000b7fe <_strtod_l+0x940>
8000b7ce:	4b01                	li	s6,0
8000b7d0:	4a01                	li	s4,0
8000b7d2:	4981                	li	s3,0
8000b7d4:	4a81                	li	s5,0
8000b7d6:	4702                	lw	a4,0(sp)
8000b7d8:	02200793          	li	a5,34
8000b7dc:	4481                	li	s1,0
8000b7de:	4401                	li	s0,0
8000b7e0:	c31c                	sw	a5,0(a4)
8000b7e2:	b6ed                	j	8000b3cc <_strtod_l+0x50e>
8000b7e4:	04b00713          	li	a4,75
8000b7e8:	8f0d                	sub	a4,a4,a1
8000b7ea:	57fd                	li	a5,-1
8000b7ec:	00e797b3          	sll	a5,a5,a4
8000b7f0:	8c7d                	and	s0,s0,a5
8000b7f2:	b7f9                	j	8000b7c0 <_strtod_l+0x902>
8000b7f4:	577d                	li	a4,-1
8000b7f6:	00f717b3          	sll	a5,a4,a5
8000b7fa:	8cfd                	and	s1,s1,a5
8000b7fc:	b7d1                	j	8000b7c0 <_strtod_l+0x902>
8000b7fe:	896e                	mv	s2,s11
8000b800:	b975                	j	8000b4bc <_strtod_l+0x5fe>
8000b802:	4762                	lw	a4,24(sp)
8000b804:	4da2                	lw	s11,8(sp)
8000b806:	40f70c33          	sub	s8,a4,a5
8000b80a:	bbad                	j	8000b584 <_strtod_l+0x6c6>
8000b80c:	be200c93          	li	s9,-1054
8000b810:	40fc8cb3          	sub	s9,s9,a5
8000b814:	019d17b3          	sll	a5,s10,s9
8000b818:	c83e                	sw	a5,16(sp)
8000b81a:	bb59                	j	8000b5b0 <_strtod_l+0x6f2>
8000b81c:	c802                	sw	zero,16(sp)
8000b81e:	4d05                	li	s10,1
8000b820:	bb41                	j	8000b5b0 <_strtod_l+0x6f2>
8000b822:	d022                	sw	s0,32(sp)
8000b824:	e579                	bnez	a0,8000b8f2 <_strtod_l+0xa34>
8000b826:	00c41793          	slli	a5,s0,0xc
8000b82a:	83b1                	srli	a5,a5,0xc
8000b82c:	040c0c63          	beqz	s8,8000b884 <_strtod_l+0x9c6>
8000b830:	00100737          	lui	a4,0x100
8000b834:	177d                	addi	a4,a4,-1 # fffff <_stack+0x77fff>
8000b836:	04e79a63          	bne	a5,a4,8000b88a <_strtod_l+0x9cc>
8000b83a:	02090c63          	beqz	s2,8000b872 <_strtod_l+0x9b4>
8000b83e:	7ff007b7          	lui	a5,0x7ff00
8000b842:	8fe1                	and	a5,a5,s0
8000b844:	06a00737          	lui	a4,0x6a00
8000b848:	02f76563          	bltu	a4,a5,8000b872 <_strtod_l+0x9b4>
8000b84c:	83d1                	srli	a5,a5,0x14
8000b84e:	06b00713          	li	a4,107
8000b852:	8f1d                	sub	a4,a4,a5
8000b854:	57fd                	li	a5,-1
8000b856:	00e797b3          	sll	a5,a5,a4
8000b85a:	02f49863          	bne	s1,a5,8000b88a <_strtod_l+0x9cc>
8000b85e:	7ff007b7          	lui	a5,0x7ff00
8000b862:	8fe1                	and	a5,a5,s0
8000b864:	00100437          	lui	s0,0x100
8000b868:	943e                	add	s0,s0,a5
8000b86a:	4481                	li	s1,0
8000b86c:	e60917e3          	bnez	s2,8000b6da <_strtod_l+0x81c>
8000b870:	b685                	j	8000b3d0 <_strtod_l+0x512>
8000b872:	57fd                	li	a5,-1
8000b874:	00f49b63          	bne	s1,a5,8000b88a <_strtod_l+0x9cc>
8000b878:	7ff007b7          	lui	a5,0x7ff00
8000b87c:	97a6                	add	a5,a5,s1
8000b87e:	fef410e3          	bne	s0,a5,8000b85e <_strtod_l+0x9a0>
8000b882:	be35                	j	8000b3be <_strtod_l+0x500>
8000b884:	8fc5                	or	a5,a5,s1
8000b886:	e2078de3          	beqz	a5,8000b6c0 <_strtod_l+0x802>
8000b88a:	47c2                	lw	a5,16(sp)
8000b88c:	cf95                	beqz	a5,8000b8c8 <_strtod_l+0xa0a>
8000b88e:	0087fcb3          	and	s9,a5,s0
8000b892:	fc0c8de3          	beqz	s9,8000b86c <_strtod_l+0x9ae>
8000b896:	864a                	mv	a2,s2
8000b898:	8526                	mv	a0,s1
8000b89a:	85a2                	mv	a1,s0
8000b89c:	020c0b63          	beqz	s8,8000b8d2 <_strtod_l+0xa14>
8000b8a0:	ddaff0ef          	jal	8000ae7a <sulp>
8000b8a4:	862a                	mv	a2,a0
8000b8a6:	86ae                	mv	a3,a1
8000b8a8:	4532                	lw	a0,12(sp)
8000b8aa:	45d2                	lw	a1,20(sp)
8000b8ac:	ef7f70ef          	jal	800037a2 <__adddf3>
8000b8b0:	84aa                	mv	s1,a0
8000b8b2:	842e                	mv	s0,a1
8000b8b4:	bf65                	j	8000b86c <_strtod_l+0x9ae>
8000b8b6:	fff00737          	lui	a4,0xfff00
8000b8ba:	00100437          	lui	s0,0x100
8000b8be:	97ba                	add	a5,a5,a4
8000b8c0:	147d                	addi	s0,s0,-1 # fffff <_stack+0x77fff>
8000b8c2:	8c5d                	or	s0,s0,a5
8000b8c4:	54fd                	li	s1,-1
8000b8c6:	b75d                	j	8000b86c <_strtod_l+0x9ae>
8000b8c8:	009d7d33          	and	s10,s10,s1
8000b8cc:	fa0d00e3          	beqz	s10,8000b86c <_strtod_l+0x9ae>
8000b8d0:	b7d9                	j	8000b896 <_strtod_l+0x9d8>
8000b8d2:	da8ff0ef          	jal	8000ae7a <sulp>
8000b8d6:	862a                	mv	a2,a0
8000b8d8:	86ae                	mv	a3,a1
8000b8da:	4532                	lw	a0,12(sp)
8000b8dc:	45d2                	lw	a1,20(sp)
8000b8de:	e01f80ef          	jal	800046de <__subdf3>
8000b8e2:	4601                	li	a2,0
8000b8e4:	4681                	li	a3,0
8000b8e6:	84aa                	mv	s1,a0
8000b8e8:	842e                	mv	s0,a1
8000b8ea:	cfef90ef          	jal	80004de8 <__eqdf2>
8000b8ee:	fd3d                	bnez	a0,8000b86c <_strtod_l+0x9ae>
8000b8f0:	b5dd                	j	8000b7d6 <_strtod_l+0x918>
8000b8f2:	85d2                	mv	a1,s4
8000b8f4:	855a                	mv	a0,s6
8000b8f6:	c8aff0ef          	jal	8000ad80 <__ratio>
8000b8fa:	5642                	lw	a2,48(sp)
8000b8fc:	56d2                	lw	a3,52(sp)
8000b8fe:	8caa                	mv	s9,a0
8000b900:	8d2e                	mv	s10,a1
8000b902:	df6f90ef          	jal	80004ef8 <__ledf2>
8000b906:	0ea04b63          	bgtz	a0,8000b9fc <_strtod_l+0xb3e>
8000b90a:	100c1a63          	bnez	s8,8000ba1e <_strtod_l+0xb60>
8000b90e:	e0c5                	bnez	s1,8000b9ae <_strtod_l+0xaf0>
8000b910:	00c41793          	slli	a5,s0,0xc
8000b914:	c3d5                	beqz	a5,8000b9b8 <_strtod_l+0xafa>
8000b916:	4681                	li	a3,0
8000b918:	bff00d37          	lui	s10,0xbff00
8000b91c:	4701                	li	a4,0
8000b91e:	3ff00db7          	lui	s11,0x3ff00
8000b922:	7ff008b7          	lui	a7,0x7ff00
8000b926:	01147cb3          	and	s9,s0,a7
8000b92a:	7fe00637          	lui	a2,0x7fe00
8000b92e:	8336                	mv	t1,a3
8000b930:	886a                	mv	a6,s10
8000b932:	16cc9163          	bne	s9,a2,8000ba94 <_strtod_l+0xbd6>
8000b936:	fcb00837          	lui	a6,0xfcb00
8000b93a:	9822                	add	a6,a6,s0
8000b93c:	85c2                	mv	a1,a6
8000b93e:	8526                	mv	a0,s1
8000b940:	c4ba                	sw	a4,72(sp)
8000b942:	c842                	sw	a6,16(sp)
8000b944:	c6b6                	sw	a3,76(sp)
8000b946:	ca26                	sw	s1,20(sp)
8000b948:	a64ff0ef          	jal	8000abac <__ulp>
8000b94c:	4636                	lw	a2,76(sp)
8000b94e:	86ea                	mv	a3,s10
8000b950:	945f80ef          	jal	80004294 <__muldf3>
8000b954:	46c2                	lw	a3,16(sp)
8000b956:	4652                	lw	a2,20(sp)
8000b958:	e4bf70ef          	jal	800037a2 <__adddf3>
8000b95c:	7ff008b7          	lui	a7,0x7ff00
8000b960:	00b8f8b3          	and	a7,a7,a1
8000b964:	7ca006b7          	lui	a3,0x7ca00
8000b968:	4726                	lw	a4,72(sp)
8000b96a:	84aa                	mv	s1,a0
8000b96c:	0ad8ed63          	bltu	a7,a3,8000ba26 <_strtod_l+0xb68>
8000b970:	5702                	lw	a4,32(sp)
8000b972:	7ff007b7          	lui	a5,0x7ff00
8000b976:	17fd                	addi	a5,a5,-1 # 7fefffff <__share_mem_end__+0x7ed7ffff>
8000b978:	00f71663          	bne	a4,a5,8000b984 <_strtod_l+0xac6>
8000b97c:	4732                	lw	a4,12(sp)
8000b97e:	57fd                	li	a5,-1
8000b980:	a2e78fe3          	beq	a5,a4,8000b3be <_strtod_l+0x500>
8000b984:	7ff00437          	lui	s0,0x7ff00
8000b988:	147d                	addi	s0,s0,-1 # 7fefffff <__share_mem_end__+0x7ed7ffff>
8000b98a:	54fd                	li	s1,-1
8000b98c:	5586                	lw	a1,96(sp)
8000b98e:	4502                	lw	a0,0(sp)
8000b990:	a83fe0ef          	jal	8000a412 <_Bfree>
8000b994:	4502                	lw	a0,0(sp)
8000b996:	85d6                	mv	a1,s5
8000b998:	a7bfe0ef          	jal	8000a412 <_Bfree>
8000b99c:	4502                	lw	a0,0(sp)
8000b99e:	85d2                	mv	a1,s4
8000b9a0:	a73fe0ef          	jal	8000a412 <_Bfree>
8000b9a4:	4502                	lw	a0,0(sp)
8000b9a6:	85da                	mv	a1,s6
8000b9a8:	a6bfe0ef          	jal	8000a412 <_Bfree>
8000b9ac:	b651                	j	8000b530 <_strtod_l+0x672>
8000b9ae:	4785                	li	a5,1
8000b9b0:	f6f493e3          	bne	s1,a5,8000b916 <_strtod_l+0xa58>
8000b9b4:	f02d                	bnez	s0,8000b916 <_strtod_l+0xa58>
8000b9b6:	b505                	j	8000b7d6 <_strtod_l+0x918>
8000b9b8:	8000e7b7          	lui	a5,0x8000e
8000b9bc:	f687a603          	lw	a2,-152(a5) # 8000df68 <_ctype_+0x130>
8000b9c0:	f6c7a683          	lw	a3,-148(a5)
8000b9c4:	8566                	mv	a0,s9
8000b9c6:	85ea                	mv	a1,s10
8000b9c8:	d30f90ef          	jal	80004ef8 <__ledf2>
8000b9cc:	02054463          	bltz	a0,8000b9f4 <_strtod_l+0xb36>
8000b9d0:	8000e7b7          	lui	a5,0x8000e
8000b9d4:	f887a603          	lw	a2,-120(a5) # 8000df88 <_ctype_+0x150>
8000b9d8:	f8c7a683          	lw	a3,-116(a5)
8000b9dc:	8566                	mv	a0,s9
8000b9de:	85ea                	mv	a1,s10
8000b9e0:	8b5f80ef          	jal	80004294 <__muldf3>
8000b9e4:	872a                	mv	a4,a0
8000b9e6:	8dae                	mv	s11,a1
8000b9e8:	80000d37          	lui	s10,0x80000
8000b9ec:	86ba                	mv	a3,a4
8000b9ee:	01adcd33          	xor	s10,s11,s10
8000b9f2:	bf05                	j	8000b922 <_strtod_l+0xa64>
8000b9f4:	4701                	li	a4,0
8000b9f6:	3fe00db7          	lui	s11,0x3fe00
8000b9fa:	b7fd                	j	8000b9e8 <_strtod_l+0xb2a>
8000b9fc:	56f2                	lw	a3,60(sp)
8000b9fe:	5662                	lw	a2,56(sp)
8000ba00:	85ea                	mv	a1,s10
8000ba02:	8566                	mv	a0,s9
8000ba04:	891f80ef          	jal	80004294 <__muldf3>
8000ba08:	86aa                	mv	a3,a0
8000ba0a:	872a                	mv	a4,a0
8000ba0c:	8dae                	mv	s11,a1
8000ba0e:	8d2e                	mv	s10,a1
8000ba10:	f00c19e3          	bnez	s8,8000b922 <_strtod_l+0xa64>
8000ba14:	80000637          	lui	a2,0x80000
8000ba18:	00b64d33          	xor	s10,a2,a1
8000ba1c:	b719                	j	8000b922 <_strtod_l+0xa64>
8000ba1e:	4681                	li	a3,0
8000ba20:	3ff00d37          	lui	s10,0x3ff00
8000ba24:	bde5                	j	8000b91c <_strtod_l+0xa5e>
8000ba26:	03500437          	lui	s0,0x3500
8000ba2a:	942e                	add	s0,s0,a1
8000ba2c:	7ff006b7          	lui	a3,0x7ff00
8000ba30:	8ee1                	and	a3,a3,s0
8000ba32:	f5969de3          	bne	a3,s9,8000b98c <_strtod_l+0xace>
8000ba36:	5792                	lw	a5,36(sp)
8000ba38:	dbb1                	beqz	a5,8000b98c <_strtod_l+0xace>
8000ba3a:	853a                	mv	a0,a4
8000ba3c:	85ee                	mv	a1,s11
8000ba3e:	8d3a                	mv	s10,a4
8000ba40:	e62f90ef          	jal	800050a2 <__fixdfdi>
8000ba44:	ef6f90ef          	jal	8000513a <__floatdidf>
8000ba48:	862a                	mv	a2,a0
8000ba4a:	86ae                	mv	a3,a1
8000ba4c:	856a                	mv	a0,s10
8000ba4e:	85ee                	mv	a1,s11
8000ba50:	c8ff80ef          	jal	800046de <__subdf3>
8000ba54:	00c41793          	slli	a5,s0,0xc
8000ba58:	83b1                	srli	a5,a5,0xc
8000ba5a:	8fc5                	or	a5,a5,s1
8000ba5c:	0187e7b3          	or	a5,a5,s8
8000ba60:	8caa                	mv	s9,a0
8000ba62:	8d2e                	mv	s10,a1
8000ba64:	cbcd                	beqz	a5,8000bb16 <_strtod_l+0xc58>
8000ba66:	8000e7b7          	lui	a5,0x8000e
8000ba6a:	fa07a603          	lw	a2,-96(a5) # 8000dfa0 <_ctype_+0x168>
8000ba6e:	fa47a683          	lw	a3,-92(a5)
8000ba72:	c86f90ef          	jal	80004ef8 <__ledf2>
8000ba76:	94054de3          	bltz	a0,8000b3d0 <_strtod_l+0x512>
8000ba7a:	8000e7b7          	lui	a5,0x8000e
8000ba7e:	fa87a603          	lw	a2,-88(a5) # 8000dfa8 <_ctype_+0x170>
8000ba82:	fac7a683          	lw	a3,-84(a5)
8000ba86:	8566                	mv	a0,s9
8000ba88:	85ea                	mv	a1,s10
8000ba8a:	bbcf90ef          	jal	80004e46 <__gedf2>
8000ba8e:	eea05fe3          	blez	a0,8000b98c <_strtod_l+0xace>
8000ba92:	ba3d                	j	8000b3d0 <_strtod_l+0x512>
8000ba94:	06a006b7          	lui	a3,0x6a00
8000ba98:	0685                	addi	a3,a3,1 # 6a00001 <__share_mem_end__+0x5880001>
8000ba9a:	04dcf963          	bgeu	s9,a3,8000baec <_strtod_l+0xc2e>
8000ba9e:	57a2                	lw	a5,40(sp)
8000baa0:	c7b1                	beqz	a5,8000baec <_strtod_l+0xc2e>
8000baa2:	4606                	lw	a2,64(sp)
8000baa4:	4696                	lw	a3,68(sp)
8000baa6:	853a                	mv	a0,a4
8000baa8:	85ee                	mv	a1,s11
8000baaa:	d01a                	sw	t1,32(sp)
8000baac:	c83a                	sw	a4,16(sp)
8000baae:	c4ea                	sw	s10,72(sp)
8000bab0:	c48f90ef          	jal	80004ef8 <__ledf2>
8000bab4:	4742                	lw	a4,16(sp)
8000bab6:	5302                	lw	t1,32(sp)
8000bab8:	4826                	lw	a6,72(sp)
8000baba:	02a04463          	bgtz	a0,8000bae2 <_strtod_l+0xc24>
8000babe:	853a                	mv	a0,a4
8000bac0:	85ee                	mv	a1,s11
8000bac2:	9d0f90ef          	jal	80004c92 <__fixunsdfsi>
8000bac6:	e111                	bnez	a0,8000baca <_strtod_l+0xc0c>
8000bac8:	4505                	li	a0,1
8000baca:	a26f90ef          	jal	80004cf0 <__floatunsidf>
8000bace:	872a                	mv	a4,a0
8000bad0:	8dae                	mv	s11,a1
8000bad2:	882e                	mv	a6,a1
8000bad4:	000c1663          	bnez	s8,8000bae0 <_strtod_l+0xc22>
8000bad8:	800006b7          	lui	a3,0x80000
8000badc:	00b6c833          	xor	a6,a3,a1
8000bae0:	832a                	mv	t1,a0
8000bae2:	06b006b7          	lui	a3,0x6b00
8000bae6:	96c2                	add	a3,a3,a6
8000bae8:	41968833          	sub	a6,a3,s9
8000baec:	4532                	lw	a0,12(sp)
8000baee:	45d2                	lw	a1,20(sp)
8000baf0:	849a                	mv	s1,t1
8000baf2:	8442                	mv	s0,a6
8000baf4:	c83a                	sw	a4,16(sp)
8000baf6:	8b6ff0ef          	jal	8000abac <__ulp>
8000bafa:	862a                	mv	a2,a0
8000bafc:	86ae                	mv	a3,a1
8000bafe:	8526                	mv	a0,s1
8000bb00:	85a2                	mv	a1,s0
8000bb02:	f92f80ef          	jal	80004294 <__muldf3>
8000bb06:	4632                	lw	a2,12(sp)
8000bb08:	46d2                	lw	a3,20(sp)
8000bb0a:	c99f70ef          	jal	800037a2 <__adddf3>
8000bb0e:	4742                	lw	a4,16(sp)
8000bb10:	84aa                	mv	s1,a0
8000bb12:	842e                	mv	s0,a1
8000bb14:	bf21                	j	8000ba2c <_strtod_l+0xb6e>
8000bb16:	8000e7b7          	lui	a5,0x8000e
8000bb1a:	fb07a603          	lw	a2,-80(a5) # 8000dfb0 <_ctype_+0x178>
8000bb1e:	fb47a683          	lw	a3,-76(a5)
8000bb22:	bd6f90ef          	jal	80004ef8 <__ledf2>
8000bb26:	e60553e3          	bgez	a0,8000b98c <_strtod_l+0xace>
8000bb2a:	8a7ff06f          	j	8000b3d0 <_strtod_l+0x512>

8000bb2e <_strtod_r>:
8000bb2e:	010806b7          	lui	a3,0x1080
8000bb32:	05868693          	addi	a3,a3,88 # 1080058 <__global_locale>
8000bb36:	b88ff06f          	j	8000aebe <_strtod_l>

8000bb3a <_strtol_l.isra.0>:
8000bb3a:	0256b793          	sltiu	a5,a3,37
8000bb3e:	c3bd                	beqz	a5,8000bba4 <_strtol_l.isra.0+0x6a>
8000bb40:	fff68713          	addi	a4,a3,-1
8000bb44:	87ae                	mv	a5,a1
8000bb46:	cf39                	beqz	a4,8000bba4 <_strtol_l.isra.0+0x6a>
8000bb48:	8000e8b7          	lui	a7,0x8000e
8000bb4c:	e3988893          	addi	a7,a7,-455 # 8000de39 <_ctype_+0x1>
8000bb50:	833e                	mv	t1,a5
8000bb52:	0007c703          	lbu	a4,0(a5)
8000bb56:	0785                	addi	a5,a5,1
8000bb58:	01170833          	add	a6,a4,a7
8000bb5c:	00084803          	lbu	a6,0(a6) # fcb00000 <__fast_load_addr__+0x7caf1e40>
8000bb60:	00887813          	andi	a6,a6,8
8000bb64:	fe0816e3          	bnez	a6,8000bb50 <_strtol_l.isra.0+0x16>
8000bb68:	02d00813          	li	a6,45
8000bb6c:	05071663          	bne	a4,a6,8000bbb8 <_strtol_l.isra.0+0x7e>
8000bb70:	0007c703          	lbu	a4,0(a5)
8000bb74:	4f85                	li	t6,1
8000bb76:	00230793          	addi	a5,t1,2
8000bb7a:	fef6f813          	andi	a6,a3,-17
8000bb7e:	04081e63          	bnez	a6,8000bbda <_strtol_l.isra.0+0xa0>
8000bb82:	03000813          	li	a6,48
8000bb86:	05071363          	bne	a4,a6,8000bbcc <_strtol_l.isra.0+0x92>
8000bb8a:	0007c803          	lbu	a6,0(a5)
8000bb8e:	05800893          	li	a7,88
8000bb92:	0df87813          	andi	a6,a6,223
8000bb96:	03181b63          	bne	a6,a7,8000bbcc <_strtol_l.isra.0+0x92>
8000bb9a:	0017c703          	lbu	a4,1(a5)
8000bb9e:	0789                	addi	a5,a5,2
8000bba0:	46c1                	li	a3,16
8000bba2:	a825                	j	8000bbda <_strtol_l.isra.0+0xa0>
8000bba4:	1141                	addi	sp,sp,-16
8000bba6:	c606                	sw	ra,12(sp)
8000bba8:	81ffd0ef          	jal	800093c6 <__errno>
8000bbac:	40b2                	lw	ra,12(sp)
8000bbae:	47d9                	li	a5,22
8000bbb0:	c11c                	sw	a5,0(a0)
8000bbb2:	4501                	li	a0,0
8000bbb4:	0141                	addi	sp,sp,16
8000bbb6:	8082                	ret
8000bbb8:	02b00813          	li	a6,43
8000bbbc:	4f81                	li	t6,0
8000bbbe:	fb071ee3          	bne	a4,a6,8000bb7a <_strtol_l.isra.0+0x40>
8000bbc2:	0007c703          	lbu	a4,0(a5)
8000bbc6:	00230793          	addi	a5,t1,2
8000bbca:	bf45                	j	8000bb7a <_strtol_l.isra.0+0x40>
8000bbcc:	faf1                	bnez	a3,8000bba0 <_strtol_l.isra.0+0x66>
8000bbce:	03000813          	li	a6,48
8000bbd2:	46a9                	li	a3,10
8000bbd4:	01071363          	bne	a4,a6,8000bbda <_strtol_l.isra.0+0xa0>
8000bbd8:	46a1                	li	a3,8
8000bbda:	80000e37          	lui	t3,0x80000
8000bbde:	1e7d                	addi	t3,t3,-1 # 7fffffff <__share_mem_end__+0x7ee7ffff>
8000bbe0:	9e7e                	add	t3,t3,t6
8000bbe2:	02de72b3          	remu	t0,t3,a3
8000bbe6:	4301                	li	t1,0
8000bbe8:	4801                	li	a6,0
8000bbea:	43a5                	li	t2,9
8000bbec:	4f65                	li	t5,25
8000bbee:	02de5eb3          	divu	t4,t3,a3
8000bbf2:	fd070893          	addi	a7,a4,-48 # ffefffd0 <__fast_load_addr__+0x7fef1e10>
8000bbf6:	0113ef63          	bltu	t2,a7,8000bc14 <_strtol_l.isra.0+0xda>
8000bbfa:	8746                	mv	a4,a7
8000bbfc:	04d75363          	bge	a4,a3,8000bc42 <_strtol_l.isra.0+0x108>
8000bc00:	010ee563          	bltu	t4,a6,8000bc0a <_strtol_l.isra.0+0xd0>
8000bc04:	0305                	addi	t1,t1,1
8000bc06:	02031563          	bnez	t1,8000bc30 <_strtol_l.isra.0+0xf6>
8000bc0a:	537d                	li	t1,-1
8000bc0c:	0785                	addi	a5,a5,1
8000bc0e:	fff7c703          	lbu	a4,-1(a5)
8000bc12:	b7c5                	j	8000bbf2 <_strtol_l.isra.0+0xb8>
8000bc14:	fbf70893          	addi	a7,a4,-65
8000bc18:	011f6563          	bltu	t5,a7,8000bc22 <_strtol_l.isra.0+0xe8>
8000bc1c:	fc970713          	addi	a4,a4,-55
8000bc20:	bff1                	j	8000bbfc <_strtol_l.isra.0+0xc2>
8000bc22:	f9f70893          	addi	a7,a4,-97
8000bc26:	011f6e63          	bltu	t5,a7,8000bc42 <_strtol_l.isra.0+0x108>
8000bc2a:	fa970713          	addi	a4,a4,-87
8000bc2e:	b7f9                	j	8000bbfc <_strtol_l.isra.0+0xc2>
8000bc30:	00e2d463          	bge	t0,a4,8000bc38 <_strtol_l.isra.0+0xfe>
8000bc34:	fd0e8be3          	beq	t4,a6,8000bc0a <_strtol_l.isra.0+0xd0>
8000bc38:	03068833          	mul	a6,a3,a6
8000bc3c:	4305                	li	t1,1
8000bc3e:	983a                	add	a6,a6,a4
8000bc40:	b7f1                	j	8000bc0c <_strtol_l.isra.0+0xd2>
8000bc42:	577d                	li	a4,-1
8000bc44:	00e31963          	bne	t1,a4,8000bc56 <_strtol_l.isra.0+0x11c>
8000bc48:	02200713          	li	a4,34
8000bc4c:	c118                	sw	a4,0(a0)
8000bc4e:	8872                	mv	a6,t3
8000bc50:	ea11                	bnez	a2,8000bc64 <_strtol_l.isra.0+0x12a>
8000bc52:	8542                	mv	a0,a6
8000bc54:	8082                	ret
8000bc56:	000f8463          	beqz	t6,8000bc5e <_strtol_l.isra.0+0x124>
8000bc5a:	41000833          	neg	a6,a6
8000bc5e:	da75                	beqz	a2,8000bc52 <_strtol_l.isra.0+0x118>
8000bc60:	00030463          	beqz	t1,8000bc68 <_strtol_l.isra.0+0x12e>
8000bc64:	fff78593          	addi	a1,a5,-1
8000bc68:	c20c                	sw	a1,0(a2)
8000bc6a:	b7e5                	j	8000bc52 <_strtol_l.isra.0+0x118>

8000bc6c <_strtol_r>:
8000bc6c:	b5f9                	j	8000bb3a <_strtol_l.isra.0>

8000bc6e <__ssputs_r>:
8000bc6e:	1101                	addi	sp,sp,-32
8000bc70:	c84a                	sw	s2,16(sp)
8000bc72:	0085a903          	lw	s2,8(a1)
8000bc76:	cc22                	sw	s0,24(sp)
8000bc78:	c64e                	sw	s3,12(sp)
8000bc7a:	c05a                	sw	s6,0(sp)
8000bc7c:	ce06                	sw	ra,28(sp)
8000bc7e:	ca26                	sw	s1,20(sp)
8000bc80:	c452                	sw	s4,8(sp)
8000bc82:	c256                	sw	s5,4(sp)
8000bc84:	842e                	mv	s0,a1
8000bc86:	8b32                	mv	s6,a2
8000bc88:	89b6                	mv	s3,a3
8000bc8a:	0d26e863          	bltu	a3,s2,8000bd5a <__ssputs_r+0xec>
8000bc8e:	00c59783          	lh	a5,12(a1)
8000bc92:	4807f713          	andi	a4,a5,1152
8000bc96:	c361                	beqz	a4,8000bd56 <__ssputs_r+0xe8>
8000bc98:	4844                	lw	s1,20(s0)
8000bc9a:	470d                	li	a4,3
8000bc9c:	498c                	lw	a1,16(a1)
8000bc9e:	02e484b3          	mul	s1,s1,a4
8000bca2:	4709                	li	a4,2
8000bca4:	00042a03          	lw	s4,0(s0) # 3500000 <__share_mem_end__+0x2380000>
8000bca8:	8aaa                	mv	s5,a0
8000bcaa:	40ba0a33          	sub	s4,s4,a1
8000bcae:	02e4c4b3          	div	s1,s1,a4
8000bcb2:	00168713          	addi	a4,a3,1
8000bcb6:	9752                	add	a4,a4,s4
8000bcb8:	8626                	mv	a2,s1
8000bcba:	00e4f463          	bgeu	s1,a4,8000bcc2 <__ssputs_r+0x54>
8000bcbe:	84ba                	mv	s1,a4
8000bcc0:	863a                	mv	a2,a4
8000bcc2:	4007f793          	andi	a5,a5,1024
8000bcc6:	c7a5                	beqz	a5,8000bd2e <__ssputs_r+0xc0>
8000bcc8:	85b2                	mv	a1,a2
8000bcca:	8556                	mv	a0,s5
8000bccc:	d84fe0ef          	jal	8000a250 <_malloc_r>
8000bcd0:	892a                	mv	s2,a0
8000bcd2:	c53d                	beqz	a0,8000bd40 <__ssputs_r+0xd2>
8000bcd4:	480c                	lw	a1,16(s0)
8000bcd6:	8652                	mv	a2,s4
8000bcd8:	8d8f90ef          	jal	80004db0 <memcpy>
8000bcdc:	00c45783          	lhu	a5,12(s0)
8000bce0:	b7f7f793          	andi	a5,a5,-1153
8000bce4:	0807e793          	ori	a5,a5,128
8000bce8:	00f41623          	sh	a5,12(s0)
8000bcec:	01242823          	sw	s2,16(s0)
8000bcf0:	c844                	sw	s1,20(s0)
8000bcf2:	9952                	add	s2,s2,s4
8000bcf4:	414484b3          	sub	s1,s1,s4
8000bcf8:	01242023          	sw	s2,0(s0)
8000bcfc:	c404                	sw	s1,8(s0)
8000bcfe:	894e                	mv	s2,s3
8000bd00:	4008                	lw	a0,0(s0)
8000bd02:	864e                	mv	a2,s3
8000bd04:	85da                	mv	a1,s6
8000bd06:	8c0f90ef          	jal	80004dc6 <memmove>
8000bd0a:	441c                	lw	a5,8(s0)
8000bd0c:	4501                	li	a0,0
8000bd0e:	412787b3          	sub	a5,a5,s2
8000bd12:	c41c                	sw	a5,8(s0)
8000bd14:	401c                	lw	a5,0(s0)
8000bd16:	97ce                	add	a5,a5,s3
8000bd18:	c01c                	sw	a5,0(s0)
8000bd1a:	40f2                	lw	ra,28(sp)
8000bd1c:	4462                	lw	s0,24(sp)
8000bd1e:	44d2                	lw	s1,20(sp)
8000bd20:	4942                	lw	s2,16(sp)
8000bd22:	49b2                	lw	s3,12(sp)
8000bd24:	4a22                	lw	s4,8(sp)
8000bd26:	4a92                	lw	s5,4(sp)
8000bd28:	4b02                	lw	s6,0(sp)
8000bd2a:	6105                	addi	sp,sp,32
8000bd2c:	8082                	ret
8000bd2e:	8556                	mv	a0,s5
8000bd30:	4e2010ef          	jal	8000d212 <_realloc_r>
8000bd34:	892a                	mv	s2,a0
8000bd36:	f95d                	bnez	a0,8000bcec <__ssputs_r+0x7e>
8000bd38:	480c                	lw	a1,16(s0)
8000bd3a:	8556                	mv	a0,s5
8000bd3c:	c18fe0ef          	jal	8000a154 <_free_r>
8000bd40:	47b1                	li	a5,12
8000bd42:	00faa023          	sw	a5,0(s5)
8000bd46:	00c45783          	lhu	a5,12(s0)
8000bd4a:	557d                	li	a0,-1
8000bd4c:	0407e793          	ori	a5,a5,64
8000bd50:	00f41623          	sh	a5,12(s0)
8000bd54:	b7d9                	j	8000bd1a <__ssputs_r+0xac>
8000bd56:	89ca                	mv	s3,s2
8000bd58:	b765                	j	8000bd00 <__ssputs_r+0x92>
8000bd5a:	8936                	mv	s2,a3
8000bd5c:	b755                	j	8000bd00 <__ssputs_r+0x92>

8000bd5e <_svfiprintf_r>:
8000bd5e:	00c5d783          	lhu	a5,12(a1)
8000bd62:	7171                	addi	sp,sp,-176
8000bd64:	d326                	sw	s1,164(sp)
8000bd66:	c75e                	sw	s7,140(sp)
8000bd68:	d706                	sw	ra,172(sp)
8000bd6a:	d522                	sw	s0,168(sp)
8000bd6c:	d14a                	sw	s2,160(sp)
8000bd6e:	cf4e                	sw	s3,156(sp)
8000bd70:	cd52                	sw	s4,152(sp)
8000bd72:	cb56                	sw	s5,148(sp)
8000bd74:	c95a                	sw	s6,144(sp)
8000bd76:	0807f793          	andi	a5,a5,128
8000bd7a:	8baa                	mv	s7,a0
8000bd7c:	84ae                	mv	s1,a1
8000bd7e:	c3a1                	beqz	a5,8000bdbe <_svfiprintf_r+0x60>
8000bd80:	499c                	lw	a5,16(a1)
8000bd82:	ef95                	bnez	a5,8000bdbe <_svfiprintf_r+0x60>
8000bd84:	04000593          	li	a1,64
8000bd88:	c636                	sw	a3,12(sp)
8000bd8a:	c432                	sw	a2,8(sp)
8000bd8c:	cc4fe0ef          	jal	8000a250 <_malloc_r>
8000bd90:	c088                	sw	a0,0(s1)
8000bd92:	c888                	sw	a0,16(s1)
8000bd94:	4622                	lw	a2,8(sp)
8000bd96:	46b2                	lw	a3,12(sp)
8000bd98:	e105                	bnez	a0,8000bdb8 <_svfiprintf_r+0x5a>
8000bd9a:	47b1                	li	a5,12
8000bd9c:	00fba023          	sw	a5,0(s7)
8000bda0:	557d                	li	a0,-1
8000bda2:	50ba                	lw	ra,172(sp)
8000bda4:	542a                	lw	s0,168(sp)
8000bda6:	549a                	lw	s1,164(sp)
8000bda8:	590a                	lw	s2,160(sp)
8000bdaa:	49fa                	lw	s3,156(sp)
8000bdac:	4a6a                	lw	s4,152(sp)
8000bdae:	4ada                	lw	s5,148(sp)
8000bdb0:	4b4a                	lw	s6,144(sp)
8000bdb2:	4bba                	lw	s7,140(sp)
8000bdb4:	614d                	addi	sp,sp,176
8000bdb6:	8082                	ret
8000bdb8:	04000793          	li	a5,64
8000bdbc:	c8dc                	sw	a5,20(s1)
8000bdbe:	02000793          	li	a5,32
8000bdc2:	02f10ca3          	sb	a5,57(sp)
8000bdc6:	8000e9b7          	lui	s3,0x8000e
8000bdca:	03000793          	li	a5,48
8000bdce:	da02                	sw	zero,52(sp)
8000bdd0:	02f10d23          	sb	a5,58(sp)
8000bdd4:	ce36                	sw	a3,28(sp)
8000bdd6:	02500a13          	li	s4,37
8000bdda:	597d                	li	s2,-1
8000bddc:	b7c98993          	addi	s3,s3,-1156 # 8000db7c <s_wdgs+0x1a4>
8000bde0:	4a85                	li	s5,1
8000bde2:	8432                	mv	s0,a2
8000bde4:	00044783          	lbu	a5,0(s0)
8000bde8:	c399                	beqz	a5,8000bdee <_svfiprintf_r+0x90>
8000bdea:	09479663          	bne	a5,s4,8000be76 <_svfiprintf_r+0x118>
8000bdee:	40c40b33          	sub	s6,s0,a2
8000bdf2:	00c40b63          	beq	s0,a2,8000be08 <_svfiprintf_r+0xaa>
8000bdf6:	86da                	mv	a3,s6
8000bdf8:	85a6                	mv	a1,s1
8000bdfa:	855e                	mv	a0,s7
8000bdfc:	3d8d                	jal	8000bc6e <__ssputs_r>
8000bdfe:	19250e63          	beq	a0,s2,8000bf9a <_svfiprintf_r+0x23c>
8000be02:	57d2                	lw	a5,52(sp)
8000be04:	97da                	add	a5,a5,s6
8000be06:	da3e                	sw	a5,52(sp)
8000be08:	00044783          	lbu	a5,0(s0)
8000be0c:	18078763          	beqz	a5,8000bf9a <_svfiprintf_r+0x23c>
8000be10:	0405                	addi	s0,s0,1
8000be12:	d002                	sw	zero,32(sp)
8000be14:	d602                	sw	zero,44(sp)
8000be16:	d24a                	sw	s2,36(sp)
8000be18:	d402                	sw	zero,40(sp)
8000be1a:	060101a3          	sb	zero,99(sp)
8000be1e:	dc82                	sw	zero,120(sp)
8000be20:	00044583          	lbu	a1,0(s0)
8000be24:	4615                	li	a2,5
8000be26:	854e                	mv	a0,s3
8000be28:	db6fd0ef          	jal	800093de <memchr>
8000be2c:	5782                	lw	a5,32(sp)
8000be2e:	00140693          	addi	a3,s0,1
8000be32:	e521                	bnez	a0,8000be7a <_svfiprintf_r+0x11c>
8000be34:	0107f713          	andi	a4,a5,16
8000be38:	c709                	beqz	a4,8000be42 <_svfiprintf_r+0xe4>
8000be3a:	02000713          	li	a4,32
8000be3e:	06e101a3          	sb	a4,99(sp)
8000be42:	0087f713          	andi	a4,a5,8
8000be46:	c709                	beqz	a4,8000be50 <_svfiprintf_r+0xf2>
8000be48:	02b00713          	li	a4,43
8000be4c:	06e101a3          	sb	a4,99(sp)
8000be50:	00044603          	lbu	a2,0(s0)
8000be54:	02a00713          	li	a4,42
8000be58:	02e60963          	beq	a2,a4,8000be8a <_svfiprintf_r+0x12c>
8000be5c:	57b2                	lw	a5,44(sp)
8000be5e:	4681                	li	a3,0
8000be60:	4625                	li	a2,9
8000be62:	45a9                	li	a1,10
8000be64:	00044703          	lbu	a4,0(s0)
8000be68:	fd070713          	addi	a4,a4,-48
8000be6c:	06e67563          	bgeu	a2,a4,8000bed6 <_svfiprintf_r+0x178>
8000be70:	c695                	beqz	a3,8000be9c <_svfiprintf_r+0x13e>
8000be72:	d63e                	sw	a5,44(sp)
8000be74:	a025                	j	8000be9c <_svfiprintf_r+0x13e>
8000be76:	0405                	addi	s0,s0,1
8000be78:	b7b5                	j	8000bde4 <_svfiprintf_r+0x86>
8000be7a:	41350533          	sub	a0,a0,s3
8000be7e:	00aa9533          	sll	a0,s5,a0
8000be82:	8d5d                	or	a0,a0,a5
8000be84:	d02a                	sw	a0,32(sp)
8000be86:	8436                	mv	s0,a3
8000be88:	bf61                	j	8000be20 <_svfiprintf_r+0xc2>
8000be8a:	4772                	lw	a4,28(sp)
8000be8c:	00470613          	addi	a2,a4,4
8000be90:	4318                	lw	a4,0(a4)
8000be92:	ce32                	sw	a2,28(sp)
8000be94:	02074a63          	bltz	a4,8000bec8 <_svfiprintf_r+0x16a>
8000be98:	d63a                	sw	a4,44(sp)
8000be9a:	8436                	mv	s0,a3
8000be9c:	00044703          	lbu	a4,0(s0)
8000bea0:	02e00793          	li	a5,46
8000bea4:	04f71063          	bne	a4,a5,8000bee4 <_svfiprintf_r+0x186>
8000bea8:	00144703          	lbu	a4,1(s0)
8000beac:	02a00793          	li	a5,42
8000beb0:	08f71f63          	bne	a4,a5,8000bf4e <_svfiprintf_r+0x1f0>
8000beb4:	47f2                	lw	a5,28(sp)
8000beb6:	0409                	addi	s0,s0,2
8000beb8:	00478713          	addi	a4,a5,4
8000bebc:	439c                	lw	a5,0(a5)
8000bebe:	ce3a                	sw	a4,28(sp)
8000bec0:	0207c163          	bltz	a5,8000bee2 <_svfiprintf_r+0x184>
8000bec4:	d23e                	sw	a5,36(sp)
8000bec6:	a839                	j	8000bee4 <_svfiprintf_r+0x186>
8000bec8:	40e00733          	neg	a4,a4
8000becc:	0027e793          	ori	a5,a5,2
8000bed0:	d63a                	sw	a4,44(sp)
8000bed2:	d03e                	sw	a5,32(sp)
8000bed4:	b7d9                	j	8000be9a <_svfiprintf_r+0x13c>
8000bed6:	02b787b3          	mul	a5,a5,a1
8000beda:	0405                	addi	s0,s0,1
8000bedc:	4685                	li	a3,1
8000bede:	97ba                	add	a5,a5,a4
8000bee0:	b751                	j	8000be64 <_svfiprintf_r+0x106>
8000bee2:	d24a                	sw	s2,36(sp)
8000bee4:	00044583          	lbu	a1,0(s0)
8000bee8:	8000eb37          	lui	s6,0x8000e
8000beec:	460d                	li	a2,3
8000beee:	b84b0513          	addi	a0,s6,-1148 # 8000db84 <s_wdgs+0x1ac>
8000bef2:	cecfd0ef          	jal	800093de <memchr>
8000bef6:	cd09                	beqz	a0,8000bf10 <_svfiprintf_r+0x1b2>
8000bef8:	5782                	lw	a5,32(sp)
8000befa:	b84b0b13          	addi	s6,s6,-1148
8000befe:	41650533          	sub	a0,a0,s6
8000bf02:	04000713          	li	a4,64
8000bf06:	00a71733          	sll	a4,a4,a0
8000bf0a:	8fd9                	or	a5,a5,a4
8000bf0c:	0405                	addi	s0,s0,1
8000bf0e:	d03e                	sw	a5,32(sp)
8000bf10:	00044583          	lbu	a1,0(s0)
8000bf14:	8000e537          	lui	a0,0x8000e
8000bf18:	4619                	li	a2,6
8000bf1a:	b8850513          	addi	a0,a0,-1144 # 8000db88 <s_wdgs+0x1b0>
8000bf1e:	02b10c23          	sb	a1,56(sp)
8000bf22:	cbcfd0ef          	jal	800093de <memchr>
8000bf26:	c151                	beqz	a0,8000bfaa <_svfiprintf_r+0x24c>
8000bf28:	800087b7          	lui	a5,0x80008
8000bf2c:	54a78793          	addi	a5,a5,1354 # 8000854a <_printf_float>
8000bf30:	eba9                	bnez	a5,8000bf82 <_svfiprintf_r+0x224>
8000bf32:	5502                	lw	a0,32(sp)
8000bf34:	47f2                	lw	a5,28(sp)
8000bf36:	10057513          	andi	a0,a0,256
8000bf3a:	cd1d                	beqz	a0,8000bf78 <_svfiprintf_r+0x21a>
8000bf3c:	0791                	addi	a5,a5,4
8000bf3e:	ce3e                	sw	a5,28(sp)
8000bf40:	4501                	li	a0,0
8000bf42:	57d2                	lw	a5,52(sp)
8000bf44:	00140613          	addi	a2,s0,1
8000bf48:	97aa                	add	a5,a5,a0
8000bf4a:	da3e                	sw	a5,52(sp)
8000bf4c:	bd59                	j	8000bde2 <_svfiprintf_r+0x84>
8000bf4e:	0405                	addi	s0,s0,1
8000bf50:	4701                	li	a4,0
8000bf52:	4781                	li	a5,0
8000bf54:	4625                	li	a2,9
8000bf56:	45a9                	li	a1,10
8000bf58:	00044683          	lbu	a3,0(s0)
8000bf5c:	fd068693          	addi	a3,a3,-48
8000bf60:	00d67663          	bgeu	a2,a3,8000bf6c <_svfiprintf_r+0x20e>
8000bf64:	40e00733          	neg	a4,a4
8000bf68:	8ff9                	and	a5,a5,a4
8000bf6a:	bfa9                	j	8000bec4 <_svfiprintf_r+0x166>
8000bf6c:	02b787b3          	mul	a5,a5,a1
8000bf70:	0405                	addi	s0,s0,1
8000bf72:	4705                	li	a4,1
8000bf74:	97b6                	add	a5,a5,a3
8000bf76:	b7cd                	j	8000bf58 <_svfiprintf_r+0x1fa>
8000bf78:	079d                	addi	a5,a5,7
8000bf7a:	9be1                	andi	a5,a5,-8
8000bf7c:	07a1                	addi	a5,a5,8
8000bf7e:	ce3e                	sw	a5,28(sp)
8000bf80:	b7c9                	j	8000bf42 <_svfiprintf_r+0x1e4>
8000bf82:	8000c6b7          	lui	a3,0x8000c
8000bf86:	0878                	addi	a4,sp,28
8000bf88:	c6e68693          	addi	a3,a3,-914 # 8000bc6e <__ssputs_r>
8000bf8c:	8626                	mv	a2,s1
8000bf8e:	100c                	addi	a1,sp,32
8000bf90:	855e                	mv	a0,s7
8000bf92:	db8fc0ef          	jal	8000854a <_printf_float>
8000bf96:	fb2516e3          	bne	a0,s2,8000bf42 <_svfiprintf_r+0x1e4>
8000bf9a:	00c4d783          	lhu	a5,12(s1)
8000bf9e:	0407f793          	andi	a5,a5,64
8000bfa2:	de079fe3          	bnez	a5,8000bda0 <_svfiprintf_r+0x42>
8000bfa6:	5552                	lw	a0,52(sp)
8000bfa8:	bbed                	j	8000bda2 <_svfiprintf_r+0x44>
8000bfaa:	8000c6b7          	lui	a3,0x8000c
8000bfae:	0878                	addi	a4,sp,28
8000bfb0:	c6e68693          	addi	a3,a3,-914 # 8000bc6e <__ssputs_r>
8000bfb4:	8626                	mv	a2,s1
8000bfb6:	100c                	addi	a1,sp,32
8000bfb8:	855e                	mv	a0,s7
8000bfba:	b4bfc0ef          	jal	80008b04 <_printf_i>
8000bfbe:	bfe1                	j	8000bf96 <_svfiprintf_r+0x238>

8000bfc0 <__sfputc_r>:
8000bfc0:	461c                	lw	a5,8(a2)
8000bfc2:	17fd                	addi	a5,a5,-1
8000bfc4:	c61c                	sw	a5,8(a2)
8000bfc6:	0007d963          	bgez	a5,8000bfd8 <__sfputc_r+0x18>
8000bfca:	4e18                	lw	a4,24(a2)
8000bfcc:	00e7c563          	blt	a5,a4,8000bfd6 <__sfputc_r+0x16>
8000bfd0:	ff658793          	addi	a5,a1,-10
8000bfd4:	e391                	bnez	a5,8000bfd8 <__sfputc_r+0x18>
8000bfd6:	af19                	j	8000c6ec <__swbuf_r>
8000bfd8:	421c                	lw	a5,0(a2)
8000bfda:	852e                	mv	a0,a1
8000bfdc:	00178713          	addi	a4,a5,1
8000bfe0:	c218                	sw	a4,0(a2)
8000bfe2:	00b78023          	sb	a1,0(a5)
8000bfe6:	8082                	ret

8000bfe8 <__sfputs_r>:
8000bfe8:	1101                	addi	sp,sp,-32
8000bfea:	cc22                	sw	s0,24(sp)
8000bfec:	ca26                	sw	s1,20(sp)
8000bfee:	c84a                	sw	s2,16(sp)
8000bff0:	c64e                	sw	s3,12(sp)
8000bff2:	c452                	sw	s4,8(sp)
8000bff4:	ce06                	sw	ra,28(sp)
8000bff6:	89aa                	mv	s3,a0
8000bff8:	8a2e                	mv	s4,a1
8000bffa:	8432                	mv	s0,a2
8000bffc:	00d604b3          	add	s1,a2,a3
8000c000:	597d                	li	s2,-1
8000c002:	00941463          	bne	s0,s1,8000c00a <__sfputs_r+0x22>
8000c006:	4501                	li	a0,0
8000c008:	a809                	j	8000c01a <__sfputs_r+0x32>
8000c00a:	00044583          	lbu	a1,0(s0)
8000c00e:	8652                	mv	a2,s4
8000c010:	854e                	mv	a0,s3
8000c012:	377d                	jal	8000bfc0 <__sfputc_r>
8000c014:	0405                	addi	s0,s0,1
8000c016:	ff2516e3          	bne	a0,s2,8000c002 <__sfputs_r+0x1a>
8000c01a:	40f2                	lw	ra,28(sp)
8000c01c:	4462                	lw	s0,24(sp)
8000c01e:	44d2                	lw	s1,20(sp)
8000c020:	4942                	lw	s2,16(sp)
8000c022:	49b2                	lw	s3,12(sp)
8000c024:	4a22                	lw	s4,8(sp)
8000c026:	6105                	addi	sp,sp,32
8000c028:	8082                	ret

8000c02a <_vfiprintf_r>:
8000c02a:	7171                	addi	sp,sp,-176
8000c02c:	d522                	sw	s0,168(sp)
8000c02e:	d326                	sw	s1,164(sp)
8000c030:	d14a                	sw	s2,160(sp)
8000c032:	cf4e                	sw	s3,156(sp)
8000c034:	d706                	sw	ra,172(sp)
8000c036:	cd52                	sw	s4,152(sp)
8000c038:	cb56                	sw	s5,148(sp)
8000c03a:	c95a                	sw	s6,144(sp)
8000c03c:	c75e                	sw	s7,140(sp)
8000c03e:	892a                	mv	s2,a0
8000c040:	84ae                	mv	s1,a1
8000c042:	8432                	mv	s0,a2
8000c044:	89b6                	mv	s3,a3
8000c046:	c501                	beqz	a0,8000c04e <_vfiprintf_r+0x24>
8000c048:	511c                	lw	a5,32(a0)
8000c04a:	e391                	bnez	a5,8000c04e <_vfiprintf_r+0x24>
8000c04c:	2969                	jal	8000c4e6 <__sinit>
8000c04e:	00c4d783          	lhu	a5,12(s1)
8000c052:	8ba1                	andi	a5,a5,8
8000c054:	c399                	beqz	a5,8000c05a <_vfiprintf_r+0x30>
8000c056:	489c                	lw	a5,16(s1)
8000c058:	e791                	bnez	a5,8000c064 <_vfiprintf_r+0x3a>
8000c05a:	85a6                	mv	a1,s1
8000c05c:	854a                	mv	a0,s2
8000c05e:	2f31                	jal	8000c77a <__swsetup_r>
8000c060:	1e051763          	bnez	a0,8000c24e <_vfiprintf_r+0x224>
8000c064:	02000793          	li	a5,32
8000c068:	02f10ca3          	sb	a5,57(sp)
8000c06c:	8000ea37          	lui	s4,0x8000e
8000c070:	03000793          	li	a5,48
8000c074:	ce4e                	sw	s3,28(sp)
8000c076:	da02                	sw	zero,52(sp)
8000c078:	02f10d23          	sb	a5,58(sp)
8000c07c:	02500a93          	li	s5,37
8000c080:	59fd                	li	s3,-1
8000c082:	b7ca0a13          	addi	s4,s4,-1156 # 8000db7c <s_wdgs+0x1a4>
8000c086:	4b05                	li	s6,1
8000c088:	8ba2                	mv	s7,s0
8000c08a:	000bc783          	lbu	a5,0(s7)
8000c08e:	c399                	beqz	a5,8000c094 <_vfiprintf_r+0x6a>
8000c090:	09579963          	bne	a5,s5,8000c122 <_vfiprintf_r+0xf8>
8000c094:	408b86b3          	sub	a3,s7,s0
8000c098:	008b8d63          	beq	s7,s0,8000c0b2 <_vfiprintf_r+0x88>
8000c09c:	8622                	mv	a2,s0
8000c09e:	85a6                	mv	a1,s1
8000c0a0:	854a                	mv	a0,s2
8000c0a2:	c636                	sw	a3,12(sp)
8000c0a4:	3791                	jal	8000bfe8 <__sfputs_r>
8000c0a6:	19350f63          	beq	a0,s3,8000c244 <_vfiprintf_r+0x21a>
8000c0aa:	57d2                	lw	a5,52(sp)
8000c0ac:	46b2                	lw	a3,12(sp)
8000c0ae:	97b6                	add	a5,a5,a3
8000c0b0:	da3e                	sw	a5,52(sp)
8000c0b2:	000bc783          	lbu	a5,0(s7)
8000c0b6:	18078763          	beqz	a5,8000c244 <_vfiprintf_r+0x21a>
8000c0ba:	001b8413          	addi	s0,s7,1
8000c0be:	d002                	sw	zero,32(sp)
8000c0c0:	d602                	sw	zero,44(sp)
8000c0c2:	d24e                	sw	s3,36(sp)
8000c0c4:	d402                	sw	zero,40(sp)
8000c0c6:	060101a3          	sb	zero,99(sp)
8000c0ca:	dc82                	sw	zero,120(sp)
8000c0cc:	00044583          	lbu	a1,0(s0)
8000c0d0:	4615                	li	a2,5
8000c0d2:	8552                	mv	a0,s4
8000c0d4:	b0afd0ef          	jal	800093de <memchr>
8000c0d8:	5782                	lw	a5,32(sp)
8000c0da:	00140693          	addi	a3,s0,1
8000c0de:	e521                	bnez	a0,8000c126 <_vfiprintf_r+0xfc>
8000c0e0:	0107f713          	andi	a4,a5,16
8000c0e4:	c709                	beqz	a4,8000c0ee <_vfiprintf_r+0xc4>
8000c0e6:	02000713          	li	a4,32
8000c0ea:	06e101a3          	sb	a4,99(sp)
8000c0ee:	0087f713          	andi	a4,a5,8
8000c0f2:	c709                	beqz	a4,8000c0fc <_vfiprintf_r+0xd2>
8000c0f4:	02b00713          	li	a4,43
8000c0f8:	06e101a3          	sb	a4,99(sp)
8000c0fc:	00044603          	lbu	a2,0(s0)
8000c100:	02a00713          	li	a4,42
8000c104:	02e60963          	beq	a2,a4,8000c136 <_vfiprintf_r+0x10c>
8000c108:	57b2                	lw	a5,44(sp)
8000c10a:	4681                	li	a3,0
8000c10c:	4625                	li	a2,9
8000c10e:	45a9                	li	a1,10
8000c110:	00044703          	lbu	a4,0(s0)
8000c114:	fd070713          	addi	a4,a4,-48
8000c118:	06e67563          	bgeu	a2,a4,8000c182 <_vfiprintf_r+0x158>
8000c11c:	c695                	beqz	a3,8000c148 <_vfiprintf_r+0x11e>
8000c11e:	d63e                	sw	a5,44(sp)
8000c120:	a025                	j	8000c148 <_vfiprintf_r+0x11e>
8000c122:	0b85                	addi	s7,s7,1
8000c124:	b79d                	j	8000c08a <_vfiprintf_r+0x60>
8000c126:	41450533          	sub	a0,a0,s4
8000c12a:	00ab1533          	sll	a0,s6,a0
8000c12e:	8d5d                	or	a0,a0,a5
8000c130:	d02a                	sw	a0,32(sp)
8000c132:	8436                	mv	s0,a3
8000c134:	bf61                	j	8000c0cc <_vfiprintf_r+0xa2>
8000c136:	4772                	lw	a4,28(sp)
8000c138:	00470613          	addi	a2,a4,4
8000c13c:	4318                	lw	a4,0(a4)
8000c13e:	ce32                	sw	a2,28(sp)
8000c140:	02074a63          	bltz	a4,8000c174 <_vfiprintf_r+0x14a>
8000c144:	d63a                	sw	a4,44(sp)
8000c146:	8436                	mv	s0,a3
8000c148:	00044703          	lbu	a4,0(s0)
8000c14c:	02e00793          	li	a5,46
8000c150:	04f71063          	bne	a4,a5,8000c190 <_vfiprintf_r+0x166>
8000c154:	00144703          	lbu	a4,1(s0)
8000c158:	02a00793          	li	a5,42
8000c15c:	08f71e63          	bne	a4,a5,8000c1f8 <_vfiprintf_r+0x1ce>
8000c160:	47f2                	lw	a5,28(sp)
8000c162:	0409                	addi	s0,s0,2
8000c164:	00478713          	addi	a4,a5,4
8000c168:	439c                	lw	a5,0(a5)
8000c16a:	ce3a                	sw	a4,28(sp)
8000c16c:	0207c163          	bltz	a5,8000c18e <_vfiprintf_r+0x164>
8000c170:	d23e                	sw	a5,36(sp)
8000c172:	a839                	j	8000c190 <_vfiprintf_r+0x166>
8000c174:	40e00733          	neg	a4,a4
8000c178:	0027e793          	ori	a5,a5,2
8000c17c:	d63a                	sw	a4,44(sp)
8000c17e:	d03e                	sw	a5,32(sp)
8000c180:	b7d9                	j	8000c146 <_vfiprintf_r+0x11c>
8000c182:	02b787b3          	mul	a5,a5,a1
8000c186:	0405                	addi	s0,s0,1
8000c188:	4685                	li	a3,1
8000c18a:	97ba                	add	a5,a5,a4
8000c18c:	b751                	j	8000c110 <_vfiprintf_r+0xe6>
8000c18e:	d24e                	sw	s3,36(sp)
8000c190:	00044583          	lbu	a1,0(s0)
8000c194:	8000ebb7          	lui	s7,0x8000e
8000c198:	460d                	li	a2,3
8000c19a:	b84b8513          	addi	a0,s7,-1148 # 8000db84 <s_wdgs+0x1ac>
8000c19e:	a40fd0ef          	jal	800093de <memchr>
8000c1a2:	cd09                	beqz	a0,8000c1bc <_vfiprintf_r+0x192>
8000c1a4:	5782                	lw	a5,32(sp)
8000c1a6:	b84b8b93          	addi	s7,s7,-1148
8000c1aa:	41750533          	sub	a0,a0,s7
8000c1ae:	04000713          	li	a4,64
8000c1b2:	00a71733          	sll	a4,a4,a0
8000c1b6:	8fd9                	or	a5,a5,a4
8000c1b8:	0405                	addi	s0,s0,1
8000c1ba:	d03e                	sw	a5,32(sp)
8000c1bc:	00044583          	lbu	a1,0(s0)
8000c1c0:	8000e537          	lui	a0,0x8000e
8000c1c4:	4619                	li	a2,6
8000c1c6:	b8850513          	addi	a0,a0,-1144 # 8000db88 <s_wdgs+0x1b0>
8000c1ca:	02b10c23          	sb	a1,56(sp)
8000c1ce:	a10fd0ef          	jal	800093de <memchr>
8000c1d2:	c951                	beqz	a0,8000c266 <_vfiprintf_r+0x23c>
8000c1d4:	800087b7          	lui	a5,0x80008
8000c1d8:	54a78793          	addi	a5,a5,1354 # 8000854a <_printf_float>
8000c1dc:	eba1                	bnez	a5,8000c22c <_vfiprintf_r+0x202>
8000c1de:	5502                	lw	a0,32(sp)
8000c1e0:	47f2                	lw	a5,28(sp)
8000c1e2:	10057513          	andi	a0,a0,256
8000c1e6:	cd15                	beqz	a0,8000c222 <_vfiprintf_r+0x1f8>
8000c1e8:	0791                	addi	a5,a5,4
8000c1ea:	ce3e                	sw	a5,28(sp)
8000c1ec:	4501                	li	a0,0
8000c1ee:	57d2                	lw	a5,52(sp)
8000c1f0:	0405                	addi	s0,s0,1
8000c1f2:	97aa                	add	a5,a5,a0
8000c1f4:	da3e                	sw	a5,52(sp)
8000c1f6:	bd49                	j	8000c088 <_vfiprintf_r+0x5e>
8000c1f8:	0405                	addi	s0,s0,1
8000c1fa:	4701                	li	a4,0
8000c1fc:	4781                	li	a5,0
8000c1fe:	4625                	li	a2,9
8000c200:	45a9                	li	a1,10
8000c202:	00044683          	lbu	a3,0(s0)
8000c206:	fd068693          	addi	a3,a3,-48
8000c20a:	00d67663          	bgeu	a2,a3,8000c216 <_vfiprintf_r+0x1ec>
8000c20e:	40e00733          	neg	a4,a4
8000c212:	8ff9                	and	a5,a5,a4
8000c214:	bfb1                	j	8000c170 <_vfiprintf_r+0x146>
8000c216:	02b787b3          	mul	a5,a5,a1
8000c21a:	0405                	addi	s0,s0,1
8000c21c:	4705                	li	a4,1
8000c21e:	97b6                	add	a5,a5,a3
8000c220:	b7cd                	j	8000c202 <_vfiprintf_r+0x1d8>
8000c222:	079d                	addi	a5,a5,7
8000c224:	9be1                	andi	a5,a5,-8
8000c226:	07a1                	addi	a5,a5,8
8000c228:	ce3e                	sw	a5,28(sp)
8000c22a:	b7d1                	j	8000c1ee <_vfiprintf_r+0x1c4>
8000c22c:	8000c6b7          	lui	a3,0x8000c
8000c230:	0878                	addi	a4,sp,28
8000c232:	fe868693          	addi	a3,a3,-24 # 8000bfe8 <__sfputs_r>
8000c236:	8626                	mv	a2,s1
8000c238:	100c                	addi	a1,sp,32
8000c23a:	854a                	mv	a0,s2
8000c23c:	b0efc0ef          	jal	8000854a <_printf_float>
8000c240:	fb3517e3          	bne	a0,s3,8000c1ee <_vfiprintf_r+0x1c4>
8000c244:	00c4d783          	lhu	a5,12(s1)
8000c248:	0407f793          	andi	a5,a5,64
8000c24c:	cb85                	beqz	a5,8000c27c <_vfiprintf_r+0x252>
8000c24e:	557d                	li	a0,-1
8000c250:	50ba                	lw	ra,172(sp)
8000c252:	542a                	lw	s0,168(sp)
8000c254:	549a                	lw	s1,164(sp)
8000c256:	590a                	lw	s2,160(sp)
8000c258:	49fa                	lw	s3,156(sp)
8000c25a:	4a6a                	lw	s4,152(sp)
8000c25c:	4ada                	lw	s5,148(sp)
8000c25e:	4b4a                	lw	s6,144(sp)
8000c260:	4bba                	lw	s7,140(sp)
8000c262:	614d                	addi	sp,sp,176
8000c264:	8082                	ret
8000c266:	8000c6b7          	lui	a3,0x8000c
8000c26a:	0878                	addi	a4,sp,28
8000c26c:	fe868693          	addi	a3,a3,-24 # 8000bfe8 <__sfputs_r>
8000c270:	8626                	mv	a2,s1
8000c272:	100c                	addi	a1,sp,32
8000c274:	854a                	mv	a0,s2
8000c276:	88ffc0ef          	jal	80008b04 <_printf_i>
8000c27a:	b7d9                	j	8000c240 <_vfiprintf_r+0x216>
8000c27c:	5552                	lw	a0,52(sp)
8000c27e:	bfc9                	j	8000c250 <_vfiprintf_r+0x226>

8000c280 <__sflush_r>:
8000c280:	00c59783          	lh	a5,12(a1)
8000c284:	1101                	addi	sp,sp,-32
8000c286:	cc22                	sw	s0,24(sp)
8000c288:	ca26                	sw	s1,20(sp)
8000c28a:	ce06                	sw	ra,28(sp)
8000c28c:	c84a                	sw	s2,16(sp)
8000c28e:	0087f713          	andi	a4,a5,8
8000c292:	84aa                	mv	s1,a0
8000c294:	842e                	mv	s0,a1
8000c296:	e37d                	bnez	a4,8000c37c <__sflush_r+0xfc>
8000c298:	41d8                	lw	a4,4(a1)
8000c29a:	00e04563          	bgtz	a4,8000c2a4 <__sflush_r+0x24>
8000c29e:	41b8                	lw	a4,64(a1)
8000c2a0:	00e05463          	blez	a4,8000c2a8 <__sflush_r+0x28>
8000c2a4:	5458                	lw	a4,44(s0)
8000c2a6:	eb01                	bnez	a4,8000c2b6 <__sflush_r+0x36>
8000c2a8:	4501                	li	a0,0
8000c2aa:	40f2                	lw	ra,28(sp)
8000c2ac:	4462                	lw	s0,24(sp)
8000c2ae:	44d2                	lw	s1,20(sp)
8000c2b0:	4942                	lw	s2,16(sp)
8000c2b2:	6105                	addi	sp,sp,32
8000c2b4:	8082                	ret
8000c2b6:	0004a903          	lw	s2,0(s1)
8000c2ba:	01379693          	slli	a3,a5,0x13
8000c2be:	0004a023          	sw	zero,0(s1)
8000c2c2:	0606df63          	bgez	a3,8000c340 <__sflush_r+0xc0>
8000c2c6:	4868                	lw	a0,84(s0)
8000c2c8:	00c45783          	lhu	a5,12(s0)
8000c2cc:	8b91                	andi	a5,a5,4
8000c2ce:	c799                	beqz	a5,8000c2dc <__sflush_r+0x5c>
8000c2d0:	405c                	lw	a5,4(s0)
8000c2d2:	8d1d                	sub	a0,a0,a5
8000c2d4:	585c                	lw	a5,52(s0)
8000c2d6:	c399                	beqz	a5,8000c2dc <__sflush_r+0x5c>
8000c2d8:	403c                	lw	a5,64(s0)
8000c2da:	8d1d                	sub	a0,a0,a5
8000c2dc:	545c                	lw	a5,44(s0)
8000c2de:	500c                	lw	a1,32(s0)
8000c2e0:	862a                	mv	a2,a0
8000c2e2:	4681                	li	a3,0
8000c2e4:	8526                	mv	a0,s1
8000c2e6:	9782                	jalr	a5
8000c2e8:	57fd                	li	a5,-1
8000c2ea:	00c41703          	lh	a4,12(s0)
8000c2ee:	00f51d63          	bne	a0,a5,8000c308 <__sflush_r+0x88>
8000c2f2:	4094                	lw	a3,0(s1)
8000c2f4:	47f5                	li	a5,29
8000c2f6:	06d7ee63          	bltu	a5,a3,8000c372 <__sflush_r+0xf2>
8000c2fa:	204007b7          	lui	a5,0x20400
8000c2fe:	0785                	addi	a5,a5,1 # 20400001 <__share_mem_end__+0x1f280001>
8000c300:	00d7d7b3          	srl	a5,a5,a3
8000c304:	8b85                	andi	a5,a5,1
8000c306:	c7b5                	beqz	a5,8000c372 <__sflush_r+0xf2>
8000c308:	481c                	lw	a5,16(s0)
8000c30a:	00042223          	sw	zero,4(s0)
8000c30e:	c01c                	sw	a5,0(s0)
8000c310:	01371793          	slli	a5,a4,0x13
8000c314:	0007d863          	bgez	a5,8000c324 <__sflush_r+0xa4>
8000c318:	57fd                	li	a5,-1
8000c31a:	00f51463          	bne	a0,a5,8000c322 <__sflush_r+0xa2>
8000c31e:	409c                	lw	a5,0(s1)
8000c320:	e391                	bnez	a5,8000c324 <__sflush_r+0xa4>
8000c322:	c868                	sw	a0,84(s0)
8000c324:	584c                	lw	a1,52(s0)
8000c326:	0124a023          	sw	s2,0(s1)
8000c32a:	ddbd                	beqz	a1,8000c2a8 <__sflush_r+0x28>
8000c32c:	04440793          	addi	a5,s0,68
8000c330:	00f58563          	beq	a1,a5,8000c33a <__sflush_r+0xba>
8000c334:	8526                	mv	a0,s1
8000c336:	e1ffd0ef          	jal	8000a154 <_free_r>
8000c33a:	02042a23          	sw	zero,52(s0)
8000c33e:	b7ad                	j	8000c2a8 <__sflush_r+0x28>
8000c340:	500c                	lw	a1,32(s0)
8000c342:	4685                	li	a3,1
8000c344:	4601                	li	a2,0
8000c346:	8526                	mv	a0,s1
8000c348:	9702                	jalr	a4
8000c34a:	57fd                	li	a5,-1
8000c34c:	f6f51ee3          	bne	a0,a5,8000c2c8 <__sflush_r+0x48>
8000c350:	409c                	lw	a5,0(s1)
8000c352:	dbbd                	beqz	a5,8000c2c8 <__sflush_r+0x48>
8000c354:	fea78713          	addi	a4,a5,-22
8000c358:	c319                	beqz	a4,8000c35e <__sflush_r+0xde>
8000c35a:	178d                	addi	a5,a5,-29
8000c35c:	e781                	bnez	a5,8000c364 <__sflush_r+0xe4>
8000c35e:	0124a023          	sw	s2,0(s1)
8000c362:	b799                	j	8000c2a8 <__sflush_r+0x28>
8000c364:	00c45783          	lhu	a5,12(s0)
8000c368:	0407e793          	ori	a5,a5,64
8000c36c:	00f41623          	sh	a5,12(s0)
8000c370:	bf2d                	j	8000c2aa <__sflush_r+0x2a>
8000c372:	04076713          	ori	a4,a4,64
8000c376:	00e41623          	sh	a4,12(s0)
8000c37a:	bf05                	j	8000c2aa <__sflush_r+0x2a>
8000c37c:	4990                	lw	a2,16(a1)
8000c37e:	d60d                	beqz	a2,8000c2a8 <__sflush_r+0x28>
8000c380:	4194                	lw	a3,0(a1)
8000c382:	8b8d                	andi	a5,a5,3
8000c384:	c190                	sw	a2,0(a1)
8000c386:	40c68933          	sub	s2,a3,a2
8000c38a:	4701                	li	a4,0
8000c38c:	e391                	bnez	a5,8000c390 <__sflush_r+0x110>
8000c38e:	49d8                	lw	a4,20(a1)
8000c390:	c418                	sw	a4,8(s0)
8000c392:	f1205be3          	blez	s2,8000c2a8 <__sflush_r+0x28>
8000c396:	541c                	lw	a5,40(s0)
8000c398:	500c                	lw	a1,32(s0)
8000c39a:	86ca                	mv	a3,s2
8000c39c:	8526                	mv	a0,s1
8000c39e:	c632                	sw	a2,12(sp)
8000c3a0:	9782                	jalr	a5
8000c3a2:	4632                	lw	a2,12(sp)
8000c3a4:	00a04a63          	bgtz	a0,8000c3b8 <__sflush_r+0x138>
8000c3a8:	00c45783          	lhu	a5,12(s0)
8000c3ac:	557d                	li	a0,-1
8000c3ae:	0407e793          	ori	a5,a5,64
8000c3b2:	00f41623          	sh	a5,12(s0)
8000c3b6:	bdd5                	j	8000c2aa <__sflush_r+0x2a>
8000c3b8:	962a                	add	a2,a2,a0
8000c3ba:	40a90933          	sub	s2,s2,a0
8000c3be:	bfd1                	j	8000c392 <__sflush_r+0x112>

8000c3c0 <_fflush_r>:
8000c3c0:	499c                	lw	a5,16(a1)
8000c3c2:	cb85                	beqz	a5,8000c3f2 <_fflush_r+0x32>
8000c3c4:	1101                	addi	sp,sp,-32
8000c3c6:	cc22                	sw	s0,24(sp)
8000c3c8:	ce06                	sw	ra,28(sp)
8000c3ca:	842a                	mv	s0,a0
8000c3cc:	c511                	beqz	a0,8000c3d8 <_fflush_r+0x18>
8000c3ce:	511c                	lw	a5,32(a0)
8000c3d0:	e781                	bnez	a5,8000c3d8 <_fflush_r+0x18>
8000c3d2:	c62e                	sw	a1,12(sp)
8000c3d4:	2a09                	jal	8000c4e6 <__sinit>
8000c3d6:	45b2                	lw	a1,12(sp)
8000c3d8:	00c59783          	lh	a5,12(a1)
8000c3dc:	c791                	beqz	a5,8000c3e8 <_fflush_r+0x28>
8000c3de:	8522                	mv	a0,s0
8000c3e0:	4462                	lw	s0,24(sp)
8000c3e2:	40f2                	lw	ra,28(sp)
8000c3e4:	6105                	addi	sp,sp,32
8000c3e6:	bd69                	j	8000c280 <__sflush_r>
8000c3e8:	40f2                	lw	ra,28(sp)
8000c3ea:	4462                	lw	s0,24(sp)
8000c3ec:	4501                	li	a0,0
8000c3ee:	6105                	addi	sp,sp,32
8000c3f0:	8082                	ret
8000c3f2:	4501                	li	a0,0
8000c3f4:	8082                	ret

8000c3f6 <std>:
8000c3f6:	1141                	addi	sp,sp,-16
8000c3f8:	c422                	sw	s0,8(sp)
8000c3fa:	c606                	sw	ra,12(sp)
8000c3fc:	842a                	mv	s0,a0
8000c3fe:	00b51623          	sh	a1,12(a0)
8000c402:	00c51723          	sh	a2,14(a0)
8000c406:	00052023          	sw	zero,0(a0)
8000c40a:	00052223          	sw	zero,4(a0)
8000c40e:	00052423          	sw	zero,8(a0)
8000c412:	06052223          	sw	zero,100(a0)
8000c416:	00052823          	sw	zero,16(a0)
8000c41a:	00052a23          	sw	zero,20(a0)
8000c41e:	00052c23          	sw	zero,24(a0)
8000c422:	4621                	li	a2,8
8000c424:	4581                	li	a1,0
8000c426:	05c50513          	addi	a0,a0,92
8000c42a:	977f80ef          	jal	80004da0 <memset>
8000c42e:	8000c7b7          	lui	a5,0x8000c
8000c432:	63278793          	addi	a5,a5,1586 # 8000c632 <__sread>
8000c436:	d05c                	sw	a5,36(s0)
8000c438:	8000c7b7          	lui	a5,0x8000c
8000c43c:	66278793          	addi	a5,a5,1634 # 8000c662 <__swrite>
8000c440:	d41c                	sw	a5,40(s0)
8000c442:	8000c7b7          	lui	a5,0x8000c
8000c446:	6b078793          	addi	a5,a5,1712 # 8000c6b0 <__sseek>
8000c44a:	d45c                	sw	a5,44(s0)
8000c44c:	8000c7b7          	lui	a5,0x8000c
8000c450:	6e678793          	addi	a5,a5,1766 # 8000c6e6 <__sclose>
8000c454:	40b2                	lw	ra,12(sp)
8000c456:	d000                	sw	s0,32(s0)
8000c458:	d81c                	sw	a5,48(s0)
8000c45a:	4422                	lw	s0,8(sp)
8000c45c:	0141                	addi	sp,sp,16
8000c45e:	8082                	ret

8000c460 <stdio_exit_handler>:
8000c460:	8000c5b7          	lui	a1,0x8000c
8000c464:	01080537          	lui	a0,0x1080
8000c468:	84c18613          	addi	a2,gp,-1972 # 108004c <__sglue>
8000c46c:	3c058593          	addi	a1,a1,960 # 8000c3c0 <_fflush_r>
8000c470:	00050513          	mv	a0,a0
8000c474:	a069                	j	8000c4fe <_fwalk_sglue>

8000c476 <cleanup_stdio>:
8000c476:	414c                	lw	a1,4(a0)
8000c478:	1141                	addi	sp,sp,-16
8000c47a:	c422                	sw	s0,8(sp)
8000c47c:	c606                	sw	ra,12(sp)
8000c47e:	9c818793          	addi	a5,gp,-1592 # 10801c8 <__sf>
8000c482:	842a                	mv	s0,a0
8000c484:	00f58363          	beq	a1,a5,8000c48a <cleanup_stdio+0x14>
8000c488:	3f25                	jal	8000c3c0 <_fflush_r>
8000c48a:	440c                	lw	a1,8(s0)
8000c48c:	a3018793          	addi	a5,gp,-1488 # 1080230 <__sf+0x68>
8000c490:	00f58463          	beq	a1,a5,8000c498 <cleanup_stdio+0x22>
8000c494:	8522                	mv	a0,s0
8000c496:	372d                	jal	8000c3c0 <_fflush_r>
8000c498:	444c                	lw	a1,12(s0)
8000c49a:	a9818793          	addi	a5,gp,-1384 # 1080298 <__sf+0xd0>
8000c49e:	00f58763          	beq	a1,a5,8000c4ac <cleanup_stdio+0x36>
8000c4a2:	8522                	mv	a0,s0
8000c4a4:	4422                	lw	s0,8(sp)
8000c4a6:	40b2                	lw	ra,12(sp)
8000c4a8:	0141                	addi	sp,sp,16
8000c4aa:	bf19                	j	8000c3c0 <_fflush_r>
8000c4ac:	40b2                	lw	ra,12(sp)
8000c4ae:	4422                	lw	s0,8(sp)
8000c4b0:	0141                	addi	sp,sp,16
8000c4b2:	8082                	ret

8000c4b4 <global_stdio_init.part.0>:
8000c4b4:	8000c7b7          	lui	a5,0x8000c
8000c4b8:	1141                	addi	sp,sp,-16
8000c4ba:	46078793          	addi	a5,a5,1120 # 8000c460 <stdio_exit_handler>
8000c4be:	4601                	li	a2,0
8000c4c0:	4591                	li	a1,4
8000c4c2:	9c818513          	addi	a0,gp,-1592 # 10801c8 <__sf>
8000c4c6:	c606                	sw	ra,12(sp)
8000c4c8:	b0f1ac23          	sw	a5,-1256(gp) # 1080318 <__stdio_exit_handler>
8000c4cc:	372d                	jal	8000c3f6 <std>
8000c4ce:	4605                	li	a2,1
8000c4d0:	45a5                	li	a1,9
8000c4d2:	a3018513          	addi	a0,gp,-1488 # 1080230 <__sf+0x68>
8000c4d6:	3705                	jal	8000c3f6 <std>
8000c4d8:	40b2                	lw	ra,12(sp)
8000c4da:	4609                	li	a2,2
8000c4dc:	45c9                	li	a1,18
8000c4de:	a9818513          	addi	a0,gp,-1384 # 1080298 <__sf+0xd0>
8000c4e2:	0141                	addi	sp,sp,16
8000c4e4:	bf09                	j	8000c3f6 <std>

8000c4e6 <__sinit>:
8000c4e6:	511c                	lw	a5,32(a0)
8000c4e8:	eb91                	bnez	a5,8000c4fc <__sinit+0x16>
8000c4ea:	8000c7b7          	lui	a5,0x8000c
8000c4ee:	47678793          	addi	a5,a5,1142 # 8000c476 <cleanup_stdio>
8000c4f2:	d11c                	sw	a5,32(a0)
8000c4f4:	b181a783          	lw	a5,-1256(gp) # 1080318 <__stdio_exit_handler>
8000c4f8:	e391                	bnez	a5,8000c4fc <__sinit+0x16>
8000c4fa:	bf6d                	j	8000c4b4 <global_stdio_init.part.0>
8000c4fc:	8082                	ret

8000c4fe <_fwalk_sglue>:
8000c4fe:	7179                	addi	sp,sp,-48
8000c500:	d422                	sw	s0,40(sp)
8000c502:	d04a                	sw	s2,32(sp)
8000c504:	ce4e                	sw	s3,28(sp)
8000c506:	cc52                	sw	s4,24(sp)
8000c508:	ca56                	sw	s5,20(sp)
8000c50a:	d606                	sw	ra,44(sp)
8000c50c:	d226                	sw	s1,36(sp)
8000c50e:	8a2a                	mv	s4,a0
8000c510:	8aae                	mv	s5,a1
8000c512:	4401                	li	s0,0
8000c514:	4905                	li	s2,1
8000c516:	59fd                	li	s3,-1
8000c518:	460c                	lw	a1,8(a2)
8000c51a:	4244                	lw	s1,4(a2)
8000c51c:	14fd                	addi	s1,s1,-1
8000c51e:	0004de63          	bgez	s1,8000c53a <_fwalk_sglue+0x3c>
8000c522:	4210                	lw	a2,0(a2)
8000c524:	fa75                	bnez	a2,8000c518 <_fwalk_sglue+0x1a>
8000c526:	50b2                	lw	ra,44(sp)
8000c528:	8522                	mv	a0,s0
8000c52a:	5422                	lw	s0,40(sp)
8000c52c:	5492                	lw	s1,36(sp)
8000c52e:	5902                	lw	s2,32(sp)
8000c530:	49f2                	lw	s3,28(sp)
8000c532:	4a62                	lw	s4,24(sp)
8000c534:	4ad2                	lw	s5,20(sp)
8000c536:	6145                	addi	sp,sp,48
8000c538:	8082                	ret
8000c53a:	00c5d783          	lhu	a5,12(a1)
8000c53e:	00f97d63          	bgeu	s2,a5,8000c558 <_fwalk_sglue+0x5a>
8000c542:	00e59783          	lh	a5,14(a1)
8000c546:	01378963          	beq	a5,s3,8000c558 <_fwalk_sglue+0x5a>
8000c54a:	8552                	mv	a0,s4
8000c54c:	c632                	sw	a2,12(sp)
8000c54e:	c42e                	sw	a1,8(sp)
8000c550:	9a82                	jalr	s5
8000c552:	4632                	lw	a2,12(sp)
8000c554:	45a2                	lw	a1,8(sp)
8000c556:	8c49                	or	s0,s0,a0
8000c558:	06858593          	addi	a1,a1,104
8000c55c:	b7c1                	j	8000c51c <_fwalk_sglue+0x1e>

8000c55e <__swhatbuf_r>:
8000c55e:	7119                	addi	sp,sp,-128
8000c560:	dca2                	sw	s0,120(sp)
8000c562:	842e                	mv	s0,a1
8000c564:	00e59583          	lh	a1,14(a1)
8000c568:	daa6                	sw	s1,116(sp)
8000c56a:	de86                	sw	ra,124(sp)
8000c56c:	84b2                	mv	s1,a2
8000c56e:	0005c863          	bltz	a1,8000c57e <__swhatbuf_r+0x20>
8000c572:	0830                	addi	a2,sp,24
8000c574:	c636                	sw	a3,12(sp)
8000c576:	2651                	jal	8000c8fa <_fstat_r>
8000c578:	46b2                	lw	a3,12(sp)
8000c57a:	02055263          	bgez	a0,8000c59e <__swhatbuf_r+0x40>
8000c57e:	00c45783          	lhu	a5,12(s0)
8000c582:	0807f793          	andi	a5,a5,128
8000c586:	c39d                	beqz	a5,8000c5ac <__swhatbuf_r+0x4e>
8000c588:	4781                	li	a5,0
8000c58a:	04000713          	li	a4,64
8000c58e:	50f6                	lw	ra,124(sp)
8000c590:	5466                	lw	s0,120(sp)
8000c592:	c29c                	sw	a5,0(a3)
8000c594:	c098                	sw	a4,0(s1)
8000c596:	4501                	li	a0,0
8000c598:	54d6                	lw	s1,116(sp)
8000c59a:	6109                	addi	sp,sp,128
8000c59c:	8082                	ret
8000c59e:	47f2                	lw	a5,28(sp)
8000c5a0:	673d                	lui	a4,0xf
8000c5a2:	8ff9                	and	a5,a5,a4
8000c5a4:	7779                	lui	a4,0xffffe
8000c5a6:	97ba                	add	a5,a5,a4
8000c5a8:	0017b793          	seqz	a5,a5
8000c5ac:	40000713          	li	a4,1024
8000c5b0:	bff9                	j	8000c58e <__swhatbuf_r+0x30>

8000c5b2 <__smakebuf_r>:
8000c5b2:	00c5d703          	lhu	a4,12(a1)
8000c5b6:	7179                	addi	sp,sp,-48
8000c5b8:	d422                	sw	s0,40(sp)
8000c5ba:	d606                	sw	ra,44(sp)
8000c5bc:	d226                	sw	s1,36(sp)
8000c5be:	8b09                	andi	a4,a4,2
8000c5c0:	842e                	mv	s0,a1
8000c5c2:	cf01                	beqz	a4,8000c5da <__smakebuf_r+0x28>
8000c5c4:	04740793          	addi	a5,s0,71
8000c5c8:	c01c                	sw	a5,0(s0)
8000c5ca:	c81c                	sw	a5,16(s0)
8000c5cc:	4785                	li	a5,1
8000c5ce:	c85c                	sw	a5,20(s0)
8000c5d0:	50b2                	lw	ra,44(sp)
8000c5d2:	5422                	lw	s0,40(sp)
8000c5d4:	5492                	lw	s1,36(sp)
8000c5d6:	6145                	addi	sp,sp,48
8000c5d8:	8082                	ret
8000c5da:	0874                	addi	a3,sp,28
8000c5dc:	0830                	addi	a2,sp,24
8000c5de:	84aa                	mv	s1,a0
8000c5e0:	3fbd                	jal	8000c55e <__swhatbuf_r>
8000c5e2:	45e2                	lw	a1,24(sp)
8000c5e4:	8526                	mv	a0,s1
8000c5e6:	c62e                	sw	a1,12(sp)
8000c5e8:	c69fd0ef          	jal	8000a250 <_malloc_r>
8000c5ec:	00c41783          	lh	a5,12(s0)
8000c5f0:	45b2                	lw	a1,12(sp)
8000c5f2:	e911                	bnez	a0,8000c606 <__smakebuf_r+0x54>
8000c5f4:	2007f713          	andi	a4,a5,512
8000c5f8:	ff61                	bnez	a4,8000c5d0 <__smakebuf_r+0x1e>
8000c5fa:	9bf1                	andi	a5,a5,-4
8000c5fc:	0027e793          	ori	a5,a5,2
8000c600:	00f41623          	sh	a5,12(s0)
8000c604:	b7c1                	j	8000c5c4 <__smakebuf_r+0x12>
8000c606:	0807e793          	ori	a5,a5,128
8000c60a:	00f41623          	sh	a5,12(s0)
8000c60e:	47f2                	lw	a5,28(sp)
8000c610:	c008                	sw	a0,0(s0)
8000c612:	c808                	sw	a0,16(s0)
8000c614:	c84c                	sw	a1,20(s0)
8000c616:	dfcd                	beqz	a5,8000c5d0 <__smakebuf_r+0x1e>
8000c618:	00e41583          	lh	a1,14(s0)
8000c61c:	8526                	mv	a0,s1
8000c61e:	2629                	jal	8000c928 <_isatty_r>
8000c620:	d945                	beqz	a0,8000c5d0 <__smakebuf_r+0x1e>
8000c622:	00c45783          	lhu	a5,12(s0)
8000c626:	9bf1                	andi	a5,a5,-4
8000c628:	0017e793          	ori	a5,a5,1
8000c62c:	00f41623          	sh	a5,12(s0)
8000c630:	b745                	j	8000c5d0 <__smakebuf_r+0x1e>

8000c632 <__sread>:
8000c632:	1141                	addi	sp,sp,-16
8000c634:	c422                	sw	s0,8(sp)
8000c636:	842e                	mv	s0,a1
8000c638:	00e59583          	lh	a1,14(a1)
8000c63c:	c606                	sw	ra,12(sp)
8000c63e:	2699                	jal	8000c984 <_read_r>
8000c640:	00054963          	bltz	a0,8000c652 <__sread+0x20>
8000c644:	487c                	lw	a5,84(s0)
8000c646:	97aa                	add	a5,a5,a0
8000c648:	c87c                	sw	a5,84(s0)
8000c64a:	40b2                	lw	ra,12(sp)
8000c64c:	4422                	lw	s0,8(sp)
8000c64e:	0141                	addi	sp,sp,16
8000c650:	8082                	ret
8000c652:	00c45783          	lhu	a5,12(s0)
8000c656:	777d                	lui	a4,0xfffff
8000c658:	177d                	addi	a4,a4,-1 # ffffefff <__fast_load_addr__+0x7fff0e3f>
8000c65a:	8ff9                	and	a5,a5,a4
8000c65c:	00f41623          	sh	a5,12(s0)
8000c660:	b7ed                	j	8000c64a <__sread+0x18>

8000c662 <__swrite>:
8000c662:	00c5d783          	lhu	a5,12(a1)
8000c666:	1101                	addi	sp,sp,-32
8000c668:	cc22                	sw	s0,24(sp)
8000c66a:	ca26                	sw	s1,20(sp)
8000c66c:	c84a                	sw	s2,16(sp)
8000c66e:	c64e                	sw	s3,12(sp)
8000c670:	ce06                	sw	ra,28(sp)
8000c672:	1007f793          	andi	a5,a5,256
8000c676:	84aa                	mv	s1,a0
8000c678:	842e                	mv	s0,a1
8000c67a:	8932                	mv	s2,a2
8000c67c:	89b6                	mv	s3,a3
8000c67e:	c791                	beqz	a5,8000c68a <__swrite+0x28>
8000c680:	00e59583          	lh	a1,14(a1)
8000c684:	4689                	li	a3,2
8000c686:	4601                	li	a2,0
8000c688:	24f1                	jal	8000c954 <_lseek_r>
8000c68a:	00c45783          	lhu	a5,12(s0)
8000c68e:	777d                	lui	a4,0xfffff
8000c690:	177d                	addi	a4,a4,-1 # ffffefff <__fast_load_addr__+0x7fff0e3f>
8000c692:	8ff9                	and	a5,a5,a4
8000c694:	00e41583          	lh	a1,14(s0)
8000c698:	00f41623          	sh	a5,12(s0)
8000c69c:	4462                	lw	s0,24(sp)
8000c69e:	40f2                	lw	ra,28(sp)
8000c6a0:	86ce                	mv	a3,s3
8000c6a2:	864a                	mv	a2,s2
8000c6a4:	49b2                	lw	s3,12(sp)
8000c6a6:	4942                	lw	s2,16(sp)
8000c6a8:	8526                	mv	a0,s1
8000c6aa:	44d2                	lw	s1,20(sp)
8000c6ac:	6105                	addi	sp,sp,32
8000c6ae:	a695                	j	8000ca12 <_write_r>

8000c6b0 <__sseek>:
8000c6b0:	1141                	addi	sp,sp,-16
8000c6b2:	c422                	sw	s0,8(sp)
8000c6b4:	842e                	mv	s0,a1
8000c6b6:	00e59583          	lh	a1,14(a1)
8000c6ba:	c606                	sw	ra,12(sp)
8000c6bc:	2c61                	jal	8000c954 <_lseek_r>
8000c6be:	577d                	li	a4,-1
8000c6c0:	00c41783          	lh	a5,12(s0)
8000c6c4:	00e51b63          	bne	a0,a4,8000c6da <__sseek+0x2a>
8000c6c8:	777d                	lui	a4,0xfffff
8000c6ca:	972a                	add	a4,a4,a0
8000c6cc:	8ff9                	and	a5,a5,a4
8000c6ce:	00f41623          	sh	a5,12(s0)
8000c6d2:	40b2                	lw	ra,12(sp)
8000c6d4:	4422                	lw	s0,8(sp)
8000c6d6:	0141                	addi	sp,sp,16
8000c6d8:	8082                	ret
8000c6da:	6705                	lui	a4,0x1
8000c6dc:	8fd9                	or	a5,a5,a4
8000c6de:	00f41623          	sh	a5,12(s0)
8000c6e2:	c868                	sw	a0,84(s0)
8000c6e4:	b7fd                	j	8000c6d2 <__sseek+0x22>

8000c6e6 <__sclose>:
8000c6e6:	00e59583          	lh	a1,14(a1)
8000c6ea:	a2d5                	j	8000c8ce <_close_r>

8000c6ec <__swbuf_r>:
8000c6ec:	1101                	addi	sp,sp,-32
8000c6ee:	cc22                	sw	s0,24(sp)
8000c6f0:	ca26                	sw	s1,20(sp)
8000c6f2:	c64e                	sw	s3,12(sp)
8000c6f4:	ce06                	sw	ra,28(sp)
8000c6f6:	c84a                	sw	s2,16(sp)
8000c6f8:	84aa                	mv	s1,a0
8000c6fa:	89ae                	mv	s3,a1
8000c6fc:	8432                	mv	s0,a2
8000c6fe:	c501                	beqz	a0,8000c706 <__swbuf_r+0x1a>
8000c700:	511c                	lw	a5,32(a0)
8000c702:	e391                	bnez	a5,8000c706 <__swbuf_r+0x1a>
8000c704:	33cd                	jal	8000c4e6 <__sinit>
8000c706:	4c1c                	lw	a5,24(s0)
8000c708:	c41c                	sw	a5,8(s0)
8000c70a:	00c45783          	lhu	a5,12(s0)
8000c70e:	8ba1                	andi	a5,a5,8
8000c710:	cfb9                	beqz	a5,8000c76e <__swbuf_r+0x82>
8000c712:	481c                	lw	a5,16(s0)
8000c714:	cfa9                	beqz	a5,8000c76e <__swbuf_r+0x82>
8000c716:	481c                	lw	a5,16(s0)
8000c718:	4008                	lw	a0,0(s0)
8000c71a:	8d1d                	sub	a0,a0,a5
8000c71c:	485c                	lw	a5,20(s0)
8000c71e:	00f54663          	blt	a0,a5,8000c72a <__swbuf_r+0x3e>
8000c722:	85a2                	mv	a1,s0
8000c724:	8526                	mv	a0,s1
8000c726:	3969                	jal	8000c3c0 <_fflush_r>
8000c728:	e539                	bnez	a0,8000c776 <__swbuf_r+0x8a>
8000c72a:	441c                	lw	a5,8(s0)
8000c72c:	0505                	addi	a0,a0,1 # 1080001 <_impure_data+0x1>
8000c72e:	0ff9f913          	zext.b	s2,s3
8000c732:	17fd                	addi	a5,a5,-1
8000c734:	c41c                	sw	a5,8(s0)
8000c736:	401c                	lw	a5,0(s0)
8000c738:	00178713          	addi	a4,a5,1
8000c73c:	c018                	sw	a4,0(s0)
8000c73e:	01378023          	sb	s3,0(a5)
8000c742:	485c                	lw	a5,20(s0)
8000c744:	00a78963          	beq	a5,a0,8000c756 <__swbuf_r+0x6a>
8000c748:	ff690793          	addi	a5,s2,-10
8000c74c:	eb89                	bnez	a5,8000c75e <__swbuf_r+0x72>
8000c74e:	00c45783          	lhu	a5,12(s0)
8000c752:	8b85                	andi	a5,a5,1
8000c754:	c789                	beqz	a5,8000c75e <__swbuf_r+0x72>
8000c756:	85a2                	mv	a1,s0
8000c758:	8526                	mv	a0,s1
8000c75a:	319d                	jal	8000c3c0 <_fflush_r>
8000c75c:	ed09                	bnez	a0,8000c776 <__swbuf_r+0x8a>
8000c75e:	40f2                	lw	ra,28(sp)
8000c760:	4462                	lw	s0,24(sp)
8000c762:	44d2                	lw	s1,20(sp)
8000c764:	49b2                	lw	s3,12(sp)
8000c766:	854a                	mv	a0,s2
8000c768:	4942                	lw	s2,16(sp)
8000c76a:	6105                	addi	sp,sp,32
8000c76c:	8082                	ret
8000c76e:	85a2                	mv	a1,s0
8000c770:	8526                	mv	a0,s1
8000c772:	2021                	jal	8000c77a <__swsetup_r>
8000c774:	d14d                	beqz	a0,8000c716 <__swbuf_r+0x2a>
8000c776:	597d                	li	s2,-1
8000c778:	b7dd                	j	8000c75e <__swbuf_r+0x72>

8000c77a <__swsetup_r>:
8000c77a:	1141                	addi	sp,sp,-16
8000c77c:	c226                	sw	s1,4(sp)
8000c77e:	84aa                	mv	s1,a0
8000c780:	9c41a503          	lw	a0,-1596(gp) # 10801c4 <_impure_ptr>
8000c784:	c422                	sw	s0,8(sp)
8000c786:	c606                	sw	ra,12(sp)
8000c788:	842e                	mv	s0,a1
8000c78a:	c501                	beqz	a0,8000c792 <__swsetup_r+0x18>
8000c78c:	511c                	lw	a5,32(a0)
8000c78e:	e391                	bnez	a5,8000c792 <__swsetup_r+0x18>
8000c790:	3b99                	jal	8000c4e6 <__sinit>
8000c792:	00c41783          	lh	a5,12(s0)
8000c796:	0087f713          	andi	a4,a5,8
8000c79a:	eb31                	bnez	a4,8000c7ee <__swsetup_r+0x74>
8000c79c:	0107f713          	andi	a4,a5,16
8000c7a0:	ef09                	bnez	a4,8000c7ba <__swsetup_r+0x40>
8000c7a2:	4725                	li	a4,9
8000c7a4:	c098                	sw	a4,0(s1)
8000c7a6:	0407e793          	ori	a5,a5,64
8000c7aa:	00f41623          	sh	a5,12(s0)
8000c7ae:	557d                	li	a0,-1
8000c7b0:	40b2                	lw	ra,12(sp)
8000c7b2:	4422                	lw	s0,8(sp)
8000c7b4:	4492                	lw	s1,4(sp)
8000c7b6:	0141                	addi	sp,sp,16
8000c7b8:	8082                	ret
8000c7ba:	0047f713          	andi	a4,a5,4
8000c7be:	c705                	beqz	a4,8000c7e6 <__swsetup_r+0x6c>
8000c7c0:	584c                	lw	a1,52(s0)
8000c7c2:	c991                	beqz	a1,8000c7d6 <__swsetup_r+0x5c>
8000c7c4:	04440793          	addi	a5,s0,68
8000c7c8:	00f58563          	beq	a1,a5,8000c7d2 <__swsetup_r+0x58>
8000c7cc:	8526                	mv	a0,s1
8000c7ce:	987fd0ef          	jal	8000a154 <_free_r>
8000c7d2:	02042a23          	sw	zero,52(s0)
8000c7d6:	00c45783          	lhu	a5,12(s0)
8000c7da:	4818                	lw	a4,16(s0)
8000c7dc:	00042223          	sw	zero,4(s0)
8000c7e0:	fdb7f793          	andi	a5,a5,-37
8000c7e4:	c018                	sw	a4,0(s0)
8000c7e6:	0087e793          	ori	a5,a5,8
8000c7ea:	00f41623          	sh	a5,12(s0)
8000c7ee:	481c                	lw	a5,16(s0)
8000c7f0:	eb99                	bnez	a5,8000c806 <__swsetup_r+0x8c>
8000c7f2:	445c                	lw	a5,12(s0)
8000c7f4:	20000713          	li	a4,512
8000c7f8:	2807f793          	andi	a5,a5,640
8000c7fc:	00e78563          	beq	a5,a4,8000c806 <__swsetup_r+0x8c>
8000c800:	85a2                	mv	a1,s0
8000c802:	8526                	mv	a0,s1
8000c804:	337d                	jal	8000c5b2 <__smakebuf_r>
8000c806:	00c41783          	lh	a5,12(s0)
8000c80a:	0017f713          	andi	a4,a5,1
8000c80e:	cb19                	beqz	a4,8000c824 <__swsetup_r+0xaa>
8000c810:	4858                	lw	a4,20(s0)
8000c812:	00042423          	sw	zero,8(s0)
8000c816:	40e00733          	neg	a4,a4
8000c81a:	cc18                	sw	a4,24(s0)
8000c81c:	4818                	lw	a4,16(s0)
8000c81e:	cb11                	beqz	a4,8000c832 <__swsetup_r+0xb8>
8000c820:	4501                	li	a0,0
8000c822:	b779                	j	8000c7b0 <__swsetup_r+0x36>
8000c824:	0027f713          	andi	a4,a5,2
8000c828:	4681                	li	a3,0
8000c82a:	e311                	bnez	a4,8000c82e <__swsetup_r+0xb4>
8000c82c:	4854                	lw	a3,20(s0)
8000c82e:	c414                	sw	a3,8(s0)
8000c830:	b7f5                	j	8000c81c <__swsetup_r+0xa2>
8000c832:	0807f713          	andi	a4,a5,128
8000c836:	d76d                	beqz	a4,8000c820 <__swsetup_r+0xa6>
8000c838:	b7bd                	j	8000c7a6 <__swsetup_r+0x2c>

8000c83a <strncmp>:
8000c83a:	c605                	beqz	a2,8000c862 <strncmp+0x28>
8000c83c:	167d                	addi	a2,a2,-1 # 7fffffff <__share_mem_end__+0x7ee7ffff>
8000c83e:	4701                	li	a4,0
8000c840:	00e507b3          	add	a5,a0,a4
8000c844:	00e586b3          	add	a3,a1,a4
8000c848:	0007c783          	lbu	a5,0(a5)
8000c84c:	0006c683          	lbu	a3,0(a3)
8000c850:	00d79663          	bne	a5,a3,8000c85c <strncmp+0x22>
8000c854:	00c70463          	beq	a4,a2,8000c85c <strncmp+0x22>
8000c858:	0705                	addi	a4,a4,1 # 1001 <__ramfunc_end__+0xbc9>
8000c85a:	f3fd                	bnez	a5,8000c840 <strncmp+0x6>
8000c85c:	40d78533          	sub	a0,a5,a3
8000c860:	8082                	ret
8000c862:	4501                	li	a0,0
8000c864:	8082                	ret

8000c866 <_raise_r>:
8000c866:	47fd                	li	a5,31
8000c868:	00b7f663          	bgeu	a5,a1,8000c874 <_raise_r+0xe>
8000c86c:	47d9                	li	a5,22
8000c86e:	c11c                	sw	a5,0(a0)
8000c870:	557d                	li	a0,-1
8000c872:	8082                	ret
8000c874:	5d5c                	lw	a5,60(a0)
8000c876:	1101                	addi	sp,sp,-32
8000c878:	cc22                	sw	s0,24(sp)
8000c87a:	ce06                	sw	ra,28(sp)
8000c87c:	862e                	mv	a2,a1
8000c87e:	842a                	mv	s0,a0
8000c880:	c791                	beqz	a5,8000c88c <_raise_r+0x26>
8000c882:	00259713          	slli	a4,a1,0x2
8000c886:	97ba                	add	a5,a5,a4
8000c888:	4398                	lw	a4,0(a5)
8000c88a:	eb19                	bnez	a4,8000c8a0 <_raise_r+0x3a>
8000c88c:	8522                	mv	a0,s0
8000c88e:	c632                	sw	a2,12(sp)
8000c890:	2a89                	jal	8000c9e2 <_getpid_r>
8000c892:	85aa                	mv	a1,a0
8000c894:	8522                	mv	a0,s0
8000c896:	4462                	lw	s0,24(sp)
8000c898:	4632                	lw	a2,12(sp)
8000c89a:	40f2                	lw	ra,28(sp)
8000c89c:	6105                	addi	sp,sp,32
8000c89e:	aa19                	j	8000c9b4 <_kill_r>
8000c8a0:	4505                	li	a0,1
8000c8a2:	00a71763          	bne	a4,a0,8000c8b0 <_raise_r+0x4a>
8000c8a6:	4501                	li	a0,0
8000c8a8:	40f2                	lw	ra,28(sp)
8000c8aa:	4462                	lw	s0,24(sp)
8000c8ac:	6105                	addi	sp,sp,32
8000c8ae:	8082                	ret
8000c8b0:	56fd                	li	a3,-1
8000c8b2:	00d71563          	bne	a4,a3,8000c8bc <_raise_r+0x56>
8000c8b6:	47d9                	li	a5,22
8000c8b8:	c01c                	sw	a5,0(s0)
8000c8ba:	b7fd                	j	8000c8a8 <_raise_r+0x42>
8000c8bc:	0007a023          	sw	zero,0(a5)
8000c8c0:	852e                	mv	a0,a1
8000c8c2:	9702                	jalr	a4
8000c8c4:	b7cd                	j	8000c8a6 <_raise_r+0x40>

8000c8c6 <raise>:
8000c8c6:	85aa                	mv	a1,a0
8000c8c8:	9c41a503          	lw	a0,-1596(gp) # 10801c4 <_impure_ptr>
8000c8cc:	bf69                	j	8000c866 <_raise_r>

8000c8ce <_close_r>:
8000c8ce:	1141                	addi	sp,sp,-16
8000c8d0:	c422                	sw	s0,8(sp)
8000c8d2:	c226                	sw	s1,4(sp)
8000c8d4:	84aa                	mv	s1,a0
8000c8d6:	852e                	mv	a0,a1
8000c8d8:	c606                	sw	ra,12(sp)
8000c8da:	b001ae23          	sw	zero,-1252(gp) # 108031c <errno>
8000c8de:	1d7000ef          	jal	8000d2b4 <_close>
8000c8e2:	57fd                	li	a5,-1
8000c8e4:	00f51663          	bne	a0,a5,8000c8f0 <_close_r+0x22>
8000c8e8:	b1c1a783          	lw	a5,-1252(gp) # 108031c <errno>
8000c8ec:	c391                	beqz	a5,8000c8f0 <_close_r+0x22>
8000c8ee:	c09c                	sw	a5,0(s1)
8000c8f0:	40b2                	lw	ra,12(sp)
8000c8f2:	4422                	lw	s0,8(sp)
8000c8f4:	4492                	lw	s1,4(sp)
8000c8f6:	0141                	addi	sp,sp,16
8000c8f8:	8082                	ret

8000c8fa <_fstat_r>:
8000c8fa:	1141                	addi	sp,sp,-16
8000c8fc:	c422                	sw	s0,8(sp)
8000c8fe:	c226                	sw	s1,4(sp)
8000c900:	84aa                	mv	s1,a0
8000c902:	852e                	mv	a0,a1
8000c904:	85b2                	mv	a1,a2
8000c906:	c606                	sw	ra,12(sp)
8000c908:	b001ae23          	sw	zero,-1252(gp) # 108031c <errno>
8000c90c:	a55fb0ef          	jal	80008360 <_fstat>
8000c910:	57fd                	li	a5,-1
8000c912:	00f51663          	bne	a0,a5,8000c91e <_fstat_r+0x24>
8000c916:	b1c1a783          	lw	a5,-1252(gp) # 108031c <errno>
8000c91a:	c391                	beqz	a5,8000c91e <_fstat_r+0x24>
8000c91c:	c09c                	sw	a5,0(s1)
8000c91e:	40b2                	lw	ra,12(sp)
8000c920:	4422                	lw	s0,8(sp)
8000c922:	4492                	lw	s1,4(sp)
8000c924:	0141                	addi	sp,sp,16
8000c926:	8082                	ret

8000c928 <_isatty_r>:
8000c928:	1141                	addi	sp,sp,-16
8000c92a:	c422                	sw	s0,8(sp)
8000c92c:	c226                	sw	s1,4(sp)
8000c92e:	84aa                	mv	s1,a0
8000c930:	852e                	mv	a0,a1
8000c932:	c606                	sw	ra,12(sp)
8000c934:	b001ae23          	sw	zero,-1252(gp) # 108031c <errno>
8000c938:	1cd000ef          	jal	8000d304 <_isatty>
8000c93c:	57fd                	li	a5,-1
8000c93e:	00f51663          	bne	a0,a5,8000c94a <_isatty_r+0x22>
8000c942:	b1c1a783          	lw	a5,-1252(gp) # 108031c <errno>
8000c946:	c391                	beqz	a5,8000c94a <_isatty_r+0x22>
8000c948:	c09c                	sw	a5,0(s1)
8000c94a:	40b2                	lw	ra,12(sp)
8000c94c:	4422                	lw	s0,8(sp)
8000c94e:	4492                	lw	s1,4(sp)
8000c950:	0141                	addi	sp,sp,16
8000c952:	8082                	ret

8000c954 <_lseek_r>:
8000c954:	1141                	addi	sp,sp,-16
8000c956:	c422                	sw	s0,8(sp)
8000c958:	c226                	sw	s1,4(sp)
8000c95a:	84aa                	mv	s1,a0
8000c95c:	852e                	mv	a0,a1
8000c95e:	85b2                	mv	a1,a2
8000c960:	8636                	mv	a2,a3
8000c962:	c606                	sw	ra,12(sp)
8000c964:	b001ae23          	sw	zero,-1252(gp) # 108031c <errno>
8000c968:	1d1000ef          	jal	8000d338 <_lseek>
8000c96c:	57fd                	li	a5,-1
8000c96e:	00f51663          	bne	a0,a5,8000c97a <_lseek_r+0x26>
8000c972:	b1c1a783          	lw	a5,-1252(gp) # 108031c <errno>
8000c976:	c391                	beqz	a5,8000c97a <_lseek_r+0x26>
8000c978:	c09c                	sw	a5,0(s1)
8000c97a:	40b2                	lw	ra,12(sp)
8000c97c:	4422                	lw	s0,8(sp)
8000c97e:	4492                	lw	s1,4(sp)
8000c980:	0141                	addi	sp,sp,16
8000c982:	8082                	ret

8000c984 <_read_r>:
8000c984:	1141                	addi	sp,sp,-16
8000c986:	c422                	sw	s0,8(sp)
8000c988:	c226                	sw	s1,4(sp)
8000c98a:	84aa                	mv	s1,a0
8000c98c:	852e                	mv	a0,a1
8000c98e:	85b2                	mv	a1,a2
8000c990:	8636                	mv	a2,a3
8000c992:	c606                	sw	ra,12(sp)
8000c994:	b001ae23          	sw	zero,-1252(gp) # 108031c <errno>
8000c998:	9a3fb0ef          	jal	8000833a <_read>
8000c99c:	57fd                	li	a5,-1
8000c99e:	00f51663          	bne	a0,a5,8000c9aa <_read_r+0x26>
8000c9a2:	b1c1a783          	lw	a5,-1252(gp) # 108031c <errno>
8000c9a6:	c391                	beqz	a5,8000c9aa <_read_r+0x26>
8000c9a8:	c09c                	sw	a5,0(s1)
8000c9aa:	40b2                	lw	ra,12(sp)
8000c9ac:	4422                	lw	s0,8(sp)
8000c9ae:	4492                	lw	s1,4(sp)
8000c9b0:	0141                	addi	sp,sp,16
8000c9b2:	8082                	ret

8000c9b4 <_kill_r>:
8000c9b4:	1141                	addi	sp,sp,-16
8000c9b6:	c422                	sw	s0,8(sp)
8000c9b8:	c226                	sw	s1,4(sp)
8000c9ba:	84aa                	mv	s1,a0
8000c9bc:	852e                	mv	a0,a1
8000c9be:	85b2                	mv	a1,a2
8000c9c0:	c606                	sw	ra,12(sp)
8000c9c2:	b001ae23          	sw	zero,-1252(gp) # 108031c <errno>
8000c9c6:	15f000ef          	jal	8000d324 <_kill>
8000c9ca:	57fd                	li	a5,-1
8000c9cc:	00f51663          	bne	a0,a5,8000c9d8 <_kill_r+0x24>
8000c9d0:	b1c1a783          	lw	a5,-1252(gp) # 108031c <errno>
8000c9d4:	c391                	beqz	a5,8000c9d8 <_kill_r+0x24>
8000c9d6:	c09c                	sw	a5,0(s1)
8000c9d8:	40b2                	lw	ra,12(sp)
8000c9da:	4422                	lw	s0,8(sp)
8000c9dc:	4492                	lw	s1,4(sp)
8000c9de:	0141                	addi	sp,sp,16
8000c9e0:	8082                	ret

8000c9e2 <_getpid_r>:
8000c9e2:	11f0006f          	j	8000d300 <_getpid>

8000c9e6 <_sbrk_r>:
8000c9e6:	1141                	addi	sp,sp,-16
8000c9e8:	c422                	sw	s0,8(sp)
8000c9ea:	c226                	sw	s1,4(sp)
8000c9ec:	84aa                	mv	s1,a0
8000c9ee:	852e                	mv	a0,a1
8000c9f0:	c606                	sw	ra,12(sp)
8000c9f2:	b001ae23          	sw	zero,-1252(gp) # 108031c <errno>
8000c9f6:	ff0fb0ef          	jal	800081e6 <_sbrk>
8000c9fa:	57fd                	li	a5,-1
8000c9fc:	00f51663          	bne	a0,a5,8000ca08 <_sbrk_r+0x22>
8000ca00:	b1c1a783          	lw	a5,-1252(gp) # 108031c <errno>
8000ca04:	c391                	beqz	a5,8000ca08 <_sbrk_r+0x22>
8000ca06:	c09c                	sw	a5,0(s1)
8000ca08:	40b2                	lw	ra,12(sp)
8000ca0a:	4422                	lw	s0,8(sp)
8000ca0c:	4492                	lw	s1,4(sp)
8000ca0e:	0141                	addi	sp,sp,16
8000ca10:	8082                	ret

8000ca12 <_write_r>:
8000ca12:	1141                	addi	sp,sp,-16
8000ca14:	c422                	sw	s0,8(sp)
8000ca16:	c226                	sw	s1,4(sp)
8000ca18:	84aa                	mv	s1,a0
8000ca1a:	852e                	mv	a0,a1
8000ca1c:	85b2                	mv	a1,a2
8000ca1e:	8636                	mv	a2,a3
8000ca20:	c606                	sw	ra,12(sp)
8000ca22:	b001ae23          	sw	zero,-1252(gp) # 108031c <errno>
8000ca26:	8a1fb0ef          	jal	800082c6 <_write>
8000ca2a:	57fd                	li	a5,-1
8000ca2c:	00f51663          	bne	a0,a5,8000ca38 <_write_r+0x26>
8000ca30:	b1c1a783          	lw	a5,-1252(gp) # 108031c <errno>
8000ca34:	c391                	beqz	a5,8000ca38 <_write_r+0x26>
8000ca36:	c09c                	sw	a5,0(s1)
8000ca38:	40b2                	lw	ra,12(sp)
8000ca3a:	4422                	lw	s0,8(sp)
8000ca3c:	4492                	lw	s1,4(sp)
8000ca3e:	0141                	addi	sp,sp,16
8000ca40:	8082                	ret

8000ca42 <nan>:
8000ca42:	8000e7b7          	lui	a5,0x8000e
8000ca46:	fc07a503          	lw	a0,-64(a5) # 8000dfc0 <_ctype_+0x188>
8000ca4a:	fc47a583          	lw	a1,-60(a5)
8000ca4e:	8082                	ret

8000ca50 <_calloc_r>:
8000ca50:	02c5b7b3          	mulhu	a5,a1,a2
8000ca54:	1101                	addi	sp,sp,-32
8000ca56:	ce06                	sw	ra,28(sp)
8000ca58:	cc22                	sw	s0,24(sp)
8000ca5a:	02c58633          	mul	a2,a1,a2
8000ca5e:	cb89                	beqz	a5,8000ca70 <_calloc_r+0x20>
8000ca60:	47b1                	li	a5,12
8000ca62:	c11c                	sw	a5,0(a0)
8000ca64:	4401                	li	s0,0
8000ca66:	40f2                	lw	ra,28(sp)
8000ca68:	8522                	mv	a0,s0
8000ca6a:	4462                	lw	s0,24(sp)
8000ca6c:	6105                	addi	sp,sp,32
8000ca6e:	8082                	ret
8000ca70:	85b2                	mv	a1,a2
8000ca72:	c632                	sw	a2,12(sp)
8000ca74:	fdcfd0ef          	jal	8000a250 <_malloc_r>
8000ca78:	842a                	mv	s0,a0
8000ca7a:	d575                	beqz	a0,8000ca66 <_calloc_r+0x16>
8000ca7c:	4632                	lw	a2,12(sp)
8000ca7e:	4581                	li	a1,0
8000ca80:	b20f80ef          	jal	80004da0 <memset>
8000ca84:	b7cd                	j	8000ca66 <_calloc_r+0x16>

8000ca86 <rshift>:
8000ca86:	01052803          	lw	a6,16(a0)
8000ca8a:	01450693          	addi	a3,a0,20
8000ca8e:	4055de13          	srai	t3,a1,0x5
8000ca92:	87b6                	mv	a5,a3
8000ca94:	070e5263          	bge	t3,a6,8000caf8 <rshift+0x72>
8000ca98:	00281893          	slli	a7,a6,0x2
8000ca9c:	002e1793          	slli	a5,t3,0x2
8000caa0:	89fd                	andi	a1,a1,31
8000caa2:	98b6                	add	a7,a7,a3
8000caa4:	97b6                	add	a5,a5,a3
8000caa6:	e185                	bnez	a1,8000cac6 <rshift+0x40>
8000caa8:	8636                	mv	a2,a3
8000caaa:	873e                	mv	a4,a5
8000caac:	07176d63          	bltu	a4,a7,8000cb26 <rshift+0xa0>
8000cab0:	ffd78713          	addi	a4,a5,-3
8000cab4:	4781                	li	a5,0
8000cab6:	00e8e663          	bltu	a7,a4,8000cac2 <rshift+0x3c>
8000caba:	41c80833          	sub	a6,a6,t3
8000cabe:	00281793          	slli	a5,a6,0x2
8000cac2:	97b6                	add	a5,a5,a3
8000cac4:	a815                	j	8000caf8 <rshift+0x72>
8000cac6:	4390                	lw	a2,0(a5)
8000cac8:	02000e93          	li	t4,32
8000cacc:	40be8eb3          	sub	t4,t4,a1
8000cad0:	00b65633          	srl	a2,a2,a1
8000cad4:	00478713          	addi	a4,a5,4
8000cad8:	8f36                	mv	t5,a3
8000cada:	03176863          	bltu	a4,a7,8000cb0a <rshift+0x84>
8000cade:	00178713          	addi	a4,a5,1
8000cae2:	4781                	li	a5,0
8000cae4:	00e8e663          	bltu	a7,a4,8000caf0 <rshift+0x6a>
8000cae8:	41c807b3          	sub	a5,a6,t3
8000caec:	078a                	slli	a5,a5,0x2
8000caee:	17f1                	addi	a5,a5,-4
8000caf0:	97b6                	add	a5,a5,a3
8000caf2:	c390                	sw	a2,0(a5)
8000caf4:	c211                	beqz	a2,8000caf8 <rshift+0x72>
8000caf6:	0791                	addi	a5,a5,4
8000caf8:	40d78733          	sub	a4,a5,a3
8000cafc:	8709                	srai	a4,a4,0x2
8000cafe:	c918                	sw	a4,16(a0)
8000cb00:	00d79463          	bne	a5,a3,8000cb08 <rshift+0x82>
8000cb04:	00052a23          	sw	zero,20(a0)
8000cb08:	8082                	ret
8000cb0a:	00072303          	lw	t1,0(a4)
8000cb0e:	0f11                	addi	t5,t5,4
8000cb10:	01d31333          	sll	t1,t1,t4
8000cb14:	00c36633          	or	a2,t1,a2
8000cb18:	fecf2e23          	sw	a2,-4(t5)
8000cb1c:	4310                	lw	a2,0(a4)
8000cb1e:	0711                	addi	a4,a4,4
8000cb20:	00b65633          	srl	a2,a2,a1
8000cb24:	bf5d                	j	8000cada <rshift+0x54>
8000cb26:	430c                	lw	a1,0(a4)
8000cb28:	0711                	addi	a4,a4,4
8000cb2a:	c20c                	sw	a1,0(a2)
8000cb2c:	0611                	addi	a2,a2,4
8000cb2e:	bfbd                	j	8000caac <rshift+0x26>

8000cb30 <__hexdig_fun>:
8000cb30:	fd050713          	addi	a4,a0,-48
8000cb34:	0ff77713          	zext.b	a4,a4
8000cb38:	46a5                	li	a3,9
8000cb3a:	87aa                	mv	a5,a0
8000cb3c:	00e6e763          	bltu	a3,a4,8000cb4a <__hexdig_fun+0x1a>
8000cb40:	fe050793          	addi	a5,a0,-32
8000cb44:	0ff7f513          	zext.b	a0,a5
8000cb48:	8082                	ret
8000cb4a:	f9f50713          	addi	a4,a0,-97
8000cb4e:	0ff77713          	zext.b	a4,a4
8000cb52:	4695                	li	a3,5
8000cb54:	00e6e563          	bltu	a3,a4,8000cb5e <__hexdig_fun+0x2e>
8000cb58:	fb950793          	addi	a5,a0,-71
8000cb5c:	b7e5                	j	8000cb44 <__hexdig_fun+0x14>
8000cb5e:	fbf50713          	addi	a4,a0,-65
8000cb62:	0ff77713          	zext.b	a4,a4
8000cb66:	4501                	li	a0,0
8000cb68:	fee6e0e3          	bltu	a3,a4,8000cb48 <__hexdig_fun+0x18>
8000cb6c:	fd978793          	addi	a5,a5,-39
8000cb70:	bfd1                	j	8000cb44 <__hexdig_fun+0x14>

8000cb72 <__gethex>:
8000cb72:	715d                	addi	sp,sp,-80
8000cb74:	c4a2                	sw	s0,72(sp)
8000cb76:	4180                	lw	s0,0(a1)
8000cb78:	dc52                	sw	s4,56(sp)
8000cb7a:	da56                	sw	s5,52(sp)
8000cb7c:	d65e                	sw	s7,44(sp)
8000cb7e:	d06a                	sw	s10,32(sp)
8000cb80:	8bba                	mv	s7,a4
8000cb82:	8abe                	mv	s5,a5
8000cb84:	c686                	sw	ra,76(sp)
8000cb86:	c2a6                	sw	s1,68(sp)
8000cb88:	c0ca                	sw	s2,64(sp)
8000cb8a:	de4e                	sw	s3,60(sp)
8000cb8c:	d85a                	sw	s6,48(sp)
8000cb8e:	d462                	sw	s8,40(sp)
8000cb90:	d266                	sw	s9,36(sp)
8000cb92:	ce6e                	sw	s11,28(sp)
8000cb94:	c22a                	sw	a0,4(sp)
8000cb96:	8d2e                	mv	s10,a1
8000cb98:	8a32                	mv	s4,a2
8000cb9a:	c436                	sw	a3,8(sp)
8000cb9c:	00240793          	addi	a5,s0,2
8000cba0:	03000713          	li	a4,48
8000cba4:	89be                	mv	s3,a5
8000cba6:	0007c503          	lbu	a0,0(a5)
8000cbaa:	0785                	addi	a5,a5,1
8000cbac:	fee50ce3          	beq	a0,a4,8000cba4 <__gethex+0x32>
8000cbb0:	40898433          	sub	s0,s3,s0
8000cbb4:	1479                	addi	s0,s0,-2
8000cbb6:	3fad                	jal	8000cb30 <__hexdig_fun>
8000cbb8:	e935                	bnez	a0,8000cc2c <__gethex+0xba>
8000cbba:	8000e5b7          	lui	a1,0x8000e
8000cbbe:	4605                	li	a2,1
8000cbc0:	b6858593          	addi	a1,a1,-1176 # 8000db68 <s_wdgs+0x190>
8000cbc4:	854e                	mv	a0,s3
8000cbc6:	3995                	jal	8000c83a <strncmp>
8000cbc8:	84aa                	mv	s1,a0
8000cbca:	0e051163          	bnez	a0,8000ccac <__gethex+0x13a>
8000cbce:	0019c503          	lbu	a0,1(s3)
8000cbd2:	00198913          	addi	s2,s3,1
8000cbd6:	4c85                	li	s9,1
8000cbd8:	3fa1                	jal	8000cb30 <__hexdig_fun>
8000cbda:	cd39                	beqz	a0,8000cc38 <__gethex+0xc6>
8000cbdc:	89ca                	mv	s3,s2
8000cbde:	03000793          	li	a5,48
8000cbe2:	0009c503          	lbu	a0,0(s3)
8000cbe6:	00f50963          	beq	a0,a5,8000cbf8 <__gethex+0x86>
8000cbea:	3799                	jal	8000cb30 <__hexdig_fun>
8000cbec:	00153c93          	seqz	s9,a0
8000cbf0:	84ca                	mv	s1,s2
8000cbf2:	4405                	li	s0,1
8000cbf4:	894e                	mv	s2,s3
8000cbf6:	a021                	j	8000cbfe <__gethex+0x8c>
8000cbf8:	0985                	addi	s3,s3,1
8000cbfa:	b7e5                	j	8000cbe2 <__gethex+0x70>
8000cbfc:	0905                	addi	s2,s2,1
8000cbfe:	00094503          	lbu	a0,0(s2)
8000cc02:	373d                	jal	8000cb30 <__hexdig_fun>
8000cc04:	fd65                	bnez	a0,8000cbfc <__gethex+0x8a>
8000cc06:	8000e5b7          	lui	a1,0x8000e
8000cc0a:	4605                	li	a2,1
8000cc0c:	b6858593          	addi	a1,a1,-1176 # 8000db68 <s_wdgs+0x190>
8000cc10:	854a                	mv	a0,s2
8000cc12:	3125                	jal	8000c83a <strncmp>
8000cc14:	e10d                	bnez	a0,8000cc36 <__gethex+0xc4>
8000cc16:	e499                	bnez	s1,8000cc24 <__gethex+0xb2>
8000cc18:	0905                	addi	s2,s2,1
8000cc1a:	84ca                	mv	s1,s2
8000cc1c:	00094503          	lbu	a0,0(s2)
8000cc20:	3f01                	jal	8000cb30 <__hexdig_fun>
8000cc22:	e901                	bnez	a0,8000cc32 <__gethex+0xc0>
8000cc24:	412484b3          	sub	s1,s1,s2
8000cc28:	048a                	slli	s1,s1,0x2
8000cc2a:	a039                	j	8000cc38 <__gethex+0xc6>
8000cc2c:	4c81                	li	s9,0
8000cc2e:	4481                	li	s1,0
8000cc30:	b7d1                	j	8000cbf4 <__gethex+0x82>
8000cc32:	0905                	addi	s2,s2,1
8000cc34:	b7e5                	j	8000cc1c <__gethex+0xaa>
8000cc36:	f4fd                	bnez	s1,8000cc24 <__gethex+0xb2>
8000cc38:	00094783          	lbu	a5,0(s2)
8000cc3c:	05000713          	li	a4,80
8000cc40:	0df7f793          	andi	a5,a5,223
8000cc44:	02e79963          	bne	a5,a4,8000cc76 <__gethex+0x104>
8000cc48:	00194783          	lbu	a5,1(s2)
8000cc4c:	02b00713          	li	a4,43
8000cc50:	06e78263          	beq	a5,a4,8000ccb4 <__gethex+0x142>
8000cc54:	02d00713          	li	a4,45
8000cc58:	06e78263          	beq	a5,a4,8000ccbc <__gethex+0x14a>
8000cc5c:	00190d93          	addi	s11,s2,1
8000cc60:	4c01                	li	s8,0
8000cc62:	000dc503          	lbu	a0,0(s11) # 3fe00000 <__share_mem_end__+0x3ec80000>
8000cc66:	35e9                	jal	8000cb30 <__hexdig_fun>
8000cc68:	fff50713          	addi	a4,a0,-1
8000cc6c:	0ff77713          	zext.b	a4,a4
8000cc70:	46e1                	li	a3,24
8000cc72:	04e6f763          	bgeu	a3,a4,8000ccc0 <__gethex+0x14e>
8000cc76:	8dca                	mv	s11,s2
8000cc78:	01bd2023          	sw	s11,0(s10) # 3ff00000 <__share_mem_end__+0x3ed80000>
8000cc7c:	060c8b63          	beqz	s9,8000ccf2 <__gethex+0x180>
8000cc80:	00143913          	seqz	s2,s0
8000cc84:	41200933          	neg	s2,s2
8000cc88:	00697913          	andi	s2,s2,6
8000cc8c:	40b6                	lw	ra,76(sp)
8000cc8e:	4426                	lw	s0,72(sp)
8000cc90:	4496                	lw	s1,68(sp)
8000cc92:	59f2                	lw	s3,60(sp)
8000cc94:	5a62                	lw	s4,56(sp)
8000cc96:	5ad2                	lw	s5,52(sp)
8000cc98:	5b42                	lw	s6,48(sp)
8000cc9a:	5bb2                	lw	s7,44(sp)
8000cc9c:	5c22                	lw	s8,40(sp)
8000cc9e:	5c92                	lw	s9,36(sp)
8000cca0:	5d02                	lw	s10,32(sp)
8000cca2:	4df2                	lw	s11,28(sp)
8000cca4:	854a                	mv	a0,s2
8000cca6:	4906                	lw	s2,64(sp)
8000cca8:	6161                	addi	sp,sp,80
8000ccaa:	8082                	ret
8000ccac:	894e                	mv	s2,s3
8000ccae:	4481                	li	s1,0
8000ccb0:	4c85                	li	s9,1
8000ccb2:	b759                	j	8000cc38 <__gethex+0xc6>
8000ccb4:	4c01                	li	s8,0
8000ccb6:	00290d93          	addi	s11,s2,2
8000ccba:	b765                	j	8000cc62 <__gethex+0xf0>
8000ccbc:	4c05                	li	s8,1
8000ccbe:	bfe5                	j	8000ccb6 <__gethex+0x144>
8000ccc0:	ff050b13          	addi	s6,a0,-16
8000ccc4:	001dc503          	lbu	a0,1(s11)
8000ccc8:	0d85                	addi	s11,s11,1
8000ccca:	359d                	jal	8000cb30 <__hexdig_fun>
8000cccc:	fff50713          	addi	a4,a0,-1
8000ccd0:	0ff77713          	zext.b	a4,a4
8000ccd4:	46e1                	li	a3,24
8000ccd6:	4629                	li	a2,10
8000ccd8:	00e6f863          	bgeu	a3,a4,8000cce8 <__gethex+0x176>
8000ccdc:	000c0463          	beqz	s8,8000cce4 <__gethex+0x172>
8000cce0:	41600b33          	neg	s6,s6
8000cce4:	94da                	add	s1,s1,s6
8000cce6:	bf49                	j	8000cc78 <__gethex+0x106>
8000cce8:	02cb0b33          	mul	s6,s6,a2
8000ccec:	9b2a                	add	s6,s6,a0
8000ccee:	1b41                	addi	s6,s6,-16
8000ccf0:	bfd1                	j	8000ccc4 <__gethex+0x152>
8000ccf2:	413907b3          	sub	a5,s2,s3
8000ccf6:	17fd                	addi	a5,a5,-1
8000ccf8:	4581                	li	a1,0
8000ccfa:	471d                	li	a4,7
8000ccfc:	02f74463          	blt	a4,a5,8000cd24 <__gethex+0x1b2>
8000cd00:	4512                	lw	a0,4(sp)
8000cd02:	e74fd0ef          	jal	8000a376 <_Balloc>
8000cd06:	842a                	mv	s0,a0
8000cd08:	e10d                	bnez	a0,8000cd2a <__gethex+0x1b8>
8000cd0a:	8000e6b7          	lui	a3,0x8000e
8000cd0e:	af468693          	addi	a3,a3,-1292 # 8000daf4 <s_wdgs+0x11c>
8000cd12:	4601                	li	a2,0
8000cd14:	0e400593          	li	a1,228
8000cd18:	8000e537          	lui	a0,0x8000e
8000cd1c:	b9c50513          	addi	a0,a0,-1124 # 8000db9c <s_wdgs+0x1c4>
8000cd20:	e54fb0ef          	jal	80008374 <__assert_func>
8000cd24:	0585                	addi	a1,a1,1
8000cd26:	8785                	srai	a5,a5,0x1
8000cd28:	bfd1                	j	8000ccfc <__gethex+0x18a>
8000cd2a:	8000e737          	lui	a4,0x8000e
8000cd2e:	01450b13          	addi	s6,a0,20
8000cd32:	b6870793          	addi	a5,a4,-1176 # 8000db68 <s_wdgs+0x190>
8000cd36:	8d5a                	mv	s10,s6
8000cd38:	4c01                	li	s8,0
8000cd3a:	4d81                	li	s11,0
8000cd3c:	02000c93          	li	s9,32
8000cd40:	c63e                	sw	a5,12(sp)
8000cd42:	0929e663          	bltu	s3,s2,8000cdce <__gethex+0x25c>
8000cd46:	004d0913          	addi	s2,s10,4
8000cd4a:	41690933          	sub	s2,s2,s6
8000cd4e:	40295793          	srai	a5,s2,0x2
8000cd52:	01bd2023          	sw	s11,0(s10)
8000cd56:	c81c                	sw	a5,16(s0)
8000cd58:	856e                	mv	a0,s11
8000cd5a:	885fd0ef          	jal	8000a5de <__hi0bits>
8000cd5e:	000a2983          	lw	s3,0(s4)
8000cd62:	090e                	slli	s2,s2,0x3
8000cd64:	40a90933          	sub	s2,s2,a0
8000cd68:	0b29d163          	bge	s3,s2,8000ce0a <__gethex+0x298>
8000cd6c:	41390933          	sub	s2,s2,s3
8000cd70:	85ca                	mv	a1,s2
8000cd72:	8522                	mv	a0,s0
8000cd74:	8c2fe0ef          	jal	8000ae36 <__any_on>
8000cd78:	8caa                	mv	s9,a0
8000cd7a:	c90d                	beqz	a0,8000cdac <__gethex+0x23a>
8000cd7c:	fff90693          	addi	a3,s2,-1
8000cd80:	4056d793          	srai	a5,a3,0x5
8000cd84:	078a                	slli	a5,a5,0x2
8000cd86:	97da                	add	a5,a5,s6
8000cd88:	439c                	lw	a5,0(a5)
8000cd8a:	4705                	li	a4,1
8000cd8c:	00d71633          	sll	a2,a4,a3
8000cd90:	8ff1                	and	a5,a5,a2
8000cd92:	8cba                	mv	s9,a4
8000cd94:	cf81                	beqz	a5,8000cdac <__gethex+0x23a>
8000cd96:	4c89                	li	s9,2
8000cd98:	00d75a63          	bge	a4,a3,8000cdac <__gethex+0x23a>
8000cd9c:	ffe90593          	addi	a1,s2,-2
8000cda0:	8522                	mv	a0,s0
8000cda2:	894fe0ef          	jal	8000ae36 <__any_on>
8000cda6:	00a03cb3          	snez	s9,a0
8000cdaa:	0c89                	addi	s9,s9,2
8000cdac:	85ca                	mv	a1,s2
8000cdae:	8522                	mv	a0,s0
8000cdb0:	39d9                	jal	8000ca86 <rshift>
8000cdb2:	94ca                	add	s1,s1,s2
8000cdb4:	008a2783          	lw	a5,8(s4)
8000cdb8:	0697d963          	bge	a5,s1,8000ce2a <__gethex+0x2b8>
8000cdbc:	4512                	lw	a0,4(sp)
8000cdbe:	85a2                	mv	a1,s0
8000cdc0:	0a300913          	li	s2,163
8000cdc4:	e4efd0ef          	jal	8000a412 <_Bfree>
8000cdc8:	000ba023          	sw	zero,0(s7)
8000cdcc:	b5c1                	j	8000cc8c <__gethex+0x11a>
8000cdce:	fff94703          	lbu	a4,-1(s2)
8000cdd2:	197d                	addi	s2,s2,-1
8000cdd4:	fd270713          	addi	a4,a4,-46
8000cdd8:	eb01                	bnez	a4,8000cde8 <__gethex+0x276>
8000cdda:	01396763          	bltu	s2,s3,8000cde8 <__gethex+0x276>
8000cdde:	45b2                	lw	a1,12(sp)
8000cde0:	4605                	li	a2,1
8000cde2:	854a                	mv	a0,s2
8000cde4:	3c99                	jal	8000c83a <strncmp>
8000cde6:	dd31                	beqz	a0,8000cd42 <__gethex+0x1d0>
8000cde8:	019c1763          	bne	s8,s9,8000cdf6 <__gethex+0x284>
8000cdec:	01bd2023          	sw	s11,0(s10)
8000cdf0:	4c01                	li	s8,0
8000cdf2:	0d11                	addi	s10,s10,4
8000cdf4:	4d81                	li	s11,0
8000cdf6:	00094503          	lbu	a0,0(s2)
8000cdfa:	3b1d                	jal	8000cb30 <__hexdig_fun>
8000cdfc:	893d                	andi	a0,a0,15
8000cdfe:	01851533          	sll	a0,a0,s8
8000ce02:	00adedb3          	or	s11,s11,a0
8000ce06:	0c11                	addi	s8,s8,4
8000ce08:	bf2d                	j	8000cd42 <__gethex+0x1d0>
8000ce0a:	4c81                	li	s9,0
8000ce0c:	fb3954e3          	bge	s2,s3,8000cdb4 <__gethex+0x242>
8000ce10:	4512                	lw	a0,4(sp)
8000ce12:	41298933          	sub	s2,s3,s2
8000ce16:	85a2                	mv	a1,s0
8000ce18:	864a                	mv	a2,s2
8000ce1a:	b07fd0ef          	jal	8000a920 <__lshift>
8000ce1e:	842a                	mv	s0,a0
8000ce20:	412484b3          	sub	s1,s1,s2
8000ce24:	01450b13          	addi	s6,a0,20
8000ce28:	b771                	j	8000cdb4 <__gethex+0x242>
8000ce2a:	004a2783          	lw	a5,4(s4)
8000ce2e:	0ef4d263          	bge	s1,a5,8000cf12 <__gethex+0x3a0>
8000ce32:	409784b3          	sub	s1,a5,s1
8000ce36:	0734c263          	blt	s1,s3,8000ce9a <__gethex+0x328>
8000ce3a:	00ca2783          	lw	a5,12(s4)
8000ce3e:	4709                	li	a4,2
8000ce40:	02e78f63          	beq	a5,a4,8000ce7e <__gethex+0x30c>
8000ce44:	470d                	li	a4,3
8000ce46:	04e78763          	beq	a5,a4,8000ce94 <__gethex+0x322>
8000ce4a:	4705                	li	a4,1
8000ce4c:	02e79b63          	bne	a5,a4,8000ce82 <__gethex+0x310>
8000ce50:	02999963          	bne	s3,s1,8000ce82 <__gethex+0x310>
8000ce54:	00f98863          	beq	s3,a5,8000ce64 <__gethex+0x2f2>
8000ce58:	fff98593          	addi	a1,s3,-1
8000ce5c:	8522                	mv	a0,s0
8000ce5e:	fd9fd0ef          	jal	8000ae36 <__any_on>
8000ce62:	c105                	beqz	a0,8000ce82 <__gethex+0x310>
8000ce64:	004a2783          	lw	a5,4(s4)
8000ce68:	4722                	lw	a4,8(sp)
8000ce6a:	06200913          	li	s2,98
8000ce6e:	c31c                	sw	a5,0(a4)
8000ce70:	4785                	li	a5,1
8000ce72:	c81c                	sw	a5,16(s0)
8000ce74:	00fb2023          	sw	a5,0(s6)
8000ce78:	008ba023          	sw	s0,0(s7)
8000ce7c:	bd01                	j	8000cc8c <__gethex+0x11a>
8000ce7e:	fe0a83e3          	beqz	s5,8000ce64 <__gethex+0x2f2>
8000ce82:	4512                	lw	a0,4(sp)
8000ce84:	85a2                	mv	a1,s0
8000ce86:	05000913          	li	s2,80
8000ce8a:	d88fd0ef          	jal	8000a412 <_Bfree>
8000ce8e:	000ba023          	sw	zero,0(s7)
8000ce92:	bbed                	j	8000cc8c <__gethex+0x11a>
8000ce94:	fe0a87e3          	beqz	s5,8000ce82 <__gethex+0x310>
8000ce98:	b7f1                	j	8000ce64 <__gethex+0x2f2>
8000ce9a:	fff48913          	addi	s2,s1,-1
8000ce9e:	060c9863          	bnez	s9,8000cf0e <__gethex+0x39c>
8000cea2:	00090763          	beqz	s2,8000ceb0 <__gethex+0x33e>
8000cea6:	85ca                	mv	a1,s2
8000cea8:	8522                	mv	a0,s0
8000ceaa:	f8dfd0ef          	jal	8000ae36 <__any_on>
8000ceae:	8caa                	mv	s9,a0
8000ceb0:	40595713          	srai	a4,s2,0x5
8000ceb4:	070a                	slli	a4,a4,0x2
8000ceb6:	975a                	add	a4,a4,s6
8000ceb8:	4318                	lw	a4,0(a4)
8000ceba:	4785                	li	a5,1
8000cebc:	012797b3          	sll	a5,a5,s2
8000cec0:	8ff9                	and	a5,a5,a4
8000cec2:	c399                	beqz	a5,8000cec8 <__gethex+0x356>
8000cec4:	002cec93          	ori	s9,s9,2
8000cec8:	85a6                	mv	a1,s1
8000ceca:	8522                	mv	a0,s0
8000cecc:	409989b3          	sub	s3,s3,s1
8000ced0:	3e5d                	jal	8000ca86 <rshift>
8000ced2:	004a2483          	lw	s1,4(s4)
8000ced6:	4909                	li	s2,2
8000ced8:	080c8a63          	beqz	s9,8000cf6c <__gethex+0x3fa>
8000cedc:	00ca2783          	lw	a5,12(s4)
8000cee0:	4709                	li	a4,2
8000cee2:	02e78a63          	beq	a5,a4,8000cf16 <__gethex+0x3a4>
8000cee6:	470d                	li	a4,3
8000cee8:	02e78a63          	beq	a5,a4,8000cf1c <__gethex+0x3aa>
8000ceec:	4705                	li	a4,1
8000ceee:	00e79d63          	bne	a5,a4,8000cf08 <__gethex+0x396>
8000cef2:	002cf793          	andi	a5,s9,2
8000cef6:	cb89                	beqz	a5,8000cf08 <__gethex+0x396>
8000cef8:	000b2783          	lw	a5,0(s6)
8000cefc:	00fcecb3          	or	s9,s9,a5
8000cf00:	00ecfcb3          	and	s9,s9,a4
8000cf04:	000c9e63          	bnez	s9,8000cf20 <__gethex+0x3ae>
8000cf08:	01096913          	ori	s2,s2,16
8000cf0c:	a085                	j	8000cf6c <__gethex+0x3fa>
8000cf0e:	4c85                	li	s9,1
8000cf10:	b745                	j	8000ceb0 <__gethex+0x33e>
8000cf12:	4905                	li	s2,1
8000cf14:	b7d1                	j	8000ced8 <__gethex+0x366>
8000cf16:	4785                	li	a5,1
8000cf18:	41578ab3          	sub	s5,a5,s5
8000cf1c:	fe0a86e3          	beqz	s5,8000cf08 <__gethex+0x396>
8000cf20:	01042b03          	lw	s6,16(s0)
8000cf24:	01440793          	addi	a5,s0,20
8000cf28:	567d                	li	a2,-1
8000cf2a:	002b1a93          	slli	s5,s6,0x2
8000cf2e:	015786b3          	add	a3,a5,s5
8000cf32:	4398                	lw	a4,0(a5)
8000cf34:	04c70163          	beq	a4,a2,8000cf76 <__gethex+0x404>
8000cf38:	0705                	addi	a4,a4,1
8000cf3a:	c398                	sw	a4,0(a5)
8000cf3c:	4709                	li	a4,2
8000cf3e:	01440793          	addi	a5,s0,20
8000cf42:	08e91863          	bne	s2,a4,8000cfd2 <__gethex+0x460>
8000cf46:	000a2703          	lw	a4,0(s4)
8000cf4a:	177d                	addi	a4,a4,-1
8000cf4c:	01371e63          	bne	a4,s3,8000cf68 <__gethex+0x3f6>
8000cf50:	4059d713          	srai	a4,s3,0x5
8000cf54:	070a                	slli	a4,a4,0x2
8000cf56:	97ba                	add	a5,a5,a4
8000cf58:	439c                	lw	a5,0(a5)
8000cf5a:	4705                	li	a4,1
8000cf5c:	013719b3          	sll	s3,a4,s3
8000cf60:	00f9f9b3          	and	s3,s3,a5
8000cf64:	0a099463          	bnez	s3,8000d00c <__gethex+0x49a>
8000cf68:	02096913          	ori	s2,s2,32
8000cf6c:	47a2                	lw	a5,8(sp)
8000cf6e:	008ba023          	sw	s0,0(s7)
8000cf72:	c384                	sw	s1,0(a5)
8000cf74:	bb21                	j	8000cc8c <__gethex+0x11a>
8000cf76:	0007a023          	sw	zero,0(a5)
8000cf7a:	0791                	addi	a5,a5,4
8000cf7c:	fad7ebe3          	bltu	a5,a3,8000cf32 <__gethex+0x3c0>
8000cf80:	441c                	lw	a5,8(s0)
8000cf82:	02fb4e63          	blt	s6,a5,8000cfbe <__gethex+0x44c>
8000cf86:	404c                	lw	a1,4(s0)
8000cf88:	4512                	lw	a0,4(sp)
8000cf8a:	0585                	addi	a1,a1,1
8000cf8c:	beafd0ef          	jal	8000a376 <_Balloc>
8000cf90:	8caa                	mv	s9,a0
8000cf92:	e909                	bnez	a0,8000cfa4 <__gethex+0x432>
8000cf94:	8000e6b7          	lui	a3,0x8000e
8000cf98:	af468693          	addi	a3,a3,-1292 # 8000daf4 <s_wdgs+0x11c>
8000cf9c:	4601                	li	a2,0
8000cf9e:	08400593          	li	a1,132
8000cfa2:	bb9d                	j	8000cd18 <__gethex+0x1a6>
8000cfa4:	4810                	lw	a2,16(s0)
8000cfa6:	00c40593          	addi	a1,s0,12
8000cfaa:	0531                	addi	a0,a0,12
8000cfac:	0609                	addi	a2,a2,2
8000cfae:	060a                	slli	a2,a2,0x2
8000cfb0:	e01f70ef          	jal	80004db0 <memcpy>
8000cfb4:	4512                	lw	a0,4(sp)
8000cfb6:	85a2                	mv	a1,s0
8000cfb8:	8466                	mv	s0,s9
8000cfba:	c58fd0ef          	jal	8000a412 <_Bfree>
8000cfbe:	481c                	lw	a5,16(s0)
8000cfc0:	00178713          	addi	a4,a5,1
8000cfc4:	0791                	addi	a5,a5,4
8000cfc6:	078a                	slli	a5,a5,0x2
8000cfc8:	c818                	sw	a4,16(s0)
8000cfca:	97a2                	add	a5,a5,s0
8000cfcc:	4705                	li	a4,1
8000cfce:	c3d8                	sw	a4,4(a5)
8000cfd0:	b7b5                	j	8000cf3c <__gethex+0x3ca>
8000cfd2:	4818                	lw	a4,16(s0)
8000cfd4:	02eb4363          	blt	s6,a4,8000cffa <__gethex+0x488>
8000cfd8:	01f9f993          	andi	s3,s3,31
8000cfdc:	00099463          	bnez	s3,8000cfe4 <__gethex+0x472>
8000cfe0:	4905                	li	s2,1
8000cfe2:	b759                	j	8000cf68 <__gethex+0x3f6>
8000cfe4:	97d6                	add	a5,a5,s5
8000cfe6:	ffc7a503          	lw	a0,-4(a5)
8000cfea:	df4fd0ef          	jal	8000a5de <__hi0bits>
8000cfee:	02000793          	li	a5,32
8000cff2:	413787b3          	sub	a5,a5,s3
8000cff6:	fef555e3          	bge	a0,a5,8000cfe0 <__gethex+0x46e>
8000cffa:	4585                	li	a1,1
8000cffc:	8522                	mv	a0,s0
8000cffe:	3461                	jal	8000ca86 <rshift>
8000d000:	008a2783          	lw	a5,8(s4)
8000d004:	0485                	addi	s1,s1,1
8000d006:	fc97dde3          	bge	a5,s1,8000cfe0 <__gethex+0x46e>
8000d00a:	bb4d                	j	8000cdbc <__gethex+0x24a>
8000d00c:	893a                	mv	s2,a4
8000d00e:	bfa9                	j	8000cf68 <__gethex+0x3f6>

8000d010 <L_shift>:
8000d010:	47a1                	li	a5,8
8000d012:	40c78633          	sub	a2,a5,a2
8000d016:	060a                	slli	a2,a2,0x2
8000d018:	02000693          	li	a3,32
8000d01c:	8e91                	sub	a3,a3,a2
8000d01e:	415c                	lw	a5,4(a0)
8000d020:	4118                	lw	a4,0(a0)
8000d022:	00d79833          	sll	a6,a5,a3
8000d026:	01076733          	or	a4,a4,a6
8000d02a:	00c7d7b3          	srl	a5,a5,a2
8000d02e:	c118                	sw	a4,0(a0)
8000d030:	c15c                	sw	a5,4(a0)
8000d032:	0511                	addi	a0,a0,4
8000d034:	feb565e3          	bltu	a0,a1,8000d01e <L_shift+0xe>
8000d038:	8082                	ret

8000d03a <__match>:
8000d03a:	411c                	lw	a5,0(a0)
8000d03c:	4665                	li	a2,25
8000d03e:	0005c683          	lbu	a3,0(a1)
8000d042:	0785                	addi	a5,a5,1
8000d044:	e681                	bnez	a3,8000d04c <__match+0x12>
8000d046:	c11c                	sw	a5,0(a0)
8000d048:	4505                	li	a0,1
8000d04a:	8082                	ret
8000d04c:	0007c703          	lbu	a4,0(a5)
8000d050:	0585                	addi	a1,a1,1
8000d052:	fbf70813          	addi	a6,a4,-65
8000d056:	01066463          	bltu	a2,a6,8000d05e <__match+0x24>
8000d05a:	02070713          	addi	a4,a4,32
8000d05e:	fed700e3          	beq	a4,a3,8000d03e <__match+0x4>
8000d062:	4501                	li	a0,0
8000d064:	8082                	ret

8000d066 <__hexnan>:
8000d066:	715d                	addi	sp,sp,-80
8000d068:	dc52                	sw	s4,56(sp)
8000d06a:	0005aa03          	lw	s4,0(a1)
8000d06e:	c2a6                	sw	s1,68(sp)
8000d070:	de4e                	sw	s3,60(sp)
8000d072:	405a5493          	srai	s1,s4,0x5
8000d076:	d85a                	sw	s6,48(sp)
8000d078:	048a                	slli	s1,s1,0x2
8000d07a:	c686                	sw	ra,76(sp)
8000d07c:	c4a2                	sw	s0,72(sp)
8000d07e:	c0ca                	sw	s2,64(sp)
8000d080:	da56                	sw	s5,52(sp)
8000d082:	d65e                	sw	s7,44(sp)
8000d084:	d462                	sw	s8,40(sp)
8000d086:	d266                	sw	s9,36(sp)
8000d088:	d06a                	sw	s10,32(sp)
8000d08a:	ce6e                	sw	s11,28(sp)
8000d08c:	01fa7a13          	andi	s4,s4,31
8000d090:	8b2a                	mv	s6,a0
8000d092:	89b2                	mv	s3,a2
8000d094:	94b2                	add	s1,s1,a2
8000d096:	000a0363          	beqz	s4,8000d09c <__hexnan+0x36>
8000d09a:	0491                	addi	s1,s1,4
8000d09c:	000b2d03          	lw	s10,0(s6)
8000d0a0:	ffc48913          	addi	s2,s1,-4
8000d0a4:	fe04ae23          	sw	zero,-4(s1)
8000d0a8:	85ca                	mv	a1,s2
8000d0aa:	844a                	mv	s0,s2
8000d0ac:	4601                	li	a2,0
8000d0ae:	4a81                	li	s5,0
8000d0b0:	4d81                	li	s11,0
8000d0b2:	4c21                	li	s8,8
8000d0b4:	02000c93          	li	s9,32
8000d0b8:	001d4783          	lbu	a5,1(s10)
8000d0bc:	001d0b93          	addi	s7,s10,1
8000d0c0:	cbb1                	beqz	a5,8000d114 <__hexnan+0xae>
8000d0c2:	853e                	mv	a0,a5
8000d0c4:	c632                	sw	a2,12(sp)
8000d0c6:	c42e                	sw	a1,8(sp)
8000d0c8:	c23e                	sw	a5,4(sp)
8000d0ca:	349d                	jal	8000cb30 <__hexdig_fun>
8000d0cc:	45a2                	lw	a1,8(sp)
8000d0ce:	4632                	lw	a2,12(sp)
8000d0d0:	e95d                	bnez	a0,8000d186 <__hexnan+0x120>
8000d0d2:	4792                	lw	a5,4(sp)
8000d0d4:	02fce963          	bltu	s9,a5,8000d106 <__hexnan+0xa0>
8000d0d8:	03bad563          	bge	s5,s11,8000d102 <__hexnan+0x9c>
8000d0dc:	00b47963          	bgeu	s0,a1,8000d0ee <__hexnan+0x88>
8000d0e0:	00862793          	slti	a5,a2,8
8000d0e4:	c789                	beqz	a5,8000d0ee <__hexnan+0x88>
8000d0e6:	8522                	mv	a0,s0
8000d0e8:	c22e                	sw	a1,4(sp)
8000d0ea:	371d                	jal	8000d010 <L_shift>
8000d0ec:	4592                	lw	a1,4(sp)
8000d0ee:	4621                	li	a2,8
8000d0f0:	0089f963          	bgeu	s3,s0,8000d102 <__hexnan+0x9c>
8000d0f4:	ffc40593          	addi	a1,s0,-4
8000d0f8:	fe042e23          	sw	zero,-4(s0)
8000d0fc:	8aee                	mv	s5,s11
8000d0fe:	842e                	mv	s0,a1
8000d100:	4601                	li	a2,0
8000d102:	8d5e                	mv	s10,s7
8000d104:	bf55                	j	8000d0b8 <__hexnan+0x52>
8000d106:	02900713          	li	a4,41
8000d10a:	0ce79563          	bne	a5,a4,8000d1d4 <__hexnan+0x16e>
8000d10e:	0d09                	addi	s10,s10,2
8000d110:	01ab2023          	sw	s10,0(s6)
8000d114:	0c0d8063          	beqz	s11,8000d1d4 <__hexnan+0x16e>
8000d118:	00b47763          	bgeu	s0,a1,8000d126 <__hexnan+0xc0>
8000d11c:	00862793          	slti	a5,a2,8
8000d120:	c399                	beqz	a5,8000d126 <__hexnan+0xc0>
8000d122:	8522                	mv	a0,s0
8000d124:	35f5                	jal	8000d010 <L_shift>
8000d126:	0889f063          	bgeu	s3,s0,8000d1a6 <__hexnan+0x140>
8000d12a:	874e                	mv	a4,s3
8000d12c:	87a2                	mv	a5,s0
8000d12e:	4394                	lw	a3,0(a5)
8000d130:	0791                	addi	a5,a5,4
8000d132:	c314                	sw	a3,0(a4)
8000d134:	0711                	addi	a4,a4,4
8000d136:	fef97ce3          	bgeu	s2,a5,8000d12e <__hexnan+0xc8>
8000d13a:	00140713          	addi	a4,s0,1
8000d13e:	14f5                	addi	s1,s1,-3
8000d140:	4781                	li	a5,0
8000d142:	00e4e663          	bltu	s1,a4,8000d14e <__hexnan+0xe8>
8000d146:	40890433          	sub	s0,s2,s0
8000d14a:	ffc47793          	andi	a5,s0,-4
8000d14e:	00498713          	addi	a4,s3,4
8000d152:	97ba                	add	a5,a5,a4
8000d154:	873e                	mv	a4,a5
8000d156:	00072023          	sw	zero,0(a4)
8000d15a:	0791                	addi	a5,a5,4
8000d15c:	fef97ce3          	bgeu	s2,a5,8000d154 <__hexnan+0xee>
8000d160:	00092783          	lw	a5,0(s2)
8000d164:	c3a5                	beqz	a5,8000d1c4 <__hexnan+0x15e>
8000d166:	4515                	li	a0,5
8000d168:	40b6                	lw	ra,76(sp)
8000d16a:	4426                	lw	s0,72(sp)
8000d16c:	4496                	lw	s1,68(sp)
8000d16e:	4906                	lw	s2,64(sp)
8000d170:	59f2                	lw	s3,60(sp)
8000d172:	5a62                	lw	s4,56(sp)
8000d174:	5ad2                	lw	s5,52(sp)
8000d176:	5b42                	lw	s6,48(sp)
8000d178:	5bb2                	lw	s7,44(sp)
8000d17a:	5c22                	lw	s8,40(sp)
8000d17c:	5c92                	lw	s9,36(sp)
8000d17e:	5d02                	lw	s10,32(sp)
8000d180:	4df2                	lw	s11,28(sp)
8000d182:	6161                	addi	sp,sp,80
8000d184:	8082                	ret
8000d186:	0605                	addi	a2,a2,1
8000d188:	0d85                	addi	s11,s11,1
8000d18a:	00cc5863          	bge	s8,a2,8000d19a <__hexnan+0x134>
8000d18e:	f689fae3          	bgeu	s3,s0,8000d102 <__hexnan+0x9c>
8000d192:	fe042e23          	sw	zero,-4(s0)
8000d196:	4605                	li	a2,1
8000d198:	1471                	addi	s0,s0,-4
8000d19a:	401c                	lw	a5,0(s0)
8000d19c:	893d                	andi	a0,a0,15
8000d19e:	0792                	slli	a5,a5,0x4
8000d1a0:	8fc9                	or	a5,a5,a0
8000d1a2:	c01c                	sw	a5,0(s0)
8000d1a4:	bfb9                	j	8000d102 <__hexnan+0x9c>
8000d1a6:	fa0a0de3          	beqz	s4,8000d160 <__hexnan+0xfa>
8000d1aa:	02000793          	li	a5,32
8000d1ae:	414787b3          	sub	a5,a5,s4
8000d1b2:	577d                	li	a4,-1
8000d1b4:	00f75733          	srl	a4,a4,a5
8000d1b8:	ffc4a783          	lw	a5,-4(s1)
8000d1bc:	8ff9                	and	a5,a5,a4
8000d1be:	fef4ae23          	sw	a5,-4(s1)
8000d1c2:	bf79                	j	8000d160 <__hexnan+0xfa>
8000d1c4:	01391663          	bne	s2,s3,8000d1d0 <__hexnan+0x16a>
8000d1c8:	4785                	li	a5,1
8000d1ca:	00f92023          	sw	a5,0(s2)
8000d1ce:	bf61                	j	8000d166 <__hexnan+0x100>
8000d1d0:	1971                	addi	s2,s2,-4
8000d1d2:	b779                	j	8000d160 <__hexnan+0xfa>
8000d1d4:	4511                	li	a0,4
8000d1d6:	bf49                	j	8000d168 <__hexnan+0x102>

8000d1d8 <__ascii_mbtowc>:
8000d1d8:	e185                	bnez	a1,8000d1f8 <__ascii_mbtowc+0x20>
8000d1da:	1141                	addi	sp,sp,-16
8000d1dc:	006c                	addi	a1,sp,12
8000d1de:	4501                	li	a0,0
8000d1e0:	ca11                	beqz	a2,8000d1f4 <__ascii_mbtowc+0x1c>
8000d1e2:	5579                	li	a0,-2
8000d1e4:	ca81                	beqz	a3,8000d1f4 <__ascii_mbtowc+0x1c>
8000d1e6:	00064783          	lbu	a5,0(a2)
8000d1ea:	c19c                	sw	a5,0(a1)
8000d1ec:	00064503          	lbu	a0,0(a2)
8000d1f0:	00a03533          	snez	a0,a0
8000d1f4:	0141                	addi	sp,sp,16
8000d1f6:	8082                	ret
8000d1f8:	4501                	li	a0,0
8000d1fa:	ca19                	beqz	a2,8000d210 <__ascii_mbtowc+0x38>
8000d1fc:	5579                	li	a0,-2
8000d1fe:	ca89                	beqz	a3,8000d210 <__ascii_mbtowc+0x38>
8000d200:	00064783          	lbu	a5,0(a2)
8000d204:	c19c                	sw	a5,0(a1)
8000d206:	00064503          	lbu	a0,0(a2)
8000d20a:	00a03533          	snez	a0,a0
8000d20e:	8082                	ret
8000d210:	8082                	ret

8000d212 <_realloc_r>:
8000d212:	e581                	bnez	a1,8000d21a <_realloc_r+0x8>
8000d214:	85b2                	mv	a1,a2
8000d216:	83afd06f          	j	8000a250 <_malloc_r>
8000d21a:	1101                	addi	sp,sp,-32
8000d21c:	cc22                	sw	s0,24(sp)
8000d21e:	c452                	sw	s4,8(sp)
8000d220:	ce06                	sw	ra,28(sp)
8000d222:	ca26                	sw	s1,20(sp)
8000d224:	c84a                	sw	s2,16(sp)
8000d226:	c64e                	sw	s3,12(sp)
8000d228:	8432                	mv	s0,a2
8000d22a:	8a2a                	mv	s4,a0
8000d22c:	ee09                	bnez	a2,8000d246 <_realloc_r+0x34>
8000d22e:	f27fc0ef          	jal	8000a154 <_free_r>
8000d232:	4481                	li	s1,0
8000d234:	40f2                	lw	ra,28(sp)
8000d236:	4462                	lw	s0,24(sp)
8000d238:	4942                	lw	s2,16(sp)
8000d23a:	49b2                	lw	s3,12(sp)
8000d23c:	4a22                	lw	s4,8(sp)
8000d23e:	8526                	mv	a0,s1
8000d240:	44d2                	lw	s1,20(sp)
8000d242:	6105                	addi	sp,sp,32
8000d244:	8082                	ret
8000d246:	84ae                	mv	s1,a1
8000d248:	28a1                	jal	8000d2a0 <_malloc_usable_size_r>
8000d24a:	892a                	mv	s2,a0
8000d24c:	00856663          	bltu	a0,s0,8000d258 <_realloc_r+0x46>
8000d250:	00155793          	srli	a5,a0,0x1
8000d254:	fe87e0e3          	bltu	a5,s0,8000d234 <_realloc_r+0x22>
8000d258:	85a2                	mv	a1,s0
8000d25a:	8552                	mv	a0,s4
8000d25c:	ff5fc0ef          	jal	8000a250 <_malloc_r>
8000d260:	89aa                	mv	s3,a0
8000d262:	cd09                	beqz	a0,8000d27c <_realloc_r+0x6a>
8000d264:	8622                	mv	a2,s0
8000d266:	00897363          	bgeu	s2,s0,8000d26c <_realloc_r+0x5a>
8000d26a:	864a                	mv	a2,s2
8000d26c:	85a6                	mv	a1,s1
8000d26e:	854e                	mv	a0,s3
8000d270:	b41f70ef          	jal	80004db0 <memcpy>
8000d274:	85a6                	mv	a1,s1
8000d276:	8552                	mv	a0,s4
8000d278:	eddfc0ef          	jal	8000a154 <_free_r>
8000d27c:	84ce                	mv	s1,s3
8000d27e:	bf5d                	j	8000d234 <_realloc_r+0x22>

8000d280 <__ascii_wctomb>:
8000d280:	cd91                	beqz	a1,8000d29c <__ascii_wctomb+0x1c>
8000d282:	0ff00793          	li	a5,255
8000d286:	00c7f763          	bgeu	a5,a2,8000d294 <__ascii_wctomb+0x14>
8000d28a:	08a00793          	li	a5,138
8000d28e:	c11c                	sw	a5,0(a0)
8000d290:	557d                	li	a0,-1
8000d292:	8082                	ret
8000d294:	00c58023          	sb	a2,0(a1)
8000d298:	4505                	li	a0,1
8000d29a:	8082                	ret
8000d29c:	4501                	li	a0,0
8000d29e:	8082                	ret

8000d2a0 <_malloc_usable_size_r>:
8000d2a0:	ffc5a783          	lw	a5,-4(a1)
8000d2a4:	ffc78513          	addi	a0,a5,-4
8000d2a8:	0007d563          	bgez	a5,8000d2b2 <_malloc_usable_size_r+0x12>
8000d2ac:	95aa                	add	a1,a1,a0
8000d2ae:	419c                	lw	a5,0(a1)
8000d2b0:	953e                	add	a0,a0,a5
8000d2b2:	8082                	ret

8000d2b4 <_close>:
8000d2b4:	1141                	addi	sp,sp,-16
8000d2b6:	c606                	sw	ra,12(sp)
8000d2b8:	c422                	sw	s0,8(sp)
8000d2ba:	03900893          	li	a7,57
8000d2be:	00000073          	ecall
8000d2c2:	842a                	mv	s0,a0
8000d2c4:	00055863          	bgez	a0,8000d2d4 <_close+0x20>
8000d2c8:	40800433          	neg	s0,s0
8000d2cc:	8fafc0ef          	jal	800093c6 <__errno>
8000d2d0:	c100                	sw	s0,0(a0)
8000d2d2:	547d                	li	s0,-1
8000d2d4:	40b2                	lw	ra,12(sp)
8000d2d6:	8522                	mv	a0,s0
8000d2d8:	4422                	lw	s0,8(sp)
8000d2da:	0141                	addi	sp,sp,16
8000d2dc:	8082                	ret

8000d2de <_exit>:
8000d2de:	05d00893          	li	a7,93
8000d2e2:	00000073          	ecall
8000d2e6:	00055c63          	bgez	a0,8000d2fe <_exit+0x20>
8000d2ea:	1141                	addi	sp,sp,-16
8000d2ec:	c422                	sw	s0,8(sp)
8000d2ee:	842a                	mv	s0,a0
8000d2f0:	c606                	sw	ra,12(sp)
8000d2f2:	40800433          	neg	s0,s0
8000d2f6:	8d0fc0ef          	jal	800093c6 <__errno>
8000d2fa:	c100                	sw	s0,0(a0)
8000d2fc:	a001                	j	8000d2fc <_exit+0x1e>
8000d2fe:	a001                	j	8000d2fe <_exit+0x20>

8000d300 <_getpid>:
8000d300:	4505                	li	a0,1
8000d302:	8082                	ret

8000d304 <_isatty>:
8000d304:	7159                	addi	sp,sp,-112
8000d306:	002c                	addi	a1,sp,8
8000d308:	d686                	sw	ra,108(sp)
8000d30a:	856fb0ef          	jal	80008360 <_fstat>
8000d30e:	57fd                	li	a5,-1
8000d310:	00f50863          	beq	a0,a5,8000d320 <_isatty+0x1c>
8000d314:	4532                	lw	a0,12(sp)
8000d316:	8135                	srli	a0,a0,0xd
8000d318:	8905                	andi	a0,a0,1
8000d31a:	50b6                	lw	ra,108(sp)
8000d31c:	6165                	addi	sp,sp,112
8000d31e:	8082                	ret
8000d320:	4501                	li	a0,0
8000d322:	bfe5                	j	8000d31a <_isatty+0x16>

8000d324 <_kill>:
8000d324:	1141                	addi	sp,sp,-16
8000d326:	c606                	sw	ra,12(sp)
8000d328:	89efc0ef          	jal	800093c6 <__errno>
8000d32c:	40b2                	lw	ra,12(sp)
8000d32e:	47d9                	li	a5,22
8000d330:	c11c                	sw	a5,0(a0)
8000d332:	557d                	li	a0,-1
8000d334:	0141                	addi	sp,sp,16
8000d336:	8082                	ret

8000d338 <_lseek>:
8000d338:	1141                	addi	sp,sp,-16
8000d33a:	c606                	sw	ra,12(sp)
8000d33c:	c422                	sw	s0,8(sp)
8000d33e:	03e00893          	li	a7,62
8000d342:	00000073          	ecall
8000d346:	842a                	mv	s0,a0
8000d348:	00055863          	bgez	a0,8000d358 <_lseek+0x20>
8000d34c:	40800433          	neg	s0,s0
8000d350:	876fc0ef          	jal	800093c6 <__errno>
8000d354:	c100                	sw	s0,0(a0)
8000d356:	547d                	li	s0,-1
8000d358:	40b2                	lw	ra,12(sp)
8000d35a:	8522                	mv	a0,s0
8000d35c:	4422                	lw	s0,8(sp)
8000d35e:	0141                	addi	sp,sp,16
8000d360:	8082                	ret
8000d362:	0000                	unimp
8000d364:	6568                	.insn	2, 0x6568
8000d366:	6c6c                	.insn	2, 0x6c6c
8000d368:	6f77206f          	j	8008025e <__fast_load_addr__+0x7209e>
8000d36c:	6c72                	.insn	2, 0x6c72
8000d36e:	0a64                	addi	s1,sp,284
8000d370:	0000                	unimp
8000d372:	0000                	unimp
8000d374:	3d3d                	jal	8000d1b2 <__hexnan+0x14c>
8000d376:	3d3d                	jal	8000d1b4 <__hexnan+0x14e>
8000d378:	3d3d                	jal	8000d1b6 <__hexnan+0x150>
8000d37a:	3d3d                	jal	8000d1b8 <__hexnan+0x152>
8000d37c:	3d3d                	jal	8000d1ba <__hexnan+0x154>
8000d37e:	3d3d                	jal	8000d1bc <__hexnan+0x156>
8000d380:	3d3d                	jal	8000d1be <__hexnan+0x158>
8000d382:	3d3d                	jal	8000d1c0 <__hexnan+0x15a>
8000d384:	3d3d                	jal	8000d1c2 <__hexnan+0x15c>
8000d386:	3d3d                	jal	8000d1c4 <__hexnan+0x15e>
8000d388:	3d3d                	jal	8000d1c6 <__hexnan+0x160>
8000d38a:	3d3d                	jal	8000d1c8 <__hexnan+0x162>
8000d38c:	3d3d                	jal	8000d1ca <__hexnan+0x164>
8000d38e:	3d3d                	jal	8000d1cc <__hexnan+0x166>
8000d390:	3d3d                	jal	8000d1ce <__hexnan+0x168>
8000d392:	000a                	c.slli	zero,0x2
8000d394:	7068                	.insn	2, 0x7068
8000d396:	366d                	jal	8000cf40 <__gethex+0x3ce>
8000d398:	65303537          	lui	a0,0x65303
8000d39c:	6b76                	.insn	2, 0x6b76
8000d39e:	696d                	lui	s2,0x1b
8000d3a0:	696e                	.insn	2, 0x696e
8000d3a2:	0000                	unimp
8000d3a4:	2520                	.insn	2, 0x2520
8000d3a6:	6c632073          	.insn	4, 0x6c632073
8000d3aa:	206b636f          	jal	t1,800c35b0 <__fast_load_addr__+0xb53f0>
8000d3ae:	6d6d7573          	.insn	4, 0x6d6d7573
8000d3b2:	7261                	lui	tp,0xffff8
8000d3b4:	0a79                	addi	s4,s4,30
8000d3b6:	0000                	unimp
8000d3b8:	30757063          	bgeu	a0,t2,8000d6b8 <_lseek+0x380>
8000d3bc:	093a                	slli	s2,s2,0xe
8000d3be:	2009                	jal	8000d3c0 <_lseek+0x88>
8000d3c0:	6c25                	lui	s8,0x9
8000d3c2:	4875                	li	a6,29
8000d3c4:	0a7a                	slli	s4,s4,0x1e
8000d3c6:	0000                	unimp
8000d3c8:	31757063          	bgeu	a0,s7,8000d6c8 <_lseek+0x390>
8000d3cc:	093a                	slli	s2,s2,0xe
8000d3ce:	2009                	jal	8000d3d0 <_lseek+0x98>
8000d3d0:	6c25                	lui	s8,0x9
8000d3d2:	4875                	li	a6,29
8000d3d4:	0a7a                	slli	s4,s4,0x1e
8000d3d6:	0000                	unimp
8000d3d8:	7861                	lui	a6,0xffff8
8000d3da:	3069                	jal	8000cc64 <__gethex+0xf2>
8000d3dc:	093a                	slli	s2,s2,0xe
8000d3de:	2009                	jal	8000d3e0 <_lseek+0xa8>
8000d3e0:	6c25                	lui	s8,0x9
8000d3e2:	4875                	li	a6,29
8000d3e4:	0a7a                	slli	s4,s4,0x1e
8000d3e6:	0000                	unimp
8000d3e8:	7861                	lui	a6,0xffff8
8000d3ea:	3169                	jal	8000d074 <__hexnan+0xe>
8000d3ec:	093a                	slli	s2,s2,0xe
8000d3ee:	2009                	jal	8000d3f0 <_lseek+0xb8>
8000d3f0:	6c25                	lui	s8,0x9
8000d3f2:	4875                	li	a6,29
8000d3f4:	0a7a                	slli	s4,s4,0x1e
8000d3f6:	0000                	unimp
8000d3f8:	7861                	lui	a6,0xffff8
8000d3fa:	3269                	jal	8000cd84 <__gethex+0x212>
8000d3fc:	093a                	slli	s2,s2,0xe
8000d3fe:	2009                	jal	8000d400 <_lseek+0xc8>
8000d400:	6c25                	lui	s8,0x9
8000d402:	4875                	li	a6,29
8000d404:	0a7a                	slli	s4,s4,0x1e
8000d406:	0000                	unimp
8000d408:	6861                	lui	a6,0x18
8000d40a:	3a62                	.insn	2, 0x3a62
8000d40c:	0909                	addi	s2,s2,2 # 1b002 <__fw_size__+0xfe42>
8000d40e:	2520                	.insn	2, 0x2520
8000d410:	756c                	.insn	2, 0x756c
8000d412:	7a48                	.insn	2, 0x7a48
8000d414:	000a                	c.slli	zero,0x2
8000d416:	0000                	unimp
8000d418:	636d                	lui	t1,0x1b
8000d41a:	7468                	.insn	2, 0x7468
8000d41c:	726d                	lui	tp,0xffffb
8000d41e:	3a30                	.insn	2, 0x3a30
8000d420:	2009                	jal	8000d422 <_lseek+0xea>
8000d422:	6c25                	lui	s8,0x9
8000d424:	4875                	li	a6,29
8000d426:	0a7a                	slli	s4,s4,0x1e
8000d428:	0000                	unimp
8000d42a:	0000                	unimp
8000d42c:	636d                	lui	t1,0x1b
8000d42e:	7468                	.insn	2, 0x7468
8000d430:	726d                	lui	tp,0xffffb
8000d432:	3a31                	jal	8000cd4e <__gethex+0x1dc>
8000d434:	2009                	jal	8000d436 <_lseek+0xfe>
8000d436:	6c25                	lui	s8,0x9
8000d438:	4875                	li	a6,29
8000d43a:	0a7a                	slli	s4,s4,0x1e
8000d43c:	0000                	unimp
8000d43e:	0000                	unimp
8000d440:	7078                	.insn	2, 0x7078
8000d442:	3069                	jal	8000cccc <__gethex+0x15a>
8000d444:	093a                	slli	s2,s2,0xe
8000d446:	2009                	jal	8000d448 <_lseek+0x110>
8000d448:	6c25                	lui	s8,0x9
8000d44a:	4875                	li	a6,29
8000d44c:	0a7a                	slli	s4,s4,0x1e
8000d44e:	0000                	unimp
8000d450:	7078                	.insn	2, 0x7078
8000d452:	3169                	jal	8000d0dc <__hexnan+0x76>
8000d454:	093a                	slli	s2,s2,0xe
8000d456:	2009                	jal	8000d458 <_lseek+0x120>
8000d458:	6c25                	lui	s8,0x9
8000d45a:	4875                	li	a6,29
8000d45c:	0a7a                	slli	s4,s4,0x1e
8000d45e:	0000                	unimp
8000d460:	6566                	.insn	2, 0x6566
8000d462:	636d                	lui	t1,0x1b
8000d464:	093a                	slli	s2,s2,0xe
8000d466:	2009                	jal	8000d468 <_lseek+0x130>
8000d468:	6c25                	lui	s8,0x9
8000d46a:	4875                	li	a6,29
8000d46c:	0a7a                	slli	s4,s4,0x1e
8000d46e:	0000                	unimp
8000d470:	2e31                	jal	8000d78c <_lseek+0x454>
8000d472:	3231                	jal	8000cd7e <__gethex+0x20c>
8000d474:	312e                	.insn	2, 0x312e
8000d476:	0000                	unimp
8000d478:	7068                	.insn	2, 0x7068
8000d47a:	5f6d                	li	t5,-5
8000d47c:	3a6b6473          	.insn	4, 0x3a6b6473
8000d480:	2520                	.insn	2, 0x2520
8000d482:	00000a73          	.insn	4, 0x0a73
8000d486:	0000                	unimp
8000d488:	7325                	lui	t1,0xfffe9
8000d48a:	0000                	unimp
8000d48c:	2d0a                	.insn	2, 0x2d0a
8000d48e:	2d2d                	jal	8000dac8 <s_wdgs+0xf0>
8000d490:	2d2d                	jal	8000daca <s_wdgs+0xf2>
8000d492:	2d2d                	jal	8000dacc <s_wdgs+0xf4>
8000d494:	2d2d                	jal	8000dace <s_wdgs+0xf6>
8000d496:	2d2d                	jal	8000dad0 <s_wdgs+0xf8>
8000d498:	2d2d                	jal	8000dad2 <s_wdgs+0xfa>
8000d49a:	2d2d                	jal	8000dad4 <s_wdgs+0xfc>
8000d49c:	2d2d                	jal	8000dad6 <s_wdgs+0xfe>
8000d49e:	2d2d                	jal	8000dad8 <s_wdgs+0x100>
8000d4a0:	2d2d                	jal	8000dada <s_wdgs+0x102>
8000d4a2:	2d2d                	jal	8000dadc <s_wdgs+0x104>
8000d4a4:	2d2d                	jal	8000dade <s_wdgs+0x106>
8000d4a6:	2d2d                	jal	8000dae0 <s_wdgs+0x108>
8000d4a8:	2d2d                	jal	8000dae2 <s_wdgs+0x10a>
8000d4aa:	2d2d                	jal	8000dae4 <s_wdgs+0x10c>
8000d4ac:	2d2d                	jal	8000dae6 <s_wdgs+0x10e>
8000d4ae:	2d2d                	jal	8000dae8 <s_wdgs+0x110>
8000d4b0:	2d2d                	jal	8000daea <s_wdgs+0x112>
8000d4b2:	2d2d                	jal	8000daec <s_wdgs+0x114>
8000d4b4:	2d2d                	jal	8000daee <s_wdgs+0x116>
8000d4b6:	2d2d                	jal	8000daf0 <s_wdgs+0x118>
8000d4b8:	2d2d                	jal	8000daf2 <s_wdgs+0x11a>
8000d4ba:	2d2d                	jal	8000daf4 <s_wdgs+0x11c>
8000d4bc:	2d2d                	jal	8000daf6 <s_wdgs+0x11e>
8000d4be:	2d2d                	jal	8000daf8 <s_wdgs+0x120>
8000d4c0:	2d2d                	jal	8000dafa <s_wdgs+0x122>
8000d4c2:	2d2d                	jal	8000dafc <s_wdgs+0x124>
8000d4c4:	2d2d                	jal	8000dafe <s_wdgs+0x126>
8000d4c6:	2d2d                	jal	8000db00 <s_wdgs+0x128>
8000d4c8:	2d2d                	jal	8000db02 <s_wdgs+0x12a>
8000d4ca:	2d2d                	jal	8000db04 <s_wdgs+0x12c>
8000d4cc:	2d2d                	jal	8000db06 <s_wdgs+0x12e>
8000d4ce:	2d2d                	jal	8000db08 <s_wdgs+0x130>
8000d4d0:	2d2d                	jal	8000db0a <s_wdgs+0x132>
8000d4d2:	0a2d                	addi	s4,s4,11
8000d4d4:	2424                	.insn	2, 0x2424
8000d4d6:	205c                	.insn	2, 0x205c
8000d4d8:	2020                	.insn	2, 0x2020
8000d4da:	2424                	.insn	2, 0x2424
8000d4dc:	205c                	.insn	2, 0x205c
8000d4de:	2424                	.insn	2, 0x2424
8000d4e0:	2424                	.insn	2, 0x2424
8000d4e2:	2424                	.insn	2, 0x2424
8000d4e4:	5c24                	lw	s1,120(s0)
8000d4e6:	2020                	.insn	2, 0x2020
8000d4e8:	2424                	.insn	2, 0x2424
8000d4ea:	205c                	.insn	2, 0x205c
8000d4ec:	2020                	.insn	2, 0x2020
8000d4ee:	2020                	.insn	2, 0x2020
8000d4f0:	2420                	.insn	2, 0x2420
8000d4f2:	5c24                	lw	s1,120(s0)
8000d4f4:	2420                	.insn	2, 0x2420
8000d4f6:	5c24                	lw	s1,120(s0)
8000d4f8:	240a                	.insn	2, 0x240a
8000d4fa:	2024                	.insn	2, 0x2024
8000d4fc:	207c                	.insn	2, 0x207c
8000d4fe:	2420                	.insn	2, 0x2420
8000d500:	2024                	.insn	2, 0x2024
8000d502:	247c                	.insn	2, 0x247c
8000d504:	2024                	.insn	2, 0x2024
8000d506:	5f20                	lw	s0,120(a4)
8000d508:	245f 5c24 2420      	.insn	6, 0x24205c24245f
8000d50e:	2424                	.insn	2, 0x2424
8000d510:	205c                	.insn	2, 0x205c
8000d512:	2020                	.insn	2, 0x2020
8000d514:	2420                	.insn	2, 0x2420
8000d516:	2424                	.insn	2, 0x2424
8000d518:	7c20                	.insn	2, 0x7c20
8000d51a:	5f5c                	lw	a5,60(a4)
8000d51c:	7c5f 240a 2024      	.insn	6, 0x2024240a7c5f
8000d522:	207c                	.insn	2, 0x207c
8000d524:	2420                	.insn	2, 0x2420
8000d526:	2024                	.insn	2, 0x2024
8000d528:	247c                	.insn	2, 0x247c
8000d52a:	2024                	.insn	2, 0x2024
8000d52c:	207c                	.insn	2, 0x207c
8000d52e:	2420                	.insn	2, 0x2420
8000d530:	2024                	.insn	2, 0x2024
8000d532:	247c                	.insn	2, 0x247c
8000d534:	2424                	.insn	2, 0x2424
8000d536:	5c24                	lw	s1,120(s0)
8000d538:	2020                	.insn	2, 0x2020
8000d53a:	2424                	.insn	2, 0x2424
8000d53c:	2424                	.insn	2, 0x2424
8000d53e:	7c20                	.insn	2, 0x7c20
8000d540:	2424                	.insn	2, 0x2424
8000d542:	205c                	.insn	2, 0x205c
8000d544:	2420                	.insn	2, 0x2420
8000d546:	2424                	.insn	2, 0x2424
8000d548:	2424                	.insn	2, 0x2424
8000d54a:	2424                	.insn	2, 0x2424
8000d54c:	205c                	.insn	2, 0x205c
8000d54e:	2420                	.insn	2, 0x2420
8000d550:	2424                	.insn	2, 0x2424
8000d552:	2424                	.insn	2, 0x2424
8000d554:	5c24                	lw	s1,120(s0)
8000d556:	2020                	.insn	2, 0x2020
8000d558:	2420                	.insn	2, 0x2420
8000d55a:	2424                	.insn	2, 0x2424
8000d55c:	2424                	.insn	2, 0x2424
8000d55e:	5c24                	lw	s1,120(s0)
8000d560:	240a                	.insn	2, 0x240a
8000d562:	2424                	.insn	2, 0x2424
8000d564:	2424                	.insn	2, 0x2424
8000d566:	2424                	.insn	2, 0x2424
8000d568:	2024                	.insn	2, 0x2024
8000d56a:	247c                	.insn	2, 0x247c
8000d56c:	2424                	.insn	2, 0x2424
8000d56e:	2424                	.insn	2, 0x2424
8000d570:	2424                	.insn	2, 0x2424
8000d572:	2020                	.insn	2, 0x2020
8000d574:	247c                	.insn	2, 0x247c
8000d576:	5c24                	lw	s1,120(s0)
8000d578:	2424                	.insn	2, 0x2424
8000d57a:	245c                	.insn	2, 0x245c
8000d57c:	2024                	.insn	2, 0x2024
8000d57e:	2424                	.insn	2, 0x2424
8000d580:	7c20                	.insn	2, 0x7c20
8000d582:	2424                	.insn	2, 0x2424
8000d584:	7c20                	.insn	2, 0x7c20
8000d586:	2424                	.insn	2, 0x2424
8000d588:	2020                	.insn	2, 0x2020
8000d58a:	5f5f 5f5f 7c5f      	.insn	6, 0x7c5f5f5f5f5f
8000d590:	2424                	.insn	2, 0x2424
8000d592:	2020                	.insn	2, 0x2020
8000d594:	5f5f 2424 205c      	.insn	6, 0x205c24245f5f
8000d59a:	2424                	.insn	2, 0x2424
8000d59c:	2020                	.insn	2, 0x2020
8000d59e:	5f5f 2424 0a5c      	.insn	6, 0x0a5c24245f5f
8000d5a4:	2424                	.insn	2, 0x2424
8000d5a6:	2020                	.insn	2, 0x2020
8000d5a8:	5f5f 2424 7c20      	.insn	6, 0x7c2024245f5f
8000d5ae:	2424                	.insn	2, 0x2424
8000d5b0:	2020                	.insn	2, 0x2020
8000d5b2:	5f5f 5f5f 202f      	.insn	6, 0x202f5f5f5f5f
8000d5b8:	2424                	.insn	2, 0x2424
8000d5ba:	5c20                	lw	s0,120(s0)
8000d5bc:	2424                	.insn	2, 0x2424
8000d5be:	2024                	.insn	2, 0x2024
8000d5c0:	2420                	.insn	2, 0x2420
8000d5c2:	2024                	.insn	2, 0x2024
8000d5c4:	247c                	.insn	2, 0x247c
8000d5c6:	2024                	.insn	2, 0x2024
8000d5c8:	247c                	.insn	2, 0x247c
8000d5ca:	2024                	.insn	2, 0x2024
8000d5cc:	2020202f          	amoxor.w	zero,sp,(zero)
8000d5d0:	2020                	.insn	2, 0x2020
8000d5d2:	2420                	.insn	2, 0x2420
8000d5d4:	2024                	.insn	2, 0x2024
8000d5d6:	207c                	.insn	2, 0x207c
8000d5d8:	5c20                	lw	s0,120(s0)
8000d5da:	5f5f 247c 2024      	.insn	6, 0x2024247c5f5f
8000d5e0:	2420202f          	amoxor.w.aq	zero,sp,(zero)
8000d5e4:	2024                	.insn	2, 0x2024
8000d5e6:	0a7c                	addi	a5,sp,284
8000d5e8:	2424                	.insn	2, 0x2424
8000d5ea:	7c20                	.insn	2, 0x7c20
8000d5ec:	2020                	.insn	2, 0x2020
8000d5ee:	2424                	.insn	2, 0x2424
8000d5f0:	7c20                	.insn	2, 0x7c20
8000d5f2:	2424                	.insn	2, 0x2424
8000d5f4:	7c20                	.insn	2, 0x7c20
8000d5f6:	2020                	.insn	2, 0x2020
8000d5f8:	2020                	.insn	2, 0x2020
8000d5fa:	2020                	.insn	2, 0x2020
8000d5fc:	2424                	.insn	2, 0x2424
8000d5fe:	7c20                	.insn	2, 0x7c20
8000d600:	245c                	.insn	2, 0x245c
8000d602:	2020                	.insn	2, 0x2020
8000d604:	2024242f          	amoxor.w	s0,sp,(s0)
8000d608:	247c                	.insn	2, 0x247c
8000d60a:	2024                	.insn	2, 0x2024
8000d60c:	247c                	.insn	2, 0x247c
8000d60e:	2024                	.insn	2, 0x2024
8000d610:	207c                	.insn	2, 0x207c
8000d612:	2020                	.insn	2, 0x2020
8000d614:	2020                	.insn	2, 0x2020
8000d616:	2420                	.insn	2, 0x2420
8000d618:	2024                	.insn	2, 0x2024
8000d61a:	207c                	.insn	2, 0x207c
8000d61c:	2020                	.insn	2, 0x2020
8000d61e:	2020                	.insn	2, 0x2020
8000d620:	2420                	.insn	2, 0x2420
8000d622:	2024                	.insn	2, 0x2024
8000d624:	207c                	.insn	2, 0x207c
8000d626:	2420                	.insn	2, 0x2420
8000d628:	2024                	.insn	2, 0x2024
8000d62a:	0a7c                	addi	a5,sp,284
8000d62c:	2424                	.insn	2, 0x2424
8000d62e:	7c20                	.insn	2, 0x7c20
8000d630:	2020                	.insn	2, 0x2020
8000d632:	2424                	.insn	2, 0x2424
8000d634:	7c20                	.insn	2, 0x7c20
8000d636:	2424                	.insn	2, 0x2424
8000d638:	7c20                	.insn	2, 0x7c20
8000d63a:	2020                	.insn	2, 0x2020
8000d63c:	2020                	.insn	2, 0x2020
8000d63e:	2020                	.insn	2, 0x2020
8000d640:	2424                	.insn	2, 0x2424
8000d642:	7c20                	.insn	2, 0x7c20
8000d644:	5c20                	lw	s0,120(s0)
8000d646:	2f5f 2420 2024      	.insn	6, 0x202424202f5f
8000d64c:	247c                	.insn	2, 0x247c
8000d64e:	2024                	.insn	2, 0x2024
8000d650:	5c7c                	lw	a5,124(s0)
8000d652:	2424                	.insn	2, 0x2424
8000d654:	2424                	.insn	2, 0x2424
8000d656:	2424                	.insn	2, 0x2424
8000d658:	5c24                	lw	s1,120(s0)
8000d65a:	2420                	.insn	2, 0x2420
8000d65c:	2024                	.insn	2, 0x2024
8000d65e:	207c                	.insn	2, 0x207c
8000d660:	2020                	.insn	2, 0x2020
8000d662:	2020                	.insn	2, 0x2020
8000d664:	5c20                	lw	s0,120(s0)
8000d666:	2424                	.insn	2, 0x2424
8000d668:	2424                	.insn	2, 0x2424
8000d66a:	2424                	.insn	2, 0x2424
8000d66c:	2020                	.insn	2, 0x2020
8000d66e:	0a7c                	addi	a5,sp,284
8000d670:	5f5c                	lw	a5,60(a4)
8000d672:	7c5f 2020 5f5c      	.insn	6, 0x5f5c20207c5f
8000d678:	7c5f 5f5c 7c5f      	.insn	6, 0x7c5f5f5c7c5f
8000d67e:	2020                	.insn	2, 0x2020
8000d680:	2020                	.insn	2, 0x2020
8000d682:	2020                	.insn	2, 0x2020
8000d684:	5f5c                	lw	a5,60(a4)
8000d686:	7c5f 2020 2020      	.insn	6, 0x202020207c5f
8000d68c:	5c20                	lw	s0,120(s0)
8000d68e:	5f5f 5c7c 5f5f      	.insn	6, 0x5f5f5c7c5f5f
8000d694:	207c                	.insn	2, 0x207c
8000d696:	5f5c                	lw	a5,60(a4)
8000d698:	5f5f 5f5f 5f5f      	.insn	6, 0x5f5f5f5f5f5f
8000d69e:	5c7c                	lw	a5,124(s0)
8000d6a0:	5f5f 207c 2020      	.insn	6, 0x2020207c5f5f
8000d6a6:	2020                	.insn	2, 0x2020
8000d6a8:	2020                	.insn	2, 0x2020
8000d6aa:	5f5c                	lw	a5,60(a4)
8000d6ac:	5f5f 5f5f 2f5f      	.insn	6, 0x2f5f5f5f5f5f
8000d6b2:	2d0a                	.insn	2, 0x2d0a
8000d6b4:	2d2d                	jal	8000dcee <__mprec_bigtens+0xe>
8000d6b6:	2d2d                	jal	8000dcf0 <__mprec_bigtens+0x10>
8000d6b8:	2d2d                	jal	8000dcf2 <__mprec_bigtens+0x12>
8000d6ba:	2d2d                	jal	8000dcf4 <__mprec_bigtens+0x14>
8000d6bc:	2d2d                	jal	8000dcf6 <__mprec_bigtens+0x16>
8000d6be:	2d2d                	jal	8000dcf8 <__mprec_bigtens+0x18>
8000d6c0:	2d2d                	jal	8000dcfa <__mprec_bigtens+0x1a>
8000d6c2:	2d2d                	jal	8000dcfc <__mprec_bigtens+0x1c>
8000d6c4:	2d2d                	jal	8000dcfe <__mprec_bigtens+0x1e>
8000d6c6:	2d2d                	jal	8000dd00 <__mprec_bigtens+0x20>
8000d6c8:	2d2d                	jal	8000dd02 <__mprec_bigtens+0x22>
8000d6ca:	2d2d                	jal	8000dd04 <__mprec_bigtens+0x24>
8000d6cc:	2d2d                	jal	8000dd06 <__mprec_bigtens+0x26>
8000d6ce:	2d2d                	jal	8000dd08 <__mprec_tens>
8000d6d0:	2d2d                	jal	8000dd0a <__mprec_tens+0x2>
8000d6d2:	2d2d                	jal	8000dd0c <__mprec_tens+0x4>
8000d6d4:	2d2d                	jal	8000dd0e <__mprec_tens+0x6>
8000d6d6:	2d2d                	jal	8000dd10 <__mprec_tens+0x8>
8000d6d8:	2d2d                	jal	8000dd12 <__mprec_tens+0xa>
8000d6da:	2d2d                	jal	8000dd14 <__mprec_tens+0xc>
8000d6dc:	2d2d                	jal	8000dd16 <__mprec_tens+0xe>
8000d6de:	2d2d                	jal	8000dd18 <__mprec_tens+0x10>
8000d6e0:	2d2d                	jal	8000dd1a <__mprec_tens+0x12>
8000d6e2:	2d2d                	jal	8000dd1c <__mprec_tens+0x14>
8000d6e4:	2d2d                	jal	8000dd1e <__mprec_tens+0x16>
8000d6e6:	2d2d                	jal	8000dd20 <__mprec_tens+0x18>
8000d6e8:	2d2d                	jal	8000dd22 <__mprec_tens+0x1a>
8000d6ea:	2d2d                	jal	8000dd24 <__mprec_tens+0x1c>
8000d6ec:	2d2d                	jal	8000dd26 <__mprec_tens+0x1e>
8000d6ee:	2d2d                	jal	8000dd28 <__mprec_tens+0x20>
8000d6f0:	2d2d                	jal	8000dd2a <__mprec_tens+0x22>
8000d6f2:	2d2d                	jal	8000dd2c <__mprec_tens+0x24>
8000d6f4:	2d2d                	jal	8000dd2e <__mprec_tens+0x26>
8000d6f6:	2d2d                	jal	8000dd30 <__mprec_tens+0x28>
8000d6f8:	0a2d                	addi	s4,s4,11
8000d6fa:	0000                	unimp
8000d6fc:	204b4c43          	.insn	4, 0x204b4c43
8000d700:	7369                	lui	t1,0xffffa
8000d702:	6c20                	.insn	2, 0x6c20
8000d704:	202c776f          	jal	a4,800d4906 <__fast_load_addr__+0xc6746>
8000d708:	6c70                	.insn	2, 0x6c70
8000d70a:	6165                	addi	sp,sp,112
8000d70c:	70206573          	.insn	4, 0x70206573
8000d710:	7265776f          	jal	a4,80064e36 <__fast_load_addr__+0x56c76>
8000d714:	6320                	.insn	2, 0x6320
8000d716:	6379                	lui	t1,0x1e
8000d718:	656c                	.insn	2, 0x656c
8000d71a:	7420                	.insn	2, 0x7420
8000d71c:	6568                	.insn	2, 0x6568
8000d71e:	6220                	.insn	2, 0x6220
8000d720:	6472616f          	jal	sp,80034566 <__fast_load_addr__+0x263a6>
8000d724:	000a                	c.slli	zero,0x2
8000d726:	0000                	unimp
8000d728:	20414453          	.insn	4, 0x20414453
8000d72c:	7369                	lui	t1,0xffffa
8000d72e:	6c20                	.insn	2, 0x6c20
8000d730:	202c776f          	jal	a4,800d4932 <__fast_load_addr__+0xc6772>
8000d734:	7274                	.insn	2, 0x7274
8000d736:	2079                	jal	8000d7c4 <_lseek+0x48c>
8000d738:	6f74                	.insn	2, 0x6f74
8000d73a:	6920                	.insn	2, 0x6920
8000d73c:	65757373          	.insn	4, 0x65757373
8000d740:	4920                	lw	s0,80(a0)
8000d742:	4332                	lw	t1,12(sp)
8000d744:	6220                	.insn	2, 0x6220
8000d746:	7375                	lui	t1,0xffffd
8000d748:	6320                	.insn	2, 0x6320
8000d74a:	656c                	.insn	2, 0x656c
8000d74c:	7261                	lui	tp,0xffff8
8000d74e:	000a                	c.slli	zero,0x2
8000d750:	3249                	jal	8000d0d2 <__hexnan+0x6c>
8000d752:	75622043          	.insn	4, 0x75622043
8000d756:	73692073          	.insn	4, 0x73692073
8000d75a:	7220                	.insn	2, 0x7220
8000d75c:	6165                	addi	sp,sp,112
8000d75e:	7964                	.insn	2, 0x7964
8000d760:	000a                	c.slli	zero,0x2
8000d762:	0000                	unimp
8000d764:	3249                	jal	8000d0e6 <__hexnan+0x80>
8000d766:	75622043          	.insn	4, 0x75622043
8000d76a:	73692073          	.insn	4, 0x73692073
8000d76e:	6320                	.insn	2, 0x6320
8000d770:	656c                	.insn	2, 0x656c
8000d772:	7261                	lui	tp,0xffff8
8000d774:	6465                	lui	s0,0x19
8000d776:	000a                	c.slli	zero,0x2
8000d778:	6166                	.insn	2, 0x6166
8000d77a:	6c69                	lui	s8,0x1a
8000d77c:	6465                	lui	s0,0x19
8000d77e:	7420                	.insn	2, 0x7420
8000d780:	6e69206f          	j	8009fe66 <__fast_load_addr__+0x91ca6>
8000d784:	7469                	lui	s0,0xffffa
8000d786:	6169                	addi	sp,sp,208
8000d788:	696c                	.insn	2, 0x696c
8000d78a:	657a                	.insn	2, 0x657a
8000d78c:	6920                	.insn	2, 0x6920
8000d78e:	6332                	.insn	2, 0x6332
8000d790:	3020                	.insn	2, 0x3020
8000d792:	2578                	.insn	2, 0x2578
8000d794:	786c                	.insn	2, 0x786c
8000d796:	000a                	c.slli	zero,0x2
8000d798:	6c28                	.insn	2, 0x6c28
8000d79a:	6e65                	lui	t3,0x19
8000d79c:	20687467          	.insn	4, 0x20687467
8000d7a0:	2026                	.insn	2, 0x2026
8000d7a2:	6c28                	.insn	2, 0x6c28
8000d7a4:	6e65                	lui	t3,0x19
8000d7a6:	20687467          	.insn	4, 0x20687467
8000d7aa:	202d                	jal	8000d7d4 <_lseek+0x49c>
8000d7ac:	5531                	li	a0,-20
8000d7ae:	2929                	jal	8000dbc8 <s_wdgs+0x1f0>
8000d7b0:	3d20                	.insn	2, 0x3d20
8000d7b2:	203d                	jal	8000d7e0 <_lseek+0x4a8>
8000d7b4:	5530                	lw	a2,104(a0)
8000d7b6:	0000                	unimp
8000d7b8:	6d6f682f          	.insn	4, 0x6d6f682f
8000d7bc:	2f65                	jal	8000df74 <_ctype_+0x13c>
8000d7be:	6976                	.insn	2, 0x6976
8000d7c0:	726f7463          	bgeu	t5,t1,8000dee8 <_ctype_+0xb0>
8000d7c4:	636f442f          	.insn	4, 0x636f442f
8000d7c8:	6d75                	lui	s10,0x1d
8000d7ca:	6e65                	lui	t3,0x19
8000d7cc:	7374                	.insn	2, 0x7374
8000d7ce:	6d6f432f          	.insn	4, 0x6d6f432f
8000d7d2:	7570                	.insn	2, 0x7570
8000d7d4:	6574                	.insn	2, 0x6574
8000d7d6:	5272                	lw	tp,60(sp)
8000d7d8:	7365                	lui	t1,0xffff9
8000d7da:	6165                	addi	sp,sp,112
8000d7dc:	6372                	.insn	2, 0x6372
8000d7de:	2f68                	.insn	2, 0x2f68
8000d7e0:	4952                	lw	s2,20(sp)
8000d7e2:	562d4353          	.insn	4, 0x562d4353
8000d7e6:	7261622f          	.insn	4, 0x7261622f
8000d7ea:	69746f73          	.insn	4, 0x69746f73
8000d7ee:	685f6e6f          	jal	t3,80104672 <__fast_load_addr__+0xf64b2>
8000d7f2:	6d70                	.insn	2, 0x6d70
8000d7f4:	735f 6b64 622f      	.insn	6, 0x622f6b64735f
8000d7fa:	6472616f          	jal	sp,80034640 <__fast_load_addr__+0x26480>
8000d7fe:	616b2f73          	.insn	4, 0x616b2f73
8000d802:	2f32                	.insn	2, 0x2f32
8000d804:	6f62                	.insn	2, 0x6f62
8000d806:	7261                	lui	tp,0xffff8
8000d808:	2e64                	.insn	2, 0x2e64
8000d80a:	73280063          	beq	a6,s2,8000df2a <_ctype_+0xf2>
8000d80e:	6174                	.insn	2, 0x6174
8000d810:	7472                	.insn	2, 0x7472
8000d812:	615f 6464 2072      	.insn	6, 0x20726464615f
8000d818:	2026                	.insn	2, 0x2026
8000d81a:	6c28                	.insn	2, 0x6c28
8000d81c:	6e65                	lui	t3,0x19
8000d81e:	20687467          	.insn	4, 0x20687467
8000d822:	202d                	jal	8000d84c <_lseek+0x514>
8000d824:	5531                	li	a0,-20
8000d826:	2929                	jal	8000dc40 <s_wdgs+0x268>
8000d828:	3d20                	.insn	2, 0x3d20
8000d82a:	203d                	jal	8000d858 <_lseek+0x520>
8000d82c:	5530                	lw	a2,104(a0)
8000d82e:	0000                	unimp
8000d830:	6146                	.insn	2, 0x6146
8000d832:	6c69                	lui	s8,0x1a
8000d834:	6465                	lui	s0,0x19
8000d836:	7420                	.insn	2, 0x7420
8000d838:	6573206f          	j	8004068e <__fast_load_addr__+0x324ce>
8000d83c:	2074                	.insn	2, 0x2074
8000d83e:	6c70                	.insn	2, 0x6c70
8000d840:	306c                	.insn	2, 0x306c
8000d842:	635f 6b6c 2030      	.insn	6, 0x20306b6c635f
8000d848:	6f74                	.insn	2, 0x6f74
8000d84a:	2520                	.insn	2, 0x2520
8000d84c:	646c                	.insn	2, 0x646c
8000d84e:	7a48                	.insn	2, 0x7a48
8000d850:	000a                	c.slli	zero,0x2
	...
8000d85a:	0000                	unimp
8000d85c:	e360                	.insn	2, 0xe360
8000d85e:	4176                	lw	sp,92(sp)
8000d860:	0000                	unimp
8000d862:	0000                	unimp
8000d864:	0000                	unimp
8000d866:	4170                	lw	a2,68(a0)
8000d868:	0000                	unimp
8000d86a:	0000                	unimp
8000d86c:	0000                	unimp
8000d86e:	3fe0                	.insn	2, 0x3fe0
8000d870:	6e6e                	.insn	2, 0x6e6e
8000d872:	7070                	.insn	2, 0x7070
8000d874:	7070                	.insn	2, 0x7070
8000d876:	7272                	.insn	2, 0x7272
8000d878:	7272                	.insn	2, 0x7272
8000d87a:	7474                	.insn	2, 0x7474
8000d87c:	7474                	.insn	2, 0x7474
8000d87e:	7676                	.insn	2, 0x7676
8000d880:	7876                	.insn	2, 0x7876
8000d882:	7878                	.insn	2, 0x7878
8000d884:	7a78                	.insn	2, 0x7a78
8000d886:	7a7a                	.insn	2, 0x7a7a
8000d888:	7c7a                	.insn	2, 0x7c7a
8000d88a:	7c7c                	.insn	2, 0x7c7c
8000d88c:	7e7e                	.insn	2, 0x7e7e
8000d88e:	7e7e                	.insn	2, 0x7e7e
8000d890:	427a                	lw	tp,156(sp)
8000d892:	8000                	.insn	2, 0x8000
8000d894:	41e6                	lw	gp,88(sp)
8000d896:	8000                	.insn	2, 0x8000
8000d898:	4180                	lw	s0,0(a1)
8000d89a:	8000                	.insn	2, 0x8000
8000d89c:	4180                	lw	s0,0(a1)
8000d89e:	8000                	.insn	2, 0x8000
8000d8a0:	4180                	lw	s0,0(a1)
8000d8a2:	8000                	.insn	2, 0x8000
8000d8a4:	427a                	lw	tp,156(sp)
8000d8a6:	8000                	.insn	2, 0x8000

8000d8a8 <__clz_tab>:
8000d8a8:	0100 0202 0303 0303 0404 0404 0404 0404     ................
8000d8b8:	0505 0505 0505 0505 0505 0505 0505 0505     ................
8000d8c8:	0606 0606 0606 0606 0606 0606 0606 0606     ................
8000d8d8:	0606 0606 0606 0606 0606 0606 0606 0606     ................
8000d8e8:	0707 0707 0707 0707 0707 0707 0707 0707     ................
8000d8f8:	0707 0707 0707 0707 0707 0707 0707 0707     ................
8000d908:	0707 0707 0707 0707 0707 0707 0707 0707     ................
8000d918:	0707 0707 0707 0707 0707 0707 0707 0707     ................
8000d928:	0808 0808 0808 0808 0808 0808 0808 0808     ................
8000d938:	0808 0808 0808 0808 0808 0808 0808 0808     ................
8000d948:	0808 0808 0808 0808 0808 0808 0808 0808     ................
8000d958:	0808 0808 0808 0808 0808 0808 0808 0808     ................
8000d968:	0808 0808 0808 0808 0808 0808 0808 0808     ................
8000d978:	0808 0808 0808 0808 0808 0808 0808 0808     ................
8000d988:	0808 0808 0808 0808 0808 0808 0808 0808     ................
8000d998:	0808 0808 0808 0808 0808 0808 0808 0808     ................

8000d9a8 <__func__.0>:
8000d9a8:	6f62 7261 5f64 6e69 7469 705f 706d 0000     board_init_pmp..

8000d9b8 <s_adc_clk_mux_node>:
8000d9b8:	0007 0000 0030 0000 0031 0000 0032 0000     ....0...1...2...

8000d9c8 <s_i2s_clk_mux_node>:
8000d9c8:	0007 0000 0033 0000 0034 0000 0035 0000     ....3...4...5...

8000d9d8 <s_wdgs>:
8000d9d8:	0000 f009 4000 f009 8000 f009 c000 f009     .....@..........
8000d9e8:	202c 7566 636e 6974 6e6f 203a 0000 0000     , function: ....
8000d9f8:	7361 6573 7472 6f69 206e 2522 2273 6620     assertion "%s" f
8000da08:	6961 656c 3a64 6620 6c69 2065 2522 2273     ailed: file "%s"
8000da18:	202c 696c 656e 2520 2564 2573 0a73 0000     , line %d%s%s...
8000da28:	4e49 0046 6e69 0066 414e 004e 616e 006e     INF.inf.NAN.nan.
8000da38:	0030 0000 3130 3332 3534 3736 3938 4241     0...0123456789AB
8000da48:	4443 4645 0000 0000 3130 3332 3534 3736     CDEF....01234567
8000da58:	3938 6261 6463 6665 0000 0000 2565 646c     89abcdef....e%ld
8000da68:	0000 0000 6e49 6966 696e 7974 0000 0000     ....Infinity....
8000da78:	614e 004e 4552 4e45 2054 616d 6c6c 636f     NaN.REENT malloc
8000da88:	7320 6375 6563 6465 6465 0000 682f 6d6f      succeeded../hom
8000da98:	2f65 6976 7463 726f 442f 636f 6d75 6e65     e/victor/Documen
8000daa8:	7374 432f 6d6f 7570 6574 5272 7365 6165     ts/ComputerResea
8000dab8:	6372 2f68 6972 6373 2d76 6e67 2d75 6f74     rch/riscv-gnu-to
8000dac8:	6c6f 6863 6961 2f6e 656e 6c77 6269 6e2f     olchain/newlib/n
8000dad8:	7765 696c 2f62 696c 6362 732f 6474 696c     ewlib/libc/stdli
8000dae8:	2f62 7464 616f 632e 0000 0000 6142 6c6c     b/dtoa.c....Ball
8000daf8:	636f 7320 6375 6563 6465 6465 0000 0000     oc succeeded....
8000db08:	682f 6d6f 2f65 6976 7463 726f 442f 636f     /home/victor/Doc
8000db18:	6d75 6e65 7374 432f 6d6f 7570 6574 5272     uments/ComputerR
8000db28:	7365 6165 6372 2f68 6972 6373 2d76 6e67     esearch/riscv-gn
8000db38:	2d75 6f74 6c6f 6863 6961 2f6e 656e 6c77     u-toolchain/newl
8000db48:	6269 6e2f 7765 696c 2f62 696c 6362 732f     ib/newlib/libc/s
8000db58:	6474 696c 2f62 706d 6572 2e63 0063 0000     tdlib/mprec.c...
8000db68:	002e 0000 666e 0000 6e69 7469 0079 0000     ....nf..inity...
8000db78:	6e61 0000 2d23 2b30 0020 0000 6c68 004c     an..#-0+ ...hlL.
8000db88:	6665 4567 4746 0000 0043 0000 4f50 4953     efgEFG..C...POSI
8000db98:	0058 0000 682f 6d6f 2f65 6976 7463 726f     X.../home/victor
8000dba8:	442f 636f 6d75 6e65 7374 432f 6d6f 7570     /Documents/Compu
8000dbb8:	6574 5272 7365 6165 6372 2f68 6972 6373     terResearch/risc
8000dbc8:	2d76 6e67 2d75 6f74 6c6f 6863 6961 2f6e     v-gnu-toolchain/
8000dbd8:	656e 6c77 6269 6e2f 7765 696c 2f62 696c     newlib/newlib/li
8000dbe8:	6362 732f 6474 696c 2f62 6467 6f74 2d61     bc/stdlib/gdtoa-
8000dbf8:	6567 6874 7865 632e 0000 0000 8b64 8000     gethex.c....d...
8000dc08:	8b7a 8000 8b40 8000 8b40 8000 8b40 8000     z...@...@...@...
8000dc18:	8b40 8000 8b7a 8000 8b40 8000 8b40 8000     @...z...@...@...
8000dc28:	8b40 8000 8b40 8000 8cf0 8000 8bb8 8000     @...@...........
8000dc38:	8c8a 8000 8b40 8000 8b40 8000 8d20 8000     ....@...@... ...
8000dc48:	8b40 8000 8bb8 8000 8b40 8000 8b40 8000     @.......@...@...
8000dc58:	8c96 8000 8f50 8000 8e06 8000 8e06 8000     ....P...........
8000dc68:	8e06 8000 8fb0 8000 8f88 8000 8e06 8000     ................
8000dc78:	8e06 8000 8f5a 8000 8e06 8000 8e06 8000     ....Z...........
8000dc88:	8e06 8000 8e06 8000 8f16 8000 8f04 8000     ................
8000dc98:	8e06 8000 8f04 8000 8f9c 8000 8e06 8000     ................
8000dca8:	8eaa 8000 8eea 8000 8eea 8000 8eea 8000     ................
8000dcb8:	8eea 8000 8eea 8000 8eea 8000 8eea 8000     ................
8000dcc8:	8eea 8000 8eea 8000                         ........

8000dcd0 <p05.0>:
8000dcd0:	0005 0000 0019 0000 007d 0000 0000 0000     ........}.......

8000dce0 <__mprec_bigtens>:
8000dce0:	8000 37e0 c379 4341 6e17 b505 b8b5 4693     ...7y.AC.n.....F
8000dcf0:	f9f5 e93f 4f03 4d38 1d32 f930 7748 5a82     ..?..O8M2.0.Hw.Z
8000dd00:	bf3c 7f73 4fdd 7515                         <.s..O.u

8000dd08 <__mprec_tens>:
8000dd08:	0000 0000 0000 3ff0 0000 0000 0000 4024     .......?......$@
8000dd18:	0000 0000 0000 4059 0000 0000 4000 408f     ......Y@.....@.@
8000dd28:	0000 0000 8800 40c3 0000 0000 6a00 40f8     .......@.....j.@
8000dd38:	0000 0000 8480 412e 0000 0000 12d0 4163     .......A......cA
8000dd48:	0000 0000 d784 4197 0000 0000 cd65 41cd     .......A....e..A
8000dd58:	0000 2000 a05f 4202 0000 e800 4876 4237     ... _..B....vH7B
8000dd68:	0000 a200 1a94 426d 0000 e540 309c 42a2     ......mB..@..0.B
8000dd78:	0000 1e90 bcc4 42d6 0000 2634 6bf5 430c     .......B..4&.k.C
8000dd88:	8000 37e0 c379 4341 a000 85d8 3457 4376     ...7y.AC....W4vC
8000dd98:	c800 674e c16d 43ab 3d00 6091 58e4 43e1     ..Ngm..C.=.`.X.C
8000dda8:	8c40 78b5 af1d 4415 ef50 d6e2 1ae4 444b     @..x...DP.....KD
8000ddb8:	d592 064d f0cf 4480 4af6 c7e1 2d02 44b5     ..M....D.J...-.D
8000ddc8:	9db4 79d9 7843 44ea b08c 8000 b064 8000     ...yCx.D....d...
8000ddd8:	b0a4 8000 b0aa 8000 b08c 8000               ............

8000dde4 <fpinan.0>:
8000dde4:	0034 0000 fbce ffff 03cb 0000 0001 0000     4...............
8000ddf4:	0000 0000                                   ....

8000ddf8 <fpi.1>:
8000ddf8:	0035 0000 fbce ffff 03cb 0000 0001 0000     5...............
	...

8000de10 <tinytens>:
8000de10:	89bc 97d8 d2b2 3c9c a733 d5a8 f623 3949     .......<3...#.I9
8000de20:	a73d 44f4 0ffd 32a5 979d cf8c ba08 255b     =..D...2......[%
8000de30:	6f43 64ac 0628 1168                         Co.d(.h.

8000de38 <_ctype_>:
8000de38:	2000 2020 2020 2020 2020 2828 2828 2028     .         ((((( 
8000de48:	2020 2020 2020 2020 2020 2020 2020 2020                     
8000de58:	8820 1010 1010 1010 1010 1010 1010 1010      ...............
8000de68:	0410 0404 0404 0404 0404 1004 1010 1010     ................
8000de78:	1010 4141 4141 4141 0101 0101 0101 0101     ..AAAAAA........
8000de88:	0101 0101 0101 0101 0101 0101 1010 1010     ................
8000de98:	1010 4242 4242 4242 0202 0202 0202 0202     ..BBBBBB........
8000dea8:	0202 0202 0202 0202 0202 0202 1010 1010     ................
8000deb8:	0020 0000 0000 0000 0000 0000 0000 0000      ...............
	...
8000df40:	ffff ffff ffff 7fef 0000 0000 0000 3ff8     ...............?
8000df50:	4361 636f 87a7 3fd2 c8b3 8b60 8a28 3fc6     aCoc...?..`.(..?
8000df60:	79fb 509f 4413 3fd3 0000 0000 0000 3ff0     .y.P.D.?.......?
8000df70:	0000 0000 0000 4024 0000 0000 0000 401c     ......$@.......@
8000df80:	0000 0000 0000 4014 0000 0000 0000 3fe0     .......@.......?
8000df90:	0000 0000 0000 4000 0000 ffc0 ffff 41df     .......@.......A
8000dfa0:	3595 94a0 ffff 3fdf e535 35af 0000 3fe0     .5.....?5..5...?
8000dfb0:	3595 94a0 ffff 3fcf 0000 0000 0000 3950     .5.....?......P9
8000dfc0:	0000 0000 0000 7ff8 0000 7fc0 0000 0000     ................
