       01  EC01CPDP.
         05  ITEM   PIC S9(1) COMP-3.
         05  TABLA-1.
          10 RECORD-1 OCCURS 1 TO 3 TIMES
                  DEPENDING ON ITEM.
             20 NOMBRE-APELLIDO.
               25 NAME       PIC X(20).
               25 APELLIDO   PIC X(20).