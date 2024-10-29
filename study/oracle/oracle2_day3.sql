select count(*) from student;
select sum(age)from student;
select avg(age)from student;
select min(age)from student;
select max(age)from student;

select * from student;
select count(age) from student;
select count(username) from student;
select count(gender) from student; -- 6:: count() 함수는 null 값을 제외 시킴

select sum(age) from student; -- 합계함수
select avg(age) from student; -- 평균함수
select avg(age) from student where age>0;
select round(avg(age)) from student where age>0; -- 정수
select round(avg(age),2) from student where age>0; -- 소숫점 자리 아래 표현

-- 예) :: dual은 가상 테이블
select round(14.1257) from dual; -- 14
select round(14.1257,2) from dual; -- 14.13
select round(14.1257,3) from dual; -- 14.126

select min(age) from student; -- 0
select min(age) from student where age>0;

select userid as "아이디", username as "이름" from student;

-- oder by ::정렬 숫자와 문자 모두 정렬 가능
select * from student;
select * from student order by age asc; -- 순차정렬
select * from student order by age desc; -- 역순정렬
select * from student order by username asc;
select * from student order by username desc;

-- 중복제거 : distinct()
select age from student;
select distinct(age) from student where age>0;
-- select username, distinct(age)from student where age>0; 오류
-- distinct() 단독함수이기 때문에 다른컬럼들과 같이 혼용해서 사용할수 없음

-- Q1
select username from student where grade='1';
select username,age from student where age>=15;
select userid from student where gender is null;
select userid from student where gender is not null;

--Q2
select username, age, grade from student where userid = 'st101' or userid = 'st102';
select * from student where gender ='F' and age>=15;
select userid,username from student where gender='M' and grade=2;
select avg(age) from student where gender='M' and age>0;
select round(avg(age)) from student where gender='M' and age>0;
select ceil(avg(age)) from student where gender='M' and age>0;
select floor(avg(age)) from student where gender='M' and age>0;
select * from student where gender ='M' order by age asc;

--Q3
update student set age=14 where userid='st105';
update student set age=15 where userid='st107';
update student set grade=1 where age=14 and grade is null;
update student set grade=2 where age=15 and grade is null;
update student set grade=3 where age=16 and grade is null;
update student set gender='M' where gender is null;