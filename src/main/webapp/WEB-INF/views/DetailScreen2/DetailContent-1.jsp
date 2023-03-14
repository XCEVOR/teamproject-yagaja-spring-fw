<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
<title>Document</title>
<style>
#container {
	display: flex;
	justify-content: space-between;
	width: 90%;
	flex-wrap: wrap;
	margin: 100px;
}

#snsBox {
	background-color: royalblue;
	margin-right: 150px;
	width: 20%;
	height: 500px;
}

#hashtagBox {
	background-color: aquamarine;
	width: 80%;
	height: 400px;
}

#tableBox {
	width: 80%;
	height: 500px;
}

.center {
	text-align: center;
}

td {
	width: 10%;
}
</style>
</head>
<body>

	<h2 style="text-align: center; margin-top: 50px;">세부 일정 표</h2>
	<div id="container">


		<div class="tableBox">
			<table class="alt">
				<thead>
					<tr>
						<th class="center">월</th>
						<th class="center">화</th>
						<th class="center">수</th>
						<th class="center">목</th>
						<th class="center">금</th>
						<th class="center">토</th>
						<th class="center">일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<!-- 월 -->
						<td>스케줄 ..</td>

						<!-- 화 -->
						<td>스케줄 ..</td>

						<!-- 수-->
						<td>스케줄 ..</td>


						<!-- 목 -->
						<td>스케줄 ..</td>


						<!-- 금 -->
						<td>스케줄 ..</td>

						<!-- 토 -->
						<td>스케줄 ..</td>

						<!-- 일 -->
						<td>스케줄 ..</td>

					</tr>
					
					<tr>
						<!-- 월 -->
						<td>스케줄 ..</td>

						<!-- 화 -->
						<td>스케줄 ..</td>

						<!-- 수-->
						<td>스케줄 ..</td>


						<!-- 목 -->
						<td>스케줄 ..</td>


						<!-- 금 -->
						<td>스케줄 ..</td>

						<!-- 토 -->
						<td>스케줄 ..</td>

						<!-- 일 -->
						<td>스케줄 ..</td>

					</tr>

				</tbody>

			</table>


		</div>

	</div>

</body>
</html>