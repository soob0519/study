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
  
<script>
  
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
				관리자목록
			</th>
		</tr>
	</table>
	<br>
	
		<span style="margin-left:130px;">Total : ${total }개 </span><br>
		<table class="type08" align="center" style="text-align:center;">
			<tr>
				<th width="10%">번호</th>
				<th width="20%">아이디</th>
				<th width="20%">이름</th>
				<th width="20%">생일</th>
				<th width="20%">등급</th>
				<th width="10%">상태</th>
			</tr>
			
		<c:forEach var="st" items="${list}">
			<tr>
				<td>${recordCount }</td>
				<td>${st.USERID }</td>
				<td>${st.USERNAME }</td>
				<td>${st.BIRTH }</td>
				<td>${st.GRADE }</td>
				<td>
				<c:if test="${st.STATE == '1' }">
					<span style="color:green;font-weight:bold;">근무</span>
				</c:if>
				<c:if test="${st.STATE == '2' }">
					<span style="color:red;font-weight:bold;">퇴사</span>
				</c:if>
				</td>
			</tr>
			<c:set var="recordCount" value="${recordCount-1 }" />
		</c:forEach>	
		
		</table>
		<br>
		<table align="center" style="width:940px;">
			<tr>
				<th style="font-size:12px;">
		<c:forEach var="p" begin="1" end="${totalpage }">
					<a href="admList.do?pageIndex=${p }">${p }</a>
		</c:forEach>				
				</th>
			</tr>
		</table>
		<p style="height:100px;">&nbsp;</p>

	</form>
	</div>
</div>
</body>
</html>