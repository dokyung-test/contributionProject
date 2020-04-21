//회원 탈퇴비밀번호체크 후 탈퇴
function deleteUser() {
	var password = $("#pass #password").val();
	var url = "deleteUserCheck.do";
	$.ajax({
		type : "post",
		url : url,
		data : "password=" + password,
		dataType : "json"
	}).done(function(args) {
		if (args.num == 0) {
			alert("비밀번호가 일치하지않습니다.");
			$("#pass #password").val('');
		} else {
			alert("탈퇴가 완료 되었습니다.");
			window.location.href = "deleteUser.do";
		}
	}).fail(function(e) {
		alert("error");
		alert(e.responseText);
	});
}

function checkpass() {

	if (!checkpassword(form.password.value)) {
		return false;
	}

	return true;
}

//공백확인 함수
function checkExistData(value, dataName) {
	if (value == "") {
		alert(dataName + " 입력해주세요!!!");
		return false;
	}
	return true;
}


function checkpassword(password) {
	// 비밀번호가 입력되었는지 확인하기
	if (!checkExistData(password, "비밀번호를")) {
		form.password.focus();
		return false;
	}
	return true; // 확인이 완료되었을 때
}
