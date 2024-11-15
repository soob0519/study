<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="/include/sessionConfirm.jsp" %>

<%
String p1 = request.getParameter("p1"); // 기존 암호
String p2 = request.getParameter("p2"); // 변경 암호

String sql1 = "select count(*) from member "
			+" where id='"+SessionUserid+"' and pass='"+p1+"' ";
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
if( rs1.getInt(1) == 0){
%>
	<script>
	alert("현재 암호가 일치하지 않습니다.");
	history.back();
	</script>
<%
	return;
}

String sql2 = "update member set pass = '"+p2+"' where id='"+SessionUserid+"' ";
int result = stmt.executeUpdate(sql2);
if(result == 1){
	session.removeAttribute("sessionId");
%>
	<script>
	alert("암호가 변경했습니다. 다시 로그인해주세요.");
	opener.location = "loginWrite.jsp" // 부모창을 이동시킴
	self.close(); // 팝업창을 닫음
	</script>
<%	
} 
%>