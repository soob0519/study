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
			+" 		 ,PHONE "
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
  <title>가게용 예약페이지</title>
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>	<!-- ajax 사용하기 위한 원본 소스 url -->
<!--  <script src="jquery-3.7.1.js"></script>	 ajax 사용하기 위한 소스(로컬화) -->
  
 <link rel="stylesheet" href="scheduleListST.css"/>  <!-- 외부 css파일 불러오는 태그 -->
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
	body > nav > div {
		width:100%;
		height:50px;
		background-color:lightslategray;
		font-size:18px;
		text-align:center;
		justify-items: center;
		padding:5px;
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
		margin-top: 20px;
	}
	footer {
		height:30px;
		background-color:slategray;	
	}
</style>
 
<script>

function fn_btnST1(unq,num) {
	let result = confirm("예약을 수락 하시겠습니까?"); 
		if(result == false){
			return false;
		} else if(result == true) {
			$.ajax({ 
				type : "post",
				url  : "scheduleUpdate.jsp",
				data : "unq="+unq+"&num="+num,
				datatype : "text",
				success : function(data) {  // ok, fail
					if( $.trim(data) == "ok" ) {		// 공백 제거는 제이쿼리 trim 함수로 해결.
						alert("예약이 확정 되었습니다.");
						document.location.href = document.location.href;	// 현재 페이지 새로고침
					} else {
						alert("수락실패");
					}
				},
				error : function() {
					alert("오류!!");
				}
			});
		}
	} 

function fn_btnST2(unq,num) {
	let result = confirm("예약을 거절 하시겠습니까?");
		if(result == true){
			$.ajax({ 
				type : "post",
				url  : "scheduleUpdate.jsp",
				data : "unq="+unq+"&num="+num,
				datatype : "text",
				success : function(data) {  // ok, fail
					if( $.trim(data) == "ok" ) {		// 공백 제거는 제이쿼리 trim 함수로 해결.
						alert("예약이 거절 되었습니다.");
						document.location.href = document.location.href;	// 현재 페이지 새로고침
					} else {
						alert("거절 실패");
					}
				},
				error : function() {
					alert("오류!!");
				}
			});
		} else if(result == false){
			return false;
		}
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
				<th><a href="/teamProject/customer/boardList.jsp?code=1">리뷰</a></th>
				<th><a href="/teamProject/customer/boardList.jsp?code=2">Q&A</a></th>
			</table>
		</div>
	</nav>
	<aside>
	</aside>
<section>
	<div>
	<form name="frm1" method="post" action="scheduleListST.jsp">
	<input type="text" name="year" size="10">년
	<input type="text" name="month" size="10">월	
	<button type="submit" onclick="fn_action(); return false;">달력보기</button>			<!--  return false 로 자동전송 되는걸 막는다. -->
	</form>
	</div>

	<form name="frm2" method="post" action="scheduleListST.jsp">
	<div style="font-size:20px; margin:10px; font-weight:bold;">
		<a href="<%=request.getRequestURI() %>?year=<%=b_yy %>&month=<%=b_mm %>">◁</a>
			<%=yy %>년 
			<%	if((mm+1) < 10){					// 10 미만 월 값에 0 붙이기 위한 if 조건문
					out.print("0"+(mm+1));
				} else {
				out.print(mm+1);
					}
			%>월
		<a href="<%=request.getRequestURI() %>?year=<%=n_yy %>&month=<%=n_mm %>">▷</a>
		<button type="submit" onclick="<%=request.getRequestURI() %>">오늘</button>
	</div>
	</form>
	<form name="frm3" method="post" action="scheduleListST.css">
	<table class="table1">
		<tr>
			<th style="color:red;">일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th style="color:blue;">토</th>
		</tr>
		<tr>
		<%
		String d2 = "";
		int nn = 0;								// 날짜 줄바꿈(개행) 하기위한 임의의 변수 nn
		for(int s=1; s<week; s++){				// 공백찍는 for문
			nn++;
			out.print("<td height='50'></td>");
		}
		String color = "#000";					// 요일별 폰트 색깔 바꾸기 위한 변수
		String bgcolor = "floralwhite";
		for(int d=1; d<=lastday; d++){	// 1부터 마지막날짜까지 1씩 증가하는 반복문
			nn++;						// 실행될때마다 nn 값이 1증가
			if(nn%7 == 1){				// nn 을 7로 나누고 남은 값이 1이라면..
				color = "red";			// 폰트색상을 빨강으로 바꾼다
			} else if(nn%7 == 0){		// nn 이 7의 배수라면..
				color = "blue";			// 폰트색상을 파랑으로 바꾼다
			} else {					// 그 외에는..
				color = "#000";			// 폰트색상을 검정으로 바꾼다
			}
						
//			String vdate = yy+"-"+(mm+1)+"-"+d;	// 현재년월과 반복문으로 만들어진 날짜값을 세팅
			String v_today = v_date+"-"+d;	// ex: 2024-12-10 또는 2024-9-9
			// indexOf 를 통해서 예약날짜와 달력날짜의 일치여부 확인
//			String dd1 = ","+d+",";
//			int dd2 = tt.indexOf(dd1);
			d2 = d+"";
			
			if(today.equals(v_today)){							// 실제날짜(년월일)과 같은지 비교(두 변수값이 같다면..)
				bgcolor = "lightgray!important";				// 라이트그레이로 바꾼다.
			} else {											// 그 외에는..
				bgcolor = "floralwhite";						// bgcolor를 플로랄화이트로 바꾼다.
			}
			%>
			<td style="color:<%=color%>; height:50px; width:100px; background-color:<%=bgcolor %>"><%=d %>	<!-- 숫자를 찍고, td 에 폰트컬러를 적용한다. -->
			<%
				if(d < 10){
					d2 = "0"+d2;
				}
				if(map.get(d2) != null){
					out.print("<br><a href='scheduleListST.jsp?year="+yy+"&month="+mm3+"&day="+d2+"'>"+map.get(d2)+"건</a>");
				}
			%>
			</td>	
			<%
			if(nn%7==0){								// nn 이 7의 배수라면..
				out.print("<tr></tr>");					// 줄바꿈한다.
			}
			%>				
		<%
		}		
		// 33 -> 35  (7의 배수가 될때까지 빈칸 찍어주는 반복문)
		while(nn%7 != 0){								// nn 이 7의 배수가 아니라면..
			out.print("<td></td>");						// 비어있는 네모칸을 찍는다.
			nn++;										// nn 값을 1 증가시킨다.
		}
		%>
		</tr>
	</table>
	<br>
	</form>
		<div style="width:800px; height:330px; overflow-y:scroll; overflow-x:hidden;">
		<%
		int num = 0;
		while(rs3.next()){
			String name = rs3.getString("NAME");
			String rd = rs3.getString("RD");
			String pp = rs3.getString("PP");
			String unq = rs3.getString("UNQ");
			String menu = rs3.getString("MENU");
			String ea = rs3.getString("EA");
			String price = rs3.getString("PRICE");
			String state = rs3.getString("STATE");
			String rq = rs3.getString("RQ");
			String day = rs3.getString("DAY");
			String time = rs3.getString("TIME");
			String phone = rs3.getString("PHONE");
			num++;
		%>
		<%if(year.equals(year) && month.equals(month) && rday.equals(rday)) { %>
		<form name="frm4" id="frm4" method="post" action="scheduleSave.jsp">
		<table class="table2">
	  		<tr>
				<td>예약번호</td>
				<td><%=unq %></td>
				<td>접수일시</td>
				<td><%=rd %></td>
			</tr>
			<tr>
				<td>고객명<br>(인원수)</td>
				<td><%=name %><br>( <%=pp %> 명 )</td>
				<td>고객연락처</td>
				<td><%=phone %></td>
			</tr>
			<tr>
				<td>예약일<br>(내점예정시간)</td>
				<td><%=day %> (<%=time %>)</td>
				<td>예약상태</td>
				<td>
					<%=state %>
					<button type="button" onclick="fn_btnST1('<%=unq %>','2');">수락</button>
					<button type="button" onclick="fn_btnST2('<%=unq %>','3');">거절</button>
				</td>
			</tr>
			<tr>
				<td>예약메뉴<br>(수량)</td>
				<td style="height:20%; overflow:auto;"><%=menu %>( <%=ea %> )</td>
				<td>가격총계</td>
				<td><%=price %> (원)</td>
			</tr>
			<tr>
				<td>고객요청사항</td>
				<td colspan="3" style="height:25%;"><%=rq %></td>
			</tr>
		</table>
		</form>
		<br>
		<%
		}
		%>
	<%
	}
	%>
		</div>

</section>
	<footer>
		<!-- footer Start -->
		<!-- footer End -->
	</footer>
 </body>
</html>
