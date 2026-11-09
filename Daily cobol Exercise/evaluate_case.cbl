       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVALCASE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-TRANS-TYPE   PIC X VALUE "D".

       PROCEDURE DIVISION.
           DISPLAY "19 - EVALUATE CASE"
           EVALUATE WS-TRANS-TYPE
               WHEN "D"
                   DISPLAY "DEPOSIT TRANSACTION"
               WHEN "W"
                   DISPLAY "WITHDRAWAL TRANSACTION"
               WHEN "T"
                   DISPLAY "TRANSFER TRANSACTION"
               WHEN OTHER
                   DISPLAY "UNKNOWN TRANSACTION"
           END-EVALUATE
           STOP RUN.