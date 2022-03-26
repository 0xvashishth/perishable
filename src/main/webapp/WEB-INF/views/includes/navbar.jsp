<style>
	a:hover {
		color: green !important;
	}
</style>

<section data-bs-version="5.1" class="menu menu1 cid-sYexKegmMS" once="menu" id="menu1-0">
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container-fluid">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="https://mobiri.se">
                        <img src="/assets/images/mbr-96x104.png" alt="Mobirise" style="height: 3rem;">
                    </a>
                </span>
                <span class="navbar-caption-wrap"><a class="navbar-caption text-white display-7" href="https://mobiri.se">&nbsp;</a></span>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-bs-toggle="collapse" data-target="#navbarSupportedContent" data-bs-target="#navbarSupportedContent" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <div class="hamburger">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true"><li class="nav-item dropdown"><a class="nav-link link text-white dropdown-toggle display-4" href="https://mobiri.se" data-toggle="dropdown-submenu" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="true">Shop</a><div class="dropdown-menu" aria-labelledby="dropdown-undefined"><a class="text-white dropdown-item display-4" href="https://mobiri.se">Fruits</a><a class="text-white show dropdown-item display-4" href="https://mobiri.se">Vegetables</a><a class="text-white show dropdown-item display-4" href="https://mobiri.se">Meat</a><a class="text-white show dropdown-item display-4" href="https://mobiri.se">Other Essentials</a></div></li>
                    <li class="nav-item"><a class="nav-link link text-white show display-4" href="https://mobiri.se" aria-expanded="false">Cart</a></li><li class="nav-item"><a class="nav-link link text-white display-4" href="https://mobiri.se">Contact</a>
                    </li></ul>

                ${user.userType == "Admin" ? '<div class="navbar-buttons mbr-section-btn"><a class="nav-link link text-white show display-4" href="/admin/dashboard">Admin Panel</a></div>' : ""}
            
            	<% if(session.getAttribute("user") == null) { %>    
                <div class="navbar-buttons mbr-section-btn"><a class="btn btn-primary display-4" id="loginlogout" href="/customer/login/show"><span class="mobi-mbri mobi-mbri-login mbr-iconfont mbr-iconfont-btn"></span>Sign in</a></div>
            	<% } else { %>
                <div class="navbar-buttons mbr-section-btn">
                	<a class="btn btn-transparent display-4" href="/customer/customerprofile"><img src="${pageContext.request.contextPath}/users/${user.id}.png" class="border-1 border" style="border-radius: 50%; width: 30px; height: 30px;" /></a>
                </div>
                <div class="navbar-buttons mbr-section-btn"><a class="btn btn-secondary display-4" id="loginlogout" href="/customer/logout"><span class="mobi-mbri mobi-mbri-logout mbr-iconfont mbr-iconfont-btn"></span>Sign out</a></div>
            	<% } %>
            </div>
        </div>
    </nav>
</section>