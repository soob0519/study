<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>IR자료실 사업보고서</title>
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
                <h2>사업보고서</h2>
                <div class="intro_tit">
                    <h2>동화약품<br>
                        <span>정확</span>하고 <span>투명</span>한 경영정보
                    </h2>
                </div>
            </div>
            <div class="content01 sub_center">
                <div class="bb_sub">
                    <div class="bb_sub_tit">
                        <p>${boardvo.rdate }</p>
                        <h3>${boardvo.title }</h3>
                    </div>
                    <div class="bb_sub_download">
                        <a href="20240320084800_[동화약품]사업보고서(2024.03.19).pdf" target="_blank">
                            <span class="blind">첨부파일 다운로드</span>
                            <p>2023년 4분기 사업보고서</p>
                        </a>
                    </div>
<<<<<<< .mine
                    <div class="bb_sub_text">
                        ${boardvo.content }
||||||| .r20
=======
                    <div class="bb_sub_text">  
                       ${boardvo.content }
>>>>>>> .r34
                    </div>
                    <div class="bb_sub_list">
                        <a href="/boardList.do">목록</a>
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