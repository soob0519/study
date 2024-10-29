create table studentScore(
unq number not NULL,
userid varchar2(10) not null,
loc varchar2(10) not null,
kor number(3) default '0',
eng number(3) default '0',
primary key(unq) -- 중복방지키
);

insert into studentScore(unq, userid,loc,kor,eng)
values('1','test1','서울','90','80');
select * from studentScore;
insert into studentScore(unq, userid,loc,kor,eng)
values('2','abc77','서울','50','70');

insert into studentScore(unq, userid,loc,kor,eng)
values('2','abc789','부산','60','70'); -- primary key 설정으로 인한 중복 번호 오류 발생
insert into studentScore(unq, userid,loc,kor,eng)
values('3','','부산','60','70'); -- not null 처리된 데이터의 누락으로 오류 발생

insert into studentScore(unq, userid,loc,kor,eng)
values('3','aa100','마산','',''); -- 영어,국어 모두 null값 입력됨

select * from studentScore;
insert into studentScore(unq,userid,loc)
values('4','aa300','마산'); -- 영어, 국어 모두 기본값인 '0'이 입력됨

insert into studentScore(unq, userid,loc,kor,eng)
values('5','aa500','부산11','8000','70');

truncate table studentScore;

select * from studentScore;

commit;

update studentScore set loc='서울' where loc='1';
commit;
update studentScore set loc='대구' where loc='2';
commit;
update studentScore set loc='원주' where loc='3';
commit;
update studentScore set loc='전주' where loc='4';
commit;

select * from studentScore order by eng desc;
select max(eng) from studentscore;
select round((kor+eng)/2) as "평균" from studentscore where userid='st101';
select userid from studentScore where kor<60;
select * from studentScore where kor>60 and eng>60;
select * from studentScore where kor>60 or eng>60;
commit;

update studentScore set eng=eng+5 where userid='st101';
select * from studentScore where loc='대구';
select count(loc) from studentScore where loc='대구';
select userid,eng from studentScore where eng=(select max(eng) from studentScore);
