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
		
		List<Product> pro = ProductInfo.getProductsByProductType(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("pro", pro);
	%>
	<br>
	<br>
	<br>
	<br>

	<center>
		<h1 class="headerNew"><%=ProductTypeInfo.getProductTyprById(Integer.parseInt(request.getParameter("id"))).getProductType()%></h1>
	</center>
	<hr class="divide1">
	<!--Items-->

	<div id="Items" class="subText">

		<!--Item 1-->
		<c:forEach items="${pro}" var="u">
			<div class="container">
				<div class="row">
					<div class="col-sm-3">
						<br /> <br /> <img
							src="data:image/png;base64,${Base64.getEncoder().encodeToString(u.getProductImg())}">
					</div>
					<div class="col-sm-9">
						<h1>${u.getProductName()}</h1>
						${u.getProductDescription()}
						<h3>Price :- ${u.getPrice()}</h3>

					</div>

				</div>
				<div class="row" style="border-bottom: groove 3px #000000;">
					<div class="col-sm-12" style="text-align: center;">
						<c:choose>
							<c:when test="${u.getStockQty()==0}">
								<h2 style="color: red;">Out Of Stock</h2>
							</c:when>
							<c:otherwise>
								<a href="#">
									<button class="btn btn-success form-control addToCart"
										style="margin-top: 15px; height: 35px; width: 100px;"
										onclick="return" value="${u.getProductId()}">Add To
										Cart</button>
								</a>
							</c:otherwise>
						</c:choose>
					</div>
					<br> <br>
				</div>

			</div>
		</c:forEach>
		<!--Item 1-->
	</div>
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