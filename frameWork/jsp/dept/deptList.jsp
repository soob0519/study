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
	border-collapse:collapse;
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

button{
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

.input1{
	width:98%;
	font-size:12px;
	font-family:맑은 고딕;
}

</style>

<script>
function fn_delete(deptno){
		
	if(confirm("정말 삭제하시겠습니까?")){
		location = "/sample2/deptDelete.do?deptno="+deptno;
	}
	
}

</script>


<body>
	
	Total : ${total}
	<table>
		<caption>부서정보목록</caption>
		<colgroup>
			<col width="10%"/>
			<col width="20%"/>
			<col width="30%"/>
			<col width="*%"/>
			<col width="10%">
		</colgroup>
		<tr>
			<th>번호</th>
			<th>부서번호</th>
			<th>부서이름</th>
			<th>부서위치</th>
			<th>삭제</th>
		</tr>
		
		<c:set var="number" value="${total }" />
		
		<c:forEach var="lst" items="${deptlist}" varStatus="status">
		<!-- items :: 자바에서 올린것을 받는 속성 var(내부변수명) :: var에 적힌 이름으로 사용/ 사용할때 이용되는 변수 -->
		<tr>
			<td>${number }</td>
			<td>${lst.DEPTNO }</td>
			<td><a href="/sample2/deptModify.do?deptno=${lst.DEPTNO }">${lst.DNAME }</a></td>
			<td>${lst.LOC }</td>
			<td><a href="javascript:fn_delete('${lst.DEPTNO}')">del</a></td>
		</tr>
		
		<c:set var="number" value="${number-1 }" />
		
		</c:forEach>
		
		
	</table>

	<div>
	</div>
	

</body>
</html>