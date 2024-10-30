<%@ page import="java.util.Random"%>
<%@ page import="java.util.Calendar"%>
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
Calendar cal = Calendar.getInstance();
int yy = cal.get(Calendar.YEAR);
int mm = cal.get(Calendar.MONTH)+1;
int dd = cal.get(Calendar.DATE);
%>
<%=yy %>년 <%=mm %>월 <%=dd %>일
<hr>
<%
Random rn = new Random();

int r1 = rn.nextInt();		// -21억 ~ +21억
int r2 = rn.nextInt(10);	// 0 ~ 10
double r3 = rn.nextDouble();
int r4 = rn.nextInt(45);
%>
r1 : <%=r1 %> <br>
r2 : <%=r2 %> <br>
r3 : <%=r3 %> <br>
r4 : <%=r4 %> <br>


</body>
</html>