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
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String nm = request.getParameter("nm");


// 아이디 중복체크
String sql2 = "select count(*) from member where id='"+id+"'";

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
}
%>

</body>
</html>