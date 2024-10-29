create table category(
c_code varchar2(4) not null,
c_name varchar2(50) not null,
constraint category_pk primary key(c_code)
);

create table goods(
c_code varchar2(4) not null,
g_code varchar2(5) not null,
g_name varchar2(50) not null,
g_price number,
constraint goods_pk primary key(g_code),
constraint goods foreign key(c_code) references category(c_code)
);

create sequence category_seq
start with 1001
increment by 1
maxvalue 9999;

alter table category modify c_code varchar2(50);

insert into category values('n'||category_seq.nextval,'점퍼');
insert into category values('n'||category_seq.nextval,'바지');
insert into category values('n'||category_seq.nextval,'모자');
insert into category values('n'||category_seq.nextval,'작업복');

delete from category where c_code='n1004';

commit;

alter table goods modify g_code number;
alter table goods modify c_code varchar2(50);

insert into goods values('n1002',(select nvl(max(g_code),10000)+1 from goods),'겨울패딩','100000');
