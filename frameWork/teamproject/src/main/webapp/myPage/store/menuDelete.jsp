<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../../include/oracleCon.jsp" %>

<%
String unq = request.getParameter("unq");

String msg = "ok";

String sql = "DELETE FROM STOREMENU "
		+" WHERE " 
		+"	 	UNQ = '"+unq+"' ";

int result = stmt.executeUpdate(sql);
if(result == 1){
	
} else {
	msg = "fail";
}
%>
<%=msg%>