<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="display-4 mt-3 mb-3">${storeName} - 리뷰</div>
<c:forEach var="review" items="${reviewList}">
<div class="border border-info rounded mt-3 mb-3 p-3">
	<b>${review.userName}</b>
	${review.point}
	<div class="text-secondary">
		<fmt:formatDate value="${review.createdAt}" pattern="yyyy년 M월 d일" />
	</div>
	<h5>${review.review}</h5>
	<div>${review.menu}</div>
</div>
</c:forEach>