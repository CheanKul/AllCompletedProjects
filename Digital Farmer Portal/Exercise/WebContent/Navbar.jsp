<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="Loginmodal.jsp"%>
<%@page import="java.util.*,com.pojo.*,FarmerPortal.*"%>

</head>

<body>
	<%
	Farmer frmr=null;
		List<ProductType> productTypes = ProductTypeInfo.getProductTypeNav();
		request.setAttribute("proType", productTypes);
		HttpSession ses = request.getSession();
		String f = (String) ses.getAttribute("frmrName");
		if(f!=null)
		{
			Integer frmrid=(int)ses.getAttribute("frmrId");
			frmr=FarmersInfo.getInfoById(frmrid);
		}
	%>
	<!--NavBar -->
	<div id="topheader">
		<nav class="navbar navbar-fixed-top navbar-default"
			style="background-color:#f9f9f9; border:none;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#myNavbar">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<div class="col-md-1"></div>
						<a href="Index.jsp" class="header" style="text-decoration: none;"><img
							src="img/logos/FinalLogo.png" style="width: 100%; height: 50px;" /></a>
					</div>
				</div>
				<div class="col-md-7" style="padding: 0px;">
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav headerNew" style="margin-top: 0px;">
							<li class="active navli"><a href="Index.jsp"><b>Home</b></a></li>
							<li class="dropdown"><a class="dropdown-toggle navli"
								data-toggle="dropdown" href="#"><b>Major Crops</b><span
									class="caret"></span></a>
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
								</ul></li>
							<li class="dropdown"><a href="#"
								class="dropdown-toggle navli" data-toggle="dropdown"><b>Seeds</b><span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<c:forEach items="${proType}" var="u">

										<li><a href="DisplayProduct.jsp?id=${u.getId() }">${u.getProductType()}</a></li>
										<li class="divider"></li>
									</c:forEach>
								</ul></li>
							<li class="navli"><a href="Mechinary.jsp"><b>Machinery
								</b></a></li>
							<li class="navli"><a href="Fertilizers&Pesticides.jsp"><b>Fertilisers
										& Pesticides </b></a></li>
							<li class="navli"><a href="soiltest.jsp"><b>Soil
										Testing </b></a></li>
							<li class="navli"><a href="ContactUs.jsp"><b>Contact
										Us</b></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3" style="padding: 0px;">
					<ul class="nav navbar-nav">
						<%
							if (f == null) {
						%>


						<li><a href="Registration.jsp"><span
								class="glyphicon glyphicon-user"></span> Be A Member</a></li>
						<li id="login" runat="server"><a href="#" data-toggle="modal"
							data-target="#myModal"><span
								class="glyphicon glyphicon-log-in"></span> Login</a></li>


						<%
							} else {
						%>


						<li class="dropdown"><a href="#" class="dropdown-toggle"
							style="padding: 0px;" data-toggle="dropdown">
							<%if(frmr.getGender().equals("Male")) {%>
							<img src="img/Avatar/avatar-05.png" height="50" width="50"> 
							<%}else{ %>
							<img src="img/Avatar/avatar-04.png" height="50" width="50">
							<%} %>
							<%=f%>
							<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="FarmerProfile.jsp"><i class="icon-cog"></i>
										Profile</a></li>
								<li class="divider"></li>
								<li><a href="FrmrLogout"><i class="fa fa-sign-out"></i>
										Logout</a></li>
							</ul></li>


						<%
							}
						%>
						<li><a href="ViewCart.jsp" ><span class="glyphicon glyphicon-shopping-cart"></span>Cart<span id="badge" > <%if(GlobList.cart.size()!=0){%><span class="badge" ><%=GlobList.cart.size()%></span></span><%}%> </a></li>
					</ul>
				</div>
			</div>
		</div>
		</nav>
	</div>
	<!--NavBar-->
</body>
</html>
