select (sal+comm) as �޿� from emp;
select avg(comm) from emp;
select (sal+nvl(comm,0)) �޿� from emp;
select avg(nvl(comm,0)) from emp;
select (sal+nvl(comm,10)) �޿� from emp;
-- ��) �����ȣ, �����, �Ŵ�����ȣ ��� (��, nulll �� ��� 1004�� ���)
select empno,ename,nvl(mgr,1004) from emp; --(o)
select empno,ename,nvl(mgr,'1004') from emp; --(o)
--���ð��� �÷�Ÿ�԰� ��ġ�ؾ���
select empno,ename,nvl(mgr,'����') from emp; --(x)
-- ��) �����ȣ, �����, ���� ��� (��, nulll �� ��� '���'�� ���)
select empno,ename,nvl(job,'���') ���� from emp; --(o)
select empno,ename,nvl(job,1004) ���� from emp; --(o) ������ ����Ÿ������ ��ȯ�Ǽ� �׷���
-- ��) �����ȣ, �����, ���� ��� (��, nulll �� ��� '���'�� ���, �ƴѰ�� ���ڿ� '����')
-- nvl2 null�� ���� �ƴ� ��� �ΰ����� �Ѽ�����
-- nvl2(�����Ͱ�,null���� �ƴ� ���,null���� ���)
select empno,ename,nvl2(job,job||'����','���') ���� from emp;
-- �� �޿�(�⺻��+����) -> ������ �ִ� �������� 100���� ���ʽ� �߰� ����
select empno,ename,(sal+nvl2(comm,comm+100,0)) �Ǳ޿� from emp;
