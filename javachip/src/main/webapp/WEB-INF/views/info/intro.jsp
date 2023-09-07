<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
    <!-- 배너 섹션 시작 -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>회사 소개</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.jsp">홈</a>
                            <a href="./info-intro.jsp">회사 소개</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 배너 섹션 끝 -->

<div style="height:600px">
	<div style="float: left; width: 20%; height : 500px;"></div>
	<div style="float: left; width: 55%; height : 500px; align:center;">
	<img style="width:100%; height:100%;" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver
	.net%2FMjAxODA1MjlfMjQy%2FMDAxNTI3NTg1ODA1OTk1.04eu2W-OMlc4fAg4dn6-uIERWkVPi1I8XmUlrc_aMF0g.
	gVmpl-8QSS0mTzmPTsZg-vCgzXYIOh6FUxcg0p_FKo0g.PNG.core_k%2Fbean_Sample.png&type=sc960_832">
	</div>
	<div style="float: left; width: 20%; height : 500px;"></div>
</div>
<%@ include file="../include/footer.jsp" %>