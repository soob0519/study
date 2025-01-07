<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../include/oracleCon.jsp" %>

<%
// 세션검사(로그인 상태인지 체크하는 코드)
// 세션타입이라서 문자타입으로 만들어야한다. (스트링 괄호붙이거나, 뒤에 공백 붙여서 문자타입으로 만들기.)
String SessionUserid = (String)session.getAttribute("SessionUserid");		// 로그인 하지 않으면 null 값이 된다.
// 또는 String SessionUserid = session.getAttribute("SESSION_ID")+"";
%>

<%
String searchField = request.getParameter("searchField");
String searchText  = request.getParameter("searchText");

String Where = ""; 

if( searchText != null && !searchText.trim().equals("") ) {
	switch(searchField) {
	case "all"     : Where += " WHERE TITLE LIKE '%"+searchText+"%' OR CONTENT LIKE '%"+searchText+"%' ";
		break;
	case "title"   : Where += " WHERE TITLE LIKE '%"+searchText+"%' ";
		break;
	case "content" : Where += " WHERE CONTENT LIKE '%"+searchText+"%' ";
		break;
	}
}

String search = "";
if(searchText == null || searchText.equals("")){
	search = "";
} else {
	search = "searchField="+searchField+"&searchText="+searchText;
}

// 출력페이지 번호
String pageNo = request.getParameter("page");
if(pageNo == null ){
	pageNo= "1";
}
// 한 화면당 출력 데이터 개수
int unitDate = 10;

// 한 화면당 출력 페이지 개수
int unitPage = 10;

String sql1 = "SELECT COUNT(*) FROM QBOARD";
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
int total = rs1.getInt(1);

// 일년번호 초기 세팅
// int number = total - (지나간 데이터개수)
int rownum = total - (unitDate*(Integer.parseInt(pageNo)-1));

// 마지막 페이지 번호 ( ex) 12 :: 12/10 = ceil(1.2) => (int)2.0 => 2
int lastpage =(int) Math.ceil((double)total/unitDate);

// pageNo = "1" -> 1
// pageNo = "2" -> 11
//		(2-1)*10+1
int sno = (Integer.parseInt(pageNo)-1)*unitDate+1;
int eno = sno+(unitDate-1);

//String sql2 = " SELECT UNQ,TITLE,NAME,HITS,to_char(RDATE,'yyyy.mm.dd') RDATE FROM NBOARD "
//		+ "  ORDER BY UNQ DESC";

String sql2 =" SELECT B.* FROM ("
			+"	SELECT ROWNUM RN, A.* FROM("
			+"		SELECT"
			+"			 UNQ,TITLE,NAME,HITS,to_char(RDATE,'yyyy.mm.dd') RDATE"
			+"		FROM QBOARD"
			+ Where
			+"		ORDER BY UNQ DESC ) A ) B"
			+" WHERE"
			+"	RN BETWEEN "+sno+" AND "+eno ;
ResultSet rs2 = stmt.executeQuery(sql2);

%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>일반게시판</title>
  <link rel="stylesheet" href="../css/style.css" />
 </head>

 <style>
 
 </style>
 
 <body>
  
 <header>

 </header>
 
 <nav>
 	<div>
		<table>
				<tr>
					<th><a href="/main.jsp">홈</a></th>
					<%
					if(SessionUserid == null){
					%>
					<th><a href="/login/loginWrite.jsp">로그인</a></th>
					<th><a href="/login/loginSelect.jsp">회원가입</a></th>
					<%
					} else {
					%>
					<th><a href="/myPage/myPageSession.jsp">마이페이지</a></th>
					<th><a href="/include/logout.jsp">로그아웃</a></th>
					<%
					}
					%>
				</tr>
			</table>
			</div>
 </nav>
 
 <aside>

 </aside>
 
 <section>

	<div class="div_title">
		자주 묻는 질문
	</div>


	<div class="div_search">
	<form name="searchForm" method="post" action="boardList.jsp">
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
			<col width="10%"/>
			<col width="*"  />
			<col width="10%"/>
			<col width="10%"/>
		</colgroup>
		<tr>
			<th>번호</th>
			<th>구분</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회</th>
		</tr>
		
		<%
		while( rs2.next() ) {
			String unq = rs2.getString("unq");
			String title = rs2.getString("title");
			String name = rs2.getString("name");
			String rdate = rs2.getString("rdate");
			int hits = rs2.getInt("hits");
		%>
		<tr>
			<td><%=rownum %></td>
			<td>자주 묻는 질문</td>
			<td style="text-align:left;"><a href="boardDetail.jsp?unq=<%=unq %>"><%=title %></a></td>
			<td><%=rdate %></td>
			<td><%=hits %></td>
		</tr>
		<%
			rownum--;
		}
		%>
	</table>
	
	
	
	<div style="margin-top:10px; text-align:center;">
		
		<a href="boardList.jsp?page=1&<%=search %>" class="num first"> 《 </a>
		<a href="#" class="num bef"> 〈 </a>
		
		<%
		for (int p=1; p<=lastpage; p++){
		%>
			<a href="boardList.jsp?page=<%=p %>&<%=search %>" class="num"><%=p %></a>
		<%
			//out.print("<a href='boardList.jsp?page="+p+"' class=\"num\"> "+p+" </a> ");
		}
		%>
		<a href="#" class="num bef"> 〉 </a>
		<a href="boardList.jsp?page=<%=lastpage %>&<%=search %>" class="num last"> 》 </a>
	
	</div>
	
	</div>
 </section>
 
 <footer>

 </footer>
  
 </body>
</html>
