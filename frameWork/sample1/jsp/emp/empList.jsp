<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	font-size:12px;
	font-family:맑은 고딕;
}
table {
	width:600px;
	border:1px solid #ccc;
	border-collapse:collapse; /*셀사이 공간제거*/
}
th,td {
	border:1px solid #ccc;
	padding:7px;
	text-align:center;
}
caption {
	font-size:20px;
	font-weight:bold;
	padding:10px;
}

button {
	padding:10px;
	background-color:pink;
	border-radius:10px;
	border:1px solid orange;
}

.div_button {
	width:600px;
	margin-top:10px;
	text-align:center;
}
.input1 {
	width:96%;
	font-size:12px;
	font-family:맑은 고딕;
}
</style>
<script>
function fn_delete(deptno) {
	if( confirm("정말 삭제하시겠습니까?") ) {  // 확인:true, 취소:false
		location = "/deptDelete.do?deptno="+deptno;
	}
}
</script>
<body>
	<div style="padding:20px;background-color:skyblue;margin-bottom:30px;">
	<a herf="/empWrite.do">등록</a>
	&nbsp;&nbsp;&nbsp;
	<a herf="/empList.do">목록</a>
	</div>
	
	Total : ${total}
	<table>
		<caption>사원정보 목록</caption>
		<colgroup>
			<col width="10%"/>
			<col width="20%"/>
			<col width="20%"/>
			<col width="*"/>
			<col width="15%">
			<col width="15%">
		</colgroup>
		<tr>
			<th>번호</th>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>입사일</th>
			<th>부서명</th>
			<th>삭제</th>
		</tr>
		<%
		for(int i=1; i<12; i++){
			
		}
		%>
		<c:set var="number" value="${recordCountPerPage }"/>
		<%
		int number=17;
		%>
		<c:forEach var="lst" items="${emplist}"  varStatus="status">
			<tr>
				<td>${number}</td>
				<td>${lst.EMPNO}</td>
				<td><a href="/empDetail.do?empno=${lst.EMPNO}">${lst.ENAME}</a></td>
				<td>${lst.HIREDATE}</td>
				<td>${lst.DNAME}</td>
				<td><a href="javascript:fn_delete('${lst.EMPNO}')">del</a></td>
			</tr>
			
			<c:set var="number" value="${number-1}"/>
			
		</c:forEach>
	</table>

	<div style="width:600px;text-align:center;margin-top:10px;">
		<c:forEach var="p" begin="1" end="${totalpage }">
			   <a href="/empList.do?pageIndex=${p}">${p}</a> 
		</c:forEach>
	</div>

</body>
</html>








