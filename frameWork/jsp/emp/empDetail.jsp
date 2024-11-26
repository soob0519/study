<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html><html lang="en"><head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>상세보기</title>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>

</head>
  
  <script>
  $( function() {
    
	$("#btn1").click(function(){
		location="/empList.do";
	});
	
	$("#btn2").click(function(){
		location="/empModify.do?empno=${empvo.empno}";
	});
	
	$("#btn3").click(function(){
		if( confirm("삭제하시겠습니까?") ){
			location="/empDelete.do?empno=${empvo.empno}";	
		}
	});
  
  });
    
  </script>
  
<body>
	<div style="padding:20px;background-color:skyblue;margin-bottom:30px;">
	<a herf="/empWrite.do">등록</a>
	&nbsp;&nbsp;&nbsp;
	<a herf="/empList.do">목록</a>
	</div>
	<table border="1" width="600">
		<tr>
			<th width="20%">사원번호</th>
			<td>${empvo.empno }</td>
		</tr>
		<tr>
			<th>사원이름</th>
			<td>${empvo.ename }</td>
		</tr>
		<tr>
			<th>업무</th>
			<td>${empvo.job }</td>
		</tr>
		<tr>
			<th>매니저</th>
			<td>${empvo.mgrname }(${empvo.mgr })</td>
		</tr>
		<tr>
			<th>입사일</th>
			<td>${empvo.hiredate }</td>
		</tr>
		<tr>
			<th>급여</th>
			<td>${empvo.sal }</td>
		</tr>
		<tr>
			<th>커미션</th>
			<td>${empvo.comm }</td>
		</tr>
		<tr>
			<th>부서</th>
			<td>${empvo.dname }(${empvo.deptno })</td>
		</tr>
	</table>
	<div style="width:600px;text-align:center;margin-top:30px;">
		<button type="button" id="btn1">목록</button>
		<button type="button" id="btn2">수정</button>
		<button type="button" id="btn3">삭제</button>
	</div>

</body>
</html>