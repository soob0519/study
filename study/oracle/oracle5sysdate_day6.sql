-- to_char()/to_date()
-- (1) to_char() : 날짜타입 데이터를 문자타입 데이터로 변환
-- (2) to_date() : 문자타입 데이터를 날짜타입 데이터로 변환

-- 실습
select sysdate from dual; -- sysdate 오늘날짜(시간)를 출력해주는 내장 컬럼
select to_char(sysdate,'yyyy-mm-dd am hh:mi:ss day') from dual;
select to_char(sysdate,'yyyy') from dual;
select to_char(sysdate,'mm-dd') from dual;
select to_char(sysdate,'am') from dual; -- 결과로는 문자타입

select to_char('2024','yyyy') from dual; -- '2024' 문자타입이기때문에 오류가 난다

select to_char(sysdate,'day d dy') from dual;