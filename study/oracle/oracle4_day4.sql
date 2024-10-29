-- {DML 작업}
update score2 set loc='서울특별시 강남구' where loc='1';
update score2 set loc='대구광역시 수성구' where loc='2';
update score2 set loc='강원도 원주시' where loc='3';
update score2 set loc='전라북도 전주시' where loc='4';
select * from score2;

commit;

select * from score2 where eng>=60 and kor>=60;
select * from score2 where eng<60 or kor<60;

--{9}
select max(eng) from score2 where loc='대구광역시 수성구';
select userid,eng from score2 where eng=(select max(eng) from score2 where loc='대구광역시 수성구');

--{7}
select * from score2 where loc='대구광역시 수성구';
-- like 검색도구1 :: % : 문자(열)이 0개 이상
-- like 검색도구2 :: _ : 문자가 반드시 1개만 (문자 1개를 의미)
select * from score2 where loc like'%대구%';
-- 대구 글자가 들어가 있고 앞뒤 어떤 문자열이 와도 좋다.
-- ex) 대구시(o), 대구광역시(o), 대구광역시 수성구(o), 대한민국 대구시(o), 대구(o)
select * from score2 where loc like '대구%';
-- ex) 대구시(o), 대구광역시(o), 대한민국 대구시(x)
select * from score2 where loc like '대구%';
-- ex) 대구(o),대구시(x), 대구광역시(x), 대구광역시 수성구(x), 대한민국 대구시(x)

select * from score2 where loc like '대구_';
-- ex) 대구(x),대구시(o), 대구동(o), 대구광역시(x), 대구광역시 수성구(x)

select * from score2 where loc like '_대구__';
-- ex) 서대구3번(o),대구시(x), 대구3번(x), 서대구역3번(x)

select COUNT(loc) as total from score2 where loc like'%대구%';
select round(avg(eng)) from score2 where loc like '%강원도%';

select userid,kor from score2 where kor=(select max(kor) from score2 where loc like'%강원도%');

select max(eng+kor) from score2;

select userid,eng,kor from score2 where (eng+kor)=(select max(eng+kor) from score2);

