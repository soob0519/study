-- 10�� 4�� �ǽ�����
-- ���̺� ����
-- 1. ���̺� ��ü���� (post1 -> post101)
create table post101 as select * from post1;

-- 2. ���̺� ��Ű�� ���� (post1 -> post101)
-- :: ��Ű�� : ���� >> ���̺� ������ ����
create table post102 as select * from post1 where 1=2;
create table post103 as select * from post1 where p2='�̱�';

select *from post1 where p2 = '�̱�';
-- ���ǿ� �´� �����Ͱ� ��� �ȳ����°� ������ �ƴ�
select * from post1 where 1=2;
-- false �� ���ǿ� �´� �����Ͱ� ��� �ȳ��� ������ �ƴ�
select * from post1 where 1=1;
-- true �� ���� ���

-- 3. ���̺� �κ� ����
-- �ǽ����� 6�� 10��(�ǽ�����)
create table post_seoul as select * from post1 where p2 like '%����%';
select count(*) from post1 where p2 like '%����%';
select count(*) from post_seoul;
select * from post1 where p2 like '%����%';

create table collage_addr as select * from post1 where p8 like '%����%';
select count(*) from post1 where p8 like '%����%';
select count(*) from collage_addr;

-- 4. �����͸� ���� & �ٿ��ֱ� (�������̺� ������ �ϰ��Է�) :: ���� ����
insert into post102 select * from post1 where rownum <= 10;

--{ROWNUM} ���ȣ
select rownum,unq,userid,kor,eng from studentscore;
delete from studentscore where unq=2;
select rownum,p1,p2,p3 from post1;

rollback;

-- (1) 1 ~ 5 ������
select rownum,unq,userid,kor,eng from studentscore where rownum < 6;

-- (2) 6�� �̻� ���
select rownum,unq,userid,kor,eng from studentscore where rownum >= 6; -- �ȵ�
-- unq�� ���� ����
select rownum,unq,userid,kor,eng from studentscore where unq >= 6;

-- (3) post1 ���̺� :: 1 ~ 5��
select rownum,p1,p2,p3 from post1 where rownum < 6;
-- (4) post1 ���̺� :: 2���̻�
select rownum,p1,p2,p3 from post1 where rownum >= 2;

-- rownum �����ͷ� ����� ���
--(5) post1 ���̺� :: 2���̻�
select rownum,p1,p2,p3 from post1 where rownum >= 2; -- �ȵ�
-- select �� ���̺��� �ƴ϶� ���̺� ����� �����͸� ���� ����

select t1.* from(select rownum as rn,p1,p2,p3 from post1) t1
where rn>=2; -- ������ ������ (rownum)�� ���� �����ͷ� ����°�.

select t1.* from(select rownum,p1,p2,p3 from post1) t1 where rn>=2;
-- �׳� rownum �� �ȵǴ� ���� select �� ������ rownum���� �ν��ؼ� �ȵ�

--(1)
select * from collage_addr;
--(2)
select p1 as zipcode, p2 as location, p8 as name from collage_addr;
create table collage1 as select p1 as zipcode, p2 as location, p8 as name from collage_addr;
--(2-1)
create table collage2 as select p1, p2, p8 from collage_addr;
alter table collage2 rename column p1 to zipcode;
alter table collage2 rename column p2 to location;
alter table collage2 rename column p8 to name;
--(3)
select rownum,zipcode,location,name from collage2 where location like '%����%';
--(4)-1~10
select * from(
select rownum as rn,zipcode,location,name from collage2)
where rn<11;
--(4)-11~20
select * from(
select rownum as rn,zipcode,location,name from collage2)
where rn>10 and rn<21;
--(4)-21~30
select * from(select rownum as rn,zipcode,location,name from collage2)
where rn>20 and rn<31;
--(5)
select * from (
select rownum as rn,zipcode,location,name from collage2 where location like '%����%')
where rn>=11 and rn<=20;
--(5)
select rownum,rn,zipcode,location,name from (
select rownum as rn,zipcode,location,name from collage2 where location like '%����%')
where rn>=11 and rn<=20;

--(6) ����//����
-- ���� ���� select ���� order by�� ���� :: order by ������ rownum�� ���� ����
select rownum,zipcode,location,name from collage2; --order by name asc;
select zipcode,location,name from collage2 order by name asc;

--(7) ������ ���� �� ���� ���� **�߿�**
-- ������ ��ȣ �����Ҷ� �̿�
select c2.* from(
select rownum rn,c1.* from
(select zipcode,location,name from collage2
order by name asc) c1 ) c2
where rn>=11 and rn <=20;

-- java :: ������ ��ȣ �����Ҷ� �̿�
1 -> 1
2 -> 11
3 -> 21
=>(n-1)*10+1
select c2.* from(
select rownum rn,c1.* from
(select zipcode,location,name from collage2
order by name asc) c1 ) c2
where rn>=${sno} and rn <= ${eno};

--(8)
select c2.* from(
select rownum rn,c1.* from
(select zipcode,location,name from collage2 where location like '%����%'
order by name asc) c1 ) c2
where rn>=8 and rn <=17;

--(1) �⺻
select userid,kor from studentscore;
--(2) 1�����
select userid,kor from studentscore order by kor desc;
--(3) ��������
select s2.* from
(select rownum rn,s1.* from
(select userid,kor from studentscore order by kor desc) s1) s2
where rn >= 1 and rn <= 5;

commit;