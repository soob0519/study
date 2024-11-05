<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>main</title>
  <!-- ".." 상위 폴더란 의미 -->
  <link rel="stylesheet" href="../css/style.css" />
 
 </head>
 
 <body>
  
  <header>
  	<!-- header S -->
	<%@ include file="../include/header.jsp" %>
	<!-- header E -->
  </header>
  
  <nav>
	<!-- top menu S -->
	<%@ include file="../include/topMenu.jsp" %>
	<!-- top menu E -->
  </nav>
  
  <aside>
  aside영역
  </aside>
  
  <section>
  section영역
  </section>
  
  <footer>
  	<!-- footer S -->
	<%@ include file="../include/footer.jsp" %>
	<!-- footer E -->
  </footer>  
  
 </body>
</html>
