<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Experience Details</title>
</head>
<body>
	<%@ include file="../components/header.jsp" %>

	<br><br><br><br><br><br>
	<div class="container">
          <h1 class="my-2 display-4 text-center">Edit Experience Details</h1>
          <c:if test="${not empty sessionScope.experience and not empty param.index }">
          	<c:set var="expe" value="${sessionScope.experience[param.index] }" scope="session"/>
          		<form action="${pageContext.request.contextPath}/ExperienceController" method="post">
          			<input type="hidden" name="method" value="PUT">
          			<input type="hidden" name="index" value="${param.index }">
		            <table class="table table-borderless">
		              <tr>
		                <td><label class="form-label">Company :</label></td>
		                <td><input type="text" name="company" class="form-control mb-3" value="${expe.companyName }"></td>
		              </tr>
		              <tr>
		                <td><label class="form-label">Location :</label></td>
		                <td><input type="text" name="location" class="form-control mb-3" value="${expe.location }"></td>
		              </tr>
		              <tr>
		              <td><label class="form-label">Start Date :</label></td>
		                <td><input type="text" name="start_date" class="form-control mb-3" value="${expe.startDate }"></td>
		              </tr>
		               <tr>
		              <td><label class="form-label">End Date :</label></td>
		                <td><input type="text" name="end_date" class="form-control mb-3" value="${expe.endDate }"></td>
		              </tr>
		              <tr>
		                <td><label class="form-label">Job Title :</label></td>
		                <td><input type="text" name="job_title" class="form-control mb-3" value="${expe.jobTitle }"></td>
		              </tr>
		              <tr>
		                <td><label class="form-label">Skills Used :</label></td>
		                <td><input type="text" name="skills_used" class="form-control mb-3" value="${expe.skillsUsed }"></td>
		              </tr>
		              <tr>
		                <td><label class="form-label">Description :</label></td>
		                <td><input type="text" name="description" class="form-control mb-3" value="${expe.description }"></td>
		              </tr>
		              <tr>
		                <td></td>
		                <td>
		                	<input type="submit" class="btn btn-warning text-white fw-bold" value="Update Details" >
		                	<a href="${pageContext.request.contextPath}/ExperienceController?index=${param.index}&method=DELETE" class="btn btn-danger fw-bold">Delete</a>
		                </td>
		              </tr>
		            </table>
		         </form>
          </c:if>
          
          
   </div>
	
	
	<jsp:include page="/components/footer.jsp" />
</body>
</html>