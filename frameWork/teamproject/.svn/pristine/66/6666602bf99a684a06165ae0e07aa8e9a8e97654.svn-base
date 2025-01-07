<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>
<%
// 세션검사(로그인 상태인지 체크하는 코드)
// 세션타입이라서 문자타입으로 만들어야한다. (스트링 괄호붙이거나, 뒤에 공백 붙여서 문자타입으로 만들기.)
String SessionUserid = (String)session.getAttribute("SessionUserid");		// 로그인 하지 않으면 null 값이 된다.
// 또는 String SessionUserid = session.getAttribute("SESSION_ID")+"";
%>
<!-- 가게 정보 관련 SQL -->
<!-- 나중에 가게 고유번호랑 연결 -->
<%
String unq = request.getParameter("stid");

String sql = "SELECT 	"
					+"STID	"
					+",STORENAME	"
					+",STCONTENT	"
					+",WAY	"
					+",OPERATINGHOUR	"
					+",TEL	"
					+",DAYOFF	"
					+",INFORMATION	"
			+"	FROM STOREINFO WHERE STID='"+unq+"' ";
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

//줄바꿈

if(operatinghour == null || operatinghour.equals("null")){
	operatinghour = "";
} else {
	operatinghour = operatinghour.replace("\n", "<br>");
}

if(information == null || information.equals("null")){
	information = "";
} else {
	information = information.replace("\n", "<br>");
}

%>

<!-- 가게 공지사항 관련 SQL -->
<!-- 나중에 가게 고유번호랑 연결 -->
<%
String sql2 ="SELECT B.* FROM( "
			+"	SELECT ROWNUM RN, A.* FROM ( "
			+"		SELECT "
			+"				STID,GUBUN,TITLE,NTCONTENT,TO_CHAR(RDATE,'YYYY-MM-DD') RDATE "
			+" 			FROM STORENOTICE  WHERE STID='"+unq+"' "
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
			+"			,MENUNAME	"
			+"			,MECONTENT	"
			+"			,PRICE		"
			+" 		FROM STOREMENU  WHERE STID='"+unq+"' ) A ) B "
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
			+"			,CUID	"
			+"			,RECONTENT	"
			+"			,LEV	"
			+"		,TO_CHAR(RDATE,'YYYY-MM-DD') RDATE "
			+" FROM STOREREVIEW  WHERE STID='"+unq+"' ORDER BY RDATE DESC ) A ) B "
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
.table1 {
	width: 1035px!important;
}
.table2 {
    width: 1035px!important;
}
 </style>
 
	<body>
		<header>
		 	<div>
				<button type="button" style="width:500px; height:40px;" onclick="location='/reservation/reservation.jsp?stid=<%=stid %>'">
					<!-- 예약버튼 > 예약페이지로 -->
					<b>예약</b>
				</button>
			</div>
		</header>
		<nav>
			<div>
			<table>
				<tr>
					<th><a href="/main.jsp">홈</a></th>
					<%
					if(SessionUserid == null){
					%>
					<th><a href="/login/loginWrite.jsp">로그인</a></th>
					<th><a href="/login/loginMemberWrite1.jsp">회원가입</a></th>
					<%
					} else {
					%>
					<th><a href="/myPage/myPageSession.jsp">마이페이지</a></th>
					<th><a href="/include/logout.jsp">로그아웃</a></th>
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
				<td><img src="../images/food80.jpg" style="width:500px;height:300px;"></td>
				<td><img src="../images/restaurant80.jpg" style="width:500px;height:300px;"></td>
			</tr>
		</table>
		<!-- 가게 종합정보 -->
		<div class="div_table1">
			<table class="table1">
				<tr>
					<td>가게 종합정보</td>
				</tr>
				<tr>
					<!-- 이름 -->
					<td><%=storename %></td>
				</tr>
				<tr>
					<!-- 짧은설명 -->
					<td><%=stcontent %></td>
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
					<td colspan="2">가게 상세정보</td>
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
			<table class="table2">
				<tr>
					<td colspan="4">
						공지사항
						<button type="button" onclick="location='reservationBoard.jsp?stid=<%=stid %>'">
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
				String ntcontent = rs2.getString("ntcontent");
				String rdate = rs2.getString("rdate");				
				%>
					<tr>
					<td><%=gubun %></td>
					<td><%=title %></td>
					<td><%=ntcontent %></td>
					<td><%=rdate %></td>
					</tr>	
				
				<%
				}
				%>
				
			</table>
		</div>
		<!-- 메뉴판 (정보) 테이블 -->
		<div>
			<table  class="table2">
				<tr>
					<td colspan="3">
						메뉴판
						<button type="button" onclick="location='reservationMenu.jsp?stid=<%=stid %>'">
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
				String menuname = rs3.getString("menuname");
				String mecontent = rs3.getString("mecontent");
				String price = rs3.getString("price");
				
				%>
					<tr>
					<td><%=menuname %></td>
					<td><%=mecontent %></td>
					<td><%=price %></td>
					</tr>	
				
				<%
				}
				%>
			</table>
		</div>
		<div>
		<!-- 리뷰 (정보) -->
			<table  class="table2">
				<tr>
					<td colspan="4">
						리뷰
						<button type="button" onclick="location='reservationReview.jsp?stid=<%=stid %>'">
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
				String cuid = rs4.getString("cuid");
				String lev = rs4.getString("lev");
				String recontent = rs4.getString("recontent");
				String rdate = rs4.getString("rdate");
				%>
					<tr>
					<td><%=cuid %></td>
					<td><%=lev %></td>
					<td><%=recontent %></td>
					<td><%=rdate %></td>
					</tr>	
				
				<%
				}
				%>
			</table>
		</div>
		<!-- 지도연동 -->
		<div>
		<!--  지도 > 배우고 사용-->
		</div>
		</section>
  
		<footer>
		<!-- footer Start -->
		<%@ include file = "../../include/footer.jsp" %>
		<!-- footer End -->
		</footer>
  
	</body>
</html>
