<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>404 error</title>
</head>
<style>
	body{
        text-align: center;
        margin-top: 10%;
    }
    img{
    width:320px;
    height:300px;
    }
</style>
<body>
	<h1>OOPS, SOMETHING WENT WRONG ON OUR SERVER.</h1>
    <img src="<%= request.getContextPath() %>/photos/doge.jpg"/>
    <h2>PLEASE, Go Back to Continue</h2>
</body>
</html>