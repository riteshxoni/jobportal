<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Project Details</title>
</head>
<body>

	<%@ include file="../components/header.jsp" %>
	
	<br><br><br><br><br><br>
	<div class="container">
          <h1 class="my-2 display-4 text-center">Edit Project Details</h1>
          <c:if test="${not empty sessionScope.project }">
          	<c:set var="pro" value="${sessionScope.project[param.index] }" scope="session" />
	          	<form action="${pageContext.request.contextPath}/ProjectController" method="post">
		          	<input type="hidden" name="method" value="PUT">
		          	<input type="hidden" name="index" value="${param.index }">
		            <table class="table table-borderless">
		              <tr>
		                <td><label class="form-label">Project Title :</label></td>
		                <td><input type="text" name="project_title" class="form-control mb-3" value="${pro.projectTitle }"></td>
		              </tr>
		              <tr>
		                <td><label class="form-label">Role :</label></td>
		                <td><input type="text" name="role" class="form-control mb-3" value="${pro.role }"></td>
		              </tr>
		               <tr>
		                <td><label class="form-label">Technologies  :</label></td>
		                <td><input type="text" name="technologies" class="form-control mb-3" value="${pro.technologies }"></td>
		              </tr>
		              <tr>
		              <td><label class="form-label">Start Date :</label></td>
		                <td><input type="text" name="start_date" class="form-control mb-3" value="${pro.startDate }"></td>
		              </tr>
		               <tr>
		              <td><label class="form-label">End Date :</label></td>
		                <td><input type="text" name="end_date" class="form-control mb-3" value="${pro.endDate }"></td>
		              </tr>
		              <tr>
		                <td><label class="form-label">Project URL :</label></td>
		                <td><input type="text" name="project_url" class="form-control mb-3" value="${pro.projectUrl }"></td>
		              </tr>
		               <tr>
		                <td><label class="form-label">GitHub URL :</label></td>
		                <td><input type="text" name="github_url" class="form-control mb-3" value="${pro.githubUrl }"></td>
		              </tr>
		              <tr>
		                <td><label class="form-label">Description :</label></td>
		                <td><input type="text" name="description" class="form-control mb-3" value="${pro.description }"></td>
		              </tr>
		              <tr>
		                <td></td>
		                <td>
		                	<input type="submit" class="btn btn-warning text-white fw-bold" value="Update" >
		                	<a class="btn btn-danger fw-bold" href="${pageContext.request.contextPath}/ProjectController?index=${param.index}&method=DELETE">Delete</a>
		                	
		                </td>
		              </tr>
		            </table>
		          </form>
          </c:if> 
   </div>
	<jsp:include page="/components/footer.jsp" />
</body>
</html>