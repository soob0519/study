<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@include file="../include/sessionConfirm.jsp" %>
<!-- 파라메터값 설정 -->
<%
String name = request.getParameter("name");
String tel1 = request.getParameter("tel1");
String tel2 = request.getParameter("tel2");
String tel3 = request.getParameter("tel3");
String mail1 = request.getParameter("mail1");
String mail2 = request.getParameter("mail2");
String post = request.getParameter("post");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");
String mailyn = request.getParameter("mailyn");
String smsyn = request.getParameter("smsyn");

// 아이디 암호 이름 연락처 이메일

if(name == null ||	tel1 == null || tel2 == null || tel3 == null )
{
%>
	<script>
		alert("데이터를 다시 확인해주세요!");
		location="memberModify.jsp";
	</script>
<%
	return;
}
%>

<!-- 데이터편집
	 1.연락처 2.이메일 3.이메일수신여부(Y/N) 4.문자수신여부(Y/N)
-->
<%
String tel = tel1+tel2+tel3;

String mail = mail1+"@"+mail2;

if(mailyn == null){
	mailyn = "N";
}

if(smsyn == null){
	smsyn = "N";
}


%>


<!-- 저장SQL 작성/적용 -->
<%
String sql ="UPDATE MEMBER SET "
			+" 		NAME='"+name+"' "
			+"		,TEL='"+tel+"' "
			+"		,MAIL='"+mail+"' "
			+"		,POST='"+post+"' "
			+"		,ADDR1='"+addr1+"' "
			+"		,ADDR2='"+addr2+"' "
			+"		,MAILYN='"+mailyn+"' "
			+"		,SMSYN='"+smsyn+"' "
			+" 	WHERE ID='"+SessionUserid+"' ";

int result = stmt.executeUpdate(sql);

if(result == 1){
%>
	<script>
	alert("수정완료");
	location="memberModify.jsp";
	</script>

<%
} else {
%>
	<script>
	alert("수정실패");
	history.back();
	</script>
<%
	return;
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