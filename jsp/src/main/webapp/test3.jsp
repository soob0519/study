<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
public int my_hap(int a,int b) {
	return a+b;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
100+200 = <%=my_hap(100,200) %>
<hr>

<%
for(int i=1; i<=10; i++){
	out.print(i+" ");
}
%>
<hr>
<%
for(int i=1; i<=10; i++){
%>
	<%=i %>
<%
}
%>
<hr>

<table border=1>
	<tr>
	<% 
	for(int i=1; i<=12; i++){
	%>
		<td><%=i %>월</td>
	<%
	}
	%>
	</tr>
</table>

<hr>

<table border=1>
	<tr>
	<script>
	for(var i=1;i<=12;i++){
		document.write("<td>"+i+"월</td>");
	}
	</script>
	</tr>
</table>

<hr>

<table border=1>
<tr>
	<%
	for(int i=1; i<=31; i++){
	%>
		<td width=80><%=i %>일</td>
	<%
		if(i%7==0){
		//if(i==7||i==14||i==21||i==28){
			out.print("</tr><tr>");
		}
	}
	for(int i=0; i<4; i++){
		out.print("<td></td>");
	}
	%>
</tr>
</table>


</body>
</html>