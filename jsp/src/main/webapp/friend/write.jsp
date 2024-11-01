<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>회원정보등록</title>
  <link rel="stylesheet" href="layout.css" />
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
 </head> 
 <script>
 
 $(function(){
	
	$("#btn2").click(function(){
		location="list.html";	
	});	
	
	//keyup()함수 : 해당 오브젝트의 키 입력시마다 반응을 하는 함수
	$("#userid").keyup(function(){
		let userid = $("#userid").val();
		userid = $.trim(userid);
		if ( userid.length < 6 || userid.length > 12 ) {
			$("#userid_txt").html("아이디는 6 ~ 12자리 사이로 입력해주세요.");
		} else {
			$("#userid_txt").html("");	
		}
	});
	
	$("#userid").keyup(function(){
		let userid = $("#userid").val();
		userid = $.trim(userid);
		if ( userid.length < 6 || userid.length > 12 ) {
			$("#userid_txt").html("아이디는 6 ~ 12자리 사이로 입력해주세요.");
		} else {
			$("#userid_txt").html("");	
		}
	});
	
	$("#pass").keyup(function(){
		let pass = $("#pass").val();
		pass = $.trim(pass);
		if ( pass.length < 4 || pass.length > 20 ) {
			$("#pass_txt").html("암호는 4 ~ 20자리 사이로 입력해주세요.");
		} else {
			$("#pass_txt").html("");	
		}
	});
	
	$("#username").keyup(function(){
		let username = $("#username").val();
		username = $.trim(username);
		if ( username == "" ) {
			$("#username_txt").html("이름을 입력해주세요.");
		} else {
			$("#username_txt").html("");
		}
	});
	
	$("input[name='gender']").click(function(){
		$("#gender_txt").html("");
	});
	
	$("#level").click(function(){
		$("#level_txt").html("");
	});
	
	$("input[name='hobby']").click(function(){
		if ($("input[name='hobby']:checked").length < 2) {
			$("#hobby_txt").html("취미를 2개이상 선택해주세요");
		} else {
			$("#hobby_txt").html("");
		}
	});	
	
	// 날짜
	
	$("#rdate").datepicker();
	
	// 버튼
	$("#btn1").click(function(){
		
		let userid	 = $("#userid").val();
		let pass	 = $("#pass").val();
		let username = $("#username").val();
		
		userid = $.trim(userid);
		$("#userid").val(userid);
		
		if (userid.length < 6 ||
			userid.length > 12 ) {
			// alert("아이디는 6 ~ 12자리 사이로 입력해주세요.");
			$("#userid_txt").html("아이디는 6 ~ 12자리 사이로 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		
		pass = $.trim(pass);
		$("#pass").val(pass);		
		
		if (pass.length < 4 ||
			pass.length > 20 ) {
			// alert("암호는 4 ~ 20자리 사이로 입력해주세요.");
			$("#pass_txt").html("암호는 4 ~ 20자리 사이로 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		username = $.trim(username);
		$("#username").val(username);
		
		if (username == "") {
			// alert("이름을 입력해주세요.");
			$("#username_txt").html("이름을 입력해주세요.");
			$("#username").focus();
			return false;
		}
		
		//document.frm.gender[0].checked == false &&
		//document.frm.gender[1].checked == false
		if (!$("input[name='gender']").is(":checked")) {
			// alert("성별을 체크해주세요.");
			$("#gender_txt").html("성별을 선택해주세요.");
			return false;
		}
		
		if ( $("#level").val() == null ) {
			// alert("등급을 선택해주세요.");
			$("#level_txt").html("등급을 선택해주세요.");
			return false;
		}
		
		//해당 오브젝트의 상태가 ture인 요소만 가져옴
		let hobby = $("input[name='hobby']:checked");
		
		//if (!$("input[name='hobby']").is(":checked")) {		
		if ( hobby.length < 2 ) {
			//alert("취미를 2개이상 선택해주세요.");
			$("#hobby_txt").html("취미를 2개이상 선택해주세요.");
			return false;
		}
		
	});
	
 });
 
 </script>
 <style>
 
 .table4 {
	border:1px solid #000000;
	width:600px;
	margin-left:auto; 
    margin-right:auto;
 }
 
 .table4 td {
	border:1px solid #000000;
 }
 
 .table4 th {
	border:1px solid #000000;
	background-color:#ffff99;
 }
  
 
 .div_write {
	border:0px solid #000000;
	width:600px;
	margin-left:auto;
    margin-right:auto;
	padding-top:3px;
	text-align:center;
 }
 
 button + button {
	margin-left:20px;
 }
 
 .span_msg {
	color:red;
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
	<p id="title"><br>친구 등록</p>
		<form name="frm" id="frm" method="post" action="writeSave.jsp">
		
		<table class="table4">
			<tr>
				<th>회원번호</th>
				<td><input type="text" name="number" value="1006" readonly></td>
			</tr>
			<tr>
				<th><label for="userid">회원ID</label></th>
				<td>
					<input type="text" tabIndex="1" name="userid" id="userid" maxlength="12" autofocus>
					<span id="userid_txt" class="span_msg"></span>
				</td>
			</tr>
			<tr>
				<th><label for="userpass">암호</label></th>
				<td>
					<input type="password" tabIndex="3" name="pass" id="pass" autofocus>
					<span id="pass_txt" class="span_msg"></span>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" tabIndex="2" name="username" id="username" autofocus>
					<span id="username_txt" class="span_msg"></span>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="M">남
					<input type="radio" name="gender" value="F">여
					<span id="gender_txt" class="span_msg"></span>
				</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>
					<select name="level" id="level" size="4">
					<option value="특별회원">특별회원</option>
					<option value="우수회원">우수회원</option>
					<option value="일반회원">일반회원</option>
					</select>
					<span id="level_txt" class="span_msg"></span>
				</td>
			</tr>
			<tr>
				<th>취미</th> <!-- hobby = {"영화","골프"} -->
				<td>
					<input type="checkbox" name="hobby" value="독서">독서
					<input type="checkbox" name="hobby" value="운동">운동
					<input type="checkbox" name="hobby" value="영화">영화
					<input type="checkbox" name="hobby" value="낚시">낚시
					<input type="checkbox" name="hobby" value="골프">골프
					<span id="hobby_txt" class="span_msg"></span>
				</td>
			</tr>
			<tr>
				<th>소개</th>
				<td>
					<textarea name="content" id="content" style="width:98%;height:50px;"></textarea>
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="myfile" id="myfile">
				</td>
			</tr>
			<tr>
				<th>등록일자</th>
				<td>
					<input type="text" name="rdate" id="rdate">
				</td>
			</tr>
			
		</table>
		
		<div class="div_write">
			<button type="submit" id="btn1">등록</button>
			<button type="button" id="btn2">조회</button>
		</div>
		
		</form>
	
</section>
 </body>
</html>
