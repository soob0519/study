-- ������� SQL �ۼ�
-- 1. (���) �⺻���� ���
-- * ��ȣ, �̸�, �������, ����ó, ����
-- * �̸��� (�达 ~)
select stdnum,stdnm,substr(stdsec,1,6) birth,stdtel,stdste from stdinfo order by stdnm;

-- 2. (���) �˻����� ���
-- (1) ��� ������ �⺻(1��)�� ���� ���� �˻��� �Ѵ�. (ex. ���л��� ���)
select stdnum,stdnm,substr(stdsec,1,6) birth,stdtel,stdste from stdinfo where stdgen='F' order by stdnm;
-- (2) ���� ������ ���� 30�� �̻� ����Ѵ�. -> �𸣰ڴ�.
create or replace function fn_jumin_year(v_jumin in varchar2)
    return number
is
    j1 varchar2(2);
    j2 varchar2(2);
    year varchar2(4);
    age number;
begin
    select substr(v_jumin,1,2) into j1 from dual;
    select decode(substr(v_jumin,8,1),'1','a','2','a','3','b','4','b')
        into j2 from dual;

    if j2='a' then
        year := '19'||j1;
    elsif j2 ='b' then
        year := '20'||j1;
    end if;

    age := to_char(sysdate)-year;
    return age;

end;
/

-- 3. (��) Ư���л��� ������ ���
-- *  �̸�, �ֹε�Ϲ�ȣ, ����ó, �ּ�, ����, �з�, �̸���, ����*
select stdnm,rpad(substr(stdsec,1,7),14,'*') "�ֹε�Ϲ�ȣ",stdtel,stdadr,stdgen,stdscl,stdeml,stdste
from stdinfo
where stdnum = 20240714002;

-- 4. (����) Ư���л��� ������ �����Ѵ�.
-- * ȫ�浿�� ����ó�� �̸����� �����Ѵ�. (���泻���� ���Ƿ� ����)
update stdinfo set stdtel='010-7777-8888' where stdnum = 20240714001;
update stdinfo set stdeml='hong1234@google.com' where stdnum = 20240714001;

-- 5. (����) Ư���л��� ���¸� �����Ѵ�. (���� -> ����)
update stdinfo set stdste='����' where stdnum = 20240714001;

-- 6. (����) Ư���л��� ���� ��ü�� �����Ѵ�.
delete from stdinfo  where stdnum = 20240714001;

-- {�������}
-- 1. (�л��������) �⺻��� (��ȣ, �̸�, ����, ���������, ���Ƚ��)
select rownum "��ȣ",
s.stdnm "�̸�",
s.stdste "����",
(select max(cnsrdt)from cnsinfo where stdnum=s.stdnum) "���������",
(select count(*) from cnsinfo where stdnum = s.stdnum) "���ȸ��"
from stdinfo s;

-- 2. (�����) - �̸� �ֹι�ȣ(801225_********), ����ó,����,�����Ⱓ,���ȸ��

-- 2. (���) 1~8������ ����ϴ� ����
-- (ex.ȫ�浿 2ȸ ���)
-- 3. (����) ��㳻��, ��ġ����, ��¥ �� ����ó�� �Ѵ�.
