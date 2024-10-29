-- select sum(sal) from emp where deptno=10;
-- select sum(sal) from emp where deptno=20;
-- asc : ������ ����, ��������
-- desc : ���� ����
select deptno,sum(sal) from emp
group by deptno order by deptno;

select deptno,max(sal),min(sal) from emp
group by deptno having min(sal) > 1000;

select empno,min(sal) from emp; --(x)
select min(sal) from emp where min(sal) > 1000; --(x)

select min(sal) from emp where min(sal) > 1000; -- ��ü���� ��������
select min(sal) from emp where (select min(sal) from emp)>1000; -- ����� �ȵǴ� �� ��
select min(sal) from emp where (select min(sal) from emp)>1000; -- where 0>1000 :: ���� �ȵ�

-- select avg(sal) from emp where job='MANAGER';
select job,to_char(round(avg(sal)),'FM999,999') as "�޿����" from emp group by job;

select empno,job,to_char(round(avg(sal)),'FM999,999') as "�޿����" from emp group by job; -- (x)

select deptno,round(avg(sal)) from emp
group by deptno having avg(sal)>=2000;

select deptno,round(avg(sal)) from emp
where ename != 'KING'
group by deptno having avg(sal)>=2000;
-- having �ϰ� where �����Ұ�~!

select deptno,round(avg(sal)) as avg from emp
group by deptno
having avg(sal) = (select min(avg(sal)) from emp group by deptno);

-- Q1
select deptno,count(*) from emp group by deptno order by deptno;
select deptno,count(*) from emp group by deptno order by count(*);
-- Q2
select deptno,
count(*) "�����",
round(avg(sal)) "�޿����",
round(sum(sal)) "�޿��հ�"
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
-- deptno as deptno �����ϴ� ������ �ۿ� where �������ǿ� e.deptno = d.deptno;�� ����߱� ����

