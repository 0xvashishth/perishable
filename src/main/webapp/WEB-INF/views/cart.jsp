 <%@page import="java.util.List, java.util.Iterator, java.util.Set, java.util.HashMap, com.perishables.model.Perishables" %>

<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html  >
<head>
  <!-- Site made with Mobirise Website Builder v5.6.0, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.6.0, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/mbr-96x104.png" type="image/x-icon">
  <meta name="description" content="">
  <title>Login | Enormous Entrepot</title>
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
	body {
		background-image: url("/assets/images/features4.jpg");
	}
</style>

<body>
  
<%@include file="/WEB-INF/views/includes/navbar.jsp" %>

<div class="my-5">&nbsp;</div>
<section data-bs-version="5.1" class="content4 my-5 container -fluid cid-sZRVizn1Ss border border-1 p-md-5 p-sm-3 p-2" id="content4-i">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="title col-md-12 col-lg-10">
                <h3 class="mbr-section-title mbr-fonts-style align-center mb-4 display-2">
                    <strong>Your Cart Details</strong></h3>
                     <% double G_total = 0; %>
            </div>
        </div>
    </div>
    <a href="/checkout/" class="btn btn-primary d-block mx-auto" style="border-radius: 100px;">Proceed to checkout</a>
    <button class="btn btn-primary d-block mx-auto" style="border-radius: 100px;" data-bs-toggle="modal" data-bs-target="#paymentModal">Proceed to checkout</button>
    
   	<div id="paymentModal" class="modal" tabindex="-1">
	  <div class="modal-dialog" style="height:auto;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Proceed to Checkout</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p style="line-height:1.5">Are you sure you wish to purchase all the products in your shopping cart? By clicking next, you will be redirected to the payment gateway.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn text-secondary" data-bs-dismiss="modal">Back To Cart</button>
	        <button type="button" class="btn btn-primary">Yes, I'm sure</button>
	      </div>
	    </div>
	  </div>
	</div>

    <section data-bs-version="5.1" class="slider4 mbr-embla cid-t1g1xJyXGa" id="slider4-s"> 
        <div class="position-relative text-center">
    		<div class="container-fluid">
            <div>
    			<div class="row justify-content-center">
                    <% Set<Perishables> products = (Set<Perishables>)request.getAttribute("pList"); 
                    	if(!products.isEmpty()) {
                    		HashMap<Long,Integer> lstcart = (HashMap<Long, Integer>)session.getAttribute("cart");
                    		if(lstcart != null) {
                    		for(Perishables p: products) { 
                    			if(lstcart.containsKey(p.getId())){
                    		%>

                    <div class="col-12 col-sm-6 col-lg-4 col-xl-3 mb-3">
                        <div class="slide-content border border-2">
                        	<div class="item-header">
                               <button id="normal-<%= p.getId() %>" style="border-radius: 50%; padding: 5px;" class="cart-btnremove btn item-btn float-end"><span class="mobi-mbri mobi-mbri-trash text-secondary float-end mbr-iconfont mbr-iconfont-btn"></span></button>
                        	</div>
                            <div class="item-wrapper">
                                <div class="item-img">
                                    <img src="/products/<%= p.getId() %>.png" style="height: 200px;">
                                </div>
                            </div>
                            <div class="item-content">
                                <h5 class="item-title mbr-fonts-style display-7"><strong><%= p.getName() %></strong></h5>
                                
                               <p style="display: inline" class="mbr-text mbr-fonts-style mt-3 display-7"><button id="decrease-<%=p.getId() %>" class="cart-btn- btn border">&minus;</button><div class="datapm" style="display: inline"><%=lstcart.get(p.getId()) %></div><button id="increase-<%=p.getId() %>" class="cart-btn+ border btn">+</button></p>
                               <p style="display: inline" class="mbr-text mbr-fonts-style mt-3 display-7">Total Price : <div class="dataprice" style="display: inline"> <%= p.getPrice() * (1 - (p.getDiscount() / 100.0)) * lstcart.get(p.getId()) %> <% G_total = G_total + p.getPrice() * (1 - (p.getDiscount() / 100.0)) * lstcart.get(p.getId()); %> </div> </p>
                               
                                <div class="position-absolute bg-warning d-inline-block px-3 pt-3 pb-0" style="border-radius: 0px 0px 100px 0px; top: -5px; left: 0;"> 
								<% if(p.getDiscount() != 0) { %>
								<p style="display: inline" class="text-start text-secondary m-2"><strike>Rs.<%= p.getPrice() %></strike><span class="text-primary"> Rs.<div class="takenprice" style="display: inline"><%= p.getPrice() * (1 - (p.getDiscount() / 100.0)) %></div></span></p>
								<% } else { %>
								<p style="display: inline" class="text-start text-primary m-2">Rs.<div class="takenprice" style="display: inline"><%= p.getPrice() %></div></p>
								<% } %>
								</div> 
                            </div>
                            <div class="mbr-section-btn item-footer mt-2">                            
                            </div>
                        </div>
                    </div>
                
                    <% }}}} %>
                    
                </div>
    </div>
    </div></div>
    </section>
    
     <h4 class="display-7 border text-muted p-2 text-end" style="display: block">Total = Rs.<div style="display: inline" id="gtotal"> <%= G_total %> </div> </h4>
    
</section>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>
<section style="background-color: #fff; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; color:#aaa; font-size:12px; padding: 0; align-items: center; display: flex;"><a href="https://mobirise.site/c" style="flex: 1 1; height: 3rem; padding-left: 1rem;"></a><p style="flex: 0 0 auto; margin:0; padding-right:1rem;">Website was <a href="https://mobirise.site/g" style="color:#aaa;">designed</a> with Mobirise</p></section><script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.bundle.min.js"></script>  <script src="${pageContext.request.contextPath}/assets/smoothscroll/smooth-scroll.js"></script>  <script src="${pageContext.request.contextPath}/assets/ytplayer/index.js"></script>  <script src="${pageContext.request.contextPath}/assets/dropdown/js/navbar-dropdown.js"></script>  <script src="${pageContext.request.contextPath}/assets/embla/embla.min.js"></script>  <script src="${pageContext.request.contextPath}/assets/embla/script.js"></script>  <script src="${pageContext.request.contextPath}/assets/theme/js/script.js"></script>  

  
 <div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i class="mbr-arrow-up-icon mbr-arrow-up-icon-cm cm-icon cm-icon-smallarrow-up"></i></a></div>
    <input name="animation" type="hidden">
 <script>
    	let xplus = document.getElementsByClassName("cart-btn+");
    	let xminus = document.getElementsByClassName("cart-btn-");
    	let datapm = document.getElementsByClassName("datapm");
    	let dataprice = document.getElementsByClassName("dataprice");
    	let takenprice = document.getElementsByClassName("takenprice");
    	let gtotal = document.getElementById("gtotal");
    	for(let i=0; i < xplus.length; i++) {
    		xplus[i].addEventListener("click", () => {
    			req = new XMLHttpRequest();
    			req.onload = function() {
    				const data = req.responseText;	
    			};
    			req.open("GET", "/cart/addmore?id=" + xplus[i].id);
    			req.send();
    			
    			datapm[i].innerHTML = parseFloat(datapm[i].textContent)+1;
    			dataprice[i].innerHTML = parseFloat(dataprice[i].textContent)+parseFloat(takenprice[i].textContent);
    			gtotal.innerHTML = parseFloat(gtotal.textContent)+parseFloat(takenprice[i].textContent);
    			
    		});
    	}
    	for(let i=0; i < xminus.length; i++) {
    		xminus[i].addEventListener("click", () => {
    			if(Number(datapm[i].textContent - 1) == 0)
    				return;
    			
    			req = new XMLHttpRequest();
    			req.onload = function() {
    				const data = req.responseText;
    				console.log(data);
    			};
    			req.open("GET", "/cart/removemore?id=" + xminus[i].id);
    			req.send();
    			datapm[i].innerHTML = parseFloat(datapm[i].textContent)-1;
    			dataprice[i].innerHTML = parseFloat(dataprice[i].textContent)-parseFloat(takenprice[i].textContent);
    			gtotal.innerHTML = parseFloat(gtotal.textContent)-parseFloat(takenprice[i].textContent);
    			
    		});
    	}
    	let x = document.getElementsByClassName("cart-btnremove");
    	let y = document.getElementsByClassName("itemwhole");
    	for(let i=0; i < x.length; i++) {
    		x[i].addEventListener("click", () => {
				x[i].parentElement.parentElement.parentElement.style.display = "none";
    			
    			req = new XMLHttpRequest();
    			req.onload = function() {
    				const data = req.responseText;
    				console.log(data);
    			};
    			req.open("GET", "/cart/removeitem?id=" + x[i].id);
    			req.send();
    			
    			gtotal.innerHTML = parseFloat(gtotal.textContent)-parseFloat(dataprice[i].textContent);
    			console.log(parseFloat(dataprice[i].textContent));
    			console.log("Removed");
    		});
    	}
    </script>
  </body>
</html>
