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
<title>Order Placement</title>

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
	margin-bottom:20px
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
    height: 380px;
	padding:20px;
    float: left;
}

.leftpanel a{
	color:rgb(167, 162, 162);
	font-size:15px;
	font-size: 20px;
	text-decoration: none;
    padding: 10px;
    font-family: Georgia, 'Times New Roman', Times, serif;
}

.leftpanel a:hover{
    font-family: Georgia, 'Times New Roman', Times, serif;
    font-size: 23px;
	color: #482b05;
    transition: 0.5s;
}

.rightpanel{
	display:flex;
	overflow:scroll;
	overflow-x:hidden;
	width:100%;
    height: 440px;
    background-color: rgb(236, 231, 231);
}
 table {
    width: 100%;
    border-collapse: collapse;
	height: 50px;
    text-align: center;
    font-family: Georgia, 'Times New Roman', Times, serif;
	
 }
 th, td {
	text-align: left;
	border-bottom: 1px solid #ddd;
	text-align:centre;
    
    padding: 10px;
 }
th {
background-color: #f2f2f2;
}
tr:hover {
 background-color: #f5f5f5;
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
		<a  href="<%=request.getContextPath()%>/pages/admin/pages/product.jsp">Products</a>
		<a class="active" href="<%= request.getContextPath() %>/pages/admin/pages/admin_orderplacement.jsp">Order Placements</a>
		<a href="<%=request.getContextPath()%>/pages/admin/pages/admin_userlist.jsp">User List</a>
	</div>

		

	<div class="rightpanel">
	
  		

		<table>
		
		<!-- getting connection using jstl query tag -->
		<sql:query var="orders" dataSource="${dbConnection}">
				<%=MyConstants.ORDER_SELECT%>
			</sql:query>
			<tr>
			<!-- defining toble columns -->
    		<th>Order ID</th>
    		<th>User ID</th>
    		<th>Product ID</th>
    		<th>Quantity</th>
    		<th>Price</th>
    		<th>Rating</th>
  		</tr>
  		
  		<!-- Using core tag to run loop -->
		    <c:forEach var="order" items="${orders.rows}">
		
  		<tr>
  			<!-- getting values and displaying in table rows -->
    		<td>${order.order_id}</td>
    		<td>${order.user_id}</td>
    		<td>${order.product_id}</td>
    		<td>${order.quantity}</td>
    		<td>${order.price}</td>
    		<td>${order.rating}</td>
  		</tr>
			</c:forEach>
			</table>
		</div>
</body>
</html>