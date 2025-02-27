<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/oracleCon.jsp" %>

<%
// 세션검사(로그인 상태인지 체크하는 코드)
// 세션타입이라서 문자타입으로 만들어야한다. (스트링 괄호붙이거나, 뒤에 공백 붙여서 문자타입으로 만들기.)
String SessionUserid = (String)session.getAttribute("SessionUserid");		// 로그인 하지 않으면 null 값이 된다.
// 또는 String SessionUserid = session.getAttribute("SESSION_ID")+"";
%>

<%
if(SessionUserid == null || SessionUserid.equals("")){ 
%>
	<script>
	alert("잘못된 접근입니다.");
	location="/main.jsp";
	</script>
<%
}
%>

<!-- 파라메터 값 설정 -->
<%
String unq = request.getParameter("stid");

response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

String rvdate = request.getParameter("rvdate");
String people = request.getParameter("people");
String time = request.getParameter("time");
String[] menuname = request.getParameterValues("menuname");
String totalprice = request.getParameter("totalPrice");
String[] RR = request.getParameterValues("box");

System.out.println("===================="+totalprice);

String menu = "";
for(int i=0;i<menuname.length;i++){
	if(i == (menuname.length-1)){
		menu += menuname[i]+":"+RR[i];
	} else{
		menu += menuname[i]+":"+RR[i]+" ";
	}
}

if(totalprice.equals("0")){
%>
	<script>
	alert("메뉴를 선택해주십쇼");
	history.back();
	</script>
<%	
	return;
}

%>
<%
String sql2 = "SELECT NAME,MOBILE FROM SCHEDULE11 WHERE USERID='"+SessionUserid+"' ";
ResultSet rs2 = stmt2.executeQuery(sql2);
rs2.next();
String name = rs2.getString("name");
String mobile = rs2.getString("mobile");
%>


<!-- 아이디 이름 없음 나중에 가져오는 형식 -->
<%
String sql ="INSERT INTO SCHEDULE( UNQ	"
			+"				,USERID	"
			+"				,NAME	"
			+"				,RD	"
			+"				,PP	"
			+"				,MENU	"
			+"				,PRICE	"
			+"				,STATE	"
			+"				,DAY	"
			+"				,TIME	"
			+"				,PHONE	"
			+"				,STID) " 
			+"			VALUES(schedule_seq.nextval"
			+"					,'"+SessionUserid+"'"
			+"					,'"+name+"'"
			+"					,sysdate"
			+"					,'"+people+"'"
			+"					,'"+menu+"'"
			+"					,'"+totalprice+"'"
			+"					,'1'"
			+"					,'"+rvdate+"'"
			+"					,'"+time+"' "
			+"					,'"+mobile+"'"
			+"					,'"+unq+"' )";

int result = stmt.executeUpdate(sql);
%>
<!-- 저장완료 메세지 -->
<%
if(result == 1){ 
%>
	<script>
	alert("예약완료");
	location="/main.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("예약실패");
	history.back();
	</script>
<%
}
%>