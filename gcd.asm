; This subroutine computes the GCD of unsigned integers a and b using Euclid's Algorithm
; (Subtraction). The values a, b are both 8-bit values stored in memory, and
; the values of a and b are modified throughout the subroutine, which means that the
; original a and b values are destroyed. At the end of the subroutine, the GCD of the
; original a and b values is stored in the variable a and the accumulator. This subroutine
; assumes the inputs are unsigned, so there is no checking for signed integers.
;
; Revision History
;     11 Feb 26  Wilson Duan      Initial revision


            start:
                LDD   b			        ;get the value of b in accumulator
                CMPI  0                 ;check if b is 0, populates flags
                JZ    Done		        ;if b is 0, we're done
                NOP                     ;branch slot

            SubtractLoop:		        ;subtract b from a until a is less than b
                LDD   a
                CMP   b
                JB    Swap              ;if a < b, then call swap function
                NOP                     ;branch slot
                LDD   a
                SUB   b                 ;this line and the below line does
                STD   a                 ;a = a - b
                JMP   SubtractLoop      ;continue the subtraction loop
                NOP                     ;branch slot
            
            Swap:
                LDD   a                 ;get a
                TAX                     ;and put it in X temporarily
                LDD   b                 ;now get b
                STD   a                 ;and store it in a
                TXA                     ;get original a back
                STD   b                 ;and store it in b
                JMP   start             ;jump back to start to keep looping
                NOP                     ;branch slot
                

            Done:			            ;done with the calculation
                LDD   a			        ;load a into the accumulator since a is the GCD
                RTS                     ;and return



;Variables
        a       DB    ?			;the first number for which the GCD will be computed
        b       DB    ?			;the second number for which the GCD will be computed
