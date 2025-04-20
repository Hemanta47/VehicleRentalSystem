<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <!-- Static User Details -->
    <div id="profileView">
        <p><strong>First Name:</strong> ${user.fname}</p>
        <p><strong>Last Name:</strong> ${user.lname}</p>
        <p><strong>Date of Birth:</strong> ${user.dob}</p>
        <p><strong>Phone:</strong> ${user.phone}</p>
        <p><strong>Email:</strong> ${user.email}</p>
        <p><strong>Password:</strong> ********</p>

        <button id="editBtn">Edit</button>
    </div>

    <!-- Edit Profile Form -->
    <form id="profileForm" method="POST" action="${pageContext.request.contextPath}/update-profile" style="display: none;">
        <input type="hidden" name="username" value="${user.uName}" />

        <label>First Name:</label>
        <input type="text" name="firstName" id="firstName" value="${user.fname}" disabled required />

        <label>Last Name:</label>
        <input type="text" name="lastName" id="lastName" value="${user.lname}" disabled required />

        <label>Date of Birth:</label>
        <input type="date" name="dob" id="dob" value="${user.dob}" disabled required />

        <label>Phone:</label>
        <input type="text" name="phone" id="phone" value="${user.phone}" disabled required />

        <label>Email:</label>
        <input type="email" name="email" id="email" value="${user.email}" disabled required />

        <label>Password:</label>
        <input type="password" name="password" id="password" placeholder="Enter new password" disabled />
    </form>

    <!-- Delete Account -->
    <form method="POST" action="${pageContext.request.contextPath}/delete-account" onsubmit="return confirm('Are you sure you want to delete your account?');">
        <input type="hidden" name="username" value="${user.uName}" />
        <button type="submit" class="danger-btn">Delete Account</button>
    </form>
</div>

</body>
</html>
