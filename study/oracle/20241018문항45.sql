CREATE TABLE RENT_TBL(
R_NO number not null,
B_NO number not null,
R_PRICE number default '0' not null,
R_DATE DATE not null,
R_STATUS CHAR(1) default '0' not null,
constraint RENT_TBL_PK primary key(R_NO),
constraint RENT_TBL_FK foreign key(B_NO) references BOOK_TBL(B_NO),
constraint RENT_TBL_CK check(R_STATUS in(0,1))
);

create sequence R_NO_SEQ
start with 10001
increment BY 1
maxvalue 99999;

INSERT INTO RENT_TBL VALUES(R_NO_SEQ.nextval,101,2400,to_date('2023/05/20','yyyy-mm-dd'),0);
INSERT INTO RENT_TBL VALUES(R_NO_SEQ.nextval,102,2000,to_date('2023/05/20','yyyy-mm-dd'),0);
INSERT INTO RENT_TBL VALUES(R_NO_SEQ.nextval,101,2400,to_date('2023/05/21','yyyy-mm-dd'),0);
INSERT INTO RENT_TBL VALUES(R_NO_SEQ.nextval,101,2400,to_date('2023/05/22','yyyy-mm-dd'),0);
INSERT INTO RENT_TBL VALUES(R_NO_SEQ.nextval,103,3000,to_date('2023/05/22','yyyy-mm-dd'),1);
INSERT INTO RENT_TBL VALUES(R_NO_SEQ.nextval,104,3500,to_date('2023/05/22','yyyy-mm-dd'),1);
INSERT INTO RENT_TBL VALUES(R_NO_SEQ.nextval,102,2000,to_date('2023/05/25','yyyy-mm-dd'),1);

select * from RENT_TBL;
