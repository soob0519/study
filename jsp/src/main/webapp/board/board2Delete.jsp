 <%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>
<!-- 파라메타값 받기 설정 -->
<%
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");
String code = request.getParameter("code");
%>

<!-- 주요데이터 널값 체크 -->
<%
if(unq == null || pass == null){
%>
	<script>
	alert("잘못된 접근입니다.");
	location ="boardList.jsp";
	</script>
<%	
	return;
}
%>

<%
pass = pass.trim();
unq = unq.trim();
if(unq.equals("") || pass.equals("")){
%>
	<script>
	alert("암호가 틀렸습니다.");
	history.back();
	</script>
	
<%
	return;
}
%>

<%
String sql2="select count(*) from board2 where unq='"+unq+"' and pass ='"+pass+"' ";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt(1);
if(cnt == 0){
%>
	<script>
	alert("잘못된 접근입니다.");
	location="boardList.jsp";
	</script>
<%
}
%>
<!--  하위 테이블의 댓글 존재 검증 -->
<%
String sql3 ="select count(*) from board2sub where punq ='"+unq+"'"; 
ResultSet rs3 = stmt.executeQuery(sql3);
rs3.next();
int cnt2 = rs3.getInt(1);

%>


<!-- update SQL작성 및 적용 -->
<% 
String sql="DELETE BOARD2 WHERE UNQ='"+unq+"' AND PASS ='"+pass+"' ";
if(cnt2 > 0){
	sql="UPDATE BOARD2 SET content='글쓴이에 의한 삭제' WHERE UNQ='"+unq+"' AND PASS ='"+pass+"' ";
}

int result = stmt.executeUpdate(sql);
if(result == 1 ){
%>
	<script>
	alert("삭제완료");
	location ="board2List.jsp?code=<%=code %>";
	</script>

<%
} else {
%>
	<script>
	alert("암호가 틀렸습니다.");
	history.back();
	</script>
<%
}
%>