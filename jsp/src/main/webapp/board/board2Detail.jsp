<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/oracleCon.jsp" %>
<%@ include file="../include/code.jsp" %>

<!-- 파라메터 설정 -->
<%
String unq = request.getParameter("unq");
if(unq==null || unq.equals("")){
%>
	<script>
	alert("잘못된 접근입니다.");
	location="board2List.jsp";
	</script>
<%
	return;
}

String sql2="select count(*) from board2 where unq='"+unq+"'";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt(1);
if(cnt == 0){
%>
	<script>
	alert("잘못된 접근입니다.");
	location="board2List.jsp";
	</script>
<%
	return;
}
%>
<!-- 조회수 증가 -->
<%
String sql3 ="update board2 set hits=hits+1 where unq='"+unq+"' ";
stmt.executeUpdate(sql3);
%>

<!-- 상세보기 SQL 작성/적용 -->
<%
String sql="SELECT title"
			+"		,writer "
			+"		,content "
			+"		,to_char(rdate,'yyyy-mm-dd') rdate "
			+"		,to_char(udate,'yyyy-mm-dd') udate "
			+"		,hits "
			+"		,gubun "
			+"	FROM BOARD2 "
			+" where unq='"+unq+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

String title = rs.getString("title");
String writer = rs.getString("writer");
String content = rs.getString("content");
String rdate = rs.getString("rdate");
String udate = rs.getString("udate");
String hits = rs.getString("hits");
String gubun = rs.getString("gubun");


if(udate == null){
	udate = "변경없음";
} 

// \n => <br>
content = content.replace("\n", "<br>");

String sql4="select "
			+"		(select nvl(max(unq),0) from board2 where gubun='"+gubun+"' and unq <'"+unq+"') bef, "
			+"		(select nvl(min(unq),0) from board2 where gubun='"+gubun+"' and unq >'"+unq+"') nex "
			+"	from dual ";
ResultSet rs4 = stmt3.executeQuery(sql4);
rs4.next();

int bef_unq = rs4.getInt(1);
int nex_unq =  rs4.getInt(2);

// 댓글 출력 SQL
String sql5 = "select unq,content,to_char(rdate,'yy.mm.dd') rdate, lev "
				+"	from board2sub "
				+"	where punq='"+unq+"' order by unq asc";
ResultSet rs5 = stmt.executeQuery(sql5);
%>

<!-- 화면출력 -->
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title><%=msg %> 상세보기</title>
  
  <link rel="stylesheet" href="../css/style.css" />
  <link rel="stylesheet" href="../css/board.css" />
 </head>
 
 <style>
 td {
 	text-align :left;
 }
 
 .textarea1 {
 	width:72%;
 	height:100px;
 }
 
 </style>

<script>
function fn_action(unq,content,lev) {
	
	document.frm.content.value = content;
	// let len = document.frm.lev.length;
	// let bool = document.frm.lev[2].checked;
	// alert(bool);
	document.frm.lev[lev-1].checked = true;
	document.frm.munq.value = unq;
	document.frm.mode.value = "U";
	document.getElementById("btnSave").innerText = "수정";
	document.getElementById("btnSpan").innerHTML 
		= "<button type=\"submit\" class=\"button4\" style=\"height:35px;\" onclick=\"fn_submit('2');return false;\">삭제</button>";
}

function fn_submit(nn) {
	
	let content = document.frm.content;
	let pass = document.frm.pass;
	if(nn == "1") {
		if(content.value == "") {
			alert("댓글을 입력해주세요.");
			content.focus();
			return false;
		}
	}
	if(pass.value == "") {
		alert("암호를 입력해주세요.");
		pass.focus();
		return false;
	}
	if(nn == "2") {
		document.frm.mode.value = "D";
	}
	document.frm.submit();
	
}

</script>


 <body>
  
  <header>
  	<!-- header S -->
	<%@ include file="../include/header.jsp" %>
	<!-- header E -->
  </header>
  
  <nav>
	<!-- top menu S -->
	<%@ include file="../include/topMenu.jsp" %>
	<!-- top menu E --> 
  </nav>
  
  <aside>
   	<%@ include file="../include/aside.jsp" %>
  </aside>
  
  <section>
  
	<div class="div_title">
		<%=msg %> 상세보기
	</div>
	
	<div class="div_agrees">
		<table class="table_member">
			<colgroup>
				<col width="20%"/>
				<col width="*%"/>
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
								height:150px;
								padding-left:10px;
								background-color:yellow;
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
			
			
		</table>
		
		<div>
		<%
		if(bef_unq == 0){
			out.print("<button type=\"button\" onclick=\"alert('이전 글이 없습니다.')\">이전 글</button>");
		}else {
		%>
			<button type="button" onclick="location='board2Detail.jsp?unq=<%=bef_unq%>'">이전 글</button>
		<%
		}
		
		if(nex_unq == 0){
			out.print("<button type=\"button\" onclick=\"alert('다음글 이 없습니다.')\">다음 글</button>");
		} else {
		%>
			<button type="button" onclick="location='board2Detail.jsp?unq=<%=nex_unq%>'">다음 글</button>
		<%
		}
		%>
			
		</div>
		
		
		<div style="margin-top:10px; text-align:center;">
			<button type="button" class="button4"
			 			onclick="location='board2Modify.jsp?unq=<%=unq %>'">수정</button>
			<button type="button" class="button4" 
						onclick="location='passWrite.jsp?unq=<%=unq %>&tbl=board2&code=<%=code %>'">
			삭제</button>
			<button type="button" class="button4" 
						onclick="location='board2List.jsp?tbl=board2&code=<%=code %>'">목록</button>
			
		</div>
		
		<form name="frm" method="post" action="board2ReSave.jsp">
		
		<input type="hidden" name="punq" value="<%=unq %>">
		<input type="hidden" name="mode" value="I">
		<input type="hidden" name="munq" value="">
		
		<div style="margin-top:20px;">
		<table class="table_member" style="width:900;">
			<tr>
				<td colspan="2">
					<input type="text" name="content" style="width:98%;height:50px;" placeholder="댓글입력">
				</td>
			</tr>

			<tr>
				<td style="padding-left:20px;">
				평점
				<input type="radio" name="lev" value="1"> 1
				<input type="radio" name="lev" value="2"> 2
				<input type="radio" name="lev" value="3" checked> 3
				<input type="radio" name="lev" value="4"> 4
				<input type="radio" name="lev" value="5"> 5
				</td>
				<td style="text-align:right;">
					<input type="password" name="pass" style="width:300px;height:30px;" placeholder="암호입력">
					<button type="submit" id="btnSave" style="height:35px;" class="button4"  onclick="fn_submit('1');return false;">저장</button>
					<span id="btnSpan" ></span>
				</td>
			</tr>
		</table>	
		
		
		</div>
		</form>
		
		<div>
		<table class="table_member">
			<colgroup>
				<col width="10%"/>
				<col width="70%"/>
				<col width="*"/>
			</colgroup>
			<tr >
				<td style="text-align:center;" >순번</td>
				<td style="text-align:center;" >내용</td>
				<td style="text-align:center;" >평점</td>
			</tr>
		<%
		int cnt2 = 0;
		int hap = 0;
		while(rs5.next()){
			
			String unq2		 = rs5.getString("unq");
			String content2	 = rs5.getString("content");
			String rdate2	 = rs5.getString("rdate");
			int lev			 = rs5.getInt("lev");
			cnt2++;
			hap += lev;
			
		%>
			<tr>
				<td style="text-align:center;"><%=cnt2 %></td>
				<td style="padding-left:20px;">
					<a href="javascript:fn_action('<%=unq2 %>','<%=content2 %>','<%=lev %>')"><%=content2 %></a>
				</td>
				<td style="text-align:center;">
				<%
				for(int i=0; i<lev; i++){
				%>	
					<img src="../images/goldstar.png" width="20" height="20">
				<%
				}
			
				for(int i=0; i<(5-lev); i++){
				%>	
					<img src="../images/silverstar.png" width="20" height="20">
				<%	
				}
				%>
				</td>
			</tr>
					
		<%
		}
		if(cnt2 == 0){
		%>
			<tr>
				<td colspan="3" style="text-align:center;">
				댓글이 없습니다.
				</td>
			</tr>
		<%
		}
		%>
		</table>
		
		<%
		double avg = 0;
		
		if(cnt2 != 0){
			avg = (double)hap/cnt2;
			String[] s1 = (avg+"").split("\\.");
			int s2 = Integer.parseInt(s1[0]);
			boolean s3 = s1[1].equals("0");
			
			for(int i=0; i<s2; i++) {
			%>
				<img src="../images/goldstar.png" width="20" height="20">
			<% 
			}
			if(s3 == false) {
			%>
				<img src="../images/halfstar.png" width="20" height="20">
			<%	
			}		
			if(s3 ==  true && s2< 5){
				for(int i=0; i<(5-s2); i++) {
			%>
				<img src="../images/silverstar.png" width="20" height="20">
			<%
				}
			} else if(s3 == false && s2< 5) {
				for(int i=0; i<(4-s2); i++) {
			%>
				<img src="../images/silverstar.png" width="20" height="20">
		<%
				}
			}		
		} 
		%>
		
		평점 평균 : <%=avg %>
		</div>
		
		
	</div>
	
  </section>
  
  <footer>
 	<!-- footer S -->
	<%@ include file="../include/footer.jsp" %>
	<!-- footer E -->
  </footer>  
  
 </body>
</html>
