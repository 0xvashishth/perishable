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
                    <strong>Login to your account</strong></h3>
            </div>
        </div>
    </div>

<p class="text-danger">${msg}</p>

<div class="g-0 row mx-auto">
<form class="col-md-6 col-sm-8 mx-auto col-12 px-2" method="POST" action="submit">
	<input type="email" name="email" class="input-control form-control my-3" placeholder="Username (Email)" required />
	<input type="password" name="password" class="input-control form-control my-3" placeholder="Password" required />
	<input type="submit" class="btn btn-primary float-end mb-5" value="Login" />
</form>
<br><br>
<a href="/customer/register/show">Want To Create An Account ?</a>
</div>
</section>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>

  <input name="animation" type="hidden">
  </body>
</html>