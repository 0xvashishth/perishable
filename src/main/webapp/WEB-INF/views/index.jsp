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
<body>
  
<%@include file="/WEB-INF/views/includes/navbar.jsp" %>

<section data-bs-version="5.1" class="header6 cid-sYeyiBfunk mbr-fullscreen mbr-parallax-background" id="header6-1">

    

    <div class="mbr-overlay" style="opacity: 0.3; background-color: rgb(0, 0, 0);"></div>

    <div class="align-center container-fluid">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-12">
                <h1 class="mbr-section-title mbr-fonts-style mbr-white mb-3 display-1"><strong>Enormous Entrepot</strong></h1>
                <h2 class="mbr-section-subtitle mbr-fonts-style mbr-white mb-3 display-5">Fruits? Vegetables? Meat? Yeah, its all here!</h2>
                
                <div class="mbr-section-btn mt-3"><a class="btn btn-success display-4" href="/shop/"><span class="mobi-mbri mobi-mbri-shopping-bag mbr-iconfont mbr-iconfont-btn"></span>Start Shopping!</a></div>
            </div>
        </div>
    </div>
</section>

<section data-bs-version="5.1" class="features1 cid-sYhmMRggx8" id="features1-5">
    

    
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-9">
                <h3 class="mbr-section-title mbr-fonts-style align-center mb-0 display-2"><strong>Why Choose Us?</strong></h3>
                
            </div>
        </div>
        <div class="row">
            <div class="card col-12 col-md-6 col-lg-3">
                <div class="card-wrapper">
                    <div class="card-box align-center">
                        <div class="iconfont-wrapper">
                            <span class="mbr-iconfont mobi-mbri-apple mobi-mbri" style="color: rgb(34, 153, 170); fill: rgb(34, 153, 170);"></span>
                        </div>
                        <h5 class="card-title mbr-fonts-style display-7"><strong>Fresh Food</strong></h5>
                        <p class="card-text mbr-fonts-style display-7">Quality is something one should never compromise on. We assure the best quality perishables at a cost everyone can afford.</p>
                    </div>
                </div>
            </div>
            <div class="card col-12 col-md-6 col-lg-3">
                <div class="card-wrapper">
                    <div class="card-box align-center">
                        <div class="iconfont-wrapper">
                            <span class="mbr-iconfont mobi-mbri-delivery mobi-mbri" style="color: rgb(34, 153, 170); fill: rgb(34, 153, 170);"></span>
                        </div>
                        <h5 class="card-title mbr-fonts-style display-7"><strong>Fast Deliveries</strong></h5>
                        <p class="card-text mbr-fonts-style display-7">Get your deliveries in just a matter of hours after you order.</p>
                    </div>
                </div>
            </div>
            <div class="card col-12 col-md-6 col-lg-3">
                <div class="card-wrapper">
                    <div class="card-box align-center">
                        <div class="iconfont-wrapper">
                            <span class="mbr-iconfont socicon-viber socicon" style="color: rgb(34, 153, 170); fill: rgb(34, 153, 170);"></span>
                        </div>
                        <h5 class="card-title mbr-fonts-style display-7"><strong>Customer Support</strong></h5>
                        <p class="card-text mbr-fonts-style display-7">Facing difficulties? You can always contact our support staff. We're always ready to help you out.</p>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</section>

<% if(session.getAttribute("user") == null) { %>
<section data-bs-version="5.1" class="content15 cid-sYlhTC5IYn" id="content15-a">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="card col-md-12 col-lg-10">
                <div class="card-wrapper">
                    <div class="card-box align-left">
                        <h4 class="card-title mbr-fonts-style mbr-white mb-3 display-5">
                            <strong>Want the best quality products for your kitchen?</strong></h4>
                        <p class="mbr-text mbr-fonts-style display-7">Create an account now and shop the best quality items for your kitchen. Creating an account is completely free.&nbsp;<br><br></p>
                        <div class="mbr-section-btn mt-3"><a class="btn btn-secondary display-4" href="/customer/register/show">Create My Account</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<% } %>

<section data-bs-version="5.1" class="gallery5 mbr-gallery cid-sYhnBDAeAO" id="gallery5-8">
    

    

    <div class="container">
        <div class="mbr-section-head">
            <h3 class="mbr-section-title mbr-fonts-style align-center m-0 display-2"><strong>Fruits, Vegetables, Oils, Meat &amp; More...</strong></h3>
            <h4 class="mbr-section-subtitle mbr-fonts-style align-center mb-0 mt-2 display-5">Explore our products</h4>
        </div>
        <div class="row mbr-gallery mt-4">
            <div class="col-12 col-md-6 col-lg-3 item gallery-image active">
                <div class="item-wrapper" data-toggle="modal" data-bs-toggle="modal" data-target="#sZRXfYPNHj-modal" data-bs-target="#sZRXfYPNHj-modal">
                    <img class="w-100" src="/assets/images/mbr-596x403.jpeg" alt="" data-slide-to="0" data-bs-slide-to="0" data-target="#lb-sZRXfYPNHj" data-bs-target="#lb-sZRXfYPNHj">
                    <div class="icon-wrapper">
                        <span class="mobi-mbri mobi-mbri-search mbr-iconfont mbr-iconfont-btn"></span>
                    </div>
                </div>
                <h6 class="mbr-item-subtitle mbr-fonts-style align-center mb-2 mt-2 display-7">Fruits</h6>
            </div><div class="col-12 col-md-6 col-lg-3 item gallery-image">
                <div class="item-wrapper" data-toggle="modal" data-bs-toggle="modal" data-target="#sZRXfYPNHj-modal" data-bs-target="#sZRXfYPNHj-modal">
                    <img class="w-100" src="/assets/images/mbr-2-596x397.jpeg" alt="" data-slide-to="1" data-bs-slide-to="1" data-target="#lb-sZRXfYPNHj" data-bs-target="#lb-sZRXfYPNHj">
                    <div class="icon-wrapper">
                        <span class="mobi-mbri mobi-mbri-search mbr-iconfont mbr-iconfont-btn"></span>
                    </div>
                </div>
                <h6 class="mbr-item-subtitle mbr-fonts-style align-center mb-2 mt-2 display-7">Vegetables</h6>
            </div><div class="col-12 col-md-6 col-lg-3 item gallery-image">
                <div class="item-wrapper" data-toggle="modal" data-bs-toggle="modal" data-target="#sZRXfYPNHj-modal" data-bs-target="#sZRXfYPNHj-modal">
                    <img class="w-100" src="/assets/images/mbr-347x231.jpeg" alt="" data-slide-to="2" data-bs-slide-to="2" data-target="#lb-sZRXfYPNHj" data-bs-target="#lb-sZRXfYPNHj">
                    <div class="icon-wrapper">
                        <span class="mobi-mbri mobi-mbri-search mbr-iconfont mbr-iconfont-btn"></span>
                    </div>
                </div>
                <h6 class="mbr-item-subtitle mbr-fonts-style align-center mb-2 mt-2 display-7">Vegetable Oils</h6>
            </div><div class="col-12 col-md-6 col-lg-3 item gallery-image">
                <div class="item-wrapper" data-toggle="modal" data-bs-toggle="modal" data-target="#sZRXfYPNHj-modal" data-bs-target="#sZRXfYPNHj-modal">
                    <img class="w-100" src="/assets/images/mbr-596x419.jpeg" alt="" data-slide-to="3" data-bs-slide-to="3" data-target="#lb-sZRXfYPNHj" data-bs-target="#lb-sZRXfYPNHj">
                    <div class="icon-wrapper">
                        <span class="mobi-mbri mobi-mbri-search mbr-iconfont mbr-iconfont-btn"></span>
                    </div>
                </div>
                <h6 class="mbr-item-subtitle mbr-fonts-style align-center mb-2 mt-2 display-7">Meat</h6>
            </div>
            
            
            
        </div>

        <div class="modal mbr-slider" tabindex="-1" role="dialog" aria-hidden="true" id="sZRXfYPNHj-modal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="carousel slide carousel-fade" id="lb-sZRXfYPNHj" data-interval="5000" data-bs-interval="5000">
                            <div class="carousel-inner">
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="/assets/images/mbr-596x403.jpeg" alt="">
                                </div><div class="carousel-item">
                                    <img class="d-block w-100" src="/assets/images/mbr-2-596x397.jpeg" alt="">
                                </div><div class="carousel-item">
                                    <img class="d-block w-100" src="/assets/images/mbr-347x231.jpeg" alt="">
                                </div><div class="carousel-item active">
                                    <img class="d-block w-100" src="/assets/images/mbr-596x419.jpeg" alt="">
                                </div>
                                
                                
                                
                            </div>
                            <ol class="carousel-indicators">
                                <li data-slide-to="0" data-bs-slide-to="0" class="active" data-target="#lb-sZRXfYPNHj" data-bs-target="#lb-sZRXfYPNHj"></li><li data-slide-to="1" data-bs-slide-to="1" class="active" data-target="#lb-sZRXfYPNHj" data-bs-target="#lb-sZRXfYPNHj"></li>
                                <li data-slide-to="2" data-bs-slide-to="2" data-target="#lb-sZRXfYPNHj" data-bs-target="#lb-sZRXfYPNHj"></li>
                                <li data-slide-to="3" data-bs-slide-to="3" data-target="#lb-sZRXfYPNHj" data-bs-target="#lb-sZRXfYPNHj"></li>
                                
                            </ol>
                            <a role="button" href="" class="close" data-dismiss="modal" data-bs-dismiss="modal" aria-label="Close">
                            </a>
                            <a class="carousel-control-prev carousel-control" role="button" data-slide="prev" data-bs-slide="prev" href="#lb-sZRXfYPNHj">
                                <span class="mobi-mbri mobi-mbri-arrow-prev" aria-hidden="true"></span>
                                <span class="sr-only visually-hidden">Previous</span>
                            </a>
                            <a class="carousel-control-next carousel-control" role="button" data-slide="next" data-bs-slide="next" href="#lb-sZRXfYPNHj">
                                <span class="mobi-mbri mobi-mbri-arrow-next" aria-hidden="true"></span>
                                <span class="sr-only visually-hidden">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section data-bs-version="5.1" class="testimonials2 cid-sYlmfeedvc" id="testimonials2-e">
    
    
    <div class="container">
        <h3 class="mbr-section-title mbr-fonts-style align-center mb-4 display-2">
            <strong>What our fantastic users say</strong></h3>
        <div class="row justify-content-center">
            <div class="card col-12 col-md-6">
                <p class="mbr-text mbr-fonts-style mb-4 display-7">Themes in the Mobirise website builder offer multiple blocks: intros, sliders, galleries, forms, articles, and so on. Start a project and click on the red plus buttons to see the blocks available for your theme.</p>
                <div class="d-flex mb-md-0 mb-4">
                    <div class="image-wrapper">
                        <img src="/assets/images/team1.jpg" alt="Mobirise">
                    </div>
                    <div class="text-wrapper">
                        <p class="name mbr-fonts-style mb-1 display-4">
                            <strong>Martin Smith</strong>
                        </p>
                        <p class="position mbr-fonts-style display-4">
                            <strong>Client</strong>
                        </p>
                    </div>
                </div>
            </div>
            <div class="card col-12 col-md-6">
                <p class="mbr-text mbr-fonts-style mb-4 display-7">You can have multiple pages in each project in Mobirise website builder software. Don't forget to set links to your pages after creating them. You can use menu blocks to create navigation for your site visitors.</p>
                <div class="d-flex mb-md-0 mb-4">
                    <div class="image-wrapper">
                        <img src="/assets/images/team2.jpg" alt="Mobirise">
                    </div>
                    <div class="text-wrapper">
                        <p class="name mbr-fonts-style mb-1 display-4">
                            <strong>Jessica Brown</strong>
                        </p>
                        <p class="position mbr-fonts-style display-4">
                            <strong>Client</strong>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section data-bs-version="5.1" class="team1 cid-sYlmkr8YGv" id="team1-f">
    

    
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h3 class="mbr-section-title mbr-fonts-style align-center mb-4 display-2">
                    <strong>Meet our Team</strong></h3>
                
            </div>
            <div class="col-sm-6 col-lg-3">
                <div class="card-wrap">
                    <div class="image-wrap">
                        <img src="/assets/images/snapshot-398x398.png" alt="">
                    </div>
                    <div class="content-wrap">
                        <h5 class="mbr-section-title card-title mbr-fonts-style align-center m-0 display-5"><strong>Shrey Naik</strong></h5>
                        <h6 class="mbr-role mbr-fonts-style align-center mb-3 display-4">
                            <strong>Programmer</strong>
                        </h6>
                        <div class="social-row display-7">
                            <div class="soc-item">
                                <a href="https://www.facebook.com/Mobirise/" target="_blank">
                                    <span class="mbr-iconfont socicon socicon-facebook"></span>
                                </a>
                            </div>
                            <div class="soc-item">
                                <a href="https://twitter.com/mobirise" target="_blank">
                                    <span class="mbr-iconfont socicon socicon-twitter"></span>
                                </a>
                            </div>
                            
                            
                            
                        </div>
                        
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-lg-3">
                <div class="card-wrap">
                    <div class="image-wrap">
                        <img src="/assets/images/team2.jpg">
                    </div>
                    <div class="content-wrap">
                        <h5 class="mbr-section-title card-title mbr-fonts-style align-center m-0 display-5">
                            <strong>Vashishth Patel</strong></h5>
                        <h6 class="mbr-role mbr-fonts-style align-center mb-3 display-4">
                            <strong>Manager</strong>
                        </h6>
                        <div class="social-row display-7">
                            <div class="soc-item">
                                <a href="https://www.facebook.com/Mobirise/" target="_blank">
                                    <span class="mbr-iconfont socicon socicon-facebook"></span>
                                </a>
                            </div>
                            <div class="soc-item">
                                <a href="https://twitter.com/mobirise" target="_blank">
                                    <span class="mbr-iconfont socicon socicon-twitter"></span>
                                </a>
                            </div>
                            
                            
                            
                        </div>
                        
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-lg-3">
                <div class="card-wrap">
                    <div class="image-wrap">
                        <img src="/assets/images/team3.jpg">
                    </div>
                    <div class="content-wrap">
                        <h5 class="mbr-section-title card-title mbr-fonts-style align-center m-0 display-5"><strong>Devanshu Patel</strong></h5>
                        <h6 class="mbr-role mbr-fonts-style align-center mb-3 display-4">
                            <strong>Analyst</strong>
                        </h6>
                        <div class="social-row display-7">
                            <div class="soc-item">
                                <a href="https://www.facebook.com/Mobirise/" target="_blank">
                                    <span class="mbr-iconfont socicon socicon-facebook"></span>
                                </a>
                            </div>
                            <div class="soc-item">
                                <a href="https://twitter.com/mobirise" target="_blank">
                                    <span class="mbr-iconfont socicon socicon-twitter"></span>
                                </a>
                            </div>
                            
                            
                            
                        </div>
                        
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-lg-3">
                <div class="card-wrap">
                    <div class="image-wrap">
                        <img src="/assets/images/team4.jpg">
                    </div>
                    <div class="content-wrap">
                        <h5 class="mbr-section-title card-title mbr-fonts-style align-center m-0 display-5">
                            <strong>Meet Katrodiya</strong></h5>
                        <h6 class="mbr-role mbr-fonts-style align-center mb-3 display-4">
                            <strong>Designer</strong>
                        </h6>
                        <div class="social-row display-7">
                            <div class="soc-item">
                                <a href="https://www.facebook.com/Mobirise/" target="_blank">
                                    <span class="mbr-iconfont socicon socicon-facebook"></span>
                                </a>
                            </div>
                            <div class="soc-item">
                                <a href="https://twitter.com/mobirise" target="_blank">
                                    <span class="mbr-iconfont socicon socicon-twitter"></span>
                                </a>
                            </div>
                            
                            
                            
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section data-bs-version="5.1" class="form9 cid-sYhnq0SsX0" id="form9-7">
    
    
    <div class="container">
        <div class="mbr-section-head">
            <h3 class="mbr-section-title mbr-fonts-style align-center mb-0 display-2">
                <strong>Subscribe to us</strong>
            </h3>
            
        </div>
        <div class="row justify-content-center mt-4">
            <div class="col-lg-8 mx-auto mbr-form" data-form-type="formoid">
                <form action="https://mobirise.eu/" method="POST" class="mbr-form form-with-styler mx-auto" data-form-title="Form Name"><input type="hidden" name="email" data-form-email="true" value="wBlZTaX1BbdZSGXmLjTLagsAxgfbmkUJarAJlEZrNXnsV/0KtPaMqhIsg68hfdh0JPdmWwyORd7EwzSoeazbdbpWP5kAOnQFB2g970g+PFFLdoCn+aj1VG41E7Lv04ts">
                    <div class="row">
                        <div hidden="hidden" data-form-alert="" class="alert alert-success col-12">Thanks for filling out the form!</div>
                        <div hidden="hidden" data-form-alert-danger="" class="alert alert-danger col-12">Oops...! some problem!</div>
                    </div>
                    <div class="dragArea row">
                        <div class="col-lg-12">
                            <p class="mbr-text mbr-fonts-style align-center mb-4 display-7">We'll keep you updated with the latest deals and offers at our store.</p>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12 form-group mb-3" data-for="name">
                            <input type="text" name="name" placeholder="Name" data-form-field="name" class="form-control" value="" id="name-form9-7">
                        </div>
                        <div data-for="email" class="col-lg-4 col-md-12 col-sm-12 form-group mb-3">
                            <input type="email" name="email" placeholder="Email" data-form-field="email" class="form-control" value="" id="email-form9-7">
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12 mbr-section-btn align-center"><button type="submit" class="btn btn-primary display-4">Submit</button></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>

<section style="background-color: #fff; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; color:#aaa; font-size:12px; padding: 0; align-items: center; display: flex;"><a href="https://mobirise.site/r" style="flex: 1 1; height: 3rem; padding-left: 1rem;"></a><p style="flex: 0 0 auto; margin:0; padding-right:1rem;">Website <a href="https://mobirise.site/f" style="color:#aaa;">was started</a> with Mobirise</p></section><script src="/assets/bootstrap/js/bootstrap.bundle.min.js"></script>  <script src="/assets/parallax/jarallax.js"></script>  <script src="/assets/smoothscroll/smooth-scroll.js"></script>  <script src="/assets/ytplayer/index.js"></script>  <script src="/assets/dropdown/js/navbar-dropdown.js"></script>  <script src="/assets/theme/js/script.js"></script>  <script src="/assets/formoid/formoid.min.js"></script>  
  
  
 <div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i class="mbr-arrow-up-icon mbr-arrow-up-icon-cm cm-icon cm-icon-smallarrow-up"></i></a></div>
    <input name="animation" type="hidden">
  </body>
</html>