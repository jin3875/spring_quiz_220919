<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="display-4 mt-3 mb-3">우리동네 가게</div>
<c:forEach var="store" items="${storeList}">
<div class="store border border-info rounded mt-3 mb-3 p-3">
	<a href="/lesson05/store_review_view?storeId=${store.id}&storeName=${store.name}">
		<h4>${store.name}</h4>
		<h6>전화번호 : ${store.phoneNumber}</h6>
		<h6>주소 : ${store.address}</h6>
	</a>
</div>
</c:forEach>