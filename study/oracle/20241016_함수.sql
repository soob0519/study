create function fn_sum1(v_num1 in number, v_num2 in number)
	return number
is
	v_sum number;
begin
	v_sum := v_num1 + v_num2;
	return v_sum;
end;
/

select fn_sum1(200,600) from dual;

--
create function fn_sum_sal(v_deptno in number)
	return number
is
	v_sum1 number;
begin
	select sum(sal) into v_sum1 from emp where deptno=v_deptno;
	return v_sum1;
end;
/

select fn_sum_sal(10) from dual;

---------------------------------------------------------------------
create or replace function fn_sum_sal(v_deptno in number)
	return varchar2
is
	v_sum varchar2(50);
    v_cnt number;
begin
    select count(*) into v_cnt from emp where deptno=v_deptno;
    if v_cnt =0 then
        v_sum := '¾øÀ½';
    else
        select to_char(sum(sal),'FM999,999,999') into v_sum
        from emp where deptno=v_deptno;
	end if;
    
    return v_sum;
end;
/