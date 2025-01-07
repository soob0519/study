<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터값(unq) 받기 설정 -->
<%
 String unq = request.getParameter("unq");
 String pass = request.getParameter("pass");
 String code = request.getParameter("code");
 
if( unq==null || pass==null || unq.equals("") || pass.equals("") ) {
%>
	<script>
	alert("잘못된 접근입니다.");
	location = "boardList.jsp";
	</script>
<%
	return;	
}
%> 

<!-- 하위 테이블의 댓글 존재 검증 -->
<%
String sql2 = "select count(*) from board2sub where punq='"+unq+"'";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt2 = rs2.getInt(1);
%>

<!-- 삭제SQL 작성/적용 -->
<%
String sql = "DELETE FROM BOARD2 WHERE unq='"+unq+"' AND pass='"+pass+"'";

if( cnt2 > 0 ) { // 댓글이 존재하는 경우
	sql = "UPDATE BOARD2 SET content='글쓴이에 의한 삭제' WHERE unq='"+unq+"' AND pass='"+pass+"'";
}

int result = stmt.executeUpdate(sql);
if(result == 1) {
%>
		<script>
		alert("삭제성공!");
		location = "board2List.jsp?code=<%=code %>";
		</script> 
<%
} else {
%>	
		<script>
		alert("암호를 다시 입력해주세요!");
		history.back();
		</script> 
<%
}
%>