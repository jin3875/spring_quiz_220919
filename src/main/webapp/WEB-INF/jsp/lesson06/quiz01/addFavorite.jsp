<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가하기</h1>
		<div class="form-group mb-3">
			<label for="name">제목</label>
			<input type="text" id="name" class="form-control" placeholder="제목을 입력하세요">
		</div>
		<div class="form-group mb-3">
			<label for="url">주소</label>
			<div class="d-flex">
				<input type="text" id="url" class="form-control mr-3" placeholder="주소를 입력하세요">
				<input type="button" id="urlCheckBtn" class="btn btn-info" value="중복확인">
			</div>
			<small id="urlStatusArea"></small>
		</div>
		<input type="button" id="addFavoriteBtn" class="btn btn-success w-100" value="추가">
	</div>
	
	<script>
		$(document).ready(function() {
			$('#addFavoriteBtn').on('click', function() {
				let name = $('#name').val().trim();
				let url = $('#url').val().trim();
				let urlStatusArea = $('#urlStatusArea').html();
				
				if (name == '') {
					alert("제목을 입력하세요");
					return;
				}
				
				if (url.length < 1) {
					alert("주소를 입력하세요");
					return;
				}
				
				if (url.startsWith("http") == false && url.startsWith("https") == false) {
					alert("주소 형식이 잘못되었습니다");
					return;
				}
				
				if (urlStatusArea != '<span class="text-danger">저장 가능한 url입니다.</span>') {
					alert("중복확인을 하세요");
					return;
				}
				
				$.ajax({
					type:"POST"
					, url:"/lesson06/quiz01/add_favorite"
					, data:{"name":name, "url":url}
					
					, success:function(data) { // string json => object
						// alert(data); // [object Object]
						
						if (data.result == "성공") {
							location.href="/lesson06/quiz01/after_add_favorite_view";
						}
					}
					, error:function(e) {
						alert("에러 " + e);
					}
				});
			});
			
			$('#urlCheckBtn').on('click', function() {
				$('#urlStatusArea').empty();
				let url = $('#url').val().trim();
				
				if (url.length < 1) {
					alert("주소를 입력하세요");
					return;
				}
				
				if (url.startsWith("http") == false && url.startsWith("https") == false) {
					alert("주소 형식이 잘못되었습니다");
					return;
				}
				
				$.ajax({
					type:"GET"
					, url:"/lesson06/quiz02/is_duplication"
					, data:{"url":url}
					
					, success:function(data) {
						if (data.is_duplication) {
							$('#urlStatusArea').append('<span class="text-danger">중복된 url입니다.</span>');
							return;
						} else {
							$('#urlStatusArea').append('<span class="text-danger">저장 가능한 url입니다.</span>');
						}
					}
					, error:function() {
						alert("실패 " + e);
					}
				});
			});
		});
	</script>
</body>
</html>