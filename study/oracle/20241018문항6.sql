--(1)
select * from BOOK_TBL;
--(2)
select B_NAME "å�̸�",B_PRICE "å����",B_PUBLISHER "���ǻ�" from BOOK_TBL where B_INFO like '%��Ʈ��ũ%';
--(3)
select B_NO "å��ȣ",B_NAME "å�̸�",B_PRICE "����" from BOOK_TBL where B_PRICE=(select max(B_PRICE) from BOOK_TBL);
--(4)
select R.* from (select rownum rn, R_NO,B_NO,R_PRICE,R_DATE,R_STATUS from RENT_TBL) R where rn<=3;
--(5)
select R_NO "�뿩��ȣ",R_PRICE "�ݾ�", R_DATE "��¥",decode(R_STATUS,0,'�ݳ��Ϸ�',1,'�뿩��') "�ݳ�����" from RENT_TBL;
--(6)
select R.R_NO "�뿩��ȣ",B.B_NO "å��ȣ",B.B_NAME "å�̸�",B.B_PRICE "����",to_char(R.R_DATE,'yyyy-mm-dd') "�뿩��" from BOOK_TBL B, RENT_TBL R where B.B_NO = R.B_NO;
--(7)

--(8)
update BOOK_TBL set B_NO = '110' where B_NO = '101';
-- ���Ἲ �������ǿ� ����Ǿ��⶧���� ������ �Ұ��� �ϴ�. �����Ϸ��� �ڽķ��ڵ带 ���� ���� �Ǵ� �����ϰ� �����ؾ���.
--(9)
select B.B_NAME "å�̸�",B.B_PUBLISHER "���ǻ�", to_char(R.R_DATE,'yyyy-mm-dd') "�뿩��" from BOOK_TBL B, RENT_TBL R where B.B_NO = R.B_NO and B.B_PUBLISHER like '�ð���' AND R.R_DATE = '2023/05/22';
--(10)
desc BOOK_TBL;
desc RENT_TBL;
commit;