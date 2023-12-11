      ******************************************************************
      * Author: Dominik Broder
      * Date: 07.12.23
      * Purpose: Einlesen einer Datei und Anzeigen des Inhalts
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. READ-INPUT-FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT INPUT-FILE ASSIGN TO "input.txt"
            ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  INPUT-FILE LABEL RECORDS ARE STANDARD.
           01  INPUT-RECORD                 PIC X(80).

       WORKING-STORAGE SECTION.
       01  END-OF-FILE                 PIC X(3)     VALUE "NO".
       01  NUMBER-OF-LINES             PIC 9(4)     VALUE ZERO.
       01  WS-I                         PIC 99       VALUE 1.
       01  WS-CH                        PIC X        VALUE SPACE.
       01  WS-RECORD-NOT-EMPTY         PIC X(3)     VALUE "NO".

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            OPEN INPUT INPUT-FILE
            PERFORM UNTIL END-OF-FILE = "YES"
               READ INPUT-FILE
               AT END
                   MOVE "YES" TO END-OF-FILE
               NOT AT END
               PERFORM CHECK-IF-NOT-EMPTY
            IF WS-RECORD-NOT-EMPTY = "YES"
            THEN
                ADD 1 TO NUMBER-OF-LINES
                DISPLAY "Line " NUMBER-OF-LINES ": " INPUT-RECORD
               END-READ
            END-PERFORM
            CLOSE INPUT-FILE
            DISPLAY "Dateiende erreicht."
            STOP RUN.

       CHECK-IF-NOT-EMPTY.
           MOVE "NO" TO WS-RECORD-NOT-EMPTY
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 80 OR
           WS-RECORD-NOT-EMPTY = "YES"
               MOVE INPUT-RECORD (WS-I:1) TO WS-CH
               IF WS-CH NOT = SPACE
                   MOVE "YES" TO WS-RECORD-NOT-EMPTY
               END-IF
           END-PERFORM.
       END PROGRAM READ-INPUT-FILE.
