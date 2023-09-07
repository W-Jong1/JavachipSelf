<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!-- 배너 세션 시작 -->
<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Blog</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Home</a>
                        <span>Blog</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 배너 세션 끝 -->

<!-- 배송지 설정 세션 시작 -->
<section class = "mainadd">
    <div class = "container">
        <h4>배송지 관리</h4>
        <span> • 기본 배송지</span>
        <table class="tg" style="undefined;table-layout: fixed; width: 100%">
            <colgroup>
            <col style="width: 55px">
            <col style="width: 78px">
            <col style="width: 143px">
            <col style="width: 338px">
            <col style="width: 236px">
            <col style="width: 80px">
            </colgroup>
            <thead>
              <tr>
                <th class="tg-m9t7">별칭</th>
                <th class="tg-m9t7">수령인</th>
                <th class="tg-m9t7">연락처</th>
                <th class="tg-m9t7">주소</th>
                <th class="tg-m9t7">배송메시지</th>
                <th class="tg-m9t7">배송지<br>삭제</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="tg-9wq8">집</td>
                <td class="tg-9wq8">김길동</td>
                <td class="tg-9wq8">010-1234-5678</td>
                <td class="tg-lboi">전라북도 전주시 덕진구 금암동 123-45<br>이젠아파트 101동 1234호</td>
                <td class="tg-9wq8">부재 시 경비실에 맡겨주세요.</td>
                <td class="tg-9wq8">삭제</td>
              </tr>
            </tbody>
        </table>
    </div>
</section>

<section class = "subadd">
    <div class = "container">
    	<span> • 기타 배송지</span>
		<table class="tg" style="undefined;table-layout: fixed; width: 100%">
			<colgroup>
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 78px">
				<col style="width: 120px">
				<col style="width: 360px">
				<col style="width: 236px">
				<col style="width: 70px">
			</colgroup>
			<thead>
			  <tr>
			    <th class="tg-m9t7">선택</th>
			    <th class="tg-m9t7">별칭</th>
			    <th class="tg-m9t7">수령인</th>
			    <th class="tg-m9t7">연락처</th>
			    <th class="tg-m9t7">주소</th>
			    <th class="tg-m9t7">배송메시지</th>
			    <th class="tg-m9t7">배송지<br>삭제</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
			    <td class="tg-9wq8"><input type="checkbox" name="xxx" value="yyy"></td>
			    <td class="tg-9wq8">집</td>
			    <td class="tg-9wq8">김길동</td>
			    <td class="tg-9wq8">010-1234-5678</td>
			    <td class="tg-lboi">전라북도 전주시 덕진구 금암동 123-45<br>이젠아파트 101동 1234호</td>
			    <td class="tg-9wq8">부재 시 경비실에 맡겨주세요.</td>
			    <td class="tg-9wq8">삭제</td>
			  </tr>
			  <tr>
			    <td class="tg-9wq8"><input type="checkbox" name="xxx" value="yyy"></td>
			    <td class="tg-9wq8">집</td>
			    <td class="tg-9wq8">김길동</td>
			    <td class="tg-9wq8">010-1234-5678</td>
			    <td class="tg-lboi">전라북도 전주시 덕진구 금암동 123-45<br>이젠아파트 101동 1234호</td>
			    <td class="tg-9wq8">부재 시 경비실에 맡겨주세요.</td>
			    <td class="tg-9wq8">삭제</td>
			  </tr>
			  <tr>
			    <td class="tg-9wq8"><input type="checkbox" name="xxx" value="yyy"></td>
			    <td class="tg-9wq8">집</td>
			    <td class="tg-9wq8">김길동</td>
			    <td class="tg-9wq8">010-1234-5678</td>
			    <td class="tg-lboi">전라북도 전주시 덕진구 금암동 123-45<br>이젠아파트 101동 1234호</td>
			    <td class="tg-9wq8">부재 시 경비실에 맡겨주세요.</td>
			    <td class="tg-9wq8">삭제</td>
			  </tr>
			</tbody>
		</table>
		<div class="d-grid gap-2 d-md-block">
		  <button class="btn btn-primary" type="button">기본 배송지로 변경</button>
		</div>
	</div>
	<div>
	최종훈
	</div>
</section>

<!-- 배송지 설정 세션 끝 -->

<%@ include file="../include/footer.jsp" %>