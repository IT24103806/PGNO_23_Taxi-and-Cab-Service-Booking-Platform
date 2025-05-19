<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Swift Rides - User Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #1a3c6e;
            --secondary-color: #f7a928;
            --accent-color: #17a2b8;
            --light-color: #f4f4f4;
            --dark-color: #333;
            --transition-speed: 0.3s;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            overflow-x: hidden;
            background-color: #f4f4f4;
        }
        .header {
            background-color: var(--primary-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 5%;
            color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        .logo-text {
            font-size: 32px;
            font-weight: bold;
            margin-left: 10px;
        }
        .subheading {
            font-size: 14px;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-top: -5px;
        }
        .login-section {
            text-align: center;
            margin-top: 10px;
        }
        .login-text {
            font-size: 14px;
            margin-bottom: 8px;
            color: white;
        }
        .login-btn {
            background-color: var(--secondary-color);
            color: var(--dark-color);
            font-weight: bold;
            padding: 5px 10px;
            font-size: 13px;
            border-radius: 4px;
            text-decoration: none;
            margin: 5px;
            transition: all 0.3s ease;
        }
        .login-btn:hover {
            background-color: #e69c22;
            transform: translateY(-2px);
        }
        .forgot-password {
            display: block;
            font-size: 11px;
            color: #ccc;
            margin-top: 5px;
            text-decoration: none;
        }
        .navbar {
            background-color: #f0f0f0;
            display: flex;
        }
        .nav-item {
            padding: 15px 25px;
            color: var(--dark-color);
            text-decoration: none;
            font-weight: 600;
        }
        .nav-item:hover, .nav-item.active {
            background-color: var(--secondary-color);
            color: white;
        }
        .slider-container {
            position: relative;
            height: 450px;
            overflow: hidden;
        }
        .slide {
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity 1s;
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
        }
        .slide.active {
            opacity: 1;
        }
        .slide-content {
            padding: 50px;
            max-width: 600px;
            color: white;
            z-index: 2;
        }
        .slide::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, rgba(0,0,0,0.7), rgba(0,0,0,0.3), rgba(0,0,0,0));
        }
        .slide-title {
            font-size: 60px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .slide-description {
            font-size: 18px;
            margin-bottom: 30px;
        }
        .cta-btn {
            padding: 12px 30px;
            background-color: var(--secondary-color);
            color: var(--dark-color);
            text-decoration: none;
            font-weight: bold;
            border-radius: 30px;
        }
        .slider-dots {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
        }
        .dot {
            width: 12px;
            height: 12px;
            background-color: rgba(255,255,255,0.5);
            border-radius: 50%;
            margin: 0 5px;
            cursor: pointer;
        }
        .dot.active {
            background-color: var(--secondary-color);
        }
        .services-container {
            display: flex;
            justify-content: space-around;
            padding: 20px;
            background-color: white;
            box-shadow: 0px -5px 10px rgba(0,0,0,0.1);
        }
        .service-item {
            flex: 1;
            min-width: 150px;
            max-width: 200px;
            text-align: center;
        }
        .service-icon {
            font-size: 36px;
            color: var(--primary-color);
            margin-bottom: 15px;
        }
        .service-title {
            font-size: 16px;
            font-weight: 600;
        }
    </style>
</head>
<body>
<div class="header">
    <div>
        <div class="logo-text">Swift Rides</div>
        <div class="subheading">User Management Panel</div>
    </div>
    <div class="login-section">
        <div class="login-text">Navigate your user tools:</div>
        <a href="login.jsp" class="login-btn">Login</a>
        <a href="register.jsp" class="login-btn">Register</a>
        <a href="viewUsers.jsp" class="login-btn">View Users</a>
        <a href="deleteUser.jsp" class="login-btn">Delete User</a>
    </div>
</div>

<div class="navbar">
    <a href="#" class="nav-item active">Home</a>
    <a href="#" class="nav-item">Profile</a>
    <a href="#" class="nav-item">Help</a>
</div>

<div class="slider-container">
    <div class="slide active" style="background-image: url("BackgroundImage3.png");">
        <div class="slide-content">
            <h1 class="slide-title">Manage Users Efficiently</h1>
            <p class="slide-description">Register, view or remove users in one place.</p>
            <a href="viewUsers.jsp" class="cta-btn">View Users</a>
        </div>
    </div>
    <div class="slide" style="background-image: url('backgroundImage1.png');">
        <div class="slide-content">
            <h1 class="slide-title">Smooth Registration</h1>
            <p class="slide-description">Easy onboarding with role selection: admin, driver, customer.</p>
            <a href="register.jsp" class="cta-btn">Register Now</a>
        </div>
    </div>
    <div class="slide" style="background-image: url('backgroundImage2.png');">
        <div class="slide-content">
            <h1 class="slide-title">Login Seamlessly</h1>
            <p class="slide-description">Secure access for all user roles with session support.</p>
            <a href="login.jsp" class="cta-btn">Go to Login</a>
        </div>
    </div>
    <div class="slider-dots">
        <span class="dot active"></span>
        <span class="dot"></span>
        <span class="dot"></span>
    </div>
</div>

<div class="services-container">
    <div class="service-item">
        <div class="service-icon"><i class="fas fa-user-plus"></i></div>
        <div class="service-title">Register User</div>
    </div>
    <div class="service-item">
        <div class="service-icon"><i class="fas fa-sign-in-alt"></i></div>
        <div class="service-title">User Login</div>
    </div>
    <div class="service-item">
        <div class="service-icon"><i class="fas fa-users"></i></div>
        <div class="service-title">View Users</div>
    </div>
    <div class="service-item">
        <div class="service-icon"><i class="fas fa-user-minus"></i></div>
        <div class="service-title">Delete User</div>
    </div>
</div>

<script>
    let current = 0;
    const slides = document.querySelectorAll('.slide');
    const dots = document.querySelectorAll('.dot');
    function showSlide(index) {
        slides.forEach(s => s.classList.remove('active'));
        dots.forEach(d => d.classList.remove('active'));
        slides[index].classList.add('active');
        dots[index].classList.add('active');
        current = index;
    }
    function nextSlide() {
        current = (current + 1) % slides.length;
        showSlide(current);
    }
    dots.forEach((d, i) => d.onclick = () => showSlide(i));
    setInterval(nextSlide, 5000);
    showSlide(0);
</script>
</body>
</html>
