<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
<title>Insert title here</title>
</head>
<body>

   <div style="width: 50%; justify-content: center; margin: auto; padding-top: 100px;">
  <section>
    <h2>회원가입</h2>
  
    <form method="post" action="#">
      <div class="row gtr-uniform">
        <div class="col-6 col-12-xsmall">
          <input type="text" name="demo-name" id="demo-name" value="" placeholder="ID"/>
        </div>
        <div class="col-6 col-12-small">
          <input type="checkbox" id="demo-human" name="demo-human">
          <label for="demo-human">ID 중복 체크</label>
        </div>

        <div class="col-6 col-12">
          <input type="text" name="demo-name" id="demo-name" value="" placeholder="phoneNumber"/>
        </div>
        
        <div class="col-6 col-12">
          <input type="email" name="demo-name" id="demo-name" value="" placeholder="email"/>
        </div>

        <div class="col-6 col-12">
          <input type="text" name="demo-name" id="demo-name" value="" placeholder="NickName"/>
        </div>

        <div class="col-6 col-12">
          <input type="text" name="demo-name" id="demo-name" value="" placeholder="Password"/>
        </div>
       
        <div class="col-6 col-12">
          <input type="text" name="demo-name" id="demo-name" value="" placeholder="Password"/>
        </div>


        <div class="col-12">
         
          <div class="col-6 col-3-small">
             <span> 당신의 mbti를 입력해주세요</span>&emsp;&emsp;&emsp;
            <input type="checkbox" id="mbtiChk" name="mbtiChk">
            <label for="mbtiChk">입력안함</label>
          </div>

          <select name="demo-category" id="demo-category">
            <option value="">select MBTI</option>
            <option value="1">Manufacturing</option>
            <option value="1">Shipping</option>
            <option value="1">Administration</option>
            <option value="1">Human Resources</option>
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

</body>
</html>