.data
.text
    main:   addi       $fp    ,$zero    ,32767
            addi       $sp      ,$fp        ,0
            addi        $8    ,$zero    ,64512
            addi       $t8    ,$zero        ,0
              sw      $t8,     0($8)
  label2:      j    label3
  label3:   addi        $9    ,$zero    ,64528
              lw       $10    ,0($9)
  label6:   addi       $11    ,$zero    ,64512
              sw      $10,    0($11)
               j    label2
  label9:   addi       $v0    ,$zero        ,0