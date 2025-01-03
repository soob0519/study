<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../exam/oracleCon.jsp" %>   
<%
String sql ="SELECT NVL(MAX(PRODUCT_ID),1000)+1 FROM PRODUCT_TBL";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int productId = rs.getInt(1);
%> 
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>상품등록</title>
  <link rel="stylesheet" href="layout.css"/>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
  
 </head>

<script>
$(function(){  

	$("#productDate").datepicker();
	
});
</script>

<script>
	function fn_submit(){
		if(document.frm.productName.value == ""){
			alert("상품명이 입력되지 않았습니다.");
			document.frm.productName.focus();
			return false;
		}
		document.frm.submit();	
	}
</script>

<style>
table.table_write {
	margin:auto;
	width:700px;
	border-collapse:collapse;
}
.table_write th,td {
	padding:5px;
	border:1px solid #646464;
}
.table_write th {
	background-color:#65987d;
	color:#ffcc99;
}
.table_write tr:hover {
	background-color:#99d2ac;
}

.input1 {
	width:97%;
	padding:5px;
}
.select1 {
	width:30%;
}

button {
	padding:10px;
	font-size:16px;
}

.span_message {
	color:red;
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

	<p id="title"> <br> 상품 등록 </p>
	
	<form name="frm" id="frm" method="post" action="productWriteSave.jsp">
	
	<table class="table_write">
		<colgroup>
			<col width="22%"/>
			<col width="*"/>
		</colgroup>
		<tr>
			<th>상품ID</th>
			<td>
			<!-- readonly : 읽기전용-->
			<input type="text" name="productId" value="<%=productId  %>" class="input1" readonly style="width:50%;">
			<span style="margin-left:20px;color:#333333;"></span>
			</td>
		</tr>
		<tr>
			<th><label for="productName">이름</label></th>
			<td>
			<input type="text" tabIndex="1" name="productName" id="productName" class="input1" maxlength="20" autofocus>
				<span id="userid_txt" class="span_message"></span>
			</td>
		</tr>
		<tr>
			<th><label for="productPrice">단가</label></th>
			<td><input type="text" tabIndex="2" name="productPrice" id="productPrice" class="input1" >
			
			<span id="pass_txt" class="span_message"></span>
			
			</td>
		</tr>
		<tr>
			<th>상품정보</th>
			<td>
				<textarea name="productInfo" id="productInfo" style="width:98%;height:50px;"></textarea>
			</td>
		</tr>
		<tr>
			<th>등록일자</th>
			<td>
				<input type="text" name="productDate" id="productDate" class="input1">
			</td>
		</tr>
		<tr>
			<th>공급업체</th>
			<td><input type="text" name="company" id="company" class="input1">
			<span id="username_txt" class="span_message"></span>
			</td>
		</tr>
		<tr>
			<th>담당자</th>
			<td><input type="text" name="managerId" id="managerId" class="input1">
			<span id="username_txt" class="span_message"></span>
			</td>
		</tr>
		
	</table>
	<p align="center">
		<button type="submit" id="btn1" onclick="fn_submit();return false;">등록</button>
		<button type="button" id="btn2" >조회</button>
	</p>
	</form>

</section>

<footer>

</footer>

 </body>
</html>
