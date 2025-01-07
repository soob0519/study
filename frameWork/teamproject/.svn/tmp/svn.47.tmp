<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터 값 설정 -->
<%
String title   = request.getParameter("title");
String pass    = request.getParameter("pass");
String name    = request.getParameter("name");
String content = request.getParameter("content");
%>

<!-- 제목,암호의 널값 체크 -->
<%
if( title == null || pass == null ) {
%>
		<script>
		alert("잘못된 접근입니다.");
		location = "boardWrite.jsp";
		</script>
<%
		return;
}

title = title.trim();  // 앞뒤공백제거
pass  = pass.trim();   // 앞뒤공백제거
name  = name.trim();
content = content.trim();

if( title.equals("") || pass.equals("") ) {
%>
		<script>
		alert("잘못된 접근입니다.");
		location = "boardWrite.jsp";
		</script>
<%
		return;	
}
%>
<!-- 입력SQL제작 및 적용 -->
<%
String sql = " INSERT INTO nboard( "
			+"		 UNQ     "	
			+"		,TITLE   "
			+"		,PASS    "
			+"		,NAME    "
			+"		,CONTENT "
			+"		,HITS    "
			+"		,RDATE ) "
			+" VALUES(nboard_seq.nextval,'"+title+"','"+pass+"','"+name+"','"+content+"','0',sysdate)";
int result = stmt.executeUpdate(sql);
%>
<!-- 저장완료 메세지 -->
<%
 if( result == 1 ) {
%>
		<script>
		alert("저장성공!");
		location = "boardList.jsp";
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
