<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    											pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
Map<String,String> map = new HashMap<String,String>();

String filePath = "c:/temp2/redday.txt";

FileReader fr = new FileReader(filePath);
BufferedReader br = new BufferedReader(fr);
String text = "";
while(true){
	String data = br.readLine();
	if(data == null){
		break;
	} else {
		String[] array = data.split(":");		// 날짜와 데이터값을 분리
		String[] days = array[0].split("-");	// 날짜만 다시 분리
		String col = days[0]+"-"
					+ Integer.parseInt(days[1])+"-"
					+ Integer.parseInt(days[2]);
		// String col = "2024-1-1";
		map.put(col, array[1]);
		// 세팅 : map.put("2024-1-1","신정");
		// 호출 : map.get("2024-1-1"); --> "신정" 이라는 값을 얻어내게 됨
		// 예)  map.put("eng","100");
		// 예)  map.get("eng"); --> "100" 출력
	}
}

//	map.get("2024-1-1");
// out.print(text);

%>

<%
// 출력 달력년월)을 받음
String vdate = request.getParameter("vdate");

Calendar cal = Calendar.getInstance();	// 인스턴스(객체)처리

int yy = cal.get(Calendar.YEAR);		// 현시점의 년도
int mm = cal.get(Calendar.MONTH);		// 현시점의 월
int dd = cal.get(Calendar.DATE);		// 현시점의 날(오늘날짜)

// ex) 2024-12-10 2024-9-1
String today = yy +"-"+ (mm+1) +"-"+ dd;


// 예) vdate = "2024-12"
// 넘어오는 날짜를 맞추려고 mm+1
if(vdate == null || vdate.equals("")){
	vdate = yy+"-"+(mm+1);
}
// vdate는 무조건 존재
String[] str = vdate.split("-");
int v_yy = Integer.parseInt(str[0]);
int v_mm = Integer.parseInt(str[1]);
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


<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>동화제약 관리모드</title>
  
  <link rel="stylesheet" href="/css/admStyle.css">
  <link rel="stylesheet" href="/css/jquery-ui.css">
  <link rel="stylesheet" href="/css/style.css">
  <script src="/js/jquery-3.7.1.js"></script>
  <script src="/js/jquery-ui.js"></script>
  
</head>

<style>
.locTd {
	font-size:15px;
	height:25px;
}
input,textarea,select {
	width:90%;
	font-size:15px;
	font-family:맑은 고딕;
}
textarea {
	height:100px;
}
.td {
	width: 98%;
	height:25px;
}
.button1 {
	padding:5px;
	font-size:12px;
	width:70px;
}
</style>

<style>
	.overflow {
	  height: 300px;
	}
</style>

<body>

<div class="adminTop">
	<%@ include file="../include/admMenu.jsp" %>
</div>

<div class="adminMain">
	<div>
	<table class="type08" align="center">
		<tr>
			<th style="font-size:20px;">
				일정달력
			</th>
		</tr>
	</table>
	<br>
		<table class="type08" align="center">	
			<caption style="text-align:left;">
				<% // 삼항연산 :: (비교연산식)?true:false %>
				<%=v_yy %>년 <%=(v_mm<10)?("0"+v_mm):(""+v_mm) %>월
				&nbsp;&nbsp;
				<a href = "/schList.do?vdate=<%=bef %>">(이전)</a>
				<a href = "/schList.do?vdate=<%=nex %>">(다음)</a>
				<a href = "/schList.do">(오늘)</a>
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
			%>
				<td height="80" width="100" bgcolor="<%=tdColor %>">
				<%=d %>
				<%
				if(map.get(v_today) != null){
					out.print(map.get(v_today));
				}
				
				// 날짜를 jstl 변수로 변환
				pageContext.setAttribute("schday", d);
				%>
				<br>
				
				<%
				// vdate(2024-12)의 값에서 출력날짜를 연결함
				
				%>
				
				<c:forEach var="map" items="${myMap }">
					<c:if test="${map.key == schday }">
						<a href="/schList.do?vdate=<%=v_today %>">일정(${map.value })</a>
					</c:if>
				</c:forEach>
				
				
				</td>
			<%
				if(tdCnt%7 == 0){
					out.print("</tr><tr>");
				}
			}
			%>
			</tr>
		</table>
		
		<div style="margin-bottom:10px;margin-top:5px;margin-left:20px; width:1050px; text-align:right;">
			<button type="button" onclick="location='/schWrite.do'">일정등록</button>
		</div>

		<div>
		<table class="type08" align="center">
			<tr>
				<th width="10%">순번</th>
				<th width="20%">시간</th>
				<th>제목</th>
				<th width="16%">비고</th>
			</tr>
			
			<c:forEach var="result" items="${list2 }"
				varStatus="status"> <% // jsp 주석을 사용해야함 그냥 ${} 사용하면 오류뜸 %>
			<tr align="center">
				<td>${status.count }</td>
				<td>
					${fn:substring(result.SCHDT,0,16) }
				</td>
				<td align="left">
					<span id="title_txt${status.count }">${result.TITLE }</span>
					<input type="text" name="title" id="title${status.count }" value="${result.TITLE }">
				</td>
				<td>
					<button type="button" onclick="fn_view('${status.count }')">+</button>
					<button type="button" onclick="fn_hide('${status.count }')">-</button>
					<button type="button" onclick="fn_modify('${result.UNQ }','${status.count }')">M</button>
					<button type="button" onclick="fn_delete('${result.UNQ }')">D</button>
				</td>
			</tr>		
			<tr>
				<td colspan="4">
					<div id="divCont${status.count }" style="width:98%;height:50px;">${result.CONT}</div>
					<div id="divTextarea${status.count }" style="width:98%;">
						<textarea name="cont${status.count }" id="cont${status.count }" >${result.CONT}</textarea>
						<button type="button" id="btn_modify${status.count }" onclick="fn_update('${result.UNQ }','${status.count }')">수정</button>
					</div>
				</td>
			</tr>
			</c:forEach>
		</table>
		</div>
		<p style="height:100px;">&nbsp;</p>
						
<script>

$(function(){
	for(var i=1; i<=48; i++){
		// 내용_텍스트
		$("#divCont"+i).hide();
		// 내용_입력상자
		$("#divTextarea"+i).hide();
		// 제목_입력상자
		$("#title"+i).hide();
	}
});

function fn_modify(unq,cnt){
	$("#divCont"+cnt).hide();
	$("#divTextarea"+cnt).show();
	$("#title_txt"+cnt).hide();
	$("#title"+cnt).show();
	
}

function fn_update(unq,cnt) {
	let title = $.trim($("#title"+cnt).val());
	let cont = $.trim($("#cont"+cnt).val());
	if(title==""){
		alert("제목을 입력해주세요");
		$("title"+cnt).focus();
		return false;
	}
	// JSON 형식
	let datas = {'title':title,'cont':cont,'unq':unq};
	$.ajax({
		type : "post",
		url : "/schUpdate.do",
		data : datas,
		success : function(data){
			if(data == "ok"){
				alert("수정처리 완료");
				location="/schList.do?vdate=<%=vdate %>";
			} else {
				alert("수정처리 실패");
			}
		},
		error : function(){
			alert("오류발생!!!!");
		}
	});


}


function fn_view(nn){
	$("#divCont"+nn).show();
	$("#divTextarea"+nn).hide();
	$("#title_txt"+nn).show();
	$("#title"+nn).hide();
}

function fn_hide(nn){
	$("#divCont"+nn).hide();
	$("#divTextarea"+nn).hide();
	$("#title_txt"+nn).show();
	$("#title"+nn).hide();
}

function fn_delete(unq){
	if(confirm("해당 일정을 삭제하시겠습니까?")){
		// location="/schDelete.do?unq="+unq;	너무 옛날거
		
		$.ajax({
			type : "post",
			url : "/schDelete.do",
			data : "unq="+unq,	
			
			datatype : "text",
			success : function(data){
				if(data == "ok"){
					alert("해당 일정을 삭제했습니다.");
					location="/schList.do?vdate=<%=vdate %>";
				} else {
					alert("다시시도해주세요.");
				}
			},
			error : function(){
				alert("오류발생!!!!");
			}
			
		});
		
	}
}


/*	document.getElementById("divCont1").style.display = "none";
	document.getElementById("divCont2").style.display = "none";
	
	function fn_view(nn){
		// 보이게
		document.getElementById("divCont"+nn).style.display = "block";
	}
	
	function fn_hide(nn){
		// 안보이게
		document.getElementById("divCont"+nn).style.display = "none";
	}
*/
</script>
		
				
	</div>
</div>
</body>
</html>