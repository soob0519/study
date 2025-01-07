<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터값(unq) 받기 설정 -->
<%
 String unq = request.getParameter("unq");
%>

<!-- 파라메터값(unq)의 널값 체크 -->
<%
 if( unq == null || unq.equals("") ) {
%>
		<script>
		alert("잘못된 접근!!");
		location = "boardList.jsp";
		</script>
<%  
	 return;
 }
%>


<!-- unq값의 존재 여부 -->
<%
String sql2 = "select count(*) from nboard where unq='"+unq+"'";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt(1);
if( cnt == 0 ) {
%>
		<script>
		alert("잘못된 접근!!");
		location = "boardList.jsp";
		</script>
<% 
		return;
}
%>

<!-- SQL작성 및 적용 -->

<%
 String sql = " select title,name,content,to_char(rdate,'yyyy-mm-dd') rdate,hits from nboard "
		    + "  where unq='"+unq+"'";
 ResultSet rs = stmt.executeQuery(sql);
 rs.next();
 
 String title   = rs.getString("title");
 String name    = rs.getString("name");
 String content = rs.getString("content");
 String rdate   = rs.getString("rdate");
 String hits    = rs.getString("hits");
 
 //  "\n" -----> <br>
 // content = content.replace("\n","<br>");
 %>
 
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>일반게시판</title>
 <link rel="stylesheet" href="../css/style.css" />
 </head>
 
 <script>
 function fn_submit() {
	 if(document.frm.title.value == "") {
		 alert("제목을 입력해주세요.");
		 document.frm.title.focus();
		 return false;
	 }
	 if(document.frm.pass.value == "") {
		 alert("암호를 입력해주세요.");
		 document.frm.pass.focus();
		 return false;
	 }
	 document.frm.submit();
 }
 </script>

 <style>
  td {
  	text-align:left;
  }
  .textarea1 {
  	width:72%;
  	height:100px;
  }
 </style>
 
 <body>
  
 <header>

 </header>
 
 <nav>
  <!-- top menu S -->
 <%@ include file="../include/boadrMenu.jsp" %>
 <!-- top menu E -->
 </nav>
 
 <aside>
	aside영역
 </aside>
 
 <section>

	<div class="div_title">
		공지사항
	</div>

	<div class="div_agrees">
	
	<form name="frm" method="post" action="boardModifySave.jsp">
	
		<input type="hidden" name="unq" value="<%=unq %>">
		
		<table class="table_member">
			<colgroup>
				<col width="20%"/>
				<col width="*"/>
			</colgroup>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" class="input1" value="<%=title %>"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="pass" class="input1"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" class="input1" value="<%=name %>"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" class="textarea1"><%=content %></textarea></td>
			</tr>
		</table>
		<div style="margin-top:10px; text-align:center;">
			<button type="submit" class="button4" onclick="fn_submit();return false;">수정</button>
			<button type="reset" class="button4">취소</button>
		</div>
		
	</form>
	
	</div>
	
 </section>
 
 <footer>

 </footer>
  
 </body>
</html>
