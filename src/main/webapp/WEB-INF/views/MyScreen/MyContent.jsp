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
<body>
    <h1>MY Page</h1>
	<div>
		<table>
			<tr>
				<td> ID </td>
				<td> <input type="text" value="없음" id="id" name="id" readonly="readonly"></td>
			</tr>
			<tr>
				<td> 별명 </td>
				<td> <input type="text" value="없음" id="nickname" name="nickname"></td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> <input type="text" value="없음" id="name" name="name" readonly="readonly"></td>
			</tr>
			
			<tr>
				<td> E-mail </td>
				<td> <input type="text" value="없음" id="email" name="email" readonly="readonly"></td>
			</tr>
			
			<tr>
				<td> MBTI </td>
				<td> <input type="text" value="없음" id="mbti" name="mbti"></td>
			</tr>			
		</table>
		<button>수정</button>
		<br><br>
		<h2>작성글</h2>
		<table>
		<!-- 작성글 가져오기 bbslist에서 가져오기 -->
		</table>
	</div>

</body>
</html>