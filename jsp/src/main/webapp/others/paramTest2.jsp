<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String eng = request.getParameter("eng");
String kor = request.getParameter("kor");

int hap = Integer.parseInt(eng)+Integer.parseInt(kor);
int avg = hap/2;

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

영어 : <%=eng %>점 <br>
국어 : <%=kor %>점 <br>
합계 : <%=hap %>점 <br>
평균 : <%=avg %>점 <br>

</body>
</html>