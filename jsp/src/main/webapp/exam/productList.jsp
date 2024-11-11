<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file ="../exam/oracleCon.jsp" %> 

<%
String sql ="select "
					+"	PRODUCT_ID"
					+"	,PRODUCT_NAME"
					+"	,PRODUCT_PRICE"
					+"	,PRODUCT_INFO"
					+"	,to_char(PRODUCT_DATE,'yyyy-mm-dd') PRODUCT_DATE"
					+"	,COMPANY"
					+"	,decode(MANAGER_ID,'E201','김사원','E202','이대리') MANAGER_ID"
					+"		from PRODUCT_TBL "
					+"		order by PRODUCT_ID asc";
ResultSet rs = stmt.executeQuery(sql);
%>
 
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>상품목록조회/수정</title>
  <link rel="stylesheet" href="layout.css"/>
 </head>

<style>
table.table_list {
	margin:auto;
	width:700px;
	border-collapse:collapse;
}
.table_list th,td {
	padding:5px;
	border:1px solid #646464;
	text-align:center;
}
.table_list th {
	background-color:#65987d;
	color:#ffcc99;
}
.table_list tr:hover {
	background-color:#99d2ac;
}

.div_bottom {
	margin:auto;
	width:700px;
	padding:5px;
}

</style>

<body>

<header>
쇼핑몰관리
</header>

<nav>
<%@ include file="../exam/productMenu.jsp" %>
</nav>

<section>

	<p id="title"> <br> 상품 조회/수정 </p>
	
	<table class="table_list">
		<colgroup>
			<col width="15%"/>
			<col width="20%"/>
			<col width="10%"/>
			<col width="15%"/>
			<col width="20%"/>
			<col width="*%"/>
		</colgroup>
		<tr>
			<th>상품ID</th>
			<th>이름</th>
			<th>단가</th>
			<th>담당자</th>
			<th>등록일자</th>
			<th>공급업체</th>
		</tr>
		<%
		while(rs.next()){
			String productId = rs.getString("PRODUCT_ID");
			String productName = rs.getString("PRODUCT_NAME");
			String productPrice = rs.getString("PRODUCT_PRICE");
			String managerId = rs.getString("MANAGER_ID");
			String productDate = rs.getString("PRODUCT_DATE");
			String company = rs.getString("COMPANY");
		%>
		<tr align="center">
			<td><%=productId %></td>
			<td><a href="productModify.jsp?productId=<%=productId %>"><%=productName %></a></td>
			<td><%=productPrice %></td>
			<td><%=managerId %></td>
			<td><%=productDate %></td>
			<td><%=company %></td>
		</tr>
		<%
		} 
		%>
	</table>

	
</section>

<footer>

</footer>

 </body>
</html>
