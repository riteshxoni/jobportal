  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp"/>
</c:if>
  <div class="border-top mx-5 border p-3">
      <h3><span class="h2 fw-bold border-bottom border-4 border-primary pe-2 pb-1">Education</span><span class="fs-3 float-end"><a data-bs-toggle="modal" data-bs-target="#addEducation"><i class="fa-solid fa-plus"></i></a></span></h3>
      <div class="row py-4 border-bottom border-3">
      <c:if test="${not empty sessionScope.education }">
	      <c:forEach var="education" items="${sessionScope.education}"  varStatus="loop">
		      <div class="col-12 border p-3 m-1">
	           <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-school"></i> School / University : <span class="text-dark">${education.schoolUniversity }</span><a href="./edit/editEducation.jsp?index=${loop.index}" class="float-end fs-4"><i class="fa-solid fa-pencil"></i></a></div>
	           <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-graduation-cap"></i> Course / Degree : <span class="text-dark">${education.courseDegree }</span></div>
	           <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-calendar"></i> Passing Year : <span class="text-dark">${education.year }</span></div>
	           <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-user-graduate"></i> Result : <span class="text-dark">${education.result }</span></div>
	         </div>
	      </c:forEach>
      </c:if>
      </div>
  </div>