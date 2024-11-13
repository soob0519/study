/**
 * 
 */
function fn_select() {

var ss = document.frm.mail3.value; //select 상자 값
if (ss != "") {
	document.frm.mail2.value = ss;
	document.frm.mail2.readOnly = true;
} else {
	document.frm.mail2.value = "";
	document.frm.mail2.readOnly = false;
}	

}

function fn_submit() {

if (document.frm.userid.value == "") {
	alert("아이디를 입력해주세요.");
	document.frm.userid.focus();
	return false;
}

if (document.frm.userid.value.length < 4 ||
	document.frm.userid.value.length > 12)
{
	alert("아이디는 4자리에서 12자리까지 가능합니다.");
	document.frm.userid.focus();
	return false;
}

if (document.frm.pass.value == "") {
	alert("비밀번호를 입력해주세요.");
	document.frm.pass.focus();
	return false;
}
if (document.frm.pass.value.length < 4 ||
	document.frm.pass.value.length > 20)
{
	alert("비밀번호는 4자리에서 20자리까지 가능합니다.");
	document.frm.pass.focus();
	return false;
}

if (document.frm.pass2.value == "") {
	alert("비밀번호확인을 입력해주세요.");
	document.frm.pass2.focus();
	return false;
}

if (document.frm.pass.value != document.frm.pass2.value) {
	alert("비밀번호와 비밀번호확인이 일치하지 않습니다.");
	document.frm.pass.focus();
	return false;
}

if (document.frm.name.value == "") {
	alert("이름을 입력해주세요.");
	document.frm.name.focus();
	return false;
}
if (document.frm.tel1.value == "") {
	alert("휴대번호1를 입력해주세요.");
	document.frm.tel1.focus();
	return false;
}

if (document.frm.tel1.value.length != 3 ||
	document.frm.tel2.value.length != 4 ||
	document.frm.tel3.value.length != 4)
{
	alert("휴대번호를 다시 확인해주세요.");
	document.frm.tel1.focus();
	return false;
}

if (document.frm.tel2.value == "") {
	alert("휴대번호2를 입력해주세요.");
	document.frm.tel2.focus();
	return false;
}
if (document.frm.tel3.value == "") {
	alert("휴대번호3를 입력해주세요.");
	document.frm.tel3.focus();
	return false;
}

if (document.frm.mail1.value == "" ||
	document.frm.mail2.value == "" 
	) {
	alert("메일을 입력해주세요.");
	document.frm.mail1.focus();
	return false;
}

location = "http://dothome.co.kr";
}
