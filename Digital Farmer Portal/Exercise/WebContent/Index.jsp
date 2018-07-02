<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<%@ include file="Navbar.jsp"%>
</head>
<body>
	<br>
	<!--Heading-->	
	<div class="row">
		<br>
		<br>
		<div class="col-sm-12" style="text-align: center;">
			<br>
			<h1 class="headerNew" style="font-size: 70px;">Welcome To The
				Digital Farmer Portal Of India</h1>
		</div>
	</div>
	<!--Heading-->

	<br>


	<!--Slider -->
	<div class="" style="width: 100%;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel"
			style="overflow: hidden; height: 530px;">

			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
			</ol>


			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="img/Slider/Slider1.jpeg" alt="Slider1">
					<div class="carousel-caption">
						<h3 class="header">Farmer: We Feed The World</h3>
					</div>
				</div>
				<div class="item">
					<img src="img/Slider/Slider2.jpeg" alt="Slider2">
					<div class="carousel-caption">
						<h3 class="header">Farming Is A Profession Of Hope</h3>
					</div>
				</div>
				<div class="item">
					<img src="img/Slider/Slider3.jpeg" alt="Slider3">
					<div class="carousel-caption">
						<h3 class="header">Know Your Farmer, Know Your Food</h3>
					</div>
				</div>
				<div class="item">
					<img src="img/Slider/Slider4.jpeg" alt="Slider4">
					<div class="carousel-caption">
						<h3 class="header">If You Ate Today, Thank A Farmer</h3>
					</div>
				</div>
				<div class="item">
					<img src="img/Slider/Slider9.jpeg" alt="Slider5">
					<div class="carousel-caption">
						<h3 class="header">Putting Mother Nature In A Better Mood</h3>
					</div>
				</div>
			</div>

			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev" style="min-height: 205px!importent;"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next" style="min-height: 205px;"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<!--Slider End-->

	<!--Welcome Name -->
	<div class="row subText">
		<div class="col-sm-1"></div>
		<div class="col-sm-10" style="text-align: justify;">
			<h1 class="headerNew">Agriculture</h1>
			<br />
			<p>"Agriculture is the backbone of the Indian Economy"- said
				Mahatma Gandhi six decades ago. Even today, the situation is still
				the same, with almost the entire economy being sustained by
				agriculture, which is the mainstay of the villages. It contributes
				16% of the overall GDP and accounts for employment of approximately
				52% of the Indian population.Rapid growth in agriculture is
				essential not only for self-reliance but also to earn valuable
				foreign exchange.Indian farmers are second to none in production and
				productivity despite of the fact that millions are marginal and
				small farmers. They adopt improved agriculture technology as
				efficiently as farmers in developed countries. It is felt that with
				provision of timely and adequate inputs such as fertilizers, seeds,
				pesticides and by making available affordable agricultural credit
				/crop insurance, Indian farmers are going to ensure food and
				nutritional security to the Nation.</p>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<br>
	<br>
	<!--Welcome Name -->

	<!--Below Three Images -->
	<div class="container" style="width: 1433px; text-align: center;">
		<div class="row">
			<div class="col-lg-4">
				<a href="#demo" data-toggle="collapse"> <img
					src="img/ThreeImages/ThreeImg2.jpg" class="img-thumbnail"
					alt="Cinque Terre" width="300" height="300"
					style="border-radius: 15px;">
				</a> <br />
				<div class="desc" style="font-size: x-large;">
					<a href="#" style="text-decoration: none;">
						<h2 class="headerNew" style="font-size: 36px;">Farm Machinery</h2>
					</a>
				</div>
				<div id="demo" class="collapse subText" style="text-align: center;">
					<p>India's No.1 Techonology Used In It</p>
					<p>Easy To Use</p>
					<p>Zero Maintainance</p>
					<p>
						<button class="btn btn-success">
							<b>See More</b>
						</button>
						&nbsp;&nbsp;
						<button class="btn btn-success" data-toggle="modal"
							data-target="#myModal">
							<b>Buy Now</b>
						</button>
					</p>
				</div>
			</div>
			<div class="col-lg-4">
				<a href="#Div1" data-toggle="collapse"> <img
					src="img/ThreeImages/ThreeImg1.jpg" class="img-thumbnail"
					alt="Cinque Terre" width="300" height="309"
					style="border-radius: 15px;">
				</a> <br />
				<div class="desc" style="font-size: x-large;">
					<a href="#" style="text-decoration: none;">
						<h2 class="headerNew" style="font-size: 36px;">Fertilizers &
							Pesticides</h2>
					</a>
				</div>
				<div id="Div1" class="collapse subText" style="text-align: center;">
					<p>For The Best Result</p>
					<p>Use Our Fertilizers</p>
					<p>Avilable In Lower price</p>
					<p>
						<button class="btn btn-success">
							<b>See More</b>
						</button>
						&nbsp;&nbsp;
						<button class="btn btn-success" data-toggle="modal"
							data-target="#myModal">
							<b>Buy Now</b>
						</button>
					</p>
				</div>
			</div>
			<div class="col-lg-4">
				<a href="#Div2" data-toggle="collapse"> <img
					src="img/ThreeImages/ThreeImg3.jpg" class="img-thumbnail"
					alt="Cinque Terre" width="300" height="300"
					style="border-radius: 15px;">
				</a>
				<div class="desc" style="font-size: x-large;">
					<a href="#" style="text-decoration: none;">
						<h2 class="headerNew" style="font-size: 36px;">Soil Testing</h2>
					</a>
				</div>
				<div id="Div2" class="collapse subText" style="text-align: center;">
					<p>For Soil Testing</p>
					<p>Call Us On Our Number</p>
					<p>1800 200 7575</p>
					<p>
						<button class="btn btn-success">
							<b>See More</b>
						</button>
						&nbsp;&nbsp;
						<button class="btn btn-success" data-toggle="modal"
							data-target="#myModal">
							<b>Test</b>
						</button>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!--Below Three Images End -->

	<!--Mission & Vision -->
	<div class="container" id="container-fluid" style="width: 1305px;">
		<br>
		<br>
		<br>
		<br>
		<div class="row subText" style="text-align: justify;">
			<div class="col-sm-4">
				<br> <span> <img src="img/ThreeImages/Misson.jpeg"
					style="width: 100%; height: 410px; border-radius: 14px;">
				</span>
			</div>
			<div class="col-sm-8">
				<h3 class="headerNew" style="text-align: justify; font-size: 36px;">MISSION</h3>
				<p>Our mission Indian farmers are second to none in production
					and productivity despite of the fact that millions are marginal and
					small farmers.They adopt improved agriculture technology as
					efficiently as farmers in developed countries. It is felt that with
					provision of timely and adequate inputs such as fertilizers, seeds,
					pesticides and by making available affordable agricultural credit
					/crop insurance, Indian farmers are going to ensure food and
					nutritional security to the Nation.</p>
				<h3 class="headerNew" style="text-align: justify; font-size: 36px;">VISION</h3>
				<p>Our vision once in the Farmer's Portal, a farmer will be able
					to get all relevant information on specific subjects around his
					village/block /district or state. This information will be
					delivered in the form of text, SMS, email and audio/video in the
					language he or she understands. These levels can be easily reached
					through the Map of India placed on the Home page.Farmers will also
					be able to ask specific queries as well as give valuable feedback
					through the Feedback module specially developed for the purpose..</p>
			</div>
		</div>
	</div>
	<!--Mission & Vision -->


	<%@ include file="Footer.jsp"%>
</body>
</html>