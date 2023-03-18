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
</head>
<body>


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

    
    
    <br>
    <a><font color="red"><strong>
	    <%
	    if(login == null) {
	        // handle the case when there is no login data in session
	        // for example, redirect to the login page or display a message
	        %>GUEST ..........<%
	      } else {
	        // continue with the login data
	        %>LOGIN NICKNAME: <%= login.getNickname() %> ..........<%
	      }
	    %>
    </strong></a>
    <a href="admin.do">admin.do</a>
    <a href="detail1.do">detail1.do</a>
    <a href="detail2.do">detail2.do</a>
    <a href="login.do">login.do</a>
    <a href="main.do">main.do</a>
    <a href="qna.do">qna.do</a>
    <a href="qnawr.do">qnawr.do</a>
    <a href="signup.do">signup.do</a>
	<a href="my.do">my.do</a>
    <a href="update.do?seq=7">update.do</a>
    <a href="write.do">write.do</a>



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
		
		/* if(choice == ""){
			alert("카테고리를 선택해 주십시오");
			return;
		} */
		/* 
		if(search.trim() == ""){
			alert("검색어를 선택해 주십시오");
			return;
		} */
		
		location.href = "mainsearch.do?choice=" + choice + "&search=" + search;
	}
	
</script>

</body>
</html>