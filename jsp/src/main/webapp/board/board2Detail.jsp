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
	location="board2List.jsp";
	</script>
<%
	return;
}

String sql2="select count(*) from board2 where unq='"+unq+"'";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt(1);
if(cnt == 0){
%>
	<script>
	alert("잘못된 접근입니다.");
	location="board2List.jsp";
	</script>
<%
	return;
}
%>
<!-- 조회수 증가 -->
<%
String sql3 ="update board2 set hits=hits+1 where unq='"+unq+"' ";
stmt.executeUpdate(sql3);
%>

<!-- 상세보기 SQL 작성/적용 -->
<%
String sql="SELECT title"
			+"		,writer "
			+"		,content "
			+"		,to_char(rdate,'yyyy-mm-dd') rdate "
			+"		,to_char(udate,'yyyy-mm-dd') udate "
			+"		,hits "
			+"	FROM BOARD2 "
			+" where unq='"+unq+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

String title = rs.getString("title");
String writer = rs.getString("writer");
String content = rs.getString("content");
String rdate = rs.getString("rdate");
String udate = rs.getString("udate");
String hits = rs.getString("hits");

if(udate == null){
	udate = "변경없음";
} 

// \n => <br>
content = content.replace("\n", "<br>");

String sql4="select "
			+"		(select nvl(max(unq),0) from board2 where unq <'"+unq+"') bef, "
			+"		(select nvl(min(unq),0) from board2 where unq >'"+unq+"') nex "
			+"	from dual ";
ResultSet rs4 = stmt3.executeQuery(sql4);
rs4.next();

int bef_unq = rs4.getInt(1);
int nex_unq =  rs4.getInt(2);
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
		분실물/습득물
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
				<td><%=title %></td>
			</tr>
			<tr>
				<th>이름</th> 
				<td><%=writer %></td>
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
				<th>변경일</th> 
				<td><%=udate %></td>
			</tr>
			<tr>
				<th>조회수</th> 
				<td><%=hits %></td>
			</tr>
			
			
		</table>
		
		<div>
		<%
		if(bef_unq == 0){
			out.print("<button type=\"button\" onclick=\"alert('이전 글이 없습니다.')\">이전 글</button>");
		}else {
		%>
			<button type="button" onclick="location='board2Detail.jsp?unq=<%=bef_unq%>'">이전 글</button>
		<%
		}
		
		if(nex_unq == 0){
			out.print("<button type=\"button\" onclick=\"alert('다음글 이 없습니다.')\">다음 글</button>");
		} else {
		%>
			<button type="button" onclick="location='board2Detail.jsp?unq=<%=nex_unq%>'">다음 글</button>
		<%
		}
		%>
			
		</div>
		
		
		<div style="margin-top:10px; text-align:center;">
			<button type="button" class="button4"
			 			onclick="location='board2Modify.jsp?unq=<%=unq %>'">수정</button>
			<button type="button" class="button4" 
						onclick="location='pass2Write.jsp?unq=<%=unq %>'">삭제</button>
			<button type="button" class="button4" 
						onclick="location='board2List.jsp'">목록</button>
			
		</div>
		
		<div style="margin-top:20px;">
		<table class="table_member" style="width:100%;">
			<tr>
				<td>
					<textarea name="content" style="width:98%;height:60px;"></textarea>
				</td>
			</tr>
			<tr>
				<td style="text-align:right;">
					<input type="password" name="pass" style="width:30%;height:30px;" placeholder="암호입력">
					<button type="submit" style="height:35px;" class="button4">저장</button>
				</td>
			</tr>
			<tr>
				<td>
				평점
				<input type="radio" name="score" value="1"> 1
				<input type="radio" name="score" value="2"> 2
				<input type="radio" name="score" value="3" checked> 3
				<input type="radio" name="score" value="4"> 4
				<input type="radio" name="score" value="5"> 5
				</td>
			</tr>
		</table>	
		
		
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
