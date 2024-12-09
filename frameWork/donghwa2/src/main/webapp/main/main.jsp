<%@ page language="java" contentType="text/html; charset=UTF-8"
													pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>동화약품</title>
        <link rel="stylesheet" href="../css/total.css">
        <link rel="stylesheet" href="../css/bxslider_mv.css">
        <link rel="stylesheet" href="../css/bxslider_pd.css">
        <link rel="stylesheet" href="../css/AOS.css">
        <script src="../js/jquery-1.10.2.min.js"></script>
        <script src="../js/jquery.bxslider.min.js"></script>
        <script src="../js/AOS.js"></script>
        <script src="../js/script.js"></script>
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
        <header class="header">
  
             <div class="h_inner center fix_flexbetween">
                <h1 class="logo">
                    <a href="/index.do">
                        <span class="blind">동화약품 로고</span>
                    </a>
                </h1>
                <nav class="navi center">
                    <ul class="navi_list">
                        <li>
                            <a href="/sub1.do">동화소개</a>
                        </li>
                        <li>
                            <a href="/goodsList.do">제품정보</a>
                        </li>
                        <li>
                            <a href="/sub2.do">연구개발</a>
                        </li>
                        <li>
                            <a href="/boardList.do?mno=1">IR자료실</a>
                        </li>
                        <li>
                            <a href="/sub3.do">사회공헌</a>
                        </li>
                    </ul>
                </nav>
                <ul class="snb">
                    <li>
                        <a href="#none">EN</a>
                    </li>
                    <li>
                        <a href="#none">KR</a>
                    </li>
                </ul>
                <a href="#none" class="pc_btn">
                    <span class="blind">pc메뉴</span>
                </a>
                <a href="#none" class="m_btn">
                    <span class="blind">모바일메뉴</span>
                </a>
            </div>
            <div class="gnb">
                <div class="center gnb_flex">
                    <ul>
                        <li><a href="/sub1.do">인사말</a></li>
                        <li><a href="/sub1.do">연혁</a></li>
                        <li><a href="/sub1.do">CI소개</a></li>
                        <li><a href="/sub1.do">연구소&amp;공장</a></li>
                        <li><a href="/sub1.do">오시는길</a></li>
                    </ul>
                    <ul>
                        <li><a href="/goodsList.do">제품 검색</a></li>
                        <li><a href="/goodsList.do">신제품</a></li>
                        <li><a href="/goodsList.do">전문의약품</a></li>
                        <li><a href="/goodsList.do">일반의약품</a></li>
                        <li><a href="/goodsList.do">건강기능식품</a></li>
                    </ul>
                    <ul>
                        <li><a href="/sub2.do">R&amp;D소개</a></li>
                        <li><a href="/sub2.do">연구성과</a></li>
                        <li><a href="/sub2.do">중점 연구분야</a></li>
                        <li><a href="/sub2.do">글로벌 동화</a></li>
                    </ul>
                    <ul>
                        <li><a href="/boardList.do?mno=1">공시</a></li>
                        <li><a href="/boardList.do?mno=2">사업보고서</a></li>
                        <li><a href="/boardList.do?mno=3">전자공고</a></li>
                    </ul>
                    <ul>
                        <li><a href="/sub3.do">개요</a></li>
                        <li><a href="/sub3.do">국민생활건강 캠페인</a></li>
                        <li><a href="/sub3.do">공생 캠페인</a></li>
                        <li><a href="/sub3.do">맑은 바람 캠페인</a></li>
                    </ul>
                </div>
            </div>
  
        </header>
        
        
        <!--메인비주얼영역-->
        <section class="mv">
            <div class="bxslider_mv">
                <div class="mv01"></div>
                <div class="mv02"></div>
                <div class="mv03"></div>
            </div>
            <div class="mv_text_wrap">
                
                <div class="mv_text">
                    <p class="mv_p" data-aos="fade-down" data-aos-duration="800" data-aos-delay="100">
                        우리의 동화
                    </p>
                    <h2 data-aos="fade-down" data-aos-duration="900" data-aos-delay="200">
                        Better Life With Dongwha
                    </h2>
                    <h3 data-aos="fade-down" data-aos-duration="1000" data-aos-delay="300">
                        For The Health And Happiness Of The People
                    </h3>
                    <div class="mv_btn_wrap">
                        <p class="btn01" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="400"><span class="btn02">1</span> - 3</p>
                        <div class="mv_btn_wrap">
                            <a href="#none" class="prevBtn_mv" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="400"></a>
                            <a href="#none" class="nextBtn_mv" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="400"></a>
                        </div>
                    </div>
                </div>
                
            </div>
        </section>
        <section class="about">
            <div class="about_wrap01 center">
                <div class="about_text">
                    <h2 data-aos="fade-down" data-aos-duration="1000" data-aos-delay="100">
                        ABOUT
                    </h2>
                    <div class="about_line_wrap" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="200">
                        <div class="about_line"></div>
                    </div>
                    <p data-aos="fade-down" data-aos-duration="1000" data-aos-delay="200">
                        1897년부터 변하지 않은 동화정신
                    </p>
                    <span data-aos="fade-down" data-aos-duration="1000" data-aos-delay="300">
                        GLOBAL DONGWHA
                    </span>
                </div>
                <div class="about_wrap02">
                    <ul class="about_item fix_flexcenter" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="400">
                        <li class="about_item01">
                            <div class="about_item_wrap">
                                <a href="sub_1.html">
                                    <div class="icon">
                                        <span class="blind">인사말아이콘</span>
                                    </div>
                                    <h3>CEO GREETING</h3>
                                    <p>인사말<br>
                                        동화약품 대표 인사
                                    </p>
                                </a>
                            </div>
                        </li>
                        <li class="about_item02">
                            <div class="about_item_wrap">
                                <a href="sub_1.html">
                                    <div class="icon">
                                        <span class="blind">연혁아이콘</span>
                                    </div>
                                    <h3>HISTORY</h3>
                                    <p>연혁<br>
                                        동화약품 발자취
                                    </p>
                                </a>
                            </div>
                        </li>
                        <li class="about_item03">
                            <div class="about_item_wrap">
                                <a href="sub_1.html">
                                    <div class="icon">
                                        <span class="blind">홍보책자아이콘</span>
                                    </div>
                                    <h3>BROCHURE</h3>
                                    <p>홍보책자<br>
                                        동화약품 이야기
                                    </p>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <!--제품정보영역-->
        <section class="product">
            <div class="bxslider_pd_wrap">
                <div class="bxslider_pd">
                    <div class="product_wrap product01">
                        <div class="product_text">
                            <h2>
                                WHAL MYUNG SU
                            </h2>
                            <div class="explain">
                                <p>소화불량, 과식, 체함, 위부팽만감, 구역, 구토, 식욕감퇴(식욕부진)에 효과가 있으며, 10가지의 생약성분으로 이루어져 있으며 보존제가 첨가되어있지 않습니다.</p>
                            </div>
                            <a href="sub_2.html">VIEW MORE</a>
                        </div>
                        <div class="product_item">
                            <div class="product_item01"></div>
                        </div>
                    </div>
                    <div class="product_wrap product02">
                        <div class="product_text">
                            <h2>
                                ETALOP
                            </h2>
                            <div class="explain">
                                <p>주요 우울 장애, 광장 공포증을 수반하거나 수반하지 않는 공황 장애, 사회 불안 장애(사회공포증), 범불안 장애, 강박 장애 치료에 사용됩니다.</p>
                            </div>
                            <a href="sub_2.html">VIEW MORE</a>
                        </div>
                        <div class="product_item">
                            <div class="product_item01"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--연구개발영역-->
        <section class="research">
            <div class="center">
                <div class="research_wrap">
                    <div class="research_text" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="200">
                        <h2>
                            R&D<br>
                            DONGWHA
                        </h2>
                        <p>지금까지의 경험과 기술을 바탕으로 핵심역량을<p>
                        <p>극대화 할 수 있는 분야를 선택하여 연구력을 집중하고</p>
                        <p>부족한 부문은 산학연 공동연구나 아웃소싱을 통하여</p>
                        <p>연구생산성을 극대화 시켜나가고 있습니다.</p>
                    </div>
                    <ul class="research_item" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="400">
                        <li>
                            <a href="sub_3.html" class="research_item_text">
                                <p>혁신 신약개발 연구</p>
                            </a>
                        </li>
                        <li>
                            <a href="sub_3.html" class="research_item_text">
                                <p>개량신약 연구</p>
                            </a>
                        </li>
                        <li>
                            <a href="sub_3.html" class="research_item_text">
                                <p>기능성 소재 연구</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <!--홍보센터영역-->
        <section class="media">
            <div class="media_wrap">
                <div class="pr">
                    <div class="pr_text">
                        <h2 data-aos="fade-down" data-aos-duration="1000" data-aos-delay="300">PR CENTER</h2>
                        <P data-aos="fade-down" data-aos-duration="1000" data-aos-delay="400">좋은 약을 만들겠다는 바른 마음으로</P>
                        <P data-aos="fade-down" data-aos-duration="1000" data-aos-delay="500">동화정신을 꿈꾸는 동화약품</P>
                    </div>
                    <ul class="pr_item" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="300">
                        <li class="pr_item01">
                            <a href="sub_4.html">
                                <div class="pr_item_text">
                                    <h3>채용정보</h3>
                                    <p>균형과 조화를 통한 조직의 발전과 개인의 풍요로운 삶을 실현</p>
                                </div>
                            </a>
                        </li>
                        <li class="pr_item02">
                            <a href="sub_5.html">
                                <div class="pr_item_text">
                                    <h3>사회공헌</h3>
                                    <p>세상에 건강한 바람을 불러 일으키고자 하는 동화약품의 바람</p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="news">
                <div class="news_text media_wrap">
                    <h2 data-aos="fade-down" data-aos-duration="1000" data-aos-delay="400">NEWS</h2>
                    <p data-aos="fade-down" data-aos-duration="1000" data-aos-delay="500">동화약품의 새로운 소식을 안내드립니다.</p>
                </div>
                <div class="news_item_wrap" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="600">
                    <ul class="news_item">
                        <li class="news_item01">
                            <a href="sub_4.html" class="news_item01_text">
                                <h2>동화약품, 활명수 126주년 기념판 판매수익금 대한적십자사 기부</h2>
                                <p>우리회사가 대한적십자사 서울지사에서 지난해 판매된 활명수 126주년 기념판의 수익금을 ‘생명을 살리는 물 캠페인’ 기금으로 전달했다고 27일 밝혔다. 이날 전달식에는 동화약품 마케팅실 김대현 상무와 대한적십자사 권영규 서울지사 회장이 참석했다.</p>
                                <span>2024.03.28</span>
                            </a>
                        </li>
                        <li class="news_item01">
                            <a href="sub_1.html" class="news_item01_text">
                                <h2>동화약품, 향을 더한 다한증 치료제 ‘드라이언액’ 출시 … 땀 분비 억제 및 상쾌함을 한번에</h2>
                                <p>우리회사는 땀 분비 억제 효과는 물론 은은한 파우더리 머스크향을 첨가해 상쾌함까지 더한 다한증 치료제 ‘드라이언액’을 출시했다고 14일 밝혔다.</p>
                                <span>2024.03.14</span>
                            </a>
                        </li>
                        <li class="news_item01">
                            <a href="sub_4.html" class="news_item01_text">
                                <h2>동화약품 판콜에스, 2023년 감기약 시장 매출 1위 달성</h2>
                                <p>종합감기약 ‘판콜에스’가 2023년 감기약 시장 매출 1위를 달성했다고 28일 밝혔다.</p>
                                <span>2024.02.28</span>
                            </a>
                        </li>
                        <li class="news_item01">
                            <a href="sub_2.html" class="news_item01_text">
                                <h2>동화약품, 셀트리온 ‘알보칠·화이투벤’ 인수</h2>
                                <p>셀트리온의 일반의약품 4종을 인수한다고 18일 밝혔다. 인수 품목은 종합감기약 ‘화이투벤’, 비충혈제거제 ‘화이투벤 나잘스프레이’, 구내염 치료제 ‘알보칠’, 홍콩과 대만에서 판매하는 비타민D/칼슘 보조제 ‘칼시츄(Calcichew)’ 등이다.</p>
                                <span>2024.01.18</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <p>
                    <a href="#none" class="prevBtn_news" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="600"></a>
                    <a href="#none" class="nextBtn_news" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="600"></a>
                </p>
            </div>
        </section>
        <!--하단영역-->
     	<footer>
		<jsp:include page="../include/footer.jsp" />
        </footer>
    </body>
</html>