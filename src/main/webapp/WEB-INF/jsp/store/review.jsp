<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="display-4 mt-3 mb-3">${storeName} - 리뷰</div>
<c:choose>
	<c:when test="${!empty reviewList}">
		<c:forEach var="review" items="${reviewList}">
		<div class="border border-info rounded mt-3 mb-3 p-3">
			<div class="d-flex">
			<h5 class="font-weight-bold mr-3">${review.userName}</h5>
			<c:forEach begin="0" end="4" step="1" var="count">
				<c:choose>
					<c:when test="${review.point >= 1}">
						<img src="/img/lesson05/star_fill.png" alt="별 1개" width="20" height="20">
					</c:when>
					<c:when test="${review.point eq 0.5}">
						<img src="/img/lesson05/star_half.png" alt="별 0.5개" width="20" height="20">
					</c:when>
					<c:otherwise>
						<img src="/img/lesson05/star_empty.png" alt="별 0개" width="20" height="20">
					</c:otherwise>
				</c:choose>
				<c:out value="<script>${review.point = review.point - 1}</script>" escapeXml="false" />
			</c:forEach>
			</div>
			<div class="text-secondary">
				<fmt:formatDate value="${review.createdAt}" pattern="yyyy년 M월 d일" />
			</div>
			<h5 class="mt-2">${review.review}</h5>
			<span class="review">${review.menu}</span>
		</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="m-5">
			<h1 class="font-weight-bold">작성된 리뷰가 없습니다.</h1>
		</div>
	</c:otherwise>
</c:choose>