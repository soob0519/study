-- 실습예제
--(1)
select rownum,e1.* from (select empno,ename,deptno from emp order by ename asc) e1;
--(2)
select a2.* from
(select rownum rn,a1.* from (select empno,ename,deptno from emp order by ename asc) a1) a2 
where rn>=6 and rn<=10;
--(3)
select rownum,a1.* from
(select rpad(substr(empno,1,2),length(empno),'*') as empno,ename, to_char(hiredate,'yyyy') as hiredate
from emp order by hiredate asc) a1;

select rownum rn,e1.* from
(select substr(empno,1,2)||'**' as empno,ename, to_char(hiredate,'yyyy') as hiredate
from emp order by hiredate asc) e1;
--(4)
select * from emp where upper(ename) = upper('scott');
--(5)
select * from emp where upper(ename) like upper('%sm%');
select * from emp where upper(ename) like '%'||upper('sm')||'%';
--(6)
select * from emp where upper(job)!=upper('president') and to_char(hiredate,'yyyy/mm/dd') like '%/02/%';
select * from emp where job!='PRESIDENT' and to_char(hiredate,'mm') = '02';
--(7)
select * from emp where job='SALESMAN' and (comm=0 or comm is null);
--(8)
select round(avg(sal),2) from emp where hiredate >= to_date('2010/01/01','yyyy/mm/dd');
select round(avg(sal),2) as avg from emp where to_char(hiredate,'yyyy') >= '2010';
--(9)
select * from emp where
hiredate >= to_date('2001/02/05','yyyy/mm/dd') and
hiredate <= to_date('2003/06/20','yyyy/mm/dd');

select * from emp where
to_char(hiredate,'yyyy-mm-dd') >= '2001-02-05'
and to_char(hiredate,'yyyy-mm-dd') <= '2003-06-20';
--(10)
update salgrade set losal='100' where grade='1';
select * from salgrade;
select * from emp where sal >= (select losal from salgrade where grade='1')
and sal<=(select hisal from salgrade where grade='1');
--(11)
select
empno,
ename,
(select dname from dept where deptno=emp.deptno) as dname 
from emp;
--(12)★
select
empno,
ename,
(select ename from emp e1 where empno=e2.mgr) as mgr 
from emp e2;
--(13)
select ename,
(select dname from dept where deptno=emp.deptno) as dname 
from emp 
where ename=upper('scott');
--(14) 가장 높은 급여를 받고 있는 사람의 정보를 출력하자
select * from emp where sal=(select max(sal) from emp where job != 'PRESIDENT');
--(15) 가장 높은 급여를 받고 있는 사람의 정보 (사원번호 사원이름 급여 부서명)
select empno,ename,sal,
(select dname from dept where dept.deptno=emp.deptno) as dname 
from emp where sal=(select max(sal) from emp where job != 'PRESIDENT');
