<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
// db에 넣을 때 인코딩 꼭 해주기 
request.setCharacterEncoding("utf-8");

int seq = Integer.parseInt(request.getParameter("seq"));

String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");  

BbsDao dao = BbsDao.getInstance();

boolean isS = dao.answer(seq, new BbsDto(id, title, content));
if(isS){
	%>
	<script type="text/javascript">
		alert("답글입력 성공!");
		location.href = "bbslist.jsp";
	</script>
	<% 
}else{
	%>
	<script type="text/javascript">
		alert("답글입력 실패!");
		location.href = "bbslist.jsp";
	</script>
	<% 
}
%>


