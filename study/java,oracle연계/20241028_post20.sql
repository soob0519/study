drop table post20;
create table post20 as select * from post1 where 1=2;

INSERT INTO post20(P1,P2,P3,P4,P5,P6,P7,P8) VALUES('463957','경기도','성남시 분당구','정자동','','','','정자I''PARK');

select * from post20 where p8 like '%PARK%';
select count(*) from post20;

truncate table post20;