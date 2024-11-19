<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
      
<%@include file = "/include/oracleCon.jsp" %>

<%
String searchField = request.getParameter("searchField");
String searchText = request.getParameter("searchText");

String Search = "";

if(searchText != null){
	searchText = searchText.trim();
	if(!searchText.equals("")){
		Search = " AND "+searchField+" = '"+searchText+"' ";
	}
}

%>

<%
/*
select id  
,substr(addr1,1,instr(addr1,' ')-1) addr1
--instr(addr1,' ')
,to_char(rdate,'yyyy.mm.dd') rdate 
from 
member;
*/
String page1 = request.getParameter("page");

if(page1 == null){
	page1 = "1";
}

int pageNo =Integer.parseInt(page1);

int unit = 10;	// 화면의 출력 단위

String sql1 ="SELECT COUNT(*) FROM MEMBER";
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
// 총 데이터 개수
int total = rs1.getInt(1);

//총페이지개수
int totalPage = (int)Math.ceil((double)total/unit) ; 

// 초기 행번호 세팅
int rownumber = total - (pageNo-1)*unit;

// SQL에 적용할 시작번호
int sno = (pageNo-1)*unit + 1;
// SQL에 적용할 끝번호
int eno = sno+(unit-1);

String sql2 ="SELECT B.* FROM ( "
			+"	SELECT ROWNUM RN,A.* FROM (	"
			+"	select UNQ		"
			+"			,ID		"
			+"			,PASS	"
			+"			,NAME	"
			+"			,TEL	"
			+"			,MAIL	"
			+"			,POST	"
			+"			,ADDR1	"
			+"			,ADDR2	"
			+"			,MAILYN	"
			+"			,SMSYN	"
			+"			,RDATE	"
			+"			,STATE	"
			+"	from member 	"
			+" WHERE 1=1 " + Search + ") A ) B "
			+" WHERE RN>="+sno+" AND RN<="+eno;
ResultSet rs2 = stmt.executeQuery(sql2);

%>      
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>회원목록</title>
  <!-- ".." 상위 폴더란 의미 -->
  <link rel="stylesheet" href="../css/style.css" />
 
 </head>
 
 <body>
  
  <header>
  	<!-- header S -->
	<%@ include file="include/header.jsp" %>
	<!-- header E -->
  </header>
  
  <nav>
	<!-- top menu S -->
	<%@ include file="include/topMenu.jsp" %>
	<!-- top menu E -->
  </nav>
  
  <aside>
  	<%@ include file="include/aside.jsp" %>
  </aside>
  
  <section>
   <div style="margin-left:20px;margin-top:20px;">
   <form name="searchForm" method="post" action="<%=request.getRequestURI() %>">
   		<select name = "searchField">
   			<option value="id">아이디</option>
   			<option value="name">이름</option>
   			<option value="tel">연락처</option>
   		</select>
   		<input type="text" name="searchText">
   		<button type="submit">검색</button>
   </form>
   
   <table border="1" width="800" style="margin-top:10px;">
   		<tr>
   			<th>번호</th>
   			<th>아이디</th>
   			<th>이름</th>
   			<th>연락처</th>
   			<th>이메일</th>
   			<th>지역</th>
   			<th>등록일</th>
   			<th>상태</th>
   		</tr>
   		<%
   		while(rs2.next()){
   		int unq = rs2.getInt("unq");
   		String id = rs2.getString("id");
   		String name = rs2.getString("name");
   		String tel = rs2.getString("tel");
   		String mail = rs2.getString("mail");
   		String addr1 = rs2.getString("addr1");
   		String rdate = rs2.getString("rdate");
   		String state = rs2.getString("state");
   		
   		switch(state){
   		case "1" : state = "정상";
   			break;
   		case "2" : state = "탈퇴";
   			break;
   		case "3" : state = "휴면"; 
   			break;
   		}
   		
   		
   		if(addr1 != null) {
   			String[] array = addr1.split(" ");
   			addr1 = array[0];
   		} else {
   			addr1="";
   		}
   		String[] array1 = rdate.split(" ");
   		rdate = array1[0];	// 2024-11-14
   		rdate = rdate.replace("-", ".");
   		
   		%>
   		<tr align="center">
   			<td><%=rownumber %></td>
   			<td><%=id %></td>
   			<td><%=name %></td>
   			<td><%=tel %></td>
   			<td><%=mail %></td>
   			<td><%=addr1 %></td>
   			<td><%=rdate %></td>
   			<td><%=state %></td>
   		</tr>
   		<%
   			rownumber--;
   		}
   		%>
   </table>
  		<div>
  			<%
  			for(int p=1; p<=totalPage; p++){
  			%>
  				<a href="<%=request.getRequestURI() %>?page=<%=p %>"><%=p %></a>
  			<%
  			}
  			%>
  		</div>
   </div>
  </section>
  
  
 </body>
</html>
