 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp"/>
</c:if>
 <!-- Skills Section -->
<div class="border-top mx-5 border p-3">
	<div class="my-3">
	    <h3 class="fw-normal"><span class="h2 fw-bold border-bottom border-4 border-primary pe-2 pb-1">Skills</span><span class="fs-3 float-end"><a data-bs-toggle="modal" data-bs-target="#addSkills"><i class="fa-solid fa-plus"></i></a></span></h3>
	</div>
	<ul class="list-group list-group-flush">
		<c:if test="${not empty sessionScope.skills }">
			<c:forEach var="skill" items="${sessionScope.skills}" varStatus="loop">
				<li class="my-1 fw-bold shadow-lg list-group-item list-group-item-action ">${skill.skill } / ${skill.proficiency } <a href="${pageContext.request.contextPath}/SkillsController?index=${loop.index}&method=DELETE" class="float-end fs-4"><button class="btn btn-danger btn-sm">Delete</button></a></li>
			</c:forEach>
		</c:if>
	</ul>
</div>