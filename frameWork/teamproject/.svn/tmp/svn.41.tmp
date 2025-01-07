<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터 값 설정 -->
<%
String title   = request.getParameter("title");
String pass    = request.getParameter("pass");
String writer    = request.getParameter("writer");
String content = request.getParameter("content");
String gubun   = request.getParameter("gubun");
%>

<!-- 제목,암호의 널값 체크 -->
<%
if( title == null || pass == null ) {
%>
		<script>
		alert("잘못된 접근입니다.");
		location = "board2Write.jsp?code=<%=gubun %>";
		</script>
<%
		return;
}

title = title.trim();  // 앞뒤공백제거
pass  = pass.trim();   // 앞뒤공백제거
writer  = writer.trim();
content = content.trim();

if( title.equals("") || pass.equals("") ) {
%>
		<script>
		alert("잘못된 접근입니다.");
		location = "board2Write.jsp?code=<%=gubun %>";
		</script>
<%
		return;	
}
%>
<!-- 입력SQL제작 및 적용 -->
<%
String sql = " INSERT INTO board2( "
			+"		 UNQ     "	
			+"		,TITLE   "
			+"		,PASS    "
			+"		,WRITER    "
			+"		,CONTENT "
			+"		,HITS    "
			+"		,RDATE   "
			+"      ,GUBUN  ) "
			+" VALUES(board2_seq.nextval,'"+title+"','"+pass+"','"+writer+"','"+content+"','0',sysdate,'"+gubun+"')";
int result = stmt.executeUpdate(sql);
%>
<!-- 저장완료 메세지 -->
<%
 if( result == 1 ) {
%>
		<script>
		alert("저장성공!");
		location = "board2List.jsp?code=<%=gubun %>";
		</script> 
<% 
 } else {
%>
		<script>
		alert("저장실패!");
		history.back();
		</script>
<%
 }
%>