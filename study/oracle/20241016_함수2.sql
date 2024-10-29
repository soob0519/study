-- 풀어보기1
select fn_emp_sal(7788) from dual;

--
create or replace function fn_emp_sal
	(v_empno in emp.empno%type)
	return number
is
	v_sal number;
begin
	select sal+nvl(comm,0) into v_sal from emp where empno=v_empno;
	return v_sal;
end;
/

select dname
from emp e, dept d
where e.deptno=d.deptno
and e.empno=7788;

--------------------------------------------------------------
create or replace function fn_dept_name
	(v_empno in number)
return varchar2
is
	v_dname varchar2(50);
begin
	select dname into v_dname
	from emp e, dept d
	where e.deptno=d.deptno and e.empno=v_empno;
	return v_dname;
end;
/
select fn_dept_name(7698) from dual;
---------------------------------------------------------------
select
	ename,to_char(sysdate,'yyyy') - to_char(hiredate,'yyyy') "연차"
from emp;
------------
select
	ename||':'||(to_char(sysdate,'yyyy') - to_char(hiredate,'yyyy'))
from emp where empno=7788;
-------------------
create or replace function fn_emp_year(v_emp in number) return varchar2
is
	str varchar(100);
begin
	select
		ename||':'||(to_char(sysdate,'yyyy') - to_char(hiredate,'yyyy'))
		into str
	from emp
	where empno=v_empno;
	return str;
end;
/
select fn_emp_year(7788) from dual;
-----------------------------------------------------------------------