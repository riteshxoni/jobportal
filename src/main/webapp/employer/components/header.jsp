<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty sessionScope.currentEmployer }">
		<c:set var="emp" value="${sessionScope.currentEmployer}" scope="session" />
		<!doctype html>
		<html lang="en">
		  <head>
		    <meta charset="utf-8">
		    <meta name="viewport" content="width=device-width, initial-scale=1">
		    <title>Welcome | ${emp.company_name}</title>
		    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" >
		    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
		    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
		  </head>
		  <body> 
		  	<c:import url="/employer/components/modals.jsp" />   
		      <header class="position-fixed bg-white w-100">
		        <!-- Top Header & Logo Section -->
		          <div class="row bg-yg px-3 py-3 text-center justify-content-between">
		              <div class="col-sm-5 mb-2">
		                  <img src="${pageContext.request.contextPath}/images/CareerConnectLogo.png" alt="CareerConnectLogo" height="30px">
		                  <span class="fw-bold text-white fs-5 py-5">Job Portal</span>
		              </div>
		              <div class="col-sm-5 text-white">
		                  <a href="${pageContext.request.contextPath}/employer/profile.jsp" class="text-decoration-none mx-2 text-white fw-bold btn shadow-lg animate ">Welcome : ${emp.company_name}</a> /
		                  <a href="${pageContext.request.contextPath }/EmployerLogin" class="text-decoration-none mx-2 text-white fw-bold btn shadow-lg animate ">LogOut</a>
		              </div>
		          </div>
		      </header>
		 
		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
		  </body>
		</html>
</c:if>	

<c:if test="${empty sessionScope.currentEmployer }">
		<!doctype html>
		<html lang="en">
		  <head>
		    <meta charset="utf-8">
		    <meta name="viewport" content="width=device-width, initial-scale=1">
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
						     <a href="${pageContext.request.contextPath}/employer/login.jsp" class="text-decoration-none mx-2 text-white fw-bold btn shadow-lg animate ">Login</a> /
						     <a href="${pageContext.request.contextPath}/employer/signup.jsp" class="text-decoration-none mx-2 text-white fw-bold btn shadow-lg animate ">Register</a>
						</div>
		          </div>
		      </header>
		 
		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
		  </body>
		</html>
</c:if>	


