<%@page import="controller.statemanagement.sessionManagment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
</head>
<style>
body{
        background-color: rgb(147, 103, 55);
    }
    .navbar{
  overflow:hidden;
  background-color: white;
  margin-left: -7px;
  width: 100%;
  position: fixed;
  top: 0;
}

nav{
    float:left;
    width: 53%;
    margin-left: 160px;  
    
}

.logo img{
    height: 60px;
    width: 250px;
    float:left;
    margin-left: 10px;
    margin-top: 10px;
}

ul li{
  display: inline-block; 
  font-family: Georgia, 'Times New Roman', Times, serif;
  
}

.nav-link {
  margin-left: 20px;
  font-weight: bold;
  font-size: 20px;
  text-transform: uppercase;
  text-decoration: none;
  color: #4e290a;
  padding: 14px 0px;
  display: inline-block;
  position: relative;
  opacity: 0.75;
}

.nav-link:hover {
  opacity: 1;
  text-decoration: none;
}

.nav-link::before {
  transition: 300ms;
  height: 5px;
  content: "";
  position: absolute;
  background-color: #482b05;
}

.nav-link-ltr::before {
  width: 0%;
  bottom: 10px;
}

.nav-link-ltr:hover::before {
  width: 100%;  
}

.log{
  	padding: 10px;
    width: 35%;
    border-radius: 20px;
    margin-left: 10px;
    border: 1px solid black;;
    background-color: #cc8c57;
    color: white;
}

.log:hover{
  box-shadow: 3px 3px #d3cfcf;
  background-color:#bf8352; 
}
.action {
  position: fixed;
  top: 20px;
  right: 30px;
}

.action .profile {
  position: relative;
  margin-top: -10px;
  width: 60px;
  height: 60px;
  border-radius: 50%;
  overflow: hidden;
  cursor: pointer;
}

.action .profile img {
  position: absolute;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.action .menu {
  position: absolute;
  top: 120px;
  right: -10px;
  padding: 10px 20px;
  background: #fff;
  width: 200px;
  box-sizing: 0 5px 25px rgba(0, 0, 0, 0.1);
  border-radius: 15px;
  transition: 0.5s;
  visibility: hidden;
  opacity: 0;
}

.action .menu.active {
  top: 80px;
  visibility: visible;
  opacity: 1;
}

.action .menu::before {
  content: "";
  position: absolute;
  top: -5px;
  right: 18px;
  width: 20px;
  height: 20px;
  background: #fff;
  transform: rotate(45deg);
}

.action .menu ul li {
  list-style: none;
  padding: 16px 0;
  border-top: 1px solid rgba(0, 0, 0, 0.05);
  display: flex;
  align-items: center;
}

.action .menu ul li a {
  display: inline-block;
  text-decoration: none;
  color: #555;
  font-weight: 500;
  transition: 0.5s;
}

.action .menu ul li:hover a {
  color: #b35513;
  text-decoration: underline;
}

.container{
    margin-top: 90px;
    width: 100%;
    height: 1750px;
    background-color: rgb(244, 240, 240);
    overflow: hidden;
}
.desc{
    width: 90%;
    border-radius: 20px;
    border: none;
    margin-left: 3.5%;
    text-align: center;
    padding: 20px;
    margin-top: 20px;
    font-family: Georgia, 'Times New Roman', Times, serif;
    font-size: 20px;
    color: #2e2929;
}
.desc h1{
    color: #6b3e1e;
    text-shadow: 4px 4px #ccc8c8;
}
.devop{
    margin-top: 40px;
    margin-left: 10%;
    width: 80%;
    height: 500px;
    float: left;
}
.devop_1{
    width: 40%;
    height: 90%;
    margin-left: 75px;
    background-color: rgb(23, 173, 173);
    float:left ;
    padding: 10px;
    border-radius: 40px;
    box-shadow: 5px 10px #cec9c9;
}
.devop_2{
    width: 40%;
    height: 90%;
    margin-left: 40px;
    background-color: rgb(23, 173, 173);
    padding: 10px;
    float: left;
    border-radius: 40px;
    box-shadow: 5px 10px #cec9c9;
}
.dev_image{
    width: 40%;
    height: 36%;
    background-color: black;
    display: inline-block;
    margin-top: 20px;
    margin-left: 30%;
    border-radius: 50%;
    overflow: hidden;
    background-size: cover; 
    
}
.devop p{
    padding: 2px;
    margin-left: 40px;
    font-size: 20px;
    font-family: Georgia, 'Times New Roman', Times, serif;
    color: rgb(224, 218, 218);
}
h2{
    font-size: 40px;
    color: #6b3e1e;
    text-shadow: 4px 4px #ccc8c8;
    font-family: Georgia, 'Times New Roman', Times, serif;
    text-align: center;
}
.dev_desc{
    margin-top: 570px;
    width: 80%;
    height: 20%;
    font-size: 20px;
    font-family: Georgia, 'Times New Roman', Times, serif;
    margin-left: 10%;
    text-align: center;
    color: #2e2929;
}
.foot{
  background-color: white;
  width: 101.4%;
  height:300px;
  margin-left: -10px;
}
.col1{
  margin-top: 26px;
  height:240px;
  width: 40%;
  float: left;
  background-color:#ffffff;
  color: #462810;
}
.col2{
  height:300px;
  width: 20%;
  font-family: Georgia, 'Times New Roman', Times, serif;
  float: left;
  text-align: center;
  margin-top: 20px;
  color: #776353;
}
.col2 li{
  padding: 10px;
}
.col2 a{
  padding: 10px;
  text-decoration: none;
  color: rgb(95, 94, 94);
}
.col2 a:hover{
  text-decoration: underline;
  color: #46280f;
  transition: 0.3s;
}
.col3{
  margin-top: 20px;
  font-family: Georgia, 'Times New Roman', Times, serif;
  color:#776353;
  height:300px;
  width: 20%;
  float: left;
  text-align: center;
}
.col3 p{
  color: rgb(91, 89, 89);
}
.col3 a{
  color: #7a502d;;
  text-decoration: none;
}
.col3 a:hover{
  text-decoration: underline;
  color: #46280f;
  transition: 0.3s;
  text-decoration: underline;
}
.col4{
  font-family: Georgia, 'Times New Roman', Times, serif;
  color:#776353;
  margin-top: 20px;
  height:300px;
  width: 20%;
  float: left;
  text-align: center;
}

.col4 p{
  color: rgb(81, 80, 80);
}

.logsign{
	margin-top: -40px;
	margin-left:450px;
	
}
</style>
<body>
    <div class="navbar">
        
        <div class="logo">
          <img src="<%= request.getContextPath() %>/photos/logo1.png"/>
          </div>
            <nav>
          <ul>
          <li><a class="nav-link nav-link-ltr" href="<%= request.getContextPath() %>/home.jsp">Home</a></li>
          <li><a class="nav-link nav-link-ltr" href="<%= request.getContextPath() %>/pages/about_us.jsp">About Us</a></li>
          <li><a class="nav-link nav-link-ltr" href="<%= request.getContextPath() %>/pages/contact_us.jsp">Contact Us</a></li>
          <% 
          	sessionManagment sessions = new sessionManagment();
          	String username = (String)session.getAttribute("ID");
          	String image = (String)session.getAttribute("image");
          	String name = (String)session.getAttribute("username");
          	
          if (!sessions.checkUser(username)) {%>
          <div class="logsign">
          <a href="<%= request.getContextPath() %>/pages/login.jsp"><button class="log">Login</button></a>
          <a href="<%= request.getContextPath() %>/pages/register.jsp"><button class="log" >SignIn</button></a>
          </div>
          <%} %>
          </ul>
          </nav>
          <% if (sessions.checkUser(username)) {%>
          <div class="action">
            <div class="profile" onclick="menuToggle();">
              <img src="http://localhost:8080/images/<%=image%>"/>
            </div>
            <div class="menu">
              <ul>
              <li>
              <p>User:<%=name%></p>
              </li>
                <li>
                  <a href="#">My Cart</a>
                </li>
                <li>
                  <a href="#">Edit profile</a>
                </li>
                <li>
                <form action="<%=request.getContextPath() %>/userLogout" method="post">
                	<input type = "Submit" value="Logout">
                </form>
                </li>
              </ul>
            </div>
          </div>
          <%}%>
    </div>

    <div class="container">
        
        <div class="desc">
            <hr width="65%">
            <h1>ClassicWears</h1>
            <hr width="65%">
            <br>
            <p>ClassicWears is an online shoe store that caters to both men and women. The company offers a wide variety of footwear options, 
            ranging from formal to casual shoes. With a focus on quality and style, ClassicWears sources its products from top-notch manufacturers
             to ensure that customers receive the best possible value for their money.ClassicWears also offers free shipping and returns, ensuring 
             that customers have a hassle-free shopping experience. Overall, ClassicWears is a great option for anyone looking for stylish and comfortable
              shoes online.</p>
        </div>
            <video width="1280" height="500" autoplay muted>
                <source src="<%= request.getContextPath()%>/video/video.mp4" type="video/mp4">
            </video>
            <br>
            <br>
            <br>
            <hr width="90%">
            <h2>Developers</h2>
            <hr width="90%">
        <div class="devop">
            <div class="devop_1">
                <div class="dev_image">
                    <img src="<%= request.getContextPath() %>/photos/vijay.jpg" style="width: 170px;">
                </div>
                <p> Name: Vijay Raj Khadka </p>
                <p> Age: 20</p>
                <p> Occupation: Student </p>
                <p> Skill: Developer (UI/UX/Backend)</p>
                <p> College: Islington </p>
                
            </div>
            <div class="devop_2">
                <div class="dev_image">
                    <img src="<%= request.getContextPath() %>/photos/prasanna.jpg" style="width: 170px;">
                </div>
                <p> Name: Prasanna Bhattari</p>
                <p> Age: 20 </p>
                <p> Occupation: Student </p>
                <p> Skill: Developer (UI/UX/Backend)</p>
                <p> College: Islington</p>
            </div>
        </div>
        <div class="dev_desc">
            <p>Classicwears' web developers have created a visually appealing and user-friendly online store for shoes. The website incorporates the latest web technologies and best practices to ensure optimal performance, security, and user experience.</p>
        </div>
    </div>
    <br>
    <div class="foot">
        <footer>
            
          <div class="col1">
            <hr width="90%">
              <h2 style="font-size: 30px; font-family: Georgia, 'Times New Roman', Times, serif; margin-left: 20px;">ClassicWears</h2>
              <hr width="90%"> 
              <p style="margin-left: 25px;font-family: Georgia, 'Times New Roman', Times, serif; color: rgb(59, 57, 57); ">Classic Wear is a premier online shoe retailer offering a wide range of stylish and high-quality shoes for men and women.
                We pride ourselves on providing exceptional customer service, fast and reliable shipping, and affordable prices without 
                sacrificing quality.Shop with us today and experience the best in online shoe shopping.
              </p>
          </div >
    
          <div class="col2">
            <ul>
              <hr> 
              <h1>Explore</h1>
              <hr> 
              <li><a href="home.html">Home</a></li><br>
              <li><a href="about.html">Products</a></li><br>
              <li><a href="contact.html">Contact</a></li><br>
               
          </ul>
          </div>

          <div class="col3">
            <ul>
              <hr> 
              <h1>Contact Us</h1>
              <hr> 
              <p>Vijay Raj Khadka<p>
              <p>Prasanna Bhattarai<p>
                <li><a href="https://www.instagram.com/_vijayrajkhadka_/">@_vijayrajkhadka_</a></li><br>
                <li><a href="https://www.instagram.com/prasanna_bhattarai10">@prasanna_bhattarai10</a></li><br>
              
          </ul>
          
          </div>

          <div class="col4">
            <ul>
              <hr width="90%"> 
              <h1>Location</h1>
              <hr width="90%"> 
              <p>Nepal<p>
              <p>Jawalakhel<p>
              <p>Dhapakhel<p></p>
              
          </ul>
          </div>
           
        </footer>
        
    </div>
</body>
<script>

    function menuToggle() {
        const toggleMenu = document.querySelector(".menu");
        toggleMenu.classList.toggle("active");
      }
    </script>
</html>