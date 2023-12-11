      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRING-SPLITTER.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-STRING              PIC X(100) VALUE "Ein,Beispiel,String,zum,Splitten".
       01 WS-DELIMITER           PIC X VALUE ",".
       01 WS-SUBSTRING           PIC X(100).
       01 WS-TEMP-STRING         PIC X(100).
       01 WS-STRING-LEN          PIC 9(3) COMP-3.
       01 WS-POSITION            PIC 9(3) COMP-3.
       01 WS-LAST-POS            PIC 9(3) COMP-3.
       01 WS-SUB-TOTAL           PIC 9(3) COMP-3 VALUE 0.

       LINKAGE SECTION.
       01 PARAMETRES.
           02 PA-RETURN-CODE     PIC 99 VALUE 0.

       PROCEDURE DIVISION USING PARAMETRES.
       MAIN-PROCEDURE.
           PERFORM INITIALIZE-VARIABLES
           PERFORM SPLIT-STRING THRU SPLIT-STRING-END
           MOVE 0 TO PA-RETURN-CODE
           GOBACK.

       INITIALIZE-VARIABLES.
           MOVE FUNCTION LENGTH (WS-STRING) TO WS-STRING-LEN
           MOVE ZEROS TO WS-POSITION
           MOVE ZEROS TO WS-LAST-POS.

       SPLIT-STRING.
           PERFORM UNTIL WS-POSITION > WS-STRING-LEN
               ADD 1 TO WS-POSITION
               MOVE WS-STRING (WS-LAST-POS:WS-POSITION - WS-LAST-POS) TO WS-TEMP-STRING
               IF WS-TEMP-STRING (WS-POSITION - WS-LAST-POS:1) = WS-DELIMITER
                   OR WS-POSITION = WS-STRING-LEN
                   THEN
                       IF WS-POSITION = WS-STRING-LEN
                           ADD 1 TO WS-POSITION
                       END-IF
                       MOVE FUNCTION TRIM (WS-TEMP-STRING (1:WS-POSITION - WS-LAST-POS - 1)) TO WS-SUBSTRING
                       DISPLAY "Substring: " WS-SUBSTRING
                       MOVE WS-POSITION TO WS-LAST-POS
                       ADD 1 TO WS-LAST-POS
                       ADD 1 TO WS-SUB-TOTAL
               END-IF
           END-PERFORM.

       SPLIT-STRING-END.
           EXIT.

       END PROGRAM STRING-SPLITTER.
