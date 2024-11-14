<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/oracleCon.jsp" %>
<%
String id = request.getParameter("userid");
String pass = request.getParameter("pass");
if(id == null || pass == null) {
%>
	<script>
	alert("신고합니다 돌아가세요");
	location="loginWrite.jsp";
	</script>
<%
	return;
}

String sql="select count(*) from member where id='"+id+"' and pass='"+pass+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt(1);

if(cnt == 0){
%>
	<script>
	alert("일치하는 정보가 없는니다.");
	history.back();
	</script>
<%
	return;

}

//세션생성
session.setAttribute("sessionId", id);
%>

	<script>
	alert("<%=id %>님 환영합니다.");
	location="../main/main.jsp";
	</script>
	