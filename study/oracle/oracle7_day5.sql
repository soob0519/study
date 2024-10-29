-- 10월 4일 실습예제
-- 테이블 복사
-- 1. 테이블 전체복사 (post1 -> post101)
create table post101 as select * from post1;

-- 2. 테이블 스키마 복사 (post1 -> post101)
-- :: 스키마 : 구조 >> 테이블 구조만 복사
create table post102 as select * from post1 where 1=2;
create table post103 as select * from post1 where p2='미국';

select *from post1 where p2 = '미국';
-- 조건에 맞는 데이터가 없어서 안나오는것 오류가 아님
select * from post1 where 1=2;
-- false 라서 조건에 맞는 데이터가 없어서 안나옴 오류가 아님
select * from post1 where 1=1;
-- true 라서 전부 출력

-- 3. 테이블 부분 복사
-- 실습예제 6강 10번(실습문제)
create table post_seoul as select * from post1 where p2 like '%서울%';
select count(*) from post1 where p2 like '%서울%';
select count(*) from post_seoul;
select * from post1 where p2 like '%서울%';

create table collage_addr as select * from post1 where p8 like '%대학%';
select count(*) from post1 where p8 like '%대학%';
select count(*) from collage_addr;

-- 4. 데이터만 복사 & 붙여넣기 (기존테이블에 데이터 일괄입력) :: 같은 구조
insert into post102 select * from post1 where rownum <= 10;

--{ROWNUM} 행번호
select rownum,unq,userid,kor,eng from studentscore;
delete from studentscore where unq=2;
select rownum,p1,p2,p3 from post1;

rollback;

-- (1) 1 ~ 5 번까지
select rownum,unq,userid,kor,eng from studentscore where rownum < 6;

-- (2) 6번 이상 출력
select rownum,unq,userid,kor,eng from studentscore where rownum >= 6; -- 안됨
-- unq로 변경 가능
select rownum,unq,userid,kor,eng from studentscore where unq >= 6;

-- (3) post1 테이블 :: 1 ~ 5번
select rownum,p1,p2,p3 from post1 where rownum < 6;
-- (4) post1 테이블 :: 2번이상
select rownum,p1,p2,p3 from post1 where rownum >= 2;

-- rownum 데이터로 만드는 방법
--(5) post1 테이블 :: 2번이상
select rownum,p1,p2,p3 from post1 where rownum >= 2; -- 안됨
-- select 는 테이블이 아니라 테이블 모양의 데이터만 오면 가능

select t1.* from(select rownum as rn,p1,p2,p3 from post1) t1
where rn>=2; -- 가상의 데이터 (rownum)을 실제 데이터로 만드는것.

select t1.* from(select rownum,p1,p2,p3 from post1) t1 where rn>=2;
-- 그냥 rownum 이 안되는 이유 select 가 본인의 rownum으로 인식해서 안됨

--(1)
select * from collage_addr;
--(2)
select p1 as zipcode, p2 as location, p8 as name from collage_addr;
create table collage1 as select p1 as zipcode, p2 as location, p8 as name from collage_addr;
--(2-1)
create table collage2 as select p1, p2, p8 from collage_addr;
alter table collage2 rename column p1 to zipcode;
alter table collage2 rename column p2 to location;
alter table collage2 rename column p8 to name;
--(3)
select rownum,zipcode,location,name from collage2 where location like '%서울%';
--(4)-1~10
select * from(
select rownum as rn,zipcode,location,name from collage2)
where rn<11;
--(4)-11~20
select * from(
select rownum as rn,zipcode,location,name from collage2)
where rn>10 and rn<21;
--(4)-21~30
select * from(select rownum as rn,zipcode,location,name from collage2)
where rn>20 and rn<31;
--(5)
select * from (
select rownum as rn,zipcode,location,name from collage2 where location like '%서울%')
where rn>=11 and rn<=20;
--(5)
select rownum,rn,zipcode,location,name from (
select rownum as rn,zipcode,location,name from collage2 where location like '%서울%')
where rn>=11 and rn<=20;

--(6) 순차//역순
-- 실행 순서 select 이후 order by로 정렬 :: order by 에서는 rownum을 쓰지 않음
select rownum,zipcode,location,name from collage2; --order by name asc;
select zipcode,location,name from collage2 order by name asc;

--(7) 순차적 정렬 후 범위 설정 **중요**
-- 페이지 번호 정렬할때 이용
select c2.* from(
select rownum rn,c1.* from
(select zipcode,location,name from collage2
order by name asc) c1 ) c2
where rn>=11 and rn <=20;

-- java :: 페이지 번호 정렬할때 이용
1 -> 1
2 -> 11
3 -> 21
=>(n-1)*10+1
select c2.* from(
select rownum rn,c1.* from
(select zipcode,location,name from collage2
order by name asc) c1 ) c2
where rn>=${sno} and rn <= ${eno};

--(8)
select c2.* from(
select rownum rn,c1.* from
(select zipcode,location,name from collage2 where location like '%서울%'
order by name asc) c1 ) c2
where rn>=8 and rn <=17;

--(1) 기본
select userid,kor from studentscore;
--(2) 1등부터
select userid,kor from studentscore order by kor desc;
--(3) 범위설정
select s2.* from
(select rownum rn,s1.* from
(select userid,kor from studentscore order by kor desc) s1) s2
where rn >= 1 and rn <= 5;

commit;