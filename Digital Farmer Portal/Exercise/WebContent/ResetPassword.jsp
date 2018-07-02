
<div class="modal fade panel-default" id="resetPass" role="dialog">
	<div class="modal-dialog">


		<div class="modal-content" style="background-color: white;">
			<div class="modal-header">
				<h3 class="mb-0">Change Password</h3>
			</div>
			<div class="modal-body">
				<form class="form" role="form" autocomplete="off"
					onsubmit="return">
					<div class="form-group">
						<label for="inputPasswordOld">Current Password</label> <input
							type="password" class="form-control" name="current"
							id="currentpass" required="">
					</div>
					<div class="form-group">
						<label for="inputPasswordNew">New Password</label> <input
							type="password" class="form-control" name="new1" id="new1pass"
							required=""> <span class="form-text small text-muted">
							The password must be 8-20 characters, and must <em>not</em>
							contain spaces.
						</span>
					</div>
					<div class="form-group">
						<label for="inputPasswordNewVerify">Verify</label> <input
							type="password" class="form-control" name="new2" id="new2pass"
							required=""> <span class="form-text small text-muted">
							To confirm, type the new password again. </span>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-success btn-lg float-right"
							id="save">Save</button>
					</div>
				</form>
			</div>
		</div>

	</div>
</div>

<script>


$("#save").click(function(){

	var current=$("#currentpass").val();
	var new1=$("#new1pass").val();
	var new2=$("#new2pass").val();
		
	$.post("ResetPassword", {
		current : current,
		new1 : new1,
		new2 : new2

	}, function(data, status) {
		
		alert(data);
		if(data=="Success")
			{
			window.location.assign("FrmrLogout")
			}
	});

	return false;
});



</script>
