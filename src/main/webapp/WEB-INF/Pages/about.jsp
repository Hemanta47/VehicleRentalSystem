<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/global.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/about.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/footer.css" />
</head>
<body>
<jsp:include page="./component/header.jsp" />
<div class="container">
        <div class="hero">
            <h1>About Us</h1>
        </div>
        <div class="about-content">

            <div class="why-us">
                <h2>Why Choose Us</h2>
                <p>
                    We are a team of passionate developers committed to delivering high-quality web applications that exceed expectations.
                    Our mission is to create efficient, scalable, and user-friendly software tailored to our clients' needs. 
                    With a strong belief in continuous learning and staying updated with the latest technologies, we’re here to innovate and inspire.
                </p>
            </div>
            
            

            <div class="team">
                <h2 class="about-title">Meet the Team</h2>
                <ul class="team-list">
                    <li class="team-member">
                        <img src="${contextPath}/assets/default/alex.jpg" alt="John Doe">
                        <div class="personal-info">
                            <p class="name">John Doe</p>
                            <p class="role">Lead Developer</p>
                            <p class="bio">John brings over a decade of full-stack development experience. He's a tech visionary who thrives on turning complex problems into elegant solutions. Outside of coding, he’s an avid cyclist and loves coffee-fueled brainstorming sessions.</p>
                        </div>
                    </li>
            
                    <li class="team-member">
                        <img src="${contextPath}/assets/default/alex.jpg" alt="Jane Smith">
                        <div class="personal-info">
                            <p class="name">Jane Smith</p>
                            <p class="role">UI/UX Designer</p>
                            <p class="bio">Jane transforms ideas into beautiful, intuitive designs. Her passion lies in creating experiences users genuinely enjoy. When she’s not wireframing, you’ll find her sketching or exploring nature trails with her dog.</p>
                        </div>
                    </li>
            
                    <li class="team-member">
                        <img src="${contextPath}/assets/default/alex.jpg" alt="Mike Johnson">
                        <div class="personal-info">
                            <p class="name">Mike Johnson</p>
                            <p class="role">Backend Engineer</p>
                            <p class="bio">Mike specializes in building robust backend systems that scale. He's the silent power behind seamless app performance. A problem-solver at heart, he also enjoys chess and tinkering with Raspberry Pi projects.</p>
                        </div>
                    </li>
            
                    <li class="team-member">
                        <img src="${contextPath}/assets/default/alex.jpg" alt="Sara Lee">
                        <div class="personal-info">
                            <p class="name">Sara Lee</p>
                            <p class="role">QA Engineer</p>
                            <p class="bio">Sara ensures every feature works flawlessly before it goes live. With an eye for detail and a love for quality, she breaks things so users don’t have to. She also runs a blog about automation testing tips and tools.</p>
                        </div>
                    </li>
            
                    <li class="team-member">
                        <img src="${contextPath}/assets/default/alex.jpg" alt="Alan Wang">
                        <div class="personal-info">
                            <p class="name">Alan Wang</p>
                            <p class="role">DevOps Engineer</p>
                            <p class="bio">Alan is the backbone of our deployment strategy. He automates, monitors, and optimizes infrastructure like a pro. Passionate about continuous integration, he’s also a gamer and open-source enthusiast.</p>
                        </div>
                    </li>
                </ul>
            </div>
            
        </div>
    </div>
    <jsp:include page="./component/footer.jsp" />
</body>
</html>