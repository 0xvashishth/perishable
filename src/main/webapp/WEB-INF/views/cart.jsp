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
<body>
  
<%@include file="/WEB-INF/views/includes/navbar.jsp" %>
<script type="text/javascript">
document.getElementById("loginlogout").innerHTML = "Register"
    document.getElementById("loginlogout").href = "/customer/register/show"
</script>
<div class="my-5">&nbsp;</div>
<section data-bs-version="5.1" class="content4 my-5 container cid-sZRVizn1Ss border border-1 p-md-5 p-sm-3 p-2" id="content4-i">
    <div class="container">
        <div class="row justify-content-center">
            <div class="title col-md-12 col-lg-10">
                <h3 class="mbr-section-title mbr-fonts-style align-center mb-4 display-2">
                    <strong>Your Cart Details</strong></h3>
            </div>
        </div>
    </div>
    <section data-bs-version="5.1" class="slider4 mbr-embla cid-t1g1xJyXGa" id="slider4-s">
    
 
        <div class="position-relative text-center">
    <div class="embla mt-4" data-skip-snaps="true" data-align="center" data-contain-scroll="trimSnaps" data-loop="true">
            <div class="embla__viewport container-fluid">
    <div class="embla__container">
                    <% Set<Perishables> products = (Set<Perishables>)request.getAttribute("pList"); 
                    	if(!products.isEmpty()) {
                    		HashMap<Long,Integer> lstcart = (HashMap<Long, Integer>)session.getAttribute("cart");
                    		for(Perishables p: products) { 
                    			if(lstcart.containsKey(p.getId())){
                    		%>
                    		
                    <div class="embla__slide slider-image item" style="margin-left: 1rem; margin-right: 1rem;">
                        <div class="slide-content">
                            <div class="item-wrapper">
                                <div class="item-img">
                                    <img src="/products/<%= p.getId() %>.png" style="height: 300px;">
                                </div>
                            </div>
                            <div class="item-content">
                                <h5 class="item-title mbr-fonts-style display-7"><strong><%= p.getName() %></strong></h5>
                                
                                <p style="display: inline" class="mbr-text mbr-fonts-style mt-3 display-7">Total Quantity : <button id="decrease-<%=p.getId() %>" class="cart-btn- btn-primary">-</button><div class="datapm" style="display: inline"><%=lstcart.get(p.getId()) %></div><button id="increase-<%=p.getId() %>" class="cart-btn+ btn-primary">+</button></p>
                                <div class="position-absolute bg-warning d-inline-block px-2" style="border-radius: 0px 0px 100px 0px; top: 0; left: 0;"> 
								<% if(p.getDiscount() != 0) { %>
								<p class="text-start text-secondary m-2"><strike>Rs. <%= p.getPrice() %></strike><span class="text-primary"> Rs.<%= p.getPrice() * (1 - (p.getDiscount() / 100.0)) %></span></p>
								<% } else { %>
								<p class="text-start text-primary m-2">Rs. <%= p.getPrice() %></p>
								<% } %>
								</div> 
								
								<% if(p.getDiscount() != 0) { %>
								<span class="discountTag position-absolute text-light bg-secondary border border-danger d-inline-block px-3 py-2" style="border-radius: 0px 0px 100px 100px; top: 0; right: 0;"><%= (int)p.getDiscount() %>% <br> off <br><br/><br/></span>
								<% } %>
                            </div>
                            <div class="mbr-section-btn item-footer mt-2">
                            <hr/>
                            
                      
                            <button id="normal-<%= p.getId() %>" class="cart-btn btn btn-secondary item-btn display-7 float-end" style="border-radius: 100px;" target="_blank">
                            	<span class="mobi-mbri mobi-mbri-cart-add mbr-iconfont mbr-iconfont-btn"></span>Remove From Cart&nbsp;
                            </button>
                            
                            </div>
                        </div>
                    </div>
                
                    <% }}} %>
                </div>
    </div>
    <button class="embla__button embla__button--prev">
                <span class="mobi-mbri mobi-mbri-arrow-prev mbr-iconfont" aria-hidden="true"></span>
                <span class="sr-only visually-hidden visually-hidden">Previous</span>
            </button>
            <button class="embla__button embla__button--next">
                <span class="mobi-mbri mobi-mbri-arrow-next mbr-iconfont" aria-hidden="true"></span>
                <span class="sr-only visually-hidden visually-hidden">Next</span>
            </button>
    </div></div></section>
	
</section>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>
  
 <div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i class="mbr-arrow-up-icon mbr-arrow-up-icon-cm cm-icon cm-icon-smallarrow-up"></i></a></div>
    <input name="animation" type="hidden">
 <script>
    	let xplus = document.getElementsByClassName("cart-btn+");
    	let xminus = document.getElementsByClassName("cart-btn-");
    	let datapm = document.getElementsByClassName("datapm");
    	for(let i=0; i < xplus.length; i++) {
    		xplus[i].addEventListener("click", () => {
    			req = new XMLHttpRequest();
    			req.onload = function() {
    				const data = req.responseText;	
    			};
    			req.open("GET", "/cart/addmore?id=" + xplus[i].id);
    			req.send();
    			datapm[i].innerHTML = parseInt(datapm[i].textContent)+1;
    		});
    	}
    	for(let i=0; i < xminus.length; i++) {
    		xminus[i].addEventListener("click", () => {
    			req = new XMLHttpRequest();
    			req.onload = function() {
    				const data = req.responseText;
    				console.log(data);
    			};
    			req.open("GET", "/cart/removemore?id=" + xminus[i].id);
    			req.send();
    			datapm[i].innerHTML = parseInt(datapm[i].textContent)-1;
    		});
    	}
    </script>
  </body>
</html>