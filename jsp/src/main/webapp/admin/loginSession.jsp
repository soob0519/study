<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "/include/oracleCon.jsp" %>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
if(id==null || pw == null){
	response.sendRedirect("/main/main.jsp");
	return;
}
String sql = "select lv from admin where id='"+id+"' and pw='"+pw+"' ";
ResultSet rs = stmt.executeQuery(sql);
String lv = "";
if(rs.next()){
	lv = rs.getString(1);
} else {
	response.sendRedirect("/admin/login.jsp");
	return;
}

session.setAttribute("AdminSessionId", id);
session.setAttribute("AdminSessionLevel", lv);

%>
	<script>
	alert("관리자 <%=id %>님이 입장하셨습니다.");
	location="/admin/index.jsp";
	</script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>