<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	int seq = Integer.parseInt(request.getParameter("seq"));
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BbsDao dao = BbsDao.getInstance();

	boolean isS = dao.updateBbs(seq, title, content);
	if(isS){
		%>
		<script type="text/javascript">
		alert("글쓰기 수정 성공!");
		location.href = "bbslist.jsp";
		</script>
		<%
	}else{	
		%>
		<script type="text/javascript">
		let seq = <%=seq %>;	// 자바에있는 seq값 가져오기
		alert("글쓰기 수정 실패!");
		location.href = "bbsupdate.jsp?seq=" + seq;
		</script>
		<%
	}
%>




