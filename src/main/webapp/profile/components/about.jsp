  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  	<c:if test="${empty sessionScope.currentUser }">
		<c:redirect url="/view/login.jsp"/>
	</c:if>
	<c:set var="user" value="${sessionScope.currentUser}" scope="session" />
  <div class="row p-3 border mx-5 mt-5 shadow-lg align-items-center">
    <div class="col-12 p-5 p-sm-0 p-lg-5 text-center">
      <div>
          <img src="${pageContext.request.contextPath }/images/profile_pics/${user.photo}" class="rounded-circle border border-5 shadow-lg border-white" height="200" width="200">
      </div>
      <button class="btn btn-secondary mt-3  align-items-center" data-bs-toggle="modal" data-bs-target="#editprofilepic">
        <i class="fa-solid fa-pencil me-1"></i> Upload
      </button>
    </div>
    <div class="col-12 mt-3">
      <h2>${user.name}<span class="fs-3 float-end"><a href="./edit/editAbout.jsp"><i class="fa-solid fa-pencil"></i></a></span></h2>
      <table class="table">
        <tr><td class="text-secondary">Father`s Name    </td><td class="fw-bold">${user.fatherName }</td></tr>
        <tr><td class="text-secondary">Mother`s Name    </td><td class="fw-bold">${user.motherName }</td></tr>
        <tr><td class="text-secondary">Gender           </td><td class="fw-bold">${user.gender }</td></tr>
        <tr><td class="text-secondary">DOB           </td><td class="fw-bold">${user.dob }</td></tr>
        <tr><td class="text-secondary">Email            </td><td class="fw-bold">${user.email}</td></tr>
        <tr><td class="text-secondary">Phone            </td><td class="fw-bold">${user.phone }</td></tr>
        <tr><td class="text-secondary">Nationality      </td><td class="fw-bold">${user.nationality }</td></tr>
        <tr><td class="text-secondary">Marital Status   </td><td class="fw-bold">${user.maritalStatus }</td></tr>
        <tr><td class="text-secondary">City             </td><td class="fw-bold">${user.city }</td></tr>
        <tr><td class="text-secondary">Language         </td><td class="fw-bold">${user.language }</td></tr>
        <tr><td class="text-secondary">Title            </td><td class="fw-bold">${user.title }</td></tr>
        <tr><td class="text-secondary">Fields           </td><td class="fw-bold">${user.fields }</td></tr>
        <tr><td class="text-secondary">Objective        </td><td class="fw-bold">${user.heading }</td></tr>
      </table>
    </div>
  </div>