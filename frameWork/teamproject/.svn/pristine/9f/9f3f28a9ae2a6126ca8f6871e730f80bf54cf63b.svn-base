<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 세션검사(로그인 상태인지 체크하는 코드)
// 세션타입이라서 문자타입으로 만들어야한다. (스트링 괄호붙이거나, 뒤에 공백 붙여서 문자타입으로 만들기.)
String SessionUserid = (String)session.getAttribute("SessionUserid");		// 로그인 하지 않으면 null 값이 된다.
// 또는 String SessionUserid = session.getAttribute("SessionUserid")+"";
%>

<!-- DB연결 -->
<%@ include file = "../../include/oracleCon.jsp" %>

<!-- boardModify.jsp 에서 넘겨받을 파라미터값 설정 -->
<%
String unq = request.getParameter("unq");
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String writer = request.getParameter("writer");
String content = request.getParameter("content");
String code = request.getParameter("code");
String lev = request.getParameter("lev");
int lev2 = 0;
if(lev != null) {
	lev2 = Integer.parseInt(lev);
}

%>

<!-- 제목, 암호, 세션의 null 값, 스페이스(공백입력) 체크 -->
<%
if(title == null || pass == null || SessionUserid == null){
%>
	<script>
		alert("잘못된 접근입니다.");
		location = "../../login/loginWrite.jsp";
	</script>
<%	
	return;
}

// trim() 앞뒤공백 제거 메소드
title = title.trim();
pass = pass.trim();
writer = writer.trim();
content = content.trim();
if(title.equals("") || pass.equals("")){
%>
	<script>
		alert("잘못된 접근입니다.");
		location = "boardList.jsp";
	</script>
<%	
	return;
}
%>

<!-- UPDATE SQL 작성 및 적용(암호값 일치여부 확인하기 위해 pass 조건 추가) -->
<%
if(code.equals("1")){
	String sql = "UPDATE board2 SET "
			  +" 			 TITLE='"+title+"' "
		      +"  		    ,WRITER='"+writer+"' "
		      +"  		    ,CONTENT='"+content+"' "
		      +"  		    ,LEV='"+lev2+"' "
		      +"	WHERE UNQ = '"+unq+"' AND PASS = '"+pass+"' AND USERID='"+SessionUserid+"'";
	int result = stmt.executeUpdate(sql);
	if(result == 1) {
		%>
			<script>
				alert("수정성공!");
				location="boardList.jsp?code=<%=code%>";
			</script>
		<%	
		} else {
		%>	
			<script>
				alert("수정실패!\n암호를 확인해 주세요.");
				history.back();
			</script>
		<%
			return;
		}
		 %>
		 <%
} else if(code.equals("2")){
	String sql = "UPDATE board2 SET "
			  +" 			 TITLE='"+title+"' "
		      +"  		    ,WRITER='"+writer+"' "
		      +"  		    ,CONTENT='"+content+"' "
		      +"	WHERE UNQ = '"+unq+"' AND PASS = '"+pass+"' AND USERID='"+SessionUserid+"'";
	int result = stmt.executeUpdate(sql);
	if(result == 1) {
%>
	<script>
		alert("수정성공!");
		location="boardList.jsp?code=<%=code%>";
	</script>
<%	
} else {
%>	
	<script>
		alert("수정실패!\n암호를 확인해 주세요.");
		history.back();
	</script>
<%
	return;
	}
}
 %>
