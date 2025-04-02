       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-370.
       OBJECT-COMPUTER. IBM-370.

       DATA DIVISION.
       LINKAGE SECTION.
       01  BAQBASE-API00Q01.
           ... (as defined above)

       WORKING-STORAGE SECTION.
       01  WS-WORK-AREAS.
           05  WS-INDEX PIC S9(4) COMP-5.
           05  WS-OFFSET PIC S9(9) COMP-5.
           05  WS-PERSONA-DATA PIC X(256).

       PROCEDURE DIVISION.
       BEGIN.
        MOVE 1 TO WS-INDEX.
         PERFORM UNTIL WS-INDEX GREATER THAN
                 BAQBASE-API00Q01.personas-num
          COMPUTE WS-OFFSET = (WS-INDEX - 1) * LENGTH OF
            API00Q01-personas
        MOVE FUNCTION TRIM(LEADING ' ' FROM
           BAQBASE-API00Q01.personas-dataarea(WS-OFFSET +
           1:LENGTH OF API00Q01-personas))
           TO WS-PERSONA-DATA

        UNSTRING WS-PERSONA-DATA DELIMITED BY '|'
           INTO API00Q01-personas.nombre-length
                API00Q01-personas.nombre
                API00Q01-personas.apellido-length
                API00Q01-personas.apellido
           END-UNSTRING

      * Process the extracted persona data
       ...

         ADD 1 TO WS-INDEX
         END-PERFORM.

         STOP RUN.
