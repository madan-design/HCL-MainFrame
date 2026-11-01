       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRUNSTR.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-FIRST        PIC X(10) VALUE "HCL".
       01  WS-SECOND       PIC X(10) VALUE "COBOL".
       01  WS-COMBINED     PIC X(25).
       01  WS-PART1        PIC X(10).
       01  WS-PART2        PIC X(10).

       PROCEDURE DIVISION.
           STRING WS-FIRST DELIMITED BY SPACE
                  "-"      DELIMITED BY SIZE
                  WS-SECOND DELIMITED BY SPACE
             INTO WS-COMBINED
           END-STRING

           UNSTRING WS-COMBINED
             DELIMITED BY "-"
             INTO WS-PART1 WS-PART2
           END-UNSTRING

           DISPLAY "11 - STRING/UNSTRING"
           DISPLAY "COMBINED: " WS-COMBINED
           DISPLAY "PART1   : " WS-PART1
           DISPLAY "PART2   : " WS-PART2
           STOP RUN.