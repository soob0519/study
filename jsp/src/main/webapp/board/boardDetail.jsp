<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/oracleCon.jsp" %>
<!-- 파라메터 설정 -->
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
<!-- 조회수 증가 -->
<%
String sql3 ="update nboard set hits=hits+1 where unq='"+unq+"' ";
stmt.executeUpdate(sql3);
%>

<!-- 상세보기 SQL 작성/적용 -->
<%
String sql="SELECT title,name,content,to_char(rdate,'yyyy-mm-dd') rdate ,hits FROM NBOARD "
			+" where unq='"+unq+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

String title = rs.getString("title");
String name = rs.getString("name");
String content = rs.getString("content");
String rdate = rs.getString("rdate");
String hits = rs.getString("hits");

// \n => <br>
content = content.replace("\n", "<br>");

%>

<!-- 화면출력 -->
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
		공지사항
	</div>
	
	<div class="div_agrees">
		<form name="frm" method="post" action="boardWriteSave.jsp">
		<table class="table_member">
			<colgroup>
				<col width="20%"/>
				<col width="*%"/>
			</colgroup>
			<tr>
				<th>제목</th> 
				<td><%=title %></td>
			</tr>
			<tr>
				<th>이름</th> 
				<td><%=name %></td>
			</tr>
			<tr>
				<th>내용</th> 
				<td>
					<div style="width:98%;
								height:150px;
								padding-left:10px;
								background-color:yellow;
								overflow-y:scroll;"><%=content %></div>
				</td>
			</tr>
			<tr>
				<th>등록일</th> 
				<td><%=rdate %></td>
			</tr>
			<tr>
				<th>조회수</th> 
				<td><%=hits %></td>
			</tr>
			
			
		</table>
		
		<div style="margin-top:10px; text-align:center;">
			<button type="button" class="button4"
			 			onclick="location='boardModify.jsp?unq=<%=unq %>'">수정</button>
			<button type="button" class="button4" 
						onclick="location='passWrite.jsp?code=100&unq=<%=unq %>'">삭제</button>
			<button type="button" class="button4" 
						onclick="location='boardList.jsp'">목록</button>
			
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
