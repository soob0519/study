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


<!-- 아이디 중복체크 -->
<% 
String sql2 = "SELECT COUNT(*) cnt FROM FRIEND1 WHERE USERID='"+userid+"'";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt(1);
if(cnt>0 ){
%>
	<script>
	alert("이미 사용중인 아이디 입니다.");
	history.back();
	</script>
<%
	return;
}
%>


<!-- SQL작성 및 적용 -->
<%
String sql = "INSERT INTO friend1( \n"
		+"	USERNO \n"
		+"	,USERID \n"
		+"	,PASS \n"
		+"	,NAME \n"
		+"	,GENDER \n"
		+"	,HOBBY \n"
		+"	,COMM \n"
		+"	,RDATE \n"
		+"	,LEV) \n"
		+"	 VALUES( \n"
		+"	'"+userno+"'  \n"
		+"	,'"+userid+"'  \n"
		+"	,'"+pass+"'  \n"
		+"	,'"+name+"'  \n"
		+"	,'"+gender+"'  \n"
		+"	,'"+hobby1+"'  \n"
		+"	,'"+comm+"'  \n"
		+"	,to_date('"+rdate+"','mm/dd/yyyy')  \n"
		+"	,'"+lev+"' )";

int result = stmt.executeUpdate(sql);
if(result == 1){

%>
	<script>
	alert("저장완료");
	location = "list.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("저장실패");
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