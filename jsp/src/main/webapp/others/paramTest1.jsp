<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

학생점수 전송 : <a href="paramTest2.jsp?kor=100&eng=90">점수전송</a>

<form name="from" method="post" action="paramTest2.jsp">
	영어<input type="text" name="eng"><br>
	국어<input type="text" name="kor"><br>
	<br>
	<button type="submit">전송</button>
</form>

</body>
</html>