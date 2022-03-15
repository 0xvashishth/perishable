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
  <title>Register Customer</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/${pageContext.request.contextPath}/assets/mobirise-icons2/mobirise2.css">
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


<section data-bs-version="5.1" class="content4 cid-sZRVizn1Ss" id="content4-i">
    
    
    <div class="container">
        <div class="row justify-content-center">
            <div class="title col-md-12 col-lg-10">
                <h3 class="mbr-section-title mbr-fonts-style align-center mb-4 display-2">
                    <strong>Create Account</strong></h3>
                <h4 class="mbr-section-subtitle align-center mbr-fonts-style mb-4 display-7">
                    By creating an account you can gain access to your cart, go for shopping and make payments. What are you waiting for? Start by filling the form below.</h4>
                
            </div>
        </div>
    </div>
</section>

<section data-bs-version="5.1" class="features14 cid-sZRW97APpQ" id="features15-j">

    
    
    <div class="container">
        <div class="row justify-content-center">
            <div class="card col-12 col-md-6 col-lg-4">
                <div class="card-wrapper">
                    <span class="mbr-iconfont m-auto mobi-mbri-shopping-cart mobi-mbri" style="color: rgb(64, 176, 191); fill: rgb(64, 176, 191);"></span>
                    <div class="card-box">
                        <h4 class="card-title mbr-fonts-style mb-2 display-7"><strong>Unlock Cart</strong></h4>
                        <h5 class="card-text mbr-fonts-style display-4">Items you like will be stored in your cart.</h5>
                    </div>
                </div>
            </div>
            <div class="card col-12 col-md-6 col-lg-4">
                <div class="card-wrapper">
                    <span class="mbr-iconfont m-auto mobi-mbri-cash mobi-mbri" style="color: rgb(64, 176, 191); fill: rgb(64, 176, 191);"></span>
                    <div class="card-box">
                        <h4 class="card-title mbr-fonts-style mb-2 display-7"><strong>Shop</strong></h4>
                        <h5 class="card-text mbr-fonts-style display-4">Find tons of products to fulfill your daily requirements the way you like.</h5>
                    </div>
                </div>
            </div>
            <div class="card col-12 col-md-6 col-lg-4">
                <div class="card-wrapper">
                    <span class="mbr-iconfont m-auto mobi-mbri-protect mobi-mbri" style="color: rgb(64, 176, 191); fill: rgb(64, 176, 191);"></span>
                    <div class="card-box">
                        <h4 class="card-title mbr-fonts-style mb-2 display-7">
                            <strong>Secure Payments</strong></h4>
                        <h5 class="card-text mbr-fonts-style display-4">Pay without any hesitation.</h5>
                    </div>

                </div>
            </div>
            
        </div>
    </div>
</section>


<p class="container text-danger">${PassMismatch}</p>
<p class="container text-danger">${FieldEmpty}</p>

<form:form method="POST" enctype="multipart/form-data" class="container mx-auto w-50 pb-5 mb-5" action="submit" modelAttribute="customer">
		<form:input class="input-control form-control my-3" placeholder="Name" path="name" required="true" />
		<form:password class="input-control form-control my-3" placeholder="Password" path="password" required="true" />
		<input type="password" placeholder="Confirm Password" class="input-control form-control" name="c_pass" required />
		<form:input type="email" class="input-control form-control my-3" placeholder="Email" path="email" required="true" />
		<form:input type="text" class="input-control form-control my-3" placeholder="Address" path="address" required="true" />
		<form:input type="number" class="input-control form-control my-3" placeholder="Mobile Number" path="mobNo" required="true" />
		<form:input type="date" class="input-control form-control my-3" placeholder="Date of Birth" path="dob" required="true" />
		<input type="file" name="c_img" class="input-control form-control my-3" placeholder="Profile Picture" accept="image/png" />
		<input type="submit" class="btn btn-primary my-3 float-end" value="Register" />
		<br>
<a href="/customer/login/show">Already Have An Account ?</a>
</form:form>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>

<section style="background-color: #fff; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; color:#aaa; font-size:12px; padding: 0; align-items: center; display: flex;"><a href="https://mobirise.site/q" style="flex: 1 1; height: 3rem; padding-left: 1rem;"></a><p style="flex: 0 0 auto; margin:0; padding-right:1rem;"><a href="https://mobirise.site/r" style="color:#aaa;">The site</a> was created with Mobirise theme</p></section><script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.bundle.min.js"></script>  <script src="${pageContext.request.contextPath}/assets/smoothscroll/smooth-scroll.js"></script>  <script src="${pageContext.request.contextPath}/assets/ytplayer/index.js"></script>  <script src="${pageContext.request.contextPath}/assets/dropdown/js/navbar-dropdown.js"></script>  <script src="${pageContext.request.contextPath}/assets/theme/js/script.js"></script>    
  
 <div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i class="mbr-arrow-up-icon mbr-arrow-up-icon-cm cm-icon cm-icon-smallarrow-up"></i></a></div>
    <input name="animation" type="hidden">
  </body>
</html>