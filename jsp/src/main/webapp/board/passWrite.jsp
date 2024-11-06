<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/oracleCon.jsp" %>

<%
String unq = request.getParameter("unq");
if(unq==null || unq.equals("")){
%>
	<script>
	alert("잘못된 접근입니다.");
	location="boardList.jsp";
	</script>
<%
	return;
}

String sql2="select count(*) from nboard where unq='"+unq+"'";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt(1);
if(cnt == 0){
%>
	<script>
	alert("잘못된 접근입니다.");
	location="boardList.jsp";
	</script>
<%
	return;
}
%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
  
  <link rel="stylesheet" href="../css/style.css" />
  <link rel="stylesheet" href="../css/board.css" />
 </head>
 
 <style>
 td {
 	text-align :left;
 }
 
 .textarea1 {
 	width:72%;
 	height:100px;
 }
 
 </style>
 
<script>
	function fn_submit(){
		if(document.frm.pass.value == ""){
			alert("암호를 입력해주세요.");
			document.frm.pass.focus();
			return false;
		}
		document.frm.submit();	
	}
</script>

 <body>
  
  <header>
  	<!-- header S -->
	<%@ include file="../include/header.jsp" %>
	<!-- header E -->
  </header>
  
  <nav>
	<!-- top menu S -->
	<%@ include file="../include/topMenu.jsp" %>
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
		<form name="frm" method="post" action="boardDelete.jsp">
		<input type="hidden" name="unq" value="<%=unq %>">
		<table class="table_member">
			<colgroup>
				<col width="20%"/>
				<col width="*%"/>
			</colgroup>
			<tr>
				<th>암호</th> 
				<td><input type="text" name="pass" class="input1"></td>
			</tr>		
			
		</table>
		
		<div style="margin-top:10px; text-align:center;">
			<button type="submit" class="button4" onclick="fn_submit();return false;">삭제</button>
			<button type="reset" class="button4" onclick="">취소</button>
			
		</div>
		</form>
		
		<div style="margin-top:10px; text-align:center;">
			
		</div>	
		
	</div>
	
  </section>
  
  <footer>
 	<!-- footer S -->
	<%@ include file="../include/footer.jsp" %>
	<!-- footer E -->
  </footer>  
  
 </body>
</html>
