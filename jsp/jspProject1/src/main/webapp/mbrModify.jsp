<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="dbCon.jsp"%>
     
<%
String sessionId= (String)session.getAttribute("SessionUserId");
if(sessionId == null || sessionId.equals("")){
	// 로그인 화면으로 이동처리
	response.sendRedirect("loginWrite.jsp");
	return;
}

String sql = "select id,pw,nm,dt from mbr "
			+" where id='"+sessionId+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

String id = rs.getString("id");
String pw = rs.getString("pw");
String nm = rs.getString("nm");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
</head>

<style>
header {
	width:100%;
	height:70px;
	background-color:green;
	
}
nav {
	width:100%;
	height:30px;
	background-color:yellow;
	text-align:center;
	padding:10px;
	
}
section {
	width:100%;
	height:400px;
	background-color:#f6f6f6;
	
}

footer {
	width:100%;
	height:50px;
	background-color:#cccccc;
	
}

table{
	border:1px solid #cccccc;
	width:600px;
	border-collapse:collapse;
}

th,td{
	border:1px solid #cccccc;
	background-color:#ffffff;
	padding:5px;
	font-size:13px;
}

div{
	width:100%;
	height:30px;
	text-align:center;
	padding:10px;
}

</style>
<script>

function fn_submit(){
	
	let f = document.myform;
	
	if(f.id.value == ""){
		alert("아이디를 입력해주세요.");
		f.id.focus();
		return false;
	}
	
	if(f.pw.value == ""){
		alert("비밀번호를 입력해주세요.");
		f.pw.focus();
		return false;
	}
	f.submit(); // 폼전송
}

</script>
<body>
	
<header>

</header>

<nav>
	<a href="#">홈</a>
<%
if(sessionId == null || sessionId.equals("")){
%>
	&nbsp;&nbsp;
	<a href="mbrWrite.jsp">회원등록</a>
	&nbsp;&nbsp;
	<a href="loginWrite.jsp">로그인</a>
<%
} else {
%>
	&nbsp;&nbsp;
	<a href="mbrModify.jsp">회원수정</a>
	&nbsp;&nbsp;
	<a href="logout.jsp">로그아웃</a>
<%
}
%>
</nav>

<section>
<br>
<form name="myform" method="post" action="mbrModifySave.jsp">
<table align="center">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id" value="<%=id %>"></td>
	</tr>
	<tr>
		<th>암호</th>
		<td><input type="password" name="pw"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="nm" value="<%=nm %>"></td>
	</tr>

</table>

<div>
	<button type="button" onclick="fn_submit()">수정</button>
</div>

</form>
</section>

<footer>
</footer>	
	
</body>
</html>