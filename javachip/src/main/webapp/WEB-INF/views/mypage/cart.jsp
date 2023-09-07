<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<% int uNo = (int)request.getAttribute("uNo"); %>
	<script>
		function doCheckoutFn() {
			var orderCart = [];
			$("input[name=chkCart]").each(function() {
				if($(this).is(":checked") == true) {
					var chk = $(this).val();
					orderCart.push(chk);
				}
			});
			console.log(orderCart);
			if(orderCart.length == 0) {
				alert("구매하고자 상품을 선택해 주세요.");
				return;
			}
			console.log($("input[name=chkCart]"))
			$("#cart").submit();
		}
				
		function chkAll() {
			$("input[name=chkCart]").prop("checked", true);
			var sum = 0;
			$(".shoping__cart__total").each(function(i, e) {
				sum += parseInt(moneyToNum($(e).text()));
			});
			$("#sumAll").text(moneyFn(sum));
			$("#sumSelAll").text($("#sumAll").text());
		}
		
		function unChkAll() {
			$("input[name=chkCart]").prop("checked", false);
			$("#sumSelAll").text("0원");
		}
		
		function delChk() {
			var selectList = [];
			$("input[name=chkCart]").each(function() {
				if($(this).is(":checked") == true) {
					var chk = $(this).val();
					selectList.push(chk);
					console.log(chk);
					$.ajax({
						url:"deleteCart.do",
						type:"post",
						data:"cNo="+chk,
						success:function(){
							console.log(chk+" deleted");
						},
						error:function(){
							alert("예외 발생!");
						}
					});
				}
			});
			if(selectList.length == 0) {
				alert("선택한 상품이 없습니다.");
			}else {
				alert("선택한 상품이 삭제되었습니다.");
				location.reload();
			}
		}
		
		function delAll() {
			if(confirm("장바구니를 비우시겠습니까?")) {
				$.ajax({
					url:"deleteAllCart.do",
					type:"post",
					data:"uNo="+<%= uNo %>,
					success:function(data) {
						if(data>0) {
							alert("장바구니를 비웠습니다.");
							$("tbody").html('<tr><td colspan="5">장바구니가 비어있습니다.</td></tr>');
							$("#sumAll").html('');
							$("#sumSelAll").text('');
						}else {
							alert("비울 상품이 없거나 잘못된 요청입니다.");
						}
					},
					error:function(){
						alert("예외발생!");
					}
				});
			}
		}
		
		// 금액 ,+원
		function moneyFn(str) {
			return str.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',')+"원"
		}
		
		function moneyToNum(str) {
			var newStr = str.toString().replace(',' ,'');
			return newStr.toString().replace('원' ,'');
		}
		
		$(document).ready(function(){
			
			$(".cartPrice").each(function() {
				var cPrice = $(this).text();
				$(this).text(moneyFn(cPrice));
			});
			$(".cartTotal").each(function() {
				var cTotal = $(this).text();
				$(this).text(moneyFn(cTotal));
			});
			
			
			var sum = 0;
			$(".shoping__cart__total").each(function(i, e) {
				sum += parseInt(moneyToNum($(e).text()));
			});
			$("#sumAll").text(moneyFn(sum));
			
			$("input[name=cCount]").change(function() {
				var obj = $(this);
				var cNo = obj.parents("tr").find("input[name=chkCart]").val();
				var cCount = obj.parents("tr").find("input[name=cCount]").val();
				var input = obj.parents("tr").find(".shoping__cart__total");
				var price = obj.parents("tr").find(".shoping__cart__price").text();
				var cal = parseInt(moneyToNum(cCount))*parseInt(moneyToNum(price));
				$.ajax({
					url:"updateCount.do",
					type:"post",
					data:"cNo="+cNo+"&cCount="+cCount,
					success:function(data) {
						if(data > 0) {
							console.log(data+" success");
							input.html(moneyFn(cal));
							
							sum = 0;
							$(".shoping__cart__total").each(function(i, e) {
								sum += parseInt(moneyToNum($(e).text()));
							});
							$("#sumAll").text(moneyFn(sum));
							
							chkSelPrice();
						}
					},
					error:function(){
						alert("예외발생!");
					}
				});
			});
			
			$(".icon_close").click(function() {
				var obj = $(this);
				var cNo = obj.parents("tr").find("input[name=chkCart]").val();
				$.ajax({
					url:"deleteCart.do",
					type:"post",
					data:"cNo="+cNo,
					success:function(data) {
						if(data > 0) {
							console.log("success");
							obj.parents("tr").empty();
							
							var sum = 0;
							$(".shoping__cart__total").each(function(i, e) {
								sum += parseInt(moneyToNum($(e).text()));
							});
							$("#sumAll").text(moneyFn(sum));
						}
					},
					error:function(){
						alert("예외발생!");
					}
				});
			});
			
			function chkSelPrice() {
				var selSum = 0;
				$("#sumSelAll").text(selSum);
				$("input[name=chkCart]").each(function() {
					if($(this).is(":checked") == true) {
						selSum += parseInt(moneyToNum($(this).parents("tr").find(".shoping__cart__total").text()));
					}
				});
				$("#sumSelAll").text(moneyFn(selSum));
			}
			
			$("input[name=chkCart]").change(function() {
				chkSelPrice();
			});
		});
	</script>
<!-- 메인 작성 영역 -->
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>장바구니</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>/">홈</a>
                            <a href="main.do">마이페이지</a>
                            <span>장바구니</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <form id="cart" method="post" action="cart.do">
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table id="cartTable">
                            <thead>
                                <tr>
                                    <th width="50px"></th>
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총합</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                            	<c:when test="${empty cartList}">
                            		<tr>
                            			<td colspan="5">장바구니가 비어있습니다.</td>
                            		</tr>
                            	</c:when>
                            	<c:otherwise>
		                            <c:forEach items="${cartList}" var="cart">
		                                <tr>
		                                	<td><input type="checkbox" name="chkCart" id="chkNo${cart.cNo}" value="${cart.cNo}"></td>
		                                    <td class="shoping__cart__item">
		                                    	<a href="<%= request.getContextPath() %>/shop/details.do?pNo=${cart.pNo}" target="_blank" rel="noreferer">
		                                    <c:if test="${empty cart.aChangeName}">
			                                        <img src="<%= request.getContextPath() %>/resources/img/cart/cart-1.jpg"
			                                        style="width: auto; height: auto; max-width: 100px; max-height: 100px;" alt="">
		                                    </c:if>
		                                    <c:if test="${not empty cart.aChangeName}">
			                                        <img src="<%= request.getContextPath() %>/resources/upload/${cart.aChangeName}"
			                                        style="width: auto; height: auto; max-width: 100px; max-height: 100px;" alt="">
		                                    </c:if>
			                                        <h5>${cart.pName}</h5>
		                                    	</a>
		                                    </td>
		                                    <td class="shoping__cart__price">
		                                    	<span class="cartPrice">${cart.pPrice}</span>
		                                    </td>
		                                    <td class="shoping__cart__quantity">
		                                        <div class="quantity">
		                                            <div class="pro-qty">
		                                                <input type="text" name="cCount" value="${cart.cCount}"
		                                                oninput="this.value=this.value.replace(/[^0-9]/g,'');" readonly>
		                                            </div>
		                                        </div>
		                                    </td>
		                                    <td class="shoping__cart__total">
		                                        <span class="cartTotal">${cart.cCount * cart.pPrice}</span>
		                                    </td>
		                                    <td class="shoping__cart__item__close">
		                                        <span class="icon_close"></span>
		                                    </td>
		                                </tr>
		                            </c:forEach>
                            	</c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="javascript:chkAll()" class="primary-btn cart-btn"><span class="icon_check"></span> 모두 선택</a>
                        <a href="javascript:unChkAll()" class="primary-btn cart-btn"><span class="icon_close"></span> 모두 선택 해제</a>
                        <a href="javascript:delAll()" class="primary-btn cart-btn cart-btn-right">
                        	<span class="icon_trash"></span> 모두 비우기
                        </a>
                        <a href="javascript:delChk()" class="primary-btn cart-btn cart-btn-right" style="margin-right:3px">
                        	<span class="icon_trash_alt"></span> 선택 상품 비우기
                        </a>
                    </div>
                </div>
                <div class="col-lg-6 offset-sm-6">
                    <div class="shoping__checkout">
                        <h5>장바구니 총합</h5>
                        <ul>
                            <li>선택한 상품<span id="sumSelAll">0원</span></li>
                            <li>전체<span id="sumAll">0원</span></li>
                        </ul>
                        <a href="javascript:doCheckoutFn()" class="primary-btn" style="color:white;">구매하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </form>
    <!-- Shoping Cart Section End -->
<!-- 메인 작성 영역 -->
<%@ include file="../include/footer.jsp" %>