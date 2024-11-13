<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/oracleCon.jsp" %>
<%@ include file="../include/code.jsp" %>

<%
String unq = request.getParameter("unq");
String tbl = request.getParameter("tbl");

if(unq==null || unq.equals("")){
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
  <title><%=msg %></title>
  
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
  <%@ include file="../include/aside.jsp" %>
  </aside>
  
  <section>
  
	<div class="div_title">
		<%=msg %>
	</div>
	
	<div class="div_agrees">
		<form name="frm" method="post" action="<%=url1 %>">
		<input type="hidden" name="unq" value="<%=unq %>">
		<input type="hidden" name="code" value="<%=code %>">
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
