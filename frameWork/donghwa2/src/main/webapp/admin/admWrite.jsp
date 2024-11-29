<%@ page language="java" contentType="text/html; charset=UTF-8"
    											pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>동화제약 관리모드</title>
</head>

<style>
html {
	overflow-y:scroll;
}
/*body { font-family: 'nsd','돋움'; line-height: 1; font-size:12px; letter-spacing: -0.3px ;color: #5c5c5c;}*/
body{
	font-size:15px;
	line-height:1.6;
	color:#777;
	font-family: "Noto Sans KR","Nanum Gothic","Malgun Gothic","Dotum",sans-serif ;
	position:relative;
}

a {
	text-decoration:none;
}

.adminTop {
	width:100%;
	margin: 0px auto;
	padding: 20px;
	margin-bottom: 0px;
	border: 1px solid #bcbcbc;
	background-color:#474747;
}
.adminTop a {
	color:#ffffff;
}

.adminMain {
	width:1200px;
	margin: 0px auto;
	padding: 30px;
	border: 0px solid #bcbcbc;
}
.topMenu {
	text-align:center;
	vertical-align:middle;
}

table.type09 {
    border-collapse: collapse;
    line-height: 1.5;
    border: 1px solid #ccc;
    margin: 20px 10px;
	width:1200px;
}

table.type09 tbody th {
    padding: 10px;
    font-weight: bold;
    vertical-align: middle;
    border: 1px solid #ccc;
    background: #ececec;
}
table.type09 td {
    padding: 5px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
table.type08 {
    border-collapse: collapse;
    line-height: 1.5;
    border: 1px solid #ccc;
	width:940px;
}

table.type08 tbody th {
    padding: 10px;
    font-weight: bold;
    vertical-align: middle;
    border: 1px solid #ccc;
    background: #ececec;
}
table.type08 td {
    padding: 5px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
.botton1 {
	width:70px;height:27px;
}
.topTitle {
	width:920px; 
	text-align:center; 
	padding:10px;
	font-size:20px;
	font-weight:bold;
	border:1px solid #ccc;
}
</style>


<script>
function fn_action() {
	var f = document.frm;
	if(f.title.value == "") {
		alert("제목을 입력해주세요.");
		f.title.focus();
		return false;
	}
	// f.action = "courseWriteSave.php";
	f.submit();
}

</script>

<style>
.locTd {
	font-size:15px;
	height:25px;
}
input,textarea,select {
	font-size:15px;
	font-family:맑은 고딕;
}
.td {
	width: 98%;
	height:25px;
}
.button1 {
	padding:5px;
	font-size:12px;
	width:70px;
}
</style>

<body>
<div class="adminTop">
	<div class="topMenu">
		<!--<a href="adminPassChange1.php">관리암호변경</a> -->
		<a href="/">홈으로</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/admList.do">관리계정</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/admBoardList.do?g=1">공시</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/admBoardList.do?g=2">사업보고서</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/admBoardList.do?g=3">전자공고</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/admGoodsList.do">제품관리</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/admPollList.do">설문관리</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/admLogout.do">로그아웃</a>
	</div>
</div>


<div class="adminMain">
	<div>
	<table class="type08" align="center">
		<tr>
			<th style="font-size:20px;">
		공시등록
			</th>
		</tr>
	</table>
	<br>
	<form name="frm" method="post" action="/admInsert.do">
		<table class="type08" align="center">
			<tr>
				<th width="20%">아이디</th>
				<td width="80%"><input type="text" name="userid"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="userpass"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="text" name="birth"></td>
			</tr>
			<tr>
				<th>등급</th>
				<td>
					<select name="grade">
					<option value="1">레벨1</option>
					<option value="2">레벨2</option>
					<option value="3">레벨3</option>
					</select>
				</td>
			</tr>
		</table>
		<br>
		<table align="center" style="width:940px;">
			<tr>
				<th style="font-size:20px;">
			
				<button type="button" onclick="location='/admList.do'" class="button1">목록</button>
				<button type="submit" class="button1">저장</button>
				</th>
			</tr>
		</table>
		<p style="height:100px;">&nbsp;</p>

	</form>
	</div>
</div>
</body>
</html>