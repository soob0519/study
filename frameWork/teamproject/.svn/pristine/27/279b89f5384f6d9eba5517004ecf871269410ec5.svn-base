<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/include/oracleCon.jsp" %>

<!-- 
# 달력 구현에 있어서 필요한 두가지 정보:
1.해당월 첫날(1일)의 시작요일
2.해당월 마지막 날짜
-->

<%!											// 메소드 만들때는 ! 기호를 붙인다. 
public boolean numberCheck(String a) {
	String pattern = "[0-9]+";
	boolean result = a.matches(pattern);
	return result;
}

%>

<%
String unq2 = request.getParameter("unq");
%>

<!--  캘린더 클래스 사용하기 위한 코드 ↓ -->
<%
String year = request.getParameter("year");
String month = request.getParameter("month");

Calendar cal = Calendar.getInstance();		// 캘린더 클래스의 객체(인스턴스)처리	// default : 오늘(현재)시점
int yy = cal.get(Calendar.YEAR);			// 세팅된 시점의 연도(특별한 세팅 없는 경우는 현재시점)
int mm = cal.get(Calendar.MONTH);			// 세팅된 시점의 월(특별한 세팅 없는 경우는 현재시점)
int dd = cal.get(Calendar.DATE);			// 세팅된 시점의 일(특별한 세팅 없는 경우는 현재시점)

String today = yy+"-"+(mm+1)+"-"+dd;		// 달력에 오늘날짜의 배경색을 바꾸기 위해, 오늘 날짜를 세팅

if(year != null    && month != null && 
  !year.equals("") && !month.equals("")){
	yy = Integer.parseInt(year);
	mm = Integer.parseInt(month)-1;			// 사용자가 입력하는 값을 제대로 표기하기 위해서 월 값에 -1 한다.(1월 = 0)
}
cal.set(yy,mm,1);							// 시점이 1일로 바뀜							


int mm2 = mm+1;
String mm3 = "";
if(mm2 < 10){
	mm3 = "0"+mm2;
} else {
	mm3 = mm2+"";
}

String ddd = yy+"-"+mm3;

int week = cal.get(Calendar.DAY_OF_WEEK);	// 요일정보(숫자)를 가져온다.(필수요소)★★★
int lastday = cal.getActualMaximum(Calendar.DATE);	// 마지막 날짜값을 가져온다.(필수요소)★★★

// out.print("요일:"+week);					// 일요일 1 ~ 토요일 7
// out.print(" 마지막날:"+lastday);
%>    

<%
String tt = ",";						// 예약날짜를 누적시키기 위한 변수
int day4 = 0;

String sql = "SELECT UNQ,to_char(DAY,'dd AM hh:mm') DAY "
		   +" FROM SCHEDULE WHERE USERID='test1' "
		   +" AND to_char(DAY,'yyyy-mm')='"+ddd+"' ";
ResultSet rs = stmt.executeQuery(sql);

while(rs.next()){
	String unq = rs.getString("UNQ");
	String day = rs.getString("DAY");	// 예약날짜
	String[] day2 = day.split(" ");		// [년-월-일][AM][시:분]
	String[] day3 = day2[2].split(":");	// [시][분]
	
	day4 = Integer.parseInt(day2[0]);	// int 타입으로 바뀌면서 앞에 0 이 붙을 경우, 제거된다. ()	
	tt += day4+",";
}
// out.println(tt);

%>

<%
//1.get 방식으로 넘겨줄 예약날짜 값(달력의날짜랑 같아야함...) 가져오기.
//2.get 방식으로 넘겨줄 예약번호(unq) 값 가져오기.. 
//예약날짜를 배열화 해서 넣기. 혹은 List 로 저장.
//	int[] ss1 = new ss1[100];		// 예약날짜
//	int[] ss2 = new ss1[100];		// 예약날짜의 unq 값
//	int cnt = 0;
//while(rs.next()) {
//	ss1[cnt] = 날짜값;		--> 5 
//	ss2[cnt] = unq값;		--> 5
//	cnt++;
//	}

int[] dayy = new int[100];		// 예약날짜
int[] unqq = new int[100];		// 예약날짜의 unq 값
String[] day22 = new String[100];
int cnt = 0;
String sql2 = "SELECT 	 UNQ	"
				+"      ,USERID "
				+"		,NAME 	"
				+"		,to_char(RD,'yyyy-mm-dd AM hh:mm:ss') RD	"
				+"		,to_char(DAY,'yyyy-mm-dd AM hh:mm') DAY2	"
				+"		,PP		"
				+"		,MENU	"
				+"		,EA		"
				+"		,to_char(PRICE,'999,999,999') PRICE "
				+"		,decode(STATE,'1','미확인','2','확정','3','취소') STATE "
				+"		,nvl(RQ,'요청사항 없음') RQ "
		    	+" FROM SCHEDULE WHERE USERID='test1' ";
ResultSet rs2 = stmt2.executeQuery(sql2);
while(rs2.next()){
	String unq = rs2.getString("UNQ");
	String userid = rs2.getString("USERID");
	String name = rs2.getString("NAME");
	String rd = rs2.getString("RD");
	String day2 = rs2.getString("DAY2");
	String pp = rs2.getString("PP");
	String menu = rs2.getString("MENU");
	String ea = rs2.getString("EA");
	String price = rs2.getString("PRICE");
	String state = rs2.getString("STATE");
	String rq = rs2.getString("RQ");
	
//	dayy = day22.split(" ");		// [년-월-일][AM][시:분]
//	System.out.println(unq);
	unqq[cnt]  = Integer.parseInt(unq);
//	dayy[cnt]  = day22[0];
	cnt++;

//	System.out.println(dayy[0]);
}
for(int i=0; i<unqq.length; i++){
	System.out.println(unqq[i]);	
}


%>


<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>예약</title>
  <link rel="stylesheet" href="scheduleList.css?after"/>  <!-- 외부 css파일 불러오는 태그 -->
 </head>
 
<script>
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
 		<!-- header Start -->
		<!-- header End -->
	</header>
	<nav>
		<!-- Top Menu Start -->
		<!-- Top Menu End -->
	</nav>
	<aside>
	</aside>
<section>
	<div>
	<form name="frm1" method="post" action="scheduleList.jsp">
	<input type="text" name="year" size="10">년
	<input type="text" name="month" size="10">월	
	<button type="submit" onclick="fn_action(); return false;">달력보기</button>			<!--  return false 로 자동전송 되는걸 막는다. -->
	</form>
	</div>
<%
int t_mm = mm+1;

int b_yy = yy;
int b_mm = t_mm-1;
if(b_mm == 0) {
	b_yy--;
	b_mm = 12;
}

int n_yy = yy;
int n_mm = t_mm+1;
if(n_mm > 12) {
	n_yy++;
	n_mm = 1;
}
%>
	<form name="frm2" method="post" action="scheduleList.jsp">
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
	<form name="frm3" method="post" action="scheduleList.jsp">
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
		int nn = 0;								// 날짜 줄바꿈(개행) 하기위한 임의의 변수
		for(int s=1; s<week; s++){				// 공백찍는 for문
			nn++;
			out.print("<td></td>");
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
						
			String vdate = yy+"-"+(mm+1)+"-"+d;	// 현재년월과 반복문으로 만들어진 날짜값을 세팅
			// indexOf 를 통해서 예약날짜와 달력날짜의 일치여부 확인
			String dd1 = ","+d+",";
			int dd2 = tt.indexOf(dd1);
			
			if(today.equals(vdate)){							// 실제날짜(년월일)과 같은지 비교(두 변수값이 같다면..)
				bgcolor = "lightgray!important";				// 라이트그레이로 바꾼다.
			} else if(dd2 > -1) {								// 예약날짜와 vdate 가 일치할 경우..
				bgcolor = "lavender!important";					// bgcolor를 라벤더로 바꾼다. 
			} else if(dd2 > -1 && today.equals(vdate)) {		// 예약날짜,실제날짜와 달력날짜가 같다면..
				bgcolor = "lavender!important";					// bgcolor를 라벤더로 바꾼다. 
			} else {											// 그 외에는..
				bgcolor = "floralwhite";						// bgcolor를 플로랄화이트로 바꾼다.
			}
			%>
			<td style="color:<%=color%>; background-color:<%=bgcolor %>"><%=d %>	<!-- 숫자를 찍고, td 에 폰트컬러를 적용한다. -->
			<%
				if(dd2 > -1){
					out.print("<br><a href='scheduleList.jsp?unq=1&day=2024-09-05'>예약</a>");	// 이런모양으로 데이터를 받을 수 있게 연구할것.(sql을 하나더 활용해서 구현)
//					out.print("<br><a href='scheduleList.jsp?unq='"+unq+"'&day=2024-09-05'>(1)</a>");
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
	<table class="table2">
		<tr>
			<td>예약번호</td>
			<td colspan="3" style="height:15%;"></td>
		</tr>
  		<tr>
			<td>고객명</td>
			<td></td>
			<td>인원수</td>
			<td> (명)</td>
		</tr>
		<tr>
			<td>접수일시</td>
			<td></td>
			<td>예약상태</td>
			<td></td>
		</tr>
		<tr>
			<td>예약일<br>(내점예정일)</td>
			<td></td>
			<td>가격총계</td>
			<td> (원)</td>
		</tr>
		<tr>
			<td>예약메뉴<br>(수량)</td>
			<td colspan="3" style="height:20%; overflow:auto;">()</td>
		</tr>
		<tr>
			<td>고객요청사항</td>
			<td colspan="3" style="height:25%; overflow-y:scroll; overflow-x:hidden;"></td>
		</tr>
	</table>
</section>
	<footer>
		<!-- footer Start -->
		<!-- footer End -->
	</footer>
 </body>
</html>
