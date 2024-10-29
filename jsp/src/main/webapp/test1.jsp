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
out.print("<table border=\"1\">");
out.print(" <tr> <td>");
out.print("html<br>");
out.print("css<br>");
out.print("javascript");
out.print("</td> </tr> </table>");

String color ="blue";
out.print("색상:"+color);
%>

<br>
<hr>

색상:<%=color %>

</body>
</html>