$.getScript( '//code.jquery.com/jquery-latest.min.js' );

function checks() {
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getCheck= RegExp(/^[a-zA-Z0-9]{4,16}$/);
	var getPw= RegExp(/^[a-zA-Z0-9`~!@@#$%^&*|₩₩₩'₩";:₩/?]{8,20}$/);
	var getName= RegExp(/^[가-힣]+$/);


	//ID의 유효성 검사
	if(!getCheck.test($("#uId").val())){
	  alert("형식에 맞춰서 ID를 입력해주세요");
	  $("#uId").focus();
	  return false;
	}

	//비밀번호
	if(!getPw.test($("#uPw").val())) {
	alert("형식에 맞춰서 PW를 입력해주세요.");
	$("#uPw").focus();
	return false;
	}

	//아이디랑 비밀번호랑 같은지
	if ($("#uId").val()==($("#uPw").val())) {
	alert("ID와 비밀번호가 동일하게 입력될 수 없습니다.");
	$("#uPw").val("");
	$("#uPw").focus();
  }

	//비밀번호 똑같은지
	if($("#uPw").val() != ($("#uPwc").val())){ 
	alert("동일한 비밀번호를 입력해주세요.");
	$("#uPwc").val("");
	$("#uPwc").focus();
	return false;
   }

	//이메일 유효성 검사
	if(!getMail.test($("#uMail").val())){
	  alert("이메일형식에 맞게 입력해주세요")
	  $("#uMail").focus();
	  return false;
	}

	//이름 유효성
	if (!getName.test($("#uName").val())) {
	  alert("올바른 이름을 입력해주세요.");
	  $("#uName").focus();
	  return false;
	}

	// 약관 동의 유효성
	if($("#agree_all").is(":checked") == false){
		alert("모든 약관에 동의 하셔야 회원가입이 가능합니다.");
		return false;
	}

	alert("가입 신청이 완료되었습니다.\n사업자 회원은 사업자 증명이 완료된 후 가입이 승인됩니다.\n제출 메일 : javachip0703@gmail.com")
  return true;
}

var checkIdFlag = false; // id 입력양식에 대한 입력여부 값을 가지는 변수
var checkPasswordFlag = false;
var checkNameFlag = false;
var checkPhoneFlag = false;
var checkMailFlag = false;
var checkBizNameFlag = false;
var checkBizNoFlag = false;

function checkFn(obj){
	if(obj.value == ""){
		$(obj).next(".msg").text("필수입력입니다.").css("color","red");
		if($(obj).attr("name") == "uId"){
			checkIdFlag = false;
		}else if($(obj).attr("name") == "uPw"){
			checkPasswordFlag = false;
		}else if($(obj).attr("name") == "uName"){
			checkNameFlag = false;
		}else if($(obj).attr("name") == "uPhone"){
			checkPhoneFlag = false;
		}else if($(obj).attr("name") == "uMail"){
			checkMailFlag = false;
		}else if($(obj).attr("name") == "uBisname"){
			checkBizNameFlag = false;
		}else if($(obj).attr("name") == "uBisno"){
			checkBizNoFlag = false;
		}
		
	}else{
		if($(obj).attr("name") == "uId"){
			// id가 존재하는 경우 아이디 중복체크
			$.ajax({
				url:"checkId.do",
				type:"post",
				data:{uId:$(obj).val()},
				success:function(data){
					if(data == "0"){
						// 사용할 수 있는 id
						$(obj).next(".msg").text("사용할 수 있는 ID 입니다.").css("color","green");
						checkIdFlag = true;
						$("#joinBtn").attr("disabled", false);
					}else{
						// 중복 id
						$(obj).next(".msg").text("이미 존재하는 ID입니다.").css("color","red");
						checkIdFlag = false;
					}
				}
			});
		}else{
			// id의 값이 존재하는 경우
			$(obj).next(".msg").text("");
			
			if($(obj).attr("name") == "uPw"){
				checkPasswordFlag = false;
			}else if($(obj).attr("name") == "uName"){
				checkNameFlag = false;
			}else if($(obj).attr("name") == "uPhone"){
				checkPhoneFlag = false;
			}else if($(obj).attr("name") == "uMail"){
				checkMailFlag = false;
			}else if($(obj).attr("name") == "uBisname"){
				checkBizNameFlag = false;
			}else if($(obj).attr("name") == "uBisno"){
				checkBizNoFlag = false;
			}
		}
	}
}
function submitFn(){
	if(checkIdFlag && checkPasswordFlag && checkNameFlag && checkPhoneFlag && checkMailFlag && checkBizNameFlag && checkBizNoFlag){
		$("form").submit();
	}
}


$(function() {
	$("#uPhone").keyup(function(){
		var val = $(this).val().replace(/[^0-9]/g, '');
		if(val.length > 3 && val.length < 6){
			var tmp = val.substring(0,2)
			if(tmp == "02"){
				$(this).val(val.substring(0,2) + "-" + val.substring(2));
			} else {
				$(this).val(val.substring(0,3) + "-" + val.substring(3));
			}
		}else if (val.length > 6){
			var tmp = val.substring(0,2)
			var tmp2 = val.substring(0,4)
			if(tmp == "02"){
				if(val.length == "10"){
					$(this).val(val.substring(0,2) + "-" + val.substring(2, 6) + "-" + val.substring(6));
				} else {
					$(this).val(val.substring(0,2) + "-" + val.substring(2, 5) + "-" + val.substring(5));
				}
			} else if(tmp2 == "0505"){
				if(val.length == "12"){
					$(this).val(val.substring(0,4) + "-" + val.substring(4, 8) + "-" + val.substring(8));
				} else {
					$(this).val(val.substring(0,4) + "-" + val.substring(4, 7) + "-" + val.substring(7));
				}
			} else {
				if(val.length == "11"){
					$(this).val(val.substring(0,3) + "-" + val.substring(3, 7) + "-" + val.substring(7));
				} else {
					$(this).val(val.substring(0,3) + "-" + val.substring(3, 6) + "-" + val.substring(6));
				}
			}
		}
	});
});

// 사업자 번호 하이픈 입력
$(function() {
	$("#uBisno").keyup(function(){
		var val = $(this).val().replace(/[^0-9]/g, '');
		if(val.length > 3 && val.length < 10){
		$(this).val(val.substring(0,3) + "-" + val.substring(3, 5) + "-" + val.substring(5));
		}
		if (val.length > 10) {
			// 200자 부터는 타이핑 되지 않도록
			$(this).val($(this).val().substring(0, 12));
		};
	});
});

// 사업자 번호 체크
function checkBrn() {
	var brn = document.getElementById("uBisno").value;
	console.log(brn);
	if ( /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/.test( brn ) ) {
		document.getElementById("checkBrnMessage").innerHTML= "<div style='color:green'>사업자 번호가 확인되었습니다.</div>";
		} else {
		document.getElementById("checkBrnMessage").innerHTML = "<div style='color:red'>올바르지 않은 사업자 번호입니다.</div>";
		}
  }

$(document).ready(function() {
	$("#agree_all").click(function() {
		if($("#agree_all").is(":checked")) $("input[name=agree_chk]").prop("checked", true);
		else $("input[name=agree_chk]").prop("checked", false);
	});
	
	$("input[name=agree_chk]").click(function() {
		var total = $("input[name=agree_chk]").length;
		var checked = $("input[name=agree_chk]:checked").length;
		
		if(total != checked) $("#agree_all").prop("checked", false);
		else $("#agree_all").prop("checked", true); 
	});
});
