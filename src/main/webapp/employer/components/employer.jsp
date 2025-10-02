<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Employer Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
  </head>
  <body>
  	<c:if test="${not empty sessionScope.currentEmployer }">
		<c:set var="emp" value="${sessionScope.currentEmployer}" scope="session" />
		    <div class="container">
		        <div class="row justify-content-center text-center align-items-center border-bottom border-3">
		            <div class="col-12 col-md-5 border py-4">
		                <img src="${pageContext.request.contextPath}/images/employer_pics/${emp.logo}" class="rounded-circle border border-4 shadow-lg" style="width: 250px;height: 250px;"><br>
		                <button type="button" data-bs-toggle="modal" data-bs-target="#editprofilepic" class="btn btn-primary my-2">Upload</button>
		            </div>
		            <div class="col-12 col-md-7 p-3">
		                <h1 class="display-2 fw-bold text-primary"> ${emp.company_name }</h1>
		                <p class="fw-bold text-secondary fs-2"> ${emp.industry_type }</p>
		                <p class="fw-bold  fs-2"><i class="bi bi-envelope"></i> ${emp.email }</p>
		                <p class="fw-bold  fs-2"><i class="bi bi-geo-alt-fill"></i> ${emp.location }</p>
		                <p class="fw-bold  fs-2"><i class="bi bi-globe"></i> ${emp.website }</p>
		            </div>
		        </div>
		        <div class="display-3 my-3">
		            <span class="border-bottom border-4 border-primary my-3">About</span>
		        </div>
		        <p class="my-3">${emp.about }</p>
		        <div class="display-3  my-4">
		            <span class="border-bottom border-4 border-primary my-3">Location</span>
		        </div>
		        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3662.096210703165!2d85.29049747532476!3d23.384736478921603!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39f4e0c075243e79%3A0x9cc7da96b3c75be3!2sShakti%20Poly%20Glass!5e0!3m2!1sen!2sin!4v1758391248969!5m2!1sen!2sin" class="w-100"  style="border:0;height: 400px;" ></iframe>
		       
		        <div class="display-3 my-3">
		            <span class="border-bottom border-4 border-primary my-3">Hr Details</span>
		        </div>
		        
		        <div>
		            <h1 class="fw-medium text-primary"> ${emp.hr_name }</h1>
		            <p><i class="bi bi-envelope"></i> ${emp.hr_email }</p>
		            <p><i class="bi bi-telephone-fill"></i> +91 ${emp.hr_phone }</p>
		        </div>
		        <div class="display-3 my-3">
		            <span class="border-bottom border-4 border-primary my-3">Active Jobs</span>
		        </div>
		        <div>
		            <c:set var="jobList" value="${sessionScope.jobs }" scope="session" />
		            <p class="fs-1 text-secondary"><i class="bi bi-suitcase-lg-fill"></i> ${f:length(jobList) }</p>
		        </div>
		    </div>
	</c:if>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
  </body>
</html>