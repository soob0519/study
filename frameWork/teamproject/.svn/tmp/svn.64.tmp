<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../include/oracleCon.jsp" %>

<%
request.setCharacterEncoding("utf-8");

// 파라미터 값 설정
String userid = request.getParameter("userid");

// 아이디 중복체크
String sql2 = "select count(*) from schedule11 where userid='"+userid+"'";

ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt(1);
if( cnt == 1) {
%>
	<script>
	alert("이미 사용중인 아이디입니다.");
	history.back();
	</script>
	
<%
} else{
	%>
	<script>
	alert("사용가능한 아이디입니다.");
	history.back();
	</script>
	
<%	
}
%>

</body>
</html>