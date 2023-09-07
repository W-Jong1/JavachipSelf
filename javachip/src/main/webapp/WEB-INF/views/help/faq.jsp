<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>자주 묻는 질문</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home</a>
							<a href="#">고객센터</a>
							<a href="./help-faq.jsp">자주 묻는 질문</a>
						</div>
					 </div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<section class="board-box spad">
	<div class="container">
		<div class="row">
		  <div class="col-4">
		    <div class="list-group" id="list-tab" role="tablist">
		      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">
		      배송은 얼마나 걸리나요?</a>
		      <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">
		      배송시 상품 상태가 상하지 않나요?</a>
		      <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">
		      상품 교환이나 변경은 어떻게 하나요?</a>
		      <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">
		      가나다라마바사</a>
		      <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">
		      abcdefghijk</a>
		    </div>
		  </div>
		  <div class="col-8">
		    <div class="tab-content" id="nav-tabContent">
		      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
		      최대한 빠르게 배송해드리고 있습니다만, 배송회사 사정에 따라 달라 질수 있습니다.</div>
		      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
		      빠른배송을 우선시하며, 좋은 상품을 유지하도록 노력중입니다. 상품에 변질이 있을시 교환해드리겠습니다.</div>
		      <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
		      교환/환불 신청해주시면 됩니다.</div>
		      <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">
		      아자차카타파하</div>
		      <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">
		      lmnopqrstuvwxyz</div>
		    </div>
		  </div>
		</div>
	</div>
	</section>
<%@ include file="../include/footer.jsp" %>