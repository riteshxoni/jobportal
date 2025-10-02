<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" >
  </head>
  <body>
    <div class="container">
        <div class="p-5 border shadow-lg">
            <div class="d-flex justify-content-between border-bottom border-2 my-3">
                <h3 class="border-bottom border-3">Jobs</h3>
                <button type="button" class="btn btn-primary btn-sm mb-2" data-bs-toggle="modal" data-bs-target="#createJob">Post Jobs</button>
            </div>
            <div class="row justify-content-center">
            	<c:if test="${not empty sessionScope.jobs }">
            		<c:forEach var="j" items="${sessionScope.jobs }" varStatus="loop">
            			<div class="col-11 col-md-6 col-lg-4 my-3">
		                    <div class="card">
		                        <img src="${pageContext.request.contextPath}/images/jobs_pics/${j.photo}" class="card-img-top" height="200">
		                        <div class="card-body">
		                            <div class="d-flex justify-content-between">
		                                <h5 class="card-title">${j.job_title }</h5>
		                                <p class="text-secondary">${j.salary_range } LPA</p>
		                            </div>
		                            
		                            <p class="card-text">${j.description }</p>
		                            <p>Skills : ${j.skills_required }</p>
		                            <div class="d-flex justify-content-between">
		                                <p>Location : ${j.location }</p>
		                                <p>Expire Date : ${j.expire_date }</p>
		                            </div>
		                            <div class="d-flex justify-content-between">
		                                <p>JobType : ${j.job_type }</p>
		                                <p>Experience : ${j.experience_required } Years</p>
		                            </div>
		                            <div class="d-flex justify-content-between">
		                                <a href="./editJob.jsp?index=${loop.index }" class="btn btn-warning text-white fw-bold">Update</a>
		                                <a href="${pageContext.request.contextPath }/JobUpdateController?id=${j.id}&method=DELETE" class="btn btn-danger fw-bold">Delete</a>
		                            </div>
		                        </div>
		                    </div>
		                </div>
            		</c:forEach>
            	</c:if>
            </div>
            

        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
  </body>
</html>