declare
	v_cnt number; -- 타입을 직접 적을수도 있음
    p_empno varchar2(50) := &삭제_사원번호;
begin
	select count(*) into v_cnt from emp where empno=p_empno; -- 1,0
	if v_cnt=0 then
		dbms_output.put_line('존재하지 않는 사원번호입니다.');
	else
		delete from emp where empno=p_empno;
        dbms_output.put_line(p_empno||'를 삭제했습니다.');
	end if;
end;
/

--------------반복문----------------

declare

begin
	for i in 1..10 -- 1부터 10까지
	loop
		dbms_output.put_line(i);
	end loop;
end;
/

-- 풀어보기1
declare
	v_cnt number;
	v_deptno dept.deptno%type := &부서번호;
	v_dname dept.dname%type := '&부서이름';
	v_loc dept.loc%type := '&지역정보';
begin
	select count(*) v_cnt from dept
	where deptno=v_deptno or dname=v_dname;
	
	if v_cnt=0 then
		insert into dept values(v_deptno,v_dname,v_loc);
	else
		dbms_output.put_line('이미 존재하는 정보입니다.');
	end if;
end;
/

