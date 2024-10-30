<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

데이터길이 : <%=request.getContentLength() %> <br>
인코딩 : <%=request.getCharacterEncoding() %> <br>
컨텐츠 타입 : <%=request.getContentType() %> <br>
프로토콜 : <%=request.getProtocol() %> <br>
전송방식 : <%=request.getMethod() %> <br>
주소1 : <%=request.getRequestURI() %> <br>
주소2 : <%=request.getRequestURL() %> <br>
경로 : <%=request.getContextPath() %> <br>
서버이름 : <%=request.getServerName() %> <br>
서버포트 : <%=request.getServerPort() %>

</body>
</html>