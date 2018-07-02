<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link href="css/Cart.css" rel="stylesheet">
<%@page import="java.text.SimpleDateFormat,java.text.ParseException"%>
<body>
	<%
		List<Purchase> p = PurchaseInfo.getAllPurchasesByFarmer(
				FarmersInfo.getInfoById(Integer.parseInt(ses.getAttribute("frmrId").toString())));
		String fname = (String) ses.getAttribute("frmrName");
	%>

	<br>
	<br>
	<br>
	<br>

	<h1>Purchase Order</h1>
	<br><br>

	<div class="shopping-cart subText">

		<div class="column-labels">
			<label class="product-image">Image</label> <label
				class="product-details">Product</label> <label class="product-price">Price</label>
			<label class="product-quantity">Quantity</label> <label
				class="product-removal">Remove</label> <label
				class="product-line-price">Total</label>
		</div>

		<%
			for (Purchase mp : p) {
		%>
		<div class="product" style="font-size: 14px; line-height: 20px;">
			<div class="product-image">
				<img
					src="data:image/png;base64,<%=Base64.getEncoder().encodeToString(mp.getProduct().getProductImg())%>">
			</div>
			<div class="product-details">
				<div class="product-title"><%=mp.getProduct().getProductName()%></div>
				<p class="product-description">
					<%-- <%=mp.getProduct().getProductType().getProductType()%> --%><br>
					Purchase Date :-
					<%=mp.getPurchaseDate()%>
					<%
						String oldDate = mp.getPurchaseDate().toString();
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							Calendar c = Calendar.getInstance();
							try {
								c.setTime(sdf.parse(oldDate));
							} catch (ParseException e) {
								e.printStackTrace();
							}

							c.add(Calendar.DAY_OF_MONTH, 10);
							String newDate = sdf.format(c.getTime());
					%>
					<br>
					Delivery Date :-
					<%=newDate%>

				</p>
			</div>
			<div class="product-price"><%=mp.getProduct().getPrice()%></div>
			<div class="product-quantity">
				<%=mp.getQty()%>
			</div>
			<div class="product-removal">
				<button class="remove-product"
					value="<%=mp.getPurchaseId()%>">Cancel</button>
			</div>
			<div class="product-line-price"><%=mp.getTotal()%></div>
		</div>
		<%
			}
		%>



		<div class="totals" style="font-size: 14px;">
			<div class="totals-item">
				<label>Subtotal</label>
				<div class="totals-value" id="cart-subtotal">0</div>
			</div>
			<div class="totals-item">
				<label>Tax (5%)</label>
				<div class="totals-value" id="cart-tax">3.60</div>
			</div>
			<div class="totals-item">
				<label>Shipping</label>
				<div class="totals-value" id="cart-shipping">15.00</div>
			</div>
			<div class="totals-item totals-item-total">
				<label>Grand Total</label>
				<div class="totals-value" id="cart-total">0</div>
			</div>
		</div>
	</div>

</body>

<script type="text/javascript">
	$(document).ready(
			function() {

				/* Set rates + misc */
				var taxRate = 0.05;
				var shippingRate = 15.00;
				var fadeTime = 300;
				recalculateCart();
				//disableContinue();

				/* Assign actions */
				$('.product-quantity input').change(function() {
					callUpdateQty(this);
					updateQuantity(this);
				});

				$('.product-removal button').click(function() {
					$.post("DeleteFromPurchase", {
						id : $(this).val()
					}, function(data, status) {
						alert(data);

					});
					removeItem(this);
				});

				/* Recalculate cart */
				function recalculateCart() {
					var subtotal = 0;

					/* Sum up row totals */
					$('.product').each(
							function() {
								subtotal += parseFloat($(this).children(
										'.product-line-price').text());
							});

					/* Calculate totals */
					var tax = subtotal * taxRate;
					var shipping = (subtotal > 0 ? shippingRate : 0);
					var total = subtotal + tax + shipping;

					/* Update totals display */
					$('.totals-value').fadeOut(fadeTime, function() {
						$('#cart-subtotal').html(subtotal.toFixed(2));
						$('#cart-tax').html(tax.toFixed(2));
						$('#cart-shipping').html(shipping.toFixed(2));
						$('#cart-total').html(total.toFixed(2));
						if (total == 0) {
							$('.go').fadeOut(fadeTime);
						} else {
							$('.go').fadeIn(fadeTime);
						}
						$('.totals-value').fadeIn(fadeTime);
					});
				}

				/* Update quantity */
				function updateQuantity(quantityInput) {
					/* Calculate line price */
					var productRow = $(quantityInput).parent().parent();
					var price = parseFloat(productRow
							.children('.product-price').text());
					var quantity = $(quantityInput).val();
					var linePrice = price * quantity;

					/* Update line price display and recalc cart totals */
					productRow.children('.product-line-price').each(function() {
						$(this).fadeOut(fadeTime, function() {
							$(this).text(linePrice.toFixed(2));
							recalculateCart();
							$(this).fadeIn(fadeTime);
						});
					});
				}

				function callUpdateQty(quantityInput) {
					var productRow = $(quantityInput).parent().parent();
					var quantity = $(quantityInput).val();
					var proId = parseFloat(productRow.children(
							'.product-removal').children('.remove-product')
							.val());
					$.post("UpdateQty", {
						id : proId,
						qty : quantity

					}, function(data, status) {
						alert(data);

					});

				}

				/* Remove item from cart */
				function removeItem(removeButton) {
					/* Remove row from DOM and recalc cart total */
					var productRow = $(removeButton).parent().parent();
					productRow.slideUp(fadeTime, function() {
						productRow.remove();
						$("#badge").load(window.location.href + " #badge");
						recalculateCart();
					});
				}

				$(".login").click(function() {

					$("#myModal").modal();

				});

				$(".go").click(function() {

					window.location.assign("Checkout.jsp");

				});

			});
</script>
</html>