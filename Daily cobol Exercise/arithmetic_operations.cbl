       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARITHOPS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-X            PIC 9(4)V99 VALUE 120.50.
       01  WS-Y            PIC 9(4)V99 VALUE 15.25.
       01  WS-ADD          PIC 9(5)V99.
       01  WS-SUB          PIC S9(5)V99.
       01  WS-MUL          PIC 9(7)V99.
       01  WS-DIV          PIC 9(5)V99.

       PROCEDURE DIVISION.
           ADD WS-X TO WS-Y GIVING WS-ADD
           SUBTRACT WS-Y FROM WS-X GIVING WS-SUB
           MULTIPLY WS-X BY WS-Y GIVING WS-MUL
           DIVIDE WS-X BY WS-Y GIVING WS-DIV

           DISPLAY "04 - ARITHMETIC OPERATIONS"
           DISPLAY "ADD : " WS-ADD
           DISPLAY "SUB : " WS-SUB
           DISPLAY "MUL : " WS-MUL
           DISPLAY "DIV : " WS-DIV
           STOP RUN.