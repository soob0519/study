-- {DML �۾�}
update score2 set loc='����Ư���� ������' where loc='1';
update score2 set loc='�뱸������ ������' where loc='2';
update score2 set loc='������ ���ֽ�' where loc='3';
update score2 set loc='����ϵ� ���ֽ�' where loc='4';
select * from score2;

commit;

select * from score2 where eng>=60 and kor>=60;
select * from score2 where eng<60 or kor<60;

--{9}
select max(eng) from score2 where loc='�뱸������ ������';
select userid,eng from score2 where eng=(select max(eng) from score2 where loc='�뱸������ ������');

--{7}
select * from score2 where loc='�뱸������ ������';
-- like �˻�����1 :: % : ����(��)�� 0�� �̻�
-- like �˻�����2 :: _ : ���ڰ� �ݵ�� 1���� (���� 1���� �ǹ�)
select * from score2 where loc like'%�뱸%';
-- �뱸 ���ڰ� �� �ְ� �յ� � ���ڿ��� �͵� ����.
-- ex) �뱸��(o), �뱸������(o), �뱸������ ������(o), ���ѹα� �뱸��(o), �뱸(o)
select * from score2 where loc like '�뱸%';
-- ex) �뱸��(o), �뱸������(o), ���ѹα� �뱸��(x)
select * from score2 where loc like '�뱸%';
-- ex) �뱸(o),�뱸��(x), �뱸������(x), �뱸������ ������(x), ���ѹα� �뱸��(x)

select * from score2 where loc like '�뱸_';
-- ex) �뱸(x),�뱸��(o), �뱸��(o), �뱸������(x), �뱸������ ������(x)

select * from score2 where loc like '_�뱸__';
-- ex) ���뱸3��(o),�뱸��(x), �뱸3��(x), ���뱸��3��(x)

select COUNT(loc) as total from score2 where loc like'%�뱸%';
select round(avg(eng)) from score2 where loc like '%������%';

select userid,kor from score2 where kor=(select max(kor) from score2 where loc like'%������%');

select max(eng+kor) from score2;

select userid,eng,kor from score2 where (eng+kor)=(select max(eng+kor) from score2);

