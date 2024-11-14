<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메타값 받기 설정 -->

<%
String unq = request.getParameter("unq");
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String writer = request.getParameter("writer");
String content = request.getParameter("content");
%>
<!-- 주요데이터 널값 체크 -->

<%
if(title == null || pass == null || unq == null){
%>
	<script>
	alert("잘못된 접근입니다.");
	location ="board2Write.jsp";
	</script>
<%	
	return;
}
// 띄어쓰기를 엄청 많이 한 경우 대비
title = title.trim();	// 앞뒤공백제거
pass = pass.trim();
writer = writer.trim();
content = content.trim();

if(title.equals("") || pass.equals("")){
%>
	<script>
	alert("잘못된 접근입니다.");
	location ="board2Write.jsp";
	</script>
<%
	return;
} 
%>
<!-- update SQL작성 및 적용 -->

<%
String sql="update board2 set "
			+" title='"+title+"' "
			+" ,writer='"+writer+"' "
			+" ,content='"+content+"' "
			+" where unq='"+unq+"' and pass='"+pass+"' ";
int result = stmt.executeUpdate(sql);
if(result == 1 ){
	
%>
	<script>
		alert("수정완료");
		location="board2Detail.jsp?unq=<%=unq %>";
	</script>
<%
} else {
%>
	<script>
	alert("수정실패");
	history.back();
	</script>
<%
}
%>