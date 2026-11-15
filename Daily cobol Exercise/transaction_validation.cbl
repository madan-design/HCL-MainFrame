       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRANSVAL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-AMOUNT       PIC 9(6)V99 VALUE 25000.00.
       01  WS-TYPE         PIC X VALUE "W".
       01  WS-BALANCE      PIC 9(7)V99 VALUE 40000.00.

       PROCEDURE DIVISION.
           DISPLAY "25 - TRANSACTION VALIDATION"
           EVALUATE WS-TYPE
               WHEN "D"
                   ADD WS-AMOUNT TO WS-BALANCE
                   DISPLAY "DEPOSIT SUCCESS"
               WHEN "W"
                   IF WS-AMOUNT <= WS-BALANCE
                       SUBTRACT WS-AMOUNT FROM WS-BALANCE
                       DISPLAY "WITHDRAWAL SUCCESS"
                   ELSE
                       DISPLAY "INSUFFICIENT FUNDS"
                   END-IF
               WHEN OTHER
                   DISPLAY "INVALID TRANSACTION TYPE"
           END-EVALUATE
           DISPLAY "NEW BALANCE: " WS-BALANCE
           STOP RUN.