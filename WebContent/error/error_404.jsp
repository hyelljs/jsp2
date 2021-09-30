<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a{
	display: inline-block;
	text-decoration:none;
	width:130px;
    height: 44px;
   	/*line-height:42px;*/
   	padding:11px 15px;
    text-align: center;
    vertical-align: top;
    box-sizing: border-box;
    cursor: pointer;
    font-size: 14px;
    font-weight:bold;
    border: 1px solid #B1B1B1;
    background: #FFFFFF;
    color: #777777;}
</style>
</head>
<body>
<div style="width:50%; margin:auto; padding-top: 30px; text-align:center;">
	<div style="text-align:center;">
		<img src="../img/icon_error.png" alt="404status">
	</div>
	<h3>요청하신 페이지를 <span style="color:red;">찾을 수 없습니다.<span></span></h3>
	<a href="${pageContext.request.contextPath }">HOME</a>
	<a href="javascript:history.back()">뒤로가기</a>
	<!-- 상대경로 : 현재 위치를 기준으로 ../ 또는 ./ 또는 경로명/
		  절대경로 : 이 애플리케이션의 context 기준으로 합니다.
	 -->
</div>
	
</body>
</html>