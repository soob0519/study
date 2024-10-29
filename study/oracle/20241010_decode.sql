-- decode() 함수
-- 형식 :: decode(데이터값(컬럼),비교1,설정1,비교2,설정2,비교3,설정3.....else)
-- 예) 부서이름을 한글표기
select deptno,
dname,
decode(deptno,10,'회계',20,'조사',30,'영업',40,'기획','없음') dname2
from dept;
----------------------------------------------------
select decode('z','a','a입니다','b','b입니다','k','k입니다','값을 알수없음') 비교 from dual;
select decode('k','a','a입니다','b','b입니다','k','k입니다') 비교 from dual;
select decode('t','a','a입니다','b','b입니다','k','k입니다') 비교 from dual;
-----------------------------------------------------
select deptno,
dname,
decode(dname,'ACCOUNTING','회계',
'RESEARCH','조사',
'SALES','영업',
'OPERATIONS','기획',
'없음') dname2 from dept;

select userid,gender from member; --('M','F')
select userid,decode(gender,'M','남','F','여') from member; --('M','F')
-- ::java
-- String gg = "";
-- if(gender.equals("M")){
-- gg="남";
-- } else if(gender.equals("F")){
-- gg="여";
-- }

select empno,ename,deptno,sal 기본급여,decode(deptno,20,sal*1.1,sal) 인상급여 from emp;