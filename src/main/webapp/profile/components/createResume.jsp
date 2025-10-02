<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp"/>
</c:if>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Resume Builder</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css"  />
  </head>
  <body>
  <%@ include file="header.jsp" %>
  <br><br><br><br><br>
    <div class="row mt-5">
    <c:if test="${not empty sessionScope.currentUser }">
    	<c:set var="user" value="${sessionScope.currentUser }" scope="session" />
    	<c:set var="p" value="${pageContext.request.contextPath }" />
    	
    	<div class="col-12 col-md-4 text-center text-white" style="background-color: #212529;">
	            <div class="mt-5">
	                <img src="${p}/images/profile_pics/${user.photo}" height="200px" width="200px" class="rounded-circle border border-4">
	            </div>
	            <h2 class="mt-3"> ${user.name }</h2>
	            <p class="fw-bold"> ${user.title }</p>
	            <p><i class="fa-solid fa-envelope"></i> ${user.email }</p>
	            <p><i class="fa-solid fa-phone"></i> ${user.phone }</p>
	            <p><i class="fa-solid fa-location-dot"></i> ${user.city }</p>
	            <div class="my-3 fs-4">
	                <i class="fab fa-facebook-f"></i>
	                <i class="fab fa-twitter"></i>
	                <i class="fab fa-instagram"></i>
	                <i class="fab fa-linkedin-in"></i>
	                <i class="fab fa-youtube"></i>
	                <i class="fab fa-whatsapp"></i>
	                <i class="fab fa-telegram"></i>
	                <i class="fab fa-github"></i>
	            </div>
	        </div>
	        <div class="col-12 col-md-8 px-5 py-3">
	            <!-- About Me Section -->
	            <div class="my-3">
	                <span class="h2 fw-bold border-bottom border-4 border-primary pe-2 pb-1">About Me</span>
	            </div>
	            <p class="text-dark">${user.heading }</p>
	            
	            <!-- Skills Section -->
	            <div class="my-3">
	                <span class="h2 fw-bold border-bottom border-4 border-primary pe-2 pb-1">Skills</span>
	            </div>
	            <ul class="list-group list-group-flush">
	            	<c:if test="${not empty sessionScope.skills}">
	            		<c:forEach var="skill" items="${sessionScope.skills}" >
	            			<li class="my-1 fw-bold shadow-lg list-group-item list-group-item-action ">${skill.skill } / ${skill.proficiency }</li>
	            		</c:forEach>
	            	</c:if> 	
	            </ul>
	
	            <!-- Experience Section -->
	            <div class="my-3">
	                <span class="h2 fw-bold border-bottom border-4 border-primary pe-2 pb-1">Experience</span>
	            </div>
	            <c:if test="${not empty sessionScope.experience }">
	            	<c:forEach var="expe" items="${sessionScope.experience }">
	            		<div class="border p-2 shadow-lg">
			                <h6 class="bg-primary py-2 px-2 text-white">${expe.jobTitle } <span class="float-end">${expe.companyName }</span></h6>
			                <p class="text-secondary px-2 ">${expe.startDate } - ${expe.endDate } <span class="float-end">${expe.location }</span></p>
			                <p class="px-2 ">${expe.skillsUsed }</p>
			                <p class="px-2 ">${expe.description }</p>
			            </div>
	            	</c:forEach>
	            </c:if>
	            
	            
	
	            <!-- Projects Section -->
	            <div class="my-3">
	                <span class="h2 fw-bold border-bottom border-4 border-primary pe-2 pb-1">Projects</span>
	            </div>
	            <ul class="list-unstyled">
		            <c:if test="${not empty sessionScope.project }">
		            	<c:forEach var="pro" items="${sessionScope.project }">
		            		<li class="py-1 border p-4 my-2">
			            		Title : <span>${pro.projectTitle }</span>
			            		<ul>
			            			<li>Role : ${pro.role }</li>
			            			<li>Technologies : ${pro.technologies } </li>
			            			<li>StartDate : ${pro.startDate } - EndDate : ${pro.endDate }</li>
			            			<li>ProjectUrl : <a href="${pro.projectUrl }">${pro.projectUrl }</a></li>
			            			<li>GithubUrl : <a href="${pro.githubUrl }">${pro.githubUrl }</a></li>
			            			<li>Description : ${pro.description } </li>
			            		</ul>
		            		</li>
		            	</c:forEach>
		            </c:if>
	            </ul>
	            <!-- Education Section -->
	            <div class="my-3">
	                <span class="h2 fw-bold border-bottom border-4 border-primary pe-2 pb-1">Education</span>
	            </div>
	            <table class="table table-bordered">
	                <tr class="table-dark">
	                    <th>Degree / Course</th>
	                    <th>Institute</th>
	                    <th>Year</th>
	                    <th>Result</th>
	                </tr>
	                <c:if test="${not empty sessionScope.education }">
	                	<c:forEach var="edu" items="${sessionScope.education }">
	                		<tr>
			                    <td>${edu.courseDegree }</td>
			                    <td>${edu.schoolUniversity }</td>
			                    <td>${edu.year }</td>
			                    <td>${edu.result }%</td>
			                </tr>
	                	</c:forEach>
	                </c:if>
	            </table>
	            <!-- Contact Section -->
	            <div class="my-3">
	                <span class="h2 fw-bold border-bottom border-4 border-primary pe-2 pb-1">Contact</span>
	            </div>
	            <table class="table">
	                <tr><td class="bg-primary text-white fw-medium">Full Name      </td><td>:-</td><td>${user.name }</td></tr>
	                <tr><td class="bg-primary text-white fw-medium">Gender         </td><td>:-</td><td>${user.gender }</td></tr>
	                <tr><td class="bg-primary text-white fw-medium">DOB            </td><td>:-</td><td>${user.dob }</td></tr>
	                <tr><td class="bg-primary text-white fw-medium">Nationality    </td><td>:-</td><td>${user.nationality }</td></tr>
	                <tr><td class="bg-primary text-white fw-medium">Marital Status </td><td>:-</td><td>${user.maritalStatus }</td></tr>
	                <tr><td class="bg-primary text-white fw-medium">Father`s Name  </td><td>:-</td><td>Mr. ${user.fatherName }</td></tr>
	                <tr><td class="bg-primary text-white fw-medium">Mother`s Name  </td><td>:-</td><td>Mrs. ${user.motherName }</td></tr>
	                <tr><td class="bg-primary text-white fw-medium">Language       </td><td>:-</td><td>${user.language }</td></tr>
	            </table>
	        </div>
	        </c:if>
	    </div>
    	<div class="text-center my-5 py-2 border shadow-lg">
	    	<a  class="btn btn-secondary my-2 rounded-0 me-5" href="${pageContext.request.contextPath }/ResumeController">Download User Uploaded CV</a>
	    	<a href="${p}/ResumeBuilder" class="btn btn-primary my-2 rounded-0">Build & Download CV</a>
    	</div>
    	
    	
        
    <%@ include file="/components/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
  </body>
</html>