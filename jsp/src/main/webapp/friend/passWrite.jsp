<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userno = request.getParameter("userno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
.div1 {
	width: 500px;
	height: 200px;
	background-color:yellow;
}


</style>

<body>

<div class="div1">
<form name ="frm" method="post" action="delete.jsp">
	<input type="hidden" name="userno" value="<%=userno %>">
암호
<input type="text" name ="pass">
<button type="submit">삭제</button>
</form>
</div>

</body>
</html>