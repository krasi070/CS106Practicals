# --------------------------------
# CS106 Practical Assignment 4(b)
# Converting ARGB to greyscale
# --------------------------------

# sample input data

.text
      li    $a0, 0xFF807F00

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Convert the ARGB colour in $a0 to grayscale.
# Use the formula grey = (5r + 9g + 2b) / 16.
# Place the result in $v0.
# Do not use mul or div.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

      li     $t0, 0x00FF0000         # t0 is a mask
      and    $t1, $a0, $t0           # t1 = red
      srl    $t1, $t1, 16            # place value of t1 in the least significant byte
      sll    $t2, $t1, 2             # t2 = 4 * t1
      add    $t1, $t1, $t2           # t1 = 5 * t1
      
      srl    $t0, $t0, 8             # shift the mask to next channel
      and    $t2, $a0, $t0           # t2 = green
      srl    $t2, $t2, 8             # place value of t2 in the least significant byte
      sll    $t3, $t2, 3             # t2 = 8 * t2
      add    $t2, $t2, $t3           # t2 = 9 * t2
      
      srl    $t0, $t0, 8             # shift the mask to next channel
      and    $t3, $a0, $t0           # t3 = blue
      sll    $t3, $t3, 1             # t3 = 2 * t3
      
      add    $v0, $t1, $t2           # v0 = t1 + t2
      add    $v0, $v0, $t3           # v0 = v0 + t3
      srl    $v0, $v0, 4             # v0 = v0 / 16
      
      sll    $t0, $v0, 8             # place value in second byte
      sll    $t1, $v0, 16            # place value in third byte
      add    $v0, $v0, $t0           # v0 has the two least significant bytes
      add    $v0, $v0, $t1           # v0 has the three least significant bits
      ori    $v0, $v0, 0xFF000000    # place the alpha value
      
# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-4b-Tests.asm"
