<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%
	MemberDto login = (MemberDto)session.getAttribute("login");

%>


<%
	String choice = (String)request.getAttribute("choice");
	String search = (String)request.getAttribute("search");
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body class="is-preload">





	<div>
		<body >
			<!-- Wrapper -->
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

				<!-- Menu -->
				<nav id="menu">
					<h2>Menu</h2>
					<ul>
						<li><a href="detail1.do">detail1.do</a></li>
						<li><a href="detail2.do">detail2.do</a></li>
						<li><a href="login.do">login.do</a></li>
						<li><a href="main.do">main.do</a></li>
						<li><a href="qna.do">qna.do</a></li>
						<li><a href="qnawr.do">qnawr.do</a></li>
						<li><a href="signup.do">signup.do</a></li>
						<li><a href="my.do">my.do</a></li>
						<li><a href="update.do?seq=1">update.do?seq=1</a></li>
						<li><a href="write.do">write.dos</a></li>
						
					
					</ul>
				</nav>
			</div>






	<div>
        <table style = "table-layout: auto; width: 80%; table-layout: fixed;" >
        <colgroup> 
            <col width="12%" />
            <col width="50%" /> 
            <col width="15%" /> 
            <col width="15%" />
        </colgroup>
            <tr>
                <!-- <th>
               <a href="main.do" class="logo">
                        <span class="symbol"><img src="images/logo.svg" alt="" /></span><span class="title">YAGAJA</span>
                    </a> 
                </th>-->
            	<td style="padding-left: 3px">
					<select class="custom-select" id="choice" name="choice">
						<option selected>검색</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</select>
				</td>
				<td style="padding-left: 5px" class="align-middle">
					<input type="text" class="form-control" id="search" name="search" onkeyup="enterKeyEvent()" placeholder="검색어" value="<%= search %>">
				</td>
				<td style="padding-left: 5px">
					<span>
						<button type="button" class="btn btn-primary" onclick="searchBtn()">검색</button>
					</span>
				</td>
                <th>
	                <%
						if(login == null) {
						    %><button type="button" onclick="location.href='login.do'">로그인</button><%
						} else {
						    %><button type="button" onclick="location.href='logout.do'">로그아웃</button><%
						}
					%>
                </th>
                <th>
                    <%
                        if(login == null) {
                            %><button type="button" onclick="location.href='signup.do'">회원가입</button><%
                        } else {
                            %><button type="button" onclick="location.href='my.do'">마이페이지</button><%
                        }
                    %>
                </th>

            </tr>

            
        </table>
    </div>

    
  
 

		</body>
	</div>
	


		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>


<script type="text/javascript">
	let search = "<%= search %>";
	console.log("search = " + search);
	if(search != ""){
		let obj = document.getElementById("choice");
		obj.value = "<%= choice %>";
		obj.setAttribute("selected", "selected");
	}
	
	function searchBtn() {
		let choice = document.getElementById('choice').value;
		let search = document.getElementById('search').value;
		
		if(choice == ""){
			alert("카테고리를 선택해 주십시오");
			return;
		}
		if(search.trim() == ""){
			alert("검색어를 선택해 주십시오");
			return;
		}
		
		location.href = "mainsearch.do?choice=" + choice + "&search=" + search;
	}
	
</script>

</body>
</html>