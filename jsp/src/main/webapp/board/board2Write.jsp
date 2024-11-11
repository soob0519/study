<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/oracleCon.jsp" %>

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
		if(document.frm.title.value == ""){
			alert("제목를 입력해주세요.");
			document.frm.title.focus();
			return false;
		}
		
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
		분실물
	</div>
	
	<div class="div_agrees">
		<form name="frm" method="post" action="board2WriteSave.jsp">
		<table class="table_member">
			<colgroup>
				<col width="20%"/>
				<col width="*%"/>
			</colgroup>
			<tr>
				<th>제목</th> 
				<td><input type="text" name="title" class="input1"></td>
			</tr>
			<tr>
				<th>암호</th> 
				<td><input type="text" name="pass" class="input1"></td>
			</tr>
			<tr>
				<th>이름</th> 
				<td><input type="text" name="writer" class="input1"></td>
			</tr>
			<tr>
				<th>구분</th> 
				<td>
					<input type="radio" name="gubun" value="1" checked>분실물
					<input type="radio" name="gubun" value="2">습득물
				</td>
				
			</tr>
			<tr>
				<th>내용</th> 
				<td><textarea name="content" class="textarea1"></textarea></td>

			</tr>
			
			
		</table>
		
		<div style="margin-top:10px; text-align:center;">
			<button type="submit" class="button4" onclick="fn_submit();return false;">등록</button>
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
