-- 공지사항 테이블 만들기
-- 고유번호, 제목, 암호, 이름, 내용, 조회수, 등록일
-- 관리자가 삭제를 하기 위한 고유번호를 붙인다.
create table nboard(
unq number not null,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(20),
content varchar2(4000),
hits number default '0', -- 기본값 설정
rdate timestamp, -- 날짜와 시간
primary key(unq) -- 중복방지,null값방지, 빠른 검색 (고유번호)
);

--삭제 > delete from nboard where 고유번호 ='3';
create sequence nboard_seq
increment by 1
start with 1
maxvalue 9999;

insert into nboard(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE)
values(nboard_seq.nextval,'html','1234','홍길동','abcd','0',sysdate);

insert into nboard(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE)
values(nboard_seq.nextval,'css','1111','임꺽정','abcdsssss','0',sysdate);
insert into nboard(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE)
values(nboard_seq.nextval,'java','4444','알라딘','abcdssss','0',sysdate);
insert into nboard(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE)
values(nboard_seq.nextval,'script','3333','신데렐라','abcdssss','0',sysdate);
insert into nboard(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE)
values(nboard_seq.nextval,'oracle','2222','엘사','abcddasdads','0',sysdate);
insert into nboard(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE)
values(nboard_seq.nextval,'spring','1111','안나','abcddakakhsd','0',sysdate);

commit;
delete from nboard where unq='3';

insert into nboard(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE)
values(nboard_seq.nextval,'new!!','5555','하츄핑','abfs','0',sysdate);
-- 시퀀스 흐름 보기
-- in-> 1
-- in-> 2
-- in-> 3 -> (x)
-- in-> 4
-- in-> 5
-- del ->3
-- in-> 6
-- in-> 7 -> (x)
-- del -> 7
-- in-> 8

-- 시퀀스 명령어
-- 1. 시퀀스명.nextval :: 다음번호 세팅(출력)
-- 2. 시퀀스명.currval :: 현재번호 출력
select nboard_seq.nextval from dual;
select nboard_seq.currval from dual;

-- 사원번호에서 사용할 시퀀스 번호 세팅 9001~9999
create sequence emp_seq
start with 9001
increment by 1
maxvalue 9999;
insert into emp values
(emp_seq.nextval,'홍당무','CLERK','7788','2024-05-06','320','','40');

