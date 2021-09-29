<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>day7 글쓰기</title>
<script type="text/javascript">
function post_data() {
	/* 유효성 검사 */
	frm1.submit();
}
</script>
<link rel="stylesheet" href="../css/freeboard.css">
</head>
<body>
<h3>동아리 커뮤니티</h3>
<hr>
<form name="frm1" method="post" action="insertAction.jsp">
<%-- <input type="hidden" name="ip" value="${request.remoteAddr}"> --%>
 <table>
 	<tr><td width="25%" >제목</td>
 		<td><input type="text" name="subject" required></td>
 	</tr>
 	<tr><td>작성자</td>
 		<td><input type="text" name="name"  required></td>
 	</tr>
 	
 	<tr><td>글 비밀번호</td>
 		<td><input type="password" name="password" required></td>
 	</tr>
 	<tr><td>내용</td>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td><textarea  rows="20" cols="80" name="content" required></textarea></td>
 		<!-- textarea는 multi line 입력이 욉니다. -->
 	</tr>
 	<tr><td colspan="2" align="center">
 	<input type="submit" value="저장" class="btn" >
 	<input type="reset"  value="다시쓰기" class="btn">
 	<input type="button" value="목록" onclick="location.href='listAction.jsp'" class="btn">
 	</td></tr>
 </table>
 </form>
</body>
</html>