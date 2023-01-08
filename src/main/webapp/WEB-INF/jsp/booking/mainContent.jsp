<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div>
	<img id="bannerImg" src="/img/lesson06/banner1.jpg" alt="배너" width="1110">
</div>
<div class="main-box d-flex">
	<div class="main-box-side col-4 d-flex justify-content-center align-items-center">
		<div class="display-4 text-white">
			실시간<br>예약하기
		</div>
	</div>
	<div class="main-box-center col-4">
		<div class="text-white">
			<h4 class="m-3">예약 확인</h4>
			<div class="mr-3">
				<div class="form-group input-group-sm d-flex justify-content-end align-items-center">
					<label for="name" class="mr-2 mb-0">이름:</label>
					<input type="text" id="name" class="form-control col-9" placeholder="예) 홍길동">
				</div>
				<div class="form-group input-group-sm d-flex justify-content-end align-items-center">
					<label for="phoneNumber" class="mr-2 mb-0">전화번호:</label>
					<input type="text" id="phoneNumber" class="form-control col-9" placeholder="예) 010-1234-5678">
				</div>
			</div>
			<div class="d-flex justify-content-end mr-3">
				<button type="button" id="checkBtn" class="btn btn-success">조회하기</button>
			</div>
		</div>
	</div>
	<div class="main-box-side col-4 d-flex justify-content-center align-items-center">
		<div class="text-white">
			<h4 class="font-weight-bold">예약문의:</h4>
			<h1>010-<br>0000-1111</h1>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		let bannerImgArr = ["/img/lesson06/banner1.jpg", "/img/lesson06/banner2.jpg", "/img/lesson06/banner3.jpg", "/img/lesson06/banner4.jpg"];
		let currentIndex = 1;
		
		setInterval(function() {
			$('#bannerImg').attr('src', bannerImgArr[currentIndex++]);
			
			if (currentIndex >= bannerImgArr.length) {
				currentIndex = 0;
			}
		}, 3000);
		
		$('#checkBtn').on('click', function() {
			let name = $('#name').val().trim();
			let phoneNumber = $('#phoneNumber').val().trim();
			
			$.ajax({
				type:"POST"
				, url:"/booking/get_booking"
				, data:{"name":name, "phoneNumber":phoneNumber}
				
				, success:function(data) {
					if (data.code == 1) {
						alert("이름 : " + data.name
								+ "\n날짜 : " + data.date
								+ "\n일수 : " + data.day
								+ "\n인원 : " + data.headcount
								+ "\n상태 : " + data.state);
					} else if (data.code == 500) {
						alert(data.error_message);
					}
				}
				, error:function(e) {
					alert("에러 " + e);
				}
			});
		});
	});
</script>