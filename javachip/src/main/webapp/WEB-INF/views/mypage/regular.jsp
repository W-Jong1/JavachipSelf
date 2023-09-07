<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<script>
	//금액 ,+원
	function moneyFn(str) {
		return str.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',')+"원"
	}
	
	function moneyToNum(str) {
		var newStr = str.toString().replace(',' ,'');
		return newStr.toString().replace('원' ,'');
	}
	
	$(document).ready(function() {
		$(".price").each(function() {
			var value = $(this).text();
			$(this).text(moneyFn(value));
		});
		
		$(".cancelBtn").click(function() {
			var oNo = $(this).parents("tr").find("input[name=oNo]").val();
			if(confirm("정말 취소하시겠습니까?")) {
				$.ajax({
					url : "cancelRegular.do",
					type : "get",
					data : { oNo : oNo },
					success : function(data) {
						if(data > 0) {
							alert("취소되었습니다.");
							location.reload();
						}else {
							alert("오류가 발생했습니다. 나중에 다시 시도해주세요.");
						}
					},
					error : function() {
						alert("예외 발생!");
					}
				});
			}
		});
		
		if($("#list").children().length == 0) {
			$("#list").append("<tr><td colspan='7'>구독 중인 정기배송 상품이 없습니다.</td></tr>");
		}
		if($("#historyList").children().length == 0) {
			$("#historyList").append("<tr><td colspan='7'>정기배송 관련 이력이 없습니다.</td></tr>");
		}
	});
</script>
<!-- 배너 세션 시작 -->
<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>정기배송 관리</h2>
                    <div class="breadcrumb__option">
                        <a href="<%= request.getContextPath() %>/">Home</a>
                        <span>정기배송 관리</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 배너 세션 끝 -->

<!-- 배송지 설정 세션 시작 -->
<section class = "mainadd">
    <div class = "container">
        <h4>정기 배송 관리</h4>
        <span><i class="icon_calendar" style="margin-right:10px"></i>정기배송 중인 상품</span>
        <div class = "shoping__cart__table" style="margin-top:30px;">
	        <table>
				<thead>
				  <tr>
				    <th class="tg-m9t7" width="10%">상품 사진</th>
				    <th class="tg-m9t7" width="35%">상품명</th>
				    <th class="tg-m9t7" width="10%">결제 금액</th>
				    <th class="tg-m9t7" width="10%">결제 방법</th>
				    <th class="tg-m9t7" width="10%">결제 주기</th>
				    <th class="tg-m9t7" width="15%">신청일</th>
				    <th class="tg-m9t7" width="10%">구독 취소</th>
				  </tr>
				</thead>
				<tbody id="list">
					<c:forEach items="${regularList}" var="regular">
						<c:if test="${regular.oStatus eq 'O'}">
						  <tr style = "height : 100px">
						    <td class="tg-9wq8">
								<c:if test="${empty regular.aChangeName}">
                                    <img src="<%= request.getContextPath() %>/resources/img/cart/cart-1.jpg"
                                    style="width: auto; height: auto; max-width: 100px; max-height: 100px;" alt="">
                                </c:if>
                                <c:if test="${not empty regular.aChangeName}">
                                    <img src="<%= request.getContextPath() %>/resources/upload/${regular.aChangeName}"
                                    style="width: auto; height: auto; max-width: 100px; max-height: 100px;" alt="">
                                </c:if>
                            </td>
						    <td class="tg-9wq8">
						    	<a href="hdetail.do?oNo=${regular.oNo}">${regular.pName}</a>
						    	<input type="hidden" name="oNo" value="${regular.oNo}">
						    </td>
						    <td class="tg-9wq8"><span class="price">${regular.pPrice}</span></td>
						    <td class="tg-9wq8">신용카드</td>
						    <td class="tg-9wq8">1개월</td>
						    <td class="tg-9wq8">${regular.oDate.substring(0,10)}</td>
						    <td class="tg-9wq8">
						    	<button class="btn cancelBtn" style="background-color:#EFEFEF;">
						    		취소
						    	</button>
						    </td>
						  </tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
    </div>
</section>
<div style="height:200px"></div>
<section class = "subadd">
    <div class = "container">
    	<span><i class="icon_documents_alt" style="margin-right:10px"></i>정기배송 이력</span>
		<div class = "shoping__cart__table" style="margin-top:30px;">
	        <table>
				<thead>
				  <tr>
				    <th class="tg-m9t7" width="10%">상품 사진</th>
				    <th class="tg-m9t7" width="35%">상품명</th>
				    <th class="tg-m9t7" width="10%">결제 금액</th>
				    <th class="tg-m9t7" width="10%">결제 방법</th>
				    <th class="tg-m9t7" width="10%">결제 주기</th>
				    <th class="tg-m9t7" width="15%">마지막 결제일</th>
				    <th class="tg-m9t7" width="10%">배송 이력</th>
				  </tr>
				</thead>
				<tbody id="historyList">
					<c:forEach items="${regularList}" var="regular">
						<c:if test="${regular.oStatus ne 'O'}">
						  <tr style = "height : 100px">
						    <td class="tg-9wq8">
								<c:if test="${empty regular.aChangeName}">
                                    <img src="<%= request.getContextPath() %>/resources/img/cart/cart-1.jpg"
                                    style="width: auto; height: auto; max-width: 100px; max-height: 100px;" alt="">
                                </c:if>
                                <c:if test="${not empty regular.aChangeName}">
                                    <img src="<%= request.getContextPath() %>/resources/upload/${regular.aChangeName}"
                                    style="width: auto; height: auto; max-width: 100px; max-height: 100px;" alt="">
                                </c:if>
							</td>
						    <td class="tg-9wq8">${regular.pName}</td>
						    <td class="tg-9wq8"><span class="price">${regular.pPrice}</span></td>
						    <td class="tg-9wq8">신용카드</td>
						    <td class="tg-9wq8">1개월</td>
						    <td class="tg-9wq8">${regular.oDate.substring(0,10)}</td>
						    <c:if test="${regular.oStatus eq 'W'}">
							    <td class="tg-9wq8">배송 준비</td>
						    </c:if>
						    <c:if test="${regular.oStatus eq 'X'}">
							    <td class="tg-9wq8">취소</td>
						    </c:if>
						    <c:if test="${regular.oStatus eq 'D'}">
							    <td class="tg-9wq8">배송 완료</td>
						    </c:if>
						    <c:if test="${regular.oStatus eq 'Y'}">
							    <td class="tg-9wq8">반려된 주문</td>
						    </c:if>
						  </tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>

<!-- 배송지 설정 세션 끝 -->

<%@ include file="../include/footer.jsp" %>