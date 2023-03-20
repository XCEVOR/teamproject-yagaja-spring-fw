<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	//MemberDto mydate = (MemberDto)request.getAttribute("user");
%>
<meta charset="UTF-8">
<title>Qna작성</title>
</head>
<body>
    <h1>QNA 작성</h1>
	<br>
	<div align="center">
	<form action="qnawriteAf.do" method="post">
	<input type="hidden" id="id" name="id" value="<%=login.getId() %>">
	<table>
		<tr>
			<td>별명</td>
			<td><input type="text" id="nickname" name="nickname" value="<%=login.getNickname() %>" readonly="readonly"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" id="title" name="title" ></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="5" cols="20" id="content" name="content"></textarea></td>
		</tr>
	</table>
	<div class="col-6 col-12-small">
		<input type="checkbox" id="secret" name="secret" onchange="chk(this);" >
		<label for="secret">비밀글</label>
	</div>
	<input type="submit" value="작성">
	</form>
	<button onclick="location.href='qna.do';">목록</button>
	</div>
	<script>
	function chk(obj){
		var checked = obj.checked;
		if(checked){
			obj.value=1;
		}
		else{
			obj.value=0;
		}
		console.log(obj.value);
	}
	</script>
</body>
</html>