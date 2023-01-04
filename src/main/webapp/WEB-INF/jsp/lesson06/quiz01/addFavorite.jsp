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
		<div class="mb-3">
			<label for="name">제목</label>
			<input type="text" id="name" class="form-control" placeholder="제목을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="url">주소</label>
			<input type="text" id="url" class="form-control" placeholder="주소를 입력하세요">
		</div>
		<input type="button" id="add" class="btn btn-success w-100" value="추가">
	</div>
	
	<script>
		$(document).ready(function() {
			$('#add').on('click', function() {
				// alert("클릭");
				
				let name = $('#name').val().trim();
				if (name == '') {
					alert("제목을 입력하세요");
					return false;
				}
				
				let url = $('#url').val().trim();
				if (url.length < 1) {
					alert("주소를 입력하세요");
					return false;
				}
				
				if (!(url.startsWith("http") || url.startsWith("https"))) {
					alert("http 또는 https를 입력해주세요");
					return false;
				}
				
				$.ajax({
					type:"POST"
					, url:"/lesson06/quiz01/add_favorite"
					, data:{"name":name, "url":url}
					
					, success:function(data) {
						// alert(data);
						
						location.href="/lesson06/quiz01/after_add_favorite_view"
					}
				});
			});
		});
	</script>
</body>
</html>