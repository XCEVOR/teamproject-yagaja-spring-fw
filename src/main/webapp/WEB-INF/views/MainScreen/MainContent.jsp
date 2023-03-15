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
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
</head>
<body>

    <h1>MAIN CONTENT (테스트)</h1>
    <div id="wrapper">
	    <div id="main">
	        <input type="text" id="testinput" value="" placeholder="아이디 입력 (테스트)">
	        <button type="button" onclick="myBtn()">분류</button>
	        <div class="inner">
	            <div class="container1"></div>
                <section class="tiles">
                
	<%
	    for(int i = 0;i < blist.size(); i++)
	    {
	        BbsDto bdto = blist.get(i);
	        %>
	            <article class="style1">
	                <span class="image">
	                    <img src="images/mainpage/pic01.jpg" alt="" />
	                </span>
	                <a href="generic.html">
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
        
<!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
    
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
</script>
</body>
</html>