<%@page import="mul.cam.a.dto.QnaDto"%>
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
	//checkbox해결
	//
	// 선택 함수(삭제를 위한) 
	$(function () {
		let chkObj = document.getElementsByName("RowCheck");
		let rowCnt = chkObj.length;
		//전체 체크
		$('input[name="allCheck"]').click(function(){
			let chk_listArr = $("input[name='RowCheck']");
			for (let i = 0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		//전체 체크를 안누른 상태에서 일일이 다 체크할 경우 전체 체크해도 체크
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}else{
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	
	// 삭제 기능 구현
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
				url:"qnadelete.do",
				type:"post",
				traditional:true,
				data:{ "valueArr" : valueArr},
				success: function(msg){
					console.log(msg);
					
					if(msg == "del_yes"){
						alert("삭제 성공");
						location.replace("admin.do");
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
	//멤버 리스트 받아오는 부분 qna로 바꿔야함
	List<QnaDto> list = (List<QnaDto>)request.getAttribute("qnalist");
%>
    <h1>QnA관리</h1>
    <a href="admin.do">어드민</a>
	<a href="adminMem.do">회원</a>
    <div align="center">
    	<table border="1">
		<col width = "100"><col width = "100"><col width = "500"><col width = "50">
		<thead>
			<tr>
				<th>
					<div>
						<input id="allCheck" name="allCheck" type="checkbox" />
						<label for="allCheck"></label>				
					</div>
				</th>
				<th>별명</th><th>제목</th><th>대답</th>
			</tr>			
		</thead>
		
		<tbody>
		<%
		
			if(list == null || list.size() == 0){
		%>
			<tr>
				<td colspan="4">작성된 qna가 없습니다.</td>
			</tr>
			<%
			
				
					}else{
						for(int i = 0; i<list.size(); i++)
						{
							//qna로 수정해야함
							QnaDto dto = list.get(i);
			%>
						<tr>
							<td style="text-align: center;">
							<div>
								<input id="RowCheck<%=i %>" name="RowCheck" type="checkbox" value="<%=dto.getSeq() %>" />
								<label for="RowCheck<%=i %>"></label>
							</div>
								
							</td>
							<td>
								<%=dto.getNickname() %>
							</td>
							<td>
								<%=dto.getTitle() %>
							</td>
							<td>
								<%=dto.getAns() %>
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