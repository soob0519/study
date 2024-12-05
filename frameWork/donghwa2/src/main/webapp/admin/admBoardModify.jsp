<%@ page language="java" contentType="text/html; charset=UTF-8"
    											pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

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
	width:91%;
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
		
		// 제목, 암호의 공백체크
		let title = $("#title").val();
		let pass = $("#pass").val();
		
		if(title == ""){
			alert("제목을 입력하세요.");
			$("#title").focus();
			return false;
		}
		if(pass == ""){
			alert("암호를 입력하세요.");
			$("#pass").focus();
			return false;
		}
		// 폼 인식
		let form = $("#frm").serialize();
		// 비동기 전송기능
		$.ajax({
			type : "post",
			url  : "/admBoardUpdate.do",
			data : form,
			datatype : "text",
			success : function(data){
				if(data == "ok"){
					alert("수정완료");
					location = "/admBoardList.do";
				} else {
					alert("수정실패");
				}
			},
			error : function() {
				alert("전송실패");
			}
				
		});
		
	});
	
});

</script>

<body>
<div class="adminTop">
	<%@ include file = "../include/admMenu.jsp" %>
</div>

<div class="adminMain">
	<div>
	<table class="type08" align="center">
		<tr>
			<th style="font-size:20px;">
				공시수정
			</th>
		</tr>
	</table>
	<br>
		<form id="frm" >
		<table class="type08" align="center">
			<input type="hidden" name="unq" value="${boardVO.unq}">
			<caption style="text-align:left;">
			
			</caption>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title" value="${boardVO.title}"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="pass" id="pass"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="writer" id="writer" value="${boardVO.writer}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content">${boardVO.content}</textarea></td>
			</tr>
			<tr>
				<th>구분</th>
				<td><input type="text" name="gubun" id="gubun" value="${boardVO.gubun}"></td>
			</tr>
			<tr>
				<th>조회</th>
				<td>${boardVO.hits}</td>
			</tr>
			<tr>
				<th>등록</th>
				<td>${boardVO.rdate}</td>
			</tr>
			<tr>
				<th>변경</th>
				<td>${boardVO.udate}</td>
			</tr>
		
		</table>
		<br>
		<table align="center" style="width:940px;">
			<tr>
				<th style="font-size:12px;">				
				</th>
			</tr>
			<tr>
				<td align="center">
					<button type="submit" id="btnSave" 
											onclick="return false;">등록</button>
					<button type="reset">취소</button>
				</td>
			</tr>
		</table>
		<p style="height:100px;">&nbsp;</p>

		</form>
		
	</div>
</div>
</body>
</html>