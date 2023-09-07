<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Q&A</h2>
						<div class="breadcrumb__option">
							<a href="<%= request.getContextPath() %>/">Home</a>
							<a href="#">고객센터</a>
							<span>Q&A</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="board-box spad">
		<div class="container secretBoard" style="text-align:center;">
			이 글은 비밀 글 입니다. 작성자 또는 관리자만 확인 할 수 있습니다.<br>
			로그인 후 확인해 주세요.<br><br>
			<div class="board-wButton" style="margin-bottom:20px;">
				<button type="button" class="btn btn-secondary" style="margin-right:15px;" onclick="location.href='qna.do'">목록으로</button>
			</div>
		</div>
	</section>
<%@ include file="../include/footer.jsp" %>