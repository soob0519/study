<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>동화소개</title>
        <link rel="stylesheet" href="css/total.css">
        <script src="js/jquery-1.10.2.min.js"></script>
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script src="js/script.js"></script>
    </head>
    
    <!-- 
    꺄르르르르~~~~~~~~
    //-->
    
    
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
                        <a href="index.html"><span class="blind">home</span></a>
                    </li>
                    <li>
                        <a href="sub_1.html">동화소개</a>
                    </li>
                    <li>
                        <a href="sub_1.html">인사말</a>
                    </li>
                </ul>
                <div class="intro_tit">
                    <h2>고객이 찾던 <span>제약회사</span><br>
                        <span>우리 삶에 유익한 제품</span>을 만듭니다.
                    </h2>
                </div>
                <ul class="tab_menu">
                    <li>
                       <a href="sub_1.html" class="on">인사말</a>
                    </li>
                    <li>
                        <a href="sub_1.html">연혁</a> 
                    </li>
                    <li>
                    <a href="sub_1.html">CI소개</a> 
                    </li>
                    <li>
                    <a href="sub_1.html">연구소&amp;공장</a> 
                    </li>
                    <li>
                    <a href="sub_1.html">오시는길</a> 
                    </li>
                </ul>
            </div>
            <div class="content">
                <div class="content_tit">
                    <h2 data-aos="fade-down" data-aos-duration="1000" data-aos-delay="300">대한민국 최초의 제약회사</h2>
                    <h2 data-aos="fade-down" data-aos-duration="1000" data-aos-delay="400"><span>대한민국 최고의 제약회사</span> 동화약품</h2>
                    <p data-aos="fade-down" data-aos-duration="1000" data-aos-delay="500">동화약품 홈페이지를 방문해주신 여러분을 진심으로 환영합니다.</p>
                </div>
                <div class="sub01_item">
                    <div class="sub_center">
                        <div class="item_wrap" data-aos="fade-right" data-aos-duration="1000" data-aos-delay="300">
                            <div class="content_item01">
                                <h2><span>동화약품</span>은 1897년 대한민국 최초 제약기업입니다.</h2>
                                <p>1897년 설립된 이래 인간행복 경영을 통하여 고객 및 직원 모두의 행복을 추구하여 왔습니다.</p>
                                <p>이제 이러한 행복이 새로운 100년을 이어가도록 변화혁신 경영을 통하여 진정으로 행복한 기업이 되려 합니다.</p>
                                <p>인류 건강과 행복한 삶을 추구하는 동화의 노력을 지켜봐 주십시오.</p>
                            </div>
                            <div class="content_item01">
                                <h2><span>동화약품</span>은 '좋은 약이 아니면 만들지 말라'는 동화정신을 따릅니다.</h2>
                                <p>"좋은 약을 만들어 소비자에게 봉사하고 그 효험을 본 정당한 대가로 경영되는 회사" 라는</p>
                                <p>고객의 안전과 건강 최우선의 기업정신 하에 127년간 원칙을 지키고 법규를 준수하면서</p>
                                <p>고객의 신뢰를 지속적으로 쌓아가며 행복을 추구하고 있습니다.</p>
                            </div>
                            <div class="content_item01">
                                <h2><span>동화약품</span>은 윤리경영을 실천하기 위해 노력합니다.</h2>
                                <p>동화약품은 "젊어서 정당하게 땀흘려 일하고 노후에 잘 살아 보려는 동화식구의 회사" 라는</p>
                                <p>직원 개개인의 가치 존중 이념 하에 모두 회사의 주인이라는 신뢰와 믿음을 바탕으로</p>
                                <p>고객 한분 한분께 다가서고 있습니다.</p>
                            </div>
                            <div class="content_item01">
                                <h2><span>동화약품</span>은 ESG를 실천하는 기업입니다.</h2>
                                <p>ESG는 126년을 이어 온 동화정신에 내포되어 있고, 우리의 경영 DNA의 일부입니다.</p>
                                <p>자부심과 사명감을 가지고 고객과의 약속을 지키기 위해 노력하겠습니다.</p>
                                <p>감사합니다.</p>
                            </div>
                            <p class="ceo">동화약품 대표이사 유준하</p>
                        </div>
                        <div class="ceo_img_wrap">
                            <div class="ceo_img" data-aos="fade-left" data-aos-duration="1000" data-aos-delay="300"></div>
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