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
<title>Edit Profile</title>
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
    background-color: rgb(219, 215, 215);
    margin-top: 90px;
    display: flex;
    width: 100%;
    height: 500px;
    overflow: hidden;
}

.field{
    width: 30%;
    height: 480px;
    margin-top: 10px;
    margin-left: 36%;
    background-color: rgb(211, 149, 98);
    border-radius: 30px;
}
.image{
    width: 130px;
    height: 130px;
    background-color: rgb(160, 154, 154);
    border-radius: 50%;
    margin-top: 10px;
    margin-left: 35%;
    background-size: cover;
    overflow: hidden;
}
.user{
    width: 90%;
    height: 320px;
    margin-top: 10px;
    background-color: rgb(203, 203, 210);
    margin-left: 20px;
    border-radius: 30px;
    box-shadow: 5px 5px  rgb(177, 176, 176);
}
.user input{
    padding: 15px;
    margin-bottom: 10px;
    margin-left: 13%;
    margin-top: 10px;
    border: 2px gray;
    border-radius: 20px;
    width: 230px;
}
.user input:hover{
    box-shadow: 4px 4px rgb(150, 147, 147);
}
#submit{
    width: 100px;
    margin-left: 40%;
    margin-top: -1px;
    background-color: #cc8c57;
    box-shadow: 4px 4px rgb(190, 186, 186);
}
#submit:hover{
    box-shadow: 5px 5px  rgb(94, 93, 93);
    color: wheat;
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
                  <a href="<%=request.getContextPath()%>/pages/mycart.jsp">My Cart</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/pages/editProfile.jsp">Edit profile</a>
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
            <div class="field">
                    <div class="image">
					 <img src="http://localhost:8080/images/<%=image%>" style="width:100%" height=100%/>
                    </div>
                    
            <!-- getting connection using jstl query tag -->
            <sql:query var="user" dataSource="${dbConnection}">
            	SELECT * FROM user where user_id='<%=username%>';
            </sql:query>
            <c:forEach var="user_info" items="${user.rows}">
                    
                    <div class="user">
                        <form action="<%=request.getContextPath()%>/EditProfile" method="post">
                        	<input type="hidden" name="id" value="<%=username%>">
                            <input type="text" name="username" value="<%=name%>">
                            <input type="text" name="address" value="${user_info.address}">
                            <input type="password" name="old_pass" value="" placeholder="Old Password">
                            <input type="password" name="new_pass" value="" placeholder="New Password">
                            <input id="submit" type="submit" value="Edit"> 
                        </form>
                    </div>
                   </c:forEach>
            </div>
            
    </div>
	
</body>
<script>
<!-- javascript for togglling profile menu-->
function menuToggle() {
    const toggleMenu = document.querySelector(".menu");
    toggleMenu.classList.toggle("active");
  }
</script>

</html>