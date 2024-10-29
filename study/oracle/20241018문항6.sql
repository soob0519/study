--(1)
select * from BOOK_TBL;
--(2)
select B_NAME "책이름",B_PRICE "책가격",B_PUBLISHER "출판사" from BOOK_TBL where B_INFO like '%네트워크%';
--(3)
select B_NO "책번호",B_NAME "책이름",B_PRICE "가격" from BOOK_TBL where B_PRICE=(select max(B_PRICE) from BOOK_TBL);
--(4)
select R.* from (select rownum rn, R_NO,B_NO,R_PRICE,R_DATE,R_STATUS from RENT_TBL) R where rn<=3;
--(5)
select R_NO "대여번호",R_PRICE "금액", R_DATE "날짜",decode(R_STATUS,0,'반납완료',1,'대여중') "반납여부" from RENT_TBL;
--(6)
select R.R_NO "대여번호",B.B_NO "책번호",B.B_NAME "책이름",B.B_PRICE "가격",to_char(R.R_DATE,'yyyy-mm-dd') "대여일" from BOOK_TBL B, RENT_TBL R where B.B_NO = R.B_NO;
--(7)

--(8)
update BOOK_TBL set B_NO = '110' where B_NO = '101';
-- 무결성 제약조건에 위배되었기때문에 변경이 불가능 하다. 변경하려면 자식레코드를 먼저 변경 또는 삭제하고 변경해야함.
--(9)
select B.B_NAME "책이름",B.B_PUBLISHER "출판사", to_char(R.R_DATE,'yyyy-mm-dd') "대여일" from BOOK_TBL B, RENT_TBL R where B.B_NO = R.B_NO and B.B_PUBLISHER like '시공사' AND R.R_DATE = '2023/05/22';
--(10)
desc BOOK_TBL;
desc RENT_TBL;
commit;