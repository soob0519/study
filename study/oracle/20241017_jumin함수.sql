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

select fn_jumin_year('950519-2222222') "³ªÀÌ" from dual;

commit;