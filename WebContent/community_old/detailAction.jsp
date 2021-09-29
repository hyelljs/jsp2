<%@page import="java.sql.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Freeboard"%>
<%@page import="java.util.List"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
 	
 	int idx = Integer.parseInt(request.getParameter("idx"));
 	int pageNo = Integer.parseInt(request.getParameter("page"));
 	
	FreeboardDao dao = FreeboardDao.getInstance();
 	Freeboard bean = dao.getOne(idx);
	
	request.setAttribute("bean", bean);
	pageContext.forward("detailView.jsp");
	
%>