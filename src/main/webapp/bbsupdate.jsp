<%@page import="dto.MemberDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
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
// seq를 같이 보내줬기 때문에 받아오기 bbsdetail에서 
int seq = Integer.parseInt(request.getParameter("seq"));

// 싱클턴 접근 
BbsDao dao = BbsDao.getInstance();
BbsDto dto = dao.getBbs(seq);	// 데이터 가져오기


%>   


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h2>글수정</h2>

<div align="center">

<form action="bbsupdateAf.jsp" id="frm" method="post">
<input type="hidden" name="seq" value="<%=seq %>">  <!-- hidden으로 seq값 같이 넘겨주기 보여질 필요가 없기때문 -->
<table border="1">
<col width="200"><col width="500">

<tr>
	<th>아이디</th>
	<td>			
		<%=login.getId() %>
		<%-- <input type="hidden" name="id" value="<%=login.getId() %>">	 --%>	
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" id="title" name="title" size="50px" value="<%=dto.getTitle() %>">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50px" id="content" name="content" ><%=dto.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="글쓰기 수정완료">		
	</td>
</tr>

</table>
</form>
</div>


</body>
</html>