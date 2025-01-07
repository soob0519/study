<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file = "../../include/oracleCon.jsp" %>
<%
// 세션검사(로그인 상태인지 체크하는 코드)
// 세션타입이라서 문자타입으로 만들어야한다. (스트링 괄호붙이거나, 뒤에 공백 붙여서 문자타입으로 만들기.)
String SessionUserid = (String)session.getAttribute("SessionUserid");		// 로그인 하지 않으면 null 값이 된다.
// 또는 String SessionUserid = session.getAttribute("SESSION_ID")+"";
%>
<%
String menuname = request.getParameter("menuname");
String price = request.getParameter("price");
String mecontent = request.getParameter("mecontent");


// 앞뒤 공백 제거
menuname = menuname.trim();
price = price.trim();
mecontent = mecontent.trim();

%>

<%
String sql = " INSERT INTO STOREMENU (   STID 		  		 "
									 +" ,UNQ	 	  		 "
									 +" ,MENUNAME 	  		 "
									 +" ,PRICE 		  	 	 "
									 +" ,MECONTENT )  		 "
							+" VALUES( '"+SessionUserid+"'			 		 "
							+" 		 , STOREMENU_SEQ.NEXTVAL "
							+" 		 ,'"+menuname+"'  		 "
							+" 		 ,'"+price+"' 	  		 "
							+" 		 ,'"+mecontent+"')		 ";
int result = stmt.executeUpdate(sql);
if(result == 1) {
%>
	<script>
		alert("메뉴 추가성공!");
		location="menu.jsp";
	</script>
<%	
} else {
%>	
	<script>
		alert("메뉴 추가실패");
		history.back();
	</script>
<%
	return;
}
 %>