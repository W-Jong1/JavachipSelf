<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import="com.javachip.vo.UserVO" %>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>회원정보 수정</h2>
						<div class="breadcrumb__option">
							<a href="<%= request.getContextPath() %>/">Home</a>
							<a href="main.do">마이페이지 </a>
							<span>회원정보 수정</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<section class="join spad">
        <div class="container">
            <div class="join__form">
                <h4>회원정보 수정</h4>
                <form action="myinfoUpdate.do" method="post" onsubmit="return checks()">
                    <div class="join__input"><!-- PK에서 가져오기 -->
                    	<p>비밀번호 변경</p>
                        	<button type="button" class="btn btn-outline-secondary" onclick="pwUpdate()" style="margin-bottom:20px;">비밀번호 변경</button>
                    	<p>아이디<span>*</span></p>
                        	<input type="text" class="join__input__short" id="uId" name="uId" value="${login.uId}" readonly/>
                        <p>성명<span>*</span></p>
                        	<input type="text" class="join__input__short" id="uName" name="uName" onblur="checkFn(this)" value="${login.uName}" readonly/>
                        	<div class="msg"></div>
                        <p>주소<span>*</span></p>
	                        <input type="text" placeholder="우편번호" class="join__input__short" id="uAdd1" name="uAdd1" value="${login.uAdd1}">
	                        <button type="button" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()">우편번호</button>
	                        <input type="text" placeholder="주소" class="join__input__add" id="uAdd2" name="uAdd2" value="${login.uAdd2}">
	                        <input type="text" placeholder="나머지 주소" class="join__input__add" id="uAdd3" name="uAdd3" value="${login.uAdd3}">
                        <p>전화번호<span>*</span></p>
							<input class="join__input__short" type="text" name="uPhone" id="uPhone" onblur="checkFn(this)" value="${login.uPhone}">
							<div class="msg"></div>
                        <p>이메일<span>*</span></p>
                        	<input type="text" class="join__input__email" name="uMail" id="uMail" onblur="checkFn(this)" value="${login.uMail}">
                        	<div class="msg"></div>
                       <c:if test="${login.uStatus eq 'B'}">
	                        <p>상호명(법인명)<span>*</span></p>
	                        	<input type="text" class="join__input__short" id="uBisname" name="uBisname" value="${login.uBisName}" readonly/>
	                        <p>사업자 등록 번호<span>*</span></p>
	                        	<input type="text" class="join__input__short" name="uBisno" id="uBisno" value="${login.uBisno}" readonly/>
                        </c:if>
                   	</div>
                   	<hr>
                   	<div id="agr" style="display:none">
                   		<input type="checkbox" id="agree_all" name="agree_all" value="agree_all" checked/>
                   	</div>
					<div class="join__submit">
						<input type="submit" class="btn btn-primary" value="정보 수정">
						<input type="button" class="btn btn-outline-secondary" value="취소" onClick="history.go(-1)"/>
					</div>
                </form>
            </div>
        </div>
    </section>
    <script src="<%=request.getContextPath() %>/resources/js/myinfoUpdate.js"></script>
<%@ include file="../include/footer.jsp" %>