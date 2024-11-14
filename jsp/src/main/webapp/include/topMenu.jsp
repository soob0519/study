<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String SESSION_ID = (String) session.getAttribute("sessionId");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li class="menu_li"><a href="../main/main.jsp">홈</a></li>
		<% 
		if(SESSION_ID == null) {
		%>
		<li class="menu_li"><a href="../member/memberAgree.jsp">회원가입</a></li>
		<li class="menu_li"><a href="../member/loginWrite.jsp">로그인</a></li>
		<%
		} else {
		%>
			<li class="menu_li"><a href="../member/memberModify.jsp">정보수정</a></li>
			<li class="menu_li"><a href="../member/logout.jsp">로그아웃</a></li>
		<%
		}
		%>
		<li class="menu_li"><a href="../board/boardList.jsp">게시판</a></li>
		<li class="menu_li"><a href="../emp/history.jsp">이력서</a></li>
		<li class="menu_li"><a href="../member/postList.jsp">주소검색</a></li>
	</ul> 
</body>
</html>