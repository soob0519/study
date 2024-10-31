<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 파라미터 값 설정(넘어오는 변수를 받고 오류체크) -->
<%
String deptno = request.getParameter("deptno");
if(deptno==null || deptno.equals("")){
%>
	<script>
	alert("잘못된 접근입니다.");
	location ="deptList.jsp";
	</script>
<%
	return;
}
%>	
<!-- DB연결 -->
<%@
include file ="/include/oracleCon.jsp"
%>
<!-- 삭제 SQL 작성후 적용 -->
<%
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
String sql="delete from dept where deptno='"+deptno+"' ";

out.print(sql);

int result = stmt.executeUpdate(sql);
if(result == 1){
%>
	<script>
	alert("삭제완료");
	location="deptList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("삭제실패");
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