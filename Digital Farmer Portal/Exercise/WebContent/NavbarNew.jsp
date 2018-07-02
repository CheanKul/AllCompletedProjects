<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!--Links-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="css/IndexStyle.css" rel="stylesheet">
<link rel="icon" href="img/logos/Face.png" type="image/x-icon">
<link href="css/Footer.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Berkshire+Swash|Cutive"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--Links-->

<%@page import="java.util.*,com.pojo.*,FarmerPortal.*" %>

</head>

<body>
<%
	List<ProductType> productTypes=ProductTypeInfo.getAllProductType();
	request.setAttribute("proType", productTypes);
%>
    <!--NavBar -->      
    <div id="topheader">
      	<nav class="navbar navbar-fixed-top navbar-default" style="background-color:#f9f9f9; border:none;"   >
        	<div class="container-fluid">
		  		<div class="row" >
					<div class="col-md-3" >
			  			<div class="navbar-header">
				  			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>                        
				   			</button>
				   			<div class="col-md-1"></div>
					   		<a href="Index.jsp" class="header" style="text-decoration:none;"><img src="img/logos/FinalLogo.png" style="width:100%; height:50px;"/></a>
						</div>
					</div>
					<div class="col-md-7" style="padding: 0px;">		
			  			<div class="collapse navbar-collapse" id="myNavbar">
							<ul class="nav navbar-nav headerNew" style="margin-top:0px;">
					  			<li class="active navli" ><a href="Index.jsp" ><b>Home</b></a></li>
					  			<li class="dropdown" >
									<a class="dropdown-toggle navli" data-toggle="dropdown" href="#" ><b>Major Crops</b><span class="caret"></span></a>
						  			<ul class="dropdown-menu">
										<li><a href="wheat.jsp">Wheat</a></li>
										<li class="divider"></li>
										<li><a href="Pulses.jsp">Pulses</a></li>
										<li class="divider"></li>
										<li><a href="Maize.jsp">Maize</a></li>
										<li class="divider"></li>
										<li><a href="Rice.jsp">Rice</a></li>
										<li class="divider"></li>
										<li><a href="Sugarcane.jsp">Sugarcane</a></li>
										<li class="divider"></li>
										<li><a href="jute.jsp">Jute</a></li>
						  			</ul>
								</li>
								<li class="dropdown" >
						  			<a class="dropdown-toggle navli" data-toggle="dropdown"><b>Seeds</b><span class="caret"></span></a>
						  			<ul class="dropdown-menu">
										<c:forEach items="${proType}" var="u">
										
										<li><a href="DisplayProduct.jsp?id=${u.getId() }">${u.getProductType()}</a></li>
										<li class="divider"></li>
										</c:forEach>
								  	</ul>
								</li>
								<li class="navli" ><a href="Mechinary.jsp" ><b>Machinery </b></a></li>
								<li class="navli" ><a href="Fertilizers&Pesticides.jsp" ><b>Fertilizers & Pesticides </b></a></li>
								<li class="navli" ><a href="soiltest.jsp" ><b>Soil Testing </b></a></li>
								<li class="navli" ><a href="ContactUs.jsp" ><b>Contact Us</b></a></li>
					  		</ul>
						</div>
					</div>
					<div class="col-md-2" style="padding: 0px;">
			 		<ul class="nav navbar-nav  pull-right">
				  		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>&nbsp;&nbsp;Welcome, User <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="/user/preferences"><i class="icon-cog"></i> Preferences</a></li>
                            <li><a href="/help/support"><i class="icon-envelope"></i> Contact Support</a></li>
                            <li class="divider"></li>
                            <li><a href="/auth/logout"><i class="fa fa-sign-out"></i> Logout</a></li>
                        </ul>
                    </li> 
					</ul>
					</div>		
		  		</div>
        	</div>  
        </nav>
    </div>
	<!--NavBar-->
</body>
</html>
