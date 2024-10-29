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
select grade ||'���' as title from salgrade where losal <=1500 and hisal >=1500;
--(6)
select * from emp where mgr is null;
select * from emp where mgr is null and job!='PRESIDENT';
select * from emp where mgr is null and job!=upper('president');
select upper('java') from dual;
--(����)
select * from emp where comm is null;
select * from emp where comm is null and job = upper('analyst');
select * from emp where job = upper('analyst') and comm is null;
--> 1000�� :: Ŀ�̼��� ���� ������ 800�� ������ analyst ������ 10���̸� �̼����� ����
--(7)
-- �ϰ�ó��
select rownum,substr(ename,1,2)||'***' as name from emp;
-- �̸� ���̿� ���� ó��
select length(ename) from emp;
-- rpad �Լ� ���ڶ� ������ ä��� �Լ�
select rpad(ename,7,'*') from emp;
select rownum,rpad(substr(ename,1,2),length(ename),'*') as name from emp;
select rpad('KI',4,'*') from dual;
select rpad('SC',5,'*') from dual;
--rpad
select rpad('ab',5,'*') from dual; -- ab***
select rpad('abc',5,'*') from dual; -- abc**
select rpad('abcde',5,'*') from dual; -- abcde

-- ���� �÷�
select rownum,empno,ename from emp; -- (o)
select emp.empno,emp.ename from emp; -- (o)
select emp.rownum,emp.empno,emp.ename from emp; -- (x)
select rownum,emp.empno,emp.ename from emp; -- (o)
select rownum,empno,ename,job,mgr,hiredate,deptno from emp; -- (o)
select rownum,* from emp; --(x)
-- �ܺ� �÷��� ���Ե� ��� ���̺�� ���� ����
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

-- Ŀ�̼��� �̿��� ���
select max(comm) from emp; -- 1400
select min(comm) from emp; -- 0
select sum(comm) from emp; -- 2200
select avg(comm) from emp; -- 550

-- sal+comm ���
select sal+nvl(comm,0) from emp;
-- nvl(column,0) :: null �� ����Լ� >> �� �÷��� null���� ������ 0���� ����

-- Ǯ���
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

-- ���� ������ || �̿�
select ename ||','|| job as ��������� from emp;
select ename ||','|| job as ��������� from emp where rownum<10;
