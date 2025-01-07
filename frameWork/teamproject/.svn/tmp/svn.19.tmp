<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../../include/oracleCon.jsp" %>




<!-- 가게 리뷰 관련 SQL -->
<!-- 나중에 가게 고유번호랑 연결 + 리뷰 별점 평균이랑도 연결하기-->
<%
/*
String sql4 ="SELECT B.* FROM( "
			+"	SELECT ROWNUM RN, A.* FROM ( "
			+"		SELECT	"
			+"			STID"
			+"			,CUID	"
			+"			,RECONTENT	"
			+"			,LEV	"
			+"		,TO_CHAR(RDATE,'YYYY-MM-DD') RDATE "
			+" FROM STOREREVIEW  WHERE STID='prater' ORDER BY RDATE DESC ) A ) B "
			+"	WHERE	"
			+" 		RN BETWEEN 1 AND 3";
ResultSet rs4 = stmt3.executeQuery(sql4);
*/
%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>가게정보 관리</title>
  <link rel="stylesheet" href="../../css/storeInfo.css" />
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script> <!-- 제이쿼리 사용하기 위한 소스경로 -->
  
 <script> 
	function fn_submit() {
/*
		공백제거는 저장파일(storeInfoSave.jsp)에서 처리.
		let data = document.frm1;
		data.storename.value = $.trim(data.storename.value);
		data.stcontent.value =  $.trim(data.stcontent.value);
		data.way.value = $.trim(data.way.value);
		data.operatinghour.value = $.trim(data.operatinghour.value);
		data.tel.value = $.trim(data.tel.value);
		data.dayoff.value = $.trim(data.dayoff.value);
		data.information.value = $.trim(data.information.value);
*/
		document.frm1.submit();
	}
 </script>
 
 </head>
 
	<body>
  
 	<header>
	 	<div>
			<input type="text" style="width:500px; height:40px;">
			<button type="button" style="height:40px;">검색</button>
		</div>
	</header>
	<nav>
		<!-- Top Menu Start -->
		<%@ include file = "../../include/topMenuST.jsp" %>
		<!-- Top Menu End -->
	</nav>
	<aside>
	</aside>
<!-- 가게 정보 관련 SQL -->
<!-- 나중에 가게 고유번호랑 연결 -->
<%
String stid = "";
String storename = "";
String stcontent ="";
String way = "";
String operatinghour = "";
String tel = "";
String dayoff = "";
String information = "";

String sql2 = "select count(*) from storeinfo where STID='"+SessionUserid+"' ";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt(1);

if(cnt != 0){
	String sql = "SELECT 	"
			+"STID	"
			+",STORENAME	"
			+",STCONTENT	"
			+",WAY	"
			+",OPERATINGHOUR	"
			+",TEL"
			+",DAYOFF	"
			+",INFORMATION	"
	+"	FROM STOREINFO WHERE STID='"+SessionUserid+"' ";
	
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	stid = rs.getString("stid");
	storename = rs.getString("storename");
	stcontent = rs.getString("stcontent");
	way = rs.getString("way");
	operatinghour = rs.getString("operatinghour");
	tel = rs.getString("tel");
	dayoff = rs.getString("dayoff");
	information = rs.getString("information");	
}



//줄바꿈(상세보기시에만 필요. 입력시에는 불필요)
//operatinghour = operatinghour.replace("\n", "<br>");
//information = information.replace("\n", "<br>");
%>  
	<section>
		<table>
			<tr>
				<td><img src="../../images/food80.jpg" style="width:500px;height:300px;"></td>
				<td><img src="../../images/restaurant80.jpg" style="width:500px;height:300px;"></td>
			</tr>
		</table>
		<!-- 가게 종합정보 -->
		<div class="table1">
		<form name="frm1" method="post" action="storeInfoSave.jsp">
			<table class="table1">
				<tr>
					<td colspan="2">가게 종합정보</td>
				</tr>
				<tr>
					<!-- 이름 -->
					<td>가게이름</td>
					<td><input type="text" id="storename" name="storename" value=<%=storename %>></td>
				</tr>
				<tr>
					<!-- 짧은설명 -->
					<td>짧은소개</td>
					<td><input type="text" id="stcontent" name="stcontent" value="<%=stcontent %>"></td>
				</tr>
				<tr>
					<!-- 위치안내 -->
					<td>위치안내</td>
					<td><input type="text" id="way" name="way" value="<%=way %>"></td>
				</tr>
				<tr>
					<td>운영시간</td>
					<td>
					 <textarea id="operatinghour" name="operatinghour"><%=operatinghour %></textarea>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" id="tel" name="tel" value="<%=tel %>"></td>
				</tr>
				<tr>
					<td>정기휴무</td>
					<td><input type="text" id="dayoff" name="dayoff" value="<%=dayoff %>"></td>
				</tr>
				<tr>
					<td>안내 및 유의사항</td>
					<td>
					<textarea id="information" name="information"><%=information %></textarea>
					</td>
				</tr>
			</table>
		</form>
			<div style="text-align:right; margin-top:10px;">
				<button type="submit" onclick="fn_submit(); return false;">입력사항 저장</button>
			</div>
		</div>
	</section>
		<footer>
		  
		</footer> 
  
	</body>
</html>
