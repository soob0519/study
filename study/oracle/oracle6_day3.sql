create table score2(
unq number not null,
userid varchar2(10) not null,
loc varchar2(10),
kor number(3) default '0' not null, -- �⺻ �� ����
eng number(3) default '0' not null,
primary key(unq) -- �⺻ Ű ����(������ ����) �ߺ����� �Ұ�
);

alter table score2 modify userid varchar2(50);

desc score2;

alter table score2 modify loc varchar2(100);
desc score2;

alter table score2 add math number(3) default '0' not null;
alter table score2 drop column math;

commit; -- ����ȵ�
rollback; -- ����ȵ�

truncate table score2;



