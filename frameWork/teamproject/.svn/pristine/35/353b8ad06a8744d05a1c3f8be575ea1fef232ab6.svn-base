<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 세션변수 받는코드
String SESSION_ID = (String)session.getAttribute("sessionId");		// 로그인 하지 않으면 null 값이 된다.
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<ul class="menu_ul">
	<li class="menu_li"><a href="#" target="_blank">홈</a></li>
	
	<%
	if(SESSION_ID == null){
	%>
	<li class="menu_li"><a href="#" target="_blank">회원가입</a></li>
	<li class="menu_li"><a href="#" target="_blank">로그인</a></li>
	<%
	} else {
	%>
	<li class="menu_li"><a href="#" target="_blank">정보수정</a></li>
	<li class="menu_li"><a href="#" target="_blank">로그아웃</a></li>
	<%
	}
	%>
	<li class="menu_li"><a href="boardList.jsp?code=1" target="_blank">리뷰</a></li>
	<li class="menu_li"><a href="boardList.jsp?code=2" target="_blank">Q&A</a></li>
</ul>

</body>
</html>