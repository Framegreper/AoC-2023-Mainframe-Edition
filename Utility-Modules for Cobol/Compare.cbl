      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COMPARE-ARRAYS.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-ARRAY1.
          05 WS-CHAR1 PIC X(100) OCCURS 100 TIMES INDEXED BY WS-IDX1.
       01 WS-ARRAY2.
          05 WS-CHAR2 PIC X(100) OCCURS 100 TIMES INDEXED BY WS-IDX2.
       01 WS-LENGTH PIC 9(03) VALUE 0.
       01 WS-MATCH-FOUND PIC X(03) VALUE 'NO'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.1
           PERFORM INITIALIZE-ARRAYS
           PERFORM COMPARE-ELEMENTS
           DISPLAY "Match found: " WS-MATCH-FOUND
           STOP RUN.

       INITIALIZE-ARRAYS.
           MOVE '<your array 1 values>' TO WS-CHAR1
           MOVE '<your array 2 values>' TO WS-CHAR2
           MOVE LENGTH OF WS-CHAR1 TO WS-LENGTH
           .

       COMPARE-ELEMENTS.
           PERFORM VARYING WS-IDX1 FROM 1 BY 1
               UNTIL WS-IDX1 > WS-LENGTH OR WS-MATCH-FOUND = 'YES'
               MOVE WS-CHAR1(WS-IDX1) TO WS-CHAR2(WS-IDX2)
               IF WS-CHAR1(WS-IDX1) = WS-CHAR2(WS-IDX2)
                   MOVE 'YES' TO WS-MATCH-FOUND
               END-IF
           END-PERFORM
           .

       END PROGRAM COMPARE-ARRAYS.
