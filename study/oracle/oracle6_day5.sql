create table post2 as select * from post1 where 1=2;
truncate table post2;

--(9)
select 
'[' ||p1||'] '||
p2||' '||
p3||' '||
p4||' '||
p5||' '||
p6||' '||
p7||' '||
p8 as 결과주소 from post1 where p1='306762';

--(4)
select distinct(p3) from post1 where p2 like '%서울%';
-- distinct() :: 중복방지 출력

