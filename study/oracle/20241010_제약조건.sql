-- ID ��ȣ �̸� ���� ���� ����ó �����
---------------------------------------------------------------------------
-- primary key :: �ߺ�����, null�� ����, �����˻�, ���̺�� 1��
-- unique :: �ߺ�����, null�� ��������, �����˻�, ���̺�� ������
-- check :: �����ͼ���(������ �����͸� �Է°���)
-- not null :: �ΰ�����
-- default :: �⺻��
---------------------------------------------------------------------------

create SEQUENCE member1_seq
start with 1
increment BY 1
maxvalue 99999;


create table member1(
unq number not null primary key,
userid varchar2(50) not null unique,
pass varchar2(100) not null,
name varchar2(50) not null,
gender char(1) check(gender in('M','F')),
birthday date default '1900-01-01',
phone varchar2(50),
rdate timestamp
);

insert into member1 values(member1_seq.nextval,'test1','1111','ȫ�浿','M','20001225','010-7777-7777',sysdate);
insert into member1 values(member1_seq.nextval,'test2','1111','�Ӳ���','M','20100505','010-8888-7777',sysdate);
commit;

insert into member1 values(member1_seq.nextval,'test3','1111','������','T','20001111','010-1111-7777',sysdate); --(x)
-- üũ ���� ���� (üũ ���ǿ� ���� �ʴ´�)
insert into member1 values(member1_seq.nextval,'test2','1111','������','F','20001111','010-1111-7777',sysdate); --(x)
-- ���Ἲ ���� ���� (���̵� �ߺ� unique)
insert into member1 values(member1_seq.nextval,'test3','','������','F','20001111','010-1111-7777',sysdate); --(x)
-- null������ ��ȣ ����

insert into member1 (UNQ,USERID,PASS,NAME,GENDER,PHONE,RDATE)
values(member1_seq.nextval,'test3','1111','�Ӱ���','M','010-9999-7777',sysdate);
-- ���� ���� �Ǿ�����쿡�� ����Ʈ���� �� :: ��ĭ���� �θ� null�� ��
insert into member1 values(member1_seq.nextval,'test4','1111','�Ӱ���','M','03012010','010-0000-7777',sysdate);
-- ���ͷ��� ���� ���ڿ��� ��ġ���� ���� (��¥ ������ ���� ����)
insert into member1 values(member1_seq.nextval,'test4','1111','�Ӱ���','M',to_date('03012010','mm-dd-yyyy'),'010-0000-7777',sysdate);
insert into member1 values(member1_seq.nextval,'test5','1111','�Ӱ���','M','03012010 12:22:22','010-0000-0000',sysdate);
-- ���ͷ��� ���� ���ڿ��� ��ġ���� ���� (�������� ũ�⸦ �Ѿ������)
insert into member1 values(member1_seq.nextval,'test5','1111','�Ӱ���','M',to_date('03012010 12:22:22','mm-dd-yyyy hh24:mi:ss'),'010-0000-0000',sysdate);

alter table member1 modify userid varchar2(12);
insert into member1 values(member1_seq.nextval,'test123456789101112','1111','ȫ�浿','M','20001225','010-7777-7777',sysdate);
-- "C##JAVA"."MEMBER1"."USERID" ���� ���� ���� �ʹ� ŭ(����: 19, �ִ밪: 12)

insert into member1 values(member1_seq.nextval,'test13','1111','ȫ�浿','M','20001225','010-7777-7777','2024-10-10');
insert into member1 values(member1_seq.nextval,'test14','1111','ȫ�浿','M','20001225','010-7777-7777','');



create table member2(
unq number not null,
userid varchar2(50) not null,
pass varchar2(100) not null,
name varchar2(50) not null,
gender char(1),
birthday date default '1900-01-01',
phone varchar2(50),
rdate timestamp,
CONSTRAINT member2_unq_pk primary key(unq),
CONSTRAINT member2_userid_un unique(userid),
CONSTRAINT member2_gender_ck check(gender in('M','F'))
);

-- ��Ī���� ���� ���� :: ��Ī �ߺ� ���� �ȵ� �������̿�����.
-- ��) member2_gender_ck
