<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@include file="Navbar.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*,com.pojo.*,FarmerPortal.*"%>

<body>
	<%
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String strDate = formatter.format(date);
		Map<Product, Integer> c = GlobList.getCart();
		String fname = (String) ses.getAttribute("frmrName");
		Integer fid = Integer.parseInt(ses.getAttribute("frmrId").toString());
		Farmer fr = FarmersInfo.getInfoById(fid);
		int total = 0;
	%>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container wrapper">

		<div class="row cart-body subText">
			<form class="form-horizontal" method="post" action="Checkout">
				<div class="col-lg-6 ">
					<!--REVIEW ORDER-->
					<div class="panel panel-info">
						<div class="panel-heading">Review Order</div>


						<div class="panel-body">
							<%
								for (Map.Entry<Product, Integer> mp : c.entrySet()) {
									total = total + (mp.getKey().getPrice() * mp.getValue());
							%>
							<div class="form-group">
								<div class="col-sm-3 col-xs-3">
									<img class="img-responsive"
										src="data:image/png;base64,<%=Base64.getEncoder().encodeToString(mp.getKey().getProductImg())%>" />
								</div>
								<div class="col-sm-6 col-xs-6">
									<div class="col-xs-12"><%=mp.getKey().getProductName()%></div>
									<div class="col-xs-12">
										<small>Quantity:<span><%=mp.getValue()%></span></small>
									</div>
								</div>
								<div class="col-sm-3 col-xs-3 text-right">
									<h6>
										<span>&#x20B9;</span><%=mp.getKey().getPrice() * mp.getValue()%></h6>
								</div>
							</div>
							<%
								}
							%>
						</div>

						<div class="form-group">
							<div class="col-xs-12">
								<strong>Order Total</strong>
								<div class="pull-right">
									<span>&#x20B9;</span><span><%=total%> </span>
								</div>
							</div>
						</div>
					</div>

				</div>

				<!--REVIEW ORDER END-->

				<div class="col-lg-6 ">
					<!--SHIPPING METHOD-->
					<div class="panel panel-info">
						<div class="panel-heading">Address</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-md-12">
									<h4>Shipping Address</h4>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12 col-xs-12">
									<strong>First Name:</strong> <input type="text"
										name="name" class="form-control"
										value="<%=fr.getFarmerName()%>" disabled />
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12 col-xs-12">
									<strong>Date:</strong> <input type="text" name="date"
										class="form-control" value="<%=strDate%>" disabled />
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12">
									<strong>Address:</strong>
								</div>
								<div class="col-md-12">
									<textarea type="text" name="add" class="form-control"
										value=""><%=fr.getAddress()%></textarea>
								</div>
							</div>


							<div class="form-group">
								<div class="col-md-12">
									<strong>Phone Number:</strong>
								</div>
								<div class="col-md-12">
									<input type="text" name="mob" class="form-control"
										value="<%=fr.getFarmerMobile()%>" />
								</div>
							</div>

						</div>
					</div>
					<!--SHIPPING METHOD END-->
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<button type="submit" class="btn btn-primary btn-submit-fix">Place
								Order</button>
						</div>
					</div>
				</div>
			</form>

		</div>
	</div>
</body>
<%@include file="Footer.jsp"%>
</html>