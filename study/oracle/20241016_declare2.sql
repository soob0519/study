declare
	v_cnt number; -- Ÿ���� ���� �������� ����
    p_empno varchar2(50) := &����_�����ȣ;
begin
	select count(*) into v_cnt from emp where empno=p_empno; -- 1,0
	if v_cnt=0 then
		dbms_output.put_line('�������� �ʴ� �����ȣ�Դϴ�.');
	else
		delete from emp where empno=p_empno;
        dbms_output.put_line(p_empno||'�� �����߽��ϴ�.');
	end if;
end;
/

--------------�ݺ���----------------

declare

begin
	for i in 1..10 -- 1���� 10����
	loop
		dbms_output.put_line(i);
	end loop;
end;
/

-- Ǯ���1
declare
	v_cnt number;
	v_deptno dept.deptno%type := &�μ���ȣ;
	v_dname dept.dname%type := '&�μ��̸�';
	v_loc dept.loc%type := '&��������';
begin
	select count(*) v_cnt from dept
	where deptno=v_deptno or dname=v_dname;
	
	if v_cnt=0 then
		insert into dept values(v_deptno,v_dname,v_loc);
	else
		dbms_output.put_line('�̹� �����ϴ� �����Դϴ�.');
	end if;
end;
/

