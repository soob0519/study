-- Ǯ���
-- (1)
select empno,ename,deptno,sal �⺻�޿�,
decode(deptno,
10,sal*1.1,
20,sal*1.2,
sal*1.3) �λ�޿� from emp;
-- (2)
select empno,ename,job,
decode(job,
'ANALYST','�м���',
'CLERK','����',
'MANAGER','������',
'SALESMAN','�������',
'PRESIDENT','�����',
'�����ȵ�') job2 from emp;
-- (3)
select empno,ename,deptno,sal,decode(sal,sal>=2000,'��','��') ��� from emp; --(x)
-- �񱳴� ������ ���� ���� �����͸� �־�߸� ��
select empno,ename,deptno,sal,decode(sign(sal-2000),'1','��','��') ��� from emp;
-- 2000 �� 1000�̻� �� �׿� ��
select empno,ename,deptno,sal,decode(sign(sal-1999),'1','��',decode(sign(sal-999),'1','��','��')) ��� from emp;
-- sign() :: ���(1),����(-1),����(0)�� ����ϴ� �Լ�
select sign(500) from dual; -- 1
select sign(5) from dual; -- 1
select sign(-11111) from dual; -- -1
select sign(0) from dual; -- 0
-- (4)
select empno,ename,job,sal �⺻�޿�,
decode(job,
'ANALYST',sal*1.10,
'CLERK',sal*1.15,
'MANAGER',sal*1.20,
sal) �λ�޿� from emp;
-- (5)
select
(select count(*) from emp where to_char(hiredate,'mm') ='01 ')||'��' "1��",
(select count(*) from emp where to_char(hiredate,'mm') ='02')||'��' "2��",
(select count(*) from emp where to_char(hiredate,'mm') ='03')||'��' "3��",
(select count(*) from emp where to_char(hiredate,'mm') ='04')||'��' "4��",
(select count(*) from emp where to_char(hiredate,'mm') ='05')||'��' "5��",
(select count(*) from emp where to_char(hiredate,'mm') ='06')||'��' "6��" from dual;
------------------------------------------------------
select to_char(hiredate,'mm') from emp;
select decode(to_char(hiredate,'mm'),'01','1') from emp;
select count(decode(to_char(hiredate,'mm'),'01','1')) from emp;
------------------------------------------------------
select count(decode(to_char(hiredate,'mm'),'01','1')) "1��",
count(decode(to_char(hiredate,'mm'),'02','1')) "2��",
count(decode(to_char(hiredate,'mm'),'03','1')) "3��",
count(decode(to_char(hiredate,'mm'),'04','1')) "4��",
count(decode(to_char(hiredate,'mm'),'05','1')) "5��",
count(decode(to_char(hiredate,'mm'),'06','1')) "6��" from emp;

-- as "" �ֵ���ǥ ����
select avg(sal) as "���" from emp; --(o) -- ���� �̰� �⺻
select avg(sal) "���" from emp; --(o)
select avg(sal) ��� from emp; --(o)
-- �ȵǴ°� as Ÿ��Ʋ �� Į�����̶� ���Ƽ� �տ� ���ڰ� �ü� ����
-- �׷��� �ֵ���ǥ�� �ִ� ���� ����� �����
select avg(sal) 1��� from emp; --(x)
select avg(sal) "1���" from emp; --(o)
select avg(sal) ���1 from emp; --(o)

select count(*),count(*),count(*) from emp;
select count(*),count(comm),count(mgr) from emp;
select count(*),count(comm),count(mgr),sum(sal),avg(sal) from emp;
