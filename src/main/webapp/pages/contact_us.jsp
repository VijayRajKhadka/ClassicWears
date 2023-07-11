<%@page import="controller.statemanagement.sessionManagment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
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
  font-size: 17px;
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
    height: 740px;
    background-color: rgb(244, 240, 240);
    overflow: hidden;
}
.container h1{
    margin-top: px;
    text-align: center;
    font-size: 40px;
    font-family: Georgia, 'Times New Roman', Times, serif;
    color:#bf8352;
}
.container p{
    text-align: center;
    font-family: Georgia, 'Times New Roman', Times, serif;
    color:#676360;
}
.info{

width: 40%;
height: 550px;
margin-left: 62px;
float: left;
}
.form_field{
margin-top: 30px;
margin-left: 40px;

float: left;
width: 45%;
height: 500px;
border-radius: 20px;
}
.info h2{
    font-size: 18px;
    margin-left: 40px;
    font-family: Georgia, 'Times New Roman', Times, serif;
    color:#676360;
}
.info a{
    text-decoration: none;
    color: #926c4f;
}
.info a:hover{
    text-decoration: underline;
}
p2{
    color: #926c4f;
}
.input_field{
    margin-left:100px;
    margin-top: 10px;

}
.form_field input{
    padding: 20px;
    display: inline-block;
    border: 1px solid grey;
    border-radius: 15px;
    box-shadow: 1px 1px 5px 0 rgb(0, 0, 0, 0.2);
    width: 80%;
    height: 10px;
}
.suggestion input{
        height: 100px;
}
.submit_btn input{
        width: 120px;
        padding: 30px;
        padding-top: 10px;
        border: none;
        border-radius: 5px;
        box-shadow: 2px 2px 7px 0 rgb(0, 0, 0, 0.2);
        color: rgb(244, 244, 244);
        background-color: #926c4f;
        transition: 0.4s;
        margin-left: 390px;
    }
    .submit_btn input:hover{
        background-color:#49301d;
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
  color: #7a502d;
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
    </div>
            <div class="container">
                <br>
                    <h1>Contact Us</h1>
                <hr width="90%">
                <p>Get in touch with ClassicWears by filling out the form below. We welcome your<br> feedback and inquiries and will respond as soon as possible. Thank you for considering<br> us for your fashion needs!
                <div class="info">
                    <h1>We Are Here to Help.</h1>
                    <br>
                    <h2>E-mail services.<h2>
                    <a href="" style="font-size:15px">np01cp4s220046@islingtoncollege.edu.np</a><br>
                    <a href="" style="font-size:15px">np01cp4s220044@islingtoncollege.edu.np</a>
                             
                    <br>
                    <br>
                    <br>
                            
                    Call Services.<br>
                    <br>
                    <p2>01-1234567<br>
                    Toll free: 01- 2222-3333-4444</p2><br>
                    <br>
                    <br>
                    Point to Contact.<br><br>
                    <p2 >NEPAL | Kathmandu<br>
                    Islington, Kamalpokhari.</p2><br>
       
                </div>
                <div class="form_field">
                    <div class="input_field">
                    <form action="">
                        <input type="text" name="first_name"  placeholder="First Name">
                        <br>
                        <br>
                        <input type="text" name="last_name"  placeholder="Last Name">
                        <br>
                        <br>
                        <input type="text" name="phone_No" placeholder="Phone Number"><br><br>
                        <input type="text" name="email"  placeholder="E-mail"><br><br>
                        <div class="suggestion">
                         <textarea name="input" cols="53" rows="6" style="border-radius: 20px;" placeholder=" Message"></textarea>
                        
                        </div>
                        <br>
                    </div>
                    <div class="submit_btn">
                        <input class="submit_btn" type="submit" value="Submit">
                    </div>
                    </form>
                    
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