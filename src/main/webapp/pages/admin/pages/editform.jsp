<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Form</title>
</head>
<style><%@include file="../../../css/addproductstyle.css"%></style>
<body>
<div class="head">
        <div class="logo">
            <img src="/logo1.png"/>
            </div>
            <h1>Admin Panel</h1>
            <form action="<%=request.getContextPath() %>/userLogout" method="post">
                <input type="submit" name="logout" value="Logout">
            </form>
    </div>
	<div class="navbar">
		<a class="active" href="<%= request.getContextPath() %>/pages/product.jsp">Products</a>
		<a href="pages/usermanagement">Order Placements</a>
		<a href="pages/orderplacement">User List</a>
	</div>
	<br>
    <div class="leftpanel">
        <hr width="85%">
		<a class="active" href="<%= request.getContextPath() %>/pages/addproduct.jsp">Add Products</a><br/>
        <hr width="85%" >
		<a href="<%= request.getContextPath() %>/pages/editproducts.jsp" style="color: #482b05; font-size: 23px;">Edit Products</a><br/>
        <hr width="85%">
		<a href="<%= request.getContextPath() %>/pages/deleteproduct.jsp" >View Products</a><br/>
        <hr width="85%">
	</div>
	<div class="rightpanel" >
			<div class= "container">
				<form action="UpdateProduct" method="post">
					<label>Product ID:</label>
					<!--  getting product values and storing in values of input-->
					<input type="text" name="id" style="margin-left: 23px;"value="${product.id}" readonly><br>
    				<label for="name">Name:</label>
    				<input type="text" name="name" style="margin-left: 63px;" value="${product.name}"><br>
    				<label for="description">Description:</label>
    				<textarea name="description" style="margin-left: 35px" rows="6" cols="50">${product.desc} </textarea><br><br>
    				<label for="price">Price:</label>
    				<input type="number" name="price"  style="margin-left: 66px;" step="0.01" value="${product.price}" ><br>
    				<label for="stock" >Stock:</label>
    				<input type="number" name="stock" style="margin-left: 63px;"value="${product.stock}"><br>
    				<input type="submit" id="submit" value="Update">
				</form>
			</div>
		</div>

</body>
</html>