/* help */
// help notice write submit

var checkTitleFlag = false;
var checkContentsFlag = false;
var submitFlag = false;

// help write submit
function noticeSubmitFn() {
	oEditor.getById["nContents"].exec("UPDATE_CONTENTS_FIELD",[]);
	let nContents = $("#nContents").val();
	
	// Notice 제목이 입력되지 않았을 때
	if($("#nTitle").val() == "") {
			checkTitleFlag = false;
			alert("제목을 입력해주세요.");
			$("#nTitle").focus();
			
			return;
		}else
	// Notice 내용이 입력되지 않았을 때
	if("" == nContents || null == nContents) {
			checkContentsFlag = false;
			alert("내용을 입력해주세요.");
			oEditor.getById["nContents"].exec("FOCUS");
			
			return;
		}else
	// Notice 제목과 내용이 있을경우
	{
		checkTitleFlag = true;
		checkContentsFlag = true;
	}
	
	// Flag확인하고 submit
	if(checkTitleFlag && checkContentsFlag){
		submitFlag = true;
	}
	
	if(submitFlag) {
		noticeWriteFn();
	}
	
}

//게시글 취소 재확인 문구
function helpResetFn() {
	if( confirm("작성하고있는 게시글을 취소하시겠습니까?") ) {
		//true
		location.href="notice.do";
	}else {
		// false
		return;
	}	
}
function helpModifyResetFn() {
	if( confirm("작성된 게시글을 취소하시겠습니까?") ) {
		//true
		window.history.back();
	}else {
		// false
		return;
	}	
}

// 공지사항 삭제
function noticeDelFn() {
	if( confirm("게시물을 정말 삭제하시겠습니까?") ) {
		//true
		document.delFrm.submit();
	}else {
		// false
		return;
	}	
}