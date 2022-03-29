<%@page import="java.util.List, java.util.Iterator, java.util.Set, java.util.HashMap, com.perishables.model.*" %>

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
  
<% double G_total = 0; %>
<section id="confirm" class="col-12 col-sm-8 col-md-6 my-3 mx-auto p-3">
	<button onclick="window.location.href='/'" class="btn d-inline" style="border-radius: 100px;">Home</button>
	<button onclick="window.print()" class="btn d-inline" style="border-radius: 100px;">Print</button>
	<h3 class="text-center my-3">Order #${order.order_id}</h3>
	<div class="row g-0">
	<p class="text-muted col-sm-6 col-12" style="line-height:2;">
		Name: ${order.customer.name} <br/>
		Delivery Address: ${order.deliveryAddress}<br/>
	</p><p class="text-muted text-end col-sm-6 col-12" style="line-height:2;">
		Date: ${order.order_date}<br/>
		Total items: ${items.size()}
	</p>
	</div>

	<table class="table border bg-light">
	<tr class="bg-primary text-light">
	<th>Product</th>
	<th>Quantity</th>
	<th>Price</th>
	<th>Amount</th>
	
	</tr>
	<% List<orderItems> items = (List<orderItems>)request.getAttribute("items"); 
               	if(!items.isEmpty()) {
               		if(items != null) {
               		for(orderItems oi: items) { 
               		%>
               		<tr>
						<td><%= oi.getProduct().getName() %></td>
						<td><%= oi.getQuantity() %></td>
						<td><%= oi.getProduct().getPrice() %></td>
						<td><%= oi.getProduct().getPrice() * oi.getQuantity() %></td>
					</tr>
		<%}}} %>
	</table>
	
	<p class="text-end"><mark>Grand Total: <b>Rs.${order.total_price}</b></mark></p>
	
	<div class="container pt-3">
		<h4 class="text-center mt-3">Terms & Conditions</h4><br/>
		<p style="line-height: 2;">
			1. Order once delivered will not be taken back under any circumstances.<br/>
			2. We are not responsible for any transit loss, damage or leakage.<br/>
			3. 18% GST would be included along with the total amount.<br/>
			4. Subject to Gujarat jurisdiction.
		</p>
	</div>
	
	<div class="mt-5 text-end">
		<img src="${pageContext.request.contextPath}/order/stamp-removebg-preview.png" class="d-inline" style="width:225px; height:100px;" />
		<p class="px-3">The Enormous Entrepot</p>
	</div>
</section>
						
<section class="d-none" style="background-color: transparent; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; color:#aaa; font-size:12px; padding: 0; align-items: center; display: flex;"><a href="https://mobirise.site/r" style="flex: 1 1; visibility: hidden; height: 3rem; padding-left: 1rem;"></a><p style="visibility: hidden; flex: 0 0 auto; margin:0; padding-right:1rem;"><a href="https://mobirise.site/f" style="visibility: hidden; color:#aaa;"></a></p></section><script src="/assets/bootstrap/js/bootstrap.bundle.min.js"></script>  <script src="/assets/parallax/jarallax.js"></script>  <script src="/assets/smoothscroll/smooth-scroll.js"></script>  <script src="/assets/ytplayer/index.js"></script>  <script src="/assets/dropdown/js/navbar-dropdown.js"></script>  <script src="/assets/theme/js/script.js"></script>  <script src="/assets/formoid/formoid.min.js"></script>  

</body>
</html>