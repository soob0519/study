<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 파라메터 값 설정 -->    
<%
String userno = request.getParameter("userno");
%>
<!-- DB설정 및 연결 -->
<%@ include file = "../include/oracleCon.jsp" %>

<!-- SQL작성 및 적용 -->
<%
String sql = "select ";
%>
    
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>친구등록 화면</title>
  <link rel="stylesheet" href="layout.css"/>
 </head>

<style>
table.table_write {
	margin:auto;
	width:700px;
	border-collapse:collapse;
}
.table_write th,td {
	padding:5px;
	border:1px solid #646464;
}
.table_write th {
	background-color:#65987d;
	color:#ffcc99;
}
.table_write tr:hover {
	background-color:#99d2ac;
}

.input1 {
	width:97%;
	padding:5px;
}
.select1 {
	width:30%;
}

button {
	padding:10px;
	font-size:16px;
}

</style>

<body>

<header>
친구관리
</header>

<nav>
<%@ include file="../include/friendMenu.jsp" %>
</nav>

<section>

	<p id="title"> <br> 친구등록 </p>
	
	<form name="frm">
	
	<table class="table_write">
		<colgroup>
			<col width="22%"/>
			<col width="*"/>
		</colgroup>
		<tr>
			<th>회원번호</th>
			<td>
			<input type="text" name="" value="1006" class="input1" readonly style="width:50%;">
			<span style="margin-left:20px;color:#333333;">회원번호는 변경할 수 없습니다.</span>
			</td>
		</tr>
		<tr>
			<th>회원ID</th>
			<td><input type="text" name="" value="hong" class="input1" placeholder="회원ID를 입력해주세요."></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="" value="홍길동" class="input1" placeholder="회원이름을 입력해주세요."></td>
		</tr>
		<tr>
			<th>등급</th>
			<td>
			
			<select size="3" class="select1">
				<option value="특별회원">특별회원</option>
				<option value="우수회원" selected>우수회원</option>
				<option value="일반회원">일반회원</option>
			</select>
			
			</td>
		</tr>		
		<tr>
			<th>취미</th>
			<td>
			<input type="checkbox" name="" value="" checked> 독서
			<input type="checkbox" name="" value="" checked> 운동
			<input type="checkbox" name="" value=""> 영화
			</td>
		</tr>
		
		
		<tr>
			<th>등록일자</th>
			<td>
			<input type="date" class="input1" value="2024-05-05">
			</td>
		</tr>
	</table>
	<p align="center">
		<button type="submit">등록</button>
		<button type="button">조회</button>
	</p>
	</form>

</section>

<footer>

</footer>

 </body>
</html>
