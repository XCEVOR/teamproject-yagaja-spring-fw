<%@page import="mul.cam.a.dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<%
    //세션에 저장된 로그인 값 가져오기
    MemberDto login = (MemberDto)session.getAttribute("login");
%>

<%
    List<BbsDto> allBbsPostList = (List<BbsDto>)request.getAttribute("allBbsPostList");
    System.out.println(allBbsPostList.toString());
%>

<head>



    <link rel="stylesheet" href="assets/css/main.css" />
    <style>
    /* 임시 레이아웃 */
        body {
            margin: 0;
            padding: 0;
        }
        .container-Layout {
            display: flex;
            flex-direction: row;
            height: 100vh;
        }
        
        .left-Layout {
            display: flex;
            flex-direction: column;
            flex-basis: 50%;
            border-right: 1px solid #ccc;
           
        }
        
        .right-Layout {
            display: flex;
            flex-direction: column;
            flex-basis: 50%;
           
        }
        
        .top-left-Layout {
            display: flex;
            flex-direction: row;
            flex-basis: 76%;
           
           
        }
        
        .bottom-left-Layout {
            display: flex;
            flex-direction: row;
          
           
        }
        
        .top-right-Layout {
            display: flex;
            flex-direction: row;
            flex-basis: 30%;
            border-bottom: 1px solid #ccc;
            
        }
        
        .bottom-right-Layout {
            display: flex;
            flex-direction: column;
            flex-basis: 70%;
           
        }
        .fa-thumbs-up{
    
      	font-size:15px;
        margin-left: 0px;
        }
       .fa-thumbs-up:hover{
       	color: #FFDEE9;
       	
       }

.imgfile{

    display:block;
	width:100%;
	height:700px;
	padding: 20px;
	object-fit: cover;
} 
ul{
 list-style: none;
}
.slide-pagelist{
margin:0px;
padding: 0px;
}
div#ajaxSlidelist {
display: inline-block;
}

a {
  text-decoration: none;
}

    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">


</head>
<body>
    <div class="container-Layout">
        <div class="left-Layout">
            <div class="top-Layout">
                <ul>
                <!-- ########## 슬라이드 ########## ########## ########## ########## ########## ########## ########## ########## ##########  -->

                    <div id="ajaxSlidelist" class="section">
                    
                    <!-- 
                        <input type="radio" name="slide" id="slide01" checked> 
                        <input type="radio" name="slide" id="slide02"> 
                        <input type="radio" name="slide" id="slide03">
                        <div class="slidewrap">

                            <ul class="slidelist">
                                슬라이드 영역
                                <li class="slideitem"><a>
                                        <div class="textbox">
                                            <h3>첫번째 슬라이드</h3>
                                            <p>첫번째 슬라이드 입니다.</p>
                                        </div> <img src="./img/slide.jpg">
                                </a></li>
                                <li class="slideitem"><a>

                                        <div class="textbox">
                                            <h3>두번째 슬라이드</h3>
                                            <p>두번째 슬라이드 입니다.</p>
                                        </div> <img src="./img/slide.jpg">
                                </a></li>
                                <li class="slideitem"><a>

                                        <div class="textbox">
                                            <h3>두번째 슬라이드</h3>
                                            <p>두번째 슬라이드 입니다.</p>
                                        </div> <img src="./img/slide.jpg">
                                </a></li class="slideitem">

                                좌,우 슬라이드 버튼
                                <div class="slide-control">
                                    <div>
                                        <label for="slide03" class="left"></label> <label
                                            for="slide02" class="right"></label>
                                    </div>
                                    <div>
                                        <label for="slide01" class="left"></label> <label
                                            for="slide03" class="right"></label>
                                    </div>
                                    <div>
                                        <label for="slide02" class="left"></label> <label
                                            for="slide01" class="right"></label>
                                    </div>
                                </div>

                            </ul>
                            페이징
                            <ul class="slide-pagelist">
                                <li><label for="slide01"></label></li>
                                <li><label for="slide02"></label></li>
                                <li><label for="slide03"></label></li>
                            </ul>
                        </div>
                         -->
                        
                    </div>
                </ul>
            </div>
            <div class="bottom-left-Layout">
                <ul>
                <!-- ########## 해시태그 ########## ########## ########## ########## ########## ########## ########## ########## ##########  -->

                    <div class="card mb-4">
                        <div class="card-header">해시태그</div>
                        <div class="card-body">
                            <div id="scriptHashtags" class="row">
<!-- 
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">#바다</a> <a href="#!">#힐링</a> <a
                                            href="#!">#보라카이</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">#Web Design</a> <a href="#!">#HTML</a> <a
                                            href="#!">#Freebies</a></li>
                                    </ul>
                                </div>
-->
                            </div>
                        </div>
                    </div>
                </ul>
            </div>
        </div>
        <div class="right-Layout">
            <div class="top-Layout">
                <ul>
                <!-- ########## 게시글 ########## ########## ########## ########## ########## ########## ########## ########## ##########  -->

                    <h3 style="margin: 10px 0 10px 0;">게시글 내용</h3>


                    <table class="table table-striped table-sm">
                        <colgroup>
                            <col style="width: 150px" />
                            <col style="width: 700px" />
                        </colgroup>

                        <tr>
                            <th>작성자</th>
                            <td><%= allBbsPostList.get(0).getId() %></td>
                        </tr>
                        <tr>
                            <th>여행일</th>
                            <td><%= allBbsPostList.get(0).getDate() %></td>
                        </tr>
                        
                        
                        <tr>
                        
                            <td align="center" colspan="2"
                                style="font-size: 16px; font-weight: bold;">
                                <div id="detailTitle"></div>  <!--function slideIndex (index) 로 불러오기 위해 생성. -->
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" height=200px style="background-color: white;">
                            <div id="detailContent"></div>  <!--function slideIndex (index) 로 불러오기 위해 생성. -->
                            <%-- 
                                <pre
                                    style="font-size: 20px; font-family: 고딕, arial; background-color: white"><%= allBbsPostList.get(0).getContent() %>
                                </pre>
                            --%>
                            </td>
                        </tr>
                        
                        
                    </table>
						
                    <span id="alterBtn" style="display: none"><a href="update.do?seq=<%=allBbsPostList.get(0).getBbsseq()%>">수정</a></span>
                    <button class="fa fa-thumbs-up" onclick="likecountUpdate()"></i>

                </ul>
            </div>
            <div class="bottom-right-Layout">
                <ul>
                <!-- ##########댓글 ########## ########## ########## ########## ########## ########## ########## ########## ##########  -->

                    <h3 style="margin: 0 0 10px 0;">댓글작성</h3>
				<form action="commentWriteAf.do" method="post">
				
				<input type="hidden" name="seq" value="<%=allBbsPostList.get(0).getBbsseq() %>">
				
				<%if(login != null) {
					 %>
					<input type="hidden" name="id" value="<%=login.getId() %>">
					<table>
         			<col width="100"><col width="500"><col width="100">

                       <tr>
                           <th>comment</th>
                           <td><input type="text" name="content" size="50"></td>
                           <td colspan="2" align="center"><input type="submit"
                               value="작성완료"></td>
                          
                       </tr>
                  	 </table>	
					<%
					
				} else {
					
				}
				%>				  
	
				
                   </form>
                    
                    
<!--  댓글 리스트 : 일단 아이디, 내용 순으로 뽑아오기 ?  --> 
<table class="table table-sm">
<col width="70"><col width="400"><col width="200">
<thead>
<th>ID</th><th>Content</th><th>Date</th>
</thead>
<tr class="bg-primary" style="color: white;">
<tbody id="tbody">
</tr>
</tbody>
</table>

</div>

<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url:"./commentList.do",		
		type:"get",					
		data:{ "seq":<%=allBbsPostList.get(0).getBbsseq() %> },	
		success:function(list){		
			// alert('success');
			// alert(JSON.stringify(list));
			
			$("#tbody").html("");
			
			
			
			$.each(list, function(index, item){	// item = bbscomment
				let str = "<tr class='table-info'>" 						
						+	"<td>" + item.id + "</td>"
						+	"<td>" + item.content + "</td>"
						+	"<td >" + item.wdate + "</td>"
						+ "</tr>"						
				$("#tbody").append(str);
			});
		},
		error:function(){
			alert('error');	
		}		
	});	
});

</script>
    
    
<script type="text/javascript">
<%
String id="";
if(login!=null){
	id=login.getId();
}

%>
$(document).ready(function () {
		if('<%=id%>'=="<%=allBbsPostList.get(0).getId()%>"){
			$("#alterBtn").css("display","inline");
		}
	
	
	
});

	let seq00 = <%= allBbsPostList.get(0).getSeq() %>
    let bbsseq = <%= allBbsPostList.get(0).getBbsseq() %>
    console.log("@ seq: " + seq00);
    console.log("@ bbsseq: " + bbsseq);
        $(document).ready(function () {
            $.ajax({
                url: "ajaxDetail1.do",
                type: "GET",
                data: { "bbsseq":bbsseq },
                success: function (bbsPostList) {
                    console.log(bbsPostList);
                    
                    let slidtags = "";
                    
                    $.each(bbsPostList, function(index, item){
                        slidtags += "<input type='radio' name='slide' id='slide0" + (index + 1) + "'>" 
                    });
                    
                        slidtags += "<div class='slidewrap'>   <ul class='slidelist'>   ";
                    
                    $.each(bbsPostList, function(index, item){
                        slidtags += "<li class='slideitem'><a>" 
                                    + "<img class='imgfile' src='upload/" + item.newfilename + "'>"
                                    + "</a></li>";
                                    
                    });
                    
                        slidtags += "</ul>   <ul class='slide-pagelist'>";
                        
                    $.each(bbsPostList, function(index, item){
                        slidtags += "<li><label class='labelList' for='slide0" + (index + 1) + "' onclick='slideIndex(" + index + ")'></label></li>" ;
                    });
                    
                        slidtags += "</div>";
                        $("#ajaxSlidelist").append(slidtags).trigger("create");
                        

                        
                        
                        
                        
                        
                        let detailText = "";
                        
                        $.each(bbsPostList, function(index, item){
                            detailText += "<input type='radio' name='slide' id='slide0" + (index + 1) + "'>" 
                        });
                        
                        detailText += "<div class='slidewrap'>   <ul class='slidelist'>   ";
                        
                        $.each(bbsPostList, function(index, item){
                            detailText += "<li class='slideitem'><a>" 
                                        + "     <div class='textbox'>"
                                        + "             <h3>" + item.title + "</h3>"
                                        + "     </div> <img  src='upload/" + item.newfilename + "'>"
                                        + "</a></li>";
                                        
                        });
                        
                        detailText += "</ul>   <ul class='slide-pagelist'>";
                            
                        $.each(bbsPostList, function(index, item){
                            detailText += "<li><label class='labelList' for='slide0" + (index + 1) + "'></label></li>" ;
                        });
                        
                        detailText += "</div>";
                            $("#ajaxDetail1Content").append(detailText).trigger("create");
                        
                },
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });

        });

        
        $(document).ready(function () {
            $.ajax({
                url: "ajaxDetail1.do",
                type: "GET",
                data: { "bbsseq":bbsseq },
                success: function (bbsPostList) {
                
                    console.log(bbsPostList);
                   
                    
                    let hashtag_tags = "";
                    
                    $.each(bbsPostList, function(index, item){
                    	
                    	let tags_str = item.hashtags;
                    	let tag_ls = tags_str.split(',');
                    	tag_ls.pop();
                    	let tag_print = "";
                    	$.each(tag_ls, function name(i, tagitem) {
							tag_print += "#" + tagitem + " ";
						});
                    	
                    	hashtag_tags += "<div class='col-sm-6'>" 
                                    + "     <ul class='list-unstyled mb-0'>"
                                    + "             <li>"
                                    + "             <a>" + tag_print + "</a>"
                                    + "             </li>"
                                    + "     </ul>"
                                    + "</div>";
                                    
                       
                    });
                    
                        $("#scriptHashtags").append(hashtag_tags).trigger("create");
       
                },
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });

        });

        
        $(document).ready(function () {
            document.getElementById("detailTitle").innerHTML = '<h2><%=allBbsPostList.get(0).getTitle()%></h2>';
            document.getElementById("detailContent").innerHTML = '<h3><%=allBbsPostList.get(0).getContent()%></h3>';
        });

        function slideIndex (index) {
        	<%
        		for(int i=0; i< allBbsPostList.size(); i++){
        			%>
	        			if(index == <%=i%>){
	        				console.log("~~" + "<%=allBbsPostList.get(i).getTitle()%>");
	        				<%-- let slideTest = document.getElementById("slideTest");
	        				slideTest.innerHTML = '<h1><%=allBbsPostList.get(i).getTitle()%></h1>' --%>
	        				
	        				document.getElementById("detailTitle").innerHTML = '<h2><%=allBbsPostList.get(i).getTitle()%></h2>';
	        				document.getElementById("detailContent").innerHTML = '<h3><%=allBbsPostList.get(i).getContent()%></h3>';
	        			}
        			<%
        		}
        	%>
        }

        $(document).ready(function () {
            $.ajax({
                url: "ajaxReadcount.do",
                type: "GET",
                data: { "seq":bbsseq },
                success: function (msg) {
                    // alert(list);
                    console.log(msg);
                },
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        });
        
        let isLike = false;
        function likecountUpdate() {
            console.log("isLike: " + isLike);
            if (isLike == true) {
                return;
            }
            else {
                isLike = true;
            }
            $(document).ready(function () {
                $.ajax({
                    url: "ajaxLikecount.do",
                    type: "GET",
                    data: { "seq":bbsseq },
                    success: function (msg) {
                        // alert(list);
                        console.log(msg);
                    },
                    error: function (request, status, error) {
                        alert(request.responseText);
                    }
                });
            });
        }
        
        


</script>



    
</body>
</html>
