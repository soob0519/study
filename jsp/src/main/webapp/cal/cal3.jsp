<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public boolean numberCheck(String a) {
	String pattern = "[0-9]";	
	boolean result = a.matches(pattern);
	return result;
}
%>    

<%
String year= request.getParameter("year");
String month= request.getParameter("month");

Calendar cal = Calendar.getInstance();

int yy = cal.get(Calendar.YEAR);
int mm = cal.get(Calendar.MONTH);
int dd = cal.get(Calendar.DATE);

String today =yy+"-"+(mm+1)+"-"+dd;

if(year != null && month != null && !year.equals("") && !month.equals("")){
	yy = Integer.parseInt(year);
	mm = Integer.parseInt(month)-1;
}

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
	padding:3px;
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

a{
	text-decoration:none;
}

</style>
<script>
function fn_popup() {
	let url="cal4.jsp";
	window.open(url,"cal4","width=600,height=700");
}
function fn_action() {
	let year = document.frm.year.value;
	let month = document.frm.month.value;
	
	if(year<1940 || year>3000 ){
		alert("잘못된 날짜입니다.");
		document.frm.year.focus();
		return false;
	} 
	
	if(month<1 || month>12){
		alert("잘못된 날짜입니다.");
		document.frm.month.focus();
		return false;
	}
	document.frm.submit();
}

</script>
<body>
	<div>
	<form name="frm" method="post" action="cal3.jsp">
	<input type="number" name="year" size="4">년
	<input type="number" name="month" size="4">월
	<button type="submit" onclick="fn_action();return false;">달력보기</button>
	
	</form>
	</div>
<%
int t_mm = mm+1;

int b_yy = yy;
int b_mm = t_mm-1;

if(b_mm == 0){
	b_yy--;
	b_mm = 12;
}

int n_yy = yy;
int n_mm = t_mm+1;

if(n_mm > 12){
	n_yy++;
	n_mm = 1;
}

%>	
	
	<div style="font-size:20px; margin:10px;" >
		<a href="cal3.jsp?year=<%=b_yy %>&month=<%=b_mm %>">◁</a>
		<%=yy %>년 
		<%=((mm+1)<10)?"0"+(mm+1):(mm+1) %>월
		<a href="cal3.jsp?year=<%=n_yy %>&month=<%=n_mm %>">▷</a>
		
		<button type="button" onclick="location='cal3.jsp'">오늘</button>
		<button type="button" onclick="fn_popup();">전체</button>
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
		// 개행을 위한 변수
		int nn = 0;
		
		// 1일날 출력 이전의 공백 네모칸을 출력하는 역할
		for(int s=1; s<week; s++){
			nn++;
			out.print("<td></td>");
		}
		String color="#000";
		String bgcolor="#fff";
		
		
		// 실제 날짜를 출력하는 역활
		for(int d=1; d<=lastday; d++){
			nn++;
			if(nn%7 == 1) {
				color="red";
			} else if(nn%7 == 0) {
				color="blue";
			} else{
				color="#000";
			}
			String v_date = yy+"-"+(mm+1)+"-"+d;
			if(today.equals(v_date)){
				bgcolor="#ccc";
			} else{
				bgcolor="#fff";
			}
		%>
			<td style="color:<%=color%>;background-color:<%=bgcolor %>"><%=d %></td>
			<%
			if(nn%7 == 0){
				out.print("</tr><tr>");
			}
			%>
		<%
		}
		// 마지막 날짜 출력후 빈공간을 출력하는 역할
		while(nn%7 != 0){
			out.print("<td></td>");
			nn++;
		}
		
		%>
			
		</tr>
	</table>

</body>
</html>