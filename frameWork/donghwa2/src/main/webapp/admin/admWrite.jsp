<%@ page language="java" contentType="text/html; charset=UTF-8"
    											pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>동화제약 관리모드</title>
  <link rel="stylesheet" href="/css/jquery-ui.css">
  <link rel="stylesheet" href="/css/style.css">
  <script src="/js/jquery-3.7.1.js"></script>
  <script src="/js/jquery-ui.js"></script>
  
<script>
  $( function() {
    $( "#birth" ).datepicker({
      changeMonth: true,
      changeYear: true
    }); 
    
 	// 실시간 키입력시 반응 하는 함수
	$("#userid").keyup(function(){ 
		let	len = $("#userid").val().length;
		if(len<4){
			$("#span_userid").html("<font color='red'> 4자리 이상 입력해주세요 </font>");
		} else {
			$("#span_userid").html("");
		}
		
		$.ajax({
    		type:"POST",
    		url:"/admUseridCheck.do",
    		data: "userid="+$("#userid").val(),
    		
    		datatype: "text",
    		success : function(returnData){
    			if(returnData == "ok"){
    				$("#span_userid").html("<font color='green'> 사용가능한 아이디입니다. </font>");
    			} else {
    				$("#span_userid").html("<font color='blue'> 사용 불가능한 아이디입니다. </font>");
    			}
    		},
    		error : function(){
    			alert("오류!!!!");
    		}    		
    	});
		
	});  
	      
    $("#btnSave").click(function(){
    	
    	let id = $("#userid").val();
    	let pw = $("#userpass").val();
    	
    	id = id.replaceAll(" ","");
    	$("#userid").val(id);
    	
    	pw = pw.replace(" ","");
    	$("#userpass").val(pw);
    	
    	if(id == ""){
    		alert("아이디를 입력하세요");
    		$("#userid").focus();
    		return false;
    	}
    	
    	if( pw == ""){
    		alert("비밀번호를 입력하세요");
    		$("#userpass").focus();
    		return false;
    	}
    	
    	let nm = $("#username").val();
    	let birth = $("#birth").val();
    	let grade = $("#grade").val();
    	
    	// get 방식
    	// let datas ="userid="+id+"&userpass="+pw+"&username"+nm+
    	//			"&birth="+birth+"&grade="+grade;
    	
    	// JSON 제이슨 형식
    	let datas = {
    			// 변수명 (vo의 변수명과 일치): 변수값
    			userid:id,
    			userpass:pw,
    			username:nm,
    			birth:birth,
    			grade:grade    			
    	};
    	
		// let form = $("#frm").serialize();	// 폼에 대한 인식 :: ajax는 스스로 form(frm)을 인식하지 못함
    	
    	$.ajax({
    		// 전송방식
    		type:"POST",	// get,post
    		// 전송장소
    		url:"/admInsert.do",
    		// 전송데이터
    		data: form,
    		
    		// 결과 값의 타입 (전송 이후의 상황)
    		datatype: "text",
    		
    		// 전송(자바까지의 도달)에 성공했을 경우
    		success : function(returnData){
    			if(returnData == "ok"){
    				alert("저장완료");
    				location="/admList.do"
    			} else {
    				alert("저장실패");
    			}
    		},
    		error : function(){
    			alert("저장실패~");
    		}    		
    	});  	
    	
			
    }); 
    
    
  } );
</script>


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
	<form name="frm" id="frm" method="post" action="/admInsert.do">
		<table class="type08" align="center">
			<tr>
				<th width="20%">아이디</th>
				<td width="80%">
				<input type="text" name="userid" id="userid" placeholder="4자이상">
				<span id="span_userid"></span>
				</td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="userpass" id="userpass"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="username" id="username"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="text" name="birth" id="birth"></td>
			</tr>
			<tr>
				<th>등급</th>
				<td>
					<select name="grade" id="grade">
					<option value="1">레벨1</option>
					<option value="2" selected>레벨2</option>
					<option value="3">레벨3</option>
					</select>
				</td>
			</tr>
		</table>
		<br>
		<table align="center" style="width:940px;">
			<tr>
				<th style="font-size:20px;">
				<button type="submit" id="btnSave" class="button1" onclick="return false;">저장</button>
				<button type="reset" id="btnReset" class="button1">취소</button>
				</th>
			</tr>
		</table>
		<p style="height:100px;">&nbsp;</p>

	</form>
	</div>
</div>
</body>
</html>