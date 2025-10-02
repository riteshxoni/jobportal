<%@page import="com.jobportal.model.Job"%>
<%@page import="com.jobportal.service.JobsService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp" />
</c:if>

<jsp:scriptlet>
	JobsService service = new JobsService();
	session.setAttribute("Job", service.getJob(Integer.parseInt(request.getParameter("id"))));
</jsp:scriptlet>
<c:if test="${empty sessionScope.Job }">
	<c:redirect url="/view/login.jsp" />
</c:if>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Job Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" >
  </head>
  <body>
  <c:import url="/profile/components/header.jsp" />
  <br><br><br><br><br><br>
  <c:set var="cNames" value="${sessionScope.c_names }" scope="session"/>
  <c:set var="user" value="${sessionScope.currentUser }" scope="session" />
  <c:set var="j" value="${sessionScope.Job }" scope="session" />
    <div class="container my-3">
        <h1 class="my-3">Job Details</h1>
        <div class="list-group">
            <div class="list-group-item mb-2"><span class="fw-bold">Company :     </span><span>${cNames[j.employeeId] }</span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Job Title :   </span><span>${j.job_title }</span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Skills :      </span><span>${j.skills_required }</span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Job Type :    </span><span>${j.job_type }</span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Experience :  </span><span>${j.experience_required } Years</span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Location :    </span><span>${j.location }</span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Salary :      </span><span>${j.salary_range } LPA</span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Expire Date : </span><span>${j.expire_date }</span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Description : </span><span>${j.description }</span></div>
        </div>
        <h1 class="my-3">Candidate Details</h1>
        <div class="list-group">
            <div class="list-group-item mb-2"><span class="fw-bold">Full Name      :</span><span>${user.name}</span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Father`s Name  :</span><span>${user.fatherName }    </span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Mother`s Name  :</span><span>${user.motherName }    </span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Gender         :</span><span>${user.gender }        </span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">DOB            :</span><span>${user.dob }           </span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Email          :</span><span>${user.email}          </span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Phone          :</span><span>${user.phone }         </span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Nationality    :</span><span>${user.nationality }   </span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Marital Status :</span><span>${user.maritalStatus } </span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">City           :</span><span>${user.city }          </span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Language       :</span><span>${user.language }      </span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Title          :</span><span>${user.title }         </span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Fields         :</span><span>${user.fields }        </span></div>
            <div class="list-group-item mb-2"><span class="fw-bold">Objective      :</span><span>${user.heading }       </span></div>
        </div>
        <h1 class="my-3">Applying </h1>
        <form action="${pageContext.request.contextPath }/ApplicationController" method="post" class="border p-3">

            <label class="form-label">Candidate Id:</label><input type="text" name="user_id" value="${user.id}" readonly="readonly" class="form-control my-3">
            <label class="form-label">Candidate CV:</label><input type="text" name="resume" value="${user.resume}" readonly="readonly" class="form-control my-3">

            <label class="form-label">Job Id :</label><input type="text" name="job_id" value="${j.id }" readonly="readonly" class="form-control my-3">
            <label class="form-label">Company Id:</label><input type="text" name="emp_id" value="${j.employeeId}" readonly="readonly" class="form-control my-3">
              
            <div class="text-center">
              <button type="submit" class="btn btn-secondary my-3 w-50">Apply</button>
            </div>
        </form>
    </div>


    <%@ include file="/components/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
  </body>
</html>