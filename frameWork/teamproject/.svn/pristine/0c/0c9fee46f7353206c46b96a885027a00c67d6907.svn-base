<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- DB 연결 -->
<%@ include file="/include/oracleCon.jsp" %>
<%@ include file = "code.jsp" %>

<!-- boardList.jsp 로부터 넘겨받을 파라미터(변수 unq)값 설정 및 예외처리  -->
<% 
String unq = request.getParameter("unq");
if(unq == null || unq.equals("")){			// 존재하지 않는 unq 값을 받았을 경우의 예외처리.
%>
	<script>
		alert("잘못된 접근입니다.");				// 팝업메시지 출력	
		location = "board2List.jsp";			// 페이지 이동 처리
	</script>
<%
	return;
}
%>

<!-- 파라미터(변수)값 unq 가 올바른 값인지, 또는 존재여부를 파악하기 위한 SQL -->
<%
String sql2 = "SELECT COUNT(*) FROM board2 WHERE unq = '"+unq+"'";
ResultSet rs2 = stmt.executeQuery(sql2);								// sql2 를 실행하고 그 결과를 rs2 에 저장.
rs2.next();																// DB에서 데이터를 한개씩 확인 
int cnt = rs2.getInt(1);												// 데이터가 존재한다면 cnt 에 숫자 1을 저장 
if(cnt == 0){															// cnt 값이 0 이라면..
%>
	<script>
		alert("잘못된 접근입니다.");
		location = "board2List.jsp";
	</script>
<%
	return;
}
%>

<!-- 게시글 클릭 시, 조회수 증가를 위한 SQL ↓ -->
<%
String sql3 = "UPDATE board2 SET hits = hits+1 WHERE unq = '"+unq+"'";
stmt.executeUpdate(sql3);	// 조회수만 증가하면 되기 때문에(사용자에게 따로 알려줄 메시지 없음), SQL 실행결과 메시지를 출력하는 코드는 작성하지 않는다.
%>

<!-- 게시글 상세보기 SQL 작성 및 적용 -->
<%
String sql = "SELECT title "
		   +" 		,writer "
		   +" 		,content "
		   +" 		,to_char(rdate,'yyyy.mm.dd') rdate "
		   +" 		,to_char(udate,'yyyy.mm.dd') udate "
		   +" 		,hits "
		   +" 		,gubun "
		   +" FROM board2 " 
		   +" WHERE unq='"+unq+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

String title 	= rs.getString("title");
String writer 	= rs.getString("writer");
String content 	= rs.getString("content");
String rdate 	= rs.getString("rdate");
String udate 	= rs.getString("udate");		// null 값 처리
String hits	 	= rs.getString("hits");
String gubun	= rs.getString("gubun");
// DB에 평점 컬럼 추가해야한다.★

if(udate == null){
	udate = "변경없음";
}
//String msg = "분실물";		# include 처리
//if(gubun.equals("2")){
//	msg = "습득물";
//}

// 사용자가 글 작성 시, 내용(content)에 줄바꿈(\n) 했더라도, 브라우저에서는 \n 을 인식하지 못한다.★★★
// 즉 \n 을 <br> 태그로 바꿔야 브라우저에서도 줄바꿈이 적용된다.★★★
// \n 은 콘솔(이클립스)에서 줄바꿈 시 사용하는 문자.
content = content.replace("\n","<br>");


// 이전글,다음글 버튼 기능 구현을 위한 sql ↓
String sql4 = "SELECT " 
			+"	(select nvl(max(unq),0) from board2 where gubun='"+gubun+"' and unq < "+unq+") bef, "	// 이전글:  현재 unq 값보다 작은 unq 중에 제일 큰 값.
			+"	(select nvl(min(unq),0) from board2 where gubun='"+gubun+"' and unq > "+unq+") nex "    // 다음글:  현재 unq 값보다 큰 unq 중에 제일 작은 값.
			+" FROM " 
			+"    dual";
ResultSet rs4 = stmt.executeQuery(sql4);	// 메모리에 올라감
rs4.next();									// 출력 결과를 한줄씩 가져온다.
int bef_unq = rs4.getInt(1);				// bef	첫번째 컬럼?
int nex_unq = rs4.getInt(2);				// nex	두번째 컬럼?

		
// 댓글 출력을 위한 SQL ↓
String sql5 = "SELECT unq,content,to_char(rdate,'yy.mm.dd') AS rdate "
			+ " 	FROM board2sub "
			+ " WHERE punq = '"+unq+"'";		// 부모글의 unq 값
ResultSet rs5 = stmt.executeQuery(sql5);
%>

    
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title><%=msg %></title>
  <link rel="stylesheet" href="myPageBoard.css"/>
 </head>
 
 <script>
function fn_action(unq,content){
	document.frm.content.value = content;
//	let len = document.frm.lev.length;			// 배열의 길이 5
//	let bool = document.frm.lev[2].checked;		// 체크한 배열번호의 true false
//	alert(bool);
//	document.frm.lev[lev-1].checked = true;
	document.frm.munq.value = unq;
	document.frm.mode.value = "U";				// 수정모드
	document.getElementById("btnSave").innerText = "수정";
	document.getElementById("btnSpan").innerHTML
						= "<button type=\"submit\" onclick=\"fn_submit('2'); return false;\" class=\"button4\">삭제</button>";
}
function fn_submit(nn){
	let content = document.frm.content;
	let pass = document.frm.pass.value;
	if(nn == "1"){
		if(content.value == "") {
			alert("내용을 입력해 주세요.");
			content.focus;
			return false;
		}
	}
	if(pass.value == ""){
		alert("암호를 입력해 주세요.");
		pass.focus;
		return false;
	}
	if(nn == "2"){
		document.frm.mode.value = "D";		// 삭제처리를 위한 값
	}
	document.frm.submit();
}
 </script>
 
 <style>
 td {
 	text-align: left;
 	color: skyblue;
 }
 .textarea1 {
 	width: 72%;
 	height: 200px;
 }
 body > section > div.div_agrees > form > table > tbody > tr:nth-child(2) > td {
 	text-align: right;
 }
 body > section > div.div_agrees > div:nth-child(2) {
 	margin-top: 10px;
 }
 body > section > div.div_agrees > form > table > tbody > tr > td > input {
 	background-color: ivory;
 	border-radius: 10px;
 	border: 1px solid skyblue;
 	color: skyblue;
 	outline:none;
 }
body > section > div.div_agrees > form > table > tbody > tr:nth-child(2) > td > input.inp2::placeholder {
 	color: skyblue;
 }
 body > section > div:nth-child(3) > table > tbody > tr:hover {
 	background-color: ivory;
 }
 body > section > div:nth-child(3) > div {
 	color: skyblue;
 }
 body > section > div.div_agrees > form > table > tbody > tr:nth-child(2) > td > button {
 	margin-left: 10px;
 }
 body > section > div:nth-child(3) > table > tbody > tr:nth-child(1) > td:nth-child(-n+3) {
 	font-weight: bold;
 }
 </style>

 <body>
 	<header>
 		<!-- header Start -->
		<%@ include file = "header.jsp" %>
		<!-- header End -->
	</header>
	<nav>
		<!-- Top Menu Start -->
		<%@ include file = "topMenu.jsp" %>
		<!-- Top Menu End -->
	</nav>
	<section>
		<div class="divTitle">
			<%=msg %> 상세보기
		</div>
		<div class="div_agrees" style="height:700px;">
		<table class="table_member">
			<colgroup>
				<col width="20%"/>
				<col width="*"/>			
			</colgroup>
			<tr>
				<th>제목</th>
				<td><%=title %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=writer %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<div style="width:98%; 
							    height:200px;
							    padding-left:10px;
							 /* background-color:ivory; */
							    overflow-y:scroll;"><%=content %></div>
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><%=rdate %></td>
			</tr>
			<tr>
				<th>변경일</th>
				<td><%=udate %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=hits %></td>
			</tr>
			<%if(code.equals("1")){ %>
			<tr>
				<th>평점</th>
				<td style="padding-left: 5px; text-align:left;">
					<%
//					for(int i=0; i<lev; i++){
					%>
						<img src="goldStar.JPG" width="16" height="20">
					<%
//					}
//					for(int i=0; i<(5-lev); i++){
					%>
						<img src="silverStar.JPG" width="16" height="20">
					<%
//					}
					%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
			<div>
			<%
			if(bef_unq == 0) {
				out.print("<button type=\"button\" class=\"button4\" onclick=\"alert('이전글이 없습니다.')\">이전글</button>");
			} else {
			%>
				<button type="button" class="button4" onclick="location='boardDetail.jsp?code=<%=code %>&unq=<%=bef_unq%>'">이전글</button>
			<%
			}
			%>
			<%
			if(nex_unq == 0){
				out.print("<button type=\"button\" class=\"button4\" onclick=\"alert('다음글이 없습니다.')\">다음글</button>");
			} else {
			%>
				<button type="button" class="button4" onclick="location='boardDetail.jsp?code=<%=code %>&unq=<%=nex_unq%>'">다음글</button>
			<%
			}
			%>
			</div>
			<div style="margin-bottom:10px; text-align:center;">
				<button type="button" class="button4" onclick="location='boardModify.jsp?unq=<%=unq%>&code=<%=code%>'">수정</button>
				<button type="button" class="button4" onclick="location='boardList.jsp?code=<%=code%>'">목록</button>
				<button type="button" class="button4" onclick="location='passWrite.jsp?unq=<%=unq%>&tbl=board2&code=<%=code%>'">삭제</button>
			</div>
			
			<%
			if(code.equals("2")){ 
			%>
			<form name="frm" method="post" action="boardReSave.jsp?code=<%=code%>">				
				<input type="hidden" name="punq" value="<%=unq %>">
				<input type="hidden" name="mode" value="I">		<!-- 댓글등록 버튼 클릭 시, 입력 or 수정처리 관련 -->
				<input type="hidden" name="munq" value="">
				
				<table style="width:100%;">
					<tr>
						<td>
							<textarea name="content" class="inp1" style="width:99%;height:50px; background-color:ivory; border-radius:10px; border:1px solid skyblue; color:deepskyblue; outline:none;"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" name="pass" class="inp2" placeholder="암호를 입력해주세요." style="height:20px; margin-right:10px;">
							<button type="submit" id="btnSave" onclick="fn_submit('1'); return false;" class="button4">댓글등록</button>
							<span id="btnSpan"></span>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div style="margin-top:20px;">
			<table style="width:1000px; margin-left:40px;">
				<tr>
					<td width="10%" style="text-align:center;">순번</td>
					<td width="90%" style="text-align:center;">내용</td>
				</tr>
			<%
			int cnt2 = 0;
			int hap = 0;
			while(rs5.next()){
				String unq2 = rs5.getString("unq");
				String content2 = rs5.getString("content");
				String rdate2 = rs5.getString("rdate");
			//	int lev = rs5.getInt("lev");
				cnt2++;
			//	hap += lev;
			%>
				<tr>
					<td style="padding: 0px; text-align:center;"><%=cnt2 %></td>
					<td style="padding: 0px;"><a href="javascript:fn_action('<%=unq2%>','<%=content2%>')"><%=content2 %></a></td>
				</tr>
			<%	
			}
			if(cnt2 == 0) {
			%>
				<tr>
					<td colspan="3" style="text-align:center;">
						댓글이 없습니다.
					</td>
				</tr>
			<%
			}
			}
			%>
			</table>
		</div>

	</section>
	<footer>
		<!-- footer Start -->
		<%@ include file = "footer.jsp" %>
		<!-- footer End -->
	</footer>
 </body>
</html>
