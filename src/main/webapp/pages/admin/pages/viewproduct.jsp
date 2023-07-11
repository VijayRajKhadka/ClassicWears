<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    <sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/classicwears" user="root" password=""/>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page import="resources.MyConstants" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Products</title>
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

.leftpanel a{
	color:rgb(135, 131, 131);
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
	overflow:scroll;
    overflow-x: hidden;
	padding: 10px;
	width:80%;
    height: 420px;
    background-color: rgb(236, 231, 231);
}

.product_card{
	float:left;
    width: 300px;
    height: 470px;
    background-color: rgb(255, 255, 255);
    margin-left: 10px;
    margin-top: 10px;
    margin-bottom: 15px;
    border-radius: 30px;
}
.product_id{
    margin-top: 1px;
    font-family: Georgia, 'Times New Roman', Times, serif;
    text-align: center;
}
.price{
    font-family: Georgia, 'Times New Roman', Times, serif;
    float: left;
    margin-left: 15px;
    margin-top: -20px;
    text-align: center;text-align: center;
}
.stock{
    float: right;
    margin-top: -90px;
    margin-right: 30px;
    font-family: Georgia, 'Times New Roman', Times, serif;
}
.name{
    text-align: center;
    margin-top: -40px;
    font-family: Georgia, 'Times New Roman', Times, serif;
}
.desc{
    margin-left: 8px;
    margin-top: -35px;
    float: left;
    font-family: Georgia, 'Times New Roman', Times, serif;
}
.rate{
    float: left;
    margin-left: -40px;
    margin-top: 20px;
    font-family: Georgia, 'Times New Roman', Times, serif;

}
.view{
    padding: 15px;
    width: 110px;
    margin-left: 30px;
	border: 1px solid grey;
    border-radius: 12px;
    background-color: #2f94d7;
    color:white;
    box-shadow: 3px 3px rgb(223, 220, 220);
}
.view:hover{
    box-shadow: 3px 3px rgb(198, 197, 197);
    background-color: #946b36;
}
.
.grid{
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
		<a class="active" href="<%= request.getContextPath() %>/pages/admin/pages/product.jsp">Products</a>
		<a href="<%= request.getContextPath() %>/pages/admin/pages/admin_orderplacement.jsp">Order Placements</a>
		<a href="<%= request.getContextPath() %>/pages/admin/pages/admin_userlist.jsp">User List</a>
	</div>
	<br>
    <div class="leftpanel">
        <hr width="85%">
		<a href="<%= request.getContextPath() %>/pages/admin/pages/addproduct.jsp" style="color: #482b05; font-size: 23px;">Add Products</a><br/>
        <hr width="85%" >
		<a href="<%= request.getContextPath() %>/pages/admin/pages/editproducts.jsp">Edit Products</a><br/>
        <hr width="85%">
		<a  class="active" href="<%= request.getContextPath() %>/pages/admin/pages/viewproduct.jsp">View Products</a><br/>
        <hr width="85%">
	</div>
	
		
		<div class="rightpanel" >
					<div class="grid">
					
					<!-- getting connection using jstl query tag -->
				    <sql:query var="products" dataSource="${dbConnection}">
						<%=MyConstants.PRODUCTS%> 
					</sql:query>
					
					<!-- Using core tag to run loop -->
	    <c:forEach var="product" items="${products.rows}">
	    	<div class="product_card" id="${product.id}">
				<img src="http://localhost:8080/images/product/${product.p_image}"style="width:100%; height: 45%;">
				
				<!-- getting values and displaying -->
				<p>Product Name= ${product.product_name}</p>
				<p>Description= ${product.product_desc}</p>
				<p>Price= ${product.price}</p>
				<p>Stock quantity= ${product.product_stock}</p>
				<p>Brand= ${product.product_brand}</p>
				<p>Category= ${product.product_category}</p>
			</div>
		</c:forEach>
				    
				   </div>
		</div>
				
<script>

</script>
</body>
</html>