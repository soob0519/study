<%@ page language="java" contentType="text/html; charset=UTF-8"
    											pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>동화제약 관리모드</title>
  <link rel="stylesheet" href="/css/admStyle.css">
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
		let chk = $("#userid").val().indexOf("%");
		
		if(chk > -1) {
			$("#span_userid").html("<font color='orange'> 특수문자는 불가능 합니다. </font>");
		} else if(len < 4){
			$("#span_userid").html("<font color='red'> 4자리 이상 입력해주세요. </font>");
		} else {
			$("#span_userid").html("");		
		
			$.ajax({
	    		type:"POST",
	    		url:"/admUseridCheck.do",
	    		data: "userid="+$("#userid").val(),
	    		
	    		datatype: "text",
	    		success : function(returnData){
	    			$("#userchk").val("2");
	    			if(returnData == "1"){
	    				$("#span_userid").html("<font color='green'> 사용가능한 아이디입니다. </font>");
	    				// 아이디 체크 값을 1번으로 덮어씀
	    				$("#userchk").val("1");	
	    			} else if(returnData == "4") {
	    				$("#span_userid").html("<font color='blue'> 이미 사용중인 아이디입니다. </font>");
	    			} else if(returnData == "2") {
	    				$("#span_userid").html("<font color='orange'> 형식에 어긋나는 아이디입니다.(영소문자 4~12) </font>");
	    			}
	    		},
	    		error : function(){
	    			alert("오류!!!!");
	    		} 
	    	});
		}
		
	});  
	      
    $("#btnSave").click(function(){
    	
    	let userchk =$("#userchk").val();
    	if(userchk != "1"){
    		alert("아이디 체크를 다시해주세요");
    		$("#userid").focus();
    		return false;
    	}
    	
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
    		data: datas,
    		
    		// 결과 값의 타입 (전송 이후의 상황)
    		datatype: "text",
    		
    		// 전송(자바까지의 도달)에 성공했을 경우
    		success : function(returnData){
    			if(returnData == "1"){
    				alert("저장완료");
    				location="/admList.do"
    			} else if(returnData == "2") {
    				alert("아이디 값이 형식에 어긋납니다.");
    			} else if(returnData == "3") {
    				alert("저장실패");
    			} else if(returnData == "4") {
    				alert("이미 사용중인 아이디 입니다.");
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
	<%@ include file = "../include/admMenu.jsp" %>
</div>


<div class="adminMain">
	<div>
	<table class="type08" align="center">
		<tr>
			<th style="font-size:20px;">
		관리자 메인
			</th>
		</tr>
	</table>
	</div>
</div>
</body>
</html>