create table post1(
p1 varchar2(6),
p2 varchar2(50),
p3 varchar2(50),
p4 varchar2(50),
p5 varchar2(50),
p6 varchar2(50),
p7 varchar2(50),
p8 varchar2(300)
);

select * from post1 where p2 like '%강원%';
select * from post1 where p7 is not null;
select * from post1 where p8 like '%대학교%';

comment on table post1 is '우편번호(주소) 테이블';
comment on column post1.p1 is '우편번호';
comment on column post1.p2 is '시.도';

comment on column post1.p3 is '시.군.구';
comment on column post1.p4 is '동.면.읍';
comment on column post1.p5 is '리';
comment on column post1.p6 is '섬.도서';
comment on column post1.p7 is '번지';
comment on column post1.p8 is '건물명.학교명';

rollback;

select count(p1) from post1;
select count(*) from post1 where p2 like '%서울%';
select * from post1 where p2 like '%서울%' and p3 like '%서초구%';
select * from post1 where p4 like '%양재%';
select * from post1 where p3 like '%구리시%';
select distinct(p4) from post1 where p3 like '%구리시%';
select * from post1 where p6 like '%달서구청%' or p7 like '%달서구청%' or p8 like '%달서구청%';
select distinct(p3) from post1 where p2 like '%대구%';
select
p1 || ' ' ||
p2 || ' ' ||
p3 || ' ' ||
p4 || ' ' ||
p5 || ' ' ||
p6 || ' ' ||
p7 || ' ' ||
p8 as address
from post1 where p1='306762';


-- 테이블명과 코멘트 등록 테이블
select * from user_tab_comments;
select * from user_tab_comments where table_name='POST1';
-- 테이블 컬럼의 코멘트 등록 테이블
select * from user_col_comments;
select * from user_col_comments where table_name='POST1';


commit;