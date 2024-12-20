<%@ page language="java" contentType="text/html; charset=UTF-8"
    											pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<script>

function fn_del(cd,filename) {
	if( confirm("정말 삭제하시겠습니까?") ) {
		$.ajax({ 
			type : "post",
			url  : "/admGoodsDelete.do",
			data : "cd="+cd+"&filename="+filename,
			datatype : "text",
			success : function(data) {  // ok, fail
				if( data == "ok" ) {
					alert("삭제성공");
					location = "/admGoodsList.do";
				} else {
					alert("삭제실패");
				}
			},
			error : function() {
				alert("오류!!");
			}
		});
	}
}
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
				제품목록
			</th>
		</tr>
	</table>
	<br>
		
		<table class="type08" align="center">
			<caption style="text-align:left;">
				Total : ${total }개
			</caption>
			<tr>
				<th width="10%">번호</th>
				<th width="50%">상품이름</th>
				<th width="10%">카테고리</th>
				<th width="10%">가격</th>
				<th width="10%">파일</th>
				<th width="10%">버튼</th>
			</tr>
		<c:forEach var="st"  items="${list }"  >
			<tr align="center">
				<td>${recordCount}</td>
				<td align="left">&nbsp;
		<a href="/admGoodsModify.do?cd=${st.CD }">${st.TITLE}</a>
				</td>
				<td>${st.CATE}</td>
				<td>${st.PRICE}</td>
				<td>
				
				<c:if test="${st.FILENAME !=null }">
					<a href="/upload/${st.FILENAME }" target="_blank"><img src="/images/icon12.png" width="20" height="20"></a>
				</c:if>
				
				</td>
				<td>
					<button type="button" onclick="fn_del('${st.CD }','${st.FILENAME }')">삭제</button>
				</td>
			</tr>
			<c:set var="recordCount" value="${recordCount-1}"/>
		</c:forEach>	

		</table>
		<br>
		
		<table align="center" style="width:940px;">
			<tr>
				<th style="font-size:12px;">
				
		<c:forEach var="p" begin="1" end="${totalpage}">
					<a href="/admBoardList.do?pageIndex=${p}">${p }</a>
		</c:forEach>

				</th>
			</tr>
			<tr>
				<td	align="right">
					<button type="button" 
							onclick="location='/admGoodsWrite.do'">등록</button>
				</td>
			</tr>
		</table>
		<p style="height:100px;">&nbsp;</p>

	</div>
</div>
</body>
</html>