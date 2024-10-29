--------------------------------------------------------
--  파일이 생성됨 - 수요일-10월-02-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SCORE2
--------------------------------------------------------

  CREATE TABLE "C##JAVA"."SCORE2" 
   (	"UNQ" NUMBER, 
	"USERID" VARCHAR2(50 BYTE), 
	"LOC" VARCHAR2(100 BYTE), 
	"KOR" NUMBER(3,0) DEFAULT '0', 
	"ENG" NUMBER(3,0) DEFAULT '0'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into C##JAVA.SCORE2
SET DEFINE OFF;
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (1,'st101','서울특별시 강남구',76,68);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (2,'st102','대구광역시 수성구',88,78);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (3,'st103','강원도 원주시',52,92);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (4,'st104','전라북도 전주시',66,98);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (5,'st105','서울특별시 강남구',68,30);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (6,'st106','대구광역시 수성구',78,68);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (7,'st107','강원도 원주시',90,78);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (8,'st108','전라북도 전주시',98,92);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (9,'st109','서울특별시 강남구',74,68);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (10,'st110','대구광역시 수성구',88,78);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (11,'st111','강원도 원주시',78,92);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (12,'st112','전라북도 전주시',66,98);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (13,'st113','서울특별시 강남구',68,78);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (14,'st114','대구광역시 수성구',56,90);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (15,'st115','강원도 원주시',90,84);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (16,'st116','전라북도 전주시',98,76);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (17,'st117','서울특별시 강남구',76,88);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (18,'st118','대구광역시 수성구',88,78);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (19,'st119','강원도 원주시',58,92);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (20,'st120','전라북도 전주시',66,98);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (21,'st121','서울특별시 강남구',68,30);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (22,'st122','대구광역시 수성구',78,82);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (23,'st123','강원도 원주시',90,84);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (24,'st124','전라북도 전주시',84,78);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (25,'st125','서울특별시 강남구',76,78);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (26,'st126','대구광역시 수성구',88,90);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (27,'st127','강원도 원주시',52,84);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (28,'st128','전라북도 전주시',66,76);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (29,'st129','서울특별시 강남구',68,88);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (30,'st130','대구광역시 수성구',78,68);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (31,'st131','강원도 원주시',92,78);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (32,'st132','전라북도 전주시',98,92);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (33,'st133','서울특별시 강남구',30,98);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (34,'st134','대구광역시 수성구',82,30);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (35,'st135','강원도 원주시',84,82);
Insert into C##JAVA.SCORE2 (UNQ,USERID,LOC,KOR,ENG) values (36,'st136','전라북도 전주시',78,84);
--------------------------------------------------------
--  DDL for Index SYS_C007441
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##JAVA"."SYS_C007441" ON "C##JAVA"."SCORE2" ("UNQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table SCORE2
--------------------------------------------------------

  ALTER TABLE "C##JAVA"."SCORE2" MODIFY ("UNQ" NOT NULL ENABLE);
  ALTER TABLE "C##JAVA"."SCORE2" MODIFY ("USERID" NOT NULL ENABLE);
  ALTER TABLE "C##JAVA"."SCORE2" MODIFY ("KOR" NOT NULL ENABLE);
  ALTER TABLE "C##JAVA"."SCORE2" MODIFY ("ENG" NOT NULL ENABLE);
  ALTER TABLE "C##JAVA"."SCORE2" ADD PRIMARY KEY ("UNQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
