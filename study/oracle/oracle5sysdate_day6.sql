-- to_char()/to_date()
-- (1) to_char() : ��¥Ÿ�� �����͸� ����Ÿ�� �����ͷ� ��ȯ
-- (2) to_date() : ����Ÿ�� �����͸� ��¥Ÿ�� �����ͷ� ��ȯ

-- �ǽ�
select sysdate from dual; -- sysdate ���ó�¥(�ð�)�� ������ִ� ���� �÷�
select to_char(sysdate,'yyyy-mm-dd am hh:mi:ss day') from dual;
select to_char(sysdate,'yyyy') from dual;
select to_char(sysdate,'mm-dd') from dual;
select to_char(sysdate,'am') from dual; -- ����δ� ����Ÿ��

select to_char('2024','yyyy') from dual; -- '2024' ����Ÿ���̱⶧���� ������ ����

select to_char(sysdate,'day d dy') from dual;