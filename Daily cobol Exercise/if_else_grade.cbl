       IDENTIFICATION DIVISION.
       PROGRAM-ID. IFELSEGRADE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-MARKS        PIC 9(3) VALUE 78.

       PROCEDURE DIVISION.
           DISPLAY "05 - IF/ELSE GRADE"
           IF WS-MARKS >= 90
               DISPLAY "GRADE: A"
           ELSE
               IF WS-MARKS >= 75
                   DISPLAY "GRADE: B"
               ELSE
                   IF WS-MARKS >= 60
                       DISPLAY "GRADE: C"
                   ELSE
                       DISPLAY "GRADE: D"
                   END-IF
               END-IF
           END-IF
           STOP RUN.