<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
Calendar cal = Calendar.getInstance();

int yy = cal.get(Calendar.YEAR);
int mm = cal.get(Calendar.MONTH);
int dd = cal.get(Calendar.DATE);

cal.set(yy,mm,1); // 시점이 1일날로 바뀜

int week = cal.get(Calendar.DAY_OF_WEEK);	// 일(1),월(2),화(3)~토(7)
int lastday = cal.getActualMaximum(Calendar.DATE);

// out.print("요일:"+week);
// out.print("마지막 날짜:"+lastday);

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
	width:600px;
	border:1px solid #ccc;
	border-collapse:collapse;
}

th,td {
	border:1px solid #ccc;
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
	<div style="font-size:20px;" >
		<%=yy %>년 <%=mm+1 %>월
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

</body>
</html>