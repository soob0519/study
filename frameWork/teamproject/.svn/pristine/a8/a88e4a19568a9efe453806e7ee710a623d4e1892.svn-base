<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="/include/oracleCon.jsp" %>

<!-- passWrite.jsp 에서 넘겨받을 파라미터값 설정 및 null 값, 공백 오류처리 -->
<%
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");
String code = request.getParameter("code");

if(unq == null || pass == null || unq.equals("") || pass.equals("")) {
%>
	<script>
		alert("잘못된 접근입니다.");
		location="boardList.jsp?code=<%=code%>";
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
		location="boardList.jsp?code=<%=code%>";
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
		location="boardList.jsp?code=<%=code%>";
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