.org 0x0
.global _start
.set noat

_start:
    /*
    ori     $1, $0, 0x0001
    ori     $2, $1, 0x0010
    ori     $3, $1, 0x0100

    ori     $4, $1, 0x1000
    andi    $5, $4, 0x0000
    xori    $6, $4, 0x1001
    lui     $7, 0x1111

    and     $8, $1, $4 
    or      $9, $1, $4
    xor     $10, $1, $4
    nor     $11, $1, $4

    sll     $12, $1, 2
    sllv    $13, $1, $2
    sra     $14, $4, 2 
    srav    $15, $4, $2
    srl     $16, $4, 2
    srlv    $17, $4, $2
    */
    ori     $1, $0, 0x0001
    movz    $2, $1, $0
    movn    $3, $0, $1

    mthi    $2
    mtlo    $3
    mfhi    $4
    mflo    $5
