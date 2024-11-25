<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서정보등록</title>
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

function fn_action(){
	
	if(document.frm.deptno.value==""){
		alter("부서번호를 입력해주세요.");
		document.frm.deptno.focus();
		return false;
	}
	
	if(document.frm.dname.value==""){
		alter("부서이름를 입력해주세요.");
		document.frm.dname.focus();
		return false;
	}
	document.frm.submit();
}

</script>


<body>

<c:set var="eng" value="100" />
<c:set var="kor" value="90" />

영어점수 : ${eng } <br>
국어점수 : ${kor }
합계 : ${eng+kor}
<hr>

<c:set var="subject" value="javascript"/>
과목	: ${subject }<br>
길이	: ${fn:length(subject) } <br>
과목2	: ${fn:replace(subject,'java','oracle') }
<hr>

<!-- jstl if문은 else가 없음 -->
<c:if var="result" test="${eng=='100' }">
결과	: ${result }
</c:if>
<br>
<c:if test="${eng=='100' }">
결과	: 맞음
</c:if>
<br>
<c:if test="${eng!='100' }">
결과	: 다름
</c:if>

<hr>

<%
int eng = 100;
if(eng==100){
	out.print("맞음");
}else if(eng!=100){
	out.print("다름");
}
%>

<hr>

<c:forEach var="i" begin="1" end="10">
${i }
</c:forEach>
<br>
<c:forEach var="i" begin="1" end="10" step="2">
${i }
</c:forEach>


<form name="frm" method="post" action="/sample2/deptSave.do">
<table>
	<caption>부서정보등록</caption>
	<tr>
		<th>부서번호</th>
		<td><input type="text" name="deptno" class="input1" maxlength="2" autofoucus></td>
	</tr>
	<tr>
		<th>부서이름</th>
		<td><input type="text" name="dname" class="input1"></td>
	</tr>
	<tr>
		<th>부서위치</th>
		<td><input type="text" name="loc" class="input1"></td>
	</tr>

</table>
<div class="div_button">
<button type="submit" onclick="fn_action();return false;">전송</button>
<button type="reset">취소</button>
</div>
</form>

</body>
</html>