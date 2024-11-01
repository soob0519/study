<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
Calendar cal = Calendar.getInstance();

// 오늘 시점의 년,월,일
int yy = cal.get(Calendar.YEAR);
int mm = cal.get(Calendar.MONTH);
int dd = cal.get(Calendar.DATE);

%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

body {
	font-size:12px;
	font-family:맑은 고딕;
}
table {
	width:300px;
	border:1px solid #ccc;
	border-collapse:collapse;
}

th,td {
	border:0px solid #ccc;
	padding:7px;
}
caption {
	font-size:20px;
	font-weight:bold;
	padding:10px;
}

button{
	padding:10px;
	background-color:pink;
	border-radius:10px;
	border:1px solid orange;
}

.div_button {
	width:600px;
	margin-top:10px;
	text-align:center;
}

.input1{
	width:98%;
	font-size:12px;
	font-family:맑은 고딕;
}

</style>

<body>

<table style="width:100%;">
	<tr>
<%
int cnt = 0;

for(int m=0; m<12; m++ ) {
	cal.set(yy,m,1); // 시점이 1일날로 바뀜
	int week = cal.get(Calendar.DAY_OF_WEEK);
	int lastday = cal.getActualMaximum(Calendar.DATE);
%>
	<td>
	<div style="font-size:14px;">
		<%=yy %>년 <%=m+1 %>월
	</div>
	
	<table>
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<tr>
		<%
		int nn = 0;
		for(int s=1; s<week; s++){
			nn++;
			out.print("<td></td>");
		}
		
		for(int d=1; d<=lastday; d++){
			nn++;
		%>
			<td><%=d %></td>
			<%
			if(nn%7 == 0){
				out.print("</tr><tr>");
			}
			%>
		<%
		}
		
		while(nn%7 != 0){
			out.print("<td></td>");
			nn++;
		}
		
		%>
			
		</tr>
	</table>
	</td>
	
<%
	if(m%3 == 2){
		out.print("</tr><tr>");
	}
}
%>
	</tr>
</table>

</body>
</html>