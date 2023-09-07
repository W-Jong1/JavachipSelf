<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/qna.css" type="text/css"/>

<script src="<%=request.getContextPath() %>/resources/js/qna.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	let oEditor = [];
	
	smartEditor = function() {
		console.log("Naver SmartEditor");
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditor,
			elPlaceHolder: "qContents",
			sSkinURI: "<%=request.getContextPath() %>/resources/smarteditor2/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		});
	}
	
	$(document). ready(function() {
		smartEditor()
	});
</script>
<script>
function qnaWriteFn() {
	let formData = $("#submitFrm").serialize();
	let qContents = $("#qContents").val();
	
	$.ajax({
		url:"qnaWrite.do",
		type:"post",
		data:formData,
		dataType:"json",
		success:function(data) {
			alert(data.result);
			location.replace(data.path);
		},
		error:function() {
			
			alert('게시글 등록에 실패하였습니다.');
			var url = "qna.do";
			location.replace(url);
		}
	});
	
}

function searchProductFn() {
	let searchType = $("#qpSearchType").val();
	let searchValue = $("#qpSearchValue").val();
	// productFindFn(페이지번호,검색유형,검색값);
	productCallFn(1,searchType,searchValue);	
}


function productCallFn(curPage,searchType,searchValue) {
	
	
	$.ajax({
		url:"productSearch.do",
		type:"get",
		data:{	
				"page": curPage,
				"searchType": searchType,
				"searchValue": searchValue
			},
		success:function(data) {
		var htmlStr = ""
		var list = data.list;
		var pm = data.pm;
			
		var urlStr = "";
		
		if(list != '') {
			for(let i=0; i < list.length ;i++) {
				htmlStr += "<tr>";
				htmlStr += "<td style='width : 15%'>" + (pm.totalCount - pm.seqNo + i + 1) + "</td>";
				if(list[i].aChangeName != null) {
				htmlStr += "<td style='width : 15%'><div class='pImg'><img src='<%=request.getContextPath()%>/resources/upload/" + list[i].aChangeName + "' style='width: 100%; height: 100%;' alt='"+ list[i].pName +"'></div></td>";
				}else {
				htmlStr += "<td style='width : 15%'><div class='pImg'>상품 이미지</div></td>";	
				}
				
				htmlStr += "<td style='width : 20%; text-align: left'>" + list[i].pName + "</td>";
				htmlStr += "<td style='width : 25%;'>";
				+ list[i].pType 
				switch(list[i].pType) {
				case "A" : htmlStr += "원두";
					break;
				case "B" : htmlStr += "생두";
					break;
				case "C" : htmlStr += "드립백";
					break;
				case "D" : htmlStr += "캡슐";
					break;
				case "E" : htmlStr += "도매";
					break;
				case "F" : htmlStr += "커피용품";
					break;
				case "G" : htmlStr += "정기배송";
					break;
				default : htmlStr += "상품정보없음";
				}
				htmlStr += "</td>";
				
				htmlStr += "<td style='width : 15%'><input name='pNoRadio' type='radio' value='" + list[i].pNo + "'></td>";
				htmlStr += "</tr>";
			}
		}else{
			htmlStr = "상품 정보가 없습니다.";
			
		}
			
		$("#pTable").html(htmlStr);
		
		
		if(pm.prev) {
			urlStr += "<a href='javascript:productCallFn(" + (pm.startPage - 1) + "," + searchType + "," + searchValue +");'> &#9664;</a>";
		}
		if(pm.startPage == 0) {
			urlStr += "<a class='cntPoint'>1<a>";
		}else {
			for(var i=pm.startPage; i <= pm.endPage; i++) {
				if( i == pm.searchVO.page){
					urlStr += " <a class='cntPoint'>"+ i +"</a> "
				}else {
				urlStr += "<a href='javascript:productCallFn(" + i + "," + searchType + "," + searchValue +");'> " + i + " </a>";				
				}
			}
		}
		
		if(pm.next && pm.endPage > 0) {
			urlStr += "<a href='javascript:productCallFn(" + (pm.endPage + 1) + "," + searchType + "," + searchValue +");'>" + " &#9654;</a>";
		}
		
		$("#pPaging").html(urlStr);
		
		},
		error:function() {
			
		alert("상품 정보를 불러올 수 없습니다.");
		}
		
	});
}
	
	// qna 이미지 업로드
	function qnaUploadFn() {
	var formData = new FormData($("#fileSubmitFrm")[0]);	// from에 작성된 모든것을 보낸다.

	$.ajax({
		url:"fileupload.do",
		type:"post",
		data:formData,
		cache: false,
		contentType : false,	// false 로 선언 시 content-type 헤더가 multipart/form-data로 전송되게 함
		processData : false,	// false로 선언 시 formData를 string으로 변환하지 않음
		success:function(data) {
			if(data == "") {
				
			}else {
			var img = "<div><img src='" + "<%=request.getContextPath()%>" + "/resources/upload/" + data + "'></div>";
				
			$("#qContents").prepend(img);
			}
			
		},
		error:function() {
			alert("파일업로드에 실패했습니다.");
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
						<h2>글 쓰기</h2>
						<div class="breadcrumb__option">
							<a href="<%= request.getContextPath() %>/">Home</a>
							<a href="#">고객센터</a>
							<span>QnA 글 쓰기</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="board-box spad">
		<div class="container">
			<div class="write-form">
				<div class="d-flex flex-column bd-highlight mb-3">
				<a href="editer.do">테스트</a>
				<form id="submitFrm" onsubmit="return false;">
						<div class="p-2 bd-highlight">
							<h4><b>Qna 쓰기</b></h4>
						</div>
						<div class="p-2 bd-highlight">
							<p>구분<p>
						<div class="input-group">
							<select name="qType" id="qType" class="board-type" onchange="selectQTypeFn();">
								<option value="N"
								<c:if test="${ qType eq 'N'}"> selected</c:if>
								>일반 Q&amp;A</option>
								
								<option value="P"
								<c:if test="${ qType eq 'P'}"> selected</c:if>
								>상품 Q&amp;A
								</option>
							</select>
						</div>
						</div>
						<div class="p-2 bd-highlight" id="addQnaSelect">
						</div>
						<div class="p-2 bd-highlight" id="pInfo">
						</div>
					<div class="p-2 bd-highlight">
						<p>제목<p>
						<input type="text" name="qTitle" id="qTitle" class="form-control" aria-label="subject" placeholder="제목을 입력하세요.">
					</div>
					<div class="p-2 bd-highlight" style="display:flex;">
						<div>
							<p>비밀글  <input type="checkbox" name="secretCheck" id="secretCheck" value="Y"/> </p>
						</div>
					</div>
					<div class="p-2 bd-highlight" id="smarteditor">
							<textarea name="qContents" id="qContents" style="width:100%; min-height:500px;"></textarea>
					</div>
				</form>
					</div>
					<div class="p-2 bd-highlight" align="center">
						<button type="button" class="btn btn-outline-secondary" style="margin-right:20px;" onclick="helpResetFn">취소하기</button>
						<button type="button" class="btn btn-dark" onclick="qnaSubmitFn();">작성하기</button>
					</div>
				</div>	
			</div>
		<div id="pSelectContainer" class="modalHidden">
			<div class="pSelectBox">
				<div class="p-2 bd-highlight">
					<h4><b>상품 목록</b></h4>
				</div>
				<div class="pSelectContent">
					<div class="board-search" style="width:70%; float: left">
						<form id="searchFrm" class="d-flex justify-content-center" onsubmit="searchProductFn(); return false; ">
			 				<div class="input-group">
								<select name="searchType" id="qpSearchType">
									<option value="name">상품명</option>
								</select>
								<input type="text" name="SearchValue" id="qpSearchValue" class="form-control" placeholder="내용을 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary mb-4" onclick="searchProductFn()">검색하기</button>
								</div>
							</div>
						</form>
					</div>
					<div class="p-2 bd-highlight ">
					<table class="table table-hover pSelectTable">
						<thead>
							<tr>
								<th>번호</th>
								<th colspan="2" align="center">상품</th>
								<th align="center">종류</th>
								<th>선택</th>
							</tr>
						</thead>
						<tbody id="pTable">
						</tbody>
					</table>
					</div>
				</div>
				<div style="text-align:center;" id="pPaging" class="product__pagination">
				</div><br>
				<div class="p-2 bd-highlight" align="center">
					<button class="btn btn-dark" type="button" style="margin-right:20px;" onclick="sendPnoFn();">등록</button>
					<button class="btn btn-outline-secondary" type="button" onclick="closeSelectBoxFn();">취소</button>
				</div>
			</div>
		</div>
	</section>
<%@ include file="../include/footer.jsp" %>