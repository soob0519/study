<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 가게 메뉴 관련 SQL -->
<!-- 나중에 가게 고유번호랑 연결 -->
<%
String sql3 ="SELECT "
			+"			STID	"
			+"			,NAME	"
			+"			,CONTENT	"
			+"			,PRICE		"
			+" 		FROM STOREMENU";
ResultSet rs3 = stmt2.executeQuery(sql3);
%>
<!-- 달력표시 -->
<%
// 출력 달력년월)을 받음
String vdate = request.getParameter("vdate");

Calendar cal = Calendar.getInstance();	// 인스턴스(객체)처리

int yy = cal.get(Calendar.YEAR);		// 현시점의 년도
int mm = cal.get(Calendar.MONTH);		// 현시점의 월
int dd = cal.get(Calendar.DATE);		// 현시점의 날(오늘날짜)

// ex) 2024-12-10 2024-9-1
String today = yy +"-"+ (mm+1) +"-"+ dd;


// 예) vdate = "2024-1-7"
// 넘어오는 날짜를 맞추려고 mm+1
if(vdate == null || vdate.equals("")){
	vdate = yy+"-"+(mm+1);
}
// vdate는 무조건 존재
String[] str = vdate.split("-");
int v_yy = Integer.parseInt(str[0]);
int v_mm = Integer.parseInt(str[1]);
int v_dd = 0;
if(vdate.length()>=8){
	v_dd = Integer.parseInt(str[2]);
}
String v_date = v_yy+"-"+v_mm;

// 출력 달의 첫번째 날짜
cal.set(v_yy,(v_mm-1),1);
// 출력하려는 달의 1일의 요일
int wk = cal.get(Calendar.DAY_OF_WEEK);

// 출력달의 마지막 날짜
int lastday = cal.getActualMaximum(Calendar.DATE);

// 이전달 S
int b_yy = v_yy;
int b_mm = v_mm-1;	// 이전달 = 출력달-1

if(b_mm == 0){		// 이전달의 결과가 0과 같은 경우는 해가 바뀐거임
	b_yy = b_yy-1;
	b_mm = 12;
}

// 다음달 s
int n_yy = v_yy;	// 다음달 년도 = 출력년도
int n_mm = v_mm+1;	// 다음달의 월 = 출력달의 월+1
if(n_mm == 13){		// 다음달의 계산이 13인 경우는 해가 바뀐거임
	n_yy = n_yy+1;
	n_mm = 1;
}

String bef = b_yy+"-"+b_mm;
String nex = n_yy+"-"+n_mm;

%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>title</title>
  
 </head>
 
 <style>
header {
	width:100%;
	height:60px;
	padding-top:20px;
	background-color:aliceblue;
	font-size:20px;
	font-weight:bold;
	text-align:center;
	position:fixed;
}
body > header > div > input[type=text] {
    border-radius: 20px;
    padding-left: 20px;
    font-size:20px;
}
body > header > div > button {
   	border-radius: 20px;
}
body > nav {
    padding-top: 80px;
}
body > nav > div {
	width:100%;
	height:50px;
	background-color:#c4f7f4;
	font-size:18px;
	text-align:center;
	padding:5px;
}
section {
	width:1200px;
	height:1800px;
	margin: auto;

}
footer {
	background-color:#ffcc99;
	height:100px;
	width:100%;
}

body {
	background-color:ivory;	
}
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

a {
	text-decoration:none;
	 color: black;
}

 </style>
 
	<body>
  
		<header>
			<div>
				<button type="button" style="width:500px; height:40px;" onclick="location='reservationSave.jsp'">
					<b>예약하기</b>
				</button>
			</div>
		</header>
		  
		<nav>
		</nav>
		  
		<aside>
		</aside>
		  
		<section>
		<!-- 가게 예약테이블 -->
		<div>
			<table>
				<tr>
					<td colspan="2">예약 테이블</td>
					<!--날짜.인원.시간-->
				</tr>
				<tr>
					<table class="type08" align="center">	
						<caption style="text-align:left;">
							<% // 삼항연산 :: (비교연산식)?true:false %>
							<%=v_yy %>년 <%=(v_mm<10)?("0"+v_mm):(""+v_mm) %>월
							&nbsp;&nbsp;
							<a href = "reservation.jsp?vdate=<%=bef %>">(이전)</a>
							<a href = "reservation.jsp?vdate=<%=nex %>">(다음)</a>
							<a href = "reservation.jsp">(오늘)</a>
						</caption>
						<tr>
							<th>일</th>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
							<th>토</th>
						</tr>
						<tr>
						<%
						// 달력 네모칸(일자)갯수
						int tdCnt = 0;
						for(int i=1; i<wk; i++){
							tdCnt++;
						%>
							<td height="80"></td>
						<%
						}
						for(int d=1; d<lastday; d++){
							tdCnt++;
							String v_today = v_date + "-" + d;
							String tdColor = "#ffffff";
							if(today.equals(v_today)) {
								tdColor = "yellow";
							}
							if(v_dd == d){
								tdColor = "blue";
							}
						%>
							<td height="80" width="100" bgcolor="<%=tdColor %>">
							<a href="reservation.jsp?vdate=<%=v_today %>" style="display:block; width:160px; height:80px;"><%=d %></a>
							</td>
						<%
							if(tdCnt%7 == 0){
								out.print("</tr><tr>");
							}
						}
						%>
						</tr>
				<tr>
					<td colspan="7">인원</td>
				</tr>
				<tr>
					<td  colspan="7">1명</td>
					<!-- 인원을 최대인원을 선택하면 1~최대인원 -->
					
				</tr>
				<tr>
					<td colspan="7"> 시간</td>
				</tr>
				<tr>
					<td colspan="7">12:00</td>
					<!--  시간차를 선택하면 자동으로 영업시간 맞춰서 자동으로  -->
				</tr>
			</table>
			<div>
				<!-- 다음버튼 > 메뉴선택화면 -->
				<button type="button">다음</button>
			</div>
		</div>
		<!-- 가게 예약테이블2 -->
		<div>
			<table>
				<tr>
					<td>예약 메뉴 선택</td>
				</tr>
			</table>
			<!-- 메뉴판 (정보) 테이블 -->
			<table>
				<tr>
					<td colspan="3">
						메뉴
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
				<tr>
					<td>+ -</td>
				</tr>
			</table>
			<!-- 메뉴 추가하면 나오게 만들기 if이용 -->
			<div>
			추가한 메뉴 +-
			</div>
			<div>
			총금액
			</div>
			<div>
				<!--  예약하기 버튼 > 예약완료 나오고 다시 그전 화면으로 -->
				<button type="submit">예약하기</button>
			</div>
		</div>
		</section>
  
		<footer>
		</footer>  
  
	</body>
</html>
