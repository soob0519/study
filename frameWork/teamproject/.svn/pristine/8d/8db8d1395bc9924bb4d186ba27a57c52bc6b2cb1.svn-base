<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String uri = request.getRequestURI();
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
	  if( uri.indexOf("board") > -1 ) {
	  %>
	  	<a href="http://localhost:8080/board/boardList.jsp">공지사항</a>
	  	<a href="http://localhost:8080/board/board2List.jsp?code=1">자주묻는질문</a> 
	  	<a href="/board/board2List.jsp?code=2">Q&A</a> 
	  	
	  <%
	  }
	  %>	
	  </div>
</body>
</html>