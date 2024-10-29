create table bankClientInfo(    -- 고객 테이블
a1 varchar2(100) not null,  -- 계좌번호
a2 varchar2(50) not null,   -- 고객명
a3 varchar2(14) not null,   -- 주민번호
a4 varchar2(20),    -- 연락처
constraint bci_pk primary key(a1)
);

create table bankMoneyInOut(    -- 입출금 테이블
seq number not null,    -- 고유번호
a1 varchar2(100) not null,  -- 계좌번호
b1 number not null, -- 입금액
b2 number not null, -- 출금액
b3 timestamp,   -- 입금일시
b4 timestamp,   -- 출금일시
b5 number not null, -- 잔액
constraint bmi_pk primary key(seq),
constraint bmi_fk foreign key(a1) references bankClientInfo(a1)
);

create SEQUENCE bmi_seq
start with 1
increment by 1
maxvalue 999999;