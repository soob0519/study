select (sal+comm) as 급여 from emp;
select avg(comm) from emp;
select (sal+nvl(comm,0)) 급여 from emp;
select avg(nvl(comm,0)) from emp;
select (sal+nvl(comm,10)) 급여 from emp;
-- 예) 사원번호, 사원명, 매니저번호 출력 (단, nulll 인 경우 1004로 출력)
select empno,ename,nvl(mgr,1004) from emp; --(o)
select empno,ename,nvl(mgr,'1004') from emp; --(o)
--세팅값은 컬럼타입과 일치해야함
select empno,ename,nvl(mgr,'없음') from emp; --(x)
-- 예) 사원번호, 사원명, 업무 출력 (단, nulll 인 경우 '대기'로 출력)
select empno,ename,nvl(job,'대기') 업무 from emp; --(o)
select empno,ename,nvl(job,1004) 업무 from emp; --(o) 저절로 문자타입으로 변환되서 그런듯
-- 예) 사원번호, 사원명, 업무 출력 (단, nulll 인 경우 '대기'로 출력, 아닌경우 값뒤에 '업무')
-- nvl2 null인 경우와 아닌 경우 두가지를 둘수있음
-- nvl2(데이터값,null값이 아닌 경우,null값인 경우)
select empno,ename,nvl2(job,job||'업무','대기') 업무 from emp;
-- 예 급여(기본급+수당) -> 수당이 있는 직원에게 100만원 보너스 추가 지급
select empno,ename,(sal+nvl2(comm,comm+100,0)) 실급여 from emp;
