<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html><html lang="en"><head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>empWrite</title>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>

</head>
  
  <script>
  $( function() {
    
	$( "#hiredate" ).datepicker();
    
    $("#btn_save").click(function(){
    	
    if($("#empno").val() == ""){
    	alert("다시 시도해주세요.");
    	location="/empWrite.do";
    	return false;
    }
    
    if($("#ename").val == ""){
    	alert("이름을 입력해주세요.");
    	$("#ename").focus();
    	return false;
    }
    
    if($("#deptno").val == ""){
    	alert("부서를 선택해주세요.");
    	$("#deptno").focus();
    	return false;
    }
    
    $("#frm").submit();
 	 });
  
  });
    
  </script>
  
<body>
	<div style="padding:20px;background-color:skyblue;margin-bottom:30px;">
	<a herf="/empWrite.do">등록</a>
	&nbsp;&nbsp;&nbsp;
	<a herf="/empList.do">목록</a>
	</div>
<form name="frm" method="post" action="/empSave.do">
	<table border="1" width="600">
		<tr>
			<th width="20%">사원번호</th>
			<td><input type="text" name="empno" id="empno" value="${empno}" readonly></td>
		</tr>
		<tr>
			<th>사원이름</th>
			<td><input type="text" name="ename" id="ename"></td>
		</tr>
		<tr>
			<th>업무</th>
			<td>
				<select name="job" id="job">
				<option value="">-선택-</option>
			<c:forEach var="joblist" items="${joblist}">
				<option value="${joblist.JOB }">${joblist.JOB }</option>
			</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>매니저</th>
			<td>
				<select name="mgr" id="mgr">
				<option value="">-선택-</option>
			<c:forEach var="mgrlist" items="${mgrlist}">
				<option value="${mgrlist.EMPNO }">${mgrlist.ENAME }</option>
			</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>입사일</th>
			<td><input type="text" name="hiredate" id="hiredate"></td>
		</tr>
		<tr>
			<th>급여</th>
			<td><input type="text" name="sal" id="sal"></td>
		</tr>
		<tr>
			<th>커미션</th>
			<td><input type="text" name="comm" id="comm"></td>
		</tr>
		<tr>
			<th>부서</th>
			<td>
				<select name="deptno" id="deptno">
				<option value="">-선택-</option>
			<c:forEach var="deptlist" items="${deptlist}">
				<option value="${deptlist.DEPTNO }">${deptlist.DNAME }</option>
			</c:forEach>
				</select>
			</td>
		</tr>
	</table>
	<div>
		<button type="submit" id="btn_save">저장</button>
	</div>
</form>
</body>
</html>