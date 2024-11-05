<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/oracleCon.jsp" %>

<%
String sql1="SELECT COUNT(*) FROM NBOARD";
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
int total = rs1.getInt(1);

String sql2 = "SELECT UNQ,TITLE,NAME,HITS,to_char(RDATE,'yyyy.mm.dd') RDATE FROM NBOARD "
				+" ORDER BY UNQ DESC ";
ResultSet rs2 = stmt.executeQuery(sql2);
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
  aside영역
  </aside>
  
  <section>
  
	<div class="div_title">
		공지사항
	</div>
	
	<div class="div_search">
		<select name="" class="select1">
			<option value="">전체</option>
			<option value="">공지</option>
			<option value="">소식</option>
		</select>
		<input type="text" name="" class="input3">
		<button type="submit" class="button3">검색</button>
	</div>
	
	<div class="div_agrees">
		
		<table class="table_member">
			<colgroup>
				<col width="10%"/>
				<col width="15%"/>
				<col width="40%"/>
				<col width="20%"/>
				<col width="*"/>
			</colgroup>
			<tr>
				<th>번호</th> 
				<th>구분</th>
				<th>제목</th>
				<th>날짜</th>
				<th>조회</th>
			</tr>
			
			<%
			while(rs2.next()){
				String unq = rs2.getString("unq");
				String title = rs2.getString("title");
				String name = rs2.getString("name");
				String rdate = rs2.getString("rdate");
				String hits = rs2.getString("hits");
			%>
			<tr>
				<td>968</td>
				<td>업데이트</td>
				<td style="text-align:left;"><a href="boardDetail.jsp?unq=<%=unq %>"><%=title %></a></td>
				<td><%=rdate %></td>
				<td><%=hits %></td>
			</tr>
			
			<%
			}
			%>
			
			
			
		</table>
		
		<div style="margin-top:10px; text-align:right;">
			<button type="button" class="button4" onclick="location='boardWrite.jsp'">글쓰기</button>
		</div>
		
		<div style="margin-top:10px; text-align:center;">
			<a href="#" class="num first"> << </a>
			<a href="#" class="num bef"> < </a>
			<a href="#" class="num"> 1 </a>
			<a href="#" class="num"> 2 </a>
			<a href="#" class="num on"> 3 </a>
			<a href="#" class="num"> 4 </a>
			<a href="#" class="num"> 5 </a>
			<a href="#" class="num bef"> > </a>
			<a href="#" class="num last"> >> </a>
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
