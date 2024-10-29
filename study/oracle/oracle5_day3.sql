select sysdate from dual;
select add_months(sysdate,2) from dual;
select months_between('2024-10-30','2024-09-30') from dual;

CREATE TABLE  DEPT -- 부서테이블
(
  DEPTNO  NUMBER(2),     -- 부서번호
  DNAME   VARCHAR2(14),  -- 부서이름
  LOC     VARCHAR2(13)    -- 부서위치
);

insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');
  

CREATE TABLE  EMP -- 사원테이블
(
  EMPNO     NUMBER(4),      -- 사원번호
  ENAME     VARCHAR2(10),   -- 사원이름 
  JOB       VARCHAR2(9),     -- 업무 
  MGR       NUMBER(4),      -- 매니저
  HIREDATE  DATE,           -- 입사일
  SAL       NUMBER(7,2),     -- 급여
  COMM      NUMBER(7,2),    -- 추가급여
  DEPTNO    NUMBER(2)      -- 부서번호
);

insert into emp values( 7839, 'KING', 'PRESIDENT', null, to_date('1996-11-17','yyyy-mm-dd'), 5000, null, 10);
insert into emp values( 7698, 'BLAKE', 'MANAGER', 7839, to_date('1991-1-05','yyyy-mm-dd'), 2850, null, 30);
insert into emp values( 7782, 'CLARK', 'MANAGER', 7839, to_date('1999-9-06','yyyy-mm-dd'), 2450, null, 10);
insert into emp values( 7566, 'JONES', 'MANAGER', 7839, to_date('2001-02-04','yyyy-mm-dd'), 2975, null, 20);
insert into emp values( 7788, 'SCOTT', 'ANALYST', 7566, to_date('2003-06-17','yyyy-mm-dd'), 3000, null, 20);
insert into emp values( 7902, 'FORD', 'ANALYST', 7566, to_date('1981-03-12','yyyy-mm-dd'), 3000, null, 20);
insert into emp values( 7369, 'SMITH', 'CLERK', 7902, to_date('2007-12-1','yyyy-mm-dd'), 800, null, 20);
insert into emp values( 7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-2-1981','dd-mm-yyyy'), 1600, 300, 30);
insert into emp values( 7521, 'WARD', 'SALESMAN', 7698, to_date('22-2-1981','dd-mm-yyyy'), 1250, 500, 30);
insert into emp values( 7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-9-1981','dd-mm-yyyy'), 1250, 1400, 30);
insert into emp values( 7844, 'TURNER', 'SALESMAN', 7698, to_date('8-9-1981','mm-dd-yyyy'), 1500, 0, 30);
insert into emp values( 7876, 'ADAMS', 'CLERK', 7788, to_date('13-7-87', 'dd-mm-yy') - 51, 1100, null, 20);
insert into emp values( 7900, 'JAMES', 'CLERK', 7698, to_date('3-12-1981','mm-dd-yyyy'), 950, null, 30);
insert into emp values( 7934, 'MILLER', 'CLERK', 7782, to_date('2003-1-23','yyyy-mm-dd'), 1300, null, 10);
  
CREATE TABLE salgrade (  -- 급여등급테이블
grade number,    -- 등급
losal number,     -- 최저급여
hisal number );   -- 최고급여

insert into salgrade values (1, 700, 1200);
insert into salgrade values (2, 1201, 1400);
insert into salgrade values (3, 1401, 2000);
insert into salgrade values (4, 2001, 3000);
insert into salgrade values (5, 3001, 9999);

commit;

