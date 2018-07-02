<%@page import="java.util.jar.Attributes.Name"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!--Links-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/AdminStyle.css">
<link rel="stylesheet" href="../css/style.css">
<link href="http://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" href="../img/logos/Face.png" type="image/x-icon">
<!--Links-->

</head>

<body class="login-img2-body">
	<div class="container" id="container">
		<form action="../AdminCheck" method="post"
			class="login-form login-wrap">
			<h2 class="login-form-heading">Login</h2>

			<div class="form-control">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i> <input id="email" type="text"
					name="username" placeholder="Username" autocomplete="off"></span>
			</div>
			<br>
			<div class="form-control">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-lock"></i> <input id="password"
					type="password" name="pwd" placeholder="Password"></span>
			</div>
			<br> <br>
			<div class="input-group pull-right">
				<input type="submit" class="btn btn-login" value="Submit">
			</div>
		</form>
	</div>
</body>
</html>