<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/oracleCon.jsp" %>
<%@ include file="../include/code.jsp" %>

<%
String searchField = request.getParameter("searchField");
String searchText = request.getParameter("searchText");

String Where = " WHERE gubun='"+code+"' ";
if(searchText != null && !searchText.trim().equals("")){
	
	switch(searchField) {
		case "all" 		: Where += " and TITLE LIKE '%"+searchText+"%' OR CONTENT LIKE '%"+searchText+"%' ";
			break;
		case "title" 	: Where += " and TITLE LIKE '%"+searchText+"%' ";
			break;
		case "content" 	: Where += " and CONTENT LIKE '%"+searchText+"%' ";
			break;		
	}
}

String search = "searchField="+searchField+"&"+"searchText"+searchText;

// 출력 페이지 번호
String pageNo = request.getParameter("page");
if(pageNo==null){
	pageNo = "1";
}

// 한 화면당 출력 데이터 개수
int unitData = 10;
// 한 화면당 출력 페이지 개수
int unitPage = 10;

String sql1="SELECT COUNT(*) FROM BOARD2" + Where;
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
int total = rs1.getInt(1);

// 일련번호 초기 세팅
// int number = total - 10(지나간데이터개수)
// 만약 3페이지라면 지나간 데이터 개수는 20개
int rownum = total-(unitData*(Integer.parseInt(pageNo)-1)) ;

// 마지막 페이지 번호
int lastpage = (int)Math.ceil((double)total/unitData);

// 시작데이터값 . 종료데이터값
int sno = (Integer.parseInt(pageNo)-1)*unitData + 1;
int eno = sno+(unitData-1);

String sql2 = "SELECT B.* FROM ( "
				+" 	SELECT ROWNUM RN, A.* FROM ( "
				+" 		SELECT "
				+" 			UNQ,TITLE,WRITER,GUBUN,HITS,to_char(RDATE,'yyyy.mm.dd') RDATE "
				+" 		FROM BOARD2 "
				+ Where
				+" 			ORDER BY UNQ DESC) A ) B "
				+" WHERE "
				+"			RN BETWEEN "+sno+" AND "+eno ;
ResultSet rs2 = stmt.executeQuery(sql2);
%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title><%=msg %> 게시판</title>
  
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
  	<%@ include file="../include/aside.jsp" %>
  </aside>
  
  <section>
  
	<div class="div_title">
		<%=msg %> 게시판
	</div>
	
	<div class="div_search">
	<form name="searchForm" method="post" action="board2List.jsp">
		<select name="searchField" class="select1">
			<option value="all">전체</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="searchText" class="input3">
		<button type="submit" class="button3">검색</button>
	</form>
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
				String writer = rs2.getString("writer");
				String rdate = rs2.getString("rdate");
				String gubun = rs2.getString("gubun");
				String hits = rs2.getString("hits");
		
				String sql3 ="select count(*) from board2sub where punq='"+unq+"'";
				ResultSet rs3 = stmt2.executeQuery(sql3);
				rs3.next();
				int cnt = rs3.getInt(1);
			%>
			<tr>
				<td><%=rownum %></td>
				<td><%=msg %></td>
				<td style="text-align:left;">
				<a href="board2Detail.jsp?code=<%=code%>&unq=<%=unq %>"><%=title %> </a>
				(<%=cnt %>)
				</td>
				<td><%=rdate %></td>
				<td><%=hits %></td>
			</tr>
			
			<%
				rownum--;
			}
			%>
			
			
			
		</table>
		
		<div style="margin-top:10px; text-align:right;">
			<button type="button" class="button4" onclick="location='board2Write.jsp?code=<%=code %>'">글쓰기</button>
		</div>
		
		<div style="margin-top:10px; text-align:center;">
			<a href="board2List.jsp?code=<%=code %>&page=1&<%=search %>" class="num first"> 《 </a>
			<a href="#" class="num bef"> 〈 </a>
			<%
			for(int p=1; p<=lastpage; p++){
			%>
				<a href="board2List.jsp?<%=code %>&page=<%=p %>&<%=search %>" class ="num"> <%=p %> </a>
			<%
			}
			%>
			<a href="#" class="num bef"> 〉 </a>
			<a href="board2List.jsp?<%=code %>&page=<%=lastpage %>&<%=search %>" class="num last"> 》 </a>
		

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
