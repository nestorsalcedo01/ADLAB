//SAM2 JOB ,
// MSGCLASS=H,MSGLEVEL=(1,1),TIME=1440,REGION=144M,COND=(16,LT)
//*
//STP0000 EXEC PROC=ELAXFCOC,
// CICS=,
// DB2=,
// COMP=,
// PARM.COBOL=('LIB',
// 'ADATA',
// 'EX(ADX(ELAXMGUX))')
//COBOL.SYSDEBUG DD DISP=SHR,
//        DSN=NESTOR.ADLAB.SYSDEBUG(SAM2)
//COBOL.SYSLIN DD DISP=SHR,
//        DSN=NESTOR.ADLAB.OBJECT(SAM2)
//COBOL.SYSLIB DD DISP=SHR,
//        DSN=NESTOR.ADLAB.COPY
//COBOL.SYSXMLSD DD DUMMY
//COBOL.SYSIN DD DISP=SHR,
//        DSN=NESTOR.ADLAB.COBOL(SAM2)
//*
//******* ADDITIONAL JCL FOR COMPILE HERE ******
//LKED EXEC PROC=ELAXFLNK
//LINK.OBJ0000 DD DISP=SHR,
//        DSN=NESTOR.ADLAB.OBJECT(SAM2)
//LINK.SYSLIN DD *
     INCLUDE OBJ0000
/*
//LINK.SYSLMOD   DD  DISP=SHR,
//        DSN=NESTOR.ADLAB.LOADLIB(SAM2)
//*
//******* ADDITIONAL JCL FOR LINK HERE ******
//
