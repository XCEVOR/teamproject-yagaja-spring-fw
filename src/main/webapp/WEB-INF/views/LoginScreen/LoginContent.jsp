<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div
		style="width: 500px; justify-content: center; margin: auto; padding-top: 100px;">
		<section>
			<h2>로그인</h2>

			<form method="post" action="#">
				<div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall">
						<input type="text" name="demo-name" id="demo-name" value=""
							placeholder="ID" />
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-human" name="demo-human">
						<label for="demo-human">ID 저장</label>
					</div>


					<div class="col-6 col-12">
						<input type="text" name="demo-name" id="demo-name" value=""
							placeholder="Password" />
					</div>

					<div class="col-12">
						<ul class="actions">
							<li><input type="submit" value="로그인" class="primary" /></li>
							<li><input type="submit" value="회원가입" class="primary" /></li>

						</ul>
					</div>
				</div>
			</form>
		</section>
	</div>



</body>
</html>