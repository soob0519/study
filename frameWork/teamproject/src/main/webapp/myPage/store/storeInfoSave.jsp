<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file = "../../include/oracleCon.jsp" %>
<%
// 세션검사(로그인 상태인지 체크하는 코드)
// 세션타입이라서 문자타입으로 만들어야한다. (스트링 괄호붙이거나, 뒤에 공백 붙여서 문자타입으로 만들기.)
String SessionUserid = (String)session.getAttribute("SessionUserid");		// 로그인 하지 않으면 null 값이 된다.
// 또는 String SessionUserid = session.getAttribute("SESSION_ID")+"";
%>
<%
String storename = request.getParameter("storename");
String stcontent = request.getParameter("stcontent");
String way = request.getParameter("way");
String operatinghour = request.getParameter("operatinghour");
String tel = request.getParameter("tel");
String dayoff = request.getParameter("dayoff");
String information = request.getParameter("information");

// 앞뒤 공백 제거
storename = storename.trim();
stcontent = stcontent.trim();
way = way.trim();
operatinghour = operatinghour.trim();
tel = tel.trim();
dayoff = dayoff.trim();
information = information.trim();

// 사용자가 전화번호에 기호 입력 시, 제거하기 위한 전처리 작업.(전화번호 타입을 String 으로 변경해서, int 타입으로 입력은 불필요.)
String tel2 = tel.replaceAll("-","");
// System.out.println(tel2);
// int tel3 = Integer.parseInt(tel2);

%>


<!-- UPDATE SQL 작성 및 적용(암호값 일치여부 확인하기 위해 pass 조건 추가) -->
<%
String sql2 = "select count(*) from storeinfo where STID='"+SessionUserid+"' ";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt(1);
if(cnt == 1){

String sql = " UPDATE storeinfo SET STORENAME		 = '"+storename+	"' "
								+" ,STCONTENT		 = '"+stcontent+	"' "
								+" ,WAY 			 = '"+way+			"' "
								+" ,OPERATINGHOUR	 = '"+operatinghour+"' "
								+" ,TEL 			 = '"+tel2+			"' "
								+" ,DAYOFF 			 = '"+dayoff+		"' "
								+" ,INFORMATION 	 = '"+information+	"' "
								+" WHERE STID = '"+SessionUserid+"' ";
	int result = stmt.executeUpdate(sql);
	if(result == 1) {
	%>
		<script>
			alert("업데이트 성공!");
			location="storeInfo.jsp";
		</script>
	<%	
	} else {
	%>	
		<script>
			alert("업데이트 실패!");
			history.back();
		</script>
	<%
		return;
	}
} else {
	String sql = " INSERT INTO STOREINFO ( STID "
			   +"						 ,STORENAME "
			   +"						 ,STCONTENT "
			   +"						 ,WAY "
			   +"						 ,OPERATINGHOUR "
			   +"						 ,TEL "
			   +"						 ,DAYOFF "
			   +"						 ,INFORMATION ) "									
			   +" VALUES('"+SessionUserid+"' " 
			   +" 		,'"+storename+"' " 
			   +" 		,'"+stcontent+"' " 
			   +" 		,'"+way+"' " 
			   +" 		,'"+operatinghour+"' " 								
			   +" 		,'"+tel2+"' " 								
			   +" 		,'"+dayoff+"' " 								
			   +" 		,'"+information+"') ";
	int result = stmt.executeUpdate(sql);
	if(result == 1) {
	%>
		<script>
			alert("입력 성공!");
			location="storeInfo.jsp";
		</script>
	<%	
	} else {
	%>	
		<script>
			alert("입력 실패!");
			history.back();
		</script>
	<%
		return;
	}
}
	%>
	