<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.perishables.model.User" %>
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

<div class="container">
	<h2 class="text-center mt-5">Your Account</h2>
    <div class="main-body ">
    <br><br><br>
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card shadow p-3 mb-5 bg-white rounded">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="${pageContext.request.contextPath}/users/${sessionScope.user.id}.png" alt="Admin" class="rounded-circle" width="150">
                    <div class="mt-3">
                      <h4>${sessionScope.user.name}</h4>

                    </div>
                  </div>
                </div>
              </div>
              <div class="card mt-3 shadow p-3 mb-5 bg-white rounded">
                <ul class="list-group list-group-flush">
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <h5 class="mb-0"><i class="material-icons">email</i></h5>
                    <span class="text-muted">${sessionScope.user.email}</span>
                  </li>
                </ul>
              </div>
            </div>
            
            <div class="col-md-8">
              <div class="card mb-3 shadow p-3 mb-5 bg-white rounded">
                <div class="card-body">
                  <div class="row">
                  <form:form action="/customer/updateAdmin/submit" class="mx-auto container" method="POST" enctype="multipart/form-data" modelAttribute="admin">
					<form:hidden path="id" value="${admin.id}" />
					<form:hidden path="userType" value="${admin.userType}" />
					<input type="file" name="u_pic" accept="image/*" class="form-control input-control my-3" />
                  	<form:input class="input-control form-control my-3" path="name" value="${admin.name}" placeholder="Name" required="true" />
                  	<form:input class="input-control form-control my-3" type="email" path="email" value="${admin.email}" placeholder="Email" required="true" />                 	
                  	<form:input class="input-control form-control my-3" type="password" path="password" value="${admin.password}" placeholder="Password" required="true" />
                  	<input type="submit" value="Update Details" style="border-radius: 100px;" class="btn btn-primary my-5 float-end"/>
                  </form:form>
                </div>
              </div>

              <div class="row gutters-sm">
                <div class="col-sm-6 mb-3">
                  <div class="card h-100 shadow p-3 mb-5 bg-white rounded">
                    <div class="card-body">
                      <h6 class="d-flex align-items-center mb-3">Records&nbsp;<a href="#">Link</a></h6>
                      
                    </div>
                  </div>
                </div>
                <div class="col-sm-6 mb-3">
                  <div class="card h-100 shadow p-3 mb-5 bg-white rounded">
                    <div class="card-body">
                      <h6 class="d-flex align-items-center mb-3">CustomerData&nbsp;<a href="#">Link</a></h6>
                      
                    </div>
                  </div>
                </div>
              </div>



            </div>
          </div>

        </div>
    </div>
    
    <div class="modal" id="deleteModal" tabindex="-1">
	  <div class="modal-dialog" style="height: auto;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Delete Account</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-muted">
	        <p>Are you sure? Doing so, you will lose all your account details and won't be able to recover your account.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn" data-bs-dismiss="modal">Revert</button>
	        <a href="/customer/delete"><button type="button" class="btn btn-secondary">Confirm, Delete</button></a>
	      </div>
	    </div>
	  </div>
	</div>
    
    <div class="container text-center">
    	<button class="btn btn-secondary mx-auto my-5" style="border-radius: 100px;" data-bs-toggle="modal" data-bs-target="#deleteModal"><span class="mobi-mbri mobi-mbri-trash mbr-iconfont mbr-iconfont-btn"></span>Delete My Account</button>
    </div>
</div>

<%@include file="../includes/footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>