<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
  
  <link rel="stylesheet" href="../css/style.css" />
 
 </head>
 
 <style>
 
 .div_title{
	position:relative;
	left:30px;
	top:40px;
	font-size:40px;
	font-weight:bold;
	color:#2f2f2f;
	width:840px;
	text-align:center;
 }
 
 .div_agrees {
	position:relative;
	left:30px;
	top:60px;
	width:840px;
	height:850px;	
	border:0px solid #cccccc;
	padding:10px;
	font-size:12px;
	line-height:3.0;
 }
 
 
 .button1{
	width:200px;
	padding:10px;
	font-size:14px;
	font-weight:bold;
	color:#ffffff;
	background-color:#0099ff;
	border:0px;
	cursor:pointer;/*pointer,help,progress,wait,cell*/
 }
 /*	hover  : 마우스 올렸을 경우 상태
	focus  : 커서가 위치하는 경우
	active : 클릭 순간의 경우
 */
 .button1:hover {
	background-color:#0000ff;
	box-shadow: 20px 5px 5px 0px #ffccff;
	/* 세로(공간),가로(공간),둥근모서리,그림자크기 */
 }
 .button1:focus {
	background-color:#cc0000;
 }
 .button1:active {
	background-color:#ffff00;
 }
 
 .table_member {
	width:400px;	
 }
 
 .table_member td {
	padding:10px;
 }
  
 hr {
	border:0px;
	height:1px;
	background:#e2e2e2;
 }
 
 .span_id {
	position:relative;
	top:1px;
	padding:10px;
	width:50px;
	border: 1px solid #cccccc;
	border-right:0px;
 }
 
 input {
	font-size:12px;
 }
 
 .input_id {
	padding:11px;
	border:1px solid #cccccc;
	border-left:0px;
	width:300px;
 } 
 
 .span_dot{
	position:relative;
	top:0px;
	left:-120px;
 } 
 
 .span_login_txt {
	position:relative;
	top:-5px;
 }
 
 .btn_submit {
	padding:3px;
	border:1px solid #cccccc;
	width:355px;
	background-color:#ffffff;
	font-size:15px;
	height:48px;
	color:#555555;
	cursor:pointer;
 } 
 
 .span_naver{
	position:relative;
	left:-70px;
 }
 
 .btn_search {
	width:104px;
	padding:10px;
	border:0px;
	background-color:#ffffff;
	cursor:pointer;
 }
 
 </style>
 
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
  aside영역
  </aside>
  
  <section>
	<div class="div_title">
		로그인
	</div>
	<div class="div_agrees">
		
		<table class="table_member" align="center">
			<tr>
				<td>
				<span class="span_id">ID</span><input type="text" name="userid" class="input_id" placeholder="아이디를 입력하세요.">
				</td>
			</tr>
			<tr>
				<td>
				<span class="span_id">PW</span><input type="password" name="pass" class="input_id" placeholder="비밀번호를 입력하세요." style="width:294px;">
				</td>
			</tr>
			<tr>
				<td valign="middle">
					<button type="submit" class="btn_submit">
						<span class="span_dot"><img src="../images/logo_dot.png"></span>
						<span class="span_login_txt">로그인</span>
					</button>
				</td>
			</tr>
			<tr>
				<td valign="middle">
					<button type="button" class="btn_submit">
						<span class="span_naver"><img src="../images/logo_naver.png"></span>
						<span class="span_login_txt">
							<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=OBEC7aY268pfOvZ94CGi&state=dce27c17484f6c4d2d778ef08c96c26c&redirect_url=https%3A%2F%2Fwww.dothome.co.kr%2Flogin_naver_check.php" target="_blank">네이버 아이디로 로그인</a>
						</span>
					</button>
				</td>
			</tr>
			<tr>
				<td>
				<input type="checkbox" name="chk">아이디저장
				</td>
			</tr>
			<tr>
				<td>
				<hr>
				</td>
			</tr>
			<tr>
				<td>
				<button type="button" class="btn_search">아이디찾기</button>
				<span>|</span>
				<button type="button" class="btn_search">비밀번호찾기</button>
				<span>|</span>
				<button type="button" class="btn_search">
				<a href="memberAgree.html">회원가입</a></button>
				</td>
			</tr>
		</table>
		
	</div>
	
  </section>
  
  <footer>
  	<!-- footer S -->
	<%@ include file="../include/footer.jsp" %>
	<!-- footer E -->
  </footer>  
  
 </body>
</html>
