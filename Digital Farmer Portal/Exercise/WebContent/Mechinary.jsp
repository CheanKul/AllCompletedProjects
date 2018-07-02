<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.*,com.pojo.*,FarmerPortal.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="Navbar.jsp"%>
</head>

<body>

<%
	List<Machinary> li=MachinaryInfo.mechine20HP();
	List<Machinary> li1=MachinaryInfo.mechine21to30HP();
	List<Machinary> li2=MachinaryInfo.mechine31to40HP();
	List<Machinary> li3=MachinaryInfo.mechine40();
	
	
	request.setAttribute("hpt20", li);
	request.setAttribute("hpt30", li1);
	request.setAttribute("hpt40", li2);
	request.setAttribute("hpg40", li3);
	

%>
	<br>
	<br>
	<br>
	<br>

	<center>
		<h1 class="headerNew">Tractor</h1>
	</center>
	<hr class="divide1" style="margin-bottom: 30px;">

	<div class="container  subText">
		<div class="row" style="text-align: center;">
			<div class="col-sm-3">
				<h3 style="border-bottom-style: dashed;">UPTO 20 HP</h3>
					<c:forEach items="${hpt20}" var="u">
					<div ><a href="MachineDetails.jsp?id=${u.getMachineId()}">
					
					<img alt="" src="data:image/png;base64,${Base64.getEncoder().encodeToString(u.getImage())}" style="width:150px; height: 150px">
					<h5>${u.getMachineName()}</h5>
					</a></div>
					</c:forEach>
				<br />
			</div>
			<div class="col-sm-3">
				<h3 style="border-bottom-style: dashed;">21 TO 30 HP</h3>
				<c:forEach items="${hpt30}" var="u">
					<div ><a href="MachineDetails.jsp?id=${u.getMachineId()}">
					
					<img alt="" src="data:image/png;base64,${Base64.getEncoder().encodeToString(u.getImage())}" style="width:150px; height: 150px">
					<h5>${u.getMachineName()}</h5>
					</a></div>
					</c:forEach>
			</div>
			<div class="col-sm-3">
				<h3 style="border-bottom-style: dashed;">31 TO 40 HP</h3>
				<c:forEach items="${hpt40}" var="u">
					<div ><a href="MachineDetails.jsp?id=${u.getMachineId()}">
					
					<img alt="" src="data:image/png;base64,${Base64.getEncoder().encodeToString(u.getImage())}" style="width:150px; height: 150px">
					<h5>${u.getMachineName()}</h5>
					</a></div>
					</c:forEach>
			</div>
			<div class="col-sm-3">
				<h3 style="border-bottom-style: dashed;">41 TO 50 PLUS</h3>
				<c:forEach items="${hpg40}" var="u">
					<div ><a href="MachineDetails.jsp?id=${u.getMachineId()}">
					
					<img alt="" src="data:image/png;base64,${Base64.getEncoder().encodeToString(u.getImage())}" style="width:150px; height: 150px">
					<h5>${u.getMachineName()}</h5>
					</a></div>
					</c:forEach>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<center>
			<h1 class="headerNew">Implements</h1>
		</center>
		<hr class="divide1">

		<div class="row subHeader" style="text-align: center;">
			<div class="col-sm-6">
				<h3>Gyrovator ZLX</h3>
				<div class="img">
					<a href="#"><img src="img/Tractros/Gyrovator.png" /></a>
				</div>
				<h5>
					<a href="#" id="name">Gyrovator ZLX</a>
				</h5>
			</div>
			<div class="col-sm-6">
				<h3>Laser & Levelar</h3>
				<div class="img">
					<a href="#"><img src="img/Tractros/Levelar.png" /></a>
				</div>
				<h5>
					<a href="#" id="name">Laser & Levelar</a>
				</h5>
			</div>
		</div>

		<div class="row subHeader" style="text-align: center;">
			<div class="col-sm-6">
				<h3>Rice Transplanter Mp-46</h3>
				<div class="img">
					<a href="#"><img src="img/Tractros/Rice.png" /></a>
				</div>
				<h5>
					<a href="#" id="name">Rice Transplanter Mp-46</a>
				</h5>
				<br />
			</div>
			<div class="col-sm-6">
				<h3>Fertilizer Spreader</h3>
				<div class="img">
					<a href="#"> <img src="img/Tractros/Spreader.png" /></a>
				</div>
				<h5>
					<a href="#" id="name">Fertilizer Spreader</a>
				</h5>
			</div>
		</div>


		<br> <br> <br> <br>
		<center>
			<h3 class="headerNew">Harvester</h3>
		</center>
		<hr class="divide1">

		<div class="row" style="text-align: center;">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="img">
					<a href="#"><img src="img/Tractros/Harvester.png" /></a><br>
				</div>
				<br> <br>
				<h5>
					<a href="#">Harvester</a>
				</h5>
			</div>
			<div class="col-sm-1"></div>
		</div>

	</div>


</body>

<%@ include file="Footer.jsp"%>
</html>
