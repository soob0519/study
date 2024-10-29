-- �������� ���̺� �����
-- ������ȣ, ����, ��ȣ, �̸�, ����, ��ȸ��, �����
-- �����ڰ� ������ �ϱ� ���� ������ȣ�� ���δ�.
create table nboard(
unq number not null,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(20),
content varchar2(4000),
hits number default '0', -- �⺻�� ����
rdate timestamp, -- ��¥�� �ð�
primary key(unq) -- �ߺ�����,null������, ���� �˻� (������ȣ)
);

--���� > delete from nboard where ������ȣ ='3';
create sequence nboard_seq
increment by 1
start with 1
maxvalue 9999;

insert into nboard(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE)
values(nboard_seq.nextval,'html','1234','ȫ�浿','abcd','0',sysdate);

insert into nboard(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE)
values(nboard_seq.nextval,'css','1111','�Ӳ���','abcdsssss','0',sysdate);
insert into nboard(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE)
values(nboard_seq.nextval,'java','4444','�˶��','abcdssss','0',sysdate);
insert into nboard(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE)
values(nboard_seq.nextval,'script','3333','�ŵ�����','abcdssss','0',sysdate);
insert into nboard(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE)
values(nboard_seq.nextval,'oracle','2222','����','abcddasdads','0',sysdate);
insert into nboard(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE)
values(nboard_seq.nextval,'spring','1111','�ȳ�','abcddakakhsd','0',sysdate);

commit;
delete from nboard where unq='3';

insert into nboard(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE)
values(nboard_seq.nextval,'new!!','5555','������','abfs','0',sysdate);
-- ������ �帧 ����
-- in-> 1
-- in-> 2
-- in-> 3 -> (x)
-- in-> 4
-- in-> 5
-- del ->3
-- in-> 6
-- in-> 7 -> (x)
-- del -> 7
-- in-> 8

-- ������ ��ɾ�
-- 1. ��������.nextval :: ������ȣ ����(���)
-- 2. ��������.currval :: �����ȣ ���
select nboard_seq.nextval from dual;
select nboard_seq.currval from dual;

-- �����ȣ���� ����� ������ ��ȣ ���� 9001~9999
create sequence emp_seq
start with 9001
increment by 1
maxvalue 9999;
insert into emp values
(emp_seq.nextval,'ȫ�繫','CLERK','7788','2024-05-06','320','','40');

