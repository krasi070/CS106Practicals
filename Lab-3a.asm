# --------------------------------
# CS106 Practical Assignment 3(a)
# Making a character uppercase
# --------------------------------

# sample input data

.data
S:    .asciiz "x"
.text
      la     $a0, S           

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# The address of an ASCII character will be in $a0. If the
# character is a lower case letter, replace it (in memory) with
# its upper case version. Otherwise don't change it.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

      lbu    $t0, ($a0)          # to = S[0]
      ble    $t0, 0x60, EndIf    # if (t0 > 60)
      bge    $t0, 0x7B, EndIf    # if (t0 < 7B)
      sub    $t0, $t0, 0x20      # change t0 to uppercase
      sb     $t0, ($a0)          # address of a0 = t0
EndIf:


# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-3a-Tests.asm"
