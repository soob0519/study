-- select sum(sal) from emp where deptno=10;
-- select sum(sal) from emp where deptno=20;
-- asc : 순차적 정렬, 생략가능
-- desc : 역순 정렬
select deptno,sum(sal) from emp
group by deptno order by deptno;

select deptno,max(sal),min(sal) from emp
group by deptno having min(sal) > 1000;

select empno,min(sal) from emp; --(x)
select min(sal) from emp where min(sal) > 1000; --(x)

select min(sal) from emp where min(sal) > 1000; -- 자체적인 문법오류
select min(sal) from emp where (select min(sal) from emp)>1000; -- 출력이 안되는 것 뿐
select min(sal) from emp where (select min(sal) from emp)>1000; -- where 0>1000 :: 말이 안됨

-- select avg(sal) from emp where job='MANAGER';
select job,to_char(round(avg(sal)),'FM999,999') as "급여평균" from emp group by job;

select empno,job,to_char(round(avg(sal)),'FM999,999') as "급여평균" from emp group by job; -- (x)

select deptno,round(avg(sal)) from emp
group by deptno having avg(sal)>=2000;

select deptno,round(avg(sal)) from emp
where ename != 'KING'
group by deptno having avg(sal)>=2000;
-- having 하고 where 구분할것~!

select deptno,round(avg(sal)) as avg from emp
group by deptno
having avg(sal) = (select min(avg(sal)) from emp group by deptno);

-- Q1
select deptno,count(*) from emp group by deptno order by deptno;
select deptno,count(*) from emp group by deptno order by count(*);
-- Q2
select deptno,
count(*) "사원수",
round(avg(sal)) "급여평균",
round(sum(sal)) "급여합계"
from emp
where deptno != 40
group by deptno order by deptno desc;

-- Q3
select d.dname, e.* from (
select deptno deptno,
count(*) cnt1,
round(avg(sal)) avg1,
sum(sal) sum1
from emp group by deptno
having count(*) >= 5) e, dept d
where e.deptno = d.deptno;
-- deptno as deptno 여야하는 이유는 밖에 where 조인조건에 e.deptno = d.deptno;를 사용했기 때문

