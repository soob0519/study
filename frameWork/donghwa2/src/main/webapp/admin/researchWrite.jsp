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
	$("#sdate").datepicker();
	$("#edate").datepicker();
	
	$("#btnSave").click(function(){ 
		
		// 제목 공백체크
		let title = $("#title").val();
		
		if( title == "" ) {
			alert("제목을 입력하세요.");
			$("#title").focus();
			return false;
		}
		
		let size = document.getElementsByName("ans").length;
		let cnt = 0;
		for(let i=0; i< size; i++){
			let ans = document.getElementsByName("ans")[i].value;
			if(ans != "" ){
				cnt++;
			}
		}
		
		if(cnt == 0){
			alert("항목을 한개 이상 입력해주세요.");
			return false;
		}
		
		// 폼 인식
		let form = $("#frm").serialize();
		// 비동기 전송기능
		$.ajax({  
			type : "post",
			url  : "/researchInsert.do",
			data : form,
			datatype : "text",          // "ok", "fail"
			success : function(data) {  // 전송성공
				if(data == "ok") {
					alert("저장완료!!");
					location = "/researchList.do";
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
				설문 등록
			</th>
		</tr>
	</table>
	<br>
		<form id="frm" >
		<table class="type08" align="center">	
			<caption style="text-align:left;">
				
			</caption>
			<tr>
				<th>설문 제목</th>
				<td>
					<textarea name="title" id="title"></textarea>
				</td>
			</tr>
			
<%
for(int i=1; i<=10; i++){
%>
			<tr>
				<th>항목<%=i %></th>
				<td><input type="text" name="ans" id="ans"></td>
			</tr>
<%
}
%>
			<tr>
				<th>기간</th>
				<td><input type="text" name="sdate" id="sdate" style="width:200px;">
				 ~ <input type="text" name="edate" id="edate" style="width:200px;"></td>
			</tr>
			<tr>
				<th>상태</th>
				<td>
					<select name="state" id="state" style="width:200px;">
						<option value="1">준비</option>
						<option value="2">진행</option>
						<option value="3">종료</option>
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