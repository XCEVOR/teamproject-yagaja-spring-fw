<%@page import="mul.cam.a.dto.BbsDto"%>
<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>



<%
    List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");
    List<BbsDto> blist = (List<BbsDto>)request.getAttribute("bbslist");
    // System.out.println(blist.toString());
    int pageBbs = (Integer)request.getAttribute("pageBbs");
    int pageNumber = (Integer)request.getAttribute("pageNumber");
    String choice = (String)request.getAttribute("choice");
    String search = (String)request.getAttribute("search");
    
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style type="text/css">

#main{
display: flex;
}
</style>
</head>
<body>

	<div id="wrapper">
		

		<div id="main">
			<input type="hidden" id="testinput" value=""
				placeholder="아이디 입력 (테스트)">
			<!-- <button type="button" onclick="myBtn()">분류</button> -->
			<div class="inner">
				<div class="container1"></div>
				<section id="mysection" class="tiles">

					<%
					for (int i = 0; i < blist.size(); i++) {
						BbsDto bdto = blist.get(i);
					%>
					<article class="style1">
						<span class="image"> <img
							src="upload/<%= bdto.getNewfilename() %>" alt="" />
						</span> <a href="detail1.do?seq=<%= bdto.getSeq() %>">
							<h6>
								Like test:
								<%= bdto.getLikecount() %></h6>
							<h6>
								Read test:
								<%= bdto.getReadcount() %></h6>
							<h2><%= bdto.getTitle() %></h2>
							<div class="content">
								<p><%= bdto.getContent() %></p>
							</div>
						</a>
					</article>
					<%
        }
    %>

				</section>
			</div>
		</div>
	</div>


	<!-- 0317 다른 페이지 불러오기. -->
    <button type="button" id="nextBtn" onclick="nextPage()">NEXT</button>
    <div id="trigger"></div>
    
    
    
    
<script type="text/javascript">
    window.document.getElementById('testinput').value = "";
    function myBtn() {
        let mytest = document.getElementById('testinput').value;
        
        location.href = "mainid.do?id=" + mytest;   
    }
    /* function replay() {
        location.reload();
    } */
    
    
    // 0317 다른 페이지 불러오기.
    function goPage( pageNumber ) {
        let choice = document.getElementById('choice').value;
        let search = document.getElementById('search').value;
        
        location.href = "main.do?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNumber;  
    }
    
    let totalPage = <%= pageBbs %>;
    let loadedPage = -1;
    console.log(totalPage);
    function nextPage() {
    	let choice = document.getElementById('choice').value;
        let search = document.getElementById('search').value;
        loadedPage += 1;
        $(document).ready(function () {
            
            let param = {   "choice": choice, 
                            "search": search,
                            "pageNumber": loadedPage,
                            "start": "1",
                            "end": "10"};
            $.ajax({
                url: "mainnumpage.do",
                type: "get",
                data: param,
                success: function (list) {
                    // alert(list);
                    console.log(list);
                    /* $("#mysection").html(""); */
                    $.each(list, function(index, item){
                        let str = "<article class='style1 myfade" + loadedPage + "'>" 
                                + "     <span class='image'>"
                                + "         <img src='upload/" + item.newfilename + "' alt='' />"
                                + "     </span>"
                                + "     <a href='detail1.do?seq=" + item.seq + "'>"
                                + "         <h6>Like test:" + item.likecount + "</h6>"
                                + "         <h6>Read test:" + item.readcount + "</h6>"
                                + "         <h2>" + item.title + "</h2>"
                                + "         <div class='content'>"
                                + "             <p>" + item.content + "</p>"
                                + "         </div>"
                                + "     </a>"
                                + "</article>";
    
                        let newTags = $(str).hide();
                        $("#mysection").append(newTags);
                    });
                    /* content.trigger("#mysection");
                    $('#mysection').page(); */
                    
                    $(".myfade" + loadedPage).delay(200).fadeIn(2000);
                    // newTags.fadeIn(1000);
                },
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
    
    
        });
    }
    

        
    
    
    var isVisible = false;

    $(window).on('scroll',function() {
        if (checkVisible($('#trigger'))&&!isVisible) {
            // alert("Visible!!!");
            isVisible=true;
            setTimeout(nextPage, 500);
            
            setTimeout(function() {
                  isVisible = false;
                }, 1000);
        }
    });

    function checkVisible( elm, eval ) {
        eval = eval || "object visible";
        var viewportHeight = $(window).height(), // Viewport Height
            scrolltop = $(window).scrollTop(), // Scroll Top
            y = $(elm).offset().top,
            elementHeight = $(elm).height();   
        
        if (eval == "object visible") return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
        if (eval == "above") return ((y < (viewportHeight + scrolltop)));
    }
    
    
    
    
    history.scrollRestoration = "manual";  // 최상단으로 이동.
    
</script>
    
    
</body>
</html>