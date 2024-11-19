<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 현재 웹주소를 가져오는 메소드 (도메인 제외)
String uri  = request.getRequestURI();
// out.print(uri);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<div style="text-align:center;margin-top:20px;">
	<%
	if(uri.indexOf("member") > -1) {
	%>
	<a href="/admin/memberList.jsp">회원목록</a><br>
	<a href="/admin/memberWrite.jsp">회원등록</a>
	<%
	} else if(uri.indexOf("board") > -1) {
	%>
	<a href="admin/boardList.jsp">공지사항 목록</a><br>
	<a href="admin/boardWrite.jsp">공지사항 등록</a>
	<%
	}
	%>
	</div>
</body>
</html>