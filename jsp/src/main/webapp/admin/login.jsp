<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

.div1 {
	margin-top:20%;
	width:100%;
	height:140px;
	background-color:yellow;
	text-align:center;

}
 table {
 	margin-left:30%;
 	padding-top:5px;
 	border:1px solid #cccccc;
 }
 
 caption {
 	padding-top:5px;
 	font-size:30px;
 	font-weight:bold;
 }
 
</style>

<body>
	<div class="div1">
	<form name="frm" method="post" action="loginSession.jsp">
		<table>
			<caption>관리자모드</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
				<th>패스워드</th>
				<td><input type="password" name="pw"></td><br>
			</tr>
		</table>
		<div>
		<button type="submit">로그인</button>
		</div>
	</form>
	</div>
</body>
</html>