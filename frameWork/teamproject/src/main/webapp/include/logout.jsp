<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("SessionUserid");
%>
	<script>
	alert("로그아웃이 되었습니다.");
	location="/main.jsp";
	</script>
