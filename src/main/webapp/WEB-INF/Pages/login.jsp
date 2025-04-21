<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/global.css" />
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/login.css" />
    <script src="https://kit.fontawesome.com/a63c128ded.js"
	crossorigin="anonymous"></script>
</head>
<body>
  <header>
    <a href="./index.html">FleetX</a>
  </header>

  <div class="container">
    <div class="form-container">
      <h2>Login</h2>

      <!-- Display error message if available -->
      <c:if test="${not empty error}">
        <div class="error-message">
          ${error}
        </div>
      </c:if>

      <form action="login" method="POST">
        <input type="text" name="username" placeholder="Enter your username" required />
        <input type="password" name="password" id="loginpass" placeholder="Enter your password" required />
        <i class="fa fa-eye" id="toggleIcon" onclick="togglePassword('loginpass', 'toggleIcon')"></i>
        <div class="extra-links">
          <a href="forgot-password.html">Forgot password?</a>
        </div>
        
        <input type="submit" value="Login" />
      </form>
      
      <div class="form-footer">
        Don’t have an account? <a href="${contextPath}/register">Register here</a>
      </div>
    </div>
  </div>
</body>
<script type="text/javascript" src="${contextPath}/js/passwordToggle.js"></script>
</html>
