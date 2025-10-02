  <%@page import="com.jobportal.service.JobsService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
  <c:if test="${empty sessionScope.currentUser }">
		<c:redirect url="/view/login.jsp"/>
	</c:if>

<c:set var="cNames" value="${sessionScope.c_names }" scope="session" />
<c:set var="title" value="${sessionScope.titles }" scope="session" />

  <div class="border-top mx-5 border p-3">
      <h3><span class="h2 fw-bold border-bottom border-4 border-primary pe-2 pb-1">Applied Jobs</span></h3>
      <div class="row py-4 border-bottom border-3">
      <c:if test="${not empty sessionScope.applied }">
      	<table class="table text-center">
      		<tr class="table-dark">
      			<th>JobId</th>
      			<th>Company Name</th>
      			<th>Job Title</th>
      			<th>Status</th>
      			<th>Applied Date</th>
      			<th>Resume / CV</th>
      		</tr>
      		
		      <c:forEach var="application" items="${sessionScope.applied}"  varStatus="loop">
			         <tr>
		      			<td>${application.jobId }</td>
		      			<td>${cNames[application.employerId] }</td>
		      			<td>${title[application.jobId] }</td>
		      			<td>${application.status }</td>
		      			<td>${application.appliedAt }</td>
		      			<td>${application.candidateCV}</td>
		      		</tr>  	
		      </c:forEach>
	    </table>
      </c:if>
      </div>
  </div>