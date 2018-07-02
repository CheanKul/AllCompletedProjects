
<%
	List<SoilTest> li2 = SoilTestInfo.getAllSoilTests();

	request.setAttribute("list", li2);

	System.out.println("Size = " + li2.size());
	int cnt = ProductInfo.countOfProducts() + 1;
	int i2 = 1;
%>
<div class="panel panel-heading">
	<h3>Soil  Test Requests</h3>
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
					<td><%=i2++%></td>
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

<script>
	$('#myTable').DataTable();
</script>
