<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Job Portal Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
  </head>
  <body>
  
  	<!-- Post Employer Photo -->
      <div class="modal fade mt-5" id="editprofilepic">
        <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header">
                  <h1 class="text-center">Edit Company Photo</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
              <c:set var="emp" value="${sessionScope.currentEmployer }" scope="session" />
                  <form action="${pageContext.request.contextPath}/PhotoController" method="post" class="text-center" enctype="multipart/form-data">
                    <img src="${pageContext.request.contextPath}/images/employer_pics/${emp.logo}" class="img-thumbnail rounded-circle border p-2" style="width:250px;height: 250px">
                    <input type="file" name="photo" class="form-control my-3" required>
                    <button type="submit" class="btn btn-primary">Update Company Photo</button>
                  </form>
              </div>
          </div>
        </div>
      </div>
      
      <!-- Post Job Modal -->
      
       <div class="modal fade" id="createJob">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h1 class="modal-title">Post a Job</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <form action="${pageContext.request.contextPath}/JobsController" method="post" enctype="multipart/form-data">
                        <!-- Employer ID -->
                        <div class="mb-3">
                            <label class="form-label">Employer ID</label>
                            <input type="number" class="form-control" value="${emp.id}" name="employerId" disabled="disabled">
                        </div>

                        <!-- Job Title -->
                        <div class="mb-3">
                            <label class="form-label">Job Title</label>
                            <input type="text" class="form-control" name="job_title" required>
                        </div>

                        <!-- Description -->
                        <div class="mb-3">
                            <label class="form-label">Job Description</label>
                            <textarea class="form-control" name="description" rows="3"></textarea>
                        </div>

                        <!-- Skills Required -->
                        <div class="mb-3">
                            <label class="form-label">Skills Required</label>
                            <input type="text" class="form-control" name="skills_required">
                        </div>

                        <!-- Experience Required -->
                        <div class="mb-3">
                            <label class="form-label">Experience Required</label>
                            <input type="text" class="form-control" name="experience_required">
                        </div>

                        <!-- Location -->
                        <div class="mb-3">
                            <label class="form-label">Location</label>
                            <input type="text" class="form-control" name="location">
                        </div>

                        <!-- Salary Range -->
                        <div class="mb-3">
                            <label class="form-label">Salary Range</label>
                            <input type="text" class="form-control" name="salary_range">
                        </div>

                        <!-- Job Type -->
                        <div class="mb-3">
                            <label class="form-label">Job Type</label>
                            <select class="form-select" name="job_type">
                                <option value="">Select</option>
                                <option value="Full-Time">Full-Time</option>
                                <option value="Part-Time">Part-Time</option>
                                <option value="Internship">Internship</option>
                                <option value="Contract">Contract</option>
                            </select>
                        </div>

                        <!-- Expire Date -->
                        <div class="mb-3">
                            <label class="form-label">Expire Date</label>
                            <input type="date" class="form-control" name="expire_date">
                        </div>

                        <!-- Photo Upload -->
                        <div class="mb-3">
                            <label class="form-label">Upload Company Logo / Job Photo</label>
                            <input type="file" class="form-control" name="photo" accept="image/*">
                        </div>

                        <!-- Submit Button -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Post Job</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
      
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>