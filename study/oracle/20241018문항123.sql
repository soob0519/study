DROP TABLE book_tbl;

CREATE TABLE BOOK_TBL(
B_NO number not null,
B_NAME varchar2(50) not null,
B_COVERIMG varchar2(20),
B_DATE date,
B_PRICE number,
B_PUBLISHER varchar2(50),
B_INFO varchar2(2000),
constraint BOOK_TBL_pk primary key(B_NO),
constraint BOOK_TBL_uq unique(B_NAME)
);

create sequence B_NO_SEQ
start with 101
increment BY 1
maxvalue 99999;

INSERT INTO BOOK_TBL VALUES(
	B_NO_SEQ.nextval,
	'리눅스시작',
	'101.png',
	to_date('2022/01/01','yyyy-mm-dd'),
	24000,
	'영진',
	'운영체제와 네트워크');
	
INSERT INTO BOOK_TBL VALUES(
	B_NO_SEQ.nextval,
	'자바초급',
	'102.png',
	to_date('2021/03/03','yyyy-mm-dd'),
	20000,
	'시공사',
	'프로그래밍 시작하기');
	
INSERT INTO BOOK_TBL VALUES(
	B_NO_SEQ.nextval,
	'자바고급',
	'103.png',
	to_date('2022/08/20','yyyy-mm-dd'),
	30000,
	'시공사',
	'데이터베이스 연동');

INSERT INTO BOOK_TBL VALUES(
	B_NO_SEQ.nextval,
	'오라클박사',
	'104.png',
	to_date('2023/02/02','yyyy-mm-dd'),
	32000,
	'하움',
	'테이블과 제약조건');
	
INSERT INTO BOOK_TBL VALUES(
	B_NO_SEQ.nextval,
	'JAVASCRIPT',
	'105.png',
	to_date('2022/02/12','yyyy-mm-dd'),
	15000,
	'다산북스',
	'기초에서 계산기');

select * from BOOK_TBL;