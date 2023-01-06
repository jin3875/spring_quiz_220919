<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="favorite" items="${favoriteList}">
				<tr>
					<td>${favorite.id}</td>
					<td>${favorite.name}</td>
					<td><a href="${favorite.url}">${favorite.url}</a></td>
					<td>
						<%-- 1) name속성 + value속성 삭제 --%>
						<%-- <button type="button" name="delBtn" class="btn btn-danger" value="${favorite.id}">삭제</button> --%>
						
						<%-- 2) data를 이용해서 태그에 임시 저장하기 --%>
						<button type="button" class="del-btn btn btn-danger" data-favorite-id="${favorite.id}">삭제</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
		$(document).ready(function() {
			// 1) name속성 + value속성 삭제
			// $('button[name=delBtn]').on('click', function(e) {
				// let id = $(this).val(); // 1-1)
				// let id = $(this).attr('value'); // 1-2)
				// let id = e.target.value; // 1-3)
			// });
			
			// 2) data를 이용해서 태그에 임시 저장하기
			// data-이름 (대문자 절대 안됨)
			// 태그 : data-favorite-id
			// 스크립트 : $(this).data('favorite-id');
			$('.del-btn').on('click', function() {
				let id = $(this).data('favorite-id');
				
				$.ajax({
					type:"DELETE"
					, url:"/lesson06/quiz02/delete_favorite"
					, data:{"id":id}
					
					, success:function(data) {
						if (data.code == 1) {
							location.reload(); // 새로고침 + 스크롤 고정
							// 안될 경우
							// location.reload(true);
							// window.location.reload(true);
							// document.location.reload(true);
						} else if (data.code == 500) {
							alert(data.error_message);
						}
					}
					, error:function(e) {
						alert("실패 " + e);
					}
				});
			});
		});
	</script>
</body>
</html>