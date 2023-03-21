<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

   <div style="width: 50%; justify-content: center; margin: auto; padding-top: 100px;">
  <section>
    <h2>회원가입</h2>
  
    <form method="post" action="signupAf.do">
      <div class="row gtr-uniform">
        <div class="col-6 col-12-xsmall">
          <input type="text" name="id" id="id" value="" placeholder="ID"/>
        </div>
        <div class="col-6 col-12-small">
          <button type="button" id="idChk" name="idChk">
          <label for="demo-human">id check</label>          
        </div>        
        <div style="margin-left: 20px">
        	<p id="idcheck" ></p> 
		</div>
        <div class="col-6 col-12">
          <input type="text" name="phonenumber" id="phonenumber" value="" placeholder="phoneNumber"/>
        </div>
        
        <div class="col-6 col-12">
          <input type="email" name="email" id="email" value="" placeholder="email"/>
        </div>

        <div class="col-6 col-12">
          <input type="text" name="nickname" id="nickname" value="" placeholder="NickName"/>
        </div>        
         
         <div>
			<div class="col-6 col-12">
			<select name="gender" id="gender" value="">
            <option value="">select 성별</option>
            <option value="female">female</option>
			<option value="male">male</option>            
          </select>
       		 </div>
         </div>
        
        <!-- gender 체크박스 형태 -->
<!--           <div class="col-6 col-12">
                <label for="gender">성별 </label>
                <input type="checkbox" id="gender" name="gender" value="female">
                <label for="female" class="form-check-label">female</label>
                <input type="checkbox" id="gender" name="gender" value="male">
                <label for="male" class="form-check-label">male</label>
           </div> -->
		 

        <div class="col-6 col-12">
          <input type="text" name="pwd" id="pwd" value="" placeholder="Password"/>
        </div>
       
        <div class="col-6 col-12">
          <input type="text" name="pwd2" id="pwd2" value="" placeholder="Password2"/>
        </div>
         <div class="col-6 col-12-small">
          <button type="button" id="pwdChk" name="pwdChk">
          <label for="demo-human">password check</label>          
        </div>        
        <div style="margin-left: 20px">
        	<p id="pwdcheck" ></p> 
		</div>

        <div class="col-12">         
          <div class="col-6 col-3-small">
             <span> 당신의 mbti를 입력해주세요</span>&emsp;&emsp;&emsp;
            <input type="checkbox" id="mbtiChk" name="mbtiChk">
            <label for="mbtiChk">입력안함</label>
          </div>
          
         

          <select name="mbti" id="mbti" value="" onchange="val()">
            <option value="">select MBTI</option>
            <option value="ISTJ">ISTJ</option>
            <option value="ISFJ">ISFJ</option>
            <option value="ESTJ">ESTJ</option>
            <option value="ESFJ">ESFJ</option>
            <option value="ISTP">ISTP</option>
            <option value="ISFP">ISFP</option>
            <option value="ESTP">ESTP</option>
            <option value="ESTJ">ESTJ</option>
            <option value="INTJ">INTJ</option>
            <option value="INFJ">INFJ</option>
            <option value="ENTJ">ENTJ</option>
            <option value="ENFJ">ENFJ</option>
            <option value="INTP">INTP</option>
            <option value="INFP">INFP</option>
            <option value="ENTP">ENTP</option>
            <option value="ENTJ">ENTJ</option> 
          </select>
        </div>
        
        <div class="col-12">
          <ul class="actions">
            <li><input type="submit" value="회원가입" class="primary" /></li>
            <li><input type="reset" value="다시 입력"/></li>
          </ul>
        </div>
      </div>
    </form>
  </section>
</div>

<script type="text/javascript">
$(document).ready(function() {
	//아이디 중복체크
	
	$("#idChk").click(function() {		
		// id의 빈칸을 조사!
		
		$.ajax({
			type:"post",
			url:"idcheck.do",
			data:{ "id":$("#id").val() },
			success:function(msg){				
				if(msg == "YES"){					
					if($('#id').val()==''){ 
						$("#idcheck").css("color", "#ff0000");
						$("#idcheck").text("  아이디를 입력해주세요.");
		               } else {
		            	    $("#idcheck").css("color", "#0000ff");
							$("#idcheck").text("   사용할 수 있는 아이디입니다");
		               }					
				}else{
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").text("   사용중인 아이디입니다");
			//		alert('사용중인 아이디입니다');
					$("#id").val("");
				}	
			},
			error:function(){
				alert('error');
			}
		});
	});
});

$(document).ready(function() {

	//비밀번호 확인
		$("#pwdChk").click(function(){
		   if($("#pwd").val() != $("#pwd2").val()){
			   $("#pwdcheck").css("color", "#ff0000");
				$("#pwdcheck").text("	비밀번호가 일치하지 않습니다.");
	    	  	$("#pwd2").val('');
	          	$("#pwd2").focus();		    	
		    } else {
		    	   $("#pwdcheck").css("color", "#0000ff");
					$("#pwdcheck").text("   비밀번호가 일치합니다.");		    	   
		       }
		})  	   
	});
	
function val() {
    d = document.getElementById("mbti").value;
    console.log(d);
}


</script>

</body>
</html>