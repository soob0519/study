<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String name = request.getParameter("name");
String phone = request.getParameter("phone");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% if(	name != null &
		phone != null )
{ 
%>
	<%=name %>의 전번은 <%=phone %> 입니다.<br><br>
<%
}
%>

<form name="frm" method="post" action="<%=request.getRequestURI() %>">
이름 <input type="text" name="name"> <br>
전번 <input type="text" name="phone"> <br>
<button type="submit">전송</button>
</form>

</body>
</html>