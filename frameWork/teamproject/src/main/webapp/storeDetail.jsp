<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="/include/oracleCon.jsp" %>

<%
// 세션검사(로그인 상태인지 체크하는 코드)
// 세션타입이라서 문자타입으로 만들어야한다. (스트링 괄호붙이거나, 뒤에 공백 붙여서 문자타입으로 만들기.)
String SessionUserid = (String)session.getAttribute("SessionUserid");		// 로그인 하지 않으면 null 값이 된다.
// 또는 String SessionUserid = session.getAttribute("SessionUserid")+"";
%>

<%
String name = request.getParameter("storename");
%>

<!-- 가게 정보 관련 SQL -->
<!-- 나중에 가게 고유번호랑 연결 -->
<%
String sql = "SELECT 	"
					+"STID	"
					+",STORENAME	"
					+",nvl(STCONTENT,' ') STCONTENT	"
					+",WAY	"
					+",nvl(OPERATINGHOUR,' ') OPERATINGHOUR	"
					+",nvl(TEL,' ') TEL "
					+",nvl(DAYOFF,' ') DAYOFF	"
					+",nvl(INFORMATION,' ') INFORMATION	"
			+"	FROM STOREINFO WHERE STORENAME='"+name+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
String stid = rs.getString("stid");
String storename = rs.getString("storename");
String stcontent = rs.getString("stcontent");
String way = rs.getString("way");
String operatinghour = rs.getString("operatinghour");
String tel = rs.getString("tel");
String dayoff = rs.getString("dayoff");
String information = rs.getString("information");

//줄바꿈(상세보기시에만 필요. 입력시에는 불필요)
//operatinghour = operatinghour.replace("\n", "<br>");
//information = information.replace("\n", "<br>");

%>

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
  <title>가게정보</title>
  <link rel="stylesheet" href="store/storeInfo.css" />
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script> <!-- 제이쿼리 사용하기 위한 소스경로 -->
  
 <script> 
	function fn_back() {
		location="main.jsp";
	}
	function fn_book(storename) {
		location="main.jsp";
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
		<div>
			<table>
				<tr>
					<th><a href="main.jsp">홈</a></th>
					<%
					if(SessionUserid == null){
					%>
					<th><a href="loginWrite.jsp">로그인</a></th>
					<th><a href="loginMemberWrite1.jsp">회원가입</a></th>
					<%
					} else {
					%>
					<th><a href="#">정보수정</a></th>
					<th><a href="#">로그아웃</a></th>
					<%
					}
					%>
				</tr>
			</table>
		</div>
	</nav>
	<aside>
	</aside>
		  
	<section>
		<table>
			<tr>
				<td><img src="store/food80.jpg" style="width:500px;height:300px;"></td>
				<td><img src="store/restaurant80.jpg" style="width:500px;height:300px;"></td>
			</tr>
		</table>
		<!-- 가게 종합정보 -->
		<div class="table1">
		<form name="frm1" method="post" action="storeInfoSave.jsp">
			<table class="table1">
				<tr>
					<td colspan="2">가게정보</td>
				</tr>
				<tr>
					<!-- 이름 -->
					<td>가게이름</td>
					<td><input type="text" id="storename" name="storename" value="<%=storename %>" readonly></td>
				</tr>
				<tr>
					<!-- 짧은설명 -->
					<td>짧은소개</td>
					<td><input type="text" id="stcontent" name="stcontent" value="<%=stcontent %>" readonly></td>
				</tr>
				<tr>
					<!-- 위치안내 -->
					<td>위치안내</td>
					<td><input type="text" id="way" name="way" value="<%=way %>" readonly></td>
				</tr>
				<tr>
					<td>운영시간</td>
					<td>
					 <textarea id="operatinghour" name="operatinghour" readonly><%=operatinghour %></textarea>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" id="tel" name="tel" value="<%=tel %>" readonly></td>
				</tr>
				<tr>
					<td>정기휴무</td>
					<td><input type="text" id="dayoff" name="dayoff" value="<%=dayoff %>" readonly></td>
				</tr>
				<tr>
					<td>안내 및 유의사항</td>
					<td>
					<textarea id="information" name="information" readonly><%=information %></textarea>
					</td>
				</tr>
			</table>
		</form>
			<div style="text-align:right; margin-top:10px;">
				<button type="button" onclick="fn_back(); return false;">돌아가기</button>
				<button type="button" onclick="fn_book('<%=storename%>');">예약하기</button>
			</div>
		</div>
		
  	</section>
  	
		<footer>
		  
		</footer> 
  
	</body>
</html>
