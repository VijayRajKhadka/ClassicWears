<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
</head>
<style><%@include file="../../../css/addproductstyle.css"%></style>
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
	
	<div class="leftpanel">
        <hr width="85%">
		<a class="active" href="<%= request.getContextPath() %>/pages/admin/pages/addproduct.jsp" style="color: #482b05; font-size: 23px;">Add Products</a><br/>
        <hr width="85%" >
		<a href="<%= request.getContextPath() %>/pages/admin/pages/editproducts.jsp">Edit Products</a><br/>
        <hr width="85%">
		<a href="<%= request.getContextPath() %>/pages/admin/pages/viewproduct.jsp">View Products</a><br/>
        <hr width="85%">
	</div>
		
		<div class="rightpanel" >
			<div class= "container">
				<form method="post" action="<%= request.getContextPath() %>/InsertProduct" enctype="multipart/form-data">
					<label for="name"> Product Name: </label>
					<input type="text" id="name" name="pname"/><br>
					
					<label for="des">Description: </label>
					<input type="text" id="des" name="desc" style="margin-left: 20px;" required/><br>
					
					<label for="price">Price: </label>
					<input type="text" id="price" name="price" style="margin-left: 66px;" required/><br>
					
					<label for="stock">Stock: </label>
					<input type="text" id="stock" name="stock" style="margin-left: 63px;" required/><br>
					
					<label for="brand">Brand: </label>
					<input type="text" id="brand" name="brand" style="margin-left: 60px;" required><br>
					
					<label for="category">Category: </label> 
					<select id="category" name="shoes" style="margin-left: 40px;" required >
						<option value="Casual">Casual</option>
					    <option value="Sport">Sport</option>
					    <option value="Sandals">Sandals</option>
					    <option value="Heels">Heels</option>
					  </select>
                      <input type="file" id="file" name="p_image" accept="image/*" required >
					<input type="submit" id="submit" value="Add"/>
				</form>
			</div>
		</div>

</body>
</html>