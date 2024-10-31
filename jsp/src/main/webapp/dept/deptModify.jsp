<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
String deptno= request.getParameter("deptno");
if(deptno == null || deptno.equals("")){
%>	
	<script>
	alert("잘못된 접근입니다.");
	location ="deptList.jsp";
	</script>
	
<%	
	return;
}
%>
  
<%@
include file ="/include/oracleCon.jsp"
%>
<%
String sql1="select deptno,dname,loc from dept "
			+" 	where deptno = '"+deptno+"' ";
ResultSet rs1 = stmt.executeQuery(sql1);

String dname="";
String loc="";

if(rs1.next()){
	dname = rs1.getString("dname");
	loc = rs1.getString("loc");
} else {
%>		
	<script>
	alert("잘못된 부서번호입니다.");
	location ="deptList.jsp";
	</script>
<%
	return;
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서정보수정</title>
</head>
<style>

body {
	font-size:12px;
	font-family:맑은 고딕;
}
table {
	width:600px;
	border:1px solid #ccc;
	border-collapse:collapse;
}

th,td {
	border:1px solid #ccc;
	padding:7px;
}
caption {
	font-size:20px;
	font-weight:bold;
	padding:10px;
}

button{
	padding:10px;
	background-color:pink;
	border-radius:10px;
	border:1px solid orange;
}

.div_button {
	width:600px;
	margin-top:10px;
	text-align:center;
}

.input1{
	width:98%;
	font-size:12px;
	font-family:맑은 고딕;
}

</style>
<script>

function fn_action(){
	
	if(document.frm.deptno.value==""){
		alter("부서번호를 입력해주세요.");
		document.frm.deptno.focus();
		return false;
	}
	
	if(document.frm.dname.value==""){
		alter("부서이름를 입력해주세요.");
		document.frm.dname.focus();
		return false;
	}
	
	document.frm.submit();
}

</script>

<body>
<form name="frm" method="post" action="deptModifySave.jsp">
<table>
	<caption>부서정보수정</caption>
	<tr>
		<th>부서번호</th>
		<td><input type="text" name="deptno" value="<%=deptno %>" readonly class="input1" maxlength="2" autofoucus></td>
	</tr>
	<tr>
		<th>부서이름</th>
		<td><input type="text" name="dname" value="<%=dname %>" class="input1"></td>
	</tr>
	<tr>
		<th>부서위치</th>
		<td><input type="text" name="loc" value="<%=loc %>" class="input1"></td>
	</tr>

</table>
<div class="div_button">
<button type="submit" onclick="fn_action();return false;">전송</button>
<button type="reset">취소</button>
</div>
</form>

</body>
</html>