<%@page import="javax.xml.bind.annotation.XmlElementDecl.GLOBAL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!--Links-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="FarmerPortal.*,com.pojo.*,java.net.*,java.io.*" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="css/IndexStyle.css" rel="stylesheet">
<link rel="icon" href="img/logos/Face.png" type="image/x-icon">
<link href="css/Footer.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Berkshire+Swash|Cutive"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- Data Tables -->
<script type="text/javascript"
	src="js/DataTables-1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="js/DataTables-1.10.16/js/dataTables.bootstrap.min.js"></script>
	
	
<!--Links-->


</head>
<body>
<%
String url;
if(request.getQueryString()==null)
{
	url=request.getRequestURL().toString();
	}
else
{
url=request.getRequestURL() +"?" + request.getQueryString();
}
String []path=url.toString().split("/");
GlobList.link=path[path.length-1];
%>

	<!--Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span><b>Login</b>
					</h4>
				</div>
				<div class="modal-body">
					<form role="form" onsubmit="return chkFrmr()">
						<div class="form-group">
							<label for="psw" style="font-size: 16px;"><span
								class="glyphicon glyphicon-user"></span>Username</label> <input
								type="text" class="form-control" name="frusername" id="usrname"
								placeholder="Username" required />
						</div>
						<div class="form-group">
							<label for="usrname" style="font-size: 16px;"><span
								class="glyphicon glyphicon-lock"></span> Password</label> <input
								type="password" class="form-control" name="frpass" id="psw"
								placeholder="Password" required />
						</div>

						<button type="reset" class="btn btn-danger btn-default pull-left"
							data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span><b> Cancel</b>
						</button>

						<button type="submit" class="btn btn-success pull-right">
							<b>Login</b> <span class="glyphicon glyphicon-ok"></span>
						</button>
					</form>
					<h2 id="er"></h2>
					
				</div>
				<div>
					<br> <br> <br>
					<p style="text-align: right; margin-right: 20px; font-size: 16px;">
						<a href="Registration.jsp"
							style="text-decoration: underline; color: #0000CC;"> <b>Register</b>
						</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!--Modal -->



</body>
<script>
function chkFrmr() {

	var uname=document.getElementById("usrname").value;
	var pwd=document.getElementById("psw").value;

	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
		    if(this.responseText=="Invalid Username Or Password") {
	    		document.getElementById("er").innerHTML="Email Or Password Is Wrong..:-("	    
		    }else
			    {
		    	window.location.assign(this.responseText);
			    }
	    }
	  };
	  xhttp.open("POST", "FarmerChk?u="+uname+"&p="+pwd, true);
	  xhttp.send();	
	  return false;
}

</script>
</html>