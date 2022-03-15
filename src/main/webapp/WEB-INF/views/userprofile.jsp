<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<style>
    body{
        margin-top:0px;
        color: #1a202c;
        text-align: left;
        background-color: #e2e8f0;    
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
</head>
<body>

<%@include file="/WEB-INF/views/includes/navbar.jsp" %>

<div class="container">
<br><br>
<center>
<a class="btn btn-outline-primary" href="/"> Home </a>&nbsp;&nbsp;<a class="btn btn-outline-danger" href="/customer/logout"> Logout </a>
</center>
    <div class="main-body">
    <br><br><br>
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="${pageContext.request.contextPath}/users/${customer.id}.png" alt="Admin" class="rounded-circle" width="150">
                    <div class="mt-3">
                      <h4>${sessionScope.customer.name}</h4>

                    </div>
                  </div>
                </div>
              </div>
              <div class="card mt-3">
                <ul class="list-group list-group-flush">
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <h5 class="mb-0"><i class="material-icons">email</i></h5>
                    <span class="text-secondary">${sessionScope.customer.email}</span>
                  </li>
                </ul>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <h5 class="mb-0"><i class="material-icons">phone</i></h5>
                    <span class="text-secondary">${sessionScope.customer.mobNo}</span>
                  </li>
                </ul>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Full Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      ${sessionScope.customer.name}
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        ${sessionScope.customer.email}
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Phone</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        ${sessionScope.customer.mobNo}
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Date Of Birth</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        ${sessionScope.customer.dob}
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Address</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        ${sessionScope.customer.address}
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-12">
                      <a class="btn btn-info " target="__blank" data-bs-toggle="modal" data-bs-target="#editModal">Edit</a>
                    </div>
                  </div>
                </div>
              </div>

              <div class="row gutters-sm">
                <div class="col-sm-6 mb-3">
                  <div class="card h-100">
                    <div class="card-body">
                      <h6 class="d-flex align-items-center mb-3">Records&nbsp;<a href="#">Link</a></h6>
                      
                    </div>
                  </div>
                </div>
                <div class="col-sm-6 mb-3">
                  <div class="card h-100">
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

    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Edit Your Details</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form>
              
              <div class="mb-3">
                <label for="edit-fname" class="col-form-label">Edit First Name:</label>
                <input type="text" name="efname" class="form-control" id="edit-fname" value="${sessionScope.customer.name}" required>
              </div>
              <div class="mb-3">
                <label for="edit-phone" class="col-form-label">Edit Phone Number:</label>
                <input type="text" name="ephone" class="form-control" value="${sessionScope.customer.mobNo}" id="edit-phone" required>
              </div>
              <div class="mb-3">
                <label for="edit-address" class="col-form-label">Edit Address:</label>
                <input type="text" name="eaddress" class="form-control" value="${sessionScope.customer.email}" id="edit-address" required>
              </div>
               <div class="mb-3">
                <label for="address" class="col-form-label">Address:</label>
                <input type="text" name="address" class="form-control" value="${sessionScope.customer.address}" id="address" required>
              </div>
          </div>
          <div id="editdata"></div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <input type="submit" onclick="onedit()" class="btn btn-primary">
          </div>
          
          </form>
        </div>
      </div>
    </div>
    
<%@include file="/WEB-INF/views/includes/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>