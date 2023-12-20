      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRING-TO-ARRAY.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-STRING PIC X(100) VALUE SPACES.
       01 WS-CHAR-ARRAY.
          05 WS-CHAR PIC X OCCURS 100 TIMES INDEXED BY WS-IDX.

       LINKAGE SECTION.
       01 LS-INPUT-STRING PIC X(100).

       PROCEDURE DIVISION USING LS-INPUT-STRING.
       MAIN-PROCEDURE.
           PERFORM VARYING WS-IDX FROM 1 BY 1
               UNTIL WS-IDX > LENGTH OF LS-INPUT-STRING
               MOVE LS-INPUT-STRING (WS-IDX:1) TO WS-CHAR(WS-IDX)
           END-PERFORM

           DISPLAY "The array is populated with characters."
           PERFORM VARYING WS-IDX FROM 1 BY 1
               UNTIL WS-IDX > LENGTH OF LS-INPUT-STRING
               DISPLAY "Element " WS-IDX " of array: " WS-CHAR(WS-IDX)
           END-PERFORM

           STOP RUN.
       END PROGRAM STRING-TO-ARRAY.
