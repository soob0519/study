<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
 
 <link rel="stylesheet" href="../css/style.css" />
 
 </head>
 
 <style>
 
.div_table1 {
	position:relative;
	left:30px;
	width:800px;
	height:100%;
}
 
 
 </style>
 
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
  <%@ include file="../include/aside.jsp" %>
  </aside>
  
 <section>
 
 <div class="div_table1"> 

  <table border="0" width="800">
	<tr>
		<td align="center" style="border:0px;"><h1>이&nbsp;&nbsp;&nbsp;력&nbsp;&nbsp;&nbsp;서</h1></td>
	</tr>
  </table>
  
  <table width="800"  border="1">
	<tr>
		<td border="1">
  <table width="200" align="right" cellpadding="5" style="border:1px">
	<tr>
		<th width="100" align="center" bgcolor="#fff0f8"><font size="2">희망연봉</font></th>
		<td width="100" align="right"><font size="2"><b>만원</b></font></td>		
	</tr>
  </table>
		 </td>
	</tr>
  </table>
  
  <!-- 1. 인적사항 -->
  <table width="800" cellpadding="5" border="1">
	<tr>
		<td style="border:0px;"><font size="3"><b>1. 인적사항</b></font></td>
	</tr>
  </table>
  
  <table width="800" cellpadding="5" border="1">
   <colgroup>
   <col width="20%"/>
   <col width="15%"/>
   <col width="25%"/>
   <col width="15%"/>
   <col width="25%"/>
   </colgroup>
	<tr>
		<td rowspan="5" align="center"><font size="2">(사&nbsp;&nbsp;진)</font></td>
		<th bgcolor="#fff0f8"><font size="2">성&nbsp;&nbsp;&nbsp;명</font></th>
		<th colspan="3"></th>
	</tr>
	<tr>
		<th bgcolor="#fff0f8"><font size="2">주민등록번호</font></th>
		<th colspan="3"></th>
	</tr>
	<tr>
		<th bgcolor="#fff0f8"><font size="2">전자우편</font></th>
		<th colspan="3"></th>
	</tr>
	<tr>
		<th bgcolor="#fff0f8"><font size="2">전화번호</font></th>
		<th></th>
		<th bgcolor="#fff0f8"><font size="2">휴&nbsp;대&nbsp;폰</font></th>
		<th></th>
	</tr>
	<tr>
		<th bgcolor="#fff0f8"><font size="2">주&nbsp;&nbsp;&nbsp;소</font></th>
		<th colspan="3"></th>
	</tr>
	<tr>
		<th bgcolor="#fff0f8"><font size="2">호적관계</font></th>
		<th bgcolor="#fff0f8"><font size="2">호주성명</font></th>
		<th></th>
		<th bgcolor="#fff0f8"><font size="2">호주와의 관계</font></th>
		<th></th>
	</tr>
  </table>
  
  <!-- 2.학력사항 -->
  <table width="800" cellpadding="5" border="1">
	<tr>
		<td style="border:0px;"><font size="3"><b>2. 학력사항</b></font></td>
	</tr>
  </table>
  
  <table width="800" cellpadding="5" border="1">
  <colgroup>
	<col width="25%"/>
	<col width="*%"/>
	<col width="35%"/>
  </colgroup>
	<tr>
		<th bgcolor="#fff0f8"><font size="2">기&nbsp;&nbsp;&nbsp;간</font></th>
		<th bgcolor="#fff0f8"><font size="2">학&nbsp;교&nbsp;명</font></th>
		<th bgcolor="#fff0f8"><font size="2">전공(학과)</font></th>
	</tr>
	<tr>
		<td align="center">-</td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td align="center">-</td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td align="center">-</td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td align="center">-</td>
		<td></td>
		<td></td>
	</tr>
  </table>
  
  <!-- 3. 경력사항 -->
  <table width="800" cellpadding="5" border="1">
	<tr>
		<td style="border:0px;"><font size="3"><b>3. 경력사항</b></font></td>
	</tr>
  </table>
  <table width="800" cellpadding="5" border="1">
  <colgroup>
	<col width="25%"/>
	<col width="37%"/>
	<col width="25%"/>
	<col width="15%"/>
  </colgroup>
	<tr>
		<th bgcolor="#fff0f8"><font size="2">기&nbsp;&nbsp;&nbsp;간</font></th>
		<th bgcolor="#fff0f8"><font size="2">회&nbsp;사&nbsp;명</font></th>
		<th bgcolor="#fff0f8"><font size="2">부서</font></th>
		<th bgcolor="#fff0f8"><font size="2">직위</font></th>
	</tr>
	<tr>
		<td align="center">-</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td align="center">-</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td align="center">-</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td align="center">-</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td align="center">-</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
  </table>
  
  <!-- 4. 어학능력 -->
  <table width="800" cellpadding="5" border="1">
	<tr>
		<td style="border:0px;"><font size="3"><b>4. 어학능력</b></font></td>
	</tr>
  </table>
  <table width="800" cellpadding="5" border="1">
  <colgroup>
	<col width="15%"/>
	<col width="15%"/>
	<col width="25%"/>
	<col width="20%"/>
	<col width="25%"/>
  </colgroup>
	<tr>
		<th rowspan="2" bgcolor="#fff0f8">어&nbsp;학</th>
		<td bgcolor="#fff0f8"><b>&nbsp;&nbsp;TOEIC</b></td>
		<td align="right">점&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td bgcolor="#fff0f8" align="center"><b>&nbsp;&nbsp;일본어</b></td>
		<td align="right">급&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td bgcolor="#fff0f8"><b>&nbsp;&nbsp;TOEFL</b></td>
		<td align="right">점&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td bgcolor="#fff0f8" align="center"><b>&nbsp;&nbsp;중국어</b></td>
		<td align="right">급&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
  </table>
  
  </div>
  
  </section>
  
  <footer>
  	<!-- footer S -->
	<%@ include file="../include/footer.jsp" %>
	<!-- footer E -->
  </footer> 
  
 </body>
</html>
