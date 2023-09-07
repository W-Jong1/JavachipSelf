<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="<%=request.getContextPath() %>/">
                            	<img src="<%=request.getContextPath() %>/resources/img/logo.png" alt="">
                            </a>
                        </div>
                        <ul>
                            <li>주소 : 전북 전주시 덕진구 금암동 123-4</li>
                            <li>전화번호: 063-123-4567</li>
                            <li>Email: hello@colorlib.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>공지사항</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>계좌번호</h6>
                        <ul>
                            <li style="width:200px;">하나은행 123-456-7891011</li>
                            <li>예금주 : 자바칩</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text">
                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                			<span>상호 : 자바칩프라페 </span>
                			<span>대표자 : 자바칩</span>
                			<span>전화 : 063-123-4567</span>
                			<span>팩스 : 063-987-6543</span>
                			<span>개인정보관리책임자 : <a href="#">자바칩(javachip0703@gmail.com)</a></span><br>
                			<span>사업자등록 : 853-81-00169</span>
                			<span>통신판매업신고 : 2021-전북전주-00289  </span>
                			<span>주소 : 12345 전북 전주시 덕진구 금암동</span><br>
                			<span>Copyright ©  <strong>자바칩프라페</strong>. All rights reserved.</span>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
  						</div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->
</body>
	<!-- Js Plugins -->
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.bundle.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.nice-select.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/mixitup.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/main.js"></script>
    <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/addressapi.js"></script>
</html>