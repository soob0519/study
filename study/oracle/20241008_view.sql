-- 테이블 카피
create table c_emp1 as select * from emp;
create table c_emp2 as select a2.* from
(select rownum rn,a1.* from (select empno,ename,deptno,mgr,sal,hiredate,comm from emp order by ename asc) a1) a2;
-- 데이터삭제 가능
-- 원본파일을 삭제해도 테이블 카피라서 그대로 남아있음
delete from c_emp2 where empno='8001';

-- view table
-- 1. 사원테이블과 동일한 구조(값)의 가상 테이블을 만든다.
create view v_emp1 as select * from emp;
-- 2. 사원테이블에서 (사원번호 사원이름 급여)를 가지고 있는 가상테이블을 만든다.
create view v_emp2 as select empno,ename,sal from emp;
-- 3. 사원테이블의 특정 SQL결과 값을 가지게 되는 가상테이블을 만든다.
create view v_emp3 as select empno,ename,(select dname from dept where deptno=emp.deptno) as dname from emp;
select * from v_emp3;
-- 예시 3번
create view v_emp4 as
select a2.* from
(select rownum rn,a1.* from (select empno,ename,deptno,mgr,sal,hiredate,comm from emp order by ename asc) a1) a2;

select * from v_emp4;
select * from v_emp4 where rn>=6 and rn<=10;

-- 삭제
drop view v_emp1;

-- 데이터 수정 :: 데이터가 연결되어있기 때문에 같이 변경됨
update emp set ename='홍당무7' where empno='9001';
select * from v_emp4;
-- 뷰테이블은 수정할 수 없음
update v_emp4 set ename='홍당무1' where empno='9001'; --(x)
-- 뷰테이블 삭제할 수 없음
delete from v_emp4 where empno='8001'; --(x)

