<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String deptno = request.getParameter("deptno");
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");

if(deptno == null || dname == null || deptno.equals("") || dname.equals("")){
%>
	<script>
	
	alert("부서정보가 없습니다. 다시 시도해 주세요.");
	history.back();	// 이전화면으로 이동
	</script>

<%	
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

부서번호 <%=deptno %> <br>
부서이름 <%=dname %> <br>
부서위치 <%=loc %> <br>

</body>
</html>