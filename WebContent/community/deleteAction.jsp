<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.FreeboardDao"%>
<%@page import="dto.Freeboard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	String password = request.getParameter("password");
	FreeboardDao dao = FreeboardDao.getInstance();
	Map<String,Object> map = new HashMap<>();
	map.put("idx", idx);
	map.put("password", password);
	int n = dao.delete(map);	//주요 실행 메소드
//	out.print(n);
	out.print("<script>");
	String message=null;
	String href=null;
	if (n==1){	//정상 delete 실행
		message = "글삭제가 되었습니다.";
		href="listAction.jsp";
	}else{	//n=0 : password가 틀릴때
		message = "글 비밀번호가 틀립니다.";
		href="detailAction.jsp?page=1&idx="+idx;
	}
	out.print("alert('"+message+"');");
	out.print("location.href='"+href+"';");
	out.print("</script>");
%>

<%-- out.print("<script>");	
	out.print("alert('고객 idx "+idx+" 삭제되었습니다. ');");	
	out.print("location.href='listAction.jsp'");	
	out.print("</script>"); --%>