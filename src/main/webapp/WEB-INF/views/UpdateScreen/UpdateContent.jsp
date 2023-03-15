<%@page import="mul.cam.a.dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%
    BbsDto dto = (BbsDto)request.getAttribute("dto");
    System.out.println(dto.toString());
%>   

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/mainpage.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
<link rel="stylesheet" href="assets/css/layout.css" />

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
</head>
<body>

    <h1>UPDATE CONTENT</h1>

    <div>

        <form action="bbsupdateAf.do" id="frm" method="get">
            <input type="hidden" name="seq" value="<%= dto.getSeq() %>" >
            
            <table>
            <col width="100px"><col width="500px">
            
                <tr>
                    <th>아이디</th>
                    <td>        
                        <%= dto.getId() %>
                        <input type="hidden" id="id" name="id" value="<%= dto.getId() %>">       
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>
                        <input type="text" id="title" name="title" size="50px" value="<%= dto.getTitle() %>">
                    </td>
                </tr>
                <tr>
                    <td><p id="dateId"><input id="datepicker" type="text" id="datepicker" placeholder="일정 등록"></p></td>
                    <td>
                        
                    </td>
                </tr>
                <tr>    
                    <td colspan="2">
                        <textarea rows="10" id="content" name="content"><%= dto.getContent() %></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
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
                    </td>
                </tr>
                
                
                <tr>
                    <td colspan="2" align="right" style="padding-top: 20px">
                        <button type="submit">글수정 완료</button>
                    </td>
                </tr>

            
            </table>
        </form>
        
    </div>
    
    
<script type="text/javascript">
    $(document).ready(function() {  
        $("button").click(function() {      
            if($("#title").val().trim() == "" ){
                alert("제목을 기입해 주십시오");
                return;
            }else if($("#content").val().trim() == "" ){
                alert("내용을 기입해 주십시오");
                return;
            }else{
                $("#frm").submit();
            }       
        }); 
    });
</script>
</body>
</html>