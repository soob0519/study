<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
  
  <link rel="stylesheet" href="../css/style.css" />
 
 </head>
 
 <style>
 
 .div_title{
	position:relative;
	left:30px;
	top:40px;
	font-size:40px;
	font-weight:bold;
	color:#2f2f2f;
	width:840px;
	text-align:center;
 }
 
 .div_agrees {
	position:relative;
	left:30px;
	top:60px;
	width:840px;
	height:850px;	
	border:1px solid #cccccc;
	padding:10px;
	font-size:12px;
	line-height:3.0;
 }
 
 
 .button1{
	width:200px;
	padding:10px;
	font-size:14px;
	font-weight:bold;
	color:#ffffff;
	background-color:#0099ff;
	border:0px;
	cursor:pointer;/*pointer,help,progress,wait,cell*/
 }
 /*	hover  : 마우스 올렸을 경우 상태
	focus  : 커서가 위치하는 경우
	active : 클릭 순간의 경우
 */
 .button1:hover {
	background-color:#0000ff;
	box-shadow: 20px 5px 5px 0px #ffccff;
	/* 세로(공간),가로(공간),둥근모서리,그림자크기 */
 }
 .button1:focus {
	background-color:#cc0000;
 }
 .button1:active {
	background-color:#ffff00;
 }
 
 .button2{
	width:15%;
	padding:7px;
	font-size:14px;
	color:#ffffff;
	background-color:#0099ff;
	border:0px;
	cursor:pointer;/*pointer,help,progress,wait,cell*/
	margin-left:25px;
 }
 
 .table_member {
	width:100%;
 }
 .table_member td {
	padding:10px;
 }
 .title {
	font-weight:bold;
	font-size:14px;
 }
 
 .input1 {
	width:70%;
	padding:7px;
 }
 
 .input2 {
	width:90%;
	padding:7px;
 }
 
 hr {
	border:0px;
	height:1px;
	background:#e2e2e2;
 }
 
 .tel {
	width:22%;
	padding:7px;
 }
 
 .mail {
	width:25%;
	padding:7px;
 }
 
 .event1 {
	width:30%;
	font-weight:bold;
	font-size:14px;
 }
 .event2 {
	float:right;
	margin-right:30px;
 }
 
 .cabs1 {
	width:50%;
	padding:7px;
 }
 .cabs2 {
	width:15%;
	padding:7px;
	float:right;
	margin-right:160px;
 }
 

 </style>
 
 <script>
 function fn_select() {
	
	var ss = document.frm.mail3.value; //select 상자 값
	if (ss != "") {
		document.frm.mail2.value = ss;
		document.frm.mail2.readOnly = true;
	} else {
		document.frm.mail2.value = "";
		document.frm.mail2.readOnly = false;
	}	
	
 }
 
 function fn_submit() {
	
	if (document.frm.userid.value == "") {
		alert("아이디를 입력해주세요.");
		document.frm.userid.focus();
		return false;
	}
	
	if (document.frm.userid.value.length < 4 ||
		document.frm.userid.value.length > 12)
	{
		alert("아이디는 4자리에서 12자리까지 가능합니다.");
		document.frm.userid.focus();
		return false;
	}
	
	if (document.frm.pass.value == "") {
		alert("비밀번호를 입력해주세요.");
		document.frm.pass.focus();
		return false;
	}
	if (document.frm.pass.value.length < 4 ||
		document.frm.pass.value.length > 20)
	{
		alert("비밀번호는 4자리에서 20자리까지 가능합니다.");
		document.frm.pass.focus();
		return false;
	}
	
	if (document.frm.pass2.value == "") {
		alert("비밀번호확인을 입력해주세요.");
		document.frm.pass2.focus();
		return false;
	}
	
	if (document.frm.pass.value != document.frm.pass2.value) {
		alert("비밀번호와 비밀번호확인이 일치하지 않습니다.");
		document.frm.pass.focus();
		return false;
	}
	
	if (document.frm.name.value == "") {
		alert("이름을 입력해주세요.");
		document.frm.name.focus();
		return false;
	}
	if (document.frm.tel1.value == "") {
		alert("휴대번호1를 입력해주세요.");
		document.frm.tel1.focus();
		return false;
	}
	
	if (document.frm.tel1.value.length != 3 ||
		document.frm.tel2.value.length != 4 ||
		document.frm.tel3.value.length != 4)
	{
		alert("휴대번호를 다시 확인해주세요.");
		document.frm.tel1.focus();
		return false;
	}
	
	if (document.frm.tel2.value == "") {
		alert("휴대번호2를 입력해주세요.");
		document.frm.tel2.focus();
		return false;
	}
	if (document.frm.tel3.value == "") {
		alert("휴대번호3를 입력해주세요.");
		document.frm.tel3.focus();
		return false;
	}
	
	if (document.frm.mail1.value == "" ||
		document.frm.mail2.value == "" 
		) {
		alert("메일을 입력해주세요.");
		document.frm.mail1.focus();
		return false;
	}
	
	location = "http://dothome.co.kr";
 }
 
 </script>
 
 <body>
  
  <header>
  	<!-- header S -->
	<%@ include file="../include/header.jsp" %>
	<!-- header E -->
  </header>
  
  <nav>
	<!-- top menu S -->
	<%@ include file="../include/topMenu.jsp" %>
	<!-- top menu E -->
  </nav>
  
  <aside>
  aside영역
  </aside>
  
  <section>
	<div class="div_title">
		회원등록
	</div>
	<div class="div_agrees">
	
	<form name="frm" method="post" action="memberWriteSave.jsp">
		
		<table class="table_member">
			<tr>
				<td colspan="2" class="title">
				■ 로그인 정보 입력
				</td>
			</tr>
			<tr>
				<td>*아이디</td>
				<td>
					<input type="text" name="userid" class="input1">
					<button type="button" class="button2">중복확인</button>
				</td>
			</tr>
			<tr>
				<td>*비밀번호</td>
				<td>
					<input type="password" name="pass" class="input2">
				</td>
			</tr>
			<tr>
				<td>*비밀번호 확인</td>
				<td>
					<input type="password" name="pass2" class="input2">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="title">
				■ 회원 정보 입력
				</td>
			</tr>
			<tr>
				<td>이름(회사명)</td>
				<td>
					<input type="text" name="name" class="input2">
				</td>
			</tr>
			<tr>
				<td>*연락처</td>
				<td>
					<input type="text" name="tel1" class="tel">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="tel2" class="tel">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="tel3" class="tel">
			</tr>
			<tr>
				<td>*이메일</td>
				<td>
					<input type="text" name="mail1" class="mail">
					&nbsp;&nbsp;&nbsp;@&nbsp;&nbsp;&nbsp;
					<input type="text" name="mail2" class="mail">
					&nbsp;&nbsp;&nbsp;
					<select name="mail3" class="mail" onchange="fn_select()">
						<option value="">직접입력</option>
						<option value="naver.com">NAVER.COM</option>
						<option value="google.com">GOOGLE.COM</option>
						<option value="daum.net">DAUM.NET</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr>
				</td>
			</tr>
			<tr>
				<td class="event1">
				■ 상품 및 이벤트 정보 수신 동의
				</td>
				<td class="event2">
				<input type="checkbox" name="">&nbsp;이메일&nbsp;&nbsp;&nbsp;
				<input type="checkbox" name="">&nbsp;문자
				</td>
			</tr>
			<tr>
				<td colspan="2">서비스만료 및 서비스정보에 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="text" name="" class="cabs1">
				<input type="text" name="" class="cabs2">
				<br>
				<br>
				<p align="center">
				<button type="button" class="button1" onclick="fn_submit()">가입하기</button>
				</p>
				</td>
			</tr>
			
		</table>
	</form>
		
	</div>
	
  </section>
  
  <footer>
  	<!-- footer S -->
	<%@ include file="../include/footer.jsp" %>
	<!-- footer E -->
  </footer>  
  
 </body>
</html>
