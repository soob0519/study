<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>




<!-- <font size ="10" >오늘 왔습니다.</font> --> 





<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>사회공헌</title>
        <link rel="stylesheet" href="css/total.css">
        <script src="js/jquery-1.10.2.min.js"></script>
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script src="js/script.js"></script>
    </head>
    <body>
        <script>AOS.init();</script>
 
 		<!--사이트맵영역-->
        <div class="site_map">
			<jsp:include page="../include/sitemap.jsp" />
        </div>
        <!--모바일메뉴영역-->
        <div class="m_menu">
 			<jsp:include page="../include/mobilemenu.jsp" />
        </div>
        <!--헤더영역-->
        <header class="sub_header">
			<jsp:include page="../include/header.jsp" />
        </header>
 
        <section class="sub">
            <div class="navi2 sub_center">
                <div class="bg_item">
                    <div class="bg_item01"><span class="blind">분자1</span></div>
                    <div class="bg_item02"><span class="blind">분자2</span></div>
                    <div class="bg_item03"><span class="blind">분자3</span></div>
                    <div class="bg_item04"><span class="blind">분자4</span></div>
                </div>
                <ul class="sub_navi2">
                    <li>
                        <a href="index.do"><span class="blind">home</span></a>
                    </li>
                    <li>
                        <a href="sub3.do">사회공헌</a>
                    </li>
                    <li>
                        <a href="sub3.do">개요</a>
                    </li>
                </ul>
                <div class="intro_tit">
                    <h2><span>열린마음</span>으로 생각하고<br>
                        <span>봉사의 마음</span>으로 행동합니다.
                    </h2>
                </div>
                <ul class="tab_menu">
                    <li>
                       <a href="sub3.do" class="on">개요</a>
                    </li>
                    <li>
                        <a href="sub3.do">국민생활건강 캠페인</a> 
                    </li>
                    <li>
                    <a href="sub3.do">공생 캠페인</a> 
                    </li>
                    <li>
                        <a href="sub3.do">맑은바람 캠페인</a> 
                    </li>
                </ul>
            </div>
            <div class="content">
                <div class="content_tit">
                    <h2 data-aos="fade-down" data-aos-duration="1000" data-aos-delay="300"><span>건강한 바람</span>을 불러 일으키는</h2>
                    <h2 data-aos="fade-down" data-aos-duration="1000" data-aos-delay="400">동화약품의<span> 사회공헌</span> 활동</h2>
                    <p data-aos="fade-down" data-aos-duration="1000" data-aos-delay="500">국민들의 건강한 삶을 위하여 동화약품은 노력합니다.</p>
                </div>
                <div class="sub05_item">
                    <div class="sub_center">
                        <div class="item_wrap">
                            <div class="cam01">
                                <div class="cam_img" data-aos="fade-right" data-aos-duration="1000" data-aos-delay="200">
                                    <img src="images/sub05/cam_img01.png" alt="국민생활건강 이미지">
                                </div>
                                <div class="cam_text" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="300">
                                    <h3>국민생활건강 캠페인</h3>
                                    <p>코로나로 놓친 국민들의 건강한 삶을 위하여</p>
                                    <p>국민생활건강 캠페인을 시작합니다.</p>
                                    <p>모든 국민이 건강한 삶을 영위하기 위해</p>
                                    <p>건강한 생활습관을 실천합시다.</p>
                                </div>
                            </div>
                            <div class="cam02">
                                <div class="cam_img" data-aos="fade-left" data-aos-duration="1000" data-aos-delay="200">
                                    <img src="images/sub05/cam_img02.png" alt="공생 이미지">
                                </div>
                                <div class="cam_text" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="300">
                                    <h3>공생 캠페인</h3>
                                    <p>인간보다 더 인간다운 자연의 공생을</p>
                                    <p>동화약품이 함께합니다.</p>
                                    <p>우리 모두가 지구의 환경에 감사함을 느끼고</p>
                                    <p>사랑하는 지구시민이 됩시다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cam03" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="600">
                        <div class="sub_center">
                            <div class="cam_text">
                                <h3>맑은 바람 캠페인</h3>
                                <p>가정과 사회, 세상에 건강한 바람을 불러 일으키고자 하는</p>
                                <p>동화약품의 바람을 담아 다양한 사회공헌 활동을 전개하고 있습니다.</p>
                            </div>
                            <div class="cam03_wrap">
                                <div class="cam03_item">
                                    <img src="images/sub05/cam_img03.png" alt="생명을 살리는 물">
                                    <div class="cam03_text">
                                        <h4>생명을 살리는 물</h4>
                                        <p>전세계 어린이들에게 깨끗한 물을 전달합니다.</p>
                                    </div>
                                </div>
                                <div class="cam03_item">
                                    <img src="images/sub05/cam_img04.png" alt="생명을 살리는 물">
                                    <div class="cam03_text">
                                        <h4>어린이 축구 교실</h4>
                                        <p>어린이들이 상처 없이 꿈을 펼치도록 지원합니다.</p>
                                    </div>
                                </div>
                                <div class="cam03_item">
                                    <img src="images/sub05/cam_img05.png" alt="생명을 살리는 물">
                                    <div class="cam03_text">
                                        <h4>어린이 생활 안전 캠페인</h4>
                                        <p>후시딘과 함께하는 어린이 안전 캠페인을 진행합니다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--하단영역-->

        <footer>
		<jsp:include page="../include/footer.jsp" />
        </footer>

    </body>
</html>