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
	'����������',
	'101.png',
	to_date('2022/01/01','yyyy-mm-dd'),
	24000,
	'����',
	'�ü���� ��Ʈ��ũ');
	
INSERT INTO BOOK_TBL VALUES(
	B_NO_SEQ.nextval,
	'�ڹ��ʱ�',
	'102.png',
	to_date('2021/03/03','yyyy-mm-dd'),
	20000,
	'�ð���',
	'���α׷��� �����ϱ�');
	
INSERT INTO BOOK_TBL VALUES(
	B_NO_SEQ.nextval,
	'�ڹٰ��',
	'103.png',
	to_date('2022/08/20','yyyy-mm-dd'),
	30000,
	'�ð���',
	'�����ͺ��̽� ����');

INSERT INTO BOOK_TBL VALUES(
	B_NO_SEQ.nextval,
	'����Ŭ�ڻ�',
	'104.png',
	to_date('2023/02/02','yyyy-mm-dd'),
	32000,
	'�Ͽ�',
	'���̺�� ��������');
	
INSERT INTO BOOK_TBL VALUES(
	B_NO_SEQ.nextval,
	'JAVASCRIPT',
	'105.png',
	to_date('2022/02/12','yyyy-mm-dd'),
	15000,
	'�ٻ�Ͻ�',
	'���ʿ��� ����');

select * from BOOK_TBL;