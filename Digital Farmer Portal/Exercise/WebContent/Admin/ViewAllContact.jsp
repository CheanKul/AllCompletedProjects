<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="FarmerPortal.*,java.util.*,com.pojo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Contact</title>
<%@include file="AdminHeader.jsp"%>
<%
	List<Contact> li = ContactInfo.getAllContacts();
	request.setAttribute("list", li);
	int i = 1;
%>
</head>
<body>
	<section id="main-content"> <section class="wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-laptop"></i>Collected Data
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="AdminHome.jsp">Home</a></li>
				<li><i class="fa fa-laptop"></i>Collected Data</li>
				<li><i class="fa fa-laptop"></i>Contacts</li>
			</ol>
		</div>
	</div>
	<div class="panel panel-heading">
		<h3>Feedback Info</h3>
	</div>
	<div class="panel panel-body tableText">
		<table id="myTable" class="table table-hover table-bordered"
			style="text-align: center; vertical-align: middle;">
			<thead>
				<tr class="tableHeader">
					<th>Id</th>
					<th>Comment</th>
					<th>Email</th>
					<th>Mobile</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="u">
					<tr>
						<td><%=i++%></td>
						<td>${u.getComment()}</td>
						<td>${u.getEmail()}</td>
						<td>${u.getMobile()}</td>
						<td><a href="../DeleteContact?id=${u.getContactId()}">
								<button class="btn btn-primary">Delete</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</section> </section>
	<script>
		$('#myTable').DataTable();
	</script>
</body>
</html>