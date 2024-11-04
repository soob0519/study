<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String userno = request.getParameter("userno");
%>
    
<%@ include file = "../include/oracleCon.jsp" %>   

<!-- 상세보기 SQL작성 및 적용 -->
<%
String sql ="SELECT USERNO,USERID,NAME,GENDER,HOBBY,COMM,LEV "
			+" 	FROM friend1 "
			+"	WHERE userno='"+userno+"' ";
ResultSet rs = stmt.executeQuery(sql);

if(!rs.next()){
%>
	<script>
	alert("잘못된 접근입니다.");
	location="index.jsp";
	</script>
<%
	return;
}
%> 

<!-- 출력데이터 세팅 -->
<%
String userid = rs.getString("userid");
String name = rs.getString("name");
String gender = rs.getString("gender");
String hobby = rs.getString("hobby");
String comm = rs.getString("comm");
String lev = rs.getString("lev");
%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>친구등록 화면</title>
  <link rel="stylesheet" href="layout.css"/>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
  
 </head>

<script>
function fn_save(){
	if(document.frm.pass.value == ""){
		alert("암호를 입력해주세요.");
		document.frm.pass.focus();
		return false;
	}
	document.frm.submit();	
}
</script>

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

.span_message {
	color:red;
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
	
	<form name="frm" id="frm" method="post" action="modifySave.jsp">
	
	<table class="table_write">
		<colgroup>
			<col width="22%"/>
			<col width="*"/>
		</colgroup>
		<tr>
			<th>회원번호</th>
			<td>
			<!-- readonly : 읽기전용-->
			<input type="text" name="code" value="<%=userno %>" class="input1" readonly style="width:50%;">
			<span style="margin-left:20px;color:#333333;"></span>
			</td>
		</tr>
		<tr>
			<th><label for="userid">회원ID</label></th>
			<td>
			<input type="text" tabIndex="1" name="userid" value="<%=userid %>" id="userid" class="input1" readonly placeholder="회원ID를 입력해주세요." maxlength="12" autofocus>
				<span id="userid_txt" class="span_message"></span>
			</td>
		</tr>
		<tr>
			<th><label for="pass">암호</label></th>
			<td><input type="password" tabIndex="2" name="pass" id="pass" class="input1" placeholder="암호를 입력해주세요.">
			
			<span id="pass_txt" class="span_message"></span>
			
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" tabIndex="3" name="username" value="<%=name %>" id="username" class="input1" placeholder="회원이름을 입력해주세요.">
			<span id="username_txt" class="span_message"></span>
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" tabIndex="4" name="gender" value="M"
					<% if(gender.equals("M")){out.print("checked");} %>	> 남 
					
				<input type="radio" tabIndex="5" name="gender" value="F"
					<% if(gender.equals("F")){out.print("checked");} %>	> 여
					
				<span id="gender_txt" class="span_message"></span>
			</td>
		</tr>
		<tr>
			<th>등급</th>
			<td>
			
			<select name="level" id="level" size="3" class="select1">
				<option value="S" 
					<% if(lev.equals("S")){out.print("selected");} %> >특별회원</option>
					
				<option value="E" 
					<% if(lev.equals("E")){out.print("selected");} %> >우수회원</option>
				
				<option value="N" 
					<% if(lev.equals("N")){out.print("selected");} %> >일반회원</option>
			
			</select>
			<span id="level_txt" class="span_message"></span>
			</td>
		</tr>		
		<tr>
			<th>취미</th> <!-- hobby = {"영화","골프"}  -->
			<td>
			<input type="checkbox" name="hobby" value="독서" 
				<% if(hobby.contains("독서")){out.print("checked");} %>> 독서
				
			<input type="checkbox" name="hobby" value="운동" 
				<% if(hobby.contains("운동")){out.print("checked");} %>> 운동
				
			<input type="checkbox" name="hobby" value="영화" 
				<% if(hobby.contains("영화")){out.print("checked");} %>> 영화
				
			<input type="checkbox" name="hobby" value="낚시" 
				<% if(hobby.contains("낚시")){out.print("checked");} %>> 낚시
				
			<input type="checkbox" name="hobby" value="골프" 
				<% if(hobby.contains("골프")){out.print("checked");} %>> 골프
			
			<span id="hobby_txt" class="span_message"></span>
			
			</td>
		</tr>
		<tr>
			<th>소개</th>
			<td>
				<textarea name="content" id="content" style="width:98%;height:50px;"><%=comm %></textarea>
			</td>
		</tr>
		<tr>
			<th>증명사진</th>
			<td>
				<input type="file" name="myfile" id="myfile">
			</td>
		</tr>
		<tr>
			<th>등록일자</th>
			<td>
				<input type="text" name="rdate" id="rdate" class="input1">
			</td>
		</tr>
	</table>
	<p align="center">
		<button type="submit" id="btn1" onclick = "fn_save();return false;">수정</button>
		<button type="reset" id="btn2" >취소</button>
	</p>
	</form>

</section>

<footer>

</footer>

 </body>
</html>
