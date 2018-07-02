
<%
	List<Demo> li = DemoInfo.getAllDemo();
	int i=1;
%>

<div class="panel panel-heading">
	<h3>Demo Requests</h3>
</div>
<div class="panel panel-body tableText">
	<table id="myTable" class="table table-hover table-bordered"
		">
		<thead>
			<tr class="tableHeader">
				<th>Id</th>
				<th>Farmer Name</th>
				<th>Machine Name</th>
				<th>Demo Date</th>
				<th>Address</th>
				<th>Mobile</th>
				<th>Action</th>
			</tr>
		</thead>

		<tbody>

			<%for(Demo p:li){ %>
			<tr>
				<td><%=i++ %></td>
				<td><%=p.getFarmer().getFarmerName() %></td>
				<td><%=p.getMachinary().getMachineName() %></td>
				<td><%=p.getDate() %></td>
				<td><%=p.getAddress() %></td>
				<td><%=p.getMobile() %></td>
				<td><a href="../deleteFarmer?id=<%=p.getDemoId()%>">
						<button class="btn btn-primary">Delete</button>
				</a></td>
			</tr>
			<%} %>
		</tbody>

	</table>

</div>


<script>
		$('#myTable').DataTable();
	</script>


