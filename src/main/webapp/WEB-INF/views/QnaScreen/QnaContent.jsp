<%@page import="mul.cam.a.dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	List<QnaDto> list = (List<QnaDto>)request.getAttribute("qnalist");
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
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<body>
    <h1>QNA CONTENT</h1>
	<br>
	<div align="left">
	<table border="1" >
		<thead>		
		</thead>

		<tbody >
			<%
			if(list == null || list.size() == 0){
			%>
			<tr>
				<td colspan="4">작성된 질문이 없습니다.</td>
			</tr>
			<%
			}else{
			for(int i =0; i < list.size(); i++){
				QnaDto dto = list.get(i);
			 %>
			 <tr>
			 	<td>
				 <div>
				 	<% 
				 		if(dto.getStep()!=0){		 		
				 	%>
				 	<div style="float: left;">
				 		<img alt="" src="./images/arrow.png" style="height: 50px">
				 	</div>
				 	<div style="float: left;">
				 		<em style="background-color: green; color: white;"> 
				 		대답
				 		</em>&nbsp;&nbsp;
				 	<%
				 		}else{
				 	%>
				 	<div style="float: left;">
				 		<em style="background-color: blue; color: white;">질문</em>&nbsp;&nbsp;	
				 	<%
				 		}
				 	%>
				 	</div>
				 	<div style="float: left;">
				 	<%
				 		if(dto.getSecret() == 1 && !dto.getId().equals(login.getId()) && login.getGrade() !=1){
				 	%>
				 		비밀글입니다.
				 <%
				 		}else{
				 		%>
				 		<%=dto.getTitle() %> <br>
				 		<%=dto.getContent() %> <br>
				 			<% if( login.getGrade() == 1){ %>
				 		<details>
							<summary>대답</summary>
							<form action="answerAf.do" method="post">
								<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
								<input type="hidden" name="id" value="<%=login.getId() %>">
								<input type="hidden" name="nickname" value="<%=login.getNickname() %>">
								<input type="hidden" name="title" value="<%=dto.getTitle() %>">
								<textarea rows="2" class="form-control" id="qnaAn" name="content"></textarea>
								<button type="submit" >완료</button>	
							</form>						
						</details>
					 	</div>
					 	<div style="float: right;" align="right">
					 		 &nbsp;&nbsp;&nbsp; <%=dto.getWdate() %> <br>
					 		<%-- <button type="button" onclick="show(<%=i %>)">대답</button> --%>				 		
					 	</div>
				 		<% 
				 			}
				 		}
				 %>
				 </div>
			 	</td>
			 </tr>
<%-- 			 <tr>
			 	<td>
			 		<form action="answerAf.do" method="post">
						<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
						<input type="hidden" name="id" value="<%=login.getId() %>">
						<input type="hidden" name="nickname" value="<%=login.getNickname() %>">
						<input type="hidden" name="title" value="<%=dto.getTitle() %>">
						<textarea rows="2" class="form-control" id="qnaAn" name="content"></textarea>
						<button type="submit" >완료</button>	
					</form>	
			 	</td>
			 </tr>	 --%>
		<%
			}
		}
		%>
		</tbody>
	</table>
		<div align="center">
			<a href="qnawr.do?id=<%=login.getId() %>">Q&A작성</a>
		</div>
	}

	</div>
	
<script type="text/javascript">
	function show(i) {
		let str = 
		if($('#'))
	}
</script>
</body>
</html>