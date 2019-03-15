# --------------------------------
# CS106 Practical Assignment 4(a)
# Blending ARGB colours
# --------------------------------

# sample input data

.text
      li    $a0, 0xFF807F00
      li    $a1, 0xFFFF3FFF

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Blend the ARGB colours in $a0 and $a1.
# Place the result in $v0.
# Do not use mul or div.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

      li      $t0, 0x00FF0000    # t0 is a mask
      li      $v0, 0xFF000000    # init the result
 Loop:
      and     $t1, $a0, $t0      # get the current channel of the colour in a0
      and     $t2, $a1, $t0      # get the current channel of the colour in a1
      add     $t1, $t1, $t2      # t1 = t1 + t2
      srl     $t1, $t1, 1        # halve the value in t1
      and     $t1, $t1, $t0      # remove unnecassry bit
      or      $v0, $v0, $t1      # place the blended value in v0
      srl     $t0, $t0, 8        # shift the mask to get the next channel
      bgtz    $t0, Loop          # loop if there is still a next channel

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-4a-Tests.asm"
