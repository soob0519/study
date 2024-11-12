<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/oracleCon.jsp" %>
<%
String punq = request.getParameter("punq");
String content = request.getParameter("content");
String pass = request.getParameter("pass");
String lev = request.getParameter("lev");

String munq = request.getParameter("munq");
String mode = request.getParameter("mode");	// I or U or D


// 오류검사 punq , pass

if(punq == null || punq.equals("")){
%>
	<script>
		alert("잘못된 접근입니다.");
		location="board2Detail.jsp?unq=<%=punq %>";
	</script>
<%
	return;
}

pass = pass.trim();
if(pass == null || pass.equals("")){
%>
	<script>
		alert("암호를 적어주세요.");
		history.back();
	</script>
<%	
	return;
}

String sql = "";
String msg ="저장";
if(mode.equals("I")) {

		sql = "INSERT INTO BOARD2SUB(UNQ,CONTENT,PASS,RDATE,PUNQ,LEV) "
			+"	VALUES(	"
			+"			BOARD2SUB_SEQ.NEXTVAL	"
			+"			,'"+content+"'	"
			+"			,'"+pass+"'	"
			+"			,SYSDATE	"
			+"			,'"+punq+"'	"
			+"			,'"+lev+"'	)";
		
} else if(mode.equals("U")) {
	
	sql = "UPDATE BOARD2SUB SET "
			+"				CONTENT='"+content+"'"
			+"				,LEV='"+lev+"' "
			+"	 WHERE UNQ='"+munq+"' "
			+ " AND PASS ='"+pass+"' ";
	msg="수정";
	
} else if(mode.equals("D")) {
	
	sql = "DELETE FROM BOARD2SUB "
			+" WHERE UNQ='"+munq+"' "
			+"	AND PASS = '"+pass+"' ";
	msg="삭제";
}

int result = stmt.executeUpdate(sql);
if( result == 1){
%>
	<script>
		alert("<%=msg %>완료");
		location="board2Detail.jsp?unq=<%=punq %>";
	</script>

<%
} else {
%>
	<script>
		alert("<%=msg %>실패");
		history.back();
	</script>
<%
}
%>