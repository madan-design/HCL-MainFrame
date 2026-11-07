       IDENTIFICATION DIVISION.
       PROGRAM-ID. BUBBLESORT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-ARR.
           05 WS-NUM       PIC 9(3) OCCURS 6 TIMES.
       01  I               PIC 9.
       01  J               PIC 9.
       01  TEMP            PIC 9(3).

       PROCEDURE DIVISION.
           MOVE 45 TO WS-NUM(1)
           MOVE 12 TO WS-NUM(2)
           MOVE 89 TO WS-NUM(3)
           MOVE 33 TO WS-NUM(4)
           MOVE 10 TO WS-NUM(5)
           MOVE 57 TO WS-NUM(6)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 6 - I
                   IF WS-NUM(J) > WS-NUM(J + 1)
                       MOVE WS-NUM(J) TO TEMP
                       MOVE WS-NUM(J + 1) TO WS-NUM(J)
                       MOVE TEMP TO WS-NUM(J + 1)
                   END-IF
               END-PERFORM
           END-PERFORM

           DISPLAY "17 - SORTED VALUES"
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
               DISPLAY WS-NUM(I)
           END-PERFORM
           STOP RUN.