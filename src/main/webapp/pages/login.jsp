<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Login</title>
</head>
<style><%@include file="../css/login.css"%>
		<%@include file="../css/navbar2.css"%></style>
<body style="background-image: url('<c:url value='/photos/back1.jpg' />');">
	<div class="navbar">
        <div class="logo">
          <img src="<c:url value='/photos/logo1.png' />" >
        </div>
        <nav>
          <ul>
          <li><a class="nav-link nav-link-ltr" href="<%= request.getContextPath() %>/home.jsp">Home</a></li>
          <li><a class="nav-link nav-link-ltr" href="<%= request.getContextPath() %>/pages/about_us.jsp">About Us</a></li>
          <li><a class="nav-link nav-link-ltr" href="<%= request.getContextPath() %>/pages/contact_us.jsp">Contact Us</a></li>
          <div class="logsign">
          <a href="<%= request.getContextPath() %>/pages/login.jsp"><button class="log">Login</button></a>
          <a href="<%= request.getContextPath() %>/pages/register.jsp"><button class="log" >SignIn</button></a>
          </div>
          </ul>
          </nav>
          
    </div>

    <div class="main-container">
    <!--  getting attributes value from login servlet and storing in variable using jsp tags-->
    		<% 
	String registerdone = (String) request.getAttribute("RegisterDone");
	%>
	<% String invalid = (String) request.getAttribute("error");
	%>
	<% String notfound = (String) request.getAttribute("notfound");
	%>
	
	<!--  checking if registerdone has message-->
	<% if (registerdone != null) { %>
		    <div class="message">
            <div class="msg"><%= registerdone %> 
            </div>
        	</div>
		<% } %>
            <div class="form">
            <!-- chekcing if invalid has message -->
            <% if (invalid != null) {%>
            <div class="invalid_message">
            <div class="invalid_msg"><%= invalid %></div>
        	</div>
            
            <%} %>
            <!--  chekcing if notfound has message-->
            <% if (notfound != null) {%>
            <div class="notfound_message">
            <div class="notfound_msg"><%= notfound%></div>
        	</div>
            
            <%} %>
                <div class="title">
                    <h1>ClassicWears</h1>
                </div>
    				
            <form action="<%=request.getContextPath()%>/UserLogin" method="post" enctype="multipart/form-data"> 
                <label style="font-size: 25px; font-family: Georgia, 'Times New Roman', Times, serif; margin-left: 55px;">Login</label>
                <br>
                <br>
                <input class="input_box" type="text" name="id" placeholder="Phone Number (9 digits only)" required> 
                <br>
                <br>
                <input class="input_box" type="password" name="pass" placeholder="Password" required>
                <br>
                <br>
                <br>
                <input class="submit_btn" type="submit" value="Login" style="margin-left: 55px;">
            </form>
            <br>
            <label style="font-size: 13px; margin-left: 100px;">Don't Have Account yet?<a href="<%= request.getContextPath() %>/pages/register.jsp">Register</a></label>
            </div>
        
    </div>
	
</body>

</html>