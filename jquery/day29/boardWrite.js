$(function(){
	
	$("#rdate").datepicker();
	
	$("#btn1").click(function(){
		//$.trim() 함수 : 앞뒤공백 제거함수
		let title	= $.trim($("#title").val()); // 입력상자의 값
		let pass	= $.trim($("#pass").val());
		let name	= $.trim($("#name").val());
		let email	= $.trim($("#email").val());
		let rdate	= $.trim($("#rdate").val());
		let content	= $.trim($("#content").val());
		
		$("#title").val(title);
		$("#pass").val(pass);
		$("#name").val(name);
		$("#email").val(email);
		$("#rdate").val(rdate);
		$("#content").val(content);
		
		let style	= $("input[name='style']").is(":checked"); //true or false => true
		
		if (title == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		
		if (pass == "") {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		if (name == "") {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		// @naver.com -> 0 (x)
		let index = email.indexOf("@"); // 존재 시 : 자리번호 알려줌, 미존재시 : -1
		if (index == -1 || index == 0) {
			alert("이메일 주소를 확인해주세요.");
			$("#email").focus();
			return false;
		}
		// subString(); : 범위설정하여 범위만큼 값을 가져오는 함수
		// 데이터.substring(시작번호,끝번호); : 시작번호 ~ 끝번호 이전까지 가져옴.
		// (abcd@naver.com).substring(5); : 시작번호만 있으면 끝까지 가져옴
		
		let domain = email.substring(index+1);
		let index2 = domain.indexOf(".");
		
		if (index2 == -1) {
			alert("이메일 도메인을 확인해주세요.");
			$("#email").focus();
			return false;
		}
		
		if (rdate.length != 10) {
			alert("등록일이 잘못입력되었습니다.");
			$("#rdate").focus();
			return false;
		}
		
		if ( style == false) {
			alert("숨김여부를 선택해주세요.");
			return false;
		}
		
		if (content == "") {
			alert("내용을 입력해주세요.");
			$("#content").focus();
			return false;
		}
		
		if (content.length > 2000) {
			alert("글자는 2000자 초과는 불가합니다.");
			$("#content").focus();
			return false;
		}
	});
	
 });