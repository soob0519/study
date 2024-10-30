<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String id = request.getParameter("userid");
String pass = request.getParameter("userpass");
String name = request.getParameter("username");
String addr = request.getParameter("useraddr");
String gender = request.getParameter("gender");
String cont = request.getParameter("content");

String[] yy = request.getParameterValues("year");
String[] title = request.getParameterValues("title");
/*
String[] color = {"blue","red","pink"};
for(int i=0;i<color.length;i++){
	out.print(i);
}
*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

아이디 : <%=id %> <br>
암호 : <%=pass %> <br>
이름 : <%=name %> <br>
주소 : <%=addr %> <br>
성별 : <%=gender %> <br>
년도 : <%
		if(yy != null){
			for(int i=0; i<yy.length; i++){
				out.print(yy[i]+" ");
			}		
		} else {
			out.print("선택 내용 없음");
		}
		%> <br>
과목 : <%
		if(title != null){
			for(int i=0; i<title.length; i++){
				out.print(title[i]+" ");
			}		
		} else {
			out.print("선택 내용 없음");
		}
		%> <br>
		
내용 : <%=cont %> <br>

</body>
</html>