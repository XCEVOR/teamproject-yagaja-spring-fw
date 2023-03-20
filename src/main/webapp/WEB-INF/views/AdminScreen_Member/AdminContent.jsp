<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function () {
		let chkObj = document.getElementsByName("RowCheck");
		let rowCnt = chkObj.length;

		$('input[name="allCheck"]').click(function(){
			let chk_listArr = $("input[name='RowCheck']");
			for (let i = 0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}else{
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	function deleteValue(){
		let valueArr = new Array();
		let list = $("input[name='RowCheck']");
		for (let i = 0; i< list.length; i++){
			if(list[i].checked){
				valueArr.push(list[i].value);
			}
		}
		if(valueArr.length == 0){
			alert("선택된 글이 없습니다.");
		}else{
			let chk = confirm("정말 삭제하겠습니까?");
			console.log(valueArr);
 			$.ajax({
				url:"memberdelete.do",
				type:"post",
				traditional:true,
				data:{ "valueArr" : valueArr},
				success: function(msg){
					console.log(msg);				
					if(msg == "del_yes"){
						alert("삭제 성공");
						location.replace("adminMem.do");
					}
				},
				error: function(){
					alert('오류');
				}
			}); 
		}
	}
</script>
</head>
<body>
<%
	List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");
%>
    <h1>회원관리</h1>
    <a href="admin.do">어드민</a>
	<a href="adminQna.do">Qna</a>
    <div align="center">
    	<table border="1">
		<col width = "70"><col width = "150"><col width = "100"><col width = "150">
		<thead>
			<tr>
				<th><input id="allCheck" name="allCheck" type="checkbox" /></th>
				<th>아이디</th><th>이름</th><th>이메일</th><th>삭제</th>
			</tr>			
		</thead>
		
		<tbody>
		<%
		

			if(list == null || list.size() == 0){
		%>
			<tr>
				<td colspan="4">가입한 회원이 없습니다.</td>
			</tr>
			<%
			
				
					}else{
						for(int i = 0; i<list.size(); i++)
						{
							MemberDto dto = list.get(i);
			%>
						<tr>
							<td>
								<div>
									<input id="RowCheck<%=i %>" name="RowCheck" type="checkbox" value="<%=dto.getId() %>" />
									<label for="RowCheck<%=i %>"></label>
								</div>
							</td>
							<td>
								<%=i+1 %>
							</td>
							<td>
								<%=dto.getId() %>
							</td>
							<td>
								<%=dto.getNickname() %>
							</td>
							<td>
								<%=dto.getEmail() %>
							</td>

						</tr>
					<%
					
				}
			}
		
		%>
		</tbody>
	</table>
	<input type="button" value="삭제" onclick="deleteValue()">
    </div>

</body>
</html>