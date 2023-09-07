<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.javachip.vo.ProductVO" %>
<%@ page import="com.javachip.vo.ReviewVO" %>
<script>
	function addCartFn() {
		$.ajax({
			url:"addCart.do",
			type:"post",
			data:{
				pNo:$("#pNo").val(),
				cCount:$("#cCount").val()
			},
			success:function(data) {
				if(data == 1) {
					if(confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?")) {
						location.href="<%= request.getContextPath() %>/mypage/cart.do";
					}
				}else if(data == 2) {
					if(confirm("이미 장바구니에 있는 상품입니다. 장바구니로 이동하시겠습니까?")) {
						location.href="<%= request.getContextPath() %>/mypage/cart.do";
					}
				}else if(data == -1) {
					alert("로그인이 필요한 서비스입니다.");
					location.href="<%= request.getContextPath() %>/member/login.do";
				}else {
					alert("오류가 발생했습니다.");
				}
			},
			error:function(){
				alert("오류가 발생했습니다.");
			}
		});
	}
	
	function buyNowFn() {
		var pNo = $("#pNo").val();
		var cCount = $("#cCount").val();
		document.location.href="buyNow.do?pNo="+pNo+"&cCount="+cCount;
	}
	
	function reviewWriteFn() {
		$.ajax({
			url:"reviewWrite.do",
			type:"post",
			data:"pNo="+$("#pNo").val()+"&rContents="+$("#rContents").val(),
			success:function(data) {
				if(data == 1) {
					alert("후기가 작성되었습니다.");
					location.href="details.do?pNo="+$("#pNo").val();
				}else if(data == -1) {
					alert("로그인 후 이용해주세요.");
				}else {
					alert("일시적 오류입니다. 잠시 후 이용해주세요.");
				}
			},
			error:function() {
				alert("오류가 발생했습니다.");
			}
		});
	}
	
	function deleteReviewFn(obj) {
		var rNo = $(obj).parents().find("input[name=rNo]").val();
		$.ajax({
			url:"deleteReview.do",
			type:"post",
			data:"rNo="+rNo,
			success:function(data) {
				if(data > 0) {
					alert("후기가 삭제되었습니다.");
					$(obj).parents("tr").empty();
				}else {
					alert("오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
				}
			},
			error:function() {
				alert("예외 발생!");
			}
		});
	}
	function updateReviewFn(obj) {
		var str = '<textarea id="updateContent" style="width:95%; height:100%; border:solid 1px #e8e8e8; resize:none;"></textarea>'
				+ '<button type="button" class="btn btn-dark" onclick="updateBtnFn(this)">수정하기</button>'
		$(obj).parent("td").html(str);
	}
	function updateBtnFn(obj) {
		var rNo = $(obj).parents().find("input[name=rNo]").val();
		var rContents = $("#updateContent").val();
		console.log(rNo);
		console.log(rContents);
		
		$.ajax({
			url:"updateReview.do",
			type:"post",
			data:"rNo="+rNo+"&rContents="+$("#updateContent").val(),
			success:function(data) {
				if(data > 0) {
					alert("후기가 수정 되었습니다.");
					location.reload();
				}else {
					alert("오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
				}
			},
			error:function() {
				alert("예외 발생!");
			}
		});
	}
	
	function shareTwitter() {
	    var sendText = "자바칩 프라페"; // 전달할 텍스트
	    var sendUrl = "javachip.com/"; // 전달할 URL
	    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	}
	function shareFacebook() {
	    var sendUrl = "javachip.com/"; // 전달할 URL
	    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
	}
</script>
<!-- 메인 작성 영역 -->
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>${pv.pName}</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>">홈</a>
                            <a href="grid.do">항목</a>
                            <span>${pv.pName}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                    <c:if test="${empty pv.aChangeName}">
                        <img class="product__details__pic__item--large"
                            src="<%= request.getContextPath() %>/resources/img/product/details/product-details-1.jpg" alt="">
                    </c:if>
                    <c:if test="${not empty pv.aChangeName}">
                        <img class="product__details__pic__item--large"
                            src="<%= request.getContextPath() %>/resources/upload/${pv.aChangeName}" alt="">
                    </c:if>
                    </div>
                </div>
            </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${pv.pName}</h3>
                        <div class="product__details__price">${pv.pPrice}원</div>
                        <p>${pv.pNote}</p>
                        <c:choose>
            				<c:when test="${pv.pType eq 'G'}">
            					<input type="hidden" name="cCount" id="cCount" value="1">
            				</c:when>
            				<c:otherwise>
		                        <div class="product__details__quantity">
		                            <div class="quantity">
		                                <div class="pro-qty">
		                                    	<input type="text" name="cCount" id="cCount" value="1"  oninput="this.value=this.value.replace(/[^0-9]/g,'');">
		                                </div>
		                            </div>
		                        </div>
               				</c:otherwise>
               			</c:choose>
                    	<input type="hidden" name="pNo" id="pNo" value="${pv.pNo}">
                    	<c:choose>
                    		<c:when test="${pv.pType eq 'G'}">
		                        <a href="javascript:buyNowFn()" class="primary-btn">구독 신청</a>
                    		</c:when>
                    		<c:otherwise>
		                        <a href="javascript:addCartFn()" class="primary-btn">장바구니에 추가</a>
		                        <a href="javascript:buyNowFn()" class="primary-btn" style="background-color:#DD5555">바로 구매</a>
                    		</c:otherwise>
                    	</c:choose>
                        <ul>
                            <li><b>판매상태</b> <span>재고 있음</span></li>
                            <li><b>배송정보</b> <span>평균 1일 소요 <samp>배송비 무료</samp></span></li>
                            <li><b>공유하기</b>
                                <div class="share">
                                    <a href="javascript:shareFacebook()"><i class="fa fa-facebook"></i></a>
                                    <a href="javascript:shareTwitter()"><i class="fa fa-twitter"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">상품정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">후기</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">QnA</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>상품정보</h6>
                                    <p>${pv.pDetail}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <table class="table table-hover">
									  <thead>
									    <tr>
									      <th scope="col" width="5%">#</th>
									      <th scope="col">내용</th>
									      <th scope="col" width="15%">작성자</th>
									      <th scope="col" width="15%">작성일</th>
									    </tr>
									  </thead>
									  <tbody>
										  <c:choose>
										  	<c:when test="${empty reviewList}">
										  		<tr>
										  			<td colspan="2">작성된 리뷰가 없습니다.</td>
										  		</tr>
										  	</c:when>
										  	<c:otherwise>
											  	<c:forEach items="${reviewList}" var="review">
										      	<input type="hidden" name="rNo" value="${review.rNo}">
											    <tr>
											      <td>${review.rNo}</td>
											      <td>
											      	${review.rContents}
											      	<c:if test="${login.uNo eq review.uNo}">
											      		<a href="javascript:void(0);" onclick="updateReviewFn(this);">[수정]</a>
											      		<a href="javascript:void(0);" onclick="deleteReviewFn(this);">[삭제]</a>
											      	</c:if>
											      </td>
											      <td>${review.uName}</td>
											      <td>${review.rDate}</td>
											    </tr>
											  	</c:forEach>
										  	</c:otherwise>
										  </c:choose>
										  <c:if test="${canReview}">
										    <tr>
										      <td></td>
										      <td colspan="2"><textarea name="rContents" id="rContents"
										      	style="width:95%; height:100%; border:solid 1px #e8e8e8; resize:none;"></textarea></td>
										      <td><button type="button" class="btn btn-dark" onclick="reviewWriteFn()">후기 등록</button></td>
										    </tr>
										  </c:if>
									  </tbody>
									</table>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <table class="table table-hover">
									  <thead>
									    <tr>
									      <th scope="col" width="5%">#</th>
									      <th scope="col">제목</th>
									      <th scope="col" width="15%">작성자</th>
									      <th scope="col" width="15%">작성일</th>
									    </tr>
									  </thead>
									  <tbody>
									  	<c:choose>
										  	<c:when test="${empty qnaList}">
										  		<tr>
										  			<td colspan="2">작성된 문의가 없습니다.</td>
										  		</tr>
										  	</c:when>
										  	<c:otherwise>
											  	<c:forEach items="${qnaList}" var="qna">
												    <tr>
												      <td>${qna.qNo}</td>
												      <td><a href="<%= request.getContextPath() %>/help/qnaView.do?qNo=${qna.qNo}">${qna.qTitle}</a></td>
												      <td>${qna.uName}</td>
												      <td>${qna.qDate.substring(0,10)}</td>
												    </tr>
											  	</c:forEach>
											</c:otherwise>
										</c:choose>
									  </tbody>
									</table>
									<button type="button" id="qnaWriteBtn"
									 onClick="location.href='<%= request.getContextPath() %>/help/qnaWrite.do?qType=P'" class="btn btn-dark">
										Q&A 등록
									</button>
									<button type="button" id="qnaListBtn"
									 onClick="location.href='<%= request.getContextPath() %>/help/qna.do?searchType=pNo&searchValue=${pv.pNo}'" class="btn btn-dark" style="float:right;">
										더보기
									</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->
<!-- 메인 작성 영역 -->
<%@ include file="../include/footer.jsp" %>