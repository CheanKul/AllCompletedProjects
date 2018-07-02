<%-- <%@include file="Navbar.jsp" %> --%>
<link href="css/Profile.css" rel="stylesheet">
<%@page import="FarmerPortal.*,com.pojo.*,java.net.*,java.io.*"%>
<%
	Farmer fr=FarmersInfo.getInfoById((int)ses.getAttribute("frmrId"));
%>
<div class="full-width">

	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="custom-form">
			<div class="text-center bg-form">
				<div class="img-section">
					<img src="img/Avatar/avatar-05.png" class="imgCircle"
						alt="Profile picture" style="height: 300px;">
					<div class="col-lg-12">
						<h4 class="text-right col-lg-12">
							<span class="glyphicon glyphicon-edit"></span> Edit
							Profile&nbsp;&nbsp;&nbsp;
						</h4>
						<input type="checkbox" class="form-control" id="checker">
					</div>



					<div class="col-lg-12">
						<h4 class="text-right col-lg-12">
							<span class="glyphicon glyphicon-edit"></span> Change Password
						</h4>
						<input type="checkbox" class="form-control" id="reset">
					</div>






				</div>
			</div>

			<div class="col-lg-12 col-md-12">
				<input type="text" class="form-control form-input"
					value="<%=fr.getFarmerName() %>" placeholder="Name" disabled
					id="name" name="name"> <span
					class="glyphicon glyphicon-user input-place"></span>
			</div>
			<div class="col-lg-12 col-md-12">
				<input type="text" class="form-control form-input"
					value="<%=fr.getFarmerEmail() %>" placeholder="Email ID" disabled
					id="email" name="email"> <span
					class="glyphicon glyphicon-envelope input-place"></span>
			</div>
			<div class="col-lg-12 col-md-12">
				<input type="text" class="form-control form-input"
					value="<%=fr.getFarmerMobile() %>" placeholder="Phone Number"
					disabled id="phone" name="phone"> <span
					class="glyphicon glyphicon-earphone input-place"></span>
			</div>
			<div class="col-lg-12 col-md-12">
				<input type="text" class="form-control form-input"
					value="<%=fr.getAddress() %>" placeholder="Address" disabled
					id="place" name="place"> <span
					class="glyphicon glyphicon-map-marker input-place"></span>
			</div>
			<div class="col-lg-12 col-md-12">
				<input type="text" class="form-control form-input"
					value="<%=fr.getGender() %>" placeholder="Address" disabled
					id="gender" name="gender"> <i
					class="fa fa-intersex input-place"></i>
			</div>
			<div class="col-lg-12 col-md-12">
				<input type="text" class="form-control form-input"
					value="<%=fr.getState() %>" placeholder="Address" disabled
					id="state" name="state"> <span
					class="fa fa-fort-awesome input-place"></span>
			</div>
			<div class="col-lg-12 col-md-12">
				<input type="text" class="form-control form-input"
					value="<%=fr.getCity() %>" placeholder="Address" disabled id="city"
					name="city"> <span class="fa fa-map-signs input-place"></span>
			</div>
			<div class="col-lg-12 col-md-12">
				<input type="text" class="form-control form-input"
					value="<%=fr.getBlock() %>" placeholder="Address" disabled
					id="block" name="block"> <span
					class="fa fa-building input-place"></span>
			</div>
			<div class="col-lg-12 col-md-12">
				<input type="text" class="form-control form-input"
					value="<%=fr.getZip() %>" placeholder="Address" disabled id="zip"
					name="zip"> <span class="fa fa-map-marker input-place"></span>
			</div>




			<div class="col-lg-12 col-md-12 text-center">
				<button class="btn btn-info btn-lg custom-btn" id="submit" disabled>
					<span class="glyphicon glyphicon-save"></span> Save
				</button>
			</div>

		</div>
	</div>
</div>





<script>


	$("#reset").click(function(){
        $("#resetPass").modal();
    });
	


    var checkme = document.getElementById('checker'); 
    var userName = document.getElementById('name');
    var userPhone = document.getElementById('phone');
    var userEmail = document.getElementById('email');
    var userPlace = document.getElementById('place');
    var UserSend = document.getElementById('submit');
    var Gender = document.getElementById('gender');
    var State = document.getElementById('state');
    var City = document.getElementById('city');
    var Block = document.getElementById('block');
    var Zip = document.getElementById('zip');
    
    checkme.onchange = function() {
        UserSend.disabled = !this.checked;
        userName.disabled = !this.checked;
        userPhone.disabled = !this.checked;
        userEmail.disabled = !this.checked;
        userPlace.disabled = !this.checked;
        Gender.disabled = !this.checked;
        State.disabled = !this.checked;
        City.disabled = !this.checked;
        Block.disabled = !this.checked;
        Zip.disabled = !this.checked;
    };
    </script>


