<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>IR자료실</title>
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
                        <a href="/boardList.do">IR자료실</a>
                    </li>
                    <li>
                        <a href="/boardList.do">사업보고서</a>
                    </li>
                </ul>
                <div class="intro_tit">
                    <h2>동화약품<br>
                        <span>정확</span>하고 <span>투명</span>한 경영정보
                    </h2>
                </div>
                <ul class="tab_menu">
                    <li>
                       <a href="/boardList.do">공시</a>
                    </li>
                    <li>
                        <a href="/boardList.do" class="on">사업보고서</a> 
                    </li>
                    <li>
                    <a href="/boardList.do">전자공고</a> 
                    </li>
                </ul>
            </div>
            <div class="content">
                <div class="content_tit">
                    <h2 data-aos="fade-down" data-aos-duration="1000" data-aos-delay="300">동화약품의 <span>주주분들께</span></h2>
                    <h2 data-aos="fade-down" data-aos-duration="1000" data-aos-delay="400"><span>명확한 회사 정보</span>를 제공합니다.</h2>
                    <p data-aos="fade-down" data-aos-duration="1000" data-aos-delay="500">앞으로도 투명하고 깨끗한 경영을 실천해나가겠습니다.</p>
                </div>
                <div class="sub04_item">
                    <div class="sub_center">
                        <div class="item_wrap">
                            <div class="search">
                                <div class="search_inner">
                                    <form name="searchForm" method="post" action="/boardList.do" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="300">
                                        <div class="form_inner">
                                            <input type="text" name="searchKeyword" placeholder="검색어를 입력해주세요.">
                                            <button type="submit"></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="bb" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="400">
                                <div class="bb_top fix_flexbetween">
                                    <div class="bb_cate">
                                        <a href="#none">전체</a>
                                        <a href="#none">2010년대</a>
                                        <a href="#none">2020년대</a>
                                    </div>
                                    <p>전체 ${total }개</p>
                                </div>
                                <ul class="bb_list">
                                    <li class="bb_tit">
                                        <h3>순번</h3>
                                        <h3>제목</h3>
                                        <h3>등록일</h3>
                                        <h3>첨부</h3>
                                    </li>
                                    
                                    <c:forEach var="lst" items="${boardlist }">									
	                                    <li class="bb_contents">
	                                        <h4>${recordCountPerPage }</h4>
	                                        <h4><a href="/boardDetail.do?unq=${lst.UNQ }">${lst.TITLE }</a></h4>
	                                        <h4>${lst.RDATE }</h4>
	                                        <p><a href="20240320084800_[동화약품]사업보고서(2024.03.19).pdf" target="_blank"><span class="blind">첨부파일 다운로드</span></a></p>
	                                    </li>
	                                    <c:set var="recordCountPerPage" value="${recordCountPerPage-1 }" />
                                    </c:forEach>
                                    
                                </ul>
                                <ul class="pro_btn">
                                    <li><a href="#none"><span class="blind">처음으로</span></a></li>
                                    <li><a href="#none"><span class="blind">이전버튼</span></a></li>
                                <c:forEach var="p" begin="1" end="${totalpage}">
                                    	<li><a href="/boardList.do?pageIndex=${p}">${p}</a></li>
                                </c:forEach>
                                    <li><a href="#none"><span class="blind">다음버튼</span></a></li>
                                    <li><a href="#none"><span class="blind">맨끝으로</span></a></li>
                                </ul>
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