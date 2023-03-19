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
            outline: 5px solid black;
        }
        
        .right-Layout {
            display: flex;
            flex-direction: column;
            flex-basis: 50%;
            outline: 5px solid black;
        }
        
        .top-left-Layout {
            display: flex;
            flex-direction: row;
            flex-basis: 80%;
            border-bottom: 1px solid #ccc;
            outline: 5px solid black;
        }
        
        .bottom-left-Layout {
            display: flex;
            flex-direction: row;
            flex-basis: 20%;
            outline: 5px solid black;
        }
        
        .top-right-Layout {
            display: flex;
            flex-direction: row;
            flex-basis: 30%;
            border-bottom: 1px solid #ccc;
            outline: 5px solid black;
        }
        
        .bottom-right-Layout {
            display: flex;
            flex-direction: row;
            flex-basis: 70%;
            outline: 5px solid black;
        }
        /* 
        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        li {
            padding: 10px;
            border-bottom: 1px solid #ccc;
         */
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">


</head>
<body>
    <div class="container-Layout">
        <div class="left-Layout">
            <div class="top-left-Layout">
                <ul>
                <!-- ########## 슬라이드 ########## ########## ########## ########## ########## ########## ########## ########## ##########  -->
<button type="button" onclick="testButton()">testButton</button>
<button type="button" onclick="labelButton()">labelButton</button>

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
                            <div class="row">
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
                            </div>
                        </div>
                    </div>
                </ul>
            </div>
        </div>
        <div class="right-Layout">
            <div class="top-right-Layout">
                <ul>
                <!-- ########## 게시글 ########## ########## ########## ########## ########## ########## ########## ########## ##########  -->

                    <h3>게시글 내용</h3>








                    <table class="table table-striped table-sm">
                        <colgroup>
                            <col style="width: 150px" />
                            <col style="width: 500px" />
                        </colgroup>

                        <tr>
                            <th>작성자</th>
                            <td><%= allBbsPostList.get(0).getId() %></td>
                        </tr>
                        <tr>
                            <th>작성일</th>
                            <td><%= allBbsPostList.get(0).getWdate() %></td>
                        </tr>
                        <tr>
                        
                            <td align="center" colspan="2"
                                style="font-size: 16px; font-weight: bold;"></td>
                        </tr>
                        <tr>
                            <td colspan="2" height=300px style="background-color: white;">
                                <pre
                                    style="font-size: 20px; font-family: 고딕, arial; background-color: white"><%= allBbsPostList.get(0).getContent() %></pre>
                            </td>
                        </tr>
                    </table>

                    <a href="admin.do">수정</a>

                    <a href="admin.do">삭제</a>
                    <a href="detail2.do">일정확인</a>
                </ul>
            </div>
            <div class="bottom-right-Layout">
                <ul>
                <!-- ########## 댓글 ########## ########## ########## ########## ########## ########## ########## ########## ##########  -->

                    <h3>댓글작성</h3>

                    <table>
                        <col width="200">
                        <col width="500">
                        <col width="100">

                        <tr>
                            <th>댓글쓰기</th>
                            <td><input type="text" name="content" size="50"></td>
                            <td colspan="2" align="center"><input type="submit"
                                value="작성완료"></td>
                        </tr>

                    </table>

                    <h3>댓글리스트</h3>

                    <table border="1">
                        <col width="50">
                        <col width="500">
                        <col width="100">
                        <tr>
                            <th>번호</th>
                            <th>아이디</th>
                            <th>내용</th>
                        </tr>

                        <tr>
                            <td>dto.seq</td>
                            <td>dto.id</td>
                            <td>dto.content</td>
                        </tr>
                        <tr>
                            <td>dto.seq</td>
                            <td>dto.id</td>
                            <td>dto.content</td>
                        </tr>

                    </table>



                    <!-- 댓글 검색 -->
                    <table
                        style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px">
                        <tr>
                            <td style="padding-left: 5px"><select class="custom-select"
                                id="choice" name="choice">
                                    <option selected>검색</option>
                                    <option value="content">내용</option>
                                    <option value="writer">아이디</option>
                            </select></td>
                            <td style="padding-left: 5px" class="align-middle"><input
                                type="text" class="form-control" id="search" name="search"
                                onkeyup="enterKeyEvent()" placeholder="검색어">
                            <td style="padding-left: 5px"><span>
                                    <button type="button" class="btn btn-primary"
                                        onclick="searchBtn()">검색</button>
                            </span></td>
                        </tr>
                    </table>

                </ul>
            </div>
        </div>
    </div>
    
    
<script type="text/javascript">
    let bbsseq = <%= allBbsPostList.get(0).getBbsseq() %>
    console.log("@ bbsseq: " + bbsseq);
//    function testButton() {
        $(document).ready(function () {
            $.ajax({
                url: "ajaxDetail1.do",
                type: "GET",
                data: { "bbsseq":bbsseq },
                success: function (bbsPostList) {
                    // alert(list);
                    console.log(bbsPostList);
                    /* $("#mysection").html(""); */
                    
                    let slidtags = "";
                    
                    $.each(bbsPostList, function(index, item){
                        slidtags += "<input type='radio' name='slide' id='slide0" + (index + 1) + "'>" 
                        //$("#ajaxSlidelist").append(slidtags);
                    });
                    
                        slidtags += "<div class='slidewrap'>   <ul class='slidelist'>   ";
                        //$("#ajaxSlidelist").append(slidtags);
                    
                    $.each(bbsPostList, function(index, item){
                        slidtags += "<li class='slideitem'><a>" 
                                    + "     <div class='textbox'>"
                                    + "             <h3>첫번째 슬라이드</h3>"
                                    + "             <p>첫번째 슬라이드 입니다.</p>"
                                    + "     </div> <img src='upload/" + item.newfilename + "'>"
                                    + "</a></li>";
                                    
                        //$("#ajaxSlidelist").append(slidtags);
                    });
                    
                        slidtags += "</ul>   <ul class='slide-pagelist'>";
                        //$("#ajaxSlidelist").append(slidtags);
                        
                    $.each(bbsPostList, function(index, item){
                        slidtags += "<li><label class='labelList' for='slide0" + (index + 1) + "'></label></li>" ;
                        //$("#ajaxSlidelist").append(slidtags);
                    });
                    
                        slidtags += "</div>";
                        $("#ajaxSlidelist").append(slidtags).trigger("create");
                        

                        
                        
                        
                        
                        
                        let detailText = "";
                        
                        $.each(bbsPostList, function(index, item){
                            detailText += "<input type='radio' name='slide' id='slide0" + (index + 1) + "'>" 
                            //$("#ajaxSlidelist").append(slidtags);
                        });
                        
                        detailText += "<div class='slidewrap'>   <ul class='slidelist'>   ";
                            //$("#ajaxSlidelist").append(slidtags);
                        
                        $.each(bbsPostList, function(index, item){
                            detailText += "<li class='slideitem'><a>" 
                                        + "     <div class='textbox'>"
                                        + "             <h3>" + item.title + "</h3>"
                                        + "             <p>첫번째 슬라이드 입니다.</p>"
                                        + "     </div> <img src='upload/" + item.newfilename + "'>"
                                        + "</a></li>";
                                        
                            //$("#ajaxSlidelist").append(slidtags);
                        });
                        
                        detailText += "</ul>   <ul class='slide-pagelist'>";
                            //$("#ajaxSlidelist").append(slidtags);
                            
                        $.each(bbsPostList, function(index, item){
                            detailText += "<li><label class='labelList' for='slide0" + (index + 1) + "'></label></li>" ;
                            //$("#ajaxSlidelist").append(slidtags);
                        });
                        
                        detailText += "</div>";
                            $("#ajaxDetail1Content").append(detailText).trigger("create");
                        
                },
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
    
            

        });
//func    }
    
    function labelButton () {
        //let label_list = document.getElementByClassName("labelList");
        //console.log(label_list[0].getAttribute("for"));
        var label = document.querySelectorAll('label.labelList');
        console.log(label);
        var forValue = label[1].getAttribute('for');
        console.log(forValue);
    }
    
    const labelList = document.querySelectorAll('label.labelList');

    labelList.addEventListener('click', function() {
      const forValue = this.getAttribute('for');
      console.log(forValue);
    });
    
    $("label[class=labelList]").click(function () {
        var result = $(this).attr("for");
        console.log("aaaa");
    })
     
    
    
document.addEventListener('DOMContentLoaded', function() {
  // Get all label elements with class 'labelList'
  var labels = document.querySelectorAll('label.labelList');
  
  // Add click event listener to each label element
  labels.forEach(function(label) {
    label.addEventListener('click', function() {
      // Get the 'for' attribute value of the clicked label element
      var forValue = this.getAttribute('for');
      
      // Log the for value to the console
      console.log(forValue);
    });
  });
});


    




</script>
    
</body>
</html>
