create table member101(
no number primary key,
id varchar2(50) unique,
pw varchar2(100) not null,
gn varchar2(1) check(gn in('M','F')),
yr number(1) check(yr in(1,2,3)),
bh date default '1900-01-01' not null
);

create table member102(
sid varchar2(50),
eng number,
kor number,
constraint member102_fk foreign key(sid) references member101(id)
);

create table member103(
sid varchar2(50),
eng number,
kor number,
constraint member103_fk foreign key(sid) references member101(id) on delete cascade
);