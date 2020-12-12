# Computer-Architecture-Lab
## System calls ##

| **Service** | **System Call Code** | **Arguments** | **Results** |
|:---------|:--------------------|:--------------|:-------------------|
| print_int     | 1      | `$a0 = integer` |             |
| print_float     | 2      | `$f12 = float` |             |
| print_double     | 3      | `$f12 = double` |             |
| print_string     | 4      | `$a0 = string` |             |
| read_int     | 5      |  | `integer (in $v0)`           |
| read_float     | 6      |  | `float (in $f0)`           |
| read_double     | 7      |  | `double (in $f0)`           |
| read_string     | 8      | `$a0 = buffer, $a1 = length` |            |
| sbrk     | 9      | `$a0 = amount` | `address (in $v0)` |
| exit     | 10      | | |
| print_character     | 11      | `$a0 = character` |             |
| read_character     | 12       |  | `character (in $v0)`           |
| open     | 13      | `$a0 = filename` | `file descriptor (in $v0)` |
|        |       | `$a1 = flags, $a2 = mode` |  |
| read     | 14      | `$a0 = file descriptor` | `bytes read (in $v0)` |
|        |       | `$a1 = buffer, $a2 = count` |  |
| write     | 15      | `$a0 = file descriptor` | `bytes read (in $v0)` |
|        |       | `$a1 = buffer, $a2 = count` |  |
| close     | 16      | `$a0 = file descriptor` | `0 (in $v0)` |
| exit2     | 17      | `$a0 = value` |  |


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

### Floating Point Instructions ###
FP Arithmetic Instructions
| **Instruction** | **Meaning** |
|:---------|:--------------------|
| add.s fd, fs, ft      | `(fd) = (fs) + (ft)`|
| add.d fd, fs, ft      | `(fd) = (fs) + (ft)`|
| sub.s fd, fs, ft      | `(fd) = (fs) - (ft)`|
| sub.d fd, fs, ft      | `(fd) = (fs) - (ft)`|
| mul.s fd, fs, ft      | `(fd) = (fs) * (ft)`|
| mul.d fd, fs, ft      | `(fd) = (fs) * (ft)`|
| div.s fd, fs, ft      | `(fd) = (fs) / (ft)`|
| div.d fd, fs, ft      | `(fd) = (fs) / (ft)`|
| sqrt.s fd, fs      | `(fd) = sqrt(fs)`|
| sqrt.d fd, fs      | `(fd) = sqrt(fs)`|
| abs.s fd, fs      | `(fd) = abs(fs)`|
| abs.d fd, fs      | `(fd) = abs(fs)`|
| neg.s fd, fs      | `(fd) = -(fs)`|
| neg.d fd, fs      | `(fd) = -(fs)`|

### FP Load/Store Instructions ###
| **Instruction** | **Meaning** |
|:---------|:--------------------|
| lwc1 $f2, 40($t0)      | `(f2) = Mem[($t0+40)]`|
| ldc1 $f2, 40($t0)      | `(f2) = Mem[($t0+40)]`|
| swc1 $f2, 40($t0)      | `Mem[($t0+40)] = (f2)`|
| sdc1 $f2, 40($t0)      | `Mem[($t0+40)] = (f2)`|

### FP Load/Store pseudo instructions ###
| **Instruction** | **Meaning** |
|:---------|:--------------------|
| l.s      | `lwc1 (load FP single)`|
| s.s      | `swc1 (store FP single)`|
| l.d      | `ldc1 (load FP double)`|
| s.d      | `sdc1 (store FP double)`|

Loading immediate value:
li.s fd, value

### FP Data Movement Instructions ###
| **Instruction** | **Meaning** |
|:---------|:--------------------|
| mfc1 $t0, $f2      |`($t0) = ($f2)`|
| mtc1 $t0, $f2      |`($f2) = ($t0)`|
| mov.s $f4, $f2      |`($f4) = ($f2)`|
| mov.d $f4, $f2      |`($f4) = ($f2)`|

### FP Convert Instructions ###
| **Instruction** | **Meaning** |
|:---------|:--------------------|
| cvt.s.w fd, fs     |`to single form integer`|
| cvt.s.d fd, fs     |`to single form double`|
| cvt.d.w fd, fs     |`to double form integer`|
| cvt.d.s fd, fs     |`to double form single`|
| cvt.w.s fd, fs     |`to integer form single`|
| cvt.w.d fd, fs     |`to integer form double`|

### PLayLists ###
1. <a>https://www.youtube.com/playlist?list=PL5b07qlmA3P6zUdDf-o97ddfpvPFuNa5A</a>
2. <a>https://youtu.be/dQw4w9WgXcQ</a>
---
