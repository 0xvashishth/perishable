<%@page import="java.util.List, java.util.Iterator, java.util.Set, java.util.HashMap, com.perishables.model.Perishables" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Site made with Mobirise Website Builder v5.6.0, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.6.0, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/mbr-96x104.png" type="image/x-icon">
  <meta name="description" content="">
  <title>Checkout | Perishables</title>
</head>
<body>
<h2>Checkout Page</h2>
<% double G_total = 0; %>

<a class="btn btn-primary">Bill Page</a>

<table border="2">
<body>
<tr>
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
</body>
</table>
Grand Total :-
<%= G_total %>
<br><br><hr>
<form action="submit" method="post">
Address : <input type="text" name="checkout_address" required/><br>
ATM Card Number : <input type="text" name="checkout_atm_no" required/><br>
ATM Card Cvv : <input type="text" name="checkout_atm_cvv" required/><br>
<input type="submit" />
</form>
</body>
</html>