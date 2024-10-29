select B.B_NO "책번호",B.B_NAME "책이름",B.B_PUBLISHER "출판사"
from BOOK_TBL B,
(select B_NO B_NO,count(B_NO) cnt1 from rent_tbl group by b_no) R
where  B.B_NO = R.B_NO and  having count(b.B_NO)<1;

select B_NO B_NO,count(B_NO) cnt1 from rent_tbl group by b_no;

select B.B_NO "책번호",B.B_NAME "책이름",B.B_PUBLISHER "출판사"
from BOOK_TBL B, RENT_TBL R
where B.B_NO = R.B_NO;


