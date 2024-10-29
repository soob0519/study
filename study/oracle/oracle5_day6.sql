-- (1)
desc emp;
desc dept;
desc salgrade;
--(2)
select * from emp;
select deptno, dname, loc from dept;
select * from salgrade;
--(3)
select ename from emp where deptno ='20';
--(4)
select ename from emp where sal>=1500;
--(5)
select grade ||'등급' as title from salgrade where losal <=1500 and hisal >=1500;
--(6)
select * from emp where mgr is null;
select * from emp where mgr is null and job!='PRESIDENT';
select * from emp where mgr is null and job!=upper('president');
select upper('java') from dual;
--(번외)
select * from emp where comm is null;
select * from emp where comm is null and job = upper('analyst');
select * from emp where job = upper('analyst') and comm is null;
--> 1000개 :: 커미션이 없는 데이터 800새 업무가 analyst 직원이 10명이면 이순서가 맞음
--(7)
-- 일괄처리
select rownum,substr(ename,1,2)||'***' as name from emp;
-- 이름 길이에 따라 처리
select length(ename) from emp;
-- rpad 함수 모자란 공간을 채우는 함수
select rpad(ename,7,'*') from emp;
select rownum,rpad(substr(ename,1,2),length(ename),'*') as name from emp;
select rpad('KI',4,'*') from dual;
select rpad('SC',5,'*') from dual;
--rpad
select rpad('ab',5,'*') from dual; -- ab***
select rpad('abc',5,'*') from dual; -- abc**
select rpad('abcde',5,'*') from dual; -- abcde

-- 내장 컬럼
select rownum,empno,ename from emp; -- (o)
select emp.empno,emp.ename from emp; -- (o)
select emp.rownum,emp.empno,emp.ename from emp; -- (x)
select rownum,emp.empno,emp.ename from emp; -- (o)
select rownum,empno,ename,job,mgr,hiredate,deptno from emp; -- (o)
select rownum,* from emp; --(x)
-- 외부 컬럼이 포함된 경우 테이블명 같이 세팅
select rownum,emp.* from emp; --(o)
-- max,min
select max(sal) from emp;
select max(sal) from emp where job!='PRESIDENT';
select min(sal) from emp where job!='PRESIDENT' and sal>0;

select sum(sal) from emp where job!='PRESIDENT' and sal>0;
select avg(sal) from emp where job!='PRESIDENT' and sal>0;
select round(avg(sal),2) from emp where job!='PRESIDENT' and sal>0;
select floor(avg(sal)) from emp where job!='PRESIDENT' and sal>0;
select count(*) from emp;

-- 커미션을 이용한 출력
select max(comm) from emp; -- 1400
select min(comm) from emp; -- 0
select sum(comm) from emp; -- 2200
select avg(comm) from emp; -- 550

-- sal+comm 출력
select sal+nvl(comm,0) from emp;
-- nvl(column,0) :: null 값 대비함수 >> 뜻 컬럼에 null값이 있으면 0으로 대입

-- 풀어보기
select max(sal) from emp where deptno = '10' and job!='PRESIDENT';
select * from emp where sal>=1000 and sal<=2000;
select * from emp where sal>=1000 or sal<=2000; -- (x)
select * from emp where deptno='10' or deptno='20'; --(o)
select * from emp where deptno='10' and deptno='20'; --(x)
select count(*) from emp where mgr='7566';
select count(*) from emp where job=upper('ANALYST');
select ename,to_char(hiredate,'yyyy-mm-dd') from emp;
select ename,to_char(hiredate,'yyyy/mm/dd') from emp;
select ename,hiredate from emp where hiredate >= '2000-01-01';
select ename,hiredate from emp where to_char(hiredate,'yyyy')>=2000;

-- 연결 연산자 || 이용
select ename ||','|| job as 사원별업무 from emp;
select ename ||','|| job as 사원별업무 from emp where rownum<10;
