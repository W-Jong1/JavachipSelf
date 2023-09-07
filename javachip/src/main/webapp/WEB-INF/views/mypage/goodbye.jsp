<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
	<div class="frame login">
		<form name="goodbye frm" action="goodbye.do" method="post" >
			<h3>회원탈퇴</h3>
			<div class="main login">
				<br>
				탈퇴하실 경우 즉시 승인되며 철회 불가능합니다.<br>
				탈퇴하시겠습니까?<br>
				(탈퇴 후 개인 정보는 1달 보관 후 삭제됩니다.)<br><br>
				하단 ID 확인 , 비밀번호 입력후 버튼을 눌러주세요.<br>
				<input type="text" style="margin-top:10px;" id="uId" name="uId" value="${login.uId}" readonly/><br>
				<input type="hidden" value="${login.uNo }">
				<input type="password" id="uPw" name="uPw" >
			</div>
			<input class="login btn" type="submit" value="탈퇴하기">
			<input type="button" class="btn btn-outline-secondary" style="width:150px; height:40px;"
			value="돌아가기" onclick = "location.href = /">
		</form>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp" %>