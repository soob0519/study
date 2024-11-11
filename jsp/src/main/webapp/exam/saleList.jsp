<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file ="../exam/oracleCon.jsp" %> 

<%
String sql ="SELECT "
			+"			to_char(SALE_DATE,'yyyy-mm-dd')SALE_DATE "
			+"			,SUM(SALE_PRICE) SALE_PRICE "
			+"	FROM SALE_TBL	"
			+"				GROUP BY SALE_DATE "
			+"	ORDER BY SALE_DATE";
ResultSet rs = stmt.executeQuery(sql);
%>

<%
String sql2 ="select " 
					+" member_id,sum(sale_price) sum "
			+"from "
					+"sale_tbl "
			+"group by  "
					+"member_id "
			+"having sum(sale_price) = (select max(sum(sale_price)) from sale_tbl "
					+"group by member_id)";
ResultSet rs2 = stmt2.executeQuery(sql2);
rs2.next();
%>


    
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>매출현황조회</title>
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
친구관리
</header>

<nav>
<%@ include file="../exam/productMenu.jsp" %>
</nav>

<section>

	<p id="title"> <br> 매출현황 조회 </p>
	
	<table class="table_list">
		<colgroup>
			<col width="50%"/>
			<col width="*%"/>
		</colgroup>
		<tr>
			<th>판매일자</th>
			<th>판매금액</th>
		</tr>
		<%
		while(rs.next()){
			String saleDate = rs.getString("SALE_DATE");
			String salePrice = rs.getString("SALE_PRICE");
		%>
		<tr align="center">
			<td><%=saleDate %></td>
			<td><%=salePrice %></td>
		</tr>
		<%
		}
		%>
		
		<%
			String sum = rs2.getString("sum");
			String memberId = rs2.getString("member_id");
		%>
	</table>
	
	<div align="center">구매자 1등</div>
	<div align="center"><%=memberId %> <%=sum %></div>
	
</section>

<footer>

</footer>

 </body>
</html>
