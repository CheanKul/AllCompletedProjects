<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<%@include file="Navbar.jsp"%>
<style>
.modal-header, h4, .close {
	background-color: #000000;
	color: #fff !important;
	font-size: 30px;
}

.modal-header, .modal-body {
	padding: 40px 50px;
}
</style>

</head>
<body>
		<div class="row">
			<div class="col-sm-3"></div>

			<div class="col-sm-6">
				<div style="border: solid green 2px; background-color: lightcyan; margin-top: 70px; margin-bottom: 70px; border-radius: 10px;">

					<div class="modal-content">
						<div class="modal-header">

							<h4>
								<span class="glyphicon glyphicon-user"
									style="text-align: center;"></span>Register Here
							</h4>
						</div>
						<div class="modal-body subText">
							<form role="form" method="get" action="FarmerRegister">

								<div class="form-group">
									<label for="name"> <span
										class="glyphicon glyphicon-user" style="font-size: 20px;"></span>
										Enter Name
									</label> <input type="text" name="name" class="form-control"
										placeholder="Enter Name" autofocus required />

								</div>

								<div class="form-group">
									<label for="name"> <span
										class="glyphicon glyphicon-phone" style="font-size: 20px;"></span>
										Mobile Number
									</label> <input type="text" name="mobno" class="form-control"
										placeholder="Mobile Number" required />

								</div>

								<div class="form-group">
									<label for="name"> <span
										class="glyphicon glyphicon-user" style="font-size: 20px;"></span>
										Username
									</label> <input type="text" name="username" class="form-control"
										placeholder="Username" required />

								</div>

								<div class="form-group">
									<label for="name"> <span
										class="glyphicon glyphicon-lock" style="font-size: 20px;"></span>
										Password
									</label> <input type="password" name="password" class="form-control"
										placeholder="Password" required />

								</div>

								<div class="form-group">
									<label for="name"> <span
										class="glyphicon glyphicon-envelope" style="font-size: 20px;"></span>
										Email
									</label> <input type="text" name="email" class="form-control"
										placeholder="Email" required />

								</div>


								<div class="form-group">
								     <label><span class="fa fa-transgender"></span> Gender</label>
									      <select class="form-control selectpicker" title="Gender" name="gender"  >
											<option>Male</option>
											<option>Female</option>
      									  </select>
      							</div>
								
								
								<div class="form-group">
									<label for="name"> 
										<span class="fa fa-address-card" style="font-size: 20px;"></span>
										Address
									</label> 
									<input type="text" name="addr" class="form-control" placeholder="Address" required />

								</div>
								
								<div class="form-group">
									<label for="name"> 
										<span class="fa fa-fort-awesome" style="font-size: 20px;"></span>
										State
									</label> 
									<input type="text" name="state" class="form-control" placeholder="State" required />

								</div>
								
								<div class="form-group">
									<label for="name"> 
										<span class="fa fa-map-signs" style="font-size: 20px;"></span>
										City
									</label> 
									<input type="text" name="city" class="form-control" placeholder="City" required />

								</div>
								
								<div class="form-group">
									<label for="name"> 
										<span class="fa fa-building" style="font-size: 20px;"></span>
										Block
									</label> 
									<input type="text" name="block" class="form-control" placeholder="Block" required />

								</div>
								
								
								<div class="form-group">
									<label for="name"> 
										<span class="fa fa-map-marker" style="font-size: 20px;"></span>
										Zip Code
									</label> 
									<input type="text" name="zip" class="form-control" placeholder="Zip Code" required />

								</div>




								<br>

								<button type="submit" class="btn btn-danger btn-default pull-left" >
									<span class="glyphicon glyphicon-remove"></span><b> Cancel</b>
								</button>

								<button type="submit" class="btn btn-success pull-right">
									<b>Login</b> <span class="glyphicon glyphicon-ok"></span>
								</button>

								<br>

							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	
</body>
<%@include file="Footer.jsp"%>
</html>