<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String code = request.getParameter("code");						// 분실물 or 습득물 게시판 구분짓기 위한 파라미터값
// if(code == null || (!code.equals("1") && !code.equals("2"))){
if(code == null ){
	code = "1";
}
String msg = "분실물";
String url1 = "board2Delete.jsp";
if(code.equals("2"))	  	msg = "습득물";
else if(code.equals("3")) 	msg = "보관함";
else if(code.equals("100")) { 
	msg = "공지사항";
	url1 = "boardDelete.jsp";
}
%>