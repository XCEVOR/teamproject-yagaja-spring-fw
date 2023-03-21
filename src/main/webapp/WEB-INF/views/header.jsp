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
    
    if(choice == null || choice.equals("")
            || search == null || search.equals("")) {
        choice = "검색";
            search = "";
        }
%>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<style type="text/css">
header{
	display: flex;
}

nav,.logo{
	display: inline;
}

select {
	text-align-last: center;
	text-align: center;
	-ms-text-align-last: center;
	-moz-text-align-last: center;
	
}


</style>
</head>
<body>
  <body class="is-preload">

   
        <!-- Wrapper -->
        <div id="wrapper">
  
          <!-- Header -->
          <header id="header">
            <!-- Nav -->
            <nav>
              
              <ul>
                  <!-- Logo -->
                  <div style="padding: 30px;"">
                  <a href="main.do" class="logo"> <span class="symbol"><img
                      src="images/logo.svg" alt="" /></span><span class="title">YAGAJA</span>
                  </a>
                  </div>
                  <span>
                    <table  style = "table-layout: auto; width: 80%; table-layout: fixed;" >
                    <colgroup> 
                        <col width="15%" />
                        <col width="50%" /> 
                        <col width="15%" /> 
                        <col width="15%" />
                    </colgroup>
                        <tr style="background-color: white; border: 1px  solid white;">
 
                          <td>
                      <select class="custom-select" id="choice" name="choice">
                        <option selected>검색</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="writer">작성자</option>
                      </select>
                    </td>
                    <td class="align-middle">
                    <input type="text" class="form-control" id="search" name="search" onkeyup="enterKeyEvent()" placeholder="너 어디가? - 야가자" value="<%= search %>">
                    </td>
                    <td style="padding-left: 3px">
                      <span>
						<button type="button" class="btn btn-primary" onclick="searchBtn()">
                        <i class="fa fa-search" aria-hidden="true"></i></button>
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
                   
                           
            
                        </tr>
                    </table>
                    </span>
                  <li><a href="#menu">Menu</a></li>
                </ul>
              </nav>
        
        
  
          <!-- Menu -->
          <nav id="menu">
            <h2>Menu</h2>
            <ul>
            
				<%
					if(login == null) {
					    %>
					    	<li><a href="main.do">메인</a></li>
					    	<li><a href="login.do">로그인</a></li>
					    	<li><a href="signup.do">회원가입</a></li>
					    <%
					} else {
					    %>
					    	<li><a href="main.do">메인</a></li>
					    	<li><a href="write.do">게시판 작성</a></li>
					    	<li><a href="qna.do">QnA 게시판</a></li>
					    	<li><a href="my.do">마이 페이지</a></li>
					    	<li><a href="logout.do">로그아웃</a></li>
					    	<li><a href="admin.do">관리자</a></li>
					    <%
					}
	            %>
	           <!--  
	            <a href="admin.do">admin.do</a><br>
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
               -->
            
            </ul>
          </nav>

    </header>
      
  </div>
   
 </body>
 

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
				alert("카테고리를 선택해 주세요");
				return;
			}
			if(search.trim() == ""){
				alert("검색어를 입력해 주세요");
				return;
			}
		
		location.href = "mainsearch.do?choice=" + choice + "&search=" + search;
	}
	
</script>

</body>
</html>