       IDENTIFICATION DIVISION.
       PROGRAM-ID. TABSEARCH.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-TABLE.
           05 WS-VAL       PIC 9(3) OCCURS 5 TIMES.
       01  WS-I            PIC 9 VALUE 1.
       01  WS-TARGET       PIC 9(3) VALUE 205.
       01  WS-FOUND        PIC X VALUE "N".

       PROCEDURE DIVISION.
           MOVE 101 TO WS-VAL(1)
           MOVE 205 TO WS-VAL(2)
           MOVE 309 TO WS-VAL(3)
           MOVE 412 TO WS-VAL(4)
           MOVE 515 TO WS-VAL(5)

           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 5 OR WS-FOUND = "Y"
               IF WS-VAL(WS-I) = WS-TARGET
                   MOVE "Y" TO WS-FOUND
               END-IF
           END-PERFORM

           DISPLAY "13 - TABLE LINEAR SEARCH"
           IF WS-FOUND = "Y"
               DISPLAY "FOUND " WS-TARGET
           ELSE
               DISPLAY "NOT FOUND"
           END-IF
           STOP RUN.