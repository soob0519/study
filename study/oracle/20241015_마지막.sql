create table dept10(
deptno number not null primary key,
dname varchar2(100) not null unique,
loc varchar2(100)
);

create table emp10(
EMPNO number not null primary key,
ENAME varchar2(50) not null,
JOB varchar2(50),
MGR number,
HIREDATE date,
SAL number,
DEPTNO number not null,
constraint emp10_fk1 foreign key(deptno) REFERENCES dept10(deptno)
);