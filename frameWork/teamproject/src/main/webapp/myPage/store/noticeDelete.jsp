<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/oracleCon.jsp" %>

<%
String unq = request.getParameter("unq");
// System.out.println(unq);
// int unq2 = Integer.parseInt(unq);
// String gubun = request.getParameter("gubun");

String msg = "ok";

String sql = "DELETE FROM storenotice "
		+" WHERE " 
		+"	 	UNQ = '"+unq+"' ";

int result = stmt.executeUpdate(sql);
if(result == 1){
	
} else {
	msg = "fail";
}
%>
<%=msg%>