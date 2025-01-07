<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 세션검사(로그인 상태인지 체크하는 코드)
// 세션타입이라서 문자타입으로 만들어야한다. (스트링 괄호붙이거나, 뒤에 공백 붙여서 문자타입으로 만들기.)
String SessionUserid = (String)session.getAttribute("SessionUserid");		// 로그인 하지 않으면 null 값이 된다.
// 또는 String SessionUserid = session.getAttribute("SessionUserid")+"";
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<ul class="menu_ul">
	<li class="menu_li"><a href="../../main.jsp">홈</a></li>
	<li class="menu_li"><a href="/myPage/store/storeInfo.jsp">가게정보관리</a></li>
	<li class="menu_li"><a href="/myPage/store/notice.jsp">공지관리</a></li>
	<li class="menu_li"><a href="/myPage/store/menu.jsp">메뉴관리</a></li>
	<li class="menu_li"><a href="/myPage/store/scheduleListST.jsp">예약현황</a></li>
	<li class="menu_li"><a href="/myPage/store/boardListST.jsp?code=1">리뷰</a></li>
	<li class="menu_li"><a href="/myPage/store/boardListST.jsp?code=2">Q&A</a></li>
	
	<%
	if(SessionUserid == null){
	%>
	<li class="menu_li"><a href="/login/loginMemberWrite1.jsp">회원가입</a></li>
	<li class="menu_li"><a href="/login/loginWrite.jsp">로그인</a></li>
	<%
	} else {
	%>
	<li class="menu_li"><a href="/include/logout.jsp">로그아웃</a></li>
	<%
	}
	%>
</ul>
</body>
</html>