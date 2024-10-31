<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@
include file ="/include/oracleCon.jsp"
%>
    
<%
String deptno = request.getParameter("deptno");
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");

if(deptno == null || dname == null || deptno.equals("") || dname.equals("")){
%>
	<script>
	alert("부서정보가 없습니다. 다시 시도해 주세요.");
	history.back();	// 이전화면으로 이동
	</script>

<%	
	return;	// 프로그램 수행 중단
}

String sql2="SELECT COUNT(*) cnt FROM DEPT WHERE deptno='"+deptno+"' ";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt("cnt");
if(cnt==0){
%>
	<script>
	alert("존재하지 않는 부서번호입니다.");
	history.back();	// 이전화면으로 이동
	</script>
<%	
	return;
}

String sql="UPDATE dept SET dname='"+dname+"',loc='"+loc+"' "
			+ " WHERE deptno='"+deptno+"' ";

out.print(sql);

int result = stmt.executeUpdate(sql);
if(result == 1){
%>
	<script>
	alert("수정완료");
	location="deptList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("수정실패");
	history.back();
	</script>
<%
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>