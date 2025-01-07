<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file = "../../include/oracleCon.jsp" %>

<%
// 세션검사(로그인 상태인지 체크하는 코드)
// 세션타입이라서 문자타입으로 만들어야한다. (스트링 괄호붙이거나, 뒤에 공백 붙여서 문자타입으로 만들기.)
String SessionUserid = (String)session.getAttribute("SessionUserid");		// 로그인 하지 않으면 null 값이 된다.
// 또는 String SessionUserid = session.getAttribute("SessionUserid")+"";

 if(SessionUserid == null) {		// 로그인상태가 아닐 경우..
%>
	<script>
		alert("잘못된 접근 입니다.");
		location="../../login/loginWrite.jsp";
	</script>
<%
	return;
 }

//	세션아이디는 있는데 DB 에 '세션데이터'가 없을경우..(예시: 브라우저에서는 로그인상태 이지만 DB에는 해당 아이디가 없을 때) ↓

String sessionCntSql = "SELECT COUNT(*) FROM board2 WHERE userid = '"+SessionUserid+"' ";
ResultSet sessionCntRs = stmt.executeQuery(sessionCntSql);
sessionCntRs.next();
if(sessionCntRs.getInt(1) == 0) {
	session.removeAttribute("SessionUserid");	//	세션을 끊어버린다.
%>
	<script>
		alert("세션 아이디 검증 실패!");
		location="../../login/loginWrite.jsp";
	</script>
<%
	return;
 }
%>

<!-- 파라미터(변수)값 설정 -->
<%
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String writer = request.getParameter("writer");
String content = request.getParameter("content");
String gubun = request.getParameter("gubun");
String hits = request.getParameter("hits");
String lev = request.getParameter("lev");

int lev2 = 0;
if(lev != null) {
	lev2 = Integer.parseInt(lev);
}

%>

<!-- 제목, 암호의 null 값, 스페이스(공백입력) 체크 -->
<%
if(title == null || pass == null) {
%>
	<script>
		alert("잘못된 접근입니다.");
		location = "boardWrite.jsp?code=<%=gubun %>";
	</script>
<%	
	return;
}

// trim() 앞뒤공백 제거 메소드
title = title.trim();
pass = pass.trim();
writer = writer.trim();
content = content.trim();
if(title.equals("") || pass.equals("")){
%>
	<script>
		alert("잘못된 접근입니다.");
		location = "boardWrite.jsp";
	</script>
<%	
	return;
}
%>

<!-- 입력 SQL 작성 및 적용 -->
<%
if(gubun.equals("1")){
	String sql1 = "INSERT INTO board2(unq,title,pass,writer,content,gubun,rdate,hits,lev,userid)"
				+ " VALUES(board2_seq.nextval,'"+title+"','"+pass+"','"+writer+"','"+content+"','"+gubun+"',sysdate,'0','"+lev2+"','"+SessionUserid+"')";	// sysdate 는 오라클의 '내장함수' 이므로 따옴표를 붙이지 않는다.★
	int result = stmt.executeUpdate(sql1);
	if(result == 1){
	%>
		<script>
			alert("저장성공!");
			location = "boardList.jsp?code=<%=gubun %>";
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
} else if(gubun.equals("2")) {
	String sql1 = "INSERT INTO board2(unq,title,pass,writer,content,gubun,rdate,hits,userid)"
			+ " VALUES(board2_seq.nextval,'"+title+"','"+pass+"','"+writer+"','"+content+"','"+gubun+"',sysdate,'0','"+SessionUserid+"')";	// sysdate 는 오라클의 '내장함수' 이므로 따옴표를 붙이지 않는다.★
	int result = stmt.executeUpdate(sql1);	
	if(result == 1){
	%>
		<script>
			alert("저장성공!");
			location = "boardList.jsp?code=<%=gubun %>";
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
}
	%>
