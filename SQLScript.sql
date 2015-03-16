﻿CREATE TABLE "OVI"."USERS" 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50) NOT NULL ENABLE, 
	 CONSTRAINT "DEPT_PK" PRIMARY KEY ("ID") ENABLE
   )
GO

CREATE SEQUENCE  "OVI"."USERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE
GO

CREATE OR REPLACE TRIGGER "OVI"."USERS_TRIG" 
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT ovi.users_seq.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
ALTER TRIGGER "OVI"."USERS_TRIG" ENABLE
GO

