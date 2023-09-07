<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
	<div class="frame login">
		<form name="login frm" action="login.do" method="post">
			<h2>Login</h2>
			<div class="main login">
				<br>
				<input type="text" name="uId" placeholder="아이디"><br>
				<input type="password" name="uPw"  placeholder="비밀번호"><br>
			</div>
			<input class="login btn" type="submit" value="로그인">
			
			<div class="main login">
				<a href="<%=request.getContextPath() %>/member/joinSelect.do">회원가입</a> |
				<a href="<%=request.getContextPath() %>/member/idFind.do">아이디찾기</a> |
				<a href="<%=request.getContextPath() %>/member/pwFind.do">비밀번호찾기</a>
			</div>
		</form>
	</div>
<%@ include file="../include/footer.jsp" %>