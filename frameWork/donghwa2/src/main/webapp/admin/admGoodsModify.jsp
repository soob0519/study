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
		
		// 제품제목,제품가격 공백체크
		let title = $("#title").val();
		let price  = $("#price").val();
		
		if( title == "" ) {
			alert("제품명을 입력하세요.");
			$("#title").focus();
			return false;
		}
		if( price == "" ) {
			alert("가격을 입력하세요.");
			$("#price").focus();
			return false;
		}

		// 폼 인식
		// let form = $("#frm").serialize(); // 실제 물리적 파일 전송 못함
		let myform = new FormData(document.getElementById('frm'));

		$.ajax({  
			type : "post",
			url  : "/admGoodsUpdate.do",
			data : myform,
			
			processData: false,	// 전송데이터의 인식
	       	contentType: false,	// 전송데이터의 인식
	       	
			datatype : "text",          // "ok", "fail"
			success : function(data) {  // 전송성공
				if(data == "ok") {
					alert("수정완료!!");
					location = "/admGoodsList.do";
				} else if(data == "over") {
					alert("파일 크기가 5메가를 초과했습니다.");
				} else {
					alert("수정실패!!");
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
				제품등록
			</th>
		</tr>
	</table>
	<br>
		<form id="frm" enctype="multipart/form-data">
		
		<input type="hidden" name="cd" value="${defaultVO.cd }">
		<input type="hidden" name="filename" value="${defaultVO.filename }">
		
		<table class="type08" align="center">	
			<caption style="text-align:left;">
				
			</caption>
			<tr>
				<th>제품제목</th>
				<td><input type="text" name="title" id="title" value="${defaultVO.title }"></td>
			</tr>
			<tr>
				<th>제품가격</th>
				<td><input type="text" name="price" id="price" value="${defaultVO.price }"></td>
			</tr>
			<tr>
				<th>제품설명</th>
				<td><textarea name="cont" id="cont">${defaultVO.cont }</textarea></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td><select name="cate" id="cate">
						<option value="1" 
							<c:if test="${defaultVO.cate =='1' }">selected</c:if>>신제품</option>
						<option value="2" 
							<c:if test="${defaultVO.cate =='2' }">selected</c:if>>전문의약품</option>
						<option value="3" 
							<c:if test="${defaultVO.cate =='3' }">selected</c:if>>일반의약품</option>
						<option value="4" 
							<c:if test="${defaultVO.cate =='4' }">selected</c:if>>건강기능식품</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>파일</th>
				<td>
					<input type="file" name="myfile">
					<img src="/upload/${defaultVO.filename }" width="70" height="70">
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