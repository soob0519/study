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
<form name="frm" method="post" action="/sample2/deptUpdate.do">
<table>
	<caption>부서정보수정</caption>
	<tr>
		<th>부서번호</th>
		<td><input type="text" name="deptno" class="input1" value="${deptvo.deptno }" readonly></td>
	</tr>
	<tr>
		<th>부서이름</th>
		<td><input type="text" name="dname" class="input1" value="${deptvo.dname }"></td>
	</tr>
	<tr>
		<th>부서위치</th>
		<td><input type="text" name="loc" class="input1" value="${deptvo.loc }"></td>
	</tr>

</table>
<div class="div_button">
<button type="submit" onclick="fn_action();return false;">전송</button>
<button type="reset">취소</button>
</div>
</form>

</body>
</html>