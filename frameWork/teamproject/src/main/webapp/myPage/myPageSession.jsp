<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="/include/oracleCon.jsp" %>

<%
// 파라미터 값 설정
String SessionUserid = (String)session.getAttribute("SessionUserid");

String sql1 = " select count(*) from schedule11 "
							+ " where userid ='"+SessionUserid+"'";
ResultSet rs1 = stmt.executeQuery(sql1);

// SQL 결과를 가져오기 위한 포인터(커서)이동
rs1.next();
int cnt = rs1.getInt(1);	// 1번째 결과
if( cnt == 1 ) {
%>
	<script>
		location="customer/scheduleList.jsp";
	</script>
<%
}
%>

<%

String sql2 = " select count(*) from schedule12 "
							+ " where userid ='"+SessionUserid+"'";
ResultSet rs2 = stmt.executeQuery(sql2);

// SQL 결과를 가져오기 위한 포인터(커서)이동
rs2.next();
int cnt2 = rs2.getInt(1);	// 1번째 결과
if( cnt2 == 1 ) {
%>
	<script>
		location="store/scheduleListST.jsp";
	</script>
<%
	return;
}
%>

</body>
</html>