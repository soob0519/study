 -- �л� - ���̵� ��ȣ �̸� �ּ� ���� ����
create table std1(
userid varchar2(50) not null primary key,
pass varchar2(100) not null,
name varchar2(50) not null,
addr varchar2(100)
);

insert into std1 values('test1','1212','aaa','����');
insert into std1 values('test2','1333','bbb','�λ�');

create table std2(
userid varchar2(50) not null,
gubun varchar2(20) not null,
eng number(3),
kor number(3),
constraint std2_fk foreign key(userid) references std1(userid)
);
-- constraint ��Ī foreign key(���� �÷���) references �θ����̺��(�θ����̺��÷�)

insert into std2 values('test1','1','80','90');
insert into std2 values('test2','1','100','100');

commit;

insert into std2 values('test3','1','80','70');
-- ���Ἲ ��������(C##JAVA.STD2_FK)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�

delete from std1 where userid='test1';
-- ���Ἲ ��������(C##JAVA.STD2_FK)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�

insert into std2 values('test1','2','50','60');
insert into std2 values('test2','2','70','70');

delete from std2 where userid ='test1';
commit;
delete from std1 where userid='test1';

update std1 set userid='test1' where userid='test2';
-- ���Ἲ ��������(C##JAVA.STD2_FK)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
update std1 set name='ȫ�浿' where userid='test2';
-- ���� ����Ǵ� ���� ���踦 ������ Ű���� �ƴϱ� ������ ������ ����
update std2 set userid='test101' where userid='test2';
-- ���Ἲ ��������(C##JAVA.STD2_FK)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�
--------------------------------------------------------------------------------
-- constraint std2_fk foreign key(userid) references std1(userid) on delete cascade;

drop table std2;

create table std2(
userid varchar2(50) not null,
gubun varchar2(20) not null,
eng number(3),
kor number(3),
constraint std2_fk foreign key(userid) references std1(userid) on delete cascade
);

-- on delete cascade :: ������ ����Ǵ°�

commit;

delete from std2 where userid ='test1';
delete from std2; -- ��ü ������ ����
truncate table std2; -- ��ü ������ ����, �ڵ�Ŀ��, ������ ��������(�ʱ�ȭ)

--------------------------------------------------------------------------------
