<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <h3>게시글 내용</h3>
    

<table class="table table-striped table-sm">
<colgroup>
	<col style="width: 150px"/>
	<col style="width: 500px"/>
</colgroup>

<tr>
	<th>작성자</th>
	<td>dto</td>
</tr>
<tr>
	<th>작성일</th>
	<td>dto</td>
</tr>
<tr>	
	<td align="center" colspan="2" style="font-size: 16px;font-weight: bold;" >내용</td>
</tr>
<tr>	
	<td colspan="2" height=200px style="background-color: white;" >
		<pre style="font-size: 20px;font-family: 고딕, arial;background-color: white">dto내용 </pre>
	</td>
</tr>
</table>

<a href="admin.do">수정</a>
	
<a href="admin.do">삭제</a>
 <a href="detail2.do">일정확인</a>
</body>
</html>