create table studentScore(
unq number not NULL,
userid varchar2(10) not null,
loc varchar2(10) not null,
kor number(3) default '0',
eng number(3) default '0',
primary key(unq) -- �ߺ�����Ű
);

insert into studentScore(unq, userid,loc,kor,eng)
values('1','test1','����','90','80');
select * from studentScore;
insert into studentScore(unq, userid,loc,kor,eng)
values('2','abc77','����','50','70');

insert into studentScore(unq, userid,loc,kor,eng)
values('2','abc789','�λ�','60','70'); -- primary key �������� ���� �ߺ� ��ȣ ���� �߻�
insert into studentScore(unq, userid,loc,kor,eng)
values('3','','�λ�','60','70'); -- not null ó���� �������� �������� ���� �߻�

insert into studentScore(unq, userid,loc,kor,eng)
values('3','aa100','����','',''); -- ����,���� ��� null�� �Էµ�

select * from studentScore;
insert into studentScore(unq,userid,loc)
values('4','aa300','����'); -- ����, ���� ��� �⺻���� '0'�� �Էµ�

insert into studentScore(unq, userid,loc,kor,eng)
values('5','aa500','�λ�11','8000','70');

truncate table studentScore;

select * from studentScore;

commit;

update studentScore set loc='����' where loc='1';
commit;
update studentScore set loc='�뱸' where loc='2';
commit;
update studentScore set loc='����' where loc='3';
commit;
update studentScore set loc='����' where loc='4';
commit;

select * from studentScore order by eng desc;
select max(eng) from studentscore;
select round((kor+eng)/2) as "���" from studentscore where userid='st101';
select userid from studentScore where kor<60;
select * from studentScore where kor>60 and eng>60;
select * from studentScore where kor>60 or eng>60;
commit;

update studentScore set eng=eng+5 where userid='st101';
select * from studentScore where loc='�뱸';
select count(loc) from studentScore where loc='�뱸';
select userid,eng from studentScore where eng=(select max(eng) from studentScore);
