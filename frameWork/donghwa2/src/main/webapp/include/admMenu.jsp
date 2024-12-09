<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
	<div class="topMenu">
		<!--<a href="adminPassChange1.php">관리암호변경</a> -->
		<a href="/admMain.do">홈으로</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/admList.do">계정관리</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/admBoardList.do?gubun=1">공시</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/admBoardList.do?gubun=2">사업보고서</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/admBoardList.do?gubun=3">전자공고</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/admGoodsList.do">제품관리</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/admPollList.do">설문관리</a>
		&nbsp;&nbsp;&nbsp;
		<a href="javascript:fn_logout()">로그아웃</a>
	</div>
  <script>
  function fn_logout() {
	  $.ajax({
		  type : "post",
		  url  : "/admLogout.do",
		  data : "",
		  datatype : "text",
		  
		  success : function(data) {
			  if(data == "ok") {
				  alert("로그아웃 되었습니다.");
				  location = "/admLogin.do";
			  }
		  },
		  error : function() {
			  alert("전송실패!!!");
		  }
	  }); 
  }
  </script>
	
	
	
	
	
	
	