<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
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
	if(uri.indexOf("board") > -1) {
	%>
	<a href="http://localhost:9090/board/boardList.jsp">공지사항</a><br>
	<a href="http://localhost:9090/board/board2List.jsp?code=1">분실물</a><br>
	<a href="/board/board2List.jsp?code=2">습득물</a><br>
	<a href="../board/board2List.jsp?code=3">보관함</a>
	<%
	}
	%>
	</div>
</body>
</html>