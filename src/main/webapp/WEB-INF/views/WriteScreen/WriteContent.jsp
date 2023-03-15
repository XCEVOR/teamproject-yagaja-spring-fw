<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="assets/css/main.css" />
  <link rel="stylesheet" href="assets/css/noscript.css" />

   <!-- 부트 -->
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">

  <!-- datepicker -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
    $( function() {
      $( "#datepicker" ).datepicker();
    } );
    </script>
  <title>Document</title>
  <style>
    .btn-file{
        position: relative;
        overflow: hidden;
    }
    .btn-file input[type=file] {
        position: absolute;
        top: 0;
            right: 0;
        min-width: 100%;
        min-height: 100%;
        font-size: 100px;
        text-align: right;
        filter: alpha(opacity=0);
        opacity: 0;
        outline: none;
        background: white;
        cursor: inherit;
        display: block;
    }
#listBody{
  background-color: #dcdcdc;
  width: 300px;
  min-height: 100px;
}
#hashtagBody{
  display: flex;
}
.hashtagContent{
  margin-left:20px;
  min-width: 50px;
}
</style>
</head>



<body>
  
  
  <div style="width: 500px; justify-content: center; margin: auto; padding-top: 100px;">
    <h1>글 작성 페이지</h1>
  <form method="post" action="#">
    <div class="row gtr-uniform">
      <div class="col-6 col-12-xsmall">
        <p id="dateId"><input id="datepicker" type="text" id="datepicker" placeholder="일정 등록"></p>
      </div>
      <div class="col-6 col-12-xsmall">
        <ul id="listBody">
          <h2>일정 list</h2>
          <!-- 일정 추가 -->
        </ul>
      </div>

      <div class="col-6 col-12">
        <input type="text" name="demo-name" id="demo-name" value="" placeholder="글 제목"/>
      </div>

      <div class="col-6 col-12">
       <textarea style="height: 200px;" placeholder="내용을 입력해주세요.."></textarea>
      </div>

      <div class="col-2 col-2">
        <input type="button" id="hashtagBtn" class="button primary small" style="font-size: 10px;" value="해시태그 추가">
        <span id="hashtagBody">
          <input class="hashtagContent" type="text" name="demo-name" id="demo-name" value="" placeholder="#"/>
        
        </span>
        
      </div>
     
      <div class="col-6 col-12">
        <label class="btn btn-default btn-file">
          사진 등록 <input type="file" style="display: none;">
      </label>
      </div>
      
      
      <div class="col-12">
        <ul class="actions">
          <li><input id="saveBtn" type="button" value="SAVE" class="primary" /></li>
          <li><input id="deleteBtn" type="button" value="DELETE" class="Default" /></li>
          <li><input type="submit" value="최종 등록" class="primary" /></li>
        </ul>
      </div>

    </div>
  </form>
  </div>



  <!-- 날짜 선택 시 일정 list에 추가 -->
  <script>

     $( "#datepicker" ).datepicker({    
         onSelect: function() {                         
            date = $("#datepicker").val();
            li="<li>"+
              date+"<a href='#'' class='button primary small dateContent' style='font-size: 5px; margin-left:10px'>변경</a></li>"
            $("#listBody").append(li);
        }
    });   

    $("#hashtagBtn").click(function(){
       hashtag='<input class="hashtagContent" type="text" name="demo-name" id="demo-name" value="" placeholder="#"/>'
      $("#hashtagBody").append(hashtag);
    });

    $("#deleteBtn").click(function(){                           
      date = $("#datepicker").val();
      console.log(date) // 해당되는 날짜 삭제

    });




  </script>
</body>
</html>