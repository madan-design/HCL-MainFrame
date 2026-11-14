       IDENTIFICATION DIVISION.
       PROGRAM-ID. MATRIXSUM.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  MAT.
           05 ROW OCCURS 3 TIMES.
              10 COL PIC 9(2) OCCURS 3 TIMES.
       01  I               PIC 9.
       01  J               PIC 9.
       01  WS-SUM          PIC 9(4) VALUE 0.

       PROCEDURE DIVISION.
           MOVE 1 TO COL(1,1)
           MOVE 2 TO COL(1,2)
           MOVE 3 TO COL(1,3)
           MOVE 4 TO COL(2,1)
           MOVE 5 TO COL(2,2)
           MOVE 6 TO COL(2,3)
           MOVE 7 TO COL(3,1)
           MOVE 8 TO COL(3,2)
           MOVE 9 TO COL(3,3)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 3
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 3
                   ADD COL(I,J) TO WS-SUM
               END-PERFORM
           END-PERFORM

           DISPLAY "24 - NESTED LOOP MATRIX SUM"
           DISPLAY "TOTAL = " WS-SUM
           STOP RUN.