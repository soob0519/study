<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터값(unq) 받기 설정 -->
<%
 String unq = request.getParameter("unq");
 String pass = request.getParameter("pass");

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

<!-- 삭제SQL 작성/적용 -->
<%
String sql = "DELETE FROM NBOARD WHERE unq='"+unq+"' AND pass='"+pass+"'";
int result = stmt.executeUpdate(sql);
if(result == 1) {
%>
		<script>
		alert("삭제성공!");
		location = "boardList.jsp";
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