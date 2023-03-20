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
<form method="post" class="form-signin" action="findPwdAf.do" name="findform">
		<div class="form-label-group">
			<input type="text" id="id" name="id" placeholder="id"  class="form-control" />
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






</script>
		
</body>
</html>