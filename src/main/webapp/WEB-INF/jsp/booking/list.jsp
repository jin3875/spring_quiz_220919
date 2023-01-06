<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="d-flex justify-content-center">
	<h2 class="font-weight-bold mt-3 mb-3">예약 목록 보기</h2>
</div>
<table class="table text-center">
	<thead>
		<tr>
			<th>이름</th>
			<th>예약날짜</th>
			<th>숙박일수</th>
			<th>숙박인원</th>
			<th>전화번호</th>
			<th>예약상태</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="booking" items="${bookingList}">
		<tr>
			<td>${booking.name}</td>
			<td>${booking.date}</td>
			<td>${booking.day}</td>
			<td>${booking.headcount}</td>
			<td>${booking.phoneNumber}</td>
			<td>${booking.state}</td>
			<td><button type="button" class="btn btn-danger">삭제</button></td>
		</tr>
		</c:forEach>
	</tbody>
</table>