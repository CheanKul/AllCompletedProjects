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
	<%@include file="UpdateMachine.jsp" %>
	<%
		List<Machinary> li=MachinaryInfo.getAllMachinary();
		List<Category> li2=CategoryInfo.getAllCategory();
		request.setAttribute("mList", li);
		System.out.print("list li:-"+li);
		request.setAttribute("cList", li2);
		/* System.out.print("Size " + li.size()); */
		int cnt=MachinaryInfo.countOfMachinary()+1;
		int i=1;
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
		<h3>Add Machinery</h3>
	</div>

	<div class="container">
		<form class="form" action="../AddMachinary" method="post"
			enctype="multipart/form-data">

			<input type="text" class="form-control" name="ID" value="<%=cnt%>"
				disabled="disabled"><br> <input type="text"
				class="form-control" name="mName" placeholder="Machinary Name"><br>
			<br> <input type="text" class="form-control" name="mHP"
				placeholder="Machinary HP"><br> <input type="text"
				class="form-control" name="mRPM" placeholder="Machinary RPM"><br>
			<input type="text" class="form-control" name="mGears"
				placeholder="Machinary Gears"><br> <input type="text"
				class="form-control" name="mSpeed" placeholder="Machinary Speed"><br>
			<input type="text" class="form-control" name="mFT"
				placeholder="Machinary Front Tyre Length"><br> <input
				type="text" class="form-control" name="mRT"
				placeholder="Machinary Rear Tyre Length"><br> <input
				type="text" class="form-control" name="mLift"
				placeholder="Machinary Lift Capacity"><br> <input
				type="text" class="form-control" name="mFuel"
				placeholder="Machinary Fuel Capacity"><br>

			<div class="form-group">
				<label><span class="fa fa-transgender"></span> Product Type</label>
				<select class="form-control selectpicker"
					name="cType">
					<c:forEach items="${cList}" var="u">
						<option>${u.getCategory()}</option>
					</c:forEach>
				</select>
			</div>



			<div class="form-group">
				<label><span class="fa fa-transgender"></span>Select Image</label> <input
					type="file" name="mImage" class="form-group">
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
					<th>Engine HP</th>
					<th>Engine RPM</th>
					<th>Gears</th>
					<th>Speed</th>
					<th>Front Tires</th>
					<th>Rear Tires</th>
					<th>Lift Capacity</th>
					<th>Fuel Capacity</th>
					<th>Image</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${mList}" var="u">
					<tr>
						<td><%=i++%></td>
						<td>${u.getMachineName()}</td>
						<td>${u.getEngineHp()}</td>
						<td>${u.getEngineRpm()}</td>
						<td>${u.getGears()}</td>
						<td>${u.getSpeed()}</td>
						
						<td>${u.getFrontTyre()}</td>
						<td>${u.getRearTyre()}</td>
						<td>${u.getLiftCapacity()}</td>
						<td>${u.getFuelCapacity()}</td>
						<td><img style="width: 200px; height: 200px;"
							src="data:image/png;base64,${Base64.getEncoder().encodeToString(u.getImage())}"></td>
						<td><a href="javascript:void(0);" class="product_update">
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

		/* var pro = $(this).data('info');

		console.log(pro);

		$("#product_form #id").val(pro.productId);
		$("#product_form #name").val(pro.productName);
		//$("#product_form #description").html(pro.description);
		$('#summernote').summernote('code', pro.description);
		$("#product_form #hd").val(pro.description);
		$("#product_form #productType").val(pro.productType);
		$("#product_form #price").val(pro.price);
		$("#product_form #stock").val(pro.qty);
 */
	});
	</script>


</body>
</html>