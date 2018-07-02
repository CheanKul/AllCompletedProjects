<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page
	import="java.util.*,com.pojo.*,FarmerPortal.*,java.lang.*,java.text.SimpleDateFormat"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%@include file="Navbar.jsp"%>

</head>


<body>
	<%
		Farmer fr = null;
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String strDate = formatter.format(date);
		if (!(ses.getAttribute("frmrId") == null)) {
			int id = (int) ses.getAttribute("frmrId");
			fr = FarmersInfo.getInfoById(id);
		}
	%>


	<div class="row" style="margin-top: 60px;">

		<div class="col-lg-12" style="border-bottom: groove 2px;">
			<label class="text-info" style="font-size: 24px;">For Soil
				Testing Fill Up The Below Form :-</label>
		</div>

	</div>

	<div class="row subText">
		<div class="col-lg-3"></div>
		<div class="col-lg-6" style="margin-top: 40px;">
			<label class="text-primary">Enter Your Details Below To
				Request Soil Testing:-</label>

			<form class="form-group" action="AddSoilTest">
				<%
					if (fr == null) {
				%>

				<input type="text" class="form-control"
					placeholder="Farmers Name :-">
				<br> <input type="text" class="form-control"
					placeholder="Enter Your Mobile Number :-">
				<br>
				<textarea rows="2" cols="102" class="form-control"
					placeholder="Farmer Address :-"></textarea>
				
				<br> <input type="text" class="form-control"
					placeholder="Date :-" style="margin-top: 15px;"
					value="<%=strDate%>"><br>
				
				<%
					} else {
				%>

				<input type="text" class="form-control"
					placeholder="Farmers Name :-" value="<%=fr.getFarmerName()%>"
					name="name">
				<br> <input type="text" class="form-control"
					placeholder="Enter Your Mobile Number :-" name="mob"
					value="<%=fr.getFarmerMobile()%>">
				<br>
				<textarea rows="2" cols="102" class="form-control"
					placeholder="Farmer Address :-" name="add"><%=fr.getAddress()%></textarea>
				
				<br> <input type="text" class="form-control"
					placeholder="Date :-" style="margin-top: 15px;"
					value="<%=strDate%>" name="date"><br>
				
				<%
					}
				%>

				<label class="text-primary" style="margin-top: 15px;">
					Choose Soil Type :-</label><br>
				<div class="form-group">
					<label class="text-primary"><span class="fa fa-transgender"></span>
						Soil Type</label> <select class="form-control selectpicker" title="Gender"
						name="soilType">
						<option>Red</option>
						<option>Black</option>
					</select>
				</div>
				<br>
				<input type="text" class="form-control"
					placeholder="Total Land(in sq.ft) :-" name="totalLand"><br>
					
					<input type="text" class="form-control"
					placeholder="Taking Crops :-" name="crops"><br>


				<%
					if (fr == null) {
				%>
				<input type="button" class="btn btn-danger form-control" id="sub"
					style="margin-top: 15px;" value="Login First" />
				<%
					} else {
				%>
				<input type="submit" class="btn btn-success form-control" 
					style="margin-top: 15px;" value="Test Soil" />
				<%
					}
				%>

			</form>


		</div>
		<div class="col-lg-3"></div>
	</div>


<script type="text/javascript">
		$("#sub").click(function() {

			$("#myModal").modal();

		});		
	</script>


</body>
<%@ include file="Footer.jsp"%>
</html>
