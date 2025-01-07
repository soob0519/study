<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    											pageEncoding="UTF-8"%>
    											
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>	<!-- jstl 의 c태그를 사용하기 위한 코드 -->
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>	<!-- jstl 의 fn(함수)태그를 사용하기 위한 코드 -->

<%													
// 저장소(Map,List,String[],기타 변수명)의 데이터 저장&출력 예시 ↓
// Map.put("title1","첫글입니다.");
// Map.put("title2","둘째입니다.");
// Map.get("title2");		-> "둘째글입니다." 를 가져옴.

// Map.put("2024-12-25","성탄절"); 만 넣어뒀을 경우..
// Map.get("2024-12-24");	-> 없는 데이터를 가져오려 할 경우, null을 출력(오류아님)

// List.add("첫글입니다.");
// List.add("둘째글입니다.");
// List.get(0);				-> "첫글입니다."; 를 가져옴.(자리번호 0번부터 시작.)
// List.get(1);				-> "둘째입니다."; 를 가져옴.
// List.get(5);				-> 없는 데이터를 가져오려 할 경우, 오류 발생시킴. (null 출력되지 않음)

// List.add(Map);			-> 리스트에 맵을 담을 수 있다.

// String[] str1 = {"첫글입니다.","둘째글입니다."};

// String[] str2 = new String[100];
// str2[0] = "첫글입니다.";
// str2[1] = "둘째글입니다.";

// Map <key-name,key-value> map = ~~~
Map<String,String> map = new HashMap<String,String>();									// 데이터를 누적시키기 위한 껍데기 맵

String filePath = "c:/html_work/[spring] eGovFrameDev-4.2.0-64bit/temp/redday.txt";		// 공휴일 데이터를 담고있는 소스파일의 경로. 
FileReader fr = new FileReader(filePath);												// 소스파일을 자바 시스템에 인식시킨다.
BufferedReader br = new BufferedReader(fr);												// 해당 파일 내용을 읽어들인다.
String text = "";																		// 데이터를 누적시키기 위한 문자열 변수.
while(true) {																			// 무한반복문
	String data = br.readLine();														// 데이터 1줄을 읽어들여서 변수 data 에 담는다. // 2024-01-01:신정 
	if(data == null){																	// 읽어들일 데이터가 없다면.
		break;																			// 반복문을 종료한다.
	} else {																			// 그 외에는..(데이터가 있다면)
		// ex) 2024-01-01:신정 
		String[] array = data.split(":");												// 콜론(:) 기호를 구분자로 날짜와 데이터값을 분리한다. 
		String[] days = array[0].split("-");											// '년-월-일'을 '년' '월' '일' 로 분리한다.
		String col = days[0]+"-"+
					Integer.parseInt(days[1])+"-"+										// 월 값의 앞에 붙는 0 을 제거한다. 
					Integer.parseInt(days[2]);											// 일 값의 앞에 붙는 0 을 제거한다.  최종적으로 날짜가 "2024-1-1" 형태로 변형됨.
		map.put(col,array[1]);															// map.put("2024-1-1","신정"); 과 같은 형태
		// 세팅 : map.put("2024-1-1","신정");
		// 호출 : map.get("2024-1-1"); -> '신정'이라는 값을 얻어내게 됨.
		// 예)   map.put("eng","100");
		//	     map.get("eng"); -> "100" 출력.
//		text += data+"<br>";															 
	}
}
//map.get("2024-1-1");																	// 컬럼값(2024-1-1)을 적으면 그에 대한 값(신정)이 얻어짐 
//out.print(text);

%>


<!-- 프로그램적인 요소는 상단에 작성한다. -->
<%
String vdate = request.getParameter("vdate");	// 출력 달(년월값)을 받음

Calendar cal = Calendar.getInstance();	// 캘린더 클래스의 인스턴스(객체) 처리.
int yy = cal.get(Calendar.YEAR);		// 현 시점의 년도
int mm = cal.get(Calendar.MONTH);		// 현 시점의 월::시스템값을 세팅. (0~11  :: 시스템에서 인식하는 1~12월값)
int dd = cal.get(Calendar.DATE);		// 현 시점의 날(오늘날짜)

// 예) today = 2024-12-10 or 2024-9-1
String today = yy+"-"+(mm+1)+"-"+dd;	// 현 시점의 년-월-일 을 세팅 

// 예) vdate = "2024-12"; (7자리)
if(vdate == null || vdate.equals("")){	// 출력 달 값이 없다면...
	vdate = yy+"-"+(mm+1);				// 현재(오늘) 시점으로 만든다.
}

// 여기서부터 vdate 값은 무조건 존재하는 상황
String[] str = vdate.split("-");
int v_yy = Integer.parseInt(str[0]);	//	2024
int v_mm = Integer.parseInt(str[1]);	//	12
String v_date = v_yy+"-"+v_mm;			// 년-월 을 세팅. 

// 출력하려는 달력의 시점을 세팅한다.
// 시점의 날짜는 1일날이 기본값(default)임
// 예1) 2025년 1월달 달력 :: cal.set(2025,0,1)
// 예2) 2025년 12월달 달력 :: cal.set(2025,11,1)
cal.set(v_yy,(v_mm-1),1);							// 출력 달의 첫번째 날짜로 (시점)세팅

int wk = cal.get(Calendar.DAY_OF_WEEK);				// 출력 달의 첫번째 날짜(1일)에 해당하는 요일값	★★★  :: 일(1),월(2),~~토(7)
int lastday = cal.getActualMaximum(Calendar.DATE);	// 출력달의 마지막 날짜	★★★

// 이전달 세팅
int b_yy = v_yy;									// b_yy 는 v_yy 값을 받는다.
int b_mm = v_mm-1;									// 이전달 = 출력달-1 가감처리
if(b_mm == 0){										// 이전달의 결과가 0과 같다면 해가(작년으로)바뀐거임.
	b_yy = b_yy-1;									// 년도값을 -1 가감처리.
	b_mm = 12;										// 월 값을 12로 만든다.
}

// 다음달 세팅
int n_yy = v_yy;									// 다음달의 년도는 출력년도 값을 받는다
int n_mm = v_mm+1;									// 다음달의 월은 출력월+1 값을 받는다.
if(n_mm == 13){										// 다음달의 계산이 13인 경우는 해가(내년)으로 바뀐거임.
	n_yy = n_yy+1;									// 년도값을 +1 증가처리.
	n_mm = 1;										// 월 값을 1로 만든다.
}
String bef = b_yy+"-"+b_mm;		// 이전달 버튼에 사용할 변수
String nex = n_yy+"-"+n_mm;		// 다음달 버튼에 사용할 변수

%>


<body>

<div class="adminTop">
	<%@ include file="../include/admMenu.jsp" %>
</div>

<div class="adminMain">
	<div>
	<table class="type08" align="center">
	<tr>
		<th style="font-size:20px;">
			일정목록(달력)
		</th>
	</tr>
</table>
<br>
	<table class="type08" align="center">
		<caption style="text-align:left;">
			<%=v_yy %>년 <%=(v_mm<10)?("0"+v_mm):(""+v_mm) %>월	<!-- 3항연산 :: (비교연산식)?true:false -->
			&nbsp;&nbsp;
			<button type="button"><a href="/schList.do?vdate=<%=bef%>">◀</a></button>
			<button type="button"><a href="/schList.do?vdate=<%=nex%>">▶</a></button>
			<button type="button"><a href="/schList.do">오늘</a></button>
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
		int tdCnt = 0;						// 네모칸(<td>)개수 카운트를 위한 변수.(7칸 찍은 후, 줄바꿈 하기위한 변수)
		for(int i=1; i<wk; i++){			// 날짜값이 없는 만큼(첫날값전까지) 공백칸 찍기위한 반복문.
			tdCnt++;
		%>	
			<td height="80"></td>
		<%	
		}
		
		for(int d=1; d<=lastday; d++){		// 1~마지막날까지 날짜값 찍는 반복문.
			tdCnt++;
			String v_today = v_date+"-"+d;	// ex: 2024-12-10 또는 2024-9-9
			String tdColor = "#ffffff";		// 흰색
			if(today.equals(v_today)) tdColor = "aliceblue";
		%>
			<td width="100" height="80" bgcolor="<%=tdColor%>">
			<%=d %>
			<%
			if(map.get(v_today) != null){
				out.print("<br>"+map.get(v_today));
			}
			
			pageContext.setAttribute("schday",d);	// JSP변수 d(날짜)를 JSTL변수로 변환하기 위한 코드.
			%>		
			<br>
			<c:forEach var="map" items="${myMap }">	<!-- 자바에서만든 맵을 반복문으로 한줄한줄 풀어서 아래와 같이 달력날짜와 비교한다 -->
				<c:if test="${map.key==schday }">	<!-- map.key 값과 JSTL로 만든 날짜변수 schday 랑 값이 같다면..-->
					<a href="/schList.do?vdate=<%=v_today%>">일정(${map.value })</a>				<!-- map.value 값을 찍는다. -->
				</c:if>
			</c:forEach>
			</td>
		<%
			if(tdCnt % 7 == 0){				// tdCnt 값이 7 의 배수라면..(7로 나눴을 때 값이 0 일 경우)
				out.print("</tr><tr>");		// 줄바꿈한다
			}
		}
		%>
		</tr>
	</table>		
	<div style="width:1070px; text-align:right; margin-top:10px;">
		<button type="button" onclick="location='/schWrite.do'">일정등록</button>
	</div>
	<br>		
	<div>
		<table class="type08" align="center">
			<tr>
				<th width="10%">예약순번</th>
				<th width="20%">예약시간</th>
				<th>제목</th>
				<th width="20%">비고</th>
			</tr>
		<c:forEach var="result" items="${list2 }" varStatus="status">	<% // items = controll 에서 넘어오는 데이터로써,  JSTL문법(${  })으로 받아야한다.  %>
			<tr align="center">
				<td>${status.count }</td>
				<td>
					${fn:substring(result.SCHDT,0,16) }
				</td>
				<td align="left">
					<span id="title_txt${status.count }">${result.TITLE }</span>	<!-- 기본출력되는 요소(수정버튼 클릭 시 감춤처리) -->
					<input type="text" name="title" id="title${status.count }" value="${result.TITLE }">	<!-- 수정버튼 눌렀을 때 활성화되는 요소 -->
				</td>
				<td>
					<button type="button" onclick="fn_view('${status.count }')">+</button>
					<button type="button" onclick="fn_hide('${status.count }')">-</button>
					<button type="button" onclick="fn_modify('${result.UNQ }','${status.count }')">수정</button>
					<button type="button" onclick="fn_delete('${result.UNQ }')">삭제</button>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<div id="divCont${status.count }" style="width:98%; height:30px;">	<% // ${status.count } = 1부터의 순서(번호 붙이는 JSTL 코드)  %>
						${result.CONT }	<!-- 기본출력되는 요소(수정버튼 클릭 시 감춤처리) -->
					</div>
					<div id="divTextarea${status.count }" style="width:98%;">
						<textarea name="cont${status.count }" id="cont${status.count }">${result.CONT }</textarea> <!-- 수정버튼 눌렀을 때 활성화되는 요소 -->
						<button type="button" id="btn_modify${status.count }" onclick="fn_update('${result.UNQ}','${status.count }')">저장</button>
					</div>
				</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	
	<p style="height:100px;">&nbsp;</p>
	
<script>

$(function(){		// 일정 내용 숨기고 펼치는 제이쿼리 코드.(밑에 자바스크립트랑 같은 내용.)
for(var i=1; i<=48; i++) {			// 일정이 여러개 있을 경우에 대응하기 위한 반복문.
	// 내용_텍스트
	$("#divCont"+i).hide();			// hide() = 감추는 제이쿼리 함수
	// 제목_입력상자
	$("#title"+i).hide();
	// 내용_입력상자
	$("#divTextarea"+i).hide();
}
/*	★★★★ 제이쿼리 함수(↑ function()) 안에 함수(↓ function())는 들어갈 수 없다.(아래처럼 제이쿼리 함수 바깥에다가 함수를 배치한다.)
function fn_view(nn) {
	$("#divCont"+nn).show();		// show() = 보이게하는 제이쿼리 함수
}
function fn_hide(nn) {
	$("#divCont"+nn).hide();
}
*/		
});
function fn_view(nn) {				// + 버튼 눌렀을 때..
	$("#divCont"+nn).show();		// 보이게하는 함수
	$("#divTextarea"+nn).hide();
	$("#title"+nn).hide();
	$("#title_txt"+nn).show();
}
function fn_hide(nn) {				// - 버튼 눌렀을 때..
	$("#divCont"+nn).hide();		// 감추는 함수
	$("#divTextarea"+nn).hide();
	$("#title_txt"+nn).show();		
	$("#title"+nn).hide();		
}
function fn_modify(unq,cnt) {
	$("#title_txt"+cnt).hide();
	$("#divCont"+cnt).hide();
	$("#title"+cnt).show();
	$("#divTextarea"+cnt).show();
}
function fn_update(unq,cnt) {
	let title = $.trim($("#title"+cnt).val());
	let cont = $.trim($("#cont"+cnt).val());
	if(title == ""){
		alert("제목을 입력해 주세요.");
		$("#title"+cnt).focus();
		return false;
	}
	let datas = {'title':title, 'cont':cont, 'unq':unq};		// JSON 형식 (키:밸류 형식)
	$.ajax({
		type : "post",
		url : "/schUpdate.do",
		data : datas,
		success : function(data) {
			if(data == "ok") {
				alert("수정처리완료");
//				location.reload();
				location="/schList.do?vdate=<%=vdate%>";
			} else {
				alert("수정처리실패");
			}
		},
		error : function() {
			alert("오류발생(데이터전송실패)");
		}
	});
}
function fn_delete(unq) {
	if(confirm("해당 일정을 삭제하시겠습니까?")) {
		// location = "/schDelete.do?unq="+unq;	// ← 기존의 구현방법. 이번엔 아래처럼 ajax 로 구현한다.
		
		$.ajax({
			type : "post",
			url : "/schDelete.do",
			data : "unq="+unq,			// 전송할 데이터
			datatype : "text",			// 리턴할 데이터 타입 (데이터전송 이후의 처리.)
			success : function(data) {	// ok 또는 fail 을 받았을 경우..
				if(data == "ok") {
					alert("해당 일정을 삭제했습니다.");
					location = "/schList.do?vdata=<%=vdate %>";
				} else if(data == "fail") {
					alert("일정 삭제에 실패했습니다.");
				}
			},
			error : function() {
				alert("오류발생!");
			}
		});
	}
}

/*
// 일정 내용을 (기본)숨기기 위한 자바스크립트 코드
document.getElementById("divCont1").style.display = "none";
document.getElementById("divCont2").style.display = "none";
function fn_view(nn) {												// + 버튼 클릭 시,		// nn="1"; , nn="2";
	document.getElementById("divCont"+nn).style.display = "block";	// 일정 내용을 보이게 만든다.
}
function fn_hide(nn) {												// - 버튼 클릭 시,
	document.getElementById("divCont"+nn).style.display = "none";	// 일정 내용을 안보이게 만든다.
}
*/
</script>

	</div>
</div>
</body>
</html>

		// 	입력을 위한 SQL. 
		INSERT INTO SCHEDULE2 ( UNQ
							  ,SCHDT
							  ,TITLE
							  ,CONT
							  ,USERID
							  ,REGDT )
			VALUES ( sch2_seq.nextval
				    ,#{schdt}
				    ,#{title}
				    ,#{cont}
				    ,#{userid}
				    ,sysdate )

	
		// 예약날짜별 예약건수 출력하기 위한 SQL.
		SELECT DD,COUNT(DD) AS CNT1 FROM (
			SELECT TO_CHAR(SCHDT,'DD') AS DD FROM SCHEDULE2
				WHERE USERID=#{userid}
					AND TO_CHAR(SCHDT,'YYYY-MM') = #{schdt}) A
		GROUP BY DD

		// 요약정보 출력하기 위한 SQL.
		SELECT UNQ,SCHDT,TITLE,CONT FROM SCHEDULE2
			WHERE TO_CHAR(SCHDT,'YYYY-MM-DD') = #{vdate}
		
		// 예약시간 중복 체크를 위한 SQL
		SELECT COUNT(*) FROM SCHEDULE2 
		WHERE 
			USERID = '${userid}'
		AND 
			to_char(SCHDT,'yyyy-mm-dd hh24:mi:ss') = '${schdt}'
			
		// 예약정보 수정을 위한 SQL
		UPDATE SCHEDULE2 SET TITLE=#{title},CONT=#{cont}
		WHERE UNQ=#{unq}
			
		
		
		

		@Controller
		public class ScheduleController {
			
			@Resource(name="scheduleService")
			ScheduleService scheduleService;
			
			@RequestMapping("/schWrite.do")
			public String schWrite() {
				return "admin/schWrite";
			}
			
			@RequestMapping("/schSave.do")						// 일정 글 작성 후, 저장버튼 클릭 했을 때, 실행되는 서비스.
			@ResponseBody
			public String insertSchedule(ScheduleVO vo) throws Exception {
				String msg = "ok";		
				int cnt = scheduleService.selectScheduleSchdtCnt(vo);	// 일정시간의 중복체크
				if(cnt >= 1) {
					msg = "already";
				} else {
					int result = scheduleService.insertSchedule(vo);	// 일정정보 저장 // result = 1 or 0 (내용 한개(행) 저장이므로 1 또는 0 리턴됨.)
					if(result == 0) msg = "fail";
				}
				return msg;
			}
			
			@RequestMapping("/schUpdate.do")
			@ResponseBody										// 리턴 메시지(msg) 전송하기 위한 어노테이션
			public String updateSchedule(ScheduleVO vo) throws Exception {
				String msg = "ok";
				int cnt = scheduleService.updateSchedule(vo);
				if(cnt != 1) msg = "fail";
				return msg;
			}
			
			@RequestMapping("/schDelete.do")
			@ResponseBody
			// 스프링 : MVC 패턴
			// M : 모델 (SQL 을 실행하기위한 흐름)
			// V : 뷰 (html, jsp)
			// C : 컨트롤러
			public String deleteSchedule(ScheduleVO vo) throws Exception {
				String msg = "ok";
				int cnt = scheduleService.deleteSchedule(vo);
				if(cnt != 1) {
					msg = "fail";
				}
				return msg;
			}
			
			@RequestMapping("/schList.do")
			public String schList(ScheduleVO vo
								 ,String vdate
								 ,ModelMap model) throws Exception {
				
				Map<String,String>	map = new HashMap<String,String>();		// Map 선언.(비어있는상태) 
				
				Calendar cal = Calendar.getInstance();
				int yy = cal.get(Calendar.YEAR);
				int mm = cal.get(Calendar.MONTH)+1;
				
				String vdate2 = vdate;					// 변형되지 않은 vdate 값을 사용하기 위한 변수 vdate2
				
				if(vdate == null || vdate.equals("")) {	// vdate 값이 넘어오지 않았다면..(null 이거나 공백이라면)
					vdate = yy+"-"+mm;					// vdate 값을 현재 년-월 로 만든다.
				} else {								// 날짜형태가 2024-12-25 처럼 일(day) 값까지 다 붙을 경우에 대비한 코드.
					String[] str = vdate.split("-");	// 마이너스(-)기호를 구분자로해서 년 월 일 값을 분리한다.
					vdate = str[0]+"-"+str[1];			// 2024-12(년월) 의 형태로 만든다.
				}
				
				vo.setUserid("test1");
				vo.setSchdt(vdate);
				
				List<?> list = scheduleService.selectScheduleSchdt(vo);	// 출력달력(년월)의 날짜별 일정개수를 얻는 서비스 // 출력되는 내용이 리스트로 자바에 전달된다.
				System.out.println("list : "+list);
				
				for(int i=0; i<list.size(); i++) {
					Map<String,Object> map1 = (Map<String,Object>)list.get(i);
//					System.out.println("map1 :"+map1);
					String dd = map1.get("DD")+"";
					String cnt = map1.get("CNT1")+"";
					map.put(dd, cnt);
				//	리스트에 담긴 데이터를 맵형태로 만들기 위한 반복문. (입력되는 모양 예시)↓
				//	map.put(키값,데이터값);		-> map.get(키값) : 데이터값출력.
				//  map.put(날짜,예약건수);			
				//	map.put("20","1");
				//	map.put("09","1");
				//	map.put("03","1");
				//	map.put("12","2");
				//	map.put("11","1");  맵에 데이터를 담는 모습.
				//	결과는 이렇게 된다. {20=1,09=1,03=1,12=2,11=1}
				}
//				System.out.println("0000000000000000000");								// schList.jsp Line 274 html 주석에 의한 오류발생 원인을 찾기위한 출력.(0~4까지) // 해결방법: JSP 주석으로 대체한다. 
				// vdate2 = "2024-12-1", "2024-1", "2024-12", "2024-1-1", "2024-10-7"   // 정상적인 년월일 값이라면 데이터 길이가 최소 8자리 이상이어야한다. 
				if(vdate2 != null && vdate2.length() >= 8 ) {							// vdate2 값이 null 이 아니고, 길이가 8자리 이상일 경우에 실행되는 조건문.
					System.out.println("11111111111111");
					String[] str = vdate2.split("-");									// 한자릿수 월,일 값 앞에 0 을 붙이기 위한 분리작업.
					// ex: str[0] = "2024"; str[1] = "1"; str[2] = "9";
					String strY = str[0];
					String strM = str[1];
					String strD = str[2];
//					System.out.println("222222222222222");
					if(str[1].length() == 1) {
						strM = "0"+strM;
					}
					if(str[2].length() == 1) {
						strD = "0"+strD;
					}
//					System.out.println("333333333333333333");
					vdate2 = strY+"-"+strM+"-"+strD;									// 이 시점에서 vdate2 형태가 변형된다.
					
					List<?> list2 =  scheduleService.selectScheduleListEntry(vdate2);	// 사용자가 특정날짜의 일정을 클릭했을 때, 간략한 정보를 띄우기 위한 서비스. 
					model.addAttribute("list2",list2);									//("JSP에서 활용할 변수명",데이터값);
					System.out.println("list2 : "+list2);
//					System.out.println("44444444444444444");
				}
				
				model.addAttribute("myMap",map);
				System.out.println("map : "+map);
				
				return "admin/schList";
				

//				model.addAttribute("list",list);
//				System.out.println(list);		// [{DD=13, CNT=2}, {DD=25, CNT=2}, {DD=10, CNT=1}]  DD=예약날짜, CNT=예약건수 # 리스트안에 맵이 들어가있다. == List[map]
				// 리스트에 요런식으로 데이터가 담긴다.↓ # 리스트 = [{맵},{맵},...{맵}] ,  # 맵 = { 컬럼명=데이터값 }
				//[{DD=13, CNT=2}, 				// 리스트의 첫번째 요소는 0번(자리번호)
				// {DD=25, CNT=2}, 
				// {DD=10, CNT=1}] 이런식으로 리스트에 맵형태로 값이 저장된것을, 맵에 컬럼형식으로 세팅한 다음, 화면에서 추출해내야 한다.
				// list.get(0).get("DD")  :: 13
				// list.get(0).get("CNT") :: 2
			}	

		}

		