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

<%@ include file="../include/oracleCon.jsp" %>

<%
// 파라미터 값 설정
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");

String sql1 = " select count(*) from schedule11 "
							+ " where userid ='"+userid+"' and pass ='"+pass+"'";
ResultSet rs1 = stmt.executeQuery(sql1);
//SQL 결과를 가져오기 위한 포인터(커서)이동
rs1.next();
int cnt = rs1.getInt(1);	// 1번째 결과

String sql2 = " select count(*) from schedule12 "
							+ " where userid ='"+userid+"' and pass ='"+pass+"'";
ResultSet rs2 = stmt.executeQuery(sql2);
//SQL 결과를 가져오기 위한 포인터(커서)이동
rs2.next();
int cnt2 = rs2.getInt(1);	// 1번째 결과

if( cnt == 1  || cnt2 == 1) {
	session.setAttribute("SessionUserid",userid );
%>
	<script>
	alert("<%=userid%>님 로그인 되었습니다.");
	location="/main.jsp";
	</script>
<%
} else{
%>
	<script>
	alert("비밀번호가 맞지 않습니다.<br> 다시 한번 확인해주세요.");
	history.back();
</script>
<%
	return;
}


%>

</body>
</html>