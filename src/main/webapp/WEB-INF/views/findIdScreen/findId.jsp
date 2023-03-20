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
<title>findId</title>

<%	
	BbsDto dto = (BbsDto)request.getAttribute("bbsdto");
%>


	<div
		style="width: 500px; justify-content: center; margin: auto; padding-top: 100px;">
		<section>
<form method="post" class="form-signin" action="findIdAf.do" name="findform">
		<div class="form-label-group">
			<input type="text" id="nickname" name="nickname" placeholder="nickname"  class="form-control" />
			<label for="nickname"></label>
		</div>
		
		<div class="form-label-group">
			<input type="text" id="phonenumber" name="phonenumber" placeholder="phonenumber"  class="form-control"/>
			<label for="phonenumber"></label>
		</div>

		<div class="form-label-group">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase"
				type="submit" value="check">
		</div>
	</form>
	</section>
</div>	

<!-- 잘못된 방법일지도. 일단 주석처리함.  -->
<!-- 아이디 알려주기 -->
<%-- <table class="table table-sm">
<col width="500"><col width="500">
<tbody id="tbody">
</tbody>
</table>

<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url:"./commentList.do",		// 일로간다.
		type:"get",					// 갈때 타입은 겟타입
		data:{ "seq":<%=dto.getSeq() %> },	// 데이터타입
		success:function(list){	
			$("#tbody").html("");
			$.each(list, function(index, item){
				let str = "<tr class='table-info'>" 
					+	"<td>작성자:" + item.id + "</td>"
					
			});						
		},
		error:function(){
			alert('error');	
		}		
	});
});
 --%>




</script>
		
</body>
</html>