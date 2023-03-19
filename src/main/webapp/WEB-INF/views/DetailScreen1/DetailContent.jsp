<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


	<style>
	* {margin:0;padding:0;}
	.section input[id*="slide"] {display:none;}
	.section .slidewrap {max-width:1200px;margin:0 auto;}
	.section .slidelist {white-space:nowrap;font-size:0;overflow:hidden;position:relative;}
	.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s;}
	.section .slidelist > li > a {display:block;position:relative;}
	.section .slidelist > li > a img {width:100%;}
	.section .slidelist label {position:absolute;z-index:10;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
	.section .slidelist .textbox {position:absolute;z-index:1;top:50%;left:50%;transform:translate(-50%,-50%);line-height:1.6;text-align:center;}
	.section .slidelist .textbox h3 {font-size:36px;color:#fff;;transform:translateY(30px);transition:all .5s;}
	.section .slidelist .textbox p {font-size:16px;color:#fff;opacity:0;transform:translateY(30px);transition:all .5s;}
	
	/* input에 체크되면 슬라이드 효과 */
	.section input[id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
	.section input[id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
	.section input[id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}

	/* input에 체크되면 텍스트 효과 */
	.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
	.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
	.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}

	/* 좌,우 슬라이드 버튼 */
	.slide-control > div {display:none;}
	.section .left {left:30px;background:url('./img/left.png') center center / 100% no-repeat;}
	.section .right {right:30px;background:url('./img/right.png') center center / 100% no-repeat;}
	.section input[id="slide01"]:checked ~ .slidewrap .slide-control > div:nth-child(1) {display:block;}
	.section input[id="slide02"]:checked ~ .slidewrap .slide-control > div:nth-child(2) {display:block;}
	.section input[id="slide03"]:checked ~ .slidewrap .slide-control > div:nth-child(3) {display:block;}

	/* 페이징 */
	.slide-pagelist {text-align:center;padding:20px;}
	.slide-pagelist > li {display:inline-block;vertical-align:middle;}
	.slide-pagelist > li > label {display:block;padding:8px 30px;border-radius:30px;background:#ccc;margin:20px 10px;cursor:pointer;}
	.section input[id="slide01"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(1) > label {background:#999;}
	.section input[id="slide02"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(2) > label {background:#999;}
	.section input[id="slide03"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(3) > label {background:#999;}
	</style>
	
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

					<div class="section">
						<input type="radio" name="slide" id="slide01" checked> <input
							type="radio" name="slide" id="slide02"> <input
							type="radio" name="slide" id="slide03">
						<div class="slidewrap">

							<ul class="slidelist">
								<!-- 슬라이드 영역 -->
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

								<!-- 좌,우 슬라이드 버튼 -->
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
							<!-- 페이징 -->
							<ul class="slide-pagelist">
								<li><label for="slide01"></label></li>
								<li><label for="slide02"></label></li>
								<li><label for="slide03"></label></li>
							</ul>
						</div>


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
							<td>dto</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>dto</td>
						</tr>
						<tr>
							<td align="center" colspan="2"
								style="font-size: 16px; font-weight: bold;">내용</td>
						</tr>
						<tr>
							<td colspan="2" height=300px style="background-color: white;">
								<pre
									style="font-size: 20px; font-family: 고딕, arial; background-color: white">dto내용 </pre>
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
</body>
</html>
