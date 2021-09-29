<%@page import="java.sql.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Freeboard"%>
<%@page import="java.util.List"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
request.setCharacterEncoding("UTF-8");
int idx = Integer.parseInt(request.getParameter("idx"));
String subject = request.getParameter("suject");
String content = request.getParameter("content");

Freeboard fre = new Freeboard();
fre.setSubject(subject);
fre.setContent(content);
fre.setIdx(idx);
FreeboardDao dao = FreeboardDao.getInstance();
dao.update(fre);

//response.sendRedirect("list.jsp");		//고객정보 수정을 완료하고 돌아갈 url
response.sendRedirect("update.jsp?idx="+idx);
//예, http://localhost:8082/jsp1/member/update.jsp?idx=8
	
%>