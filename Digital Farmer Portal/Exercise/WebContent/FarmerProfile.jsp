<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="Navbar.jsp"%>
</head>
<body>
	
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="panel btn-pref btn-group btn-group-justified " role="group"
		style="margin-top: 10px; height: 720px; wight: 900px; background-color: #adc;">
		<center>

			<div class="tabnav">
				<div class="btn-group btn-group-justified ">
					<div class="btn-group  " role="group">
						<button id="b1" type="button" class="btn btn-nav" href="#tab1"
							data-toggle="tab">
							<div class="visible">
								Profile <span class="glyphicon glyphicon-user"
									aria-hidden="true"> </span>
							</div>
						</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-nav" href="#tab2"
							data-toggle="tab">
							<div class="visible">
								Demo Requests <span class="glyphicon glyphicon-map-marker"
									aria-hidden="true"></span>
							</div>
						</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-nav" href="#tab3"
							data-toggle="tab">
							<div class="visible">
								Soil Tests <span class="glyphicon glyphicon-picture"
									aria-hidden="true"></span>
							</div>
						</button>
					</div>

					<div class="btn-group" role="group">
						<button type="button" class="btn btn-nav" href="#tab4"
							data-toggle="tab">

							<div class="visible">
								Product Cart <span class="glyphicon glyphicon-cloud-upload"
									aria-hidden="true"></span>
							</div>
						</button>
					</div>
				</div>
			</div>

			<div class="tab-content " style="margin-top: 10px;">
				<div class="tab-pane panel  active subText" id="tab1">
					<%@include file="ResetPassword.jsp" %>
					<form class="form" action="UpdateFarmer">
						
						<%@include file="Profile.jsp" %>
						
						
					</form>
				</div>
				<div class="tab-pane panel " id="tab2">
					<form role="form" class="form-inline">
						<%@include file="DisplayDemo.jsp" %>
					</form>
				</div>
				<div class="tab-pane panel " id="tab3">
					<form role="form" class="form-inline">
						<%@include file="DisplaySoilTest.jsp" %>
					</form>
				</div>
				<div class="tab-pane panel fade in " id="tab4">
					<form role="form" class="form-inline">
						<%@include file="PurchaseOrder.jsp" %>
					</form>
				</div>

			</div>




		</center>

	</div>
	<script type="text/javascript">

var activeEl = 0;
$(function() {
    var items = $('.btn-nav');
    $( items[activeEl] ).addClass('active');
    $( ".btn-nav" ).click(function() {
        $( items[activeEl] ).removeClass('active');
        $( this ).addClass('active');
        activeEl = $( ".btn-nav" ).index( this );
        
    });
});



</script>

</body>
</html>