       01  EC01CP.
           05  ITEM   PIC S9(1) COMP-3.                                 00010000
           05  NOMBRE-APELLIDO OCCURS DEPENDING ON ITEM.                00017002
               10 NAME       PIC X(20).                                 00018001
               10 APELLIDO   PIC X(20).                                 00019001