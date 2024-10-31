<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
include file="/include/oracleCon.jsp"
%>

<%
String sql1="select count(*) total from dept";
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
int total = rs1.getInt("total");

String sql2="select deptno,dname,loc from dept order by deptno";
ResultSet rs2 = stmt.executeQuery(sql2);

%>    
    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	text-align:center;
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
function fn_delete(deptno){
		
	if(confirm("정말 삭제하시겠습니까?")){
		location = "deptDelete.jsp?deptno="+deptno;
	}
	
}

</script>


<body>
	
	<table>
		<caption>부서정보목록</caption>
		<colgroup>
			<col width="10%"/>
			<col width="20%"/>
			<col width="30%"/>
			<col width="*%"/>
			<col width="10%">
		</colgroup>
		<tr>
			<th>번호</th>
			<th>부서번호</th>
			<th>부서이름</th>
			<th>부서위치</th>
			<th>삭제</th>
		</tr>
			
		<%
		int number = 0;
		while(rs2.next()){
			number++;
			String deptno = rs2.getString("deptno");
			String dname = rs2.getString("dname");
			String loc = rs2.getString("loc");
		%>
			<tr>
				<td><%=number %></td>
				<td><a href="deptModify.jsp?deptno=<%=deptno %>"><%=deptno %></a></td>
				<td><%=dname %></td>
				<td><%=loc %></td>
				<td>
					<a href="deptDelete.jsp?deptno=<%=deptno %>">del1</a>
					<a href="javascript:fn_delete('<%=deptno %>')">del2</a>
				</td>
			</tr>
		<%	
		}
		%>
		
	</table>

	<div>
	Total : <%=total %>
	</div>
	

</body>
</html>