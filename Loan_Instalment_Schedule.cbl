       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOAN-SCHEDULE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 PRINCIPAL-AMT     PIC 9(11)V99.
       01 MONTHLY-RATE      PIC 9V99.
       01 TOTAL-MONTHS      PIC 999.
       01 PAYMENT-AMT       PIC 9(11)V99.
       01 OPENING-AMT       PIC 9(11)V99.
       01 INTEREST-AMT      PIC 9(11)V99.
       01 PRINCIPAL-REPAID  PIC 9(11)V99.
       01 CLOSING-AMT       PIC 9(11)V99.
       01 RATE-DECIMAL      PIC 9V9999.
       01 MONTH-NUM         PIC 999.
       01 DISPLAY-OPENING   PIC Z(10)9.99.
       01 DISPLAY-INTEREST  PIC Z(10)9.99.
       01 DISPLAY-REPAID    PIC Z(10)9.99.
       01 DISPLAY-CLOSING   PIC Z(10)9.99.

       PROCEDURE DIVISION.
           ACCEPT PRINCIPAL-AMT
           ACCEPT MONTHLY-RATE
           ACCEPT TOTAL-MONTHS
           ACCEPT PAYMENT-AMT

           PERFORM VARYING MONTH-NUM FROM 1 BY 1
               UNTIL MONTH-NUM > TOTAL-MONTHS

               MOVE PRINCIPAL-AMT TO OPENING-AMT

               COMPUTE INTEREST-AMT ROUNDED =
                   OPENING-AMT * MONTHLY-RATE / 100

               IF PAYMENT-AMT < INTEREST-AMT
                   DISPLAY "PAYMENT TOO LOW"
                   STOP RUN
               END-IF

               COMPUTE PRINCIPAL-REPAID =
                   PAYMENT-AMT - INTEREST-AMT

               IF PRINCIPAL-REPAID > OPENING-AMT
                   MOVE OPENING-AMT TO PRINCIPAL-REPAID
               END-IF

               COMPUTE CLOSING-AMT =
                   OPENING-AMT - PRINCIPAL-REPAID

               MOVE CLOSING-AMT TO PRINCIPAL-AMT

               MOVE OPENING-AMT TO DISPLAY-OPENING
               MOVE INTEREST-AMT TO DISPLAY-INTEREST
               MOVE PRINCIPAL-REPAID TO DISPLAY-REPAID
               MOVE CLOSING-AMT TO DISPLAY-CLOSING

               DISPLAY "Month " MONTH-NUM
                   ": Opening " DISPLAY-OPENING
                   ", Interest " DISPLAY-INTEREST
                   ", Principal " DISPLAY-REPAID
                   ", Closing " DISPLAY-CLOSING

               IF PRINCIPAL-AMT = 0
                   STOP RUN
               END-IF

           END-PERFORM

           STOP RUN.
