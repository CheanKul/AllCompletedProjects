<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="FarmerPortal.*,java.util.*,com.pojo.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Farmer</title>


<%@include file="AdminHeader.jsp"%>
<%
	List<Farmer> li = FarmersInfo.getAllFarmer();
	request.setAttribute("list", li);
	int i=1;
%>
</head>
<body>

	<section id="main-content"> <section class="wrapper">


	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-laptop"></i>Collected Data
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="AdminHome.jsp">Home</a></li>
				<li><i class="fa fa-laptop"></i>Collected Data</li>
				<li><i class="fa fa-laptop"></i>Our Farmers</li>
			</ol>
		</div>
	</div>




	<div class="panel panel-heading">
		<h3>Farmer Info</h3>
	</div>
	<div class="panel panel-body tableText">

		<table id="myTable" class="table table-hover table-bordered"
			style="text-align: center; vertical-align: middle;">
			<thead>
				<tr class="tableHeader">
					<th>Id</th>
					<th>Name</th>
					<th>Username</th>
					<th>Password</th>
					<th>Email</th>
					<th>Gender</th>
					<th>Mobile</th>
					<th>Total Land</th>
					<th>Soil Type</th>
					<th>Crops</th>
					<th>Address</th>
					<th>State</th>
					<th>City</th>
					<th>Block</th>
					<th>Zip</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${list}" var="u">
					<tr>
						<td><%=i++ %></td>
						<td>${u.getFarmerName()}</td>
						<td>${u.getFarmerUsername()}</td>
						<td>${u.getFarmerPassword()}</td>
						<td>${u.getFarmerEmail()}</td>
						<td>${u.getGender()}</td>
						<td>${u.getFarmerMobile()}</td>
						<td>${u.getTotalLand()}</td>
						<td>${u.getSoilType()}</td>
						<td>${u.getCrops()}</td>
						<td>${u.getAddress()}</td>
						<td>${u.getState()}</td>
						<td>${u.getCity()}</td>
						<td>${u.getBlock()}</td>
						<td>${u.getZip()}</td>
						<td><a href="../deleteFarmer?id=${u.getFarmerId()}">
						<button class="btn btn-primary">Delete</button></a></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>


	</section> </section>


	<script>
		$('#myTable').DataTable();
	</script>
</body>
</html>