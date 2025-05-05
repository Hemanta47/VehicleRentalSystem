<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>Cart - FleetX</title>
<link rel="stylesheet" href="${contextPath}/css/global.css" />
<link rel="stylesheet" href="${contextPath}/css/header.css" />
<script src="https://kit.fontawesome.com/a63c128ded.js"
	crossorigin="anonymous"></script>
</head>
<style>
.container {
	display: flex;
	padding: 2rem;
	gap: 2rem;
	color: var(--black);
}

.cart-items {
	flex: 3;
	background: #fff;
	padding: 1rem;
	border-radius: 10px;
}

.cart-item {
	display: flex;
	align-items: center;
	margin-bottom: 1rem;
	border-bottom: 1px solid #eee;
	padding-bottom: 1rem;
}

.cart-item img {
	width: 120px;
	height: auto;
	border-radius: 8px;
	margin-right: 1rem;
}

.item-info {
	flex-grow: 1;
}

.remove-btn {
	background: transparent;
	border: none;
	color: red;
	font-size: 20px;
	cursor: pointer;
}

.item-price {
	font-weight: bold;
}

.cart-summary {
	flex: 1;
	background: #fff;
	padding: 1rem;
	border-radius: 10px;
	height: fit-content;
}

.summary-row {
	display: flex;
	justify-content: space-between;
	margin-bottom: 0.5rem;
}

.checkout-btn {
	width: 100%;
	background: #000;
	color: #fff;
	border: none;
	padding: 0.75rem;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	margin-top: 1rem;
}
</style>
<body>
	<jsp:include page="./component/header.jsp" />

	<c:set var="total" value="0" />
	<c:forEach var="item" items="${cart}">
		<c:set var="days"
			value="${(item.endDate.time - item.startDate.time) / (1000*60*60*24) + 1}" />
		<c:set var="itemTotal" value="${item.dailyRate * days}" />
		<c:set var="total" value="${total + itemTotal}" />
	</c:forEach>

	<c:set var="discount" value="${total * 0.1}" />
	<c:set var="grandTotal" value="${total - discount}" />

	<div class="container">
		<!-- Left: Cart Items -->
		<div class="cart-items">
			<h2>Cart Items</h2>
			<c:forEach var="item" items="${cart}">
				<c:set var="days"
					value="${(item.endDate.time - item.startDate.time) / (1000*60*60*24) + 1}" />
				<c:set var="itemTotal" value="${item.dailyRate * days}" />

				<div class="cart-item">
					<img src="${contextPath}/assets/vehicle/${item.imageUrl}"
						alt="${item.brand} ${item.model}">
					<div class="item-info">
						<p>
							<strong>${item.brand} ${item.model}</strong>
						</p>
						<p>
							From:
							<fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd" />
						</p>
						<p>
							To:
							<fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd" />
						</p>
						<p>Days: ${days}</p>
						<p class="item-price">Rs. ${item.dailyRate}/day</p>
						<p>Total: Rs. ${itemTotal}</p>
					</div>
					<form method="post" action="${contextPath}/removeFromCart">
						<input type="hidden" name="vehicleId" value="${item.vehicleId}" />
						<button class="remove-btn" title="Remove">&#10006;</button>
					</form>
				</div>
			</c:forEach>

			<c:if test="${empty cart}">
				<p>Your cart is empty.</p>
			</c:if>
		</div>

		<!-- Right: Summary -->
		<div class="cart-summary">
			<h2>Summary</h2>
			<div class="summary-row">
				<span>Total</span> <span>Rs. <fmt:formatNumber
						value="${total}" type="number" /></span>
			</div>
			<div class="summary-row">
				<span>Discount (10%)</span> <span>- Rs. <fmt:formatNumber
						value="${discount}" type="number" /></span>
			</div>
			<hr>
			<div class="summary-row" style="font-weight: bold;">
				<span>Grand Total</span> <span>Rs. <fmt:formatNumber
						value="${grandTotal}" type="number" /></span>
			</div>
			<button class="checkout-btn">Proceed to Payment</button>
		</div>
	</div>
</body>
</html>
