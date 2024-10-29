-- ���̺� ī��
create table c_emp1 as select * from emp;
create table c_emp2 as select a2.* from
(select rownum rn,a1.* from (select empno,ename,deptno,mgr,sal,hiredate,comm from emp order by ename asc) a1) a2;
-- �����ͻ��� ����
-- ���������� �����ص� ���̺� ī�Ƕ� �״�� ��������
delete from c_emp2 where empno='8001';

-- view table
-- 1. ������̺�� ������ ����(��)�� ���� ���̺��� �����.
create view v_emp1 as select * from emp;
-- 2. ������̺��� (�����ȣ ����̸� �޿�)�� ������ �ִ� �������̺��� �����.
create view v_emp2 as select empno,ename,sal from emp;
-- 3. ������̺��� Ư�� SQL��� ���� ������ �Ǵ� �������̺��� �����.
create view v_emp3 as select empno,ename,(select dname from dept where deptno=emp.deptno) as dname from emp;
select * from v_emp3;
-- ���� 3��
create view v_emp4 as
select a2.* from
(select rownum rn,a1.* from (select empno,ename,deptno,mgr,sal,hiredate,comm from emp order by ename asc) a1) a2;

select * from v_emp4;
select * from v_emp4 where rn>=6 and rn<=10;

-- ����
drop view v_emp1;

-- ������ ���� :: �����Ͱ� ����Ǿ��ֱ� ������ ���� �����
update emp set ename='ȫ�繫7' where empno='9001';
select * from v_emp4;
-- �����̺��� ������ �� ����
update v_emp4 set ename='ȫ�繫1' where empno='9001'; --(x)
-- �����̺� ������ �� ����
delete from v_emp4 where empno='8001'; --(x)

