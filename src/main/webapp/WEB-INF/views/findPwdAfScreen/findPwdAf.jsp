<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="mul.cam.a.dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<meta charset="UTF-8">
<title>findPwdAf</title>
</head>
<body>

<%

MemberDto findPwd = (MemberDto)request.getAttribute("findPwd");
if(findPwd == null){
	%>
    <div align="center">
    <h3>입력하신 Id 및 phonenumber와 일치하는 계정이 없습니다.</h3>
    <br>

    <button type="button" onclick="find()">비밀번호 찾기로 돌아가기</button>
    </div>
    <script type="text/javascript">
    function find() {
        location.href = "findPwd.do";
    }
    </script>
    <%
   
}else{
 
	    %>
	    <div align="center">
	    <h3><%=findPwd.getId() %>님의 비밀번호는 <%=findPwd.getPwd() %>입니다.</h3>
	    <br>

	    <button type="button" onclick="login()">로그인 화면으로 돌아가기</button>
	    </div>
	    <script type="text/javascript">
	    function login() {
	        location.href = "login.do";
	    }
	    </script>
	    <%
}
%>


</body>
</html>