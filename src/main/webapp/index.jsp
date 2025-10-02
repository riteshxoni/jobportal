<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.jobportal.service.JobsService"%>

<jsp:scriptlet>
	JobsService service = new JobsService();
	service.getAllJobs(request);
</jsp:scriptlet>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Job Portal Project</title>
  </head>
  <body>
    <div class="container-fluid p-0">
    <!-- Top Header & Logo Section -->
    
   <c:choose>
	   	<c:when test="${not empty sessionScope.currentUser}">
	   		<c:import url="/profile/components/header.jsp" />
	   	</c:when>
	   	<c:when test="${not empty sessionScope.currentEmployer}">
	   		<c:import url="/employer/components/header.jsp" />
	   	</c:when>
	   	<c:otherwise>
	   		<c:import url="/components/header.jsp" />
	   	</c:otherwise>
   </c:choose>
    
      <main>
        <!-- Banner Section --> 
         <br><br><br><br><br>
        <div class="row p-3 align-items-center" style="background: #f6d903;">
            <div class="col">
              <img src="./images/Banner.png" alt="Banner" class="img-fluid" style="height: 200px;">
            </div>
            <div class="col py-md-5 text-center pt-5">
              <h2>Get Latest Jobs Information at Career Connect</h2>
              <a href="./view/register.jsp" class="btn btn-primary animate">Create Your Account</a>
            </div>
          </div>

        <!-- Search Jobs Sections -->
         <div class="row p-5 mx-auto">
          <div class="col-12 display-4 py-3 text-center fw-bold text-capitalize">find your dream job</div>
          <div class="col-12 col-sm-4"><input type="text" name="Technology" placeholder="Technology..." class="mb-3 form-control" required></div>
          <div class="col-12 col-sm-4"><input type="text" name="Location" placeholder="Location..."     class="mb-3 form-control" required></div>
          <div class="col-12 col-sm-4 animate"><button type="button" class="btn btn-success w-100">Search Job</button></div>
         </div>
      </main>

      <!-- Top IT Companies & Job Categories -->
      <div class="row p-3">
        <div class="col-12 display-6 text-center py-3 fw-bold">Top IT Companies & Job Categories</div>
        <div class="col-4 col-sm-6">
          <a href="#" class="btn btn-info text-light fw-bold w-100 mb-2 animate">TCS</a>
          <a href="#" class="btn btn-info text-light fw-bold w-100 mb-2 animate">Infosys</a>
          <a href="#" class="btn btn-info text-light fw-bold w-100 mb-2 animate">Wipro</a>
          <a href="#" class="btn btn-info text-light fw-bold w-100 mb-2 animate">IBM</a>
          <a href="#" class="btn btn-info text-light fw-bold w-100 mb-2 animate">Google</a>
          <a href="#" class="btn btn-info text-light fw-bold w-100 mb-2 animate">HCL</a>
          <a href="#" class="btn btn-info text-light fw-bold w-100 mb-2 animate">Accenture</a>
          <a href="#" class="btn btn-info text-light fw-bold w-100 mb-2 animate">Cognizant</a>
          
        </div>
        <div class="col-8 col-sm-6">
          <a href="#" class="btn btn-secondary fw-bold mb-2 w-100 animate">Software Development</a>
          <a href="#" class="btn btn-secondary fw-bold mb-2 w-100 animate">Network Administration</a>
          <a href="#" class="btn btn-secondary fw-bold mb-2 w-100 animate">System Administrator</a>
          <a href="#" class="btn btn-secondary fw-bold mb-2 w-100 animate">Cybersecurity</a>
          <a href="#" class="btn btn-secondary fw-bold mb-2 w-100 animate">Data Analysis</a>
          <a href="#" class="btn btn-secondary fw-bold mb-2 w-100 animate">IT Support</a>
          <a href="#" class="btn btn-secondary fw-bold mb-2 w-100 animate">Other IT Roles</a>
          <a href="#" class="btn btn-secondary fw-bold mb-2 w-100 animate">IT Auditor</a>
        </div>
      </div>

    <!-- Jobs Section -->
     <div class="row m-3 justify-content-center">
	     <c:if test="${not empty sessionScope.allJobs }">
	     	<c:set var="cNames" value="${sessionScope.c_names }" scope="session"/>
	     	<c:forEach var="j" items="${sessionScope.allJobs }" varStatus="loop">
				<div class="col-12 col-sm-6 col-lg-4 job">
		          <figure class="figure py-3">
		            <div class="figure-img text-center" >
		              <img src="${pageContext.request.contextPath}/images/jobs_pics/${j.photo}" alt="job logo" class="img-fluid img-thumbnail" style="height: 150px;">
		            </div>
		            <figcaption class="figure-caption">
		              <h6 class="fw-bold">${j.job_title } <span class="float-end text-secondary ">${j.salary_range } LPA</span> </h6>
		              
		                <span><span class="fw-bold">Company :</span> ${cNames[j.employeeId] }</span>
		                <div class="d-flex justify-content-between">
                            <p><span class="fw-bold">JobType :  </span> ${j.job_type }</p>
                            <p><span class="fw-bold">Experience :  </span> ${j.experience_required } Years</p>
                        </div>
		                <span class="fw-bold">Description : </span><span class="small"> ${j.description } </span>
		              
		              <p class="my-3"><span class="fw-bold">Skills :  </span> ${j.skills_required }</p>
                      <div class="d-flex justify-content-between gap-3">
                          <p><span class="fw-bold">Location :  </span> ${j.location }</p>
                          <p><span class="fw-bold">Expire Date :</span> ${j.expire_date }</p>
                      </div>
		            </figcaption>
		            <a class="btn btn-primary animate" href="${pageContext.request.contextPath }/view/application.jsp?id=${j.id }">Apply Now</a>
		          </figure>
		        </div>
	     	</c:forEach>
	     </c:if>
    </div>
     <!-- Top Companies Hiring -->
      <div class="row p-2">
        <div class="col-12 display-3 fw-bold text-center my-3">Top Companies Hiring</div>
        <div class="col-3 col-md mb-2 logo"><img src="./images/logos/1.png" alt="Company1" class="img-fluid img-thumbnail"></div>
        <div class="col-3 col-md mb-2 logo"><img src="./images/logos/2.jpg" alt="Company2" class="img-fluid img-thumbnail"></div>
        <div class="col-3 col-md mb-2 logo"><img src="./images/logos/3.jpg" alt="Company3" class="img-fluid img-thumbnail"></div>
        <div class="col-3 col-md mb-2 logo"><img src="./images/logos/4.webp" alt="Company4" class="img-fluid img-thumbnail"></div>
        <div class="col-3 col-md mb-2 logo"><img src="./images/logos/5.jpg" alt="Company5" class="img-fluid img-thumbnail"></div>
        <div class="col-3 col-md mb-2 logo"><img src="./images/logos/6.jpg" alt="Company3" class="img-fluid img-thumbnail"></div>
        <div class="col-3 col-md mb-2 logo"><img src="./images/logos/7.jpg" alt="Company7" class="img-fluid img-thumbnail"></div>
        <div class="col-3 col-md mb-2 logo"><img src="./images/logos/8.png" alt="Company8" class="img-fluid img-thumbnail"></div>
      </div>
      <!-- Footer Section -->
		<%@ include file="./components/footer.jsp" %>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>