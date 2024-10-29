create table score2(
unq number not null,
userid varchar2(10) not null,
loc varchar2(10),
kor number(3) default '0' not null, -- 기본 값 설정
eng number(3) default '0' not null,
primary key(unq) -- 기본 키 설정(고유값 설정) 중복설정 불가
);

alter table score2 modify userid varchar2(50);

desc score2;

alter table score2 modify loc varchar2(100);
desc score2;

alter table score2 add math number(3) default '0' not null;
alter table score2 drop column math;

commit; -- 적용안됨
rollback; -- 적용안됨

truncate table score2;



