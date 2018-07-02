<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="FarmerPortal.*,com.pojo.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%@include file="AdminHeader.jsp"%>

	<%
		List<SoilTest> li = SoilTestInfo.getAllSoilTests();
		
		request.setAttribute("list", li);
		
		System.out.println("Size = " + li.size());
		int cnt = ProductInfo.countOfProducts() + 1;
		int i = 1;
	%>


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
				<th>Test ID</th>
				<th>Farmer Name</th>
				<th>Total Land</th>
				<th>Soil Type</th>
				<th>Crops</th>
				<th>Test Date</th>
				<th>Address</th>
				<th>Mobile</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="u">
				<tr>
					<td><%=i++ %></td>
					<td>${u.getFarmer().getFarmerName()}</td>
					<td>${u.getFarmer().getTotalLand()}</td>
					<td>${u.getFarmer().getSoilType()}</td>
					<td>${u.getFarmer().getCrops()}</td>
					<td>${u.getTestDate()}</td>
					<td>${u.getAddress()}</td>
					<td>${u.getMobile()}</td>
					<td><a href="../DeleteTest?id=${u.getTestId()}">
							<button class="btn btn-primary">Delete</button>
					</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>
</section></section>
	<script>

	$('#myTable').DataTable();
</script>
</body>
</html>