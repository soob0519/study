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
String gubun = request.getParameter("gubun");
String title = request.getParameter("title");
String ntcontent = request.getParameter("ntcontent");


// 앞뒤 공백 제거
gubun = gubun.trim();
title = title.trim();
ntcontent = ntcontent.trim();

%>

<%
String sql = " INSERT INTO storenotice ( STID	 				 "
									 +" ,UNQ 					 "
									 +" ,GUBUN 					 "
									 +" ,TITLE 					 "
									 +" ,NTCONTENT 				 "
									 +" ,RDATE )				 "
							+" VALUES('"+SessionUserid+"'						 "
							+" 		 , storenotice_seq.nextval	 "
							+" 		 ,'"+gubun+"' 	 			 "
							+" 		 ,'"+title+"' 	 			 "
							+" 		 ,'"+ntcontent+"'			 "
							+"  	 ,SYSDATE ) 				 ";
int result = stmt.executeUpdate(sql);
if(result == 1) {
%>
	<script>
		alert("공지 입력성공!");
		location="notice.jsp";
	</script>
<%	
} else {
%>	
	<script>
		alert("입력실패");
		history.back();
	</script>
<%
	return;
}
 %>