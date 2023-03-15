<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <h3>댓글작성</h3>
    
    <table >
<col width="200"><col width="500"><col width="100">

<tr>
	<th>댓글쓰기</th>
	<td>
		<input type="text" name="content" size="50"  >
	</td>
	<td colspan="2" align="center">
		<input type="submit" value="작성완료">
	</td>
</tr>

</table>

	<h3>댓글리스트</h3>
	
<table border="1">
<col width="50"><col width="500"><col width="100">
<tr >
	<th>번호</th><th>아이디</th><th>내용</th>
</tr>

	<tr>					
		<td>dto.seq</td>
		<td>dto.id</td>
		<td>dto.content</td>
	</tr>	
	<tr>					
		<td>dto.seq</td>
		<td>dto.id</td>
		<td>dto.content</td>
	</tr>	

</table>



<!-- 댓글 검색 -->
<table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px">
	<tr>
		<td style="padding-left: 5px">
			<select class="custom-select" id="choice" name="choice">
				<option selected>검색</option>
				<option value="content">내용</option>
				<option value="writer">아이디</option>
			</select>
		</td>
		<td style="padding-left: 5px" class="align-middle">
			<input type="text" class="form-control" id="search" name="search" onkeyup="enterKeyEvent()" placeholder="검색어" >
		<td style="padding-left: 5px">
			<span>
				<button type="button" class="btn btn-primary" onclick="searchBtn()">검색</button>
			</span>
		</td>
	</tr>
</table>

</body>
</html>