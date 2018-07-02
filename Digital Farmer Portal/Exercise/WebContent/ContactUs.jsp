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
	<br>
	<br>
	<div class="headerNew">
		<div class="container">
			<p>Contact Us</p>
		</div>
	</div>


	<div class="container">
		<div class="row headerNew">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<img src="img/Icons/page.png">
				<h2>Share your question</h2>
				<form id="contacts_us" name="contact_us" method="post">
					<div class="row">
						<div class="field">
							<span><input type="text" name="name" id="name"
								placeholder="Name" autocomplete="off" autofocus="true" required></span>
						</div>
					</div>
					<div class="row">
						<div class="field">
							<span><input type="email" name="email" id="email"
								placeholder="Email" autocomplete="off" required></span>
						</div>
					</div>
					<div class="row">
						<div class="field">
							<span><input name="description" cols="" rows=""
								id="description" placeholder="Contact" required /></span>
						</div>
					</div>
					<div class="row">
						<div class="field">
							<span><input type="text" name="subject" id="subject"
								placeholder="Subject" autocomplete="off" required></span>
						</div>
					</div>
					<div class="row">
						<div class="field">
							<span><input name="description" cols="" rows=""
								id="description" placeholder="Descriprion" required></span>
						</div>
					</div>
					<div class="row">
						<button type="submit" class="btn btn-success">
							<b>Submit</b>
						</button>
					</div>
				</form>
			</div>
			<div class="col-lg-3 "></div>
		</div>
	</div>
	<br>
	<br>
	<br>

	<hr width="100%" />
</body>
<%@include file="Footer.jsp"%>
</html>
