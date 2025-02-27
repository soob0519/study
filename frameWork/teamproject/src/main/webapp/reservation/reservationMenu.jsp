<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<%
// 세션검사(로그인 상태인지 체크하는 코드)
// 세션타입이라서 문자타입으로 만들어야한다. (스트링 괄호붙이거나, 뒤에 공백 붙여서 문자타입으로 만들기.)
String SessionUserid = (String)session.getAttribute("SessionUserid");		// 로그인 하지 않으면 null 값이 된다.
// 또는 String SessionUserid = session.getAttribute("SESSION_ID")+"";
%>

<!-- 가게 메뉴 관련 SQL -->
<!-- 나중에 가게 고유번호랑 연결 -->
<%
String unq = request.getParameter("stid");

String sql3 ="SELECT "
			+"			STID	"
			+"			,MENUNAME	"
			+"			,MECONTENT	"
			+"			,PRICE		"
			+" 		FROM STOREMENU  WHERE STID='"+unq+"' ";
ResultSet rs3 = stmt2.executeQuery(sql3);
%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>식당정보</title>
   <link rel="stylesheet" href="../css/style.css" />
 </head>
  <style>
.table1 {
	width: 1035px!important;
}
.table2 {
    width: 1035px!important;
}
 </style>
 
	<body>
		<header>
		 	<div>
				<button type="button" style="width:500px; height:40px;" onclick="location='/reservation/reservation.jsp?stid=<%=unq %>'">
					<!-- 예약버튼 > 예약페이지로 -->
					<b>예약</b>
				</button>
			</div>
		</header>
		<nav>
			<div>
			<table>
				<tr>
					<th><a href="/main.jsp">홈</a></th>
					<%
					if(SessionUserid == null){
					%>
					<th><a href="/login/loginWrite.jsp">로그인</a></th>
					<th><a href="/login/loginSelect.jsp">회원가입</a></th>
					<%
					} else {
					%>
					<th><a href="/myPage/myPageSession.jsp">마이페이지</a></th>
					<th><a href="/include/logout.jsp">로그아웃</a></th>
					<%
					}
					%>
				</tr>
			</table>
			</div>
		</nav>
		  
		<aside>
		</aside>
		  
		<section>
		
		<!-- 메뉴판 (정보) 테이블 -->
		<div>
			<table class="table1">
				<tr>
					<td colspan="3">
						메뉴
					</td>
				</tr>
				<tr>
					<td>메뉴명</td>
					<td>설명</td>
					<td>가격</td>
				</tr>
				<%
				while(rs3.next()){
				String menuname = rs3.getString("menuname");
				String mecontent = rs3.getString("mecontent");
				String price = rs3.getString("price");
				
				%>
					<tr>
					<td><%=menuname %></td>
					<td><%=mecontent %></td>
					<td><%=price %></td>
					</tr>	
				
				<%
				}
				%>
			</table>
		</div>
		
		</section>
  
		<footer>
		<!-- footer Start -->
		<%@ include file = "../../include/footer.jsp" %>
		<!-- footer End -->
		</footer>
  
	</body>
</html>
