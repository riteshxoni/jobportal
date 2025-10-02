<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp"/>
</c:if>
<div class="border-top mx-5 border p-3">
    <h3 class="fw-normal"><span class="h2 fw-bold border-bottom border-4 border-primary pe-2 pb-1">Projects</span><span class="fs-3 float-end"><a data-bs-toggle="modal" data-bs-target="#addProject"><i class="fa-solid fa-plus"></i></a></span></h3>
	<div class="row py-4">
		<c:if test="${not empty sessionScope.project }">
			<c:forEach var="pro" items="${sessionScope.project}" varStatus="loop">
		       	<div class="col-12 border p-4 mb-2">
		       		 <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-diagram-project"></i> Project Title : <span class="text-dark">${pro.projectTitle }</span><a href="./edit/editProject.jsp?index=${loop.index }" class="float-end fs-4"><i class="fa-solid fa-pencil"></i></a></div>
			         <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-user-tie"></i> Role : <span class="text-dark">${pro.role }</span></div>
		             <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-microchip"></i> Technologies : <span class="text-dark">${pro.technologies }</span></div>
			         <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-calendar"></i> Start Date : <span class="text-dark">${pro.startDate }</span> - End Date : <span class="text-dark">${pro.endDate }</span></div>
			         <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-link"></i> Project URL : <span class="text-dark">${pro.projectUrl }</span></div>
			         <div class="text-secondary fw-semibold mb-2"><i class="fa-brands fa-github"></i> GitHub URL : <span class="text-dark">${pro.githubUrl }</span></div>
			         <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-circle-info"></i> Description : <span class="text-dark">${pro.description }</span></div>
		       	</div>
	       	</c:forEach>
       	</c:if>
     </div>
</div>