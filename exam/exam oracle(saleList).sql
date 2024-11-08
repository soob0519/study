-- salelist
SELECT to_char(SALE_DATE,'yyyy-mm-dd')SALE_DATE , SUM(SALE_PRICE) SALE_PRICE FROM SALE_TBL GROUP BY SALE_DATE order by SALE_DATE;

-- 최고 구매값
select max(sum(sale))max1 
from (SELECT member_id,sum(SALE_PRICE) sale FROM SALE_TBL GROUP BY member_id) 
GROUP BY sale;

-- 최고 구매자
SELECT member_id 
from 
    (SELECT member_id,sum(SALE_PRICE) sale FROM SALE_TBL GROUP BY member_id) s1 
where
    s1.sale = (select max(sum(sale2))max1 from (SELECT member_id,sum(SALE_PRICE) sale2 FROM SALE_TBL GROUP BY member_id) GROUP BY sale2) ;