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
String message = (String)request.getAttribute("message");
if(message != null && !message.equals("")){
	if(message.equals("MEMBER_ADD_YES")){
		%>
		<script type="text/javascript">
		
		alert("성공적으로 가입되었습니다");
		location.href = "login.do";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("가입되지 않았습니다 다시 가입해 주십시오");
		location.href = "regi.do";
		</script>
		<%		
	}
}

String login = (String)request.getAttribute("login");
if(login != null && !login.equals("")){
	if(login.equals("LOGIN_OK")){
		%>
		<script type="text/javascript">
		alert("로그인되었습니다");
		location.href = "main.do";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("아이디나 패스워드를 확인해 주십시오");
		location.href = "login.do";
		</script>
		<%
	}	
}

//내정보 수정
String memberUpdate = (String)request.getAttribute("memupdate");
if(memberUpdate != null && !memberUpdate.equals("")){
	if(memberUpdate.equals("mem_update_success")){
		String id = (String)request.getAttribute("id");
		System.out.println(id);
		%>
		<script type="text/javascript">
		alert("성공적으로 수정되었습니다");
		//location.href = "my.do?id=abc";
		location.href = "my.do?id=<%=id%>";
		</script>
		<%
	}
	else{		
		%>
		<script type="text/javascript">	
		alert("다시 작성해 주십시오");		
		location.href = "my.do?id="+id;
		</script>
		<%
	}	
}

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

	//Qna작성글
	String qnawrite = (String)request.getAttribute("writemsg");
	if(qnawrite != null && !qnawrite.equals("")){
		if(qnawrite.equals("qna_write_yes")){
			String id = (String)request.getAttribute("id");
			System.out.println(id);
			%>
			<script type="text/javascript">
			alert("Qna 작성했습니다.");
			//location.href = "my.do?id=abc";
			location.href = "qna.do";
			</script>
			<%
		}
		else{		
			%>
			<script type="text/javascript">	
			alert("다시 작성해 주십시오");		
			location.href = "qna.do";
			</script>
			<%
		}	
	}
	
	//Qna 답글
	String qnaupdwrite = (String)request.getAttribute("qnaupdwrite");
	if(qnaupdwrite != null && !qnaupdwrite.equals("")){
		if(qnaupdwrite.equals("Qns_Answer_OK")){
			%>
			<script type="text/javascript">
			alert("답글을 작성하었습니다.");
			location.href = "qna.do";
			</script>		
			<% 
		}else{
			%>
			<script type="text/javascript">
			alert("실패.");
			location.href = "qna.do";
			</script>		
		<% 
		}
	}
%>

</body>
</html>