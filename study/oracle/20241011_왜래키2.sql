create table c1 (
hakbun number not null,
name varchar2(20) not null,
constraint c1_pk primary key(hakbun)
);

insert into c1(hakbun,name) values('101','ȫ�浿');
insert into c1(hakbun,name) values('102','�Ӳ���');

create table c2 (
hakbun number,
subject varchar2(50),
hakjum varchar2(10),
constraint c2_fk foreign key(hakbun) references c1(hakbun)
);

commit;

insert into c2(hakbun,subject,hakjum) values('101','java','A+');
insert into c2(hakbun,subject,hakjum) values('102','java','C+');

create table c3 (
code number not null,
subject varchar2(50) not null,
classroom varchar2(50),
constraint c3_pk primary key(code)
);

-- �������� �߰�
alter table c3 add constraint c3_classroom_un unique(classroom);
alter table c3 add constraint c3_subject_un unique(subject);
alter table c3 add constraint c3_pk primary key(code);

-- �������� ����
alter table c3 drop constraint c3_subject_un;
alter table c3 drop constraint c3_pk;

-- �������� ����
alter table c3 modify subject null;
alter table c3 modify subject not null;