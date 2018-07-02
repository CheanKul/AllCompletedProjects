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
	<%
		List<Product> pro = ProductInfo.getProductsByProductType(7);
		request.setAttribute("pro", pro);
	%>

	<br>
	<br>
	<br>
	<br>
	<center>
		<h1 class="headerNew">Fertilzers</h1>
	</center>
	<hr class="divide1">







	<!--Item 1-->
	<c:forEach items="${pro}" var="u">

		<div class="row subText" style="text-align: justify;">
			<h1 style="text-align: center;">${u.getProductName()}</h1>


			<div class="col-sm-4">
				<br> <img
					src="data:image/png;base64,${Base64.getEncoder().encodeToString(u.getProductImg())}" />
			</div>
			<div class="col-sm-7">
				${u.getProductDescription()}
				<h3>Price :- ${u.getPrice()}</h3>
			</div>
			<div class="col-sm-1"></div>

		</div>
		<div class="row" style="border-bottom: groove 3px #000000;">
			<div class="col-sm-12" style="text-align: center;">
				<c:choose>
					<c:when test="${u.getStockQty()==0}">
						<h2 style="color: red;">Out Of Stock</h2>
						<br> <br>
					</c:when>
					<c:otherwise>
						<a href=""><button
								class="btn btn-success form-control addToCart"
								style="margin-top: 15px; height: 35px; width: 100px;"
								onclick="return" value="${u.getProductId()}">Add To
								Cart</button></a>
								<br> <br>
					</c:otherwise>
				</c:choose>
			</div>
			
		</div>


	</c:forEach>
	<!--Item 1-->



	<!--Item 3-->

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<!--More Item-->
	<div class="container">
		<h1 class="headerNew" style="font-size: 60px;">More-Fertilizers</h1>
		<div class="row subHeader" style="text-align: center;">
			<div class="col-lg-2">
				<img src="img/Fertilizers/suraksha.png" />
				<h6>Jai Kisan Suraksha</h6>
			</div>
			<div class="col-lg-2">
				<img src="img/Fertilizers/sampanna.png" />
				<h6>Jai Kisan Sampana</h6>
			</div>
			<div class="col-lg-2">
				<img src="img/Fertilizers/sampatti.png" />
				<h6>Jai Kisan Sampatti</h6>
			</div>
			<div class="col-lg-2">
				<img src="img/Fertilizers/sampurna.png" />
				<h6>Jai Kisan Sampurna</h6>
			</div>
			<div class="col-lg-2">
				<img src="img/Fertilizers/samrat.png" />
				<h6>Jai Kisan Samrat</h6>
			</div>
			<div class="col-lg-2">
				<img src="img/Fertilizers/urea.png" />
				<h6>Jai Kisan Urea</h6>
			</div>
		</div>
	</div>
	<!--More Item-->

	<script type="text/javascript">
		$(document).ready(function() {
			$(".addToCart").click(function() {
				var id = $(this).val();

				$.post("AddToCart", {
					id : id
				}, function(data, status) {
					alert(data);
					$("#badge").load(window.location.href + " #badge");
				});
				return false;
			});
		});
	</script>

</body>
<%@ include file="Footer.jsp"%>
</html>