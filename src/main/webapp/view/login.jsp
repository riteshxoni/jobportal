<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty sessionScope.currentUser }">
	<c:redirect url="/profile/profile.jsp" />
</c:if>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Job Portal | Create New Account</title>
  </head>
  <body>
    <div class="container-fluid p-0">
      
      <!-- Header Section -->
      <jsp:include page="/components/header.jsp" />

		<!-- Main Section -->
		
		    <div class="container-fluid p-0">
      
		<!-- Main Section -->
		<main class="p-2 mb-3">
	        <br><br><br><br><br><br><br>
	        <div class="row p-2 justify-content-center">
	            <div class="col-11 col-sm-6 col-md-4">
	                <h2 class="text-center display-5 fw-bold mb-4">Please Log in</h2>
	                <form action="${pageContext.request.contextPath}/LoginController" method="post" class="border p-3 rounded job">
	                	<c:if test="${not empty sessionScope.error}">
	                		<div class="alert alert-danger py-3">Invalid Email or Password!</div>
	                		<c:remove var="error" scope="session"/>
	                	</c:if>
	                    <label class="form-label">Email :   </label><input type="email" name="email" class="form-control mb-3" required>
	                    <label class="form-label">Password :</label><input type="password" name="password" class="form-control mb-3" required>
	                    <div class="mb-2"><input type="checkbox" name="remember" class="form-check-input" value="remember"> Remember Me</div>
	                    <button type="submit" class="btn btn-primary w-100 mt-3 btn-sm">Login</button>
	                </form>
	                <p class="text-center fs-4">or ...</p>
	                <a href="register.jsp" class="btn btn-success btn-sm mb-3 animate">Create Account</a><br>
	                <a href="forget.jsp" class="text-primary text-decoration-none">Have you forgotten your account details?</a>
	            </div>
	        </div>
	      </main>
	      
    </div>
		
      <!-- Footer Section -->
  	<%@ include file="/components/footer.jsp" %>
  	
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>