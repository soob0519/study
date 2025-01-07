<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file = "/include/oracleCon.jsp" %>

<!-- boardModify.jsp 에서 넘겨받을 파라미터값 설정 -->
<%
String unq = request.getParameter("unq");
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String writer = request.getParameter("writer");
String content = request.getParameter("content");
String code = request.getParameter("code");
%>

<!-- 제목, 암호의 null 값, 스페이스(공백입력) 체크 -->
<%
if(title == null || pass == null){
%>
	<script>
		alert("잘못된 접근입니다.");
		location = "boardList.jsp";
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
String sql = "UPDATE board2 SET "
		  +" 			 title='"+title+"' "
	      +"  		    ,writer='"+writer+"' "
	      +"  		    ,content='"+content+"' "
	      +"	WHERE unq = '"+unq+"' and pass = '"+pass+"'";
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