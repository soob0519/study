<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@include file="../include/oracleCon.jsp" %>

<!-- 파라메터값 설정 -->

<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String pass1 = request.getParameter("pass1");
String name = request.getParameter("name");
String engLast = request.getParameter("engLast");
String engFirst = request.getParameter("engFirst");
String birth = request.getParameter("birth");
String gender = request.getParameter("gender");
String mobile = request.getParameter("mobile");
String email = request.getParameter("email");


//out.println("userid :" + userid);	
//out.println("pass : " +pass);	

//out.println("mailyn : " +mailyn);	
//out.println("smsyn : " + smsyn);	

// 아이디, 암호,이름,연락처,이메일
if(userid == null || pass == null || name == null) 
{
%>
	<script>
	alert("입력 정보를 다시 확인해주세요!");
	location = "loginMemberWrite1.jsp";
	</script>

<%	
	return;
}
%>


<!-- 저장SQL작성/적용 -->
<% 
String sql ="INSERT INTO schedule11 ("
		   +"		UNQ "
		   +"		,USERID "
		   +"		,PASS "
		   +"		,NAME "	
		   +"		,ENGLAST "
		   +"		,ENGFIRST "
		   +"		,BIRTH "
		   +"		,GENDER "
		   +"		,MOBILE "
		   +"		,EMAIL ) VALUES ( "
				   + " schedule11_seq.nextval "
				   + " ,'"+userid+"' "
				   + " ,'"+pass+"' "
				   + " ,'"+name+"' "
				   + " ,'"+engLast+"' "
				   + " ,'"+engFirst+"' "
				   + " ,'"+birth+"' "
				   + " ,'"+gender+"' "
				   + " ,'"+mobile+"' "
				   + " ,'"+email+"' )";
int result = stmt.executeUpdate(sql);

System.out.println(sql);

if(result == 1) {
%>
	<script>
	alert("저장완료!");
	location = "loginWrite.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("저장실패!");
	history.back();
	</script>
<%
}

// 아이디 중복체크
String sql2 = "select count(*) from schedule11 where userid='"+userid+"'";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt(1);
if( cnt == 1) {
%>
	<script>
	alert("이미 사용중인 아이디입니다.");
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