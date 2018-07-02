<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@page import="java.util.*,com.pojo.*,FarmerPortal.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<%
	List<ProductType> productType=ProductTypeInfo.getAllProductType();
	request.setAttribute("proType", productType);
%>
	<!--Footer -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div style="background: #000000;">
		<footer class="flex-rw">
		<ul class="footer-list-top">
			<li>
				<h4 class="footer-list-header">Services</h4>
			</li>
			<li><a href='Index.jsp'
				class="generic-anchor footer-list-anchor" itemprop="significantLink">Home</a></li>
			<li><a href='soiltest.jsp' itemprop="significantLink"
				class="generic-anchor footer-list-anchor">Soil Test</a></li>
			<li><a href='Mechinary.jsp'
				class="generic-anchor footer-list-anchor" itemprop="significantLink">Mechinary</a></li>
			<li><a href='Fertilizers&Pesticides.jsp'
				class="generic-anchor footer-list-anchor" itemprop="significantLink">Fertilizers
					& Pesticides</a></li>
		</ul>

		<ul class="footer-list-top">
			<li>
				<h4 class="footer-list-header">Major Crops</h4>
			</li>
			<li><a href='jute.jsp' class="generic-anchor footer-list-anchor">Jute</a></li>
			<li><a href='Rice.jsp' class="generic-anchor footer-list-anchor">Rice</a></li>
			<li><a href='Maize.jsp'
				class="generic-anchor footer-list-anchor">Maize</a></li>
			<li><a href='wheat.jsp'
				class="generic-anchor footer-list-anchor">Wheat</a></li>
			<li><a href='Pulses.jsp'
				class="generic-anchor footer-list-anchor">Pulses</a></li>
			<li><a href='Sugarcane.jsp'
				class="generic-anchor footer-list-anchor">Sugar Cane</a></li>
		</ul>

		<ul class="footer-list-top">
			<li><h4 class="footer-list-header">Seeds</h4></li>
			<c:forEach items="${proType}" var="u">
				<li><a href="DisplayProduct.jsp?id=${u.getId()}"
					class="generic-anchor footer-list-anchor">${u.getProductType()}</a>
				</li>
			</c:forEach>

		</ul>

		<ul class="footer-list-top" style="width: 22%">
			<li><h4 class="footer-list-header">Address</h4></li>
			<li class="generic-anchor footer-list-anchor">1st Floor, Nangude
				Apartment, Sai Corner, Jagtap Dairy Circle, Pimpri-Chinchwad,
				Maharashtra 411027</li>
			<br>
			<br>
			<li style="font-size: 36px;"><a href="" class="generic-anchor"><i
					class="fa fa-pinterest"></i></a> <a href="" class="generic-anchor"><i
					class="fa fa-facebook"></i></a> <a href="" class="generic-anchor"><i
					class="fa fa-twitter"></i></a> <a href="" class="generic-anchor"><i
					class="fa fa-instagram"></i></a> <a href="" class="generic-anchor"><i
					class="fa fa-youtube"></i></a> <a href="" class="generic-anchor"><i
					class="fa fa-google-plus"></i></a></li>
		</ul>


		</footer>
		<br>
		<hr width="100%" style="border-top-color: #FFFFFF;">
		<div class="row subText">
			<br>
			<div class="col-lg-3"></div>
			<div class="col-lg-6 generic-anchor footer-list-anchor"
				style="font-size: 16px;">

				© All rights reserved by DigiFarmPortalIndia. Powered by <a
					href="http://www.aayanshgerminate.com/">Aayansh Germinate Pvt.
					Ltd.</a>

			</div>
			<div class="col-lg-3"></div>

			<br>
		</div>
	</div>
	<!--Footer -->


</body>
</html>