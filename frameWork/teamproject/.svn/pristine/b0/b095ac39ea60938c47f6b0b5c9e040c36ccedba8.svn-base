<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/oracleCon.jsp" %>

<%
String punq = request.getParameter("punq");
String content = request.getParameter("content");
String pass = request.getParameter("pass");
String lev = request.getParameter("lev");
String munq = request.getParameter("munq");
String mode = request.getParameter("mode");		// I or U or D // I = 입력, U = 업데이트, D = 삭제 

// punq, pass 의 null 값 체크
if(punq == null || pass == null || punq.equals("") || pass.equals("")) {
%>
	<script>
		alert("잘못된 접근 입니다.");
		location = "boardList.jsp";
	</script>
<%
	return;
}
%>

<%
String sql = "";
String msg = "저장";

if(mode.equals("I")){
	sql = "INSERT INTO board2sub( "
								+"	UNQ "
								+" ,CONTENT "
								+" ,PASS "
								+" ,RDATE "
								+" ,PUNQ "
								+" ,LEV) VALUES (BOARD2SUB_SEQ.NEXTVAL,'"+content+"','"+pass+"',SYSDATE,'"+punq+"','"+lev+"')";
} else if(mode.equals("U")){
	sql = "UPDATE board2sub SET "
							+"  CONTENT = '"+content+"' "
							+" ,LEV = '"+lev+"'"
							+" WHERE " 
							+"	 	UNQ = '"+munq+"' "
							+" 	AND PASS = '"+pass+"' ";
	msg = "수정";
} else if(mode.equals("D")){
	sql = "DELETE FROM board2sub "
			+" WHERE " 
			+"	 	UNQ = '"+munq+"' "
			+" 	AND PASS = '"+pass+"' ";
	msg = "삭제";
}

int result = stmt.executeUpdate(sql);
if(result == 1){
%>
	<script>
		alert("<%=msg %>완료!");
		// history.back(); (댓글 저장 후, 이전화면으로 돌아가버려서 작성한 내용이 바로 보이지 않는다. X)
		location = "boardDetail.jsp?unq=<%=punq %>";
	</script>
<%		
} else {
%>
	<script>
		alert("<%=msg %>실패.");
		history.back();
	</script>
<%
}
%>