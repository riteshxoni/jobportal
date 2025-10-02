<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${not empty sessionScope.jobs }">
	<c:set var="job" value="${sessionScope.jobs[param.index] }" scope="session" />
	<div class="container p-4">
		<form action="${pageContext.request.contextPath}/JobUpdateController" method="post" enctype="multipart/form-data">
		    <input type="hidden" name="id" value="${job.id }">
		    <!-- Employer ID -->
		    <div class="mb-3">
		        <label class="form-label">Employer ID</label>
		        <input type="number" class="form-control" value="${emp.id}" name="employerId" disabled="disabled">
		    </div>
		
		    <!-- Job Title -->
		    <div class="mb-3">
		        <label class="form-label">Job Title</label>
		        <input type="text" class="form-control" value="${job.job_title }" name="job_title" required>
		    </div>
		
		    <!-- Description -->
		    <div class="mb-3">
		        <label class="form-label">Job Description</label>
		        <textarea class="form-control" name="description" rows="3">${job.description }</textarea>
		    </div>
		
		    <!-- Skills Required -->
		    <div class="mb-3">
		        <label class="form-label">Skills Required</label>
		        <input type="text" class="form-control" value="${job.skills_required }" name="skills_required">
		    </div>
		
		    <!-- Experience Required -->
		    <div class="mb-3">
		        <label class="form-label">Experience Required</label>
		        <input type="text" class="form-control" value="${job.experience_required }" name="experience_required">
		    </div>
		
		    <!-- Location -->
		    <div class="mb-3">
		        <label class="form-label">Location</label>
		        <input type="text" class="form-control" value="${job.location }" name="location">
		    </div>
		
		    <!-- Salary Range -->
		    <div class="mb-3">
		        <label class="form-label">Salary Range</label>
		        <input type="text" class="form-control" value="${job.salary_range }" name="salary_range">
		    </div>
		
		    <!-- Job Type -->
		    <div class="mb-3">
		        <label class="form-label">Job Type</label>
		        <select class="form-select" name="job_type">
		            <option value="${job.job_type }">${job.job_type }</option>
		            <option value="Full-Time">Full-Time</option>
		            <option value="Part-Time">Part-Time</option>
		            <option value="Internship">Internship</option>
		            <option value="Contract">Contract</option>
		        </select>
		    </div>
		
		    <!-- Expire Date -->
		    <div class="mb-3">
		        <label class="form-label">Expire Date</label>
		        <input type="date" class="form-control" value="${job.expire_date }" name="expire_date">
		    </div>
		
		    <!-- Photo Upload -->
		    <img  src="${pageContext.request.contextPath}/images/jobs_pics/${job.photo }" class="rounded-circle border-3" style="height: 250px;width: 250px">
		    <div class="mb-3">
		        <label class="form-label">Upload Company Logo / Job Photo</label>
		        <input type="file" class="form-control" name="photo" accept="image/*">
		    </div>
		
		    <!-- Submit Button -->
		    <div class="d-grid">
		        <button type="submit" class="btn btn-primary">Update Job</button>
		    </div>
		</form>
	</div>
</c:if>
