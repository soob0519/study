<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서정보등록</title>
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


<body>
<form name="frm" method="post" action="deptWriteSave.jsp">
<table>
	<caption>부서정보등록</caption>
	<tr>
		<th>부서번호</th>
		<td><input type="text" name="deptno" class="input1" autofoucus></td>
	</tr>
	<tr>
		<th>부서이름</th>
		<td><input type="text" name="dname" class="input1"></td>
	</tr>
	<tr>
		<th>부서위치</th>
		<td><input type="text" name="loc" class="input1"></td>
	</tr>

</table>
<div class="div_button">
<button type="submit">전송</button>
<button type="reset">취소</button>
</div>
</form>

</body>
</html>