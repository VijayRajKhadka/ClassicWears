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
<title>Home</title>
</head>

<style>
<%@include file="../css/home.css"%>
<%@include file="../css/navbar2.css"%></style>

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
          <!-- Create a new session management object to handle user sessions -->
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
          <!-- Checking if session is created -->
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
                  <a href="<%=request.getContextPath()%>/pages/editprofile.jsp">Edit profile</a>
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

        <div class="filter">
                <h1>Filter</h1>
                <div>
                <!-- getting brand value from homs jsp itself -->
                <%String brand = request.getParameter("brand"); %>
                    <form action = "home.jsp">  
                        <hr style="width: 75%;">
                        <p>Choose Brand:</p>
                        <sql:query var="products" dataSource="${dbConnection}">
            	SELECT DISTINCT product_brand FROM product;
            </sql:query>
            <!-- getting all category present-->
            <c:forEach var="product" items="${products.rows}">
                        <input type="hidden" name="selectedBrand" value="<%=brand%>">
						<input type="radio" name="brand" value="${product.product_brand}" ${product.product_brand == brand ? 'checked' : ''}>${product.product_brand}
                      	<br>
                      </c:forEach>
                        
                        <br>
                        <br>
                        <hr style="width: 75%;">
                        <p>Choose Category</p>
                        <input type="radio" name="cate" value="Heels"> Heel
                        <br>
                        <br>
                        <input type="radio" name="cate" value="Casual"> Casual
                        <br>
                        <br>     
                        <input type="radio" name="cate" value="Sport"> Sports
                        <br>
                        <br>
                        <input type="radio" name="cate" value="Sandals"> Sandals
                        <br>
                        <br>
                        <hr style="width: 75%;">
                        <br>
                        <input class="filter_btn" type="submit" value="Filter"> 

                        </form>   
                </div>
        </div>
        <div class="product">
            <div class="sort_field">
                <div class="head">
                    <div class="sort">
                 	
                 	 <!--form for sorting products-->
                 	<form action="home.jsp">
                        <select name="sort" id="language">
                            <option value="high_price">Price high to low</option>
                            <option value="high_rating">Price low to high</option>
                        </select>
                        <input type="submit" value="Sort">
                    </form>     
                    
                    </div>
                    <!-- form for seach field -->
                    <form action = "home.jsp">
                    <input class="search_field" name = "search" type="text" placeholder="Search products..."> 
                    <input class="search_btn" type="submit" value="Search">
                </form>
                </div>
            </div>
            <br>
            <br>
            <hr style="width:95%">
            
            <div class="product_item">
            <!-- getting parameter values from home jsp itself -->
            <%
            	String search = request.getParameter("search");
            	
            	
            	String cate = request.getParameter("cate");
            	String sort = request.getParameter("sort");
            	
            	if(search != null && !search.isEmpty()){
            %>
            <!-- getting connection using Jstl query tag and applying search query -->
            <sql:query var="products" dataSource="${dbConnection}">
            	SELECT * FROM product WHERE product_name LIKE "%<%=search %>%";
            </sql:query>
            <!-- print product according to search -->
            <c:forEach var="product" items="${products.rows}">
            		 <div class="product_card" id="${product.product_id}">
	                        <img src="http://localhost:8080/images/product/${product.p_image}" style="width:100%; height: 50%;">
	                        <p class="name">${product.product_name}</p>
	                        <p class="price">$ ${product.price}</p>
	                        <p class="desc">${product.product_desc}.</p>
	                        <c:choose>
	                        	<c:when test="${product.product_stock <= 0}">
	                        		<p class="stock">Stock: <i style="color:red;">Out Of Stock</i></p>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<p class="stock">Stock: ${product.product_stock}</p>
	                        		<button class="add_cart" onclick="addToCart('${product.product_id}','addToCart')">Place Order</button>
	                        	</c:otherwise>
	                        </c:choose>
	                </div>
            </c:forEach>
            <!-- applying brand and category filters -->
            <%}else if(brand!=null && !brand.isEmpty() && cate!=null && !cate.isEmpty()){ %>
             <sql:query var="products" dataSource="${dbConnection}">
            	SELECT * FROM product WHERE product_brand = "<%=brand %>" AND product_category = "<%=cate%>" ;
            </sql:query>
            
            <c:forEach var="product" items="${products.rows}">
            		 <div class="product_card" id="${product.product_id}">
	                        <img src="http://localhost:8080/images/product/${product.p_image}" style="width:100%; height: 50%;">
	                        <p class="name">${product.product_name}</p>
	                        <p class="price">$ ${product.price}</p>
	                        <p class="desc">${product.product_desc}.</p>
	                        <c:choose>
	                        	<c:when test="${product.product_stock <=0}">
	                        		<p class="stock">Stock: <i style="color:red;">Out Of Stock</i></p>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<p class="stock">Stock: ${product.product_stock}</p>
	                        		<button class="add_cart" onclick="addToCart('${product.product_id}','addToCart')">Place Order</button>
	                        	</c:otherwise>
	                        </c:choose>
	                </div>
            </c:forEach>
            <!-- applying sorting filter -->
            <%}else if (sort!=null && !sort.isEmpty()){ %>
            
            <c:set var="sort" value="${param.sort}"/>
            <c:choose>
	<c:when test="${sort == 'high_price'}">
		<sql:query var="sort_product" dataSource="${dbConnection}">
			SELECT * FROM product ORDER BY price DESC
		</sql:query>
		<c:forEach var="product" items="${sort_product.rows}">
			<div class="product_card" id="${product.product_id}">
				<img src="http://localhost:8080/images/product/${product.p_image}" style="width:100%; height: 50%;">
				<p class="name">${product.product_name}</p>
				<p class="price">$ ${product.price}</p>
				<p class="desc">${product.product_desc}.</p>
				<c:choose>
					<c:when test="${product.product_stock <= 0}">
						<p class="stock">Stock: <i style="color:red;">Out Of Stock</i></p>
					</c:when>
					<c:otherwise>
						<p class="stock">Stock: ${product.product_stock}</p>
						<button class="add_cart" onclick="addToCart('${product.product_id}','addToCart')">Place Order</button>
					</c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<sql:query var="sort_product" dataSource="${dbConnection}">
		SELECT * FROM product ORDER BY price ASC
		</sql:query>
		<c:forEach var="product" items="${sort_product.rows}">
			<div class="product_card" id="${product.product_id}">
				<img src="http://localhost:8080/images/product/${product.p_image}" style="width:100%; height: 50%;">
				<p class="name">${product.product_name}</p>
				<p class="price">$ ${product.price}</p>
				<p class="desc">${product.product_desc}.</p>
				<c:choose>
					<c:when test="${product.product_stock <= 0}">
						<p class="stock">Stock: <i style="color:red;">Out Of Stock</i></p>
					</c:when>
					<c:otherwise>
						<p class="stock">Stock: ${product.product_stock}</p>
						<button class="add_cart" onclick="addToCart('${product.product_id}','addToCart')">Place Order</button>
					</c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>

	           <!-- diplaying all products in default -->
            <%}else{ %>
            <sql:query var="products" dataSource="${dbConnection}">
            	SELECT * FROM product;
            </sql:query>
            <c:forEach var="product" items="${products.rows}">
            		 <div class="product_card" id="${product.product_id}">
	                        <img src="http://localhost:8080/images/product/${product.p_image}" style="width:100%; height: 50%;">
	                        <p class="name">${product.product_name}</p>
	                        <p class="price">$ ${product.price}</p>
	                        <p class="desc">${product.product_desc}.</p>
	                        <c:choose>
	                        	<c:when test="${product.product_stock <= 0}">
	                        		<p class="stock">Stock: <i style="color:red;">Out Of Stock</i></p>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<p class="stock">Stock: ${product.product_stock}</p>
	                        		<button class="add_cart" onclick="addToCart('${product.product_id}','addToCart')">Place Order</button>
	                        	</c:otherwise>
	                        </c:choose>    
	                </div>
            </c:forEach>
            <%} %>
                
                
            </div>
            
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
</body>
<script type="text/javascript">
function menuToggle() {
    const toggleMenu = document.querySelector(".menu");
    toggleMenu.classList.toggle("active");
  }

function addToCart(id, addToCart) {
    window.location.href = '<%= request.getContextPath() %>/AddCart?action=' + addToCart + '&id=' + id;
}
</script>
</html>