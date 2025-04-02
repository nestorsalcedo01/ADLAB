       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-370.
       OBJECT-COMPUTER. IBM-370.

       DATA DIVISION.
       LINKAGE SECTION.
       01  COMMAREA.
           05  BAQBASE-API00Q01.
               ... (as defined previously)

       WORKING-STORAGE SECTION.
       01  WS-WORK-AREAS.
           05  WS-MQ-CONN-INFO PIC X(256).
           05  WS-MQ-MSG-HANDLE PIC X(8).
           05  WS-MQ-PUT-OPTIONS PIC X(4).
           05  WS-MQ-COMP-CODE PIC S9(4) COMP.
           05  WS-MQ-REASON-CODE PIC S9(4) COMP.
           05  WS-INDEX PIC S9(4) COMP-5.
           05  WS-OFFSET PIC S9(9) COMP-5.
           05  WS-PERSONA-DATA PIC X(256).

       PROCEDURE DIVISION.
       BEGIN.
           MOVE LINKAGE-AREA TO COMMAREA.

           * Obtain MQ connection information (replace with your logic)
           MOVE 'YOUR-MQ-CONN-INFO' TO WS-MQ-CONN-INFO

           * Open MQ queue (replace with your logic)
           CALL 'MQCONN' USING WS-MQ-CONN-INFO WS-MQ-HCONN
               RETURNING WS-MQ-COMP-CODE WS-MQ-REASON-CODE

           * Create MQ message handle
           CALL 'MQOPEN' USING WS-MQ-HCONN 'YOUR-QUEUE-NAME' 'MQOO_OUTPUT'
               'MQOD_DEFAULT' WS-MQ-MSG-HANDLE
               RETURNING WS-MQ-COMP-CODE WS-MQ-REASON-CODE

           MOVE 1 TO WS-INDEX.
           PERFORM UNTIL WS-INDEX GREATER THAN
              COMMAREA.BAQBASE-API00Q01.personas-num
              COMPUTE WS-OFFSET = (WS-INDEX - 1) *
                         LENGTH OF API00Q01-personas
              MOVE FUNCTION TRIM(LEADING ' ' FROM
                  COMMAREA.BAQBASE-API00Q01.personas-dataarea(WS-OFFSET +
                  1:LENGTH OF API00Q01-personas))
                  TO WS-PERSONA-DATA

              * Convert WS-PERSONA-DATA to MQ message format (if necessary)
              ...

              CALL 'MQPUT' USING WS-MQ-HCONN WS-MQ-MSG-HANDLE
              WS-MQ-PUT-OPTIONS
                  RETURNING WS-MQ-COMP-CODE WS-MQ-REASON-CODE

              ADD 1 TO WS-INDEX
           END-PERFORM.

           * Close MQ queue
           CALL 'MQCLOSE' USING WS-MQ-HCONN WS-MQ-MSG-HANDLE
               RETURNING WS-MQ-COMP-CODE WS-MQ-REASON-CODE

           * Disconnect from MQ
           CALL 'MQDISC' USING WS-MQ-HCONN
               RETURNING WS-MQ-COMP-CODE WS-MQ-REASON-CODE

           STOP RUN.
