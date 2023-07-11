<%@page import="controller.statemanagement.sessionManagment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    <sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/classicwears" user="root" password=""/>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cart</title>
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
    height: 500px;
    overflow: hidden;
}
.cart{
    width:67%;
    float: left;
    margin-top: 30px;
    margin-left: 20px;
    background-color: rgb(209, 203, 203);
    overflow: scroll;
    overflow-x: hidden;
}
.total{
    width: 29%;
    height: 500px;
    margin-left: 10px;
    margin-top: 30px;
    background-color: rgb(213, 209, 209)
}
.cart_item{
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    margin-top: 20px;
    margin-left: 40px;
    margin-bottom: 10px;
    float: left;
    width: 90%;
    height: 240px;
    background-color: rgb(255, 255, 255);
    border-radius: 30px;

}
.image{
    float: left;
    width: 200px;
    height: 200px;
    background-size:cover;
    margin-top: 20px;
    margin-left: 20px;
    border-radius: 30px;
}
.desc{
    float: right;
    margin-top: 0px;
    margin-right: 30px;
    width: 460px ;
    height: 200px;

}
.desc p {
    font-size: 17px;
    font-family: Georgia, 'Times New Roman', Times, serif;
}
.update{
    float: left;
    padding: 10px;
    border: 1px solid grey;
    border-radius: 10px;
    background-color: rgb(147, 103, 55);
    color: white;
    margin-top: -35px;
    margin-left: 300px;
}
.cancel{
    float: left;
    padding: 10px;
    border: 1px solid grey;
    border-radius: 10px;
    background-color: rgb(229, 53, 53);
    color: white;
    margin-top: -35px;
    margin-left: 20px;
}
.update:hover{
    background-color:rgb(171, 129, 85);
    box-shadow: 3px 3px rgb(191, 188, 188);
}
.cancel:hover{
    background-color: rgb(221, 78, 78);
    box-shadow: 3px 3px rgb(185, 181, 181);
}
.qty{
    float: left;
    width: 25px;
    height:5px;
    padding: 10px;
    margin-top: -90px;
    margin-left: 100px;
}
h1{
    font-family: Georgia, 'Times New Roman', Times, serif;
    font-size: 40px;

    color:rgb(119, 78, 33) ;
}
.total {
    font-size: 60px;
    text-align: center;
    color: green;
}
.total p{
    margin-top: -20px;
}
.buy{
    padding: 20px;
    width: 200px;
    border: 1px solid grey;
    border-radius: 20px;
    background-color: #9b5b2d;
    color: white;
}
.buy:hover{
    background: #bf8352;
    box-shadow: 4px 4px grey;
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
         
          <!-- // Create a new session management object to handle user sessions. -->
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
          <!-- checking if session exist -->
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
                  <a href="%=request.getContextPath()%>/pages/editProfile.jsp">Edit profile</a>
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
    <div class="main_box">
    <% String stockerror = (String) request.getAttribute("morethanstock");
	%>
	
	<!--  checking if registerdone has message-->
	
        <div class="cart"> 
        
        <!-- getting connection using jstl query tag -->
    <sql:query var="carts" dataSource="${dbConnection}">
    SELECT c.user_id, c.product_id, c.quantity, c.price, c.rating, c.total, p.product_name, p.product_desc, p.p_image, p.price as product_price 
    FROM cart c 
    INNER JOIN product p 
    ON c.product_id = p.product_id 
    WHERE c.user_id = '<%=username%>';
</sql:query>
<c:forEach var="product" items="${carts.rows}">
    <div class="cart_item">   
        <div class="image"><!-- showing user -->
            <img src="http://localhost:8080/images/product/${product.p_image}" style="width:100%; height: 100%;">
        </div>
        <div class="desc">
        	
            <sql:query var="qty" dataSource="${dbConnection}">
                Select product_id, product_stock, price from product where product_id= ${product.product_id};
            </sql:query>
            <p>Product Name: ${product.product_name}</p>
            <p>Description: ${product.product_desc}</p>
            <p>Rating:${product.rating}</p>
            <p>Price: ${product.price}</p>
            <p>Quantity:</p>
            <c:forEach var="qt" items="${qty.rows}">
            <p>Available quantity: ${qt.product_stock}</p>
            
            <!-- form for sending updates -->
            <form action="<%=request.getContextPath()%>/EditCart" method="get">
                <input type="hidden" name="productId" value="${product.product_id}">
                <input type="hidden" name="stock" value="${qt.product_stock}">
                <input type="hidden" name="productPrice" value="${qt.price}">
                <input class="qty" type="text" step="0.01" name="qty" value="${product.quantity}">
                <button class="update">Update</button>
            </form>

            </c:forEach> 
             <form action="<%=request.getContextPath()%>/EditCart" method="post">
            	<input type="hidden" name="productId" value="${product.product_id}">
            	<input  type="hidden" name="qty" value="${product.quantity}">
            	<button class="cancel">Remove</button>
            </form>
        </div>
    </div>
</c:forEach>







</div>


        <div class="total">
        <% if (stockerror != null) { %>
		    
            <p><%= stockerror %> </p>
           
		<% } %>
        <!-- ceating connection using jstl query tag  -->
        <sql:query var="sum" dataSource="${dbConnection}">
  			SELECT user.user_id, SUM(cart.total) AS grand_total FROM product 
  			JOIN cart ON product.product_id=cart.product_id JOIN user ON cart.user_id = user.user_id 
  			 WHERE user.user_id = <%=username%> GROUP BY user.user_id;
		</sql:query>
		<c:forEach var="total" items="${sum.rows}">
    <h1>Total Price</h1>
    <p>$ ${total.grand_total}</p>  
    <form action="<%=request.getContextPath()%>/BuyProducts" method="post"> 
    	<input type="hidden" name="id" value="<%=username%>" >
    	<% if (stockerror == null) { %>
        <input class="buy" type="submit" value="BUY">
        <%} %>
    </form>
</c:forEach>
</div>

    </div>
    	
		
</body>
<script>
<!-- profile menu toggle js-->
function menuToggle() {
    const toggleMenu = document.querySelector(".menu");
    toggleMenu.classList.toggle("active");
  }
</script>
</html>