<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%	// 로그인한 id session에서 불러오기
	MemberDto login = (MemberDto)session.getAttribute("login");
	if(login == null){
		%>
		<script>
		alert('로그인 해 주십시오');
		location.href = "login.jsp";
		</script>
		<%
	}	
%> 

<%

int seq = Integer.parseInt(request.getParameter("seq"));

BbsDao dao = BbsDao.getInstance();

boolean isS = dao.deleteBbs(seq);
// del이 1일 때.
if(isS){		
		%>
		<script>
		
		alert('삭제되었습니다');
		location.href = "bbslist.jsp";
		</script>
		<%
}else{		
	%>
	<script>		
		alert('삭제되지 않았습니다');
		let seq = <%=seq %>;
		location.href = "bbsdetail.jsp?seq=" + seq;
	</script>
<% 
}
%>
