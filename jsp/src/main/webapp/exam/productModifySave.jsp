<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../exam/oracleCon.jsp" %>

<%
String productId = request.getParameter("productId");
String productName = request.getParameter("productName");
String productPrice = request.getParameter("productPrice");
String productInfo = request.getParameter("productInfo");
String productDate = request.getParameter("productDate");
String company = request.getParameter("company");
String managerId = request.getParameter("managerId");
%>

<%
if(productName == null ){
%>
	<script>
	alert("잘못된 접근입니다.");
	llocation="productList.jsp";
	</script>
<%	
	return;
}

productName = productName.trim();

if(productName.equals("")){
%>
	<script>
	alert("잘못된 접근입니다.");
	location="productList.jsp";
	</script>
<%
	return;
} 
%>

<!-- 입력 SQL제작 및 적용-->
<%
String sql ="UPDATE PRODUCT_TBL SET "
			+"			PRODUCT_NAME = '"+productName+"' "
			+"			,PRODUCT_PRICE='"+productPrice+"' "
			+"			,PRODUCT_INFO='"+productInfo+"' "
			+"			,PRODUCT_DATE=TO_DATE('"+productDate+"','mm/dd/yyyy') "
			+"			,COMPANY='"+company+"'"
			+"			,MANAGER_ID='"+managerId+"' "
			+" where "
					+"	PRODUCT_ID='"+productId+"'	";

int result = stmt.executeUpdate(sql);
%>
<!-- 저장완료 메세지 -->
<%
if(result == 1){ 
%>
	<script>
	alert("상품수정이 완료되었습니다.");
	location="productList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("상품수정이 실패하였습니다.");
	history.back();
	</script>
<%
}
%>