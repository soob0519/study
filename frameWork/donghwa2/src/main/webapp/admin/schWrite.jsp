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

<style>
	.overflow {
	  height: 300px;
	}
</style>



<script>

$(function(){
	
	$("#schdt1").datepicker();
	$("#schdt2").selectmenu();
	$("#schdt2").selectmenu()
    			.selectmenu( "menuWidget" )
     			.addClass( "overflow" );
	
	$("#btnSave").click(function(){ 
		
		// 제목,암호의 공백체크
		let title = $("#title").val();
		let schdt1  = $("#schdt1").val();
		let schdt2  = $("#schdt2").val();
		let userid  = $("#userid").val();
		let cont  = $("#cont").val();
		
		if( title == "" ) {
			alert("제목을 입력하세요.");
			$("#title").focus();
			return false;
		}
		if( schdt1 == "" ) {
			alert("날짜를 입력하세요.");
			$("#schdt1").focus();
			return false;
		}
		
		// 2024-12-09 09:30
		let schdt = schdt1+" "+schdt2+":00";
		
		// 폼 인식
		// let form = $("#frm").serialize();
		
		// JSON 타입
		let sendData = {
				'title' : title,
				'userid' : userid,
				'cont' : cont,
				'schdt' : schdt
				
		}
		
		// 비동기 전송기능
		$.ajax({  
			type : "post",
			url  : "/schSave.do",
			data : sendData,
			datatype : "text",          // "ok", "fail"
			success : function(data) {  // 전송성공
				if(data == "ok") {
					alert("저장완료!!");
					location = "/schList.do";
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
				일정
			</th>
		</tr>
	</table>
	<br>
		<form id="frm" >
		<table class="type08" align="center">	
			<caption style="text-align:left;">
				
			</caption>
			<tr>
				<th>일정날짜</th>
				<td>
					<input type="text" name="schdt1" id="schdt1" style="width:235px;margin-bottom:3px;">
					<br>
					<select name="schdt2" id="schdt2" style="width:200px;">
					<%
					for(int t1=0; t1<=23; t1++){
						String t2 = "";
						if(t1<10) t2 = "0"+t1;
						else t2 = ""+t1;
					%>
						<option value="<%=t2 %>:00"><%=t2 %>:00</option>
						<option value="<%=t2 %>:30"><%=t2 %>:30</option>
					<%
					}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="userid" id="userid"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="cont" id="cont"></textarea></td>
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