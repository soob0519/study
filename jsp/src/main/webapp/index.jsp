<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// response.sendRedirect("/main/main.jsp");
%> 

<script>
function fn_gogo() {
	location="/main/main.jsp"; 
}
setInterval(fn_gogo(),5000); // setInterval (실행함수명,지연시간);
</script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 
<meta http-equiv='refresh' content='5; url=/main/main.jsp'>
 -->

<title>Insert title here</title>
</head>
<body>
	
		<p> 5초후 메인으로 이동합니다.</p>
		
</body>
</html>