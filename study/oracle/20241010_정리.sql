-- count(comm) :: null ���� �����ϰ� ��� ������ ��
-- sum() :: �հ�
-- avg() :: ���
-- round(����) :: �ݿø� �Լ�
-- ceil(����) :: �ø� �Լ�
-- floor(����) :: ���� �Լ�
-- length(����) :: ���ڿ�����
-- substr(����,���۹�ȣ,����ȣ) :: ��������
-- upper(���ĺ�) :: �빮��
-- lower(���ĺ�) :: �ҹ���
-- || :: ���Ῥ����
-- nvl(����) :: null�� ��� �Լ�
-- nvl2(����) :: null�� ��� �Լ�
-- decode(����) :: �����Լ�
-- sign(��ġ) :: ���,����,����
-- in() :: ���ǹ��� "or"�� ���� �ǹ��� �Լ�
select * from emp where deptno in(10,20);
select * from emp where deptno= 10 or deptno=20;
-- between ~ and :: ���ǹ��� "and" �� ���� �ǹ��� Ű����
select * from emp where sal between 1000 and 2000;
-------------------------------------------------------
-- like �˻� :: %(������ ���ڿ��� 0�� �̻�)%,_(������ ���� 1��)
select * from emp where ename like '%SC%'; -- "SC"���ڰ� ���Ե� ������
select * from emp where ename like 'SC___'; -- "SC"���ڷ� ���۵Ǵ� �� 5���� ������

-- rownum :: ���ȣ
select rownum,emp.* from emp;

-- sysdate :: ���糯¥�� �ð��� �������� �ý��� ���� �÷�(�Ӽ�)
select sysdate from dual; -- �⺻���(��¥)
-- to_char
select to_char(sysdate,'yyyy-mm-dd hh24-mi-ss') from dual;
-- to_date
select to_date('20241225','yyyymmdd') from dual; -- �⺻���(��¥)

-- ���̺� ����
create table emp11 as select * from emp; -- ���̺� ��ü ����(�����͵� ����)
create table emp22 as select * from emp where 1=2; -- ���̺� ������ ����

-- �����̺� :: �������� �뷮 ����
create view v_emp13 as select * from emp;

-- sequence :: ������ ��ü - �ڵ����� �������� �Ǵ� ��ü
create sequence emp_seq7
start with 1
increment by 1
maxvalue 99999;
select emp_seq7.nextval from dual;
