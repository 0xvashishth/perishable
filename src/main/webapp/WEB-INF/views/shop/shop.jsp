    <%@page import="java.util.List, java.util.Set, java.util.HashMap, com.perishables.model.Perishables" %>

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
  
  
  <title>Shop</title>
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
  
<%@include file="../includes/navbar.jsp" %>

<section data-bs-version="5.1" class="slider4 mbr-embla cid-t1g1xJyXGa" id="slider4-s">
    
    
    <div class="position-relative text-center">
        <div class="mbr-section-head">
            <h4 class="d-inline-block mbr-section-title mbr-fonts-style align-center mb-0 display-2">
                <strong>Perishables</strong></h4>
                <form action="/shop/" class="row g-0 px-3 px-md-5">
                <div class="col-12 col-sm-8 col-md-6 mx-auto">
            		<input type="search" value="${filter_text}" name="p_string" class="form-control py-2 border-success border-1 px-3 my-3 w-75 d-inline" placeholder="Search product by name" />
            		<select name="p_type" value="${filter_type}" class="py-2 px-3 d-inline">
            			<option class="form-control input-control" value="All">All Types</option>
            			<option class="form-control input-control" value="Fruits">Fruits</option>
            			<option class="form-control input-control" value="Vegetables">Vegetables</option>
            			<option class="form-control input-control" value="Dairy">Dairy</option>
            			<option class="form-control input-control" value="Meat">Meat</option>
            			<option class="form-control input-control"  value="Oil">Oil</option>
            		</select>
            		<input type="submit" style="width: auto;" class="btn btn-primary form-control mx-auto d-inline" value="Search" />
           		</div>
            	</form>
        </div>
        <div class="embla mt-4" data-skip-snaps="true" data-align="center" data-contain-scroll="trimSnaps" data-loop="true">
            <div class="embla__viewport container-fluid">
                <div class="embla__container">
                    <% Set<Perishables> products = (Set<Perishables>)request.getAttribute("pList"); 
                    	if(!products.isEmpty()) {
                    		for(Perishables p: products) { %>
                    		
                    <div class="embla__slide slider-image item" style="margin-left: 1rem; margin-right: 1rem;">
                        <div class="slide-content">
                            <div class="item-wrapper">
                                <div class="item-img">
                                    <img src="/products/<%= p.getId() %>.png" style="height: 300px;">
                                </div>
                            </div>
                            <div class="item-content">
                                <h5 class="item-title mbr-fonts-style display-7"><strong><%= p.getName() %></strong></h5>
                                
                                <p class="mbr-text mbr-fonts-style mt-3 display-7"><%= p.getDescription() %></p>
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
                            
                            <% if(session.getAttribute("cart") != null) {
                            if( ((HashMap<Long, Integer>)session.getAttribute("cart")).containsKey(p.getId()) ) { %>
                            <button id="normal-<%= p.getId() %>" class="cart-btn btn item-btn display-7 float-end" style="border-radius: 100px;" target="_blank">
                            	<span class="mobi-mbri mobi-mbri-success mbr-iconfont mbr-iconfont-btn"></span>Added&nbsp;
                            </button>
                            <% } else { %>
                            <button id="normal-<%= p.getId() %>" class="cart-btn btn btn-primary item-btn display-7 float-end" style="border-radius: 100px;" target="_blank">
                            	<span class="mobi-mbri mobi-mbri-cart-add mbr-iconfont mbr-iconfont-btn"></span>Add To Cart&nbsp;
                            </button>
                            <% }} else { %>
                            <button id="normal-<%= p.getId() %>" class="cart-btn btn btn-primary item-btn display-7 float-end" style="border-radius: 100px;" target="_blank">
                            	<span class="mobi-mbri mobi-mbri-cart-add mbr-iconfont mbr-iconfont-btn"></span>Add To Cart&nbsp;
                            </button>
                            <% } %>
                            </div>
                        </div>
                    </div>
                
                    <% }} %>
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
        </div>
    </div>
</section>

<section data-bs-version="5.1" class="slider4 mbr-embla cid-t1g1scICbE" id="slider4-r">
    
    
    <div class="position-relative text-center">
        <div class="mbr-section-head">
            <h4 class="mbr-section-title mbr-fonts-style align-center mb-0 display-2"><strong>Get Limited Offer Discounts</strong></h4>
            
        </div>
        <div class="embla mt-4" data-skip-snaps="true" data-align="center" data-contain-scroll="trimSnaps" data-draggable="true">
            <div class="embla__viewport container-fluid">
                <div class="embla__container">
                    <%  
                    	if(!products.isEmpty()) {
                    		for(Perishables p: products) { 
                    			if(p.getDiscount() != 0) { %>
                    <div class="embla__slide slider-image item" style="margin-left: 1rem; margin-right: 1rem;">
                        <div class="slide-content">
                            <div class="item-wrapper">
                                <div class="item-img">
                                    <img src="/products/<%= p.getId() %>.png" style="height: 300px;">
                                </div>
                            </div>
                            <div class="item-content">
                                <h5 class="item-title mbr-fonts-style display-7"><strong><%= p.getName() %></strong></h5>
                                
                                <p class="mbr-text mbr-fonts-style mt-3 display-7"><%= p.getDescription() %></p>
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
                            <% if(session.getAttribute("cart") != null) {
                            if( ((HashMap<Long, Integer>)session.getAttribute("cart")).containsKey(p.getId()) ) { %>
                            <button id="discount-<%= p.getId() %>" class="cart-btn btn item-btn display-7 float-end" style="border-radius: 100px;" target="_blank">
                            	<span class="mobi-mbri mobi-mbri-success mbr-iconfont mbr-iconfont-btn"></span>Added&nbsp;
                            </button>
                            <% } else { %>
                            <button id="discount-<%= p.getId() %>" class="cart-btn btn btn-primary item-btn display-7 float-end" style="border-radius: 100px;" target="_blank">
                            	<span class="mobi-mbri mobi-mbri-cart-add mbr-iconfont mbr-iconfont-btn"></span>Add To Cart&nbsp;
                            </button>
                            <% }} else { %>
                            <button id="discount-<%= p.getId() %>" class="cart-btn btn btn-primary item-btn display-7 float-end" style="border-radius: 100px;" target="_blank">
                            	<span class="mobi-mbri mobi-mbri-cart-add mbr-iconfont mbr-iconfont-btn"></span>Add To Cart&nbsp;
                            </button>
                            <% } %>
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
        </div>
    </div>
</section>

<section data-bs-version="5.1" class="features23 cid-t1fYIDuQyp" id="features24-q">

    
    <div class="mbr-overlay" style="opacity: 0.8; background-color: rgb(255, 255, 255);">
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card-wrapper mb-4">
                    <div class="card-box align-center">
                        <h4 class="card-title mbr-fonts-style mb-4 display-2">
                            <strong>Steps</strong>
                        </h4>
                        
                        
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4">
                <div class="item first mbr-flex p-4">
                    <div class="icon-wrap w-100">
                        <div class="icon-box">
                            <span class="step-number mbr-fonts-style display-5">1</span>
                        </div>
                    </div>

                    <div class="text-box">
                        <h4 class="icon-title card-title mbr-black mbr-fonts-style display-7">
                            <strong>Login</strong></h4>
                        <h5 class="mbr-text mbr-black mbr-fonts-style display-4">Login to your account in order to fill your cart. If you don't have an account, then create one. It's absolutely free of cost!</h5>
                    </div>
                </div>
                <!-- <span mbr-icon class="mbr-iconfont mobi-mbri-devices mobi-mbri"></span> -->
            </div>
            <div class="col-12 col-md-6 col-lg-4">
                <div class="item mbr-flex p-4">
                    <div class="icon-wrap w-100">
                        <div class="icon-box">
                            <span class="step-number mbr-fonts-style display-5">2</span>
                        </div>
                    </div>
                    <div class="text-box">
                        <h4 class="icon-title card-title mbr-black mbr-fonts-style display-7"><strong>Fill Your Cart</strong></h4>
                        <h5 class="mbr-text mbr-black mbr-fonts-style display-4">Liked an item but don't want to search for it again? Add it to your customized cart and leave the rest up to us.</h5>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4">
                <div class="item mbr-flex p-4">
                    <div class="icon-wrap w-100">
                        <div class="icon-box">
                            <span class="step-number mbr-fonts-style display-5">3</span>
                        </div>
                    </div>
                    <div class="text-box">
                        <h4 class="icon-title card-title mbr-black mbr-fonts-style display-7"><strong>Payment and Delivery</strong></h4>
                        <h5 class="mbr-text mbr-black mbr-fonts-style display-4">Empty your cart, make your bill, pay and get your order delivered within hours!</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="../includes/footer.jsp" %>

<section style="background-color: #fff; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; color:#aaa; font-size:12px; padding: 0; align-items: center; display: flex;"><a href="https://mobirise.site/c" style="flex: 1 1; height: 3rem; padding-left: 1rem;"></a><p style="flex: 0 0 auto; margin:0; padding-right:1rem;">Website was <a href="https://mobirise.site/g" style="color:#aaa;">designed</a> with Mobirise</p></section><script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.bundle.min.js"></script>  <script src="${pageContext.request.contextPath}/assets/smoothscroll/smooth-scroll.js"></script>  <script src="${pageContext.request.contextPath}/assets/ytplayer/index.js"></script>  <script src="${pageContext.request.contextPath}/assets/dropdown/js/navbar-dropdown.js"></script>  <script src="${pageContext.request.contextPath}/assets/embla/embla.min.js"></script>  <script src="${pageContext.request.contextPath}/assets/embla/script.js"></script>  <script src="${pageContext.request.contextPath}/assets/theme/js/script.js"></script>  
  
  
 <div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i class="mbr-arrow-up-icon mbr-arrow-up-icon-cm cm-icon cm-icon-smallarrow-up"></i></a></div>
    <input name="animation" type="hidden">
    
    <script>
    	let x = document.getElementsByClassName("cart-btn");
    	for(let i=0; i < x.length; i++) {
    		x[i].addEventListener("click", () => {
    			x[i].disabled = true;
    			x[i].classList.remove("btn-primary");
    			x[i].classList.add("btn-muted");
    			x[i].innerHTML = `<span class="text-dark">Added</span><span class="mobi-mbri mobi-mbri-success mbr-iconfont text-dark mbr-iconfont-btn"></span>`;
    		
    			req = new XMLHttpRequest();
    			req.onload = function() {
    				const data = req.responseText;
    				console.log(data);
    			};
    			req.open("GET", "/cart/add?id=" + x[i].id);
    			req.send();
    		});
    	}
    </script>
  </body>
</html>