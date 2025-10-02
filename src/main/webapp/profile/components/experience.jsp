<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp"/>
</c:if>
<div class="border-top mx-5 border p-3">
    <h3 class="fw-normal"><span class="h2 fw-bold border-bottom border-4 border-primary pe-2 pb-1">Experience</span><span class="fs-3 float-end"><a data-bs-toggle="modal" data-bs-target="#addExperience"><i class="fa-solid fa-plus"></i></a></span></h3>
	<div class="row py-4">
		<c:if test="${not empty sessionScope.experience}">
			<c:forEach var="expe" items="${sessionScope.experience }" varStatus="loop" >
				<div class="col-12 border p-3 mb-2">
		       		 <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-building"></i> Company : <span class="text-dark">${expe.companyName }</span><a href="./edit/editExperience.jsp?index=${loop.index }" class="float-end fs-4"><i class="fa-solid fa-pencil"></i></a></div>
			         <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-location-dot"></i> Location : <span class="text-dark">${expe.location }</span></div>
			         <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-calendar"></i> From : <span class="text-dark">${expe.startDate }</span> To :<span class="text-dark">${expe.endDate }</span></div>
			         <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-computer"></i> Job Title : <span class="text-dark">${expe.jobTitle }</span></div>
		             <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-brain"></i> Skills Used : <span class="text-dark">${expe.skillsUsed }</span></div>
			         <div class="text-secondary fw-semibold mb-2"><i class="fa-solid fa-circle-info"></i> Description : <span class="text-dark">${expe.description}</span></div>
		       	</div>
			</c:forEach>
		</c:if>
       	
     </div>
</div>