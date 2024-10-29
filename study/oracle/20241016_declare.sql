set serveroutput on;

declare
    v_deptno dept.deptno%type;
    v_dname dept.dname%type;
begin
    select deptno, dname into v_deptno, v_dname 
    from dept
        where loc = 'BOSTON';
    dbms_output.put_line(v_deptno||','||v_dname);
end;
/

declare
	v_deptno dept.deptno%type := 90;
	v_name dept.dname%type := '총무부';
	v_loc dept.loc%type := '부산';
begin
	insert into dept values(v_deptno,v_name,v_loc);
	dbms_output.put_line('저장완료!');
end;
/

-- 풀어보기1
declare
    v_avg_sal emp.sal%type;
begin
    select round(avg(sal)) into v_avg_sal from emp
        where deptno=10;
    dbms_output.put_line('평균급여 : '||v_avg_sal);
end;
/

declare
	v_comm emp.comm%type := 400;
	v_deptno emp.deptno%type := 10;
begin
	update emp set comm = nvl(comm,0)+v_comm where deptno=v_deptno;
	dbms_output.put_line('업데이트 완료');
end;
/

declare
	v_deptno emp.deptno%type := &부서번호;
	v_comm emp.comm%type := &커미션;
begin
	update emp set comm = nvl(comm,0)+v_comm where deptno=v_deptno;
	dbms_output.put_line('업데이트 완료');
end;
/

declare
	p_empno emp.empno%type := &사원번호;
	v_empno emp.empno%type;
	v_ename emp.ename%type;
	v_sal emp.sal%type;
begin
	select empno,ename,sal into v_empno,v_ename,v_sal
	from emp
		where empno=p_empno;
	dbms_output.put_line(v_empno||', '||v_ename||', '||v_sal);
end;
/
