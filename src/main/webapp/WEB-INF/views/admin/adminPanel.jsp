<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.perishables.model.User, com.perishables.model.Customer, java.util.List, java.util.Set" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Perishable | Profile</title>
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@400;700&display=swap" rel="stylesheet" />
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/assets/mobirise-icons2/mobirise2.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/animatecss/animate.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="${pageContext.request.contextPath}/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobirise/css/mbr-additional.css" type="text/css">
</head>

<style>
    body{
        margin-top:0px;
        color: #1a202c;
        text-align: left; 
    }
    
    .main-body {
        padding: 15px;
    }
    .card {
        box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
    }
    
    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0 solid rgba(0,0,0,.125);
        border-radius: .25rem;
    }
    
    .card-body {
        flex: 1 1 auto;
        min-height: 1px;
        padding: 1rem;
    }
    
    .gutters-sm {
        margin-right: -8px;
        margin-left: -8px;
    }
    
    .gutters-sm>.col, .gutters-sm>[class*=col-] {
        padding-right: 8px;
        padding-left: 8px;
    }
    .mb-3, .my-3 {
        margin-bottom: 1rem!important;
    }
    
    .bg-gray-300 {
        background-color: #e2e8f0;
    }
    .h-100 {
        height: 100%!important;
    }
    .shadow-none {
        box-shadow: none!important;
    }
</style>

<body class="bg-light">

<%@include file="../includes/navbar.jsp" %>

<br><br>

<section class="section py-5 dashboard">
	<div class="g-0 container-fluid my-5 mx-auto row">
		<div class="card col-12 col-md-6 p-0 px-3" style="border-radius: 25px; box-sizing:border-box;">
		  <div class="bg-dark pb-5" alt="...">
		  	<form class="form my-5 d-block mx-auto">
		  		<input type="search" placeholder="Search user by email, name" class="input-control d-block mx-auto w-75 form-control" name="u_string" />
		  		<input type="submit" class="d-none" value="Search" />
		  	</form>
		  </div>
		  <div class="card-body w-100 mx-auto bg-white" style="transform: translateY(-100px); border-radius: 25px 25px 0px 0px;">
		    <h5 class="card-title my-3 fw-bold text-center">Customers</h5>
		    <div class="container">
		    	<table class="table">
		    		<tr>
		    			<th>Id</th>
		    			<th>Name</th>
		    			<th>Email</th>
		    		</tr>
		    		<% Set<Customer> clist = (Set<Customer>)request.getAttribute("clist");
		    			if(clist != null) {
		    			for(Customer u : clist) { %>
		    			<tr id="data-<%= u.getId() %>">
    						<td><%= u.getId() %></td>
    						<td><%= u.getName() %></td>
   							<td><%= u.getEmail() %>
   								<a onclick="setUser(<%= u.getId() %>)" role="button" data-bs-toggle="modal" data-bs-target="#userDeleteModal"><span class="mobi-mbri mobi-mbri-trash text-secondary float-end mbr-iconfont mbr-iconfont-btn"></span></a>
   								<a data-bs-toggle="collapse" data-bs-target="#full-data-<%= u.getId()%>"><span class="mobi-mbri px-3 mobi-mbri-arrow-down text-muted float-end mbr-iconfont mbr-iconfont-btn"></span></a>
   							</td>
    					</tr>
    					<tr style="background-color: #def4ff;" class="collapse" id="full-data-<%= u.getId() %>">
    						<td colspan="3">
    						<div class="d-flex">
	    						<div class="mx-2">
	    							<img src="${pageContext.request.contextPath}/users/<%= u.getId() %>.png" class="float-end" style="width: 100px;" />
	    						</div>
	    						<div>
	    							<p>Address: <%= u.getAddress() %></p>
	    							<p>Date of Birth: <%= u.getDob() %></p>
	    							<p>Mobile Number: <%= u.getmobNo() %></p>
	   							</div>
    						</div>
    						</td>
    					</tr>
   					<% }} %>
		    	</table>
		    </div>
		  </div>
		</div>
		
		<div class="modal" id="userDeleteModal" tabindex="-1">
		  <div class="modal-dialog" style="height: auto;">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Delete User</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <p style="line-height: 1.5;">Are you sure, you want to delete this user? You won't be able to undo the changes.</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn" data-bs-dismiss="modal">Revert</button>
		        <form action="/admin/deleteUser">
			        <input id="user_deletion_id" name="id" type="hidden" value="0" />
			        <input type="submit" class="btn btn-secondary" style="border-radius: 100px;" value="Delete" />
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		
		<div class="card col-12 col-md-6 p-0 mt-3 px-3 mt-md-0" style="border-radius: 25px;">
		  <div class="bg-success pb-5" alt="...">
		  	<form class="form my-5 d-block mx-auto">
		  		<input type="search" placeholder="Search product by id, name" class="input-control d-block mx-auto w-75 form-control" name="u_string" />
		  		<input type="submit" class="d-none" value="Search" />
		  	</form>
		  </div>
		  <div class="card-body w-100 mx-auto bg-white" style="transform: translateY(-100px); border-radius: 25px 25px 0px 0px;">
		    <h5 class="card-title my-3 fw-bold text-center">Products</h5>
		    <div class="container">
		    <a href="#" class="btn btn-success float-end" role="button" onclick="showProductAdder()" style="border-radius: 100px;"> + Add Product</a>
		    	<table class="table">
		    		<tr>
		    			<th>Id</th>
		    			<th>Name</th>
		    			<th>Type</th>
		    		</tr>
		    	</table>
		    </div>
		  </div>
		</div>
	</div>
</section>

<section id="product-adder" class="d-none position-absolute bg-transparent row g-0 container-fluid p-0" style="top:0%; left: 0%; height: 100%; z-index: 999; padding-top: 7%; backdrop-filter: blur(2px);">
	<div class="product-header text-center d-none d-md-block col-0 col-md-6 bg-transparent" style="border-bottom: 1px solid grey;">
		
	</div>
	<div class="product-header text-center col-12 col-md-6 bg-light my-5 py-5">
		<h2 class="d-inline-block">Add A Product</h2>
		<button class="btn btn-close float-end" onclick="hideProductAdder()" style="transform:translateY(-15px);"></button>
	
		<form:form modelAttribute="product" method="POST" enctype="multipart/form-data" class="container">
			<input type="file" name="productPic" class="form-control input-control" />
			<form:input path="name" class="form-control input-control my-3" placeholder="Name" />
			<form:textarea path="description" class="form-control input-control my-3" placeholder="Description" />
			<form:input type="number" min="0" path="price" class="form-control input-control my-3" placeholder="Price" />
			<form:input type="number" path="discount" min="0" max="100" class="form-control input-control my-3" placeholder="Discount" />
			<form:input type="number" min="1" path="quantity" class="form-control input-control my-3" placeholder="Quantity Available" />
			<form:input path="type" class="form-control input-control my-3" placeholder="Type of Product" />
			<input type="submit" value="Create" class="btn btn-primary float-end px-4" style="border-radius: 100px;" />
		</form:form>
	</div>
</section>

<%@include file="../includes/footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script>
	function setUser(id) {
		document.getElementById("user_deletion_id").value = id;
	}
	
	function hideProductAdder() {
		let pAdder = document.getElementById("product-adder");
		pAdder.style.animation = "0.5s fadeOutRight forwards";
		setTimeOut(() => {pAdder.classList.add("d-none");}, 500);
	}
	
	function showProductAdder() {
		let pAdder = document.getElementById("product-adder");
		pAdder.classList.remove("d-none");
		pAdder.style.animation = "0.5s fadeInRight forwards";
	}
</script>
</body>
</html>