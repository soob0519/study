<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 가게 공지사항 관련 SQL -->
<!-- 나중에 가게 고유번호랑 연결 -->
<%
String sql2 ="SELECT "
			+"		STID,GUBUN,TITLE,CONTENT,TO_CHAR(RDATE,'YYYY-MM-DD') RDATE "
			+" 	FROM STOREBOARD "
			+" 		ORDER BY RDATE DESC";
ResultSet rs2 = stmt.executeQuery(sql2);
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
		<!-- 가게 공지사항 게시판 테이블 -->
		<div>
			<table>
				<tr>
					<td colspan="4">
						공지사항
						<button type="button" onclick="location=''">
							더보기
						</button>
					</td>
				</tr>
				<tr>
					<td>구분</td>
					<td>제목</td>
					<td>내용</td>
					<td>게시일자</td>
					
				</tr>
				<%
				while(rs2.next()){
				String gubun = rs2.getString("gubun");
				String title = rs2.getString("title");
				String content2 = rs2.getString("content");
				String rdate = rs2.getString("rdate");				
				%>
					<tr>
					<td><%=gubun %></td>
					<td><%=title %></td>
					<td><%=content2 %></td>
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
