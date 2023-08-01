/**
 * 
 */

 function infoConfirm() {
	 if(document.reg_firm.id.value.length ==0) {
		 alert("아이디는 필수 사항입니다.");
		 reg_frm.id.focus();
		 return;
	 }
 
 
	 if(document.reg_frm.id.value.lenth <4) {
		 alert("아이디는 4글자 이상이어야 합니다");
		 reg_frm.id.focus();
		 return;
	 }
	 
	 	 if(document.reg_frm.pw.value.lenth ==0) {
		 alert("비밀번호는 필수 사항입니다.");
		 reg_frm.id.focus();
		 return;
	 }
	 
	 	 if(document.reg_frm.pw.value.lenth !=document.reg_frm.pw_check.value.lenth) {
		 alert("비밀번호가 일치하지 않습니다.");
		 reg_frm.pw.focus();
		 return;
	 }
	 
	  if(document.reg_frm.name.value.lenth ==0) {
		 alert("이름은 필수 사항입니다.");
		 reg_frm.id.focus();
		 return;
	 }
	 	  if(document.reg_frm.mail.value.lenth ==0) {
		 alert("메일은 필수 사항입니다.");
		 reg_frm.email.focus();
		 return;
	 }
	 document.reg_frm.submit();
}

function updateinfoConfirm() {
	if(document.reg_frm.pw.value =="") {
		alert("패스워드를 입력하세요");
		document.reg_frm.pw.focus();
		return;
	}	
	 if(document.reg_frm.pw.value.lenth !=document.reg_frm.pw_check.value.lenth) {
		 alert("비밀번호가 일치하지 않습니다.");
		 reg_frm.pw.focus();
		 return;
	 }
	  if(document.reg_frm.mail.value.lenth ==0) {
		 alert("이름은 필수 사항입니다.");
		 reg_frm.email.focus();
		 return;
	 }
	 
	  document.reg_frm.submit();
	
}