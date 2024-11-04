<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userno = request.getParameter("userno");
String pass = request.getParameter("pass");
%>

<%@ include file = "../include/oracleCon.jsp" %>

<%
String sql="delete from friend1 "
			+" where userno='"+userno+"' and pass='"+pass+"' ";
int result = stmt.executeUpdate(sql);
if(result == 1){
%>
	<script>
	alert("삭제완료");
	self.close();
	</script>
<%
}else{
%>
	<script>
	alert("삭제실패");
	history.back();
	</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>