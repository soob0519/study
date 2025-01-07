<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String code = request.getParameter("code");
String msg = "공지사항";
if( code != null && code.equals("2") ) {
	msg = "자주 묻는 질문";
}
%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title><%=msg %></title>
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
 <%@ include file="../include/boardMenu.jsp" %>
 <!-- top menu E -->
 </nav>
 
 <aside>

 </aside>
 
 <section>
	<div class="div_title">
		<%=msg %>
	</div>
	<div class="div_agrees">
	<form name="frm" method="post" action="board2WriteSave.jsp">
		<table class="table_member">
			<colgroup>
				<col width="20%"/>
				<col width="*"/>
			</colgroup>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" class="input1"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="pass" class="input1"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="writer" class="input1"></td>
			</tr>
			<tr>
				<th>구분</th>
				<td>
					<input type="radio" name="gubun" value="1" 
					<%if(code.equals("1")){ out.print("checked"); } %>>공지사항
					<input type="radio" name="gubun" value="2" 
					<%if(code.equals("2")){ out.print("checked"); } %>>자주 묻는 질문
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" class="textarea1"></textarea></td>
			</tr>
		</table>
		<div style="margin-top:10px; text-align:center;">
			<button type="submit" class="button4" onclick="fn_submit();return false;">등록</button>
			<button type="reset" class="button4">취소</button>
		</div>
	</form>
	</div>
 </section>
 
 <footer>
 <!-- footer S -->
 <%@ include file="../include/footer.jsp" %>
 <!-- footer E -->
 </footer>
  
 </body>
</html>