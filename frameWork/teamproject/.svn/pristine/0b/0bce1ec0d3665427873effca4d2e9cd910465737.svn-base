<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
-- 참조: 제약조건 삭제 SQL
alter table board2 drop constraint SYS_C007663;
-->
<%@ include file = "code.jsp" %>
 
<%
//String code = request.getParameter("code");
//String msg = "분실물";
//if(code != null && code.equals("2")){
//	msg = "습득물";
//} else if(code != null && code.equals("3")) {
//	msg = "보관함";	
//}
%>
    
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title><%=msg %></title>
  <link rel="stylesheet" href="myPageBoard.css?after"/>  <!-- 외부 css파일 불러오는 태그 (게시판전용) -->
 </head>
 
 <script>
function fn_submit() {
 	let title = document.frm.title.value;
	let pass = document.frm.pass.value;
	let writer = document.frm.writer.value;
	let content = document.frm.content.value;
	if(title == ""){
		alert("제목을 입력해 주세요.");
		document.frm.title.focus();
		return false;
	}
	if(pass == ""){
		alert("암호를 입력해 주세요.");
		document.frm.pass.focus();
		return false;	 	 
 	}
	if(writer == ""){
		alert("이름을 입력해 주세요.");
		document.frm.writer.focus();
		return false;	 	 
 	}
	if(content == ""){
		alert("내용을 입력해 주세요.");
		document.frm.content.focus();
		return false;	 	 
 	}
	document.frm.submit();
}
 </script>
 
 <style>
 td {
 	text-align: left;
 	color: skyblue;
 }
 .textarea1 {
 	width: 72%;
 	height: 200px;
 }
 </style>

 <body>
 	<header>
 		<!-- header Start -->
		<%@ include file = "header.jsp" %>
		<!-- header End -->
	</header>
	<nav>
		<!-- Top Menu Start -->
		<%@ include file = "topMenu.jsp" %>
		<!-- Top Menu End -->
	</nav>
	<section>
		<div class="divTitle">
			<%=msg %>
		</div>
		<div class="div_agrees">
		<form name="frm" method="post" action="boardWriteSave.jsp">
		<table class="table_member">
			<colgroup>
				<col width="20%"/>
				<col width="*"/>			
			</colgroup>
			<tr>
				<td>
					<input type="hidden" name="gubun" 
					<%if(code.equals("1")){
						out.print("value='1'");
					} else if(code.equals("2")){
						out.print("value='2'");
					}
					%>>
				</td>
			</tr>
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
				<th>내용</th>
				<td><textarea name="content" class="textarea1"></textarea></td>
			</tr>
			<tr>
				<th>평점</th>
				<td>
					<input type="radio" name="lev" value="1">1
					<input type="radio" name="lev" value="2">2
					<input type="radio" name="lev" value="3" checked>3
					<input type="radio" name="lev" value="4">4
					<input type="radio" name="lev" value="5">5
				</td>
			</tr>
		</table>
			<div style="margin-top:10px; text-align:center;">
				<button type="submit" class="button4" onclick="fn_submit(); return false;">등록</button>
				<button type="reset" class="button4" onclick="">취소</button>
			</div>
		</form>
		</div>
	</section>
	<footer>
		<!-- footer Start -->
		<%@ include file = "footer.jsp" %>
		<!-- footer End -->
	</footer>
 </body>
</html>
