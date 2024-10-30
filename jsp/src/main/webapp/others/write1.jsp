<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- method :: 전송방식 :: GET(전송데이터노출) 또는 POST(전송데이터가려짐) :: -->

<form name ="frm" method="get" action="write2.jsp">

아이디 <input type ="text" name="userid"><br>
암호 <input type ="password" name="userpass"><br>
이름 <input type="text" name="username"><br>
주소 <input type="text" name="useraddr"><br>
성별 <input type="radio" name="gender" value="M"> 남
	<input type="radio" name="gender" value="F"> 여 <br>
과목 <input type="checkbox" name="title" value="html"> html
	<input type="checkbox" name="title" value="css"> css
	<input type="checkbox" name="title" value="java"> java
<br>
년도 <select name="year" size="5" multiple>
		<option value="2000">2000년</option>
		<option value="2001">2001년</option>
		<option value="2002">2002년</option>
		<option value="2003">2003년</option>
		<option value="2004">2004년</option>
	</select>
<br>
내용 <textarea name="content" rows="5" cols="50"></textarea>

<br><br>
<button type="submit">전송</button>

</form>

</body>
</html>