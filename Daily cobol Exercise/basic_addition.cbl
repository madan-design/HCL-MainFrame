       IDENTIFICATION DIVISION.
       PROGRAM-ID. BASICADD.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-A            PIC 9(4) VALUE 25.
       01  WS-B            PIC 9(4) VALUE 17.
       01  WS-SUM          PIC 9(5).

       PROCEDURE DIVISION.
           ADD WS-A TO WS-B GIVING WS-SUM
           DISPLAY "03 - BASIC ADDITION"
           DISPLAY WS-A " + " WS-B " = " WS-SUM
           STOP RUN.