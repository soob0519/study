create table bankClientInfo(    -- �� ���̺�
a1 varchar2(100) not null,  -- ���¹�ȣ
a2 varchar2(50) not null,   -- ����
a3 varchar2(14) not null,   -- �ֹι�ȣ
a4 varchar2(20),    -- ����ó
constraint bci_pk primary key(a1)
);

create table bankMoneyInOut(    -- ����� ���̺�
seq number not null,    -- ������ȣ
a1 varchar2(100) not null,  -- ���¹�ȣ
b1 number not null, -- �Աݾ�
b2 number not null, -- ��ݾ�
b3 timestamp,   -- �Ա��Ͻ�
b4 timestamp,   -- ����Ͻ�
b5 number not null, -- �ܾ�
constraint bmi_pk primary key(seq),
constraint bmi_fk foreign key(a1) references bankClientInfo(a1)
);

create SEQUENCE bmi_seq
start with 1
increment by 1
maxvalue 999999;