<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    <sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/classicwears" user="root" password=""/>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page import="resources.MyConstants" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>
<style>
body{
        background-color: rgb(147, 103, 55);
    }
    .head{
        width: 101.2%;
        height: 70px;
        background-color: white;
        margin-top: -10px;
        margin-left: -7px;
    }
    .head h1{
        font-family: Georgia, 'Times New Roman', Times, serif;
        color: #926c4f;
        margin-left: 300px;
        float: left;
    }
    .head input{
        float: right;
        width: 70px;
        padding: 10px;
        margin-top: 15px;
        margin-right: 20px;
        border-radius: 20px;
        background-color: rgb(211, 159, 104);;
    }
    .logo img{
    height: 60px;
    width: 250px;
    float:left;
    margin-left: 10px;
    margin-top: 10px;
}
.navbar{
    width: 100%;
	background-color:rgb(255, 255, 255);
	color:white;
	overflow:hidden;
	display:flex;
	opacity:0.9;
}

.navbar a{
	float: left;
	text-align: center;
	padding: 15px 20px;
	font-size: 20px;
	text-decoration: none;
    color: black;
}

.navbar a:hover{
	background-color: #b77a48;
	color: #f5f5f5;
    text-decoration: underline;
}

.navbar a.active{
	background-color: #b98961;
	color:rgb(255, 255, 255);
}

.leftpanel{
	background-color:rgb(255, 255, 255);
	overflow:hidden;
	width:15%;
    height: 400px;
	padding:20px;
    float: left;
}

.leftpanel p{
float:left;
	color:rgb(135, 131, 131);
	font-size: 20px;
	text-decoration: none;
    font-family: Georgia, 'Times New Roman', Times, serif;
}

.leftpanel p:hover{
    font-family: Georgia, 'Times New Roman', Times, serif;
    font-size: 23px;
	color: #482b05;
    transition: 0.5s;
}

.rightpanel{
	overflow:scroll;
    overflow-x: hidden;
	padding: 10px;
	width:98%;
    height: 420px;
    background-color: rgb(236, 231, 231);
}

.product_card{
	float:left;
    width: 200px;
    height: 350px;
    background-color: rgb(255, 255, 255);
    margin-left: 35px;
    margin-top: 10px;
    margin-bottom: 15px;
    border-radius: 30px;
}
.product_card p{
	font-family: Georgia, 'Times New Roman', Times, serif;
	text-aligh:centre;
	margin-left:15px
}
.grid{
	margin-top:-30px;
    width: 100%;
    display: grid;
    grid-template-columns: repeat(3,1fr);
}
</style>
<body>
	<div class="head">
        <div class="logo">
            <img src="<%= request.getContextPath() %>/photos/logo1.png"/>
            </div>
            <h1>Admin Panel</h1>
            <form action="<%=request.getContextPath() %>/userLogout" method="post"> 
                <input type="submit" name="logout" value="Logout">
            </form>
    </div>
	<div class="navbar">
		<a href="<%= request.getContextPath() %>/pages/admin/pages/product.jsp">Products</a>
		<a href="<%= request.getContextPath() %>/pages/admin/pages/admin_orderplacement.jsp">Order Placements</a>
		<a class="active" href="<%= request.getContextPath() %>/pages/admin/pages/admin_userlist.jsp">User List</a>
	</div>
	<br>

	
		
		<div class="rightpanel" >
		
		<!-- getting connection using jstl query tag -->
					<sql:query var="users" dataSource="${dbConnection}">
						<%=MyConstants.USER_DETAILS%>
			</sql:query>
			
			<!-- Using core tag to run loop -->
		    <c:forEach var="user" items="${users.rows}">
		    	<div class="product_card" id="${user.user_id}">
					<img src="http://localhost:8080/images/${user.image}" style="width:100%; height: 60%;">
					<!-- getting values and displaying-->
					<p>User ID= ${user.user_id}</p>
					<p>User Name= ${user.username}</p>
					<p>Address= ${user.address}</p></div>
			</c:forEach>
			</div>
</body>
</html>