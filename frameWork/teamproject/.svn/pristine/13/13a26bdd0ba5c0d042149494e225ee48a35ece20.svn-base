<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String code = request.getParameter("code");						// 리뷰 or QnA 구분짓기 위한 파라미터값
// if(code == null || (!code.equals("1") && !code.equals("2"))){
if(code == null ){												// 파라미터값으로 넘길 코드값이 null 이라면..
	code = "1";													// 코드값을 1(리뷰) 로 한다.
}
String msg = "리뷰";
String url1 = "board2Delete.jsp";
if(code.equals("2"))	  	msg = "Q&A";
else if(code.equals("100")) { 
	msg = "공지사항";
	url1 = "boardDelete.jsp";
}
%>