<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
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

<!-- passWrite.jsp 에서 넘겨받을 파라미터값 설정 및 null 값, 공백 오류처리 -->
<%
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");
String code = request.getParameter("code");

if(unq == null || pass == null || unq.equals("") || pass.equals("")) {
%>
	<script>
		alert("잘못된 접근입니다.");
		location="boardList.jsp";
	</script>
<%
	return;
}
%>
<%
unq = unq.trim();					// trim() 앞뒤공백 제거 메소드, unq 값은 히든처리되서 넘오기 때문에 없어도 무방할듯..
pass = pass.trim();					// trim() 앞뒤공백 제거 메소드, 사용자가 직접 입력하므로 반드시 필요.
if(unq.equals("") || pass.equals("")) {
%>
	<script>
		alert("잘못된 접근입니다.");
		location="boardList.jsp";
	</script>
<%
	return;
}
%>
<!-- 하위 테이블의 댓글 존재 검증 -->
<%
String sql2 = "select count(*) from board2sub where punq = '"+unq+"'";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt2 = rs2.getInt(1);		// 괄호안 숫자는 순번(첫번째) 데이터를 의미. 
%>
<!-- 삭제 SQL 작성 및 결과출력 후 페이지 이동 처리 -->
<%
String sql = "DELETE FROM board2 WHERE unq = '"+unq+"' AND pass = '"+pass+"'";
if(cnt2 > 0) {	// 댓글이 존재하는 경우..
	sql = "UPDATE board2 SET content = '글쓴이에 의해 삭제된 게시글 입니다.' WHERE unq = '"+unq+"' AND pass = '"+pass+"'";
}
int result = stmt.executeUpdate(sql);
if(result == 1){
%>
	<script>
		alert("삭제성공!");
		location="board2List.jsp?code=<%=code%>";
	</script>
<%
} else {
%>	
	<script>
		alert("삭제실패!\n암호를 확인해 주세요.");
		history.back();
	</script>
<%
}
%>