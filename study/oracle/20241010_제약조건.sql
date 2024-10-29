-- ID 암호 이름 성별 생일 연락처 등록일
---------------------------------------------------------------------------
-- primary key :: 중복방지, null값 방지, 빠른검색, 테이블당 1개
-- unique :: 중복방지, null값 방지안함, 빠른검색, 테이블당 여러개
-- check :: 데이터선별(선별된 데이터만 입력가능)
-- not null :: 널값방지
-- default :: 기본값
---------------------------------------------------------------------------

create SEQUENCE member1_seq
start with 1
increment BY 1
maxvalue 99999;


create table member1(
unq number not null primary key,
userid varchar2(50) not null unique,
pass varchar2(100) not null,
name varchar2(50) not null,
gender char(1) check(gender in('M','F')),
birthday date default '1900-01-01',
phone varchar2(50),
rdate timestamp
);

insert into member1 values(member1_seq.nextval,'test1','1111','홍길동','M','20001225','010-7777-7777',sysdate);
insert into member1 values(member1_seq.nextval,'test2','1111','임꺽정','M','20100505','010-8888-7777',sysdate);
commit;

insert into member1 values(member1_seq.nextval,'test3','1111','점순이','T','20001111','010-1111-7777',sysdate); --(x)
-- 체크 제약 조건 (체크 조건에 맞지 않는다)
insert into member1 values(member1_seq.nextval,'test2','1111','점순이','F','20001111','010-1111-7777',sysdate); --(x)
-- 무결성 제약 조건 (아이디 중복 unique)
insert into member1 values(member1_seq.nextval,'test3','','점순이','F','20001111','010-1111-7777',sysdate); --(x)
-- null값오류 암호 누락

insert into member1 (UNQ,USERID,PASS,NAME,GENDER,PHONE,RDATE)
values(member1_seq.nextval,'test3','1111','임걱정','M','010-9999-7777',sysdate);
-- 완전 누락 되었을경우에는 디폴트값이 들어감 :: 빈칸으로 두면 null로 들어감
insert into member1 values(member1_seq.nextval,'test4','1111','임걱정','M','03012010','010-0000-7777',sysdate);
-- 리터럴이 형식 문자열과 일치하지 않음 (날짜 형식이 맞지 않음)
insert into member1 values(member1_seq.nextval,'test4','1111','임걱정','M',to_date('03012010','mm-dd-yyyy'),'010-0000-7777',sysdate);
insert into member1 values(member1_seq.nextval,'test5','1111','임걱정','M','03012010 12:22:22','010-0000-0000',sysdate);
-- 리터럴이 형식 문자열과 일치하지 않음 (형식적인 크기를 넘었을경우)
insert into member1 values(member1_seq.nextval,'test5','1111','임걱정','M',to_date('03012010 12:22:22','mm-dd-yyyy hh24:mi:ss'),'010-0000-0000',sysdate);

alter table member1 modify userid varchar2(12);
insert into member1 values(member1_seq.nextval,'test123456789101112','1111','홍길동','M','20001225','010-7777-7777',sysdate);
-- "C##JAVA"."MEMBER1"."USERID" 열에 대한 값이 너무 큼(실제: 19, 최대값: 12)

insert into member1 values(member1_seq.nextval,'test13','1111','홍길동','M','20001225','010-7777-7777','2024-10-10');
insert into member1 values(member1_seq.nextval,'test14','1111','홍길동','M','20001225','010-7777-7777','');



create table member2(
unq number not null,
userid varchar2(50) not null,
pass varchar2(100) not null,
name varchar2(50) not null,
gender char(1),
birthday date default '1900-01-01',
phone varchar2(50),
rdate timestamp,
CONSTRAINT member2_unq_pk primary key(unq),
CONSTRAINT member2_userid_un unique(userid),
CONSTRAINT member2_gender_ck check(gender in('M','F'))
);

-- 별칭세팅 주의 사항 :: 별칭 중복 절대 안됨 고유값이여야함.
-- 예) member2_gender_ck
