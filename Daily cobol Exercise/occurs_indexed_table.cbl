       IDENTIFICATION DIVISION.
       PROGRAM-ID. INDEXTAB.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  EMP-TABLE.
           05 EMP-REC OCCURS 3 TIMES INDEXED BY EMP-IDX.
              10 EMP-NAME   PIC X(15).
              10 EMP-SAL    PIC 9(5).
       01  WS-I            PIC 9.

       PROCEDURE DIVISION.
           MOVE "ALICE" TO EMP-NAME(1)
           MOVE 45000   TO EMP-SAL(1)
           MOVE "BOB"   TO EMP-NAME(2)
           MOVE 52000   TO EMP-SAL(2)
           MOVE "CAROL" TO EMP-NAME(3)
           MOVE 61000   TO EMP-SAL(3)

           DISPLAY "14 - OCCURS WITH INDEX"
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 3
               DISPLAY EMP-NAME(WS-I) " : " EMP-SAL(WS-I)
           END-PERFORM
           STOP RUN.