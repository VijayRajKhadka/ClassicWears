<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<style><%@include file="../css/register.css"%>
		<%@include file="../css/navbar.css"%></style>
		
<body style="background-image: url('<c:url value='/photos/back1.jpg' />');">>

<div class="navbar">
        <div class="logo">
          <img src="<c:url value='../photos/logo1.png' />" alt="My Image">
          </div>
        <nav>
          <ul>
          <li><a class="nav-link nav-link-ltr" href="<%= request.getContextPath() %>/home.jsp">Home</a></li>
          <li><a class="nav-link nav-link-ltr" href="<%= request.getContextPath() %>/pages/about_us.jsp">About Us</a></li>
          <li><a class="nav-link nav-link-ltr" href="<%= request.getContextPath() %>/pages/contact_us.jsp">Contact Us</a></li>
          
          </ul>
          </nav>
    </div>
    
		<div class="main-container">
        
          
          <div class="form">
          	
          	<!-- form for registering -->
            <form action="<%=request.getContextPath()%>/UserRegister" method="post" enctype="multipart/form-data" >
            
            <div class="profile">
            <input type="file" id="image" name = "image" accept="image/*" required> 
          </div>
          	<br>
            <input class="input_box" type="text" name="user" placeholder="User Name" required> 
            <br>
            <br>
            <input class="input_box" type="text" name="id" placeholder="Phone Number (9 digit Only)" required> 
            <br>
            <br>
            <input class="input_box" type="text" name="address" placeholder="Address" required>
            <br>
            <br>
            <input class="input_box" type="password" name="pass" placeholder="Password" required>
            <br>
            <br>
            <br>
            <input class="submit_btn" type="submit" value="Register">
            </form>
            <br>
            <label style="font-size: 13px; margin-left: 85px;;">Have Account Already?<a href="<%= request.getContextPath() %>/pages/login.jsp">Login</a></label>
        </div>

    </div>
</body>
<script>

</script>
</html>