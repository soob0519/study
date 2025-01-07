<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	header {
		width:100%;
		height:60px;
		padding-top:20px;
		background-color:aliceblue;
		font-size:20px;
		font-weight:bold;
		text-align:center;
		position:fixed;
	}
	body > header > div > input[type=text] {
	    border-radius: 20px;
	    padding-left: 20px;
	    font-size:20px;
	}
	body > header > div > button {
    	border-radius: 20px;
	}
</style>

<body>
	 	<div>
			<input type="text" style="width:500px; height:40px;">
			<button type="button" style="height:40px;">검색</button>
		</div>
</body>
</html>