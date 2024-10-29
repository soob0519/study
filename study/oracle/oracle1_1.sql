create TABLE student(
userid varchar2(20) not null,
username char(10) not null,
age number,
gender char(1), --M,F
grade char(1) -- 1,2,3
);

insert into student VALUES('st101','tom',15,'m','2');

insert into student VALUES('st102','Jane',16,'F','3');
insert into student VALUES('st103','Yakima',14,'M','1');
insert into student VALUES('st104','Yong',14,'','1');
insert into student VALUES('st105','Minyo',0,'F','');
insert into student VALUES('st106','Kang',15,'','2');
insert into student VALUES('st107','Kim',0,'M','');
insert into student VALUES('st108','Miranda',15,'F','2');

update student set username = 'Tom' where userid='st101';
update student set gender= 'M' where userid='st101';
commit;

select count(*) from student;
select sum(age)from student;
select avg(age)from student;
select min(age)from student;
select max(age)from student;

select username as '이름', userid as '아이디' from student;
