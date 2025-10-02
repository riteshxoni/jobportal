<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${not empty sessionScope.currentEmployer }">
	<c:redirect url="/employer/profile.jsp" />
</c:if>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Employer SignUp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" >
  </head>
  <body>
  <c:import url="/employer/components/header.jsp"/>
  <br><br><br><br>
    <div class="container mb-5">
        <div class="row justify-content-center">
            <h1 class="text-center display-3 fw-bold my-4 text-primary">Employer SignUp</h1>
            <div class="col-11 col-md-6 border p-4 rounded-3 shadow-lg">
                <form action="${pageContext.request.contextPath}/EmployerController" method="post">
                	<c:if test="${not empty sessionScope.result }">
                		<div class="alert alert-success my-3">Employer added Successfully.</div>
                		<c:remove var="result" scope="session"/>
                	</c:if>
                    <label class="form-label fw-medium">Company Name : </label>
                    <input type="text" name="company_name"  class="form-control mb-3" placeholder="eg: Amazon" required>
                    <label class="form-label fw-medium">Email : </label>
                    <input type="email" name="email"  class="form-control mb-3" placeholder="eg: Amazon@gmail.com" required>
                    <label class="form-label fw-medium">Password : </label>
                    <input type="password" name="password"  class="form-control mb-3" required>
                    <label class="form-label fw-medium">Industry Type : </label>
                    <input type="text" name="industry_type"  class="form-control mb-3" placeholder="eg: IT" required>
                    <label class="form-label fw-medium">Location : </label>
                    <input type="text" name="location"  class="form-control mb-3" placeholder="eg: Banglore" required>
                    <label class="form-label fw-medium">Website : </label>
                    <input type="text" name="website"  class="form-control mb-3" placeholder="eg: Amazon.com" required>
                    <div class="text-center my-4">
                        <button type="submit" class="btn btn-primary w-50">SignUp</button>
                    </div>
                </form>
                <div class="text-center">
                	<p>Already have an account?</p>
                	<a href="./login.jsp" class="btn btn-success">Login In</a>
                </div>
            </div>
        </div>
    </div>
    <c:import url="/components/footer.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
  </body>
</html>