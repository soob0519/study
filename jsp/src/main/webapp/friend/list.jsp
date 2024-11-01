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
친구관리
</header>

<nav>
<%@ include file="../include/friendMenu.jsp" %>
</nav>

<section>
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

  
 </body>
</html>
