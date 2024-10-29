-- clsinfo
create table clsinfo( 
clsnum number primary key,
clsnm varchar2(100),
clssdt date,
clsedt date
);

create sequence clsinfo_seq
start with 1001
increment by 1
maxvalue 9999;

insert into clsinfo(clsnum,clsnm,clssdt,clsedt) 
    values(clsinfo_seq.nextval,'java개발자반',to_date('2024-07-14','yyyy-mm-dd'),to_date('2025-01-10','yyyy-mm-dd'));

insert into clsinfo(clsnum,clsnm,clssdt,clsedt)
    values(clsinfo_seq.nextval,'퍼블리셔',to_date('2024-07-15','yyyy-mm-dd'),to_date('2024-12-14','yyyy-mm-dd'));

-- stdinfo

-- stdinfo 테이블

create table stdinfo( 
stdnum varchar2(11) primary key,
stdnm varchar2(50) not null,
stdsec varchar2(14) not null,
stdtel varchar2(50),
stdadr varchar2(50),
stdgen char(1),
stdscl varchar2(50),
stdeml varchar2(50),
stdste varchar2(50),
clsnum number,
constraint stdinfo_fk foreign key(clsnum) references clsinfo(clsnum)
);

-- stdinfo 데이터
insert into stdinfo values(
	(select nvl(max(stdnum),'20240714000')+1 from stdinfo),
	'홍길동',
	'850505-1111111',
	'010-1111-2222',
	'구리시 인창동',
	'M',
	'대학교 졸업',
	'abc123@naver.com',
	'제적',
	'1001');
insert into stdinfo values(
	(select nvl(max(stdnum),'20240714000')+1 from stdinfo),
	'점순이',
	'901225-2222222',
	'010-3333-4444',
	'서울시 강동구',
	'F',
	'대학교 졸업',
	'defg4567@google.com',
	'수강',
	'1002');
    
-- cnsinfo

-- cnsinfo 테이블

create table cnsinfo(
	cnsnum number primary key,
	stdnum varchar2(11),
	cnsrdt date,
	cnsper varchar2(20),
	cnscon varchar2(4000),
	cnskin varchar2(20),
	constraint cnsinfo_fk foreign key(stdnum) references stdinfo(stdnum)
);

create sequence cnsinfo_seq
start with 1
increment by 1
maxvalue 9999;

-- 데이터 입력
    
insert into cnsinfo values(
	cnsinfo_seq.nextval,
	'20240714001',
	to_date('2024-7-14','yyyy-mm-dd'),
	'임꺽정',
	'수업을 듣고 싶다',
	'접수상담'
	);
	
insert into cnsinfo values(
	cnsinfo_seq.nextval,
	'20240714002',
	to_date('2024-7-14','yyyy-mm-dd'),
	'임꺽정',
	'수업을 듣고 싶다',
	'접수상담'
	);


insert into cnsinfo values(
	cnsinfo_seq.nextval,
	'20240714002',
	to_date('2024-10-15','yyyy-mm-dd'),
	'임꺽정',
	'퍼블리셔 어렵다.',
	'정기상담'
	);

insert into cnsinfo values(
	cnsinfo_seq.nextval,
	'20240714001',
	to_date('2024-10-17','yyyy-mm-dd'),
	'임꺽정',
	'취업을 하고 싶다',
	'취업상담'
	);
    
drop table cnsinfo;
drop sequence cnsinfo_seq;