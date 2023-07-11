<%@page import="controller.statemanagement.sessionManagment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Cart</title>
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
    float:right;
    width: 53%;
   margin-right: 180px;  
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
  padding: 10px 0px;
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
  bottom: 5px;
}

.nav-link-ltr:hover::before {
  width: 100%;  
}

.logsign{
  width: 200px;
  height: 50px;
  margin-top: -40px;
  margin-left: 620px;
}
.log{
    padding: 10px;
    width: 40%;
    border-radius: 20px;
    border: 1px solid black;;
    background-color: #cc8c57;
    color: white;
}
.sign{
  padding: 10px;
    width: 40%;
    border-radius: 20px;
    border: 1px solid black;;
    background-color: #cc8c57;
    color: white;
}
.log:hover{
  box-shadow: 3px 3px #d3cfcf;
  background-color:#bf8352; ;
}
.sign:hover{
  box-shadow: 3px 3px #d3cfcf;
  background-color:#bf8352; ;
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

.main_box{
    background-color: rgb(255, 255, 255);
    margin-top: 90px;
    display: flex;
    width: 100%;
    height: 700px;
    overflow: hidden;
}

.cart{
    width: 100%;
    height: 480px;
    background-color: white;
    margin-top: 80px;
}
.image{
    background-color: #555;
    float: left;
    margin-top: 40px;
    margin-left: 20px;
    width: 32%;
    height: 400px;
    border-radius: 30px;
    background-size: cover;
}
.product{
    float: right;
    margin-top: 40px;
    margin-right: 60px;
    width: 60%;
    height: 400px;
}
.product p{
    font-family: Georgia, 'Times New Roman', Times, serif;
    font-size: 20px;
}
.product input{
padding: 10px;
border: 1px sold black;
border-radius: 20px;
float: right;
margin-right: 455px;
margin-top: -45px;

}
.option{
    padding: 10px;
    float: right;
    margin-top: -50px;
    margin-right: 550px;
    border-radius: 20px;
}
#submit{
    padding: 20px;
    float: left;
    margin-left: 500px;
    border-radius: 30px;
    background-color: rgb(44, 43, 43);
    color: white;
}
#submit:hover{
    box-shadow: 5px 5px lightgrey;
    background-color: #555;
}
</style>
<body>

<!-- getting session attibure Id value and storing in username -->
<% String username = (String)session.getAttribute("ID");%>
	<div class="navbar">
        
        <div class="logo">
          <img src="<%= request.getContextPath() %>/photos/logo1.png"/>
          </div>
          
        
            <nav>
          <ul>
          <li><a class="nav-link nav-link-ltr" href="<%= request.getContextPath() %>/home.jsp">Home</a></li>
          <li><a class="nav-link nav-link-ltr" href="<%= request.getContextPath() %>/pages/about_us.jsp">About Us</a></li>
          <li><a class="nav-link nav-link-ltr" href="<%= request.getContextPath() %>/pages/contact_us.jsp">Contact Us</a></li>
          
          <!--// Create a new session management object to handle user sessions. -->
          <% 
          
          	sessionManagment sessions = new sessionManagment();   	
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
          <!-- checking if session for user is made  -->
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
                  <a href="<%=request.getContextPath()%>/pages/mycart.jsp">My Cart</a>
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
	
	<div class="cart">
        <div class="image"><!-- getting image from tomcat thorugh url -->
			<img src="http://localhost:8080/images/product/${product.image}"style="width:100%; height: 100%;">
        </div>
        <div class="product">
            <form  action="<%=request.getContextPath()%>/AddCart" method="post">
				
				<!-- hiding inputs for store and send data -->
                <input type="text" name="id" value="${product.id}" readonly style="display: none;">
                <input type="text" name="price" value="${product.price}" readonly style="display: none;">
                <input type="text" name="userId" value="<%=username%>" readonly style="display: none;">
                <input type="text" name="stock" value="${product.stock}" readonly style="display: none;">
                <p>Product Name:${product.name} </p>
                
                <p>Product Description: ${product.desc}</p>
                
                <p>Product Price: ${product.price}$</p>
                
                <p>Product Stock: ${product.stock}</p>
                <br>
                <p>Quantity: </p><input type="text" name="qty" class="qty" >
                <br>
                <p>Rate Product:</p>

                <select class="option" name="rating" style="margin-left: 40px;" required >
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>

                <input id="submit" type="submit" value="Add to Cart">
            </form>
        </div>
    </div>
</body>
<script>
<!-- drop down menu javascript -->
function menuToggle() {
    const toggleMenu = document.querySelector(".menu");
    toggleMenu.classList.toggle("active");
  }
</script>
</html>