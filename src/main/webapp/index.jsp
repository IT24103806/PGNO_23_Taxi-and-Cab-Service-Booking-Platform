<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

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

        /* Header and Logo */
        .header {
            background-color: var(--primary-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 5%;
            color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .logo-container {
            display: flex;
            align-items: center;
        }

        .logo-text {
            font-size: 32px;
            font-weight: bold;
            letter-spacing: 1px;
            margin-left: 10px;
        }

        .subheading {
            font-size: 14px;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-top: -5px;
        }

        /* Login Section */
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
            padding: 5px 10px; /* Reduced padding */
            font-size: 13px;    /* Slightly smaller text */
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
            font-size: 11px; /* Slightly smaller */
            color: #ccc;
            margin-top: 5px;
            text-decoration: none;
        }

        .forgot-password:hover {
            color: white;
        }

        /* Navigation Bar */
        .navbar {
            background-color: #f0f0f0;
            display: flex;
            overflow: hidden;
        }

        .nav-item {
            padding: 15px 25px;
            color: var(--dark-color);
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s;
            position: relative;
        }

        .nav-item:hover, .nav-item.active {
            background-color: var(--secondary-color);
            color: white;
        }

        .nav-item.active {
            background-color: var(--secondary-color);
        }

        /* Slider */
        .slider-container {
            position: relative;
            height: 450px;
            overflow: hidden;
        }

        .slider {
            width: 100%;
            height: 100%;
            position: relative;
        }

        .slide {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity 1s ease-in-out;
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
            position: relative;
            z-index: 2;
        }

        .slide::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, rgba(0,0,0,0.7) 0%, rgba(0,0,0,0.3) 50%, rgba(0,0,0,0) 100%);
        }

        .slide-title {
            font-size: 60px;
            font-weight: bold;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .slide-description {
            font-size: 18px;
            margin-bottom: 30px;
        }

        .cta-btn {
            display: inline-block;
            padding: 12px 30px;
            background-color: var(--secondary-color);
            color: var(--dark-color);
            text-decoration: none;
            font-weight: bold;
            border-radius: 30px;
            transition: all 0.3s;
            font-size: 16px;
        }

        .cta-btn:hover {
            transform: scale(1.05);
            background-color: #ffffff;
        }

        .slider-nav {
            position: absolute;
            top: 50%;
            width: 100%;
            display: flex;
            justify-content: space-between;
            padding: 0 20px;
            z-index: 3;
        }

        .slider-btn {
            background-color: rgba(255, 255, 255, 0.3);
            border: none;
            color: white;
            font-size: 24px;
            cursor: pointer;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.3s;
        }

        .slider-btn:hover {
            background-color: rgba(255, 255, 255, 0.5);
        }

        .slider-dots {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            z-index: 3;
        }

        .dot {
            width: 12px;
            height: 12px;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 50%;
            margin: 0 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .dot.active {
            background-color: var(--secondary-color);
        }

        /* Services Section */
        .services-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            padding: 20px;
            background-color: white;
            margin-top: -10px;
            box-shadow: 0px -5px 10px rgba(0,0,0,0.1);
            position: relative;
            z-index: 5;
        }

        .service-item {
            flex: 1;
            min-width: 150px;
            max-width: 200px;
            text-align: center;
            padding: 20px 10px;
            transition: transform 0.3s;
            cursor: pointer;
        }

        .service-item:hover {
            transform: translateY(-10px);
        }

        .service-icon {
            font-size: 36px;
            color: var(--primary-color);
            margin-bottom: 15px;
        }

        .service-title {
            font-size: 16px;
            color: var(--dark-color);
            font-weight: 600;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                text-align: center;
            }

            .login-section {
                margin-top: 10px;
                text-align: center;
            }

            .navbar {
                flex-wrap: wrap;
                justify-content: center;
            }

            .slide-title {
                font-size: 40px;
            }

            .services-container {
                flex-direction: column;
                align-items: center;
            }

            .service-item {
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
<!-- Header Section -->
<div class="header">
    <div class="logo-container">
        <div>
            <div class="logo-text">Swift Rides</div>
            <div class="subheading">Premium Cab Service</div>
        </div>
    </div>
    <div class="login-section">
        <div class="login-text">LOG IN USING YOUR ACCOUNT ON:</div>
        <a href="login.jsp" class="login-btn">Login</a>
        <a href="register.jsp" class="login-btn">Register</a>
        <a href="#" class="forgot-password">Forgotten your password?</a>
    </div>
</div>

<!-- Navigation Bar -->
<div class="navbar">
    <a href="#" class="nav-item active">Home</a>
    <a href="#" class="nav-item">Our Services</a>
    <a href="#" class="nav-item">Bookings</a>
    <a href="#" class="nav-item">Destinations</a>
    <a href="#" class="nav-item">About Us</a>
    <a href="#" class="nav-item">Support</a>
</div>

<!-- Slider Section -->
<div class="slider-container">
    <div class="slider">
        <div class="slide active" style="background-image: url('${pageContext.request.contextPath}/BackgroundImage3.png');">
            <div class="slide-content">
                <h1 class="slide-title">YOUR RIDE AWAITS YOU!</h1>
                <p class="slide-description">Experience premium transportation with our professional cab service. Book your ride now and travel in comfort.</p>
                <a href="#" class="cta-btn">Book Now</a>
            </div>
        </div>
        <div class="slide" style="background-image: url('${pageContext.request.contextPath}/backgroundImage1.png');">
            <div class="slide-content">
                <h1 class="slide-title">TRAVEL IN STYLE</h1>
                <p class="slide-description">Our luxury fleet ensures you arrive at your destination in comfort and elegance. Choose from our selection of premium vehicles.</p>
                <a href="#" class="cta-btn">View Fleet</a>
            </div>
        </div>
        <div class="slide" style="background-image: url('${pageContext.request.contextPath}/backgroundImage2.png');">
            <div class="slide-content">
                <h1 class="slide-title">PROFESSIONAL DRIVERS</h1>
                <p class="slide-description">Our experienced and courteous drivers prioritize your safety and comfort throughout your journey.</p>
                <a href="#" class="cta-btn">Learn More</a>
            </div>
        </div>
    </div>
    <div class="slider-nav">
        <button class="slider-btn prev-btn"><i class="fas fa-chevron-left"></i></button>
        <button class="slider-btn next-btn"><i class="fas fa-chevron-right"></i></button>
    </div>
    <div class="slider-dots">
        <span class="dot active" data-index="0"></span>
        <span class="dot" data-index="1"></span>
        <span class="dot" data-index="2"></span>
    </div>
</div>

<!-- Services Section -->
<div class="services-container">
    <div class="service-item">
        <div class="service-icon">
            <i class="fas fa-taxi"></i>
        </div>
        <div class="service-title">BOOK A CAB</div>
    </div>
    <div class="service-item">
        <div class="service-icon">
            <i class="fas fa-route"></i>
        </div>
        <div class="service-title">TRACK YOUR RIDE</div>
    </div>
    <div class="service-item">
        <div class="service-icon">
            <i class="fas fa-calendar-alt"></i>
        </div>
        <div class="service-title">SCHEDULE PICKUP</div>
    </div>
    <div class="service-item">
        <div class="service-icon">
            <i class="fas fa-user-tie"></i>
        </div>
        <div class="service-title">PROFESSIONAL DRIVERS</div>
    </div>
    <div class="service-item">
        <div class="service-icon">
            <i class="fas fa-headset"></i>
        </div>
        <div class="service-title">24/7 SUPPORT</div>
    </div>
</div>

<script>
    // Slider functionality
    let currentSlide = 0;
    const slides = document.querySelectorAll('.slide');
    const dots = document.querySelectorAll('.dot');
    const totalSlides = slides.length;

    // Initialize the slider - make sure only one slide is active
    function showSlide(index) {
        // Remove active class from all slides and dots
        slides.forEach(slide => slide.classList.remove('active'));
        dots.forEach(dot => dot.classList.remove('active'));

        // Add active class to current slide and dot
        slides[index].classList.add('active');
        dots[index].classList.add('active');

        currentSlide = index;
    }

    // Next slide function
    function nextSlide() {
        currentSlide = (currentSlide + 1) % totalSlides;
        showSlide(currentSlide);
    }

    // Previous slide function
    function prevSlide() {
        currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
        showSlide(currentSlide);
    }

    // Set up event listeners
    document.querySelector('.next-btn').addEventListener('click', nextSlide);
    document.querySelector('.prev-btn').addEventListener('click', prevSlide);

    // Set up dot navigation
    dots.forEach(dot => {
        dot.addEventListener('click', function() {
            const slideIndex = parseInt(this.getAttribute('data-index'));
            showSlide(slideIndex);
        });
    });

    // Initialize by showing the first slide only
    showSlide(0);

    // Auto-advance slides every 5 seconds
    setInterval(nextSlide, 5000);
</script>
</body>
</html>