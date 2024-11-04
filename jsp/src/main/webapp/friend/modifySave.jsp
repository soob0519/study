<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>
<!-- 데이터가공 -->
<%
String userno	= request.getParameter("code");
String userid	= request.getParameter("userid");
String pass		= request.getParameter("pass");
String name		= request.getParameter("username");
String gender	= request.getParameter("gender");
String lev		= request.getParameter("level");
String comm		= request.getParameter("content");
String rdate	= request.getParameter("rdate");

String[] hobby = request.getParameterValues("hobby");
// String[] hobby = {"축구","야구","독서"};
// String hb ="축구,야구,독서";

String hobby1 = "";
if(hobby != null){
	for(int i =0; i<hobby.length;i++){
		hobby1 += hobby[i]+",";
	}
}
%>
<!-- 중요 데이터 널값 체크 -->
<%
if(userno == null || userid == null || pass == null || name == null){
%>
	<script>
	alert("잘못된 접근");
	location="write.jsp";
	</script>
<%	
	return;
}
%>

<!-- 암호 일치 검사 -->
<% 
String sql2 = "SELECT COUNT(*) cnt FROM FRIEND1 WHERE userno='"+userno+"' AND pass ='"+pass+"'";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt(1);
if(cnt == 0 ){
%>
	<script>
	alert("암호가 일치하지 않습니다.");
	history.back();
	</script>
<%
	return;
}
%>


<!-- SQL작성 및 적용 -->
<%
String sql = "update friend1 set 	\n"
		+"	NAME ='"+name+"' 		\n"
		+"	,GENDER ='"+gender+"' 	\n"
		+"	,HOBBY ='"+hobby1+"' 	\n"
		+"	,COMM ='"+comm+"' 		\n"
		+"	,LEV ='"+lev+"' 		\n"
		+" WHERE userno ='"+userno+"' ";

int result = stmt.executeUpdate(sql);
if(result == 1){

%>
	<script>
	alert("수정완료");
	location = "list.jsp";
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