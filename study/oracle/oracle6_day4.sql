create table post1(
p1 varchar2(6),
p2 varchar2(50),
p3 varchar2(50),
p4 varchar2(50),
p5 varchar2(50),
p6 varchar2(50),
p7 varchar2(50),
p8 varchar2(300)
);

select * from post1 where p2 like '%����%';
select * from post1 where p7 is not null;
select * from post1 where p8 like '%���б�%';

comment on table post1 is '�����ȣ(�ּ�) ���̺�';
comment on column post1.p1 is '�����ȣ';
comment on column post1.p2 is '��.��';

comment on column post1.p3 is '��.��.��';
comment on column post1.p4 is '��.��.��';
comment on column post1.p5 is '��';
comment on column post1.p6 is '��.����';
comment on column post1.p7 is '����';
comment on column post1.p8 is '�ǹ���.�б���';

rollback;

select count(p1) from post1;
select count(*) from post1 where p2 like '%����%';
select * from post1 where p2 like '%����%' and p3 like '%���ʱ�%';
select * from post1 where p4 like '%����%';
select * from post1 where p3 like '%������%';
select distinct(p4) from post1 where p3 like '%������%';
select * from post1 where p6 like '%�޼���û%' or p7 like '%�޼���û%' or p8 like '%�޼���û%';
select distinct(p3) from post1 where p2 like '%�뱸%';
select
p1 || ' ' ||
p2 || ' ' ||
p3 || ' ' ||
p4 || ' ' ||
p5 || ' ' ||
p6 || ' ' ||
p7 || ' ' ||
p8 as address
from post1 where p1='306762';


-- ���̺��� �ڸ�Ʈ ��� ���̺�
select * from user_tab_comments;
select * from user_tab_comments where table_name='POST1';
-- ���̺� �÷��� �ڸ�Ʈ ��� ���̺�
select * from user_col_comments;
select * from user_col_comments where table_name='POST1';


commit;