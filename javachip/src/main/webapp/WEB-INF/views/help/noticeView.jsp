<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="<%=request.getContextPath() %>/resources/js/notice.js"></script>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>공지사항</h2>
						<div class="breadcrumb__option">
							<a href="<%= request.getContextPath() %>">Home</a>
							<a href="#">고객센터</a>
							<a href="notice.do">공지사항</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="board-box spad">
		<div class="container">
			<h4> 글 보기</h4>
			<table class="table" style="margin-top:40px; margin-bottom:50px; font-size:11pt;">
				<tr>
					<td style="width:12%">제목</td>
					<td colspan="2">${noticeVO.nTitle}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2">${noticeVO.uName}</td>
				</tr>
				
				<fmt:parseDate value="${noticeVO.nDate}" pattern="yyyy-MM-dd HH:mm:ss" var="dateStr"/>
 				<fmt:formatDate value="${dateStr}" pattern="yyyy.MM.dd HH:mm:ss" var="boardDate"/>
 				
				<tr style="color:gray; font-size:10pt;">
					<td colspan="2">작성일  ${boardDate}</td>
				</tr>
				<tr>
					<td colspan="3" style="white-space:pre-line; height:200px;">
						${noticeVO.nContents}
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<button type="button" class="btn btn-secondary" style="margin-right:15px;" onclick="location.href='notice.do'">목록으로</button>
					<c:if test="${login.uNo eq noticeVO.uNo}">
						<button type="button" class="btn btn-outline-primary" style="margin-right:15px;" onclick="location.href='noticeModify.do?nNo=${noticeVO.nNo}'">수정하기</button>
						<button type="button" class="btn btn-outline-danger" onclick="noticeDelFn();">삭제하기</button>
					</c:if>
						<form name="delFrm" method="post" action="noticeDelete.do">
							<input type="hidden" name="nNo" value="${noticeVO.nNo}">
						</form>
					</td>
				</tr>
			</table>
			<table class="table table-striped" style="margin-top:50px;table-layout:fixed;">
				<c:forEach var="nearNotice" items="${nearNoticeList}">
				<c:if test="${nearNotice.nNo > noticeVO.nNo}">
					<tr>
						<th scope="row" style="width:12%">▲다음글</th>
						<td class="boardElipsis"><a href="noticeView.do?nNo=${nearNotice.nNo}">${nearNotice.nTitle}</a></td>
					</tr>
				</c:if>
				<c:if test="${nearNotice.nNo < noticeVO.nNo}">
					<tr>
						<th scope="row" style="width:12%">▼이전글</th>
						<td class="boardElipsis"><a href="noticeView.do?nNo=${nearNotice.nNo}">${nearNotice.nTitle}</a></td>
					</tr>
				</c:if>
				</c:forEach>
			</table>
		</div>
	</section>
<%@ include file="../include/footer.jsp" %>