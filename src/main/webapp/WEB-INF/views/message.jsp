<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%


	String bbsupdate = (String)request.getAttribute("bbsupdate");
	if(bbsupdate != null && !bbsupdate.equals("")){
		if(bbsupdate.equals("BBS_UPDATE_SUCCESS")){
			%>
			<script type="text/javascript">
			alert("성공적으로 수정되었습니다");
			location.href = "main.do";
			</script>
			<%
		}
		else{		
			%>
			<script type="text/javascript">
			alert("다시 작성해 주십시오");		
			location.href = "main.do";
			</script>
			<%
		}	
	}


%>

</body>
</html>