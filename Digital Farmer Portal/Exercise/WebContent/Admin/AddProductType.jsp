<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="FarmerPortal.*,java.util.*,com.pojo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="AdminHeader.jsp"%>

	<%
		List<ProductType> li = ProductTypeInfo.getAllProductType();
		request.setAttribute("list", li);
		out.println("Size ==" + li.size());
		int cnt = ProductTypeInfo.countOfProductType() + 1;
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
				<li><i class="fa fa-laptop"></i><a href="AddProductType.jsp">Add
						Product Type</a></li>
			</ol>
		</div>
	</div>


	<div class="panel panel-heading panel-title">
		<h3>Add Product Type</h3>
	</div>

	<div class="container">
		<form class="form" action="../AddProductType" method="post">

			<input type="text" class="form-control" name="id" value="<%=cnt%>" disabled="disabled"/> <br>
			<input type="text" class="form-control" name="productType" placeholder="Product Type" /> <br> 
			<input type="submit" value="Add" class="btn btn-success pull-right" />

		</form>
	</div>

	<br>
	<br>
	<br>
	<br>
	<div class="panel panel-body">
		<table id="myTable" class="table table-hover table-bordered"
			style="text-align: center; vertical-align: middle;">
			<thead>
				<tr class="tableHeader">
					<th>Id</th>
					<th>Product Type</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${list}" var="u">
					<tr>
						<td><%=i++%></td>
						<td>${u.getProductType()}</td>
						<td><a href="../deleteProductType?id=${u.getId()}">
								<button class="btn btn-primary">Delete</button>
						</a></td>
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