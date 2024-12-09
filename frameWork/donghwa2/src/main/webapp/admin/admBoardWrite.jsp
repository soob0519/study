<%@ page language="java" contentType="text/html; charset=UTF-8"
    											pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  
</head>

<style>
.locTd {
	font-size:15px;
	height:25px;
}
input,textarea,select {
	width:90%;
	font-size:15px;
	font-family:맑은 고딕;
}
textarea {
	height:100px;
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

<script>

$(function(){
	
	$("#btnSave").click(function(){ 
		
		// 제목,암호의 공백체크
		let title = $("#title").val();
		let pass  = $("#pass").val();
		
		if( title == "" ) {
			alert("제목을 입력하세요.");
			$("#title").focus();
			return false;
		}
		if( pass == "" ) {
			alert("암호를 입력하세요.");
			$("#pass").focus();
			return false;
		}
		
		let gubun = $("#gubun").val();
		
		// 폼 인식
		let form = $("#frm").serialize();
		// 비동기 전송기능
		$.ajax({  
			type : "post",
			url  : "/admBoardSave.do",
			data : form,
			datatype : "text",          // "ok", "fail"
			success : function(data) {  // 전송성공
				if(data == "ok") {
					alert("저장완료!!");
					location = "/admBoardList.do?gubun="+gubun;
				} else {
					alert("저장실패!!");
				}
			},
			error : function() {
				alert("전송실패!!");
			}
		});
	});
});

</script>

<body>

<div class="adminTop">
	<%@ include file="../include/admMenu.jsp" %>
</div>

<div class="adminMain">
	<div>
	<table class="type08" align="center">
		<tr>
			<th style="font-size:20px;">
				공시/사업보고서/전자공고 등록화면
			</th>
		</tr>
	</table>
	<br>
		<form id="frm" >
		<table class="type08" align="center">	
			<caption style="text-align:left;">
				
			</caption>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="pass" id="pass"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="writer" id="writer"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content"></textarea></td>
			</tr>
			<tr>
				<th>구분</th>
				<td><select name="gubun" id="gubun">
						<option value="1">공시등록</option>
						<option value="2">사업보고서</option>
						<option value="3">전자공고</option>
					</select>
				</td>
			</tr>
		</table>
		<br>
		
		<table align="center" style="width:940px;">
			<tr>
				<th style="font-size:12px;">

				</th>
			</tr>
			<tr>
				<td	align="center">
					<button type="submit" id="btnSave"
							              onclick="return false;">저장</button>
					<button type="reset">취소</button>
				</td>
			</tr>
		</table>
		</form>
		<p style="height:100px;">&nbsp;</p>

	</div>
</div>
</body>
</html>