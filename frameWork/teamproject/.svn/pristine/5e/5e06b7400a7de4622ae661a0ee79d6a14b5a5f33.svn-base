<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/include/oracleCon.jsp" %>

<%!											// 메소드 만들때는 ! 기호를 붙인다.
public boolean numberCheck(String a) {
	String pattern = "[0-9]+";
	boolean result = a.matches(pattern);
	return result;
}
%>

<%
Map<String,String> map = new HashMap<String,String>();		// 데이터를 누적시키기 위한 껍데기 맵

String vdate = request.getParameter("vdate");				// 출력 달(년월값)을 받음
String unq2 = request.getParameter("unq");					// 예약번호값 을 받음.
%>

<!--  캘린더 클래스 사용하기 위한 코드 ↓ -->
<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String rday = request.getParameter("day");

Calendar cal = Calendar.getInstance();		// 캘린더 클래스의 객체(인스턴스)처리	// default : 오늘(현재)시점
int yy = cal.get(Calendar.YEAR);			// 세팅된 시점의 연도(특별한 세팅 없는 경우는 현재시점)
int mm = cal.get(Calendar.MONTH);			// 세팅된 시점의 월(특별한 세팅 없는 경우는 현재시점)
int dd = cal.get(Calendar.DATE);			// 세팅된 시점의 일(특별한 세팅 없는 경우는 현재시점)

String today = yy+"-"+(mm+1)+"-"+dd;		// 달력에 오늘날짜의 배경색을 바꾸기 위해, 오늘 날짜를 세팅(실제 오늘날짜)
// System.out.println("오늘의 년월일값 : "+today);

if(year != null    && month != null && 		// 년월값이 null 이 아니고, 
  !year.equals("") && !month.equals("")){	// 년월값이 공백이 아니라면..
	yy = Integer.parseInt(year);			// 파라미터로 넘겨받은 문자타입 년도 값을 정수타입으로 바꿔서 yy 에 저장한다.
	mm = Integer.parseInt(month)-1;			// 사용자가 입력하는 값을 제대로 표기하기 위해서 월 값에 -1 한다.(1월 = 0)
}

String vdate2 = vdate;						// 변형되지 않은 vdate 값을 사용하기 위한 변수 vdate2

if(vdate == null || vdate.equals("")){		// 출력 달 값이 없다면...
	vdate = yy+"-"+(mm+1);					// 현재(오늘) 시점으로 만든다.
}

String[] str = vdate.split("-");			// 파라미터값으로 넘겨받은 vdate 값을 - 기호를 구분자로해서 분리후 배열변수 str 에 저장한다.
int v_yy = Integer.parseInt(str[0]);		//	v_yy 는 정수타입 연도값을 담는다.
int v_mm = Integer.parseInt(str[1]);		//	v_mm 는 정수타입 월값을 담는다.
String v_date = v_yy+"-"+v_mm;				// 문자타입 v_date 에 년-월(파라미터값)을 세팅. 


//출력하려는 달력의 시점을 세팅한다.
//시점의 날짜는 1일날이 기본값(default)임
//예1) 2025년 1월달 달력 :: cal.set(2025,0,1)
//예2) 2025년 12월달 달력 :: cal.set(2025,11,1)
// cal.set(yy,mm,1);								// 시점이 1일로 바뀜
cal.set(v_yy,(v_mm-1),1);							// 출력 달의 첫번째 날짜로 (시점)세팅

int week = cal.get(Calendar.DAY_OF_WEEK);			// 요일정보(숫자)를 가져온다.(필수요소)★★★
int lastday = cal.getActualMaximum(Calendar.DATE);	// 마지막 날짜값을 가져온다.(필수요소)★★★

int mm2 = mm+1;							// mm2 는 실제 월값을 받는다.
String mm3 = "";						// mm3 초기값으로 공백을 세팅.
if(mm2 < 10){							// 실제 월값이 10 보다 작다면.. 
	mm3 = "0"+mm2;						// 실제 월값 앞에 0 을 붙여서 mm3 에 저장한다.
} else {								// 그 외에는...
	mm3 = mm2+"";						// mm3 는 실제 월값과 같다.
}

String ddd = yy+"-"+mm3;				// ddd 는 실제 년-월 값을 받는다.

// out.print("요일:"+week);				// 일요일 1 ~ 토요일 7
// out.print(" 마지막날:"+lastday);
%>  

<%
// 이전 다음달 버튼 관련 세팅.
int t_mm = mm+1;						// t_mm 은 시스템월값+1  // 실제 월값
int b_yy = yy;							// b_yy 는 년값
int b_mm = t_mm-1;						// b_mm 은 실제월값-1  (== 시스템월값)
if(b_mm == 0) {							// 시스템 월값이 0 이라면..
	b_yy--;								// 년도값을 -1 가감한다.
	b_mm = 12;							// 시스템 월값을 12로 만든다.
}

int n_yy = yy;							// n_yy 는 실제 연도값을 받는다. 
int n_mm = t_mm+1;						// n_mm 은 실제 월에+1 한 값을 받는다. (다음월)
if(n_mm > 12) {							// 다음월 값이 12보다 크다면..
	n_yy++;								// 실제 연도값을 +1 한다.
	n_mm = 1;							// 다음월의 값을 1로 만든다. 
}
%>
  
<%
// String tt = ",";						// 예약날짜를 누적시키기 위한 변수
// int day4 = 0;

String sql =" SELECT DAY,COUNT(DAY) AS CNT1 FROM ("
		   +" SELECT DAY "								// 2024-09-05
		   +" FROM SCHEDULE WHERE USERID='test1' "
		   +" AND substr(DAY,0,7)='"+ddd+"') a "		// 2024-09
		   +" group by day ";
ResultSet rs = stmt.executeQuery(sql);
//System.out.println(sql);
while(rs.next()){
	String cnt = rs.getString("CNT1");
	String day = rs.getString("DAY");	// 예약날짜
	String[] day2 = day.split("-");		// [일][시:분]
//	String[] day3 = day2[1].split(":");	// [시][분]
//	System.out.println("cnt : "+cnt);
//	System.out.println("day : "+day);
	map.put(day2[2],cnt);
}
// System.out.println(map);


String sql2 =" SELECT ROWNUM RN,UNQ FROM SCHEDULE"
			+" WHERE USERID='test1' "
			+" AND DAY='"+year+"-"+month+"-"+rday+"'";
ResultSet rs2 = stmt2.executeQuery(sql2);
System.out.println(sql2);


String sql3 =" SELECT NAME "
			+" 		 ,to_char(RD,'yyyy-mm-dd hh24:mm:ss') RD "
			+" 		 ,PP "
			+" 		 ,UNQ "
			+" 		 ,MENU "
			+" 		 ,EA "
			+" 		 ,to_char(PRICE,'999,999,999') PRICE "
			+" 		 ,decode(STATE,'1','확인중','2','확정','3','취소') STATE " 
			+" 		 ,nvl(RQ,'요청사항없음') RQ "
			+" 		 ,DAY "
			+" 		 ,TIME "
			+" FROM SCHEDULE "
			+" WHERE USERID='test1' "
			+" AND DAY='"+year+"-"+month+"-"+rday+"'";
ResultSet rs3 = stmt3.executeQuery(sql3);
System.out.println(sql3);

%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>가게정보관리 페이지</title>
  <link rel="stylesheet" href="scheduleListST.css?after"/>  <!-- 외부 css파일 불러오는 태그 -->
  <script src="jquery-3.7.1.js"></script>
 </head>
 
<style>
	header {
		width:100%;
		top:0px;
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
	    padding-top: 72px;
	}
	body > nav > div{
		width:100%;
		justify-items: center;
		background-color: slategray;
	}
	body > nav > div > table {
		width:800px;
		height:50px;
		font-size:18px;
		padding:5px;
	}
	body > nav > div > table > tbody > tr > th {
    	border-radius: 10px;
	}
	body > nav > div > table > tbody > tr {
 	   background-color: lavender;
	}
	body > nav > div > table > tbody > tr > th:hover {
	    background-color: ivory;
	}
	a {
		color: mediumpurple;
		text-decoration:none;
	}
	section {
		height:900px;
		background-color:white;
	}
	footer {
		height:30px;
		background-color:slategray;	
	}
</style>
 
<script>

function fn_showHide() {
	$("#showHide").hide();
//	$("#divCont"+cnt).hide();
//	$("#title"+cnt).show();
//	$("#divTextarea"+cnt).show();
}

function fn_btnST1() {
	let state = document.frm4.state.value;
	let result = confirm("예약을 수락 하시겠습니까?"); 
		if(result == true){
			alert("예약이 수락 되었습니다.");
			document.frm4.state();
		}
		document.frm4.submit();
	}
	
function fn_btnST2() {
	let state = document.frm4.state.value;
	let result = confirm("예약을 거절 하시겠습니까?");
		if(result == true){
			alert("예약이 거절 되었습니다.");
			document.frm4.state();
		}
		document.frm4.submit();
	}
	
	
function fn_action() {
	let year = document.frm1.year.value;
	let month = document.frm1.month.value;
	if(year < 1930) {
		alert("년도값은 1930 이상 입력 가능합니다.");
		document.frm1.month.focus();
		return false;
	}
	if(month < 1 || month > 12) {
		alert("월값은 1부터 12까지 입력가능합니다.");
		document.frm1.month.focus();
		return false;
	}
	document.frm1.submit();
}

</script>

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
				<th><a href="infoST.jsp">가게정보관리</a></th>
				<th><a href="scheduleListST.jsp">예약현황</a></th>
				<th><a href="/teamProject/customer/boardList.jsp?code=2">Q&A</a></th>
				<th><a href="/teamProject/customer/boardList.jsp?code=1">리뷰</a></th>
			</table>
		</div>
	</nav>
	<aside>
	</aside>
		<section>
<!-- 
3.가게 통계 페이지 :  월별 예약 건수 출력 SQL 
SELECT 
     TO_CHAR(DAY,'YYYY-MM') AS DAY
    ,COUNT(DAY)
FROM schedule 
WHERE DAY>= '2024-09' AND DAY<= '2024-12'
GROUP BY DAY;


1-1. 메뉴 정보 (이름,가격)
1-2. 가게 운영시간
1-3. 편의시설 안내
1-4. 예약 가능 시간설정 - 영업시간 내 20분간격
1-5. 예약 가능 인원설정 - 테이블 숫자에 따라서 협의 후 결정
-->
		<div style="border:1px solid; width:1000px; justify-self:center; margin-top:20px;">
			<table>
				<tr>
					<th>영업시간</th>
					<td>10:00~22:00 <button type="button" onclick="fn_showHide()">변경</button></td>
					<td id="showHide"><input type="text"> <button type="button">저장</button></td>
				</tr>
				<tr>
					<th>정기휴무일</th>
					<td>매주 화요일 <button type="button">변경</button></td>
					<td><input type="text"> <button type="button">저장</button></td>					
				</tr>
				<tr>
					<th>전화번호</th>
					<td>031-1111-2222 <button type="button">변경</button></td>
					<td><input type="text"> <button type="button">저장</button></td>					
				</tr>
				<tr>
					<th>오시는길</th>
					<td>경기도 구리시 인창동 123번길 <button type="button">변경</button></td>
					<td><input type="text"> <button type="button">저장</button></td>
				</tr>
				<tr>
					<th>편의시설 안내</th>
					<td>주차장, 화장실, 와이파이 <button type="button">변경</button></td>
					<td><input type="text"> <button type="button">저장</button></td>
				</tr>
				<tr>
					<th>예약가능시간(시:분)</th>
					<td><button type="button">변경</button></td>
					<td>
						<% for(int i=10; i<=22; i++){ %> 
							<input type="checkbox" name="" value=""/><%=i %>:00
							<input type="checkbox" name="" value=""/><%=i %>:20
							<input type="checkbox" name="" value=""/><%=i %>:40
						<%
						}
						%>
					</td>
					<td><button type="button">저장</button></td>
				</tr>
				<tr>
					<th>예약가능인원</th>
					<td>100명 <button type="button">변경</button></td>
					<td>
						<%for(int i=1; i<=5; i++){ %>
							<%=i %>명<button type="button" name="<%=i%>" value="<%=i%>"> - </button>
							<button type="button" name="<%=i%>" value="<%=i%>"> + </button>
						<%
						}
						%>
						<br>
						<%for(int i=10; i<=50; i=i+10){ %>
							<%=i %>명<button type="button" name="<%=i%>" value="<%=i%>"> - </button>
							<button type="button" name="<%=i%>" value="<%=i%>"> + </button>
						<%
						}
						%>
					</td>
					<td><button type="button">저장</button></td>
				</tr>
			</table>
		</div>
		<div style="border:1px solid; width:1000px; justify-self:center; margin-top:20px;">
			<table>
				<tr>
					<th>메뉴정보</th>
					<td><button type="button" onclick="fn_btnMenu();">변경</button> <button type="button">저장</button></td>
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
		</section>
	<footer>
		<!-- footer Start -->
		<!-- footer End -->
	</footer>
 </body>
</html>
