<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String SESSION_ID = (String) session.getAttribute("AdminSessionId");
if(SESSION_ID == null){
	response.sendRedirect("/admin");
	return;
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li class="menu_li"><a href="/admin">홈</a></li>
		<li class="menu_li"><a href="/admin/memberList.jsp">회원관리</a></li>
		<li class="menu_li"><a href="/admin/BoardList.jsp">공지사항관리</a></li>
		<li class="menu_li"><a href="/admin/reBoardList.jsp">댓글게시판관리</a></li>
	</ul> 
</body>
</html>