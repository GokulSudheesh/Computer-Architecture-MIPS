# Computer-Architecture-Lab
## Pseudo-instructions ##

In MIPS, some operations can be performed with help of other instructions.
The most common operations are unified in **pseudo-instructions** — they can be coded in assembly language, and assembler will expand them to real instructions. The exact expansion is compiler-defined, but the result should be similar to ours:

### Data moves ###

| **Name** | **Assembly syntax** | **Expansion** | **Operation in C** |
|:---------|:--------------------|:--------------|:-------------------|
| move     | `move $t, $s`       | `or $t, $s, $zero` | `t = s`            |
| clear    | `clear $t`          | `or $t, $zero, $zero` | `t = 0`            |
| load 16-bit immediate | `li $t, C` | `ori $t, $zero, C_lo` | `t = C` |
| load 32-bit immediate | `li $t, C` | `lui $t, C_hi`<br />`ori $t, $t, C_lo` | `t = C` |
| load label address | `la $t, A` | `lui $t, A_hi`<br />`ori $t, $t, A_lo` | `t = A` |

### Branches ###

| **Name** | **Assembly syntax** | **Expansion** |
|:---------|:--------------------|:--------------|
| branch unconditionally | `b C`               | `beq $zero, $zero, C` |
| branch unconditionally<br/>and link | `bal C`             | `bgezal $zero, C` |
| branch if greater than | `bgt $s, $t, C`     | `slt $at, $t, $s`<br />`bne $at, $zero, C`|
| branch if less than | `blt $s, $t, C`     | `slt $at, $s, $t`<br />`bne $at, $zero, C`|
| branch if greater than<br/>or equal | `bge $s, $t, C`     | `slt $at, $s, $t`<br />`beq $at, $zero, C`|
| branch if less than<br/>or equal | `ble $s, $t, C`     | `slt $at, $t, $s`<br />`beq $at, $zero, C`|
| branch if greater than<br/>unsigned | `bgtu $s, $t, C`    | `sltu $at, $t, $s`<br />`bne $at, $zero, C`|
| branch if zero | `beqz $s, C`        | `beq $s, $zero, C`|
| branch if equal to immediate | `beq $t, V, C` | `ori $at, $zero, V`<br />`beq $t, $at, C`|
| branch if not equal to immediate | `bne $t, V, C` | `ori $at, $zero, V`<br />`bne $t, $at, C`|

### Multiplication/Division ###

| **Name** | **Assembly syntax** | **Expansion** | **Operation in C** |
|:---------|:--------------------|:--------------|:-------------------|
| multiplicate<br/>and return 32 bits | `mul $d, $s, $t`    | `mult $s, $t`<br />`mflo $d` | `d = (s * t) & 0xFFFFFFFF` |
| quotient | `div $d, $s, $t`    | `div $s, $t`<br />`mflo $d` | `d = s / t`        |
| remainder | `rem $d, $s, $t`    | `div $s, $t`<br />`mfhi $d` | `d = s % t`        |

### Jumps ###

| **Name** | **Assembly syntax** | **Expansion** | **Operation in C** |
|:---------|:--------------------|:--------------|:-------------------|
| jump register and link to ra | `jalr $s`        | `jalr $s, $ra` | `ra = PC + 4; goto s;` |

### Logical operations ###

| **Name** | **Assembly syntax** | **Expansion** | **Operation in C** |
|:---------|:--------------------|:--------------|:-------------------|
| not      | `not $t, $s`        | `nor $t, $s, $zero` | `t = ~s`           |

### No-operations ###

| **Name** | **Assembly syntax** | **Expansion** | **Operation in C** |
|:---------|:--------------------|:--------------|:-------------------|
| nop      | `nop`               | `sll $zero, $zero, 0` | `{}`               |



In fact, every MIPS instruction that has `$zero` as its destination and doesn't touch memory, access I/O system, and/or call a trap, can be treated as a `nop`; but using `sll $zero, $zero, 0` is the most convenient because it's byte code is all-zeroes `0x00000000`.

---

### Should we implement pseudo-instructions ###

Since 2014/2015, all instructions are printed as real MIPS instructions in MIPT-MIPS. Unexpanded pseudo-instructions are left only in testing traces source files (`.s` files).
