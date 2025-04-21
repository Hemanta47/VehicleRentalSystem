<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>User Profile</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userprofile.css">
	<script src="https://kit.fontawesome.com/a63c128ded.js" crossorigin="anonymous"></script>
</head>
<body>

	<jsp:include page="./component/header.jsp" />

	<div class="profile-container">
		<h2>User Profile</h2>

		<!-- ✅ Status Message -->
		<c:if test="${param.status == 'updated'}">
			<p class="success">✅ Profile updated successfully!</p>
		</c:if>
		<c:if test="${param.status == 'failed'}">
			<p class="error">❌ Failed to update profile. Please try again.</p>
		</c:if>

		<!-- Static User Details -->
		<div id="profileView">
			<p><strong>First Name:</strong> ${user.fname}</p>
			<p><strong>Last Name:</strong> ${user.lname}</p>
			<p><strong>Date of Birth:</strong> ${user.dob}</p>
			<p><strong>Phone:</strong> ${user.phone}</p>
			<p><strong>Email:</strong> ${user.email}</p>
			<p><strong>Password:</strong> ********</p>

			<button id="editBtn" onclick="toggle()">Edit</button>
		</div>

		<!-- Edit Profile Form -->
		<form id="profileForm" method="POST"
			  action="${pageContext.request.contextPath}/userUpdate"
			  style="display: none;">

			<!-- ✅ Hidden Fields -->
			<input type="hidden" name="username" value="${user.uName}" />
			<input type="hidden" name="role" value="${user.role}" />

			<label>First Name:</label>
			<input type="text" name="fname" value="${user.fname}" required />

			<label>Last Name:</label>
			<input type="text" name="lname" value="${user.lname}" required />

			<label>Date of Birth:</label>
			<input type="date" name="dob" value="${user.dob}" required />

			<label>Phone:</label>
			<input type="text" name="phone" value="${user.phone}" required />

			<label>Email:</label>
			<input type="email" name="email" value="${user.email}" required />

			<label>Password:</label>
			<input type="password" name="password" value="${user.password}" required />

			<button type="submit">Update</button>
		</form>

		<!-- Delete Account -->
		<form method="POST"
			  action="${pageContext.request.contextPath}/delete-account"
			  onsubmit="return confirm('Are you sure you want to delete your account?');">
			<input type="hidden" name="username" value="${user.uName}" />
			<button type="submit" class="danger-btn">Delete Account</button>
		</form>
	</div>

	<script>
		const profileForm = document.querySelector("#profileForm");
		function toggle() {
			profileForm.style.display = profileForm.style.display === "none" ? "block" : "none";
		}
	</script>
</body>
</html>
