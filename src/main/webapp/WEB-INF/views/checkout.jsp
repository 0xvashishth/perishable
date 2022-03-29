<%@page import="java.util.List, java.util.Iterator, java.util.Set, java.util.HashMap, com.perishables.model.Perishables" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html  >
<head>
  <!-- Site made with Mobirise Website Builder v5.6.0, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.6.0, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="/assets/images/mbr-96x104.png" type="image/x-icon">
  <meta name="description" content="">
  <title>Home</title>
  <link rel="stylesheet" href="/assets/web//assets/mobirise-icons2/mobirise2.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="/assets/parallax/jarallax.css">
  <link rel="stylesheet" href="/assets/animatecss/animate.css">
  <link rel="stylesheet" href="/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
</head>

<style>
	body {
		background-image: url("/assets/images/features4.jpg");
	}
</style>

<body>
  
<%@include file="/WEB-INF/views/includes/navbar.jsp" %>
<% double G_total = 0; %>

<section id="confirm" class="col-12 col-sm-8 p-3 border my-5 col-md-6 mx-auto" style="min-height: 75vh; border-radius: 25px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	<h3 class="text-center my-3">Confirm Your Order</h3>
	<p class="text-muted text-center">Please check the order items in the table above before proceeding.</p>

	<table class="table border bg-light">
	<tr class="bg-primary text-light">
	<th>Index</th>
	<th> Name</th>
	<th> Quantity</th>
	<th> Price</th>
	<th> Discount</th>
	<th> Price</th>
	
	</tr>
	<% Set<Perishables> products = (Set<Perishables>)request.getAttribute("pList"); 
               	if(!products.isEmpty()) {
               		HashMap<Long,Integer> lstcart = (HashMap<Long, Integer>)session.getAttribute("cart");
               		if(lstcart != null) {
               		for(Perishables p: products) { 
               			if(lstcart.containsKey(p.getId())){
               		%>
               		<tr>
			<td><%= p.getId() %></td>
			<td><%= p.getName() %></td>
			<td><%= lstcart.get(p.getId()) %></td>
			<td><%= p.getPrice()%></td>
			<% if(p.getDiscount() != 0) { %>
			<td><%= p.getDiscount()%></td>
			<td><%= p.getPrice() * (1 - (p.getDiscount() / 100.0)) * lstcart.get(p.getId()) %></td>
			<%G_total = G_total + p.getPrice() * (1 - (p.getDiscount() / 100.0)) * lstcart.get(p.getId());}else{%>
			<td>0</td>
			<td><%= p.getPrice() * lstcart.get(p.getId()) %></td>
			<%G_total = G_total + p.getPrice() * lstcart.get(p.getId());} %>
		</tr>
		<%}}}} %>
	</table>
	
	<div class="text-end"><mark>
	<b>Grand Total :-</b>
	<%= G_total %>
	</mark>
	<br>
	</div>
	
	<div class="text-end mt-5">
		<button class="btn text-secondary" style="border-radius: 100px;">Back to cart</button>
		<button id="form-btn" class="btn btn-primary" style="border-radius: 100px;">Confirm</button>
	</div>
</section>
						
<section id="form" class="col-12 col-sm-8 p-3 border my-5 d-none col-md-6 mx-auto" style="min-height: 75vh; border-radius: 25px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
		<h3 class="text-center">Fill up the details</h3>
		<form action="submit" id="form" method="post" class="form my-3">
		Address : <textarea class="form-control input-control my-3" type="text" name="checkout_address" required></textarea>
		ATM Card Number : <input type="text" class="form-control input-control my-3" placeholder="XXXX - XXXX - XXXX - XXXX" name="checkout_atm_no" required/><br>
		3-digit CVV : <input type="number" placeholder="XXX" min="0" class="form-control input-control my-3" name="checkout_atm_cvv" required/><br>
		<input class="btn btn-primary float-end my-3" type="button" data-bs-toggle="modal" data-bs-target="#paymentModal"  value="Pay" style="border-radius: 100px;" />
		<button class="btn text-secondary float-end my-3" id="confirm-btn">Back</button>
		</form>
</section>

	<div id="paymentModal" class="modal" tabindex="-1">
	  <div class="modal-dialog" style="height:auto;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Payment Completed</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
				<img src="${pageContext.request.contextPath}/order/tick.gif" class="w-75 mx-auto d-block"/>
				<p class="text-center text-muted mb-3">Your order has been placed successfully!</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn text-muted" data-bs-dismiss="modal">Home</button>
	        <a href="submit" type="button" id="form-submit" class="btn btn-primary">Receive My Bill</a>
	      </div>
	    </div>
	  </div>
	</div>

<section class="d-none" style="background-color: transparent; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; color:#aaa; font-size:12px; padding: 0; align-items: center; display: flex;"><a href="https://mobirise.site/r" style="flex: 1 1; visibility: hidden; height: 3rem; padding-left: 1rem;"></a><p style="visibility: hidden; flex: 0 0 auto; margin:0; padding-right:1rem;"><a href="https://mobirise.site/f" style="visibility: hidden; color:#aaa;"></a></p></section><script src="/assets/bootstrap/js/bootstrap.bundle.min.js"></script>  <script src="/assets/parallax/jarallax.js"></script>  <script src="/assets/smoothscroll/smooth-scroll.js"></script>  <script src="/assets/ytplayer/index.js"></script>  <script src="/assets/dropdown/js/navbar-dropdown.js"></script>  <script src="/assets/theme/js/script.js"></script>  <script src="/assets/formoid/formoid.min.js"></script>  
  
  <script>
  		let nextBtn = document.getElementById("form-btn");	
  		let prevBtn = document.getElementById("confirm-btn");
  		let form = document.getElementById("form");
  		let confirm = document.getElementById("confirm");
  		nextBtn.addEventListener("click", () => {
  			confirm.classList.add("d-none");
  			form.classList.remove("d-none");
  		});
  		prevBtn.addEventListener("click", () => {
  			confirm.classList.remove("d-none");
  			form.classList.add("d-none");
  		});
  		
  		let subBtn = document.getElementById("form-submit");
  		let form1 = document.getElementById("form");
  		subBtn.addEventListener("click", () => {
  			form1.submit();
  		});
  </script>
</body>
</html>