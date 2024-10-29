$(function() {
	
	$("#birth").datepicker();
	
	
	$("#email3").change(function(){
		let a1 = $("#email3").val();
		$("#email2").val(a1);
		if ( a1 == "" )	{
			$("#email2").attr("readonly",false);	
		} else {
			$("#email2").attr("readonly",true);
		}	
	});
	
	$("#userid1").keyup(function(){
		let userid1 = $("#userid1").val();
		userid1 = $.trim(userid1);
		if (userid1.length < 3) {
			$("#userid2").html("<font color='red'>아이디가 짧습니다.</font>");
		} else if (userid1.length > 15 ) {
			$("#userid2").html("<font color='red'>아이디가 깁니다.</font>");
		} else if (userid1.length >3 && userid1.length < 15 ){
			$("#userid2").html("<font color='green'>사용가능한 아이디입니다.</font>");	
		}
	});
	
	$("#pass1").keyup(function(){
		let pass1 = $("#pass1").val();
		pass1 = $.trim(pass1);
		if (pass1.length < 3) {
			$("#pass2").html("<font color='red'>암호가 짧습니다.</font>");
		} else if (pass1.length > 20 ) {
			$("#pass2").html("<font color='red'>암호가 깁니다.</font>");
		} else if (pass1.length >3 && pass1.length < 20 ){
			$("#pass2").html("<font color='green'>사용가능한 암호입니다.</font>");	
		}
	});
	
	$("#passck1").keyup(function(){
		let pass1 = $("#pass1").val();
		let passck1 = $("#passck1").val();
		passck1 = $.trim(passck1);
		if (pass1 == passck1) {
			$("#passck2").html("<font color='green'>암호가 일치합니다.</font>");
		} else if (pass1 != passck1) {
			$("#passck2").html("<font color='red'>암호가 일치하지 않습니다.</font>");
		}
	});
	
	
	$("#btn1").click(function(){
	
		let cam		= $("#cam").val();
		let userid1	= $.trim($("#userid1").val());
		let pass1	= $.trim($("#pass1").val());
		let passck1	= $.trim($("#passck1").val());
		let name	= $.trim($("#name").val());
		let birth	= $.trim($("#birth").val());
		let email1	= $("#email1").val();
		let email2	= $.trim($("#email2").val());
		let num1	= $("#num1").val();
		let num2	= $.trim($("#num2").val());
		let num3	= $.trim($("#num3").val());
		let hpage	= $.trim($("#hpage").val());
		let	zipcode	= $.trim($("#zipcode").val());
		let	addr	= $.trim($("#addr").val());
		
		$("#userid1").val(userid1);
		$("#pass1").val(pass1);
		$("#passck1").val(passck1);
		$("#name").val(name);
		$("#birth").val(birth);
		$("#num2").val(num2);
		$("#num3").val(num3);
		$("#hpage").val(hpage);
		$("#zipcode").val(zipcode);
		$("#addr").val(addr);

		let gender	= $("input[name='gender']").is(":checked");
		
		if (cam == "") {
			alert("캠퍼스를 입력해주세요.");
			$("#cam").focus();
			return false;
		}
		
		if (userid1 == "") {
			alert("아이디를 입력해주세요.");
			$("#userid2").html("아이디를 입력해주세요.");		
			$("#userid1").focus();
			return false;
		}
		
		if (pass1 == "") {
			alert("암호를 입력해주세요.");
			$("#pass2").html("암호를 입력해주세요.");
			$("#pass1").focus();
			return false;
		}
		
		if (passck1 == "") {
			alert("암호확인을 입력해주세요.");
			$("#passck2").html("암호가 일치하지 않습니다.");
			$("#passck1").focus();
			return false;
		}
		
		if (name == "") {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		
		if (gender == false) {
			alert("성별을 선택해주세요.");
			return false;
		}
		
		if (birth.length != 10) {
			alert("생일을 확인해주세요.");
			$("#birth").focus();
			return false;
		}
		
		if (email1 == "") {
			alert("이메일을 입력해주세요.");
			$("#email1").focus();
			return false;
		}
		
		if (email2 == "") {
			alert("도메인을 입력해주세요.");
			$("#email2").focus();
			return false;
		}
		
		let index = email2.indexOf(".");
		if (index == -1) {
			alert("이메일 도메인을 확인해주세요.");
			$("#email2").focus();
			return false;
		}
		
		if (num1 == "" || num2 == "" || num3 == "") {
			alert("번호를 입력해주세요.");
			$("#num1").focus();
			return false;
		}
		
		if (num2.length != 4 || num3.length != 4 ) {
			alert("번호를 다시 확인해주세요.");
			$("#num2").focus();
			return false;
		}
		
		if (hpage == "") {
			alert("홈페이지를 입력해주세요.");
			$("#hpage").focus();
			return false;
		}
		
		let index2 = hpage.indexOf("http");
		let index3 = hpage.indexOf("https");
		if (index2 == -1 && index3 == -1 ) {
			alert("홈페이지 주소를 확인해주세요.");
			$("#hpage").focus();
			return false;
		}
		
		if (zipcode == "") {
			alert("우편번호를 입력해주세요.");
			$("#zipcode").focus();
			return false;
		}
		
		if (addr == "") {
			alert("주소를 입력해주세요.");
			$("#addr").focus();
			return false;
		}	
	});
	
	$("#btn2").click(function(){
		if(confirm("화면 리셋을 진행 하시겠습니까?") == false) {
			return false;
		}		
	});
 
 });
 