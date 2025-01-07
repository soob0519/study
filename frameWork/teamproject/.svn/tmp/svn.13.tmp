<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file = "../../include/oracleCon.jsp" %>

<!-- 파라미터값(unq) 받기 설정 -->
<%
String unq = request.getParameter("unq");
String code = request.getParameter("code");
%>

<!-- 파라미터값의(unq) null 값 체크 -->
<%
if(unq == null || unq.equals("")){

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
  <title>게시글 수정</title>
  <link rel="stylesheet" href="../../css/myPageBoard.css"/>  <!-- 외부 css파일 불러오는 태그 -->
 </head>
 
 <script>
function fn_submit() {
 	let userid = document.frm.title.value;
	let pass = document.frm.pass.value;
	if(userid == ""){
		alert("제목을 입력해 주세요.");
		document.frm.title.focus();
		return false;
	}
	if(pass == ""){
		alert("암호를 입력해 주세요.");
		document.frm.pass.focus();
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
		<%@ include file = "../../include/header.jsp" %>
		<!-- header End -->
	</header>
	<nav>
		<!-- Top Menu Start -->
		<%@ include file = "../../include/topMenu.jsp" %>
		<!-- Top Menu End -->
	</nav>
	
<!-- unq 값의 존재여부 체크 -->
<%
String sql2 = "SELECT COUNT(*) FROM board2 WHERE unq = '"+unq+"'";
ResultSet rs2 = stmt2.executeQuery(sql2);
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

<!-- 수정처리 할 SQL 작성 및 적용 -->
<%
String sql = "SELECT title,writer,content,to_char(rdate,'yyyy.mm.dd') rdate,hits,lev FROM board2 WHERE userid='"+SessionUserid+"' AND unq='"+unq+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

String title 	= rs.getString("title");
String writer 	= rs.getString("writer");
String content 	= rs.getString("content");
String rdate 	= rs.getString("rdate");
String hits	 	= rs.getString("hits");
int lev	 		= rs.getInt("lev");

// 사용자가 글 작성 시, 내용(content)에 줄바꿈(\n) 했더라도, 브라우저에서는 \n 을 인식하지 못한다.★★★
// 즉 \n 을 <br> 태그로 바꿔야 브라우저에서도 줄바꿈이 적용된다.★★★
// \n 은 콘솔(이클립스)에서 줄바꿈 시 사용하는 문자인데, "줄바꿈 처리 된 후" 브라우저상의 보게되면 <br> 태그가 사용자화면에 노출되서 '수정' 페이지에서는 아래 코드를 사용하지 않는다.
// content = content.replace("\n","<br>");
%>
	
	<section>
		<div class="divTitle">
			게시글 수정
		</div>
		<div class="div_agrees">
		<form name="frm" method="post" action="boardModifySave.jsp?code=<%=code%>&userid=<%=SessionUserid%>">
		
		<input type="hidden" name="unq" value="<%=unq %>">
		
		<table class="table_member">
			<colgroup>
				<col width="20%"/>
				<col width="*"/>			
			</colgroup>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="<%=title %> "class="input1"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="pass" class="input1" placeholder="글 작성 시 입력한 암호를 입력해 주세요."></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="writer" value="<%=writer %>" class="input1"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" class="textarea1"><%=content %></textarea></td>
			</tr>
			<tr>
			<%if(code.equals("1")){ %>
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
			<%
			}
			%>
		</table>
			<div style="margin-top:10px; text-align:center;">
				<button type="submit" class="button4" onclick="fn_submit(); return false;">수정</button>
				<button type="reset" class="button4" onclick="">취소</button>
			</div>
		</form>
		</div>
	</section>
	<footer>
		<!-- footer Start -->
		<%@ include file = "../../include/footer.jsp" %>
		<!-- footer End -->
	</footer>
 </body>
</html>
