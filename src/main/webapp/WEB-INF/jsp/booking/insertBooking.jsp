<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h2 class="text-center font-weight-bold m-4">예약하기</h2>
<div class="reservation-box">
	<div class="form-group">
		<label for="name">이름</label>
		<input type="text" id="name" class="form-control" placeholder="예) 홍길동">
		<small id="noNameText" class="text-danger d-none">이름을 입력하세요</small>
		<small id="wrongNameText" class="text-danger d-none">이름 형식을 지켜주세요</small>
	</div>
	<div class="form-group">
		<label for="date">예약날짜</label>
		<input type="text" id="date" class="form-control" placeholder="예) 2023-01-01">
		<small id="noDateText" class="text-danger d-none">예약날짜를 입력하세요</small>
		<small id="wrongDateText" class="text-danger d-none">예약날짜 형식을 지켜주세요</small>
	</div>
	<div class="form-group">
		<label for="day">숙박일수</label>
		<input type="text" id="day" class="form-control" placeholder="예) 3">
		<small id="noDayText" class="text-danger d-none">숙박일수를 입력하세요</small>
		<small id="wrongDayText" class="text-danger d-none">숙박일수 형식을 지켜주세요</small>
	</div>
	<div class="form-group">
		<label for="headcount">숙박인원</label>
		<input type="text" id="headcount" class="form-control" placeholder="예) 5">
		<small id="noHeadcountText" class="text-danger d-none">숙박인원을 입력하세요</small>
		<small id="wrongHeadcountText" class="text-danger d-none">숙박인원 형식을 지켜주세요</small>
	</div>
	<div class="form-group">
		<label for="phoneNumber">전화번호</label>
		<input type="text" id="phoneNumber" class="form-control" placeholder="예) 010-1234-5678">
		<small id="noPhoneNumberText" class="text-danger d-none">전화번호를 입력하세요</small>
		<small id="wrongPhoneNumberText" class="text-danger d-none">전화번호 형식을 지켜주세요</small>
	</div>
	<button type="button" id="addBookingBtn" class="btn btn-warning w-100">예약하기</button>
</div>

<script>
	$(document).ready(function() {
		$('#date').datepicker({
			dateFormat: "yy-mm-dd"
			, showMonthAfterYear: true
			, yearSuffix: "년"
			, monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			, dayNamesMin: ['일','월','화','수','목','금','토']
		});
		
		$('#addBookingBtn').on('click', function() {
			let name = $('#name').val().trim();
			let date = $('#date').val();
			let day = $('#day').val();
			let headcount = $('#headcount').val();
			let phoneNumber = $('#phoneNumber').val();
			
			let nameFormat = /^[가-힣]{2,15}$/;
			let dateFormat = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
			let phoneNumberFormat = /^010-[0-9]{4}-[0-9]{4}$/;
			
			if (name == '') {
				$('#wrongNameText').addClass("d-none");
				$('#noNameText').removeClass("d-none");
				return;
			} else {
				$('#noNameText').addClass("d-none");
			}
			
			if (nameFormat.test(name) == false) {
				$('#noNameText').addClass("d-none");
				$('#wrongNameText').removeClass("d-none");
				return;
			} else {
				$('#wrongNameText').addClass("d-none");
			}
			
			if (date == '') {
				$('#wrongDateText').addClass("d-none");
				$('#noDateText').removeClass("d-none");
				return;
			} else {
				$('#noDateText').addClass("d-none");
			}
			
			if (dateFormat.test(date) == false) {
				$('#noDateText').addClass("d-none");
				$('#wrongDateText').removeClass("d-none");
				return;
			} else {
				$('#wrongDateText').addClass("d-none");
			}
			
			if (day == '') {
				$('#wrongDayText').addClass("d-none");
				$('#noDayText').removeClass("d-none");
				return;
			} else {
				$('#noDayText').addClass("d-none");
			}
			
			if (isNaN(day)) {
				$('#noDayText').addClass("d-none");
				$('#wrongDayText').removeClass("d-none");
				return;
			} else {
				$('#wrongDayText').addClass("d-none");
			}
			
			if (headcount == '') {
				$('#wrongHeadcountText').addClass("d-none");
				$('#noHeadcountText').removeClass("d-none");
				return;
			} else {
				$('#noHeadcountText').addClass("d-none");
			}
			
			if (isNaN(headcount)) {
				$('#noHeadcountText').addClass("d-none");
				$('#wrongHeadcountText').removeClass("d-none");
				return;
			} else {
				$('#wrongHeadcountText').addClass("d-none");
			}
			
			if (phoneNumber == '') {
				$('#wrongPhoneNumberText').addClass("d-none");
				$('#noPhoneNumberText').removeClass("d-none");
				return;
			} else {
				$('#noPhoneNumberText').addClass("d-none");
			}
			
			if (phoneNumberFormat.test(phoneNumber) == false) {
				$('#noPhoneNumberText').addClass("d-none");
				$('#wrongPhoneNumberText').removeClass("d-none");
				return;
			} else {
				$('#wrongPhoneNumberText').addClass("d-none");
			}
			
			$.ajax({
				type:"POST"
				, url:"/booking/add_booking"
				, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
				
				, success:function(data) {
					alert("예약 성공");
					
					if (data.code == 1) {
						location.href="/booking/booking_list_view";
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