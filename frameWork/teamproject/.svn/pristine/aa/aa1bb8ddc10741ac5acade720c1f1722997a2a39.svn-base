<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/include/oracleCon.jsp" %>

<%
// 세션검사(로그인 상태인지 체크하는 코드)
// 세션타입이라서 문자타입으로 만들어야한다. (스트링 괄호붙이거나, 뒤에 공백 붙여서 문자타입으로 만들기.)
String SessionUserid = (String)session.getAttribute("sessionId");	
// 또는 String SessionUserid = session.getAttribute("SESSION_ID")+"";

if(SessionUserid == null) {		// 로그인상태가 아닐 경우..
%>
	<script>
		location="/member/loginWrite.jsp";
	</script>
<%
	return;
}

//	세션아이디는 있는데 DB 에 '세션데이터'가 없을경우..(예시: 브라우저에서는 로그인상태 이지만 DB에는 해당 아이디가 없을 때) ↓
String sessionCntSql = "SELECT COUNT(*) from member WHERE id = '"+SessionUserid+"' ";
ResultSet sessionCntRs = stmt.executeQuery(sessionCntSql);
sessionCntRs.next();
if(sessionCntRs.getInt(1) == 0) {
	session.removeAttribute("sessionId");	//	세션을 끊어버린다.
%>
	<script>
		alert("세션 아이디 검증 실패!");
		location="/member/loginWrite.jsp";
	</script>
<%
	return;
}
%>
