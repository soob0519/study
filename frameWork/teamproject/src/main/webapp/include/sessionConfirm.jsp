<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/oracleCon.jsp" %>
<%
String SessionUserid = (String) session.getAttribute("SessionUserid");
if( SessionUserid == null ) {
%>
	<script>
	location="loginWrite.jsp";
	</script>
<%
	return;
}
String sessionCntSql = "select count(*) from member where id='"+SessionUserid+"' ";
ResultSet sessionCntRs = stmt.executeQuery(sessionCntSql);
sessionCntRs.next();
if(sessionCntRs.getInt(1) == 0){
	session.removeAttribute("SessionUserid");
%>
	<script>
	alert("세션아이디 검증실패!!");
	location="/member/loginWrite.jsp";
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