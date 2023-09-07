<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>


<script src="<%=request.getContextPath() %>/resources/js/notice.js"></script>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	let oEditor = [];
	
	smartEditor = function() {
		console.log("Naver SmartEditor");
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditor,
			elPlaceHolder: "nContents",
			sSkinURI: "<%=request.getContextPath() %>/resources/smarteditor2/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		});
	}
	
	$(document). ready(function() {
		smartEditor()
	});
</script>
<script>
function noticeWriteFn() {
	let formData = $("#submitFrm").serialize();
	let nContents = $("#nContents").val();
	
	$.ajax({
		url:"noticeWrite.do",
		type:"post",
		data:formData,
		dataType:"json",
		success:function(data) {
			alert(data.result);
			location.replace(data.path);
		},
		error:function() {
			
			alert('게시글 등록에 실패하였습니다.');
			var url = "notice.do";
			location.replace(url);
		}
	});
	
}
</script>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>공지사항 쓰기</h2>
						<div class="breadcrumb__option">
							<a href="<%= request.getContextPath() %>/">Home</a>
				 		<a href="#">고객센터</a>
							<span>공지사항</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="board-box spad">
		<div class="container">
			<div class="write-form">
				<form id="submitFrm" onsubmit="return false;">
					<div class="d-flex flex-column bd-highlight mb-3">
						<div class="p-2 bd-highlight">
							<h4><b>글쓰기</b></h4>
						</div>
						<div class="p-2 bd-highlight">
							<p>제목<p>
							<input type="text" name="nTitle" id="nTitle" class="form-control" aria-label="subject" placeholder="제목을 입력하세요.">
						</div>
						<div class="p-2 bd-highlight">
							<textarea class="form-control" name="nContents" id="nContents" rows="10"></textarea>
						</div>
							<div class="p-2 bd-highlight" align="center">
								<button type="button" class="btn btn-outline-secondary" style="margin-right:20px;" onclick="helpResetFn()">취소하기</button>
								<button type="button" class="btn btn-dark" onclick="noticeSubmitFn()">작성하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
<%@ include file="../include/footer.jsp" %>