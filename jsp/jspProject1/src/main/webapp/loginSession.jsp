<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="dbCon.jsp"%> 


<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

String sql1="select count(*) from mbr	"
		+"	where id='"+id+"' and pw='"+pw+"'";
ResultSet rs1= stmt.executeQuery(sql1);

//SQL을 가져오기 위한 포인터(커서) 이동
rs1.next();
int cnt = rs1.getInt(1);
if(cnt != 1){
%>
	<script>
	alert("아이디와 비밀번호를 다시 확인해주세요.");
	history.back();
	</script>
<%
} 


// 세션(변수) 생성

session.setAttribute("SessionUserId",id);
%>

	<script>
	alert("<%=id%>님 로그인 되었습니다.");
	location="mbrModify.jsp";
	</script>