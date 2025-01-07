<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터값 받기 설정 --> 
<%
String unq     = request.getParameter("unq");
String title   = request.getParameter("title");
String pass    = request.getParameter("pass");
String name    = request.getParameter("name");
String content = request.getParameter("content");
%>

<!-- 제목,암호의 널값 체크 -->
<%
if( title == null || pass == null ) {
%>
		<script>
		alert("잘못된 접근입니다.");
		location = "boardWrite.jsp";
		</script>
<%
		return;
}

title = title.trim();  // 앞뒤공백제거
pass  = pass.trim();   // 앞뒤공백제거
name  = name.trim();
content = content.trim();

if( title.equals("") || pass.equals("") ) {
%>
		<script>
		alert("잘못된 접근입니다.");
		location = "boardWrite.jsp";
		</script>
<%
		return;	
}
%>

<!-- UPDATE SQL작성 및 적용 -->
<%
String sql = " update nboard set  "
		   + " 		 title='"+title+"'  "
		   + " 		,name='"+name+"'    "
		   + " 		,content='"+content+"' "
		   + " where unq = '"+unq+"' and pass = '"+pass+"'";
int result = stmt.executeUpdate(sql);
if(result == 1) {
%>
		<script>
		alert("수정성공!");
		location = "boardList.jsp";
		</script> 
<%
} else {
%>	
		<script>
		alert("암호를 다시 입력해주세요!");
		history.back();
		</script> 
<%
}
%>








