<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="FarmerPortal.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
</head>

<body>
	<%@include file="AdminHeader.jsp"%>

	<form id="Form1" runat="server">

		<section id="container" class=""> <section id="main-content">
		<section class="wrapper"> <!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>Dashboard
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="AdminHome.jsp">Home</a></li>
					<li><i class="fa fa-laptop"></i>Dashboard</li>
				</ol>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<a href="AddProduct.jsp" >
					<div class="info-box linkedin-bg">
						<i class="fa fa-cubes"></i>
						<div class="count"><%=ProductInfo.countOfProducts()%></div>
						<div class="title">
							<span style="color: white;">Products</span>

						</div>
					</div>
				</a>
			</div>

			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<a href="ViewAllFarmer.jsp">
					<div class="info-box twitter-bg">
						<i class="fa fa-tree"></i>
						<div class="count"><%=FarmersInfo.countOfFarmer()%></div>
						<div class="title">
							<span style="color: white;">Farmers</span>
						</div>
					</div>
				</a>
			</div>

			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<a href="AddProductType.jsp">
					<div class="info-box teal-bg">
						<i class="fa fa-tags"></i>
						<div class="count"><%=ProductTypeInfo.countOfProductType() %></div>
						<div class="title">
							<span style="color: white;">Product Type</span>
						</div>
					</div>
				</a>

			</div>

			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<a href="AddMachinary.jsp">
					<div class="info-box facebook-bg">
						<i class="fa fa-truck"></i>
						<div class="count"><%=MachinaryInfo.countOfMachinary() %></div>
						<div class="title">
							<span style="color: white;">Machinery</span>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<a href="ViewAllContact.jsp">
					<div class="info-box purple-bg">
						<i class="fa fa-paper-plane-o"></i>
						<div class="count"><%=ContactInfo.countOfContacts()%></div>
						<div class="title">
							<span style="color: white;">Feedbacks</span>
						</div>
					</div>
				</a>

			</div>
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<a href="ViewAllTest.jsp">
					<div class="info-box lime-bg">
						<i class="	fa fa-search"></i>
						<div class="count"><%=SoilTestInfo.countOfSoilTests() %></div>
						<div class="title">
							<span style="color: white;">Soil Tests</span>
						</div>
					</div>
				</a>

			</div>

			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<a href="Purchase.jsp">
					<div class="info-box magenta-bg">
						<i class="	fa fa-search"></i>
						<div class="count"><%=PurchaseInfo.countOfPurchases() %></div>
						<div class="title">
							<span style="color: white;">Purchase Orders</span>
						</div>
					</div>
				</a>

			</div>
			
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<a href="Demo.jsp">
					<div class="info-box teal-bg">
						<i class="	fa fa-search"></i>
						<div class="count"><%=DemoInfo.getDemoCnt() %></div>
						<div class="title">
							<span style="color: white;">Demo Requests</span>
						</div>
					</div>
				</a>

			</div>

		</div>


		</section> </section> </section>
	</form>
</body>

</html>

