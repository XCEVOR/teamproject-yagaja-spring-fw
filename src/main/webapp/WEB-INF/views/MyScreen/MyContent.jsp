<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/mainpage.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
<link rel="stylesheet" href="assets/css/layout.css" />
</head>
<%
	//세션에 저장된 로그인 값 가져오기
	MemberDto login = (MemberDto)session.getAttribute("login");
	if(login == null){
		System.out.println("확인");
		//response.sendRedirect("naver.com");
				%>
			<script type="text/javascript">
				alert('로그인해주세요');
				location.href="login.do";
			</script>
		<% 
		return;
	}
%>
<body>

    <h1>MY Page</h1>
	<div>
	<form action="mypageUpdAf.do" method="post" >
		<table>
			<tr>
				<td> ID </td>
				<td> <input type="text" value="<%=login.getId() %>" id="id" name="id" readonly="readonly"></td>
			</tr>
			<tr>
				<td> 별명 </td>
				<td> <input type="text" value="<%=login.getNickname() %>" id="nickname" name="nickname"></td>
			</tr>
<%-- 			<tr>
				<td> 이름 </td>
				<td> <input type="text" value="<%=mydate.getName() %>" id="name" name="name" readonly="readonly"></td>
			</tr> --%>
			
			<tr>
				<td> E-mail </td>
				<td> <input type="text" value="<%=login.getEmail() %>" id="email" name="email" readonly="readonly"></td>
			</tr>
			
			<tr>
				<td> MBTI </td>
				<td> <input type="text" value="<%=login.getMbti() %>" id="mbti" name="mbti"></td>
			</tr>			
		</table>
		<input type="submit" value="수정">
		</form>
		<br><br>
		<!-- <h2>작성글</h2> -->
		<table>
		<!-- 작성글 가져오기 bbslist에서 가져오기 -->
		</table>
	</div>
	</form>
</body>
</html>