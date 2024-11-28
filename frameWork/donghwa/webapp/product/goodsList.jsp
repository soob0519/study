<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>제품정보</title>
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
                        <a href="/"><span class="blind">home</span></a>
                    </li>
                    <li>
                        <a href="/goodsList.do">제품정보</a>
                    </li>
                    <li>
                        <a href="/goodsList.do">제품 검색</a>
                    </li>
                </ul>
                <div class="intro_tit">
                    <h2><span>철저한 품질 관리</span>를 통해<br>
                        신뢰받는 <span>의약품</span>을 생산합니다.
                    </h2>
                </div>
                <ul class="tab_menu">
                    <li>
                       <a href="sub_2.html" class="on">제품 검색</a>
                    </li>
                    <li>
                        <a href="sub_2.html">신제품</a> 
                    </li>
                    <li>
                    <a href="sub_2.html">전문의약품</a> 
                    </li>
                    <li>
                    <a href="sub_2.html">일반의약품</a> 
                    </li>
                    <li>
                    <a href="sub_2.html">건강기능식품</a> 
                    </li>
                </ul>
            </div>
            <div class="content">
                <div class="content_tit">
                    <h2 data-aos="fade-down" data-aos-duration="1000" data-aos-delay="300"><span>동화약품의 다양한 제품</span>을</h2>
                    <h2 data-aos="fade-down" data-aos-duration="1000" data-aos-delay="400">한눈에 확인하실 수 있습니다.</h2>
                    <p data-aos="fade-down" data-aos-duration="1000" data-aos-delay="500">동화는 건강하고 행복한 삶을 추구하려 노력합니다.</p>
                </div>
                <div class="sub02_item">
                    <div class="sub_center">
                        <div class="item_wrap">
                            <div class="search">
                                <div class="search_inner">
                                    <form data-aos="fade-down" data-aos-duration="1000" data-aos-delay="300">
                                        <div class="form_inner">
                                            <input type="text" placeholder="제품명, 성분명 등을 입력해주세요.">
                                            <button type="submit"></button>
                                        </div>
                                    </form>
                                </div>
                                <div class="keyword">
                                    <ul class="key_list">
                                        <li class="key_abc" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="300">
                                            <p>초성 검색</p>
                                            <ul class="fix_flexbetween">
                                                <li>
                                                    <a href="#none">ㄱ</a>
                                                </li>
                                                <li>
                                                    <a href="#none">ㄴ</a>
                                                </li>
                                                <li>
                                                    <a href="#none">ㄷ</a>
                                                </li>
                                                <li>
                                                    <a href="#none">ㄹ</a>
                                                </li>
                                                <li>
                                                    <a href="#none">ㅁ</a>
                                                </li>
                                                <li>
                                                    <a href="#none">ㅂ</a>
                                                </li>
                                                <li>
                                                    <a href="#none">ㅅ</a>
                                                </li>
                                                <li>
                                                    <a href="#none">ㅇ</a>
                                                </li>
                                                <li>
                                                    <a href="#none">ㅈ</a>
                                                </li>
                                                <li>
                                                    <a href="#none">ㅊ</a>
                                                </li>
                                                <li>
                                                    <a href="#none">ㅋ</a>
                                                </li>
                                                <li>
                                                    <a href="#none">ㅌ</a>
                                                </li>
                                                <li>
                                                    <a href="#none">ㅍ</a>
                                                </li>
                                                <li>
                                                    <a href="#none">ㅎ</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="key_item" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="400">
                                            <p>제제별검색</p>
                                            <ul>
                                                <li>
                                                    <a href="#none">신제품</a>
                                                </li>
                                                <li>
                                                    <a href="#none">전문의약품</a>
                                                </li>
                                                <li>
                                                    <a href="#none">일반의약품</a>
                                                </li>
                                                <li>
                                                    <a href="#none">건강기능식품</a>
                                                </li>
                                                <li>
                                                    <a href="#none"></a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product_list" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="300">
                                <div class="product_line"><span class="blind">구분선</span></div>
                                <div class="pro_wrap">
                                    <p class="pro_count">전체 <span>388개</span> 제품이 있습니다.</p>
                                    <ul class="pro_item fix_flexbetween">
                                        <li>
                                            <a href="#none"><img src="images/sub02/product_img01.png" alt="후시딘"></a>
                                            <div class="pro_item_text">
                                                <p>신제품</p>
                                                <h3>후시딘 Fucidin</h3>
                                            </div>
                                        </li>
                                        <li>
                                            <a href="#none"><img src="images/sub02/product_img02.png" alt="잇치가글액"></a>
                                            <div class="pro_item_text">
                                                <p>일반의약품</p>
                                                <h3>잇치가글액 EACH Gargle</h3>
                                            </div>
                                        </li>
                                        <li>
                                            <a href="#none"><img src="images/sub02/product_img03.png" alt="메녹틸"></a>
                                            <div class="pro_item_text">
                                                <p>전문의약품</p>
                                                <h3>메녹틸 MENOCTYL tablets</h3>
                                            </div>
                                        </li>
                                        <li>
                                            <a href="#none"><img src="images/sub02/product_img04.png" alt="활명수"></a>
                                            <div class="pro_item_text">
                                                <p>일반의약품</p>
                                                <h3>활명수 WHAL MYUNG SU</h3>
                                            </div>
                                        </li>
                                        <li>
                                            <a href="#none"><img src="images/sub02/product_img05.png" alt="터치메드"></a>
                                            <div class="pro_item_text">
                                                <p>신제품</p>
                                                <h3>터치메드 연고 Touch-med ointment</h3>
                                            </div>
                                        </li>
                                        <li>
                                            <a href="#none"><img src="images/sub02/product_img06.png" alt="판콜"></a>
                                            <div class="pro_item_text">
                                                <p>일반의약품</p>
                                                <h3>판콜 PANCOLD</h3>
                                            </div>
                                        </li>
                                    </ul>
                                    <ul class="pro_btn">
                                        <li><a href="#none"><span class="blind">처음으로</span></a></li>
                                        <li><a href="#none"><span class="blind">이전버튼</span></a></li>
                                        <li><a href="#none">1</a></li>
                                        <li><a href="#none">2</a></li>
                                        <li><a href="#none">3</a></li>
                                        <li><a href="#none">4</a></li>
                                        <li><a href="#none">5</a></li>
                                        <li><a href="#none"><span class="blind">다음버튼</span></a></li>
                                        <li><a href="#none"><span class="blind">맨끝으로</span></a></li>
                                    </ul>
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