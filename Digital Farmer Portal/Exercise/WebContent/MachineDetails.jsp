<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="java.util.*,com.pojo.*,FarmerPortal.*,java.lang.*,java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="Navbar.jsp"%>
</head>
<body>
	<%
		Farmer fr=null;
		GlobList.link="";
		Machinary ma = MachinaryInfo.getMachinaryById(Integer.parseInt(request.getParameter("id")));
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String strDate = formatter.format(date);
		HttpSession ses2 = request.getSession();
		String str = (String) ses2.getAttribute("frmrName");
		if(!(ses2.getAttribute("frmrId")==null))
		{
			int id=(int)ses2.getAttribute("frmrId");
			fr=FarmersInfo.getInfoById(id);
		}
	%>
	<br><br><br><br><br>
	<div clas="container">
		<div class="row subText">
			<div class="col-lg-6">
				<h2>Specifiction :-</h2>
				<table class="table table-bordered table-hover">
					<tr>
						<th>Name :-</th>
						<td><%=ma.getMachineName()%></td>
					</tr>
					<tr>
						<th>Engine HP :-</th>
						<td><%=ma.getEngineHp()%></td>
					</tr>
					<tr>
						<th>Machine RPM :-</th>
						<td><%=ma.getEngineRpm()%></td>
					</tr>
					<tr>
						<th>Gears :-</th>
						<td><%=ma.getGears()%></td>
					</tr>
					<tr>
						<th>Speed :-</th>
						<td><%=ma.getSpeed()%></td>
					</tr>
					<tr>
						<th>Front Tire Length :-</th>
						<td><%=ma.getFrontTyre()%></td>
					</tr>
					<tr>
						<th>Rear Tire Length :-</th>
						<td><%=ma.getRearTyre()%></td>
					</tr>
					<tr>
						<th>Lift Capacity :-</th>
						<td><%=ma.getLiftCapacity()%></td>
					</tr>
					<tr>
						<th>Fuel Capacity :-</th>
						<td><%=ma.getFuelCapacity()%></td>
					</tr>
				</table>
			</div>
			<div class="col-lg-6">

				<form class="form-group" action="DemoRequest">
					<h1>Demo Form :-</h1>
					
					<%if(fr==null) {%>
					
					<input type="text" class="form-control"
						placeholder="Farmers Name :-"><br> <input type="text"
						class="form-control" placeholder="Enter Your Mobile Number :-"><br>
					<textarea rows="2" cols="102" class="form-control"
						placeholder="Farmer Address :-"></textarea>
					<br> <input type="text" class="form-control"
						value="<%=strDate%>"><br> <br>
						
						<%}else{ %>
						<input type="hidden" value="<%=request.getParameter("id") %>" name="hid">
						<input type="text" class="form-control"
						placeholder="Farmers Name :-" name="name" value="<%=fr.getFarmerName()%>"><br> <input type="text" name="mob"
						class="form-control" placeholder="Enter Your Mobile Number :-" value="<%=fr.getFarmerMobile()%>"><br>
					<textarea rows="2" cols="102" class="form-control"
						placeholder="Farmer Address :-" name="add"><%=fr.getAddress()%></textarea>
					<br> <input type="text" class="form-control"
						value="<%=strDate%>" name="date"><br> <br>
						<%} %>
					<%
						if (str != null) {
					%>
					<input type="submit" class="btn btn-success form-control"
						value="Request Demo" />
					<%
						} else {
					%>
					<input type="button" id="sub" value="Log In First"
						class="btn btn-danger  form-control">
					<%
						}
					%>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("#sub").click(function() {

			$("#myModal").modal();

		});		
	</script>



</body>
<%@include file="Footer.jsp" %>
</html>