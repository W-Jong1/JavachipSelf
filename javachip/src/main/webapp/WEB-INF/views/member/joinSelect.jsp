<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
	<div class="frame login">
		<form name="login frm">
			<h2>회원가입</h2>
			<div>
				<br><br>
				<a href="<%=request.getContextPath() %>/member/join.do" class="btn btn-primary btn-lg"> 일반 회원 가입</a>
			</div>
			<br><br>
			<div>
				<a href="<%=request.getContextPath() %>/member/joinBiz.do" class="btn btn-danger btn-lg">사업자 회원 가입</a>
			</div>
		</form>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp" %>