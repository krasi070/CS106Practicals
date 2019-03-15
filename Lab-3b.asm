# --------------------------------
# CS106 Practical Assignment 3(b)
# Making a string uppercase
# --------------------------------

# sample input data

.data
S:    .asciiz "Convert this string from lower to upper case!"
.text
      la    $a0, S

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# The address of the first character of a null-terminated string
# will be in $a0. Convert the string to uppercase.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

Loop:
      lbu     $t0, ($a0)          # t0 = A[i]
      beqz    $t0, EndLoop        # end loop if NULL character has been reached
      ble     $t0, 0x60, EndIf    # if (t0 > 60)
      bge     $t0, 0x7B, EndIf    # if (t0 < 7B)
      sub     $t0, $t0, 0x20      # change t0 to uppercase
      sb      $t0, ($a0)          # address = t0
EndIf:
      add     $a0, $a0, 0x01      # a0++
      j       Loop                # loop back
EndLoop:

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
#.include "Lab-3b-Tests.asm"
