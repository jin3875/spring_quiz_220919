<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h3>날씨 입력</h3>
<form method="post" action="">
	<div class="m-5">
		<div class="form-group d-flex align-items-center">
			<label for="date" class="mr-2 mb-0">날짜</label>
			<input type="text" id="date" name="date" class="form-control col-3">
		</div>
		<div class="form-group d-flex align-items-center">
			<label for="weather" class="mr-2 mb-0">날씨</label>
			<select id="weather" name="weather" class="form-control col-2">
				<option>맑음</option>
				<option>구름조금</option>
				<option>흐림</option>
				<option>비</option>
			</select>
		</div>
		<div class="form-group d-flex align-items-center">
			<label for="microDust" class="mr-2 mb-0">미세먼지</label>
			<select id="microDust" name="microDust" class="form-control col-2">
				<option>좋음</option>
				<option>보통</option>
				<option>나쁨</option>
				<option>최악</option>
			</select>
		</div>
		<div class="form-group d-flex align-items-center">
			<label for="temperatures" class="mr-2 mb-0">기온</label>
			<input type="text" id="temperatures" name="temperatures" class="form-control col-3">
			<span class="input-group-text">℃</span>
		</div>
		<div class="form-group d-flex align-items-center">
			<label for="precipitation" class="mr-2 mb-0">강수량</label>
			<input type="text" id="precipitation" name="precipitation" class="form-control col-3">
			<span class="input-group-text">mm</span>
		</div>
		<div class="form-group d-flex align-items-center">
			<label for="windSpeed" class="mr-2 mb-0">풍속</label>
			<input type="text" id="windSpeed" name="windSpeed" class="form-control col-3">
			<span class="input-group-text">km/h</span>
		</div>
		<input type="submit" class="btn btn-success" value="저장">
	</div>
</form>