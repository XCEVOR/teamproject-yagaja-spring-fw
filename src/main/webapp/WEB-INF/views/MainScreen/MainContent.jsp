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
		<!-- Header -->
		<header id="header">
			<div class="inner">

				<!-- Logo -->
				<a href="main.do" class="logo"> <span class="symbol"><img
						src="images/logo.svg" alt="" /></span><span class="title">YAGAJA</span>
				</a>

				<!-- Nav -->
				<nav>
					<ul>
						<li><a href="#menu">Menu</a></li>
					</ul>
				</nav>
			</div>
		</header>




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
    
    
    <div>
        <body class="is-preload">
        <!-- Wrapper -->
            <div id="wrapper">
            
                <!-- Header -->
                    <header id="header">
                        <div class="inner">

                        <!-- Logo -->
                            <a href="main.do" class="logo">
                                <span class="symbol"><img src="images/logo.svg" alt="" /></span><span class="title">YAGAJA</span>
                            </a>

                        <!-- Nav -->
                            <nav>
                                <ul>
                                    <li><a href="#menu">Menu</a></li>
                                </ul>
                            </nav>
                        </div>
                    </header>

                <!-- Menu -->
                    <nav id="menu">
                        <h2>Menu</h2>
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li><a href="generic.html">Ipsum veroeros</a></li>
                            <li><a href="generic.html">Tempus etiam</a></li>
                            <li><a href="generic.html">Consequat dolor</a></li>
                            <li><a href="elements.html">Elements</a></li>
                        </ul>
                    </nav>

                <!-- Main -->
                    <div id="main">
                        <div class="inner">
                            <header>
                                
                            </header>
                            <div class="container1"></div>
                            <section class="tiles">
                                <article class="style1">
                                    <span class="image">
                                        <img src="images/mainpage/pic01.jpg" alt="" />
                                    </span>
                                    <a href="generic.html">
                                        <h2>Magna</h2>
                                        <div class="content">
                                            <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
                                        </div>
                                    </a>
                                </article>
                            </section>
                        </div>
                    </div>

                <!-- Footer -->
<!--                 
                    <footer id="footer">
                        <div class="inner">
                            <section>
                                <h2>Get in touch</h2>
                                <form method="post" action="#">
                                    <div class="fields">
                                        <div class="field half">
                                            <input type="text" name="name" id="name" placeholder="Name" />
                                        </div>
                                        <div class="field half">
                                            <input type="email" name="email" id="email" placeholder="Email" />
                                        </div>
                                        <div class="field">
                                            <textarea name="message" id="message" placeholder="Message"></textarea>
                                        </div>
                                    </div>
                                    <ul class="actions">
                                        <li><input type="submit" value="Send" class="primary" /></li>
                                    </ul>
                                </form>
                            </section>
                            <section>
                                <h2>Follow</h2>
                                <ul class="icons">
                                    <li><a href="#" class="icon brands style2 fa-twitter"><span class="label">Twitter</span></a></li>
                                    <li><a href="#" class="icon brands style2 fa-facebook-f"><span class="label">Facebook</span></a></li>
                                    <li><a href="#" class="icon brands style2 fa-instagram"><span class="label">Instagram</span></a></li>
                                    <li><a href="#" class="icon brands style2 fa-dribbble"><span class="label">Dribbble</span></a></li>
                                    <li><a href="#" class="icon brands style2 fa-github"><span class="label">GitHub</span></a></li>
                                    <li><a href="#" class="icon brands style2 fa-500px"><span class="label">500px</span></a></li>
                                    <li><a href="#" class="icon solid style2 fa-phone"><span class="label">Phone</span></a></li>
                                    <li><a href="#" class="icon solid style2 fa-envelope"><span class="label">Email</span></a></li>
                                </ul>
                            </section>
                            <ul class="copyright">
                                <li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                            </ul>
                        </div>
                    </footer>
 -->
            </div>
        
        
        
        
        
        
        

    
<!-- 삭제 -->

        </body>
    </div>
    
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
        loadedPage += 1;
        $(document).ready(function () {
            
            let param = {   "choice": null, 
                            "search": null,
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


<!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
    
    
    
</body>
</html>