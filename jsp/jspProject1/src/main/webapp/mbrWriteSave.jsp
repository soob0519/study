<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="dbCon.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

<%

request.setCharacterEncoding("utf-8");

// 파라메터 값 설정
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String nm = request.getParameter("nm");
// 오류체크
if(id == null || id.equals("")){
%>	
	<script>
	alert("아이디 다시 입력해주세요");
	history.back();
	</script>
<%	
	return;
}

String sql1 = "INSERT INTO MBR(ID,PW,NM,DT) VALUES('"+id+"','"+pw+"','"+nm+"',sysdate)";

// 저장 건수
int result = stmt.executeUpdate(sql1);
if(result>0){
%>
	<script>
	alert("저장완료!");
	location="loginWrite.jsp"; // 로그인 화면으로 이동
	</script>
<%
}else{	// 0건인 경우 저장 안됨
%>
	<script>
	alert("저장실패");
	history.back(); // 이전 화면으로 이동
	</script>
<%
}
%>    