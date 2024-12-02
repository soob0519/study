<%@ page language="java" contentType="text/html; charset=UTF-8"
    											pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>관리자 로그인</title>
 </head>
<style>
.introDiv1 {
	width:100%;
	height:100%;
	text-align:center;
	vertical-align:middle;
}
.introDiv2 {
	width:100%;
	text-align:right;
	vertical-align:middle;
	background:yellow;
	font-size:14px;
	font-family:맑은 고딕;
	line-height:2.5;
}
.introDiv2 input {
	width:98%;
	height:22px;
}
table.type08 {
    /*border-collapse: collapse;*/
    line-height: 1.5;
    border: 0px solid #ccc;
    margin: 20px 10px;
	width:400px;
}

table.type08 tbody th {
    padding: 3px;
	width:100px;
    font-weight: bold;
    vertical-align: middle;
    border: 0px solid #ccc;
    background: #ececec;
}
table.type08 td {
    padding: 3px;
    vertical-align: top;
    border-right: 0px solid #ccc;
    border-bottom: 0px solid #ccc;
}
button {
	width:98%;height:70px;
}
input {
	font-size:14px;
}

</style>
<script>
function fn_action() {
	var f = document.frm;
	if(f.userid.value == "") {
		alert("아이디를 입력해 주세요.");
		return;
	}
	f.submit();
}
</script>
<body>
<div class="introDiv1">
	<div style="height:300px;"></div>
	<div class="introDiv2">
	<form name="frm" method="post" action="adminLogin.php">
	<table border="0" width="100%">
		<tr>
			<td align="center">
	<table class="type08" align="center">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="userid"></td>
			<td rowspan="2">
		<button type="button" onclick="fn_action()">로그인</button>
			</td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input type="password" name="pass"></td>
		</tr>
	</table>
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>
