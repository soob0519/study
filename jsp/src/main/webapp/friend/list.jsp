<<<<<<< HEAD
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/oracleCon.jsp" %>

<%
String sql ="select "
			+"	userno "
			+"	,userid "
			+"	,name "
			+"	,decode(lev,'S','특별','E','우수','N','일반') lev "
			+"	,substr(hobby,1,(length(hobby)-1)) hobby"
			+"	,to_char(rdate,'yyyy-mm-dd') rdate "
			+"  from " 
			+"		friend1 "
			+"	order by userno desc ";
ResultSet rs = stmt.executeQuery(sql);
%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>회원목록</title>
    <link rel="stylesheet" href="layout.css"/>
</head>

<style>

table.table_list {
	margin:auto;
	width:700px;
	border-collapse:collapse;
}
.table_list th,td {
	padding:5px;
	border:1px solid #646464;
	text-align:center;
}
.table_list th {
	background-color:#65987d;
	color:#ffcc99;
}
.table_list tr:hover {
	background-color:#99d2ac;
}
</style>

<script>
function fn_popup(userno){
	
	let url="passWrite.jsp?userno="+userno;
	window.open(url,"팝업","width=500,height=400")
	
}
</script>

<body>

<header>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>친구 조회/수정</title>
  
  <link rel="stylesheet" href="layout.css" />
  
 </head>
  
 <style> 
 
 .table2 {
	border:1px solid #000000;
	width:600px;
	text-align:center;
	margin-left:auto; 
    margin-right:auto;
 }
 
 .table2 th, td {
  border: 1px solid #000000;
}
 
 </style>
 
 <body>
  
<header>
<br>
>>>>>>> d10a090a16450864f3c35fbba8fd0a0ee427b471
친구관리
</header>

<nav>
<%@ include file="../include/friendMenu.jsp" %>
</nav>

<section>
<<<<<<< HEAD

	<p id="title"> <br> 친구목록 </p>
	
	<table class="table_list">
		<tr>
			<th>회원번호</th>
			<th>회원ID</th>
			<th>이름</th>
			<th>등급</th>
			<th>취미</th>
			<th>등록일자</th>
			<th>삭제</th>
		</tr>
		<%
		while(rs.next()){
			String userno = rs.getString("userno");
			String userid = rs.getString("userid");
			String name = rs.getString("name");
			String lev = rs.getString("lev");
			String hobby = rs.getString("hobby");
			String rdate = rs.getString("rdate");
		%>
		<tr align="center">
			<td><%=userno %></td>
			<td>
				<a href="modify.jsp?userno=<%=userno %>"><%=userid %></a>
			</td>
			<td><%=name %></td>
			<td><%=lev %></td>
			<td><%=hobby %></td>
			<td><%=rdate %></td>
			<td><a href="javascript:fn_popup('<%=userno %>')">DEL</a></td>
		</tr>
		<%
		} 
		%>
	</table>
</section>

<footer>

</footer>

=======
	<p id="title"><br><br>친구 조회/수정</p>
		
		<table class="table2">
			<tr>
				<th>회원번호</th>
				<th>회원ID</th>
				<th>이름</th>
				<th>등급</th>
				<th>취미</th>
				<th>등록일자</th>
			</tr>
			<tr>
				<td>1001</td>
				<td><a href="modify.jsp">hong</td>
				<td>홍길동</td>
				<td>특별</td>
				<td>독서,운동,영화</td>
				<td>2018.01.10</td>
			</tr>
		
		</table>
	
</section>

  
>>>>>>> d10a090a16450864f3c35fbba8fd0a0ee427b471
 </body>
</html>
