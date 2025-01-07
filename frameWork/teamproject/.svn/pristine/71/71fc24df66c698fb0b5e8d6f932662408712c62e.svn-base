<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/oracleCon.jsp" %>

<%
//String state = request.getParameter("state");
String unq = request.getParameter("unq");
String num = request.getParameter("num");

String msg = "ok";

String sql = "UPDATE schedule SET "
		+"  STATE = '"+num+"' "
		+" WHERE " 
		+"	 	UNQ = '"+unq+"' ";

int result = stmt.executeUpdate(sql);
if(result == 1){
	
} else {
	msg = "fail";
}
%>
<%=msg%>