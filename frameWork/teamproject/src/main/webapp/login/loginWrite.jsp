<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션검사(로그인 상태인지 체크하는 코드)
// 세션타입이라서 문자타입으로 만들어야한다. (스트링 괄호붙이거나, 뒤에 공백 붙여서 문자타입으로 만들기.)
String SessionUserid = (String)session.getAttribute("SessionUserid");		// 로그인 하지 않으면 null 값이 된다.
// 또는 String SessionUserid = session.getAttribute("SESSION_ID")+"";
%>
<%
request.setCharacterEncoding("utf-8");

%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>로그인 페이지</title>
  <link rel="stylesheet" href="../css/style.css" />
 </head>
 
 <style>
 	section{
	text-align:center;
	letter-spacing:-1px;
 }
 
 .login_main {
	width:1300px;
/*	margin-left:-10%; */
 }
 
 .div_title {
	font-size:32px;
	font-weight:bold;
	letter-spacing:-2px;
 }
 
  .input1 {
	width:415px;
	height:45px;
	border:1px solid #b3b3b3;
	margin-bottom:-1px;
 }
 
 .btn1 {
	border:0px;
	width:425px;
	height:55px;
	text-align:center;
	margin-top:10px;
	background-color:#0BA2FF;
 }
 
 .btn2 {
	border:0px;
	width:425px;
	height:45px;
	text-align:center;
	margin-top:5px;
	background-color:#03c75a;
 }
 
 .btn3 {
	border:0px;
	width:425px;
	height:45px;
	text-align:center;
	margin-top:5px;
	background-color:#fae100;
 }
 
 .btn4 {
	border:1px solid #cccccc;
	width:425px;
	height:45px;
	text-align:center;
	margin-top:5px;
	background-color:#ffffff;
 }
 
 .btn5 {
	border:0px;
	width:425px;
	height:45px;
	text-align:center;
	margin-top:5px;
	background-color:#1b74e4;
 }
 
 .tbl1 {
	margin-left:440px;
	margin-top:10px;
 }
 
 a {
	color:#4b4b4b;
	text-decoration:none;
	cursor:pointer;
 } 
 
 footer a:hover {
	text-decoration:underline;
 }
 
 .div1 {
	font-size:12px;
	margin-top:-10px;
 }
 
 .div2 {
	font-size:11px;
	border-top:1px solid #cccccc;
	border-bottom:1px solid #cccccc;
	padding:10px;
	margin-top:50px;
 }
 
 .div3 {
	margin-top:-20px;
	margin-left:700px;
 }
 
 .div4 {
	width:50%;
	border-right:1px solid #cccccc;
	font-size:11px;
	margin-top:50px;
	margin-left:50px;
 }
 
 .div5 {
	margin-top:-60px;
	margin-left:230px;
 }
 
 .div6 {
	font-size:11px;
	margin-top:-95px;
	margin-left:700px;;
 }
 
 .div7 {
	margin-top:-140px;
	margin-left:170px;
 }
 
 button {
	border-radius:3px;
 }
 
 .bnt1:hover {
	background-color:#0BA2FF;
 }

  
 </style>
  
 <script>
 
 function fn_change() {
	location = "http://"+value;
 }

 
 function fn_submit() {
	if (document.frm.userid.value == "") {
		alert("아이디를 입력하세요.");	
		document.frm.userid.focus();
		return false;
	}	
	
	if (document.frm.pass.value == "") {
		alert("비밀번호를 입력하세요.");	
		document.frm.pass.focus();
		return false;
	}	
	document.frm.submit();
 }
 
 </script>

	<body>
  
		<header>
	 	<div>
		</div>
	</header>
	<nav>
		<div>
		<table>
			<tr>
				<th><a href="/main.jsp">홈</a></th>
				<th><a href="/board/boardList.jsp">자주묻는 질문</a></th>
				<%
				if(SessionUserid == null){
				%>
				<th><a href="/login/loginWrite.jsp">로그인</a></th>
				<th><a href="/login/loginSelect.jsp">회원가입</a></th>
				<%
				} else {
				%>
				<th><a href="myPage/myPageSession.jsp">마이페이지</a></th>
				<th><a href="include/logout.jsp">로그아웃</a></th>
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
		<form name="frm" id="frm" method="post" action="loginSession.jsp">
		<div class="login_main">
			<h3 style="text-align:center;">로그인</h3>
				<div>
				<input type="text" class="input1" name="userid" placeholder=" 아이디">
				<br>
				<input type="password" class="input1" name="pass" placeholder=" 비밀번호">
				<br>
				<span style="margin-right:340px;font-size:12px;"><input type="checkbox">아이디 저장 </span>
				<br><br>
				<button type="button" class="btn1" onclick="fn_submit();"><b>로그인</b></button>
			</div>
			<br>
			<div class="div1">
				<a href="">아이디/비번찾기</a>
				&nbsp;·&nbsp;
				<a href="loginSelect.jsp" >회원가입</a>
				&nbsp;·&nbsp;
				<a href="https://www.guamplay.com/?pn=service.guest.order.list">비회원 예약조회</a> 
			</div>
			
			<br>
			<span style="font-size:12px;">
				──────────────── &nbsp;&nbsp; 또는 &nbsp;&nbsp; ──────────────────</span>
			
			<table class="tbl1">
				<tr>
					<td>
						<a href="https://nid.naver.com/oauth2.0/authorize?client_id=fxcIccsCFxwnM_fQ9Q3E&redirect_uri=https://www.guamplay.com/include/addons/sns_login/naver/callback.php&response_type=code&display=popup&scope=name,email" target="_blank">
						<button type="button" class="btn2"><img src="">네이버 로그인</button></a>
					</td>
				</tr>
				
				<tr>
					<td>
						
						<a href="https://accounts.kakao.com/login/?continue=https%3A%2F%2Fkauth.kakao.com%2Foauth%2Fauthorize%3Fresponse_type%3Dcode%26client_id%3D19968748f4162f85d8ff5f60205b5aea%26redirect_uri%3Dhttps%253A%252F%252Fwww.guamplay.com%252Finclude%252Faddons%252Fsns_login%252Fkakao%252Fcallback.php%26through_account%3Dtrue#login" target="_blank">
						<button type="button" class="btn3"><img src="">카카오 로그인</button></a>
					</td>
				</tr>
				
				<tr>
					<td>
						<a href="https://accounts.google.com/v3/signin/identifier?opparams=%253F&dsh=S420713801%3A1733994614953983&client_id=207061491062-cv5uvittbhmlvsogg57t4i6smakgee7r.apps.googleusercontent.com&ddm=1&o2v=2&redirect_uri=https%3A%2F%2Fwww.guamplay.com%2Finclude%2Faddons%2Fsns_login%2Fgoogle%2Fcallback.php&response_type=code&scope=email+profile&service=lso&flowName=GeneralOAuthFlow&continue=https%3A%2F%2Faccounts.google.com%2Fsignin%2Foauth%2Fconsent%3Fauthuser%3Dunknown%26part%3DAJi8hANo2CjSYALM0H680bbp1tDErIFmLWGiIqwULbX-Y8LRBxNjnfO-x8yLTM5o-m4jQfBJVZ2xfRLAIw2W3ej6QBEopUTj47FLPT7FK7v16lFxmpDONeMfEgamYI9jxATmejhUrL_-rqmNmlJxSdx_Uj9VWFEy3g45JWpcNg-Y2Wf8ijnS5tYi7h7pygWvU-3OSDploz5nMc4nKqk-BHzaY3OYUex5EZ7B2bwWTsHePNYzFPu7LduyiO05buJkPuC3Lbc4xLmlrxjGPnpZlUS4y4H-n_lw_K1kWJaO811ua74hqZ4bZb24Jj5o2qcAwXno4hFzlXekVQ-nHnRUUnps8vtq-pf1AZon9KwM4xBmF4qXC-EhBIy_MirLeH5zRDgNFeElxRy8fyUfmI84k7RaaxPMxnyN9lineU5_64DChuuU2bm00qDKSYhmj7YRhRPkoxg-1czYt9U85xitXll4gSG9ZsdXPg%26flowName%3DGeneralOAuthFlow%26as%3DS420713801%253A1733994614953983%26client_id%3D207061491062-cv5uvittbhmlvsogg57t4i6smakgee7r.apps.googleusercontent.com%23&app_domain=https%3A%2F%2Fwww.guamplay.com&rart=ANgoxccs5iLSPqnn91HfvdR81xpVCpVrrLRt3kc8_Q0UMDlgDa1uQNLtfJCpkbW6iuWbsLrA2KTZclS060Uy_snobLNHsuj0QWL_F2zBMKKhV0EiOJu4qDU" target="_blank">
						<button type="button" class="btn4"><img src="">Google 로그인</button></a>
					</td>
				</tr>
				
				<tr>
					<td>
						<a href="https://www.facebook.com/login.php?skip_api_login=1&api_key=148370962347811&kid_directed_site=0&app_id=148370962347811&signed_next=1&next=https%3A%2F%2Fwww.facebook.com%2Fv2.10%2Fdialog%2Foauth%3Fclient_id%3D148370962347811%26redirect_uri%3Dhttps%253A%252F%252Fwww.guamplay.com%252Finclude%252Faddons%252Fsns_login%252Ffacebook%252Fcallback.php%26response_type%3Dcode%26display%3Dpopup%26scope%3Demail%26ret%3Dlogin%26fbapp_pres%3D0%26logger_id%3D5273880d-d349-4bd1-8551-4acf0f0ff859%26tp%3Dunspecified&cancel_url=https%3A%2F%2Fwww.guamplay.com%2Finclude%2Faddons%2Fsns_login%2Ffacebook%2Fcallback.php%3Ferror%3Daccess_denied%26error_code%3D200%26error_description%3DPermissions%2Berror%26error_reason%3Duser_denied%23_%3D_&display=popup&locale=ko_KR&pl_dbl=0" target="_blank">
						<button type="button" class="btn5"><span style=""><img src=""></span>Facebook 로그인</button></a>
					</td>
				</tr>
			</table>
			
			</div>
		</form>	
		</section>
  
		<footer>
			<%@ include file="../include/footer.jsp"%>
		</footer>  
  
	</body>
</html>
