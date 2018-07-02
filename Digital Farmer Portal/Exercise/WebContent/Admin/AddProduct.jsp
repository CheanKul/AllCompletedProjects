<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="FarmerPortal.*,com.pojo.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>

</head>
<body>
	<%@include file="AdminHeader.jsp"%>
	<%@include file="UpdateProduct.jsp"%>
	<%
		List<ProductType> li = ProductTypeInfo.getAllProductType();
		List<Product> li2 = ProductInfo.getAllProducts();
		request.setAttribute("list", li);
		request.setAttribute("plist", li2);
		System.out.println("Size = " + li2.size());
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
				<li><i class="fa fa-laptop"></i><a href="AddProduct.jsp">Add
						Product</a></li>
			</ol>
		</div>
	</div>


	<div class="panel panel-heading">
		<h3>Add Products</h3>
	</div>

	<div class="container">
		<form class="form" action="../AddProduct" method="post"
			enctype="multipart/form-data">

			<input type="text" class="form-control" name="ID" value="<%=cnt%>"><br>
			<input type="text" class="form-control" name="pName"
				placeholder="Product Name"><br>
			<textarea rows="10" cols="" class="form-control" name="pDescription"
				placeholder="Product Description"></textarea>
			<br> <input type="text" class="form-control" name="pPrice"
				placeholder="Product Price"><br> <input type="text"
				class="form-control" name="pStock" placeholder="Product Stock"><br>

			<div class="form-group">
				<label><span class="fa fa-transgender"></span> Product Type</label>
				<select class="form-control selectpicker" title="Gender"
					name="pType">
					<c:forEach items="${list}" var="u">
						<option>${u.getProductType()}</option>
					</c:forEach>
				</select>
			</div>
			<br>


			<div class="form-group">
				<label><span class="fa fa-transgender"></span>Select Image</label> 
				<input type="file" name="pImage" class="form-group">
			</div>
			<br> <input type="submit" value="Add"
				class="btn btn-success pull-right">

		</form>
	</div>

	<br>
	<br>
	<br>
	<br>


	<div class="panel panel-body tableText">

		<table id="myTable" class="table table-hover table-bordered"
			style="text-align: center; vertical-align: middle;">
			<thead>
				<tr class="tableHeader">
					<th>Id</th>
					<th>Name</th>
					<th>Description</th>
					<th>Product Type</th>
					<th>Price</th>
					<th>Stock</th>
					<th>Image</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${plist}" var="u">
					<tr>
						<td><%=i++%></td>
						<td>${u.getProductName()}</td>
						<td>${u.getProductDescription()}</td>
						<td>${u.getProductType().getProductType()}</td>
						<td>${u.getPrice()}</td>
						<td>${u.getStockQty()}</td>
						<td><img
							src="data:image/png;base64,${Base64.getEncoder().encodeToString(u.getProductImg())}"></td>
						<td><a href="javascript:void(0);" class="product_update"
							data-info='{"productId":${u.getProductId()},"productType":"${u.getProductType().getProductType()}","productName":"${u.getProductName()}","description":"${u.getProductDescription()}","price":${u.getPrice()},"qty":${u.getStockQty()} }'>
								<button class="btn btn-primary" id="btn" data-toggle="modal"
									data-target="#myModal">Update</button>

						</a></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>

	</section></section>
	<script>
		$('#myTable').DataTable();

		$(document).on("click", "[class=product_update]", function(e) {

			var pro = $(this).data('info');

			console.log(pro);

			$("#product_form #id").val(pro.productId);
			$("#product_form #title").val(pro.productName);
			//$("#product_form #description").html(pro.description);
			$('#summernote').summernote('code', pro.description);
			$("#product_form #hd").val(pro.description);
			$("#product_form #productType").val(pro.productType);
			$("#product_form #price").val(pro.price);
			$("#product_form #stock").val(pro.qty);

		});
	</script>
</body>
</html>