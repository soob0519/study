<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/oracleCon.jsp" %>

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

//세션아이디는 있는데 DB 에 '세션데이터'가 없을경우..(예시: 브라우저에서는 로그인상태 이지만 DB에는 해당 아이디가 없을 때) ↓

String sessionCntSql = "SELECT COUNT(*) FROM BOARD2SUB WHERE STID = '"+SessionUserid+"' ";
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

<%
String punq = request.getParameter("punq");
String content = request.getParameter("content");
String pass = request.getParameter("pass");
String munq = request.getParameter("munq");
String mode = request.getParameter("mode");		// I or U or D // I = 입력, U = 업데이트, D = 삭제 
String code = request.getParameter("code");

// punq, pass 의 null 값 체크
if(punq == null || pass == null || punq.equals("") || pass.equals("")) {
%>
	<script>
		alert("잘못된 접근 입니다.");
		location = "boardListST.jsp?code=<%=code%>";
	</script>
<%
	return;
}
%>

<%
String sql = "";
String msg = "저장";

if(mode.equals("I")){
	sql = "INSERT INTO board2sub( "
								+"	UNQ "
								+" ,CONTENT "
								+" ,PASS "
								+" ,RDATE "
								+" ,PUNQ "
								+" ,STID "
								+" ) VALUES (BOARD2SUB_SEQ.NEXTVAL,'"+content+"','"+pass+"',SYSDATE,'"+punq+"','"+SessionUserid+"')";
	System.out.println("입력 sql : "+sql);
	
} else if(mode.equals("U")){
	sql = "UPDATE board2sub SET "
							+"  CONTENT = '"+content+"' "
							+" WHERE " 
							+"	 	UNQ = '"+munq+"' "
							+" 	AND PASS = '"+pass+"' ";
	msg = "수정";
} else if(mode.equals("D")){
	sql = "DELETE FROM board2sub "
			+" WHERE " 
			+"	 	UNQ = '"+munq+"' "
			+" 	AND PASS = '"+pass+"' ";
	msg = "삭제";
}

int result = stmt.executeUpdate(sql);
if(result == 1){
%>
	<script>
		alert("<%=msg %>완료!");
		// history.back(); (댓글 저장 후, 이전화면으로 돌아가버려서 작성한 내용이 바로 보이지 않는다. X)
		location = "boardDetailST.jsp?unq=<%=punq %>&code=<%=code%>";
	</script>
<%		
} else {
%>
	<script>
		alert("<%=msg %>실패.");
		history.back();
	</script>
<%
}
%>