<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>
<!-- 파라메타값 받기 설정 -->
<%
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");
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
String sql2="select count(*) where unq='"+unq+"' and pass ='"+pass+"' ";
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
<!-- update SQL작성 및 적용 -->
<% 
String sql="delete nboard where unq='"+unq+"' and pass ='"+pass+"' ";
int result = stmt.executeUpdate(sql);

if(result == 1 ){
%>
	<script>
	alert("삭제완료");
	location ="boardList.jsp";
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