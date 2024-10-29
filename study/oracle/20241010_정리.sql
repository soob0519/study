-- count(comm) :: null 값을 제외하고 출력 갯수를 셈
-- sum() :: 합계
-- avg() :: 평균
-- round(숫자) :: 반올림 함수
-- ceil(숫자) :: 올림 함수
-- floor(숫자) :: 내림 함수
-- length(문자) :: 문자열길이
-- substr(문자,시작번호,끝번호) :: 범위설정
-- upper(알파벳) :: 대문자
-- lower(알파벳) :: 소문자
-- || :: 연결연산자
-- nvl(설정) :: null값 대비 함수
-- nvl2(설정) :: null값 대비 함수
-- decode(설정) :: 조건함수
-- sign(수치) :: 양수,음수,제로
-- in() :: 조건문의 "or"와 같은 의미의 함수
select * from emp where deptno in(10,20);
select * from emp where deptno= 10 or deptno=20;
-- between ~ and :: 조건문의 "and" 와 같은 의미의 키워드
select * from emp where sal between 1000 and 2000;
-------------------------------------------------------
-- like 검색 :: %(임의의 문자열의 0개 이상)%,_(임의의 문자 1개)
select * from emp where ename like '%SC%'; -- "SC"문자가 포함된 데이터
select * from emp where ename like 'SC___'; -- "SC"문자로 시작되는 총 5개의 데이터

-- rownum :: 행번호
select rownum,emp.* from emp;

-- sysdate :: 현재날짜와 시간을 가져오는 시스템 내장 컬럼(속성)
select sysdate from dual; -- 기본출력(날짜)
-- to_char
select to_char(sysdate,'yyyy-mm-dd hh24-mi-ss') from dual;
-- to_date
select to_date('20241225','yyyymmdd') from dual; -- 기본출력(날짜)

-- 테이블 복사
create table emp11 as select * from emp; -- 테이블 전체 복사(데이터도 같이)
create table emp22 as select * from emp where 1=2; -- 테이블 구조만 복사

-- 뷰테이블 :: 물리적인 용량 제로
create view v_emp13 as select * from emp;

-- sequence :: 시퀀스 객체 - 자동으로 숫자증가 되는 객체
create sequence emp_seq7
start with 1
increment by 1
maxvalue 99999;
select emp_seq7.nextval from dual;
