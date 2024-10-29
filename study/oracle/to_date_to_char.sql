-- to_char()/to_date()
-- (1) to_char() : ��¥Ÿ�� �����͸� ����Ÿ�� �����ͷ� ��ȯ
-- (2) to_date() : ����Ÿ�� �����͸� ��¥Ÿ�� �����ͷ� ��ȯ

-- �ǽ�
select sysdate from dual; -- sysdate ���ó�¥(�ð�)�� ������ִ� ���� �÷�
select to_char(sysdate,'yyyy-mm-dd am hh:mi:ss day') from dual;
select to_char(sysdate,'yyyy') from dual;
select to_char(sysdate,'mm-dd') from dual;
select to_char(sysdate,'am') from dual; -- ����δ� ����Ÿ��

select to_char('2024','yyyy') from dual; -- (x) '2024'����Ÿ���̱⶧���� ������ ����

-- d(�Ӽ�) : ��(1) ��(2) ~~ ��(7)
select to_char(sysdate,'day d dy') from dual;

-- to_date
select to_date('20241225','yyyymmdd') from dual;
select to_date('2024-12-25','yyyy-mm-dd') from dual;
select to_date('12-25-2024','mm-dd-yyyy') from dual;
select to_date('12-25-2024','yyyy-mm-dd') from dual; -- ����

select to_date('2023','yyyy') from dual; -- 23/10/01
select to_date('2023-05','yyyy-mm') from dual; --23/05/01

-- ����� �ú��� ����
select to_date('2024-12-25 15:20:25','yyyy-mm-dd hh24:mi:ss') from dual;

-- 2024/12/25 �� ǥ���ϰ� ������
select to_char(to_date('2024-12-25 15:20:25','yyyy-mm-dd hh24:mi:ss'),'yyyy/mm/dd') from dual;
select to_char(to_date('2024-12-25 15:20:25','yyyy-mm-dd hh24:mi:ss'),'hh:mi:ss') from dual;
