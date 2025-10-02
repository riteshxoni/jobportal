<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Education Detail</title>
</head>
<body>
	<%@ include file="../components/header.jsp" %>
	 <br><br><br><br><br><br>
	<div class="container">
          <h1 class="my-2 display-4 text-center">Edit Education Details</h1>
          
          <c:if test="${not empty sessionScope.education and not empty param.index }">
          	<c:set var="edu" value="${sessionScope.education[param.index] }" scope="session" />
          	
          	<form action="${pageContext.request.contextPath}/EducationController" method="post">
          		<input type="hidden" name="index" value="${param.index}" >
          		<input type="hidden" name="method" value="PUT">
	            <table class="table table-borderless">
	              <tr>
	                <td><label class="form-label"> School / University :</label></td>
	                <td><input type="text" name="school" class="form-control mb-3" value="${edu.schoolUniversity }"></td>
	              </tr>
	              <tr>
	                <td><label class="form-label">Course / Degree :</label></td>
	                <td><input type="text" name="degree" class="form-control mb-3" value="${edu.courseDegree }"></td>
	              </tr>
	              <tr>
	              	<td><label class="form-label">Passing Year :</label></td>
	                <td><input type="text" name="passingyear" class="form-control mb-3" value="${edu.year }"></td>
	              </tr>
	              <tr>
	                <td><label class="form-label">Result :</label></td>
	                <td><input type="text" name="grade" class="form-control mb-3" value="${edu.result }"></td>
	              </tr>
	              <tr>
	                <td></td>
	                <td>
		                <input type="submit" class="btn btn-warning mb-3 me-3 fw-bold text-white" value="Update Details" >
		                <a href="${pageContext.request.contextPath}/EducationController?index=${param.index}&method=DELETE" class="btn btn-danger mb-3 me-3 fw-bold">Delete</a>
		            </td>
	              </tr>
	            </table>
	          </form>
          </c:if>
   </div>
    <jsp:include page="/components/footer.jsp" />
</body>
</html>