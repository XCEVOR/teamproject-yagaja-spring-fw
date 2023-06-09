
<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%-- <%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%> --%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="mul.cam.a.dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션에 저장된 로그인 값 가져오기
	MemberDto login = (MemberDto)session.getAttribute("login");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="assets/css/main.css" />
  <link rel="stylesheet" href="assets/css/noscript.css" />

   <!-- datepicker -->
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
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
  
  width: 300px;
  min-height: 100px;
}
ul{
list-style-type: none;
}
#listBody>li{
text-align: left;
}
#listBody>li:hover{
background-color:#dcdcdc;
opacity: 0.4;
transition: all 0.5s;
}
#hashtagBody{
  display: flex;
}
.hashtagContent{
  margin-left:20px;
  min-width: 50px;
}

#container{
width: 500px; 
justify-content: center; 
margin: auto; 
padding-top: 50px;

}

</style>
</head>

<%
// Post 공간의 bbs list
List<BbsDto> list= (List<BbsDto>)request.getAttribute("bbsPostList");
// 현재 bbs dto
BbsDto dto = (BbsDto)request.getAttribute("bbsPostDto");

System.out.println(list);
System.out.println(dto);

String title ="";
String content = "";
String date="";
String hashtags="";
String comment="";
int seq=0;
int bbsseq=0;
boolean exist=false;
if(dto != null){
	exist=true;
	title = dto.getTitle();
	content =dto.getContent();
	date=dto.getDate();
	seq=dto.getSeq();
	bbsseq=dto.getBbsseq();
	
	if(dto.getHashtags()!=null){
		hashtags=dto.getHashtags();
	};
	
	if(dto.getFilename()!=null){
		comment="정상적으로 사진이 등록됐습니다.."+dto.getFilename();
	}
}

List<String> dateList=new ArrayList();

%>

<!-- 값 넣어주기  -->
<script type="text/javascript">

$(document).ready(function(){
	$("#datepicker").val('<%=date%>');
 	$("#title").val('<%=title%>');
	$("#content").val('<%=content%>');
	$("#fileCommnet").text('<%=comment%>');  
	  
});
</script>

<body>

  
  <div id="container">
    <h1 style="padding-bottom: 30px;">글 작성 페이지</h1>
    <form id="uploadFileForm">
    
    <input type="hidden" name="seq" id="seq" value="<%=seq%>">
    <input type="hidden" name="id" value="<%=login.getId()%>">
    <input type="hidden" name="nickname"  value="<%=login.getNickname()%>">
 
    <div class="row gtr-uniform">
      <div class="col-6 col-12-xsmall">
        <input id="datepicker"  type="text"  placeholder="일정 등록" autocomplete='off'>
      </div>
      <div class="col-6 col-12-xsmall">
        <ul id="listBody">
          <span><h5 style="text-align: left">일정 list</h5></span>
          <%
         if(list!=null){
         for(int i=0;i<list.size();i++){
        	 BbsDto d=list.get(i);
        	 dateList.add(d.getDate());
        	 %>
        	 <li><%=d.getDate()%><a href='bbsPostClick.do?date=<%=d.getDate()%>&bbsseq=<%=d.getBbsseq()%>'
					class='button primary small dateContent' 
					style='font-size: 5px; margin-left:10px'>이동</a></li>
                <% 
         }
         }
          %>
          <!-- 일정 추가 -->
        </ul>
      </div>
		
      <div class="col-6 col-12">
        <input type="text" name="title" id="title" value="" placeholder="글 제목"/>
      </div>

      <div class="col-6 col-12">
       <textarea style="height: 200px;" name="content" id="content" placeholder="내용을 입력해주세요.."></textarea>
      </div>

      <div class="col-2 col-2">
        <input type="button" id="hashtagBtn" class="button primary small" style="font-size: 10px;" value="해시태그 추가">
        <span id="hashtagBody">
          <%
         if(hashtags!=""){
        	 String tags [] =hashtags.split(",");
         	for(int i=0;i<tags.length;i++){
        	 %>
        <input class="hashtagContent" type="text" name="hashtag" class="hashtag" value="<%=tags[i]%>" placeholder="#"/>'
                <% 
         }
         }
          %>
          
        </span>
        
      </div>
     
      <div class="col-6 col-12">
        <label class="btn btn-default btn-file">
          사진 등록 <input type="file" name="fileload" id="file">
      </label>
      <p id="fileCommnet"></p>
      </div>
      	
       </form>
      
      <div class="col-12">
        <ul class="actions">
			
          <li>
          <div id="alterChange" style="display: none;"><input id="alterBtn" type="button" value="ALTER" class="primary" /></div>
          <div id="saveChange" ><input id="saveBtn" type="button" value="SAVE" class="primary" /></div>
          </li>
          
          <li><input id="deleteBtn" type="button" value="DELETE" class="primary" /></li>
          <li><input id="mainBtn"type="button" value="메인으로 돌아가기" class="primary" /></li>
        </ul>
      </div>
         <input type="hidden" name="hashtags" id="hashtags" value="">
         <input type="hidden" name="date" id="date" value="">
     		
    </div>
    </div>

 




  <!-- 날짜 선택 시 일정 list에 추가 -->
  <script>
  
  // 초기화 함수
  function init() {
	   $("#file").val("");
	   $("#datepicker").val("");
	   $("#title").val("");
	   $("#content").val("");
	   $(".hashtag").val("");
	   $("#fileCommnet").text("");

}

  
  // 일정 list 뿌리기

  
  
  
  
  // dateList를 매핑하여 문자열로 변환
   <%ObjectMapper objectMapper = new ObjectMapper();
	 String jsonString = objectMapper.writeValueAsString(dateList);%>
			
	var dateList = <%=jsonString%>   
	
	var exist=<%=exist%>;
	var c_date="<%=date%>";
	if(exist){
		$("#saveChange").css("display","none")
		$("#alterChange").css("display","block");
	}

     $( "#datepicker" ).datepicker({    
         onSelect: function() {
            date = $("#datepicker").val();
            
            // 선택한 날짜가 현재 날짜와 같지 않으면 save 버튼을 보이게
            if(date!=c_date ){
        		$("#saveChange").css("display","block")
        		$("#alterChange").css("display","none");
        	}

				if(dateList.indexOf(date)!=-1){
				alert("날짜가 중복됐습니다.")
				
				}
				else{
           		li="<li>"+
            	date+" <a href='bbsPostClick.do?date="+date+"&bbsseq="+bbsseq
            	 +"' class='button primary small dateContent' style='font-size: 5px; margin-left:10px'>이동</a></li>"
           		$("#listBody").append(li);
            	 
           	  $("#file").val("");
       		  $("#title").val("");
       	 	  $("#content").val("");
       	 	  $(".hashtag").val("");
       	     $("#fileCommnet").text("");
       
        }}
     
    }); 
  
  	
  
  /* 해시태그 추가  */
    $("#hashtagBtn").click(function(){
       hashtag='<input class="hashtagContent" type="text" name="hashtag" id="hashtag"  placeholder="#"/>'
      $("#hashtagBody").append(hashtag);
    });

  
    $("#deleteBtn").click(function(){                           
      date = $("#datepicker").val();
      location.href="bbsPostdelete.do?date="+date;

    });
  


/* 파일 텍스트  */
    $("#file").change(function(){
      image=$("#file").val();
      if(image!=""){
      $("#fileCommnet").text("정상적으로 사진이 등록됐습니다.." +image );
      }
  
    });





/* SAVE 버튼 클릭시  -> 현재 페이지 저장 -> 현재 페이지번호의 세션이 저장 */

$(document).ready(function(){
	 $("#saveBtn").click(function(){
	       // 해시태그 값 가져오기
	       let hashtagList="";
	       let hashtags=  $(".hashtagContent");
	       
	       for(let i=0;i<hashtags.length;i++){
	        tag=hashtags.eq(i).val();
	        if(tag!=""){
	          hashtagList+=(tag+",")
	          } 
	        }
	     
	       // 해시태그 date값 설정
	       $("#hashtags").val(hashtagList);
		   $("#date").val($("#datepicker").val());
		   
	      //  날짜 값 가져오기
	    	 date = $("#datepicker").val();

	      //  글 제목 가져오기
	    	 title = $("#title").val();

	       // 글 내용 가져오기
	    	 content = $("#content").val();
	       
	       // 파일 가져오기
	       	file=$("#file").val();   

	       // alert 등록 (필수 입력 항목 alert처리)
	       if(date =="") {
	        alert("날짜를 등록해주세요..");

	       }else if(title=="" ){
	        alert("제목을 입력해주세요..");
	        
	       }else if(content==""){
	        alert("내용을 입력해주세요..");

	       }else if(file==""){
	    	   alert("사진을 넣어주세요..");
	       }else{
	    
	    	  console.log($("#file").val());
	    	   
	    	   $.ajax({
	    		   url:"bbsPostwriteAf.do",
	    		   type:"post",
	    		   data: new FormData($("#uploadFileForm")[0]),   	    		  
	    		   enctype:'multipart/form-data',
	    		   processData:false,
	    		   contentType:false,
	    		   cache:false,
	    		   success:function(){
	    			   alert("성공적으로 글이 작성됐습니다.");
	    		   },
	    		   error:function(){
	    			   alert("write error발생");
	    		   }
	 
	    	   });

	    	   // 글 초기화 
	    	    init();

	       }
	    });
	    
})
   
    $("#alterBtn").click(function(){
        // 해시태그 값 가져오기
        let hashtagList="";
        let hashtags=  $(".hashtagContent");
        for(let i=0;i<hashtags.length;i++){
         tag=hashtags.eq(i).val();
         if(tag!=""){
           hashtagList+=(tag+",")
           } 
         }
        $("#hashtags").val(hashtagList);
		$("#date").val($("#datepicker").val());


       //  날짜 값 가져오기
     	 date = $("#datepicker").val();

       //  글 제목 가져오기
     	 title = $("#title").val();

        // 글 내용 가져오기
     	 content = $("#content").val();
        
     	// 파일 가져오기
     	filecomment=$("#fileCommnet").val();   
		
        // alert 등록 (필수 입력 항목 alert처리)
     	 if(date =="") {
         alert("날짜를 등록해주세요..");

        }else if(title=="" ){
         alert("제목을 입력해주세요..");
         
        }else if(content==""){
         alert("내용을 입력해주세요..");

        }else if(fileCommnet==""){
	    	   alert("사진을 넣어주세요..");
	       }else{
		
        	$.ajax({
	    		   url:"bbsPostupdateAf.do",
	    		   type:"post",
	    		   data: new FormData($("#uploadFileForm")[0]),   	    		  
	    		   enctype:'multipart/form-data',
	    		   processData:false,
	    		   contentType:false,
	    		   cache:false,
	    		   success:function(){
	    			   alert("성공적으로 글이 변경됐습니다.");
	    		   },
	    		   error:function(){
	    			   alert("update error발생");
	    		   }
	 
	    	   });
     	   
     	   // 글 초기화 
        	init();
     	  
  
         
        }
     });
     
     
$("#mainBtn").click(function(){
    location.href="main.do";
    
 });
    

  </script>

</body>
</html>