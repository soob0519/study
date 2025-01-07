<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 가게 리뷰 관련 SQL -->
<!-- 나중에 가게 고유번호랑 연결 + 리뷰 별점 평균이랑도 연결하기-->
<%
String sql4 ="SELECT	"
			+"			STID"
			+"			,ID	"
			+"			,CONTENT	"
			+"			,LEV	"
			+"		,TO_CHAR(RDATE,'YYYY-MM-DD') RDATE "
			+" FROM STOREREVIEW ORDER BY RDATE DESC";
ResultSet rs4 = stmt3.executeQuery(sql4);
%>



<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>식당정보</title>
  <link rel="stylesheet" href="../css/style.css" />
 </head>
 
 <style>
<!-- 화면 스타일 -->

div {
	border:1px solid #99ff00;
	width:1200px;
	margin-top:10px;
	vertical-align:center;
	background-color:#ffffff;
}

table {
	border:1px solid #003366;
	width:1200px;
	vertical-align:center;
	background-color:#ffffff;
}

span {
	background-color:#ffffff;
}

tr,td {
	border:1px solid #ff66ff;
}



 </style>
 
	<body>
  
		<header>
		 	<div>
				<button type="button" style="width:500px; height:40px;" onclick="location='/reservation/reservation.jsp'">
					<!-- 예약버튼 > 예약페이지로 -->
					<b>예약</b>
				</button>
			</div>
		</header>
		<nav>
			<div>
				탑메뉴영역		
			</div>
		</nav>
		  
		<aside>
		</aside>
		  
		<section>
		<div>
		<!-- 리뷰 (정보) -->
			<table>
				<tr>
					<td colspan="4">
						리뷰
						<button type="button" onclick="location=''">
							더보기
						</button>	
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>별점</td>
					<td>리뷰내용</td>
					<td>작성날짜</td>
				</tr>
				<%
				while(rs4.next()){
				String userid = rs4.getString("id");
				String lev = rs4.getString("lev");
				String content4 = rs4.getString("content");
				String rdate = rs4.getString("rdate");
				
				%>
					<tr>
					<td><%=userid %></td>
					<td><%=lev %></td>
					<td><%=content4 %></td>
					<td><%=rdate %></td>
					</tr>	
				
				<%
				}
				%>
			</table>
		</div>
		</section>
  
		<footer>
  
</footer> 
  
	</body>
</html>
