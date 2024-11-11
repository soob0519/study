<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터 값 설정 -->

<%
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String writer = request.getParameter("writer");
String content = request.getParameter("content");
String gubun = request.getParameter("gubun");
%>

<!-- 제목, 암호의 널값 체크 -->

<%
if(title == null || pass == null ){
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

<!-- 입력 SQL제작 및 적용-->
<%
String sql ="INSERT INTO BOARD2(UNQ,TITLE,PASS,WRITER,CONTENT,HITS,GUBUN,RDATE) "
			+" VALUES( "
			+"	board2_seq.nextval "
			+"	,'"+title+"' "
			+"	,'"+pass+"' "
			+"	,'"+writer+"' "
			+"	,'"+content+"' "
			+"	,'0'"
			+"	,'"+gubun+"' "
			+"	,sysdate) ";

int result = stmt.executeUpdate(sql);
%>
<!-- 저장완료 메세지 -->
<%
if(result == 1){ 
%>
	<script>
	alert("저장완료");
	location="board2List.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("저장실패");
	history.back();
	</script>
<%
}
%>