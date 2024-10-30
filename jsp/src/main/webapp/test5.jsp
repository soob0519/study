<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

풀어보기1 <br>
<%
String address = "123456 서울시 강남구 논현동77";
/*
1. 길이출력
2. 우편번호 출력
3. 주소만 출력
4. "논현"이라는 단어의 존재유무 출력
*/
%>

전송데이터 : <%=address %> <br>
1. 문자열 길이 : <%=address.length() %> <br>
2. 우편번호 : <%=address.substring(0,7) %> <br>
3. 주소 : <%=address.substring(7) %> <br>
<%
String aa = "";
if(address.contains("논현") == true){
	aa="존재함";
} else {
	aa="존재하지 않음";
}
%>
4. 검색단어 "논현" : <%=aa %>
<hr>

풀어보기2 <br>
<%
String birthday ="20100115 20011225 19981102";
Calendar cal = Calendar.getInstance();
int yy = cal.get(Calendar.YEAR);
String[] bday = birthday.split(" "); 
%>
[분석결과]<br>
--------------------------------------------------<br>
전송데이터 : <%=birthday %><br>
--------------------------------------------------<br>
<%
for(int i=0; i<bday.length; i++){
	int age = yy-Integer.parseInt(bday[i].substring(0,4));
	int mm = Integer.parseInt(bday[i].substring(4,6));
	int dd = Integer.parseInt(bday[i].substring(6));
%>
데이터 <%=i+1 %> : 나이 (만 <%=age %>세), 생일 (<%=mm %>월 <%=dd %>일)<br>
<% 
} 
%>	





</body>
</html>