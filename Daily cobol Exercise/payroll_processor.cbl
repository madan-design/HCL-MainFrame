       IDENTIFICATION DIVISION.
       PROGRAM-ID. PAYROLLP.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PAY-IN ASSIGN TO "payin.dat"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PAY-OUT ASSIGN TO "payout.dat"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  PAY-IN.
       01  PAYIN-REC       PIC X(40).
       FD  PAY-OUT.
       01  PAYOUT-REC      PIC X(60).

       WORKING-STORAGE SECTION.
       01  WS-EOF          PIC X VALUE "N".
       01  WS-EMP-ID       PIC X(5).
       01  WS-EMP-NAME     PIC X(15).
       01  WS-BASIC-TXT    PIC X(7).
       01  WS-BASIC        PIC 9(7)V99.
       01  WS-HRA          PIC 9(7)V99.
       01  WS-NET          PIC 9(8)V99.
         01  WS-NET-TXT      PIC Z(7)9.99.

       PROCEDURE DIVISION.
           OPEN INPUT PAY-IN
           OPEN OUTPUT PAY-OUT

           PERFORM UNTIL WS-EOF = "Y"
               READ PAY-IN
                   AT END MOVE "Y" TO WS-EOF
                   NOT AT END
                       UNSTRING PAYIN-REC DELIMITED BY ","
                           INTO WS-EMP-ID WS-EMP-NAME WS-BASIC-TXT
                       END-UNSTRING
                       INSPECT WS-BASIC-TXT
                           REPLACING ALL X"0D" BY SPACE
                       MOVE WS-BASIC-TXT TO WS-BASIC
                       COMPUTE WS-HRA = WS-BASIC * 0.20
                       COMPUTE WS-NET = WS-BASIC + WS-HRA
                       MOVE WS-NET TO WS-NET-TXT
                       MOVE SPACES TO PAYOUT-REC
                       STRING WS-EMP-ID DELIMITED BY SIZE
                              "," DELIMITED BY SIZE
                              WS-EMP-NAME DELIMITED BY SIZE
                              "," DELIMITED BY SIZE
                              WS-NET-TXT DELIMITED BY SIZE
                         INTO PAYOUT-REC
                       END-STRING
                       WRITE PAYOUT-REC
               END-READ
           END-PERFORM

           CLOSE PAY-IN
           CLOSE PAY-OUT
           DISPLAY "PAYROLL PROCESSING COMPLETE"
           STOP RUN.
