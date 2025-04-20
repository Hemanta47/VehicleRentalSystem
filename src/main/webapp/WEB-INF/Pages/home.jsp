<%@page import="java.lang.ProcessBuilder.Redirect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/global.css" />
	<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/header.css" />
	<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/home.css" />
	<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/footer.css" />
	 <script src="https://kit.fontawesome.com/a63c128ded.js" crossorigin="anonymous"></script>
</head>
<body>
  <jsp:include page="./component/header.jsp"/>
      <div class="container">
        <div class="slider">
            <div class="slide-items">
                <div class="slide" id="slide1">
                    <div class="text">Explore the World with FleetX</div>
                </div>
                <div class="slide" id="slide2">
                    <div class="text">Your Journey Starts Here</div>
                </div>
            </div>

            <ul class="dots">
                <li class="active"></li>
                <li></li>
            </ul>
        </div>

        <div class="why-choose-us">
            <div class="features">
                <div class="feature-item">
                    <i class="fa-solid fa-car"></i>
                    <div class="item-text">
                        <h3>Wide Range of Vehicles</h3>
                        <p>We offer a diverse fleet of vehicles to suit all your travel needs.</p>
                    </div>
                </div>
                <div class="feature-item">
                    <i class="fa-solid fa-clock"></i>
                    <div class="item-text">
                        <h3>24/7 Customer Support</h3>
                        <p>Our support team is available around the clock to assist you.</p>
                    </div>
                </div>
                <div class="feature-item">
                    <i class="fa-solid fa-shield-alt"></i>
                    <div class="item-text">
                        <div class="item-text">
                            <h3>Safety First</h3>
                            <p>Your safety is our top priority. All our vehicles are regularly maintained.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="search-section">
            <div>
                <h2>Find Your Perfect Vehicle</h2>
                <form class="search-form">
                    <fieldset>
                        <legend>Vehicle Type</legend>
                        <select required>
                            <option value="">Select vehicle type</option>
                            <option value="SUV">SUV</option>
                            <option value="Sedan">Sedan</option>
                            <option value="Minivan">Minivan</option>
                            <option value="Crossover">Crossover</option>
                        </select>
                    </fieldset>
                    <fieldset>
                        <legend>Location</legend>
                        <select required>
                            <option value="">Select location</option>
                            <option value="Kathmandu">Kathmandu</option>
                            <option value="Pokhara">Pokhara</option>
                            <option value="Lalitpur">Lalitpur</option>
                            <option value="Bhaktapur">Bhaktapur</option>
                        </select>
                    </fieldset>
                    <fieldset>
                        <legend>Pickup & Drop-off Date</legend>
                        <input type="date" required />
                        <input type="date" required />
                    </fieldset>
                    <button type="submit">Search</button>
                </form>
            </div>
            <div class="how-it-works">
                <h2>How It Works</h2>
                <div class="steps">
                    <div class="step-item">
                        <i class="fa-solid fa-search"></i>
                        <h3>Search</h3>
                        <p>Find the perfect vehicle for your needs.</p>
                    </div>
                    <div class="step-item">
                        <i class="fa-solid fa-calendar-check"></i>
                        <h3>Book</h3>
                        <p>Book your vehicle online in just a few clicks.</p>
                    </div>
                    <div class="step-item">
                        <i class="fa-solid fa-car-side"></i>
                        <h3>Drive</h3>
                        <p>Pick up your vehicle and hit the road!</p>
                    </div>
                    <div class="step-item">
                        <i class="fa-solid fa-check-circle"></i>
                        <h3>Return</h3>
                        <p>Return the vehicle at the end of your rental period.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="featured-vehicle">
            <h2>Featured Vehicles</h2>
            <div class="vehicle-list">
                <div class="vehicle-item">
                    <img src="${contextPath}/assets/default/car.png" alt="Vehicle 1" />
                    <h3>Vehicle 1</h3>
                    <div class="minor-details">
                        <p><i class="fas fa-dollar-sign"></i> 100/day</p>
                        <p><i class="fas fa-users"></i> 5 Seats</p>
                        <p><i class="fas fa-car-side"></i> SUV</p>
                        <p><i class="fas fa-cogs"></i> Automatic</p>
                    </div>
                    <button>View Details</button>
                </div>

                <div class="vehicle-item">
                    <img src="${contextPath}/assets/default/car.png" alt="Vehicle 2" />
                    <h3>Vehicle 2</h3>
                    <div class="minor-details">
                        <p><i class="fas fa-dollar-sign"></i> 80/day</p>
                        <p><i class="fas fa-users"></i> 4 Seats</p>
                        <p><i class="fas fa-car-side"></i> Sedan</p>
                        <p><i class="fas fa-cogs"></i> Manual</p>
                    </div>
                    <button>View Details</button>
                </div>

                <div class="vehicle-item">
                    <img src="${contextPath}/assets/default/car.png" alt="Vehicle 3" />
                    <h3>Vehicle 3</h3>
                    <div class="minor-details">
                        <p><i class="fas fa-dollar-sign"></i> 120/day</p>
                        <p><i class="fas fa-users"></i> 7 Seats</p>
                        <p><i class="fas fa-car-side"></i> Minivan</p>
                        <p><i class="fas fa-cogs"></i> Automatic</p>
                    </div>
                    <button>View Details</button>
                </div>

                <div class="vehicle-item">
                    <img src="${contextPath}/assets/default/car.png" alt="Vehicle 4" />
                    <h3>Vehicle 4</h3>
                    <div class="minor-details">
                        <p><i class="fas fa-dollar-sign"></i> 110/day</p>
                        <p><i class="fas fa-users"></i> 6 Seats</p>
                        <p><i class="fas fa-car-side"></i> Crossover</p>
                        <p><i class="fas fa-cogs"></i> Manual</p>
                    </div>
                    <button>View Details</button>
                </div>
            </div>
        </div>

        <div class="company-logos-section">
            <div class="company-logos">
                <img src="${contextPath}/assets/brand-logo/BYD Auto.png" alt="Company Logo 1" />
                <img src="${contextPath}/assets/brand-logo/toyota.svg" alt="Company Logo 2" />
                <img src="${contextPath}/assets/brand-logo/Ford-logo.svg" alt="Company Logo 3" />
                <img src="${contextPath}/assets/brand-logo/honda.png" alt="Company Logo 4" />
                <img src="${contextPath}/assets/brand-logo/mahindra.svg" alt="Company Logo 4" />
                <img src="${contextPath}/assets/brand-logo/Tata Motors.png" alt="Company Logo 4" />
                <img src="${contextPath}/assets/brand-logo/royal.png" alt="Company Logo 4" />
            </div>
        </div>

        <div class="testimonials-section">
            <h2>What Our Customers Say</h2>
            <div class="testimonials">
                <div class="testimonial-item">
                    <p>"FleetX made my trip unforgettable! The vehicle was in perfect condition and the service was
                        top-notch."</p>
                    <h3>- John Doe</h3>
                </div>
                <div class="testimonial-item">
                    <p>"I had a great experience with FleetX. The booking process was easy and the staff was very
                        helpful."</p>
                    <h3>- Jane Smith</h3>
                </div>
                <div class="testimonial-item">
                    <p>"I highly recommend FleetX for anyone looking to rent a vehicle. Their prices are competitive and
                        the
                        service is excellent."</p>
                    <h3>- Mark Johnson</h3>
                </div>
                <div class="testimonial-item">
                    <p>"FleetX made my trip unforgettable! The vehicle was in perfect condition and the service was
                        top-notch."</p>
                    <h3>- Sarah Brown</h3>
                </div>
            </div>
        </div>
    </div>
  
  <jsp:include page="./component/footer.jsp"/>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/script.js"></script>
</html>