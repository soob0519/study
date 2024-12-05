<%@ page language="java" contentType="text/html; charset=UTF-8"
    											pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>관리자 로그인</title>
  <script src="/js/jquery-3.7.1.js"></script>
  <script src="/js/jquery-ui.js"></script>
  
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
$(function(){
	$("#btnSave").click(function(){
		let id = $("#userid").val();
		let pw = $("#userpass").val();
		
		if( id == "" ){
			$("#span1").html("<font color='red'>아이디를 입력해주세요!!</font>");
			$("#userid").focus();
			return false;
		}
		if( pw == "" ){
			$("#span1").html("<font color='red'>비밀번호를 입력해주세요!!</font>");
			$("#userpass").focus();
			return false;
		}
		
		// 폼지정 세팅
		let form = $("#frm").serialize();
		
		// 비동기 전송
		$.ajax({
			// 전송을 위한 세팅
			type : "post",
			url : "/admSession.do",
			data : form,
			// 전송이후 세팅
			datatype : "text",	// return data(리턴 값의 타입) :: "ok" , "fail"
			
			success : function(data){	// 전송에 대한 의미
				
				if(data == "1"){
					$("#span1").html("<font color='red'><b> **로그인 정보가 올바르지 않습니다.**</b></font>");
					$("#userid").focus();
					return false;
				} else if(data=="2"){
					alert(id+"님이 로그인에 성공했습니다.");
					location="/admMain.do"
					return false;
				}
			},
			error : function(){
				alert("전송실패");
			}
			
		});
		
	});
});
	
</script>
<body>
<div class="introDiv1">
	<div style="height:300px;"></div>
	<div class="introDiv2">
	<form name="frm" id="frm">
	<table border="0" width="100%">
		<tr>
			<td align="center">
	<table class="type08" align="center" >
		<tr>
			<th>아이디</th>
			<td><input type="text" name="userid" id="userid"></td>
			<td rowspan="2">
			<button type="submit" id="btnSave" onclick="return false;">로그인</button>
			</td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input type="password" name="userpass" id="userpass"></td>
		</tr>
	</table>
	
	<span id="span1"> *로그인 아이디와 암호를 입력해주세요.</span>
		
			</td>
		</tr>
	</table>
	
	</form>
	</div>
</div>
</body>
</html>
