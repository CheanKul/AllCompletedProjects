<%@page import="FarmerPortal.FarmersInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="../css/AdminStyle.css" rel="stylesheet">
<link rel="icon" href="../img/logos/Face.png" type="image/x-icon">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- font icon -->
<link href="../css/elegant-icons-style.css" rel="stylesheet" />
<link href="../css/font-awesome.min.css" rel="stylesheet" />
<!-- Custom styles -->
<link href="../css/style.css" rel="stylesheet">
<link href="../css/style-responsive.css" rel="stylesheet" />
<!-- Data Tables -->
<script type="text/javascript"
	src="../js/DataTables-1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="../js/DataTables-1.10.16/js/dataTables.bootstrap.min.js"></script>
<!-- java script -->
<script src="../js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="../js/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../js/scripts.js"></script>
<script type="../text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>


<%
	HttpSession s = request.getSession(false);
	String n = (String) s.getAttribute("name");
	if (n == null) {
		response.sendRedirect("AdminLogin.jsp");
	}
%>


</head>
<body>
	<header class="header dark-bg">
	<div class="toggle-nav">
		<div class="icon-reorder tooltips"
			data-original-title="Toggle Navigation" data-placement="bottom">
			<i class="icon_menu"></i>
		</div>
	</div>

	<a href="AdminHome.jsp" class="logo">Welcome <span class="lite">
			<%
				out.println(n);
			%>
	</span></a>

	<div class="top-nav notification-row">
		<ul class="nav pull-right top-menu">
			<li><a href="../Logout"> <img
					src="../img/Avatar/avatar-03.png" width="50" height="50"
					style="position: relative; top: 0px;"></i>&nbsp;Log Out
			</a></li>
		</ul>
	</div>
	</header>


	<aside>
	<div id="sidebar" class="nav-collapse ">
		<ul class="sidebar-menu">
			<li class="active"><a class="arrow" href="AdminHome.jsp"> <i
					class="icon_house_alt"></i> <span>Dashboard</span>
			</a></li>
			<li class="sub-menu"><a href="javascript:;" class="arrow"> <i
					class="icon_document_alt"></i> <span>Collected Data</span> <span
					class="menu-arrow arrow_carrot-right"></span>
			</a>
				<ul class="sub">
					<li><a class="" href="AddProduct.jsp">Add Product</a></li>
					<li><a class="" href="ViewAllFarmer.jsp">Farmers</a></li>
					<li><a class="" href="AddProductType.jsp">Add Product Type</a></li>
					<li><a class="" href="AddMachinary.jsp">Add Machinery</a></li>
					<li><a class="" href="ViewAllContact.jsp">Feedbacks</a></li>
					<li><a class="" href="ViewAllTest.jsp">Soil Tests</a></li>
				</ul></li>
		</ul>
	</div>
	</aside>
</body>
</html>


