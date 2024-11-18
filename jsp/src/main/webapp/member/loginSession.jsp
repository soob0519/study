<%@ page import="conn.Cookies" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/oracleCon.jsp" %>
<%
String id = request.getParameter("userid");
String pass = request.getParameter("pass");
String chk = request.getParameter("chk");

if(id == null || pass == null) {
%>
	<script>
	alert("잘못된 접근입니다.");
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

session.setAttribute("sessionId", id);
session.setMaxInactiveInterval(30); // 초단위, 60*60

if(chk == null){
	response.addCookie(Cookies.createCookie("CookieId","","/",-1));
} else {
// 세션생성
// 기본 30분
									// 변수아이디,변수값,모든폴더,유지시간(-1 : 시간제한없음)
response.addCookie(Cookies.createCookie("CookieId",id,"/",-1));
}
%>

	<script>
	alert("<%=id %>님 환영합니다.");
	location="../main/main.jsp";
	</script>
	