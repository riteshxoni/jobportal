<%@page import="com.jobportal.service.JobsService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:if test="${empty sessionScope.currentEmployer }">
		<c:redirect url="/employer/login.jsp"/>
	</c:if>
	
<c:set var="title" value="${sessionScope.titles }" scope="session" />

  <div class="border-top mx-5 border p-3">
      <h3><span class="h2 fw-bold border-bottom border-4 border-primary pe-2 pb-1">Applied Jobs</span></h3>
      <div class="row py-4 border-bottom border-3">
      <c:if test="${not empty sessionScope.applications }">
      	<table class="table text-center">
      		<tr class="table-dark">
      			<th>JobId</th>
      			<th>Candidate Email</th>
      			<th>Job Title</th>
      			<th>Applied Date</th>
      			<th>Resume / CV</th>
      			<th>Status</th>
      		</tr>
      		
		      <c:forEach var="application" items="${sessionScope.applications}"  varStatus="loop">
			         <tr>
		      			<td>${application.jobId }</td>
		      			<td>${application.email }</td>
		      			<td>${title[application.jobId] }</td>
		      			<td>${application.appliedAt }</td>
		      			<td><a href="">${application.candidateCV}</a></td>
		      			<td>
			      			<form action="${pageContext.request.contextPath }/ApplicationController" method="get">
			      				<input type="hidden" name="id" value="${application.jobId}">
		      					<select name="status" class="form-select">
		      						<option value="${application.status }">${application.status }</option>
		      						<option value="Applied">Applied</option>
		      						<option value="Shortlisted">Shortlisted</option>
		      						<option value="Interview">Interview</option>
		      						<option value="Hired">Hired</option>
		      						<option value="Rejected">Rejected</option>
		      					</select>
		      					<button type="submit" class="btn btn-warning my-3 text-white">Update Status</button>
		      				</form>
		      			</td>
		      		</tr>  	
		      </c:forEach>
	    </table>
      </c:if>
      </div>
  </div>