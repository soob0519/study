<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/oracleCon.jsp" %>

<!-- 파라메터 값 설정 -->

<%

response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

String rvdate = request.getParameter("rvdate");
String people = request.getParameter("people");
String time = request.getParameter("time");
String[] menuname = request.getParameterValues("menuname");
String name = request.getParameter("name");
String totalprice = request.getParameter("totalPrice");
String[] RR = request.getParameterValues("box");

System.out.println("===================="+rvdate);

String menu = "";
for(int i=0;i<menuname.length;i++){
	if(i == (menuname.length-1)){
		menu += menuname[i]+":"+RR[i];
	} else{
		menu += menuname[i]+":"+RR[i]+" ";
	}
}

%>

<!-- 아이디 이름 없음 나중에 가져오는 형식 -->
<%
String sql ="INSERT INTO ABC(UNQ,CUID,NAME,RD,PEOPLE,MENU,TOTALPRICE,STATE,DAY,TIME) " 
			+"			VALUES(abc_seq.nextval"
			+"					,'test1'"
			+"					,'조수빈'"
			+"					,sysdate"
			+"					,'"+people+"'"
			+"					,'"+menu+"'"
			+"					,'"+totalprice+"'"
			+"					,'1'"
			+"					,'"+rvdate+"'"
			+"					,'"+time+"' )"
			+"			WHERE STID = 'prater'	";

int result = stmt.executeUpdate(sql);
%>
<!-- 저장완료 메세지 -->
<%
if(result == 1){ 
%>
	<script>
	alert("저장완료");
	location="reservation.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("저장실패");
	history.back();
	</script>
<%
}
%>