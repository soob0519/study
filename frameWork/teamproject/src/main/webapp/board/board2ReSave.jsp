<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/oracleCon.jsp" %>

<%
String punq    = request.getParameter("punq");
String content = request.getParameter("content");
String pass    = request.getParameter("pass");
String lev     = request.getParameter("lev");

String munq     = request.getParameter("munq");
String mode     = request.getParameter("mode"); // I or U or D

// punq,pass 널값체크
if( punq==null || pass==null ) {
%>
		<script>
		alert("잘못된 경로로의 접근!");
		location = "boardList.jsp";
		</script>
<%
}

String sql = "";
String msg = "저장";

if( mode.equals("I") ) {
		  sql = "INSERT INTO BOARD2SUB( "
		    + "  UNQ "
			+ "	,TITLE	"
			+ " ,CONTENT "
			+ " ,PASS "
		    + " ,RDATE "
			+ " ) VALUES ( "
			+ "  BOARD2SUB_SEQ.NEXTVAL,'"+content+"','"+content+"','"+pass+"',SYSDATE,')";

} else if( mode.equals("U") ) {
		 sql = " UPDATE BOARD2SUB SET "
			 + " 		 content='"+content+"'"
			 + "		,lev='"+lev+"' "
			 + " WHERE  "
			 + "		unq='"+munq+"' "
			 + "	AND pass='"+pass+"' ";
		 msg = "수정";
		 
} else if( mode.equals("D") ) {
		 sql = " DELETE FROM  BOARD2SUB "
			 + "  WHERE "
			 + "		unq='"+munq+"' "
			 + "	AND pass='"+pass+"' ";	
		 msg = "삭제";
}
int result = stmt.executeUpdate(sql);
if( result == 1 ) {
%>
		<script>
		alert("<%=msg %>완료!");
		location = "boardDetail.jsp?unq=<%=punq %>";
		</script>
<%
} else {
%>
		<script>
		alert("<%=msg %>실패!");
		history.back();
		</script>
<%
}
%>