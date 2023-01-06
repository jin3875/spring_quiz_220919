<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" type="text/css" href="/css/lesson06/style.css">
</head>
<body>
	<div class="container">
		<header class="d-flex justify-content-center align-items-center">
			<jsp:include page="header.jsp" />
		</header>
		<nav>
			<jsp:include page="menu.jsp" />
		</nav>
		<section class="contents mb-3">
			<div class="d-flex justify-content-center">
				<h2 class="font-weight-bold mt-3 mb-3">예약하기</h2>
			</div>
			<div class="reservation-form">
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" id="name" class="form-control">
				</div>
				<div class="form-group">
					<label for="date">예약날짜</label>
					<input type="text" id="date" class="form-control">
				</div>
				<div class="form-group">
					<label for="day">숙박일수</label>
					<input type="text" id="day" class="form-control">
				</div>
				<div class="form-group">
					<label for="headcount">숙박인원</label>
					<input type="text" id="headcount" class="form-control">
				</div>
				<div class="form-group">
					<label for="phoneNumber">전화번호</label>
					<input type="text" id="phoneNumber" class="form-control">
				</div>
				<button type="button" class="btn btn-warning w-100">예약하기</button>
			</div>
		</section>
		<footer>
			<jsp:include page="footer.jsp" />
		</footer>
	</div>
</body>
</html>