<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 가게 정보 관련 SQL -->
<!-- 나중에 가게 고유번호랑 연결 -->
<%
String sql = "SELECT 	"
					+"STID	"
					+",STORENAME	"
					+",CONTENT	"
					+",WAY	"
					+",OPERATINGHOUR	"
					+",TEL	"
					+",DAYOFF	"
					+",INFORMATION	"
			+"	FROM STOREINFO";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
String stid = rs.getString("stid");
String storename = rs.getString("storename");
String content = rs.getString("content");
String way = rs.getString("way");
String operatinghour = rs.getString("operatinghour");
String tel = rs.getString("tel");
String dayoff = rs.getString("dayoff");
String information = rs.getString("information");

//줄바꿈
operatinghour = operatinghour.replace("\n", "<br>");
information = information.replace("\n", "<br>");
%>

<!-- 가게 공지사항 관련 SQL -->
<!-- 나중에 가게 고유번호랑 연결 -->
<%
String sql2 ="SELECT B.* FROM( "
			+"	SELECT ROWNUM RN, A.* FROM ( "
			+"		SELECT "
			+"				STID,GUBUN,TITLE,CONTENT,TO_CHAR(RDATE,'YYYY-MM-DD') RDATE "
			+" 			FROM STOREBOARD "
			+" 				ORDER BY RDATE DESC ) A ) B "
			+"	WHERE	"
			+" RN BETWEEN 1 AND 3";
ResultSet rs2 = stmt.executeQuery(sql2);
%>


<!-- 가게 메뉴 관련 SQL -->
<!-- 나중에 가게 고유번호랑 연결 -->
<%
String sql3 ="SELECT B.* FROM( "
			+"	SELECT ROWNUM RN, A.* FROM ( "
			+"		SELECT "
			+"			STID	"
			+"			,NAME	"
			+"			,CONTENT	"
			+"			,PRICE		"
			+" 		FROM STOREMENU ) A ) B "
			+"	WHERE	"
			+" RN BETWEEN 1 AND 3";
ResultSet rs3 = stmt2.executeQuery(sql3);
%>

<!-- 가게 리뷰 관련 SQL -->
<!-- 나중에 가게 고유번호랑 연결 + 리뷰 별점 평균이랑도 연결하기-->
<%
String sql4 ="SELECT B.* FROM( "
			+"	SELECT ROWNUM RN, A.* FROM ( "
			+"		SELECT	"
			+"			STID"
			+"			,ID	"
			+"			,CONTENT	"
			+"			,LEV	"
			+"		,TO_CHAR(RDATE,'YYYY-MM-DD') RDATE "
			+" FROM STOREREVIEW ORDER BY RDATE DESC ) A ) B "
			+"	WHERE	"
			+" 		RN BETWEEN 1 AND 3";
ResultSet rs4 = stmt3.executeQuery(sql4);
%>



<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>식당정보</title>
  <link rel="stylesheet" href="../css/style.css" />
 </head>
 
 <style>
<!-- 화면 스타일 -->

div {
	border:1px solid #99ff00;
	width:1200px;
	margin-top:10px;
	vertical-align:center;
	background-color:#ffffff;
}

table {
	border:1px solid #003366;
	width:1200px;
	vertical-align:center;
	background-color:#ffffff;
}

span {
	background-color:#ffffff;
}

tr,td {
	border:1px solid #ff66ff;
}



 </style>
 
	<body>
  
		<header>
		 	<div>
				<button type="button" style="width:500px; height:40px;" onclick="location='/reservation/reservation.jsp'">
					<!-- 예약버튼 > 예약페이지로 -->
					<b>예약</b>
				</button>
			</div>
		</header>
		<nav>
			<div>
				탑메뉴영역		
			</div>
		</nav>
		  
		<aside>
		</aside>
		  
		<section>
		<table>
			<tr>
				<td><img src="../images/food80.jpg" style="width:500px;height:300px;"></td>
				<td><img src="../images/restaurant80.jpg" style="width:500px;height:300px;"></td>
			</tr>
		</table>
		<!-- 가게 종합정보 -->
		<div class="div_table1">
			<table class="table1">
				<tr>
					<td>가게 종합정보 테이블</td>
				</tr>
				<tr>
					<!-- 이름 -->
					<td><%=storename %></td>
				</tr>
				<tr>
					<!-- 별점 및 리뷰 (누르면 리뷰연결) -->
					<td> 별 사진 4.9 리뷰 598개></td>
				</tr>
				<tr>
					<!-- 짧은설명 -->
					<td><%=content %></td>
				</tr>
				<tr>
					<!-- 위치안내 -->
					<td><%=way %></td>
				</tr>
			</table>
		</div>
		<!-- 가게 상세정보 -->
		<div>
			<table class="table1">
				<tr>
					<td colspan="2">가게 상세정보 테이블</td>
				</tr>
				<tr>
					<td>운영시간</td>
					<td>
					<%=operatinghour %>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><%=tel %></td>
				</tr>
				<tr>
					<td>정기휴무</td>
					<td><%=dayoff %></td>
				</tr>
				<tr>
					<td>안내 및 유의사항</td>
					<td>
					<%=information %>
					</td>
				</tr>
			</table>
		</div>
		
		</div>
		<!-- 가게 공지사항 게시판 테이블 -->
		<div>
			<table>
				<tr>
					<td colspan="4">
						공지사항
						<button type="button" onclick="location='reservationBoard.jsp'">
							더보기
						</button>
					</td>
				</tr>
				<tr>
					<td>구분</td>
					<td>제목</td>
					<td>내용</td>
					<td>게시일자</td>
					
				</tr>
				<%
				while(rs2.next()){
				String gubun = rs2.getString("gubun");
				String title = rs2.getString("title");
				String content2 = rs2.getString("content");
				String rdate = rs2.getString("rdate");				
				%>
					<tr>
					<td><%=gubun %></td>
					<td><%=title %></td>
					<td><%=content2 %></td>
					<td><%=rdate %></td>
					</tr>	
				
				<%
				}
				%>
				
			</table>
		</div>
		<!-- 메뉴판 (정보) 테이블 -->
		<div>
			<table>
				<tr>
					<td colspan="3">
						메뉴판
						<button type="button" onclick="location='reservationMenu.jsp'">
							더보기
						</button>
					</td>
				</tr>
				<tr>
					<td>메뉴명</td>
					<td>설명</td>
					<td>가격</td>
				</tr>
				<%
				while(rs3.next()){
				String menuname = rs3.getString("name");
				String content3 = rs3.getString("content");
				String price = rs3.getString("price");
				
				%>
					<tr>
					<td><%=menuname %></td>
					<td><%=content3 %></td>
					<td><%=price %></td>
					</tr>	
				
				<%
				}
				%>
			</table>
		</div>
		<div>
		<!-- 리뷰 (정보) -->
			<table>
				<tr>
					<td colspan="4">
						리뷰
						<button type="button" onclick="location='reservationReview.jsp'">
							더보기
						</button>	
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>별점</td>
					<td>리뷰내용</td>
					<td>작성날짜</td>
				</tr>
				<%
				while(rs4.next()){
				String userid = rs4.getString("id");
				String lev = rs4.getString("lev");
				String content4 = rs4.getString("content");
				String rdate = rs4.getString("rdate");
				
				%>
					<tr>
					<td><%=userid %></td>
					<td><%=lev %></td>
					<td><%=content4 %></td>
					<td><%=rdate %></td>
					</tr>	
				
				<%
				}
				%>
			</table>
		</div>
		<!-- 지도연동 -->
		<div>
		지도 > 배우고 사용
		</div>
		</section>
  
		<footer>
  
</footer> 
  
	</body>
</html>
