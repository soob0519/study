-- decode() �Լ�
-- ���� :: decode(�����Ͱ�(�÷�),��1,����1,��2,����2,��3,����3.....else)
-- ��) �μ��̸��� �ѱ�ǥ��
select deptno,
dname,
decode(deptno,10,'ȸ��',20,'����',30,'����',40,'��ȹ','����') dname2
from dept;
----------------------------------------------------
select decode('z','a','a�Դϴ�','b','b�Դϴ�','k','k�Դϴ�','���� �˼�����') �� from dual;
select decode('k','a','a�Դϴ�','b','b�Դϴ�','k','k�Դϴ�') �� from dual;
select decode('t','a','a�Դϴ�','b','b�Դϴ�','k','k�Դϴ�') �� from dual;
-----------------------------------------------------
select deptno,
dname,
decode(dname,'ACCOUNTING','ȸ��',
'RESEARCH','����',
'SALES','����',
'OPERATIONS','��ȹ',
'����') dname2 from dept;

select userid,gender from member; --('M','F')
select userid,decode(gender,'M','��','F','��') from member; --('M','F')
-- ::java
-- String gg = "";
-- if(gender.equals("M")){
-- gg="��";
-- } else if(gender.equals("F")){
-- gg="��";
-- }

select empno,ename,deptno,sal �⺻�޿�,decode(deptno,20,sal*1.1,sal) �λ�޿� from emp;