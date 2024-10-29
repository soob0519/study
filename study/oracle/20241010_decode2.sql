-- 풀어보기
-- (1)
select empno,ename,deptno,sal 기본급여,
decode(deptno,
10,sal*1.1,
20,sal*1.2,
sal*1.3) 인상급여 from emp;
-- (2)
select empno,ename,job,
decode(job,
'ANALYST','분석가',
'CLERK','점원',
'MANAGER','관리자',
'SALESMAN','영업사원',
'PRESIDENT','사장님',
'설정안됨') job2 from emp;
-- (3)
select empno,ename,deptno,sal,decode(sal,sal>=2000,'상','하') 등급 from emp; --(x)
-- 비교는 넣을수 없음 실제 데이터를 넣어야만 함
select empno,ename,deptno,sal,decode(sign(sal-2000),'1','상','하') 등급 from emp;
-- 2000 상 1000이상 중 그외 하
select empno,ename,deptno,sal,decode(sign(sal-1999),'1','상',decode(sign(sal-999),'1','중','하')) 등급 from emp;
-- sign() :: 양수(1),음수(-1),제로(0)을 출력하는 함수
select sign(500) from dual; -- 1
select sign(5) from dual; -- 1
select sign(-11111) from dual; -- -1
select sign(0) from dual; -- 0
-- (4)
select empno,ename,job,sal 기본급여,
decode(job,
'ANALYST',sal*1.10,
'CLERK',sal*1.15,
'MANAGER',sal*1.20,
sal) 인상급여 from emp;
-- (5)
select
(select count(*) from emp where to_char(hiredate,'mm') ='01 ')||'명' "1월",
(select count(*) from emp where to_char(hiredate,'mm') ='02')||'명' "2월",
(select count(*) from emp where to_char(hiredate,'mm') ='03')||'명' "3월",
(select count(*) from emp where to_char(hiredate,'mm') ='04')||'명' "4월",
(select count(*) from emp where to_char(hiredate,'mm') ='05')||'명' "5월",
(select count(*) from emp where to_char(hiredate,'mm') ='06')||'명' "6월" from dual;
------------------------------------------------------
select to_char(hiredate,'mm') from emp;
select decode(to_char(hiredate,'mm'),'01','1') from emp;
select count(decode(to_char(hiredate,'mm'),'01','1')) from emp;
------------------------------------------------------
select count(decode(to_char(hiredate,'mm'),'01','1')) "1월",
count(decode(to_char(hiredate,'mm'),'02','1')) "2월",
count(decode(to_char(hiredate,'mm'),'03','1')) "3월",
count(decode(to_char(hiredate,'mm'),'04','1')) "4월",
count(decode(to_char(hiredate,'mm'),'05','1')) "5월",
count(decode(to_char(hiredate,'mm'),'06','1')) "6월" from emp;

-- as "" 쌍따옴표 차이
select avg(sal) as "평균" from emp; --(o) -- 원래 이게 기본
select avg(sal) "평균" from emp; --(o)
select avg(sal) 평균 from emp; --(o)
-- 안되는거 as 타이틀 은 칼럼명이랑 같아서 앞에 숫자가 올수 없음
-- 그러나 쌍따옴표가 있는 경우는 출력을 허용함
select avg(sal) 1평균 from emp; --(x)
select avg(sal) "1평균" from emp; --(o)
select avg(sal) 평균1 from emp; --(o)

select count(*),count(*),count(*) from emp;
select count(*),count(comm),count(mgr) from emp;
select count(*),count(comm),count(mgr),sum(sal),avg(sal) from emp;
