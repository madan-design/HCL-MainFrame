       IDENTIFICATION DIVISION.
       PROGRAM-ID. SALREPORT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  EMP-TAB.
           05 EMP-REC OCCURS 4 TIMES.
              10 EMP-NAME   PIC X(12).
              10 EMP-BASIC  PIC 9(6)V99.
       01  I               PIC 9.
       01  HRA             PIC 9(6)V99.
       01  GROSS           PIC 9(7)V99.

       PROCEDURE DIVISION.
           MOVE "ANITA" TO EMP-NAME(1)
           MOVE 30000.00 TO EMP-BASIC(1)
           MOVE "RAHUL" TO EMP-NAME(2)
           MOVE 42000.00 TO EMP-BASIC(2)
           MOVE "MEERA" TO EMP-NAME(3)
           MOVE 38500.00 TO EMP-BASIC(3)
           MOVE "ARJUN" TO EMP-NAME(4)
           MOVE 50000.00 TO EMP-BASIC(4)

           DISPLAY "23 - SALARY REPORT"
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4
               COMPUTE HRA = EMP-BASIC(I) * 0.20
               COMPUTE GROSS = EMP-BASIC(I) + HRA
               DISPLAY EMP-NAME(I) " BASIC=" EMP-BASIC(I)
                       " GROSS=" GROSS
           END-PERFORM
           STOP RUN.