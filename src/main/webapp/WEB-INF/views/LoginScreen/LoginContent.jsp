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
<title>Insert title here</title>
</head>
<body>
	<div
		style="width: 500px; justify-content: center; margin: auto; padding-top: 100px;">
		<section>
			<h2>로그인</h2>

			<form method="post" action="loginAf.do">
				<div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall">
						<input type="text" name="id" id="id" value=""
							placeholder="ID" />
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="chk_save_id" name="chk_save_id" value="">
						<label for="chk_save_id">ID 저장</label>
					</div>


					<div class="col-6 col-12">
						<input type="text" name="pwd" id="pwd" value=""
							placeholder="Password" />
					</div>

					<div class="col-12">
						<ul class="actions">
							<li><input type="submit" value="로그인" class="primary" /></li>
							<li><input type="button" value="회원가입" class="primary" onclick="location.href='signup.do'"/></li>

						</ul>
					</div>
				</div>
			</form>
			
			<a href="findId.do">Id 찾기</a>
			<a style="margin-left: 20px" href="findPwd.do">PassWord 찾기</a>
            <a style="margin-left: 20px" href="signup.do">회원가입</button>
                       
			
		</section>
	</div>
	
	<script type="text/javascript">
function account() {	
	location.href = "singup.do";
}


let user_id = $.cookie("user_id");	// 쿠키에 저장된 id 가져옴.


if(user_id != null){	// 쿠키에 저장한 id가 있음
	$("#id").val(user_id);	// 쿠키 아이디를 input값에 넣음.
	$("#chk_save_id").prop("checked", true);	//아이디 저장 체크박스,
}

$("#chk_save_id").click(function () {	// 아이디 저장 체크박스 클릭
	
	if( $("#chk_save_id").is(":checked") == true ){	// 아이디저장 체크박스가 체크되 ㄴ상태일때
		
		// 유효성 검증
		if( $("#id").val().trim() == "" ){	
			alert('id를 입력해 주십시오');
			$("#chk_save_id").prop("checked", false);
		}else{
			// cookie를 저장
			$.cookie("user_id", $("#id").val().trim(), { expires:7, path:'./' });
		}
		
	}else{	// 체크박스 해제 시 쿠키삭제 
		$.removeCookie("user_id", { path:'./' });
	}	
});

</script>

</body>
</html>