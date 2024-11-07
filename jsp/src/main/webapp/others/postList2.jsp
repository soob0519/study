<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
// 검색관련 세팅 S
String searchField = request.getParameter("searchField");
String searchText  = request.getParameter("searchText");

String Where = ""; 
if( searchText != null && !searchText.trim().equals("") ) {
	switch(searchField) {
		case "zipcode": Where = " WHERE p1='"+searchText+"'";
			break;
		case "addr"   : Where = " WHERE p2 LIKE '%"+searchText+"%' "
							  	+ "  or p3 LIKE '%"+searchText+"%' "
								+ "  or p4 LIKE '%"+searchText+"%' "
								+ "  or p5 LIKE '%"+searchText+"%' "
								+ "  or p6 LIKE '%"+searchText+"%' "
								+ "  or p7 LIKE '%"+searchText+"%' "
								+ "  or p8 LIKE '%"+searchText+"%' ";
			break;
	}
}
//검색관련 세팅 E


// 출력페이지 번호
String pageNo = request.getParameter("page");
if(pageNo == null) {
	pageNo = "1";
}

// 한 화면당 출력 데이터 개수
int unitData = 20;

// 한 화면당 출력 페이지 개수
int unitPage = 10;

String sql1 = "SELECT COUNT(*) FROM POST1 " + Where;
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
int total = rs1.getInt(1);

// 일년번호 초기 세팅
// int number = total - (지나간데이터개수)
int rownum = total-(unitData*(Integer.parseInt(pageNo)-1));

// 마지막 페이지 번호 ( ex) 12 :: 12/10 => ceil(1.2) => (int)2.0 => 2
int lastpage = (int)Math.ceil((double)total/unitData);

// pageNo = "1" -> 1
// pageNo = "2" -> 11
// pageNo = "3" -> 21
//    (2-1)*10+1
int sno = (Integer.parseInt(pageNo)-1)*unitData + 1; 
int eno = sno+(unitData-1);

String sql2 = " SELECT B.* FROM ( "
			+ "     SELECT ROWNUM RN, A.* FROM ( "
	     	+ "        	SELECT   p1 zipcode "
		    + "				    ,p2 || "
		    + "				     p3 || "
		    + "				     p4 || "
			+ "				     p5 || "
			+ "				     p6 || "
			+ "				     p7 || "
			+ "				     p8 addr "
	     	+ "			 FROM  POST1 "
	     	+           Where
			+ "			         ) A ) B "
			+ " WHERE "
			+ "		RN BETWEEN "+sno+" AND "+eno ;

ResultSet rs2 = stmt.executeQuery(sql2);


// pageNo : 1 ~ 10 :: 1
// pageNo : 11~ 20 :: 11
// pageNo : 21~ 30 :: 21

// 15p : 11 ->  (15-1)/10 -> ceil(1.4) -> (1.0*10)+1 -> (int)11.0
// 17p : 11 ->  (17-1)/10 -> ceil(1.6) -> (1.0*10)+1 -> (int)11.0 
// 11p : 11 ->  (11-1)/10 -> ceil(1.0) -> (1.0*10)+1 -> (int)11.0
// 20p : 11 ->  (20-1)/10 -> ceil(1.9) -> (1.0*10)+1 -> (int)11.0
// 33p : 31 ->  (33-1)/10 -> ceil(3.2) -> (3.0*10)+1 -> (int)31.0

double spage1 = (Integer.parseInt(pageNo)-1)/(double)unitPage;  // ex) 3.2
int    spage2 = (int)(Math.floor(spage1)*unitPage)+1;
int    epage  = spage2+(unitPage-1);

// 반복문의 마지막 번호가 라스트페이지번호를 오버했을 경우의 세팅
if( epage > lastpage ) {
	epage = lastpage;
}
%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>우편번호/주소 검색</title>
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
		우편번호/주소 검색
	</div>

	<div class="div_search">
	<form name="searchForm" method="post" action="<%=request.getRequestURI() %>">
		<select name="searchField" class="select1">
			<option value="zipcode">우편번호</option>
			<option value="addr">주소</option>
		</select>
		<input type="text" name="searchText" class="input3">
		<button type="submit" class="button3">검색</button>
	</form>
	</div>

	<div class="div_agrees">
	<table class="table_member">
		<colgroup>
			<col width="10%"/>
			<col width="10%"/>
			<col width="*"  />
		</colgroup>
		<tr>
			<th>번호</th>
			<th>우편번호</th>
			<th>주소</th>
		</tr>
		<%
		while( rs2.next() ) {
			String zipcode = rs2.getString("zipcode");
			String addr = rs2.getString("addr");
		%>
		<tr>
			<td><%=rownum %></td>
			<td><%=zipcode %></td>
			<td><%=addr %></td>
		</tr>
		<%
			rownum--;
		}
		%>
	</table>
	
	<div style="margin-top:10px; text-align:right;">
		<button type="button" class="button4" onclick="location='boardWrite.jsp'">글쓰기</button>
	</div>
	
	<div style="margin-top:10px; text-align:center;">
		<a href="<%=request.getRequestURI() %>?page=1" class="num first">《 </a>
		
		<%if(spage2 == 1) { %>
			<a href="#" class="num bef">〈 </a>
		<%} else if(spage2 > 1) { %>
			<a href="<%=request.getRequestURI() %>?page=<%=spage2-1 %>" class="num bef">〈 </a>
		<%} %>
		
		<%
		for( int p=spage2; p<=epage; p++) {
		%>
			<a href="<%=request.getRequestURI() %>?page=<%=p%>" class="num"><%=p %></a>
		<%
		}
		%>
		
		<%if(epage < lastpage) { %>
			<a href="<%=request.getRequestURI() %>?page=<%=epage+1 %>" class="num bef"> 〉</a>
		<% } else { %>
			<a href="#" class="num bef"> 〉</a>
		<% } %>
		
		<a href="<%=request.getRequestURI() %>?page=<%=lastpage %>" class="num last"> 》 </a>
	</div>
	
	<p style="height:100px;"></p>
	
	</div>
 </section>
 
 <footer>
 <!-- footer S -->
 <%@ include file="../include/footer.jsp" %>
 <!-- footer E -->
 </footer>
  
 </body>
</html>
