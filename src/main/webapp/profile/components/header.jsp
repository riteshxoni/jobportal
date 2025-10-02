<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp"/>
</c:if>
<c:set var="user" value="${sessionScope.currentUser }" scope="session" />
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome | ${user.name }</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  </head>
  <body>    
      <header class="position-fixed bg-white w-100">
        <!-- Top Header & Logo Section -->
          <div class="row bg-yg px-3 py-3 text-center justify-content-between">
              <div class="col-sm-5 mb-2">
                  <img src="${pageContext.request.contextPath}/images/CareerConnectLogo.png" alt="CareerConnectLogo" height="30px">
                  <span class="fw-bold text-white fs-5 py-5">Job Portal</span>
              </div>
              <div class="col-sm-5 text-white">
                  <a href="${pageContext.request.contextPath}/profile/profile.jsp" class="text-decoration-none mx-2 text-white fw-bold btn shadow-lg animate ">Welcome : ${user.name}</a> /
                  <a href="${pageContext.request.contextPath }/LoginController" class="text-decoration-none mx-2 text-white fw-bold btn shadow-lg animate ">LogOut</a>
              </div>
          </div>

          <!-- NavBar -->
          <nav class="navbar navbar-expand-lg">
            <div class="row mx-auto d-lg-none">
              <div class="col-10">
                <a class="navbar-brand" href="#">
                  <marquee direction="Right">We Want You. Apply And Work With Us | We Can Help You Succeed | Good Life Begins With A Good Company</marquee>
                </a>
              </div>
              <div class="col-1">
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#mobilemenu">
                  <span class="navbar-toggler-icon"></span>
                </button>
              </div>
            </div>
              <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                  <li class="nav-item animate  m-1">
                    <a class="nav-link active fw-bold" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">Home</a>
                  </li>
                  <li class="nav-item animate  m-1">
                    <a class="nav-link fw-bold" href="about.jsp">About Us</a>
                  </li>
                  <li class="nav-item animate  m-1">
                    <a class="nav-link fw-bold" href="contact.jsp">Contact Us</a>
                  </li>
                  <li class="nav-item animate  m-1">
                    <a href="search.jsp" class="nav-link fw-bold">Search Jobs</a>
                  </li>
                  <li class="nav-item animate  m-1">
                    <a href="companies.jsp" class="nav-link fw-bold">Companies</a>
                  </li>
                </ul>
              </div>
          </nav>
          <!-- Off canvas -->
        <div class="offcanvas offcanvas-start" tabindex="-1" id="mobilemenu">
          <div class="offcanvas-header bg-yg">
              <div class="col-sm-5 mb-2">
                  <img src="./images/CareerConnectLogo.png" alt="CareerConnectLogo" height="30px">
                  <span class="fw-bold text-white fs-5 py-5">Job Portal</span>
              </div>
            <button type="button" class="btn-close bg-white btn-animate" data-bs-dismiss="offcanvas"></button>
          </div>
          <div class="offcanvas-body">
              <ul class="navbar-nav">
                  <li class="nav-item animate  m-1">
                    <a class="nav-link active fw-bold" aria-current="page" href="index.jsp">Home</a>
                  </li>
                  <li class="nav-item animate  m-1">
                    <a class="nav-link fw-bold" href="about.jsp">About Us</a>
                  </li>
                  <li class="nav-item animate  m-1">
                    <a class="nav-link fw-bold" href="contact.jsp">Contact Us</a>
                  </li>
                  <li class="nav-item animate  m-1">
                    <a href="search.jsp" class="nav-link fw-bold">Search Jobs</a>
                  </li>
                  <li class="nav-item animate  m-1">
                    <a href="companies.jsp" class="nav-link fw-bold">Companies</a>
                  </li>
                </ul>
          </div>
        </div>
      <!-- Off canvas end-->
      </header>
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>