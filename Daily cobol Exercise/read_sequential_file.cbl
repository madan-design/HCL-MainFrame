       IDENTIFICATION DIVISION.
       PROGRAM-ID. READSEQ.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT IN-FILE ASSIGN TO "students.dat"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  IN-FILE.
       01  IN-REC          PIC X(50).

       WORKING-STORAGE SECTION.
       01  WS-EOF          PIC X VALUE "N".

       PROCEDURE DIVISION.
           OPEN INPUT IN-FILE
           PERFORM UNTIL WS-EOF = "Y"
               READ IN-FILE
                   AT END MOVE "Y" TO WS-EOF
                   NOT AT END DISPLAY "REC: " IN-REC
               END-READ
           END-PERFORM
           CLOSE IN-FILE
           DISPLAY "16 - FILE READ COMPLETE"
           STOP RUN.