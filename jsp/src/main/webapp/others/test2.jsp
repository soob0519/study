<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String a1 = "jsp 시작";
byte eng = 90;
byte kor = 80;
int a2 = 2024;
double a3 = 3.14;

out.print("<font size='5'>"+a1+"</font><br>"); // 브라우저 출력

out.println("웹개발자");	// "ln" 줄바꿈의 역할이 없어짐
out.println("웹개발자"); 
out.println("웹개발자"); 

System.out.print("7777"); // 콘솔출력
%>

<font size ="5"><%=a1 %></font> <br>
영어점수 : <%=eng %> <br>
국어점수 : <%=kor %> <br>
합계점수 : <%=eng+kor %> <br>
원주율 : <%=a3 %>

</body>
</html>