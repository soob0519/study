<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>
<%@ include file="../include/code.jsp" %>
<%
// 세션검사(로그인 상태인지 체크하는 코드)
// 세션타입이라서 문자타입으로 만들어야한다. (스트링 괄호붙이거나, 뒤에 공백 붙여서 문자타입으로 만들기.)
String SessionUserid = (String)session.getAttribute("SessionUserid");		// 로그인 하지 않으면 null 값이 된다.
// 또는 String SessionUserid = session.getAttribute("SESSION_ID")+"";
%>
<!-- 파라메터(unq) 설정 -->
<%
 String unq = request.getParameter("unq");

 if( unq == null || unq.equals("") ) {
 %>
		<script>
		alert("잘못된 접근!!!");
		location = "boardList.jsp";
		</script>
 <%  
	 return;
 }

 String sql2 = "select count(*) from qboard where unq='"+unq+"'";
 ResultSet rs2 = stmt.executeQuery(sql2);
 rs2.next();
 int cnt = rs2.getInt(1);
 if( cnt == 0 ) {
 %>
		<script>
		alert("잘못된 접근");
		location = "boardList.jsp";
		</script>
<% 
		return;
 }
%>

<!-- 조회수 증가 -->
<%
String sql3 = "update qboard set hits=hits+1 where unq='"+unq+"'";
stmt.executeUpdate(sql3);

%>

<!-- 상세보기 SQL작성/적용 -->
 <%
 String sql = " select title   "
            + "       ,name  "
            + "       ,content "
            + "       ,to_char(rdate,'yyyy-mm-dd') rdate "
            + "       ,hits "
            + "   from qboard "
		    + "  where "
		    + "        unq='"+unq+"'";
 ResultSet rs = stmt.executeQuery(sql);
 rs.next();
 
 String title     = rs.getString("title");
 String name    = rs.getString("name");
 String content   = rs.getString("content");
 String rdate     = rs.getString("rdate");
 String hits      = rs.getString("hits");

 
//  "\n" -----> <br>
content = content.replace("\n","<br>");
 
String sql4 = " select " 
			+ "     (select nvl(max(unq),0) from qboard where unq<"+unq+") bef, "
			+ "     (select nvl(min(unq),0) from qboard where unq>"+unq+") nex  "
			+ " from " 
 			+ "		dual ";
ResultSet rs4 = stmt.executeQuery(sql4); // 메모리에 올라감
rs4.next();

int bef_unq = rs4.getInt(1);
int nex_unq = rs4.getInt(2);

%>

<!-- 화면출력 -->

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>자주 묻는 질문</title>
  <link rel="stylesheet" href="../css/style.css" />
 </head>
 
 <style>
  td {
  	text-align:left;
  }
   
  .table2 {
  	width:850px;
  	border-collapse:collapse;
  }
  .inp1 {
  	width:98%;
  	padding:5px;
  }
  .table_sub {
  	width:850px;
  	border-collapse:collapse;
  	margin-top:30px;
  }
  .table_sub td,th {
  	border:1px solid #ccc;
  	padding:0px;
  	text-align:center;
  }
  body > section > div.div_agrees > table {
    width: 70%;
    margin-left: 200px;
}
body > section > div.div_agrees {
    width: 80%;
}
body > section > div.div_agrees > div:nth-child(2) {
    width: 380px;
    justify-self: right;
}
 </style>
 
 <script>
 
 function fn_action(unq,content,lev) {
	 document.frm.content.value = content;
	 document.frm.lev[lev-1].checked = true;
	 document.frm.munq.value = unq;
	 document.frm.mode.value = "U";  // 수정모드
	 
	 document.getElementById("btnSave").innerText = "수정";
	 document.getElementById("btnSpan").innerHTML 
	 		= "<button type=\"submit\" onclick=\"fn_submit('2');return false;\">삭제</button>";
 }
 function fn_submit(nn) {
	 let content = document.frm.content;
	 let pass    = document.frm.pass;
	 
	 if(nn == "1") {
		 if( content.value == "" ) {
			 alert("댓글을 입력해주세요.");
			 content.focus();
			 return false;
		 }
	 }
	 if( pass.value == "" ) {
		 alert("암호를 입력해주세요.");
		 pass.focus();
		 return false;
	 }
	 if(nn == "2")  {
		 document.frm.mode.value = "D";
	 }
	 document.frm.submit();
 }
 
 
 
 </script>
 
 
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
		자주 묻는 질문 상세보기
	</div>

	<div class="div_agrees">
		<table class="table_member">
			<colgroup>
				<col width="20%"/>
				<col width="*"/>
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
				<td >
					<div style="width:98%;
							    height:150px;
							    padding-left:10px;
							    background-color:yellow;
							    overflow-y:scroll; "><%=content %></div>
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
		
		<div>
		<%
		if(bef_unq == 0) {
			out.print("<button type=\"button\" onclick=\"alert('이전 글이 없습니다.')\">이전 글</button>");
		} else {
		%>
			<button type="button" 
			        onclick="location='boardDetail.jsp?unq=<%=bef_unq %>'">이전 글</button>
		<%
		}
		%>
		
		<%
		if(nex_unq==0) {
			out.print("<button type=\"button\" onclick=\"alert('다음 글이 없습니다.')\">다음 글</button>");
		} else {
		%>
			<button type="button" 
			        onclick="location='boardDetail.jsp?unq=<%=nex_unq %>'">다음 글</button>
		<%
		}
		%>
		
		</div>

		<div style="margin-top:10px; text-align:center;">
			<button type="button" class="button4" 
						onclick="location='boardList.jsp'">목록</button>
		</div>

		
	</div>
 </section>
 
 <footer>

 </footer>
  
 </body>
</html>