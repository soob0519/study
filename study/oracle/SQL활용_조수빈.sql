[문항1]
도서정보 테이블 생성
CREATE TABLE BOOK_TBL(
B_NO number not null,
B_NAME varchar2(50) not null,
B_COVERIMG varchar2(20),
B_DATE date,
B_PRICE number,
B_PUBLISHER varchar2(50),
B_INFO varchar2(2000),
constraint BOOK_TBL_PK primary key(B_NO),
constraint BOOK_TBL_UQ unique(B_NAME)
);

[문항2]
도서정보 시퀀스 생성
create sequence B_NO_SEQ
start with 101
increment BY 1
maxvalue 99999;

도서대여 시퀀스 생성
create sequence R_NO_SEQ
start with 10001
increment BY 1
maxvalue 99999;

[문항3]
도서정보 데이블에 데이터 입력
INSERT INTO BOOK_TBL VALUES(B_NO_SEQ.nextval,'리눅스시작','101.png',to_date('2022/01/01','yyyy-mm-dd'),24000,'영진','운영체제와 네트워크');
INSERT INTO BOOK_TBL VALUES(B_NO_SEQ.nextval,'자바초급','102.png',to_date('2021/03/03','yyyy-mm-dd'),20000,'시공사','프로그래밍 시작하기');
INSERT INTO BOOK_TBL VALUES(B_NO_SEQ.nextval,'자바고급','103.png',to_date('2022/08/20','yyyy-mm-dd'),30000,'시공사','데이터베이스 연동');
INSERT INTO BOOK_TBL VALUES(B_NO_SEQ.nextval,'오라클박사','104.png',to_date('2023/02/02','yyyy-mm-dd'),32000,'하움','테이블과 제약조건');
INSERT INTO BOOK_TBL VALUES(B_NO_SEQ.nextval,'JAVASCRIPT','105.png',to_date('2022/02/12','yyyy-mm-dd'),15000,'다산북스','기초에서 계산기');

[문항4]
도서대여 테이블 생성
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

[문항5]
도서대여 데이블에 데이터 입력
INSERT INTO RENT_TBL VALUES(R_NO_SEQ.nextval,101,2400,to_date('2023/05/20','yyyy-mm-dd'),0);
INSERT INTO RENT_TBL VALUES(R_NO_SEQ.nextval,102,2000,to_date('2023/05/20','yyyy-mm-dd'),0);
INSERT INTO RENT_TBL VALUES(R_NO_SEQ.nextval,101,2400,to_date('2023/05/21','yyyy-mm-dd'),0);
INSERT INTO RENT_TBL VALUES(R_NO_SEQ.nextval,101,2400,to_date('2023/05/22','yyyy-mm-dd'),0);
INSERT INTO RENT_TBL VALUES(R_NO_SEQ.nextval,103,3000,to_date('2023/05/22','yyyy-mm-dd'),1);
INSERT INTO RENT_TBL VALUES(R_NO_SEQ.nextval,104,3500,to_date('2023/05/22','yyyy-mm-dd'),1);
INSERT INTO RENT_TBL VALUES(R_NO_SEQ.nextval,102,2000,to_date('2023/05/25','yyyy-mm-dd'),1);

[문항6]
(1) select * from BOOK_TBL;

(2) select B_NAME "책이름",B_PRICE "책가격",B_PUBLISHER "출판사" from BOOK_TBL where B_INFO like '%네트워크%';

(3) select B_NO "책번호",B_NAME "책이름",B_PRICE "가격" from BOOK_TBL where B_PRICE=(select max(B_PRICE) from BOOK_TBL);

(4) select R.* from (select rownum rn, R_NO,B_NO,R_PRICE,R_DATE,R_STATUS from RENT_TBL) R where rn<=3;

(5) select R_NO "대여번호",R_PRICE "금액", R_DATE "날짜",decode(R_STATUS,0,'반납완료',1,'대여중') "반납여부" from RENT_TBL;

(6) select R.R_NO "대여번호",B.B_NO "책번호",B.B_NAME "책이름",B.B_PRICE "가격",to_char(R.R_DATE,'yyyy-mm-dd') "대여일" from BOOK_TBL B, RENT_TBL R where B.B_NO = R.B_NO;

(7) select B.B_NO "책번호",B.B_NAME "책이름",B.B_PUBLISHER "출판사" from BOOK_TBL B WHERE (select count(*) from RENT_TBL where B_NO = B.B_NO)=0;

(8)
update BOOK_TBL set B_NO = '110' where B_NO = '101';
무결성 제약조건(C##JAVA.RENT_TBL_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다.

(9) select B.B_NAME "책이름",B.B_PUBLISHER "출판사", to_char(R.R_DATE,'yyyy-mm-dd') "대여일" from BOOK_TBL B, RENT_TBL R where B.B_NO = R.B_NO and B.B_PUBLISHER = '시공사' AND R.R_DATE = '2023/05/22';

(10)
desc BOOK_TBL;
desc RENT_TBL;
commit;