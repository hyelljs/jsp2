<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSP 내장(implicit) 객체</h3>
	<ul>
		<li>스크립트릿 안에서만 사용하는 JSP 객체</li>
		<li>별도로 선언하지 않고 사용할 수 있다.</li>
		<li>서블릿을 처리하는 컨테이너(tomcat)가 제공하고  처리도 합니다.</li>
		<li>
			<ul>
				<li>request : HttpServletRequest, 브라우저에 전달하는 요청정보를 저장</li>
				<li>response : HttpServletResponse, 요청에 대한 응답을 저장</li>
				<li>out : JspWriter, JSP 페이지 출력 스트림 객체</li>
				<li>pageContext : PageContext, 요청을 처리하는 JSP 페이지 정보를 저장</li>
				<li>page : Ovject , 일반 자바객체(요청처리 웹서블릿 객체가 아닙니다.)</li>
				<li>config : ServletConfig, 웹에플리케이션 정보 저장</li>
				<li>Session : HttpSession, 웹서버와 브라우저 사이의 연결정보를 저장</li>
				<li>application : ServletContext, 웹애플리케이션의 context 정보를 저장</li>
			</ul>
		</li>
		
		<li>Attribute 를 저장 객체 : pageContext -> request -> session -> application
			(EL 사용할 때 화살표 방향으로 저장된 애트리뷰트 값을 찾습니다.)
		</li>
		<li>※ EL 에서 사용할 수 있는 객체는 jsp 내장객체와는 다릅니다.※</li>
		
	</ul>
	<%
		//현재 요청 처리하는 jsp 페이지의 Exception 객체를 pageContext.getExeption() 리턴받는다.
		//	--> Exception 발생시
	//	String message = pageContext.getException().getMessage();
	//	out.print(message);
		out.print(pageContext.getException());
	%>
</body>
</html>