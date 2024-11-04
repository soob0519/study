<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
<<<<<<< HEAD
  <title>친구현황조회</title>
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

.div_bottom {
	margin:auto;
	width:700px;
	padding:5px;
}

</style>

<body>

<header>
=======
  <title>친구조회(1001)</title>
  
  <link rel="stylesheet" href="layout.css" />
  
 </head>
  
 <style>
 
 .table3 {
	border:1px solid #000000;
	width:600px;
	text-align:center;
	margin-left:auto; 
    margin-right:auto;
 }
 
 .table3 th, td {
  border: 1px solid #000000;
}

 .div_myList {
	border:0px solid #000000;
	width:600px;
	margin-left:auto;
    margin-right:auto;
	margin-top:10px;
	padding-left:40px;
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

	<p id="title"> <br> 친구조회(1001) </p>
	
	<table class="table_list">
		<tr>
			<th>회원ID</th>
			<th>회원이름</th>
			<th>요청일자</th>
		</tr>
		<tr align="center">
			<td>choi</td>
			<td>최영문</td>
			<td>2024.01.01</td>
		</tr>
		<tr align="center">
			<td>park</td>
			<td>박기자</td>
			<td>2024.01.02</td>
		</tr>
	</table>
	
	<div class="div_bottom">친구 : 2명</div>
	
</section>

<footer>

</footer>

=======
	<p id="title"><br>친구조회(1001)</p>
		
		<table  class="table3">
			<tr>
				<th>회원ID</th>
				<th>회원명</th>
				<th>요청일자</th>
			</tr>
			<tr>
				<td>choi</td>
				<td>최영문</td>			
				<td>2018-09-20</td>
			</tr>
			<tr>
				<td>park</td>
				<td>박기자</td>			
				<td>2018-09-21</td>
			</tr>
		
		</table>
		
		<div class="div_myList">
			친구 : 2명
		</div>

</section>

>>>>>>> d10a090a16450864f3c35fbba8fd0a0ee427b471
 </body>
</html>
