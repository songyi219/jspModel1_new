<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int seq = Integer.parseInt(request.getParameter("seq"));
%>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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


BbsDao dao = BbsDao.getInstance();

dao.readcount(seq); // 카운트 증가. detail얻어오기전에 카운트를 증가해야 1이 증가된걸 확인가능
BbsDto dto = dao.getBbs(seq); 
%>   

<h1>상세 글보기</h1>

<div align="center">

<table border="1">
<colgroup>	<!--  property -->
	<col style="width: 200px"/>
	<col style="width: 200px"/>
</colgroup>

<tr>
	<th>작성자</th>
	<td><%=dto.getId() %></td>
</tr>

<tr>
	<th>제목</th>
	<td><%=dto.getTitle() %></td>
</tr>

<tr>
	<th>작성일</th>
	<td><%=dto.getWdate() %></td>
</tr>

<tr>
	<th>조회수</th>
	<td><%=dto.getReadcount() %></td>
</tr>

<tr>
	<th>답글정보</th>
	<td><%=dto.getRef() %>-<%=dto.getStep() %>-<%=dto.getDepth() %></td>	
</tr>

<tr>
	<th>내용</th>
	<td>	
		<textarea rows="15" cols="90"><%=dto.getContent() %></textarea>
	</td>
</tr>


</table>

<br>
<button type="button" onclick="answerBbs(<%=dto.getSeq() %>)">답글</button>

<button type="button" onclick="location.href='bbslist.jsp'">글목록</button>

<%
if(dto.getId().equals(login.getId())){
	%>
	<button type="button" onclick="updateBbs(<%=dto.getSeq() %>)">수정</button>

	<button type="button" onclick="deleteBbs(<%=dto.getSeq() %>)">삭제</button>
	<% 
}
%>



</div>

<script type="text/javascript">
function answerBbs( seq ) {
	location.href = "answer.jsp?seq=" + seq;
}
function updateBbs( seq ) {
	location.href = "bbsupdate.jsp?seq=" + seq;
}
// 게시판글은 delete가아니라 update
function deleteBbs( seq ) {
	location.href = "bbsdeleteAf.jsp?seq=" + seq; 	// update del=1
}
// readcount 증가


</script>


</body>
</html>

















