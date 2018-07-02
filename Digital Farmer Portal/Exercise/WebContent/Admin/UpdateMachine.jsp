<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div aria-hidden="true" role="dialog" tabindex="-1" id="myModal"
		class="modal fade" style="display: none;">
		<div class="modal-dialog modal-md"
			style="width: 900px; max-width: 900px;">
			<div class="modal-content">
				<div class="modal-header">
					<button aria-label="Close" data-dismiss="modal" class="close"
						type="button">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="top_header_text">Update Machine</h4>
				</div>
				<div class="modal-body">
					<form id="product_form" class="form-horizontal"
						action="../UpdateProduct" enctype="multipart/form-data"
						method="post">

						<div class="form-group">
							<input type="text" placeholder="1" name="id" id="id"
								class="form-control" required>
						</div>

						<div class="form-group">
							<input type="text" placeholder="Mahindra Yuvraj 215 NXT" name="name"
								id="name" class="form-control" required>
						</div>

						<div class="form-group">
							<input type="text" placeholder="15" name="hp" id="hp"
								class="form-control" required>
						</div>

						<div class="form-group">
							<input type="text" placeholder="2300 RPM" class="form-control"
								name="rpm" id="rpm" required>
						</div>

						<div class="form-group">
							<input type="text" placeholder="6 Forword + 3 Reverse" class="form-control"
								name="grs" id="grs" required>
						</div>

						<div class="form-group">
							<input type="text" placeholder="25.62 KMPH" class="form-control"
								name="speed" id="speed" required>
						</div>

						<div class="form-group">
							<input type="text" placeholder="5.20 X 14.8 PR" class="form-control"
								name="ft" id="ft" required>
						</div>

						<div class="form-group">
							<input type="text" placeholder="8.00 X 18.6 PR" class="form-control"
								name="rt" id="rt" required>
						</div>

						<div class="form-group">
							<input type="text" placeholder="778 KG" class="form-control"
								name="lc" id="lc" required>
						</div>
						<div class="form-group">
							<input type="text" placeholder="19 Lit" class="form-control"
								name="fc" id="fc" required>
						</div>
						<div>

							<input type="radio" name="is_uploading_new" value="1" id="Radio3">
							<label for="inlineRadio3">Upload New Image</label> &nbsp;&nbsp; <input
								type="radio" checked name="is_uploading_new" value="0"
								id="Radio4"> <label for="inlineRadio4">No</label> <input
								type="hidden" name="img" value="0" id="hf">
						</div>
						<br>
						<div class="form-group" id="filediv" style="display: none;">
							<div class="input_div" style='width: 200px'>
								<input type="file" name="pImage">
							</div>
						</div>



						<div class="form-group">
							<button data-dismiss="modal" class="btn btn-white" type="button">Cancel</button>
							<input class="btn btn-default" value="Submit" title="Submit"
								style="cursor: pointer;" align="absmiddle" type="submit" id="up">
						</div>



					</form>
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
		
		$('input:radio[name="is_uploading_new"]').change(function() {

			$("#filediv").toggle();
			$('#hf').val($('input:radio[name="is_uploading_new"]').val());

		});
	</script>



</body>
</html>