 -- 학생 - 아이디 암호 이름 주소 국어 영어
create table std1(
userid varchar2(50) not null primary key,
pass varchar2(100) not null,
name varchar2(50) not null,
addr varchar2(100)
);

insert into std1 values('test1','1212','aaa','서울');
insert into std1 values('test2','1333','bbb','부산');

create table std2(
userid varchar2(50) not null,
gubun varchar2(20) not null,
eng number(3),
kor number(3),
constraint std2_fk foreign key(userid) references std1(userid)
);
-- constraint 별칭 foreign key(나의 컬럼명) references 부모테이블명(부모테이블컬럼)

insert into std2 values('test1','1','80','90');
insert into std2 values('test2','1','100','100');

commit;

insert into std2 values('test3','1','80','70');
-- 무결성 제약조건(C##JAVA.STD2_FK)이 위배되었습니다- 부모 키가 없습니다

delete from std1 where userid='test1';
-- 무결성 제약조건(C##JAVA.STD2_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다

insert into std2 values('test1','2','50','60');
insert into std2 values('test2','2','70','70');

delete from std2 where userid ='test1';
commit;
delete from std1 where userid='test1';

update std1 set userid='test1' where userid='test2';
-- 무결성 제약조건(C##JAVA.STD2_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다
update std1 set name='홍길동' where userid='test2';
-- 가능 변경되는 값이 관계를 설정한 키값이 아니기 때문에 수정이 가능
update std2 set userid='test101' where userid='test2';
-- 무결성 제약조건(C##JAVA.STD2_FK)이 위배되었습니다- 부모 키가 없습니다
--------------------------------------------------------------------------------
-- constraint std2_fk foreign key(userid) references std1(userid) on delete cascade;

drop table std2;

create table std2(
userid varchar2(50) not null,
gubun varchar2(20) not null,
eng number(3),
kor number(3),
constraint std2_fk foreign key(userid) references std1(userid) on delete cascade
);

-- on delete cascade :: 삭제시 적용되는것

commit;

delete from std2 where userid ='test1';
delete from std2; -- 전체 데이터 삭제
truncate table std2; -- 전체 데이터 삭제, 자동커밋, 데이터 공간제거(초기화)

--------------------------------------------------------------------------------
