<%@page import="dao.FreeboardDao"%>
<%@page import="dto.Freeboard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
	
	 FreeboardDao dao = FreeboardDao.getInstance();
 	
 	int idx = Integer.parseInt(request.getParameter("idx"));
 	Freeboard bean = dao.getOne(idx);
	request.setAttribute("bean",bean);
 	pageContext.forward("updateView.jsp");
 
 %>