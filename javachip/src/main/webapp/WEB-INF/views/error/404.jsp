<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<section class="board-box spad">
		<div class="container">
			<div class="errorPage">
				<h1>404</h1><br>
			
				<h5>요청하신 페이지를 찾을 수 없습니다.</h5><br>
				
				주소가 잘못 입력되었거나 변경또는 삭제된 페이지 입니다.<br>
			</div>
			<div class="p-2 bd-highlight" align="center">
					<button class="btn btn-dark" type="button" style="margin-right:20px;" onclick="location.href='<%=request.getContextPath() %>'">메인으로</button>
					<button class="btn btn-outline-secondary" type="button" onclick="javascript:history.back();">이전페이지</button>
			</div>
		</div>
	</section>
<%@ include file="../include/footer.jsp" %>