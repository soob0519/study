create table nboard2(
unq number not null,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(20),
content varchar2(4000),
rdate timestamp,
constraint nboard2_pk primary key(unq)
);

create sequence nboard2_seq
start with 1
increment by 1
maxvalue 99999;

drop table nboard2;

drop SEQUENCE nboard2_seq;