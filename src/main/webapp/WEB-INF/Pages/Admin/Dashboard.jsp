<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FleetX Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        :root {
            --black: #0f0f0f;
            --white: #ffffff;
            --gray-100: #f7f7f7;
            --gray-200: #e0e0e0;
            --gray-300: #c2c2c2;
            --gray-700: #4a4a4a;
            --gray-900: #1a1a1a;

            --primary: var(--black);
            --secondary: var(--white);
            --accent: var(--gray-300);
        }


        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            background: var(--white);
        }

        .header {
            background: var(--black);
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 60px;
        }

        .header .profile {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .header .profile img {
            width: 35px;
            height: 35px;
            border-radius: 50%;
        }

        .container {
            display: flex;
            height: calc(100vh - 60px);
        }

        .sidebar {
            width: 20%;
            background: var(--gray-900);
            color: white;
            padding: 2rem 1rem;
            position: relative;
            transition: width 0.3s ease, padding 0.3s ease;
        }

        .sidebar nav ul {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 1.2rem;
            margin-top: 1.5rem;
        }

        .sidebar nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.5rem;
            border-radius: 8px;
            transition: background 0.3s, padding 0.3s ease, justify-content 0.3s ease;
        }

        .sidebar nav ul li a:hover,
        .sidebar nav ul li a.active {
            background: var(--gray-700);
        }


        .main-content {
            width: 80%;
            padding: 2rem;
            overflow-y: auto;
            transition: width 0.3s ease;
        }

        .sidebar.collapsed {
            width: 70px;
            padding: 1rem 0.5rem;
        }

        .sidebar.collapsed nav ul li a {
            justify-content: center;
        }

        .sidebar.collapsed nav ul li a span {
            display: none;
        }

        .sidebar nav ul li a i {
            font-size: 1.2rem;
        }

        .minimize {
            position: absolute;
            bottom: 1rem;
            right: 1rem;
            color: white;
            cursor: pointer;
            font-size: 1.5rem;
        }
 
    </style>
</head>

<body>
    <header class="header">
        <h1>Admin Dashboard</h1>
        <div class="profile">
            <span>${sessionScope.username}</span>
            <img src="/assets/bg-img/no-profile.jpg" alt="Profile Pic">
            <a href="/home" target="_blank" class="public-link">
                <i class="fas fa-globe"></i> View Public Site
            </a>
            <a href="${contextPath}/logout" style="color: white;"><i class="fas fa-sign-out-alt"></i></a>
        </div>

    </header>

    <div class="container">
        <aside class="sidebar">
            <nav>
                <ul>
                    <li><a href="#" class="active"><i class="fas fa-chart-line"></i> <span>Dashboard</span></a></li>
                    <li><a href="#"><i class="fas fa-car"></i> <span>Manage Vehicles</span></a></li>
                    <li><a href="#"><i class="fas fa-plus-circle"></i> <span>Add Vehicle</span></a></li>
                    <li><a href="#"><i class="fas fa-calendar-check"></i> <span>Bookings</span></a></li>
                    <li><a href="#"><i class="fas fa-users"></i> <span>Users</span></a></li>
                    <li><a href="#"><i class="fas fa-envelope"></i><span> Messages</span></a></li>
                </ul>
            </nav>
            <div class="minimize" onclick="toggleSidebar()">
                <i class="fa-solid fa-circle-chevron-left"></i>
            </div>

        </aside>

        <main class="main-content">
            <h2>Welcome, Admin!</h2>
            <p>This is your dashboard. Select a section from the sidebar to get started.</p>
        </main>
    </div>
    <script>
        function toggleSidebar() {
            const sidebar = document.querySelector('.sidebar');
            const icon = document.querySelector('.minimize i');
            if (!sidebar.classList.contains('collapsed')) {
                sidebar.classList.add('collapsed');
                icon.classList.remove('fa-circle-chevron-left')
                icon.classList.add('fa-circle-chevron-right')
            }
            else {
                sidebar.classList.remove('collapsed');
                icon.classList.remove('fa-circle-chevron-right')
                icon.classList.add('fa-circle-chevron-left')
            }
        }
    </script>

</body>

</html>