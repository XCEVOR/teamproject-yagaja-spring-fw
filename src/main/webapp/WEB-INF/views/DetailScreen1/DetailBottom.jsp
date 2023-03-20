<%@page import="java.util.List"%>
<%@page import="mul.cam.a.dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<%
List<BbsDto> uniqueHashtags=(List<BbsDto>)request.getAttribute("uniqueHashtags");
%>
<style type="text/css">

#hashtagBox{
display: flex;
flex-wrap: wrap;
}
.linkBox{
	margin-left: 50px;
}

</style>
<body>
	<div id="hashtagBox">
	    <%
	    for(int i=0;i<uniqueHashtags.size();i++){
	    	BbsDto dto=uniqueHashtags.get(i);
	    	%>
<span class="linkBox"><h2><a href="detail1.do?seq=<%=dto.getSeq() %>"><%= dto.getTitle() %></a></h2></span>
	    	
	    
	    	
	    	<%
	    }
	    
	    %>
	     
	
	</div>
</body>
</html>